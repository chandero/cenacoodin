unit UnitArchivoPlanoMovimientosTarjetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, IBDatabase, DB, IBCustomDataSet,
  IBQuery, ExtCtrls, StrUtils, DateUtils;

type
  TfrmArchivoPlanoMovimientosTarjetas = class(TForm)
    GroupBox1: TGroupBox;
    edFechaInicial: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edFechaFinal: TDateTimePicker;
    btnProcesar: TBitBtn;
    IBQmovs: TIBQuery;
    IBTransaction1: TIBTransaction;
    Panel1: TPanel;
    btnCerrar: TBitBtn;
    ProgressBar1: TProgressBar;
    IBQpersona: TIBQuery;
    IBQsaldo: TIBQuery;
    IBQmaestro: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


type
   THeader = Record
     Consecutivo: String; // 10 alineado a la derecha
     CodigoEntidad: String; // 8  SSTTTCCC  SS Sector , TTT Tipo Entidad, CCC Código
     FechaCorte: String; // 10  AAAA-MM-DD
     NumeroMovs: String; // 10  Alineado a la derecha
     FinRegistro: String; // 263 completo con X
end;

type
  TRegistro = Record
    Consecutivo: String; // 10 alineado a la derecha inicia en 1
    FechaTransaccion: String; // 10
    ValorTransaccion: String; // 20 Alineado a la derecha sin decimales
    TipoTransaccion: String; // 2 Según Tabla
    PaisTransaccion: String; // 2 Según ISO3166
    CodigoDeptoMuni: String; // 5 si no es Colombia usar 00099
    TipoTarjeta: String; // 2 segun tabla
    NumeroTarjeta: String; // 20 Alineado a la derecha
    ValorCupo: String; // 20 Alineado a la derecha, colocar ceros para debito
    CodigoFranquicia: String; // 2
    SaldoTarjeta: String; // 20 alineado a la derecha
    TipoIdentificacion: String; // 2
    NumeroIdentificacion: String; // 15
    DigitoVerificacion: String; // 1
    PrimerApellido: String; // 30
    SegundoApellido: String; // 30
    PrimerNombre: String; // 30
    SegundoNombre: String; // 30
    RazonSocial: String; // 40
end;

type
  TFooter = Record
    Consecutivo: String; // 10 Cero alineado a la derecha
    CodigoEntidad: String; // 8  SSTTTCCC  SS Sector , TTT Tipo Entidad, CCC Código
    NumeroMovs: String; // 10  Alineado a la derecha
    FinRegistro: String; // 273 completo con X
end;

var
  frmArchivoPlanoMovimientosTarjetas: TfrmArchivoPlanoMovimientosTarjetas;

implementation

uses UnitDmGeneral, UnitGlobales;

{$R *.dfm}

procedure TfrmArchivoPlanoMovimientosTarjetas.FormShow(Sender: TObject);
begin
        IBTransaction1.StartTransaction;
end;

procedure TfrmArchivoPlanoMovimientosTarjetas.btnCerrarClick(
  Sender: TObject);
begin
        Close;
end;

procedure TfrmArchivoPlanoMovimientosTarjetas.btnProcesarClick(
  Sender: TObject);
var
   vFechaInicial, vFechaFinal : String;
   Lista: TStringList;
   _documento: String;
   _cuenta: String;
   _agencia: Integer;
   _tipocuenta: Integer;
   _numerocuenta: Integer;
   _digitocuenta: Integer;
   _valor: LongInt;
   _saldo: LongInt;
   _fechacorte: String;
   _fechainicial: TDate;

   _header: THeader;
   _record: TRegistro;
   _foot : TFooter;

   _id_identificacion : Integer;
   _id_persona: String;

   _fechatmp: String;

   _consecutivo: Integer;
