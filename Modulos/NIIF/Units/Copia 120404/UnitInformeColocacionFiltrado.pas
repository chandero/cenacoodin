unit UnitInformeColocacionFiltrado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, pr_Common, pr_TxClasses, pr_Parser, DB,
  IBCustomDataSet, IBQuery, DBCtrls, ComCtrls, IBSQL, UnitDmGeneral;

type
  TfrmInformeColocacionesFiltrado = class(TForm)
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    CmdAceptar: TBitBtn;
    IBTabla: TIBQuery;
    GroupBox1: TGroupBox;
    Fecha: TCheckBox;
    Saldo: TCheckBox;
    CBclasificacion: TDBLookupComboBox;
    Label7: TLabel;
    EdFechaInicial: TDateTimePicker;
    Label1: TLabel;
    EdFechaFinal: TDateTimePicker;
    CBlinea: TDBLookupComboBox;
    CBinversion: TDBLookupComboBox;
    CBgarantia: TDBLookupComboBox;
    CBtipocuota: TDBLookupComboBox;
    RadioSexo: TRadioGroup;
    EdTasa: TEdit;
    EdSaldo: TEdit;
    RClasificacion: TCheckBox;
    RLinea: TCheckBox;
    RInversion: TCheckBox;
    RTipoCuota: TCheckBox;
    RGarantia: TCheckBox;
    RTasa: TCheckBox;
    IBTabla2: TIBSQL;
    REstado: TCheckBox;
    CBEstado: TDBLookupComboBox;
    CmdNuevo: TBitBtn;
    IBDSTipoCuota: TIBQuery;
    DStipocuota: TDataSource;
    RadioSaldo: TRadioGroup;
    RadioTasa: TRadioGroup;
    Reporte: TprTxReport;
    Plazo: TCheckBox;
    EdPlazo: TEdit;
    RadioPlazo: TRadioGroup;
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBclasificacionEnter(Sender: TObject);
    procedure CBclasificacionExit(Sender: TObject);
    procedure RClasificacionClick(Sender: TObject);
    procedure RInversionClick(Sender: TObject);
    procedure RLineaClick(Sender: TObject);
    procedure RGarantiaClick(Sender: TObject);
    procedure RTipoCuotaClick(Sender: TObject);
    procedure FechaClick(Sender: TObject);
    procedure SaldoClick(Sender: TObject);
    procedure RTasaClick(Sender: TObject);
    procedure RadioSexoClick(Sender: TObject);
    procedure CBlineaEnter(Sender: TObject);
    procedure CBlineaExit(Sender: TObject);
    procedure CBinversionEnter(Sender: TObject);
    procedure CBinversionExit(Sender: TObject);
    procedure CBgarantiaEnter(Sender: TObject);
    procedure CBgarantiaExit(Sender: TObject);
    procedure CBtipocuotaEnter(Sender: TObject);
    procedure CBtipocuotaExit(Sender: TObject);
    procedure EdTasaEnter(Sender: TObject);
    procedure EdTasaExit(Sender: TObject);
    procedure EdFechaInicialEnter(Sender: TObject);
    procedure EdFechaInicialExit(Sender: TObject);
    procedure EdFechaFinalEnter(Sender: TObject);
    procedure EdFechaFinalExit(Sender: TObject);
    procedure EdSaldoEnter(Sender: TObject);
    procedure EdSaldoExit(Sender: TObject);
    procedure REstadoClick(Sender: TObject);
    procedure CBEstadoEnter(Sender: TObject);
    procedure CBEstadoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdNuevoClick(Sender: TObject);
    procedure RadioSaldoClick(Sender: TObject);
    procedure RadioTasaClick(Sender: TObject);
    procedure EdPlazoEnter(Sender: TObject);
    procedure EdPlazoExit(Sender: TObject);
    procedure PlazoClick(Sender: TObject);
    procedure RadioPlazoClick(Sender: TObject);
    procedure PlazoExit(Sender: TObject);
    procedure RTasaExit(Sender: TObject);
    procedure SaldoExit(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeColocacionesFiltrado: TfrmInformeColocacionesFiltrado;
  dmGeneral: TdmGeneral;
  Sexo:string;
  vClasificacion:Integer;
  vLinea:Integer;
  vInversion:Integer;
  vGarantia:Integer;
  vEstado:Integer;
  vTipoCuota:Integer;
  vTasa:Single;
  vFechaInicial:TDate;
  vFechaFinal:TDate;
  vPlazo:Integer;
  vSaldo:Currency;
  SignoSaldo:string;
  SignoTasa:string;
  SignoPlazo:string;
  Cadena:string;

implementation

{$R *.dfm}

uses UnitGlobales, unitdmcolocacion,
     UnitVistaPreliminar;

procedure TfrmInformeColocacionesFiltrado.CmdAceptarClick(Sender: TObject);
begin
        CmdAceptar.Enabled := False;
        with IBTabla do
        begin
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('"col$colocacion".ID_COLOCACION, "col$colocacion".ID_PERSONA,');
             SQL.Add('"col$colocacion".ID_CLASIFICACION, "col$colocacion".ID_LINEA,"col$colocacion".ID_INVERSION,"col$colocacion".ID_GARANTIA, "gen$persona".NOMBRE,');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".SEXO,');
             SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
             SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
             SQL.Add('"col$lineas".DESCRIPCION_LINEA,"col$inversion".DESCRIPCION_INVERSION,');
             SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,"col$garantia".DESCRIPCION_GARANTIA,"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
             SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".VALOR_DESEMBOLSO,');
             SQL.Add('"col$colocacion".PLAZO_COLOCACION,"col$colocacion".FECHA_VENCIMIENTO,');
             SQL.Add('"col$colocacion".TIPO_INTERES,"col$tasavariables".DESCRIPCION_TASA,');
             SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,"col$colocacion".TASA_INTERES_MORA,');
             SQL.Add('"col$colocacion".PUNTOS_INTERES,"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
             SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,"col$colocacion".AMORTIZA_INTERES,');
             SQL.Add('"col$colocacion".PERIODO_GRACIA,"col$colocacion".VALOR_CUOTA, "col$colocacion".ABONOS_CAPITAL,');
             SQL.Add('"col$colocacion".FECHA_CAPITAL,"col$colocacion".FECHA_INTERES,"col$colocacion".ID_CATEGORIA,');
             SQL.Add('"col$colocacion".NUMERO_CUENTA, ("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) as SALDO,');
             SQL.Add('"col$colocacion".ID_EVALUACION, "col$colocacion".ID_CATEGORIA,');
             SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,');
             SQL.Add('"gen$empleado".NOMBRE AS NOMBRE1');
             SQL.Add('FROM ');
             SQL.Add('"col$colocacion" LEFT JOIN "gen$persona" ON ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "gen$tiposidentificacion" ON ("gen$persona".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
             SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
             SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION)');
             SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO)');
             SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
             SQL.Add('LEFT OUTER JOIN "col$tasavariables" ON ("col$colocacion".ID_INTERES = "col$tasavariables".ID_INTERES)');
             SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
             SQL.Add('LEFT JOIN "gen$empleado" ON ("col$colocacion".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO) ');
             SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
             SQL.Add('where ');

             if (RClasificacion.Checked = True) then
               SQL.Add('"col$colocacion".ID_CLASIFICACION =:"ID_CLASIFICACION"');

             if (RLinea.Checked = True) and (RClasificacion.Checked = True) then
               SQL.Add('and "col$colocacion".ID_LINEA =:"ID_LINEA"')
             else if RLinea.Checked = True then SQL.Add('"col$colocacion".ID_LINEA =:"ID_LINEA"');

             if (RInversion.Checked = True) and ((RClasificacion.Checked = True) or (RLinea.Checked = True)) then
               SQL.Add('and "col$colocacion".ID_INVERSION =:"ID_INVERSION"')
             else if RInversion.Checked = True then SQL.Add('"col$colocacion".ID_INVERSION =:"ID_INVERSION"');

             if (RGarantia.Checked = True) and ((RClasificacion.Checked = True) or (RLinea.Checked = True) or (RInversion.Checked = True)) then
               SQL.Add('and "col$colocacion".ID_GARANTIA =:"ID_GARANTIA"')
             else if RGarantia.Checked = True then SQL.Add('"col$colocacion".ID_GARANTIA =:"ID_GARANTIA"');

             if (RTipoCuota.Checked = True) and ((RClasificacion.Checked = True) or (RLinea.Checked = True) or (RInversion.Checked = True) or (RGarantia.Checked = True)) then
               SQL.Add('and "col$colocacion".ID_TIPO_CUOTA =:"ID_TIPO_CUOTA"')
             else if RTipoCuota.Checked = True then SQL.Add('"col$colocacion".ID_TIPO_CUOTA =:"ID_TIPO_CUOTA"');

             if (REstado.Checked = True) and ((RClasificacion.Checked = True) or (RLinea.Checked = True) or (RInversion.Checked = True) or (RGarantia.Checked = True) or (RTipoCuota.Checked = True)) then
               SQL.Add('and "col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"')
             else if REstado.Checked = True then SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"');

             if (Fecha.Checked = True) and ((RClasificacion.Checked = True) or (RLinea.Checked = True) or (RInversion.Checked = True) or (RGarantia.Checked = True) or (RTipoCuota.Checked = True) or (REstado.Checked = True)) then
               SQL.Add('and "col$colocacion".FECHA_DESEMBOLSO between :"FECHA_INICIAL" and :"FECHA_FINAL"')
             else if Fecha.Checked = True then SQL.Add('"col$colocacion".FECHA_DESEMBOLSO between :"FECHA_INICIAL" and :"FECHA_FINAL"');

             if (Plazo.Checked = True) and ((RClasificacion.Checked = True) or (RLinea.Checked = True) or (RInversion.Checked = True) or (RGarantia.Checked = True) or (RTipoCuota.Checked = True) or (REstado.Checked = True) or (Fecha.Checked= True)) then
               SQL.Add('and "col$colocacion".PLAZO_COLOCACION' + SignoPlazo + ':"PLAZO"')
             else if Plazo.Checked = True then SQL.Add('"col$colocacion".PLAZO_COLOCACION' + SignoPlazo + ':"PLAZO"');

             if (RTasa.Checked = True) and ((RClasificacion.Checked = True) or (RLinea.Checked = True) or (RInversion.Checked = True) or (RGarantia.Checked = True) or (RTipoCuota.Checked = True) or (REstado.Checked = True) or (Fecha.Checked= True) or (Plazo.Checked= True)) then
               SQL.Add('and "col$colocacion".TASA_INTERES_CORRIENTE' + SignoTasa + ':"TASA_INTERES_CORRIENTE"')
             else if RTasa.Checked = True then SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE' + SignoTasa + ':"TASA_INTERES_CORRIENTE"');

             if (Saldo.Checked = True) and ((RClasificacion.Checked = True) or (RLinea.Checked = True) or (RInversion.Checked = True) or (RGarantia.Checked = True) or (RTipoCuota.Checked = True)  or (REstado.Checked = True) or (Fecha.Checked= True) or (Plazo.Checked= True) or (RTasa.Checked= True)) then
               SQL.Add('and ("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL)' + SignoSaldo + ':"SALDO"')
             else if Saldo.Checked = True then SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL)' + SignoSaldo + ':"SALDO"');

             if (Sexo <> '') and ((RClasificacion.Checked = True) or (RLinea.Checked = True) or (RInversion.Checked = True) or (RGarantia.Checked = True) or (RTipoCuota.Checked = True)  or (REstado.Checked = True) or (Fecha.Checked= True) or (Plazo.Checked= True) or (RTasa.Checked= True) or (Saldo.Checked = True)) then
               SQL.Add('and "gen$persona".SEXO =:"SEXO"')
             else if Sexo <> '' then SQL.Add('"gen$persona".SEXO =:"SEXO"');

