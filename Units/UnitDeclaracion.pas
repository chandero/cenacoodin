unit UnitDeclaracion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FR_Class, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, ComCtrls, DBClient, DateUtils, FR_DSet, FR_DBSet,
  FR_Shape, Grids, DBGrids;
type TPersonaData = Record
        Documento:string;
        PrimerApellido:string;
        SegundoApellido:string;
        Nombre:string;
        Direccion :string;
        Telefono :string;
        Existe:Boolean;
        ExisteDirecion :Boolean;
end;

type
  TFrmDeclaracion = class(TForm)
    frReport1: TfrReport;
    PageControl1: TPageControl;
    TabOperacion: TTabSheet;
    TabBuscar: TTabSheet;
    GrpCertificadoAutoriza: TGroupBox;
    Label42: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    EdTo: TLabel;
    EdIreccion: TLabel;
    EdDocumento: TEdit;
    EdprimerAp: TEdit;
    EdSegundoAp: TEdit;
    EdNombre: TEdit;
    EdTelefono: TEdit;
    EdDireccion: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdDocumentoTit: TEdit;
    EdPrimerApTit: TEdit;
    EdSegundoApTit: TEdit;
    EdNombreTit: TEdit;
    EdTelTit: TEdit;
    EdDireccionTit: TEdit;
    GroupBox2: TGroupBox;
    EdObservacion: TEdit;
    GroupBox3: TGroupBox;
    EdOrigen: TEdit;
    Panel1: TPanel;
    BitAplicar: TBitBtn;
    BitCerrar: TBitBtn;
    BitReporte: TBitBtn;
    CdReporte: TClientDataSet;
    CdReporteCIUDAD: TStringField;
    CdReporteHORA: TStringField;
    CdReporteDIA: TStringField;
    CdReporteMES: TStringField;
    CdReporteANO: TStringField;
    CdReporteCODOPERACION: TStringField;
    CdReporteNUMEROCUENTA: TStringField;
    CdReporteTITULO: TStringField;
    CdReporteVALOR: TCurrencyField;
    CdReporteNOMBRE: TStringField;
    CdReporteIDENTIFICACION: TStringField;
    CdReporteTELEFONO: TStringField;
    CdReporteDIRECCION: TStringField;
    CdReporteNOMBRET: TStringField;
    CdReporteIDENTIFICACIONT: TStringField;
    CdReporteDIRECCIONT: TStringField;
    CdReporteTELEFONOT: TStringField;
    CdReporteOBSERVACION: TStringField;
    CdReporteORIGEN: TStringField;
    CdReporteEMPLEADO: TStringField;
    frDBDataSet1: TfrDBDataSet;
    frShapeObject1: TfrShapeObject;
    Panel2: TPanel;
    Label7: TLabel;
    EdNumeroCuenta: TEdit;
    Label8: TLabel;
    DFecha: TDateTimePicker;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ChTodos: TCheckBox;
    IBQuery1: TIBQuery;
    Bitlimpiar: TBitBtn;
    procedure BitAplicarClick(Sender: TObject);
    procedure EdDocumentoExit(Sender: TObject);
    procedure EdDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitReporteClick(Sender: TObject);
    procedure BitCerrarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitlimpiarClick(Sender: TObject);
  private
   _bExisteDireccion :Boolean;
   _bExistePersona :Boolean;
   _iConsecutivo :Integer;
    function ValidarPersona(DocumentoUsuario: string;_iIdPersona:Integer): TPersonaData;
    function GuardarPersona(PersonaData: TPersonaData): Boolean;
    function GuardaOperacion:Integer;
    procedure reporte(_iConsecutivoRep: Integer);
    function Origen(_cTipo: string): string;
    procedure BuscaTitular;
    { Private declarations }
  public
    _iTipoCaptacion :Integer;
    _iNumeroCuenta :string;
    _cValorOperacion :Currency;
    _cOrigen :string;
    _iTipoAgencia :Integer;
    _iTipoDocumento :Integer;
    { Public declarations }
  end;

