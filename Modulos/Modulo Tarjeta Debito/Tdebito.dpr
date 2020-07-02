program Tdebito;

uses
  Forms,
  unitMain in 'Units\unitMain.pas' {frmMain},
  UnitCambiarContrasena in 'Units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  UnitReLogin in 'Units\UnitReLogin.pas' {frmReLogin},
  UnitdmGeneral in 'Units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  unitLogin in 'Units\unitLogin.pas' {frmLogin},
  Consts in 'Units\Consts.pas',
  UnitDescarMOVTD in 'Units\UnitDescarMOVTD.pas' {frmDescarMOVTD},
  UnitInformeMovDia in 'Units\UnitInformeMovDia.pas' {frmInformeMovDia},
  UnitGlobalTd in 'Units\UnitGlobalTd.pas',
  UnitConexion in 'Units\UnitConexion.pas',
  UnitClaseXml in 'Units\UnitClaseXml.pas',
  UnitClaseData in 'Units\UnitClaseData.pas',
  UnitClaseTcp in 'Units\UnitClaseTcp.pas',
  UnitTarjetasNovedades in 'Units\UnitTarjetasNovedades.pas' {frmTarjetasNovedades},
  UnitClaseComprobante in 'Units\UnitClaseComprobante.pas',
  UnitPantallaProgreso in '..\..\Units\UnitPantallaProgreso.pas' {frmProgreso};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Módulo Tarjeta Débito';
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmProgreso, frmProgreso);
  Application.Run;
end.
