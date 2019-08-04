unit UnitConsolidarData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient,sdXmlDocuments, DB, Math,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, JvPanel, JvLabel, DBClient,
  FR_DSet, FR_DBSet, FR_Class,IBSQL, DateUtils, JvProgressBar,StrUtils,
  IBDatabase, JvBlinkingLabel, DBXpress, FMTBcd, SqlExpr, Provider;
type
  Deuda = record
    Valor:Currency;
    Dias:Integer;
  end;
type
  TfrmConsolidarData = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DTfecha: TDateTimePicker;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox5: TCheckBox;
    Panel2: TPanel;
    CmdDatacredito: TBitBtn;
    CmdEnviar: TBitBtn;
    CmdCerrar: TBitBtn;
    BTimportar: TBitBtn;
    BTelimina: TBitBtn;
    IBQuery11: TIBQuery;
    GroupBox2: TGroupBox;
    BarClientesD: TProgressBar;
    CmdCifin: TBitBtn;
    GroupBox5: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox6: TCheckBox;
    GroupBox6: TGroupBox;
    BarCifin: TProgressBar;
    Panel3: TPanel;
    LbClientesD: TLabel;
    CDDatos: TClientDataSet;
    DPDatos: TDataSetProvider;
    GroupBox3: TGroupBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Panel4: TPanel;
    LbCarteraD: TLabel;
    Panel5: TPanel;
    LBCifin: TLabel;
    GroupBox4: TGroupBox;
    BarCarteraD: TProgressBar;
    LbExcluidas: TJvBlinkingLabel;
    procedure BTimportarClick(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure BTeliminaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdDatacreditoClick(Sender: TObject);
    procedure DTfechaExit(Sender: TObject);
    procedure CmdCifinClick(Sender: TObject);
  private
    XmlPet,XmlRes: TsdXmlDocument;
    Nodo,Nodo1:TXmlNode;
    Size:Integer;
    AStream:TMemoryStream;
    sentencia :string;
    host_server: string;
    puerto_server: Integer;
    procedure ExtraerRemoto(Agencia: integer);
    procedure ExtraerLocal;
    procedure ClientesDatacredito;
    procedure EncabezadoDatacreditoClientes;
    procedure FinDatacreditoClientes;
    procedure EncabezadoDatacreditoCartera;
    procedure FinDatacreditoCartera;
    procedure EncabezadoCifin;
    procedure ClientesCifin;
    procedure FinCifin;
    procedure EliminarExcluidas;
    procedure CarteraDatacredito;
    function Novedad(Dias, Estado: Integer): String;

    { Private declarations }
  public
    { Public declarations }
  end;

type RegistroCD = Record  //Clientes Datacredito
    TpIden:string; // * 01
    Identificacion:string; // * 11
    Nombre:string; // * 45
    FExpDto:string;
    LExpDto:string;
    FNacim:string; // * 06
    ActEco:string;
    Ciiu:string;
    Estrato:string;
    PCargo:string;
    FActPCargo:string;
    ECivil:string;
    FActECivil:string;
    NEstudio:string;
    FActNEstudio:string;
    Ingresos:string;
    FActIngresos:string;
    Activos:string;
    Pasivos:string;
    FBalance:String;
    NitEmpleador:string;
    NEmpleador:string;
    FIngEmpresa:string;
    FActEmpleador:string;
    TContrato:string;
    FActTContrato:string;
    OpIntern:string;
    FActOpIntern:string;
    STitular:string;
    FMayor:string;
    FActFMayor:string;
    Filler:string;
end;

type RegistroMCD = Record  //Maestro Cartera Datacredito
    TpIden:string; // 01
    Identificacion:string; // 11
    Numero:string; // 18
    Nombre:string; // 45
    STitular:string; //  1
    FApertura:string; // 08
    FVencim:string; // 08
    Calidad:string; // 02
    TpObli:string; // 01
    SHipot:string; // 01
    FSHipot:string; // 08
    TContrato:string; // 01
    FoPago:string; // 01
    PePago:string; // 01
    Novedad:string; // 02
    EOrigCta:string; // 01
    FEOrigCta:string; // 08
    ECuenta:string; // 02
    FECuenta:string; // 08
    EPlastico:string; // 01
    FEPlastico:string; // 08
    Adjetivo:string; // 01
    FAdjetivo:string; // 08
    CTarjeta:string; // 01
    Franquicia:string; // 01
    NomMarPriv:string; // 30
    TpMon:string; // 01
    TpGar:string; // 01
    Califi:string; // 02
    PIncump:string; // 03
    EdMora:string; // 03
    VInicial:string; // 11
    VSaldo:string; // 11
    VDisp:string; // 11
    VCuota:string; // 11
    VMora:string; // 11
    TCuotas:string; // 03
    CuotasPag:string; // 03
    CuotasMora:string; // 03
    CPerman:string; // 03
    FCPerman:string; // 08
    FLimPago:string; // 08
    FPago:string; // 08
    Oficina:string; // 30
    CiuRad:string; // 20
    CodCiuRad:string; // 08
    CiuRes:string;  // 20
    CodCiuRes:string; // 08
    DptoRes:string; // 20
    DirRes:string; // 60
    TelRes:string; // 12
    CiuLab:string; // 20
    CodCiuLab:string; // 08
    DptoLab:string; // 20
    DirLab:string; // 60
    TelLab:string; // 12
    CiuCor:string; // 20
    CodCiuCor:string; // 08
    DptoCor:string; // 20
    DirCor:string; // 60
    Email:string; // 60
    Celular:string; // 12
    SDestino:string; // 06
    NumTarjeta:string; // 18
    DetGarantia:string; // 01
    Blanco:string // 18
end;

type Registro1 = Record    // Control Cifin
    TRegistro:string; // * 1 N
    TProducto:string; // * 2 N
    TEntidad:string; // * 3 N
    CEntidad:string; // * 3 N
    Reservado:string; // * 10 N
    TipoReporte:string; // * 2 N
    FCorte:string; // * 8 N
end;   // 29

type Registro2 = Record     // Maestro Cifin   777 caracteres
    TRegistro:string; // * 1 N
    TIden:string; // * 2 N
    Identificacion:string; // * 15 A
    Nombre:string; // * 60 A
    Reserva:string; // * 2
    FechaLimitePago:string;  // * 8
    Numero:string;
    CodSuc:string; // * 6 A
    Calidad:string; // * 1 A
    Califi:string; // * 2 A
    EstadoTit:string; // * 2
    Estado:string; // * 2 N
    EdMora:string; // * 2 N
    AnosMora:string;
    FechaC:string; // * 8 F
    FInicial:string; // * 8 F
    FTermi:string; // * 8 F
    FExig:string;
    FPres:string;
    FUPago:string; // * 8  Fecha de Pago F
    ModoExt:string;
    TipoPago:string;
    PePago:string; // * 2 periodo de pago N
    ProbNoPago:string; // * 3 N - 0-100
    CuotasPag:string;
    CuotasPac:string;
    CuotasMora:string;
    ValIni:string; // * 12 N
    ValMora:string;
    VSaldo:string; // * 12 N
    VCuota:string; // * 12 N
    VCargoF:string;
    LineaC:string; // * 3 N
    ClauPerm:string;
    TipoCon:string;
    EstadoCon:string;
    TerVigCon:string;
    MesesCon:string;
    NJuridica:string; // * 3 N
    ModalC:string; // * 2 N
    TpMone:string; // * 2 N
    TpGar:string; // * 2 N
    VGar:string; // * 12 N
    Reest:string;
    NatReest:string; // * 2 N
    NumReest:string; // * 3 N
    CamposTarj:string; // 33 Espacios
    DirCasa:string;
    TelCasa:string;
    CodCiuCasa:string;
    CiuCasa:string;
    CodDptoCasa:string;
    DptoCasa:string;
    Empresa:string;
    DirEmpresa:string;
    TelEmpresa:string;
    CodCiuEmp:string;
    CiuEmp:string;
    CodDptoEmp:String;
    DptoEmp:string;
    Relleno:string;
end;

var
  frmConsolidarData: TfrmConsolidarData;
  SumaNovedad:Integer;
  SumaRegistros:Integer;
  MesCorteAct:string;
  SumaObligaciones:Integer;
  SumaIdentificacion:double;
  LineaF, LineaE:string;
  LineaEncDataClientes,LineaFinDataClientes:string;
  LineaEncDataCartera,LineaFinDataCartera:string;
  DAgencia:string;
  Dia:Integer;
  PlanoD,PlanoC,PlanoMC:TextFile;
  PlanoEncDataClientes,PlanoMovDataClientes:TStringList;
  PlanoEncDataCartera,PlanoMovDataCartera:TStringList;
  PlanoEncCifin,PlanoMovCifin:TStringList;
implementation

uses UnitPantallaProgreso, UnitGlobalesCol, UnitGlobales, UnitdmGeneral;

{$R *.dfm}

procedure TfrmConsolidarData.BTimportarClick(Sender: TObject);
var
SQLQuery1:TIBQuery;
begin
        LbExcluidas.Visible := True;
        LbExcluidas.Caption := 'Por Favor Espere ... Eliminando Excluidas';
        Application.ProcessMessages;
        EliminarExcluidas;
        LbExcluidas.Visible := False;
        BTimportar.Enabled := False;
        CmdDatacredito.Enabled := True;
        CmdCifin.Enabled := True;
end;

procedure TfrmConsolidarData.ExtraerRemoto(Agencia: integer);
var     cadena :String;
        Astream1 :TMemoryStream;
        j,i :Integer;
        AList,AListCampos:TList;
        SQLQuery1,SQLQuery2 :TIBQuery;
begin

{        DBpath1 := dbpath1 + '0' + IntToStr(Agencia) + FormatCurr('00',MonthOf(DTfecha.DateTime)) + FormatCurr('0000',YearOf(DTfecha.DateTime)) + '/';
        Database.DataBaseName := DBserver + ':' + DBpath1 + DBname;
        Database.Params.Values['lc_ctype'] := 'ISO8859_1';
        Database.Params.Values['User_Name'] := 'SYSDBA';
        Database.Params.Values['PassWord'] := 'masterkey';
        Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
        try
         Database.Connected := True;
        except
        raise;
        end;

        SQLQuery1 := TIBQuery.Create(nil);
        SQLQuery1.Transaction := Transaction;

        SQLQuery1.SQL.Clear;
        SQLQuery1.SQL.Add(sentencia);
        SQLQuery1.Open;
        SQLQuery1.Last;
        SQLQuery1.First;
        if Agencia = 1 then
         begin
           BarOcana.Min := 0;
           BarOcana.Max := SQLQuery1.RecordCount;
           BarOcana.Position := 0;
         end
        else if Agencia = 2 then
         begin
           BarAbrego.Min := 0;
           BarAbrego.Max := SQLQuery1.RecordCount;
           BarAbrego.Position := 0;
         end
        else if Agencia = 3 then
         begin
           BarConvencion.Min := 0;
           BarConvencion.Max := SQLQuery1.RecordCount;
           BarConvencion.Position := 0;
         end
        else if Agencia = 4 then
         begin
           BarAguachica.Min := 0;
           BarAguachica.Max := SQLQuery1.RecordCount;
           BarAguachica.Position := 0;
         end;

        while not SQLQuery1.Eof do
        begin
          if Agencia = 1 then
            BarOcana.Position := SQLQuery1.RecNo
          else if Agencia = 2 then
            BarAbrego.Position := SQLQuery1.RecNo
          else if Agencia = 3 then
            BarConvencion.Position := SQLQuery1.RecNo
          else if Agencia = 4 then
            BarAguachica.Position := SQLQuery1.RecNo;

          Application.ProcessMessages;

          SQLQuery2.Create(nil);
          SQLQuery2.Transaction := dmGeneral.IBTransaction1;

          with SQLQuery2 do
          begin
            SQL.Clear;
            SQL.Add('INSERT INTO "col$centralriesgotmp" (ID_AGENCIA, ID_COLOCACION, TIPO_IDENTIFICACION, ID_PERSONA, NOMBREDATA, NOMBRECIFIN,');
            SQL.Add('FECHA_EXP_DOC, COD_LUGAR_EXP_DOC, FECHA_NACIMIENTO, CIIU, ESTRATO, PERSONA_A_CARGO, FECHA_ACT_DATOS, ESTADO_CIVIL,');
            SQL.Add('NIVEL_ESTUDIOS, INGRESOS, ACTIVOS, PASIVOS, FECHA_BALANCE, NOMBRE_EMPLEADOR, FECHA_ING_EMPRESA, TIPO_CONTRATO, CLASIFICACION,');
            SQL.Add('CALIFICACION, ESTADO, DIASMORA, FECHA_DESEMBOLSO, FECHA_VENCIMIENTO, FECHA_EXIGIBILIDAD, FECHA_PRESCRIPCION, FECHA_PAGO, PERIOCIDAD_PAGO,');
            SQL.Add('CUOTAS_PAGADAS, CUOTAS_TOTAL, CUOTAS_MORA, VALOR, SALDO, VALOR_CUOTA, VALOR_MORA, ID_GARANTIA, VALOR_GARANTIA, FECHA_LIMITE_PAGO,');
            SQL.Add('COD_CIUDAD_RAD, NOM_CIUDAD_RAD, COD_CIUDAD_RES, NOM_CIUDAD_RES, COD_DPTO_RES, NOM_DPTO_RES, DIRECCION_RES, TELEFONO_RES, COD_CIUDAD_LAB,');
            SQL.Add('NOM_CIUDAD_LAB, COD_DPTO_LAB, NOM_DPTO_LAB, DIRECCION_LAB, TELEFONO_LAB, COD_CIUDAD_COR, NOM_CIUDAD_COR, NOM_DPTO_COR, DIRECCION_COR, FECHA_CORTE)');
            SQL.Add('VALUES (:ID_AGENCIA, :ID_COLOCACION, :TIPO_IDENTIFICACION, :ID_PERSONA, :NOMBREDATA, :NOMBRECIFIN, :FECHA_EXP_DOC, :COD_LUGAR_EXP_DOC,');
            SQL.Add(':FECHA_NACIMIENTO, :CIIU, :ESTRATO, :PERSONA_A_CARGO, :FECHA_ACT_DATOS, :ESTADO_CIVIL, :NIVEL_ESTUDIOS, :INGRESOS, :ACTIVOS, :PASIVOS,');
            SQL.Add(':FECHA_BALANCE, :NOMBRE_EMPLEADOR, :FECHA_ING_EMPRESA, :TIPO_CONTRATO, :CLASIFICACION, :CALIFICACION, :ESTADO, :DIASMORA, :FECHA_DESEMBOLSO,');
            SQL.Add(':FECHA_VENCIMIENTO, :FECHA_EXIGIBILIDAD, :FECHA_PRESCRIPCION, :FECHA_PAGO, :PERIOCIDAD_PAGO, :CUOTAS_PAGADAS, :CUOTAS_TOTAL, :CUOTAS_MORA,');
            SQL.Add(':VALOR, :SALDO, :VALOR_CUOTA, :VALOR_MORA, :ID_GARANTIA, :VALOR_GARANTIA, :FECHA_LIMITE_PAGO, :COD_CIUDAD_RAD, :NOM_CIUDAD_RAD, :COD_CIUDAD_RES,');
            SQL.Add(':NOM_CIUDAD_RES, :COD_DPTO_RES, :NOM_DPTO_RES, :DIRECCION_RES, :TELEFONO_RES, :COD_CIUDAD_LAB, :NOM_CIUDAD_LAB, :COD_DPTO_LAB, :NOM_DPTO_LAB,');
            SQL.Add(':DIRECCION_LAB, :TELEFONO_LAB, :COD_CIUDAD_COR, :NOM_CIUDAD_COR, :NOM_DPTO_COR, :DIRECCION_COR, :FECHA_CORTE)');
            ParamByName('ID_AGENCIA').AsInteger := SQLQuery1.FieldByName('ID_AGENCIA').AsInteger;
            ParamByName('ID_COLOCACION').AsString := SQLQuery1.FieldByName('ID_COLOCACION').AsString;
            ParamByName('TIPO_IDENTIFICACION').AsInteger := SQLQuery1.FieldByName('TIPO_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := SQLQuery1.FieldByName('ID_PERSONA').AsString;
            ParamByName('NOMBREDATA').AsString := SQLQuery1.FieldByName('NOMBREDATA').AsString;
            ParamByName('NOMBRECIFIN').AsString := SQLQuery1.FieldByName('NOMBRECIFIN').AsString;
            ParamByName('FECHA_EXP_DOC').AsDate :=  SQLQuery1.FieldByName('FECHA_EXP_DOC').AsDateTime;
            ParamByName('COD_LUGAR_EXP_DOC').AsInteger := SQLQuery1.FieldByName('COD_LUGAR_EXP_DOC').AsInteger;
            ParamByName('FECHA_NACIMIENTO').AsDate := SQLQuery1.FieldByName('FECHA_NACIMIENTO').AsDateTime;
            ParamByName('CIIU').AsInteger := SQLQuery1.FieldByName('CIIU').AsInteger;
            ParamByName('ESTRATO').AsString := SQLQuery1.FieldByName('ESTRATO').AsString;
            ParamByName('PERSONA_A_CARGO').AsInteger := SQLQuery1.FieldByName('PERSONA_A_CARGO').AsInteger;
            ParamByName('FECHA_ACT_DATOS').AsDate := SQLQuery1.FieldByName('FECHA_ACT_DATOS').AsDateTime;
            ParamByName('ESTADO_CIVIL').AsInteger := SQLQuery1.FieldByName('ESTADO_CIVIL').AsInteger;
            ParamByName('NIVEL_ESTUDIOS').AsInteger := SQLQuery1.FieldByName('NIVEL_ESTUDIOS').AsInteger;
            ParamByName('INGRESOS').AsCurrency := SQLQuery1.FieldByName('INGRESOS').AsCurrency;
            ParamByName('ACTIVOS').AsCurrency := SQLQuery1.FieldByName('ACTIVOS').AsCurrency;
            ParamByName('PASIVOS').AsCurrency := SQLQuery1.FieldByName('PASIVOS').AsCurrency;
            ParamByName('FECHA_BALANCE').AsDate := SQLQuery1.FieldByName('FECHA_BALANCE').AsDateTime;
            ParamByName('NOMBRE_EMPLEADOR').AsString := SQLQuery1.FieldByName('NOMBRE_EMPLEADOR').AsString;
            ParamByName('FECHA_ING_EMPRESA').AsDate := SQLQuery1.FieldByName('FECHA_ING_EMPRESA').AsDateTime;
            ParamByName('TIPO_CONTRATO').AsInteger := SQLQuery1.FieldByName('TIPO_CONTRATO').AsInteger;
            ParamByName('CLASIFICACION').AsInteger := SQLQuery1.FieldByName('CLASIFICACION').AsInteger;
            ParamByName('CALIFICACION').AsString := SQLQuery1.FieldByName('CALIFICACION').AsString;
            ParamByName('ESTADO').AsInteger := SQLQuery1.FieldByName('ESTADO').AsInteger;
            ParamByName('DIASMORA').AsInteger := SQLQuery1.FieldByName('DIASMORA').AsInteger;
            ParamByName('FECHA_DESEMBOLSO').AsDate := SQLQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
            ParamByName('FECHA_VENCIMIENTO').AsDate := SQLQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
            ParamByName('FECHA_EXIGIBILIDAD').AsDate := SQLQuery1.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime;
            ParamByName('FECHA_PRESCRIPCION').AsDate := SQLQuery1.FieldByName('FECHA_PRESCRIPCION').AsDateTime;
            ParamByName('FECHA_PAGO').AsDate := SQLQuery1.FieldByName('FECHA_PAGO').AsDateTime;
            ParamByName('PERIOCIDAD_PAGO').AsInteger := SQLQuery1.FieldByName('PERIOCIDAD_PAGO').AsInteger;
            ParamByName('CUOTAS_PAGADAS').AsInteger := SQLQuery1.FieldByName('CUOTAS_PAGADAS').AsInteger;
            ParamByName('CUOTAS_TOTAL').AsInteger := SQLQuery1.FieldByName('CUOTAS_TOTAL').AsInteger;
            ParamByName('CUOTAS_MORA').AsInteger := SQLQuery1.FieldByName('CUOTAS_MORA').AsInteger;
            ParamByName('VALOR').AsCurrency := SQLQuery1.FieldByName('VALOR').AsCurrency;
            ParamByName('SALDO').AsCurrency := SQLQuery1.FieldByName('SALDO').AsCurrency;
            ParamByName('VALOR_CUOTA').AsCurrency := SQLQuery1.FieldByName('VALOR_CUOTA').AsCurrency;
            ParamByName('VALOR_MORA').AsCurrency := SQLQuery1.FieldByName('VALOR_MORA').AsCurrency;
            ParamByName('ID_GARANTIA').AsInteger := SQLQuery1.FieldByName('ID_GARANTIA').AsInteger;
            ParamByName('VALOR_GARANTIA').AsCurrency := SQLQuery1.FieldByName('VALOR_GARANTIA').AsCurrency;
            ParamByName('FECHA_LIMITE_PAGO').AsDate := SQLQuery1.FieldByName('FECHA_LIMITE_PAGO').AsDateTime;
            ParamByName('COD_CIUDAD_RAD').AsString := SQLQuery1.FieldByName('COD_CIUDAD_RAD').AsString;
            ParamByName('NOM_CIUDAD_RAD').AsString := SQLQuery1.FieldByName('NOM_CIUDAD_RAD').AsString;
            ParamByName('COD_CIUDAD_RES').AsString := SQLQuery1.FieldByName('COD_CIUDAD_RES').AsString;
            ParamByName('NOM_CIUDAD_RES').AsString := SQLQuery1.FieldByName('NOM_CIUDAD_RES').AsString;
            ParamByName('COD_DPTO_RES').AsString := SQLQuery1.FieldByName('COD_DPTO_RES').AsString;
            ParamByName('NOM_DPTO_RES').AsString := SQLQuery1.FieldByName('NOM_DPTO_RES').AsString;
            ParamByName('DIRECCION_RES').AsString := SQLQuery1.FieldByName('DIRECCION_RES').AsString;
            ParamByName('TELEFONO_RES').AsString := SQLQuery1.FieldByName('TELEFONO_RES').AsString;
            ParamByName('COD_CIUDAD_LAB').AsString := SQLQuery1.FieldByName('COD_CIUDAD_LAB').AsString;
            ParamByName('NOM_CIUDAD_LAB').AsString := SQLQuery1.FieldByName('NOM_CIUDAD_LAB').AsString;
            ParamByName('COD_DPTO_LAB').AsString := SQLQuery1.FieldByName('COD_DPTO_LAB').AsString;
            ParamByName('NOM_DPTO_LAB').AsString := SQLQuery1.FieldByName('NOM_DPTO_LAB').AsString;
            ParamByName('DIRECCION_LAB').AsString := SQLQuery1.FieldByName('DIRECCION_LAB').AsString;
            ParamByName('TELEFONO_LAB').AsString := SQLQuery1.FieldByName('TELEFONO_LAB').AsString;
            ParamByName('COD_CIUDAD_COR').AsString := SQLQuery1.FieldByName('COD_CIUDAD_COR').AsString;
            ParamByName('NOM_CIUDAD_COR').AsString := SQLQuery1.FieldByName('NOM_CIUDAD_COR').AsString;
            ParamByName('NOM_DPTO_COR').AsString := SQLQuery1.FieldByName('NOM_DPTO_COR').AsString;
            ParamByName('DIRECCION_COR').AsString := SQLQuery1.FieldByName('DIRECCION_COR').AsString;
            ParamByName('FECHA_CORTE').AsDate := DTfecha.Date;
            ExecSQL;
          end;
          SQLQuery1.Next;
        end; //Fin de while
        SQLQuery2.Transaction.Commit;
        SQLQuery1.Free;
        SQLQuery2.Free;         }
end;

procedure TfrmConsolidarData.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var       paquete :Currency;
begin
{         if AWorkMode = wmRead then
          begin
            if DAgencia = 'ABREGO' then
              BarAbrego.Position := AWorkCount
            else if DAgencia = 'CONVENCION' then
              BarConvencion.Position := AWorkCount
            else if DAgencia = 'AGUACHICA' then
              BarAguachica.Position := AWorkCount;
            Application.ProcessMessages;
          end;
 }
end;

procedure TfrmConsolidarData.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
{          if AWorkMode = wmRead then
          begin
            if DAgencia = 'ABREGO' then
              BarAbrego.Max := AWorkCountMax
            else if DAgencia = 'CONVENCION' then
              BarConvencion.Max := AWorkCountMax
            else if DAgencia = 'AGUACHICA' then
              BarAguachica.Max := AWorkCountMax;
          end;
 }
end;

procedure TfrmConsolidarData.BTeliminaClick(Sender: TObject);
var
SQLQuery1:TIBQuery;
begin
        if MessageDlg('Esta Seguro de Eliminar los Datos',mtInformation,[mbyes,mbno],0) = mryes then
        begin
          SQLQuery1 := TIBQuery.Create(nil);
          SQLQuery1.Transaction := dmGeneral.IBTransaction1;
          with SQLQuery1 do
          begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('delete from "col$centralriesgotmp" WHERE FECHA_CORTE = :FECHA_CORTE');
            ParamByName('FECHA_CORTE').AsDate := DTFecha.Date;            
            ExecSQL;
            Transaction.Commit;
            Transaction.Free;
        end;
       end;
end;

procedure TfrmConsolidarData.ExtraerLocal;
var
SQLQuery1,SQLQuery2:TIBQuery;
begin
 {       SQLQuery1.Create(nil);
        SQLQuery1.Transaction := dmGeneral.IBTransaction1;

        SQLQuery1.SQL.Clear;
        SQLQuery1.SQL.Add(sentencia);
        SQLQuery1.Open;
        SQLQuery1.Last;
        SQLQuery1.First;
        BarOcana.Min := 0;
        BarOcana.Max := SQLQuery1.RecordCount;
        BarOcana.Position := 0;
        while not SQLQuery1.Eof do
        begin
          BarOcana.Position := SQLQuery1.RecNo;
          Application.ProcessMessages;

          SQLQuery2.Create(nil);
          SQLQuery2.Transaction := dmGeneral.IBTransaction1;

          with SQLQuery2 do
          begin
            SQL.Clear;
            SQL.Add('INSERT INTO "col$centralriesgotmp" (ID_AGENCIA, ID_COLOCACION, TIPO_IDENTIFICACION, ID_PERSONA, NOMBREDATA, NOMBRECIFIN,');
            SQL.Add('FECHA_EXP_DOC, COD_LUGAR_EXP_DOC, FECHA_NACIMIENTO, CIIU, ESTRATO, PERSONA_A_CARGO, FECHA_ACT_DATOS, ESTADO_CIVIL,');
            SQL.Add('NIVEL_ESTUDIOS, INGRESOS, ACTIVOS, PASIVOS, FECHA_BALANCE, NOMBRE_EMPLEADOR, FECHA_ING_EMPRESA, TIPO_CONTRATO, CLASIFICACION,');
            SQL.Add('CALIFICACION, ESTADO, DIASMORA, FECHA_DESEMBOLSO, FECHA_VENCIMIENTO, FECHA_EXIGIBILIDAD, FECHA_PRESCRIPCION, FECHA_PAGO, PERIOCIDAD_PAGO,');
            SQL.Add('CUOTAS_PAGADAS, CUOTAS_TOTAL, CUOTAS_MORA, VALOR, SALDO, VALOR_CUOTA, VALOR_MORA, ID_GARANTIA, VALOR_GARANTIA, FECHA_LIMITE_PAGO,');
            SQL.Add('COD_CIUDAD_RAD, NOM_CIUDAD_RAD, COD_CIUDAD_RES, NOM_CIUDAD_RES, COD_DPTO_RES, NOM_DPTO_RES, DIRECCION_RES, TELEFONO_RES, COD_CIUDAD_LAB,');
            SQL.Add('NOM_CIUDAD_LAB, COD_DPTO_LAB, NOM_DPTO_LAB, DIRECCION_LAB, TELEFONO_LAB, COD_CIUDAD_COR, NOM_CIUDAD_COR, NOM_DPTO_COR, DIRECCION_COR, FECHA_CORTE)');
            SQL.Add('VALUES (:ID_AGENCIA, :ID_COLOCACION, :TIPO_IDENTIFICACION, :ID_PERSONA, :NOMBREDATA, :NOMBRECIFIN, :FECHA_EXP_DOC, :COD_LUGAR_EXP_DOC,');
            SQL.Add(':FECHA_NACIMIENTO, :CIIU, :ESTRATO, :PERSONA_A_CARGO, :FECHA_ACT_DATOS, :ESTADO_CIVIL, :NIVEL_ESTUDIOS, :INGRESOS, :ACTIVOS, :PASIVOS,');
            SQL.Add(':FECHA_BALANCE, :NOMBRE_EMPLEADOR, :FECHA_ING_EMPRESA, :TIPO_CONTRATO, :CLASIFICACION, :CALIFICACION, :ESTADO, :DIASMORA, :FECHA_DESEMBOLSO,');
            SQL.Add(':FECHA_VENCIMIENTO, :FECHA_EXIGIBILIDAD, :FECHA_PRESCRIPCION, :FECHA_PAGO, :PERIOCIDAD_PAGO, :CUOTAS_PAGADAS, :CUOTAS_TOTAL, :CUOTAS_MORA,');
            SQL.Add(':VALOR, :SALDO, :VALOR_CUOTA, :VALOR_MORA, :ID_GARANTIA, :VALOR_GARANTIA, :FECHA_LIMITE_PAGO, :COD_CIUDAD_RAD, :NOM_CIUDAD_RAD, :COD_CIUDAD_RES,');
            SQL.Add(':NOM_CIUDAD_RES, :COD_DPTO_RES, :NOM_DPTO_RES, :DIRECCION_RES, :TELEFONO_RES, :COD_CIUDAD_LAB, :NOM_CIUDAD_LAB, :COD_DPTO_LAB, :NOM_DPTO_LAB,');
            SQL.Add(':DIRECCION_LAB, :TELEFONO_LAB, :COD_CIUDAD_COR, :NOM_CIUDAD_COR, :NOM_DPTO_COR, :DIRECCION_COR, :FECHA_CORTE)');
            ParamByName('ID_AGENCIA').AsInteger := SQLQuery1.FieldByName('ID_AGENCIA').AsInteger;
            ParamByName('ID_COLOCACION').AsString := SQLQuery1.FieldByName('ID_COLOCACION').AsString;
            ParamByName('TIPO_IDENTIFICACION').AsInteger := SQLQuery1.FieldByName('TIPO_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := SQLQuery1.FieldByName('ID_PERSONA').AsString;
            ParamByName('NOMBREDATA').AsString := SQLQuery1.FieldByName('NOMBREDATA').AsString;
            ParamByName('NOMBRECIFIN').AsString := SQLQuery1.FieldByName('NOMBRECIFIN').AsString;
            ParamByName('FECHA_EXP_DOC').AsDate :=  SQLQuery1.FieldByName('FECHA_EXP_DOC').AsDateTime;
            ParamByName('COD_LUGAR_EXP_DOC').AsInteger := SQLQuery1.FieldByName('COD_LUGAR_EXP_DOC').AsInteger;
            ParamByName('FECHA_NACIMIENTO').AsDate := SQLQuery1.FieldByName('FECHA_NACIMIENTO').AsDateTime;
            ParamByName('CIIU').AsInteger := SQLQuery1.FieldByName('CIIU').AsInteger;
            ParamByName('ESTRATO').AsString := SQLQuery1.FieldByName('ESTRATO').AsString;
            ParamByName('PERSONA_A_CARGO').AsInteger := SQLQuery1.FieldByName('PERSONA_A_CARGO').AsInteger;
            ParamByName('FECHA_ACT_DATOS').AsDate := SQLQuery1.FieldByName('FECHA_ACT_DATOS').AsDateTime;
            ParamByName('ESTADO_CIVIL').AsInteger := SQLQuery1.FieldByName('ESTADO_CIVIL').AsInteger;
            ParamByName('NIVEL_ESTUDIOS').AsInteger := SQLQuery1.FieldByName('NIVEL_ESTUDIOS').AsInteger;
            ParamByName('INGRESOS').AsCurrency := SQLQuery1.FieldByName('INGRESOS').AsCurrency;
            ParamByName('ACTIVOS').AsCurrency := SQLQuery1.FieldByName('ACTIVOS').AsCurrency;
            ParamByName('PASIVOS').AsCurrency := SQLQuery1.FieldByName('PASIVOS').AsCurrency;
            ParamByName('FECHA_BALANCE').AsDate := SQLQuery1.FieldByName('FECHA_BALANCE').AsDateTime;
            ParamByName('NOMBRE_EMPLEADOR').AsString := SQLQuery1.FieldByName('NOMBRE_EMPLEADOR').AsString;
            ParamByName('FECHA_ING_EMPRESA').AsDate := SQLQuery1.FieldByName('FECHA_ING_EMPRESA').AsDateTime;
            ParamByName('TIPO_CONTRATO').AsInteger := SQLQuery1.FieldByName('TIPO_CONTRATO').AsInteger;
            ParamByName('CLASIFICACION').AsInteger := SQLQuery1.FieldByName('CLASIFICACION').AsInteger;
            ParamByName('CALIFICACION').AsString := SQLQuery1.FieldByName('CALIFICACION').AsString;
            ParamByName('ESTADO').AsInteger := SQLQuery1.FieldByName('ESTADO').AsInteger;
            ParamByName('DIASMORA').AsInteger := SQLQuery1.FieldByName('DIASMORA').AsInteger;
            ParamByName('FECHA_DESEMBOLSO').AsDate := SQLQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
            ParamByName('FECHA_VENCIMIENTO').AsDate := SQLQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
            ParamByName('FECHA_EXIGIBILIDAD').AsDate := SQLQuery1.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime;
            ParamByName('FECHA_PRESCRIPCION').AsDate := SQLQuery1.FieldByName('FECHA_PRESCRIPCION').AsDateTime;
            ParamByName('FECHA_PAGO').AsDate := SQLQuery1.FieldByName('FECHA_PAGO').AsDateTime;
            ParamByName('PERIOCIDAD_PAGO').AsInteger := SQLQuery1.FieldByName('PERIOCIDAD_PAGO').AsInteger;
            ParamByName('CUOTAS_PAGADAS').AsInteger := SQLQuery1.FieldByName('CUOTAS_PAGADAS').AsInteger;
            ParamByName('CUOTAS_TOTAL').AsInteger := SQLQuery1.FieldByName('CUOTAS_TOTAL').AsInteger;
            ParamByName('CUOTAS_MORA').AsInteger := SQLQuery1.FieldByName('CUOTAS_MORA').AsInteger;
            ParamByName('VALOR').AsCurrency := SQLQuery1.FieldByName('VALOR').AsCurrency;
            ParamByName('SALDO').AsCurrency := SQLQuery1.FieldByName('SALDO').AsCurrency;
            ParamByName('VALOR_CUOTA').AsCurrency := SQLQuery1.FieldByName('VALOR_CUOTA').AsCurrency;
            ParamByName('VALOR_MORA').AsCurrency := SQLQuery1.FieldByName('VALOR_MORA').AsCurrency;
            ParamByName('ID_GARANTIA').AsInteger := SQLQuery1.FieldByName('ID_GARANTIA').AsInteger;
            ParamByName('VALOR_GARANTIA').AsCurrency := SQLQuery1.FieldByName('VALOR_GARANTIA').AsCurrency;
            ParamByName('FECHA_LIMITE_PAGO').AsDate := SQLQuery1.FieldByName('FECHA_LIMITE_PAGO').AsDateTime;
            ParamByName('COD_CIUDAD_RAD').AsString := SQLQuery1.FieldByName('COD_CIUDAD_RAD').AsString;
            ParamByName('NOM_CIUDAD_RAD').AsString := SQLQuery1.FieldByName('NOM_CIUDAD_RAD').AsString;
            ParamByName('COD_CIUDAD_RES').AsString := SQLQuery1.FieldByName('COD_CIUDAD_RES').AsString;
            ParamByName('NOM_CIUDAD_RES').AsString := SQLQuery1.FieldByName('NOM_CIUDAD_RES').AsString;
            ParamByName('COD_DPTO_RES').AsString := SQLQuery1.FieldByName('COD_DPTO_RES').AsString;
            ParamByName('NOM_DPTO_RES').AsString := SQLQuery1.FieldByName('NOM_DPTO_RES').AsString;
            ParamByName('DIRECCION_RES').AsString := SQLQuery1.FieldByName('DIRECCION_RES').AsString;
            ParamByName('TELEFONO_RES').AsString := SQLQuery1.FieldByName('TELEFONO_RES').AsString;
            ParamByName('COD_CIUDAD_LAB').AsString := SQLQuery1.FieldByName('COD_CIUDAD_LAB').AsString;
            ParamByName('NOM_CIUDAD_LAB').AsString := SQLQuery1.FieldByName('NOM_CIUDAD_LAB').AsString;
            ParamByName('COD_DPTO_LAB').AsString := SQLQuery1.FieldByName('COD_DPTO_LAB').AsString;
            ParamByName('NOM_DPTO_LAB').AsString := SQLQuery1.FieldByName('NOM_DPTO_LAB').AsString;
            ParamByName('DIRECCION_LAB').AsString := SQLQuery1.FieldByName('DIRECCION_LAB').AsString;
            ParamByName('TELEFONO_LAB').AsString := SQLQuery1.FieldByName('TELEFONO_LAB').AsString;
            ParamByName('COD_CIUDAD_COR').AsString := SQLQuery1.FieldByName('COD_CIUDAD_COR').AsString;
            ParamByName('NOM_CIUDAD_COR').AsString := SQLQuery1.FieldByName('NOM_CIUDAD_COR').AsString;
            ParamByName('NOM_DPTO_COR').AsString := SQLQuery1.FieldByName('NOM_DPTO_COR').AsString;
            ParamByName('DIRECCION_COR').AsString := SQLQuery1.FieldByName('DIRECCION_COR').AsString;
            ParamByName('FECHA_CORTE').AsDate := DTfecha.Date;
            ExecSQL;
          end;
          SQLQuery1.Next;
        end;
        SQLQuery2.Transaction.Commit;
        SQLQuery1.Free;
        SQLQuery2.Free;       }
end;

procedure TfrmConsolidarData.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidarData.FormShow(Sender: TObject);
begin
        PlanoEncDataClientes := TStringList.Create;
        PlanoEncDataClientes.Clear;
        PlanoMovDataClientes := TStringList.Create;
        PlanoMovDataClientes.Clear;

        PlanoEncDataCartera := TStringList.Create;
        PlanoEncDataCartera.Clear;
        PlanoMovDataCartera := TStringList.Create;
        PlanoMovDataCartera.Clear;

        PlanoEncCifin := TStringList.Create;
        PlanoEncCifin.Clear;
        PlanoMovCifin := TStringList.Create;
        PlanoMovCifin.Clear;

        DTfecha.Date := EncodeDate(YearOf(Date),MonthOf(Date) - 1,DayOf(Date));
        DTfecha.Date := RecodeDay(DTfecha.Date,Dayof(EndOfAMonth(YearOf(dtfecha.Date),MonthOf(DTfecha.Date))));
//        Dia := Dayof(DTfecha.Date);
//        if Dia > 30 then Dia := 30;
//        DTfecha.Date := RecodeDay(DTfecha.Date,Dia);
        MesCorteAct := IntToStr(YearOf(DTfecha.Date)) + FormatCurr('00',MonthOf(DTfecha.Date)) + FormatCurr('00',DayOf(DTfecha.Date));
end;

procedure TfrmConsolidarData.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidarData.CmdDatacreditoClick(Sender: TObject);
begin
        CmdDatacredito.Enabled := False;

        EncabezadoDatacreditoClientes;
        ClientesDatacredito;
        FinDatacreditoClientes;

        PlanoMovDataClientes.Add(LineaFinDataClientes);
        PlanoEncDataClientes.AddStrings(PlanoMovDataClientes);
        PlanoEncDataClientes.SaveToFile('C:\ReporteCentrales\CL' + CodigoData + Nit + Format('%.4d',[YearOf(DTfecha.Date)])+ Format('%.2d',[monthOf(DTfecha.Date)]) + Format('%.2d',[DayOf(DTfecha.Date)]) + '.TXT');
        FreeAndNil(PlanoMovDataClientes);
        FreeAndNil(PlanoEncDataClientes);
        LbClientesD.Caption := 'Plano Clientes Exitoso!!';

        EncabezadoDatacreditoCartera;
        CarteraDatacredito;
        FinDatacreditoCartera;

        PlanoMovDataCartera.Add(LineaFinDataCartera);
        PlanoEncDataCartera.AddStrings(PlanoMovDataCartera);
        PlanoEncDataCartera.SaveToFile('C:\ReporteCentrales\PTCAC' + CodigoData + Format('%.4d',[YearOf(DTfecha.Date)])+ Format('%.2d',[monthOf(DTfecha.Date)]) + Format('%.2d',[DayOf(DTfecha.Date)]) + '.TXT');
        FreeAndNil(PlanoMovDataCartera);
        FreeAndNil(PlanoEncDataCartera);
        LbCarteraD.Caption := 'Plano Cartera Exitoso!!';
end;


procedure TfrmConsolidarData.ClientesDatacredito;
var cadena:string;
    LineaCD:RegistroCD;
    ColocacionNew:string;
    DiasMora:Integer;
    Apel1,Apel2,Nombre:string;
    Identificacion:string;
    Ident:Int64;
    AgenciaLocal:Integer;
    ColocacionLocal:string;
    Tmp:Currency;

    i1,i2 :Integer;
    J:Integer;
    S1,S2 :TStringList;
    Nit:string;
    CNit:Integer;
    AnosMora:Double;
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        SumaRegistros := 0;
        SumaObligaciones := 0;
        SumaIdentificacion := 0;

        with IBQuery11 do begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('"col$centralriesgotmp".TIPO_IDENTIFICACION,');
           SQL.Add('"col$centralriesgotmp".ID_PERSONA,');
           SQL.Add('"col$centralriesgotmp".NOMBREDATA,');
           SQL.Add('"col$centralriesgotmp".FECHA_EXP_DOC,');
           SQL.Add('"col$centralriesgotmp".COD_LUGAR_EXP_DOC,');
           SQL.Add('"col$centralriesgotmp".FECHA_NACIMIENTO,');
           SQL.Add('"col$centralriesgotmp".CIIU,');
           SQL.Add('"col$centralriesgotmp".ESTRATO,');
           SQL.Add('"col$centralriesgotmp".PERSONA_A_CARGO,');
           SQL.Add('"col$centralriesgotmp".FECHA_ACT_DATOS,');
           SQL.Add('"col$centralriesgotmp".ESTADO_CIVIL,');
           SQL.Add('"col$centralriesgotmp".NIVEL_ESTUDIOS,');
           SQL.Add('"col$centralriesgotmp".INGRESOS,');
           SQL.Add('"col$centralriesgotmp".ACTIVOS,');
           SQL.Add('"col$centralriesgotmp".PASIVOS,');
           SQL.Add('"col$centralriesgotmp".FECHA_BALANCE,');
           SQL.Add('"col$centralriesgotmp".NOMBRE_EMPLEADOR,');
           SQL.Add('"col$centralriesgotmp".FECHA_ING_EMPRESA,');
           SQL.Add('"col$centralriesgotmp".TIPO_CONTRATO,');
           SQL.Add('"col$centralriesgotmp".OCUPACION');
           SQL.Add('FROM "col$centralriesgotmp" WHERE FECHA_CORTE = :FECHA_CORTE');
{           sql.Add('GROUP BY');
           SQL.Add('"col$centralriesgotmp".TIPO_IDENTIFICACION,');
           SQL.Add('"col$centralriesgotmp".ID_PERSONA,');
           SQL.Add('"col$centralriesgotmp".NOMBREDATA,');
           SQL.Add('"col$centralriesgotmp".FECHA_EXP_DOC,');
           SQL.Add('"col$centralriesgotmp".COD_LUGAR_EXP_DOC,');
           SQL.Add('"col$centralriesgotmp".FECHA_NACIMIENTO,');
           SQL.Add('"col$centralriesgotmp".CIIU,');
           SQL.Add('"col$centralriesgotmp".ESTRATO,');
           SQL.Add('"col$centralriesgotmp".PERSONA_A_CARGO,');
           SQL.Add('"col$centralriesgotmp".FECHA_ACT_DATOS,');
           SQL.Add('"col$centralriesgotmp".ESTADO_CIVIL,');
           SQL.Add('"col$centralriesgotmp".NIVEL_ESTUDIOS,');
           SQL.Add('"col$centralriesgotmp".INGRESOS,');
           SQL.Add('"col$centralriesgotmp".ACTIVOS,');
           SQL.Add('"col$centralriesgotmp".PASIVOS,');
           SQL.Add('"col$centralriesgotmp".FECHA_BALANCE,');
           SQL.Add('"col$centralriesgotmp".NOMBRE_EMPLEADOR,');
           SQL.Add('"col$centralriesgotmp".FECHA_ING_EMPRESA,');
           SQL.Add('"col$centralriesgotmp".TIPO_CONTRATO,');
           SQL.Add('"col$centralriesgotmp".OCUPACION');
}
           ParamByName('FECHA_CORTE').AsDate := DTfecha.Date;
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información para Procesar',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;

           DPDatos.DataSet := IBQuery11;
           CDDatos.ProviderName := 'DPDatos';
           CDDatos.Open;
           CDDatos.Last;
           CDDatos.First;
           BarClientesD.Min := 0;
           BarClientesD.Max := CDDatos.RecordCount;
           BarClientesD.Position := 0;

           while not CDDatos.Eof do begin
             BarClientesD.Position := CDDatos.RecNo;
             Application.ProcessMessages;

             LbClientesD.Caption := CDDatos.FieldByName('ID_PERSONA').AsString;

             case CDDatos.FieldByName('TIPO_IDENTIFICACION').AsInteger of
               3 : LineaCD.TpIden := '1';
               4 : LineaCD.TpIden := '2';
               6 : LineaCD.TpIden := '4';
               else
                   LineaCD.TpIden := '1';
             end;

             if (LineaCD.TpIden = '2') then
              begin
                CNit := StrLen(PChar(CDDatos.FieldByName('ID_PERSONA').AsString));
                Nit := LeftStr(CDDatos.FieldByName('ID_PERSONA').AsString,CNit-1);
              end
             else
              begin
               Nit := CDDatos.FieldByName('ID_PERSONA').AsString;
              end;

             Ident := StrToInt64(Nit);

             SumaIdentificacion := SumaIdentificacion + Ident;
             Identificacion := StringReplace(Format('%11s',[CurrToStr(Ident)]),' ','0',[rfReplaceAll]);
             LineaCD.Identificacion := Identificacion;
             LineaCD.Nombre := Format('%-45s',[leftstr(Trim(CDDatos.FieldByName('NOMBREDATA').AsString),45)]);
             if CDDatos.FieldByName('FECHA_EXP_DOC').AsDateTime = 0 then
               LineaCD.FExpDto := '00000000'
             else
               LineaCD.FExpDto := IntToStr(YearOf(CDDatos.FieldByName('FECHA_EXP_DOC').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_EXP_DOC').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_EXP_DOC').AsDateTime));
             LineaCD.LExpDto := '00000000';
             if CDDatos.FieldByName('FECHA_NACIMIENTO').AsDateTime = 0 then
               LineaCD.FNacim := '00000000'
             else
               LineaCD.FNacim := IntToStr(YearOf(CDDatos.FieldByName('FECHA_NACIMIENTO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_NACIMIENTO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_NACIMIENTO').AsDateTime));
             if LineaCD.TpIden = '2' then
               LineaCD.ActEco := '00'
             else
              begin
                case CDDatos.FieldByName('OCUPACION').AsInteger of
                  0 : LineaCD.ActEco := '06';
                  1 : LineaCD.ActEco := '01';
                  2 : LineaCD.ActEco := '03';
                  3 : LineaCD.ActEco := '02';
                  4 : LineaCD.ActEco := '05';
                  5 : LineaCD.ActEco := '04';
                  6 : LineaCD.ActEco := '06';
                end;
              end;

             if LineaCD.TpIden = '2' then
               LineaCD.Ciiu := StringReplace(Format('%4s',[CurrToStr(CDDatos.FieldByName('CIIU').AsInteger)]),' ','0',[rfReplaceAll])
             else
               LineaCD.Ciiu := '0000';
             if CDDatos.FieldByName('ESTRATO').AsInteger = 0 then
               LineaCD.Estrato := '00'
             else
               LineaCD.Estrato := '0' + IntToStr(CDDatos.FieldByName('ESTRATO').AsInteger);

             if CDDatos.FieldByName('PERSONA_A_CARGO').AsInteger = 0 then
               LineaCD.PCargo := '000000'
             else
               LineaCD.PCargo := StringReplace(Format('%6s',[CurrToStr(CDDatos.FieldByName('PERSONA_A_CARGO').AsInteger)]),' ','0',[rfReplaceAll]);

             if CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime = 0 then
              begin
                LineaCD.FActPCargo := '00000000';
                LineaCD.FActECivil := '00000000';
                LineaCD.FActNEstudio := '00000000';
                LineaCD.FActIngresos := '00000000';
                LineaCD.FActEmpleador := '00000000';
                LineaCD.FActTContrato := '00000000';
              end
             else
              begin
               LineaCD.FActPCargo := IntToStr(YearOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime));
                LineaCD.FActECivil := IntToStr(YearOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime));
                LineaCD.FActNEstudio := IntToStr(YearOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime));
                LineaCD.FActIngresos := IntToStr(YearOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime));
                LineaCD.FActEmpleador := IntToStr(YearOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime));
                LineaCD.FActTContrato := IntToStr(YearOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_ACT_DATOS').AsDateTime));
              end;

             case CDDatos.FieldByName('ESTADO_CIVIL').AsInteger of
               1 : LineaCD.ECivil := '01';
               2 : LineaCD.ECivil := '02';
               3 : LineaCD.ECivil := '04';
               4 : LineaCD.ECivil := '03';
               5 : LineaCD.ECivil := '03';
               6 : LineaCD.ECivil := '03';
               0 : LineaCD.ECivil := '01';
             end;

             case CDDatos.FieldByName('NIVEL_ESTUDIOS').AsInteger of
               0 : LineaCD.NEstudio := '08';
               1 : LineaCD.NEstudio := '01';
               2 : LineaCD.NEstudio := '03';
               3 : LineaCD.NEstudio := '04';
               4 : LineaCD.NEstudio := '04';
               5 : LineaCD.NEstudio := '04';
               8 : LineaCD.NEstudio := '05';
               9 : LineaCD.NEstudio := '07';
             end;

             LineaCD.Ingresos := StringReplace(Format('%13s',[CurrToStr(CDDatos.FieldByName('INGRESOS').AsCurrency)]),' ','0',[rfReplaceAll]);
             LineaCD.Activos := StringReplace(Format('%13s',[CurrToStr(CDDatos.FieldByName('ACTIVOS').AsCurrency)]),' ','0',[rfReplaceAll]);
             LineaCD.Pasivos := StringReplace(Format('%13s',[CurrToStr(CDDatos.FieldByName('PASIVOS').AsCurrency)]),' ','0',[rfReplaceAll]);

             if CDDatos.FieldByName('FECHA_BALANCE').AsDateTime = 0 then
               LineaCD.FBalance := '00000000'
             else
               LineaCD.FBalance := IntToStr(YearOf(CDDatos.FieldByName('FECHA_BALANCE').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_BALANCE').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_BALANCE').AsDateTime));

             LineaCD.NitEmpleador := '00000000000';
             LineaCD.NEmpleador := Format('%-45s',[leftstr(Trim(CDDatos.FieldByName('NOMBRE_EMPLEADOR').AsString),45)]);

             if CDDatos.FieldByName('FECHA_ING_EMPRESA').AsDateTime = 0 then
               LineaCD.FIngEmpresa := '00000000'
             else
               LineaCD.FIngEmpresa := IntToStr(YearOf(CDDatos.FieldByName('FECHA_ING_EMPRESA').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_ING_EMPRESA').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_ING_EMPRESA').AsDateTime));

             case CDDatos.FieldByName('TIPO_CONTRATO').AsInteger of
               1 : LineaCD.TContrato := '2';
               2 : LineaCD.TContrato := '1';
               3 : LineaCD.TContrato := '4';
               0 : LineaCD.TContrato := '4';
             end;

             LineaCD.OpIntern := '0';
             LineaCD.FActOpIntern := '00000000';
             LineaCD.STitular := '0';
             LineaCD.FMayor := '1';
             LineaCD.FActFMayor := '00000000';
             LineaCD.Filler := '                                                                        ';

             PlanoMovDataClientes.Add(LineaCD.TpIden + LineaCD.Identificacion + LineaCD.Nombre + LineaCD.FExpDto + LineaCD.LExpDto + LineaCD.FNacim +
                                  LineaCD.ActEco + LineaCD.Ciiu + LineaCD.Estrato + LineaCD.PCargo + LineaCD.FActPCargo + LineaCD.ECivil + LineaCD.FActECivil +
                                  LineaCD.NEstudio + LineaCD.FActNEstudio + LineaCD.Ingresos + LineaCD.FActIngresos + LineaCD.Activos + LineaCD.Pasivos +
                                  LineaCD.FBalance + LineaCD.NitEmpleador + LineaCD.NEmpleador + LineaCD.FIngEmpresa + LineaCD.FActEmpleador + LineaCD.TContrato +
                                  LineaCD.FActTContrato + LineaCD.OpIntern + LineaCD.FActOpIntern + LineaCD.STitular + LineaCD.FMayor + LineaCD.FActFMayor + LineaCD.Filler);

             SumaRegistros := SumaRegistros + 1;
             CDDatos.Next;
           end;  // Fin de while

        CheckBox2.Checked := True;
        CDDatos.Close;
        IBQuery11.Close;
        Application.ProcessMessages;
