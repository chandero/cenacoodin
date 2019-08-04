unit UnitProcesarCifinMod;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBSQL, StrUtils, DBClient;

type
  TfrmProcesarCifin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdProcesar: TBitBtn;
    EdFechaCorte: TDateTimePicker;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    Bar: TProgressBar;
    CmdGenerar: TBitBtn;
    CmdEnviar: TBitBtn;
    CmdVer: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBSNoCredito: TIBSQL;
    IBSClientes: TIBSQL;
    IBSCodeudores: TIBSQL;
    IBSCuotas: TIBSQL;
    IBQuery2: TIBQuery;
    ClientDataSet1: TClientDataSet;
    DataErrores: TClientDataSet;
    DataErroresCOLOCACION_ERRADO: TStringField;
    DataErroresIDENTIFICACION: TStringField;
    DataErroresAGENCIA: TIntegerField;
    DataErroresCOLOCACION_CORRECTO: TStringField;
    ClientDataSet1NUMERO: TStringField;
    ClientDataSet1IDENTIFICACION: TStringField;
    ClientDataSet1NOMBRE: TStringField;
    ClientDataSet1FNACIM: TStringField;
    ClientDataSet1FAPERT: TStringField;
    ClientDataSet1FVENCI: TStringField;
    ClientDataSet1VCUOTA: TStringField;
    Ed1: TEdit;
    OpenDialog1: TOpenDialog;
    CheckBox3: TCheckBox;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGenerarClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure EdFechaCorteExit(Sender: TObject);
  private
    procedure EncabezadoCifin;
    procedure ClientesCifin;
    procedure FinCifin;
    { Private declarations }
  public
    { Public declarations }
  end;


type Registro1 = Record
    TRegistro:string; // * 1 N
    TProducto:string; // * 2 N
    TEntidad:string; // * 4 N
    CEntidad:string; // * 10 N
    IdenCifin:string; // * 18 A
    TOblig:string; // * 8 N
    FCorte:string; // * 8 Fecha
end;

type Registro2 = Record
    TRegistro:string; // * 1 N
    TAccion:string; // * 1 N
    JustAccion:string; // * 2 N Solo Aplica si TAccion = 8
    TIden:string; // * 2 N
    Identificacion:string; // * 14 A
    Nombre:string; // * 60 A
    Ciiu:string; // * 6 N
    NJuridica:string; // * 3 N
    Numero:string; // * 20 A
    CodSuc:string; // * 6 A
    Calidad:string; // * 1 A
end;

type Registro3 = Record
    TRegistro:string; // * 1 N
    TAccion:string; // * 1 N
    JustAccion:string; // * 2 N  Aplica si TAccion = 3
    Numero:string; // * 20 A
    CodSuc:string; // * 6 A
    LineaC:string; // * 3 N
    ModalC:string; // * 2 N
    TpGar:string; // * 2 N
    TpMone:string; // * 2 N
    PePago:string; // * 2 periodo de pago N
    ValIni:string; // * 12 N
    VSaldo:string; // * 12 N
    VGar:string; // * 12 N
    VCuota:string; // * 12 N
    ValMor:string; // * 12 N
    FInicial:string; // * 8 F
    FTermi:string; // * 8 F
    FUPago:string; // * 8  Fecha de Pago F
    FechaC:string; // * 8 F
    Estado:string; // * 2 N
    Califi:string; // * 2 A
    EdMora:string; // * 2 N
    ModoExt:string; // * 2 N
    NatReest:string; // * 2 N
    NumReest:string; // * 3 N
    CCance:string; // * 03 N
    ProbNoPago:string; // * 3 N - 0-100
    TpIdOrig:string; // * 2 N
    NoIdOrig:string; // * 14 A
    TpEntOrig:string; // * 4 N
    CodEntOrig:string; // * 10 N
end;

var
  frmProcesarCifin: TfrmProcesarCifin;
  PlanoEncabezado:TStringList;
  PlanoClientes:TStringList;
  PlanoMovimientos:TStringList;
  SumaRegistros:Integer;
  SumaObligaciones:Integer;
  MesCorteAct:string;
  MesCorteAnt:string;
  Mes : Integer;
  MesAnt : string;
  MesAct : String;
  FechaAnt : TDate;
  LineaF, LineaE:string;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobalesCol,UnitDmcolocacion, UnitMuestroArchivoCifin, UnitGlobales;