// Envio Parametros
             if RClasificacion.Checked = True then
                ParamByName('ID_CLASIFICACION').AsInteger := vClasificacion;
             if RLinea.Checked = True then
               ParamByName('ID_LINEA').AsInteger := vLinea;
             if RInversion.Checked = True then
               ParamByName('ID_INVERSION').AsInteger := vInversion;
             if RGarantia.Checked = True then
               ParamByName('ID_GARANTIA').AsInteger := vGarantia;
             if RTipoCuota.Checked = True then
               ParamByName('ID_TIPO_CUOTA').AsInteger := vTipoCuota;
             if REstado.Checked = True then
               ParamByName('ID_ESTADO_COLOCACION').AsInteger := vEstado;
             if Fecha.Checked = True then
              begin
                ParamByName('FECHA_INICIAL').AsDate := vFechaInicial;
                ParamByName('FECHA_FINAL').AsDate := vFechaFinal;
              end;
             if Plazo.Checked = True then
               ParamByName('PLAZO').AsInteger := vPlazo;
             if RTasa.Checked = True then
               ParamByName('TASA_INTERES_CORRIENTE').AsFloat := vTasa;
             if Saldo.Checked = True then
               ParamByName('SALDO').AsCurrency := vSaldo;
             if Sexo <> '' then
               ParamByName('SEXO').AsString := Sexo;

