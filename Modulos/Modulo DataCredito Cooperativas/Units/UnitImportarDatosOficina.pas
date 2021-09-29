unit UnitImportarDatosOficina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvToolEdit, IBDatabase,
  IBCustomDataSet, IBQuery, Provider, DB, DBClient, UnitDmGeneral;

type
  TfrmImportarDatosOficina = class(TForm)
    Panel1: TPanel;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label1: TLabel;
    EdFileName: TJvFilenameEdit;
    lblMessage: TLabel;
    DataOficina: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure CmdProcesarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportarDatosOficina: TfrmImportarDatosOficina;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmImportarDatosOficina.CmdProcesarClick(Sender: TObject);
var
  PlanoReporte: TStringList;
  PartesCadena: TStringList;
  Lineas: Integer;
  Linea: Integer;
  cadena: String;

  ID_AGENCIA: Integer; // 01
  ID_COLOCACION: String; // 02
  TIPO_IDENTIFICACION: Integer; // 03
  ID_PERSONA: String; // 04
  NOMBREDATA: String; // 05
  NOMBRECIFIN: String; // 06
  FECHA_EXP_DOC: TDate; // 07
  COD_LUGAR_EXP_DOC: Integer; // 08
  FECHA_NACIMIENTO: TDate; // 09
  CIIU: Integer; // 10
  ESTRATO: String; // 11
  PERSONA_A_CARGO: Integer; // 12
  FECHA_ACT_DATOS: TDate; // 13
  ESTADO_CIVIL: Integer; // 14
  NIVEL_ESTUDIOS: Integer; // 15
  INGRESOS: Currency; // 16
  ACTIVOS: Currency;  // 17
  PASIVOS: Currency;  // 18
  FECHA_BALANCE: TDate; // 19
  NOMBRE_EMPLEADOR: String; // 20
  FECHA_ING_EMPRESA: TDate; // 21
  TIPO_CONTRATO: Integer; // 22
  OCUPACION: Integer;  // 23
  CLASIFICACION: Integer; // 24
  CALIFICACION: String; // 25
  ESTADO: Integer; // 26
  DIASMORA: Integer; // 27
  FECHA_DESEMBOLSO: TDate; // 28
  FECHA_VENCIMIENTO: TDate; // 29
  FECHA_EXIGIBILIDAD: TDate; // 30
  FECHA_PRESCRIPCION: TDate; // 31
  FECHA_PAGO: TDate; // 32
  PERIOCIDAD_PAGO: Integer; // 33
  CUOTAS_PAGADAS: Integer; // 34
  CUOTAS_TOTAL: Integer; // 35
  CUOTAS_MORA: Integer; // 36
  VALOR: Currency; // 37
  SALDO: Currency; // 38
  VALOR_CUOTA: Currency; // 39
  VALOR_MORA: Currency;  // 40
  ID_GARANTIA: Integer;  // 41
  VALOR_GARANTIA: Currency; // 42
  FECHA_LIMITE_PAGO: TDate; // 43
  COD_CIUDAD_RAD: String; // 44
  NOM_CIUDAD_RAD: String; // 45
  COD_CIUDAD_RES: String; // 46
  NOM_CIUDAD_RES: String; // 47
  COD_DPTO_RES: String; // 48
  NOM_DPTO_RES: String; // 49
  DIRECCION_RES: String; // 50
  TELEFONO_RES: String;  // 51
  COD_CIUDAD_LAB: String; // 52
  NOM_CIUDAD_LAB: String; // 53
  COD_DPTO_LAB: String; // 54
  NOM_DPTO_LAB: String; // 55
  DIRECCION_LAB: String; // 56
  TELEFONO_LAB: String;  // 57
  COD_CIUDAD_COR: String; // 58
  NOM_CIUDAD_COR: String; // 59
  NOM_DPTO_COR: String; // 60
  DIRECCION_COR :String; // 61
  FECHA_CORTE : TDate; // 62
