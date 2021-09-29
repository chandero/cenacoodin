program Solicitud;

uses
  Forms,
  UnitSolicitudCre in 'Unit\UnitSolicitudCre.pas' {FrmSolicitudCre},
  UnitPrincipal in 'Unit\UnitPrincipal.pas' {FrMain},
  UnitDatamodulo in 'Unit\UnitDatamodulo.pas' {DataGeneral: TDataModule},
  UnitRequisitos in 'Unit\UnitRequisitos.pas' {FrmRequisitos},
  UnitImpresion in 'Unit\UnitImpresion.pas' {FrmImpresion},
  UnitVistaPreliminar in '..\Creditos_en_Desarrollo_ultimos cambios\units\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitBuscarTexto in '..\Creditos_en_Desarrollo_ultimos cambios\units\UnitBuscarTexto.pas' {frmBuscarTexto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrMain, FrMain);
  Application.CreateForm(TFrmImpresion, FrmImpresion);
  Application.CreateForm(TfrmVistaPreliminar, frmVistaPreliminar);
  Application.CreateForm(TfrmBuscarTexto, frmBuscarTexto);
  Application.Run;
end.