//             if REstado.Checked and (vEstado > 6) then
//               SQL.Add('and "col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL > 0');
             SQL.Add('order by ID_COLOCACION, FECHA_DESEMBOLSO ASC');

             Open;

             if RClasificacion.Checked = True then
                Cadena := 'Clasificación : ' + CBclasificacion.Text + '   ';
             if RLinea.Checked = True then
                Cadena := Cadena + 'Linea : ' + CBlinea.Text + '  ';
             if RInversion.Checked = True then
                Cadena := Cadena + 'Inversión : ' + CBinversion.Text + '   ';
             if RGarantia.Checked = True then
                Cadena := Cadena + 'Garantía : ' + CBgarantia.Text + '   ';
             if RTipoCuota.Checked = True then
                Cadena := Cadena + 'Tipo Cuota : ' + CBtipocuota.Text + '   ';
             if REstado.Checked = True then
                Cadena := Cadena + 'Estado : ' + CBEstado.Text + '   ';
             if Fecha.Checked = True then
                Cadena := Cadena + 'Fecha Inicial : ' + DateToStr(EdFechaInicial.Date) +  '  ' + 'Fecha Final : ' + DateToStr(EdFechaFinal.Date) + '  ';
             if Plazo.Checked = True then
                Cadena := Cadena + 'Plazo ' + SignoPlazo + ' ' + EdPlazo.Text + '   ';
             if RTasa.Checked = True then
                Cadena := Cadena + 'Tasa ' + SignoTasa + ' ' + EdTasa.Text + '   ';
             if Saldo.Checked = True then
                Cadena := Cadena + 'Saldo ' + SignoSaldo + ' ' + EdSaldo.Text + '   ';
             if Sexo <> '' then
                Cadena := Cadena + 'Sexo : ' + Sexo + '   ';

             Empleado;
             Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
             Reporte.Variables.ByName['AGENCIA'].AsInteger := Agencia;
             Reporte.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
             Reporte.Variables.ByName['NIT'].AsString := Nit;
             Reporte.Variables.ByName['CADENA'].AsString := Cadena;

          if Reporte.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := Reporte;
             frmVistaPreliminar.ShowModal;
           end;
        end;
