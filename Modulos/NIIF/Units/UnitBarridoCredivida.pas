unit UnitBarridoCredivida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBClient, StdCtrls, Buttons, IBSQL,
  IBCustomDataSet, IBQuery, IBStoredProc,DateUtils,jcldatetime, DBCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, sdXmlDocuments,
  JvStaticText, IBDatabase, FR_Class, FR_DSet, FR_DBSet, Math, pr_Common,
  pr_TxClasses;

type

  TFrmBarridoCredivida = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DScredivida: TDataSource;
    DBcredivida: TClientDataSet;
    DBcredividanombre: TStringField;
    DBcredividacuenta: TIntegerField;
    DBcredividadg: TIntegerField;
    DBcredividavalor: TCurrencyField;
    DBcredividadescontar: TBooleanField;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    bAplica: TBitBtn;
    IBSQL1: TIBSQL;
    IBQuery1: TIBQuery;
    IBProc: TIBStoredProc;
    Label2: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBcredividaid_persona: TStringField;
    DBcredividadireccion: TStringField;
    DBcredividatelefono: TStringField;
    DBcredividaciudad: TStringField;
    DBcredividaciudad_nacimiento: TStringField;
    DBcredividafecha_nacimiento: TDateField;
    IdTCPClient1: TIdTCPClient;
    DBcredividafecha: TDateField;
    DBcredividaDias: TIntegerField;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Jv1: TJvStaticText;
    jV2: TJvStaticText;
    CDbeneficiarios: TClientDataSet;
    CDbeneficiariosnombre: TStringField;
    CDbeneficiariosporciento: TCurrencyField;
    CDbeneficiariosparentesco: TIntegerField;
    CDbeneficiariosid_persona: TStringField;
    DBcredividaid_identificacion: TSmallintField;
    CdControl: TClientDataSet;
    CdControlid_persona: TStringField;
    CdControlid_identificacion: TIntegerField;
    IBTransaction1: TIBTransaction;
    CdOtro: TClientDataSet;
    CdDescuento: TClientDataSet;
    CdDescuentoid_persona: TStringField;
    CdDescuentoid_identificacion: TSmallintField;
    CdDescuentonombre: TStringField;
    CdDescuentocuenta: TIntegerField;
    CdDescuentodg: TSmallintField;
    CdDescuentopoliza: TIntegerField;
    CdOtroid_identificacion: TSmallintField;
    CdOtroid_persona: TStringField;
    CdOtronombre: TStringField;
    CdOtrocuenta: TIntegerField;
    CdOtrodg: TSmallintField;
    CdOtrodescripcion: TStringField;
    CdOtroagencia: TSmallintField;
    Panel3: TPanel;
    BtNo: TBitBtn;
    BtRe: TBitBtn;
    BitBtn4: TBitBtn;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    CdDescuentoagencia: TSmallintField;
    BNota: TBitBtn;
    IBSQL2: TIBSQL;
    IBtipo: TIBQuery;
    IBAuxiliar: TIBQuery;
    Report1: TprTxReport;
    IBAuxiliar1: TIBQuery;
    frDBDataSet2: TfrDBDataSet;
    CdDescuentofecha: TDateField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bAplicaClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtReClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure Report1InitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure BtNoClick(Sender: TObject);
    procedure BNotaClick(Sender: TObject);
  private
  vCrediVida,vGravamen :Currency;
  vNotaContable :Integer;
  vEmpleado :string;
  vIdentificacion :Integer;
  vId_Comprobante :Integer;
  vContador :Integer;
  vMensaje :string;
    procedure ahorros(numero_cuenta, digito: Integer;consecutivo :string);
    function vCred(vP: string; vI: integer): integer;
    function vDisp(cuenta, dg: integer): currency;
    procedure imprimir_reporte(cadena: string);
    function Busca(vP: string; vI: integer): string;
    function contabilizar: boolean;
    procedure auxiliar(Vcodigo, Vid_persona: string; Vcuenta,
      Vid_identificacion: integer; Vvalor: Currency; Vtipo: Boolean);
    function BuscarCodigo(id: integer): string;
    procedure extracto(cuenta, dg, consecutivo: integer;
      descripcion: string; valor: currency);
    procedure ActComprobante;
    procedure reporte(consecutivo: integer);
    procedure ActTabla;
    { Private declarations }
  public
    { Public declarations }
  end;
                         
var
  FrmBarridoCredivida: TFrmBarridoCredivida;

