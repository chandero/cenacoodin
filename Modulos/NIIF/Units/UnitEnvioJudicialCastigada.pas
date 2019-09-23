unit UnitEnvioJudicialCastigada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Mask, DBCtrls,
  ExtCtrls, JvLabel, JvBlinkingLabel, IBSQL, DBClient, UnitDmGeneral;

type
  TfrmEnvioJudicialCastigada = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label31: TLabel;
    Label4: TLabel;
    EdAgencia: TDBLookupComboBox;
    EdNumeroColocacion: TMaskEdit;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    Label1: TLabel;
    EdEstadoActual: TEdit;
    asociado: TJvBlinkingLabel;
    DSEstado: TDataSource;
    IBEstado: TIBQuery;
    IBSQL1: TIBSQL;
    Label2: TLabel;
    DBLCBTiposEstado: TDBLookupComboBox;
    IBCuentas: TClientDataSet;
    IBCuentasID_TIPO_CAPTACION: TIntegerField;
    IBCuentasNUMERO_CUENTA: TIntegerField;
    IBCuentasDIGITO_CUENTA: TIntegerField;
    IBCuentasID_ESTADO: TIntegerField;
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure EdAgenciaExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure DBLCBTiposEstadoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioJudicialCastigada: TfrmEnvioJudicialCastigada;
  dmGeneral : TdmGeneral;
  IdAgencia:Integer;
  IdColocacion:String;
  Estado:Integer;
  DescripcionEstado:string;
  Categoria:string;
  Evaluacion:string;
  NuevoEstado:Integer;
  DescripcionNuevoEstado:string;
  FechaCapital : TDate;
  FechaInteres: TDate;
  Saldo:Currency;
  EsVigente:Integer;
  EsPrejuridico:Integer;
  EsJuridico:Integer;
  EsCastigado:Integer;
  EsFallecido:Integer;
  vTipoId:Integer;
  vNumeroId:string;
  NumeroCuentaAh:Integer;
  DigitoCuentaAh:Integer;
  NumeroCuentaAp:Integer;
  DigitoCuentaAp:Integer;

implementation

{$R *.dfm}

uses Unitglobales, UnitdmColocacion;

procedure TfrmEnvioJudicialCastigada.EdNumeroColocacionExit(
  Sender: TObject);
