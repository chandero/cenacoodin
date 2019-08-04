unit UnitDeudasPeriodo;

interface

uses
  DateUtils, StrUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, Grids, StdCtrls,
  Buttons, ExtCtrls, JvTypedEdit, JvEdit, JvSpecialProgress, XLSfile;

type
  TfrmDeudasPeriodo = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdPeriodo: TJvYearEdit;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    btnAExcel: TBitBtn;
    IBQuery1: TIBQuery;
    Cds1: TClientDataSet;
    Cds1Tipo: TIntegerField;
    Cds1Codigo: TIntegerField;
    Cds1SubCodigo: TIntegerField;
    Cds1NumeroIde: TStringField;
    Cds1DigitoIde: TStringField;
    Cds1TipoIde: TStringField;
    Cds1Nombre: TStringField;
    Cds1Primer: TCurrencyField;
    Cds1Segundo: TCurrencyField;
    Cds1TercerValor: TCurrencyField;
    Cds1Direccion: TStringField;
    Cds1DptoMun: TStringField;
    sd1: TSaveDialog;
    IBSQL1: TIBSQL;
    lbs1: TStaticText;
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeudasPeriodo: TfrmDeudasPeriodo;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmDeudasPeriodo.btnProcesarClick(Sender: TObject);
var
  Id:string;
  Dg:string;
  Tp:string;
  Nm:string;
  Dr:string;
  Mn:string;
  Fila:Integer;
begin
        Fila := 0;
        lbs1.Visible := True;
        Application.ProcessMessages;

        with IBQuery1 do
        begin
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('delete from "dian$saldoscartera"');
         ExecSQL;
         Transaction.Commit;
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('insert into "dian$saldoscartera" ');
         SQL.Add('select');
         SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
         SQL.Add('"col$causaciondiaria".ID_PERSONA,');
         SQL.Add('SUM("col$causaciondiaria".DEUDA) AS DEUDA,');
         SQL.Add('SUM("col$causaciondiaria".CAUSADOS) AS CAUSADOS,');
         SQL.Add('SUM("col$causaciondiaria".COSTAS) AS COSTAS');
         SQL.Add('from');
         SQL.Add('"col$causaciondiaria"');
         SQL.Add('where');
         SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA');
         SQL.Add('group by');
         SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
         SQL.Add('"col$causaciondiaria".ID_PERSONA');
         SQL.Add('order by');
         SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
         SQL.Add('"col$causaciondiaria".ID_PERSONA');
         ParamByName('FECHA').AsDate := _dFechaCorteCausacion;
         try
          ExecSQL;
         except
          Transaction.Rollback;
          raise;
         end;
         Transaction.Commit;
       end; // fin del with
       ShowMessage('Proceso realizado');

end;

procedure TfrmDeudasPeriodo.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDeudasPeriodo.FormCreate(Sender: TObject);
begin
        EdPeriodo.Value := YearOf(fFechaActual);
end;

end.
