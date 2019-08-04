unit UnitCreacionPersonaIndependiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTypedEdit, StdCtrls, JvEdit, Mask, JvToolEdit, DBCtrls,
  Buttons, DB, IBCustomDataSet, IBQuery, IBDatabase, ComCtrls, JvComponent,
  JvEnterTab;

type
  TfrmCreacionPersonaIndependiente = class(TForm)
    edVentasAnuales: TJvCurrencyEdit;
    edNumeroEmpleados: TJvIntegerEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edDescripcion: TEdit;
    btnAceptar: TBitBtn;
    IBTransaction1: TIBTransaction;
    edFechaBalance: TDateTimePicker;
    JvEnterAsTab1: TJvEnterAsTab;
    cbSector: TDBLookupComboBox;
    Label1: TLabel;
    qSector: TIBQuery;
    dsSector: TDataSource;
    procedure edNumeroEmpleadosExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbSectorExit(Sender: TObject);
    procedure edDescripcionExit(Sender: TObject);
    procedure edVentasAnualesExit(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure qSectorAfterScroll(DataSet: TDataSet);
    procedure cbSectorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    _vVentaAnual : Currency;
    _vIdSector : Integer;
    _vDescripcion : String;
    _vFechaBalance: TDate;
    _vNumeroEmpleados: Integer;
    _iOcupacion:Integer;
    _bEsIndependiente:Boolean;
    _sCaption : string;
    procedure SetNumeroEmpleados(value :Integer);
    procedure SetVentaAnual(value: Currency);
    procedure SetIdSector(value: Integer);
    procedure SetFechaBalance(value: TDate);
    procedure SetDescripcion(value: string);
  public
    property VentaAnual: Currency read _vVentaAnual write SetVentaAnual;
    property IdSector: Integer read _vIdSector write SetIdSector;
    property FechaBalance: TDate read _vFechaBalance write SetFechaBalance;
    property NumeroEmpleados: Integer read _vNumeroEmpleados write SetNumeroEmpleados;
    property Descripcion: string read _vDescripcion write SetDescripcion;
    property Ocupacion:Integer read _iOcupacion write _iOcupacion;
    property EsIndependiente:Boolean read _bEsIndependiente write _bEsIndependiente;
    property Titulo:string read _sCaption write _sCaption;
    { Public declarations }
  end;

var
  frmCreacionPersonaIndependiente: TfrmCreacionPersonaIndependiente;

implementation

{$R *.dfm}

uses
UnitGlobales,
UnitDmGeneral;

procedure TfrmCreacionPersonaIndependiente.SetVentaAnual(value: Currency);
begin
    _vVentaAnual := value;
    edVentasAnuales.Value := value;
end;

procedure TfrmCreacionPersonaIndependiente.SetIdSector(value: Integer);
begin
   _vIdSector := value;
   cbSector.KeyValue := value;
end;

procedure TfrmCreacionPersonaIndependiente.SetNumeroEmpleados(value: Integer);
begin
   _vNumeroEmpleados := value;
   edNumeroEmpleados.Value := value;
end;

procedure TfrmCreacionPersonaIndependiente.SetDescripcion(value: String);
begin
   _vDescripcion := value;
   edDescripcion.Text := value;
end;

procedure TfrmCreacionPersonaIndependiente.SetFechaBalance(value: TDate);
begin
   _vFechaBalance := value;
   edFechaBalance.Date := value;
end;


procedure TfrmCreacionPersonaIndependiente.edNumeroEmpleadosExit(
  Sender: TObject);
begin
        _vNumeroEmpleados := edNumeroEmpleados.Value;
end;

procedure TfrmCreacionPersonaIndependiente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action := caHide;
end;

procedure TfrmCreacionPersonaIndependiente.FormCreate(Sender: TObject);
begin
        if IBTransaction1.InTransaction then
          IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
        edDescripcion.Enabled := false;
        qSector.Open;
        qSector.Last;
end;

procedure TfrmCreacionPersonaIndependiente.cbSectorExit(Sender: TObject);
begin
        _vIdSector := cbSector.KeyValue;
end;

procedure TfrmCreacionPersonaIndependiente.edDescripcionExit(
  Sender: TObject);
begin
        _vDescripcion := edDescripcion.Text;
end;

procedure TfrmCreacionPersonaIndependiente.edVentasAnualesExit(
  Sender: TObject);
begin
        _vVentaAnual := edVentasAnuales.Value;
end;

procedure TfrmCreacionPersonaIndependiente.DateTimePicker1Exit(
  Sender: TObject);
begin
        _vFechaBalance := edFechaBalance.Date;
end;

procedure TfrmCreacionPersonaIndependiente.qSectorAfterScroll(
  DataSet: TDataSet);
begin
        if DataSet.FieldByName('ID_SECTOR').AsInteger = 6 then
          edDescripcion.Enabled := true
        else
        begin
          edDescripcion.Text := '';
          edDescripcion.Enabled := false;
        end;
end;

procedure TfrmCreacionPersonaIndependiente.cbSectorClick(Sender: TObject);
begin
        if cbSector.KeyValue = 12 then
          edDescripcion.Enabled := true
        else
          edDescripcion.Enabled := false;
end;

procedure TfrmCreacionPersonaIndependiente.FormShow(Sender: TObject);
begin
        self.Caption := _sCaption;
        if _bEsIndependiente then
        begin
           edFechaBalance.Enabled := True;
           edVentasAnuales.Enabled := True;
           edNumeroEmpleados.Enabled := True;
        end
        else
        begin
           edFechaBalance.Enabled := False;
           _vFechaBalance := 0;
           edVentasAnuales.Enabled := False;
           _vVentaAnual := 0;
           edNumeroEmpleados.Enabled := False;
           _vNumeroEmpleados := 0;
        end;
        if _vIdSector = 12 then
           edDescripcion.Enabled := True;
end;

end.
