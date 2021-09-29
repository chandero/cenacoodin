unit FrmEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvEdit, DBCtrls, JvLabel, ComCtrls,
  JvTypedEdit, Buttons, DB, IBCustomDataSet, IBQuery, IBDatabase,
  pr_Common, pr_TxClasses;

type
  TEntrada = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBtipo: TDBLookupComboBox;
    EDnumero: TJvEdit;
    EDnombre: TJvEdit;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    Fecha_a: TDateTimePicker;
    Fecha_v: TDateTimePicker;
    Label3: TLabel;
    Valor: TJvCurrencyEdit;
    Label4: TLabel;
    Fecha_hoy: TDateTimePicker;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBQuery2: TIBQuery;
    prTxReport1: TprTxReport;
    procedure DBtipoKeyPress(Sender: TObject; var Key: Char);
    procedure EDnumeroKeyPress(Sender: TObject; var Key: Char);
    procedure EDnombreKeyPress(Sender: TObject; var Key: Char);
    procedure Fecha_aKeyPress(Sender: TObject; var Key: Char);
    procedure Fecha_vKeyPress(Sender: TObject; var Key: Char);
    procedure ValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBtipoEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EDnumeroExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Entrada: TEntrada;

implementation
uses UnitGlobales,UnitdmGeneral;
{$R *.dfm}

procedure TEntrada.DBtipoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(key,self)
end;

procedure TEntrada.EDnumeroKeyPress(Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Self,Key);
        EnterTabs(key,Self)
end;

procedure TEntrada.EDnombreKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TEntrada.Fecha_aKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TEntrada.Fecha_vKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TEntrada.ValorKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TEntrada.FormCreate(Sender: TObject);
begin
        IBQuery1.Open;
        IBQuery1.Last;
        Fecha_a.Date := Date;
        Fecha_v.Date := Date;
        Fecha_hoy.Date := Date;
end;

procedure TEntrada.DBtipoEnter(Sender: TObject);
begin
        DBtipo.DropDown;
end;

procedure TEntrada.BitBtn1Click(Sender: TObject);
var     es_nuevo :Boolean;
begin
        if MessageDlg('Esta Seguro de Realizar la TRansacción',mtWarning,[mbyes,mbno],0) = mryes then
        begin
           with IBQuery2 do
           begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT');
             SQL.Add('FECHA_AFILIACION');
             SQL.Add('FROM');
             SQL.Add('"col$relacionseguro"');
             SQL.Add('WHERE');
             SQL.Add('(ID_PERSONA = :ID_PERSONA) AND');
             SQL.Add('(ID_IDENTIFICACION = :ID_IDENTIFICACION) and');
             SQL.Add('ES_COLOCACION = 0');
             ParamByName('ID_IDENTIFICACION').AsInteger := DBtipo.KeyValue;
             ParamByName('ID_PERSONA').AsString := EDnumero.Text;
             Open;
             if RecordCount = 0 then
                es_nuevo := False
             else
                es_nuevo := True;
             SQL.Clear;
             if not(es_nuevo) then
             begin
               SQL.Add('insert into "col$relacionseguro" values(');
               SQL.Add(':ID_COLOCACION,:VALOR_SEGURO,:FECHA_COLOCACION,:ID_AGENCIA,:ID_PERSONA,:ID_IDENTIFICACION,:FECHA_AFILIACION,:FECHA_VENCIMIENTO,0)');
               ParamByName('ID_COLOCACION').Clear;
             end
             else
             begin
               SQL.Add('update "col$relacionseguro" set');
               SQL.Add('"col$relacionseguro".VALOR_SEGURO = :VALOR_SEGURO,');
               SQL.Add('"col$relacionseguro".FECHA_COLOCACION = :FECHA_COLOCACION,');
               SQL.Add('"col$relacionseguro".ID_AGENCIA = :ID_AGENCIA,');
               SQL.Add('"col$relacionseguro".FECHA_AFILIACION = :FECHA_AFILIACION,');
               SQL.Add('"col$relacionseguro".FECHA_VENCIMINETO = :FECHA_VENCIMIENTO');
               SQL.Add('WHERE');
               SQL.Add('("col$relacionseguro".ID_PERSONA = :ID_PERSONA) AND');
               SQL.Add('("col$relacionseguro".ID_IDENTIFICACION = :ID_IDENTIFICACION) and');
               SQL.Add('("col$relacionseguro".ES_COLOCACION = 0) ');
             end;
               ParamByName('VALOR_SEGURO').AsCurrency := Valor.Value;
               ParamByName('FECHA_COLOCACION').AsDate := Fecha_hoy.Date;
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_PERSONA').AsString := EDnumero.Text;
               ParamByName('ID_IDENTIFICACION').AsInteger := DBtipo.KeyValue;
               ParamByName('FECHA_AFILIACION').AsDate := Fecha_a.Date;
               ParamByName('FECHA_VENCIMIENTO').AsDate := Fecha_v.Date;
               Open;
               Close;
               Transaction.Commit;
           end;
           BitBtn2.Click;
        end;
end;

procedure TEntrada.EDnumeroExit(Sender: TObject);
begin
        with IBQuery2 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO');
          SQL.Add('FROM');
          SQL.Add('"gen$persona"');
          SQL.Add('WHERE');
          SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA)');
          ParamByName('ID_PERSONA').AsString := EDnumero.Text;
          ParamByName('ID_IDENTIFICACION').AsInteger := DBtipo.KeyValue;
          Open;
          if RecordCount = 0 then
             MessageDlg('No se Encuentra Registrada Actualmente en la Cooperativa',mtInformation,[mbok],0)
          else
            EDnombre.Text := FieldByName('NOMBRE').AsString + ' ' +FieldByName('PRIMER_APELLIDO').AsString + ' ' +FieldByName('SEGUNDO_APELLIDO').AsString;
        end;
end;

procedure TEntrada.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TEntrada.BitBtn2Click(Sender: TObject);
begin
        EDnombre.Text := '';
        Valor.Value := 0;
        EDnumero.Text := '';
        DBtipo.SetFocus;
end;

end.
