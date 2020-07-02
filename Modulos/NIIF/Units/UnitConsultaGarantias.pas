unit UnitConsultaGarantias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ComCtrls, DB, IBCustomDataSet, ImgList,
  StdCtrls, Buttons, IBQuery, Menus, IBDatabase, IBSQL, FR_Class, IdGlobal, UnitDmGeneral;

type
  TfrmConsultaGarantias = class(TForm)
    ControlGarantias: TPageControl;
    InfoAdmisible: TTabSheet;
    Panel2: TPanel;
    InfoNoAdmisibles: TTabSheet;
    DBGridReal: TDBGrid;
    Panel3: TPanel;
    DBGridPersonal: TDBGrid;
    DSReal: TDataSource;
    DSPersonal: TDataSource;
    ImageList1: TImageList;
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    IBDSReal: TIBQuery;
    IBDSPersonal: TIBQuery;
    PopupMenu1: TPopupMenu;
    CartaCobro1: TMenuItem;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    frCompositeReport1: TfrCompositeReport;
    frReport1: TfrReport;
    IBcarta: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBDSPersonalPRIMER_APELLIDO: TIBStringField;
    IBDSPersonalSEGUNDO_APELLIDO: TIBStringField;
    IBDSPersonalNOMBRE: TIBStringField;
    IBDSPersonalID_COLOCACION: TIBStringField;
    IBDSPersonalID_IDENTIFICACION: TSmallintField;
    IBDSPersonalID_PERSONA: TIBStringField;
    InfoPignoraciones: TTabSheet;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    DBGrid3: TDBGrid;
    TabSheet3: TTabSheet;
    Panel7: TPanel;
    DSPignoracion: TDataSource;
    IBDSPignoracion: TIBQuery;
    DBGridPignoracion: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure DBGridPersonalDblClick(Sender: TObject);
    procedure CartaCobro1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FAgencia:Integer;
    Fnumero_cuenta :string;
    Fciudad :string;
    Fnombre :string;
    fnombre_deudor : string;
    Fdireccion :string;
    Fobservacion :string;
    Fvencimiento :TDate;
    observacion_col: string;
    Fbarrio :string;
    function GetColocacion:String;
    procedure SetColocacion(IdColocacion:String);
    procedure imprimir_reporte(cadena: string);
    { Private declarations }
  public
    property IdColocacion:String Read GetColocacion Write SetColocacion;
    property Agencia:Integer read FAgencia Write FAgencia;
    { Public declarations }
  end;

var
  frmConsultaGarantias: TfrmConsultaGarantias;
  dmGeneral: TdmGeneral;
  VIdColocacion : String;

implementation

{$R *.dfm}

uses UnitGlobales, UnitDireccionesAsociados, UnitGlobalesCol,
  UnitImpresion, unitMain;

function TfrmConsultaGarantias.GetColocacion:String;
begin
        GetColocacion := vIdColocacion;
end;

procedure TfrmConsultaGarantias.SetColocacion(IdColocacion:String);
begin
        vIdColocacion := IdColocacion;
end;


procedure TfrmConsultaGarantias.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;
        
        IBDSReal.ParamByName('ID_AGENCIA').AsInteger := agencia;
        IBDSReal.ParamByName('ID_COLOCACION').AsString := IdColocacion;
        IBDSReal.Open;
        IBDSReal.Last;
        IBDSReal.First;

        IBDSPersonal.ParamByName('ID_AGENCIA').AsInteger := agencia;
        IBDSPersonal.ParamByName('ID_COLOCACION').AsString := IdColocacion;
        IBDSPersonal.Open;
        IBDSPersonal.Last;
        IBDSPersonal.First;

        IBDSPignoracion.ParamByName('ID_AGENCIA').AsInteger := agencia;
        IBDSPignoracion.ParamByName('ID_COLOCACION').AsString := IdColocacion;
        IBDSPignoracion.Open;
        IBDSPignoracion.Last;
        IBDSPignoracion.First;

        ControlGarantias.ActivePage := InfoAdmisible;
end;

procedure TfrmConsultaGarantias.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsultaGarantias.DBGridPersonalDblClick(Sender: TObject);
var frmDireccionesAsociado:TfrmDireccionesAsociado;
begin
        frmDireccionesAsociado := TfrmDireccionesAsociado.Create(Self);
        frmDireccionesAsociado.Id := IBDSPersonal.FieldByName('ID_IDENTIFICACION').AsInteger;
        frmDireccionesAsociado.Documento := Trim(IBDSPersonal.FieldByName('ID_PERSONA').AsString);
        frmDireccionesAsociado.Nombre := IBDSPersonal.FieldByName('NOMBRE').AsString + ' ' +
                                         IBDSPersonal.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                         IBDSPersonal.FieldByName('SEGUNDO_APELLIDO').AsString;
        frmDireccionesAsociado.ShowModal;
end;

procedure TfrmConsultaGarantias.CartaCobro1Click(Sender: TObject);
var     tipo_cuota :Integer;
        amortiza_interes :Integer;
        fecha_interes :TDate;
        id_persona_col :string;
        id_persona_cod :string;
        id_identificacion_cod :Integer;
        id_persona_deu :string;
        id_identificacion_deu :Integer;
