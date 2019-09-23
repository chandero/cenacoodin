unit UnitCajaDiario;

interface

uses
  Windows, Messages, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pr_Common, pr_TxClasses, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, Mask, ExtCtrls, DBClient, UnitDmGeneral;

type
  TfrmCajaDiario = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    CBMeses: TComboBox;
    EdAno: TMaskEdit;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQPuc: TIBQuery;
    IBQAuxiliar: TIBQuery;
    IBQTemp: TClientDataSet;
    IBQTempCODIGO: TStringField;
    IBQTempDIA: TIntegerField;
    IBQTempMES: TIntegerField;
    IBQTempDEBITO: TCurrencyField;
    IBQTempCREDITO: TCurrencyField;
    IBQTempNOMBRE: TStringField;
    Reporte: TprTxReport;
    CmdReporte: TBitBtn;
    CmdArchivo: TBitBtn;
    SDArchivo: TSaveDialog;
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdReporteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdArchivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCajaDiario: TfrmCajaDiario;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses UnitGlobales, UnitPantallaProgreso;

procedure TfrmCajaDiario.CmdAceptarClick(Sender: TObject);
var Total:Integer;
    frmProgreso: TfrmProgreso;
    Codigo:string;
begin

        CmdAceptar.Enabled := False;
        Application.ProcessMessages;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        with IBQAuxiliar do begin
         Close;
         SQL.Clear;
         SQL.Add('select COUNT(*) AS TOTAL from CON$AUXILIAR where');
         SQL.Add('((ESTADOAUX = :ESTADO) and (FECHA BETWEEN :FECHA1 and :FECHA2))');
         ParamByName('ESTADO').AsString := 'C';
         ParamByName('FECHA1').AsDate := EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,01);
         ParamByName('FECHA2').AsDate := EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,DaysInMonth(EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,01)));
         try
          Open;
          Total := FieldByName('TOTAL').AsInteger;
         except
          Transaction.Rollback;
         end;

         Close;
         SQL.Clear;
         SQL.Add('select * from CON$AUXILIAR where');
         SQL.Add('((ESTADOAUX = :ESTADO) and (FECHA BETWEEN :FECHA1 and :FECHA2))');
         SQL.Add('Order by FECHA,ID_AGENCIA,CODIGO');
         ParamByName('ESTADO').AsString := 'C';
         ParamByName('FECHA1').AsDate := EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,01);
         ParamByName('FECHA2').AsDate := EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,DaysInMonth(EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,01)));
         try
          Open;
         except
          Transaction.Rollback;
          raise;
         end;

         frmProgreso := TfrmProgreso.Create(Self);
         frmProgreso.Caption := 'Procesando Caja Diario';
         frmProgreso.Min := 0;
         frmProgreso.Max := Total;
         frmProgreso.Position := 0;
         frmProgreso.Ejecutar;

         while not Eof do begin
           frmProgreso.Position := RecNo;
           frmProgreso.InfoLabel := 'Procesando: ' + FieldByName('CODIGO').AsString + ' ' + FieldByName('FECHA').AsString;
           Application.ProcessMessages;
           IBQTemp.Open;
           if not IBQTemp.FindKey([MonthOf(FieldByName('FECHA').AsDateTime),DayOf(FieldByName('FECHA').AsDateTime),LeftStr(FieldByName('CODIGO').AsString,4)]) then
