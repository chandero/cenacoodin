unit UnitReversoNormalizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Grids, DBGrids, ComCtrls, Buttons,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TfrmReversoNormalizar = class(TForm)
    Label1: TLabel;
    edColocacion: TEdit;
    edAsociado: TEdit;
    DSplan: TDataSource;
    DSNplan: TDataSource;
    CDSplan: TClientDataSet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edFCapital: TDateTimePicker;
    Label3: TLabel;
    edFInteres: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edFNCapital: TDateTimePicker;
    edFNInteres: TDateTimePicker;
    GroupBox3: TGroupBox;
    DBGplan: TDBGrid;
    GroupBox4: TGroupBox;
    DBGNplan: TDBGrid;
    btnCerrar: TBitBtn;
    btnReverso: TBitBtn;
    Label6: TLabel;
    edDiasPago: TEdit;
    edPeriodoGracia: TEdit;
    Label7: TLabel;
    IBTransaction1: TIBTransaction;
    IBQplan: TIBQuery;
    IBQcolocacion: TIBQuery;
    CDSplanCUOTA_NUMERO: TIntegerField;
    CDSplanFECHA_A_PAGAR: TDateField;
    CDSplanCAPITAL_A_PAGAR: TCurrencyField;
    CDSplanINTERES_A_PAGAR: TCurrencyField;
    CDSplanPAGADA: TBooleanField;
    CDSNplan: TClientDataSet;
    CDSNplanCUOTA_NUMERO: TIntegerField;
    CDSNplanFECHA_A_PAGAR: TDateField;
    CDSNplanCAPITAL_A_PAGAR: TCurrencyField;
    CDSNplanINTERES_A_PAGAR: TCurrencyField;
    CDSNplanPAGADA: TBooleanField;
    IBQnormalizar: TIBQuery;
    procedure btnReversoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure DBGplanDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGNplanDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CDSplanPAGADAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CDSNplanPAGADAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
    _vColocacion: String;
    _vDiasPeriodo: Integer;
    _vId: Int64;
  public
    { Public declarations }
     property Colocacion:String  read _vColocacion write _vColocacion;
     property DiasPeriodoGracias: Integer read _vDiasPeriodo write _vDiasPeriodo;
     property Id: Int64 read _vId write _vId;
  end;

var
  frmReversoNormalizar: TfrmReversoNormalizar;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitGlobalesCol;