var
  FrmDeclaracion: TFrmDeclaracion;

implementation

uses UnitdmGeneral,UnitGlobales, unitMain;

{$R *.dfm}

procedure TFrmDeclaracion.BitAplicarClick(Sender: TObject);
var
  DataPersona : TPersonaData;
begin
        if Trim(EdDocumento.Text) = '' then
        begin
          ShowMessage('Favor Diligencie los campos de la persona que realiza la Operación');
          EdDocumento.SetFocus;
          Exit;
        end;
        BitAplicar.Enabled := False;
        Bitlimpiar.Enabled := False;
        DataPersona.Documento := EdDocumento.Text;
        DataPersona.PrimerApellido := EdprimerAp.Text;
        DataPersona.SegundoApellido := EdSegundoAp.Text;
        DataPersona.Nombre := EdNombre.Text;
        DataPersona.Existe := _bExistePersona;
        DataPersona.ExisteDirecion := _bExisteDireccion;
        DataPersona.Direccion := EdDireccion.Text;
        DataPersona.Telefono := EdTelefono.Text;
        if GuardarPersona(DataPersona) then
        begin
            BitCerrar.Enabled := True;
            BitReporte.Enabled := True;
            EdObservacion.Enabled := False;
            EdOrigen.Enabled := False;
            GrpCertificadoAutoriza.Enabled := False;
            _iConsecutivo := GuardaOperacion;
            BitReporte.Click;
        end;


end;

function TFrmDeclaracion.GuardarPersona(
  PersonaData: TPersonaData): Boolean;
var
 _qSQL:TIBQuery;
 _qTran:TIBTransaction;
 _bTransaccion :Boolean;
begin
        _bTransaccion := False;
        _qSQL := TIBQuery.Create(nil);
        _qTran := TIBTransaction.Create(nil);
        _qTran.DefaultDatabase := dmGeneral.IBDatabase1;
        _qSQL.Transaction := _qTran;
        with _qSQL do
        begin
           if not PersonaData.Existe then
           begin
             _btransaccion := True;
             SQL.Clear;
             SQL.Add('INSERT INTO "gen$persona"');
             SQL.Add('(');
             SQL.Add('ID_IDENTIFICACION,');
             SQL.Add('ID_PERSONA,');
             SQL.Add('PRIMER_APELLIDO,');
             SQL.Add('SEGUNDO_APELLIDO,');
             SQL.Add('NOMBRE,');
             SQL.Add('ID_TIPO_ESTADO_CIVIL,');
             SQL.Add('ID_IDENTIFICACION_CONYUGE,');
             SQL.Add('ID_IDENTIFICACION_APODERADO,');
             SQL.Add('ID_ESTADO,');
             SQL.Add('ID_TIPO_RELACION,');
             SQL.Add('ID_TIPO_PERSONA,');
             SQL.Add('ID_CIIU');
             SQL.Add(')');
             SQL.Add('VALUES (');
             SQL.Add('3,');
             SQL.Add(':ID_PERSONA,');
             SQL.Add(':PRIMER_APELLIDO,');
             SQL.Add(':SEGUNDO_APELLIDO,');
             SQL.Add(':NOMBRE,');
             SQL.Add('0,');
             SQL.Add('0,');
             SQL.Add('0,');
             SQL.Add('0,');
             SQL.Add('0,');
             SQL.Add('0,');
             SQL.Add('0');
             SQL.Add(')');
             ParamByName('ID_PERSONA').AsString := PersonaData.Documento;
             ParamByName('PRIMER_APELLIDO').AsString := PersonaData.PrimerApellido;
             ParamByName('SEGUNDO_APELLIDO').AsString := PersonaData.SegundoApellido;
             ParamByName('NOMBRE').AsString := PersonaData.Nombre;
             ExecSQL;
           end;
           if not (PersonaData.ExisteDirecion) then
           begin
             _btransaccion := True;
             _qSQL.Close;
             SQL.Clear;
             SQL.Add('INSERT INTO');
             SQL.Add('"gen$direccion"(');
             SQL.Add('ID_IDENTIFICACION,');
             SQL.Add('ID_PERSONA,');
             SQL.Add('CONSECUTIVO,');
             SQL.Add('ID_DIRECCION,');
             SQL.Add('DIRECCION,');
             SQL.Add('BARRIO,');
             SQL.Add('COD_MUNICIPIO,');
             SQL.Add('MUNICIPIO,');
             SQL.Add('TELEFONO1,');
             SQL.Add('TELEFONO2,');
             SQL.Add('TELEFONO3,');
             SQL.Add('TELEFONO4)');
             SQL.Add('VALUES(');
             SQL.Add(':ID_IDENTIFICACION,');
             SQL.Add(':ID_PERSONA,');
             SQL.Add('1,');
             SQL.Add('1,');
             SQL.Add(':DIRECCION,');
             SQL.Add('NULL,');
             SQL.Add('NULL,');
             SQL.Add('NULL,');
             SQL.Add(':TELEFONO1,');
             SQL.Add('NULL,');
             SQL.Add('NULL,');
             SQL.Add('NULL)');
             ParamByName('ID_IDENTIFICACION').AsInteger := 3;
             ParamByName('ID_PERSONA').AsString := PersonaData.Documento;
             ParamByName('DIRECCION').AsString := PersonaData.Direccion;
             ParamByName('TELEFONO1').AsString := PersonaData.Telefono;
             ExecSQL;
           end;
           if (_btransaccion) then
              _qTran.Commit;
          _qSQL.Close;
         result := true;
        end;
        FreeAndNil(_qSQL);
        FreeAndNil(_qTran);
