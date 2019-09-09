unit UnitConciliacionServiciosVirtuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBClient,
  Buttons, IBCustomDataSet, IBQuery, IBDatabase, DataSetToExcel, IBSQL,
  pr_Common, pr_TxClasses, JvEdit, JvTypedEdit, StrUtils;

type
  TfrmConciliacionServiciosVirtuales = class(TForm)
    GroupBox1: TGroupBox;
    edFecha: TDateTimePicker;
    CmdLiquidar: TBitBtn;
    CDSdata: TClientDataSet;
    dbData: TDBGrid;
    Panel1: TPanel;
    btnComprobante: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQrecibir: TIBQuery;
    IBTransaction1: TIBTransaction;
    CDSdataFECHA: TDateField;
    CDSdataSECUENCIA: TStringField;
    CDSdataOPERACION: TStringField;
    CDSdataDEBITO: TCurrencyField;
    CDSdataCREDITO: TCurrencyField;
    CDSdataCUENTA: TStringField;
    CDSdataCANAL: TStringField;
    IBQcuenta: TIBQuery;
    btnExcel: TBitBtn;
    CDSdataTIPO: TStringField;
    CDSdataES_CAJA: TBooleanField;
    SD1: TSaveDialog;
    DSdata: TDataSource;
    IBDComprobante: TIBDataSet;
    IBDAuxiliar: TIBDataSet;
    IBAuxiliar: TIBQuery;
    IBAuxiliarID_COMPROBANTE: TIntegerField;
    IBAuxiliarDESCRIPCION_AGENCIA: TIBStringField;
    IBAuxiliarTIPO: TIBStringField;
    IBAuxiliarFECHADIA: TDateField;
    IBAuxiliarDESCRIPCION: TMemoField;
    IBAuxiliarPRIMER_APELLIDO: TIBStringField;
    IBAuxiliarSEGUNDO_APELLIDO: TIBStringField;
    IBAuxiliarNOMBRE: TIBStringField;
    IBAuxiliarCODIGO: TIBStringField;
    IBAuxiliarCUENTA: TIBStringField;
    IBAuxiliarDEBITO: TIBBCDField;
    IBAuxiliarCREDITO: TIBBCDField;
    IBSQL1: TIBSQL;
    ReporteC: TprTxReport;
    edMovimiento: TJvCurrencyEdit;
    edComision: TJvCurrencyEdit;
    edGMF: TJvCurrencyEdit;
    edCaja: TJvCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    chkComprobante: TCheckBox;
    Label5: TLabel;
    edGanadiario: TJvCurrencyEdit;
    Label6: TLabel;
    edSubCuenta: TJvCurrencyEdit;
    edFechaNota: TDateTimePicker;
    CDSdataCAPTACION: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdLiquidarClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure btnComprobanteClick(Sender: TObject);
    procedure chkComprobanteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edFechaChange(Sender: TObject);
  private
    { Private declarations }
    procedure Procesar;
  public
    { Public declarations }
  end;

var
  frmConciliacionServiciosVirtuales: TfrmConciliacionServiciosVirtuales;
  Comprobante :Integer;
  
implementation

{$R *.dfm}

uses UnitdmGeneral, UnitGlobales;

procedure TfrmConciliacionServiciosVirtuales.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmConciliacionServiciosVirtuales.CmdLiquidarClick(
  Sender: TObject);
  var existe: Integer;
begin
        IF IBTransaction1.InTransaction THEN
           IBTransaction1.Commit;
        IBTransaction1.StartTransaction;
        // Verificar si ya se ha procesado para notificar
        IBQrecibir.Close;
        ibqrecibir.SQL.Clear;
        IBQrecibir.SQL.Add('SELECT COUNT(*) AS EXISTE FROM CAP$CONTROLCONCILIACION c WHERE c.FECHA_PROCESAR = :FECHA_PROCESAR');
        IBQrecibir.ParamByName('FECHA_PROCESAR').AsDate := edFecha.Date;
        IBQrecibir.Open;
        existe := IBQrecibir.FieldByName('EXISTE').AsInteger;
        IF existe > 0 THEN
        BEGIN
           IF MessageDlg('Esa fecha ya fue procesada, desea continuar?', mtWarning, [mbYes, mbNo], 0) = mrYes THEN
           BEGIN
                Procesar();
           END
        END
        ELSE
        BEGIN
            Procesar();
        END;
