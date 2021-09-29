unit UnitGestionTablaLiquidacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, XStringGrid, Mask, DBCtrls,
  CECheckList, IBQuery, DB, IBCustomDataSet, IBTable,
  DBGrids;

type
  TfrmGestionTablaLiquidacion = class(TForm)
    Panel4: TPanel;
    CmdCerrar: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdNumeroColocacion: TMaskEdit;
    GroupBox2: TGroupBox;
    EdSaldoActual: TLabeledEdit;
    EdTasaMax: TLabeledEdit;
    EdTasaNominal: TLabeledEdit;
    EdAgencia: TDBLookupComboBox;
    Label2: TLabel;
    DBGridTabla: TDBGrid;
    DSTabla: TDataSource;
    IBTablaLiquidacion: TIBTable;
    DBCheckBox1: TDBCheckBox;
    IBQuery1: TIBQuery;
    DBNavigator1: TDBNavigator;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EdAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DSTablaDataChange(Sender: TObject; Field: TField);
    procedure DSTablaUpdateData(Sender: TObject);
    procedure DSTablaStateChange(Sender: TObject);
    procedure DBGridTablaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridTablaColExit(Sender: TObject);
    procedure DBGridTablaKeyPress(Sender: TObject; var Key: Char);
  private
    function GetSaldo:Currency;
    procedure SetSaldo(vNewValue:Currency);
    function GetTablaLiq:String;
    procedure SetTablaLiq(Tabla:String);
    procedure Inicializar;
    { Private declarations }
  public
    property Saldo:Currency read GetSaldo write SetSaldo;
    property TablaLiq:String read GetTablaLiq write SetTablaLiq;    
    { Public declarations }
  end;

var
  frmGestionTablaLiquidacion: TfrmGestionTablaLiquidacion;
  vSaldo:Currency;
  SaldoCuota:Currency;
  vTablaLiq:String;
  cambios: boolean;


implementation

{$R *.dfm}

uses UnitGlobalesCol, UnitGlobales, UnitDmGeneral;

function TfrmGestionTablaLiquidacion.GetSaldo:Currency;
begin
        GetSaldo := vSaldo;
end;

procedure TfrmGestionTablaLiquidacion.SetSaldo(vNewValue:Currency);
begin
        vSaldo := vNewValue;
end;

function TfrmGestionTablaLiquidacion.GetTablaLiq:String;
begin
        GetTablaLiq := vTablaLiq;
end;

procedure TfrmGestionTablaLiquidacion.SetTablaLiq(Tabla:String);
begin
        vTablaLiq := Tabla;
end;


procedure TfrmGestionTablaLiquidacion.CmdCerrarClick(Sender: TObject);
begin
        Self.Close;
end;

procedure TfrmGestionTablaLiquidacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

      if cambios then
      begin
        if (MessageDlg('Se realizaron cambios en la tabla, desea guardarlos?',mtConfirmation,[mbYes, mbNo],0)) = mrYes then
        begin
            IBTablaLiquidacion.ApplyUpdates;
            IBTablaLiquidacion.Transaction.Commit;
            ShowMessage('Cambios Aplicados !!');
        end
        else
        begin
            IBTablaLiquidacion.CancelUpdates;
            IBTablaLiquidacion.Transaction.Rollback;
        end;
     end;
        dmGeneral.Free;
        Action := caFree;
end;

procedure TfrmGestionTablaLiquidacion.FormShow(Sender: TObject);

begin
    Inicializar;
end;

