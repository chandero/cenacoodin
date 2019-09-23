unit UnitBuscarPersona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, IBSQL, IBTable, Provider, DBClient, DBLocal, DBLocalI, UnitDmGeneral,
  IBStoredProc;

type
  TfrmBuscarPersona = class(TForm)
    DataSource: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid: TDBGrid;
    EdPrimerApellido: TLabeledEdit;
    EdSegundoApellido: TLabeledEdit;
    EdNombre: TLabeledEdit;
    Panel3: TPanel;
    CmdCerrar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBDataSet1: TIBQuery;
    CmdBuscar: TSpeedButton;
    IBDataSet1ID_IDENTIFICACION: TSmallintField;
    IBDataSet1ID_PERSONA: TIBStringField;
    IBDataSet1PRIMER_APELLIDO: TIBStringField;
    IBDataSet1SEGUNDO_APELLIDO: TIBStringField;
    IBDataSet1NOMBRE: TIBStringField;
    IBDataSet1NUMERO_CUENTA: TIntegerField;
    procedure EdPrimerApellidoChange(Sender: TObject);
    procedure EdSegundoApellidoChange(Sender: TObject);
    procedure EdNombreChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBDataSet1AfterScroll(DataSet: TDataSet);
    procedure CmdBuscarClick(Sender: TObject);
    procedure EdPrimerApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure EdSegundoApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure EdNombreKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vididentificacion:Integer;
    vidpersona:string;
    vnumerocuenta:Integer;
    procedure Actualizar;
  public
    property id_identificacion: Integer read vididentificacion Write vididentificacion;
    property id_persona: string read vidpersona Write vidpersona;
    property numero_cuenta:Integer read vnumerocuenta Write vnumerocuenta;
    { Public declarations }
  end;

var
  frmBuscarPersona: TfrmBuscarPersona;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmBuscarPersona.Actualizar;
begin
        with IBDataSet1 do
        begin
             if Transaction.InTransaction then
                Transaction.Rollback;
             Transaction.StartTransaction;
             
             Close;
             if ( EdPrimerApellido.Text <> '' ) and
                ( EdSegundoApellido.Text <> '' ) and
                ( EdNombre.Text <> '' ) then begin
                SQL.Clear;
                SQL.Add('select * from BUSCARPERSONA01(:PRIMERO,:SEGUNDO,:NOMBRE1)');
                ParamByName('PRIMERO').AsString := '' + EdPrimerApellido.Text + '';
                ParamByName('SEGUNDO').AsString := '' + EdSegundoApellido.text + '';
                ParamByName('NOMBRE1').AsString := '' + EdNombre.Text + '';
             end
             else
             if
               ( EdPrimerApellido.Text <> '' ) and
               ( EdSegundoApellido.Text <> '' ) then begin
                SQL.Clear;
                SQL.Add('select * from BUSCARPERSONA02(:PRIMERO,:SEGUNDO)');
                ParamByName('PRIMERO').AsString := '' + EdPrimerApellido.Text + '';
                ParamByName('SEGUNDO').AsString := '' + EdSegundoApellido.text + '';
             end
             else
             if
               ( EdPrimerApellido.Text <> '' ) then begin
                SQL.Clear;
                SQL.Add('select * from BUSCARPERSONA03(:PRIMERO)');
                ParamByName('PRIMERO').AsString := '' + EdPrimerApellido.Text + '';
             end
             else
             if
               ( EdSegundoApellido.Text <> '' ) then begin
                SQL.Clear;
                SQL.Add('select * from BUSCARPERSONA04(:SEGUNDO)');
                ParamByName('SEGUNDO').AsString := '' + EdSegundoApellido.text + '';
             end
             else
             if ( EdNombre.Text <> '' ) then begin
                SQL.Clear;
                SQL.Add('select * from BUSCARPERSONA05(:NOMBRE1)');
                ParamByName('NOMBRE1').AsString := '' + EdNombre.Text + '';
             end;
             Screen.Cursor := crHourGlass;
             try
               Open;
             finally
               Screen.Cursor := crDefault;
             end;
        end;
        DBGrid.Refresh;

end;

procedure TfrmBuscarPersona.EdPrimerApellidoChange(Sender: TObject);
begin
        Actualizar;
end;

procedure TfrmBuscarPersona.EdSegundoApellidoChange(Sender: TObject);
begin
        Actualizar;
end;

procedure TfrmBuscarPersona.EdNombreChange(Sender: TObject);
begin
        Actualizar;
end;

procedure TfrmBuscarPersona.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        IBDataSet1.Close;
        dmGeneral.Free;
end;

procedure TfrmBuscarPersona.IBDataSet1AfterScroll(DataSet: TDataSet);
begin
        id_identificacion := DataSet.FieldByName('ID_IDENTIFICACION').AsInteger;
        id_persona := DataSet.FieldByName('ID_PERSONA').AsString;
        numero_cuenta := DataSet.FieldByName('NUMERO_CUENTA').AsInteger;
end;

procedure TfrmBuscarPersona.CmdBuscarClick(Sender: TObject);
begin
        Actualizar;
end;

procedure TfrmBuscarPersona.EdPrimerApellidoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
        begin
           Key := #0;
           Actualizar;
        end;
end;

procedure TfrmBuscarPersona.EdSegundoApellidoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
        begin
           Key := #0;
           Actualizar;
        end;

end;

procedure TfrmBuscarPersona.EdNombreKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
        begin
           Key := #0;
           Actualizar;
        end;

end;

procedure TfrmBuscarPersona.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.CommitRetaining;
end;

procedure TfrmBuscarPersona.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBDataSet1.Database := dmGeneral.IBDatabase1;
        IBDataSet1.Transaction := dmGeneral.IBTransaction1;
end;

end.