end;

procedure TfrmInformeColocacionesFiltrado.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeColocacionesFiltrado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        dmGeneral.Free;
        Action := caFree;
end;

procedure TfrmInformeColocacionesFiltrado.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Commit;
         DmGeneral.IBTransaction1.StartTransaction;
        try
          Inicializar;
        finally
        end;         
end;

procedure TfrmInformeColocacionesFiltrado.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBTabla.Database := dmGeneral.IBDatabase1;
        IBTabla2.Database := dmGeneral.IBDatabase1;
        IBDSTipoCuota.Database := dmGeneral.IBDatabase1;
        IBTabla.Transaction := dmGeneral.IBTransaction1;
        IBTabla2.Transaction := dmGeneral.IBTransaction1;
        IBDSTipoCuota.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmInformeColocacionesFiltrado.Inicializar;
begin
    vClasificacion := 1;
    vLinea := 1;
    vInversion := 1;
    vGarantia := 1;
    vTipoCuota := 1;
    vEstado := 0;
    vPlazo := 0;
    Cadena := '';

    RClasificacion.Checked := False;
    CBclasificacion.KeyValue := -1;
    CBclasificacion.Enabled := False;
    RLinea.Checked := False;
    CBlinea.KeyValue := -1;
    CBlinea.Enabled := False;
    RInversion.Checked := False;
    CBinversion.KeyValue := -1;
    CBinversion.Enabled := False;
    RGarantia.Checked := False;
    CBgarantia.KeyValue := -1;
    CBgarantia.Enabled := False;
    RTipoCuota.Checked := False;
    CBtipocuota.KeyValue := -1;
    CBtipocuota.Enabled := False;
    REstado.Checked := False;
    CBEstado.KeyValue := -1;
    CBEstado.Enabled := False;
    Fecha.Checked := False;
    Plazo.Checked := False;
    Label7.Visible := False;
    Label1.Visible := False;
    EdFechaInicial.Visible := False;
    EdFechaFinal.Visible := False;
    EdPlazo.Text := '';
    EdPlazo.Enabled := False;
    RTasa.Checked := False;
    EdTasa.Text := '';
    EdTasa.Enabled := False;
    Saldo.Checked := False;
    EdSaldo.Text := '';
    EdSaldo.Enabled := False;
    RadioSaldo.Visible := False;
    RadioTasa.Visible := False;
    RadioPlazo.Visible := False;
    CmdAceptar.Enabled := True;

    with dmColocacion do
     begin
       IBDSclasificacion.Active := true;
       IBDSclasificacion.Last;
       IBDSclasificacion.First;
       IBDSlinea.Active := true;
       IBDSlinea.Last;
       IBDSlinea.First;
       IBDSinversion.Active := true;
       IBDSinversion.Last;
       IBDSinversion.First;
       IBDSrespaldo.Active := true;
       IBDSrespaldo.Last;
       IBDSrespaldo.First;
       IBDSgarantia.Active := true;
       IBDSgarantia.Last;
       IBDSgarantia.First;
       IBDSEstado.Active := True;
       IBDSEstado.Last;
       IBDSEstado.First;
     end;

     IBDStipocuota.Active := true;
     IBDStipocuota.Last;
     IBDStipocuota.First;