end;

procedure TfrmConsolidarData.CarteraDatacredito;
var cadena:string;
    LineaMCD:RegistroMCD;
    ColocacionNew:string;
    DiasMora:Integer;
    Apel1,Apel2,Nombre:string;
    Identificacion:string;
    Ident:Int64;
    AgenciaLocal:Integer;
    ColocacionLocal:string;
    Tmp:Currency;

    i1,i2 :Integer;
    J:Integer;
    S1,S2 :TStringList;
    Nit:string;
    CNit:Integer;
    AnosMora:Double;
begin
        SumaRegistros := 0;
        SumaNovedad := 0;

        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        with IBQuery11 do begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT * FROM "col$centralriesgotmp" where FECHA_CORTE = :FECHA_CORTE');
           ParamByName('FECHA_CORTE').AsDate := DTfecha.Date;
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información para Procesar',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;

           DPDatos.DataSet := IBQuery11;
           CDDatos.ProviderName := 'DPDatos';
           CDDatos.Open;
           CDDatos.Last;
           CDDatos.First;
           BarCarteraD.Min := 0;
           BarCarteraD.Max := CDDatos.RecordCount;
           BarCarteraD.Position := 0;

           while not CDDatos.Eof do begin
             BarCarteraD.Position := CDDatos.RecNo;
             Application.ProcessMessages;
             LbCarteraD.Caption := CDDatos.FieldByName('ID_COLOCACION').AsString;
             case CDDatos.FieldByName('TIPO_IDENTIFICACION').AsInteger of
               3 : LineaMCD.TpIden := '1';
               4 : LineaMCD.TpIden := '2';
               6 : LineaMCD.TpIden := '4';
               else
                   LineaMCD.TpIden := '1';
             end;

             if (LineaMCD.TpIden = '2') then
              begin
                CNit := StrLen(PChar(CDDatos.FieldByName('ID_PERSONA').AsString));
                Nit := LeftStr(CDDatos.FieldByName('ID_PERSONA').AsString,CNit-1);
              end
             else
              begin
               Nit := CDDatos.FieldByName('ID_PERSONA').AsString;
              end;

             Ident := StrToInt64(Nit);
             Identificacion := StringReplace(Format('%11s',[CurrToStr(Ident)]),' ','0',[rfReplaceAll]);

             LineaMCD.Identificacion := Identificacion;

             LineaMCD.Numero := CDDatos.FieldByName('ID_COLOCACION').AsString;
             LineaMCD.Nombre := Format('%-45s',[leftstr(Trim(CDDatos.FieldByName('NOMBREDATA').AsString),45)]);
             LineaMCD.STitular := '0';
             LineaMCD.FApertura := IntToStr(YearOf(CDDatos.FieldByName('FECHA_DESEMBOLSO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_DESEMBOLSO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_DESEMBOLSO').AsDateTime));
             LineaMCD.FVencim := IntToStr(YearOf(CDDatos.FieldByName('FECHA_VENCIMIENTO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_VENCIMIENTO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_VENCIMIENTO').AsDateTime));

             cadena := CDDatos.FieldByName('ID_COLOCACION').AsString;
             if MidStr(cadena,17,1) = 'C' then
               LineaMCD.Calidad := '01'
             else
               LineaMCD.Calidad := '00';

             case CDDatos.FieldByName('CLASIFICACION').AsInteger of
                1 : LineaMCD.TpObli := '1';
                2 : LineaMCD.TpObli := '2';
                3 : LineaMCD.TpObli := '3';
                4 : LineaMCD.TpObli := '5'
             else
                LineaMCD.TpObli := '4';
             end;

             LineaMCD.SHipot := '0';
             LineaMCD.FSHipot := '00000000';
             LineaMCD.TContrato := '1';

             case CDDatos.FieldByName('ESTADO').AsInteger of
                0 : LineaMCD.FoPago := '0';
                1 : LineaMCD.FoPago := '0';
                2 : LineaMCD.FoPago := '0';
                3 : LineaMCD.FoPago := '0';
                8 : LineaMCD.FoPago := '0';
                9 : LineaMCD.FoPago := '0';
                7 : LineaMCD.FoPago := '1';
                10 : LineaMCD.FoPago := '1';
                12 : LineaMCD.FoPago := '2';
                13 : LineaMCD.FoPago := '2';
                6 : LineaMCD.FoPago := '2';
             end;

             case CDDatos.FieldByName('PERIOCIDAD_PAGO').AsInteger of
               30 : LineaMCD.PePago := '1';
               60 : LineaMCD.PePago := '2';
               90 : LineaMCD.PePago := '3';
              180 : LineaMCD.PePago := '4';
              360 : LineaMCD.PePago := '5'
             else
               LineaMCD.PePago := '9';
             end;

             LineaMCD.Novedad := novedad(CDDatos.FieldByName('DIASMORA').AsInteger,CDDatos.FieldByName('ESTADO').AsInteger);
             LineaMCD.EOrigCta := '0';
             LineaMCD.FEOrigCta := LineaMCD.FApertura;

             if (CDDatos.FieldByName('DIASMORA').AsInteger < 30) then
             begin
               LineaMCD.ECuenta := '01';
               LineaMCD.FECuenta := IntToStr(YearOf(DtFecha.Date)) + FormatCurr('00',MonthOf(DtFecha.Date)) + FormatCurr('00',DayOf(DtFecha.Date));
             end
             else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 30) and (CDDatos.FieldByName('DIASMORA').AsInteger < 180) then
             begin
               LineaMCD.ECuenta := '02';
               LineaMCD.FECuenta := IntToStr(YearOf(DtFecha.Date)) + FormatCurr('00',MonthOf(DtFecha.Date)) + FormatCurr('00',DayOf(DtFecha.Date));
             end
             else if (CDDatos.FieldByName('DIASMORA').AsInteger > 180) then
             begin
               LineaMCD.ECuenta := '05';
               LineaMCD.FECuenta := IntToStr(YearOf(DtFecha.Date)) + FormatCurr('00',MonthOf(DtFecha.Date)) + FormatCurr('00',DayOf(DtFecha.Date));
             end;
             if (CDDatos.FieldByName('ESTADO').AsInteger = 3) then
             begin
               LineaMCD.ECuenta := '06';
               LineaMCD.FECuenta := IntToStr(YearOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime));
             end;
             if (CDDatos.FieldByName('ESTADO').AsInteger = 6) then
             begin
               LineaMCD.ECuenta := '03';
               LineaMCD.FECuenta := IntToStr(YearOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime));
             end;
             if (CDDatos.FieldByName('ESTADO').AsInteger = 7) then
             begin
               LineaMCD.ECuenta := '03';
               LineaMCD.FECuenta := IntToStr(YearOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime));
             end;

             SumaNovedad := SumaNovedad + StrToInt(LineaMCD.ECuenta);

             LineaMCD.FECuenta := '00000000';
             LineaMCD.EPlastico := '0';
             LineaMCD.FEPlastico := '00000000';
             LineaMCD.Adjetivo := '0';
             LineaMCD.FAdjetivo := '00000000';
             LineaMCD.CTarjeta := '0';
             LineaMCD.Franquicia := '0';
             LineaMCD.NomMarPriv := '                              ';
             LineaMCD.TpMon := '1';
             LineaMCD.TpGar := IntToStr(CDDatos.FieldByName('ID_GARANTIA').AsInteger);
             LineaMCD.Califi := ' ' + CDDatos.FieldByName('CALIFICACION').AsString;
             LineaMCD.PIncump := '000';
             if (CDDatos.FieldByName('DIASMORA').AsInteger > 999) then
               LineaMCD.EdMora := '999'
             else
               LineaMCD.EdMora := StringReplace(Format('%3s',[CurrToStr(CDDatos.FieldByName('DIASMORA').AsInteger)]),' ','0',[rfReplaceAll]);
             LineaMCD.VInicial := StringReplace(Format('%11s',[CurrToStr(CDDatos.FieldByName('VALOR').AsCurrency)]),' ','0',[rfReplaceAll]);
             LineaMCD.VSaldo := StringReplace(Format('%11s',[CurrToStr(CDDatos.FieldByName('SALDO').AsCurrency)]),' ','0',[rfReplaceAll]);
             LineaMCD.VDisp := '00000000000';
             LineaMCD.VCuota := StringReplace(Format('%11s',[CurrToStr(CDDatos.FieldByName('VALOR_CUOTA').AsCurrency)]),' ','0',[rfReplaceAll]);
             LineaMCD.VMora := StringReplace(Format('%11s',[CurrToStr(CDDatos.FieldByName('VALOR_MORA').AsCurrency)]),' ','0',[rfReplaceAll]);
             LineaMCD.TCuotas := StringReplace(Format('%3s',[leftstr(Trim(IntToStr(CDDatos.FieldByName('CUOTAS_TOTAL').AsInteger)),3)]),' ','0',[rfReplaceAll]);
             LineaMCD.CuotasPag := StringReplace(Format('%3s',[leftstr(Trim(IntToStr(CDDatos.FieldByName('CUOTAS_PAGADAS').AsInteger)),3)]),' ','0',[rfReplaceAll]);
             LineaMCD.CuotasMora := StringReplace(Format('%3s',[leftstr(Trim(IntToStr(CDDatos.FieldByName('CUOTAS_MORA').AsInteger)),3)]),' ','0',[rfReplaceAll]);
             LineaMCD.CPerman := '000';
             LineaMCD.FCPerman := '00000000';

             if (CDDatos.FieldByName('FECHA_LIMITE_PAGO').AsDateTime = 0) then
               LineaMCD.FLimPago := '00000000'
             else
               LineaMCD.FLimPago := IntToStr(YearOf(CDDatos.FieldByName('FECHA_LIMITE_PAGO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_LIMITE_PAGO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_LIMITE_PAGO').AsDateTime));

             if (CDDatos.FieldByName('FECHA_PAGO').AsDateTime = 0) then
               LineaMCD.FPago := '00000000'
             else
               LineaMCD.FPago := IntToStr(YearOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime));


             LineaMCD.Oficina := Format('%30s',[Trim(Ciudad)]);

             LineaMCD.CiuRad := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_CIUDAD_RAD').AsString),20)]);
             LineaMCD.CodCiuRad := StringReplace(Format('%8s',[IntToStr(CDDatos.FieldByName('COD_CIUDAD_RAD').AsInteger)]),' ','0',[rfReplaceAll]);
             LineaMCD.CiuRes := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_CIUDAD_RES').AsString),20)]);
             LineaMCD.CodCiuRes := StringReplace(Format('%8s',[IntToStr(CDDatos.FieldByName('COD_CIUDAD_RES').AsInteger)]),' ','0',[rfReplaceAll]);
             LineaMCD.DptoRes := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_DPTO_RES').AsString),20)]);
             LineaMCD.DirRes := Format('%60s',[leftstr(Trim(CDDatos.FieldByName('DIRECCION_RES').AsString),60)]);
             LineaMCD.TelRes := Format('%12s',[leftstr(Trim(CDDatos.FieldByName('TELEFONO_RES').AsString),12)]);

             LineaMCD.CiuLab := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_CIUDAD_LAB').AsString),20)]);
             LineaMCD.CodCiuLab := StringReplace(Format('%8s',[IntToStr(CDDatos.FieldByName('COD_CIUDAD_LAB').AsInteger)]),' ','0',[rfReplaceAll]);
             LineaMCD.DptoLab := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_DPTO_LAB').AsString),20)]);
             LineaMCD.DirLab := Format('%60s',[leftstr(Trim(CDDatos.FieldByName('DIRECCION_LAB').AsString),60)]);
             LineaMCD.TelLab := Format('%12s',[leftstr(Trim(CDDatos.FieldByName('TELEFONO_LAB').AsString),12)]);

             LineaMCD.CiuCor := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_CIUDAD_COR').AsString),20)]);
             LineaMCD.CodCiuCor := StringReplace(Format('%8s',[IntToStr(CDDatos.FieldByName('COD_CIUDAD_COR').AsInteger)]),' ','0',[rfReplaceAll]);
             LineaMCD.DptoCor := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_DPTO_COR').AsString),20)]);
             if (Trim(CDDatos.FieldByName('DIRECCION_COR').AsString) = '') then
                 LineaMCD.DirCor := Format('%60s',[leftstr(Trim(CDDatos.FieldByName('DIRECCION_RES').AsString),60)])
             else
                 LineaMCD.DirCor := Format('%60s',[leftstr(Trim(CDDatos.FieldByName('DIRECCION_COR').AsString),60)]);

             LineaMCD.Email := '                                                            ';
             LineaMCD.Celular := '000000000000';
             LineaMCD.SDestino := '000000';
             LineaMCD.NumTarjeta := '                  ';
             LineaMCD.DetGarantia := ' ';
             LineaMCD.Blanco := '                  ';

             PlanoMovDataCartera.Add(LineaMCD.TpIden + LineaMCD.Identificacion + LineaMCD.Numero + LineaMCD.Nombre + LineaMCD.STitular +
                              LineaMCD.FApertura + LineaMCD.FVencim + LineaMCD.Calidad + LineaMCD.TpObli + LineaMCD.SHipot +
                              LineaMCD.FSHipot + LineaMCD.TContrato + LineaMCD.FoPago + LineaMCD.PePago + LineaMCD.Novedad + LineaMCD.EOrigCta +
                              LineaMCD.FEOrigCta + LineaMCD.ECuenta + LineaMCD.FECuenta + LineaMCD.EPlastico + LineaMCD.FEPlastico + LineaMCD.Adjetivo + LineaMCD.FAdjetivo +
                              LineaMCD.CTarjeta + LineaMCD.Franquicia + LineaMCD.NomMarPriv + LineaMCD.TpMon + LineaMCD.TpGar + LineaMCD.Califi + LineaMCD.PIncump + LineaMCD.EdMora + LineaMCD.VInicial +
                              LineaMCD.VSaldo + LineaMCD.VDisp + LineaMCD.VCuota + LineaMCD.VMora + LineaMCD.TCuotas + LineaMCD.CuotasPag + LineaMCD.CuotasMora +
                              LineaMCD.CPerman + LineaMCD.FCPerman + LineaMCD.FLimPago + LineaMCD.FPago + LineaMCD.Oficina + LineaMCD.CiuRad + LineaMCD.CodCiuRad +
                              LineaMCD.CiuRes + LineaMCD.CodCiuRes + LineaMCD.DptoRes + LineaMCD.DirRes + LineaMCD.TelRes + LineaMCD.CiuLab + LineaMCD.CodCiuLab +
                              LineaMCD.DptoLab + LineaMCD.DirLab + LineaMCD.TelLab + LineaMCD.CiuCor + LineaMCD.CodCiuCor + LineaMCD.DptoCor + LineaMCD.DirCor +
                              LineaMCD.Email + LineaMCD.Celular + LineaMCD.SDestino + LineaMCD.NumTarjeta + LineaMCD.DetGarantia + LineaMCD.Blanco);

             SumaRegistros := SumaRegistros + 1;
             Application.ProcessMessages;
             CDDatos.Next;
           end; // fin while

        CheckBox8.Checked := True;
        CDDatos.Close;
        IBQuery11.Close;
        Application.ProcessMessages;