begin
      if Role = 'CARTERA' then
      begin
       observacion_col := InputBox('Observación Adicional','Digite Su Observación','');
       id_persona_col := CurrToStr(StrToCurr(IBDSPersonal.FieldByName('ID_PERSONA').AsString));
       Fnombre := IBDSPersonal.FieldByName('NOMBRE').AsString + ' ' + IBDSPersonal.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBDSPersonal.FieldByName('SEGUNDO_APELLIDO').AsString;
       try
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "col$colocacion" where');
          SQL.Add('ID_COLOCACION = :ID_COLOCACION and ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_COLOCACION').AsString := IdColocacion;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          id_persona_deu := FieldByName('ID_PERSONA').AsString;
          id_identificacion_deu := FieldByName('ID_IDENTIFICACION').AsInteger;
          fecha_interes := FieldByName('FECHA_INTERES').AsDate;
          amortiza_interes := FieldByName('AMORTIZA_INTERES').AsInteger;
          tipo_cuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
          id_persona_cod := IBDSPersonalID_PERSONA.Value;//FieldByName('ID_PERSONA').AsString;
          id_identificacion_cod := IBDSPersonalID_IDENTIFICACION.Value;
          if tipo_cuota = 2 then
             Fvencimiento := fecha_interes
          else if (tipo_cuota = 1) or (tipo_cuota = 3) then
             Fvencimiento := CalculoFecha(fecha_interes,amortiza_interes);
          fnumero_cuenta := '20'+ IntToStr(Agencia) +'-'+Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia"');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          if Agencia = 1 then
             Fciudad := Ciudad + FormatDateTime('dd-mmm-yyyy',Date)
          else
             Fciudad := FieldByName('DESCRIPCION_AGENCIA').AsString + ' ' + FormatDateTime('dd-mmm-yyyy',Date);
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$direccion"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and');
          SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_IDENTIFICACION').AsInteger := IBDSPersonal.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString := id_persona_col;
          ExecQuery;
          Fdireccion := UpCaseFirst(LowerCase(FieldByName('MUNICIPIO').AsString)) + ', ' + LowerCase(FieldByName('DIRECCION').AsString);
          Fbarrio := UpCaseFirst(FieldByName('BARRIO').AsString);
          Close;
          SQL.Clear;
          SQL.Add('select NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := id_persona_deu;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_deu;
          ExecQuery;
          fnombre_deudor := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' +FieldByName('SEGUNDO_APELLIDO').AsString;
        end;
        imprimir_reporte(frmMain.ruta1 + '\reporte\repcarta2.frf');
        if MessageDlg('La Carta Fue Impresa ?',mtInformation,[mbyes,mbno],0) = mryes then
        begin
          with IBcarta do
          begin
            Close;
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('insert into "col$controlcarta" values (');
            SQL.Add(':ID_COLOCACION, :FECHA_REALIZACION, :ENTREGADO, :ID_PERSONA, :ID_IDENTIFICACION, :ID_EMPLEADO, :TIPO)');
            ParamByName('ID_COLOCACION').AsString := IdColocacion;
            ParamByName('FECHA_REALIZACION').AsDate := Date;
            ParamByName('ENTREGADO').AsSmallInt := 0;
            ParamByName('ID_PERSONA').AsString := id_persona_cod;
            ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_cod;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('TIPO').AsString := 'C';
            ExecSQL;
            Transaction.Commit;
          end;
        end;
       except
        MessageDlg('No se puede Generar la Carta',mtInformation,[mbok],0);
       end;
      end
      else
      MessageDlg('Solo la Sección de Créditos tiene Permiso',mtInformation,[mbok],0)
end;

procedure TfrmConsultaGarantias.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'ciudad' then
           ParValue := Fciudad;
        if ParName = 'direccion' then
           ParValue := Fdireccion;
        if ParName = 'numero_cuenta' then
           ParValue := Fnumero_cuenta;
        if ParName = 'nombre' then
           ParValue := Fnombre;
        if ParName = 'empresa' then
           ParValue := Empresa;
        if ParName = 'nit' then
           ParValue := Nit;
        if ParName = 'nombre_deu' then
           ParValue := fnombre_deudor;
        if ParName = 'fecha' then
           ParValue := FormatDateTime('dd " del mes de " mmmm " de " yyyy"',Fvencimiento);
        if ParName = 'colocacion' then
           ParValue := IdColocacion;
        if ParName = 'observacion' then
           ParValue := observacion_col;
        if ParName = 'barrio_c' then
           ParValue := Fbarrio
end;

procedure TfrmConsultaGarantias.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frCompositeReport1.DoublePass := True;
        frCompositeReport1.Reports.Clear;
        frCompositeReport1.Reports.Add(frReport1);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TfrmConsultaGarantias.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBDSReal.Database := dmGeneral.IBDatabase1;
        IBDSPersonal.Database := dmGeneral.IBDatabase1;
        IBDSPignoracion.Database := dmGeneral.IBDatabase1;

        IBDSReal.Transaction := dmGeneral.IBTransaction1;
        IBDSPersonal.Transaction := dmGeneral.IBTransaction1;
        IBDSPignoracion.Transaction := dmGeneral.IBTransaction1;

        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBcarta.Database := dmGeneral.IBDatabase1;


        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction2.DefaultDatabase := dmGeneral.IBDatabase1;
end;

procedure TfrmConsultaGarantias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

end.

