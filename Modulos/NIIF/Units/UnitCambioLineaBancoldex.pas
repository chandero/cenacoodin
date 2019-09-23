unit UnitCambioLineaBancoldex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, JvEdit, JvTypedEdit, StdCtrls,
  ExtCtrls, DB, DBClient, Buttons, DBCtrls, IBCustomDataSet, IBQuery, IBSQL,
  IBDatabase,StrUtils;

type
  TfrmCambioLineaBancoldex = class(TForm)
    Panel2: TPanel;
    CDBancoldex: TClientDataSet;
    CDBancoldexNO_BANCOLDEX: TStringField;
    CDBancoldexEMPLEOS_ACT: TStringField;
    CDBancoldexEMPLEOS_GENERAR: TStringField;
    CDBancoldexTOTAL_ACTIVOS: TCurrencyField;
    CDBancoldexLINEA: TStringField;
    DSBancoldex: TDataSource;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    GroupBox19: TGroupBox;
    Label121: TLabel;
    Label124: TLabel;
    EdSaldoB: TJvCurrencyEdit;
    GroupBox20: TGroupBox;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    EdEmpAct: TEdit;
    EdEmpGen: TEdit;
    EdActivos: TJvCurrencyEdit;
    EdFechaCorteActivos: TEdit;
    PaginaDesGarB: TPageControl;
    InfoDestinoB: TTabSheet;
    DBDestinoB: TDBGrid;
    InfoGarantiaB: TTabSheet;
    DBGarantiaB: TDBGrid;
    CDBancoldexFECHA_VISITA: TDateField;
    EdSociedad: TEdit;
    ChkVisita: TCheckBox;
    EdFechaVisita: TDateTimePicker;
    Label1: TLabel;
    CDDestinoB: TClientDataSet;
    DSDestinoB: TDataSource;
    DSGarantiaB: TDataSource;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    CDBancoldexVISITA: TIntegerField;
    CDBancoldexTIPO_SOCIEDAD: TStringField;
    CDGarantiaB: TClientDataSet;
    CDGarantiaBCLASEG: TStringField;
    CDGarantiaBVALORG: TCurrencyField;
    CDDestinoBDESTINO: TStringField;
    CDDestinoBMONTO: TCurrencyField;
    CDDestinoBNO: TIntegerField;
    CDGarantiaBNO: TIntegerField;
    CDBancoldexFECHA_ACTIVOS: TStringField;
    CBLineaB: TDBLookupComboBox;
    IBLineaB: TIBQuery;
    DSLineaB: TDataSource;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBSQL2: TIBSQL;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBLineaBExit(Sender: TObject);
  private
    { Private declarations }
  public
    Saldo : Currency;
    Analisis : Boolean;
    Solicitud : string;
    Visita : Boolean;
    FechaVisita : TDate;
    LineaB:Integer;
    NoBancoldex : String;
    { Public declarations }
  end;

var
  frmCambioLineaBancoldex: TfrmCambioLineaBancoldex;

implementation

uses Unitdmgeneral, UnitGlobales;

{$R *.dfm}


procedure TfrmCambioLineaBancoldex.BitBtn1Click(Sender: TObject);
begin
        if (ChkVisita.Checked = True) and Analisis then
          begin
            with IBSQL1 do begin
              if Transaction.InTransaction then
                Transaction.Rollback;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('update "col$infbancoldex" set VISITA = :VISITA, FECHA_VISITA = :FECHA');
              SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
              ParamByName('ID_SOLICITUD').AsString := Solicitud;
              ParamByName('VISITA').AsInteger := 1;
              ParamByName('FECHA').AsDate := EdFechaVisita.Date;
              ExecQuery;
              Transaction.Commit;
              Close;
              Visita := True;
              FechaVisita := EdFechaVisita.Date;
            end;
          end;

        if (CBLineaB.KeyValue <> LineaB) then begin
          if MessageDlg('Esta Seguro de Cambiar la Linea Bancoldex',mtInformation,[mbyes,mbno],0) = mryes then
           begin
            if IBSQL2.Transaction.InTransaction then
              IBSQL2.Transaction.Rollback;
            IBSQL2.Transaction.StartTransaction;
            IBSQL2.Close;
            IBSQL2.ParamByName('LINEA').AsString := Trim(CBLineaB.Text);
            IBSQL2.ParamByName('OBLIGACION').AsString := NoBancoldex;
            IBSQL2.ExecQuery;

            with IBSQL1 do begin
              if Transaction.InTransaction then
                Transaction.Rollback;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('update "col$infbancoldex" set LINEA_BANCOLDEX = :LINEA, NO_BANCOLDEX = :NO,');
              SQL.Add('MARGEN_INT = :MARGEN, TASA_EA = :TASA_EA');
              SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
              ParamByName('ID_SOLICITUD').AsString := Solicitud;
              ParamByName('LINEA').AsString := Trim(CBLineaB.Text);
              ParamByName('MARGEN').AsFloat := IBSQL2.FieldByName('MARGEN').AsFloat;
              ParamByName('TASA_EA').AsFloat := IBSQL2.FieldByName('TASA_EA').AsFloat;
              ParamByName('NO').AsString := IBSQL2.FieldByName('ID_OBLIGACION').AsString;
              ExecQuery;
              Transaction.Commit;
              Close;
            end;
           end;
        end;

        if (CBLineaB.KeyValue = 0) then begin
          if MessageDlg('Seguro de Eliminar la Marcación de Recursos Bancoldex',mtInformation,[mbyes,mbno],0) = mryes then
           begin
            with IBSQL1 do begin
              if Transaction.InTransaction then
                Transaction.Rollback;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('DELETE FROM "col$infbancoldex" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_SOLICITUD = :ID_SOLICITUD');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_SOLICITUD').AsString := Solicitud;
              ExecQuery;
              Transaction.Commit;
              Close;
            end;
           end;
        end;

        Close;
end;

procedure TfrmCambioLineaBancoldex.FormShow(Sender: TObject);
begin
        CBLineaB.KeyValue := LineaB;

        EdSaldoB.Value := Saldo;
        EdSociedad.Text := CDBancoldex.FieldValues['TIPO_SOCIEDAD'];
        EdEmpAct.Text := CDBancoldex.FieldValues['EMPLEOS_ACT'];
        EdEmpGen.Text := CDBancoldex.FieldValues['EMPLEOS_GENERAR'];
        EdActivos.Value := CDBancoldex.FieldValues['TOTAL_ACTIVOS'];
        EdFechaCorteActivos.Text := CDBancoldex.FieldValues['FECHA_ACTIVOS'];
        if CDBancoldex.FieldValues['VISITA'] = 1 then
          begin
            ChkVisita.Checked := True;
            EdFechaVisita.Date := CDBancoldex.FieldValues['FECHA_VISITA'];
            EdFechaVisita.Enabled := False;
            ChkVisita.Enabled := False;
          end
        else
          begin
          ChkVisita.Checked := False;
          EdFechaVisita.Date := Date;
        end;
end;

procedure TfrmCambioLineaBancoldex.FormCreate(Sender: TObject);
begin
        IBLineaB.Open;
        IBLineaB.Last;
end;

procedure TfrmCambioLineaBancoldex.CBLineaBExit(Sender: TObject);
begin
        EdSaldoB.Value := IBLineaB.FieldByName('SALDO').AsCurrency;
        NoBancoldex := IBLineaB.FieldByName('ID_OBLIGACION').AsString;
end;

end.