end;


procedure TfrmConsolidarData.EncabezadoDatacreditoClientes;
var cadena:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Encabezado del Archivo
      cadena := 'HHHHHHHHHHHHHHHHHH';
      LineaEncDataClientes := cadena;
// Codigo
      cadena := CodigoData;
      LineaEncDataClientes := LineaEncDataClientes + cadena;
// Tipo de Cliente
      cadena := TipoData;
      LineaEncDataClientes := LineaEncDataClientes + cadena;
// Fecha Corte
      cadena := Format('%.4d',[YearOf(DTfecha.Date)])+ Format('%.2d',[monthOf(DTfecha.Date)]) + Format('%.2d',[DayOf(DTfecha.Date)]);
      LineaEncDataClientes := LineaEncDataClientes + cadena;
// Ampliación Milenio
      cadena := 'M';
      LineaEncDataClientes := LineaEncDataClientes + cadena;
//  Tipo Entrega
      cadena := 'T';
      LineaEncDataClientes := LineaEncDataClientes + cadena;
// Fecha de Inicio
      cadena := '        ';
      LineaEncDataClientes := LineaEncDataClientes + cadena;
// Fecha de Fin
      cadena := '        ';
      LineaEncDataClientes := LineaEncDataClientes + cadena;
// Indicador de Partir
      cadena := 'N';
      LineaEncDataClientes := LineaEncDataClientes + cadena;
{ Ya no se reporta este campo
// Nit
      cadena := StringReplace(Format('%11s',[MidStr(Nit,1,9)]),' ','0',[rfReplaceAll]);//'00890505363';
      LineaEncDataClientes := LineaEncDataClientes + cadena;
}
// Relleno
      cadena := '';
      i1 := 55;
      i2 := 800;
      for J := i1 to i2 do
         if (i1 <= 380) then
          cadena := cadena + '0'
         else
          cadena := cadena + ' ';
      LineaEncDataClientes := LineaEncDataClientes + cadena;

      PlanoMovDataClientes.Add(LineaEncDataClientes);
      CheckBox1.Checked := True;