implementation
uses UnitGlobales, UnitPantallaProgreso, UnitImpresion, unitMain;

{$R *.dfm}

procedure TFrmBarridoCredivida.BitBtn1Click(Sender: TObject);
var     vSaldo :Currency;
        direccion,telefono,ciudad :string;
        vFecha :TDate;
        vDias :Integer;
        vCon1,vCon2 :Integer;
        vNumero :Integer;
begin
        vCon1 := 0;
        vCon2 := 0;
        DBcredivida.CancelUpdates;
        CdControl.CancelUpdates;
        CdOtro.CancelUpdates;
        CdDescuento.CancelUpdates;
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$minimos".VALOR_MINIMO');
          SQL.Add('FROM');
          SQL.Add('"gen$minimos"');
          SQL.Add('WHERE');
          SQL.Add('("gen$minimos".ID_MINIMO = 5)');
          Open;
          vCrediVida := FieldByName('VALOR_MINIMO').AsCurrency;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$minimos".VALOR_MINIMO');
          SQL.Add('FROM');
          SQL.Add('"gen$minimos"');
          SQL.Add('WHERE');
          SQL.Add('("gen$minimos".ID_MINIMO = 12)');
          Open;
          vGravamen := FieldByName('VALOR_MINIMO').AsCurrency / 1000;
          Label2.Visible := True;
          Label2.Caption := 'Valor Credivida : $' + FormatCurr('#,#',vCrediVida);
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          SQL.Add('"col$credivida".NUMERO_CUENTA,');
          SQL.Add('"col$credivida".DG_CUENTA,"col$credivida".FECHA_VENCIMIENTO');
          SQL.Add('FROM');
          SQL.Add('"cap$maestrotitular"');
          SQL.Add('INNER JOIN "col$credivida" ON ("cap$maestrotitular".NUMERO_CUENTA="col$credivida".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="col$credivida".DG_CUENTA)');
          SQL.Add('WHERE');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 2) AND ("cap$maestrotitular".NUMERO_TITULAR = 1) AND ');
          SQL.Add('("col$credivida".APLICADO = 0) AND ("col$credivida".FECHA_VENCIMIENTO < :FECHA)');
          ParamByName('FECHA').AsDate := fFechaActual;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('No Existen Credividas Vencidos a la Fecha',mtInformation,[mbok],0);
            Exit;
          end;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(self);
          frmProgreso.Titulo := 'Barrido de Credividas. Registros Encontrados : ' + IntToStr(RecordCount);
          frmProgreso.Max := RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
             frmProgreso.Position := RecNo;
             frmProgreso.InfoLabel := 'Registro Número : ' + IntToStr(RecNo);
             Application.ProcessMessages;
             vFecha := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
             vDias := DaysBetween(fFechaActual,vFecha);
             if ( vDias > 60) then
             begin
               vCon1 := vCon1 + 1;
             end
             else
             begin
               vSaldo := vdisp(FieldByName('NUMERO_CUENTA').AsInteger,FieldByName('DG_CUENTA').AsInteger);
               IBSQL1.Close;
               IBSQL1.SQL.Clear;
               IBSQL1.SQL.Add('SELECT ');
               IBSQL1.SQL.Add('"gen$direccion".MUNICIPIO,');
               IBSQL1.SQL.Add('"gen$direccion".DIRECCION,');
               IBSQL1.SQL.Add('"gen$direccion".TELEFONO1');
               IBSQL1.SQL.Add('FROM');
               IBSQL1.SQL.Add('"gen$direccion"');
               IBSQL1.SQL.Add('WHERE');
               IBSQL1.SQL.Add('("gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
               IBSQL1.SQL.Add('("gen$direccion".ID_PERSONA = :ID_PERSONA) AND ');
               IBSQL1.SQL.Add('("gen$direccion".ID_DIRECCION = 1)');
               IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
               IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
               IBSQL1.ExecQuery;
               direccion := IBSQL1.FieldByName('DIRECCION').AsString;
               telefono := IBSQL1.FieldByName('TELEFONO1').AsString;
               ciudad := IBSQL1.FieldByName('MUNICIPIO').AsString;
               IBSQL1.Close;
               IBSQL1.SQL.Clear;
               IBSQL1.SQL.Add('SELECT NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,FECHA_NACIMIENTO,LUGAR_NACIMIENTO FROM "gen$persona" WHERE ID_PERSONA = :ID_PERSONA AND ID_IDENTIFICACION = :ID_IDENTIFICACION');
               IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
               IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
               IBSQL1.ExecQuery;
               DBcredivida.Append;
               DBcredivida.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
               DBcredivida.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
               DBcredivida.FieldValues['nombre'] := IBSQL1.FieldByName('NOMBRE').AsString + ' ' + IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString;
               DBcredivida.FieldValues['cuenta'] := FieldByName('NUMERO_CUENTA').AsInteger;
               DBcredivida.FieldValues['dg'] := FieldByName('DG_CUENTA').AsInteger;
               DBcredivida.FieldValues['valor'] := vSaldo;
               DBcredivida.FieldValues['direccion'] := direccion;
               DBcredivida.FieldValues['telefono'] := telefono;
               DBcredivida.FieldValues['ciudad'] := ciudad;
               DBcredivida.FieldValues['ciudad_nacimiento'] := IBSQL1.FieldByName('LUGAR_NACIMIENTO').AsString;
               DBcredivida.FieldValues['fecha_nacimiento'] := IBSQL1.FieldByName('FECHA_NACIMIENTO').AsDateTime;
               DBcredivida.FieldValues['fecha'] := vfecha;
               DBcredivida.FieldValues['dias'] := vDias;
               vNumero := vcred(FieldByName('ID_PERSONA').AsString,fieldbyname('ID_IDENTIFICACION').AsInteger);
               CdControl.Append;
               CdControl.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
               CdControl.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
               CdControl.Post;
               IBSQL1.Close;
               IBSQL1.SQL.Clear;
               IBSQL1.SQL.Add('SELECT *');
               IBSQL1.SQL.Add('FROM');
               IBSQL1.SQL.Add(' "gen$beneficiario"');
               IBSQL1.SQL.Add('WHERE');
               IBSQL1.SQL.Add('("gen$beneficiario".ID_PERSONA = :ID_PERSONA) AND ');
               IBSQL1.SQL.Add('("gen$beneficiario".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
               IBSQL1.SQL.Add('("gen$beneficiario".AUXILIO = 0)');
               IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
               IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
               IBSQL1.ExecQuery;
               if IBSQL1.RecordCount = 0 then
               begin
                   CDbeneficiarios.Append;
                   CDbeneficiarios.FieldValues['nombre'] := 'LOS DE LEY';
                   CDbeneficiarios.FieldValues['porciento'] := '100';
                   CDbeneficiarios.FieldValues['parentesco'] := 0;
                   CDbeneficiarios.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
                   CDbeneficiarios.Post;
               end
               else
               begin
                 while not IBSQL1.Eof do
                 begin
                   CDbeneficiarios.Append;
                   CDbeneficiarios.FieldValues['nombre'] := IBSQL1.FieldByName('NOMBRE').AsString + ' ' + IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString;
                   CDbeneficiarios.FieldValues['porciento'] := IBSQL1.FieldByName('PORCENTAJE').AsCurrency;
                   CDbeneficiarios.FieldValues['parentesco'] := IBSQL1.FieldByName('ID_PARENTESCO').AsString;
                   CDbeneficiarios.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
                   CDbeneficiarios.Post;
                   IBSQL1.Next;
                 end;
               end;
               if vSaldo > (vCrediVida * vNumero)  then
               begin
                 DBcredivida.FieldValues['descontar'] := True;
                 vCon2 := vCon2 + 1;
               end
               else
               begin
                 DBcredivida.FieldValues['descontar'] := False;
                 vCon1 := vCon1 + 1;
               end;
               DBcredivida.Post;
             end;
             Next;
          end;
          frmProgreso.Cerrar;
          BitBtn1.Enabled := False;
        end;
        if vCon2 > 0 then
           bAplica.Enabled := True;
        Jv1.Caption := IntToStr(vCon1 + vCon2);
        Jv2.Caption := IntToStr(vCon2);
end;

procedure TFrmBarridoCredivida.DBGrid1ColExit(Sender: TObject);
begin
 if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False

end;

procedure TFrmBarridoCredivida.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);  
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
     DBCheckBox1.Left := Rect.Left + DBGrid1.Left + 2;
     DBCheckBox1.Top := Rect.Top + DBGrid1.top + 2;
     DBCheckBox1.Width := Rect.Right - Rect.Left;
     DBCheckBox1.Height := Rect.Bottom - Rect.Top;
     DBCheckBox1.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      DBGrid1.Canvas.FillRect(Rect);
      DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFrmBarridoCredivida.bAplicaClick(Sender: TObject);
var     v_certificado: string;
        XmlDoc, Rdoc :TsdXmlDocument;
        Nodo,Nodo1: TXmlNode;
        vContador :Integer;
        AStream :TStringStream;
        tamano :Integer;
        i, vDg,vCuenta :Integer;
        vPoliza :string;
        vDocumento :string;
        vRetorno :string;
        vTexto :string;
        vDisponible :Currency;
        vFecha :TDate;
begin
        if MessageDlg('Esta Seguro de Realizar la Transaccion',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        bAplica.Enabled := False;
        vContador := 0;
        Empleado;
        vEmpleado := Nombres + ' ' + Apellidos;
        with IBQuery1 DO
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
        end;
        with DBcredivida do //inicio dbcredivida
        begin
          Filtered := False;
          Filter := 'descontar = false';
          Filtered := True;
          while not eof do
          begin
            CdOtro.Append;
            CdOtro.FieldValues['id_identificacion'] :=  FieldByName('id_identificacion').AsInteger;
            CdOtro.FieldValues['id_persona'] := FieldByName('id_persona').AsString;
            CdOtro.FieldValues['nombre'] := FieldByName('nombre').AsString;
            CdOtro.FieldValues['dg'] := FieldByName('dg').AsInteger;
            CdOtro.FieldValues['cuenta'] := FieldByName('cuenta').AsInteger;
            CdOtro.FieldValues['agencia'] := Agencia;
            CdOtro.FieldValues['descripcion'] := 'Saldo Insuficiente en Ahorros';
            CdOtro.Post;
            Next;
          end;
          Filtered := False;
          Filter := 'descontar = True';
          Filtered := True;
          vContador := RecordCount;
          if vContador <> 0 then // inicio validacion si es descuento
          begin
            XmlDoc := TsdXmlDocument.CreateName('equivida');
            XmlDoc.EncodingString := 'ISO8859-1';
            XmlDoc.XmlFormat := xfReadable;
            nodo1 := XmlDoc.Root.NodeNew('Tipo');
            nodo1.WriteInteger('Opcion',1);
            nodo1 := XmlDoc.Root.NodeNew('Asociados');
             while not Eof do //inicio primer while
            begin
              with Nodo do
              begin
                Nodo := nodo1.NodeNew('Asociado');
                WriteInteger('id',FieldByName('id_identificacion').AsInteger);
                WriteString('cedula',FieldByName('id_persona').AsString);
                WriteString('nombre',FieldByName('nombre').AsString);
                WriteString('direccion',FieldByName('direccion').AsString);
                WriteString('telefono',FieldByName('telefono').AsString);
                WriteString('ciudad',FieldByName('Ciudad').AsString);
                WriteString('ciudad_nacimiento',FieldByName('ciudad_nacimiento').AsString);
                WriteString('fecha_nacimiento',FormatDateTime('dd/mm/yyyy',FieldByName('fecha_nacimiento').AsDateTime));
                WriteDateTime('fechav',FieldByName('fecha').AsDateTime);
                WriteInteger('dg',FieldByName('dg').AsInteger);
                WriteInteger('cuenta',FieldByName('cuenta').AsInteger);
              end; // fin nodo
              Next;
            end; //fin del primer while
              Filtered := False;
             with CDbeneficiarios do //inicio cdbeneficiarios
             begin
               if RecordCount > 0 then
                  nodo1 := XmlDoc.Root.NodeNew('Beneficiarios');
               First;
               while not Eof do
               begin
                  with Nodo do
                  begin
                    Nodo := nodo1.NodeNew('beneficiario');
                    WriteString('cedula',FieldByName('id_persona').AsString);
                    WriteString('nombre',FieldByName('nombre').AsString);
                    WriteFloat('porciento',FieldByName('porciento').AsCurrency);
                    WriteInteger('parentesco',FieldByName('parentesco').AsInteger);
                  end;
                  Next;
               end;
             end; // fin beneficiarios
             AStream := TStringStream.Create('');
             XmlDoc.SaveToStream(AStream);
//inicio de la transferencia del stream
             with IdTCPClient1 do
             begin
               Host := host_equivida;
               Port := puerto_barrido;
             try
               Connect;
             except
             begin
               MessageDlg('Error en la Conexión',mtInformation,[mbok],0);
               Exit;
             end;
             end;
             if Connected then
             begin
               WriteInteger(AStream.Size);
               OpenWriteBuffer;
               WriteStream(AStream);
               CloseWriteBuffer;
               tamano := ReadInteger;
               AStream := TStringStream.Create('');
               ReadStream(AStream,tamano,False);
               RDoc := TsdXmlDocument.Create;
               RDoc.LoadFromStream(AStream);
               Disconnect;
            end; // valida la conexxion
           end; // fin del tcp client
           Nodo := Rdoc.Root.NodeByName('ERROR');
           if Nodo.ReadString('ERROR') = 'V' then
           begin
             MessageDlg('Ha Ocurrido un Error en el Servidor de Credividas con Mensaje :' + #13 + Nodo.ReadString('MENSAJE') + #13 + 'Favor Informar a la Seccion de Sistemas',mtError,[mbok],0);
             Exit;
           end;
            Nodo1 := Rdoc.Root.NodeByName('salidas');
            for i := 0 to Nodo1.NodeCount -1 do
            begin
              vIdentificacion := Nodo1.Nodes[i].ReadInteger('id_identificacion');
              vDocumento := Nodo1.Nodes[i].ReadString('id_persona');
              vPoliza := Nodo1.Nodes[i].ReadString('poliza');
              vTexto := Nodo1.Nodes[i].ReadString('texto');
              vRetorno := Nodo1.Nodes[i].ReadString('estado');
              vDg := Nodo1.Nodes[i].ReadInteger('dg');
              vCuenta := Nodo1.Nodes[i].ReadInteger('cuenta');
              vFecha := Nodo1.Nodes[i].ReadDateTime('fecha');
              if vRetorno = 'T' then
              begin
                 vDisponible := vdisp(vCuenta,vDg);
                 if vDisponible > vCrediVida then
                 begin
                   CdDescuento.Append;
                   CdDescuento.FieldValues['id_identificacion'] :=  vIdentificacion;
                   CdDescuento.FieldValues['id_persona'] := vDocumento;
                   CdDescuento.FieldValues['nombre'] := busca(vDocumento,vIdentificacion);
                   CdDescuento.FieldValues['dg'] := vDg;
                   CdDescuento.FieldValues['cuenta'] := vCuenta;
                   CdDescuento.FieldValues['agencia'] := Agencia;
                   CdDescuento.FieldValues['poliza'] := vpoliza;
                   CdDescuento.FieldValues['fecha'] := vFecha;
                   CdDescuento.Post;
                   vContador := vContador +1;
                 end
                 else
                 begin
                   CdOtro.Append;
                   CdOtro.FieldValues['id_identificacion'] :=  vIdentificacion;
                   CdOtro.FieldValues['id_persona'] := vDocumento;
                   CdOtro.FieldValues['nombre'] := busca(vDocumento,vIdentificacion);
                   CdOtro.FieldValues['dg'] := vDg;
                   CdOtro.FieldValues['cuenta'] := vCuenta;
                   CdOtro.FieldValues['agencia'] := Agencia;
                   CdOtro.FieldValues['descripcion'] := 'Saldo Insuficiente en Ahorros ';
                   CdOtro.Post;
                 end;
              end
              else
              begin
                CdOtro.Append;
                CdOtro.FieldValues['id_identificacion'] :=  vIdentificacion;
                CdOtro.FieldValues['id_persona'] := vDocumento;
                CdOtro.FieldValues['nombre'] := busca(vDocumento,vIdentificacion);
                CdOtro.FieldValues['dg'] := vDg;
                CdOtro.FieldValues['cuenta'] := vCuenta;
                CdOtro.FieldValues['agencia'] := Agencia;
                CdOtro.FieldValues['descripcion'] := vTexto;
                CdOtro.Post;
              end;
            end;
            if CdDescuento.RecordCount <= 0 then
            begin
              MessageDlg('No Existen Crédividas por Renovar...',mtInformation,[mbok],0);
              Btre.Enabled := True;
              DBcredivida.Filtered := False;
              Exit;
            end;
            if contabilizar then
            begin
              MessageDlg('Contabilizacion Realizada con Exito',mtInformation,[mbok],0);
              reporte(vId_Comprobante);
              ActTabla;
            end
            else
            begin
              MessageDlg('No se Pudo Realizar la Contabilización Favor Verifique...',mtError,[mbok],0);
            end;
            DBcredivida.Filtered := False;
            BtRe.Enabled := True;
            BtNo.Enabled := True;
            BNota.Enabled := True;
          end
          else //fin del valida credividas a descontar
              MessageDlg('No existen Credividas por Renovar...',mtinformation,[mbok],0);
          end; // fin del valida recorcount;
end;

procedure TFrmBarridoCredivida.BitBtn4Click(Sender: TObject);
var   a:Integer;
begin
        Close;
end;

procedure TFrmBarridoCredivida.ahorros(numero_cuenta, digito: Integer;consecutivo :string);
begin
          with IBQuery1 do
           begin
             SQL.Clear;
             SQL.Add('insert into "cap$extracto" values(');
             SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
             SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
             SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
             SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
             ParamByName('NUMERO_CUENTA').AsInteger := numero_cuenta;
             ParamByName('DIGITO_CUENTA').AsInteger := digito;
             ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
             ParamByName('HORA_MOVIMIENTO').AsTime := Time;
             ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
             ParamByName('DOCUMENTO_MOVIMIENTO').AsString := IntToStr(vNotaContable);
             ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'RETIRO POR BARRIDO CREDIVIDA No. ' + consecutivo;
             ParamByName('VALOR_DEBITO').AsCurrency := 0;
             ParamByName('VALOR_CREDITO').AsCurrency := vCrediVida;
             try
               ExecSQL;
               Transaction.CommitRetaining;
             except
             begin
               MessageDlg('Error Retirando de Ahorros',mtError,[mbok],0);
               Exit;
             end;
             end;
             Close;
           end;
end;

procedure TFrmBarridoCredivida.FormCreate(Sender: TObject);
begin
        Label1.Caption := Label1.Caption + '     Fecha Actual : ' + DateToStr(fFechaActual);
        Jv1.Caption := '0';
        jV2.Caption := '0';

end;

function TFrmBarridoCredivida.vCred(vP: string; vI: integer): integer;
var     a :Integer;
        filtro :string;
begin
        filtro := 'id_persona = ' + '''' + vP + '''' + ' and id_identificacion = ' + IntToStr(vI);
        with CdControl do
        begin
           Filtered := False;
           Filter := filtro;
           Filtered := True;
           a := RecordCount;
           Result := a + 1;
           Filtered := False;
        end;

end;

function TFrmBarridoCredivida.vDisp(cuenta, dg: integer): currency;
begin
        with IBProc do
        begin
          Transaction.CommitRetaining;
          Prepare;
          Params[1].AsInteger := Agencia;
          Params[2].AsInteger := 2;
          Params[3].AsInteger := cuenta;
          Params[4].AsInteger := dg;
          Params[5].AsInteger := YearOfDate(fFechaActual);
          Params[6].AsDateTime := EncodeDate(YearOf(fFechaActual),01,01);
          Params[7].AsDateTime := EncodeDate(YearOf(fFechaActual),12,31);
          ExecProc;
          Result := Params[0].AsCurrency;
        end;
end;

procedure TFrmBarridoCredivida.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmBarridoCredivida.BtReClick(Sender: TObject);
begin
        imprimir_reporte(frmMain.ruta1 + '\reporte\RepNo.frf');
end;

procedure TFrmBarridoCredivida.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'empleado' then
           ParValue := vEmpleado;
end;

function TFrmBarridoCredivida.Busca(vP: string; vI: integer): string;
var     filtro :string;
begin
        filtro := 'id_persona = ' + '''' + vP + '''' + ' and id_identificacion = ' + IntToStr(vI);
        with DBcredivida do
        begin
          Filtered := False;
          filter := filtro;
          Filtered := True;
          Result := FieldByName('nombre').AsString;
        end;
end;

function TFrmBarridoCredivida.contabilizar: Boolean;
var     vTotalCredivida :Currency;
        vTotalGmf :Currency;
        vGmf :Currency;
        vDescripcion :string;
        codCredivida, codRindediario, codOperacion, codImpuestos :string;
begin
        vTotalCredivida := 0;
        vGmf := 0;
        vTotalGmf := 0;
        codCredivida := buscarcodigo(14);
        codRindediario := buscarcodigo(8);
        codOperacion := buscarcodigo(19);
        codImpuestos := buscarcodigo(20);
        Result := True;
        vId_Comprobante := ObtenerConsecutivo(IBSQL1,1);
        with IBQuery1 do
        begin
          try
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
            SQL.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
            SQL.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
            SQL.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
            SQL.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
            SQL.Add('"con$comprobante"."ANULACION","con$comprobante".ID_EMPLEADO)');
            SQL.Add('values (');
            SQL.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
            SQL.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
            SQL.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION",:ID_EMPLEADO)');
            ParamByName('ID_COMPROBANTE').AsInteger := vid_comprobante;
            ParamByname('FECHADIA').AsDate := fFechaActual;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
            ParamByName('DESCRIPCION').AsBlob := 'Retiro Cuentas de Ahorro Ren. Credividas';
            ParamByName('TOTAL_DEBITO').AsCurrency  := 0;
            ParamByName('TOTAL_CREDITO').AsCurrency  := 0;
            ParamByName('ESTADO').AsString  := 'O';
            ParamByname('ANULACION').asstring := '';
            ParamByName('IMPRESO').AsInteger  := Ord(false);
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ExecSQL;
          except
          on e: Exception do
          begin
            Result := False;
            Transaction.Rollback;
            vMensaje := e.Message;
            Exit;
          end;
          end;
        end; // FIN DEL IBQUERY1
        with CdDescuento do
        begin
           First;
           while not Eof do
           begin
              try
                vGmf := SimpleRoundTo((vCrediVida * vGravamen),0);
                vTotalGmf := SimpleRoundTo((vTotalGmf + vGmf),0);
                vTotalCredivida := SimpleRoundTo((vTotalCredivida + vCrediVida),0);
                auxiliar(codRindediario,FieldByName('id_persona').AsString,FieldByName('cuenta').AsInteger,FieldByName('id_identificacion').AsInteger,vCrediVida,True);
                vDescripcion := 'Desc. Renovación Credivida No. ' + FieldByName('poliza').AsString;
                extracto(FieldByName('cuenta').AsInteger,FieldByName('dg').AsInteger,vId_Comprobante,vDescripcion,vCrediVida);
                Next;
              except
              on e: Exception do
              begin
                vMensaje := e.Message;
                Result := False;
                Exit;
                IBQuery1.Transaction.Rollback;
              end;
              end;
            end;
         end; // FIN DEL DESCUENTO
         try
           auxiliar(codCredivida,'',0,0,vTotalCredivida,False);
           auxiliar(codOperacion,'',0,0,vTotalGmf,False);
           auxiliar(codImpuestos,'',0,0,vTotalGmf,True);
         except
         on e: Exception do
         begin
           IBQuery1.Transaction.Rollback;
           Result := False;
           vMensaje := e.Message;
           Exit;
         end;
         end;
         if IBQuery1.Transaction.InTransaction then
            IBQuery1.Transaction.Commit;
         IBQuery1.Transaction.StartTransaction;
         ActComprobante;
end;

procedure TFrmBarridoCredivida.auxiliar(Vcodigo, Vid_persona: string;
  Vcuenta, Vid_identificacion: integer; Vvalor: Currency; Vtipo: Boolean);
begin
            with IBQuery1 do
            begin
              SQL.Clear;
              SQL.Add('insert into "con$auxiliar" values (');
              SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
              SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
              SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
              ParamByName('ID_COMPROBANTE').AsInteger := vid_comprobante;
              ParamByName('ID_AGENCIA').AsInteger:= Agencia;
              ParamByName('FECHA').AsDate := fFechaActual;
              ParamByName('CODIGO').AsString := Vcodigo;
              if Vtipo then
              begin
                 ParamByName('DEBITO').AsCurrency := SimpleRoundTo(Vvalor,0);
                 ParamByName('CREDITO').AsCurrency := 0;
              end
              else
              begin
                 ParamByName('CREDITO').AsCurrency := SimpleRoundTo(Vvalor,0);
                 ParamByName('DEBITO').AsCurrency := 0;
              end;
              if Vcuenta = 0 then
                 ParamByName('ID_CUENTA').Clear
              else
                 ParamByName('ID_CUENTA').AsInteger := Vcuenta;
              ParamByName('ID_COLOCACION').Clear;
              ParamByName('ID_IDENTIFICACION').AsInteger := Vid_identificacion;
              ParamByName('ID_PERSONA').AsString := Vid_persona;
              ParamByName('MONTO_RETENCION').AsCurrency := 0;
              ParamByName('TASA_RETENCION').AsFloat := 0;
              ParamByName('ESTADOAUX').AsString := 'O';
              ExecSQL;
            end;

end;

function TFrmBarridoCredivida.BuscarCodigo(id: integer): string;
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT CODIGO FROM "col$codigospucbasicos"');
          SQL.Add('WHERE (ID_CODIGOPUCBASICO = :ID)');
          ParamByName('ID').AsInteger := id;
          Open;
          Result := FieldByName('CODIGO').AsString;
        end;
end;

procedure TFrmBarridoCredivida.extracto(cuenta, dg, consecutivo: integer;
  descripcion: string; valor: currency);
begin
            with IBQuery1 do
            begin
             SQL.Clear;
             SQL.Add('insert into "cap$extracto" values(');
             SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
             SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
             SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
             SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
             ParamByName('NUMERO_CUENTA').AsInteger := cuenta;
             ParamByName('DIGITO_CUENTA').AsInteger := dg;
             ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
             ParamByName('HORA_MOVIMIENTO').AsTime := Time;
             ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
             ParamByName('DOCUMENTO_MOVIMIENTO').AsString := FormatCurr('000000',consecutivo);
             ParamByName('DESCRIPCION_MOVIMIENTO').AsString := descripcion;
             ParamByName('VALOR_DEBITO').AsCurrency := 0;
             ParamByName('VALOR_CREDITO').AsCurrency := valor;
             ExecSQL;
            end;
end;

procedure TFrmBarridoCredivida.ActComprobante;
var     vDebito,vCredito :Currency;
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select sum(DEBITO) as DEBITO,sum(CREDITO) as CREDITO');
          SQL.Add('from "con$auxiliar" where ID_COMPROBANTE = :ID');
          ParamByName('ID').AsInteger := vId_Comprobante;
          Open;
          vDebito := FieldByName('DEBITO').AsCurrency;
          vCredito := FieldByName('CREDITO').AsCurrency;
          Close;
          SQL.Clear;
          SQL.Add('update "con$comprobante" set TOTAL_DEBITO = :DEBITO,TOTAL_CREDITO = :CREDITO');
          SQL.Add('where ID_COMPROBANTE = :ID');
          ParamByName('DEBITO').AsCurrency := vDebito;
          ParamByName('CREDITO').AsCurrency := vCredito;
          ParamByName('ID').AsInteger := vId_Comprobante;
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
        end;
end;

procedure TFrmBarridoCredivida.reporte(consecutivo: integer);
begin
        with IBAuxiliar do
        begin
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := consecutivo;
         Open;
        end;
        Report1.Variables.ByName['EMPRESA'].AsString := Empresa;
        Report1.Variables.ByName['NIT'].AsString := Nit;
        if Report1.PrepareReport then
           Report1.PreviewPreparedReport(True);


end;

procedure TFrmBarridoCredivida.Report1InitDetailBandDataSet(
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

procedure TFrmBarridoCredivida.BtNoClick(Sender: TObject);
begin
        imprimir_reporte(frmMain.ruta1 + '\reporte\RepRe.frf');
end;

procedure TFrmBarridoCredivida.BNotaClick(Sender: TObject);
begin
        reporte(vId_Comprobante);
end;

procedure TFrmBarridoCredivida.ActTabla;
var     Vhora :ttime;
begin
        Vhora := Time;
        with CdDescuento do
        begin
          First;
          while not Eof do
          begin
            IBQuery1.SQL.Clear;
            IBQuery1.SQL.Add('update "col$credivida" set');
            IBQuery1.SQL.Add('APLICADO = 1,DESCONTADO = 1,');
            IBQuery1.SQL.Add('ID_EMPLEADO´= :ID_EMPLEADO,');
            IBQuery1.SQL.Add('NOTA_CONTABLE = :NOTA,');
            IBQuery1.SQL.Add('CONSECUTIVO = :POLIZA,');
            IBQuery1.SQL.Add('FECHA_APLICADO = :FECHA,');
            IBQuery1.SQL.Add('HORA_APLICADO = :HORA');
            IBQuery1.SQL.Add('where NUMERO_CUENTA = :CUENTA and');
            IBQuery1.SQL.Add('DG_CUENTA = :DG and');
            IBQuery1.SQL.Add('FECHA_VENCIMIENTO = :FECHAV');
            IBQuery1.ParamByName('ID_EMPLEADO').AsString := DBAlias;
            IBQuery1.ParamByName('NOTA').AsInteger := vId_Comprobante;
            IBQuery1.ParamByName('POLIZA').AsString := FieldByName('POLIZA').AsString;
            IBQuery1.ParamByName('FECHA').AsDateTime := fFechaActual;
            IBQuery1.ParamByName('HORA').AsDateTime := Vhora;
            IBQuery1.ParamByName('FECHAV').AsDateTime := FieldByName('fecha').AsDateTime;
            IBQuery1.ParamByName('CUENTA').AsInteger := FieldByName('cuenta').AsInteger;
            IBQuery1.ParamByName('DG').AsInteger := FieldByName('dg').AsInteger;
            IBQuery1.ExecSQL;
            Next;
          end;
          IBQuery1.Transaction.Commit;
        end;
end;

end.