end;

procedure TfrmInformeColocacionesFiltrado.CBclasificacionEnter(
  Sender: TObject);
begin
        CBclasificacion.KeyValue := vClasificacion;
        CBclasificacion.DropDown;
end;

procedure TfrmInformeColocacionesFiltrado.CBclasificacionExit(
  Sender: TObject);
begin
        vClasificacion := CBclasificacion.KeyValue;
end;

procedure TfrmInformeColocacionesFiltrado.RClasificacionClick(
  Sender: TObject);
begin
        if RClasificacion.Checked then
         begin
           CBclasificacion.Enabled := True;
           CBclasificacion.SetFocus;
         end
        else
           CBclasificacion.Enabled := False;
end;

procedure TfrmInformeColocacionesFiltrado.RInversionClick(Sender: TObject);
begin
        if RInversion.Checked then
         begin
           CBinversion.Enabled := True;
           CBinversion.SetFocus;
         end
        else
         CBlinea.Enabled := False;
end;

procedure TfrmInformeColocacionesFiltrado.RLineaClick(Sender: TObject);
begin
        if RLinea.Checked then
         begin
           CBlinea.Enabled := True;
           CBlinea.SetFocus;
         end
        else
          CBlinea.Enabled := False;
end;

procedure TfrmInformeColocacionesFiltrado.RGarantiaClick(Sender: TObject);
begin
        if RGarantia.Checked then
         begin
           CBgarantia.Enabled := True;
           CBgarantia.SetFocus;
         end
        else
          CBgarantia.Enabled := False;
end;

procedure TfrmInformeColocacionesFiltrado.RTipoCuotaClick(Sender: TObject);
begin
        if RTipoCuota.Checked then
         begin
           CBtipocuota.Enabled := True;
           CBtipocuota.SetFocus;
         end
        else
           CBtipocuota.Enabled := False;
end;

procedure TfrmInformeColocacionesFiltrado.FechaClick(Sender: TObject);
begin
        if Fecha.Checked then begin
          Label7.Visible := True;
          EdFechaInicial.Visible := True;
          Label1.Visible := True;
          EdFechaFinal.Visible := True;
        end
        else begin
          Label7.Visible := False;
          EdFechaInicial.Visible := False;
          Label1.Visible := False;
          EdFechaFinal.Visible := False;
        end;

