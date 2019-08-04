unit UnitAdicionarReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, Buttons, ExtCtrls, ComCtrls, DB,
  IBCustomDataSet, IBQuery, DBGrids, DBCtrls;

type
  TMiDBGrid = class(TDBGrid);

type
  TfrmActualizaReal = class(TForm)
    DSReal: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    EdNumeroColocacion: TMaskEdit;
    DBGridReal: TDBGrid;
    Panel3: TPanel;
    BtnAceptar: TBitBtn;
    BtnCerrar: TBitBtn;
    IBDSReal: TIBDataSet;
    IBDSRealID_AGENCIA: TSmallintField;
    IBDSRealID_COLOCACION: TIBStringField;
    IBDSRealNUMERO_ESCRITURA: TIBStringField;
    IBDSRealFECHA_ESCRITURA: TDateField;
    IBDSRealNOMBRE_NOTARIA: TIBStringField;
    IBDSRealCIUDAD_ESCRITURA: TIBStringField;
    IBDSRealMATRICULA_INMOBILIARIA: TIBStringField;
    IBDSRealFECHA_REGISTRO: TDateField;
    IBDSRealAVALUO: TIBBCDField;
    IBDSRealFECHA_AVALUO: TDateField;
    IBDSRealCUENTAS_DE_ORDEN: TIBBCDField;
    IBDSRealPOLIZA_INCENDIO: TIBStringField;
    IBDSRealVALOR_ASEGURADO: TIBBCDField;
    IBDSRealFECHA_INICIAL_POLIZA: TDateField;
    IBDSRealFECHA_FINAL_POLIZA: TDateField;
    IBDSRealCODIGO_ASEGURADORA: TIBStringField;
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure BtnCerrarClick(Sender: TObject);
    procedure DBGridRealEditButtonClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActualizaReal: TfrmActualizaReal;
  vcolocacion : string;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, Unitcalendario;

procedure TfrmActualizaReal.EdNumeroColocacionExit(Sender: TObject);
begin
        vcolocacion := trim(EdNumeroColocacion.Text);
        IBDSReal.ParamByName('ID_AGENCIA').AsInteger := agencia;
        IBDSReal.ParamByName('ID_COLOCACION').AsString := vcolocacion;
        IBDSReal.Open;
        IBDSReal.Last;
        IBDSReal.First;
        if IBDSReal.RecordCount > 0 then
           BtnAceptar.Enabled := True
        else
         begin
           MessageDlg('No Exiten Registros para esta Colocación',mtInformation,[mbOK],0);
           EdNumeroColocacion.Text := '';
           EdNumeroColocacion.SetFocus;
           IBDSReal.Close;
         end;
end;


procedure TfrmActualizaReal.EdNumeroColocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmActualizaReal.FormShow(Sender: TObject);
begin
        if IBDSReal.Transaction.InTransaction then
           IBDSReal.Transaction.Rollback;
        IBDSReal.Transaction.StartTransaction;
        EdNumeroColocacion.SetFocus;
end;

procedure TfrmActualizaReal.BtnAceptarClick(Sender: TObject);
begin
        IBDSReal.DataBase.ApplyUpdates([IBDSReal]);
        IBDSReal.Close;
        EdNumeroColocacion.Text := '';
end;

procedure TfrmActualizaReal.BtnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmActualizaReal.DBGridRealEditButtonClick(Sender: TObject);
var frmCalendario:TfrmCalendario;
    Columna,Fila :Integer;
    Celda:TRect;
begin
        frmCalendario := TfrmCalendario.Create(self);
        Columna := TMiDBGrid(DBGridReal).Col;
        Fila := TMiDBGrid(DBGridReal).Row;
        Celda := TMiDBGrid(DBGridReal).CellRect(Columna,Fila);
        frmCalendario.Left := Self.Left + Celda.Left + 5;
        frmCalendario.Top := Self.Top + Celda.Top + TMiDBGrid(DBGridReal).RowHeights[Fila] * 3;
        frmCalendario.ShowModal;
        begin
           IBDSReal.Edit;
           DBGridReal.SelectedField.Value := frmCalendario.Fecha;
           frmCalendario.Free;
        end;
end;

end.
