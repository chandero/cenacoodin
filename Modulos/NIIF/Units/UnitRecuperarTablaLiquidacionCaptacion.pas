unit UnitRecuperarTablaLiquidacionCaptacion;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, IBCustomDataSet,
  IBQuery, IBSQL, unitDmGeneral;

type
  TfrmRecuperarTablaLiquidacionCaptacion = class(TForm)
    Label24: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    Panel1: TPanel;
    CmdRecuperar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdVer: TBitBtn;
    IBTipoCaptacion: TIBQuery;
    DSTipoCaptacion: TDataSource;
    IBSeleccion: TIBQuery;
    IBSQL1: TIBSQL;
    Label1: TLabel;
    EdFechaCorte: TStaticText;
    Label2: TLabel;
    Label3: TLabel;
    EdDesde: TEdit;
    EdHasta: TEdit;
    procedure FormShow(Sender: TObject);
    procedure CmdRecuperarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure EdDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure EdHastaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecuperarTablaLiquidacionCaptacion: TfrmRecuperarTablaLiquidacionCaptacion;
  dmGeneral : TdmGeneral;

implementation

{$R *.dfm}

uses unitGlobales, UnitPantallaProgreso;

procedure TfrmRecuperarTablaLiquidacionCaptacion.FormShow(Sender: TObject);
begin
        IBTipoCaptacion.Open;
        EdFechaCorte.Caption := DateToStr(fFechaActual);
end;

procedure TfrmRecuperarTablaLiquidacionCaptacion.CmdRecuperarClick(
  Sender: TObject);
var frmProgreso:TfrmProgreso;
    Total,CuotaCada:Integer;
    i,Consecutivo:Integer;
    ARecord:PTablaCerLiq;
    ARecordCon:PTablaConLiq;
    Lista:TList;
    TipoInteres:string;
    CodInteres:Integer;
    Puntos:Double;
    Valor:Currency;
    TasaE:Double;
    Moda:string;
    Fecha,FechaA:TDate;
    FechaP:TDate;
    Amor:Integer;
    Plazo:Integer;
    FechaUP:TDate;
    Dia:Word;
    FechaCorte:TDate;
begin
        if DBLCBTipoCaptacion.KeyValue < 1 then
        begin
           MessageDlg('Debe seleccionar un tipo de captación',mtError,[mbcancel],0);
           Exit;
        end;

        CmdRecuperar.Enabled := False;

        FechaCorte := StrToDate(EdFechaCorte.Caption);
        
        frmProgreso := TfrmProgreso.Create(Self);
        frmProgreso.Min := 0;
        frmProgreso.Max := 100;
        frmProgreso.Position := 0;
        frmProgreso.Titulo := 'Recuperación Tabla de Liquidación - Progreso';
        frmProgreso.Ejecutar;

        with IBSeleccion do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from P_CAP_0001_L (:ID,:DESDE,:HASTA)');
            ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('DESDE').AsInteger := StrToInt(EdDesde.Text);
            ParamByName('HASTA').AsInteger := StrToInt(EdHasta.Text);
            try
              Screen.Cursor := crHourGlass;
              frmProgreso.InfoLabel := 'Buscando Captaciones a Trabajar';
              Application.ProcessMessages;
              Open;
              Screen.Cursor := crDefault;
              Total := FieldByName('TOTAL').AsInteger;
              frmProgreso.Max := Total;
            except
              frmProgreso.Cerrar;
              MessageDlg('No se pudo establecer el conteo de Captaciones',mtError,[mbcancel],0);
              Close;
              Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select * from P_CAP_0007_L (:ID,:DESDE,:HASTA)');
            ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('DESDE').AsInteger := StrToInt(EdDesde.Text);
            ParamByName('HASTA').AsInteger := StrToInt(EdHasta.Text);
            try
              Screen.Cursor := crHourGlass;
              frmProgreso.InfoLabel := 'Iniciando Proceso de Recuperación';
              Application.ProcessMessages;
              Open;
              Screen.Cursor := crDefault;
            except
              frmProgreso.Cerrar;
              MessageDlg('Error al Procesar Captaciones',mtError,[mbcancel],0);
              Close;
              Exit;
            end;

            while not Eof do begin
             frmProgreso.Position := RecNo;
             frmProgreso.InfoLabel := 'Recuperando Tabla Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]);
             Application.ProcessMessages;
             Valor       := FieldByName('VALOR_INICIAL').AsCurrency;
             Plazo       := FieldByName('PLAZO_CUENTA').AsInteger;
             CuotaCada   := IBSeleccion.FieldByName('CUOTA_CADA').AsInteger;
             TasaE       := FieldByName('TASA_EFECTIVA').AsFloat;
             Amor        := FieldByName('AMORTIZACION').AsInteger;
             Moda        := FieldByName('MODALIDAD').AsString;
             Fecha       := FieldByName('FECHA_APERTURA').AsDateTime;
             FechaP      := FieldByName('FECHA_PRORROGA').AsDateTime;
             FechaUP     := FieldByName('FECHA_ULTIMO_PAGO').AsDateTime;
             FechaA      := Fecha;
             if FechaP < Fecha then
               FechaP := Fecha;
             if FechaUP < Fecha then
               FechaUP := Fecha;
             if DBLCBTipoCaptacion.KeyValue = 6 then
             begin
