unit UnitdmPersona;

interface

uses
  SysUtils, Classes, IBCustomDataSet, DB, IBQuery, IBDatabase;

type
  TdmPersona = class(TDataModule)
    IBQuery: TIBQuery;
    DStiposrelacion: TDataSource;
    DStiposciiu: TDataSource;
    DStiposidentificacion: TDataSource;
    DStipopersona: TDataSource;
    DSestadocivil: TDataSource;
    DStiposidentificacionconyuge: TDataSource;
    DStipodireccion: TDataSource;
    DStiporeferencia: TDataSource;
    DSparentesco: TDataSource;
    IBQuery1: TIBQuery;
    IBTPersonas: TIBTransaction;
    IBDStiposidentificacion: TIBQuery;
    IBDStiposrelacion: TIBQuery;
    IBDStiposciiu: TIBQuery;
    IBDStipopersona: TIBQuery;
    IBDSestadocivil: TIBQuery;
    IBDStiposidentificacionconyuge: TIBQuery;
    IBDStipodireccion: TIBQuery;
    IBDStiporeferencia: TIBQuery;
    IBDSparentesco: TIBQuery;
    DSMunicipio: TDataSource;
    IBMunicipio: TIBQuery;
    IBDSnivelestudio: TIBQuery;
    IBDSestrato: TIBQuery;
    DSnivelestudio: TDataSource;
    DSestrato: TDataSource;
    DSvivienda: TDataSource;
    IBDSvivienda: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPersona: TdmPersona;

implementation

{$R *.dfm}

uses UnitdmGeneral;

end.
