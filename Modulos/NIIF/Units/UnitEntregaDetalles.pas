unit UnitEntregaDetalles;

interface

uses
  Windows, Messages, Math, StrUtils, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery,
  IBSQL, Buttons, JvEdit, JvTypedEdit, pr_Common, pr_TxClasses, IBDatabase,
  DBClient;

type
  TfrmEntregaDetalles = class(TForm)
    PageControl1: TPageControl;
    TabAportes: TTabSheet;
    TabJuvenil: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    IBSQL1: TIBSQL;
    IBQuery1: TIBQuery;
    IBSQL2: TIBSQL;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    PageControl5: TPageControl;
    TabSheet6: TTabSheet;
    Label8: TLabel;
    EdCuentaJuvenil: TJvIntegerEdit;
    CmdBuscarJuvenilCuenta: TBitBtn;
    Panel3: TPanel;
    Label4: TLabel;
    EdNombreJuvenil: TStaticText;
    Label5: TLabel;
    EdIdentificacionAsociadoJuvenil: TStaticText;
    Label6: TLabel;
    EdNombreAsociadoJuvenil: TStaticText;
    Label3: TLabel;
    EdNombreAsociado: TStaticText;
    Panel5: TPanel;
    GroupBox4: TGroupBox;
    chkEducacion: TCheckBox;
    chkJuvenil: TCheckBox;
    chkAportesPresenteAno: TCheckBox;
    chkDeudas: TCheckBox;
    chkFianzas: TCheckBox;
    CmdCerrar: TBitBtn;
    DSPersona: TDataSource;
    IBQPersona: TIBQuery;
    CmdAplicar: TBitBtn;
    CmdOtro: TBitBtn;
    IBSQL3: TIBSQL;
    Imagen1J: TDBImage;
    Imagen2J: TDBImage;
    Panel6: TPanel;
    CmdCerrarJ: TBitBtn;
    CmdAplicarAyudaJ: TBitBtn;
    CmdOtroJ: TBitBtn;
    IBQPersonaJ: TIBQuery;
    DSPersonaJ: TDataSource;
    Reporte: TprTxReport;
    Imagen: TDBImage;
    EdMensajes: TStaticText;
    DSTiposDocumento: TDataSource;
    IBQTiposDocumentos: TIBQuery;
    Label93: TLabel;
    EdRangoIni: TStaticText;
    EdRangoFin: TStaticText;
    PageControl4: TPageControl;
    TabSheet5: TTabSheet;
    Label2: TLabel;
    Label1: TLabel;
    EdCuentaAportes: TJvIntegerEdit;
    CmdBuscarAsociadoCuenta: TBitBtn;
    DBLCBTipoDocumento: TDBLookupComboBox;
    EdDocumento: TEdit;
    CmdBuscarAsociadoDocumento: TBitBtn;
    GroupBox5: TGroupBox;
    chkEducacionJ: TCheckBox;
    chkJuvenilJ: TCheckBox;
    chkRindediarioJ: TCheckBox;
    chkAportesJ: TCheckBox;
    chkDeudasJ: TCheckBox;
    chkFianzasJ: TCheckBox;
    Label10: TLabel;
    EdRangoIniJ: TStaticText;
    EdRangoFinJ: TStaticText;
    Label11: TLabel;
    EdAperturaJ: TStaticText;
    EdMensajesJ: TStaticText;
    DBLCBTipoDocumentoJuvenil: TDBLookupComboBox;
    EdDocumentoJuvenil: TEdit;
    CmdBuscarJuvenilDoc: TBitBtn;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    chkFechaAperturaJ: TCheckBox;
    IBQTiposDocumentosJ: TIBQuery;
    DSTiposDocumentoJ: TDataSource;
    IBSQL4: TIBSQL;
    IBTransaction1: TIBTransaction;
    chkRindediario: TCheckBox;
    Label12: TLabel;
    EdFechaNacimiento: TStaticText;
    EdEdad: TStaticText;
    Label13: TLabel;
    Label14: TLabel;
    EdApertura: TStaticText;
    chkAperturaCuenta: TCheckBox;
    Label9: TLabel;
    EdRindediario: TStaticText;
    EdAportes: TStaticText;
    CDJuvenil: TClientDataSet;
    DSJuvenil: TDataSource;
    CDJuvenilCUENTA: TStringField;
    CDJuvenilSALDO: TStringField;
    DbJuvenil: TDBLookupListBox;
    CDJuvenilID: TIntegerField;
    IBQfoto: TIBQuery;
    DsFoto: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdBuscarAsociadoDocumentoClick(Sender: TObject);
    procedure CmdOtroClick(Sender: TObject);
    procedure CmdBuscarAsociadoCuentaClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure CmdBuscarJuvenilDocClick(Sender: TObject);
    procedure CmdAplicarAyudaJClick(Sender: TObject);
    procedure CmdBuscarJuvenilCuentaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdOtroJClick(Sender: TObject);
    procedure ImagenDblClick(Sender: TObject);
    procedure TabJuvenilShow(Sender: TObject);
    procedure TabAportesShow(Sender: TObject);
  private
    procedure Inicializar;
    procedure ValidarAsociado;
    procedure ValidarJuvenil;
    function ValidarEstadoJuvenil: boolean;
    procedure ValidarDJuvenil;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntregaDetalles: TfrmEntregaDetalles;
  xEducacion:Boolean;
  xAportesAct:Boolean;
  xAportesAnt:Boolean;
  xRindediario:Boolean;
  xJuvenil:Boolean;
  xDeudas:Boolean;
  xFianzas:Boolean;
  xApertura:Boolean;
  xAperturaJ:Boolean;
  xAPortesJ,xRindediarioJ,xJuvenilJ:Boolean;
  xEdad:Boolean;

  Ag:Integer;
  Tp:Integer;
  Nm:Integer;
  Dg:Integer;

  AgJ:Integer;
  TpJ:Integer;
  NmJ:Integer;
  DgJ:Integer;


  SaldoApoAnt:Currency;
  SaldoApoAct:Currency;
  SaldoValido:Currency;
  SaldoMinimo:Currency;
  SaldoRindediario:Currency;
  SaldoJuvenil:Currency;
  vJuvenil:Currency;
  vJuvenilYa:Boolean;

  SaldoMinimoApo:Currency;
  SaldoMinimoRin:Currency;
  SaldoMinimoJuv:Currency;


  DetalleEntregado:Boolean;
  DetalleEntregadoJ:Boolean;  
  IdAyuda:Integer;
  StrAyuda:string;
  EsJuvenil:Boolean;
  Empleado:string;

  NoActiva:Boolean;
  Limpiomens:Boolean;

  Ano:string;
  Fecha1:TDate;
  Fecha2:TDate;

