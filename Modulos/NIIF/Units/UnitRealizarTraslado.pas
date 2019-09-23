unit UnitRealizarTraslado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, JvComponent, DB,
  IBCustomDataSet, IBQuery, IBSQL, sdXmlDocuments, IB, IBDatabase, DBClient,
  JvSimpleXml, pr_TxClasses, pr_Common, pr_Classes;

type
  TFrmRealizarTraslado = class(TForm)
    Label1: TLabel;
    EdAgenciaOrigen: TDBLookupComboBox;
    Label2: TLabel;
    EdTipoDocumento: TDBLookupComboBox;
    Label3: TLabel;
    EdDocumento: TEdit;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    IdTCPClient1: TIdTCPClient;
    DSAgencia: TDataSource;
    DSTipos: TDataSource;
    IBQAgencia: TIBQuery;
    IBQTipos: TIBQuery;
    IBSQL1: TIBSQL;
    IBTransaction2: TIBTransaction;
    CDSCuentas: TClientDataSet;
    CDSCuentasTIPO_CUENTA: TIntegerField;
    CDSCuentasNUMERO_CUENTA: TIntegerField;
    CDSCuentasN_TIPO_CUENTA: TIntegerField;
    CDSCuentasN_NUMERO_CUENTA: TIntegerField;
    IBInsertar: TIBQuery;
    xml: TJvSimpleXml;
    IBTransaction3: TIBTransaction;
    Label4: TLabel;
    st1: TStaticText;
    IBSQ: TIBSQL;
    btnOtro: TBitBtn;
    btnImprimir: TBitBtn;
    IBAuxiliar: TIBQuery;
    prReport1: TprReport;
    Report1: TprTxReport;
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
    IBAuxiliarID_CUENTA: TIBStringField;
    IBAuxiliarID_COLOCACION: TIBStringField;
    IBAuxiliarID_IDENTIFICACION: TSmallintField;
    IBAuxiliarID_PERSONA: TIBStringField;
    IBAuxiliarPRIMER_APELLIDO1: TIBStringField;
    IBAuxiliarSEGUNDO_APELLIDO1: TIBStringField;
    IBAuxiliarNOMBRE1: TIBStringField;
    IBAuxiliarDEBITO: TIBBCDField;
    IBAuxiliarCREDITO: TIBBCDField;
    IBAuxiliar1: TIBQuery;
    IBSQL2: TIBSQL;
    IBTransaction4: TIBTransaction;
    MmResumen: TMemo;
    Label5: TLabel;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOtroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Report1InitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure prReport1InitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure prReport1PrintComplete(Sender: TObject);
    procedure Report1PrintComplete(Sender: TObject);
  private
    { Private declarations }
     function FldToStr(const Value : TFieldType) : string;
     procedure Insertar(AStream:TStream);
    procedure Inicializar;
    function ValidarDocumento: Boolean;
    procedure MarcarDocumento;
    function ValidarPersona(tp: integer; id: string): Boolean;
    function ValidarInfPersona(tp: integer; id: string): Boolean;
    function ValidarReferencia(tipo_r: integer; id_r: string;
      csc_r: integer): boolean;
  public
    { Public declarations }
  end;

var
  FrmRealizarTraslado: TFrmRealizarTraslado;
  Comp:string;
  Comprobante:Integer;

  Id_Identificacion:Integer;
  Id_Persona:string;



implementation

{$R *.dfm}

uses UnitGlobales, UnitDmGeneral, unitPantallaProgreso, SZCodeBaseX, UnitTipoImpresion;

procedure TFrmRealizarTraslado.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmRealizarTraslado.btnProcesarClick(Sender: TObject);
var
  Cadena:string;
  AStream:TStream;
  Root:TXmlNode;
  Nodo,Nodo1:TXmlNode;
  AgO,AgD, Size:Integer;
  Doc:string;
  Tipo:Integer;
  xml,xml1: TsdXmlDocument;
begin
        btnProcesar.Enabled := False;
        Application.ProcessMessages;


        if not ValidarDocumento then
        begin
              MessageDlg('Ese documento no tiene autorización de traslado',mtError,[mbOk],0);
              Exit;
        end;

        Tipo := EdTipoDocumento.KeyValue;
        AgD := Agencia;
        AgO := EdAgenciaOrigen.KeyValue;
        Doc := EdDocumento.Text;
        xml := TsdXmlDocument.Create;
        xml.EncodingString := 'iso-8859-1';
        Root := xml.Root;
        Root.Name := 'Traslado';
        Nodo := Root.NodeNew('registro');
        Nodo1 := Nodo.NodeNew('agenciad');
        Nodo1.ValueAsInteger := AgD;
        Nodo1 := nodo.NodeNew('agenciao');
        Nodo1.ValueAsInteger := AgO;
        Nodo1 := Nodo.NodeNew('tipo');
        Nodo1.ValueAsInteger := Tipo;
        Nodo1 := Nodo.NodeNew('id');
        Nodo1.ValueAsString := Doc;
        xml.SaveToFile('c:\traslado.xml');
        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select * from "gen$servidor" where ID_SERVICIO = :ID_SERVICIO');
        IBSQL1.SQL.Add('and ID_AGENCIA = :ID_AGENCIA');
        IBSQL1.ParamByName('ID_SERVICIO').AsInteger := 2;
        IBSQL1.ParamByName('ID_AGENCIA').AsInteger := AgO;
        try
         IBSQL1.ExecQuery;
        except
         IBSQL1.Transaction.Rollback;
         raise;
         Exit;
        end;

        IdTCPClient1.Host := IBSQL1.FieldByName('ID_HOST').AsString;
        IdTCPClient1.Port := IBSQL1.FieldByName('ID_PUERTO').AsInteger;

        with IdTCPClient1 do
        begin
            Connect;
            if Connected then
            begin
                frmProgreso := TfrmProgreso.Create(self);
                frmProgreso.Titulo := 'Recibiendo Información...';
                frmProgreso.InfoLabel := 'Kbs Recibidos';
                frmProgreso.Min := 0;
                frmProgreso.Ejecutar;
                Cadena := ReadLn();
                AStream := TMemoryStream.Create;
                xml.SaveToStream(AStream);
                AStream.Seek(0,soFromEnd);
                Size := AStream.Size;
                WriteInteger(Size,True);
                OpenWriteBuffer;
                WriteStream(AStream);
                CloseWriteBuffer;
                FreeAndNil(AStream);

                Size := ReadInteger;
                AStream := TMemoryStream.Create;
                ReadStream(AStream,Size,False);

                xml1 := TsdXmlDocument.Create;
                xml1.LoadFromStream(AStream);
                xml1.SaveToFile('C:\rTraslado.xml');
                Disconnect;
                frmProgreso.Cerrar;
                Insertar(AStream);
            end
            else
            begin
             MessageDlg('Imposible conectar con la oficina origen'+#13+
                        'Operación no realizada',mtError,[mbOk],0);
            end;
        end;


//        Insertar(AStream); // util solo para fines de pruebas

end;

procedure TFrmRealizarTraslado.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var
        paquete :Extended;