end;

procedure TfrmConsolidarData.FinDatacreditoClientes;
var cadena:string;
    i1,i2 :Integer;
    J:Integer;
    IBQuery1:TIBQuery;
begin
// Generar Identificador
      cadena := 'ZZZZZZZZZZZZZZZZZZ';
      LineaFinDataClientes := cadena;
// Fecha Proceso
      cadena := Format('%.4d',[YearOf(Date)]) + Format('%.2d',[monthOf(Date)])+ Format('%.2d',[dayof(Date)]);
      LineaFinDataClientes := LineaFinDataClientes + cadena;
// Numero de Regitros
      cadena := StringReplace(Format('%8d',[SumaRegistros + 2]),' ','0',[rfReplaceAll]);
      LineaFinDataClientes := LineaFinDataClientes + cadena;
// Sumatoria Numeros de identificacion
      LineaFinDataClientes := LineaFinDataClientes + StringReplace(Format('%8s',[CURRToStr(sumaidentificacion)]),' ','0',[rfReplaceAll]);
{      IBQuery1 := TIBQuery.Create(nil);
      IBQuery1.Transaction  := dmGeneral.IBTransaction1;
      with IBQuery1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select SUM(CAST(ID_PERSONA AS FLOAT)) AS TOTAL from "col$centralriesgotmp" WHERE FECHA_CORTE = :FECHA_CORTE');
         ParamByNAme('FECHA_CORTE').AsDate := DTFecha.Date;
         try
          Open;
          LineaFinDataClientes := LineaFinDataClientes + StringReplace(Format('%18s',[CURRToStr(IBQuery1.FieldByName('TOTAL').AsCurrency)]),' ','0',[rfReplaceAll]);
         except
            Transaction.Rollback;
            raise;
         end;
      end;
      IBQuery1.Free;}