procedure TfrmReversoNormalizar.btnReversoClick(Sender: TObject);
begin
        if (MessageDlg('Seguro de Reversar la Normalización de la Colocación', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
           IBQnormalizar.SQL.Clear;
           IBQnormalizar.SQL.Add('UPDATE "col$tablaliquidacion" SET FECHA_A_PAGAR = :FECHA_A_PAGAR WHERE ID_COLOCACION = :ID_COLOCACION AND');
           IBQnormalizar.SQL.Add('CUOTA_NUMERO = :CUOTA_NUMERO');
           CDSNplan.First;
           while not CDSNplan.Eof do
           begin
             if (CDSNplanPAGADA.Value = False) then
             begin
               IBQnormalizar.Close;
               IBQnormalizar.ParamByName('ID_COLOCACION').AsString := _vColocacion;
               IBQnormalizar.ParamByName('CUOTA_NUMERO').AsInteger := CDSNplanCUOTA_NUMERO.Value;
               IBQnormalizar.ParamByName('FECHA_A_PAGAR').AsDate := CDSNplanFECHA_A_PAGAR.Value;
               IBQnormalizar.ExecSQL;
             end;
             CDSNplan.Next;
           end;
           IBQnormalizar.Close;
           IBQnormalizar.SQL.Clear;
           IBQnormalizar.SQL.Add('UPDATE "col$colocacion" SET FECHA_CAPITAL = :FECHA_CAPITAL, FECHA_INTERES = :FECHA_INTERES, DIAS_PAGO = :DIAS_PAGO WHERE ID_COLOCACION = :ID_COLOCACION');
           IBQnormalizar.ParamByName('FECHA_CAPITAL').AsDate := edFNCapital.Date;
           IBQnormalizar.ParamByName('FECHA_INTERES').AsDate := edFNInteres.Date;
           IBQnormalizar.ParamByName('DIAS_PAGO').AsInteger := IBQcolocacion.FieldByName('DIAS_PAGO').AsInteger + _vDiasPeriodo;
           IBQnormalizar.ParamByName('ID_COLOCACION').AsString := _vColocacion;
           IBQnormalizar.ExecSQL;

           IBQnormalizar.Close;
           IBQnormalizar.SQL.Clear;
           IBQnormalizar.SQL.Add('UPDATE COL_PERIODO_GRACIA SET ESTADO = :ESTADO, FECHA_CANCELADO = :FECHA_CANCELADO WHERE ID = :ID');
           IBQnormalizar.ParamByName('ESTADO').AsInteger := 0;
           IBQnormalizar.ParamByName('FECHA_CANCELADO').Clear;
           IBQnormalizar.ParamByName('ID').AsInteger := _vId;
           IBQnormalizar.ExecSQL;

           IBQnormalizar.ExecSQL;

           IBTransaction1.Commit;
           ShowMessage('Colocación Normalizada y Plan de Pago Actualizado Con Exito!');
           btnCerrar.Click;
        end
        else
          ShowMessage('No Se Realizó Ninguna Actualización');
end;

procedure TfrmReversoNormalizar.FormShow(Sender: TObject);
var
  _vFecha :TDate;
begin
        edColocacion.Text := _vColocacion;
        IBQcolocacion.Close;
        IBQcolocacion.ParamByName('ID_COLOCACION').AsString := _vColocacion;
        IBQcolocacion.Open;

        edAsociado.Text := IBQcolocacion.FieldByName('ASOCIADO').AsString;
        edDiasPago.Text := IntToStr(IBQcolocacion.FieldByName('DIAS_PAGO').AsInteger);

        edFCapital.Date := IBQcolocacion.FieldByName('FECHA_CAPITAL').AsDateTime;
        edFInteres.Date := IBQcolocacion.FieldByName('FECHA_INTERES').AsDateTime;

        edPeriodoGracia.Text := IntToStr(IBQcolocacion.FieldByName('DIAS_PAGO').AsInteger + _vDiasPeriodo);

        _vFecha := CalculoFecha(edFCapital.Date, -_vDiasPeriodo);
        edFNCapital.Date := _vFecha;
        _vFecha := CalculoFecha(edFInteres.Date, -_vDiasPeriodo);
        edFNInteres.Date := _vFecha;

        IBQplan.Close;
        IBQplan.ParamByName('ID_COLOCACION').AsString := _vColocacion;
        IBQplan.Open;

        CDSplan.Open;
        CDSplan.EmptyDataSet;

        while not IBQplan.Eof do
        begin
            CDSplan.Append;
            CDSplanCUOTA_NUMERO.Value := IBQplan.FieldByName('CUOTA_NUMERO').AsInteger;
            CDSplanFECHA_A_PAGAR.Value := IBQplan.FieldByName('FECHA_A_PAGAR').AsDateTime;
            CDSplanCAPITAL_A_PAGAR.Value := IBQplan.FieldByName('CAPITAL_A_PAGAR').AsCurrency;
            CDSplanINTERES_A_PAGAR.Value := IBQplan.FieldByName('INTERES_A_PAGAR').AsCurrency;
            CDSplanPAGADA.Value := IntToBoolean(IBQplan.FieldByName('PAGADA').AsInteger);
            CDSplan.Post;

            CDSNplan.Append;
            CDSNplanCUOTA_NUMERO.Value := IBQplan.FieldByName('CUOTA_NUMERO').AsInteger;
            if (IBQplan.FieldByName('PAGADA').AsInteger = 0) then
            begin
              CDSNplanFECHA_A_PAGAR.Value := CalculoFecha(IBQplan.FieldByName('FECHA_A_PAGAR').AsDateTime, -_vDiasPeriodo); 
            end
            else
            begin
               CDSNplanFECHA_A_PAGAR.Value := IBQplan.FieldByName('FECHA_A_PAGAR').AsDateTime;
            end;
            CDSNplanCAPITAL_A_PAGAR.Value := IBQplan.FieldByName('CAPITAL_A_PAGAR').AsCurrency;
            CDSNplanINTERES_A_PAGAR.Value := IBQplan.FieldByName('INTERES_A_PAGAR').AsCurrency;
            CDSNplanPAGADA.Value := IntToBoolean(IBQplan.FieldByName('PAGADA').AsInteger);
            CDSNplan.Post;


            IBQplan.Next;
        end;

end;

procedure TfrmReversoNormalizar.FormCreate(Sender: TObject);
begin
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction1.StartTransaction;
end;

procedure TfrmReversoNormalizar.btnCerrarClick(Sender: TObject);
begin
   if (IBTransaction1.InTransaction) then
      IBTransaction1.Rollback;
   Close;
end;

procedure TfrmReversoNormalizar.DBGplanDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
          if CDSplanPAGADA.Value = False then
            DBGplan.Canvas.Brush.Color := clYellow;
          DBGplan.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmReversoNormalizar.DBGNplanDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
          if CDSNplanPAGADA.Value = False then
            DBGNplan.Canvas.Brush.Color := clYellow;
          DBGNplan.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmReversoNormalizar.CDSplanPAGADAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if (Sender.Value = False) Then Text := 'No'
    else Text := 'Si';
    DisplayText := True;
end;

procedure TfrmReversoNormalizar.CDSNplanPAGADAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if (Sender.Value = False) Then Text := 'No'
    else Text := 'Si';
    DisplayText := True;
end;

end.
