unit UnitInformeTasaPromedio;

interface

uses
  Windows, Messages, DateUtils, Math, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  ComCtrls, DBCtrls, pr_Common, pr_TxClasses, DBClient, JvLabel, JvEdit,
  JvTypedEdit;

type
  TfrmInformeTasaPromedio = class(TForm)
    GroupBox9: TGroupBox;
    Label24: TLabel;
    Label3: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    DSTiposCaptacion: TDataSource;
    IBTiposCaptacion: TIBQuery;
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    CmdVer: TBitBtn;
    CBMeses: TComboBox;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    CDS: TClientDataSet;
    CDSTASA: TFloatField;
    CDSCANTIDAD: TIntegerField;
    CDSVALOR: TCurrencyField;
    CDSPARTICIPACION: TFloatField;
    CDSINTERES: TCurrencyField;
    CDSTASA_N: TFloatField;
    Reporte: TprTxReport;
    jvAno: TJvIntegerEdit;
    JvLabel1: TJvLabel;
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CBMesesClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeTasaPromedio: TfrmInformeTasaPromedio;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales, UnitGlobalesCol;

procedure TfrmInformeTasaPromedio.FormShow(Sender: TObject);
begin
        with IBTiposCaptacion do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Open;
           Last;
           DBLCBTipoCaptacion.DropDown;
        end;

end;

procedure TfrmInformeTasaPromedio.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeTasaPromedio.CBMesesClick(Sender: TObject);
begin
        if CBMeses.ItemIndex > -1 then
          CmdVer.Enabled := True;
        jvAno.Value := YearOf(Date);
end;

procedure TfrmInformeTasaPromedio.CmdVerClick(Sender: TObject);
var Total:Currency;
begin
        GroupBox9.Enabled := False;
        CmdVer.Enabled := False;
        Application.ProcessMessages;


        with IBQuery1 do begin
            Close;
            SQL.Clear;
            SQL.Add('select SUM(VALOR_INICIAL) AS SUMA from "cap$causacioncdat" where');
            SQL.Add('ID_AGENCIA = :ID_AGENCIA and ANO = :ANO and MES = :MES');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ANO').AsInteger := jvAno.Value;
            ParamByName('MES').AsInteger := CBMeses.ItemIndex+1;
            try
             Open;
            except
             Transaction.Rollback;
             raise;
            end;
            Total := FieldByName('SUMA').AsCurrency;
        end;
        
        with IBQuery1 do begin
            Close;
            SQL.Clear;
            SQL.Add('select TASA_E AS TASA, COUNT(*) AS TOTAL, SUM(VALOR_INICIAL) AS SUMA from "cap$causacioncdat" where');
            SQL.Add('ID_AGENCIA = :ID_AGENCIA and ANO = :ANO and MES = :MES');
            SQL.Add('group by TASA_E order by TASA_E ASC');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ANO').AsInteger :=jvAno.Value;
            ParamByName('MES').AsInteger := CBMeses.ItemIndex+1;
            try
             Open;
            except
             Transaction.Rollback;
             raise;
            end;

            if RecordCount > 0 then
            while not Eof do begin
              CDS.Open;
              cds.Insert;
              CDS.FieldByName('TASA').AsFloat := FieldByName('TASA').AsFloat;
              CDS.FieldByName('TASA_N').AsFloat := TasaNominalVencida(FieldByName('TASA').AsFloat,30);
              CDS.FieldByName('CANTIDAD').AsInteger := FieldByName('TOTAL').AsInteger;
              CDS.FieldByName('VALOR').AsCurrency := FieldByName('SUMA').AsCurrency;
              CDS.FieldByName('PARTICIPACION').AsFloat := (FieldByName('SUMA').AsCurrency * 100) / Total;
              CDS.FieldByName('INTERES').AsCurrency := SimpleRoundTo(FieldByName('SUMA').AsCurrency * (FieldByName('TASA').AsFloat/100),0);
              CDS.Post;
              CDS.Close;
              Next;
            end;
        end;

        Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
        Reporte.Variables.ByName['MES'].AsInteger := CBMeses.ItemIndex + 1;
        Reporte.Variables.ByName['ANO'].AsInteger := jvAno.Value;
        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);

end;

end.