implementation

{$R *.dfm}

uses unitDmGeneral, unitGlobales, unitGlobalesCol, UnitdmColocacion;

procedure TfrmEntregaDetalles.FormShow(Sender: TObject);
begin
        Inicializar;
        if NoActiva then begin
           Self.Close;
        end;
        //PageControl1.ActivePageIndex := 1;
        //EdCuentaAportes.SetFocus;
//        PageControl4.ActivePageIndex := 0;
//        EdCuentaJuvenil.SetFocus;
end;

procedure TfrmEntregaDetalles.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmEntregaDetalles.Inicializar;
begin
         if dmGeneral.IBTransaction1.InTransaction  then
           dmGeneral.IBTransaction1.Commit;

        dmGeneral.IBTransaction1.StartTransaction;

        IBQTiposDocumentos.Open;
        IBQTiposDocumentosJ.Open;

        with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$empleado" where');
            SQL.Add('ID_EMPLEADO = :ID_EMPLEADO');
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            try
             ExecQuery;
            except
             Transaction.Rollback;
             raise;
            end;
            Empleado := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                        FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                        FieldByName('NOMBRE').AsString;
        end;
        with IBSQL4 do begin
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add(' SALDO_MINIMO');
          SQL.Add('FROM');
          SQL.Add(' "cap$tipocaptacion"');
          SQL.Add('WHERE');
          SQL.Add(' ID_TIPO_CAPTACION = :ID');
// Aportaciones sociales
          ParamByName('ID').AsInteger := 1;
          try
           ExecQuery;
           SaldoMinimoApo := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;

// Ahorro Rindediario
          Close;
          ParamByName('ID').AsInteger := 2;
          try
           ExecQuery;
           SaldoMinimoRin := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;
// Ahorro Juvenil
          Close;
          ParamByName('ID').AsInteger := 4;
          try
           ExecQuery;
           SaldoMinimoJuv := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;

          Transaction.Commit;
          Close;
        end;

        SaldoApoAct := 0;
        SaldoRindediario := 0;
        SaldoJuvenil := 0;

        GroupBox1.Enabled := True;
        GroupBox2.Enabled := True;

        TabSheet5.Enabled := True;
        TabSheet6.Enabled := True;

        DBLCBTipoDocumento.KeyValue := 0;
        EdDocumento.Text := '';
        EdNombreAsociado.Caption := '';

        chkEducacion.Checked := False;

        chkAperturaCuenta.Checked := False;
        chkDeudas.Checked := False;
        chkJuvenil.Checked := False;
        chkAportesPresenteAno.Checked := False;
        chkRindediario.Checked := False;
        chkFianzas.Checked := False;
        edaperturaj.Caption := '';

        EdMensajes.Caption := '';
        edmensajes.Font.Color := clWindowText;

        DBLCBTipoDocumentoJuvenil.KeyValue := 0;
        EdDocumentoJuvenil.Text := '';
        EdNombreJuvenil.Caption := '';
        EdNombreAsociadoJuvenil.Caption := '';
        EdIdentificacionAsociadoJuvenil.Caption := '';
        EdCuentaAportes.Value := 0;
        EdCuentaJuvenil.Value := 0;

        chkEducacionJ.Checked := False;
        chkAportesJ.Checked := False;
        chkDeudasJ.Checked := False;
        chkJuvenilJ.Checked := False;
        chkRindediarioJ.Checked := False;
        chkFianzasJ.Checked := False;

        EdRangoIni.Caption := '';
        EdRangoFin.Caption := '';

        EdRangoIniJ.Caption := '';
        EdRangoFinJ.Caption := '';

        EdMensajes.Caption := '';
        EdMensajesJ.Caption := '';
        EdApertura.Caption := '';
        EdAperturaJ.Caption := '';
        EdAportes.Caption := '';
        EdRindediario.Caption := '';
        CDJuvenil.CancelUpdates;

        IdAyuda := 0;
        EsJuvenil := False;
//        vJuvenil := 30000;
        vJuvenilYa := False;

        xEducacion     :=False;
        xAportesAct    :=False;
        xAportesAnt    :=True;
        xRindediario   :=False;
        xJuvenil       :=False;
        xDeudas        :=False;
        xFianzas       :=False;
        xApertura      :=False;
        xAperturaJ     := False;
        DetalleEntregado :=False;
        DetalleEntregadoJ := False;
        xAPortesJ := False;
        xRindediarioJ := False;
        xJuvenil := False;
        xEdad := False;


        CmdAplicarAyudaJ.Enabled := False;
        CmdAplicar.Enabled := False;

        NoActiva := False;



//        TabAportes.Visible := False;
//        TabAportes.TabVisible := False;
//        PageControl1.ActivePage := TabJuvenil;
//        Panel1.Visible := False;
//        Panel2.Visible := False;
//        Panel5.Visible := False;
//        TabJuvenil.SetFocus;

end;

procedure TfrmEntregaDetalles.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmEntregaDetalles.ValidarAsociado;
var
Csc:Integer;
begin
        Limpiomens   := False;
        xEducacion   := False;
        xAportesAct  := False;
        xAportesAnt  := False;
        xJuvenil     := False;
        xApertura    := False;
        xDeudas      := False;
        xFianzas     := False;
        xRindediario := False;
        Csc := 0;

