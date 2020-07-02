unit UnitInformeEnte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Buttons, JvStaticText, DB,
  IBCustomDataSet, IBQuery, IBDatabase, FR_DSet, FR_DBSet, FR_Class,
  DBClient;

type
  TFrmInformeEnte = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBente: TDBLookupComboBox;
    Label2: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    JVfecha: TJvStaticText;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    IBQuery2: TIBQuery;
    IBTransaction1: TIBTransaction;
    CDinforme: TClientDataSet;
    CDinformesolicitud: TStringField;
    CDinformenombre: TStringField;
    CDinformeestado: TStringField;
    CDinformevalor: TCurrencyField;
    CDestado: TClientDataSet;
    frDBDataSet2: TfrDBDataSet;
    CDestadodescripcion: TStringField;
    CDestadototal: TIntegerField;
    frDBDataSet3: TfrDBDataSet;
    CDfirmas: TClientDataSet;
    CDfirmasfirma: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
     total :Integer;
     aprobado :Currency;
    procedure firmas(ente: string);

    { Private declarations }
  public
  published
    function retorna_fecha: tdate;
    procedure imprimir_reporte(cadena: string);
    function contador(estado: integer): integer;
    { Public declarations }
  end;

var
  FrmInformeEnte: TFrmInformeEnte;

implementation

uses UnitDmSolicitud, UnitImpresion, unitMain;

{$R *.dfm}

function TFrmInformeEnte.retorna_fecha: tdate;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "SP_FECHAHORA_ACTUAL"');
          ExecQuery;
          Result := FieldByName('FECHAHORA').AsDateTime;
          Close;
          Transaction.Commit;
        end;
end;

procedure TFrmInformeEnte.FormCreate(Sender: TObject);
begin
        DmSolicitud := TDmSolicitud.Create(self);
        JVfecha.Caption := FormatDateTime('yyyy/MM/dd',retorna_fecha);
end;

procedure TFrmInformeEnte.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
        //
end;

procedure TFrmInformeEnte.BitBtn1Click(Sender: TObject);
var     aprobada,aplazada,negada :Integer;
begin
        aplazada := 0;
        negada := 0;
        aprobada := 0;
        with frmMain.CDinforme do
        begin
           First;
           while not Eof do
           begin
             if FieldValues['estado'] = 4 then
               aprobada := aprobada + 1
             else if FieldValues['estado'] = 7 then
               negada := negada + 1
             else if FieldValues['estado'] = 9 then
               aplazada := aplazada + 1;
             Next;
           end;
        end;
        total := 0;
        aprobado := 0;
        CDinforme.CancelUpdates;
        CDfirmas.CancelUpdates;
        CDestado.CancelUpdates;
        if aprobada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'APROBADAS';
          CDestado.FieldValues['total'] := aprobada;
          CDestado.Post;
          total := total + aprobada;
        end;
        if negada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'NEGADAS';
          CDestado.FieldValues['total'] := negada;
          CDestado.Post;
          total := total + negada;
        end;
        if aplazada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'APLAZADAS';
          CDestado.FieldValues['total'] := aplazada;
          CDestado.Post;
          total := total + aplazada;
        end;
        if DBente.KeyValue = 1 then
           firmas('GERENTE')
        else if DBente.KeyValue = 2 then
        begin
           firmas('GERENTE');
           firmas('CONTADOR');
           firmas('JEFE DE CARTERA Y CREDITO');
           firmas('TESORERO');
        end
        else if DBente.KeyValue = 3 then
           firmas('PRESIDENTE CONSEJO');
        with frmMain.CDinforme do
        begin
        First;
        while not Eof do
        begin
        with IBQuery2 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          ParamByName('ID_SOLICITUD').AsInteger := frmMain.CDinforme.FieldValues['RADICADO'];
          Open;
            CDinforme.Append;
            CDinforme.FieldValues['SOLICITUD'] := FieldByName('ID_SOLICITUD').AsString;
            CDinforme.FieldValues['NOMBRE'] := FieldByName('NOMBRE').AsString + ' ' +FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            CDinforme.FieldValues['ESTADO'] := FieldByName('DESCRIPCION_ESTADO').AsString;
            if FieldByName('ESTADO').AsInteger = 4 then
            begin
               CDinforme.FieldValues['VALOR'] := FieldByName('VALOR_APROBADO').AsCurrency;
               aprobado := aprobado + FieldByName('VALOR_APROBADO').AsCurrency;
            end
            else
               CDinforme.FieldValues['VALOR'] := 0;
            CDinforme.Post;
          end;
          Next;
        end;

        end; // fin del while cdsolicitud
        imprimir_reporte(frmMain.wpath+'reporte\repinformediario.frf');
end;

procedure TFrmInformeEnte.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'enteaprobador' then
           ParValue := DBente.Text;
        if ParName = 'fecha_concepto' then
           ParValue := retorna_fecha;
        if ParName = 'valor_a' then
           ParValue := aprobado;
        if ParName = 'total' then
           ParValue := total;

end;

function TFrmInformeEnte.contador(estado: integer): integer;
begin
        {with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT("col$solicitud".ID_SOLICITUD) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".FECHA_CONCEPTO = :FECHA) AND');
          SQL.Add('("col$solicitud".ENTE_APROBADOR = :ID_ENTE) AND');
          SQL.Add('("col$solicitud".ESTADO = :ID_ESTADO)');
          ParamByName('ID_ESTADO').AsInteger := estado;
          ParamByName('ID_ENTE').AsInteger := DBente.KeyValue;
          ParamByName('FECHA').AsDateTime := retorna_fecha;
          Open;
          Result := FieldByName('TOTAL').AsInteger;
          Close;
        end;}
        with frmMain.CDinforme do
        begin
        end;

end;

procedure TFrmInformeEnte.firmas(ente: string);
begin
        with CDfirmas do
        begin
          Append;
          FieldValues['firma'] := ente;
          Post;
        end;
end;

end.
