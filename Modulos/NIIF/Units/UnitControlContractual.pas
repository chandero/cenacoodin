unit UnitControlContractual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvStaticText, JvEdit, Buttons, DBCtrls,
  ComCtrls, JvComCtrls, JvLabel, JvBlinkingLabel, JvGroupBox, JvTypedEdit,
  IBDatabase, DB, IBCustomDataSet, Grids, DBGrids, IBQuery, DBClient, IBSQL, DateUtils,JclSysUtils,
  Menus;

type
  TFrmControlContractual = class(TForm)
    GroupBox1: TGroupBox;
    JvGroupBox1: TJvGroupBox;
    JvBlinkingLabel1: TJvBlinkingLabel;
    PageBuscar: TJvPageControl;
    Tab1: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    CBtiposid: TDBLookupComboBox;
    EdNumeroIdentificacion: TMemo;
    CmdActualizar1: TBitBtn;
    Tab2: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    EdCaptacion: TJvEdit;
    CBTiposCaptacion: TDBLookupComboBox;
    CmdActualizar2: TBitBtn;
    EdNombre: TJvStaticText;
    Label1: TLabel;
    Label2: TLabel;
    JvDesde: TJvIntegerEdit;
    JvHasta: TJvIntegerEdit;
    BitBtn1: TBitBtn;
    DSTiposCaptacion: TDataSource;
    IBDSTiposCaptacion: TIBDataSet;
    DSTiposId: TDataSource;
    IBDSTiposId: TIBDataSet;
    IBTControlCobro: TIBTransaction;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    IBQuery1: TIBQuery;
    CdContractual: TClientDataSet;
    CdContractualNUMERO: TIntegerField;
    CdContractualDG: TIntegerField;
    CdContractualFECHA_APERTURA: TDateField;
    CdContractualFECHA_VENCIMIENTO: TDateField;
    CdContractualFECHA_APERTURAA: TStringField;
    CdContractualFECHA_VENCIMIENTOA: TStringField;
    CdContractualDIAS: TIntegerField;
    CdContractualCUOTAS: TIntegerField;
    CdContractualSALDO: TCurrencyField;
    DsContractual: TDataSource;
    BitBtn2: TBitBtn;
    IBSQL2: TIBSQL;
    CdContractualPLAN: TStringField;
    CdContractualASOCIADO: TStringField;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    mObservacion: TMemo;
    BtAgregar: TBitBtn;
    BitBtn4: TBitBtn;
    BtLimpiar: TBitBtn;
    DBGrid2: TDBGrid;
    DbTabla: TDBGrid;
    CdTabla: TClientDataSet;
    DsTabla: TDataSource;
    CdTablaCS: TIntegerField;
    CdTablaCUENTA: TIntegerField;
    CdTablaDG: TIntegerField;
    CdTablaFECHA: TDateField;
    CdTablaVALOR: TCurrencyField;
    CdTablaDS: TStringField;
    IBobservacion: TIBQuery;
    IBTObservacion: TIBTransaction;
    DSobservacion: TDataSource;
    IBobservacionFECHA: TDateField;
    IBobservacionOBSERVACION: TMemoField;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    E1: TMenuItem;
    GroupBox4: TGroupBox;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    JvTotal: TJvStaticText;
    Direccin1: TMenuItem;
    CdContractualIDPERSONA: TStringField;
    CdContractualIDIDENTIFICACION: TSmallintField;
    procedure JvBlinkingLabel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdActualizar1Click(Sender: TObject);
    procedure EdCaptacionExit(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure EdNumeroIdentificacionKeyPress(Sender: TObject;
      var Key: Char);
    procedure CBtiposidKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtAgregarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure IBobservacionOBSERVACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure BtLimpiarClick(Sender: TObject);
    procedure CmdActualizar2Click(Sender: TObject);
    procedure CBTiposCaptacionKeyPress(Sender: TObject; var Key: Char);
    procedure EdCaptacionKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mObservacionKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Direccin1Click(Sender: TObject);
  private
   vId :Integer;
   vIdPersona :string;
   vCuentaAhorros :Integer;
   vDgAhorros :Integer;
   vNumero :Integer;
   Activar :Boolean;
    procedure Inicio;
    procedure BuscarContractual;
    function BuscarAhorros: Currency;
    procedure InformacionCon(numero, dg: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControlContractual: TFrmControlContractual;
type
  TCustomDBGridCracker = class(TCustomDBGrid);
implementation

uses UnitBuscarPersona, UnitGlobales, UnitConsultaExtractoCaptacion,
  UnitPantallaProgreso, UnitDireccionesAsociados;

{$R *.dfm}

procedure TFrmControlContractual.Inicio;
begin
//        CdContractual.Active := False;
        JvTotal.Caption := '';
        CdContractual.CancelUpdates;
        CdTabla.CancelUpdates;
        IBobservacion.Close;
        Activar := False;
         if IBTControlCobro.InTransaction  then
           IBTControlCobro.Rollback;
         IBTControlCobro.StartTransaction;
          GroupBox1.Enabled := True;
          PageBuscar.Enabled := True;
        IBobservacion.Close;
//         IBSQL1.Close;
//         IBDataSet1.Close;
//         IBQuery1.Open;
//         IBQuery1.Last;
//         GroupBox1.Enabled := True;
        JvHasta.Value := 0;
        JvDesde.Value := 0;
        IBDSTiposId.Open;
        IBDSTiposCaptacion.Open;
        PageBuscar.ActivePage := Tab1;

         CBtiposid.KeyValue := -1;
         EdNombre.Caption := '';
         EdNumeroIdentificacion.Text := '';
         CBTiposCaptacion.KeyValue := -1;
         EdCaptacion.Text := '';
         mObservacion.Text := '';
         //JvDesde.SetFocus;

end;

procedure TFrmControlContractual.JvBlinkingLabel1Click(Sender: TObject);
begin
//                CdContractual.Active := False;
{                frmBuscarPersona := TfrmBuscarPersona.Create(self);
                if frmBuscarPersona.ShowModal = mrOk then
                begin
                   EdNumeroIdentificacion.Text := frmBuscarPersona.id_persona;
                   CBtiposid.KeyValue := frmBuscarPersona.id_identificacion;
                   vId := frmBuscarPersona.id_identificacion;
                   vIdPersona := frmBuscarPersona.id_persona;
                   PageBuscar.ActivePage := Tab1;
                   //CdContractual.Active := True;
                   CmdActualizar1.Click;
                end;
                frmBuscarPersona.Free;}
end;

procedure TFrmControlContractual.FormCreate(Sender: TObject);
begin
        //CdContractual.Active := True;
        inicio
end;

procedure TFrmControlContractual.BuscarContractual;
var     vSaldo :Currency;
        vFechaV :TDate;
begin
        vSaldo := 0;
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"gen$persona".ID_IDENTIFICACION,');          
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,');
          SQL.Add('"cap$maestrotitular".DIGITO_CUENTA,');
          SQL.Add('"cap$maestro".VALOR_INICIAL,');
          SQL.Add('"cap$maestro".FECHA_APERTURA,');
          SQL.Add('"cap$maestro".ID_ESTADO,');
          SQL.Add('"cap$maestro".FECHA_VENCIMIENTO,');
          SQL.Add('"cap$maestro".FECHA_VENCIMIENTO_PRORROGA,');
          SQL.Add('"cap$tiposestado".DESCRIPCION AS ESTADO,');
          SQL.Add('"cap$tiposplancontractual".DESCRIPCION');
          SQL.Add('FROM');
          SQL.Add('"gen$persona"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("gen$persona".ID_IDENTIFICACION="cap$maestrotitular".ID_IDENTIFICACION)');
          SQL.Add('AND ("gen$persona".ID_PERSONA="cap$maestrotitular".ID_PERSONA)');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".ID_TIPO_CAPTACION="cap$maestro".ID_TIPO_CAPTACION)');
          SQL.Add('AND ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".ID_AGENCIA="cap$maestro".ID_AGENCIA)');
          SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$tiposestado".ID_ESTADO="cap$maestro".ID_ESTADO)');
          SQL.Add('INNER JOIN "cap$tiposplancontractual" ON ("cap$maestro".ID_PLAN="cap$tiposplancontractual".ID_PLAN)');
          SQL.Add('WHERE');
          SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
          SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA) AND ');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 5) AND ("cap$maestro".ID_ESTADO IN (1,6))');
          ParamByName('ID_IDENTIFICACION').AsInteger := vId;
          ParamByName('ID_PERSONA').AsString := vIdPersona;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('No Existen Datos',mtInformation,[mbok],0);
            Exit;
          end;
          Last;
          EdNombre.Caption := FieldByName('NOMBRE').AsString + ' ' + fieldbyname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          vSaldo := BuscarAhorros;
