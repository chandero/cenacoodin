unit UnitBuscarCaptacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, IBCustomDataSet, DB, IBQuery, ExtCtrls,
  StdCtrls, Buttons, DBCtrls, unitGlobales, IBSQL;

type
  TfrmBuscarCaptacion = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CBtiposid: TDBLookupComboBox;
    EdNombre: TEdit;
    EdNumeroIdentificacion: TMemo;
    CmdBuscarPersona: TBitBtn;
    Panel4: TPanel;
    CmdLiquidar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery: TIBQuery;
    DataSource: TDataSource;
    IBQuery1: TIBQuery;
    GridCaptaciones: TDBGrid;
    IBQueryID_AGENCIA: TSmallintField;
    IBQueryID_TIPO_CAPTACION: TSmallintField;
    IBQueryNUMERO_CUENTA: TIntegerField;
    IBQueryDIGITO_CUENTA: TSmallintField;
    IBQueryDESCRIPCION: TIBStringField;
    DataSource1: TDataSource;
    IBSQL1: TIBSQL;
    procedure CmdBuscarPersonaClick(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure IBQueryNUMERO_CUENTAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CmdLiquidarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FCaptacion:Integer;
    procedure BuscarCaptaciones;
    { Private declarations }
  public
    { Public declarations }
    property Captacion:Integer read FCaptacion Write FCaptacion;
  end;

var
  frmBuscarCaptacion: TfrmBuscarCaptacion;

implementation

{$R *.dfm}

uses UnitBuscarPersona;

procedure TfrmBuscarCaptacion.BuscarCaptaciones;
begin
        with IBQuery do begin
         Close;
         ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
         ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
         ParamByName('CAPTACION').AsInteger := Self.Captacion;
         try
           Open;
           CmdLiquidar.Enabled := True;
         except
           MessageDlg('Error al Buscar Captaciones',mtError,[mbcancel],0);
         end;
        end;
end;

procedure TfrmBuscarCaptacion.CmdBuscarPersonaClick(Sender: TObject);
var frmBuscarPersona:TfrmBuscarPersona;
begin
       frmBuscarPersona := TfrmBuscarPersona.Create(self);
       if frmBuscarPersona.ShowModal = mrok then
       begin
          CBtiposid.KeyValue := frmBuscarPersona.id_identificacion;
          EdNumeroIdentificacion.Text := frmBuscarPersona.id_persona;
          ednumeroidentificacionexit(Sender);
       end;
end;

procedure TfrmBuscarCaptacion.EdNumeroIdentificacionExit(Sender: TObject);
begin
        with IBSQL1 do
        begin
             SQL.Clear;
             SQL.Add('select * from "gen$persona" where ');
             SQL.Add('"gen$persona".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ');
             SQL.Add('"gen$persona".ID_PERSONA = :"ID_PERSONA"');
             ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
             ExecQuery;
             if RecordCount = 1 then
             begin
                EdNombre.Text  := FieldByName('PRIMER_APELLIDO').AsString + ' '+
                                  FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                  FieldByName('NOMBRE').AsString;
                BuscarCaptaciones;
             end;
        end;

end;

procedure TfrmBuscarCaptacion.IBQueryNUMERO_CUENTAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        Text := Format('%.7d',[Sender.AsInteger]);
end;

procedure TfrmBuscarCaptacion.CmdLiquidarClick(Sender: TObject);
begin
        FCaptacion := IBQuery.FieldByName('NUMERO_CUENTA').AsInteger;
end;

procedure TfrmBuscarCaptacion.FormShow(Sender: TObject);
begin
        IBQuery1.Open;
        IBQuery1.Last;
end;

procedure TfrmBuscarCaptacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