end;

function TFrmDeclaracion.ValidarPersona(DocumentoUsuario: string;_iIdPersona:Integer): TPersonaData;
var
 _qSQL:TIBQuery;
 _qTran:TIBTransaction;
begin
        Result.Existe := False;
        Result.ExisteDirecion := False;
        _qSQL := TIBQuery.Create(nil);
        _qTran := TIBTransaction.Create(nil);
        _qTran.DefaultDatabase := dmGeneral.IBDatabase1;
        _qSQL.Transaction := _qTran;
        with _qSQL do
        begin
           SQL.Clear;
           SQL.Add('select ID_PERSONA,PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona" p');
           SQL.Add('where p.ID_PERSONA = :ID_PERSONA and p.ID_IDENTIFICACION = :ID_IDENTIFICACION');
           ParamByName('ID_PERSONA').AsString := DocumentoUsuario;
           ParamByName('ID_IDENTIFICACION').AsInteger := _iIdPersona;
           Open;
           if RecordCount > 0 then
           begin
              result.Documento := FieldByName('ID_PERSONA').AsString;
              result.PrimerApellido := FieldByName('PRIMER_APELLIDO').AsString;
              result.SegundoApellido := FieldByName('SEGUNDO_APELLIDO').AsString;
              result.Nombre := FieldByName('NOMBRE').AsString;
              result.Existe := True;
          end;
            Close;
            SQL.Clear;
            SQL.Add('select DIRECCION, TELEFONO1 from "gen$direccion" where ID_PERSONA = :ID_PERSONA and  ID_DIRECCION = 1 AND ID_IDENTIFICACION = :ID_IDENTIFICACION');
            ParamByName('ID_PERSONA').AsString := DocumentoUsuario;
            ParamByName('ID_IDENTIFICACION').AsInteger := _iIdPersona;
            Open;
            if RecordCount > 0 then
            begin
              Result.ExisteDirecion := True;
              Result.Direccion := FieldByName('DIRECCION').AsString;
              Result.Telefono := FieldByName('TELEFONO1').AsString;
            end;
            _qTran.Commit;
         end;
