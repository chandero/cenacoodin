unit UnitInformeColocacionesporestado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses, DBCtrls, UnitDmGeneral;

type
  Tfrminformecolocacionesporestado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQueryColocacion: TIBQuery;
    IBQueryEstado: TIBQuery;
    CBEstado: TDBLookupComboBox;
    Label1: TLabel;
    RColocacionEstado: TprTxReport;
    IBQueryColocacionID_COLOCACION: TIBStringField;
    IBQueryColocacionNUMERO_CUENTA: TIntegerField;
    IBQueryColocacionID_PERSONA: TIBStringField;
    IBQueryColocacionNOMBRE: TIBStringField;
    IBQueryColocacionPRIMER_APELLIDO: TIBStringField;
    IBQueryColocacionSEGUNDO_APELLIDO: TIBStringField;
    IBQueryColocacionFECHA_DESEMBOLSO: TDateField;
    IBQueryColocacionVALOR_DESEMBOLSO: TIBBCDField;
    IBQueryColocacionSALDO: TIBBCDField;
    IBQueryColocacionPLAZO_COLOCACION: TIntegerField;
    IBQueryColocacionFECHA_VENCIMIENTO: TDateField;
    IBQueryColocacionABONOS_CAPITAL: TIBBCDField;
    IBQueryColocacionFECHA_CAPITAL: TDateField;
    IBQueryColocacionFECHA_INTERES: TDateField;
    IBQueryColocacionDESCRIPCION_ESTADO_COLOCACION: TIBStringField;
    IBQueryColocacionVALOR_COSTAS: TIBBCDField;
    IBQueryColocacionVALOR_HONORARIOS: TIBBCDField;
    IBQueryColocacionVALOR_OTROS: TIBBCDField;
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frminformecolocacionesporestado: Tfrminformecolocacionesporestado;
  dmGeneral: TdmGeneral;
  Estado : Integer;
  Titulo : String;
implementation

{$R *.dfm}

uses UnitGlobales, UnitDmColocacion;

procedure Tfrminformecolocacionesporestado.CmdAceptarClick(
  Sender: TObject);
begin
     if DmGeneral.IBTransaction1.InTransaction then
        DmGeneral.IBTransaction1.Rollback;

     dmGeneral.IBTransaction1.StartTransaction;

     CmdAceptar.Enabled := False;
     Application.ProcessMessages;
     
     if CBEstado.KeyValue = -1 then
      begin
        MessageDlg('Debe Seleccionar un Estado para Filtrar el Listado',mtError,[mbOK],0);
        Exit;
      end
     else
      begin
        with IBQuerycolocacion do
        begin
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".NUMERO_CUENTA,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$colocacion".PLAZO_COLOCACION,');
          SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
          SQL.Add('"col$colocacion".ABONOS_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('sum("col$costas".VALOR_COSTAS) as VALOR_COSTAS,');
          SQL.Add('sum("col$costas".VALOR_HONORARIOS) as VALOR_HONORARIOS,');
          SQL.Add('sum("col$costas".VALOR_OTROS) as VALOR_OTROS');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('LEFT JOIN "col$costas" ON ("col$colocacion".ID_AGENCIA = "col$costas".ID_AGENCIA) AND ("col$colocacion".ID_COLOCACION = "col$costas".ID_COLOCACION)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('where');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COlOCACION"');
          SQL.Add('group by');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".NUMERO_CUENTA,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$colocacion".ABONOS_CAPITAL,');
          SQL.Add('"col$colocacion".PLAZO_COLOCACION,');
          SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
          SQL.Add('"col$colocacion".ABONOS_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
          SQL.Add('ORDER BY "col$colocacion".NUMERO_CUENTA');
          ParamByName('ID_ESTADO_COLOCACION').AsInteger := CBEstado.KeyValue;
          Open;
          if IBQueryColocacion.RecordCount > 0 then
           begin
             RColocacionEstado.Variables.ByName['Empresa'].AsString := Empresa;
             RColocacionEstado.Variables.ByName['Hoy'].AsDateTime := Date;
             RColocacionEstado.Variables.ByName['Agencia'].AsString := Ciudad;
             RColocacionEstado.Variables.ByName['Titulo'].AsString := IBQueryColocacion.FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
             if RColocacionEstado.PrepareReport then
                RColocacionEstado.PreviewPreparedReport(true);
           end;
          IBQuerycolocacion.Close;
        end;
      end;
      dmGeneral.IBTransaction1.Commit;
end;


procedure Tfrminformecolocacionesporestado.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction THEN
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        dmcolocacion.IBDSEstado.Active := True;
        dmcolocacion.IBDSEstado.Last;
        dmcolocacion.IBDSEstado.First;

        CBEstado.KeyValue := -1;
end;

procedure Tfrminformecolocacionesporestado.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure Tfrminformecolocacionesporestado.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQueryColocacion.Database := dmGeneral.IBDatabase1;
        IBQueryEstado.Database := dmGeneral.IBDatabase1;
        IBQueryColocacion.Transaction := dmGeneral.IBTransaction1;
        IBQueryEstado.Transaction := dmGeneral.IBTransaction1;
end;

procedure Tfrminformecolocacionesporestado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        dmGeneral.Free;
        Action := caFree;
end;

end.