begin
        Lista := TStringList.Create;
        DateTimeToString(vFechaInicial, 'yyyyMMdd', edFechaInicial.Date);
        DateTimeToString(vFechaFinal, 'yyyyMMdd', edFechaFinal.Date);
        IBQmovs.Close;
        IBQmovs.ParamByName('FECHA_INICIAL').AsString := vFechaInicial;
        IBQmovs.ParamByName('FECHA_FINAL').AsString := vFechaFinal;
        IBQmovs.Open;
        IBQMovs.Last;
        IBQMovs.First;
        ProgressBar1.Max := IBQMovs.RecordCount;
        ProgressBar1.Min := 0;
        ProgressBar1.Position := 0;

        _header.Consecutivo := Format('%.10d',[0]);
        _header.CodigoEntidad := '06007002';
        DateTimeToString(_fechacorte, 'yyyy-MM-dd', edFechaFinal.Date);
        _header.FechaCorte := _fechacorte;
        _header.FinRegistro := Format('%263s', ['X']);

        _foot.Consecutivo := Format('%.10d',[0]);
        _foot.CodigoEntidad := '06007002';
        _foot.FinRegistro := Format('%273s', ['X']);

        _fechainicial := EncodeDate(YearOf(edFechaFinal.Date),01,01);

        while not IBQmovs.Eof do
        begin
          _documento := IBQmovs.FieldByName('DOCUMENTO').AsString;
          _cuenta := IBQmovs.FieldByName('CUENTA').AsString;
          _tipocuenta := StrToInt(LeftStr(_cuenta,1));
          _agencia := StrToInt(MidStr(_cuenta,2,2));
          _numerocuenta := StrToInt(MidStr(_cuenta,4,6));
          _digitocuenta := StrToInt(RightStr(_cuenta,1));

          IBQsaldo.Close;
          IBQsaldo.ParamByName('ID_AGENCIA').AsInteger := _agencia;
          IBQsaldo.ParamByName('ID_TIPO_CAPTACION').AsInteger := _tipocuenta;
          IBQsaldo.ParamByName('NUMERO_CUENTA').AsInteger := _numerocuenta;
          IBQsaldo.ParamByName('DIGITO_CUENTA').AsInteger := _digitocuenta;
          IBQsaldo.ParamByName('ANHO').AsInteger := YearOf(edFechaFinal.Date);
          IBQsaldo.ParamByName('FECHA_INICIAL').AsDate := _fechainicial;
          IBQsaldo.ParamByName('FECHA_FINAL').AsDate := edFechaFinal.Date;
          IBQsaldo.Open;
          _saldo := IBQsaldo.FieldByName('SALDO_ACTUAL').AsInteger;

          IBQmaestro.Close;
          IBQmaestro.ParamByName('ID_AGENCIA').AsInteger := _agencia;
          IBQmaestro.ParamByName('ID_TIPO_CAPTACION').AsInteger := _tipocuenta;
          IBQmaestro.ParamByName('NUMERO_CUENTA').AsInteger := _numerocuenta;
          IBQmaestro.ParamByName('DIGITO_CUENTA').AsInteger := _digitocuenta;
          IBQmaestro.Open;

          _id_identificacion := IBQmaestro.FieldByName('ID_IDENTIFICACION').AsInteger;
          _id_persona := IBQmaestro.FieldByName('ID_PERSONA').AsString;

          IBQpersona.Close;
          IBQpersona.ParamByName('ID_IDENTIFICACION').AsInteger := _id_identificacion;
          IBQpersona.ParamByName('ID_PERSONA').AsString := _id_persona;
          IBQpersona.Open;

          _record.Consecutivo := '';
          _record.FechaTransaccion := '';
          _record.ValorTransaccion := '';
          _record.TipoTransaccion := '';
          _record.PaisTransaccion := '';
          _record.CodigoDeptoMuni := '';
          _record.TipoTarjeta := '';
          _record.NumeroTarjeta := '';
          _record.ValorCupo := '';
          _record.CodigoFranquicia := '';
          _record.SaldoTarjeta := '';
          _record.TipoIdentificacion := '';
          _record.NumeroIdentificacion := '';
          _record.DigitoVerificacion := '';
          _record.PrimerApellido := '';
          _record.SegundoApellido := '';
          _record.PrimerNombre := '';
          _record.SegundoNombre := '';
          _record.RazonSocial := '';

          _record.Consecutivo := Format('%.10d', [IBQmovs.RecNo]);
          _fechatmp := IBQmovs.FieldByName('FECHA_REGISTRO').AsString;
          _fechatmp := LeftStr(_fechatmp, 4) + '-' + MidStr(_fechatmp, 5, 2) + '-' + RightStr(_fechatmp, 2);
          _record.FechaTransaccion := fechatmp;
          _record.ValorTransaccion := Format('%.20d', [IBQmovs.FieldByName('VALOR').AsInteger]);
          _record.TipoTransaccion := ''; // Mirar Tabla
          _record.PaisTransaccion := IBQmovs.FieldByName('TERMINAL_PAIS').AsString;
          _record.CodigoDeptoMuni := 

        end;
end;

end.
