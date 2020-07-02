program SolicitudC;

uses
  Forms,
  UnitInformacion in 'Unit\UnitInformacion.pas' {FrmInformacion},
  UnitPrincipal in 'Unit\UnitPrincipal.pas' {FrMain},
  UnitdmGeneral in 'Unit\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitDmSolicitud in 'Unit\UnitDmSolicitud.pas' {DmSolicitud: TDataModule},
  UnitGlobalSolicitud in 'Unit\UnitGlobalSolicitud.pas',
  UnitdmColocacion in 'otraunit\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitBuscaSolicitud in 'Unit\UnitBuscaSolicitud.pas' {FrmBuscaSolicitud},
  UnitImpresion in '..\Modulo Solicitud\Unit\UnitImpresion.pas' {FrmImpresion},
  FR_ChBox in '..\Archivos de programa\FastReports\FastReport\source\FR_ChBox.pas',
  UnitRequisitoscre in 'Unit\UnitRequisitoscre.pas' {FrmRequisitoscre},
  UnitAnalisiscre in 'Unit\UnitAnalisiscre.pas' {FrmAnalisiscre},
  UnitDescObservacion in 'Unit\UnitDescObservacion.pas' {FrmDescObsrevacion},
  UnitDesreferencias in 'Unit\UnitDesreferencias.pas' {FrmReferencias},
  FR_Cross in '..\Archivos de programa\FastReports\FastReport\source\fr_cross.pas' {frCrossForm},
  UnitConsultaSol in 'Unit\UnitConsultaSol.pas' {FrmConsultaSol},
  UnitReporte in 'Unit\UnitReporte.pas' {FrmReporte},
  UnitEnteAprobador in 'Unit\UnitEnteAprobador.pas' {FrmEnteAprobador},
  UnitComCreditos in 'Unit\UnitComCreditos.pas' {FrmComCreditos},
  UnitAnalisisPago in 'Unit\UnitAnalisisPago.pas' {FrmAnalisisPago},
  UnitCreditosFianzas in 'Unit\UnitCreditosFianzas.pas' {FrmCreditosFianzas},
  UnitInfGeneral in 'Unit\UnitInfGeneral.pas' {FrmInfGeneral},
  UnitEstadoSolicitud in 'Unit\UnitEstadoSolicitud.pas' {FrmEstadoSolicitud},
  UnitConsultaProductos in 'consulta\UnitConsultaProductos.pas' {frmConsultaProductos},
  UnitGlobales in '..\Creditos_en_Desarrollo_ultimos cambios\units\UnitGlobales.pas',
  UnitGlobalesCol in '..\Creditos_en_Desarrollo_ultimos cambios\units\UnitGlobalesCol.pas',
  UnitBuscarPersona in '..\Creditos_en_Desarrollo_ultimos cambios\units\UnitBuscarPersona.pas' {frmBuscarPersona},
  UnitConsultaGeneral in 'Unit\UnitConsultaGeneral.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrMain, FrMain);
  Application.CreateForm(TfrmConsultaProductos, frmConsultaProductos);
  Application.CreateForm(TfrmBuscarPersona, frmBuscarPersona);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