end;

procedure TFrmDeclaracion.EdDocumentoExit(Sender: TObject);
var
 PersonaData:TPersonaData;
begin
        if Trim(EdDocumento.Text) = '' then
        begin
          ShowMessage('Debe digitar un numero de Documento');
          EdDocumento.SetFocus;
          Exit;
        end;
        EdObservacion.Enabled := True;
        EdOrigen.Enabled := True;
        PersonaData := ValidarPersona(edDocumento.Text,3);
        _bExistePersona := PersonaData.Existe;
        _bExisteDireccion := PersonaData.ExisteDirecion;
        if (_bExistePersona) then
        begin
              EdprimerAp.Text := PersonaData.PrimerApellido;
              EdSegundoAp.Text := PersonaData.SegundoApellido;
              EdNombre.Text := PersonaData.Nombre;
              edPrimerAp.Enabled := False;
              edSegundoAp.Enabled := False;
              edNombre.Enabled := False;
              EdDocumento.Enabled := False;
              if (_bExisteDireccion) then
              begin
                 EdDireccion.Text := PersonaData.Direccion;
                 EdTelefono.Text := PersonaData.Telefono;
                 EdDireccion.Enabled := False;
                 EdTelefono.Enabled := False;
                 EdObservacion.SetFocus;
              end
              else
              begin
                 EdDireccion.Enabled := True;
                 EdTelefono.Enabled := True;
                 EdTelefono.SetFocus;
              end;
        end
        else
        begin
              edPrimerAp.Enabled := True;
              edSegundoAp.Enabled := True;
              edNombre.Enabled := True;
              EdDireccion.Enabled := True;
              EdTelefono.Enabled := True;
              edPrimerAp.SetFocus;
        end;
end;

procedure TFrmDeclaracion.EdDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,self);
end;

procedure TFrmDeclaracion.FormShow(Sender: TObject);
begin
        if Role = 'CAJAS' then
        begin
          TabBuscar.TabVisible := False;
          TabOperacion.TabVisible := True;
          EdDocumento.SetFocus;
          if _iTipoAgencia = 0 then
             BuscaTitular;
        end
        else
        begin
          DFecha.DateTime := fFechaActual;
          TabOperacion.TabVisible := False;
          TabBuscar.TabVisible := True;
          EdNumeroCuenta.SetFocus;
        end;

end;

function TFrmDeclaracion.GuardaOperacion:Integer;
var
 _qSQL:TIBQuery;
 _qTran:TIBTransaction;
 _bTransaccion :Boolean;