// Relleno
      cadena := '';
      i1 := 43;
      i2 := 800;
      for J := i1 to i2 do
          cadena := cadena + ' ';
      LineaFinDataClientes := LineaFinDataClientes + cadena;

      CheckBox5.Checked := True;
end;

procedure TfrmConsolidarData.EncabezadoDatacreditoCartera;
var cadena:string;
    LineaC:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Encabezado del Archivo
      cadena := 'HHHHHHHHHHHHHHHHHH';
      LineaEncDataCartera := cadena;
// Codigo
      cadena := CodigoData;
      LineaEncDataCartera := LineaEncDataCartera + cadena;
// Tipo de Cliente
      cadena := TipoData;
      LineaEncDataCartera := LineaEncDataCartera + cadena;
// Fecha Corte
      cadena := Format('%.4d',[YearOf(DTfecha.Date)])+ Format('%.2d',[monthOf(DTfecha.Date)]) + Format('%.2d',[DayOf(DTfecha.Date)]);
      LineaEncDataCartera := LineaEncDataCartera + cadena;
// Ampliación Milenio
      cadena := 'M';
      LineaEncDataCartera := LineaEncDataCartera + cadena;
// Separación
      LineaEncDataCartera := LineaEncDataCartera + ' ';
//  Tipo Entrega
      cadena := 'T';
      LineaEncDataCartera := LineaEncDataCartera + cadena;
