unit UnitInformeAseguradoraCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, IBSQL, pr_Common,pr_parser,
  pr_TxClasses, DB, IBCustomDataSet, IBQuery, DBClient, Math,DateUtils, UnitDmGeneral;

type
  TfrmInformeAseguradoraCartera = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    Label7: TLabel;
    EdFechaInforme: TDateTimePicker;
    GrupoTipoInforme: TGroupBox;
    PersonasJuridicas: TCheckBox;
    MaximoAsegurable: TCheckBox;
    EdadMaxima: TCheckBox;
    Mora: TCheckBox;
    RPersonasJuridicas: TprTxReport;
    IBQTabla: TIBQuery;
    Plazo: TCheckBox;
    IBEstado: TIBQuery;
    RPlazo: TprTxReport;
    RMaximoAsegurable: TprTxReport;
    DSEdad: TClientDataSet;
    DSEdadID_COLOCACION: TStringField;
    DSEdadNUMERO_CUENTA: TIntegerField;
    DSEdadFECHA_DESEMBOLSO: TDateField;
    DSEdadID_PERSONA: TStringField;
    DSEdadASOCIADO: TStringField;
    DSEdadVALOR: TCurrencyField;
    DSEdadPLAZO: TIntegerField;
    DSEdadTASA: TFloatField;
    DSEdadSALDO: TCurrencyField;
    DSEdadFECHA_CAPITAL: TDateField;
    DSEdadFECHA_INTERES: TDateField;
    DSEdadESTADO: TStringField;
    DSEdadFECHA_NACIMIENTO: TDateField;
    DSEdadEDAD: TIntegerField;
    REdadMaxima: TprTxReport;
    DSEdadEDAD1: TIntegerField;
    RMora: TprTxReport;
    procedure PersonasJuridicasClick(Sender: TObject);
    procedure MoraClick(Sender: TObject);
    procedure EdadMaximaClick(Sender: TObject);
    procedure MaximoAsegurableClick(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EdFechaInformeExit(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure PlazoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeAseguradoraCartera: TfrmInformeAseguradoraCartera;
  dmGeneral: TdmGeneral;
  FechaCorte : TDate;
  EdadMax:Double;
  DiasMora:Integer;
  MontoAsegurable:Currency;
  TotalCartera:Currency;
implementation

{$R *.dfm}

uses UnitGlobalescol,UnitGlobales,UnitVistaPreliminar;

procedure TfrmInformeAseguradoraCartera.PersonasJuridicasClick(
  Sender: TObject);
begin
        if PersonasJuridicas.Checked then
         begin
           CmdAceptar.Enabled := True;
           Mora.Checked := False;
           EdadMaxima.Checked := False;
           MaximoAsegurable.Checked := False;
           CmdAceptar.SetFocus;
         end;
end;

procedure TfrmInformeAseguradoraCartera.MoraClick(Sender: TObject);
begin
        if Mora.Checked then
         begin
           CmdAceptar.Enabled := True;
           PersonasJuridicas.Checked := False;
           EdadMaxima.Checked := False;
           MaximoAsegurable.Checked := False;
           DiasMora := StrToInt(InputBox('Mora','Digite el Número de Dias en Mora','0'));
           CmdAceptar.SetFocus;
         end;
end;

procedure TfrmInformeAseguradoraCartera.EdadMaximaClick(Sender: TObject);
begin
        if EdadMaxima.Checked then
         begin
           CmdAceptar.Enabled := True;
           PersonasJuridicas.Checked := False;
           Mora.Checked := False;
           MaximoAsegurable.Checked := False;
           EdadMax := StrToInt(InputBox('Edad','Digite la Edad Máxima Asegurable','0'));
//           EdadMax := (EdadMax / 4) + (EdadMax * 365);
           CmdAceptar.SetFocus;           
         end;
end;

procedure TfrmInformeAseguradoraCartera.MaximoAsegurableClick(
  Sender: TObject);
begin
        if MaximoAsegurable.Checked then
         begin
           CmdAceptar.Enabled := True;
           PersonasJuridicas.Checked := False;
           Mora.Checked := False;
           EdadMaxima.Checked := False;
           MontoAsegurable := StrToCurr(InputBox('Maximo Asegurable','Digite el Monto Máximo Asegurable','0'));
           CmdAceptar.SetFocus;           
         end;
end;

procedure TfrmInformeAseguradoraCartera.Inicializar;
begin
        EdFechaInforme.Date := fFechaActual;
        CmdAceptar.Enabled := False;
        CmdNuevo.Visible := False;
        PersonasJuridicas.Checked := False;
        Mora.Checked := False;
        EdadMaxima.Checked := False;
        MaximoAsegurable.Checked := False;

        FechaCorte := 0;
        EdadMax := 0;
        DiasMora := 0;
        MontoAsegurable := 0;
        TotalCartera := 0;

end;

procedure TfrmInformeAseguradoraCartera.CmdAceptarClick(Sender: TObject);
var TotalDeduccion: Currency;
Edad : Integer;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        if PersonasJuridicas.Checked then begin
           with IBQTabla do begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_PERSONA, "gen$agencia".DESCRIPCION_AGENCIA,');
            SQL.Add('"gen$persona".NOMBRE, "gen$persona".PRIMER_APELLIDO,');
            SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
            SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
            SQL.Add('"col$lineas".DESCRIPCION_LINEA,"col$inversion".DESCRIPCION_INVERSION,');
            SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
            SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".VALOR_DESEMBOLSO,');
            SQL.Add('("col$colocacion".TASA_INTERES_CORRIENTE + "col$colocacion".PUNTOS_INTERES) as TASA,');
            SQL.Add('"col$colocacion".PLAZO_COLOCACION, "col$tasavariables".DESCRIPCION_TASA,');
            SQL.Add('"col$colocacion".FECHA_CAPITAL,"col$colocacion".FECHA_INTERES,');
            SQL.Add('"col$colocacion".NUMERO_CUENTA, ("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) as SALDO,');
            SQL.Add('"col$colocacion".ID_EVALUACION, "col$colocacion".ID_CATEGORIA,');
            SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,"col$causaciondiaria".DEUDA');
            SQL.Add('FROM');
            SQL.Add('"col$colocacion" LEFT JOIN "gen$persona" ON ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
            SQL.Add('INNER JOIN "gen$tiposidentificacion" ON ("gen$persona".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
            SQL.Add('INNER JOIN "gen$agencia" ON ("col$colocacion".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
            SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
            SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
            SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION)');
            SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO)');
            SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
            SQL.Add('LEFT OUTER JOIN "col$tasavariables" ON ("col$colocacion".ID_INTERES = "col$tasavariables".ID_INTERES)');
            SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
            SQL.Add('LEFT JOIN "gen$empleado" ON ("col$colocacion".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
            SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
            SQL.Add('INNER JOIN "col$causaciondiaria" ON ("col$colocacion".ID_AGENCIA = "col$causaciondiaria".ID_AGENCIA and "col$colocacion".ID_COLOCACION = "col$causaciondiaria".ID_COLOCACION)');
            SQL.Add('where');
            SQL.Add('("col$colocacion".ID_IDENTIFICACION = 4 or "col$colocacion".ID_IDENTIFICACION = 7) and');
            SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION <= 2 and "col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
            ParamByName('FECHA_CORTE').AsDate := FechaCorte;
            Open;

            Empleado;
            RPersonasJuridicas.Variables.ByName['empresa'].AsString := Empresa;
            RPersonasJuridicas.Variables.ByName['empleado'].AsString := Nombres + ' ' + Apellidos;
            RPersonasJuridicas.Variables.ByName['nit'].AsString := Nit;
            RPersonasJuridicas.Variables.ByName['hoy'].AsDateTime := fFechaActual;

            if RPersonasJuridicas.PrepareReport then
             begin
               frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
               frmVistaPreliminar.Reporte := RPersonasJuridicas;
               frmVistaPreliminar.ShowModal;
             end;
            Close;
           end;
        end
        else
        if Mora.Checked then begin
           with IBQTabla do begin
            Close;
            SQL.Clear;
            SQL.Add('select');
            SQL.Add('"col$causaciondiaria".ID_AGENCIA,"col$causaciondiaria".ID_COLOCACION,"col$causaciondiaria".FECHA_DESEMBOLSO,');
            SQL.Add('"col$causaciondiaria".ID_PERSONA,"col$causaciondiaria".VALOR,"col$causaciondiaria".DEUDA,"col$causaciondiaria".ID_EDAD_ACT,');
            SQL.Add('"col$causaciondiaria".ID_ARRASTRE,"col$causaciondiaria".ID_ESTADO,"col$causaciondiaria".FECHA_CAPITAL,"col$causaciondiaria".DIAS,');
            SQL.Add('"col$causaciondiaria".FECHA_INTERES,"col$colocacion".NUMERO_CUENTA,"col$colocacion".VALOR_CUOTA,');
            SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,"gen$agencia".DESCRIPCION_AGENCIA,"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
            SQL.Add('"col$colocacion".PLAZO_COLOCACION,("col$colocacion".TASA_INTERES_CORRIENTE + "col$colocacion".PUNTOS_INTERES) as TASA,');
            SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,"col$colocacion".ID_CATEGORIA,"col$colocacion".ID_EVALUACION,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE');
            SQL.Add('from "col$causaciondiaria"');
            SQL.Add('inner join "col$colocacion" on ("col$causaciondiaria".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$causaciondiaria".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
            SQL.Add('inner join "gen$agencia" on ("col$causaciondiaria".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
            SQL.Add('inner join "col$estado" on ("col$causaciondiaria".ID_ESTADO = "col$estado".ID_ESTADO_COLOCACION)');
            SQL.Add('inner join "gen$persona" on ("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
            SQL.Add('where DIAS > :DIAS and FECHA_CORTE = :FECHA');
            ParamByName('DIAS').AsInteger := DiasMora;
            ParamByName('FECHA').AsDate := FechaCorte;
            Open;

            Empleado;
            RMora.Variables.ByName['empresa'].AsString := Empresa;
            RMora.Variables.ByName['empleado'].AsString := Nombres + ' ' + Apellidos;
            RMora.Variables.ByName['nit'].AsString := Nit;
            RMora.Variables.ByName['hoy'].AsDateTime := fFechaActual;
            RMora.Variables.ByName['dias'].AsString := IntToStr(DiasMora);

            if RMora.PrepareReport then
             begin
               frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
               frmVistaPreliminar.Reporte := RMora;
               frmVistaPreliminar.ShowModal;
             end;
            Close;
           end;
        end
        else
        if Plazo.Checked then begin
           with IBQTabla do begin
            Close;
            SQL.Clear;
            SQL.Add('select');
            SQL.Add('"col$causaciondiaria".ID_AGENCIA,"col$causaciondiaria".ID_COLOCACION,"col$causaciondiaria".FECHA_DESEMBOLSO,');
            SQL.Add('"col$causaciondiaria".ID_PERSONA,"col$causaciondiaria".VALOR,"col$causaciondiaria".DEUDA,"col$causaciondiaria".ID_EDAD,');
            SQL.Add('"col$causaciondiaria".ID_ARRASTRE,"col$causaciondiaria".ID_ESTADO,"col$causaciondiaria".FECHA_CAPITAL,"col$causaciondiaria".DIAS,');
            SQL.Add('"col$causaciondiaria".FECHA_INTERES,"col$colocacion".NUMERO_CUENTA,"col$colocacion".VALOR_CUOTA,');
            SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,"gen$agencia".DESCRIPCION_AGENCIA,"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
            SQL.Add('"col$colocacion".ID_CLASIFICACION,"col$colocacion".PLAZO_COLOCACION,("col$colocacion".TASA_INTERES_CORRIENTE + "col$colocacion".PUNTOS_INTERES) as TASA,');
            SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,"col$colocacion".ID_CATEGORIA,"col$colocacion".ID_EVALUACION,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE');
            SQL.Add('from "col$causaciondiaria"');
            SQL.Add('inner join "col$colocacion" on ("col$causaciondiaria".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$causaciondiaria".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
            SQL.Add('inner join "gen$agencia" on ("col$causaciondiaria".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
            SQL.Add('inner join "col$estado" on ("col$causaciondiaria".ID_ESTADO = "col$estado".ID_ESTADO_COLOCACION)');
            SQL.Add('inner join "gen$persona" on ("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
            SQL.Add('where "col$colocacion".PLAZO_COLOCACION >:DIAS and "col$causaciondiaria".FECHA_CORTE = :FECHA');
            SQL.Add('and "col$colocacion".ID_ESTADO_COLOCACION <= 3 and "col$colocacion".ID_CLASIFICACION <= 2 and "col$colocacion".ID_GARANTIA = 2');
            ParamByName('DIAS').AsInteger := 1081;
            ParamByName('FECHA').AsDate := FechaCorte;
            Open;

            with IBEstado do begin
             Close;
             SQL.Clear;
             SQL.Add('select');
             SQL.Add('sum("col$causaciondiaria".DEUDA) as DEUDA,');
             SQL.Add('COUNT("col$causaciondiaria".ID_ESTADO) as NUMERO,');
             SQL.Add('"col$causaciondiaria".ID_ESTADO,');
             SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
             SQL.Add('from "col$causaciondiaria"');
             SQL.Add('inner join "col$colocacion" on ("col$causaciondiaria".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$causaciondiaria".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
             SQL.Add('inner join "col$estado" on ("col$causaciondiaria".ID_ESTADO = "col$estado".ID_ESTADO_COLOCACION)');
             SQL.Add('where "col$colocacion".PLAZO_COLOCACION >:PLAZO and "col$causaciondiaria".FECHA_CORTE = :FECHA');
             SQL.Add('and "col$colocacion".ID_ESTADO_COLOCACION <= 3 and "col$colocacion".ID_CLASIFICACION <= 2');
             SQL.Add('and "col$colocacion".ID_GARANTIA = 2');
             SQL.Add('group by "col$causaciondiaria".ID_ESTADO,"col$estado".DESCRIPCION_ESTADO_COLOCACION');
             ParamByName('PLAZO').AsInteger := 1081;
             ParamByName('FECHA').AsDate := FechaCorte;
             Open;

            Empleado;
            RPlazo.Variables.ByName['empresa'].AsString := Empresa;
            RPlazo.Variables.ByName['empleado'].AsString := Nombres + ' ' + Apellidos;
            RPlazo.Variables.ByName['nit'].AsString := Nit;
            RPlazo.Variables.ByName['hoy'].AsDateTime := fFechaActual;
            RPlazo.Variables.ByName['plazo'].AsString := IntToStr(1081);

            if RPlazo.PrepareReport then
             begin
               frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
               frmVistaPreliminar.Reporte := RPlazo;
               frmVistaPreliminar.ShowModal;
             end;
            Close;
            end;
           end;
        end
        else
        if EdadMaxima.Checked then begin
           with IBQTabla do begin
            Close;
            SQL.Clear;
            SQL.Add('select');
            SQL.Add('"gen$persona".FECHA_NACIMIENTO,');
            SQL.Add('"col$causaciondiaria".ID_AGENCIA,"col$causaciondiaria".ID_COLOCACION,"col$colocacion".ID_EVALUACION,');
            SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".NUMERO_CUENTA,"col$colocacion".ID_IDENTIFICACION,');
            SQL.Add('"col$colocacion".ID_PERSONA,"col$colocacion".VALOR_DESEMBOLSO,"col$colocacion".PLAZO_COLOCACION,');
            SQL.Add('("col$colocacion".TASA_INTERES_CORRIENTE + "col$colocacion".PUNTOS_INTERES) as TASA,"col$colocacion".FECHA_CAPITAL,');
            SQL.Add('"col$colocacion".FECHA_INTERES,"col$colocacion".ID_CATEGORIA,"col$causaciondiaria".DEUDA,');
            SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,"col$estado".DESCRIPCION_ESTADO_COLOCACION,"col$causaciondiaria".ID_ESTADO,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
            SQL.Add('"gen$persona".FECHA_NACIMIENTO, ("col$colocacion".FECHA_DESEMBOLSO - "gen$persona".FECHA_NACIMIENTO) / 365.25 as EDAD,');
            SQL.Add('("col$causaciondiaria".FECHA_CORTE - "gen$persona".FECHA_NACIMIENTO) / 365.25  as EDAD1');
            SQL.Add('from "col$causaciondiaria"');
            SQL.Add('inner join "gen$agencia" on ("col$causaciondiaria".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
            SQL.Add('inner join "col$estado" on ("col$causaciondiaria".ID_ESTADO = "col$estado".ID_ESTADO_COLOCACION)');
            SQL.Add('inner join "gen$persona" on ("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
            SQL.Add('inner join "col$colocacion" on ("col$causaciondiaria".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$causaciondiaria".ID_COLOCACION= "col$colocacion".ID_COLOCACION)');
            SQL.Add('where');
            SQL.Add('("col$colocacion".FECHA_DESEMBOLSO - "gen$persona".FECHA_NACIMIENTO)/365.25  >= :ANOS and "col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
            ParamByName('ANOS').AsFloat := EdadMax;
            ParamByName('FECHA_CORTE').AsDate := FechaCorte;
            Open;

            while not Eof do begin
//              Edad := DiasEntre(IBQTabla.FieldByName('FECHA_NACIMIENTO').AsDateTime,EdFechaInforme.Date);
//              Edad := YearsBetween(IBQTabla.FieldByName('FECHA_NACIMIENTO').AsDateTime,EdFechaInforme.Date);
//              if Edad >= 70 then begin
                DSEdad.Append;
                DSEdad.FieldByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                DSEdad.FieldByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                DSEdad.FieldByName('FECHA_DESEMBOLSO').AsDateTime := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
                DSEdad.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                DSEdad.FieldByName('ASOCIADO').AsString := FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString;
                DSEdad.FieldByName('VALOR').AsCurrency := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                DSEdad.FieldByName('PLAZO').AsInteger := FieldByName('PLAZO_COLOCACION').AsInteger;
                DSEdad.FieldByName('TASA').AsFloat := FieldByName('TASA').AsFloat;
                DSEdad.FieldByName('SALDO').AsCurrency := FieldByName('DEUDA').AsCurrency;
                DSEdad.FieldByName('FECHA_CAPITAL').AsDateTime := FieldByName('FECHA_CAPITAL').AsDateTime;
                DSEdad.FieldByName('FECHA_INTERES').AsDateTime := FieldByName('FECHA_INTERES').AsDateTime;
                DSEdad.FieldByName('ESTADO').AsString := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                DSEdad.FieldByName('FECHA_NACIMIENTO').AsDateTime := FieldByName('FECHA_NACIMIENTO').AsDateTime;
                DSEdad.FieldByName('EDAD').AsFloat := int(FieldByName('EDAD').AsFloat);
                DSEdad.FieldByName('EDAD1').AsFloat := int(FieldByName('EDAD1').asfloat);
                DSEdad.Post;
           //   end;
              Next;
            end;

            Empleado;
            REdadMaxima.Variables.ByName['empresa'].AsString := Empresa;
            REdadMaxima.Variables.ByName['empleado'].AsString := Nombres + ' ' + Apellidos;
            REdadMaxima.Variables.ByName['nit'].AsString := Nit;
            REdadMaxima.Variables.ByName['hoy'].AsDateTime := fFechaActual;
            REdadMaxima.Variables.ByName['edad'].AsString := FloatToStr(int(EdadMax/365));

            if REdadMaxima.PrepareReport then
             begin
               frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
               frmVistaPreliminar.Reporte := REdadMaxima;
               frmVistaPreliminar.ShowModal;
             end;
            Close;
           end;
        end
        else
        if MaximoAsegurable.Checked then begin
           TotalDeduccion := 0;
           with IBQTabla do begin
            Close;
            SQL.Clear;
            SQL.Add('select');
            SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
            SQL.Add('"col$causaciondiaria".ID_PERSONA,');
            SQL.Add('count(*) as TOTAL,');
            SQL.Add('sum("col$causaciondiaria".VALOR) as DESEMBOLSOS,');
            SQL.Add('sum("col$causaciondiaria".DEUDA) as DEUDAS,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO,');
            SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
            SQL.Add('"gen$persona".NOMBRE,');
            SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA as AGENCIA');
            SQL.Add('from "col$causaciondiaria"');
            SQL.Add('inner join "gen$persona" on ("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
            SQL.Add('inner join "gen$agencia" on ("col$causaciondiaria".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
            SQL.Add('where "col$causaciondiaria".FECHA_CORTE = :FECHA and');
            SQL.Add('("col$causaciondiaria".ID_IDENTIFICACION <> 4 and "col$causaciondiaria".ID_IDENTIFICACION <> 7)');
            SQL.Add('group by "col$causaciondiaria".ID_IDENTIFICACION, "col$causaciondiaria".ID_PERSONA,"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE,"gen$agencia".DESCRIPCION_AGENCIA');
            SQL.Add('having sum("col$causaciondiaria".DEUDA) > :DEUDA');
            ParamByName('FECHA').AsDate := FechaCorte;
            ParamByName('DEUDA').AsCurrency := MontoAsegurable;
            Open;
            while not Eof do begin
             TotalDeduccion := TotalDeduccion + (FieldByName('DEUDAS').AsCurrency - MontoAsegurable);
             Next;
            end;

            Empleado;
            RMaximoAsegurable.Variables.ByName['empresa'].AsString := Empresa;
            RMaximoAsegurable.Variables.ByName['empleado'].AsString := Nombres + ' ' + Apellidos;
            RMaximoAsegurable.Variables.ByName['nit'].AsString := Nit;
            RMaximoAsegurable.Variables.ByName['hoy'].AsDateTime := fFechaActual;
            RMaximoAsegurable.Variables.ByName['monto'].AsDouble := MontoAsegurable;
            RMaximoAsegurable.Variables.ByName['TotalD'].AsDouble := TotalDeduccion;

            if RMaximoAsegurable.PrepareReport then
             begin
               frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
               frmVistaPreliminar.Reporte := RMaximoAsegurable;
               frmVistaPreliminar.ShowModal;
             end;
            Close;
           end;
        end;
        CmdNuevo.Visible := True;
end;

procedure TfrmInformeAseguradoraCartera.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeAseguradoraCartera.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeAseguradoraCartera.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmInformeAseguradoraCartera.EdFechaInformeExit(
  Sender: TObject);
begin
        FechaCorte := EdFechaInforme.Date;
end;

procedure TfrmInformeAseguradoraCartera.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;


procedure TfrmInformeAseguradoraCartera.PlazoClick(Sender: TObject);
begin
        if Plazo.Checked then
         begin
           CmdAceptar.Enabled := True;
           PersonasJuridicas.Checked := False;
           EdadMaxima.Checked := False;
           MaximoAsegurable.Checked := False;
           Mora.Checked := False;
           CmdAceptar.SetFocus;
         end;
end;

procedure TfrmInformeAseguradoraCartera.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQTabla.Database := dmGeneral.IBDatabase1;
        IBEstado.Database := dmGeneral.IBDatabase1;
        IBQTabla.Transaction := dmGeneral.IBTransaction1;
        IBEstado.Transaction := dmGeneral.IBTransaction1;

end;

procedure TfrmInformeAseguradoraCartera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

end.