begin
        _bTransaccion := False;

        _qSQL := TIBQuery.Create(nil);
        _qTran := TIBTransaction.Create(nil);
        _qTran.DefaultDatabase := dmGeneral.IBDatabase1;
        _qSQL.Transaction := _qTran;
        with _qSQL do
        begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO');
          SQL.Add('CAJ$DECLARACIONOP(');
          SQL.Add('IDAGENCIA,');
          SQL.Add('TIPOCAPTACION,');
          SQL.Add('NUMEROCUENTA,');
          SQL.Add('IDPERSONAOP,');
          SQL.Add('IDTIPOOP,');
          SQL.Add('TIPOOPERACION,');
          SQL.Add('VALOROPERACION,');
          SQL.Add('FECHAOPERACION,');
          SQL.Add('HORAOPERACION,');
          SQL.Add('ORIGEN,');
          SQL.Add('OBSERVACION,');
          SQL.Add('IDEMPLEADO,');
          SQL.Add('IDEMPLEADOREC,');
          SQL.Add('FECHAREC,');
          SQL.Add('HORAREC)');
          SQL.Add('VALUES(');
          SQL.Add(':IDAGENCIA,');
          SQL.Add(':TIPOCAPTACION,');
          SQL.Add(':NUMEROCUENTA,');
          SQL.Add(':IDPERSONAOP,');
          SQL.Add(':IDTIPOOP,');
          SQL.Add(':TIPOOPERACION,');
          SQL.Add(':VALOROPERACION,');
          SQL.Add(':FECHAOPERACION,');
          SQL.Add(':HORAOPERACION,');
          SQL.Add(':ORIGEN,');
          SQL.Add(':OBSERVACION,');
          SQL.Add(':IDEMPLEADO,');
          SQL.Add(':IDEMPLEADOREC,');
          SQL.Add(':FECHAREC,');
          SQL.Add(':HORAREC)');
          if _iTipoAgencia = 0 then
            ParamByName('IDAGENCIA').AsInteger := Agencia
          else
            ParamByName('IDAGENCIA').AsInteger := _iTipoAgencia;
          ParamByName('TIPOCAPTACION').AsInteger := _iTipoCaptacion;
          ParamByName('NUMEROCUENTA').AsString := _iNumeroCuenta;
          ParamByName('IDPERSONAOP').AsString := EdDocumento.Text;
          ParamByName('IDTIPOOP').AsInteger := 3;
          ParamByName('TIPOOPERACION').AsString := _cOrigen;
          ParamByName('VALOROPERACION').AsCurrency := _cValorOperacion;
          ParamByName('FECHAOPERACION').AsDate := fFechaActual;
          ParamByName('HORAOPERACION').AsTime := fHoraActual;
          ParamByName('ORIGEN').AsString := EdOrigen.Text;
          ParamByName('ORIGEN').AsString := EdOrigen.Text;
          ParamByName('OBSERVACION').AsString := EdObservacion.Text;
          ParamByName('IDEMPLEADO').AsString := DBAlias;
          ParamByName('IDEMPLEADOREC').Clear;
          ParamByName('FECHAREC').Clear;
          ParamByName('HORAREC').Clear;
          ExecSQL;
         _qTran.Commit;
         _qTran.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('SELECT MAX(ID) AS ID FROM  CAJ$DECLARACIONOP WHERE IDEMPLEADO = :IDEMPLEADO AND NUMEROCUENTA = :NUMEROCUENTA AND TIPOCAPTACION = :TIPOCAPTACION');
         ParamByName('TIPOCAPTACION').AsInteger := _iTipoCaptacion;
         ParamByName('NUMEROCUENTA').AsString := _iNumeroCuenta;
         ParamByName('IDEMPLEADO').AsString := DBAlias;
         Open;
         Result := FieldByName('ID').AsInteger;
        end;


end;

procedure TFrmDeclaracion.reporte(_iConsecutivoRep: Integer);
var
 _qSQL:TIBQuery;
 _qSQL1:TIBQuery;
 _qTran:TIBTransaction;
 _sTipoOrigen :string;
 PersonaData:TPersonaData;
 _sIdPersona :string;
 pict,pict2 : TfrPictureView;
 _sRutaLogo :string;
