unit UnitTablaPagoColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, XStringGrid, UnitDmColocacion;

type
  TfrmTablaPagoColocacion = class(TForm)
    GridTablaLiq: TXStringGrid;
    Panel4: TPanel;
    CmdCerrar: TBitBtn;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetTablaLiq:String;
    procedure SetTablaLiq(Tabla:String);
    function GetSaldo:Currency;
    procedure SetSaldo(vNewValue:Currency);
    { Private declarations }
  public
    property TablaLiq:String read GetTablaLiq write SetTablaLiq;
    property Saldo:Currency read GetSaldo write SetSaldo;
    { Public declarations }
  end;

var
  frmTablaPagoColocacion: TfrmTablaPagoColocacion;
  dmColocacion: TdmColocacion;
  vTablaLiq:String;
  vSaldo:Currency;

implementation

{$R *.dfm}

uses UnitGlobalesCol;

function TfrmTablaPagoColocacion.GetTablaLiq:String;
begin
        GetTablaLiq := vTablaLiq;
end;

procedure TfrmTablaPagoColocacion.SetTablaLiq(Tabla:String);
begin
        vTablaLiq := Tabla;
end;

function TfrmTablaPagoColocacion.GetSaldo:Currency;
begin
        GetSaldo := vSaldo;
end;

procedure TfrmTablaPagoColocacion.SetSaldo(vNewValue:Currency);
begin
        vSaldo := vNewValue;
end;

procedure TfrmTablaPagoColocacion.CmdCerrarClick(Sender: TObject);
begin
        Self.Close;
end;

procedure TfrmTablaPagoColocacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TfrmTablaPagoColocacion.FormShow(Sender: TObject);
var B:Integer;
begin
        with dmColocacion.IBQuery do
        begin
          SQL.Clear;
          SQL.Add('select * from "col$tablaliquidacion" ') ;
          SQL.Add(' where ID_COLOCACION = :"ID_COLOCACION" ');
          SQL.Add(' Order By CUOTA_NUMERO');
          ParamByName('ID_COLOCACION').AsString := TablaLiq;
          Active := True;
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
              Saldo := Saldo - FieldByName('CAPITAL_A_PAGAR').AsCurrency;
              GridTablaLiq.Cells[4,B] := FormatCurr('#,##0',FieldByName('CAPITAL_A_PAGAR').AsCurrency  + FieldByName('INTERES_A_PAGAR').AsCurrency);
              GridTablaLiq.Cells[5,B] := FormatCurr('#,##0',Saldo);
              Next;
          end;
          Close;
        end;
end;

procedure TfrmTablaPagoColocacion.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(self);
end;

end.
