unit UnitEvaluacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, DBClient, IBCustomDataSet,
  IBQuery, Provider, IBDatabase, JvEdit, JvFloatEdit, Grids, DBGrids,
  JvTypedEdit, Buttons, IBSQL, IBTable, DBCtrls;

type
  TfrmEvaluacion = class(TForm)
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    edFecha: TDateTimePicker;
    Panel2: TPanel;
    Label2: TLabel;
    edColocacion: TEdit;
    btnCargar: TBitBtn;
    Label3: TLabel;
    edAsociado: TEdit;
    Label4: TLabel;
    edSaldo: TJvCurrencyEdit;
    edProvCapital: TJvCurrencyEdit;
    edProvInteres: TJvCurrencyEdit;
    edProvCosta: TJvCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edCategoria: TEdit;
    Label9: TLabel;
    edEvaluacion: TEdit;
    Label10: TLabel;
    edNuevaProvision: TJvCurrencyEdit;
    btnAgregar: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    btnAplicar: TBitBtn;
    btnCerrar: TBitBtn;
    IBQRangoProv: TIBQuery;
    edClasificacion: TEdit;
    edGarantia: TEdit;
    Label11: TLabel;
    edPorc: TJvFloatEdit;
    IBQEvaluacion: TIBQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1FECHA_CORTE: TDateField;
    ClientDataSet1ID_AGENCIA: TIntegerField;
    ClientDataSet1ID_COLOCACION: TStringField;
    ClientDataSet1CAPITAL_ANTERIOR: TBCDField;
    ClientDataSet1CAPITAL_NUEVO: TBCDField;
    ClientDataSet1CATEGORIA: TStringField;
    ClientDataSet1EVALUACION: TStringField;
    ClientDataSet1SALDO: TBCDField;
    ClientDataSet1PORCENTAJE: TFloatField;
    btnHabilitar: TBitBtn;
    btnRetirar: TBitBtn;
    Label12: TLabel;
    edFechaComprobante: TDateTimePicker;
    IBSQL1: TIBSQL;
    Label13: TLabel;
    edNota: TEdit;
    IBQuery2: TIBQuery;
    ClientDataSet1CLASIFICACION: TIntegerField;
    ClientDataSet1GARANTIA: TIntegerField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    IBPorc: TIBTable;
    DSporc: TDataSource;
    DBGPorc: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure edEvaluacionChange(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure edPorcChange(Sender: TObject);
    procedure btnHabilitarClick(Sender: TObject);
    procedure btnRetirarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Inicializar;
    procedure LimpiarCampos;
    procedure Contabilizar(diferencia: Currency);
  public
    { Public declarations }
  end;

var
  frmEvaluacion: TfrmEvaluacion;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmEvaluacion.FormCreate(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmEvaluacion.Inicializar;
begin

        If IBTransaction1.InTransaction then
        begin
            IBTransaction1.Commit;
            IBTransaction1.StartTransaction;
        end;
        IBPorc.Open;
        edFecha.Date := fFechaActual;
        edFechaComprobante.Date := edFecha.Date;
end;

procedure TfrmEvaluacion.btnCargarClick(Sender: TObject);
begin
        IBQuery1.Close;
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Add('SELECT c.ID_AGENCIA, c.ID_COLOCACION, e.ID_CLASIFICACION, e.ID_GARANTIA, e.ID_ARRASTRE, c.ID_EVALUACION, p.NOMBRE,');
        IBQUERY1.SQL.Add('p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO, e.DEUDA, e.PCAPITAL, e.PINTERES, e.PCOSTAS');
        IBQuery1.SQL.Add('FROM "col$causaciondiaria" e');
        IBQuery1.SQL.Add('INNER JOIN "col$colocacion" c ON c.ID_COLOCACION = e.ID_COLOCACION');
        IBQuery1.SQL.Add('INNER JOIN "gen$persona" p ON c.ID_IDENTIFICACION = p.ID_IDENTIFICACION and c.ID_PERSONA = p.ID_PERSONA');
        IBQuery1.SQL.Add('WHERE e.ID_AGENCIA = :ID_AGENCIA and e.ID_COLOCACION = :ID_COLOCACION and e.FECHA_CORTE = :FECHA_CORTE');
        IBQuery1.ParamByName('FECHA_CORTE').AsDate := edFecha.Date;
        IBQuery1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBQuery1.ParamByName('ID_COLOCACION').AsString := edColocacion.Text;
        IBQuery1.Open;
        if IBQuery1.RecordCount > 0 then
        begin
        edColocacion.Text := IBQuery1.FieldByName('ID_COLOCACION').AsString;
        edAsociado.Text := IBQuery1.FieldByName('NOMBRE').AsString + ' ' + IBQuery1.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString;
        edClasificacion.Text := IBQuery1.FieldByName('ID_CLASIFICACION').AsString;
        edGarantia.Text := IBQuery1.FieldByName('ID_GARANTIA').AsString;
        edSaldo.Value := IBQuery1.FieldByName('DEUDA').AsCurrency;
        edCategoria.Text := IBQuery1.FieldByName('ID_ARRASTRE').AsString;
        edProvCapital.Value := IBQuery1.FieldByName('PCAPITAL').AsCurrency;
        edProvInteres.Value := IBQuery1.FieldByName('PINTERES').AsCurrency;
        edProvCosta.Value := IBQuery1.FieldByName('PCOSTAS').AsCurrency;
        edColocacion.Enabled := false;
        end
        else
          ShowMessage('Colocaci�n No Encontrada o Fecha de Corte Incorrecta. Verifique');
end;

procedure TfrmEvaluacion.edEvaluacionChange(Sender: TObject);
begin
        if edEvaluacion.Text <> '' then
        begin
         // Evaluar nueva provision
         IBQRangoProv.Close;
         IBQRangoProv.ParamByName('ID_CLASIFICACION').AsInteger := StrToInt(edClasificacion.Text);
         IBQRangoProv.ParamByName('ID_GARANTIA').AsInteger := StrToInt(edGarantia.Text);
         IBQRangoProv.ParamByName('ID_EDAD').AsString := edEvaluacion.Text;
         IBQRangoProv.Open;
         if IBQRangoProv.RecordCount > 0 then
         begin
           edPorc.Value := IBQRangoProv.FieldByName('A_CAPITAL').AsCurrency;
           edNuevaProvision.Value := Round(edSaldo.Value * edPorc.Value / 100);
         end
         else
           ShowMessage('Evaluaci�n no Valida. Verifique');
        end;

end;

procedure TfrmEvaluacion.btnAgregarClick(Sender: TObject);
begin

        if edColocacion.Text <> '' then
        begin
        ClientDataSet1.Insert;
        ClientDataSet1FECHA_CORTE.Value := edFecha.Date;
        ClientDataSet1ID_AGENCIA.Value := Agencia;
        ClientDataSet1ID_COLOCACION.Value := edColocacion.Text;
        ClientDataSet1CATEGORIA.Value := edCategoria.Text;
        ClientDataSet1EVALUACION.Value := edEvaluacion.Text;
        ClientDataSet1CLASIFICACION.Value := StrToInt(edClasificacion.Text);
        ClientDataSet1GARANTIA.Value := StrToInt(edGarantia.text);
        ClientDataSet1SALDO.Value := edSaldo.Value;
        ClientDataSet1PORCENTAJE.Value := edPorc.Value;
        ClientDataSet1CAPITAL_ANTERIOR.Value := edProvCapital.Value;
        ClientDataSet1CAPITAL_NUEVO.Value := edNuevaProvision.Value;
        ClientDataSet1.Post;
        end;
        btnAplicar.Enabled := true;
        LimpiarCampos;
end;

procedure TfrmEvaluacion.btnCerrarClick(Sender: TObject);
begin
        self.Close;
end;

procedure TfrmEvaluacion.btnAplicarClick(Sender: TObject);
var
  diferencia : Currency;
  IBConsecB: TIBSQL;
  VNocomprobante: String;
  CodigoAux: String;
  DebitoAux: Currency;
  CreditoAux: Currency;
  TotalDebitoAux: Currency;
  TotalCreditoAux: Currency;
begin

       IBConsecB := TIBSQL.Create(nil);
       IBConsecB.Transaction := IBTransaction1;
       VNocomprobante := FormatCurr('00000000',ObtenerConsecutivo(IBConsecB));
        diferencia := 0;
        TotalDebitoAux := 0;
        TotalCreditoAux := 0;
        if MessageDlg('Seguro de Aplicar Cambios?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          if ClientDataSet1.ApplyUpdates(0) = 0 then
          begin

            ClientDataSet1.First;
            while not ClientDataSet1.Eof do
            begin
                IBQuery1.Close;
                IBQuery1.SQL.Clear;
                IBQuery1.SQL.Add('UPDATE "col$colocacion" c SET c.ID_EVALUACION = :ID_EVALUACION WHERE c.ID_COLOCACION = :ID_COLOCACION and c.ID_AGENCIA = :ID_AGENCIA');
                IBQuery1.ParamByName('ID_COLOCACION').AsString := ClientDataSet1.FieldByName('ID_COLOCACION').AsString;
                IBQuery1.ParamByName('ID_AGENCIA').AsInteger := ClientDataSet1.FieldByName('ID_AGENCIA').AsInteger;
                IBQuery1.ParamByName('ID_EVALUACION').AsString := ClientDataSet1.FieldByName('EVALUACION').AsString;
                IBQuery1.ExecSQL;

            // Movimiento Auxiliar
             IBQuery2.Close;
             IBQuery2.SQL.Clear;
             IBQuery2.SQL.Add('SELECT COD_PROV_CAPITAL FROM COL$CODIGOSPUC WHERE');
             IBQuery2.SQL.Add(' ID_CLASIFICACION = :ID_CLASIFICACION and ');
             IBQuery2.SQL.Add(' ID_GARANTIA = :ID_GARANTIA and ');
             IBQuery2.SQL.Add(' ID_CATEGORIA = :ID_CATEGORIA ');
             IBQuery2.ParamByName('ID_CLASIFICACION').AsInteger := ClientDataSet1CLASIFICACION.Value;
             IBQuery2.ParamByName('ID_GARANTIA').AsInteger := ClientDataSet1GARANTIA.Value;
             IBQuery2.ParamByName('ID_CATEGORIA').AsString := ClientDataSet1CATEGORIA.Value;
             IBQuery2.Open;
             CodigoAux := IBQuery2.FieldByName('COD_PROV_CAPITAL').AsString;
             DebitoAux := ClientDataSet1CAPITAL_ANTERIOR.Value;
             CreditoAux := 0;

             TotalDebitoAux := TotalDebitoAux + DebitoAux;
             TotalCreditoAux := TotalCreditoAux + CreditoAux;

             with IBQuery1 do
             begin
              Close;
              SQL.Clear;
              SQL.Add('insert into CON$AUXILIAR values (');
              SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
              SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
              SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
              ParamByName('ID_COMPROBANTE').AsString := vNoComprobante;
              ParamByName('ID_AGENCIA').AsInteger:= Agencia;
              ParamByName('FECHA').AsDate := edFechaComprobante.Date;
              ParamByName('CODIGO').AsString := CodigoAux;
              ParamByName('DEBITO').AsCurrency := DebitoAux;
              ParamByName('CREDITO').AsCurrency := CreditoAux;
              ParamByName('ID_CUENTA').AsInteger := 0;
              ParamByName('ID_COLOCACION').AsString := ClientDataSet1ID_COLOCACION.Value;
              ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              ParamByName('ID_PERSONA').AsString := '';
              ParamByName('MONTO_RETENCION').AsCurrency := 0;
              ParamByName('TASA_RETENCION').AsFloat := 0;
              ParamByName('ESTADOAUX').AsString := 'O';
              ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
              ExecSQL;
              Close;
             end;

             IBQuery2.Close;
             IBQuery2.SQL.Clear;
             IBQuery2.SQL.Add('SELECT COD_PROV_CAPITAL FROM COL$CODIGOSPUC WHERE');
             IBQuery2.SQL.Add(' ID_CLASIFICACION = :ID_CLASIFICACION and ');
             IBQuery2.SQL.Add(' ID_GARANTIA = :ID_GARANTIA and ');
             IBQuery2.SQL.Add(' ID_CATEGORIA = :ID_CATEGORIA ');
             IBQuery2.ParamByName('ID_CLASIFICACION').AsInteger := ClientDataSet1CLASIFICACION.Value;
             IBQuery2.ParamByName('ID_GARANTIA').AsInteger := ClientDataSet1GARANTIA.Value;
             IBQuery2.ParamByName('ID_CATEGORIA').AsString := ClientDataSet1EVALUACION.Value;
             IBQuery2.Open;
             CodigoAux := IBQuery2.FieldByName('COD_PROV_CAPITAL').AsString;
             DebitoAux := 0;
             CreditoAux := ClientDataSet1CAPITAL_NUEVO.Value;
             TotalDebitoAux := TotalDebitoAux + DebitoAux;
             TotalCreditoAux := TotalCreditoAux + CreditoAux;

             with IBQuery1 do begin
              ParamByName('ID_COMPROBANTE').AsString := vNoComprobante;
              ParamByName('ID_AGENCIA').AsInteger:= Agencia;
              ParamByName('FECHA').AsDate := edFechaComprobante.Date;
              ParamByName('CODIGO').AsString := CodigoAux;
              ParamByName('DEBITO').AsCurrency := DebitoAux;
              ParamByName('CREDITO').AsCurrency := CreditoAux;
              ParamByName('ID_CUENTA').AsInteger := 0;
              ParamByName('ID_COLOCACION').AsString := ClientDataSet1ID_COLOCACION.Value;
              ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              ParamByName('ID_PERSONA').AsString := '';
              ParamByName('MONTO_RETENCION').AsCurrency := 0;
              ParamByName('TASA_RETENCION').AsFloat := 0;
              ParamByName('ESTADOAUX').AsString := 'O';
              ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
              ExecSQL;
              Close;
             end;
                // Fin Movimiento Auxiliar
                diferencia := diferencia + ClientDataSet1CAPITAL_ANTERIOR.Value - ClientDataSet1CAPITAL_NUEVO.Value;
                ClientDataSet1.Next;
            end;
            if diferencia <> 0 then
               begin
             with IBQuery1 do
             begin
              Close;
              SQL.Clear;
              SQL.Add('insert into CON$AUXILIAR values (');
              SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
              SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
              SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
              ParamByName('ID_COMPROBANTE').AsString := vNoComprobante;
              ParamByName('ID_AGENCIA').AsInteger:= Agencia;
              ParamByName('FECHA').AsDate := edFechaComprobante.Date;
              ParamByName('CODIGO').AsString := '511517000000000000'{YA ES NIIF};
              ParamByName('DEBITO').AsCurrency := Abs(diferencia);
              ParamByName('CREDITO').AsCurrency := 0;
              ParamByName('ID_CUENTA').AsInteger := 0;
              ParamByName('ID_COLOCACION').AsString := '';
              ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              ParamByName('ID_PERSONA').AsString := '';
              ParamByName('MONTO_RETENCION').AsCurrency := 0;
              ParamByName('TASA_RETENCION').AsFloat := 0;
              ParamByName('ESTADOAUX').AsString := 'O';
              ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
              ExecSQL;
              Close;
             end;

               // Encabezado Comprobante
                with IBQuery1 do
                begin
                 Close;
                 sql.Clear;
                 sql.Add('insert into CON$COMPROBANTE (CON$COMPROBANTE."ID_COMPROBANTE",');
                 sql.Add('CON$COMPROBANTE."FECHADIA", CON$COMPROBANTE."TIPO_COMPROBANTE",');
                 sql.Add('CON$COMPROBANTE."ID_AGENCIA", CON$COMPROBANTE."DESCRIPCION",');
                 sql.Add('CON$COMPROBANTE."TOTAL_DEBITO", CON$COMPROBANTE."TOTAL_CREDITO",');
                 sql.Add('CON$COMPROBANTE."ESTADO", CON$COMPROBANTE."IMPRESO",');
                 sql.Add('CON$COMPROBANTE."ANULACION", CON$COMPROBANTE."ID_EMPLEADO") ');
                 sql.Add('values (');
                 sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
                 sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
                 sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION", :"ID_EMPLEADO")');
                 ParamByName('ID_COMPROBANTE').AsString:= vNoComprobante;
                 ParamByname('FECHADIA').AsDate := edFechaComprobante.Date;
                 ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
                 ParamByName('DESCRIPCION').AsString := 'Evaluacion de Cartera';
                 ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebitoAux + Abs(diferencia);
                 ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCreditoAux;
                 ParamByName('ESTADO').AsString  := 'O';
                 ParamByname('ANULACION').asstring := '';
                 ParamByName('IMPRESO').AsInteger  := 1;
                 ParamByName('ID_EMPLEADO').AsString := DBAlias;
                 ExecSQL;
                 Close;
                 edNota.Text := vNoComprobante;
                end;
            // Fin Encabezado Comprobante
               end;
            IBTransaction1.Commit;
            btnAplicar.Enabled := False;
            Panel2.Enabled := False;
            ShowMessage('Evaluacion Aplicada con Exito!!');
          end
          else
          begin
              IBTransaction1.Rollback;
              ShowMessage('Error al Aplicar Evaluacion');
          end;

          LimpiarCampos;
        end;
end;

procedure TfrmEvaluacion.LimpiarCampos;
begin
        edColocacion.Text := '';
        edAsociado.Text := '';
        edSaldo.Value := 0;
        edProvCapital.Value := 0;
        edProvInteres.Value := 0;
        edProvCosta.Value := 0;
        edCategoria.Text := '';
        edEvaluacion.Text := '';
        edNuevaProvision.Value := 0;
        edClasificacion.Text := '';
        edGarantia.Text := '';
        edPorc.Value := 0;
        edColocacion.Enabled := true;
end;

procedure TfrmEvaluacion.edPorcChange(Sender: TObject);
begin
        if (edPorc.Value >= 0) and  (edPorc.Value <= 100) then
        begin
           edNuevaProvision.Value := Round(edSaldo.Value * edPorc.Value / 100);
        end
        else
           ShowMessage('Valor no Valido. Verifique');
end;

procedure TfrmEvaluacion.btnHabilitarClick(Sender: TObject);
begin
        Panel1.Enabled := False;
        Panel2.Enabled := True;
        Panel3.Enabled := True;
        IBQEvaluacion.ParamByName('FECHA_CORTE').AsDate := edFecha.Date;
        if not ClientDataSet1.Active then
        begin
         IBQEvaluacion.Open;
         ClientDataSet1.Open;
        end;
end;

procedure TfrmEvaluacion.btnRetirarClick(Sender: TObject);
begin
        ClientDataSet1.Delete;
end;

procedure TfrmEvaluacion.Contabilizar(diferencia: Currency);
begin


end;

end.