// Fecha de Inicio
      cadena := '        ';
      LineaEncDataCartera := LineaEncDataCartera + cadena;
// Fecha de Fin
      cadena := '        ';
      LineaEncDataCartera := LineaEncDataCartera + cadena;
// Indicador de Partir
      cadena := 'N';
      LineaEncDataCartera := LineaEncDataCartera + cadena;
{ Ya no se reporta este campo
// Nit
      cadena := StringReplace(Format('%11s',[MidStr(Nit,1,9)]),' ','0',[rfReplaceAll]);//'00890505363';
      LineaEncDataClientes := LineaEncDataClientes + cadena;
}
// Relleno
      cadena := '';
      i1 := 55;
      i2 := 800;
      for J := i1 to i2 do
         if (i1 <= 380) then
          cadena := cadena + '0'
         else
          cadena := cadena + ' ';
      LineaEncDataCartera := LineaEncDataCartera + cadena;

      PlanoMovDataCartera.Add(LineaEncDataCartera);
      CheckBox7.Checked := True;
end;

procedure TfrmConsolidarData.FinDatacreditoCartera;
var cadena:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Identificador
      cadena := 'ZZZZZZZZZZZZZZZZZZ';
      LineaFinDataCartera := cadena;
// Fecha Proceso
      cadena := Format('%.4d',[YearOf(Date)]) + Format('%.2d',[monthOf(Date)]) + Format('%.2d',[dayof(Date)]) ;
      LineaFinDataCartera := LineaFinDataCartera + cadena;