begin
        IdColocacion := trim(EdNumeroColocacion.Text);
        With IBQuery1 do
         begin
           sql.Clear;
           sql.Add('Select ');
           sql.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA,');
           SQL.Add('"col$colocacion".ID_CATEGORIA,');
           SQL.Add('"col$colocacion".ID_EVALUACION,');
           SQL.Add('"col$colocacion".FECHA_CAPITAL,');
           SQL.Add('"col$colocacion".FECHA_INTERES,');
           SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - ABONOS_CAPITAL AS SALDO,');
           SQL.Add('"gen$persona".NOMBRE,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
           sql.Add('from "col$colocacion"');
           SQL.Add('INNER JOIN "gen$persona"');
           SQL.Add('ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) and');
           SQL.Add('("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('INNER JOIN "col$estado"');
           SQL.Add('ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
           sql.Add('Where ');
           sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
           sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByName('ID_AGENCIA').AsInteger := IDAgencia;
           ParamByName('ID_COLOCACION').AsString := IdColocacion;
           Open;
           if RecordCount < 1 then begin
            MessageDlg('La Colocación no Existe',mtError,[mbcancel],0);
            EdNumeroColocacion.SetFocus;
            Exit;
           end;

           Estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
           DescripcionEstado := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
           asociado.Caption := Trim(FieldByName('NOMBRE').AsString) + ' '
                               + Trim(FieldByName('PRIMER_APELLIDO').AsString) + ' '
                               + Trim(FieldByName('SEGUNDO_APELLIDO').AsString);
           vTipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
           vNumeroId := FieldByName('ID_PERSONA').AsString;
           Categoria := FieldByName('ID_CATEGORIA').AsString;
           Evaluacion := FieldByName('ID_EVALUACION').AsString;
           FechaCapital := FieldByName('FECHA_CAPITAL').AsDateTime;
           FechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
           Saldo := FieldByName('SALDO').AsCurrency;
           Close;

           SQL.Clear;
           SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
           SQL.Add('where "col$estado".ES_FALLECIDO = 1');
           Open;
           EsFallecido := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
           Close;
         end;

        EdEstadoActual.Text := DescripcionEstado;
        IBEstado.Active := True;
        IBEstado.Last;
        IBEstado.First;
        DBLCBTiposEstado.KeyValue := IBEstado.FieldByName('ID_ESTADO_COLOCACION').AsInteger;
end;

procedure TfrmEnvioJudicialCastigada.EdAgenciaExit(Sender: TObject);
begin
        IdAgencia := EdAgencia.KeyValue;
end;

procedure TfrmEnvioJudicialCastigada.CmdAceptarClick(Sender: TObject);
var
NuevoEstadoCap : Integer;
begin
        CmdAceptar.Enabled := False;
        Application.ProcessMessages;

        if DBLCBTiposEstado.KeyValue = Estado then
          begin
            MessageDlg('No se realizara ningún cambio',mtError,[mbcancel],0);
            Exit;
          end;

        if MessageDlg('Seguro de Cambiar el Estado',mtConfirmation,[mbyes,mbno],0) = mrno then
           Exit;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
          SQL.Add('where ID_ESTADO_COLOCACION = :"ID_ESTADO_COLOCACION"');
          ParamByName('ID_ESTADO_COLOCACION').AsInteger := NuevoEstado;
          ExecQuery;
          DescripcionNuevoEstado := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;

          Close;
          SQL.Clear;
          SQL.Add('insert into "col$cambioestado" values(:ID_AGENCIA,:ID_COLOCACION,:FECHA_CAMBIO,');
          SQL.Add(':ID_ESTADO_ACTUAL,:ID_ESTADO_NUEVO,:ID_EMPLEADO,:SALDO,:FECHA_CAPITAL,:FECHA_INTERES)');
          ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
          ParamByName('ID_COLOCACION').AsString := IdColocacion;
          ParamByName('FECHA_CAMBIO').AsDate := fFechaActual;
          ParamByName('ID_ESTADO_ACTUAL').AsInteger := Estado;
          ParamByName('ID_ESTADO_NUEVO').AsInteger := NuevoEstado;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          ParamByName('SALDO').AsCurrency := Saldo;
          ParamByName('FECHA_CAPITAL').AsDate := FechaCapital;
          ParamByName('FECHA_INTERES').AsDate := FechaInteres;
          ExecQuery;

          Close;
          sql.Clear;
          sql.Add('update "col$colocacion" set');
          sql.Add('"col$colocacion"."ID_ESTADO_COLOCACION" =:"ID_ESTADO_COLOCACION"');
          sql.Add(' where ');
          sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
          ParamByName('ID_COLOCACION').AsString := IdColocacion;
          ParamByName('ID_ESTADO_COLOCACION').AsInteger := NuevoEstado;
          try
           ExecQuery;
          except
           MessageDlg('Error al tratar de Actualizar "col$colocacion"',mtError,[mbcancel],0);
           Exit;
          end;
          Transaction.Commit;
          MessageDlg('Actualización Realizada Con Exito!',mtInformation,[mbok],0);
        end;

       with IBQuery2 do begin
          SQL.Clear;
          SQL.Add('select DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
          SQL.Add('where ID_ESTADO_COLOCACION = :"ID_ESTADO_COLOCACION"');
          ParamByName('ID_ESTADO_COLOCACION').AsInteger := NuevoEstado;
          Open;
          EdEstadoActual.Text := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
          Close;
       end;

end;

procedure TfrmEnvioJudicialCastigada.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmEnvioJudicialCastigada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmEnvioJudicialCastigada.FormShow(Sender: TObject);
begin
        IBEstado.Open;
        IBEstado.First;
        IBEstado.Last;
        dmColocacion.IBDSagencias.Open;
        dmColocacion.IBDSagencias.Last;
        dmColocacion.IBDSagencias.First;
        EdAgencia.KeyValue := Agencia;
        IBCuentas.EmptyDataSet;
end;

procedure TfrmEnvioJudicialCastigada.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBEstado.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;

        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBEstado.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;


        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmEnvioJudicialCastigada.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmEnvioJudicialCastigada.DBLCBTiposEstadoExit(Sender: TObject);
begin
        NuevoEstado := DBLCBTiposEstado.KeyValue;
end;

end.