begin
        _qSQL := TIBQuery.Create(nil);
        _qSQL1 := TIBQuery.Create(nil);
        _qTran := TIBTransaction.Create(nil);
        _qTran.DefaultDatabase := dmGeneral.IBDatabase1;
        _qSQL1.Transaction := _qTran;
        _qSQL.Transaction := _qTran;
        with _qSQL do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM CAJ$DECLARACIONOP WHERE ID = :ID');
          ParamByName('ID').AsInteger := _iConsecutivoRep;
          Open;
          CdReporte.CancelUpdates;
          CdReporte.Append;
          CdReporte.FieldValues['CIUDAD'] := Ciudad;
          CdReporte.FieldValues['HORA'] := FieldByName('HORAOPERACION').AsString;
          CdReporte.FieldValues['DIA'] := DayOf(FieldByName('FECHAOPERACION').AsDateTime);
          CdReporte.FieldValues['MES'] := MonthOf(FieldByName('FECHAOPERACION').AsDateTime);
          CdReporte.FieldValues['ANO'] := YearOf(FieldByName('FECHAOPERACION').AsDateTime);

          CdReporte.FieldValues['CODOPERACION'] := Origen(FieldByName('TIPOOPERACION').AsString);
          if FieldByName('TIPOCAPTACION').AsInteger = 6 then
          begin
             CdReporte.FieldValues['NUMEROCUENTA'] := '';
             CdReporte.FieldValues['TITULO'] := FieldByName('TIPOCAPTACION').AsString + '0' + FieldByName('IDAGENCIA').AsString + '-' +  FormatCurr('000000',FieldByName('NUMEROCUENTA').AsInteger);
          end
          else if FieldByName('TIPOCAPTACION').AsInteger < 6 then
          begin
             CdReporte.FieldValues['TITULO'] := '';
             CdReporte.FieldValues['NUMEROCUENTA'] := FieldByName('TIPOCAPTACION').AsString + '0' + FieldByName('IDAGENCIA').AsString + '-' + FormatCurr('000000',FieldByName('NUMEROCUENTA').AsInteger);
          end
          else
          begin
             CdReporte.FieldValues['TITULO'] := '';
             CdReporte.FieldValues['NUMEROCUENTA'] := FieldByName('NUMEROCUENTA').AsString;
          end;
          CdReporte.FieldValues['VALOR'] := FieldByName('VALOROPERACION').AsCurrency;
          PersonaData := ValidarPersona( FieldByName('IDPERSONAOP').AsString,3);
          CdReporte.FieldValues['IDENTIFICACION'] :=  FieldByName('IDPERSONAOP').AsString;
          CdReporte.FieldValues['NOMBRE'] :=  PersonaData.Nombre + ' ' + PersonaData.PrimerApellido + ' ' + PersonaData.SegundoApellido;
          CdReporte.FieldValues['TELEFONO'] := PersonaData.Telefono;
          CdReporte.FieldValues['DIRECCION'] := PersonaData.Direccion;
          _qSQL1.SQL.Clear;
          if _iTipoCaptacion <= 6 then
          begin
            _qSQL1.SQL.Add('SELECT ');
            _qSQL1.SQL.Add('"cap$maestrotitular".ID_PERSONA');
            _qSQL1.SQL.Add('FROM');
            _qSQL1.SQL.Add('"cap$maestrotitular"');
            _qSQL1.SQL.Add('WHERE');
            _qSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :IDTIPOCAPTACION AND ');
            _qSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMEROCUENTA AND ');
            _qSQL1.SQL.Add('"cap$maestrotitular".TIPO_TITULAR = 1');
            _qSQL1.ParamByName('IDTIPOCAPTACION').AsInteger := FieldByName('TIPOCAPTACION').AsInteger;
            _qSQL1.ParamByName('NUMEROCUENTA').AsInteger := FieldByName('NUMEROCUENTA').AsInteger;
            _qSQL1.Open;
          end
          else
          begin
            _qSQL1.SQL.Add('SELECT ');
            _qSQL1.SQL.Add('"col$colocacion".ID_PERSONA');
            _qSQL1.SQL.Add('FROM');
            _qSQL1.SQL.Add('"col$colocacion"');
            _qSQL1.SQL.Add('WHERE');
            _qSQL1.SQL.Add('"col$colocacion".ID_COLOCACION = :ID_COLOCACION');
            _qSQL1.ParamByName('ID_COLOCACION').AsString := FieldByName('NUMEROCUENTA').AsString;
            _qSQL1.Open;
          end;
          if _iTipoAgencia = 0 then
          begin
            PersonaData := ValidarPersona(_qSQL1.FieldByName('ID_PERSONA').AsString,_iTipoDocumento);
            CdReporte.FieldValues['IDENTIFICACIONT'] :=  _qSQL1.FieldByName('ID_PERSONA').AsString;
            CdReporte.FieldValues['NOMBRET'] :=  PersonaData.Nombre + ' ' + PersonaData.PrimerApellido + ' ' + PersonaData.SegundoApellido;
            CdReporte.FieldValues['TELEFONOT'] := PersonaData.Telefono;
            CdReporte.FieldValues['DIRECCIONT'] := PersonaData.Direccion;
            CdReporte.FieldValues['OBSERVACION'] := FieldByName('OBSERVACION').AsString;
            CdReporte.FieldValues['ORIGEN'] := FieldByName('ORIGEN').AsString;
          end
          else
          begin
            CdReporte.FieldValues['IDENTIFICACIONT'] :=  EdDocumentoTit.Text;
            CdReporte.FieldValues['NOMBRET'] :=  EdNombreTit.Text;
            CdReporte.FieldValues['TELEFONOT'] := EdTelTit.Text;
            CdReporte.FieldValues['DIRECCIONT'] := EdDireccionTit.Text;
            CdReporte.FieldValues['OBSERVACION'] := EdObservacion.Text;
            CdReporte.FieldValues['ORIGEN'] := EdOrigen.Text;
          end;
            _qSQL1.Close;
            _qSQL1.SQL.Clear;
            _qSQL1.SQL.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
            _qSQL1.SQL.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
            _qSQL1.ParamByName('ID_EMPLEADO').AsString := FieldByName('IDEMPLEADO').AsString;
            _qSQL1.Open;
            CdReporte.FieldValues['EMPLEADO'] := _qSQL1.FieldByName('NOMBRE').AsString + ' '+ _qSQL1.FieldByname('PRIMER_APELLIDO').AsString + ' ' + _qSQL1.FieldByName('SEGUNDO_APELLIDO').AsString;
            CdReporte.Post;
        end;
