unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UnitDmGeneral, ComCtrls, ExtCtrls, StdCtrls, Mask,
  Buttons, ToggleButton, DateUtils, JvEdit, JvTypedEdit, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmCierreMes = class(TForm)
    MainMenu1: TMainMenu;
    Manuales1: TMenuItem;
    LiquidacindeIntersdeCaptacin1: TMenuItem;
    mnuAuto: TMenuItem;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    edHoraLiquidacion: TMaskEdit;
    btnHoraLiquidacion: TToggleButton;
    CausacinyProvisindeCartera1: TMenuItem;
    mnuCausacionAuto: TMenuItem;
    Label2: TLabel;
    edHoraCausacion: TMaskEdit;
    btnHoraCausacion: TToggleButton;
    Label3: TLabel;
    edNotas: TJvIntegerEdit;
    btnNotas: TToggleButton;
    Label4: TLabel;
    edHoraNota: TMaskEdit;
    IBQnotas: TIBQuery;
    procedure LiquidacindeIntersdeCaptacin1Click(Sender: TObject);
    procedure mnuAutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnEditarHoraLiquidacionClick(Sender: TObject);
    procedure btnHoraLiquidacionClick(Sender: TObject);
    procedure CausacinyProvisindeCartera1Click(Sender: TObject);
    procedure mnuCausacionAutoClick(Sender: TObject);
    procedure btnHoraCausacionClick(Sender: TObject);
    procedure btnNotasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCierreMes: TFrmCierreMes;

implementation

{$R *.dfm}

uses IniFiles, UnitLiquidacionInteresesCaptacion, UnitLiquidacionYCausacionAuto, UnitGlobales, UnitCausacionCarteraDiaria, UnitCausacionCarteraDiariaAuto;

procedure TFrmCierreMes.LiquidacindeIntersdeCaptacin1Click(
  Sender: TObject);
  var frmLiquidacionInteresesCaptacion: TfrmLiquidacionInteresesCaptacion;
begin
     frmLiquidacionInteresesCaptacion := TfrmLiquidacionInteresesCaptacion.Create(self);
     frmLiquidacionInteresesCaptacion.ShowModal;
end;

procedure TFrmCierreMes.mnuAutoClick(Sender: TObject);
var
  frmLiquidacionYCausacionAuto : TfrmLiquidacionYCausacionAuto;
begin
   frmLiquidacionYCausacionAuto := TfrmLiquidacionYCausacionAuto.Create(self);
   frmLiquidacionYCausacionAuto.ShowModal;
end;

procedure TFrmCierreMes.FormShow(Sender: TObject);
var
  MiINI: String;
begin

  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','100.21.210.24');
    DBPath := ReadString('DBNAME','path','/base/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    _sServerImagen := ReadString('DBNAME','serverimagen','');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','LA PLAYA DE BELEN N.S.');
  finally
    free;
  end;

                dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
                dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
                dmGeneral.IBDatabase1.Params.Values['User_Name'] := 'SYSDBA';
                dmGeneral.IBDatabase1.Params.Values['PassWord'] := 'masterkey';
                dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := 'CAPTACIONES';
                dmGeneral.IBDatabase1.Open;
end;

procedure TFrmCierreMes.Timer1Timer(Sender: TObject);
var
 _hora: String;
 _fecha: TDateTime;
 _hoy: TDate;
 _vNota, _I: Integer;
 _vUNota: Integer;