// Numero de Regitros
      cadena := StringReplace(Format('%8d',[SumaRegistros + 2]),' ','0',[rfReplaceAll]);
      LineaFinDataCartera := LineaFinDataCartera + cadena;
// Sumatoria Novedades
      cadena := StringReplace(Format('%8d',[SumaNovedad]),' ','0',[rfReplaceAll]);
      LineaFinDataCartera := LineaFinDataCartera + cadena;
// Relleno
      cadena := '';
      i1 := 43;
      i2 := 800;
      for J := i1 to i2 do
          cadena := cadena + ' ';
      LineaFinDataCartera := LineaFinDataCartera + cadena;
      CheckBox9.Checked := True;
end;


procedure TfrmConsolidarData.DTfechaExit(Sender: TObject);
begin
        MesCorteAct := IntToStr(YearOf(DTfecha.Date)) + FormatCurr('00',MonthOf(DTfecha.Date-1)) + FormatCurr('00',DayOf(DTfecha.Date));

end;

procedure TfrmConsolidarData.CmdCifinClick(Sender: TObject);
begin
        CmdCifin.Enabled := False;

        EncabezadoCifin;
        ClientesCifin;
        FinCifin;

        PlanoMovCifin.Add(LineaF);
        PlanoEncCifin.AddStrings(PlanoMovCifin);
        PlanoEncCifin.SaveToFile('C:\ReporteCentrales\CSC' + CodigoCifin + MesCorteAct + '.TXT');
        FreeAndNil(PlanoEncCifin);
        FreeAndNil(PlanoMovCifin);
        LBCifin.Caption := 'Plano Cifin Exitoso!!';
end;

procedure TfrmConsolidarData.EncabezadoCifin;
var cadena:string;
    LineaE:Registro1;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Encabezado del Archivo
      LineaE.TRegistro := '1';
      LineaE.TProducto := '21';
      LineaE.TEntidad := LeftStr(CodigoCifin,3);
      LineaE.CEntidad := RightStr(CodigoCifin,3);
//      LineaE.IdenCifin := '162519            ';
      LineaE.Reservado := '          ';
      LineaE.TipoReporte := '01';
      LineaE.FCorte := Format('%.4d',[YearOf(DTfecha.Date)]) + Format('%.2d',[monthOf(DTfecha.Date)]) + Format('%.2d',[Dayof(DTfecha.Date)]);

      PlanoEncCifin.Add(LineaE.TRegistro + LineaE.TProducto + LineaE.TEntidad+
                        LineaE.CEntidad + LineaE.Reservado + LineaE.TipoReporte + LineaE.FCorte);

      CheckBox3.Checked := True;
end;

