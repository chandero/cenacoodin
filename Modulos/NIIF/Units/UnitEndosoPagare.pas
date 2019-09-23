unit UnitEndosoPagare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvStaticText, DBCtrls, DB, IBCustomDataSet,
  IBQuery, Buttons, IBSQL;

type
  TFrmEndosoPagare = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EDcolocacion: TEdit;
    Asociado: TLabel;
    JVasociado: TJvStaticText;
    JVsaldo: TJvStaticText;
    JVfechaK: TJvStaticText;
    JVfechaI: TJvStaticText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    panel2: TPanel;
    Label5: TLabel;
    DBentidad: TDBLookupComboBox;
    DSentidad: TDataSource;
    IBentidad: TIBQuery;
    Label6: TLabel;
    EDexterno: TEdit;
    Panel3: TPanel;
    Baceptar: TBitBtn;
    Bcerrar: TBitBtn;
    IBSQL1: TIBSQL;
    JVfechaV: TJvStaticText;
    Label7: TLabel;
    JVdesembolso: TJvStaticText;
    Label8: TLabel;
    Bcancelar: TSpeedButton;
    Label9: TLabel;
    JVcalificacion: TJvStaticText;
    procedure EDcolocacionExit(Sender: TObject);
    procedure EDcolocacionKeyPress(Sender: TObject; var Key: Char);
    procedure DBentidadEnter(Sender: TObject);
    procedure BcancelarClick(Sender: TObject);
    procedure DBentidadKeyPress(Sender: TObject; var Key: Char);
    procedure DBentidadExit(Sender: TObject);
    procedure EDexternoKeyPress(Sender: TObject; var Key: Char);
    procedure BaceptarClick(Sender: TObject);
    procedure BcerrarClick(Sender: TObject);
  private
  vFechaI :TDate;
  vFechaK :TDate;
  vSaldo :TDate;
    vCategoria: string;
    procedure Limpiar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEndosoPagare: TFrmEndosoPagare;

implementation
uses UnitDmgeneral,UnitGlobales;


{$R *.dfm}