//          CdContractual.Active := True;
          First;
          while not Eof do
          begin
            CdContractual.Append;
            CdContractual.FieldValues['NUMERO'] := FieldByName('NUMERO_CUENTA').AsInteger;
            CdContractual.FieldValues['DG'] := FieldByName('DIGITO_CUENTA').AsInteger;
            CdContractual.FieldValues['FECHA_APERTURA'] := FieldByName('FECHA_APERTURA').AsDateTime;
            CdContractual.FieldValues['FECHA_VENCIMIENTO'] := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
            CdContractual.FieldValues['PLAN'] := FieldByName('DESCRIPCION').AsString;
            CdContractual.FieldValues['ASOCIADO'] := EdNombre.Caption;
            IBSQL2.Close;
            IBSQL2.SQL.Clear;
            IBSQL2.SQL.Add('SELECT MAX(FECHA_ACTUAL) AS FECHA,SUM(C_VENCIDA) AS CUOTA FROM "cap$controlcon" WHERE ID_TIPO_CAPTACION = 5 AND NUMERO_CUENTA = :NM AND DIGITO_CONTROL = :DG');
            IBSQL2.ParamByName('NM').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
            IBSQL2.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
            IBSQL2.ExecQuery;
            if IBSQL2.FieldByName('FECHA').IsNull  then
              vfechav := FieldByName('FECHA_VENCIMIENTO').AsDateTime
            else
              vfechav := FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime;
            CdContractual.FieldValues['FECHA_VENCIMIENTOA'] := FormatDateTime('yyyy/MM/dd',vFechaV);
            CdContractual.FieldValues['CUOTAS'] :=  IBSQL2.FieldByName('CUOTA').AsInteger;
            CdContractual.FieldValues['SALDO'] := vSaldo;
            IBSQL2.Close;
            IBSQL2.SQL.Clear;
            IBSQL2.SQL.Add('SELECT COUNT(FECHA_DESCUENTO) AS CONTADOR FROM "cap$tablaliquidacioncon" WHERE');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".ID_AGENCIA = :ID_AGENCIA and');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".NUMERO_CUENTA = :NUMERO_CUENTA and');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".DIGITO_CUENTA = :DIGITO_CUENTA and');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".DESCONTADO = 0 and');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".FECHA_DESCUENTO <= :FECHA');
            IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
            IBSQL2.ParamByName('FECHA').AsDate := fFechaActual;
            IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
            IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
            IBSQL2.ExecQuery;
            if IBSQL2.FieldByName('CONTADOR').AsInteger > 0 then
            begin
              IBSQL2.Close;
              IBSQL2.SQL.Clear;
              IBSQL2.SQL.Add('SELECT FIRST 1 FECHA_DESCUENTO FROM "cap$tablaliquidacioncon" WHERE');
              IBSQL2.SQL.Add('"cap$tablaliquidacioncon".ID_AGENCIA = :ID_AGENCIA and');
              IBSQL2.SQL.Add('"cap$tablaliquidacioncon".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
              IBSQL2.SQL.Add('"cap$tablaliquidacioncon".NUMERO_CUENTA = :NUMERO_CUENTA and');
              IBSQL2.SQL.Add('"cap$tablaliquidacioncon".DIGITO_CUENTA = :DIGITO_CUENTA and');
              IBSQL2.SQL.Add('"cap$tablaliquidacioncon".FECHA_DESCUENTO <= :FECHA and');
              IBSQL2.SQL.Add('"cap$tablaliquidacioncon".DESCONTADO = 0');
              IBSQL2.SQL.Add(' ORDER BY "cap$tablaliquidacioncon".FECHA_DESCUENTO ASC');
              IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
              IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              IBSQL2.ParamByName('FECHA').AsDate := fFechaActual;
              IBSQL2.ExecQuery;
              CdContractual.FieldValues['FECHA_APERTURAA'] := IBSQL2.FieldByName('FECHA_DESCUENTO').AsDateTime;
              CdContractual.FieldValues['DIAS'] := DaysBetween(fFechaActual, IBSQL2.FieldByName('FECHA_DESCUENTO').AsDateTime);
             end
             else
             begin
               CdContractual.FieldValues['FECHA_APERTURAA'] := '';
               CdContractual.FieldValues['DIAS'] := 0;
               CdContractual.FieldValues['IDPERSONA'] := FieldByName('ID_PERSONA').AsString;
               CdContractual.FieldValues['IDIDENTIFICACION'] := FieldByName('ID_IDENTIFICACION').AsString;
             end;
            CdContractual.Post;
            Next;
          end;
          GroupBox1.Enabled := False;
          PageBuscar.Enabled := False;
        end;
        JvTotal.Caption := IntToStr(CdContractual.RecordCount);
end;

procedure TFrmControlContractual.CmdActualizar1Click(Sender: TObject);
begin
        BuscarContractual;
end;

procedure TFrmControlContractual.EdCaptacionExit(Sender: TObject);
begin
        vId :=  0;
end;

procedure TFrmControlContractual.EdNumeroIdentificacionExit(
  Sender: TObject);
begin
        vId :=  CBtiposid.KeyValue;
        vIdPersona := EdNumeroIdentificacion.Text;
end;

procedure TFrmControlContractual.EdNumeroIdentificacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TFrmControlContractual.CBtiposidKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,Self)
end;