begin
  _hora := TimeToStr(Time);
  StatusBar1.Panels[0].Text := _hora;
  if (_hora = edHoraLiquidacion.Text) then
  begin
     mnuAuto.Click;
  end;

  _hoy := fFechaActual;
  TryEncodeDate(YearOf(_hoy),MonthOf(_hoy),DaysInAMonth(YearOf(_hoy),MonthOf(_hoy)),_fecha);
  if (_hoy = _fecha) then
  begin
     if (_hora = edHoraCausacion.Text) then
     begin
       mnuCausacionAuto.Click;
     end;
  end;

  _hoy := fFechaActual;
  TryEncodeDate(YearOf(_hoy),MonthOf(_hoy),DaysInAMonth(YearOf(_hoy),MonthOf(_hoy)),_fecha);
  if (_hoy = _fecha) then
  begin
     if (_hora = edHoraNota.Text) then
     begin
        IBQnotas.Close;
        IBQnotas.SQL.Clear;
        IBQnotas.SQL.Add('SELECT g.CONSECUTIVO FROM "gen$consecutivos" g');
        IBQnotas.SQL.Add(' WHERE ("gen$consecutivos".ID_CONSECUTIVO = 1) ');
        IBQnotas.Open;
        _vNota := IBQnotas.FieldByName('CONSECUTIVO').AsInteger;

        IBQnotas.Close;
        IBQnotas.SQL.Clear;
        IBQnotas.SQL.Add('INSERT INTO CON$COMPROBANTE VALUES (:ID_COMPROBANTE, :ID_AGENCIA, :TIPO_COMPROBANTE, :FECHADIA, :DESCRIPCION, :TOTAL_DEBITO, :TOTAL_CREDITO, :ESTADO, :IMPRESO, :ANULACION, :ID_EMPLEADO)');
        IBQnotas.ParamByName('ID_AGENCIA').AsInteger := 1;
        IBQnotas.ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
        IBQnotas.ParamByName('FECHADIA').AsDate := _hoy;
        IBQnotas.ParamByName('DESCRIPCION').AsString := '';
        IBQnotas.ParamByName('TOTAL_DEBITO').AsCurrency := 0;
        IBQnotas.ParamByName('TOTAL_CREDITO').AsCurrency := 0;
        IBQnotas.ParamByName('ESTADO').AsString := 'O';
        IBQnotas.ParamByName('IMPRESO').AsInteger := 0;
        IBQnotas.ParamByName('ANULACION').Clear;
        IBQnotas.ParamByName('ID_EMPLEADO').AsString := 'AUTOMATICO';

        for _I := 1 to edNotas.Value do
        begin
            IBQnotas.ParamByName('ID_COMPROBANTE').AsInteger := _vNota + _I;
            IBQnotas.ExecSQL;
        end;

        _vUNota := _vNota + edNotas.Value;

        IBQnotas.Close;
        IBQnotas.SQL.Clear;
        IBQnotas.SQL.Add('UPDATE "gen$consecutivos" set CONSECUTIVO = :CONSECUTIVO WHERE ID_CONSECUTIVO = 1');
        IBQnotas.ParamByName('CONSECUTIVOS').AsInteger := _vUNota;
        IBQnotas.ExecSQL;

        IBQnotas.Close;
        IBQnotas.SQL.Clear;
        IBQnotas.SQL.Add('insert into "con$controlnotas" values (:ID_AGENCIA,:ID_EMPLEADO,:NUMERO_NOTAS,');
        IBQnotas.SQL.Add(':ID_COMPROBANTE_INICIO,:ID_COMPROBANTE_FINAL,:FECHA,:HORA,:ID_EMPLEADO_AGENCIA)');
        IBQnotas.ParamByName('ID_AGENCIA').AsInteger := 1;
        IBQnotas.ParamByName('ID_EMPLEADO').AsString := 'AUTOMATICO';
        IBQnotas.ParamByName('NUMERO_NOTAS').AsInteger := edNotas.Value;
        IBQnotas.ParamByName('ID_COMPROBANTE_INICIO').AsInteger := _vNota + 1;
        IBQnotas.ParamByName('ID_COMPROBANTE_FINAL').AsInteger := _vUnota;
        IBQnotas.ParamByName('FECHA').AsDate := _hoy;
        IBQnotas.ParamByName('HORA').AsTime := fHoraActual;
        IBQnotas.ParamByName('ID_EMPLEADO_AGENCIA').AsString := 'AUTOMATICO';
        IBQnotas.ExecSQL;

     end;


  end;  

end;

procedure TFrmCierreMes.btnEditarHoraLiquidacionClick(Sender: TObject);
begin
        edHoraLiquidacion.ReadOnly := False;
end;

procedure TFrmCierreMes.btnHoraLiquidacionClick(Sender: TObject);
begin
        if (btnHoraLiquidacion.Checked) then
           edHoraLiquidacion.ReadOnly := False
        else
           edHoraLiquidacion.ReadOnly := True;
end;

procedure TFrmCierreMes.CausacinyProvisindeCartera1Click(Sender: TObject);
var
  frmCausacionCarteraDiaria : TfrmCausacionCarteraDiaria;
begin
       frmCausacionCarteraDiaria := TfrmCausacionCarteraDiaria.Create(self);
       frmCausacionCarteraDiaria.ShowModal;
end;

procedure TFrmCierreMes.mnuCausacionAutoClick(Sender: TObject);
var
  frmCausacionCarteraDiariaAuto : TfrmCausacionCarteraDiariaAuto;
begin
       frmCausacionCarteraDiariaAuto := TfrmCausacionCarteraDiariaAuto.Create(self);
       frmCausacionCarteraDiariaAuto.ShowModal;
end;

procedure TFrmCierreMes.btnHoraCausacionClick(Sender: TObject);
begin
        if (btnHoraCausacion.Checked) then
           edHoraCausacion.ReadOnly := False
        else
           edHoraCausacion.ReadOnly := True;
end;

procedure TFrmCierreMes.btnNotasClick(Sender: TObject);
begin
        if (btnNotas.Checked) then
        begin
           edNotas.ReadOnly := False;
           edHoraNota.ReadOnly := False;
        end
        else
        begin
           edNotas.ReadOnly := True;
           edHoraNota.ReadOnly := True;
        end;
end;

end.