end;

procedure TfrmInformeColocacionesFiltrado.SaldoClick(Sender: TObject);
begin
        if Saldo.Checked then
         begin
           EdSaldo.Enabled := True;
           RadioSaldo.Visible := True;
           RadioSaldo.SetFocus;
         end
        else
         begin
           EdSaldo.Text := '';
           EdSaldo.Enabled := False;
         end;          
end;

procedure TfrmInformeColocacionesFiltrado.RTasaClick(Sender: TObject);
begin
        if RTasa.Checked then
         begin
           EdTasa.Enabled := True;
           RadioTasa.Visible := True;
           RadioTasa.SetFocus;
         end
        else
         begin
           EdTasa.Text := '';
           EdTasa.Enabled := False;
         end;
end;

procedure TfrmInformeColocacionesFiltrado.RadioSexoClick(Sender: TObject);
begin
        if RadioSexo.ItemIndex = 0 then
           Sexo := 'F'
        else if RadioSexo.ItemIndex = 1 then
           Sexo := 'M'
        else if RadioSexo.ItemIndex = 2 then
           Sexo := 'N';
end;

procedure TfrmInformeColocacionesFiltrado.CBlineaEnter(Sender: TObject);
begin
        CBlinea.KeyValue := vLinea;
        CBlinea.DropDown;
end;

procedure TfrmInformeColocacionesFiltrado.CBlineaExit(Sender: TObject);
begin
        vLinea := CBlinea.KeyValue;
end;

procedure TfrmInformeColocacionesFiltrado.CBinversionEnter(
  Sender: TObject);
begin
        CBinversion.KeyValue := vInversion;
        CBinversion.DropDown;
end;

procedure TfrmInformeColocacionesFiltrado.CBinversionExit(Sender: TObject);
begin
        vInversion := CBinversion.KeyValue;
end;

procedure TfrmInformeColocacionesFiltrado.CBgarantiaEnter(Sender: TObject);
begin
        CBgarantia.KeyValue := vGarantia;
        CBgarantia.DropDown;
end;

procedure TfrmInformeColocacionesFiltrado.CBgarantiaExit(Sender: TObject);
begin
        vGarantia := CBgarantia.KeyValue;
end;

procedure TfrmInformeColocacionesFiltrado.CBtipocuotaEnter(
  Sender: TObject);
begin
        CBtipocuota.KeyValue := vTipoCuota;
        CBtipocuota.DropDown;
end;

procedure TfrmInformeColocacionesFiltrado.CBtipocuotaExit(Sender: TObject);
begin
        vTipoCuota := CBtipocuota.KeyValue;
end;

procedure TfrmInformeColocacionesFiltrado.EdTasaEnter(Sender: TObject);
begin
        EdTasa.SelectAll;
end;

procedure TfrmInformeColocacionesFiltrado.EdTasaExit(Sender: TObject);
begin
        if EdTasa.Text <> '' then
           vTasa := StrToFloat(EdTasa.Text)
        else
           vTasa := 0;

        EdTasa.Text := FormatCurr('#0.00%',vTasa);
end;

procedure TfrmInformeColocacionesFiltrado.EdFechaInicialEnter(
  Sender: TObject);
begin
        EdFechaInicial.Date := Date;
end;

procedure TfrmInformeColocacionesFiltrado.EdFechaInicialExit(
  Sender: TObject);
begin
        vFechaInicial := EdFechaInicial.Date;
end;

procedure TfrmInformeColocacionesFiltrado.EdFechaFinalEnter(
  Sender: TObject);
begin
        EdFechaFinal.Date := Date;
end;

procedure TfrmInformeColocacionesFiltrado.EdFechaFinalExit(
  Sender: TObject);
begin
        vFechaFinal := EdFechaFinal.Date;
end;

procedure TfrmInformeColocacionesFiltrado.EdSaldoEnter(Sender: TObject);
begin
        EdSaldo.SelectAll;
end;