end;

procedure TfrmConciliacionServiciosVirtuales.Procesar;
var
    vFechaContable : String;
    vReverso: String;
    vEstado: String;
    vOperacion: String;
    vSecuencia: String;
    vDocumento: String;
    vDescripcion: String;
    vDispositivo: String;
    vCuenta: String;
    vCanal: String;
    vTipo: String;
    vValor: Currency;
    vComision: Currency;
    vGmf: Currency;
    vTipoAH: String;
    esReverso: Boolean;
    vTotalDebitoMovimiento: Currency;
    vTotalCreditoMovimiento: Currency;
    vTotalDebitoComision: Currency;
    vTotalCreditoComision: Currency;
    vTotalDebitoGmf: Currency;
    vTotalCreditoGmf: Currency;

    vTotalMovimiento: Currency;
    vTotalComision: Currency;
    vTotalGmf: Currency;
    vTotalCaja: Currency;

    vTotalCajaDebito: Currency;
    vTotalCajaCredito: Currency;

    vTotalAhorros: Currency;
    vTotalSubCuenta: Currency;

    vTotalTemporal: Currency;
    CodigoGanadiario, CodigoSubcuenta, CodigoCaja, CodigoTemporal, CodigoComision: String;

begin
        vTotalDebitoMovimiento := 0;
        vTotalCreditoMovimiento := 0;
        vTotalDebitoComision := 0;
        vTotalCreditoComision := 0;
        vTotalDebitoGmf := 0;
        vTotalCreditoGmf := 0;
        vTotalAhorros := 0;
        vTotalSubCuenta := 0;
        vTotalCajaDebito := 0;
        vTotalCajaCredito := 0;

        vTotalMovimiento := 0;
        vTotalComision := 0;
        vTotalGmf := 0;
        vTotalCaja := 0;
        
        CDSdata.Close;
        CDSdata.Open;

        DateTimeToString(vFechaContable, 'dd/MM/yyyy', edFecha.Date);
        IBQrecibir.Close;
        IBQrecibir.SQL.Clear;
        IBQrecibir.SQL.Add('SELECT * FROM RECIBIR WHERE FECHA_CONTABLE = :FECHA_CONTABLE');
        IBQrecibir.ParamByName('FECHA_CONTABLE').AsString := vFechaContable;
        IBQrecibir.Open;
        WHILE Not IBQrecibir.Eof DO
        BEGIN
           Application.ProcessMessages;
           vReverso := IBQrecibir.FieldByName('REVERSO').AsString;
           vEstado := IBQrecibir.FieldByName('ESTADO').AsString;
           vOperacion := IBQrecibir.FieldByName('OPERACION').AsString;
           vSecuencia := IBQrecibir.FieldByName('SECUENCIA').AsString;
           vDocumento := IBQrecibir.FieldByName('DOCUMENTO').AsString;
           vDescripcion := IBQrecibir.FieldByName('DESCRIPCION').AsString;
           vDispositivo := IBQrecibir.FieldByName('DISPOSITIVO').AsString;
           vCuenta := IBQrecibir.FieldByName('CUENTA').AsString;
           vCanal := IBQrecibir.FieldByName('CANAL').AsString;
           vValor := IBQrecibir.FieldByName('VALOR').AsInteger / 100;
           vComision := IBQrecibir.FieldByName('VALOR_COMISION').AsInteger / 100;
           vGmf := IBQrecibir.FieldByName('VALOR_GMF').AsInteger / 100;

           vTipoAH := LeftStr(vCuenta,1);

           IF VarIsEmpty(Trim(vReverso)) THEN
           BEGIN
              esReverso := True;
           END
           ELSE
           BEGIN
              esReverso := False;
           END;

           /// Inicio If vValor vComision vGmf
           IF (vValor > 0) OR (vComision > 0) or (vGmf > 0) THEN
           BEGIN
                IF vEstado = 'APROBADA' THEN
                BEGIN
                   /// Inicio If vValor
                   IF vValor > 0 THEN
                   BEGIN
                     CDSdata.Append;
                     CDSdataFECHA.Value := edFecha.Date;
                     CDSdataOPERACION.Value := vOperacion;
                     CDSdataSECUENCIA.Value := vSecuencia;
                     CDSdataCUENTA.Value := vCuenta;
                     CDSdataCANAL.Value := vCanal;
                     CDSdataCAPTACION.Value := vTipoAH;
                     CDSdataDEBITO.Value := 0;
                     CDSdataCREDITO.Value := 0;
                     CDSdataTIPO.Value := 'MOVIMIENTO';
                     IF vOPERACION = 'DEBITO' THEN
                     BEGIN
                       IF esReverso THEN
                       BEGIN
                         CDSdataDEBITO.Value := 0;
                         CDSDataCREDITO.Value := vValor;
                         vTotalCreditoMovimiento := vTotalCreditoMovimiento + vValor;
                         IF vTipoAH = '2' THEN
                         BEGIN
                            vTotalAhorros := vTotalAhorros + vValor;
                         END
                         ELSE
                         IF vTipoAH = '3' THEN
                         BEGIN
                            vTotalSubCuenta := vTotalSubCuenta + vValor;
                         END;
                         IF vCanal = 'OFI' THEN
                         BEGIN
                           if (not AnsiContainsText(vDescripcion, 'Transferencia')) and (vDispositivo = 'PROPIO') then
                            vTotalCajaDebito := vTotalCajaDebito + vValor;
                         END;
                       END
                       ELSE
                       BEGIN
                         CDSdataDEBITO.Value := vValor;
                         CDSdataCREDITO.Value := 0;
                         vTotalDebitoMovimiento := vTotalDebitoMovimiento + vValor;
                         IF vTipoAH = '2' THEN
                         BEGIN
                            vTotalAhorros := vTotalAhorros - vValor;
                         END
                         ELSE
                         IF vTipoAH = '3' THEN
                         BEGIN
                            vTotalSubCuenta := vTotalSubCuenta - vValor;
                         END;
                         IF vCanal = 'OFI' THEN
                         BEGIN
                           if (not AnsiContainsText(vDescripcion, 'Transferencia')) and (vDispositivo = 'PROPIO') then
                            vTotalCajaCredito := vTotalCajaCredito + vValor;
                         END;
                       END;
                     END
                     ELSE
                     BEGIN
                       IF esReverso THEN
                       BEGIN
                         CDSdataCREDITO.Value := 0;
                         CDSdataDEBITO.Value := vValor;
                         vTotalDebitoMovimiento := vTotalDebitoMovimiento + vValor;
                         IF vTipoAH = '2' THEN
                         BEGIN
                            vTotalAhorros := vTotalAhorros - vValor;
                         END
                         ELSE
                         IF vTipoAH = '3' THEN
                         BEGIN
                            vTotalSubCuenta := vTotalSubCuenta - vValor;
                         END;
                         IF vCanal = 'OFI' THEN
                         BEGIN
                           if (not AnsiContainsText(vDescripcion, 'Transferencia')) and (vDispositivo = 'PROPIO') then
                            vTotalCajaCredito := vTotalCajaCredito + vValor;
                         END;
                       END
                       ELSE
                       BEGIN
                         CDSdataCREDITO.Value := vValor;
                         CDSdataDEBITO.Value := 0;
                         vTotalCreditoMovimiento := vTotalCreditoMovimiento + vValor;
                         IF vTipoAH = '2' THEN
                         BEGIN
                            vTotalAhorros := vTotalAhorros + vValor;
                         END
                         ELSE
                         IF vTipoAH = '3' THEN
                         BEGIN
                            vTotalSubCuenta := vTotalSubCuenta + vValor;
                         END ;
                         IF vCanal = 'OFI' THEN
                         BEGIN
                           if (not AnsiContainsText(vDescripcion, 'Transferencia')) and (vDispositivo = 'PROPIO') then
                            vTotalCajaDebito := vTotalCajaDebito + vValor;
                         END;
                       END;
                     END;
                     IF vCANAL = 'OFI' THEN
                     BEGIN
                       CDSdataES_CAJA.Value := True;
                     END
                     ELSE
                     BEGIN
                       CDSdataES_CAJA.Value := False;
                     END;
                     CDSdata.Post;
                   END;
                   /// Inicio If vComision
                   IF vComision > 0 THEN
                   BEGIN
                       CDSdata.Append;
                       CDSdataFECHA.Value := edFecha.Date;
                       CDSdataCAPTACION.Value := vTipoAH;
                       CDSdataOPERACION.Value := vOperacion;
                       CDSdataSECUENCIA.Value := vSecuencia;
                       CDSdataCUENTA.Value := vCuenta;
                       CDSdataCANAL.Value := vCanal;
                       CDSdataDEBITO.Value := 0;
                       CDSdataCREDITO.Value := 0;
                       CDSdataTIPO.Value := 'COMISION';
                       IF esReverso THEN
                       BEGIN
                         CDSdataDEBITO.Value := 0;
                         CDSDataCREDITO.Value := vComision;
                         vTotalCreditoComision := vTotalCreditoComision + vComision;
                         IF vTipoAH = '2' THEN
                         BEGIN
                            vTotalAhorros := vTotalAhorros - vComision;
                         END
                         ELSE
                         IF vTipoAH = '3' THEN
                         BEGIN
                            vTotalSubCuenta := vTotalSubCuenta - vComision;
                         END;
                       END
                       ELSE
                       BEGIN
                         CDSdataDEBITO.Value := vComision;
                         CDSdataCREDITO.Value := 0;
                         vTotalDebitoComision := vTotalDebitoComision + vComision;
                         IF vTipoAH = '2' THEN
                         BEGIN
                            vTotalAhorros := vTotalAhorros + vComision;
                         END
                         ELSE
                         IF vTipoAH = '3' THEN
                         BEGIN
                            vTotalSubCuenta := vTotalSubCuenta + vComision;
                         END;
                       END;
                       CDSdata.Post;
                   END;
                   /// Inicio If vGmf
                   IF vGmf > 0 THEN
                   BEGIN
                       CDSdata.Append;
                       CDSdataFECHA.Value := edFecha.Date;
                       CDSdataCAPTACION.Value := vTipoAH;
                       CDSdataOPERACION.Value := vOperacion;
                       CDSdataSECUENCIA.Value := vSecuencia;
                       CDSdataCUENTA.Value := vCuenta;
                       CDSdataCANAL.Value := vCanal;
                       CDSdataDEBITO.Value := 0;
                       CDSdataCREDITO.Value := 0;
                       CDSdataTIPO.Value := 'GMF';
                       IF esReverso THEN
                       BEGIN
                         CDSdataDEBITO.Value := 0;
                         CDSDataCREDITO.Value := vGmf;
                         vTotalCreditoGmf := vTotalCreditoGmf + vGmf;
                         IF vTipoAH = '2' THEN
                         BEGIN
                            vTotalAhorros := vTotalAhorros + vGmf;
                         END
                         ELSE
                         IF vTipoAH = '3' THEN
                         BEGIN
                            vTotalSubCuenta := vTotalSubCuenta + vGmf;
                         END;
                       END
                       ELSE
                       BEGIN
                         CDSdataDEBITO.Value := vGmf;
                         CDSdataCREDITO.Value := 0;
                         vTotalDebitoGmf := vTotalDebitoGmf + vGmf;
                         IF vTipoAH = '2' THEN
                         BEGIN
                            vTotalAhorros := vTotalAhorros - vGmf;
                         END
                         ELSE
                         IF vTipoAH = '3' THEN
                         BEGIN
                            vTotalSubCuenta := vTotalSubCuenta - vGmf;
                         END;
                       END;
                       CDSdata.Post;
                   END;
                END;
           END; /// Fin If vValor
           IBQrecibir.Next;
        END;

        IBQrecibir.Close;
        IBQrecibir.SQL.Clear;
        IBQrecibir.SQL.Add('SELECT * FROM RECIBIR_EXTERNA WHERE FECHA_CONTABLE = :FECHA_CONTABLE');
        IBQrecibir.ParamByName('FECHA_CONTABLE').AsString := vFechaContable;
        IBQrecibir.Open;
        WHILE Not IBQrecibir.Eof DO
        BEGIN
           Application.ProcessMessages;
           // vReverso := IBQrecibir.FieldByName('REVERSO').AsString;
           vEstado := IBQrecibir.FieldByName('ESTADO').AsString;
           vOperacion := IBQrecibir.FieldByName('OPERACION').AsString;
           vSecuencia := IBQrecibir.FieldByName('SECUENCIA').AsString;
           vDocumento := IBQrecibir.FieldByName('DOCUMENTO').AsString;
           vDescripcion := IBQrecibir.FieldByName('DESCRIPCION').AsString;
           vCuenta := '';
           vCanal := 'OFI';
           vValor := IBQrecibir.FieldByName('VALOR').AsInteger / 100;
           vComision := IBQrecibir.FieldByName('VALOR_COMISION').AsInteger / 100;
           vGmf := 0;
           vTipoAH := '';

           IF VarIsEmpty(Trim(vReverso)) THEN
           BEGIN
              esReverso := True;
           END
           ELSE
           BEGIN
              esReverso := False;
           END;

           IF (vValor > 0) OR (vComision > 0) or (vGmf > 0) THEN
           BEGIN
                IF vEstado = 'APROBADA' THEN
                BEGIN
                   IF vValor > 0 THEN
                   BEGIN
                     CDSdata.Append;
                     CDSdataFECHA.Value := edFecha.Date;
                     CDSdataCAPTACION.Value := vTipoAH;
                     CDSdataOPERACION.Value := vOperacion;
                     CDSdataSECUENCIA.Value := vSecuencia;
                     CDSdataCUENTA.Value := vCuenta;
                     CDSdataCANAL.Value := vCanal;
                     CDSdataDEBITO.Value := 0;
                     CDSdataCREDITO.Value := 0;
                     CDSdataTIPO.Value := 'MOVIMIENTO';
                     IF vOPERACION = 'DEBITO' THEN
                     BEGIN
                       IF esReverso THEN
                       BEGIN
                         CDSdataDEBITO.Value := 0;
                         CDSDataCREDITO.Value := vValor;
                         // vTotalCreditoMovimiento := vTotalCreditoMovimiento + vValor;
                         IF vCanal = 'OFI' THEN
                         BEGIN
                           if (not AnsiContainsText(vDescripcion, 'Transferencia')) then
                            vTotalCajaDebito := vTotalCajaDebito + vValor;
                         END
                       END
                       ELSE
                       BEGIN
                         CDSdataDEBITO.Value := vValor;
                         CDSdataCREDITO.Value := 0;
                         // vTotalDebitoMovimiento := vTotalDebitoMovimiento + vValor;
                         IF vCanal = 'OFI' THEN
                         BEGIN
                           if (not AnsiContainsText(vDescripcion, 'Transferencia')) then
                            vTotalCajaCredito := vTotalCajaCredito + vValor;
                         END
                       END;
                     END
                     ELSE
                     BEGIN
                       IF esReverso THEN
                       BEGIN
                         CDSdataCREDITO.Value := 0;
                         CDSdataDEBITO.Value := vValor;
                         // vTotalDebitoMovimiento := vTotalDebitoMovimiento + vValor;
                         IF vCanal = 'OFI' THEN
                         BEGIN
                           if (not AnsiContainsText(vDescripcion, 'Transferencia')) then
                            vTotalCajaCredito := vTotalCajaCredito + vValor;
                         END
                       END
                       ELSE
                       BEGIN
                         CDSdataCREDITO.Value := vValor;
                         CDSdataDEBITO.Value := 0;
                         // vTotalCreditoMovimiento := vTotalCreditoMovimiento + vValor;
                         IF vCanal = 'OFI' THEN
                         BEGIN
                           if (not AnsiContainsText(vDescripcion, 'Transferencia')) then
                            vTotalCajaDebito := vTotalCajaDebito + vValor;
                         END                         
                       END;
                     END;
                     IF vCANAL = 'OFI' THEN
                     BEGIN
                       CDSdataES_CAJA.Value := True;
                     END
                     ELSE
                     BEGIN
                       CDSdataES_CAJA.Value := False;
                     END;
                     CDSdata.Post;
                   END;

                   IF vComision > 0 THEN
                   BEGIN
                       CDSdata.Append;
                       CDSdataFECHA.Value := edFecha.Date;
                       CDSdataCAPTACION.Value := vTipoAH;
                       CDSdataOPERACION.Value := vOperacion;
                       CDSdataSECUENCIA.Value := vSecuencia;
                       CDSdataCUENTA.Value := vCuenta;
                       CDSdataCANAL.Value := vCanal;
                       CDSdataDEBITO.Value := 0;
                       CDSdataCREDITO.Value := 0;
                       CDSdataTIPO.Value := 'COMISION';
                       IF esReverso THEN
                       BEGIN
                         CDSdataDEBITO.Value := 0;
                         CDSDataCREDITO.Value := vComision;
                         vTotalCreditoComision := vTotalCreditoComision + vComision;
                       END
                       ELSE
                       BEGIN
                         CDSdataDEBITO.Value := vComision;
                         CDSdataCREDITO.Value := 0;
                         vTotalDebitoComision := vTotalDebitoComision + vComision;
                       END;
                       CDSdata.Post;
                   END;
                END;
           END;
           IBQrecibir.Next;
        END;


        vTotalMovimiento := vTotalCreditoMovimiento - vTotalDebitoMovimiento + vTotalCreditoGmf - vTotalDebitoGmf;
        vTotalComision := vTotalCreditoComision - vTotalDebitoComision;
        vTotalGmf := vTotalDebitoGmf - vTotalCreditoGmf;
        vTotalTemporal := 0;

        vTotalCaja := vTotalCajaDebito - vTotalCajaCredito;

        edMovimiento.Value := vTotalMovimiento - vTotalCaja;
        edComision.Value := vTotalComision;
        edGMF.Value := vTotalGmf;
        edCaja.Value := vTotalCaja;

        edGanadiario.Value := vTotalAhorros;
        edSubCuenta.Value := vTotalSubCuenta;

        btnExcel.Enabled := True;
        if chkComprobante.Checked then
          btnComprobante.Enabled;

        IBQCuenta.Close;
        IBQCuenta.SQL.Clear;
        IBQCuenta.SQL.Add('SELECT r.CODIGO FROM CAP$CODIGOSCONTRACTUAL r WHERE r.ID_CODIGO = :ID_CODIGO');
        IBQCuenta.ParamByName('ID_CODIGO').AsInteger := 10;
        IBQCuenta.Open;
        CodigoTemporal := IBQCuenta.FieldByName('CODIGO').AsString;
        IBQCuenta.Close;
        IBQCuenta.SQL.Clear;
        IBQCuenta.SQL.Add('SELECT r.CODIGO FROM CAP$CODIGOSCONTRACTUAL r WHERE r.ID_CODIGO = :ID_CODIGO');
        IBQCuenta.ParamByName('ID_CODIGO').AsInteger := 11;
        IBQCuenta.Open;
        CodigoComision := IBQCuenta.FieldByName('CODIGO').AsString;
        IBQCuenta.Close;
        IBQCuenta.SQL.Clear;
        IBQCuenta.SQL.Add('SELECT r.CODIGO FROM COL$CODIGOSPUCBASICOS r WHERE r.ID_CODIGOPUCBASICO = :ID_CODIGO');
        IBQCuenta.ParamByName('ID_CODIGO').AsInteger := 1;
        IBQCuenta.Open;
        CodigoCaja := IBQCuenta.FieldByName('CODIGO').AsString;
        IBQCuenta.Close;
        IBQCuenta.SQL.Clear;
        IBQCuenta.SQL.Add('SELECT r.CODIGO FROM COL$CODIGOSPUCBASICOS r WHERE r.ID_CODIGOPUCBASICO = :ID_CODIGO');
        IBQCuenta.ParamByName('ID_CODIGO').AsInteger := 1;
        IBQCuenta.Open;
        CodigoCaja := IBQCuenta.FieldByName('CODIGO').AsString;
        IBQCuenta.Close;
        IBQCuenta.SQL.Clear;
        IBQCuenta.SQL.Add('SELECT r.CODIGO_CONTABLE FROM "cap$tipocaptacion" r WHERE r.ID_TIPO_CAPTACION = :ID_CODIGO');
        IBQCuenta.ParamByName('ID_CODIGO').AsInteger := 2;
        IBQCuenta.Open;
        CodigoGanadiario := IBQCuenta.FieldByName('CODIGO_CONTABLE').AsString;
        IBQCuenta.Close;
        IBQCuenta.SQL.Clear;
        IBQCuenta.SQL.Add('SELECT r.CODIGO_CONTABLE FROM "cap$tipocaptacion" r WHERE r.ID_TIPO_CAPTACION = :ID_CODIGO');
        IBQCuenta.ParamByName('ID_CODIGO').AsInteger := 3;
        IBQCuenta.Open;
        CodigoSubcuenta := IBQCuenta.FieldByName('CODIGO_CONTABLE').AsString;

        vTotalTemporal := vTotalCaja - vTotalAhorros - vTotalSubCuenta - vTotalComision;

        // CONTABILIZAR
      if chkComprobante.Checked then
      begin
        Comprobante := ObtenerConsecutivo(IBSQL1);
        with IBDComprobante do
        begin
           Open;
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
           FieldByName('FECHADIA').AsDateTime := EdFechaNota.Date;
           FieldByName('DESCRIPCION').AsString := 'Conciliacion Servicios Virtuales De Fecha ' + DateToStr(edFecha.Date);
           FieldByName('TOTAL_DEBITO').AsCurrency := 0;
           FieldByName('TOTAL_CREDITO').AsCurrency := 0;
           FieldByName('ESTADO').AsString := 'O';
           FieldByName('IMPRESO').AsInteger := 1;
           FieldByName('ANULACION').AsString := '';
           FieldByName('ID_EMPLEADO').AsString := DBAlias;
           Post;
        end;

        with IBDAuxiliar do
        begin
           Open;
           if vTotalAhorros > 0 then
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := CodigoGanadiario;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := vTotalAhorros;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end
           else if vTotalAhorros < 0 then
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := CodigoGanadiario;
            FieldByName('DEBITO').AsCurrency := -vTotalAhorros;
            FieldByName('CREDITO').AsCurrency := 0;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end;

           if vTotalSubCuenta > 0 then
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := CodigoSubcuenta;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := vTotalSubCuenta;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end
           else if vTotalSubCuenta < 0 then
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := CodigoSubcuenta;
            FieldByName('DEBITO').AsCurrency := -vTotalSubCuenta;
            FieldByName('CREDITO').AsCurrency := 0;
            FieldByName('ID_CUENTA').AsInteger := 0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end;

           if vTotalCaja > 0 then
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := CodigoCaja;
            FieldByName('DEBITO').AsCurrency := vTotalCaja;
            FieldByName('CREDITO').AsCurrency := 0;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end
           else if vTotalCaja < 0 then
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := CodigoCaja;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := -vTotalCaja;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end;

           if vTotalComision > 0 then
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := CodigoComision;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := vTotalComision;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end
           else if vTotalComision < 0 then
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := CodigoComision;
            FieldByName('DEBITO').AsCurrency := -vTotalComision;
            FieldByName('CREDITO').AsCurrency := 0;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end;

           if vTotalTemporal > 0 then
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := CodigoTemporal;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := vTotalTemporal;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end
           else if vTotalTemporal < 0 then
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := CodigoTemporal;
            FieldByName('DEBITO').AsCurrency := -vTotalTemporal;
            FieldByName('CREDITO').AsCurrency := 0;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end;
        end;
        btnComprobante.Enabled := true;
        IBQrecibir.Close;
        IBQrecibir.SQL.Clear;
        IBQrecibir.SQL.Add('INSERT INTO CAP$CONTROLCONCILIACION VALUES (:FECHA_PROCESAR, :FECHA_PROCESADO)');
        IBQrecibir.ParamByName('FECHA_PROCESAR').AsDate := edFecha.Date;
        IBQrecibir.ParamByName('FECHA_PROCESADO').AsDate := fFechaActual;
        IBQrecibir.ExecSQL;
      end
      else
        btnComprobante.Enabled := false;
      edMovimiento.Value := vTotalTemporal;
      IBTransaction1.Commit;