//        xAportesJ    := False;
  //      xRindediarioJ:= False;
    //    xJuvenilJ    := False;
      //  xDeudas      := True;
        //xAperturaJ   := False;

// Verificación de Asociado y Requisitos /// QUITAR FOTO
        with IBQPersona do begin
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,EDUCACION,FOTO from "gen$persona" where ID_IDENTIFICACION = :ID and');
          SQL.Add('ID_PERSONA = :PERSONA');
          ParamByName('ID').AsInteger := DBLCBTipoDocumento.KeyValue;
          ParamByName('PERSONA').AsString := EdDocumento.Text;
          try
           Open;
           if RecordCount > 0 then begin
              GroupBox1.Enabled := False;
              Application.ProcessMessages;
              EdNombreAsociado.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                          FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                          FieldByName('NOMBRE').AsString;
              if InttoBoolean(FieldByName('EDUCACION').AsInteger) then begin
//                xEducacion := True;
                chkEducacion.Checked := True;
              end
              else
              begin
//                xEducacion := False;
               chkeducacion.Checked := False;
              end;
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "cap$maestro".FECHA_APERTURA, "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and NUMERO_TITULAR = 1 and "cap$tiposestado".SE_SUMA <> 0 and "cap$maestro".ID_TIPO_CAPTACION = 1');
              IBSQL1.SQL.Add('order by "cap$maestrotitular".ID_AGENCIA ASC,"cap$maestrotitular".ID_TIPO_CAPTACION ASC,"cap$maestrotitular".NUMERO_CUENTA ASC,"cap$maestrotitular".DIGITO_CUENTA');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumento.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumento.Text;
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                   Ag := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                   Tp := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                   Nm := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                   Dg := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                   EdApertura.Caption := DateToStr(IBSQL1.FieldByName('FECHA_APERTURA').AsDate);
                   xApertura := True;
                   if IBSQL1.FieldByName('FECHA_APERTURA').AsDateTime > vFechaLimite then
                     xApertura := False
                   else
                     xApertura := True;
                   chkAperturaCuenta.Checked := xApertura;
                end
                else
                begin
                   Ag := 0;
                   Tp := 0;
                   Nm := 0;
                   Dg := 0;
                   SaldoApoAnt := 0;
                   SaldoApoAct := 0;
                   ShowMessage('La cuenta NO está Activa');
                   Limpiomens := True;
                   CmdOtro.Click;
                   Exit;
               end;
              except
                Transaction.Rollback;
                raise;
              end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "cap$libretas".NUMERO_INICIAL,');
              IBSQL1.SQL.Add('"cap$libretas".NUMERO_FINAL');
              IBSQL1.SQL.Add('from "cap$libretas"');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('"cap$libretas".ID_TIPO_CAPTACION = 2 and');
              IBSQL1.SQL.Add('"cap$libretas".NUMERO_CUENTA = :NUMERO_CUENTA and');
              IBSQL1.SQL.Add('"cap$libretas".DIGITO_CUENTA = :DIGITO_CUENTA');
              IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := Nm;
              IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(2,Format('%.7d',[Nm])));
              try
                IBSQL1.ExecQuery;
                EdRangoIni.Caption := Format('%.8d',[IBSQL1.FieldByName('NUMERO_INICIAL').AsInteger]);
                EdRangoFin.Caption := Format('%.8d',[IBSQL1.FieldByName('NUMERO_FINAL').AsInteger]);
              except
                Transaction.Rollback;
                raise;
              end;


              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSQL1.ParamByName('AG').AsInteger := Ag;
              IBSQL1.ParamByName('TP').AsInteger := Tp;
              IBSQL1.ParamByName('NM').AsInteger := Nm;
              IBSQL1.ParamByName('DG').AsInteger := Dg;
              IBSQL1.ParamByName('ANO').AsString := Ano;
              IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
              IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                  SaldoApoAct := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                  if SaldoApoAct >= SaldoMinimoApo then
                    xAportesAct := True
                  else begin
                    xAportesAct := False;
                    EdAportes.Caption := FormatCurr('#,##0.00',SaldoMinimoApo - SaldoApoAct);
                  end;
                end
                else
                begin
                  SaldoApoAct := 0;
                  xAportesAct := False;
                end;
                chkAportesPresenteAno.Checked := xAportesAct;
              except
                Transaction.Rollback;
                raise;
              end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSQL1.ParamByName('AG').AsInteger := Ag;
              IBSQL1.ParamByName('TP').AsInteger := 2;
              IBSQL1.ParamByName('NM').AsInteger := Nm;
              IBSQL1.ParamByName('DG').AsInteger := StrToInt(DigitoControl(2,Format('%.7d',[Nm])));
              IBSQL1.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
              IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
              IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                  SaldoRindediario := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                  if SaldoRindediario >= SaldoMinimoRin then
                    xRindediario := True
                  else begin
                    xRindediario := False;
                    EdRindediario.Caption := FormatCurr('#,##0.00',SaldoMinimoRin - SaldoRindediario);
                  end;
                end
                else
                begin
                  SaldoRindediario := 0;
                  xRindediario := False;
                end;
                chkRindediario.Checked := xRindediario;
              except
                Transaction.Rollback;
                raise;
              end;


              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
              IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
              IBSQL1.SQL.Add('and ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumento.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumento.Text;
              try
               IBSQL1.ExecQuery;
               xDeudas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xDeudas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                Transaction.Rollback;
                raise;
              end;
              chkDeudas.Checked := xDeudas;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colgarantias"');
              IBSQL1.SQL.Add('inner join "col$colocacion" ON ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA and');
              IBSQL1.SQL.Add('"col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
              IBSQL1.SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA and "col$colocacion".ID_ESTADO_COLOCACION < 4');
//              IBSQL1.SQL.Add('and "col$colocacion".ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumento.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumento.Text;
              try
               IBSQL1.ExecQuery;
               xFianzas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xFianzas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                Transaction.Rollback;
                raise;
              end;
              chkFianzas.Checked := xFianzas;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select * from "cap$maestrotitular"');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and "cap$maestrotitular".ID_TIPO_CAPTACION = 4 and "cap$tiposestado".SE_SUMA <> 0');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumento.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumento.Text;
              try
               IBSQL1.ExecQuery;
               xJuvenil := True;
               if IBSQL1.RecordCount > 0 then
                while not IBSQL1.Eof do begin
                    IBSQL2.Close;
                    IBSQL2.SQL.Clear;
                    IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
                    IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                    IBSQL2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                    IBSQL2.ParamByName('NM').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
                    IBSQL2.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
                    IBSQL2.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
                    try
                      IBSQL2.ExecQuery;
                      if IBSQL2.RecordCount > 0 then
                      while not IBSQL2.Eof do begin
                         SaldoJuvenil := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                         if SaldoJuvenil < SaldoMinimoJuv then begin
                           Csc := Csc + 1;
                           xJuvenil := False;
                           CDJuvenil.Append;
                           CDJuvenil.FieldValues['ID'] := Csc;
                           CDJuvenil.FieldValues['CUENTA'] := IntToStr(IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger) + '-' + IntToStr(IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger);
                           CDJuvenil.FieldValues['SALDO'] := FormatCurr('$#,##0.00',SaldoMinimoJuv - SaldoJuvenil);
                           CDJuvenil.Post;
                         end;
                         SaldoJuvenil := 0;
                         IBSQL2.Next;
                      end;

                    except
                      Transaction.Rollback;
                      raise;
                    end;
                 IBSQL1.Next;
                end;

                chkJuvenil.Checked := xJuvenil;
                CDJuvenil.First;
               except
                Transaction.Rollback;
                raise;
              end;
// Fin verificación de Requisitos
// Verificar valores máximos, entregados y pendientes
{           if SaldoApoAnt < SaldoApoAct then
              SaldoValido := SaldoApoAnt
           else
              SaldoValido := SaldoApoAct;
}
//

           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select * from "gen$detalles" where ');
           IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL1.SQL.Add('ANO = :ANO and');
           IBSQL1.SQL.Add('TIPO = :TIPO');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Ag;
           IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
           IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := Nm;
           IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := Dg;
           IBSQL1.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
           IBSQL1.ParamByName('TIPO').AsInteger := _iTipoDetalle;
           try
            IBSQL1.ExecQuery;
            if IBSQL1.RecordCount > 0 then begin
//             MessageDlg('El Detalle ya fue Entregado!',mtInformation,[mbok],0);
             DetalleEntregado := True;
            end;
           except
             Transaction.Rollback;
             raise;
           end;

// Fin Verificar Valores
           end
           else
           begin
              MessageDlg('Asociado no existe!',mtError,[mbcancel],0);
              CmdOtro.Click;
              Exit;
           end;
          except
           Transaction.Rollback;
           raise;
          end;
        end;
        TabSheet5.Enabled := False;

end;

procedure TfrmEntregaDetalles.CmdBuscarAsociadoDocumentoClick(
  Sender: TObject);
begin

        if (DBLCBTipoDocumento.KeyValue < 1) or (EdDocumento.Text = '') then begin
           MessageDlg('Debe digitar un número de identificación valido',mtError,[mbcancel],0);
           Exit;
        end;

        ValidarAsociado;
        if DetalleEntregado then begin
           EdMensajes.Caption := 'El Detalle para este Periodo Ya fue Entregado';
           CmdAplicar.Enabled := False;
           CmdOtro.Enabled := True;
           Inicializar;
           EdCuentaAportes.SetFocus;
        end;
        if not (_bAporte) then
        begin
           xAportesAct := True;
           chkAportesPresenteAno.State := cbGrayed;
        end;
        if not (_bAhorro) then
        begin
           xRindediario := True;
           chkRindediario.State := cbGrayed;
        end;
        if not (_bJuvenil) then
        begin
           xJuvenil := True;
           chkJuvenil.State := cbGrayed;
        end;
        if not (_bColocacion) then
        begin
           xDeudas := True;
           chkDeudas.State := cbGrayed;
        end;
        if not (_bFianzas) then
        begin
           xFianzas := True;
           chkFianzas.State := cbGrayed;
        end;
        if not (_bEducacion) then
        begin
          chkEducacion.State := cbGrayed;
        end;
        if vFechaLimite > fFechaActual then
        begin
          chkAperturaCuenta.State := cbGrayed;
          xApertura := True;
        end;

        if (xAportesAct and xJuvenil and xApertura
            and xDeudas and xFianzas and xRindediario) then begin
            EdMensajes.Caption := 'Cumple con todos los requisitos';
            CmdAplicar.Enabled := True;
            Application.ProcessMessages;
            CmdAplicar.SetFocus;
        end
        else
        begin
           if Limpiomens then
             EdMensajes.Caption := ''
           else begin
           edmensajes.Font.Color := clRed;
           EdMensajes.Caption := 'No Cumple con alguno de los requisitos';
           end;
        end;

        if DetalleEntregado then begin
           EdMensajes.Caption := 'El Detalle para este Periodo Ya fue Entregado';
           CmdAplicar.Enabled := False;
           CmdOtro.Enabled := True;
//           Inicializar;
//           EdCuentaAportes.SetFocus;
        end;           
end;

procedure TfrmEntregaDetalles.CmdOtroClick(Sender: TObject);
begin
        Inicializar;
        EdCuentaAportes.SetFocus;
end;

procedure TfrmEntregaDetalles.CmdBuscarAsociadoCuentaClick(
  Sender: TObject);
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('  "cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('  "cap$maestrotitular".ID_PERSONA');
          SQL.Add('FROM');
          SQL.Add(' "cap$maestro"');
          SQL.Add(' INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA="cap$maestrotitular".ID_AGENCIA)');
          SQL.Add('  AND ("cap$maestro".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
          SQL.Add('  AND ("cap$maestro".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
          SQL.Add('  AND ("cap$maestro".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add(' INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO="cap$tiposestado".ID_ESTADO)');
          SQL.Add('WHERE');
          SQL.Add('  ("cap$tiposestado".SE_SUMA = 1) AND ');
          SQL.Add('  ("cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
          SQL.Add('  ("cap$maestro".ID_TIPO_CAPTACION = 1) AND ');
          SQL.Add('  ("cap$maestrotitular".NUMERO_TITULAR = 1)');
          ParamByName('NUMERO_CUENTA').AsInteger := EdCuentaAportes.Value;
          try
            ExecQuery;
            if RecordCount > 0 then begin
              DBLCBTipoDocumento.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
              EdDocumento.Text := FieldByName('ID_PERSONA').AsString;
//              PageControl4.ActivePage := TabSheet2;
              CmdBuscarAsociadoDocumento.Click;
            end
            else
            begin
              MessageDlg('Numero de Cuenta no Encontrado'+#13+'Por Favor Verifiquelo!',mtError,[mbcancel],0);
              Inicializar;
              PageControl4.ActivePage := TabSheet5;
              EdCuentaAportes.SetFocus;
            end;
          except
            Transaction.Rollback;
            raise;
          end;
        end;


end;

procedure TfrmEntregaDetalles.CmdAplicarClick(Sender: TObject);
var Consecutivo:Integer;
    Archivo:string;
begin
        if MessageDlg('Seguro de Entregar esta Detalle?',mtConfirmation,[mbyes,mbno],0) = mrno then begin
         Exit;
        end;

        CmdAplicar.Enabled := False;
        Application.ProcessMessages;

        with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "gen$detalles" (');
            SQL.Add('ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,');
            SQL.Add('FECHA_ENTREGA, HORA_ENTREGA,ANO,ID_EMPLEADO,TIPO) VALUES (');
            SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
            SQL.Add(':FECHA_ENTREGA,:HORA_ENTREGA,:ANO,:ID_EMPLEADO,:TIPO)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
            ParamByName('NUMERO_CUENTA').AsInteger := Nm;
            ParamByName('DIGITO_CUENTA').AsInteger := Dg;
            ParamByName('FECHA_ENTREGA').AsDate := fFechaActual;
            ParamByName('HORA_ENTREGA').AsTime := fHoraActual;
            ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('TIPO').AsInteger := _iTipoDetalle;
            try
              ExecQuery;
            except
              Transaction.Rollback;
              raise;
            end;

            Transaction.Commit;
        end;

        inicializar;
        EdCuentaAportes.SetFocus;
end;


procedure TfrmEntregaDetalles.ValidarJuvenil;
begin
// Verificación de Asociado y Requisitos
        xApertura := False; 
        with IBQPersonaJ do begin
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,EDUCACION,FOTO from "gen$persona" where ID_IDENTIFICACION = :ID and');
          SQL.Add('ID_PERSONA = :PERSONA');
          ParamByName('ID').AsInteger := DBLCBTipoDocumentoJuvenil.KeyValue;
          ParamByName('PERSONA').AsString := EdDocumentoJuvenil.Text;
          try
          Open;
           if RecordCount > 0 then begin
              GroupBox1.Enabled := False;
              GroupBox2.Enabled := False;
              Application.ProcessMessages;
              EdNombreJuvenil.Caption :=  FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                          FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                          FieldByName('NOMBRE').AsString;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "cap$maestro".FECHA_APERTURA, "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA,"cap$libretas".NUMERO_INICIAL,"cap$libretas".NUMERO_FINAL');
              IBSQL1.SQL.Add('from "cap$maestrotitular" ');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and ');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
              IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA ="cap$maestro".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('LEFT JOIN "cap$libretas" ON ("cap$maestro".ID_AGENCIA = "cap$libretas".ID_AGENCIA and');
              IBSQL1.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$libretas".ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA = "cap$libretas".NUMERO_CUENTA and');
              IBSQL1.SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$libretas".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2 and "cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
              IBSQL1.SQL.Add('"cap$tiposestado".SE_SUMA <> 0');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumentoJuvenil.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumentoJuvenil.Text;
              IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := EdCuentaJuvenil.Value;
              try
               IBSQL1.ExecQuery;
               if IBSQL1.RecordCount > 0 then begin
                  AgJ := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                  TpJ := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  NmJ := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                  DgJ := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                  if IBSQL1.FieldByName('FECHA_APERTURA').AsDate <= vFechaLimite then
                   begin
                    xAperturaj := True;
                    EdAperturaJ.Caption := DateToStr(IBSQL1.FieldByName('FECHA_APERTURA').AsDate);
                    EdRangoIniJ.Caption := Format('%.8d',[IBSQL1.FieldByName('NUMERO_INICIAL').AsInteger]);
                    EdRangoFinJ.Caption := Format('%.8d',[IBSQL1.FieldByName('NUMERO_FINAL').AsInteger])
                   end
                  else
                    xAperturaj := False;

                  chkFechaAperturaJ.Checked := xApertura;

                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "cap$maestrotitular" where');
                  IBSQL2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
                  IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
                  IBSQL2.SQL.Add('NUMERO_TITULAR = 1');
                  IBSQL2.ParamByName('ID_AGENCIA').AsInteger := AgJ;
                  IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := TpJ;
                  IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := NmJ;
                  IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := DgJ;
                  try
                    IBSQL2.ExecQuery;
                    if IBSQL2.RecordCount > 0 then
                    begin
                       IBSQL3.Close;
                       IBSQL3.SQL.Clear;
                       IBSQL3.SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE, ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA from "gen$persona"');
                       IBSQL3.SQL.Add('inner join "cap$maestrotitular" ON ("gen$persona".ID_IDENTIFICACION = "cap$maestrotitular".ID_IDENTIFICACION and');
                       IBSQL3.SQL.Add('"gen$persona".ID_PERSONA = "cap$maestrotitular".ID_PERSONA)');
                       IBSQL3.SQL.Add('where "gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION and "gen$persona".ID_PERSONA = :ID_PERSONA and');
                       IBSQL3.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1 and "cap$maestrotitular".ID_TIPO_CAPTACION = 1');
                       IBSQL3.ParamByName('ID_IDENTIFICACION').AsInteger := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
                       IBSQL3.ParamByName('ID_PERSONA').AsString := IBSQL2.FieldByName('ID_PERSONA').AsString;
                       DBLCBTipoDocumento.KeyValue := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
                       EdIdentificacionAsociadoJuvenil.Caption := IBSQL2.FieldByName('ID_PERSONA').AsString;
                       EdDocumento.Text := IBSQL2.FieldByName('ID_PERSONA').AsString;
                       Ag := IBSQL3.FieldByName('ID_AGENCIA').AsInteger;
                       Tp := IBSQL3.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                       Nm := IBSQL3.FieldByName('NUMERO_CUENTA').AsInteger;
                       Dg := IBSQL3.FieldByName('DIGITO_CUENTA').AsInteger;
                       try
                         IBSQL3.ExecQuery;
                         if IBSQL3.RecordCount > 0 then begin
                            EdNombreAsociadoJuvenil.Caption := IBSQL3.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                               IBSQL3.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                               IBSQL3.FieldByName('NOMBRE').AsString;
                         end;
                       except
                         Transaction.Rollback;
                         raise;
                       end;

                    end
                    else
                    begin
                      MessageDlg('No Encuentro al Asociado',mtError,[mbcancel],0);
                      Inicializar;
                      EdCuentaJuvenil.SetFocus;
                      Exit;
                    end;
                  except
                    Transaction.Rollback;
                    raise;
                  end;
               end
               else
               begin
                  MessageDlg('No Encuentro a Ese Juvenil',mtError,[mbcancel],0);
                  Inicializar;
                  Exit;
               end
             except
               Transaction.Rollback;
               raise;
             end;
           end
           else
           begin
             MessageDlg('No Encuentro a Ese Juvenil',mtError,[mbcancel],0);
             Inicializar;
             Exit;
           end;
          except
           Transaction.Rollback;
           raise;
          end;
        end; // Fin de With

        DetalleEntregadoJ := ValidarEstadoJuvenil;


end;

procedure TfrmEntregaDetalles.CmdBuscarJuvenilDocClick(
  Sender: TObject);
begin
//        ValidarJuvenil;
//        ValidarAsociado;
        ValidarDJuvenil;

        if DetalleEntregadoJ then begin
           MessageDlg('El Detalle para este Periodo Ya fue Entregado',mtError,[mbcancel],0);
           Inicializar;
           EdCuentaJuvenil.SetFocus;
           Exit;
        end;
        //***
        if not (_bAporte) then
        begin
           xAportesJ := True;
           chkAportesj.State := cbGrayed;
        end;
        if not (_bAhorro) then
        begin
           xRindediarioJ := True;
           chkRindediarioj.State := cbGrayed;
        end;
        if not (_bJuvenil) then
        begin
           xJuvenilJ := True;
           chkJuvenilj.State := cbGrayed;
        end;
        if not (_bColocacion) then
        begin
           xDeudas := True;
           chkDeudasj.State := cbGrayed;
        end;
        if not (_bFianzas) then
        begin
           xFianzas := True;
           chkFianzasj.State := cbGrayed;
        end;
        if not (_bEducacion) then
        begin
          chkEducacionj.State := cbGrayed;
        end;
        if vFechaLimite > fFechaActual then
        begin
          xAperturaJ := True;
          chkFechaAperturaJ.State := cbGrayed;
        end;

        //***


        if (xAportesJ and xRindediarioJ and xJuvenilJ and xDeudas and xAperturaJ and xEdad) then begin
            EdMensajesJ.Caption := 'Cumple con todos los requisitos';
            CmdAplicarAyudaJ.Enabled := True;
            CmdAplicarAyudaJ.SetFocus;
        end
        else
        begin
           EdMensajesJ.Caption := 'No Cumple con alguno de los requisitos';
           CmdAplicarAyudaJ.Enabled := False;
           CmdOtroJ.SetFocus;
        end;


end;

procedure TfrmEntregaDetalles.CmdAplicarAyudaJClick(Sender: TObject);
var Consecutivo:Integer;
    Archivo:string;
begin
        if MessageDlg('Seguro de Entregar esta Detalle?',mtConfirmation,[mbyes,mbno],0) = mrno then begin
         Exit;
        end;

        CmdAplicar.Enabled := False;
        Application.ProcessMessages;

        with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "gen$detalles" (');
            SQL.Add('ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,');
            SQL.Add('FECHA_ENTREGA, HORA_ENTREGA,ANO,ID_EMPLEADO,TIPO) VALUES (');
            SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
            SQL.Add(':FECHA_ENTREGA,:HORA_ENTREGA,:ANO,:ID_EMPLEADO,:TIPO)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := TpJ;
            ParamByName('NUMERO_CUENTA').AsInteger := NmJ;
            ParamByName('DIGITO_CUENTA').AsInteger := DgJ;
            ParamByName('FECHA_ENTREGA').AsDate := fFechaActual;
            ParamByName('HORA_ENTREGA').AsTime := fHoraActual;
            ParamByName('ANO').AsString := Ano;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('TIPO').AsInteger := _iTipoDetalle;
            try
              ExecQuery;
            except
              Transaction.Rollback;
              raise;
            end;

            Transaction.Commit;
        end;

        inicializar;
        EdCuentaJuvenil.SetFocus;

end;

procedure TfrmEntregaDetalles.CmdBuscarJuvenilCuentaClick(
  Sender: TObject);
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "cap$maestrotitular" Where');
          SQL.Add('ID_TIPO_CAPTACION = 4 and NUMERO_CUENTA = :NUMERO_CUENTA and NUMERO_TITULAR = 2');
          ParamByName('NUMERO_CUENTA').AsInteger := EdCuentaJuvenil.Value;
          try
            ExecQuery;
            if RecordCount > 0 then begin
              DBLCBTipoDocumentoJuvenil.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
              EdDocumentoJuvenil.Text := FieldByName('ID_PERSONA').AsString;
              CmdBuscarJuvenilDoc.Click;
            end
            else
            begin
              MessageDlg('Numero de Cuenta no Encontrado'+#13+'Por Favor Verifiquelo!',mtError,[mbcancel],0);
              Inicializar;
              PageControl5.ActivePage := TabSheet6;
              EdCuentaJuvenil.SetFocus;
            end;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

end;

function TfrmEntregaDetalles.ValidarEstadoJuvenil: boolean;
begin
        with IBSQL3 do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from "gen$detalles" where ');
         SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA AND ANO = :ANO AND TIPO = :TIPO');
         ParamByName('ID_AGENCIA').AsInteger := AgJ;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := TpJ;
         ParamByName('NUMERO_CUENTA').AsInteger := NmJ;
         ParamByName('DIGITO_CUENTA').AsInteger := DgJ;
         ParamByName('ANO').AsString := Ano;
         ParamByName('TIPO').AsInteger := _iTipoDetalle;
         try
          ExecQuery;
          if RecordCount > 0 then
            Result := True
          else
            Result := False;
         except
           Transaction.Rollback;
           raise;
         end;
        end;
end;

procedure TfrmEntregaDetalles.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose := True;
end;

procedure TfrmEntregaDetalles.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);

        Ano    := IntToStr(YearOf(fFechaActual));
        Fecha1 := EncodeDate(YearOf(fFechaActual),01,01);
        Fecha2 := EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));

end;

procedure TfrmEntregaDetalles.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmEntregaDetalles.CmdOtroJClick(Sender: TObject);
begin
        Inicializar;
        EdCuentaJuvenil.SetFocus;
end;

procedure TfrmEntregaDetalles.ValidarDJuvenil;
var
TpDocAsociado:Integer;
DocAsociado:string;
Edad:Integer;
begin
// Verificación de Asociado y Requisitos
        xApertura := False;

        with IBQPersonaJ do begin
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,EDUCACION,FOTO,FECHA_NACIMIENTO from "gen$persona" where ID_IDENTIFICACION = :ID and');
          SQL.Add('ID_PERSONA = :PERSONA');
          ParamByName('ID').AsInteger := DBLCBTipoDocumentoJuvenil.KeyValue;
          ParamByName('PERSONA').AsString := EdDocumentoJuvenil.Text;
          try
          Open;
           if RecordCount > 0 then begin
              GroupBox1.Enabled := False;
              GroupBox2.Enabled := False;
              Application.ProcessMessages;
              EdNombreJuvenil.Caption :=  FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                          FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                          FieldByName('NOMBRE').AsString;
              EdFechaNacimiento.Caption := DateToStr(FieldByName('FECHA_NACIMIENTO').AsDateTime);
              Edad := YearsBetween(FieldByName('FECHA_NACIMIENTO').AsDateTime,fFechaActual);
              EdEdad.Caption := IntToStr(Edad);
              if Edad < 14 then
                xEdad := True
              else
                xEdad := False;


              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "cap$maestro".FECHA_APERTURA, "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA,"cap$libretas".NUMERO_INICIAL,"cap$libretas".NUMERO_FINAL');
              IBSQL1.SQL.Add('from "cap$maestrotitular" ');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and ');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
              IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA ="cap$maestro".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('LEFT JOIN "cap$libretas" ON ("cap$maestro".ID_AGENCIA = "cap$libretas".ID_AGENCIA and');
              IBSQL1.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$libretas".ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA = "cap$libretas".NUMERO_CUENTA and');
              IBSQL1.SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$libretas".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2 and "cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
              IBSQL1.SQL.Add('"cap$tiposestado".SE_SUMA <> 0');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumentoJuvenil.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumentoJuvenil.Text;
              IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := EdCuentaJuvenil.Value;
              try
               IBSQL1.ExecQuery;
               if IBSQL1.RecordCount > 0 then begin
                  AgJ := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                  TpJ := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  NmJ := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                  DgJ := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                  if IBSQL1.FieldByName('FECHA_APERTURA').AsDate <= vFechaLimite then
                   begin
                    xAperturaj := True;
                    EdAperturaJ.Caption := DateToStr(IBSQL1.FieldByName('FECHA_APERTURA').AsDate);
                    EdRangoIniJ.Caption := Format('%.8d',[IBSQL1.FieldByName('NUMERO_INICIAL').AsInteger]);
                    EdRangoFinJ.Caption := Format('%.8d',[IBSQL1.FieldByName('NUMERO_FINAL').AsInteger])
                   end
                  else
                   begin
                    xAperturaj := False;
                    EdAperturaJ.Caption := DateToStr(IBSQL1.FieldByName('FECHA_APERTURA').AsDate);
                   end;

                  chkFechaAperturaJ.Checked := xAperturaJ;

                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
                  IBSQL2.ParamByName('AG').AsInteger := AgJ;
                  IBSQL2.ParamByName('TP').AsInteger := TpJ;
                  IBSQL2.ParamByName('NM').AsInteger := NmJ;
                  IBSQL2.ParamByName('DG').AsInteger := DgJ;
                  IBSQL2.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
                  IBSQL2.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
                  IBSQL2.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
                  try
                    IBSQL2.ExecQuery;
                    if IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency < SaldoMinimoJuv then
                      xJuvenilJ := False
                    else
                      xJuvenilJ := True;
                  except
                   Transaction.Rollback;
                   raise;
                  end;

                  chkJuvenilJ.Checked := xJuvenilJ;

                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "cap$maestrotitular" where');
                  IBSQL2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
                  IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
                  IBSQL2.SQL.Add('NUMERO_TITULAR = 1');
                  IBSQL2.ParamByName('ID_AGENCIA').AsInteger := AgJ;
                  IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := TpJ;
                  IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := NmJ;
                  IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := DgJ;
                  try
                    IBSQL2.ExecQuery;
                    if IBSQL2.RecordCount > 0 then
                    begin
                       TpDocAsociado := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
                       DocAsociado := IBSQL2.FieldByName('ID_PERSONA').AsString;
                       IBQPersona.Close;
                       IBQPersona.SQL.Clear;
                       IBQPersona.SQL.Add('select "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE,"gen$persona".FOTO,');
                       IBQPersona.SQL.Add('"cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA,"cap$maestro".ID_ESTADO from "cap$maestrotitular"');
                       IBQPersona.SQL.Add('inner join "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and');
                       IBQPersona.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
                       IBQPersona.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
                       IBQPersona.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA ="cap$maestro".DIGITO_CUENTA)');
                       IBQPersona.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                       IBQPersona.SQL.Add('inner join "gen$persona" on ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
                       IBQPersona.SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
                       IBQPersona.SQL.Add('where "cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
                       IBQPersona.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1 and "cap$maestrotitular".ID_TIPO_CAPTACION = 1');
                       IBQPersona.SQL.Add('and "cap$tiposestado".SE_SUMA <> 0');

                       IBQPersona.ParamByName('ID_IDENTIFICACION').AsInteger := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
                       IBQPersona.ParamByName('ID_PERSONA').AsString := IBSQL2.FieldByName('ID_PERSONA').AsString;
                       DBLCBTipoDocumento.KeyValue := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
                       EdIdentificacionAsociadoJuvenil.Caption := IBSQL2.FieldByName('ID_PERSONA').AsString;
                       EdDocumento.Text := IBSQL2.FieldByName('ID_PERSONA').AsString;
                       try
                         IBQPersona.Open;
                         if IBQPersona.RecordCount > 0 then begin
                            EdNombreAsociadoJuvenil.Caption := IBQPersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                               IBQPersona.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                               IBQPersona.FieldByName('NOMBRE').AsString;
                            Ag := IBQPersona.FieldByName('ID_AGENCIA').AsInteger;
                            Tp := IBQPersona.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                            Nm := IBQPersona.FieldByName('NUMERO_CUENTA').AsInteger;
                            Dg := IBQPersona.FieldByName('DIGITO_CUENTA').AsInteger;
                         end;
                       except
                         Transaction.Rollback;
                         raise;
                       end;

                       IBSQL1.Close;
                       IBSQL1.SQL.Clear;
                       IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
                       IBSQL1.ParamByName('AG').AsInteger := Ag;
                       IBSQL1.ParamByName('TP').AsInteger := Tp;
                       IBSQL1.ParamByName('NM').AsInteger := Nm;
                       IBSQL1.ParamByName('DG').AsInteger := Dg;
                       IBSQL1.ParamByName('ANO').AsString := Ano;
                       IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
                       IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
                       try
                         IBSQL1.ExecQuery;
                         if IBSQL1.RecordCount > 0 then begin
                           SaldoApoAct := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                           if SaldoApoAct >= SaldoMinimoApo then
                             xAportesJ := True
                           else
                             xAportesJ := False;
                         end
                         else
                         begin
                           SaldoApoAct := 0;
                           xAportesJ := False;
                         end;
                         chkAportesJ.Checked := xAportesJ;
                       except
                         Transaction.Rollback;
                         raise;
                       end;

                       IBSQL1.Close;
                       IBSQL1.SQL.Clear;
                       IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
                       IBSQL1.ParamByName('AG').AsInteger := Ag;
                       IBSQL1.ParamByName('TP').AsInteger := 2;
                       IBSQL1.ParamByName('NM').AsInteger := Nm;
                       IBSQL1.ParamByName('DG').AsInteger := StrToInt(DigitoControl(2,Format('%.7d',[Nm])));
                       IBSQL1.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
                       IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
                       IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
                       try
                         IBSQL1.ExecQuery;
                         if IBSQL1.RecordCount > 0 then begin
                           SaldoRindediario := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                           if SaldoRindediario >= SaldoMinimoRin then
                             xRindediarioJ := True
                           else
                             xRindediarioJ := False;
                         end
                         else
                         begin
                           SaldoRindediario := 0;
                           xRindediarioJ := False;
                         end;
                         chkRindediarioJ.Checked := xRindediarioJ;
                       except
                         Transaction.Rollback;
                         raise;
                       end;


                       IBSQL1.Close;
                       IBSQL1.SQL.Clear;
                       IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
                       IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
                       IBSQL1.SQL.Add('and ID_ESTADO_COLOCACION < 3');
                       IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := TpDocAsociado;
                       IBSQL1.ParamByName('ID_PERSONA').AsString := DocAsociado;
                       try
                        IBSQL1.ExecQuery;
                        xDeudas := True;
                        if IBSQL1.RecordCount > 0 then begin
                          while not IBSQL1.Eof do begin
                            if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                              xDeudas := False;
                            IBSQL1.Next;
                          end;
                        end;
                        except
                         Transaction.Rollback;
                         raise;
                       end;
                       chkDeudasJ.Checked := xDeudas;

                    end
                    else
                    begin
                      MessageDlg('No Encuentro al Asociado',mtError,[mbcancel],0);
                      Inicializar;
                      Exit;
                    end;
                  except
                    Transaction.Rollback;
                    raise;
                  end;
               end
               else
               begin
                  MessageDlg('No Encuentro a Ese Juvenil',mtError,[mbcancel],0);
                  Inicializar;
                  EdCuentaJuvenil.SetFocus;
                  Exit;
               end
             except
               Transaction.Rollback;
               raise;
             end;
           end
           else
           begin
             MessageDlg('No Encuentro a Ese Juvenil',mtError,[mbcancel],0);
             Inicializar;
             Exit;
           end;
          except
           Transaction.Rollback;
           raise;
          end;
        end; // Fin de With
        DetalleEntregadoJ := ValidarEstadoJuvenil;        
end;

procedure TfrmEntregaDetalles.ImagenDblClick(Sender: TObject);
begin
        with IBQfoto do
        begin
          Close;
          ParamByName('ID').AsInteger := DBLCBTipoDocumento.KeyValue;
          ParamByName('PERSONA').AsString := EdDocumento.Text;
          Open;
        end;

end;

procedure TfrmEntregaDetalles.TabJuvenilShow(Sender: TObject);
begin
        EdCuentaJuvenil.SetFocus;
end;

procedure TfrmEntregaDetalles.TabAportesShow(Sender: TObject);
begin
        EdCuentaAportes.SetFocus;
end;

end.