function TFrmControlContractual.BuscarAhorros: Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
begin
  with IBSQL2 do begin
     Close;
     sql.Clear;
     Sql.Add('select * from P_CAP_0019 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('ID_IDENTIFICACION').AsInteger := vId;
     ParamByName('ID_PERSONA').AsString := vIdPersona;
     ExecQuery;
     Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     Digito := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;
     vDgAhorros := Digito;
     vCuentaAhorros := Cuenta;
     SQL.Clear;
     SQL.Add('Select SALDO_DISPONIBLE from SALDO_DISPONIBLE_JUD (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
     ParamByName('ANO').AsInteger := yearof(fFechaActual);
     ParamByName('FECHA1').AsDate := EncodeDate(yearof(fFechaActual),01,01);
     ParamByName('FECHA2').AsDate := fFechaActual;
     try
      ExecQuery;
      if RecordCount < 1 then
        Saldo := 0
      else
        Saldo := FieldByName('SALDO_DISPONIBLE').AsCurrency;
     except
      MessageDlg('Error Consultando Saldo Ahorros',mtError,[mbcancel],0);
      raise;
      Exit;
     end;
  end;
  Result := Saldo;


end;

procedure TFrmControlContractual.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmControlContractual.InformacionCon(numero, dg: integer);
begin
        CdTabla.CancelUpdates;
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "cap$tablaliquidacioncon" where NUMERO_CUENTA = :NUMERO AND DIGITO_CUENTA = :DG ORDER BY FECHA_DESCUENTO');
          ParamByName('NUMERO').AsInteger := numero;
          ParamByName('DG').AsInteger := dg;
          Open;
          while not Eof do
          begin
            CdTabla.Append;
            CdTabla.FieldValues['CS'] := RecNo;
            CdTabla.FieldValues['CUENTA'] := FieldByName('NUMERO_CUENTA').AsInteger;
            CdTabla.FieldValues['DG'] := FieldByName('DIGITO_CUENTA').AsInteger;
            CdTabla.FieldValues['FECHA'] := FieldByName('FECHA_DESCUENTO').AsDateTime;
            CdTabla.FieldValues['VALOR'] := FieldByName('VALOR').AsCurrency;
            IF FieldByName('DESCONTADO').AsInteger = 1 then
               CdTabla.FieldValues['DS'] := 'S'
            else
               CdTabla.FieldValues['DS'] := 'N';
            CdTabla.Post;
            Next;
          end;
        end;
        CdTabla.First;
        with IBobservacion do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          ParamByName('NM').AsInteger := numero;
          ParamByName('DG').AsInteger := dg;
          Open;
        end;
        BtLimpiar.Click
end;

procedure TFrmControlContractual.BtAgregarClick(Sender: TObject);
begin
        if mObservacion.Text = '' then
           Exit;
        mObservacion.Text := UpperCase(mObservacion.Text);
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('insert into "cap$observacioncon" values (:ID_AGENCIA,5,:NM,:DG,:FECHA,:OBSERVACION);');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('NM').AsInteger := CdContractualNUMERO.Value;
          ParamByName('DG').AsInteger := CdContractualDG.Value;
          ParamByName('FECHA').AsDate := fFechaActual;
          ParamByName('OBSERVACION').AsString := mObservacion.Text;
          ExecSQL;
          Transaction.Commit;
        end;
        with IBobservacion do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          ParamByName('NM').AsInteger := CdContractualNUMERO.Value;
          ParamByName('DG').AsInteger := CdContractualDG.Value;
          Open;
        end;
        BtLimpiar.Click;
end;

procedure TFrmControlContractual.DBGrid1CellClick(Column: TColumn);
begin
        informacioncon(CdContractualNUMERO.Value,CdContractualDG.Value);
        Activar := True;
        vNumero := CdContractual.RecNo;
        DBGrid1.Canvas.Brush.color := clBlue;
end;

procedure TFrmControlContractual.IBobservacionOBSERVACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TFrmControlContractual.DBGrid2CellClick(Column: TColumn);
begin
        mObservacion.Text := IBobservacionOBSERVACION.Value;
        BtAgregar.Enabled := False;
end;

procedure TFrmControlContractual.BtLimpiarClick(Sender: TObject);
begin
        BtAgregar.Enabled := True;
        mObservacion.Text := '';
        //mObservacion.SetFocus;
end;



procedure TFrmControlContractual.CmdActualizar2Click(Sender: TObject);
begin
        with IBSQL2 do
        begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('select ID_PERSONA,ID_IDENTIFICACION from "cap$maestrotitular" where (');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
            SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" )');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := CBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCaptacion.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(CBTiposCaptacion.KeyValue,FormatCurr('0000000',StrToFloat(EdCaptacion.Text))));
            ExecQuery;
            if RecordCount > 0 then
            begin
              CBtiposid.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
              EdNumeroIdentificacion.Text  := FieldByName('ID_PERSONA').AsString;
              vId :=  CBtiposid.KeyValue;
              vIdPersona := EdNumeroIdentificacion.Text;
              CmdActualizar1.Click;
            end
            else
            begin
              MessageDlg('Persona no encontrada',mtError,[mbOk],0);
            end;
        end;

end;

procedure TFrmControlContractual.CBTiposCaptacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TFrmControlContractual.EdCaptacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TFrmControlContractual.BitBtn3Click(Sender: TObject);
begin
        inicio
end;

procedure TFrmControlContractual.E1Click(Sender: TObject);
begin
      frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(self);
      frmConsultaExtractoCaptacion.AgenciaA := Agencia;
      frmConsultaExtractoCaptacion.Tipo := 5;
      frmConsultaExtractoCaptacion.Cuenta := CdContractualNUMERO.Value;
      frmConsultaExtractoCaptacion.Digito := cdcontractualdg.Value;
      frmConsultaExtractoCaptacion.vExtractoCon := 1;
      frmConsultaExtractoCaptacion.ShowModal;

end;

procedure TFrmControlContractual.BitBtn1Click(Sender: TObject);
var     vDias :Integer;
        vfechav, vFechaDesc :TDate;
begin
          GroupBox1.Enabled := False;
          PageBuscar.Enabled := False;
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".ID_IDENTIFICACION,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,');
          SQL.Add('"cap$maestrotitular".DIGITO_CUENTA,');
          SQL.Add('"cap$maestro".VALOR_INICIAL,');
          SQL.Add('"cap$maestro".FECHA_APERTURA,');
          SQL.Add('"cap$maestro".ID_ESTADO,');
          SQL.Add('"cap$maestro".FECHA_VENCIMIENTO,');
          SQL.Add('"cap$maestro".FECHA_VENCIMIENTO_PRORROGA,');
          SQL.Add('"cap$tiposestado".DESCRIPCION AS ESTADO,');
          SQL.Add('"cap$tiposplancontractual".DESCRIPCION');
          SQL.Add('FROM');
          SQL.Add('"gen$persona"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("gen$persona".ID_IDENTIFICACION="cap$maestrotitular".ID_IDENTIFICACION)');
          SQL.Add('AND ("gen$persona".ID_PERSONA="cap$maestrotitular".ID_PERSONA)');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".ID_TIPO_CAPTACION="cap$maestro".ID_TIPO_CAPTACION)');
          SQL.Add('AND ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".ID_AGENCIA="cap$maestro".ID_AGENCIA)');
          SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$tiposestado".ID_ESTADO="cap$maestro".ID_ESTADO)');
          SQL.Add('INNER JOIN "cap$tiposplancontractual" ON ("cap$maestro".ID_PLAN="cap$tiposplancontractual".ID_PLAN)');
          SQL.Add('WHERE');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 5) AND ("cap$maestro".ID_ESTADO IN (1,6))');
          Open;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.InfoLabel := 'Buscando Contractuales';
          frmProgreso.Min := 0;
          frmProgreso.Max := RecordCount;
          frmProgreso.Ejecutar;
//          CdContractual.Active := True;
          while not Eof do
          begin
            vDias := 0;
            frmProgreso.Position := RecNo;
            Application.ProcessMessages;
            vId := FieldByName('ID_IDENTIFICACION').AsInteger;
            vIdPersona := FieldByName('ID_PERSONA').AsString;
            IBSQL2.Close;
            IBSQL2.SQL.Clear;
            IBSQL2.SQL.Add('SELECT FIRST 1 FECHA_DESCUENTO,COUNT(FECHA_DESCUENTO) AS CONTADOR FROM "cap$tablaliquidacioncon" WHERE');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".ID_AGENCIA = :ID_AGENCIA and');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".NUMERO_CUENTA = :NUMERO_CUENTA and');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".DIGITO_CUENTA = :DIGITO_CUENTA and');
            IBSQL2.SQL.Add('"cap$tablaliquidacioncon".DESCONTADO = 0');
            IBSQL2.SQL.Add('GROUP BY FECHA_DESCUENTO ORDER BY FECHA_DESCUENTO');
            IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
            IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
            IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
            IBSQL2.ExecQuery;
            if IBSQL2.FieldByName('CONTADOR').AsInteger > 0 then // inicio validacion de dias
            begin
              vFechaDesc := IBSQL2.FieldByName('FECHA_DESCUENTO').AsDateTime;
              if vFechaDesc <= fFechaActual then
              begin
                vDias := DaysBetween(fFechaActual,vFechaDesc);
                if(vDias >= JvDesde.Value) and (vDias <= JvHasta.Value) then
                begin
               //***********
                  CdContractual.Append;
                  CdContractual.FieldValues['NUMERO'] := FieldByName('NUMERO_CUENTA').AsInteger;
                  CdContractual.FieldValues['DG'] := FieldByName('DIGITO_CUENTA').AsInteger;
                  CdContractual.FieldValues['FECHA_APERTURA'] := FieldByName('FECHA_APERTURA').AsDateTime;
                  CdContractual.FieldValues['FECHA_VENCIMIENTO'] := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                  CdContractual.FieldValues['PLAN'] := FieldByName('DESCRIPCION').AsString;
                  CdContractual.FieldValues['ASOCIADO'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('SELECT MAX(FECHA_ACTUAL) AS FECHA,SUM(C_VENCIDA) AS CUOTA FROM "cap$controlcon" WHERE ID_TIPO_CAPTACION = 5 AND NUMERO_CUENTA = :NM AND DIGITO_CONTROL = :DG');
                  IBSQL2.ParamByName('NM').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL2.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  IBSQL2.ExecQuery;
                  if IBSQL2.FieldByName('FECHA').IsNull  then
                     vfechav := FieldByName('FECHA_VENCIMIENTO').AsDateTime
                  else
                     vfechav := FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime;
                  CdContractual.FieldValues['FECHA_VENCIMIENTOA'] := FormatDateTime('yyyy/MM/dd',vFechaV);
                  CdContractual.FieldValues['CUOTAS'] :=  IBSQL2.FieldByName('CUOTA').AsInteger;
                  CdContractual.FieldValues['SALDO'] := BuscarAhorros;
                  CdContractual.FieldValues['FECHA_APERTURAA'] := vFechaDesc;
                  CdContractual.FieldValues['DIAS'] := vDias;
                  CdContractual.Post;
                //***********
                end;// fin del valida numero de dias
               end;// fin del valida si fecha_descuento < fecha_actual
            end;// fin del valida si existen fechas de descuento
            Next;
          end; // fin del while
          frmProgreso.Cerrar;
        end;// fin del ibqueyr1
        JvTotal.Caption := IntToStr(CdContractual.RecordCount);

end;

procedure TFrmControlContractual.mObservacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           BtAgregar.SetFocus
end;

procedure TFrmControlContractual.BitBtn5Click(Sender: TObject);
var     vContador :Integer;
        vfechav :TDate;
begin
        GroupBox1.Enabled := False;
        PageBuscar.Enabled := False;
        frmProgreso := TfrmProgreso.Create(Self);
        frmProgreso.Titulo := 'Buscando Contractuales....';
        frmProgreso.Min := 0;
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".ID_IDENTIFICACION,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,');
          SQL.Add('"cap$maestrotitular".DIGITO_CUENTA,');
          SQL.Add('"cap$maestro".VALOR_INICIAL,');
          SQL.Add('"cap$maestro".FECHA_APERTURA,');
          SQL.Add('"cap$maestro".ID_ESTADO,');
          SQL.Add('"cap$maestro".FECHA_VENCIMIENTO,');
          SQL.Add('"cap$maestro".FECHA_VENCIMIENTO_PRORROGA,');
          SQL.Add('"cap$tiposestado".DESCRIPCION AS ESTADO,');
          SQL.Add('"cap$tiposplancontractual".DESCRIPCION');
          SQL.Add('FROM');
          SQL.Add('"gen$persona"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("gen$persona".ID_IDENTIFICACION="cap$maestrotitular".ID_IDENTIFICACION)');
          SQL.Add('AND ("gen$persona".ID_PERSONA="cap$maestrotitular".ID_PERSONA)');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".ID_TIPO_CAPTACION="cap$maestro".ID_TIPO_CAPTACION)');
          SQL.Add('AND ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".ID_AGENCIA="cap$maestro".ID_AGENCIA)');
          SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$tiposestado".ID_ESTADO="cap$maestro".ID_ESTADO)');
          SQL.Add('INNER JOIN "cap$tiposplancontractual" ON ("cap$maestro".ID_PLAN="cap$tiposplancontractual".ID_PLAN)');
          SQL.Add('WHERE');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 5) AND ("cap$maestro".ID_ESTADO IN (1,6))');
          Open;
          Last;
          First;
          frmProgreso.Max := RecordCount;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Contractual No. ' + FieldByName('NUMERO_CUENTA').AsString;
            Application.ProcessMessages;
            with IBSQL2 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT COUNT(FECHA_DESCUENTO) AS CONTADOR');
              SQL.Add('FROM');
              SQL.Add('"cap$tablaliquidacioncon"');
              SQL.Add('WHERE');
              SQL.Add('("cap$tablaliquidacioncon".ID_TIPO_CAPTACION = 5) AND');
              SQL.Add('("cap$tablaliquidacioncon".NUMERO_CUENTA = :NUMERO) AND');
              SQL.Add('("cap$tablaliquidacioncon".DIGITO_CUENTA = :DIGITO) AND');
              SQL.Add('("cap$tablaliquidacioncon".DESCONTADO = :0)');
              ParamByName('NUMERO').AsInteger := IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger;
              ParamByName('DIGITO').AsInteger := IBQuery1.FieldByName('DIGITO_CUENTA').AsInteger;
              ExecQuery;
              vContador := FieldByName('CONTADOR').AsInteger;
              mObservacion.Lines.Add('No. ' + IBQuery1.FieldByName('NUMERO_CUENTA').AsString + ' Cuotas. ' + IntToStr(vContador))
            end;// fin del ibsql2
            if vContador = 0 then
            begin
                vId := FieldByName('ID_IDENTIFICACION').AsInteger;
                vIdPersona := FieldByName('ID_PERSONA').AsString;
                CdContractual.Append;
                CdContractual.FieldValues['NUMERO'] := FieldByName('NUMERO_CUENTA').AsInteger;
                CdContractual.FieldValues['DG'] := FieldByName('DIGITO_CUENTA').AsInteger;
                CdContractual.FieldValues['FECHA_APERTURA'] := FieldByName('FECHA_APERTURA').AsDateTime;
                CdContractual.FieldValues['FECHA_VENCIMIENTO'] := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                CdContractual.FieldValues['PLAN'] := FieldByName('DESCRIPCION').AsString;
                CdContractual.FieldValues['ASOCIADO'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('SELECT MAX(FECHA_ACTUAL) AS FECHA,SUM(C_VENCIDA) AS CUOTA FROM "cap$controlcon" WHERE ID_TIPO_CAPTACION = 5 AND NUMERO_CUENTA = :NM AND DIGITO_CONTROL = :DG');
                IBSQL2.ParamByName('NM').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                IBSQL2.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                IBSQL2.ExecQuery;
                if IBSQL2.FieldByName('FECHA').IsNull  then
                   vfechav := FieldByName('FECHA_VENCIMIENTO').AsDateTime
                else
                   vfechav := FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime;
                CdContractual.FieldValues['FECHA_VENCIMIENTOA'] := FormatDateTime('yyyy/MM/dd',vFechaV);
                CdContractual.FieldValues['CUOTAS'] :=  IBSQL2.FieldByName('CUOTA').AsInteger;
                CdContractual.FieldValues['SALDO'] := BuscarAhorros;
                CdContractual.FieldValues['FECHA_APERTURAA'] := vfechav;
                CdContractual.FieldValues['DIAS'] := 0;
                CdContractual.FieldValues['IDPERSONA'] := IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger;
                CdContractual.Post;
              //***********
            end;//fin del valida si no tiene descuentos

            //end;
            Next;
          end; // fin del while
          frmProgreso.Cerrar;
        end;
        JvTotal.Caption := IntToStr(CdContractual.RecordCount);


end;

procedure TFrmControlContractual.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//if Activar then
begin
// Activar := False;
 with TCustomDBGridCracker(Sender) do begin
    if DataLink.ActiveRecord = Row - 1 then begin
      Canvas.Brush.Color := clScrollBar;
      Canvas.Pen.Color := clHighLightText;
    end;
    DefaultDrawColumnCell(Rect, Datacol, Column, State);
  end;
 end;
end;

procedure TFrmControlContractual.Direccin1Click(Sender: TObject);
begin
        with IBQuery1 do
        begin
           Close;                                                          
           SQL.Clear;
           SQL.Add('');
           frmDireccionesAsociado := TfrmDireccionesAsociado.Create(Self);
           frmDireccionesAsociado.Id := CdContractual.FieldByName('IDIDENTIFICACION').AsInteger;
           frmDireccionesAsociado.Documento := CdContractual.FieldByName('IDPERSONA').AsString;
           frmDireccionesAsociado.Nombre := CdContractual.FieldByName('ASOCIADO').AsString;
           frmDireccionesAsociado.ShowModal;
        end;

end;

end.


