unit UnitCancelacionCdats;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBClient, DB, IBCustomDataSet,
  IBQuery, Grids, Clipbrd, JvEdit, JvTypedEdit, IBDatabase;

type
  TfrmCancelacionCdats = class(TForm)
    Label1: TLabel;
    CBMeses: TComboBox;
    Panel1: TPanel;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    Label2: TLabel;
    lblestado: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Grid: TStringGrid;
    IBQuery2: TIBQuery;
    BitBtn1: TBitBtn;
    Label8: TLabel;
    EdAno: TJvYearEdit;
    Transaction: TIBTransaction;
    Database: TIBDatabase;
    IBAgencia: TIBQuery;
    procedure CmdProcesarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
  private
    procedure Cdat;
    { Private declarations }
  public
    { Public declarations }
  end;

type PCdat=^ACdat;
     ACdat=Record
     Mes:Integer;
     Saldo:Currency;
end;

var
  frmCancelacionCdats: TfrmCancelacionCdats;
  Archivo:TextFile;
  FechaCorte:TDate;
  Dia:Integer;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmCancelacionCdats.CmdProcesarClick(Sender: TObject);
var
NRuta:string;
begin
    CmdProcesar.Enabled := False;
    Application.ProcessMessages;
    NRuta := DBPath1;

    Dia := DaysInAMonth(YearOf(Date),CBMeses.ItemIndex + 1);
    if Dia > 30 then Dia := 30;
    FechaCorte := EncodeDate(EdAno.Value,CBMeses.ItemIndex + 1,Dia);


   IBAgencia.Close;
   IBAgencia.Open;
   IBAgencia.Last;
   IBAgencia.First;

   if TipoProceso = 1 then
    begin
      IBQuery1.Database := dmGeneral.IBDatabase1;
      IBQuery1.Transaction := dmGeneral.IBTransaction1;

      IBQuery2.Database := dmGeneral.IBDatabase1;
      IBQuery2.Transaction := dmGeneral.IBTransaction1;

      lblEstado.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';

      Cdat;
      IBAgencia.Close;
    end
   else
    begin
      while not IBAgencia.Eof do
       begin
         NRuta := dbpath1 + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + FormatCurr('00',MonthOf(FechaCorte)) + FormatCurr('0000',YearOf(FechaCorte)) + '/';
         lblEstado.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';
         Database.DataBaseName := DBserver1 + ':' + NRuta + DBname;
         Database.Params.Values['lc_ctype'] := 'ISO8859_1';
         Database.Params.Values['User_Name'] := 'SYSDBA';
         Database.Params.Values['PassWord'] := 'masterkey';
         Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
         try
           Database.Connected := True;
         except
           raise;
         end;

         Cdat;
         IBAgencia.Next;
       end;  // fin while Agencias
    end;  //Fin if TipoProceso

   LblEstado.Caption := 'Proceso Culminado con Exito!';

end;

procedure TfrmCancelacionCdats.Cdat;
var i,Total:Integer;
    FechaE,FechaF,FechaV:TDate;
    Saldo: array[1..12] of Currency;
    Omitir:Boolean;
    AR : PCdat;
    Cadena:string;
begin
    Cadena := IntToStr(YearOf(FechaCorte)) + IntToStr(MonthOf(FechaCorte)) + IntToStr(DayOf(FechaCorte));
    AssignFile(Archivo,'C:/PlanosFinMes/CANCCDAT' + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + Cadena + '.TXT');

    Rewrite(Archivo);
    Cadena := 'MES' + #9 + 'SALDO';
    Writeln(Archivo,Cadena);

    FechaE := EncodeDate(EdAno.Value,CBMeses.ItemIndex + 1, DaysInAMonth(EdAno.Value,CBMeses.ItemIndex + 1));
        with IBQuery1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from "cap$causacioncdat" where ANO = :ANO and MES = :MES');
           SQL.Add('order by ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA');
           ParamByName('ANO').AsInteger := EdAno.Value;
           ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
           try
            Open;
            Last;
            First;
            Total:= RecordCount;
            Label7.Caption := Format('%.5d',[total]);
           except
            Transaction.Rollback;
            raise;
           end;

           for i := 1 to 12 do begin
            First;
            Saldo[i] := 0;
            while not Eof do begin
               Label5.Caption := Format('%.5d',[RecNo]);
               Application.ProcessMessages;
               IBQuery2.Close;
               IBQuery2.SQL.Clear;
               IBQuery2.SQL.Add('select * from "gen$cedulasvip" where ID_IDENTIFICACION = :ID and ID_PERSONA = :PR');
               IBQuery2.ParamByName('ID').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
               IBQuery2.ParamByName('PR').AsString := FieldByName('ID_PERSONA').AsString;
               try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                   omitir := True
                else
                   omitir := False;
               except
                 Transaction.Rollback;
                 raise;
               end;
               if FieldByName('FECHA_PRORROGA').AsFloat <> 0 then
                   FechaV := FieldByName('FECHA_PRORROGA').AsDateTime + FieldByName('PLAZO_CUENTA').AsInteger
               else
                   FechaV := FieldByName('FECHA_APERTURA').AsDateTime + FieldByName('PLAZO_CUENTA').AsInteger;

               if (FechaV < FechaE) and (Omitir = False) then begin
                  Next;
                  Continue;
               end;

               Saldo[i] := Saldo[i] + FieldByName('VALOR_INICIAL').AsCurrency;
               Next;
            end;
            Grid.Cells[0,i] := IntToStr(i);
            Grid.Cells[1,i] := FormatCurr('#,#0',Saldo[i]);
            New(AR);
            AR^.Mes := i;
            AR^.Saldo := Saldo[i];
            Cadena := IntToStr(AR^.Mes) + #9 + FormatCurr('0.00',AR^.Saldo);
            Dispose(AR);
            Writeln(Archivo,cadena);

            FechaE := IncMonth(FechaE,1);
            FechaE := EncodeDate(YearOf(FechaE),MonthOf(FechaE),DaysInAMonth(YearOf(FechaE),MonthOf(FechaE)));
           end;
        end;
        CloseFile(Archivo);
    Database.Close;
end;

procedure TfrmCancelacionCdats.BitBtn1Click(Sender: TObject);
var
  f, c: integer;
  s: string;
begin
  s := '';
  with Grid do
    for f := Selection.Top to Selection.Bottom do begin
      for c := Selection.Left to Selection.Right do begin
        s := s + Cells[c, f];
        if c <> Selection.Right then
          s := s + #9;
      end;
      s := s + #13#10;
    end;
  if s <> '' then begin
    Clipboard.AsText := s;
    ShowMessage('La selección ha sido copiada al Portapapeles');
  end;
end;

procedure TfrmCancelacionCdats.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

end.