procedure TfrmProcesarCifin.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmProcesarCifin.EncabezadoCifin;
var cadena:string;
    LineaE:Registro1;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Encabezado del Archivo
      LineaE.TRegistro := '1';
      LineaE.TProducto := '21';
      LineaE.TEntidad := '0050';
      LineaE.CEntidad := '0000000012';
      LineaE.IdenCifin := '                  ';
      LineaE.TOblig := StringReplace(Format('%8d',[Sumaobligaciones]),' ','0',[rfReplaceAll]);
      LineaE.FCorte := Format('%.4d',[YearOf(EdFechaCorte.Date)]) + Format('%.2d',[monthOf(EdFechaCorte.Date)]) + Format('%.2d',[dayOf(EdFechaCorte.Date)]);

      PlanoEncabezado.Add(LineaE.TRegistro + LineaE.TProducto + LineaE.TEntidad+
                          LineaE.CEntidad + LineaE.IdenCifin + LineaE.TOblig + LineaE.FCorte);
                          
      CheckBox1.Checked := True;
end;

procedure TfrmProcesarCifin.ClientesCifin;
var cadena:string;
    LineaC:Registro2;
    LineaM:Registro3;
    LineaError:string;
    ColocacionNew:string;
    ConverColocacion:Int64;
    ColocacionAnt:string;
    ColocacionActual:string;
    DiasMora:Integer;
    NoCod:Integer;
    NovedadLocal:Integer;
    Fecha:TDate;
    Apel1,Apel2,Nombre:string;
    Identificacion:string;
    Ident:Int64;
    AgenciaLocal:Integer;
    ColocacionLocal:string;
    Tmp:Currency;

    i,j: Integer;
    Entero: Integer;
    S1,S2 :TStringList;
    ColocacionErr : string;
    Nit:string;
    CNit:Integer;
begin
           if dmGeneral.IBTransaction1.InTransaction then
              dmGeneral.IBTransaction1.Rollback;
           dmGeneral.IBTransaction1.StartTransaction;

        SumaRegistros := 0;
        SumaObligaciones := 0;
        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as CONTEO from "col$ReporteDatatmp"');
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información para Procesar',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            BarC.Min := 0;
            BarC.Max := FieldByName('CONTEO').AsInteger;
            BarC.Position := 0;
           except
              Transaction.Rollback;
              raise;
              Exit;
           end;
        end;

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$ReporteDatatmp"');
           try
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;

           while not eof do begin
             BarC.Position := RecNo;
             Application.ProcessMessages;
             cadena := IBQuery1.FieldByName('NUMERO').AsString;
             if MidStr(cadena,17,1) = 'C' then
              begin
                AgenciaLocal := StrToInt(MidStr(cadena,5,1));
                ColocacionLocal := MidStr(cadena,6,11);
              end
             else
              begin
                AgenciaLocal := StrToInt(MidStr(cadena,7,1));
                ColocacionLocal := MidStr(cadena,8,11);
                SumaObligaciones := SumaObligaciones + 1;
              end;
             // Proceso informacion Clientes
             LineaC.TRegistro := '2';
             LineaC.TAccion := '7';
             LineaC.JustAccion := '  ';
             LineaC.TIden := IBQuery1.FieldByName('IDIDENT').AsString;
             if LineaC.TIden <> '01' then
              begin
                CNit := StrLen(PChar(IBQuery1.FieldByName('IDENTIFICACION').AsString));
                Nit := LeftStr(IBQuery1.FieldByName('IDENTIFICACION').AsString,CNit-1);
              end
             else
               Nit := IBQuery1.FieldByName('IDENTIFICACION').AsString;

             Ident := StrToInt64(Nit);
             Identificacion := Format('%-14s',[IntToStr(Ident)]);
