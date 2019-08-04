unit UnitPosicionNeta;

interface

uses
  Windows, Messages, IniFiles, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Mask, JvToolEdit, Buttons, ComCtrls,
  JvProgressBar, JvSpecialProgress, DBTables, JvMemTable, IBDatabase,
  pr_Common, pr_TxClasses, DataSetToExcel,
  IBCustomDataSet, IBQuery, Grids, DBGrids, JvEdit, JvTypedEdit, DateUtils,
  JvDialogs;

type TNombre = record
     PrimerApellido:string;
     SegundoApellido:string;
     Nombre:string;
end;

type
  TfrmPosicionNeta = class(TForm)
    CDSCaptacion: TClientDataSet;
    CDSColocacion: TClientDataSet;
    CDSAportes: TClientDataSet;
    CDSAportesTIPO_IDE: TStringField;
    CDSAportesNUMERO_IDE: TStringField;
    CDSAportesSALDO_APO: TCurrencyField;
    CDSCaptacionTIPO_IDE: TStringField;
    CDSCaptacionNUMERO_IDE: TStringField;
    CDSCaptacionSALDO: TCurrencyField;
    CDSColocacionNUMERO_IDE: TStringField;
    CDSColocacionSALDO_CAPITAL: TCurrencyField;
    CmdProcesar: TBitBtn;
    CmdReporte: TBitBtn;
    CmdCerrar: TBitBtn;
    CDSColocacionTIPO_IDE: TStringField;
    CDSDocumentos: TClientDataSet;
    CDSPosicion: TClientDataSet;
    CDSDocumentosNUMERO_IDE: TStringField;
    CDSPosicionNUMERO_IDE: TStringField;
    CDSPosicionCAPTACION: TCurrencyField;
    CDSPosicionCOLOCACION: TCurrencyField;
    CDSPosicionAPORTES: TCurrencyField;
    CDSPosicionPOSICION: TCurrencyField;
    CDSDocumentosTIPO_IDE: TStringField;
    CDSPosicionPRIMER_APELLIDO: TStringField;
    CDSPosicionSEGUNDO_APELLIDO: TStringField;
    CDSPosicionNOMBRE: TStringField;
    Reporte: TprTxReport;
    IBQuery1: TIBQuery;
    CDSpn: TClientDataSet;
    CDSpnID_IDENTIFICACION: TIntegerField;
    CDSpnID_PERSONA: TStringField;
    CDSpnPRIMER_APELLIDO: TStringField;
    CDSpnSEGUNDO_APELLIDO: TStringField;
    CDSpnNOMBRES: TStringField;
    CDSpnCAPTACIONES: TCurrencyField;
    CDSpnCOLOCACIONES: TCurrencyField;
    CDSpnBRECHA_PASIVA_ACTIVA: TCurrencyField;
    CDSpnAPORTES: TCurrencyField;
    CDSpnPOSICION_NETA: TCurrencyField;
    DBGrid1: TDBGrid;
    DSpn: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdAnho: TJvYearEdit;
    EdFechaInicial: TJvDateEdit;
    EdFechaFinal: TJvDateEdit;
    EdFechaCorte: TJvDateEdit;
    SD1: TJvSaveDialog;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdReporteClick(Sender: TObject);
    procedure CDSpnCalcFields(DataSet: TDataSet);
  private
    function BuscarCaptacion(Documento: String): Currency;
    function BuscarColocacion(Documento: String): Currency;
    function BuscarAportes(Documento: String): Currency;
    function BuscarNombre(Documento: String): TNombre;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPosicionNeta: TfrmPosicionNeta;

  Hoy: TDateTime;
  Anho: word;
  Mes: word;
  Dia: word;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales ;

function TfrmPosicionNeta.BuscarAportes(Documento: String): Currency;
begin

end;

function TfrmPosicionNeta.BuscarCaptacion(Documento: String): Currency;
begin

end;

function TfrmPosicionNeta.BuscarColocacion(Documento: String): Currency;
begin

end;

function TfrmPosicionNeta.BuscarNombre(Documento: String): TNombre;
begin

end;

procedure TfrmPosicionNeta.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmPosicionNeta.CmdProcesarClick(Sender: TObject);
begin
        CmdReporte.Enabled := False;
        CmdCerrar.Enabled := False;

        IBQuery1.Close;
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Add('SELECT * FROM SALDOS_PERSONA_PRIVILEGIADO(:ANHO, :FECHA_INICIAL, :FECHA_FINAL, :FECHA_CORTE)');
        IBQuery1.ParamByName('ANHO').AsInteger := Anho;
        IBQuery1.ParamByName('FECHA_INICIAL').AsDateTime := EdFechaInicial.Date;
        IBQuery1.ParamByName('FECHA_FINAL').AsDateTime := EdFechaFinal.Date;
        IBQuery1.ParamByName('FECHA_CORTE').AsDateTime := EdFechaCorte.Date;
        IBQuery1.Open;
        IBQuery1.First;

        CDSpn.Open;
        CDSpn.EmptyDataSet;

        while not IBQuery1.Eof do
        begin
                CDSpn.Insert;
                CDSpnID_IDENTIFICACION.Value := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                CDSpnID_PERSONA.Value := IBQuery1.FieldByName('ID_PERSONA').AsString;
                CDSpnPRIMER_APELLIDO.Value := IBQuery1.FieldByName('PRIMER_APELLIDO').AsString;
                CDSpnSEGUNDO_APELLIDO.Value := IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString;
                CDSpnNOMBRES.Value := IBQuery1.FieldByName('NOMBRES').AsString;
                CDSpnCAPTACIONES.Value := IBQuery1.FieldByName('CAPTACIONES').AsCurrency;
                CDSpnAPORTES.Value := IBQuery1.FieldByName('APORTES').AsCurrency;
                CDSpnCOLOCACIONES.Value := IBQuery1.FieldByName('COLOCACIONES').AsCurrency;
                CDSpn.Post;
                IBQuery1.Next;
        end;

        CDSpn.First;

        CmdReporte.Enabled := True;
        CmdCerrar.Enabled := True;
        Application.ProcessMessages;

