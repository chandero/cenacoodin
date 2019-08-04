unit UnitDatroGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, ComCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TFrmDatoGeneral = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DbTipo: TDBLookupComboBox;
    Label2: TLabel;
    DtFecha: TDateTimePicker;
    ChTotal: TCheckBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lbGeneral: TLabel;
    lbUsuario: TLabel;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    DataSource1: TDataSource;
    IBTransaction1: TIBTransaction;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDatoGeneral: TFrmDatoGeneral;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TFrmDatoGeneral.FormCreate(Sender: TObject);
begin
        IBQuery1.Close;
        IBQuery1.Open;
        IBQuery1.Last;
        DbTipo.KeyValue := _iTipoDetalle;
        DtFecha.DateTime := fFechaActual;
        GroupBox2.Caption := 'Entregados por: ' + DBAlias 
end;

procedure TFrmDatoGeneral.BitBtn2Click(Sender: TObject);
begin
        Panel1.Enabled := True;
        lbUsuario.Caption := '0';
        lbGeneral.Caption := '0';
end;

procedure TFrmDatoGeneral.BitBtn1Click(Sender: TObject);
begin
        Panel1.Enabled := False;
        with IBQuery2 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          if ChTotal.Checked then
          begin
            SQL.Add('select count(*) as TOTAL from "gen$detalles" where TIPO = :TIPO');
            ParamByName('TIPO').AsInteger := DbTipo.KeyValue;
            Open;
            lbGeneral.Caption := CurrToStrF(FieldByName('TOTAL').AsCurrency,ffNumber,0);
            Close;
            SQL.Clear;
            SQL.Add('select count(*) AS TOTAL from "gen$detalles" where TIPO = :TIPO AND ID_EMPLEADO = :ID_EMPLEADO');
            ParamByName('TIPO').AsInteger := DbTipo.KeyValue;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            Open;
            lbUsuario.Caption := CurrToStrF(FieldByName('TOTAL').AsCurrency,ffNumber,0);
          end
          else
          begin
            SQL.Add('select count(*) AS TOTAL from "gen$detalles" where TIPO = :TIPO AND FECHA_ENTREGA = :FECHA');
            ParamByName('TIPO').AsInteger := DbTipo.KeyValue;
            ParamByName('FECHA').AsDate := DtFecha.DateTime;
            Open;
            lbGeneral.Caption := CurrToStrF(FieldByName('TOTAL').AsCurrency,ffNumber,0);
            Close;
            SQL.Clear;
            SQL.Add('select count(*) AS TOTAL from "gen$detalles" where TIPO = :TIPO AND FECHA_ENTREGA = :FECHA AND ID_EMPLEADO = :ID_EMPLEADO');
            ParamByName('TIPO').AsInteger := DbTipo.KeyValue;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('FECHA').AsDate := DtFecha.DateTime;
            Open;
            lbUsuario.Caption := CurrToStrF(FieldByName('TOTAL').AsCurrency,ffNumber,0);
          end;
        end;
end;

end.