end;

procedure TfrmConciliacionServiciosVirtuales.btnExcelClick(
  Sender: TObject);
  var
   ExcelFile : TDataSetToExcel;
begin

          SD1.Title := 'Nombre Para El Archivo de Movimientos';
          if (SD1.Execute) then
          begin
           CDSdata.First;
           ExcelFile := TDataSetToExcel.Create(CDSdata,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
           ShowMessage('Archivo de Movimientos Guardado...!');
          end
          else
          begin
           ShowMessage('Archivo no generado...!');
          end;
end;

procedure TfrmConciliacionServiciosVirtuales.CmdCerrarClick(
  Sender: TObject);
begin
        Close;
end;

procedure TfrmConciliacionServiciosVirtuales.btnComprobanteClick(
  Sender: TObject);
begin
        with IBAuxiliar do
        begin
             if Transaction.InTransaction then
                Transaction.Rollback;
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('CON$AUXILIAR.ID_COMPROBANTE,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
             SQL.Add('CON$TIPOCOMPROBANTE.DESCRIPCION AS TIPO,');
             SQL.Add('CON$COMPROBANTE.FECHADIA,');
             SQL.Add('CON$COMPROBANTE.DESCRIPCION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$empleado".NOMBRE,');
             SQL.Add('CON$AUXILIAR.CODIGO,');
             SQL.Add('CON$PUC.NOMBRE AS CUENTA,');
             SQL.Add('CON$AUXILIAR.DEBITO,');
             SQL.Add('CON$AUXILIAR.CREDITO');
             SQL.Add('from ');
             SQL.Add('CON$COMPROBANTE ');
             SQL.Add('INNER JOIN CON$AUXILIAR ON (CON$COMPROBANTE.TIPO_COMPROBANTE = CON$AUXILIAR.TIPO_COMPROBANTE and CON$COMPROBANTE.ID_COMPROBANTE = CON$AUXILIAR.ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN CON$PUC ON (CON$AUXILIAR.CODIGO = CON$PUC.CODIGO)');
             SQL.Add('INNER JOIN CON$TIPOCOMPROBANTE ON (CON$COMPROBANTE.TIPO_COMPROBANTE = CON$TIPOCOMPROBANTE.ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON (CON$AUXILIAR.ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON (CON$COMPROBANTE.ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('(CON$COMPROBANTE.ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('(CON$COMPROBANTE.ID_COMPROBANTE = :"ID_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             try
              Open;
              ReporteC.Variables.ByName['EMPRESA'].AsString := Empresa;
              ReporteC.Variables.ByName['NIT'].AsString := Nit;
              if ReporteC.PrepareReport then
                 ReporteC.PreviewPreparedReport(True);
              Close;
             except
               MessageDlg('Error generando el comprobante',mtError,[mbcancel],0);
               Close;
             end;
             Transaction.Commit;
        end;

end;

procedure TfrmConciliacionServiciosVirtuales.chkComprobanteClick(
  Sender: TObject);
begin
        edFechaNota.Enabled := chkComprobante.Checked;
end;

procedure TfrmConciliacionServiciosVirtuales.FormShow(Sender: TObject);
begin
        edFecha.Date := fFechaActual;
        edFechaNota.Date := edFecha.Date
end;

procedure TfrmConciliacionServiciosVirtuales.edFechaChange(
  Sender: TObject);
begin
        edFechaNota.Date := edFecha.Date;
end;

end.