procedure TfrmConsolidarData.ClientesCifin;
var cadena,Relleno:string;
    LineaC:Registro2;
    ColocacionNew:string;
    DiasMora:Integer;
    Apel1,Apel2,Nombre:string;
    Identificacion:string;
    Ident:Int64;
    AgenciaLocal:Integer;
    ColocacionLocal:string;
    Tmp:Currency;

    i1,i2 :Integer;
    J:Integer;
    Nit:string;
    CNit:Integer;
    AnosMora:Double;
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        SumaRegistros := 0;
        SumaObligaciones := 0;

        Relleno := '';
        i1 := 648;
        i2 := 777;
        for J := i1 to i2 do
          Relleno := Relleno + ' ';

        with IBQuery11 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$centralriesgotmp" WHERE FECHA_CORTE = :FECHA_CORTE');
           ParamByName('FECHA_CORTE').AsDate := DTfecha.Date;
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información para Procesar',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;

           DPDatos.DataSet := IBQuery11;
           CDDatos.ProviderName := 'DPDatos';
           CDDatos.Open;
           CDDatos.Last;
           CDDatos.First;
           BarCifin.Min := 0;
           BarCifin.Max := CDDatos.RecordCount;
           BarCifin.Position := 0;

           while not CDDatos.Eof do begin
             BarCifin.Position := CDDatos.RecNo;
             Application.ProcessMessages;
             LBCifin.Caption := CDDatos.FieldByName('ID_COLOCACION').AsString;
             if MidStr(CDDatos.FieldByName('ID_COLOCACION').AsString,17,1) = 'C' then
              begin
                AgenciaLocal := CDDatos.FieldByName('ID_AGENCIA').AsInteger;
                ColocacionLocal := '00' + MidStr(CDDatos.FieldByName('ID_COLOCACION').AsString,1,16);
                LineaC.Calidad := 'C';
              end
             else
              begin
                AgenciaLocal := CDDatos.FieldByName('ID_AGENCIA').AsInteger;
                ColocacionLocal := CDDatos.FieldByName('ID_COLOCACION').AsString;
                LineaC.Calidad := 'P';
                SumaObligaciones := SumaObligaciones + 1;
              end;
             // Proceso informacion Clientes
             LineaC.TRegistro := '2';
             case CDDatos.FieldByName('TIPO_IDENTIFICACION').AsInteger of
               3 : LineaC.TIden := '01';
               4 : LineaC.TIden := '02';
               6 : LineaC.TIden := '03';
               7 : LineaC.TIden := '02';
               2 : LineaC.TIden := '04';
               8 : LineaC.TIden := '05';
               1 : LineaC.TIden := '09';
               0 : LineaC.TIden := '01';
             end;

             if (LineaC.TIden = '02') then
              begin
                CNit := StrLen(PChar(CDDatos.FieldByName('ID_PERSONA').AsString));
                Nit := LeftStr(CDDatos.FieldByName('ID_PERSONA').AsString,CNit-1);
                LineaC.NJuridica := '007';
              end
             else
              begin
               Nit := CDDatos.FieldByName('ID_PERSONA').AsString;
               LineaC.NJuridica := '000';
              end;

             Ident := StrToInt64(Nit);

             Identificacion := Format('%-15s',[IntToStr(Ident)]);
             LineaC.Identificacion := Identificacion;
             LineaC.Nombre := Format('%-60s',[leftstr(Trim(CDDatos.FieldByName('NOMBRECIFIN').AsString),60)]);
             LineaC.Reserva := '  ';
             LineaC.Numero := '00' + ColocacionLocal;
             LineaC.CodSuc := '00000' + IntToStr(AgenciaLocal);
             if CDDatos.FieldByName('CALIFICACION').AsString = 'A' then
               LineaC.Califi := '01'
             else if CDDatos.FieldByName('CALIFICACION').AsString = 'B' then
               LineaC.Califi := '02'
             else if CDDatos.FieldByName('CALIFICACION').AsString = 'C' then
               LineaC.Califi := '03'
             else if CDDatos.FieldByName('CALIFICACION').AsString = 'D' then
               LineaC.Califi := '04'
             else if CDDatos.FieldByName('CALIFICACION').AsString = 'E' then
               LineaC.Califi := '05';

             LineaC.EstadoTit := '06'; //Pendiente Revisar
             case CDDatos.FieldByName('ESTADO').AsInteger of
               0 : LineaC.Estado := '01';
               1 : LineaC.Estado := '01';
               2 : LineaC.Estado := '04';
               3 : LineaC.Estado := '06';
               6 : LineaC.Estado := '08';
               7 : LineaC.Estado := '07';
               8 : LineaC.Estado := '01';
               9 : LineaC.Estado := '01';
              10 : LineaC.Estado := '07';
              12 : LineaC.Estado := '08';
              13 : LineaC.Estado := '08';
             end;

             if LineaC.Estado = '06' then
               LineaC.Califi := '06';

             if LineaC.Estado = '07' then
               LineaC.Califi := '01';

             if (CDDatos.FieldByName('ESTADO').AsInteger = 2) or (CDDatos.FieldByName('ESTADO').AsInteger = 3) then
              begin
                if (CDDatos.FieldByName('DIASMORA').AsInteger < 30) then LineaC.EdMora := '00'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 30) and (CDDatos.FieldByName('DIASMORA').AsInteger < 60) then LineaC.EdMora := '01'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 60) and (CDDatos.FieldByName('DIASMORA').AsInteger < 90) then LineaC.EdMora := '02'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 90) and (CDDatos.FieldByName('DIASMORA').AsInteger < 120) then LineaC.EdMora := '03'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 120) and (CDDatos.FieldByName('DIASMORA').AsInteger < 150) then LineaC.EdMora := '04'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 150) and (CDDatos.FieldByName('DIASMORA').AsInteger < 180) then LineaC.EdMora := '05'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 180) and (CDDatos.FieldByName('DIASMORA').AsInteger < 210) then LineaC.EdMora := '06'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 210) and (CDDatos.FieldByName('DIASMORA').AsInteger < 240) then LineaC.EdMora := '07'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 240) and (CDDatos.FieldByName('DIASMORA').AsInteger < 270) then LineaC.EdMora := '08'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 270) and (CDDatos.FieldByName('DIASMORA').AsInteger < 300) then LineaC.EdMora := '09'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 300) and (CDDatos.FieldByName('DIASMORA').AsInteger < 330) then LineaC.EdMora := '10'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 330) and (CDDatos.FieldByName('DIASMORA').AsInteger < 360) then LineaC.EdMora := '11'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 360) and (CDDatos.FieldByName('DIASMORA').AsInteger < 540) then LineaC.EdMora := '12'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 540) and (CDDatos.FieldByName('DIASMORA').AsInteger < 730) then LineaC.EdMora := '13'
                else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 730) then LineaC.EdMora := '14';
              end
             else
              begin
               if (CDDatos.FieldByName('DIASMORA').AsInteger < 61) then LineaC.EdMora := '00'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 61) and (CDDatos.FieldByName('DIASMORA').AsInteger < 90) then LineaC.EdMora := '02'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 90) and (CDDatos.FieldByName('DIASMORA').AsInteger < 120) then LineaC.EdMora := '03'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 120) and (CDDatos.FieldByName('DIASMORA').AsInteger < 150) then LineaC.EdMora := '04'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 150) and (CDDatos.FieldByName('DIASMORA').AsInteger < 180) then LineaC.EdMora := '05'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 180) and (CDDatos.FieldByName('DIASMORA').AsInteger < 210) then LineaC.EdMora := '06'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 210) and (CDDatos.FieldByName('DIASMORA').AsInteger < 240) then LineaC.EdMora := '07'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 240) and (CDDatos.FieldByName('DIASMORA').AsInteger < 270) then LineaC.EdMora := '08'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 270) and (CDDatos.FieldByName('DIASMORA').AsInteger < 300) then LineaC.EdMora := '09'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 300) and (CDDatos.FieldByName('DIASMORA').AsInteger < 330) then LineaC.EdMora := '10'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 330) and (CDDatos.FieldByName('DIASMORA').AsInteger < 360) then LineaC.EdMora := '11'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 360) and (CDDatos.FieldByName('DIASMORA').AsInteger < 540) then LineaC.EdMora := '12'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 540) and (CDDatos.FieldByName('DIASMORA').AsInteger < 730) then LineaC.EdMora := '13'
               else if (CDDatos.FieldByName('DIASMORA').AsInteger >= 730) then LineaC.EdMora := '14';
              end;
             
             if (LineaC.EdMora = '14') then
              begin
               AnosMora := SimpleRoundTo(CDDatos.FieldByName('DIASMORA').AsInteger/365.25,0);
               LineaC.AnosMora := StringReplace(Format('%2s',[CurrToStr(AnosMora)]),' ','0',[rfReplaceAll]);
              end
             else
              begin
               AnosMora := 0;
               LineaC.AnosMora := '00';
              end;

             LineaC.FechaC := IntToStr(YearOf(CDDatos.FieldByName('FECHA_CORTE').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_CORTE').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_CORTE').AsDateTime));
             if CDDatos.FieldByName('FECHA_DESEMBOLSO').AsDateTime > CDDatos.FieldByName('FECHA_CORTE').AsDateTime then
                LineaC.FInicial := IntToStr(YearOf(CDDatos.FieldByName('FECHA_CORTE').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_CORTE').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_CORTE').AsDateTime))
             else
                LineaC.FInicial := IntToStr(YearOf(CDDatos.FieldByName('FECHA_DESEMBOLSO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_DESEMBOLSO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_DESEMBOLSO').AsDateTime));
             LineaC.FTermi := IntToStr(YearOf(CDDatos.FieldByName('FECHA_VENCIMIENTO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_VENCIMIENTO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_VENCIMIENTO').AsDateTime));

             if (LineaC.EdMora = '14') and (AnosMora >= 6) and (CDDatos.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime <> 0) then
               LineaC.FExig := IntToStr(YearOf(CDDatos.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime))
             else
               LineaC.FExig := '        ';
             LineaC.FPres := '        ';

             if (CDDatos.FieldByName('FECHA_LIMITE_PAGO').AsDateTime = 0) then
               LineaC.FechaLimitePago := '00000000'
             else
               LineaC.FechaLimitePago := IntToStr(YearOf(CDDatos.FieldByName('FECHA_LIMITE_PAGO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_LIMITE_PAGO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_LIMITE_PAGO').AsDateTime));

             if LineaC.Estado = '07' then
              begin
                LineaC.ModoExt := '01';
                LineaC.TipoPago := '01';
                if (CDDatos.FieldByName('FECHA_PAGO').AsDateTime = 0) then
                  LineaC.FUPago := '        '
                else
                  LineaC.FUPago := IntToStr(YearOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime));
              end
             else if LineaC.Estado = '08' then
              begin
                LineaC.ModoExt := '02';
                LineaC.TipoPago := '02';
                if (CDDatos.FieldByName('FECHA_PAGO').AsDateTime = 0) then
                  LineaC.FUPago := '        '
                else
                  LineaC.FUPago := IntToStr(YearOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',MonthOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime)) + FormatCurr('00',DayOf(CDDatos.FieldByName('FECHA_PAGO').AsDateTime));
              end
             else
              begin
                LineaC.ModoExt := '  ';
                LineaC.TipoPago := '  ';
                LineaC.FUPago :=  '        ';
              end;

             case CDDatos.FieldByName('PERIOCIDAD_PAGO').AsInteger of
                30  : LineaC.PePago := '07';
                60  : LineaC.PePago := '10';
                90  : LineaC.PePago := '13';
                180 : LineaC.PePago := '16';
                360 : LineaC.PePago := '19';
              end;

             if LineaC.PePago = '' then
               LineaC.PePago := '23';

             LineaC.ProbNoPago := '   ';
             LineaC.CuotasPag := StringReplace(Format('%3s',[leftstr(Trim(IntToStr(CDDatos.FieldByName('CUOTAS_PAGADAS').AsInteger)),3)]),' ','0',[rfReplaceAll]);
             LineaC.CuotasPac := StringReplace(Format('%3s',[leftstr(Trim(IntToStr(CDDatos.FieldByName('CUOTAS_TOTAL').AsInteger)),3)]),' ','0',[rfReplaceAll]);
             LineaC.CuotasMora := StringReplace(Format('%3s',[leftstr(Trim(IntToStr(CDDatos.FieldByName('CUOTAS_MORA').AsInteger)),3)]),' ','0',[rfReplaceAll]);
             Tmp := CDDatos.FieldByName('VALOR').AsCurrency;
             LineaC.ValIni := StringReplace(Format('%12s',[CurrToStr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
             Tmp := CDDatos.FieldByName('VALOR_MORA').AsCurrency;
             LineaC.ValMora := StringReplace(Format('%12s',[CurrToStr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
             Tmp := CDDatos.FieldByName('SALDO').AsCurrency;
             LineaC.VSaldo := StringReplace(Format('%12s',[CurrToStr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
             Tmp := CDDatos.FieldByName('VALOR_CUOTA').AsCurrency;
             LineaC.VCuota := StringReplace(Format('%12s',[CurrToStr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);

             if (LineaC.Estado = '07') or (LineaC.Estado = '08') then
              begin
                LineaC.VSaldo := '000000000000';
                LineaC.CuotasMora := '000';
                LineaC.ValMora := '000000000000';
                LineaC.VCuota := '000000000000';
                LineaC.EdMora := '00';
              end;

             if (LineaC.Estado = '07') and (CDDatos.FieldByName('CUOTAS_PAGADAS').AsInteger <= 0) then
               LineaC.CuotasPag := '001';

             if (LineaC.EdMora = '00') then
              begin
                LineaC.CuotasMora := '000';
                LineaC.ValMora := '000000000000';
              end;

             if (LineaC.EdMora <> '00') then
              begin
                if LineaC.CuotasMora = '000' then
                  LineaC.CuotasMora := '001';
                if LineaC.ValMora = '000000000000' then
                  LineaC.ValMora := '000000000001';
              end;

             LineaC.VCargoF := '            ';
             LineaC.LineaC := '003';
             LineaC.ClauPerm := '   ';
             LineaC.TipoCon := '001';
             if (CDDatos.FieldByName('ESTADO').AsInteger = 0) or (CDDatos.FieldByName('ESTADO').AsInteger = 1)
             or (CDDatos.FieldByName('ESTADO').AsInteger = 2) or (CDDatos.FieldByName('ESTADO').AsInteger = 8)
             or (CDDatos.FieldByName('ESTADO').AsInteger = 9) then
               LineaC.EstadoCon := '001'
             else
               LineaC.EstadoCon := '002';
             LineaC.TerVigCon := '  ';
             LineaC.MesesCon := '   ';
             LineaC.ModalC := '0' + IntToStr(CDDatos.FieldByName('CLASIFICACION').AsInteger);
             LineaC.TpMone := '01';
             if (CDDatos.FieldByName('ID_GARANTIA').AsInteger = 1) then
               LineaC.TpGar := '19'
             else
               LineaC.TpGar := '14';

             Tmp := CDDatos.FieldByName('VALOR_GARANTIA').AsCurrency;
             LineaC.VGar := StringReplace(Format('%12s',[CurrToStr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
             LineaC.Reest := '02';
             LineaC.NatReest := '  ';
             LineaC.NumReest := '   ';
             LineaC.CamposTarj := '                                 ';
             LineaC.DirCasa := Format('%60s',[leftstr(Trim(CDDatos.FieldByName('DIRECCION_RES').AsString),60)]);
             LineaC.TelCasa := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('TELEFONO_RES').AsString),20)]);
             LineaC.CodCiuCasa := StringReplace(Format('%6s',[IntToStr(CDDatos.FieldByName('COD_CIUDAD_RES').AsInteger)]),' ','0',[rfReplaceAll]);
             LineaC.CiuCasa := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_CIUDAD_RES').AsString),20)]);
             LineaC.CodDptoCasa := StringReplace(Format('%3s',[IntToStr(CDDatos.FieldByName('COD_DPTO_RES').AsInteger)]),' ','0',[rfReplaceAll]);
             LineaC.DptoCasa := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_DPTO_RES').AsString),20)]);

             LineaC.Empresa := Format('%60s',[leftstr(Trim(CDDatos.FieldByName('NOMBRE_EMPLEADOR').AsString),60)]);
             LineaC.DirEmpresa := Format('%60s',[leftstr(Trim(CDDatos.FieldByName('DIRECCION_LAB').AsString),60)]);
             LineaC.TelEmpresa := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('TELEFONO_LAB').AsString),20)]);
             LineaC.CodCiuEmp := StringReplace(Format('%6s',[IntToStr(CDDatos.FieldByName('COD_CIUDAD_LAB').AsInteger)]),' ','0',[rfReplaceAll]);
             LineaC.CiuEmp := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_CIUDAD_LAB').AsString),20)]);
             LineaC.CodDptoEmp := StringReplace(Format('%3s',[IntToStr(CDDatos.FieldByName('COD_DPTO_LAB').AsInteger)]),' ','0',[rfReplaceAll]);
             LineaC.DptoEmp := Format('%20s',[leftstr(Trim(CDDatos.FieldByName('NOM_DPTO_RES').AsString),20)]);

             // Relleno

             LineaC.Relleno := Relleno;

             PlanoMovCifin.Add(LineaC.TRegistro + LineaC.TIden + LineaC.Identificacion +
                                  LineaC.Nombre + LineaC.Reserva + LineaC.FechaLimitePago + LineaC.Numero + LineaC.CodSuc +
                                  LineaC.Calidad + LineaC.Califi + LineaC.EstadoTit + LineaC.Estado +
                                  LineaC.EdMora + LineaC.AnosMora + LineaC.FechaC + LineaC.FInicial +
                                  LineaC.FTermi + LineaC.FExig + LineaC.FPres + LineaC.FUPago +
                                  LineaC.ModoExt + LineaC.TipoPago + LineaC.PePago + LineaC.ProbNoPago +
                                  LineaC.CuotasPag + LineaC.CuotasPac + LineaC.CuotasMora + LineaC.ValIni +
                                  LineaC.ValMora + LineaC.VSaldo + LineaC.VCuota + LineaC.VCargoF +
                                  LineaC.LineaC + LineaC.ClauPerm + LineaC.TipoCon + LineaC.EstadoCon  +
                                  LineaC.TerVigCon + LineaC.MesesCon + LineaC.NJuridica + LineaC.ModalC  +
                                  LineaC.TpMone + LineaC.TpGar + LineaC.VGar + LineaC.Reest +
                                  LineaC.NatReest + LineaC.NumReest + LineaC.CamposTarj + LineaC.DirCasa +
                                  LineaC.TelCasa + LineaC.CodCiuCasa + LineaC.CiuCasa + LineaC.CodDptoCasa +
                                  LineaC.DptoCasa + LineaC.Empresa + LineaC.DirEmpresa + LineaC.TelEmpresa +
                                  LineaC.CodCiuEmp + LineaC.CiuEmp + LineaC.CodDptoEmp + LineaC.DptoEmp +
                                  LineaC.Relleno);

             SumaRegistros := SumaRegistros + 1;
             Application.ProcessMessages;
             CDDatos.Next;
           end; // fin while

        CheckBox4.Checked := True;
        CDDatos.Close;
        IBQuery11.Close;
        Application.ProcessMessages;
end;

procedure TfrmConsolidarData.FinCifin;
var cadena:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Identificador
      cadena := '9';
      LineaF := cadena;
// Numero de Registros
      cadena := StringReplace(Format('%8d',[SumaRegistros + 2]),' ','0',[rfReplaceAll]);
      LineaF := LineaF + cadena;
      cadena := StringReplace(Format('%8d',[SumaRegistros]),' ','0',[rfReplaceAll]);
      LineaF := LineaF + cadena;
      cadena := '0000000000000000';
      LineaF := LineaF + cadena;

//      PlanoReporte.Add(LineaF);
      CheckBox6.Checked := True;
end;

procedure TfrmConsolidarData.EliminarExcluidas;
var
SQLQuery1:TIBQuery;
begin
        SQLQuery1 := TIBQuery.Create(nil);
        SQLQuery1.Transaction := dmGeneral.IBTransaction1;
        if SQLQuery1.Transaction.InTransaction then
          SQLQuery1.Transaction.Rollback;
        SQLQuery1.Transaction.StartTransaction;

        SQLQuery1.SQL.Clear;
        SQLQuery1.SQL.Add('EXECUTE PROCEDURE ELIMINAR_EXCLUIDAS_DATA');
        SQLQuery1.Open;
        Application.ProcessMessages;
        SQLQuery1.Transaction.Commit;
        SQLQuery1.Free;
end;


function TfrmConsolidarData.Novedad(Dias, Estado: integer): string;
var
Novedad:string;
begin
        if (Dias < 30) then Novedad := '01'
        else if (Dias >= 30) and (Dias < 60) then Novedad := '06'
        else if (Dias >= 60) and (Dias < 90) then Novedad := '07'
        else if (Dias >= 90) and (Dias < 120) then Novedad := '08'
        else if (Dias >= 120) and (Dias < 180) then Novedad := '09'
        else if (Dias >= 180) then Novedad := '12';

        if (Estado = 2) then Novedad := '12';
        if (Estado = 3) then Novedad := '13';
        if (Estado = 6) then Novedad := '14';
        if (Estado = 7) then Novedad := '05';
        if (Estado = 10) then Novedad := '05';
        if (Estado = 12) then Novedad := '14';
        if (Estado = 13) then Novedad := '14';                

        Result := Novedad;
end;

end.