procedure TFrmEndosoPagare.EDcolocacionExit(Sender: TObject);
begin
        if EDcolocacion.Text <> '' then
        begin
          if dmGeneral.IBTransaction1.InTransaction then
             dmGeneral.IBTransaction1.Commit;
          dmGeneral.IBTransaction1.StartTransaction;
          with IBSQL1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"col$entidad".DESCRIPCION');
            SQL.Add('FROM');
            SQL.Add('"col$colendosado"');
            SQL.Add('INNER JOIN "col$entidad" ON ("col$colendosado".ID_ENTIDAD="col$entidad".ID_ENTIDAD)');
            SQL.Add('WHERE');
            SQL.Add('("col$colendosado".ID_COLOCACION = :ID_COLOCACION) AND ');
            SQL.Add('("col$colendosado".ESTADO = 1)');
            ParamByName('ID_COLOCACION').AsString := EDcolocacion.Text;
            ExecQuery;
            if RecordCount <> 0 then
            begin
              MessageDlg('La Colocación se Encuentra a Endosada a nombre de : ' + FieldByName('DESCRIPCION').AsString,mtInformation,[MBOK],0);
              EDcolocacion.SelectAll;
              EDcolocacion.SetFocus;
              Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
            SQL.Add('"gen$persona".NOMBRE,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO,');
            SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
            SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
            SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
            SQL.Add('"col$colocacion".FECHA_CAPITAL,');
            SQL.Add('"col$colocacion".FECHA_INTERES,');
            SQL.Add('"col$colocacion".ID_CATEGORIA,');
            SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO');
            SQL.Add('FROM');
            SQL.Add('"col$colocacion"');
            SQL.Add('INNER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
            SQL.Add('AND ("col$colocacion".ID_PERSONA="gen$persona".ID_PERSONA)');
            SQL.Add('WHERE');
            SQL.Add('("col$colocacion".ID_COLOCACION = :ID_COLOCACION)');
            ParamByName('ID_COLOCACION').AsString := EDcolocacion.Text;
            ExecQuery;
            if RecordCount = 0 then
            begin
               MessageDlg('Número de Colocación no Existe',mtError,[mbok],0);
               EDcolocacion.SelectAll;
               EDcolocacion.SetFocus;
               Exit;
            end;
            vCategoria := FieldByName('ID_CATEGORIA').AsString;
            JVcalificacion.Caption := FieldByName('ID_CATEGORIA').AsString;
            JVasociado.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            JVfechaV.Caption := FieldByName('FECHA_VENCIMIENTO').AsString;
            JVfechaI.Caption := FieldByName('FECHA_INTERES').AsString;
            vFechaI := FieldByName('FECHA_INTERES').AsDate;
            JVfechaK.Caption := FieldByName('FECHA_CAPITAL').AsString;
            vFechaK := FieldByName('FECHA_CAPITAL').AsDate;
            JVdesembolso.Caption := CurrToStrF(FieldByName('VALOR_DESEMBOLSO').AsCurrency,ffCurrency,2);//FormatCurr('$##.#',FieldByName('VALOR_DESEMBOLSO').AsCurrency);
            JVsaldo.Caption := CurrToStrF(FieldByName('SALDO').AsCurrency,ffCurrency,2);//FormatCurr('$##.#',FieldByName('SALDO').AsCurrency);
            vSaldo := FieldByName('SALDO').AsCurrency;
            if FieldByName('ID_ESTADO_COLOCACION').AsInteger <> 0 then
            begin
              MessageDlg('La Colocación debe estar Vigente...',mtError,[mbok],0);
              EDcolocacion.SelectAll;
              EDcolocacion.SetFocus;
              Exit;
            end;
          end;
          Panel1.Enabled := False;
          panel2.Enabled := True;
          IBentidad.Open;
          IBentidad.Last;
          DBentidad.SetFocus;
        end;

end;

procedure TFrmEndosoPagare.EDcolocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmEndosoPagare.DBentidadEnter(Sender: TObject);
begin
        DBentidad.DropDown
end;

procedure TFrmEndosoPagare.BcancelarClick(Sender: TObject);
begin
        EDcolocacion.Text := '';
        limpiar;
end;

procedure TFrmEndosoPagare.DBentidadKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmEndosoPagare.DBentidadExit(Sender: TObject);
begin
        Baceptar.Enabled := True;
end;

procedure TFrmEndosoPagare.EDexternoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmEndosoPagare.Limpiar;
begin
        JVasociado.Caption := '';
        JVsaldo.Caption := '';
        JVfechaK.Caption := '';
        JVfechaI.Caption := '';
        IBentidad.Close;
        EDexterno.Text := '';
        panel2.Enabled := False;
        Panel1.Enabled := True;
        JVdesembolso.Caption := '';
        JVfechaV.Caption := '';
        Baceptar.Enabled := False;
        EDcolocacion.SetFocus;
end;

procedure TFrmEndosoPagare.BaceptarClick(Sender: TObject);
begin
        if MessageDlg('Esta Seguro de Realzar la Operación ?',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        with IBSQL1 do
        begin
          Close;
          try
            Close;
            SQL.Clear;
            SQL.Add('insert into "col$colendosado" values (:ID_ENTIDAD,:ID_COLOCACION,');
            SQL.Add(':FECHAK,:FECHAI,:SALDO,:ID_CATEGORIA,1,:FECHA_ENDOSO,:DOCUMENTO,NULL,:ID_EMPLEADO,NULL)');
            ParamByName('ID_ENTIDAD').AsInteger := DBentidad.KeyValue;
            ParamByName('ID_COLOCACION').AsString := EDcolocacion.Text;
            ParamByName('FECHAK').AsDate := vFechaK;
            ParamByName('FECHAI').AsDate := vFechaI;
            ParamByName('SALDO').AsCurrency := vSaldo;
            ParamByName('FECHA_ENDOSO').AsDate := fFechaActual;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('DOCUMENTO').AsString := EDexterno.Text;
            ParamByName('ID_CATEGORIA').AsString := vCategoria;
            ExecQuery;
            Transaction.Commit;
          except
          on E: Exception do
          begin
            MessageDlg('Error al Grabar Datos, con Mensaje:' + #13 + E.Message,mtError,[mbok],0);
            Transaction.Rollback;
            Exit;
          end;
          end;
          MessageDlg('Registro Grabado con Exito!!!',mtinformation,[mbok],0);
          Bcancelar.Click;
        end;
end;

procedure TFrmEndosoPagare.BcerrarClick(Sender: TObject);
begin
        Close;
end;

end.