//           if not IBQTemp.Locate('MES;DIA;CODIGO',VarArrayOf([MonthOf(FieldByName('FECHA').AsDateTime),DayOf(FieldByName('FECHA').AsDateTime),LeftStr(FieldByName('CODIGO').AsString,4)]),[loCaseInsensitive]) then
           begin
              IBQTemp.Insert;
              IBQTemp.FieldByName('CODIGO').AsString := LeftStr(FieldByName('CODIGO').AsString,4);
              IBQPuc.Close;
              IBQPuc.SQL.Clear;
              IBQPuc.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
              Codigo := '00000000000000';
              Codigo := LeftStr(FieldByName('CODIGO').AsString,4) + Codigo;
              IBQPuc.ParamByName('CODIGO').AsString := Codigo;
              try
                IBQPuc.Open;
              except
                IBQPuc.Transaction.Rollback;
                frmProgreso.Cerrar;
                raise;
              end;
              IBQTemp.FieldByName('NOMBRE').AsString := IBQPuc.FieldByName('NOMBRE').AsString;
              IBQTemp.FieldByName('DIA').AsInteger := DayOf(FieldByName('FECHA').AsDateTime);
              IBQTemp.FieldByName('MES').AsInteger := MonthOf(FieldByName('FECHA').AsDateTime);
              IBQTemp.FieldByName('DEBITO').AsCurrency := 0;
              IBQTemp.FieldByName('CREDITO').AsCurrency := 0;
              IBQTemp.Post;
           end;
           IBQTemp.Edit;
           IBQTemp.FieldByName('DEBITO').AsCurrency := IBQTemp.FieldByName('DEBITO').AsCurrency + FieldByName('DEBITO').AsCurrency;
           IBQTemp.FieldByName('CREDITO').AsCurrency := IBQTemp.FieldByName('CREDITO').AsCurrency + FieldByName('CREDITO').AsCurrency;
           IBQTemp.Post;
           IBQTemp.First;
           IBQTemp.Close;
           Next;
         end;
         frmProgreso.Cerrar;

       end;
       CmdReporte.Enabled := True;
       CmdArchivo.Enabled := True;

end;

procedure TfrmCajaDiario.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCajaDiario.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCajaDiario.CmdReporteClick(Sender: TObject);
begin
       Empleado;
       Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
       Reporte.Variables.ByName['NIT'].AsString := Nit;
       Reporte.Variables.ByName['MES'].AsString := CBMeses.Text;
       Reporte.Variables.ByName['ANOCORTE'].AsString  := EdAno.Text;
       Reporte.Variables.ByName['AGENCIA'].AsString := Ciudad;
       Reporte.Variables.ByName['EMPLEADO'].AsString := Nombres + Apellidos;

       if Reporte.PrepareReport then
          Reporte.PreviewPreparedReport(True);

end;

procedure TfrmCajaDiario.FormShow(Sender: TObject);
begin
        EdAno.Text := IntToStr(DBAnho);
        CmdReporte.Enabled := False;
        CmdArchivo.Enabled := False;
end;

procedure TfrmCajaDiario.CmdArchivoClick(Sender: TObject);
var F:TextFile;
    Linea:string;
begin
        if SDArchivo.Execute then
          AssignFile(F,SDArchivo.FileName)
        else
        begin
          MessageDlg('Debe Seleccionar un Archivo',mtError,[mbcancel],0);
          Exit;
        end;

        with IBQTemp do begin
          Open;
          First;
          Rewrite(F);
          CloseFile(F);
          while not Eof do begin
            Linea := FieldByName('CODIGO').AsString+';'+
                     IntToStr(FieldByName('DIA').AsInteger)+';'+
                     IntToStr(CBMeses.ItemIndex+1)+';'+
                     Format('%2.2f',[FieldByName('DEBITO').AsCurrency])+';'+
                     Format('%2.2f',[FieldByName('CREDITO').AsCurrency]);
            System.Append(F);
            Writeln(F,Linea);
            CloseFile(F);
            Next;
          end;
          Close;
        end;
        ShowMessage('Proceso Culminado con Exito!');

end;

procedure TfrmCajaDiario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

procedure TfrmCajaDiario.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBQPuc.Database := dmGeneral.IBDatabase1;
        IBQAuxiliar.Database := dmGeneral.IBDatabase1;
        IBQPuc.Transaction := dmGeneral.IBTransaction1;
        IBQAuxiliar.Transaction := dmGeneral.IBTransaction1;
end;

end.