procedure TfrmInformeColocacionesFiltrado.EdSaldoExit(Sender: TObject);
begin
        if EdSaldo.Text <> '' then
         vSaldo := StrToCurr(EdSaldo.Text)
        else
         vSaldo := 0;

        EdSaldo.Text := FormatCurr('#,#0',vSaldo);
end;

procedure TfrmInformeColocacionesFiltrado.REstadoClick(Sender: TObject);
begin
        if REstado.Checked then
         begin
           CBEstado.Enabled := True;
           CBEstado.SetFocus;
         end
        else
          CBEstado.Enabled := False;
end;

procedure TfrmInformeColocacionesFiltrado.CBEstadoEnter(Sender: TObject);
begin
        CBEstado.KeyValue := vEstado;
        CBEstado.DropDown;
end;

procedure TfrmInformeColocacionesFiltrado.CBEstadoExit(Sender: TObject);
begin
        vEstado := CBEstado.KeyValue;
end;

procedure TfrmInformeColocacionesFiltrado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeColocacionesFiltrado.CmdNuevoClick(Sender: TObject);
begin
        inicializar;
end;

procedure TfrmInformeColocacionesFiltrado.RadioSaldoClick(Sender: TObject);
begin
        if RadioSaldo.ItemIndex = 0 then
           SignoSaldo := '>='
        else if RadioSaldo.ItemIndex = 1 then
           SignoSaldo := '<='
        else if RadioSaldo.ItemIndex = 2 then
           SignoSaldo := '=';

        EdSaldo.SetFocus;
end;

procedure TfrmInformeColocacionesFiltrado.RadioTasaClick(Sender: TObject);
begin
        if RadioTasa.ItemIndex = 0 then
           SignoTasa := '>='
        else if RadioTasa.ItemIndex = 1 then
           SignoTasa := '<='
        else if RadioTasa.ItemIndex = 2 then
           SignoTasa := '=';

        EdTasa.SetFocus;
end;

procedure TfrmInformeColocacionesFiltrado.EdPlazoEnter(Sender: TObject);
begin
        EdPlazo.SelectAll;
end;

procedure TfrmInformeColocacionesFiltrado.EdPlazoExit(Sender: TObject);
begin
        if EdPlazo.Text <> '' then
           vPlazo := StrToInt(EdPlazo.Text)
        else
           vPlazo := 0;

        EdPlazo.Text := IntToStr(vPlazo);
end;

procedure TfrmInformeColocacionesFiltrado.PlazoClick(Sender: TObject);
begin
        if Plazo.Checked then
         begin
           EdPlazo.Enabled := True;
           RadioPlazo.Visible := True;
           RadioPlazo.SetFocus;
         end
        else
         begin
           EdPlazo.Text := '';
           EdPlazo.Enabled := False;
         end;
end;

procedure TfrmInformeColocacionesFiltrado.RadioPlazoClick(Sender: TObject);
begin
        if RadioPlazo.ItemIndex = 0 then
           SignoPlazo := '>='
        else if RadioPlazo.ItemIndex = 1 then
           SignoPlazo := '<='
        else if RadioPlazo.ItemIndex = 2 then
           SignoPlazo := '=';

        EdPlazo.SetFocus;
end;

procedure TfrmInformeColocacionesFiltrado.PlazoExit(Sender: TObject);
begin
        if Plazo.Checked then
         begin
           EdPlazo.Enabled := True;
           RadioPlazo.Visible := True;
           RadioPlazo.SetFocus;
         end
        else
         begin
           EdPlazo.Text := '';
           EdPlazo.Enabled := False;
         end;
end;

procedure TfrmInformeColocacionesFiltrado.RTasaExit(Sender: TObject);
begin
        if RTasa.Checked then
         begin
           EdTasa.Enabled := True;
           RadioTasa.Visible := True;
           RadioTasa.SetFocus;
         end
        else
         begin
           EdTasa.Text := '';
           EdTasa.Enabled := False;
         end;
end;

procedure TfrmInformeColocacionesFiltrado.SaldoExit(Sender: TObject);
begin
        if Saldo.Checked then
         begin
           EdSaldo.Enabled := True;
           RadioSaldo.Visible := True;
           RadioSaldo.SetFocus;
         end
        else
         begin
           EdSaldo.Text := '';
           EdSaldo.Enabled := False;
         end;
end;

end.
