unit UnitBuscarControlCobro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, IBSQL;

type
  TfrmBusquedaControlCobro = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CBtiposid: TDBLookupComboBox;
    EdNombre: TEdit;
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
    GroupBox2: TGroupBox;
    Label4: TLabel;
    EdCuenta: TEdit;
    CmdBuscarCuenta: TBitBtn;
    IBSQL1: TIBSQL;
    procedure EdNumeroIdentificacionKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBQueryAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdBuscarPersonaClick(Sender: TObject);
    procedure CmdBuscarCuentaClick(Sender: TObject);
    procedure EdCuentaExit(Sender: TObject);
    procedure EdCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure CBtiposidExit(Sender: TObject);
  private
    procedure SetColocacion(vNewValue:String);
    function  GetColocacion:String;
    procedure SetId(vNewValue:Integer);
    function  GetId:Integer;
    procedure SetDocumento(vNewValue:string);
    function  GetDocumento:string;
    { Private declarations }
  public
    property Colocacion:String read GetColocacion write SetColocacion;
    property Id:Integer read GetId Write setId;
    property Documento:string read GetDocumento Write SetDocumento;
    { Public declarations }
  end;

var
  frmBusquedaControlCobro: TfrmBusquedaControlCobro;
  vColocacion :String;
  Colores :array[1..15] of TColor;
  vTipoId :Integer;
  vDocumento:string;
implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales, UnitGlobalesCol, UnitBuscarPersona;

procedure TfrmBusquedaControlCobro.SetColocacion(vNewValue:String);
begin
        vColocacion := vNewValue;
end;

function TfrmBusquedaControlCobro.GetColocacion:String;
begin
        Result := vColocacion;
end;

procedure tfrmbusquedacontrolcobro.SetId(vnewvalue:integer);
begin
        vTipoId := vNewValue;
end;

function tfrmbusquedacontrolcobro.GetId:Integer;
begin
        Result := vTipoId;
end;

procedure tfrmbusquedacontrolcobro.SetDocumento(vnewvalue:string);
begin
        vDocumento := vNewValue;
end;

function tfrmbusquedacontrolcobro.GetDocumento:string;
begin
        Result := vDocumento;
end;

procedure TfrmBusquedaControlCobro.EdNumeroIdentificacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmBusquedaControlCobro.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;
        IBDataSet1.Open;
        IBDataSet1.Last;
        IBDataSet1.First;
        vColocacion := '';
        vTipoId := 0;
        vDocumento := '';
end;

procedure TfrmBusquedaControlCobro.EdNumeroIdentificacionExit(
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
//                BuscarColocaciones;
             end;
        end;
        CmdAceptar.Enabled := True;
end;

procedure TfrmBusquedaControlCobro.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmBusquedaControlCobro.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmBusquedaControlCobro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action := caFree;
end;

procedure TfrmBusquedaControlCobro.IBQueryAfterScroll(DataSet: TDataSet);
begin
        with DataSet do
        begin
         if  (FieldByName('ES_CASTIGADO').AsInteger = 1) or
             (FieldByName('ES_NOVISADO').AsInteger =1) or
             (FieldByName('ES_ANULADO').AsInteger = 1) or
             (FieldByName('ES_CANCELADO').AsInteger = 1) then
             CmdAceptar.Enabled := false
         else
             CmdAceptar.Enabled := true;
        end;


end;

procedure TfrmBusquedaControlCobro.FormCreate(Sender: TObject);
begin
        Colores[7] := clYellow;
        Colores[6] := clBlue;
        Colores[5] := clFuchsia;
        Colores[4] := clAqua;
        Colores[3] := clLtGray;
        Colores[2] := clDkGray;
        Colores[1] := clWhite;

end;

procedure TfrmBusquedaControlCobro.CmdAceptarClick(Sender: TObject);
begin
        Id := CBtiposid.KeyValue;
        Documento := Trim(EdNumeroIdentificacion.Text);
end;

procedure TfrmBusquedaControlCobro.CmdBuscarPersonaClick(Sender: TObject);
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

procedure TfrmBusquedaControlCobro.CmdBuscarCuentaClick(Sender: TObject);
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

procedure TfrmBusquedaControlCobro.EdCuentaExit(Sender: TObject);
begin
        CmdBuscarCuenta.Click;
end;

procedure TfrmBusquedaControlCobro.EdCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmBusquedaControlCobro.CBtiposidExit(Sender: TObject);
begin
        if CBtiposid.KeyValue < 1 then
          EdCuenta.SetFocus;
end;

end.