end;

procedure TfrmPosicionNeta.FormShow(Sender: TObject);
begin
        Hoy := fFechaActual;
        EdAnho.Value :=  YearOf(Hoy);
        EdFechaInicial.Date := EncodeDate(YearOf(Hoy),01,01);
        EdFechaFinal.Date := Hoy;
        Anho := YearOf(Hoy);
        Mes := MonthOf(Hoy);
        Dia := DaysInAMonth(Anho, Mes);
        if (Dia > 30) then Dia := 30;
        EdFechaCorte.Date := EncodeDate(Anho, Mes, Dia);
        
end;

procedure TfrmPosicionNeta.FormCreate(Sender: TObject);
var
  Mensaje, DescAgencia, Ruta: String;

begin
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','0.0.0.0');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    _dFechaCorteAhorros := ReadInteger('ADICIONALES','fechaahorros',1);
    _dFechaCorteCausacion := ReadInteger('ADICIONALES','fechacausacion',1);
    _dFechaInicial := ReadInteger('ADICIONALES','fechainicial',1);
    _iAno := ReadInteger('ADICIONALES','ano',1);
    _Nit := ReadString('ADICIONALES','nit','0000000000');
  finally
    free;
  end;
        dmGeneral.IBDatabase1.Connected := False;
        dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
        dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
        dmGeneral.IBDatabase1.Params.Values['User_Name'] := 'sysdba';//DBAlias;
        dmGeneral.IBDatabase1.Params.Values['PassWord'] := 'masterkey';//DBPasabordo;
        dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := Role;
                try
                    dmGeneral.IBDatabase1.Connected := True;
                except
                        on E: Exception do
                        begin
                          if StrLIComp(PChar(E.Message),PChar('Your user name'),14) = 0 then
                           begin
                            Mensaje :='Verifique su Nombre y su Contraseña' + #10 + #13 + 'Mensaje:' + E.Message;
                            MessageBox(0,PChar(Mensaje),PChar('Usuario Invalido'),MB_OK OR MB_ICONERROR);
                           end
                          else
                           begin
                            Mensaje := 'Verifique su Configuración o Informe al Administrador de la Red' + #10 + #13 + 'Mensaje:' + E.Message;
                            MessageBox(0,PChar(Mensaje),PChar('Configuración Erronea'),MB_OK OR MB_ICONERROR);
                           end;
                        end; //fin del begin de la excepción.
                end; // fin del try
  Self.Caption := 'Modulo Posición Neta Privilegiados - ' + DBserver + ':' + DBpath + DBname + '  -' + DescAgencia + '  FechaAhorros: ' + DateToStr(_dFechaCorteAhorros) + '  FechaCausaciones: ' + DateToStr(_dFechaCorteCausacion) + ' FechaInicial: ' + DateToStr(_dFechaInicial);
  ShortDateFormat := 'yyyy/mm/dd';
  Ruta := ExtractFilePath(Application.ExeName);
  IBQuery1.Database := dmGeneral.IBDatabase1;
  IBQuery1.Transaction := dmGeneral.IBTransaction1;
  dmGeneral.IBTransaction1.StartTransaction;
end;

procedure TfrmPosicionNeta.CmdReporteClick(Sender: TObject);
var
   toExcel: TDataSetToExcel;
begin
        if (SD1.Execute) then
        begin
                if (SD1.FileName <> '') then
                begin
                        CDSpn.First;
                        toExcel := TDataSetToExcel.Create(CDSpn, SD1.FileName);
                        toExcel.WriteFile;
                        toExcel.Free;
                end;
        end;
end;

procedure TfrmPosicionNeta.CDSpnCalcFields(DataSet: TDataSet);
begin
        DataSet.FieldByName('BRECHA_PASIVA_ACTIVA').AsCurrency := DataSet.FieldByName('CAPTACIONES').AsCurrency - DataSet.FieldByName('COLOCACIONES').AsCurrency;
        DataSet.FieldByName('POSICION_NETA').AsCurrency := DataSet.FieldByName('BRECHA_PASIVA_ACTIVA').AsCurrency + DataSet.FieldByName('APORTES').AsCurrency;
end;

end.
