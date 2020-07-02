unit UnitActualizarArqueo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IBSQL, JvEdit, JvTypedEdit, ComCtrls,
  Buttons;

type 
    TDenominacion = Record
    IdDenominacion:Integer;
    vDenominacion:Currency;
    Denominacion: TLabel;
    Cantidad:TJvIntegerEdit;
    Total:TStaticText;
    Existencia:Integer;
end;

type
  TfrmActualizarArqueo = class(TForm)
    Panel1: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SBDenominacion: TScrollBox;
    Panel2: TPanel;
    IBOtros: TIBSQL;
    EdFecha: TDateTimePicker;
    EdCaja: TJvIntegerEdit;
    CmdLeer: TBitBtn;
    CmdActualizar: TBitBtn;
    CmdCerrar: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdMonedas: TJvCurrencyEdit;
    EdTotalBilletes: TStaticText;
    IBSelect: TIBSQL;
    IBUpdate: TIBSQL;
    IBInsert: TIBSQL;
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdLeerClick(Sender: TObject);
    procedure CmdActualizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdMonedasChange(Sender: TObject);
  private
    { Private declarations }
    LDenominacion:array of TDenominacion;
    function RecuperarArqueo:Boolean;
    procedure ValorDenominacion(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmActualizarArqueo: TfrmActualizarArqueo;
  Total:Currency;
implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmActualizarArqueo.FormShow(Sender: TObject);
var I:Integer;
    ARecord:TDenominacion;
begin
        if dmGeneral.IBTransaction1.InTransaction then
        begin
          dmGeneral.IBTransaction1.Commit;
          dmGeneral.IBTransaction1.StartTransaction;
        end;

        Total := 0;
        
        with IBOtros do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$denominaciones" where ACTIVO <> 0 and MONEDAS = 0 order by VALOR ASC');
          try
            ExecQuery;
            while not Eof do
            begin
               I := Length(LDenominacion)+1;
               SetLength(LDenominacion,I);
               ARecord.IdDenominacion := FieldByName('ID_DENOMINACION').AsInteger;
               ARecord.vDenominacion := FieldByName('VALOR').AsCurrency;
               ARecord.Denominacion := TLabel.Create(Self);
               ARecord.Denominacion.Name := 'LbDenomCap'+IntToStr(I);
               ARecord.Denominacion.Caption := Trim(FormatCurr('#,0',FieldByName('VALOR').AsCurrency));
               ARecord.Denominacion.Parent := SBDenominacion;
               ARecord.Denominacion.Left := 5;
               ARecord.Denominacion.Top := 1 + (20 * (I - 1));
               ARecord.Denominacion.Alignment := taRightJustify;
               ARecord.Denominacion.Width := 60;
               ARecord.Denominacion.Font.Style := [fsBold];
               ARecord.Cantidad := TJvIntegerEdit.Create(Self);
               ARecord.Cantidad.Name := 'EdCantidadCap'+IntToStr(I);
               ARecord.Cantidad.OnExit := ValorDenominacion;
               ARecord.Cantidad.Value := 0;
               ARecord.Cantidad.Tag := I-1;
               ARecord.Cantidad.Alignment := taRightJustify;
               ARecord.Cantidad.Parent:= SBDenominacion;
               ARecord.Cantidad.Left := 85;
               ARecord.Cantidad.Top := 1 + (20*(I-1));
               ARecord.Cantidad.Width := 90;
               ARecord.Cantidad.Visible := True;
               ARecord.Cantidad.Font.Style := [fsBold];
               ARecord.Total := TStaticText.Create(self);
               ARecord.Total.Name := 'EdTotalCap'+IntToStr(I);
               ARecord.Total.Caption := '';
               ARecord.Total.Parent := SBDenominacion;
               ARecord.Total.Left := 200;
               ARecord.Total.Top := 1+(20*(I-1));
               ARecord.Total.AutoSize := False;
               ARecord.Total.Width := 126;
               ARecord.Total.Height := 19;
               ARecord.Total.Alignment :=  taRightJustify;
               ARecord.Total.Color := clCaptionText;
               ARecord.Total.BevelInner := bvLowered;
               ARecord.Total.BevelKind := bkSoft;
               ARecord.Total.BevelOuter := bvLowered;
               ARecord.Total.Font.Style := [fsBold];
               LDenominacion[I-1] := ARecord;
               Next;
            end;
          except
          end;
        end;

        EdFecha.Date := Date;
end;


procedure TfrmActualizarArqueo.ValorDenominacion(Sender: TObject);
var Valor:Currency;
    Pos:Integer;
    I:Integer;
begin
       Pos := TJvIntegerEdit(Sender).Tag;
       Valor := LDenominacion[Pos].vDenominacion * TJvIntegerEdit(Sender).Value;
       LDenominacion[Pos].Total.Caption := FormatCurr('#,0.00',Valor);
       Total := 0;
       for I := 0 to Length(LDenominacion) - 1 do
       begin
           Valor := LDenominacion[I].vDenominacion * LDenominacion[I].Cantidad.Value;
           Total := Total + Valor;
       end;
       Total := Total + EdMonedas.Value;
       EdTotalBilletes.Caption := FormatCurr('$#,0.00',Total);

end;

function TfrmActualizarArqueo.RecuperarArqueo:Boolean;
var I:Integer;
begin

      Total := 0;

      with IBOtros do
      begin
         Close;
         SQL.Clear;
         SQL.Add('select CANTIDAD_DENOMINACION from "caj$arqueos" ');
         SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_CAJA = :ID_CAJA and FECHA_MOV = :FECHA_MOV and ID_DENOMINACION = :ID_DENOMINACION');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
         ParamByName('FECHA_MOV').AsDate := EdFecha.Date;
       for I := 0 to Length(LDenominacion) - 1 do
       begin
                Close;
                ParamByName('ID_DENOMINACION').AsInteger := LDenominacion[I].IdDenominacion;
                try
                  ExecQuery;
                  if RecordCount  < 1 then
                  begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('No se pudo leer del arqueo',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                  end;
                except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('No se pudo leer del arqueo',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                end;

                LDenominacion[I].Existencia := FieldByName('CANTIDAD_DENOMINACION').AsInteger;
                LDenominacion[I].Cantidad.Value := FieldByName('CANTIDAD_DENOMINACION').AsInteger;
                LDenominacion[I].Total.Caption := FormatCurr('#,0',LDenominacion[I].Cantidad.Value  * LDenominacion[I].vDenominacion);
                Total := Total + LDenominacion[I].Cantidad.Value * LDenominacion[I].vDenominacion;
       end;
      end;

      with IBOtros do
      begin
         Close;
         SQL.Clear;
         SQL.Add('select VALOR_DENOMINACION from "caj$arqueos" ');
         SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_CAJA = :ID_CAJA and FECHA_MOV = :FECHA_MOV and ID_DENOMINACION = 0');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
         ParamByName('FECHA_MOV').AsDate := EdFecha.Date;
         try
            ExecQuery;
            if RecordCount < 1 then
              EdMonedas.Value := 0
            else
              EdMonedas.Value := FieldByName('VALOR_DENOMINACION').AsCurrency;
         except
            IBOtros.Transaction.RollbackRetaining;
            MessageDlg('No se pudo leer del arqueo',mtError,[mbcancel],0);
            Result := False;
            Exit;
         end;
         Total := Total + EdMonedas.Value;
       end;

     EdTotalBilletes.Caption := FormatCurr('$ #,0.00',Total);
     Result := True;
end;

procedure TfrmActualizarArqueo.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmActualizarArqueo.CmdLeerClick(Sender: TObject);
begin
        RecuperarArqueo;
        EdFecha.Enabled := False;
        EdCaja.Enabled := False;
        SBDenominacion.Enabled := True;
        CmdLeer.Enabled := False;
        CmdActualizar.Enabled := True;
end;

procedure TfrmActualizarArqueo.CmdActualizarClick(Sender: TObject);
var I:Integer;
begin
        CmdActualizar.Enabled := False;
        CmdLeer.Enabled := True;
        EdFecha.Enabled := True;
        EdCaja.Enabled := True;
        SBDenominacion.Enabled := False;


        IBSelect.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBSelect.ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
        IBSelect.ParamByName('FECHA_MOV').AsDate := EdFecha.Date;

        IBInsert.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBInsert.ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
        IBInsert.ParamByName('FECHA_MOV').AsDate := EdFecha.Date;

        IBUpdate.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBUpdate.ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
        IBUpdate.ParamByName('FECHA_MOV').AsDate := EdFecha.Date;


        for I := 0 to Length(LDenominacion) - 1 do
        begin
                IBSelect.Close;
                IBInsert.Close;
                IBUpdate.Close;
                IBSelect.ParamByName('ID_DENOMINACION').AsInteger := LDenominacion[I].IdDenominacion;
                IBInsert.ParamByName('ID_DENOMINACION').AsInteger := LDenominacion[I].IdDenominacion;
                IBUpdate.ParamByName('ID_DENOMINACION').AsInteger := LDenominacion[I].IdDenominacion;
                IBInsert.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacion[I].Cantidad.Value;
                IBInsert.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;
                IBUpdate.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacion[I].Cantidad.Value;
                IBUpdate.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;
                try
                  IBSelect.ExecQuery;
                  if IBSelect.RecordCount < 1 then
                    IBInsert.ExecQuery
                  else
                    IBUpdate.ExecQuery;
                except
                  IBSelect.Transaction.RollbackRetaining;
                  MessageDlg('Error al tratar de actualizar el arqueo',mtError,[mbcancel],0);
                  Exit;
                end;
        end;

                IBSelect.Close;
                IBInsert.Close;
                IBUpdate.Close;

                IBSelect.ParamByName('ID_DENOMINACION').AsInteger := 0;
                IBInsert.ParamByName('ID_DENOMINACION').AsInteger := 0;
                IBUpdate.ParamByName('ID_DENOMINACION').AsInteger := 0;
                IBInsert.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                IBUpdate.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                IBInsert.ParamByName('VALOR_DENOMINACION').AsCurrency := EdMonedas.Value;
                IBUpdate.ParamByName('VALOR_DENOMINACION').AsCurrency := EdMonedas.Value;
                try
                  IBSelect.ExecQuery;
                  if IBSelect.RecordCount < 1 then
                    IBInsert.ExecQuery
                  else
                    IBUpdate.ExecQuery;
                except
                  IBSelect.Transaction.RollbackRetaining;
                  MessageDlg('Error al tratar de actualizar el arqueo',mtError,[mbcancel],0);
                  Exit;
                end;

        IBSelect.Transaction.CommitRetaining;
        MessageDlg('Arqueo actualizado con exito',mtInformation,[mbok],0);

end;

procedure TfrmActualizarArqueo.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmActualizarArqueo.EdMonedasChange(Sender: TObject);
var Valor:Currency;
    Pos:Integer;
    I:Integer;
begin
       Total := 0;
       for I := 0 to Length(LDenominacion) - 1 do
       begin
           Valor := LDenominacion[I].vDenominacion * LDenominacion[I].Cantidad.Value;
           Total := Total + Valor;
       end;
       Total := Total + EdMonedas.Value;
       EdTotalBilletes.Caption := FormatCurr('$#,0.00',Total);

end;

end.