begin
          if AWorkMode = wmRead then
          begin
            frmProgreso.Position := AWorkCount;
            paquete := AWorkCount/1024;
            frmProgreso.InfoLabel := 'Kbs Recibidos : ' + Format('%4.0f',[paquete]);
            Application.ProcessMessages;
          end;
end;

procedure TFrmRealizarTraslado.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          if AWorkMode = wmRead then
          begin
            frmProgreso.Max := AWorkCountMax;
          end;
          frmProgreso.Titulo := 'Recibiendo Información... Tamaño: ' +  CurrToStr(AWorkCountMax/1024) + ' Kbs';
end;

procedure TFrmRealizarTraslado.Insertar(AStream:TStream);
var     i,j,h :Integer;
        tabla :string;
        sentencia :string;
        VBlob :Boolean;
        Reg :string;
        TotalDebito,TotalCredito :Currency;
        Consecutivo :Integer;
        Codigo:string;
        Valor:Currency;
        Contenido:string;
        tp:Integer;
        id:string;
        Asociado:string;
        Table:string;
        AgenciaT:Integer;
        New_Cta, Old_Cta,Old_Cta_Abono,Cta_Abono:Integer;
        Tp_Cta,Dg_Cta, Tp_Cta_Abono:Integer;
        OldTimeFormat,OldDateFormat,OldDateTimeFormat:string;
        nRegistro,nCampo: TJvSimpleXmlElem;
        fI,fO:string;
        tipo_p:Integer;
        docu_p:string;
        VReferencia,VInfPersona:Boolean;
        tipo_r:Integer;
        id_r:string ;
        csc_r:Integer;
        Contexto:string;
begin

        AgenciaT := Agencia;
        VBlob := False;

        OldDateFormat := ShortDateFormat;
        ShortDateFormat := 'yyyy/MM/dd';
        OldTimeFormat := LongTimeFormat;
        LongTimeFormat := 'HH:mm:ss';

        if IBTransaction3.InTransaction then
          IBTransaction3.Rollback;

        if IBTransaction4.InTransaction then
          IBTransaction4.Rollback;

        if IBTransaction2.InTransaction then
          IBTransaction2.Rollback;

        IBTransaction2.StartTransaction;


        AStream.Position := 0;  // uso normal
        xml.LoadFromStream(AStream); // uso normal

//        xml.LoadFromFile('C:\eje\rTraslado.xml');  // util solo para fines de pruebas

        tp := xml.Root.Properties.Item[0].IntValue;
        id := xml.Root.Properties.Item[1].Value;
        Asociado := xml.Root.Properties.Item[2].Value;

        Id_Identificacion := tp;
        Id_Persona := id;


        for i := 0 to xml.Root.Items.Count -1 do
        begin
          nRegistro := xml.Root.Items[i];
          st1.Caption := nRegistro.Properties.Item[0].Value;
          Table := st1.Caption;
          Application.ProcessMessages;
          if Table = 'cap$maestro' then
          begin
                IBInsertar.Close;
                IBInsertar.SQL.Clear;
                IBInsertar.SQL.Add('insert into "cap$maestro" values(');
                IBInsertar.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
                IBInsertar.SQL.Add(':DIGITO_CUENTA,:VALOR_INICIAL,:ID_FORMA,:FECHA_APERTURA,');
                IBInsertar.SQL.Add(':PLAZO_CUENTA,:TIPO_INTERES,:ID_INTERES,:TASA_EFECTIVA,');
                IBInsertar.SQL.Add(':PUNTOS_ADICIONALES,:MODALIDAD,:AMORTIZACION,:CUOTA,:CUOTA_CADA,');
                IBInsertar.SQL.Add(':ID_PLAN,:ID_ESTADO,:FECHA_VENCIMIENTO,:FECHA_ULTIMO_PAGO,');
                IBInsertar.SQL.Add(':FECHA_PROXIMO_PAGO,:FECHA_PRORROGA,:FECHA_VENCIMIENTO_PRORROGA,');
                IBInsertar.SQL.Add(':FECHA_SALDADA,:FIRMAS,:SELLOS,:PROTECTOGRAFOS,:ID_TIPO_CAPTACION_ABONO,');
                IBInsertar.SQL.Add(':NUMERO_CUENTA_ABONO');
                IBInsertar.SQL.Add(')');
                for j := 0 to nRegistro.Items.Count - 1 do
                begin
                  nCampo := nRegistro.Items[j];
                  Tp_Cta := nCampo.Items.Item[1].IntValue;
                  Old_Cta := nCampo.Items.Item[2].IntValue;
                  CdsCuentas.Open;
                  CdsCuentas.Filter := 'TIPO_CUENTA = ' + IntToStr(Tp_Cta) +
                                       ' AND NUMERO_CUENTA = ' + IntToStr(Old_Cta);
                  CdsCuentas.Filtered := True;
                  if CdsCuentas.RecordCount > 0 then
                   New_Cta := CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger
                  else
                   if Tp_Cta = 1 then
                   begin
                      Old_Cta := nCampo.Items.Item[2].IntValue;
                      New_Cta := ObtenerCaptacion(2,IBSQ);
                      // Guardar relación nueva cuenta de aportes
                      CdsCuentas.Append;
                      CdsCuentas.FieldByName('TIPO_CUENTA').AsInteger := 1;
                      CdsCuentas.FieldByName('NUMERO_CUENTA').AsInteger := Old_Cta;
                      CdsCuentas.FieldByName('N_TIPO_CUENTA').AsInteger := 1;
                      CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger := New_Cta;
                      CdsCuentas.Post;
                      // Guardar relación nueva cuenta de ahorros
                      CdsCuentas.Append;
                      CdsCuentas.FieldByName('TIPO_CUENTA').AsInteger := 2;
                      CdsCuentas.FieldByName('NUMERO_CUENTA').AsInteger := Old_Cta;
                      CdsCuentas.FieldByName('N_TIPO_CUENTA').AsInteger := 2;
                      CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger := New_Cta;
                      CdsCuentas.Post;
                   end
                   else
                   begin
                      if Tp_Cta <> 6 then begin
                        Old_Cta := nCampo.Items.Item[2].IntValue;
                        New_Cta := ObtenerCaptacion(Tp_Cta,IBSQ);
                      // Guardar relación nueva cuenta de aportes
                        CdsCuentas.Open;
                        CdsCuentas.Append;
                        CdsCuentas.FieldByName('TIPO_CUENTA').AsInteger := Tp_Cta;
                        CdsCuentas.FieldByName('NUMERO_CUENTA').AsInteger := Old_Cta;
                        CdsCuentas.FieldByName('N_TIPO_CUENTA').AsInteger := Tp_Cta;
                        CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger := New_Cta;
                        CdsCuentas.Post;
                        CdsCuentas.Close;
                      end
                      else
                      begin
                        New_Cta := Old_Cta;
                      // Guardar relación nueva cuenta de aportes
                        CdsCuentas.Open;
                        CdsCuentas.Append;
                        CdsCuentas.FieldByName('TIPO_CUENTA').AsInteger := Tp_Cta;
                        CdsCuentas.FieldByName('NUMERO_CUENTA').AsInteger := Old_Cta;
                        CdsCuentas.FieldByName('N_TIPO_CUENTA').AsInteger := Tp_Cta;
                        CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger := New_Cta;
                        CdsCuentas.Post;
                        CdsCuentas.Close;
                        Tp_Cta_Abono := nCampo.Items.Item[27].IntValue;
                        Old_Cta_Abono := nCampo.Items.Item[28].IntValue;
                        CdsCuentas.Open;
                        CdsCuentas.Filter := 'TIPO_CUENTA = ' + IntToStr(Tp_Cta_Abono) +
                                             ' AND NUMERO_CUENTA = ' + IntToStr(Old_Cta_Abono);
                        CdsCuentas.Filtered := True;
                        if CdsCuentas.RecordCount > 0 then
                        begin
                          Cta_Abono := CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger;
                        end
                        else
                        begin
                          ShowMessage('No se encontro la cuenta para el titular');
                        end;
                      end;
                   end; // del if Tp_Cta
