unit UnitTablaLiquidacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, XStringGrid, Mask, DBCtrls,
  CECheckList, IBQuery, UnitDmGeneral;

type
  TfrmTablaLiquidacion = class(TForm)
    GridTablaLiq: TXStringGrid;
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
    Checked: TCheckListCellEditor;
    EdAgencia: TDBLookupComboBox;
    Label2: TLabel;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EdAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
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
  frmTablaLiquidacion: TfrmTablaLiquidacion;
  dmGeneral: TdmGeneral;
  vSaldo:Currency;
  SaldoCuota:Currency;
  vTablaLiq:String;


implementation

{$R *.dfm}

uses UnitGlobalesCol, UnitGlobales;

function TfrmTablaLiquidacion.GetSaldo:Currency;
begin
        GetSaldo := vSaldo;
end;

procedure TfrmTablaLiquidacion.SetSaldo(vNewValue:Currency);
begin
        vSaldo := vNewValue;
end;

function TfrmTablaLiquidacion.GetTablaLiq:String;
begin
        GetTablaLiq := vTablaLiq;
end;

procedure TfrmTablaLiquidacion.SetTablaLiq(Tabla:String);
begin
        vTablaLiq := Tabla;
end;


procedure TfrmTablaLiquidacion.CmdCerrarClick(Sender: TObject);
begin
        Self.Close;
end;

procedure TfrmTablaLiquidacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := caFree;
end;

procedure TfrmTablaLiquidacion.FormShow(Sender: TObject);
var B:Integer;
TasaEfectiva : Double;
TasaAplicada : Double;
SaldoCuota : Currency;
IBQuery1 : TIBQuery;
begin
    Inicializar;
    IBQuery1 := TIBQuery.Create(self);
    IBQuery1.Database := dmGeneral.IBDatabase1;
    IBQuery1.Transaction := dmGeneral.IBTransaction1;
    with IBQuery1 do
     begin
       SQL.Clear;
       SQL.Add('select ');
       SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
       SQL.Add('"col$colocacion".ABONOS_CAPITAL,');
       SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
       SQL.Add('"col$colocacion".ID_CLASIFICACION,');
       SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
       SQL.Add('"col$tiposcuota".TIPO_CUOTA,');
       SQL.Add('"col$tiposcuota".INTERES');
       SQL.Add('from "col$colocacion"');
       SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) ');
       SQL.Add(' where ID_AGENCIA = :"ID_AGENCIA" and ');
       SQL.Add(' ID_COLOCACION = :"ID_COLOCACION" ');
       ParamByName('ID_AGENCIA').AsInteger := Agencia;
       ParamByName('ID_COLOCACION').AsString := TablaLiq;
       Active := True;
       if IBQuery1.RecordCount > 0 then
        begin
          SaldoCuota := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
          Saldo := FieldByName('VALOR_DESEMBOLSO').AsCurrency - FieldByName('ABONOS_CAPITAL').AsCurrency;
          TasaEfectiva :=FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
          EdSaldoActual.Text := formatCurr('#,##0',Saldo);
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


          with IBQuery1 do
           begin
             SQL.Clear;
             SQL.Add('select * from "col$tablaliquidacion" ') ;
             SQL.Add(' where ID_AGENCIA =:"ID_AGENCIA" and ');
             SQL.Add(' ID_COLOCACION = :"ID_COLOCACION" ');
             SQL.Add(' Order By CUOTA_NUMERO');
             ParamByName('ID_COLOCACION').AsString := TablaLiq;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             Open;

             if RecordCount > 0 then
              begin
                Last;
                First;
              end;
             GridTablaLiq.RowCount := RecordCount + 1;
             for B:= 1 to RecordCount do
              begin
                GridTablaLiq.Cells[0,B] := FormatCurr('000',B);
                GridTablaLiq.Cells[1,B] := DateToStr(FieldByName('FECHA_A_PAGAR').AsDateTime);
                GridTablaLiq.Cells[2,B] := FormatCurr('#,##0',FieldByName('CAPITAL_A_PAGAR').AsCurrency);
                GridTablaLiq.Cells[3,B] := FormatCurr('#,##0',FieldByName('INTERES_A_PAGAR').AsCurrency);
                SaldoCuota := SaldoCuota - FieldByName('CAPITAL_A_PAGAR').AsCurrency;
                GridTablaLiq.Cells[4,B] := FormatCurr('#,##0',FieldByName('CAPITAL_A_PAGAR').AsCurrency  + FieldByName('INTERES_A_PAGAR').AsCurrency);
                GridTablaLiq.Cells[5,B] := FormatCurr('#,##0',SaldoCuota);
                if FieldByName('PAGADA').AsInteger <> 0 then
                   GridTablaLiq.Cells[6,B] := Checked.Items.Strings[0]
                else
                   GridTablaLiq.Cells[6,B] := Checked.Items.Strings[1];
                Next;
              end;
             Close;
           end;
        end
       else
        begin
          MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
        end;
      Close;
     end;
end;

procedure TfrmTablaLiquidacion.Inicializar;
var
B : integer;
begin

        if dmGeneral.IBTransaction1.InTransaction then
        begin
           dmGeneral.IBTransaction1.Commit;
           dmGeneral.IBTransaction1.StartTransaction;
        end;
        
        EdAgencia.SetFocus;
        EdAgencia.KeyValue := Agencia;

          for B:= 1 to GridTablaLiq.RowCount do
          begin
              GridTablaLiq.Cells[0,B] := '';
              GridTablaLiq.Cells[1,B] := '';
              GridTablaLiq.Cells[2,B] := '';
              GridTablaLiq.Cells[3,B] := '';
              SaldoCuota := 0;
              GridTablaLiq.Cells[4,B] := '';
              GridTablaLiq.Cells[5,B] := '';
              GridTablaLiq.Cells[6,B] := '';
              Next;
          end;
          EdNumeroColocacion.Text := TablaLiq;
end;

procedure TfrmTablaLiquidacion.EdAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmTablaLiquidacion.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
end;

end.