//             if FechaUP > FechaP then FechaP := FechaUP;
              if FechaP > Fecha then
                 Fecha := FechaP;
              TipoInteres := FieldByName('TIPO_INTERES').AsString;
              CodInteres  := FieldByName('ID_INTERES').AsInteger;
              if TipoInteres = 'V' then
              begin
                   IBSQL1.Close;
                   IBSQL1.SQL.Clear;
                   IBSQL1.SQL.Add('select VALOR_ACTUAL from "col$tasavariables"');
                   IBSQL1.SQL.Add('where ID_INTERES = :"ID_INTERES"');
                    IBSQL1.ParamByName('ID_INTERES').AsInteger := CodInteres;
                   try
                     IBSQL1.ExecQuery;
                     TasaE := FieldByName('VALOR_ACTUAL').AsFloat;
                     IBSQL1.Close;
                   except
                     frmProgreso.Cerrar;
                     MessageDlg('Error Buscando Tasa Variable',mtError,[mbcancel],0);
                     Exit;
                   end;
              end;


              Lista := TablaCer(Valor,TasaE,Moda,FechaA,Fecha,Amor,Plazo,Dia);


              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('delete from "cap$tablaliquidacion"');
              IBSQL1.SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
              IBSQL1.SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
              IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              try
                IBSQL1.ExecQuery;
              except
                frmProgreso.Cerrar;
                MessageDlg('Error Borrando Tabla Anterior',mtError,[mbcancel],0);
                Exit;
              end;
              IBSQL1.Close;

              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('Insert into "cap$tablaliquidacion" values(');
              IBSQL1.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
              IBSQL1.SQL.Add(':"FECHA_PAGO",:"VALOR",:"PAGADO")');
              IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              for i := 0 to Lista.Count - 1 do
              begin
                ARecord := Lista.Items[i];
                IBSQL1.ParamByName('FECHA_PAGO').AsDate := ARecord^.FechaPago;
                IBSQL1.ParamByName('VALOR').AsCurrency := ARecord^.Valor;
                IBSQL1.ParamByName('PAGADO').AsInteger := BooleanoToInt(ARecord^.Liquidado);
                 try
                  IBSQL1.ExecQuery;
                  IBSQL1.Close;
                  Dispose(ARecord);
                 except
                  frmProgreso.Cerrar;
                  MessageDlg('Error Creando Nueva Tabla',mtError,[mbcancel],0);
                  Exit;
                end;
              end;
             Lista.Free;
             end
             else
             begin
              Lista := TablaCon(Valor,Fecha,30,CuotaCada,DayOf(Fecha),FechaCorte);
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('delete from "cap$tablaliquidacioncon"');
              IBSQL1.SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
              IBSQL1.SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
              IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              try
                IBSQL1.ExecQuery;
              except
                frmProgreso.Cerrar;
                MessageDlg('Error Borrando Tabla Anterior',mtError,[mbcancel],0);
                Exit;
              end;
              IBSQL1.Close;

              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('Insert into "cap$tablaliquidacioncon" values(');
              IBSQL1.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
              IBSQL1.SQL.Add(':"FECHA_DESCUENTO",:"VALOR",:"DESCONTADO")');
              IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              for i := 0 to Lista.Count - 1 do
              begin
                ARecordCon := Lista.Items[i];
                IBSQL1.ParamByName('FECHA_DESCUENTO').AsDate := ARecordCon^.FechaDescuento;
                IBSQL1.ParamByName('VALOR').AsCurrency := ARecordCon^.Valor;
                IBSQL1.ParamByName('DESCONTADO').AsInteger := BooleanoToInt(ARecordCon^.Descontado);
                 try
                  IBSQL1.ExecQuery;
                  IBSQL1.Close;
                  Dispose(ARecordCon);
                 except
                  frmProgreso.Cerrar;
                  MessageDlg('Error Creando Nueva Tabla',mtError,[mbcancel],0);
                  Exit;
                end;
              end;
             Lista.Free;
            end;
            Next;
           end;
          end; 
        frmProgreso.Cerrar;
        IBSeleccion.Transaction.Commit;
        MessageDlg('Proceso Culminado con Exito!',mtInformation,[mbok],0);

end;

procedure TfrmRecuperarTablaLiquidacionCaptacion.CmdCerrarClick(
  Sender: TObject);
begin
        Close;
end;

procedure TfrmRecuperarTablaLiquidacionCaptacion.EdDesdeKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmRecuperarTablaLiquidacionCaptacion.EdHastaKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmRecuperarTablaLiquidacionCaptacion.FormKeyPress(
  Sender: TObject; var Key: Char);
begin
        entertabs(Key,Self);
end;

procedure TfrmRecuperarTablaLiquidacionCaptacion.FormCreate(
  Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;

        IBTipoCaptacion.Database := dmGeneral.IBDatabase1;
        IBSeleccion.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;

        IBTipoCaptacion.Transaction := dmGeneral.IBTransaction1;
        IBSeleccion.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;


        if  IBTipoCaptacion.Transaction.InTransaction then
           IBTipoCaptacion.Transaction.Rollback;
        IBTipoCaptacion.Transaction.StartTransaction;
end;

procedure TfrmRecuperarTablaLiquidacionCaptacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

end.
