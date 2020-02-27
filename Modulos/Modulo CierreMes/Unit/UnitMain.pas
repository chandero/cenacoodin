unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UnitDmGeneral, ComCtrls, ExtCtrls, StdCtrls, Mask,
  Buttons, ToggleButton, DateUtils;

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
    procedure LiquidacindeIntersdeCaptacin1Click(Sender: TObject);
    procedure mnuAutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnEditarHoraLiquidacionClick(Sender: TObject);
    procedure btnHoraLiquidacionClick(Sender: TObject);
    procedure CausacinyProvisindeCartera1Click(Sender: TObject);
    procedure mnuCausacionAutoClick(Sender: TObject);
    procedure btnHoraCausacionClick(Sender: TObject);
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

end.
