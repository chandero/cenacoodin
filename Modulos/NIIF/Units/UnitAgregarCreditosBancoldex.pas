unit UnitAgregarCreditosBancoldex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, IBSQL, DB, StrUtils,
  IBCustomDataSet, IBTable, Grids, DBGrids, Math, IBQuery, DBCtrls,
  JvTypedEdit, JvEdit, JvFloatEdit;

type
  TfrmAgregarCreditosBancoldex = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdCerrar: TBitBtn;
    CmdActualizar: TBitBtn;
    ControlCreditos: TPageControl;
    IBCredito: TIBSQL;
    IBConsultar: TIBSQL;
    InfoCreditos: TTabSheet;
    DSCreditos: TDataSource;
    DsetCreditos: TIBQuery;
    Panel4: TPanel;
    GridFijas: TDBGrid;
    DsetCreditosID_LINEA: TSmallintField;
    DsetCreditosLINEA: TIBStringField;
    DsetCreditosID_OBLIGACION: TIBStringField;
    DsetCreditosTASA_EA: TFloatField;
    DsetCreditosMARGEN: TFloatField;
    DsetCreditosPUNTOS_ADIC: TFloatField;
    DsetCreditosVALOR_DESEMBOLSO: TIBBCDField;
    DsetCreditosSALDO: TIBBCDField;
    Label4: TLabel;
    EdLinea: TEdit;
    Label5: TLabel;
    EdObligacion: TEdit;
    Label1: TLabel;
    Label8: TLabel;
    EdMargen: TEdit;
    Label7: TLabel;
    Label6: TLabel;
    EdPuntos: TEdit;
    EdDesembolso: TJvCurrencyEdit;
    EdTasa: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdActualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdDesembolsoExit(Sender: TObject);
    procedure EdDesembolsoEnter(Sender: TObject);
    procedure EdDesembolsoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure EdLineaEnter(Sender: TObject);
    procedure EdLineaKeyPress(Sender: TObject; var Key: Char);
    procedure EdLineaExit(Sender: TObject);
    procedure EdObligacionEnter(Sender: TObject);
    procedure EdObligacionExit(Sender: TObject);
    procedure EdObligacionKeyPress(Sender: TObject; var Key: Char);
    procedure EdPuntosEnter(Sender: TObject);
    procedure EdPuntosExit(Sender: TObject);
    procedure EdTasaEnter(Sender: TObject);
    procedure EdTasaExit(Sender: TObject);
    procedure EdTasaKeyPress(Sender: TObject; var Key: Char);
    procedure EdMargenEnter(Sender: TObject);
    procedure EdMargenExit(Sender: TObject);
    procedure EdMargenKeyPress(Sender: TObject; var Key: Char);
    procedure EdPuntosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmAgregarCreditosBancoldex: TfrmAgregarCreditosBancoldex;
  Linea,Obligacion:string;
  Desembolso:Currency;
  Tasa,Puntos,Margen:Double;
implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalescol;

procedure TfrmAgregarCreditosBancoldex.Inicializar;
begin
        ControlCreditos.ActivePage := InfoCreditos;
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;
        DsetCreditos.Open;

        Linea := '';
        Obligacion := '';
        Desembolso := 0;
        Tasa := 0;
        Puntos := 0;
        Margen := 0;

        EdLinea.Text := '';
        EdObligacion.Text := '';
        EdDesembolso.Value := 0;
        EdTasa.Text := '';
        EdPuntos.Text := '';
        EdMargen.Text := '';
end;

