unit UnitSolicitudAprobada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBSQL, DBClient, FR_DSet, FR_DBSet, FR_Class;

type
  TFrmSolicitudAprobada = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBSol: TIBQuery;
    IBSQL1: TIBSQL;
    CdRep: TClientDataSet;
    CdRepID_AGENCIA: TIntegerField;
    CdRepDESCRIPCION: TStringField;
    CdRepID_SOLICITUD: TStringField;
    CdRepASOCIADO: TStringField;
    CdRepVALOR: TCurrencyField;
    IBSQL2: TIBSQL;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
  public
  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  FrmSolicitudAprobada: TFrmSolicitudAprobada;

implementation

uses UnitPantallaProgreso, UnitGlobales, UnitImpresion, unitMain;

{$R *.dfm}

procedure TFrmSolicitudAprobada.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmSolicitudAprobada.BitBtn1Click(Sender: TObject);
var     DescAgencia :string;
begin
        CdRep.CancelUpdates;
        with IBSol do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_AGENCIA FROM "gen$agencia" WHERE ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          DescAgencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT ');
          SQL.Add('"col$registrosesion".ID_SOLICITUD,');
          SQL.Add('"col$registrosesion".ID_AGENCIA,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          SQL.Add('FROM');
          SQL.Add('"col$registrosesion"');
          SQL.Add('INNER JOIN "gen$agencia" ON ("col$registrosesion".ID_AGENCIA="gen$agencia".ID_AGENCIA)');
          SQL.Add('WHERE');
          SQL.Add('("col$registrosesion".FECHA BETWEEN :FECHA1 AND :FECHA2) AND (ESTADO = 4)');
          SQL.Add('ORDER BY');
          SQL.Add('"col$registrosesion".ID_AGENCIA');
          ParamByName('FECHA1').AsDate := fecha1.Date;
          ParamByName('FECHA2').AsDate := fecha2.Date;
          Open;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Max := RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Titulo := 'Extrayendo Información Local';
          frmProgreso.Ejecutar;
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Solicitud Número : ' + FieldByName('ID_SOLICITUD').AsString;
            Application.ProcessMessages;
            if FieldByName('ID_AGENCIA').AsInteger <> Agencia then
            begin
              IBSQL1.Close;
              IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBSQL1.ParamByName('ID').AsString := FieldByName('ID_SOLICITUD').AsString;
              IBSQL1.ExecQuery;
              CdRep.Append;
              CdRep.FieldValues['ID_AGENCIA'] := FieldByName('ID_AGENCIA').AsInteger;
              CdRep.FieldValues['DESCRIPCION'] := FieldByName('DESCRIPCION_AGENCIA').AsString;
              CdRep.FieldValues['ID_SOLICITUD'] := FieldByName('ID_SOLICITUD').AsString;
              CdRep.FieldValues['ASOCIADO'] := IBSQL1.FieldByName('ASOCIADO').AsString;
              CdRep.FieldValues['VALOR'] := IBSQL1.FieldByName('VALOR_SOLICITUD').AsCurrency;
              CdRep.Post;
            end
            else
            begin
              IBSQL2.Close;
              IBSQL2.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
              IBSQL2.ExecQuery;
              CdRep.Append;
              CdRep.FieldValues['ID_AGENCIA'] := FieldByName('ID_AGENCIA').AsInteger;
              CdRep.FieldValues['DESCRIPCION'] := FieldByName('DESCRIPCION_AGENCIA').AsString;
              CdRep.FieldValues['ID_SOLICITUD'] := FieldByName('ID_SOLICITUD').AsString;
              CdRep.FieldValues['ASOCIADO'] := Trim(IBSQL2.FieldByName('NOMBRE').AsString + ' ' + IBSQL2.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBSQL2.FieldByName('SEGUNDO_APELLIDO').AsString);
              CdRep.FieldValues['VALOR'] := IBSQL2.FieldByName('VALOR_APROBADO').AsCurrency;
              CdRep.Post;
            end;
            Next;
          end;
          frmProgreso.Cerrar;
          if CdRep.RecordCount > 0 then
            imprimir_reporte(frmMain.ruta1 + 'reporte\RepSolAprobada.frf');
        end;
end;

procedure TFrmSolicitudAprobada.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmSolicitudAprobada.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'empresa' then
           ParValue := Empresa;
        if ParName = 'fecha1' then
           ParValue := fecha1.Date;
        if ParName = 'fecha1' then
           ParValue := fecha1.Date;

end;

end.