//                               Format('%-14s',[LeftStr(IBSClientes.FieldByName('ID_PERSONA').AsString,14)]);
             LineaC.Identificacion := Identificacion;
             LineaC.Nombre := IBQuery1.FieldByName('NOMBREC').AsString;
             LineaC.Ciiu := '000000';
             if (IBQuery1.FieldByName('IDIDENT').AsString = '02') or (IBQuery1.FieldByName('IDIDENT').AsString = '07') then
               LineaC.NJuridica := '007'
             else
               LineaC.NJuridica := '000';
{             case StrToInt(IBQuery1.FieldByName('IDIDEN').AsString) of
               1 : LineaC.NJuridica := '000';
               2 : LineaC.NJuridica := '007';
               7 : LineaC.NJuridica := '007';
             end; }
             if FieldByName('RESPON').AsString = '00' then
              begin
                LineaC.Numero := '00' + FieldByName('NUMERO').AsString;
                LineaC.CodSuc := IntToStr(AgenciaLocal) + '     ';
                LineaC.Calidad := 'P'
              end
             else if FieldByName('RESPON').AsString = '01' then
              begin
                LineaC.Numero := '0000' + LeftStr(FieldByName('NUMERO').AsString,16);
                LineaC.CodSuc := IntToStr(AgenciaLocal) + '     ';
                LineaC.Calidad := 'C';
              end;

             PlanoClientes.Add(LineaC.TRegistro + LineaC.TAccion + LineaC.JustAccion +
                              LineaC.TIden + LineaC.Identificacion + LineaC.Nombre + LineaC.Ciiu +
                              LineaC.NJuridica + LineaC.Numero + LineaC.CodSuc + LineaC.Calidad);

             SumaRegistros := SumaRegistros + 1;
             IBSClientes.Close;
             // fin de proceso clientes

             //Inicio proceso Obligaciones
             if FieldByName('RESPON').AsString = '00' then
              begin
                LineaM.TRegistro := '3';
                LineaM.TAccion := '1';
                LineaM.JustAccion := '  ';
                LineaM.Numero := '00' + FieldByName('NUMERO').AsString;
                LineaM.CodSuc := IntToStr(AgenciaLocal) + '     ';

                LineaM.LineaC := IBQuery1.FieldByName('LINEA').AsString;

               if FieldByName('TPOBLI').AsString = '1' then
                 LineaM.ModalC := '01'
               else if FieldByName('TPOBLI').AsString = '2' then
                 LineaM.ModalC := '02'
               else if FieldByName('TPOBLI').AsString = '3' then
                 LineaM.ModalC := '03'
               else LineaM.ModalC := '05';

               if FieldByName('TPGARA').AsString = '1' then
                  LineaM.TpGar := '10'
               else LineaM.TpGar := '02';

               LineaM.TpMone := '01';

               if FieldByName('PEPAGO').AsString = '1' then
                 LineaM.PePago := '07'
               else if FieldByName('PEPAGO').AsString = '2' then
                 LineaM.PePago := '10'
               else if FieldByName('PEPAGO').AsString = '3' then
                 LineaM.PePago := '13'
               else if FieldByName('PEPAGO').AsString = '4' then
                 LineaM.PePago := '16'
               else if FieldByName('PEPAGO').AsString = '5' then
                 LineaM.PePago := '19'
               else if FieldByName('PEPAGO').AsString = '6' then
                 LineaM.PePago := '22'
               else if FieldByName('PEPAGO').AsString = '9' then
                 LineaM.PePago := '23';

               Tmp := StrToCurr(FieldByName('VALINI').AsString);
               LineaM.ValIni := StringReplace(Format('%12s',[CurrToStr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
               Tmp := StrToCurr(FieldByName('VALDEU').AsString);
               LineaM.VSaldo := StringReplace(Format('%12s',[currtostr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
               LineaM.VGar := '000000000000'; // ojo
               Tmp := StrToCurr(FieldByName('VCUOTA').AsString);
               LineaM.VCuota := StringReplace(Format('%12s',[currtostr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
               Tmp := StrToCurr(FieldByName('VALMOR').AsString);
               LineaM.ValMor := StringReplace(Format('%12s',[currtostr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);


               LineaM.FInicial := IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsString;
               LineaM.FTermi := IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsString;
               LineaM.FUPago := '        ';
               LineaM.FechaC := Format('%.4d',[YearOf(DTfecha.Date)])+ Format('%.2d',[monthOf(DTfecha.Date)]) + Format('%.2d',[dayOf(DTfecha.Date)]);

               if FieldByName('NOVEDAD').AsString = '01' then
                 LineaM.Estado := '01'
               else if FieldByName('NOVEDAD').AsString = '12' then
                 LineaM.Estado := '04'
               else if FieldByName('NOVEDAD').AsString = '13' then
                 LineaM.Estado := '06'
               else if FieldByName('NOVEDAD').AsString = '05' then
                 LineaM.Estado := '07'
               else if FieldByName('NOVEDAD').AsString = '14' then
                 LineaM.Estado := '08'
               else LineaM.Estado := '01';

               if FieldByName('CALIFI').AsString = 'A' then
                 LineaM.Califi := '01'
               else if FieldByName('CALIFI').AsString = 'B' then
                 LineaM.Califi := '02'
               else if FieldByName('CALIFI').AsString = 'C' then
                 LineaM.Califi := '03'
               else if FieldByName('CALIFI').AsString = 'D' then
                 LineaM.Califi := '04'
               else if FieldByName('CALIFI').AsString = 'E' then
                 LineaM.Califi := '05';

               if LineaM.Estado = '06' then
                 LineaM.Califi := '06';

               if LineaM.Estado = '07' then LineaM.Califi := '01';

               if FieldByName('EDMORA').AsString = '001' then
                 LineaM.EdMora := '00'
               else if FieldByName('EDMORA').AsString = '030' then
                 LineaM.EdMora := '01'
               else if FieldByName('EDMORA').AsString = '060' then
                 LineaM.EdMora := '02'
               else if FieldByName('EDMORA').AsString = '090' then
                 LineaM.EdMora := '03'
               else if FieldByName('EDMORA').AsString = '120' then
                 LineaM.EdMora := '04'
               else if FieldByName('EDMORA').AsString = '150' then
                 LineaM.EdMora := '05'
               else if FieldByName('EDMORA').AsString = '180' then
                 LineaM.EdMora := '06'
               else if FieldByName('EDMORA').AsString = '210' then
                 LineaM.EdMora := '07'
               else if FieldByName('EDMORA').AsString = '240' then
                 LineaM.EdMora := '08'
               else if FieldByName('EDMORA').AsString = '270' then
                 LineaM.EdMora := '09'
               else if FieldByName('EDMORA').AsString = '300' then
                 LineaM.EdMora := '10'
               else if FieldByName('EDMORA').AsString = '330' then
                 LineaM.EdMora := '11'
               else if FieldByName('EDMORA').AsString = '360' then
                 LineaM.EdMora := '12'
               else LineaM.EdMora := '13';

               LineaM.ModoExt := '  ';
               LineaM.NatReest := '  ';
               LineaM.NumReest := '   ';
               LineaM.CCance := FieldByName('CCANCE').AsString;

               LineaM.ProbNoPago := '   ';
{               if (LineaM.EdMora = '00') or (LineaM.EdMora = '01') or (LineaM.EdMora = '02') then
                 LineaM.ProbNoPago := '000'
               else if (LineaM.EdMora = '03') then
                 LineaM.ProbNoPago := '010'
               else if (LineaM.EdMora = '04') then
                 LineaM.ProbNoPago := '020'
               else if (LineaM.EdMora = '05') then
                 LineaM.ProbNoPago := '030'
               else if (LineaM.EdMora = '06') then
                 LineaM.ProbNoPago := '040'
               else if (LineaM.EdMora = '07') then
                 LineaM.ProbNoPago := '050'
               else if (LineaM.EdMora = '08') then
                 LineaM.ProbNoPago := '060'
               else if (LineaM.EdMora = '09') then
                 LineaM.ProbNoPago := '070'
               else if (LineaM.EdMora = '10') then
                 LineaM.ProbNoPago := '080'
               else if (LineaM.EdMora = '11') then
                 LineaM.ProbNoPago := '090'
               else if (LineaM.EdMora = '12') or (LineaM.EdMora = '13') then
                 LineaM.ProbNoPago := '100'; }

               LineaM.TpIdOrig := '  ';
               LineaM.NoIdOrig := '              ';
               LineaM.TpEntOrig := '    ';
               LineaM.CodEntOrig := '          ';

               PlanoMovimientos.Add(LineaM.TRegistro + LineaM.TAccion + LineaM.JustAccion +
                                    LineaM.Numero + LineaM.CodSuc + LineaM.LineaC + LineaM.ModalC +
                                    LineaM.TpGar + LineaM.TpMone + LineaM.PePago + LineaM.ValIni +
                                    LineaM.VSaldo + LineaM.VGar + LineaM.VCuota + LineaM.ValMor +
                                    LineaM.FInicial + LineaM.FTermi + LineaM.FUPago + LineaM.FechaC +
                                    LineaM.Estado + LineaM.Califi + LineaM.EdMora + LineaM.ModoExt +
                                    LineaM.NatReest + LineaM.NumReest + LineaM.CCance + LineaM.ProbNoPago +
                                    LineaM.TpIdOrig + LineaM.NoIdOrig + LineaM.TpEntOrig + LineaM.CodEntOrig);

               SumaRegistros := SumaRegistros + 1;
               IBSClientes.Close;
              end; //fin de if deudor principal
            Next;
           end; // fin while
        end; // fin with
        CheckBox4.Checked := True;
end;
var cadena:string;
    LineaC:Registro2;
    LineaM:Registro3;
    LineaError:string;
    ColocacionNew:string;
    ConverColocacion:Int64;
    ColocacionAnt:string;
    ColocacionActual:string;
    DiasMora:Integer;
    NoCod:Integer;
    NovedadLocal:Integer;
    Fecha:TDate;
    Apel1,Apel2,Nombre:string;
    Identificacion:string;
    Ident:Int64;
    AgenciaLocal:Integer;
    ColocacionLocal:string;
    Tmp:Currency;

    i,j: Integer;
    Entero: Integer;
    S1,S2 :TStringList;
    ColocacionErr : string;
    Nit:string;
    CNit:Integer;
begin
           if dmGeneral.IBTransaction1.InTransaction then
              dmGeneral.IBTransaction1.Rollback;
           dmGeneral.IBTransaction1.StartTransaction;

        SumaRegistros := 0;
        SumaObligaciones := 0;
        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as CONTEO from "col$ReporteDatatmp"');
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información para Procesar',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            BarC.Min := 0;
            BarC.Max := FieldByName('CONTEO').AsInteger;
            BarC.Position := 0;
           except
              Transaction.Rollback;
              raise;
              Exit;
           end;
        end;

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$ReporteDatatmp"');
           try
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;

           while not eof do begin
             BarC.Position := RecNo;
             Application.ProcessMessages;
             cadena := IBQuery1.FieldByName('NUMERO').AsString;
             if MidStr(cadena,17,1) = 'C' then
              begin
                AgenciaLocal := StrToInt(MidStr(cadena,5,1));
                ColocacionLocal := MidStr(cadena,6,11);
              end
             else
              begin
                AgenciaLocal := StrToInt(MidStr(cadena,7,1));
                ColocacionLocal := MidStr(cadena,8,11);
                SumaObligaciones := SumaObligaciones + 1;
              end;
             // Proceso informacion Clientes
             LineaC.TRegistro := '2';
             LineaC.TAccion := '7';
             LineaC.JustAccion := '  ';
             LineaC.TIden := IBQuery1.FieldByName('IDIDENT').AsString;
             if LineaC.TIden <> '01' then
              begin
                CNit := StrLen(PChar(IBQuery1.FieldByName('IDENTIFICACION').AsString));
                Nit := LeftStr(IBQuery1.FieldByName('IDENTIFICACION').AsString,CNit-1);
              end
             else
               Nit := IBQuery1.FieldByName('IDENTIFICACION').AsString;

             Ident := StrToInt64(Nit);
             Identificacion := Format('%-14s',[IntToStr(Ident)]);
//                               Format('%-14s',[LeftStr(IBSClientes.FieldByName('ID_PERSONA').AsString,14)]);
             LineaC.Identificacion := Identificacion;
             LineaC.Nombre := IBQuery1.FieldByName('NOMBREC').AsString;
             LineaC.Ciiu := '000000';
             if (IBQuery1.FieldByName('IDIDENT').AsString = '02') or (IBQuery1.FieldByName('IDIDENT').AsString = '07') then
               LineaC.NJuridica := '007'
             else
               LineaC.NJuridica := '000';
{             case StrToInt(IBQuery1.FieldByName('IDIDEN').AsString) of
               1 : LineaC.NJuridica := '000';
               2 : LineaC.NJuridica := '007';
               7 : LineaC.NJuridica := '007';
             end; }
             if FieldByName('RESPON').AsString = '00' then
              begin
                LineaC.Numero := '00' + FieldByName('NUMERO').AsString;
                LineaC.CodSuc := IntToStr(AgenciaLocal) + '     ';
                LineaC.Calidad := 'P'
              end
             else if FieldByName('RESPON').AsString = '01' then
              begin
                LineaC.Numero := '0000' + LeftStr(FieldByName('NUMERO').AsString,16);
                LineaC.CodSuc := IntToStr(AgenciaLocal) + '     ';
                LineaC.Calidad := 'C';
              end;

             PlanoClientes.Add(LineaC.TRegistro + LineaC.TAccion + LineaC.JustAccion +
                              LineaC.TIden + LineaC.Identificacion + LineaC.Nombre + LineaC.Ciiu +
                              LineaC.NJuridica + LineaC.Numero + LineaC.CodSuc + LineaC.Calidad);

             SumaRegistros := SumaRegistros + 1;
             IBSClientes.Close;
             // fin de proceso clientes

             //Inicio proceso Obligaciones
             if FieldByName('RESPON').AsString = '00' then
              begin
                LineaM.TRegistro := '3';
                LineaM.TAccion := '1';
                LineaM.JustAccion := '  ';
                LineaM.Numero := '00' + FieldByName('NUMERO').AsString;
                LineaM.CodSuc := IntToStr(AgenciaLocal) + '     ';

                LineaM.LineaC := IBQuery1.FieldByName('LINEA').AsString;

               if FieldByName('TPOBLI').AsString = '1' then
                 LineaM.ModalC := '01'
               else if FieldByName('TPOBLI').AsString = '2' then
                 LineaM.ModalC := '02'
               else if FieldByName('TPOBLI').AsString = '3' then
                 LineaM.ModalC := '03'
               else LineaM.ModalC := '05';

               if FieldByName('TPGARA').AsString = '1' then
                  LineaM.TpGar := '10'
               else LineaM.TpGar := '02';

               LineaM.TpMone := '01';

               if FieldByName('PEPAGO').AsString = '1' then
                 LineaM.PePago := '07'
               else if FieldByName('PEPAGO').AsString = '2' then
                 LineaM.PePago := '10'
               else if FieldByName('PEPAGO').AsString = '3' then
                 LineaM.PePago := '13'
               else if FieldByName('PEPAGO').AsString = '4' then
                 LineaM.PePago := '16'
               else if FieldByName('PEPAGO').AsString = '5' then
                 LineaM.PePago := '19'
               else if FieldByName('PEPAGO').AsString = '6' then
                 LineaM.PePago := '22'
               else if FieldByName('PEPAGO').AsString = '9' then
                 LineaM.PePago := '23';

               Tmp := StrToCurr(FieldByName('VALINI').AsString);
               LineaM.ValIni := StringReplace(Format('%12s',[CurrToStr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
               Tmp := StrToCurr(FieldByName('VALDEU').AsString);
               LineaM.VSaldo := StringReplace(Format('%12s',[currtostr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
               LineaM.VGar := '000000000000'; // ojo
               Tmp := StrToCurr(FieldByName('VCUOTA').AsString);
               LineaM.VCuota := StringReplace(Format('%12s',[currtostr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
               Tmp := StrToCurr(FieldByName('VALMOR').AsString);
               LineaM.ValMor := StringReplace(Format('%12s',[currtostr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);


               LineaM.FInicial := IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsString;
               LineaM.FTermi := IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsString;
               LineaM.FUPago := '        ';
               LineaM.FechaC := Format('%.4d',[YearOf(DTfecha.Date)])+ Format('%.2d',[monthOf(DTfecha.Date)]) + Format('%.2d',[dayOf(DTfecha.Date)]);

               if FieldByName('NOVEDAD').AsString = '01' then
                 LineaM.Estado := '01'
               else if FieldByName('NOVEDAD').AsString = '12' then
                 LineaM.Estado := '04'
               else if FieldByName('NOVEDAD').AsString = '13' then
                 LineaM.Estado := '06'
               else if FieldByName('NOVEDAD').AsString = '05' then
                 LineaM.Estado := '07'
               else if FieldByName('NOVEDAD').AsString = '14' then
                 LineaM.Estado := '08'
               else LineaM.Estado := '01';

               if FieldByName('CALIFI').AsString = 'A' then
                 LineaM.Califi := '01'
               else if FieldByName('CALIFI').AsString = 'B' then
                 LineaM.Califi := '02'
               else if FieldByName('CALIFI').AsString = 'C' then
                 LineaM.Califi := '03'
               else if FieldByName('CALIFI').AsString = 'D' then
                 LineaM.Califi := '04'
               else if FieldByName('CALIFI').AsString = 'E' then
                 LineaM.Califi := '05';

               if LineaM.Estado = '06' then
                 LineaM.Califi := '06';

               if LineaM.Estado = '07' then LineaM.Califi := '01';

               if FieldByName('EDMORA').AsString = '001' then
                 LineaM.EdMora := '00'
               else if FieldByName('EDMORA').AsString = '030' then
                 LineaM.EdMora := '01'
               else if FieldByName('EDMORA').AsString = '060' then
                 LineaM.EdMora := '02'
               else if FieldByName('EDMORA').AsString = '090' then
                 LineaM.EdMora := '03'
               else if FieldByName('EDMORA').AsString = '120' then
                 LineaM.EdMora := '04'
               else if FieldByName('EDMORA').AsString = '150' then
                 LineaM.EdMora := '05'
               else if FieldByName('EDMORA').AsString = '180' then
                 LineaM.EdMora := '06'
               else if FieldByName('EDMORA').AsString = '210' then
                 LineaM.EdMora := '07'
               else if FieldByName('EDMORA').AsString = '240' then
                 LineaM.EdMora := '08'
               else if FieldByName('EDMORA').AsString = '270' then
                 LineaM.EdMora := '09'
               else if FieldByName('EDMORA').AsString = '300' then
                 LineaM.EdMora := '10'
               else if FieldByName('EDMORA').AsString = '330' then
                 LineaM.EdMora := '11'
               else if FieldByName('EDMORA').AsString = '360' then
                 LineaM.EdMora := '12'
               else LineaM.EdMora := '13';

               LineaM.ModoExt := '  ';
               LineaM.NatReest := '  ';
               LineaM.NumReest := '   ';
               LineaM.CCance := FieldByName('CCANCE').AsString;

               LineaM.ProbNoPago := '   ';
{               if (LineaM.EdMora = '00') or (LineaM.EdMora = '01') or (LineaM.EdMora = '02') then
                 LineaM.ProbNoPago := '000'
               else if (LineaM.EdMora = '03') then
                 LineaM.ProbNoPago := '010'
               else if (LineaM.EdMora = '04') then
                 LineaM.ProbNoPago := '020'
               else if (LineaM.EdMora = '05') then
                 LineaM.ProbNoPago := '030'
               else if (LineaM.EdMora = '06') then
                 LineaM.ProbNoPago := '040'
               else if (LineaM.EdMora = '07') then
                 LineaM.ProbNoPago := '050'
               else if (LineaM.EdMora = '08') then
                 LineaM.ProbNoPago := '060'
               else if (LineaM.EdMora = '09') then
                 LineaM.ProbNoPago := '070'
               else if (LineaM.EdMora = '10') then
                 LineaM.ProbNoPago := '080'
               else if (LineaM.EdMora = '11') then
                 LineaM.ProbNoPago := '090'
               else if (LineaM.EdMora = '12') or (LineaM.EdMora = '13') then
                 LineaM.ProbNoPago := '100'; }

               LineaM.TpIdOrig := '  ';
               LineaM.NoIdOrig := '              ';
               LineaM.TpEntOrig := '    ';
               LineaM.CodEntOrig := '          ';

               PlanoMovimientos.Add(LineaM.TRegistro + LineaM.TAccion + LineaM.JustAccion +
                                    LineaM.Numero + LineaM.CodSuc + LineaM.LineaC + LineaM.ModalC +
                                    LineaM.TpGar + LineaM.TpMone + LineaM.PePago + LineaM.ValIni +
                                    LineaM.VSaldo + LineaM.VGar + LineaM.VCuota + LineaM.ValMor +
                                    LineaM.FInicial + LineaM.FTermi + LineaM.FUPago + LineaM.FechaC +
                                    LineaM.Estado + LineaM.Califi + LineaM.EdMora + LineaM.ModoExt +
                                    LineaM.NatReest + LineaM.NumReest + LineaM.CCance + LineaM.ProbNoPago +
                                    LineaM.TpIdOrig + LineaM.NoIdOrig + LineaM.TpEntOrig + LineaM.CodEntOrig);

               SumaRegistros := SumaRegistros + 1;
               IBSClientes.Close;
              end; //fin de if deudor principal
            Next;
           end; // fin while
        end; // fin with
        CheckBox4.Checked := True;
end;


procedure TfrmProcesarCifin.FinCifin;
var cadena:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Identificador
      cadena := '9';
      LineaF := cadena;
// Numero de Regitros
      cadena := StringReplace(Format('%8d',[SumaRegistros + 2]),' ','0',[rfReplaceAll]);
      LineaF := LineaF + cadena;

//      PlanoReporte.Add(LineaF);
      CheckBox3.Checked := True;
end;


procedure TfrmProcesarCifin.CmdProcesarClick(Sender: TObject);
begin
        CmdProcesar.Enabled := False;

        with IBSClientes do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from "col$controlreportedata" where FECHA_CORTE =:FECHA_CORTE and CIFIN = 1');
         ParamByName('FECHA_CORTE').AsString := MesCorteAct;
         ExecQuery;
         if RecordCount > 0 then begin
           MessageDlg('El Reporte CIFIN para esta Fecha' + #13 + 'Ya fue Generado',mtError,[mbok],0);
           Exit;
         end;
         Close;
        end;

        ClientesCifin;
        FinCifin;
        EncabezadoCifin;

        PlanoMovimientos.Add(LineaF);
        PlanoEncabezado.AddStrings(PlanoClientes);
        PlanoEncabezado.AddStrings(PlanoMovimientos);
        PlanoEncabezado.SaveToFile('c:/Cifin' + MesCorteAct + '.TXT');

        with IBSClientes do begin
         Close;
         SQL.Clear;
         SQL.Add('update "col$controlreportedata" set CIFIN = 1 where FECHA_CORTE = :FECHA_CORTE');
         ParamByName('FECHA_CORTE').AsString := MesCorteAct;
         ExecQuery;
         Close;
         IBSClientes.Transaction.Commit;
        end;


        CmdGenerar.Enabled := True;
end;

procedure TfrmProcesarCifin.FormShow(Sender: TObject);
begin
        PlanoEncabezado := TStringList.Create;
        PlanoClientes := TStringList.Create;
        PlanoMovimientos := TStringList.Create;
        PlanoEncabezado.Clear;
        PlanoClientes.Clear;
        PlanoMovimientos.Clear;
        dmColocacion.IBDSagencias.Active := True;
        EdFechaCorte.Date := RecodeDay(Date,Dayof(EndOfAMonth(YearOf(Date),MonthOf(Date))));
        Mes := MonthOf(EdFechaCorte.Date);
        MesAct := FormatCurr('00',Mes);
        Mes := Mes - 1;
        if Mes = 0 then
          Mes  := 12;
        MesAnt := FormatCurr('00',Mes);
        MesCorteAnt := IntToStr(YearOf(EdFechaCorte.Date)) + MesAnt;
        MesCorteAct := IntToStr(YearOf(edFechaCorte.Date)) + MesAct;
end;

procedure TfrmProcesarCifin.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmProcesarCifin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmProcesarCifin.CmdGenerarClick(Sender: TObject);
begin
//        PlanoMovimientos.Add(LineaF);
//        PlanoEncabezado.AddStrings(PlanoClientes);
//        PlanoEncabezado.AddStrings(PlanoMovimientos);
//        PlanoEncabezado.SaveToFile('c:/Cifin' + MesCorteAct + '.TXT');
        CmdVer.Enabled := True;
end;

procedure TfrmProcesarCifin.CmdVerClick(Sender: TObject);
var frmMuestroArchivoCifn : TfrmMuestroArchivoCifin;
begin
        frmMuestroArchivoCifin := TfrmMuestroArchivoCifin.Create(Self);
        frmMuestroArchivoCifin.FechaCorte := MesCorteAct;
        frmMuestroArchivoCifin.ShowModal;
end;

procedure TfrmProcesarCifin.EdFechaCorteExit(Sender: TObject);
begin
        Mes := MonthOf(EdFechaCorte.Date);
        MesAct := FormatCurr('00',Mes);
        Mes := Mes - 1;
        if Mes = 0 then
          Mes  := 12;
        MesAnt := FormatCurr('00',Mes);
        MesCorteAnt := IntToStr(YearOf(EdFechaCorte.Date)) + MesAnt;
        MesCorteAct := IntToStr(YearOf(edFechaCorte.Date)) + MesAct;
end;

end.