procedure TfrmGestionTablaLiquidacion.Inicializar;
var
B : integer;
TasaEfectiva : Double;
TasaAplicada : Double;
SaldoCuota : Currency;
begin

        if dmGeneral.IBTransaction1.InTransaction then
        begin
           dmGeneral.IBTransaction1.Commit;
           dmGeneral.IBTransaction1.StartTransaction;
        end;

        cambios := false;

    IBQuery1 := TIBQuery.Create(self);
    IBQuery1.Database := dmGeneral.IBDatabase1;
    IBQuery1.Transaction := dmGeneral.IBTransaction1;
    with IBQuery1 do
     begin
       SQL.Clear;
       SQL.Add('select ');
       SQL.Add('"col$colocacion".ID_AGENCIA,');
       SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
       SQL.Add('"col$colocacion".ABONOS_CAPITAL,');
       SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
       SQL.Add('"col$colocacion".ID_CLASIFICACION,');
       SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
       SQL.Add('"col$tiposcuota".TIPO_CUOTA,');
       SQL.Add('"col$tiposcuota".INTERES');
       SQL.Add('from "col$colocacion"');
       SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) ');
       SQL.Add(' where  ');
       SQL.Add(' ID_COLOCACION = :"ID_COLOCACION" ');
       ParamByName('ID_COLOCACION').AsString := TablaLiq;
       Active := True;
       if IBQuery1.RecordCount > 0 then
        begin
          SaldoCuota := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
          Saldo := FieldByName('VALOR_DESEMBOLSO').AsCurrency - FieldByName('ABONOS_CAPITAL').AsCurrency;
          TasaEfectiva :=FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
          EdSaldoActual.Text := formatCurr('#,##0',Saldo);
          EdAgencia.KeyValue := FieldByName('ID_AGENCIA').AsInteger;
          if FieldByName('INTERES').AsString = 'V' then
           begin
             EdTasaMax.Text := FormatCurr('#0.00%',TasaNominalVencida(BuscoTasaEfectivaMaxima(Date,FieldByName('ID_CLASIFICACION').AsInteger,'A'),FieldByName('AMORTIZA_INTERES').AsInteger));
             TasaAplicada := TasaNominalVencida(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger);
             EdTasaNominal.Text := FormatCurr('#0.00%',TasaAplicada);
           end
          else
           begin
             EdTasaMax.Text := FormatCurr('#0.00%',TasaNominalAnticipada(BuscoTasaEfectivaMaxima(Date,FieldByName('ID_CLASIFICACION').AsInteger,'A'),FieldByName('AMORTIZA_INTERES').AsInteger));
             TasaAplicada := TasaNominalAnticipada(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger);
             EdTasaNominal.Text := FormatCurr('#0.00%',TasaAplicada);
           end;
        end
       else
        begin
          MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
        end;
      Close;
     end;



        IBTablaLiquidacion.Filtered := False;
        IBTablaLiquidacion.Filter := 'ID_COLOCACION = ' +QuotedStr(TablaLiq);
        IBTablaLiquidacion.Filtered := True;
        IBTablaLiquidacion.Open;

        EdNumeroColocacion.Text := TablaLiq;
end;

procedure TfrmGestionTablaLiquidacion.EdAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmGestionTablaLiquidacion.FormCreate(Sender: TObject);
begin
//        dmGeneral := TdmGeneral.Create(self);
//        dmGeneral.getConnected;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;

        IBTablaLiquidacion.Database := dmGeneral.IBDatabase1;
        IBTablaLiquidacion.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmGestionTablaLiquidacion.DSTablaDataChange(Sender: TObject;
  Field: TField);
begin
        cambios := true;
end;

procedure TfrmGestionTablaLiquidacion.DSTablaUpdateData(Sender: TObject);
begin
        cambios := true;
end;

procedure TfrmGestionTablaLiquidacion.DSTablaStateChange(Sender: TObject);
begin
        cambios := true;
end;

procedure TfrmGestionTablaLiquidacion.DBGridTablaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
(DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
DrawState: Integer;
DrawRect: TRect;
begin
        if (gdFocused in State) then
        begin
        if (Column.Field.FieldName = DBCheckBox1.DataField) then
        begin
        DBCheckBox1.Left := Rect.Left + DBGridTabla.Left + 2;
        DBCheckBox1.Top := Rect.Top + DBGridTabla.top + 2;
        DBCheckBox1.Width := (Rect.Right - Rect.Left);
        DBCheckBox1.Height := Rect.Bottom - Rect.Top;

        DBCheckBox1.Visible := True;
        end
        end
        else
        begin
        if (Column.Field.FieldName = DBCheckBox1.DataField) then
        begin
        DrawRect:=Rect;
        InflateRect(DrawRect,-1,-1);

        DrawState := ISChecked[IntToBoolean(Column.Field.AsInteger)];

        DBGridTabla.Canvas.FillRect(Rect);
        DrawFrameControl(DBGridTabla.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
end;
end;
end;

procedure TfrmGestionTablaLiquidacion.DBGridTablaColExit(Sender: TObject);
begin
        if DBGridTabla.SelectedField.FieldName = DBCheckBox1.DataField then
        DBCheckBox1.Visible := False
end;

procedure TfrmGestionTablaLiquidacion.DBGridTablaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if (key = Chr(9)) then Exit;

        if (DBGridTabla.SelectedField.FieldName = DBCheckBox1.DataField) then
        begin
        DBCheckBox1.SetFocus;
        SendMessage(DBCheckBox1.Handle, WM_Char, word(Key), 0);
        end;
end;

end.