// Grabar Registo
                   Dg_Cta := StrToInt(DigitoControl(Tp_Cta,Format('%.7d',[New_Cta])));
                   for h := 0 to nCampo.Items.Count - 1 do
                    begin
                     case h of
                       0: begin
                           IBInsertar.Params.Items[h].AsInteger := AgenciaT;
                          end;
                       1: begin
                           IBInsertar.Params.Items[h].AsInteger := Tp_Cta;
                          end;
                       2: begin
                           IBInsertar.Params.Items[h].AsInteger := New_Cta;
                          end;
                       3: begin
                           IBInsertar.Params.Items[h].AsInteger  := Dg_Cta;
                          end;
                      10: begin
                            if nCampo.Items.Item[h].Value = '' then
                              IBInsertar.Params.Items[h].AsFloat := 0
                            else
                             IBInsertar.Params.Items[h].AsFloat := StrToFloat(nCampo.Items.Item[h].Value);
                          end;
                      27:begin
                          IBInsertar.Params.Items[h].AsInteger := Tp_Cta_Abono;
                         end;
                      28:begin
                          IBInsertar.Params.Items[h].AsInteger := Cta_Abono;
                         end;
                      else
                          begin
                            Contexto := nCampo.Items.Item[h].Value;
                            if Contexto = '' then
                             if nCampo.Items.Item[h].Properties.ItemNamed['tipo'].Value = 'Date'
                               then Contexto := '1899/12/01'
                             else
                             if nCampo.Items.Item[h].Properties.ItemNamed['tipo'].Value <> 'String'
                               then Contexto := '0';
//                             else
//                             if nCampo.Items.Item[h].Properties.ItemNamed['tipo'].Value in ['Integer','Float','Currency','BCD']
//                              then Contexto := '0';

                            IBInsertar.Params.Items[h].AsString := Contexto;
                          end;
                     end;
                    end; // del for h
                    try
                     IBInsertar.ExecSQL;
//                     IBInsertar.Transaction.CommitRetaining;
                    except
                     IBInsertar.Transaction.Rollback;
                     raise;
                     Exit;
                    end;
                    CdsCuentas.Close;
                end; // del for j
// Finalizamos cap$maestro
          end  // del if table cap$maestro
          else
          if Table = 'cap$maestrotitular' then
          begin
           IBInsertar.Close;
           IBInsertar.SQL.Clear;
           IBInsertar.SQL.Add('insert into "cap$maestrotitular" values(');
           IBInsertar.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
           IBInsertar.SQL.Add(':DIGITO_CUENTA,:ID_IDENTIFICACION,:ID_PERSONA,');
           IBInsertar.SQL.Add(':NUMERO_TITULAR,:TIPO_TITULAR');
           IBInsertar.SQL.Add(')');
           for j := 0 to nRegistro.Items.Count -1 do
            begin
              nCampo := nRegistro.Items[j];
              Tp_Cta := nCampo.Items.Item[1].IntValue;
              Old_Cta := nCampo.Items.Item[2].IntValue;
              CdsCuentas.Open;
              CdsCuentas.Filter := 'TIPO_CUENTA = ' + IntToStr(Tp_Cta) +
                                   ' AND NUMERO_CUENTA = ' + IntToStr(Old_Cta);
              CdsCuentas.Filtered := True;
              if CdsCuentas.RecordCount > 0 then
              begin
                  New_Cta := CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger;
                  Dg_Cta := StrToInt(DigitoControl(Tp_Cta,Format('%.7d',[New_Cta])));
              end
              else
              begin
                ShowMessage('No se encontro la cuenta para el titular');
              end;

              for h := 0 to nCampo.Items.Count - 1 do
              case h of
               0: IBInsertar.Params.Items[h].AsInteger := AgenciaT;
               1: IBInsertar.Params.Items[h].AsInteger := Tp_Cta;
               2: IBInsertar.Params.Items[h].AsInteger := New_Cta;
               3: IBInsertar.Params.Items[h].AsInteger := Dg_Cta;
               else
                  IBInsertar.Params.Items[h].AsString := nCampo.Items.Item[h].Value;
              end; // del case

              try
                IBInsertar.ExecSQL;
