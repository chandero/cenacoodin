unit UnitConsultaPeriodoGracia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DataSetToExcel, DB, DBClient,
  Grids, DBGrids, IBCustomDataSet, IBQuery, UnitDmGeneral, IBDatabase, Mask,
  JvEdit, JvTypedEdit, UnitBuscarColocacion, IBSQL, ComCtrls;

type
  TfrmConsultaPeriodoGracia = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    CDSperiodogracia: TClientDataSet;
    DBGperiodogracias: TDBGrid;
    CDSperiodograciaID_COLOCACION: TStringField;
    CDSperiodograciaNOMBRE: TStringField;
    CDSperiodograciaFECHA_CAPITAL: TDateField;
    CDSperiodograciaFECHA_INTERES: TDateField;
    CDSperiodograciaDIAS: TIntegerField;
    CDSperiodograciaSE_CAUSA: TBooleanField;
    DSperiodogracia: TDataSource;
    IBQperiodogracia: TIBQuery;
    IBTperiodogracia: TIBTransaction;
    SD1: TSaveDialog;
    btnCerrar: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    edColocacion: TMaskEdit;
    Label2: TLabel;
    edAsociado: TEdit;
    btnExcel: TBitBtn;
    Label3: TLabel;
    edMora: TJvIntegerEdit;
    btnAgregar: TBitBtn;
    btnEliminar: TBitBtn;
    Label4: TLabel;
    edPeriodoGracia: TJvIntegerEdit;
    IBQcolocacion: TIBQuery;
    CmdBuscar: TSpeedButton;
    IBSQL1: TIBSQL;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edFechaCapital: TDateTimePicker;
    edFechaInteres: TDateTimePicker;
    IBQproceso: TIBQuery;
    chkCausa: TCheckBox;
    IBTproceso: TIBTransaction;
    btnLimpiar: TBitBtn;
    btnNormalizar: TButton;
    CDSperiodograciaESTADO: TIntegerField;
    btnReversoNormalizar: TButton;
    CDSperiodograciaFECHA_REGISTRO: TDateTimeField;
    CDSperiodograciaID: TLargeintField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure edColocacionExit(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure DBGperiodograciasCellClick(Column: TColumn);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnNormalizarClick(Sender: TObject);
    procedure CDSperiodograciaESTADOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btnReversoNormalizarClick(Sender: TObject);
    procedure DBGperiodograciasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmConsultaPeriodoGracia: TfrmConsultaPeriodoGracia;

implementation

{$R *.dfm}


uses UnitGlobales, UnitGlobalesCol, UnitNormalizar, UnitReversoNormalizar;

procedure TfrmConsultaPeriodoGracia.FormCreate(Sender: TObject);
begin
        IBTperiodogracia.DefaultDatabase := dmGeneral.IBDatabase1;
        IBQperiodogracia.Database := dmGeneral.IBDatabase1;
        IBQcolocacion.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBQproceso.Database := dmGeneral.IBDatabase1;


        IBQperiodogracia.Transaction := IBTperiodogracia;
        IBQcolocacion.Transaction := IBTperiodogracia;
        IBQproceso.Transaction := IBTproceso;
        IBSQL1.Transaction := IBTperiodogracia;


end;

procedure TfrmConsultaPeriodoGracia.Inicializar;
begin
        if IBTperiodogracia.InTransaction then
          IBTperiodogracia.Commit;

        if IBTproceso.InTransaction then
          IBTperiodogracia.Commit;
            
        IBTperiodogracia.StartTransaction;

        IBQperiodogracia.Close;
        IBQperiodogracia.SQL.Clear;
        IBQperiodogracia.SQL.Add('SELECT g.ID_COLOCACION, (p.NOMBRE || '' '' || p.PRIMER_APELLIDO || '' '' || p.SEGUNDO_APELLIDO) AS NOMBRE, g.FECHA_CAPITAL, g.FECHA_INTERES, g.FECHA_REGISTRO, g.DIAS, g.SE_CAUSA, g.ESTADO, g.ID FROM COL_PERIODO_GRACIA g');
        IBQperiodogracia.SQL.Add('INNER JOIN "col$colocacion" c ON c.ID_COLOCACION = g.ID_COLOCACION');
        IBQperiodogracia.SQL.Add('INNER JOIN "gen$persona" p ON p.ID_IDENTIFICACION = c.ID_IDENTIFICACION and p.ID_PERSONA = c.ID_PERSONA');
        IBQperiodogracia.SQL.Add('WHERE c.ID_ESTADO_COLOCACION IN (0,1,2) AND g.ESTADO IN (0,8)');
        IBQperiodogracia.Open;

        CDSperiodogracia.Open;
        CDSperiodogracia.EmptyDataSet;

        while not IBQperiodogracia.Eof do
        begin
          CDSperiodogracia.Append;
          CDSperiodograciaID_COLOCACION.Value := IBQperiodogracia.FieldByName('ID_COLOCACION').AsString;
          CDSperiodograciaNOMBRE.Value := IBQperiodogracia.FieldByName('NOMBRE').AsString;
          CDSperiodograciaFECHA_CAPITAL.Value := IBQperiodogracia.FieldByName('FECHA_CAPITAL').AsDateTime;
          CDSperiodograciaFECHA_INTERES.Value := IBQperiodogracia.FieldByName('FECHA_INTERES').AsDateTime;
          CDSperiodograciaFECHA_REGISTRO.Value := IBQperiodogracia.FieldByName('FECHA_REGISTRO').AsDateTime;
          CDSperiodograciaDIAS.Value := IBQperiodogracia.FieldByName('DIAS').AsInteger;
          CDSperiodograciaSE_CAUSA.Value := InttoBoolean(IBQperiodogracia.FieldByName('SE_CAUSA').AsInteger);
          CDSperiodograciaESTADO.Value := IBQperiodogracia.FieldByName('ESTADO').AsInteger;
          CDSperiodograciaID.Value := IBQperiodogracia.FieldByName('ID').AsInteger;
          CDSperiodogracia.Post;

          IBQperiodogracia.Next;
        end;

        btnNormalizar.Enabled := False;
        btnReversoNormalizar.Enabled := False;
end;

procedure TfrmConsultaPeriodoGracia.FormShow(Sender: TObject);
begin
   Inicializar;
end;

procedure TfrmConsultaPeriodoGracia.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsultaPeriodoGracia.btnExcelClick(Sender: TObject);
var
  ExcelFile:TDataSetToExcel;
begin
        CDSperiodogracia.Last;
        CDSperiodogracia.First;
        SD1.Filter := 'Archivos Excel (*.xls)|*.XLS';
        if SD1.Execute then
        begin
          ExcelFile := TDataSetToExcel.Create(CDSperiodogracia,SD1.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

procedure TfrmConsultaPeriodoGracia.edColocacionExit(Sender: TObject);
begin
        //Buscar Información
         IBQcolocacion.Close;
         IBQcolocacion.SQL.Clear;
         IBQcolocacion.SQL.Add('SELECT c.ID_COLOCACION, (p.NOMBRE || '' '' || p.PRIMER_APELLIDO || '' '' || p.SEGUNDO_APELLIDO) AS NOMBRE, c.FECHA_CAPITAL, c.FECHA_INTERES FROM "col$colocacion" c');
         IBQcolocacion.SQL.Add('INNER JOIN "gen$persona" p ON p.ID_IDENTIFICACION = c.ID_IDENTIFICACION and p.ID_PERSONA = c.ID_PERSONA');
         IBQcolocacion.SQL.Add('WHERE c.ID_ESTADO_COLOCACION IN (0,1,2) AND c.ID_COLOCACION = :ID_COLOCACION');
         IBQcolocacion.ParamByName('ID_COLOCACION').AsString := edColocacion.Text;
         IBQcolocacion.Open;
         edAsociado.Text := IBQcolocacion.FieldByName('NOMBRE').AsString;
         edFechaCapital.Date := IBQcolocacion.FieldByName('FECHA_CAPITAL').AsDateTime;
         edFechaInteres.Date := IBQcolocacion.FieldByName('FECHA_INTERES').AsDateTime;
         edMora.Value := ObtenerDiasMora(Agencia, edColocacion.Text, IBSQL1);
end;

procedure TfrmConsultaPeriodoGracia.CmdBuscarClick(Sender: TObject);
var
 frmBusquedadeColocacion: TfrmBusquedadeColocacion;
begin
   frmBusquedadeColocacion := TfrmBusquedadeColocacion.Create(self);
   if (frmBusquedadeColocacion.ShowModal = mrOk) then
   begin
       edColocacion.Text := frmBusquedadeColocacion.Colocacion;
       edColocacionExit(self);
   end;
end;

procedure TfrmConsultaPeriodoGracia.DBGperiodograciasCellClick(
  Column: TColumn);
begin
        // Actualizar datos en la vista
        edColocacion.Text := CDSperiodograciaID_COLOCACION.Value;
        edAsociado.Text := CDSperiodograciaNOMBRE.Value;
        edPeriodoGracia.Value := CDSperiodograciaDIAS.Value;
        edMora.Value := ObtenerDiasMora(Agencia, edColocacion.Text, IBSQL1);
        if (CDSperiodograciaID.Value > 0) and (CDSperiodograciaESTADO.Value = 8) and (edColocacion.Text <> '') and (Length(edColocacion.Text) = 11) then
        begin
           btnReversoNormalizar.Enabled := True;
           btnNormalizar.Enabled := False;
        end
        else if (CDSperiodograciaID.Value > 0) and (CDSperiodograciaESTADO.Value = 0) and (edColocacion.Text <> '') and (Length(edColocacion.Text) = 11) then
        begin
           btnReversoNormalizar.Enabled := False;
           btnNormalizar.Enabled := True;
        end
        else
        begin
           btnReversoNormalizar.Enabled := False;
           btnNormalizar.Enabled := False;
        end;
end;

procedure TfrmConsultaPeriodoGracia.btnAgregarClick(Sender: TObject);
var
  _hoy: TDateTime;
begin

        _hoy := fFechaHoraActual;

        CDSperiodogracia.Append;
        CDSperiodograciaID.Clear;
        CDSperiodograciaID_COLOCACION.Value := edColocacion.Text;
        CDSperiodograciaNOMBRE.Value := edAsociado.Text;
        CDSperiodograciaFECHA_CAPITAL.Value := edFechaCapital.Date;
        CDSperiodograciaFECHA_INTERES.Value := edFechaInteres.Date;
        CDSperiodograciaFECHA_REGISTRO.Value := _hoy;
        CDSperiodograciaDIAS.Value := edPeriodoGracia.Value;
        CDSperiodograciaSE_CAUSA.Value := chkCausa.Checked;
        CDSperiodogracia.Post;


        IBTproceso.StartTransaction;
        IBQproceso.Close;
        IBQproceso.SQL.Clear;
        IBQproceso.SQL.Add('INSERT INTO COL_PERIODO_GRACIA VALUES (:ID_COLOCACION, :FECHA_CAPITAL, :FECHA_INTERES, :FECHA_REGISTRO, :DIAS, :SE_CAUSA, :FECHA_CANCELADO, :ESTADO, :DIAS_COBRADOS)');
        IBQproceso.ParamByName('ID_COLOCACION').AsString := edColocacion.Text;
        IBQproceso.ParamByName('FECHA_CAPITAL').AsDate := edFechaCapital.Date;
        IBQproceso.ParamByName('FECHA_INTERES').AsDate := edFechaInteres.Date;
        IBQproceso.ParamByName('FECHA_REGISTRO').AsDateTime := _hoy;
        IBQproceso.ParamByName('DIAS').AsInteger := edPeriodoGracia.Value;
        IBQproceso.ParamByName('SE_CAUSA').AsInteger := BooleanoToInt(chkCausa.Checked);
        IBQproceso.ParamByName('FECHA_CANCELADO').Clear;
        IBQproceso.ParamByName('ESTADO').AsInteger := 0;
        IBQproceso.ParamByName('DIAS_COBRADOS').AsInteger := 0;
        IBQproceso.ExecSQL;
        IBTproceso.Commit;

        edColocacion.Text := '';
        edAsociado.Text := '';
        edMora.Value := 0;
        edFechaCapital.Date := _hoy;
        edFechaInteres.Date := _hoy;
        edPeriodoGracia.Value := 120;
        chkCausa.Checked := True;

end;

procedure TfrmConsultaPeriodoGracia.btnEliminarClick(Sender: TObject);
var
  _hoy: TDate;
begin

     _hoy := fFechaHoraActual;
     if (MessageDlg('Seguro de Eliminar el Registro?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
     begin
        edColocacion.Text := '';
        edAsociado.Text := '';
        edMora.Value := 0;        
        edFechaCapital.Date := _hoy;
        edFechaInteres.Date := _hoy;
        edPeriodoGracia.Value := 120;
        chkCausa.Checked := True;

        IBTproceso.StartTransaction;
        IBQproceso.Close;
        IBQproceso.SQL.Clear;
        IBQproceso.SQL.Add('UPDATE COL_PERIODO_GRACIA SET ESTADO = :ESTADO, FECHA_CANCELADO = :FECHA_CANCELADO WHERE ID_COLOCACION = :ID_COLOCACION');
        IBQproceso.ParamByName('ID_COLOCACION').AsString := CDSperiodograciaID_COLOCACION.Value;
        IBQproceso.ParamByName('FECHA_CANCELADO').AsDateTime := _hoy;
        IBQproceso.ParamByName('ESTADO').AsInteger := 9;
        IBQproceso.ExecSQL;
        IBTproceso.Commit;

        CDSperiodogracia.Delete;        

     end;
end;

procedure TfrmConsultaPeriodoGracia.btnLimpiarClick(Sender: TObject);
var
  _hoy: TDate;
begin

        _hoy := fFechaHoraActual;
        edColocacion.Text := '';
        edAsociado.Text := '';
        edMora.Value := 0;
        edFechaCapital.Date := _hoy;
        edFechaInteres.Date := _hoy;
        edPeriodoGracia.Value := 120;
        chkCausa.Checked := True;
end;

procedure TfrmConsultaPeriodoGracia.btnNormalizarClick(Sender: TObject);
var
  frmNormalizar: TfrmNormalizar;
begin
        frmNormalizar := TfrmNormalizar.Create(self);
        frmNormalizar.Colocacion := edColocacion.Text;
        frmNormalizar.DiasPeriodoGracias := edPeriodoGracia.Value;
        frmNormalizar.Id := CDSperiodograciaID.Value;
        frmNormalizar.ShowModal;
        Inicializar;
end;

procedure TfrmConsultaPeriodoGracia.CDSperiodograciaESTADOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if (Sender.Value = 0) then
    Text := 'ACTIVO'
  else if (Sender.Value = 8) then
    Text := 'NORMALIZADO';
  DisplayText := True;
end;

procedure TfrmConsultaPeriodoGracia.btnReversoNormalizarClick(
  Sender: TObject);
var
  frmReversoNormalizar: TfrmReversoNormalizar;
begin
        frmReversoNormalizar := TfrmReversoNormalizar.Create(self);
        frmReversoNormalizar.Colocacion := edColocacion.Text;
        frmReversoNormalizar.DiasPeriodoGracias := edPeriodoGracia.Value;
        frmReversoNormalizar.Id := CDSperiodograciaID.Value;
        frmReversoNormalizar.ShowModal;
        Inicializar;
end;

procedure TfrmConsultaPeriodoGracia.DBGperiodograciasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
          if CDSperiodograciaESTADO.Value = 8 then
            DBGperiodogracias.Canvas.Brush.Color := clSkyBlue;
          DBGperiodogracias.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