begin
        PlanoReporte := TStringList.Create;
        PartesCadena := TStringList.Create;
        PlanoReporte.LoadFromFile(EdFileName.FileName);
        IBTransaction1.StartTransaction;
        DataOficina.Open;
        lblMessage.Caption := 'Importando Datos...';
        Lineas := PlanoReporte.Count;
        for Linea := 0 to Lineas - 1 do
        begin
           Application.ProcessMessages;
           cadena := PlanoReporte.Strings[Linea];
           PartesCadena.Text := StringReplace(cadena, ';', #13#10, [rfReplaceAll]);
           if (PartesCadena[0] <> '') then
           ID_AGENCIA := StrToInt(PartesCadena[0]);
           if (PartesCadena[1] <> '') then
           ID_COLOCACION := PartesCadena[1];
           lblMessage.Caption := 'Importando Datos...' + ID_COLOCACION;
           if (PartesCadena[2] <> '') then
           TIPO_IDENTIFICACION := StrToInt(PartesCadena[2]);
           if (PartesCadena[3] <> '') then
           ID_PERSONA := PartesCadena[3];
           if (PartesCadena[4] <> '') then
           NOMBREDATA := PartesCadena[4];
           if (PartesCadena[5] <> '') then
           NOMBRECIFIN:= PartesCadena[5];
           if (PartesCadena[6] <> '') then
           FECHA_EXP_DOC:= StrToDate(PartesCadena[6]);
           if (PartesCadena[7] <> '') then
           COD_LUGAR_EXP_DOC:= StrToInt(PartesCadena[7]);
           if (PartesCadena[8] <> '') then
           FECHA_NACIMIENTO:= StrToDate(PartesCadena[8]);
           if (PartesCadena[9] <> '') then
           CIIU:= StrToInt(PartesCadena[9]);
           if (PartesCadena[10] <> '') then
           ESTRATO:= PartesCadena[10];
           if (PartesCadena[11] <> '') then
           PERSONA_A_CARGO:=StrToInt(PartesCadena[11]);
           if (PartesCadena[12] <> '') then
           FECHA_ACT_DATOS:=StrToDate(PartesCadena[12]);
           if (PartesCadena[13] <> '') then
           ESTADO_CIVIL:= StrToInt(PartesCadena[13]);
           if (PartesCadena[14] <> '') then
           NIVEL_ESTUDIOS:= StrToInt(PartesCadena[14]);
           if (PartesCadena[15] <> '') then
           INGRESOS:= StrToCurr(PartesCadena[15]);
           if (PartesCadena[16] <> '') then
           ACTIVOS:= StrToCurr(PartesCadena[16]);
           if (PartesCadena[17] <> '') then
           PASIVOS:= StrToCurr(PartesCadena[17]);
           if (PartesCadena[18] <> '') then
           FECHA_BALANCE:= StrToDate(PartesCadena[18]);
           if (PartesCadena[19] <> '') then
           NOMBRE_EMPLEADOR:= PartesCadena[19];
           if (PartesCadena[20] <> '') then
           FECHA_ING_EMPRESA:= StrToDate(PartesCadena[20]);
           if (PartesCadena[21] <> '') then
           TIPO_CONTRATO:= StrToInt(PartesCadena[21]);
           if (PartesCadena[22] <> '') then
           OCUPACION:= StrToInt(PartesCadena[22]);
           if (PartesCadena[23] <> '') then
           CLASIFICACION:= StrToInt(PartesCadena[23]);
           if (PartesCadena[24] <> '') then
           CALIFICACION:= PartesCadena[24];
           if (PartesCadena[25] <> '') then
           ESTADO:= StrToInt(PartesCadena[25]);
           if (PartesCadena[26] <> '') then
           DIASMORA:= StrToInt(PartesCadena[26]);
           if (PartesCadena[27] <> '') then
           FECHA_DESEMBOLSO:= StrToDate(PartesCadena[27]);
           if (PartesCadena[28] <> '') then
           FECHA_VENCIMIENTO:= StrToDate(PartesCadena[28]);
           if (PartesCadena[29] <> '') then
           FECHA_EXIGIBILIDAD:= StrToDate(PartesCadena[29]);
           if (PartesCadena[30] <> '') then
           FECHA_PRESCRIPCION:= StrToDate(PartesCadena[30]);
           if (PartesCadena[31] <> '') then
           FECHA_PAGO:= StrToDate(PartesCadena[31]);
           if (PartesCadena[32] <> '') then
           PERIOCIDAD_PAGO:= StrToInt(PartesCadena[32]);
           if (PartesCadena[33] <> '') then
           CUOTAS_PAGADAS:= StrToInt(PartesCadena[33]);
           if (PartesCadena[34] <> '') then
           CUOTAS_TOTAL:= StrToInt(PartesCadena[34]);
           if (PartesCadena[35] <> '') then
           CUOTAS_MORA:= StrToInt(PartesCadena[35]);
           if (PartesCadena[36] <> '') then
           VALOR:= StrToCurr(PartesCadena[36]);
           if (PartesCadena[37] <> '') then
           SALDO:= StrToCurr(PartesCadena[37]);
           if (PartesCadena[38] <> '') then
           VALOR_CUOTA:= StrToCurr(PartesCadena[38]);
           if (PartesCadena[39] <> '') then
           VALOR_MORA:= StrToCurr(PartesCadena[39]);
           if (PartesCadena[40] <> '') then
           ID_GARANTIA:= StrToInt(PartesCadena[40]);
           if (PartesCadena[41] <> '') then
           VALOR_GARANTIA:= StrToCurr(PartesCadena[41]);
           if (PartesCadena[42] <> '') then
           FECHA_LIMITE_PAGO:= StrToDate(PartesCadena[42]);
           if (PartesCadena[43] <> '') then
           COD_CIUDAD_RAD:= PartesCadena[43];
           if (PartesCadena[44] <> '') then
           NOM_CIUDAD_RAD:= PartesCadena[44];
           if (PartesCadena[45] <> '') then
           COD_CIUDAD_RES:= PartesCadena[45];
           if (PartesCadena[46] <> '') then
           NOM_CIUDAD_RES:= PartesCadena[46];
           if (PartesCadena[47] <> '') then
           COD_DPTO_RES:= PartesCadena[47];
           if (PartesCadena[48] <> '') then
           NOM_DPTO_RES:= PartesCadena[48];
           if (PartesCadena[49] <> '') then
           DIRECCION_RES:= PartesCadena[49];
           if (PartesCadena[50] <> '') then
           TELEFONO_RES:= PartesCadena[50];
           if (PartesCadena[51] <> '') then
           COD_CIUDAD_LAB:= PartesCadena[51];
           if (PartesCadena[52] <> '') then
           NOM_CIUDAD_LAB:= PartesCadena[52];
           if (PartesCadena[53] <> '') then
           COD_DPTO_LAB:= PartesCadena[53];
           if (PartesCadena[54] <> '') then
           NOM_DPTO_LAB:= PartesCadena[54];
           if (PartesCadena[55] <> '') then
           DIRECCION_LAB:= PartesCadena[55];
           if (PartesCadena[56] <> '') then
           TELEFONO_LAB:= PartesCadena[56];
           if (PartesCadena[57] <> '') then
           COD_CIUDAD_COR:= PartesCadena[57];
           if (PartesCadena[58] <> '') then
           NOM_CIUDAD_COR:= PartesCadena[58];
           if (PartesCadena[59] <> '') then
           NOM_DPTO_COR:= PartesCadena[59];
           if (PartesCadena[60] <> '') then
           DIRECCION_COR := PartesCadena[60];
           if (PartesCadena[61] <> '') then
           FECHA_CORTE := StrToDate(PartesCadena[61]);
           // Cargar Datos

           with DataOficina do
           begin
            Insert;
            FieldByName('ID_AGENCIA').AsInteger := ID_AGENCIA;// 01
            FieldByName('ID_COLOCACION').AsString := ID_COLOCACION;// 02
            FieldByName('TIPO_IDENTIFICACION').AsInteger := TIPO_IDENTIFICACION;// 03
            FieldByName('ID_PERSONA').AsString := ID_PERSONA; // 04
            FieldByName('NOMBREDATA').AsString := NOMBREDATA; // 05
            FieldByName('NOMBRECIFIN').AsString := NOMBRECIFIN; // 06
            FieldByName('FECHA_EXP_DOC').AsDateTime := FECHA_EXP_DOC; // 07
            FieldByName('COD_LUGAR_EXP_DOC').AsInteger:= COD_LUGAR_EXP_DOC; // 08
            FieldByName('FECHA_NACIMIENTO').AsDateTime:= FECHA_NACIMIENTO; // 09
            FieldByName('CIIU').AsInteger:=CIIU; // 10
            FieldByName('ESTRATO').AsString := ESTRATO; // 11
            FieldByName('PERSONA_A_CARGO').AsInteger:= PERSONA_A_CARGO; // 12
            FieldByName('FECHA_ACT_DATOS').AsDateTime := FECHA_ACT_DATOS; // 13
            FieldByName('ESTADO_CIVIL').AsInteger:= ESTADO_CIVIL; // 14
            FieldByName('NIVEL_ESTUDIOS').AsInteger := NIVEL_ESTUDIOS; // 15
            FieldByName('INGRESOS').AsCurrency := INGRESOS; // 16
            FieldByName('ACTIVOS').AsCurrency := ACTIVOS;  // 17
            FieldByName('PASIVOS').AsCurrency := PASIVOS;  // 18
            FieldByName('FECHA_BALANCE').AsDateTime := FECHA_BALANCE; // 19
            FieldByName('NOMBRE_EMPLEADOR').AsString := NOMBRE_EMPLEADOR; // 20
            FieldByName('FECHA_ING_EMPRESA').AsDateTime := FECHA_ING_EMPRESA; // 21
            FieldByName('TIPO_CONTRATO').AsInteger := TIPO_CONTRATO; // 22
            FieldByName('OCUPACION').AsInteger := OCUPACION;  // 23
            FieldByName('CLASIFICACION').AsInteger := CLASIFICACION; // 24
            FieldByName('CALIFICACION').AsString := CALIFICACION; // 25
            FieldByName('ESTADO').AsInteger := ESTADO; // 26
            FieldByName('DIASMORA').AsInteger := DIASMORA; // 27
            FieldByName('FECHA_DESEMBOLSO').AsDateTime := FECHA_DESEMBOLSO; // 28
            FieldByName('FECHA_VENCIMIENTO').AsDateTime := FECHA_VENCIMIENTO; // 29
            FieldByName('FECHA_EXIGIBILIDAD').AsDateTime := FECHA_EXIGIBILIDAD; // 30
            FieldByName('FECHA_PRESCRIPCION').AsDateTime := FECHA_PRESCRIPCION; // 31
            FieldByName('FECHA_PAGO').AsDateTime := FECHA_PRESCRIPCION; // 32
            FieldByName('PERIOCIDAD_PAGO').AsInteger := PERIOCIDAD_PAGO; // 33
            FieldByName('CUOTAS_PAGADAS').AsInteger := CUOTAS_PAGADAS; // 34
            FieldByName('CUOTAS_TOTAL').AsInteger := CUOTAS_TOTAL; // 35
            FieldByName('CUOTAS_MORA').AsInteger := CUOTAS_TOTAL; // 36
            FieldByName('VALOR').AsCurrency := VALOR; // 37
            FieldByName('SALDO').AsCurrency := SALDO; // 38
            FieldByName('VALOR_CUOTA').AsCurrency := VALOR_CUOTA; // 39
            FieldByName('VALOR_MORA').AsCurrency := VALOR_MORA;  // 40
            FieldByName('ID_GARANTIA').AsInteger := ID_GARANTIA;  // 41
            FieldByName('VALOR_GARANTIA').AsCurrency := VALOR_GARANTIA; // 42
            FieldByName('FECHA_LIMITE_PAGO').AsDateTime := FECHA_LIMITE_PAGO; // 43
            FieldByName('COD_CIUDAD_RAD').AsString := COD_CIUDAD_RAD; // 44
            FieldByName('NOM_CIUDAD_RAD').AsString := NOM_CIUDAD_RAD; // 45
            FieldByName('COD_CIUDAD_RES').AsString := COD_CIUDAD_RES; // 46
            FieldByName('NOM_CIUDAD_RES').AsString := NOM_CIUDAD_RES; // 47
            FieldByName('COD_DPTO_RES').AsString := COD_DPTO_RES; // 48
            FieldByName('NOM_DPTO_RES').AsString := NOM_DPTO_RES; // 49
            FieldByName('DIRECCION_RES').AsString := DIRECCION_RES; // 50
            FieldByName('TELEFONO_RES').AsString := TELEFONO_RES;  // 51
            FieldByName('COD_CIUDAD_LAB').AsString := COD_CIUDAD_LAB; // 52
            FieldByName('NOM_CIUDAD_LAB').AsString := NOM_CIUDAD_LAB; // 53
            FieldByName('COD_DPTO_LAB').AsString := COD_DPTO_LAB; // 54
            FieldByName('NOM_DPTO_LAB').AsString := NOM_DPTO_LAB; // 55
            FieldByName('DIRECCION_LAB').AsString := DIRECCION_LAB; // 56
            FieldByName('TELEFONO_LAB').AsString := TELEFONO_LAB;// 57
            FieldByName('COD_CIUDAD_COR').AsString := COD_CIUDAD_COR; // 58
            FieldByName('NOM_CIUDAD_COR').AsString := NOM_CIUDAD_COR; // 59
            FieldByName('NOM_DPTO_COR').AsString := NOM_DPTO_COR; // 60
            FieldByName('DIRECCION_COR').AsString := DIRECCION_COR; // 61
            FieldByName('FECHA_CORTE').AsDateTime := FECHA_CORTE; // 62
            Post;
           end;

        end;
        DataOficina.ApplyUpdates(0);
        IBTransaction1.Commit;
        lblMessage.Caption := 'Importación de Datos Finalizada...';
end;

procedure TfrmImportarDatosOficina.CmdCerrarClick(Sender: TObject);
begin
        self.Close;
end;

end.