//        frReport1.PrintPreparedReportDlg;
        _sRutaLogo := frmMain.ruta1 + 'logo\logo.jpg';
        frReport1.LoadFromFile(frmMain.ruta1 + 'Reporte\FrDeclaracion.frf');
        frReport1.Dictionary.Variables.Variable['Agencia'] := QuotedStr(IntToStr(Agencia));
        frReport1.Dictionary.Variables.Variable['Empresa'] := QuotedStr(Empresa);
        pict := TfrPictureView(frReport1.FindObject('picture1'));
        pict2 := TfrPictureView(frReport1.FindObject('picture2'));
        if Assigned(pict) then
        begin
           pict.Picture.LoadFromFile(_sRutaLogo);
           pict2.Picture.LoadFromFile(_sRutaLogo);
        end;
        frReport1.PrepareReport;
        frReport1.ShowReport;
end;

function TFrmDeclaracion.Origen(_cTipo: string): string;
begin
          if (_ctipo = 'C') then Result := '01 - DEPOSITOS'
          else if (_ctipo = 'R') then Result := '02 - RETIROS'
          else if (_ctipo = 'I') then Result := '03 - CONSIGNACION CDATs'
          else if (_ctipo = 'S') then Result := '04 - RETIRO CDATs'
          else if (_ctipo = 'A') then Result := '05 - CARTERA'
          else
            Result := '06 - OTROS';
end;

procedure TFrmDeclaracion.BitReporteClick(Sender: TObject);
begin
        reporte(_iConsecutivo);
end;

procedure TFrmDeclaracion.BitCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmDeclaracion.BuscaTitular;
var
 _qSQL:TIBQuery;
 _qTran:TIBTransaction;
 PersonaData:TPersonaData;
 _sIdPersonaTit :string;
