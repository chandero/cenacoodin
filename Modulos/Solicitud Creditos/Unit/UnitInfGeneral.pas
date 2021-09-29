unit UnitInfGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBDatabase, DB, IBCustomDataSet, IBQuery, Grids,
  DBGrids, ExtCtrls, Buttons, DBCtrls, ComCtrls;

type
  TFrmInfGeneral = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Ocupacion: TEdit;
    Label2: TLabel;
    Profesion: TEdit;
    Label3: TLabel;
    Empresa: TEdit;
    Label4: TLabel;
    Cargo: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    IBvehiculo: TIBQuery;
    DataSource1: TDataSource;
    IBTransaction1: TIBTransaction;
    IBbienes: TIBQuery;
    DSbien: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DBestudio: TDBLookupComboBox;
    DBvivienda: TDBLookupComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid2: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    DScrediticia: TDataSource;
    IBcrediticia: TIBQuery;
    DBGrid3: TDBGrid;
    IBbienesDESCRIPCION_BIEN: TIBStringField;
    IBbienesBARRIO: TIBStringField;
    IBbienesDIRECCION: TIBStringField;
    IBbienesCIUDAD: TIBStringField;
    IBbienesVALOR_COMERCIAL: TIBBCDField;
    IBbienesES_HIPOTECA: TSmallintField;
    IBbienesAFAVORDE: TIBStringField;
    IBbienesID_IDENTIFICACION: TSmallintField;
    IBbienesID_PERSONA: TIBStringField;
    IBvehiculoID_VEHICULO: TIntegerField;
    IBvehiculoNUMERO_PLACA: TIBStringField;
    IBvehiculoDESCRIPCION: TIBStringField;
    IBvehiculoPIGNORADO: TSmallintField;
    IBvehiculoVALOR_COMERCIAL: TIBBCDField;
    IBvehiculoID_IDENTIFICACION: TSmallintField;
    IBvehiculoID_PERSONA: TIBStringField;
    IBvehiculoMARCA: TIBStringField;
    DSestudio: TDataSource;
    DSvivienda: TDataSource;
    IBvivienda: TIBQuery;
    IBestudio: TIBQuery;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInfGeneral: TFrmInfGeneral;

implementation

{$R *.dfm}

procedure TFrmInfGeneral.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

end.