procedure TfrmAgregarCreditosBancoldex.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmAgregarCreditosBancoldex.CmdActualizarClick(Sender: TObject);
var Id:Integer;
begin
        if MessageDlg('Esta Seguro de Agregar los Datos',mtInformation,[mbyes,mbno],0) = mryes then
        begin
          with IBConsultar do begin
           Close;
           SQL.Clear;
           SQL.Add('select ID_LINEA from "col$creditosbancoldex" order by ID_LINEA DESC');
           ExecQuery;
           Id := FieldByName('ID_LINEA').AsInteger;
           Close;
          end;

          with IBCredito do begin
           Close;
           SQL.Clear;
           SQL.Add('insert into "col$creditosbancoldex" values (:ID_LINEA,:LINEA,:ID_OBLIGACION,:TASA_EA,:MARGEN,:PUNTOS_ADIC,:VALOR_DESEMBOLSO,:SALDO)');
           ParamByName('ID_LINEA').AsInteger := Id + 1;
           ParamByName('LINEA').AsString := Linea;
           ParamByName('ID_OBLIGACION').AsString := Obligacion;
           ParamByName('TASA_EA').AsDouble := SimpleRoundTo(Tasa,-2);
           ParamByName('MARGEN').AsDouble := SimpleRoundTo(Margen,-2);
           ParamByName('PUNTOS_ADIC').AsDouble := SimpleRoundTo(Puntos,-2);
           ParamByName('VALOR_DESEMBOLSO').AsCurrency := Desembolso;
           ParamByName('SALDO').AsCurrency := Desembolso;
           try
            ExecQuery;
            MessageDlg('Adición Exitosa de Crédito Bancoldex',mtInformation,[mbOK],0);
           except
            MessageDlg('Error Adicionando Crédito Bancoldex',mtError,[mbOK],0);
           end;
           Close;
          end;
          IBCredito.Transaction.Commit;
        end;
        inicializar;
end;

procedure TfrmAgregarCreditosBancoldex.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmAgregarCreditosBancoldex.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmAgregarCreditosBancoldex.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action := caFree;
end;

procedure TfrmAgregarCreditosBancoldex.EdDesembolsoExit(Sender: TObject);
begin
//        if EdDesembolso.Text = '' then
//          Desembolso := 0
//        else
//          Desembolso := StrToCurr(Eddesembolso.Text);
//        EdDesembolso.Text := FormatCurr('#,##',Desembolso);
        Desembolso := EdDesembolso.Value;
end;

procedure TfrmAgregarCreditosBancoldex.EdDesembolsoEnter(Sender: TObject);
begin
        EdDesembolso.SelectAll;
end;

procedure TfrmAgregarCreditosBancoldex.EdDesembolsoKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmAgregarCreditosBancoldex.FormCreate(Sender: TObject);
begin
        inicializar;
end;

procedure TfrmAgregarCreditosBancoldex.EdLineaEnter(Sender: TObject);
begin
        EdLinea.SelectAll;
end;

procedure TfrmAgregarCreditosBancoldex.EdLineaKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmAgregarCreditosBancoldex.EdLineaExit(Sender: TObject);
begin
        Linea := LeftStr(EdLinea.Text,4);
        EdLinea.Text := Linea;
end;

procedure TfrmAgregarCreditosBancoldex.EdObligacionEnter(Sender: TObject);
begin
        EdObligacion.SelectAll;
end;

procedure TfrmAgregarCreditosBancoldex.EdObligacionExit(Sender: TObject);
begin
        Obligacion := FormatCurr('000000000000000',StrToCurr(EdObligacion.Text));
        EdObligacion.Text := Obligacion;
end;

procedure TfrmAgregarCreditosBancoldex.EdObligacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmAgregarCreditosBancoldex.EdTasaEnter(Sender: TObject);
begin
        EdTasa.SelectAll;
end;

procedure TfrmAgregarCreditosBancoldex.EdTasaExit(Sender: TObject);
begin
        if EdTasa.Text = '' then
          Tasa := 0
        else
          Tasa := StrToFloat(EdTasa.Text);
        EdTasa.Text := FormatCurr('#0.00%',Tasa);
end;

procedure TfrmAgregarCreditosBancoldex.EdTasaKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmAgregarCreditosBancoldex.EdPuntosEnter(Sender: TObject);
begin
        EdPuntos.SelectAll;
end;

procedure TfrmAgregarCreditosBancoldex.EdPuntosExit(Sender: TObject);
begin
        if EdPuntos.Text = '' then
          Puntos := 0
        else
          Puntos := StrToFloat(EdPuntos.Text);
        EdPuntos.Text := FormatCurr('#0.00%',Puntos);
end;

procedure TfrmAgregarCreditosBancoldex.EdMargenEnter(Sender: TObject);
begin
        EdMargen.SelectAll;
end;

procedure TfrmAgregarCreditosBancoldex.EdMargenExit(Sender: TObject);
begin
        if EdMargen.Text = '' then
          Margen := 0
        else
          Margen := StrToFloat(EdMargen.Text);
        EdMargen.Text := FormatCurr('#0.00%',Margen);
end;

procedure TfrmAgregarCreditosBancoldex.EdMargenKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmAgregarCreditosBancoldex.EdPuntosKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

end.