begin
        _qSQL := TIBQuery.Create(nil);
        _qTran := TIBTransaction.Create(nil);
        _qTran.DefaultDatabase := dmGeneral.IBDatabase1;
        _qSQL.Transaction := _qTran;
        with _qSQL do
        begin
          if _iTipoCaptacion <= 6 then
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"cap$maestrotitular".ID_PERSONA,"cap$maestrotitular".ID_IDENTIFICACION ');
            SQL.Add('FROM');
            SQL.Add('"cap$maestrotitular"');
            SQL.Add('WHERE');
            SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :IDTIPOCAPTACION AND ');
            SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMEROCUENTA AND ');
            SQL.Add('"cap$maestrotitular".TIPO_TITULAR = 1');
            ParamByName('IDTIPOCAPTACION').AsInteger := _iTipoCaptacion;
            ParamByName('NUMEROCUENTA').AsString := _iNumeroCuenta;
            Open;
          end
          else
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"col$colocacion".ID_PERSONA');
            SQL.Add('FROM');
            SQL.Add('"col$colocacion"');
            SQL.Add('WHERE');
            SQL.Add('"col$colocacion".ID_COLOCACION = :ID_COLOCACION');
            ParamByName('ID_COLOCACION').AsString := _iNumeroCuenta;
            Open;
          end;
          PersonaData := ValidarPersona(FieldByName('ID_PERSONA').AsString,FieldByName('ID_IDENTIFICACION').AsInteger);
          EdDocumentoTit.Text := FieldByName('ID_PERSONA').AsString;
          EdPrimerApTit.Text :=  PersonaData.PrimerApellido;
          EdSegundoApTit.Text := PersonaData.SegundoApellido;
          EdNombreTit.Text := PersonaData.Nombre;
          EdTelTit.Text := PersonaData.Telefono;
          EdDireccionTit.Text := PersonaData.Direccion;
        end;
end;
procedure TFrmDeclaracion.BitBtn1Click(Sender: TObject);
begin
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('  CAJ$DECLARACIONOP.ID,');
          SQL.Add('  CAJ$DECLARACIONOP.IDAGENCIA,');
          SQL.Add('  CAJ$DECLARACIONOP.TIPOCAPTACION,');
          SQL.Add('  CAJ$DECLARACIONOP.NUMEROCUENTA,');
          SQL.Add('  CAJ$DECLARACIONOP.VALOROPERACION,');
          SQL.Add('  CAJ$DECLARACIONOP.IDEMPLEADO');
          SQL.Add('FROM');
          SQL.Add('  CAJ$DECLARACIONOP');
          SQL.Add('WHERE');
          if ChTodos.Checked = False then
          begin
            SQL.Add('  CAJ$DECLARACIONOP.NUMEROCUENTA = :NUMEROCUENTA AND ');
            SQL.Add('  CAJ$DECLARACIONOP.FECHAOPERACION = :FECHAOPERACION');
            ParamByName('NUMEROCUENTA').AsString := EdNumeroCuenta.Text;
          end
          else
            SQL.Add('  CAJ$DECLARACIONOP.FECHAOPERACION = :FECHAOPERACION');
          ParamByName('FECHAOPERACION').AsDate := DFecha.DateTime;
          Open;
          if RecordCount = 0 then
          begin
            ShowMessage('No se Encontraron Registros');
            Exit;
          end;
          

        end;
end;

procedure TFrmDeclaracion.DBGrid1DblClick(Sender: TObject);
begin
        _iTipoCaptacion := IBQuery1.FieldByName('TIPOCAPTACION').AsInteger;
        reporte(IBQuery1.FieldByName('ID').AsInteger);
end;

procedure TFrmDeclaracion.BitlimpiarClick(Sender: TObject);
begin
              EdprimerAp.Text := '';
              EdSegundoAp.Text := '';
              EdNombre.Text := '';
              edPrimerAp.Enabled := True;
              edSegundoAp.Enabled := True;
              edNombre.Enabled := True;
              EdDocumento.Enabled := True;
              EdDocumento.Text := '';
              EdTelefono.Text := '';
              EdDireccion.Text := '';
              EdTelefono.Enabled := True;
              EdDireccion.Enabled := True;
              EdDocumento.Setfocus;
end;

end.
