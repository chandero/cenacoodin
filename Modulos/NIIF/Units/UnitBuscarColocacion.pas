unit UnitBuscarColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, IBSQL, DBClient, UnitDmGeneral;

type
  TfrmBusquedadeColocacion = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    CBtiposid: TDBLookupComboBox;
    EdNumeroIdentificacion: TMemo;
    CmdBuscarPersona: TBitBtn;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery: TIBQuery;
    DataSource: TDataSource;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    GridColocacion: TDBGrid;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    EdCuenta: TEdit;
    CmdBuscarCuenta: TBitBtn;
    IBSQL1: TIBSQL;
    CDDeudas: TClientDataSet;
    CDDeudasTIPO: TStringField;
    CDDeudasCOLOCACION: TStringField;
    CDDeudasCAPITALC: TIntegerField;
    CDDeudasINTERESC: TIntegerField;
    CDDeudasCUOTA: TCurrencyField;
    CDDeudasPROXCAPITAL: TDateField;
    CDDeudasPROXINTERES: TDateField;
    CDDeudasTIPOCUOTA: TStringField;
    CDDeudasESTADO: TStringField;
    IBQuery2: TIBQuery;
    Panel1: TPanel;
    Label5: TLabel;
    EdTitular: TEdit;
    CDDeudasPRIMER_APELLIDO: TStringField;
    CDDeudasSEGUNDO_APELLIDO: TStringField;
    CDDeudasNOMBRE: TStringField;
    Panel2: TPanel;
    Label3: TLabel;
    EdNombre: TEdit;
    procedure EdNumeroIdentificacionKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridColocacionDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdBuscarPersonaClick(Sender: TObject);
    procedure CmdBuscarCuentaClick(Sender: TObject);
    procedure EdCuentaExit(Sender: TObject);
    procedure EdCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure CBtiposidExit(Sender: TObject);
    procedure CDDeudasAfterScroll(DataSet: TDataSet);
  private
    procedure BuscarColocaciones;
    procedure SetColocacion(vNewValue:String);
    function  GetColocacion:String;
    { Private declarations }
  public
    property Colocacion:String read GetColocacion write SetColocacion;
    { Public declarations }
  end;

var
  frmBusquedadeColocacion: TfrmBusquedadeColocacion;
  dmGeneral: TdmGeneral;
  vColocacion :String;
  Colores :array[1..15] of TColor;

implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol, UnitBuscarPersona;

procedure TfrmBusquedadeColocacion.SetColocacion(vNewValue:String);
begin
        vColocacion := vNewValue;
end;

function TfrmBusquedadeColocacion.GetColocacion:String;
begin
        Result := vColocacion;
end;

procedure TfrmBusquedadeColocacion.EdNumeroIdentificacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmBusquedadeColocacion.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;
        IBDataSet1.Open;
        IBDataSet1.Last;
        IBDataSet1.First;
end;