//                IBInsertar.Transaction.CommitRetaining;
              except
                IBInsertar.Transaction.Rollback;
                raise;
                Exit;
              end;
              CdsCuentas.Close;
            end; // del for j
          end // del cap$maestrotitular
          else

          if Table = 'cap$extracto' then
          begin
           IBInsertar.Close;
           IBInsertar.SQL.Clear;
           IBInsertar.SQL.Add('insert into "cap$extracto" values(');
           IBInsertar.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
           IBInsertar.SQL.Add(':FECHA_MOVIMIENTO,:HORA_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
           IBInsertar.SQL.Add(':DOCUMENTO_MOVIMIENTO,:DESCRIPCION_MOVIMIENTO,');
           IBInsertar.SQL.Add(':VALOR_DEBITO,:VALOR_CREDITO');
           IBInsertar.SQL.Add(')');
           for j := 0 to nRegistro.Items.Count -1 do
            begin
              nCampo := nRegistro.Items[j];
              Tp_Cta := nCampo.Items.Item[1].IntValue;
              Old_Cta := nCampo.Items.Item[2].IntValue;
              CdsCuentas.Open;
              CdsCuentas.Filter := 'TIPO_CUENTA = ' + IntToStr(Tp_Cta) +
                                   ' AND NUMERO_CUENTA = ' + IntToStr(Old_Cta);
              CdsCuentas.Filtered := True;
              if CdsCuentas.RecordCount > 0 then
              begin
                  New_Cta := CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger;
                  Dg_Cta := StrToInt(DigitoControl(Tp_Cta,Format('%.7d',[New_Cta])));
              end
              else
              begin
                ShowMessage('No se encontro la cuenta para el titular');
                Exit;
              end;

              for h := 0 to nCampo.Items.Count - 1 do
              case h of
               0: IBInsertar.Params.Items[h].AsInteger := AgenciaT;
               1: IBInsertar.Params.Items[h].AsInteger := Tp_Cta;
               2: IBInsertar.Params.Items[h].AsInteger := New_Cta;
               3: IBInsertar.Params.Items[h].AsInteger := Dg_Cta;
               else
                  IBInsertar.Params.Items[h].AsString := nCampo.Items.Item[h].Value;
              end; // del case

              try
                IBInsertar.ExecSQL;
//                IBInsertar.Transaction.CommitRetaining;
              except
                IBInsertar.Transaction.Rollback;
                raise;
                Exit;
              end;
              CdsCuentas.Close;
            end; // del for j
          end // del cap$extracto
          else

          if Table = 'cap$tablaliquidacioncon' then
          begin
           IBInsertar.Close;
           IBInsertar.SQL.Clear;
           IBInsertar.SQL.Add('insert into "cap$tablaliquidacioncon" values(');
           IBInsertar.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
           IBInsertar.SQL.Add(':FECHA_DESCUENTO,:VALOR,:DESCONTADO');
           IBInsertar.SQL.Add(')');
           for j := 0 to nRegistro.Items.Count -1 do
            begin
              nCampo := nRegistro.Items[j];
              Tp_Cta := nCampo.Items.Item[1].IntValue;
              Old_Cta := nCampo.Items.Item[2].IntValue;
              CdsCuentas.Open;
              CdsCuentas.Filter := 'TIPO_CUENTA = ' + IntToStr(Tp_Cta) +
                                   ' AND NUMERO_CUENTA = ' + IntToStr(Old_Cta);
              CdsCuentas.Filtered := True;
              if CdsCuentas.RecordCount > 0 then
              begin
                  New_Cta := CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger;
                  Dg_Cta := StrToInt(DigitoControl(Tp_Cta,Format('%.7d',[New_Cta])));
              end
              else
              begin
                ShowMessage('No se encontro la cuenta para el titular');
                Exit;
              end;

              for h := 0 to nCampo.Items.Count - 1 do
              case h of
               0: IBInsertar.Params.Items[h].AsInteger := AgenciaT;
               1: IBInsertar.Params.Items[h].AsInteger := Tp_Cta;
               2: IBInsertar.Params.Items[h].AsInteger := New_Cta;
               3: IBInsertar.Params.Items[h].AsInteger := Dg_Cta;
               else
                  IBInsertar.Params.Items[h].AsString := nCampo.Items.Item[h].Value;
              end; // del case

              try
                IBInsertar.ExecSQL;
//                IBInsertar.Transaction.CommitRetaining;
              except
                IBInsertar.Transaction.Rollback;
                raise;
                Exit;
              end;
              CdsCuentas.Close;
            end; // del for j
          end // del cap$tablaliquidacioncon

          else
          if Table = 'cap$maestrosaldoinicial' then
          begin
           IBInsertar.Close;
           IBInsertar.SQL.Clear;
           IBInsertar.SQL.Add('insert into "cap$maestrosaldoinicial" values(');
           IBInsertar.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
           IBInsertar.SQL.Add(':ANO,:SALDO_INICIAL');
           IBInsertar.SQL.Add(')');
           for j := 0 to nRegistro.Items.Count -1 do
            begin
              nCampo := nRegistro.Items[j];
              Tp_Cta := nCampo.Items.Item[1].IntValue;
              Old_Cta := nCampo.Items.Item[2].IntValue;
              CdsCuentas.Open;
              CdsCuentas.Filter := 'TIPO_CUENTA = ' + IntToStr(Tp_Cta) +
                                   ' AND NUMERO_CUENTA = ' + IntToStr(Old_Cta);
              CdsCuentas.Filtered := True;
              if CdsCuentas.RecordCount > 0 then
              begin
                  New_Cta := CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger;
                  Dg_Cta := StrToInt(DigitoControl(Tp_Cta,Format('%.7d',[New_Cta])));
              end
              else
              begin
                ShowMessage('No se encontro la cuenta para el titular');
                Exit;
              end;

              for h := 0 to nCampo.Items.Count - 1 do
              case h of
               0: IBInsertar.Params.Items[h].AsInteger := AgenciaT;
               1: IBInsertar.Params.Items[h].AsInteger := Tp_Cta;
               2: IBInsertar.Params.Items[h].AsInteger := New_Cta;
               3: IBInsertar.Params.Items[h].AsInteger := Dg_Cta;
               else
                  IBInsertar.Params.Items[h].AsString := nCampo.Items.Item[h].Value;
              end; // del case

              try
                IBInsertar.ExecSQL;
//                IBInsertar.Transaction.CommitRetaining;
              except
                IBInsertar.Transaction.Rollback;
                raise;
                Exit;
              end;
              CdsCuentas.Close;
            end; // del for j
          end // del cap$maestrosaldoinicial
          else
          if Table = 'cap$saldosmes' then
          begin
           IBInsertar.Close;
           IBInsertar.SQL.Clear;
           IBInsertar.SQL.Add('insert into "cap$saldosmes" values(');
           IBInsertar.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
           IBInsertar.SQL.Add(':ANO,:MES,:SALDOINICIAL');
           IBInsertar.SQL.Add(')');
           for j := 0 to nRegistro.Items.Count -1 do
            begin
              nCampo := nRegistro.Items[j];
              Tp_Cta := nCampo.Items.Item[1].IntValue;
              Old_Cta := nCampo.Items.Item[2].IntValue;
              CdsCuentas.Open;
              CdsCuentas.Filter := 'TIPO_CUENTA = ' + IntToStr(Tp_Cta) +
                                   ' AND NUMERO_CUENTA = ' + IntToStr(Old_Cta);
              CdsCuentas.Filtered := True;
              if CdsCuentas.RecordCount > 0 then
              begin
                  New_Cta := CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger;
                  Dg_Cta := StrToInt(DigitoControl(Tp_Cta,Format('%.7d',[New_Cta])));
              end
              else
              begin
                ShowMessage('No se encontro la cuenta para el titular');
                Exit;
              end;

              for h := 0 to nCampo.Items.Count - 1 do
              case h of
               0: IBInsertar.Params.Items[h].AsInteger := AgenciaT;
               1: IBInsertar.Params.Items[h].AsInteger := Tp_Cta;
               2: IBInsertar.Params.Items[h].AsInteger := New_Cta;
               3: IBInsertar.Params.Items[h].AsInteger := Dg_Cta;
               else
                  IBInsertar.Params.Items[h].AsString := nCampo.Items.Item[h].Value;
              end; // del case

              try
                IBInsertar.ExecSQL;
//                IBInsertar.Transaction.CommitRetaining;
              except
                IBInsertar.Transaction.Rollback;
                raise;
                Exit;
              end;
              CdsCuentas.Close;
            end; // del for j
          end // del cap$saldosmes
          else
          if Table = 'cap$maestrosaldosmes' then
          begin
           IBInsertar.Close;
           IBInsertar.SQL.Clear;
           IBInsertar.SQL.Add('insert into "cap$maestrosaldosmes" values(');
           IBInsertar.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
           IBInsertar.SQL.Add(':MES,:DEBITO,:CREDITO');
           IBInsertar.SQL.Add(')');
           for j := 0 to nRegistro.Items.Count -1 do
            begin
              nCampo := nRegistro.Items[j];
              Tp_Cta := nCampo.Items.Item[1].IntValue;
              Old_Cta := nCampo.Items.Item[2].IntValue;
              CdsCuentas.Open;
              CdsCuentas.Filter := 'TIPO_CUENTA = ' + IntToStr(Tp_Cta) +
                                   ' AND NUMERO_CUENTA = ' + IntToStr(Old_Cta);
              CdsCuentas.Filtered := True;
              if CdsCuentas.RecordCount > 0 then
              begin
                  New_Cta := CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger;
                  Dg_Cta := StrToInt(DigitoControl(Tp_Cta,Format('%.7d',[New_Cta])));
              end
              else
              begin
                ShowMessage('No se encontro la cuenta para el titular');
                Exit;
              end;

              for h := 0 to nCampo.Items.Count - 1 do
              case h of
               0: IBInsertar.Params.Items[h].AsInteger := AgenciaT;
               1: IBInsertar.Params.Items[h].AsInteger := Tp_Cta;
               2: IBInsertar.Params.Items[h].AsInteger := New_Cta;
               3: IBInsertar.Params.Items[h].AsInteger := Dg_Cta;
               else
                  IBInsertar.Params.Items[h].AsString := nCampo.Items.Item[h].Value;
              end; // del case

              try
                IBInsertar.ExecSQL;
//                IBInsertar.Transaction.CommitRetaining;
              except
                IBInsertar.Transaction.Rollback;
                raise;
                Exit;
              end;
              CdsCuentas.Close;
            end; // del for j
          end // del cap$maestrosaldomes
          else
          if Table = 'cap$maestrosapertura' then
          begin
           IBInsertar.Close;
           IBInsertar.SQL.Clear;
           IBInsertar.SQL.Add('insert into "cap$maestrosapertura" values(');
           IBInsertar.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
           IBInsertar.SQL.Add(':FECHA,:HORA,:EFECTIVO,:CHEQUE');
           IBInsertar.SQL.Add(')');
           for j := 0 to nRegistro.Items.Count -1 do
            begin
              nCampo := nRegistro.Items[j];
              Tp_Cta := nCampo.Items.Item[1].IntValue;
              Old_Cta := nCampo.Items.Item[2].IntValue;
              CdsCuentas.Open;
              CdsCuentas.Filter := 'TIPO_CUENTA = ' + IntToStr(Tp_Cta) +
                                   ' AND NUMERO_CUENTA = ' + IntToStr(Old_Cta);
              CdsCuentas.Filtered := True;
              if CdsCuentas.RecordCount > 0 then
              begin
                  New_Cta := CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger;
                  Dg_Cta := StrToInt(DigitoControl(Tp_Cta,Format('%.7d',[New_Cta])));
              end
              else
              begin
                ShowMessage('No se encontro la cuenta para el titular');
                Exit;
              end;

              for h := 0 to nCampo.Items.Count - 1 do
              case h of
               0: IBInsertar.Params.Items[h].AsInteger := AgenciaT;
               1: IBInsertar.Params.Items[h].AsInteger := Tp_Cta;
               2: IBInsertar.Params.Items[h].AsInteger := New_Cta;
               3: IBInsertar.Params.Items[h].AsInteger := Dg_Cta;
               else
                  IBInsertar.Params.Items[h].AsString := nCampo.Items.Item[h].Value;
              end; // del case

              try
                IBInsertar.ExecSQL;
//                IBInsertar.Transaction.CommitRetaining;
              except
                IBInsertar.Transaction.Rollback;
                raise;
                Exit;
              end;
              CdsCuentas.Close;
            end; // del for j
          end  // del cap$maestroapertura
          else
          if Table = 'col$colocacion' then
          begin
             IBInsertar.Close;
             IBInsertar.SQL.Clear;
             IBInsertar.SQL.Add('insert into "col$colocacion" values(');
             IBInsertar.SQL.Add(':ID_AGENCIA,');
             IBInsertar.SQL.Add(':ID_COLOCACION,');
             IBInsertar.SQL.Add(':ID_IDENTIFICACION,');
             IBInsertar.SQL.Add(':ID_PERSONA,');
             IBInsertar.SQL.Add(':ID_CLASIFICACION,');
             IBInsertar.SQL.Add(':ID_LINEA,');
             IBInsertar.SQL.Add(':ID_INVERSION,');
             IBInsertar.SQL.Add(':ID_RESPALDO,');
             IBInsertar.SQL.Add(':ID_GARANTIA,');
             IBInsertar.SQL.Add(':ID_CATEGORIA,');
             IBInsertar.SQL.Add(':ID_EVALUACION,');
             IBInsertar.SQL.Add(':FECHA_DESEMBOLSO,');
             IBInsertar.SQL.Add(':VALOR_DESEMBOLSO,');
             IBInsertar.SQL.Add(':PLAZO_COLOCACION,');
             IBInsertar.SQL.Add(':FECHA_VENCIMIENTO,');
             IBInsertar.SQL.Add(':TIPO_INTERES,');
             IBInsertar.SQL.Add(':ID_INTERES,');
             IBInsertar.SQL.Add(':TASA_INTERES_CORRIENTE,');
             IBInsertar.SQL.Add(':TASA_INTERES_MORA,');
             IBInsertar.SQL.Add(':PUNTOS_INTERES,');
             IBInsertar.SQL.Add(':ID_TIPO_CUOTA,');
             IBInsertar.SQL.Add(':AMORTIZA_CAPITAL,');
             IBInsertar.SQL.Add(':AMORTIZA_INTERES,');
             IBInsertar.SQL.Add(':PERIODO_GRACIA,');
             IBInsertar.SQL.Add(':DIAS_PRORROGADOS,');
             IBInsertar.SQL.Add(':VALOR_CUOTA,');
             IBInsertar.SQL.Add(':ABONOS_CAPITAL,');
             IBInsertar.SQL.Add(':FECHA_CAPITAL,');
             IBInsertar.SQL.Add(':FECHA_INTERES,');
             IBInsertar.SQL.Add(':ID_ESTADO_COLOCACION,');
             IBInsertar.SQL.Add(':ID_ENTE_APROBADOR,');
             IBInsertar.SQL.Add(':ID_EMPLEADO,');
             IBInsertar.SQL.Add(':NOTA_CONTABLE,');
             IBInsertar.SQL.Add(':NUMERO_CUENTA,');
             IBInsertar.SQL.Add(':ES_ANORMAL,');
             IBInsertar.SQL.Add(':DIAS_PAGO,');
             IBInsertar.SQL.Add(':RECIPROCIDAD,');
             IBInsertar.SQL.Add(':FECHA_SALDADO');
             IBInsertar.SQL.Add(')');
           for j := 0 to nRegistro.Items.Count -1 do
            begin
              nCampo := nRegistro.Items[j];
              if not nCampo.Items.Item[29].IntValue in [2,3] then
              begin
                Tp_Cta := 1;
                Old_Cta := nCampo.Items.Item[33].IntValue;
                CdsCuentas.Open;
                CdsCuentas.Filter := 'TIPO_CUENTA = 1' +
                                     ' AND NUMERO_CUENTA = ' + IntToStr(Old_Cta);
                CdsCuentas.Filtered := True;
                if CdsCuentas.RecordCount > 0 then
                begin
                    New_Cta := CdsCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger;
                end
                else
                begin
                  ShowMessage('No se encontro la cuenta para el titular');
                end
              end
              else
              begin
                  New_Cta := 0;
              end;

              for h := 0 to nCampo.Items.Count - 1 do
              case h of
               33: IBInsertar.Params.Items[h].AsInteger := New_Cta;
               else
                  IBInsertar.Params.Items[h].AsString := nCampo.Items.Item[h].Value;
              end; // del case

              try
                IBInsertar.ExecSQL;
//                IBInsertar.Transaction.CommitRetaining;
              except
                IBInsertar.Transaction.Rollback;
                raise;
                Exit;
              end;
              CdsCuentas.Close;
            end; // del for j
          end // del col$colocacion
          else
          if ((Table <> 'con$auxiliar')) then
          begin

            if ((Table = 'gen$persona')) then
             VBlob := True
            else
             VBlob := False;

            if ((Table = 'gen$referencias')) then
             VReferencia := True
            else
             VReferencia := False;

            if ((Table = 'gen$infpersona')) then
             VInfPersona := True
            else
             VInfPersona := False;

            tabla := 'insert into "' + nRegistro.Properties.Item[0].Value + '" values(';
            for j := 0 to nRegistro.Items.Count -1 do
            begin
              nCampo := nRegistro.Items[j];
              Application.ProcessMessages;
              for h := 0 to nCampo.Items.Count -1 do
              begin
                Contenido := ncampo.Items.Item[h].Value;
                Application.ProcessMessages;
                if h = 0 then
                 if ncampo.Items.Item[h].Value = '' then
                    sentencia := 'NULL'
                 else
                    sentencia := '''' + Contenido + ''''
                else
                 try
                  if (Contenido = '') or (nCampo.Items.Item[h].Properties.Value('Tipo') = 'Blob') then
                      sentencia := sentencia + ',NULL'
                  else
                      sentencia := sentencia + ',' + '''' + Contenido + '''';
                 except;
                     ShowMessage(sentencia);
                 end;
              end;
//              Memo1.Lines.Add(#13 + #13);
//              Memo1.Lines.Add(tabla + sentencia + ')');

              with IBInsertar do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add(tabla + sentencia + ')');
                    if VBlob then
                    begin
                      tipo_p  := ncampo.Items.Item[0].IntValue;
                      docu_p  := ncampo.Items.Item[1].Value;
                      if not ValidarPersona(tipo_p,docu_p) then
                      try
                        ExecSQL;
                        Close;
                        SQL.Clear;
                        SQL.Add('update "gen$persona" set FOTO = :FOTO, FIRMA = :FIRMA, FOTO_HUELLA = :FOTO_HUELLA, DATOS_HUELLA = :DATOS_HUELLA where ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :ID_PERSONA');
                        ParamByName('ID_IDENTIFICACION').AsInteger := ncampo.Items.Item[0].IntValue;
                        ParamByName('ID_PERSONA').AsString := nCampo.Items.Item[1].Value;
                        fO := SZDecodeBase64(nCampo.Items.Item[53].Value);
                        ParamByName('FOTO').AsBlob := fO;
                        fO := SZDecodeBase64(nCampo.Items.Item[54].Value);
                        ParamByName('FIRMA').AsBlob := fO;
                        fO := SZDecodeBase64(nCampo.Items.Item[59].Value);
                        ParamByName('FOTO_HUELLA').AsBlob := fO;
                        fO := SZDecodeBase64(nCampo.Items.Item[60].Value);
                        ParamByName('DATOS_HUELLA').AsBlob := fO;
                        try
                          ExecSQL;
                        finally
                        end;
//                        Transaction.CommitRetaining;
//                      ShowMessage(tabla + sentencia );
                      finally
                      end;
                    end
                    else
                    begin
                         if VReferencia then
                         begin
                           tipo_r := nCampo.Items.Item[0].IntValue;
                           id_r   := nCampo.Items.Item[1].Value;
                           csc_r  := nCampo.Items.Item[2].IntValue;
                           if not ValidarReferencia(tipo_r,id_r,csc_r) then
                           try
                             ExecSQL;
                           except
                             Transaction.Rollback;
                             raise;
                             Exit;
                           end;
                         end
                         else
                         if VInfPersona then
                         begin
                           tipo_p := nCampo.Items.Item[0].IntValue;
                           docu_p := nCampo.Items.Item[1].Value;
                           if not ValidarInfPersona(tipo_p,docu_p) then
                           try
                             ExecSQL;
                           except
                             Transaction.Rollback;
                             raise;
                             Exit;
                           end;
                         end
                         else
                         try
                          ExecSQL;
                         except
                            on E: EIBInterBaseError do
                              MmResumen.Lines.Add('Error al registrar tabla:'+Table);
                            else
                              Application.HandleException(Self);
                           // end;
//                          Transaction.Rollback;
//                          raise;
//                          Exit;
                         end;
                    end;
              end; // del with IBInsertar
              sentencia := '';
             end; // del for j
            end
            else
            if ((nRegistro.Properties.Item[0].Value = 'con$auxiliar')) then
            begin
              TotalDebito := 0;
              TotalCredito := 0;
              Consecutivo := ObtenerConsecutivo(IBSQ,4);

// Almacenar Comprobante en Ceros
              sentencia := 'insert into "con$comprobante" values (';
              sentencia := sentencia + IntToStr(Consecutivo) + ','+ IntToStr(AgenciaT) + ',';
              sentencia := sentencia + '2,'''+ DateToStr(fFechaActual)+''',';
              sentencia := sentencia + '''Traslado de productos del Asociado Identificado con Documento: '+ id + ''',0,0,';
              sentencia := sentencia + '''O'',0,'' '',''' + DBAlias + ''')';

              with IBInsertar do
              begin
                Close;
                SQL.Clear;
                SQL.Add(sentencia);
                try
                  ExecSQL;
//                  Transaction.CommitRetaining;
                except
                   Transaction.Rollback;
                   raise;
                   Exit;
//                      ShowMessage(tabla + sentencia );
                end; // del try
              end; // del begin with

// Almacenar Datos Auxiliar
              Comprobante := Consecutivo;
              Comp := Format('%.7d',[Consecutivo]);

              tabla := 'insert into "' + nRegistro.Properties.Item[0].Value + '" values(';

              for j := 0 to nRegistro.Items.Count - 1 do
              begin
                 Application.ProcessMessages;
                 nCampo := nRegistro.Items[j];
                 // asignar los valores a variables
                   Codigo :=  nCampo.Items.Item[0].Value;
                   Valor := StrToCurr(nCampo.Items.Item[1].Value);

                   if Valor > 0 then
                   begin
                     TotalDebito := TotalDebito  + Valor;
                     sentencia :=  Comp + ',' +
                                   IntToStr(AgenciaT) + ',''' +
                                   DateToStr(fFechaActual) + ''',' +
                                   Codigo + ',' +
                                   CurrToStr(Valor)  + ',' +
                                   '0' + ',' +
                                   'NULL' + ',' +
                                   'NULL' + ',' +
                                   '0' + ',' +
                                   'NULL' + ',' +
                                   '0' + ',' +
                                   '0' + ',' +
                                   '''O''';
                   end
                   else
                   begin
                     TotalCredito := TotalCredito + -Valor;
                     sentencia :=  Comp + ',' +
                                   IntToStr(AgenciaT) + ',''' +
                                   DateToStr(fFechaActual) + ''',' +
                                   Codigo + ',' +
                                   '0' + ',' +
                                   CurrToStr(-Valor)  + ',' +
                                   'NULL' + ',' +
                                   'NULL' + ',' +
                                   '0' + ',' +
                                   'NULL' + ',' +
                                   '0' + ',' +
                                   '0' + ',' +
                                   '''O''';
                   end;
//                 ShowMessage(sentencia);
//                 Memo1.Lines.Add(#13 + #13);
//                 Memo1.Lines.Add(tabla + sentencia + ')');

                 with IBInsertar do
                 begin
                    Close;
                    SQL.Clear;
                    SQL.Add(tabla + sentencia + ')');
                    try
                      ExecSQL;
//                      Transaction.CommitRetaining;
                    except
                      Transaction.Rollback;
                      raise;
                      Exit;
//                      ShowMessage(tabla + sentencia );
                    end; // del try
                 end; // del begin
                 sentencia := '';
              end; // fin del begin for j

// Actualizar saldos del comprobante
              tabla := 'update "con$comprobante" set TOTAL_DEBITO = ' +
                        CurrToStr(TotalDebito) + ', TOTAL_CREDITO = ' +
                        CurrToStr(TotalCredito);
              tabla := tabla + ' where ID_COMPROBANTE = ' + Comp;

              with IBInsertar do
              begin
                Close;
                SQL.Clear;
                SQL.Add(tabla);
                try
                  ExecSQL;
//                  Transaction.CommitRetaining;
                except
                   Transaction.Rollback;
                   raise;
                   Exit;
//                      ShowMessage(tabla + sentencia );
                end; // del try
              end; // del begin with

           end;

        end; // del For xml
        IBInsertar.Transaction.Commit;

// Actualizar tras$trasladocaptacion
        with IBInsertar do begin
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('insert into "tras$trasladocaptacion" values (');
           SQL.Add(':ID_IDENTIFICACION,:ID_PERSONA,:ID_AGENCIA_O,');
           SQL.Add(':ID_TIPO_CAPTACION_O,:NUMERO_CUENTA_O,:DIGITO_CUENTA_O,');
           SQL.Add(':ID_AGENCIA_D,:ID_TIPO_CAPTACION_D,:NUMERO_CUENTA_D,:DIGITO_CUENTA_D');
           SQL.Add(')');
           ParamByName('ID_IDENTIFICACION').AsInteger := EdTipoDocumento.KeyValue;
           ParamByName('ID_PERSONA').AsString := EdDocumento.Text;
           ParamByName('ID_AGENCIA_O').AsInteger := EdAgenciaOrigen.KeyValue;
           CDSCuentas.Open;
           CDSCuentas.Filter := '';
           CDSCuentas.Filtered := False;
           CDSCuentas.First;
           while not CDSCuentas.Eof do begin
                ParamByName('ID_TIPO_CAPTACION_O').AsInteger := CDSCuentas.FieldByName('TIPO_CUENTA').AsInteger;
                ParamByName('NUMERO_CUENTA_O').AsInteger := CDSCuentas.FieldByName('NUMERO_CUENTA').AsInteger;
                ParamByName('DIGITO_CUENTA_O').AsInteger := StrToInt(
                                                             DigitoControl(
                                                              CDSCuentas.FieldByName('TIPO_CUENTA').AsInteger,
                                                              Format('%.7d',[CDSCuentas.FieldByName('NUMERO_CUENTA').AsInteger])));
                ParamByName('ID_AGENCIA_D').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION_D').AsInteger := CDSCuentas.FieldByName('N_TIPO_CUENTA').AsInteger;
                ParamByName('NUMERO_CUENTA_D').AsInteger := CDSCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger;
                ParamByName('DIGITO_CUENTA_D').AsInteger :=StrToInt(
                                                             DigitoControl(
                                                              CDSCuentas.FieldByName('N_TIPO_CUENTA').AsInteger,
                                                              Format('%.7d',[CDSCuentas.FieldByName('N_NUMERO_CUENTA').AsInteger])));
                try
                  ExecSQL;
                finally
                  Close;
                end;
                CDSCuentas.Next;
           end; // del while
           Transaction.Commit;
        end; // del with
// Fin Actualizacion traslado captación        
        MarcarDocumento;
        ShowMessage('Proceso de Inserción culminado con exito!');
end;

function TFrmRealizarTraslado.FldToStr(const Value : TFieldType) : String;
begin
   Case Value of
   ftUnknown    :  FldToStr := 'Unknown';
   ftString     :  FldToStr := 'String';
   ftSmallint   :  FldToStr := 'SmallInt';
   ftInteger    :  FldToStr := 'Integer';
   ftWord       :  FldToStr := 'Word';
   ftBoolean    :  FldToStr := 'Boolean';
   ftFloat      :  FldToStr := 'Float';
   ftCurrency   :  FldToStr := 'Currency';
   ftBCD        :  FldToStr := 'BCD';
   ftDate       :  FldToStr := 'Date';
   ftTime       :  FldToStr := 'Time';
   ftDateTime   :  FldToStr := 'DateTime';
   ftBytes      :  FldToStr := 'Bytes';
   ftVarBytes   :  FldToStr := 'VarBytes';
   ftAutoInc    :  FldToStr := 'AutoInc';
   ftBlob       :  FldToStr := 'Blob';
   ftMemo       :  FldToStr := 'Memo';
   ftGraphic    :  FldToStr := 'Graphic';
   ftFmtMemo    :  FldToStr := 'FmtMemo';
   ftParadoxOle :  FldToStr := 'ParadoxOle';
   ftDBaseOle   :  FldToStr := 'DBaseOle';
   ftTypedBinary: FldToStr := 'TypedBinary';
   ftCursor     :  FldToStr := 'Cursor';
   ftFixedChar  :  FldToStr := 'FixedChar';
   ftWideString :  FldToStr := 'WideString';
   ftLargeint   :  FldToStr := 'LargeInt';
   ftADT        :  FldToStr := 'ADT';
   ftArray      :  FldToStr := 'Array';
   ftReference  :  FldToStr := 'Reference';
   ftDataSet    :  FldToStr := 'DataSet';
   ftOraBlob    :  FldToStr := 'OraBlob';
   ftOraClob    :  FldToStr := 'OraClob';
   ftVariant    :  FldToStr := 'Variant';
   ftInterface  :  FldToStr := 'Interface';
   ftIDispatch  :  FldToStr := 'IDispatch';
   ftGuid       :  FldToStr := 'GUID';
   ftTimeStamp  :  FldToStr := 'TimeStamp';
   ftFMTBcd     :  FldToStr := 'FMTBcd';
   end;
end;


procedure TFrmRealizarTraslado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmRealizarTraslado.Inicializar;
begin
        if IBQAgencia.Transaction.InTransaction then
            IBQAgencia.Transaction.Rollback;

        IBQAgencia.Transaction.StartTransaction;
        IBQAgencia.Close;
        IBQAgencia.SQL.Clear;
        IBQAgencia.SQL.Add('select * from "gen$agencia" order by ID_AGENCIA');
        IBQAgencia.Open;
        IBQAgencia.Last;

        IBQTipos.Close;
        IBQTipos.SQL.Clear;
        IBQTipos.SQL.Add('select * from "gen$tiposidentificacion" order by ID_IDENTIFICACION');
        IBQTipos.Open;
        IBQTipos.Last;

        EdAgenciaOrigen.KeyValue := -1;
        EdTipoDocumento.KeyValue := -1;
        EdDocumento.Text := '';
        st1.Caption := '';
        btnImprimir.Enabled := False;

end;

procedure TFrmRealizarTraslado.btnOtroClick(Sender: TObject);
begin
        Inicializar;
        btnProcesar.Enabled := True;
        EdAgenciaOrigen.SetFocus;
end;

function TFrmRealizarTraslado.ValidarDocumento: Boolean;
begin
        with IBSQ do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select CONSECUTIVO,DESCRIPCION from "tras$registro"');
          SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION');
          SQL.Add('and ID_PERSONA = :ID_PERSONA');
          SQL.Add('and ESTADO = 2');
          ParamByName('ID_IDENTIFICACION').AsInteger := EdTipoDocumento.KeyValue;
          ParamByName('ID_PERSONA').AsString := EdDocumento.Text;
          try
           ExecQuery;
           if IBSQ.RecordCount > 0 then
             Result := True
           else
             Result := False;
          except
           Result := False;
           Transaction.Rollback;
           raise;
          end;
        end;

end;

procedure TFrmRealizarTraslado.FormShow(Sender: TObject);
begin
   Inicializar;
end;

procedure TFrmRealizarTraslado.MarcarDocumento;
begin
        with IBSQ do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('update "tras$registro"');
          SQL.Add('set ESTADO = 4, ID_EMPLEADO_TRASLADO = :ID_EMPLEADO, COMPROBANTE = :COMPROBANTE');
          SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION');
          SQL.Add('and ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := Id_Identificacion;
          ParamByName('ID_PERSONA').AsString := Id_Persona;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          ParamByName('COMPROBANTE').AsInteger := Comprobante;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
          end;
        end;
        IBSQ.Transaction.Commit;
        btnImprimir.Enabled := True;
        btnImprimir.Click;
end;

procedure TFrmRealizarTraslado.btnImprimirClick(Sender: TObject);
var
anulacion : string;
Tabla : String;
frmTipoImpresion:TfrmTipoImpresion;
begin
        with IBAuxiliar do begin
         if  Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Empleado;
        
         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
         try
          Open;
          frmTipoImpresion := TfrmTipoImpresion.Create(Self);
          if frmTipoImpresion.ShowModal = mrOk then
          begin
             case frmTipoImpresion.TipoImpresion of
             0: begin
                 Report1.Variables.ByName['EMPRESA'].AsString := Empresa;
                 Report1.Variables.ByName['NIT'].AsString := Nit;
                 if Report1.PrepareReport then
                 Report1.PreviewPreparedReport(True);
                end;
             1: begin
                 prReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
                 prReport1.Variables.ByName['NIT'].AsString := Nit;
                 prReport1.Variables.ByName['FechaHoy'].AsDateTime := fFechaActual;
                 if PrReport1.PrepareReport then
                 prReport1.PreviewPreparedReport(True);
                end;
             end;
          end;
         except
          MessageDlg('Error al generar el reporte',mtError,[mbcancel],0);
          raise;
         end;
        end;
end;

procedure TFrmRealizarTraslado.Report1InitDetailBandDataSet(
  Sender: TObject; DetailBand: TprBand; DataSet: TObject;
  const DataSetName: String);
begin
        if DataSetName = 'IBAuxiliar1' then begin
          with IBAuxiliar1 do begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := IBAuxiliar.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := IBAuxiliar.FieldByName('ID_PERSONA').AsString;
            try
             Open;
            except
             raise;
            end;
          end;
        end;

end;

procedure TFrmRealizarTraslado.prReport1InitDetailBandDataSet(
  Sender: TObject; DetailBand: TprBand; DataSet: TObject;
  const DataSetName: String);
begin
        if DataSetName = 'IBAuxiliar1' then begin
          with IBAuxiliar1 do begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := IBAuxiliar.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := IBAuxiliar.FieldByName('ID_PERSONA').AsString;
            try
             Open;
            except
             raise;
            end;
          end;
        end;

end;

procedure TFrmRealizarTraslado.prReport1PrintComplete(Sender: TObject);
begin
      with IBInsertar do
       begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Close;
         sql.Clear;
         sql.Add('update "con$comprobante" set ');
         sql.Add('"con$comprobante"."IMPRESO" = :"IMPRESO"');
         sql.Add(' where ');
         sql.Add('"con$comprobante"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         sql.Add('"con$comprobante"."ID_AGENCIA" = :"ID_AGENCIA"');

         ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('IMPRESO').AsInteger  := 1;
         ExecSQL;
         Transaction.Commit;
       end;

end;

procedure TFrmRealizarTraslado.Report1PrintComplete(Sender: TObject);
begin
      with IBInsertar do
       begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Close;
         sql.Clear;
         sql.Add('update "con$comprobante" set ');
         sql.Add('"con$comprobante"."IMPRESO" = :"IMPRESO"');
         sql.Add(' where ');
         sql.Add('"con$comprobante"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         sql.Add('"con$comprobante"."ID_AGENCIA" = :"ID_AGENCIA"');

         ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('IMPRESO').AsInteger  := 1;
         ExecSQL;
         Transaction.Commit;
       end;

end;

function TFrmRealizarTraslado.ValidarPersona(tp: integer;
  id: string): Boolean;
begin
//
        with IBSQL2 do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select COUNT(*) AS TOTAL from "gen$persona"');
          SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION');
          SQL.Add('and');
          SQL.Add('ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := tp;
          ParamByName('ID_PERSONA').AsString := id;
          try
           ExecQuery;
           if FieldByName('TOTAL').AsInteger > 0 then
             Result := True
           else
             Result := False;
          except
           Result := False;
          end;
          Close;
         end;
end;

function TFrmRealizarTraslado.ValidarReferencia(tipo_r: integer;
  id_r: string; csc_r: integer): boolean;
begin
        with IBSQL2 do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select COUNT(*) AS TOTAL from "gen$referencias"');
          SQL.Add('where TIPO_ID_REFERENCIA = :TIPO_R');
          SQL.Add('and');
          SQL.Add('ID_REFERENCIA = :ID_R');
          SQL.Add('and');
          SQL.Add('CONSECUTIVO_REFERENCIA = :CSC_R');
          ParamByName('TIPO_R').AsInteger := tipo_r;
          ParamByName('ID_R').AsString := id_r;
          ParamByName('CSC_R').AsInteger := csc_r;
          try
           ExecQuery;
           if FieldByName('TOTAL').AsInteger > 0 then
             Result := True
           else
             Result := False;
          except
           Result := False;
          end;
          Close;
         end;

end;

function TFrmRealizarTraslado.ValidarInfPersona(tp: integer;
  id: string): Boolean;
begin
//
        with IBSQL2 do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select COUNT(*) AS TOTAL from "gen$infpersona"');
          SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION');
          SQL.Add('and');
          SQL.Add('ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := tp;
          ParamByName('ID_PERSONA').AsString := id;
          try
           ExecQuery;
           if FieldByName('TOTAL').AsInteger > 0 then
             Result := True
           else
             Result := False;
          except
           Result := False;
          end;
          Close;
         end;
end;

end.