procedure TfrmBusquedadeColocacion.EdNumeroIdentificacionExit(
  Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
        with IBQuery1 do
        begin
             SQL.Clear;
             SQL.Add('select * from "gen$persona" where ');
             SQL.Add('"gen$persona".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ');
             SQL.Add('"gen$persona".ID_PERSONA = :"ID_PERSONA"');
             ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
             Active := true;
             Last;
             First;
             if RecordCount = 1 then
             begin
                EdNombre.Text  := FieldByName('PRIMER_APELLIDO').AsString + ' '+
                                  FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                  FieldByName('NOMBRE').AsString;
                CDDeudas.EmptyDataSet;
                BuscarColocaciones;
             end;
        end;
end;

procedure TfrmBusquedadeColocacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmBusquedadeColocacion.BuscarColocaciones;
begin
        with IBQuery do
        begin
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('"col$colocacion".ID_COLOCACION,');
             SQL.Add('"col$colocacion".ID_CLASIFICACION,');
             SQL.Add('"col$estado".ID_ESTADO_COLOCACION,');
             SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
             SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
             SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
             SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
             SQL.Add('"col$colocacion".VALOR_CUOTA,');
             SQL.Add('"col$colocacion".FECHA_INTERES,');
             SQL.Add('"col$colocacion".FECHA_CAPITAL,');
             SQL.Add('"col$estado".ES_CASTIGADO,');
             SQL.Add('"col$estado".ES_NOVISADO,');
             SQL.Add('"col$estado".ES_ANULADO,');
             SQL.Add('"col$estado".ES_CANCELADO,');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,');
             SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$persona".NOMBRE');
             SQL.Add('FROM ');
             SQL.Add('"col$colocacion"');
             SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION) ');
             SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
             SQL.Add('INNER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
             SQL.Add('AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
             SQL.Add('WHERE ');
             SQL.Add('("col$colocacion".ID_IDENTIFICACION = :"ID_IDENTIFICACION") AND ');
             SQL.Add('("col$colocacion".ID_PERSONA = :"ID_PERSONA") AND ');
             SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION IN (0,1,2,3,8,9)) ');
             SQL.Add(' ORDER BY ');
             SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,"col$colocacion".ID_COLOCACION ');

             ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
             Open;

             while not eof do
             begin
                  CDDeudas.Open;
                  CDDeudas.Append;
                  CDDeudas.FieldByName('TIPO').AsString := 'DEUDA';
                  CDDeudas.FieldByName('COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                  CDDeudas.FieldByName('CAPITALC').AsInteger := FieldByName('AMORTIZA_CAPITAL').AsInteger;
                  CDDeudas.FieldByName('INTERESC').AsInteger := FieldByName('AMORTIZA_INTERES').AsInteger;
                  CDDeudas.FieldByName('CUOTA').AsCurrency := FieldByName('VALOR_CUOTA').AsCurrency;
                  CDDeudas.FieldByName('PROXCAPITAL').AsDateTime := FieldByName('FECHA_CAPITAL').AsDateTime;
                  CDDeudas.FieldByName('PROXINTERES').AsDateTime := FieldByName('FECHA_INTERES').AsDateTime;
                  CDDeudas.FieldByName('ESTADO').AsString := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                  CDDeudas.FieldByName('TIPOCUOTA').AsString := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                  CDDeudas.FieldByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
                  CDDeudas.FieldByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
                  CDDeudas.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
                  CDDeudas.Post;
                  CDDeudas.Close;
                  Next;
             end;


        end;

        with IBQuery2 do
        begin
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('"col$colocacion".ID_COLOCACION,');
             SQL.Add('"col$colocacion".ID_CLASIFICACION,');
             SQL.Add('"col$estado".ID_ESTADO_COLOCACION,');
             SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
             SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
             SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
             SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
             SQL.Add('"col$colocacion".VALOR_CUOTA,');
             SQL.Add('"col$colocacion".FECHA_INTERES,');
             SQL.Add('"col$colocacion".FECHA_CAPITAL,');
             SQL.Add('"col$estado".ES_CASTIGADO,');
             SQL.Add('"col$estado".ES_NOVISADO,');
             SQL.Add('"col$estado".ES_ANULADO,');
             SQL.Add('"col$estado".ES_CANCELADO, ');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,');
             SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$persona".NOMBRE');
             SQL.Add('FROM ');
             SQL.Add('"col$colocacion"');
             SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION) ');
             SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
             SQL.Add('INNER JOIN "col$colgarantias" ON ("col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
             SQL.Add('INNER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
             SQL.Add('AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
             SQL.Add('WHERE ');
             SQL.Add('("col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
             SQL.Add('("col$colgarantias".ID_PERSONA = :ID_PERSONA) AND');
             SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION IN (0,1,2,3,8,9)) ');
             SQL.Add(' ORDER BY ');
             SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,"col$colocacion".ID_COLOCACION ');

             ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
             Open;

             while not eof do
             begin
                  CDDeudas.Open;
                  CDDeudas.Append;
                  CDDeudas.FieldByName('TIPO').AsString := 'FIANZA';
                  CDDeudas.FieldByName('COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                  CDDeudas.FieldByName('CAPITALC').AsInteger := FieldByName('AMORTIZA_CAPITAL').AsInteger;
                  CDDeudas.FieldByName('INTERESC').AsInteger := FieldByName('AMORTIZA_INTERES').AsInteger;
                  CDDeudas.FieldByName('CUOTA').AsCurrency := FieldByName('VALOR_CUOTA').AsCurrency;
                  CDDeudas.FieldByName('PROXCAPITAL').AsDateTime := FieldByName('FECHA_CAPITAL').AsDateTime;
                  CDDeudas.FieldByName('PROXINTERES').AsDateTime := FieldByName('FECHA_INTERES').AsDateTime;
                  CDDeudas.FieldByName('ESTADO').AsString := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                  CDDeudas.FieldByName('TIPOCUOTA').AsString := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                  CDDeudas.FieldByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
                  CDDeudas.FieldByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
                  CDDeudas.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
                  CDDeudas.Post;
                  CDDeudas.Close;
                  Next;
             end;
        end;

        CDDeudas.Open;
        CDDeudas.Last;
        CDDeudas.First;
        if CDDeudas.RecordCount > 0 then
           CmdAceptar.Enabled := true;
end;

procedure TfrmBusquedadeColocacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmBusquedadeColocacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := caFree;
end;

procedure TfrmBusquedadeColocacion.GridColocacionDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
        with CDDeudas do
        begin
         if  (FieldByName('TIPO').AsString = 'FIANZA') then
             GridColocacion.Canvas.Brush.Color := clGreen;
        end;
        GridColocacion.DefaultDrawColumnCell(Rect, DataCol,Column,State);

end;

procedure TfrmBusquedadeColocacion.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBQuery.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBDataSet1.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;

        IBQuery.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBDataSet1.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;


        Colores[7] := clYellow;
        Colores[6] := clBlue;
        Colores[5] := clFuchsia;
        Colores[4] := clAqua;
        Colores[3] := clLtGray;
        Colores[2] := clDkGray;
        Colores[1] := clWhite;

end;

procedure TfrmBusquedadeColocacion.CmdAceptarClick(Sender: TObject);
begin
        Colocacion := CDDeudas.FieldByName('COLOCACION').AsString;
end;

procedure TfrmBusquedadeColocacion.CmdBuscarPersonaClick(Sender: TObject);
var frmBuscarPersona:TfrmBuscarPersona;
begin
        frmBuscarPersona := TfrmBuscarPersona.Create(Self);
        if frmBuscarPersona.ShowModal = mrOK then
        begin
           CBtiposid.KeyValue := frmBuscarPersona.id_identificacion;
           EdNumeroIdentificacion.Text := frmBuscarPersona.id_persona;
           EdNumeroIdentificacionExit(TObject(EdNumeroIdentificacion));
        end;

end;

procedure TfrmBusquedadeColocacion.CmdBuscarCuentaClick(Sender: TObject);
var Dg:Integer;
begin
        if EdCuenta.Text = '' then Exit;

        EdCuenta.Text := Format('%.7d',[Strtoint(EdCuenta.Text)]);
        Dg := StrToInt(DigitoControl(1,EdCuenta.Text));

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "cap$maestrotitular"');
          SQL.Add('where "cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
          SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA and');
          sql.Add('"cap$maestrotitular".NUMERO_TITULAR = 1');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCuenta.Text);
          ParamByName('DIGITO_CUENTA').AsInteger := Dg;
          try
           ExecQuery;
          except
          end;

          CBtiposid.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
          EdNumeroIdentificacion.Text := FieldByName('ID_PERSONA').AsString;
        end;          

        EdNumeroIdentificacionexit(Sender);
end;

procedure TfrmBusquedadeColocacion.EdCuentaExit(Sender: TObject);
begin
        CmdBuscarCuenta.Click;
end;

procedure TfrmBusquedadeColocacion.EdCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmBusquedadeColocacion.CBtiposidExit(Sender: TObject);
begin
//        if ((CBtiposid.KeyValue = Null) or ( CBtiposid.KeyValue < 1)) then
//          EdCuenta.SetFocus;
end;

procedure TfrmBusquedadeColocacion.CDDeudasAfterScroll(DataSet: TDataSet);
begin
        EdTitular.Text := DataSet.FieldByName('NOMBRE').AsString + ' ' +
                          DataSet.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                          DataSet.FieldByName('SEGUNDO_APELLIDO').AsString;
end;

end.
