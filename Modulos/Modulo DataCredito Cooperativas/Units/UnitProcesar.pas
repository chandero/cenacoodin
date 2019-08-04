unit UnitProcesar;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBSQL, StrUtils, DBClient;

type
  TfrmDataProceso = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdProcesar: TBitBtn;
    EdFechaCorte: TDateTimePicker;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
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
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGenerarClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
  private
    procedure PrimerPaso;
    procedure SegundoPaso;
    procedure TercerPaso;
    function Novedad(IDAgencia: Integer; IdColocacion: string;Dias:Integer): Integer;
    function Adjetivo(IdAgencia: Integer; IdColocacion: string): string;
    procedure CuartoPaso;
    { Private declarations }
  public
    { Public declarations }
  end;

type Registro = Record
    Numero:string; // * 18
    Identificacion:string; // * 11
    Nombre:string; // * 45
    FNacim:string; // * 06
    FApert:string; // * 06
    FVenci:string; // * 06
    VCuota:string; // * 10
    Noveda:string; // * 02
    Adjeti:string; // * 02
    TpIden:string; // * 01
    ValIni:string; // * 10
    ValDeu:string; // * 10
    ValMor:string; // * 10
    ValDis:string; // * 10
    TpMone:string; // * 01
    TpObli:string; // * 01
    TpGara:string; // * 01
    Califi:string; // * 01
    CResid:string; // * 15
    DResid:string; // * 30
    TResid:string; // * 10
    CLabor:string; // * 15
    TLabor:string; // * 10
    CCorre:string; // * 15
    DCorre:string; // * 30
    Ciiu  :string; // * 06
    TCuota:string; // * 03
    CCance:string; // * 03
    CeMora:string; // * 03
    FUPago:string; // * 06
    Oficin:string; // * 15
    CRadic:string; // * 15 ciudad radicación
    FoPago:string; // * 01 forma de pago
    PePago:string; // * 01 periodo de pago
    EdMora:string; // * 03
    FActua:string; // * 08 Fecha de Corte
    Reclam:string; // * 01
    Respon:string; // * 02  00 para deudor, 01 para codeudor
    Estrac:string; // * 01  Estrato Social
    Rellen:string; // * 14  en ceros
end;

var
  frmDataProceso: TfrmDataProceso;
  PlanoReporte:TStringList;
  SumaNovedad:Integer;
  SumaRegistros:Integer;
  PlanoErrores:TStringList;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobalesCol,UnitDmcolocacion, UnitMuestroArchivo, UnitGlobales;

procedure TfrmDataProceso.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmDataProceso.PrimerPaso;
var cadena:string;
    LineaC:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Encabezado del Archivo
      cadena := '000000000000000000';
      LineaC := cadena;
// Codigo y Tipo Cartera
      cadena := '27391927';
      LineaC := LineaC + cadena;
// Fecha Corte
      cadena := Format('%.4d',[YearOf(EdFechaCorte.Date)])+Format('%.2d',[monthOf(EdFechaCorte.Date)]);
      LineaC := LineaC + cadena;
// Ampliacion Milenio
      cadena := 'M';
      LineaC := LineaC + cadena;
// Indicador de Valores en Miles
      cadena := '0';
      LineaC := LineaC + cadena;
// Relleno
      cadena := '';
      i1 := 1;
      i2 := 326;
      for J := i1 to i2 do
          cadena := cadena + '0';
      LineaC := LineaC + cadena;
      PlanoReporte.Add(LineaC);
      CheckBox1.Checked := True;
end;

procedure TfrmDataProceso.SegundoPaso;
var cadena:string;
    LineaC:registro;
    LineaError:string;
    ColocacionNew:string;
    ConverColocacion:Int64;
    ColocacionAnt:string;
    ColocacionActual:string;
    DiasMora:Integer;
    NoCod:Integer;
    NovedadLocal:Integer;
    Fecha:TDate;
    Nombre:string;

     i,j: Integer;
     Entero: Integer;
     S1,S2 :TStringList;
     ColocacionErr : string;
begin
           if dmGeneral.IBTransaction1.InTransaction then
              dmGeneral.IBTransaction1.Rollback;
           dmGeneral.IBTransaction1.StartTransaction;

//
        OpenDialog1.DefaultExt := '.txt';
        OpenDialog1.InitialDir := 'C:\';
        OpenDialog1.Title := 'Seleccione el Archivo a Importar';
        OpenDialog1.Filter := 'Archivos Texto (*.txt)|*.TXT';
        OpenDialog1.Options := [ofFileMustExist];
        if OpenDialog1.Execute then
        begin
           Ed1.Text := OpenDialog1.FileName;
           S1 := TStringList.Create;
           S1.LoadFromFile(Ed1.Text);
//           Ed2.Text := IntToStr(S1.Count);
        end;
        

        S2 := TStringList.Create;
        for i := 0 to S1.Count - 1 do
        begin
          S2.Text := StringReplace(S1[i], #9, #13, [rfReplaceAll]);
          DataErrores.Append;
          DataErrores.FieldByName('COLOCACION_ERRADO').AsString := S2.Strings[0];
          DataErrores.FieldByName('IDENTIFICACION').AsString := S2.Strings[1];
          DataErrores.FieldByName('AGENCIA').AsInteger := StrToInt(S2.Strings[2]);
          DataErrores.FieldByName('COLOCACION_CORRECTO').AsString := S2.Strings[3];
          DataErrores.Post;
        end;
        S1.Free;
        S2.Free;
//
        SumaNovedad := 0;
        SumaRegistros := 0;
        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as CONTEO from "col$causaciones" where FECHA_CORTE = :"FECHA_CORTE"');
           ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información con esa fecha de corte',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            Bar.Min := 0;
            Bar.Max := FieldByName('CONTEO').AsInteger;
            Bar.Position := 0;
           except
              Transaction.Rollback;
              raise;
              Exit;
           end;
        end;

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$causaciones" where FECHA_CORTE = :FECHA_CORTE');
           ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
           try
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;

           while not eof do begin
             Bar.Position := RecNo;
             Application.ProcessMessages;
             // Proceso informacion Clientes
             with IBSClientes do begin
              Close;
              SQL.Clear;
              SQL.Add('select ');
              SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
              SQL.Add('"col$colocacion".ID_PERSONA,');
              SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
              SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
              SQL.Add('"col$colocacion".VALOR_CUOTA,');
              SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
              SQL.Add('"col$tiposcuota".INTERES,');
              SQL.Add('"gen$persona".PRIMER_APELLIDO,');
              SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
              SQL.Add('"gen$persona".NOMBRE,');
              SQL.Add('"gen$persona".FECHA_NACIMIENTO,');
              SQL.Add('"gen$direccion".ID_DIRECCION,');
              SQL.Add('"gen$direccion".DIRECCION,');
              SQL.Add('"gen$direccion".MUNICIPIO,');
              SQL.Add('"gen$direccion".TELEFONO1');
              SQL.Add('from "col$colocacion"');
              SQL.Add('left join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
              SQL.Add('left join "gen$direccion" on ("col$colocacion".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$direccion".ID_PERSONA)');
              SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
              SQL.Add('where');
              SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and');
              SQL.Add('"col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
              ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              ExecQuery;
              try
                ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
                ConverColocacion := StrToInt64(ColocacionNew);
                ColocacionNew := Format('%.18d',[ConverColocacion]);       //'000000000000000000';
                ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);
                NovedadLocal := 0;
              except
                ShowMessage(ColocacionNew);
                raise;
              end;
            end;
            LineaC.Numero := ColocacionNew;
{             with IBSNoCredito do begin
              Close;
              SQL.Clear;
              SQL.Add('select ID_ANTERIOR from "col$cambioclaves"');
              SQL.Add('where ID_NUEVO = :"ID_NUEVO"');
              ParamByName('ID_NUEVO').AsString := ColocacionNew;
              ExecQuery;
              try
                LineaC.Numero := IBSNoCredito.FieldByName('ID_ANTERIOR').AsString;
                Close;
              except
                ShowMessage(LineaC.Numero);
                raise;
              end;
             end;      }

             LineaC.Identificacion := StringReplace(Format('%11s',[trim(IBSClientes.FieldByName('ID_PERSONA').AsString)]),' ','0',[rfReplaceAll]);
             Nombre := IBSClientes.FieldByName('PRIMER_APELLIDO').AsString + ' '
                       + IBSClientes.FieldByName('SEGUNDO_APELLIDO').AsString + ' '
                       + IBSClientes.FieldByName('NOMBRE').AsString;
             LineaC.Nombre := Format('%45s',[trim(IBSClientes.FieldByName('PRIMER_APELLIDO').AsString) + ' '
                       + trim(IBSClientes.FieldByName('SEGUNDO_APELLIDO').AsString) + ' '
                       + trim(IBSClientes.FieldByName('NOMBRE').AsString)]);
             if Trim(Nombre) = '' then
              begin
                LineaError := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
                PlanoErrores.Add(LineaError);
              end;
             Nombre := '';
             if (IBSClientes.FieldByName('FECHA_NACIMIENTO').AsString = '') or (IBSClientes.FieldByName('FECHA_NACIMIENTO').AsString = '1899/12/30') Then
              LineaC.FNacim := '000000'
             else
              LineaC.FNacim := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_NACIMIENTO').AsDateTime)])+Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_NACIMIENTO').AsDateTime)]);
             LineaC.FApert := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDateTime)])+Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDateTime)]);
             LineaC.FVenci := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDateTime)])+Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDateTime)]);
             LineaC.VCuota := Formatcurr('0000000000',IBSClientes.FieldByName('VALOR_CUOTA').ASCurrency);
             Fecha := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
             if IBSClientes.FieldByName('INTERES').AsString = 'V' then
                Fecha := CalculoFecha(Fecha,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
             Fecha := IncDay(Fecha);
             DiasMora := DiasEntre(Fecha,EdFechaCorte.Date);
             NovedadLocal := Novedad(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,DiasMora);
             SumaNovedad := SumaNovedad + NovedadLocal;
             LineaC.Noveda := StringReplace(Format('%2s',[IntToStr(Novedadlocal)]),' ','0',[rfReplaceAll]);
             LineaC.Adjeti := adjetivo(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString);
             case IBSClientes.FieldByName('ID_IDENTIFICACION').AsInteger of
               3 : LineaC.TpIden := '1';
               4 : LineaC.TpIden := '2';
               6 : LineaC.TpIden := '3';
               7 : LineaC.TpIden := '4';
               9 : LineaC.TpIden := '5';
               0 : LineaC.TpIden := '1';
             end;
            LineaC.ValIni := FormatCurr('0000000000',ibquery1.FieldByName('VALOR').AsCurrency);
            LineaC.ValDeu := FormatCurr('0000000000',ibquery1.FieldByName('DEUDA').AsCurrency);
            if (IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'A') or (IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'B') then
              LineaC.ValMor := FormatCurr('0000000000',ObtenerDeudaHoy(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,IBSCodeudores).Valor)
            else
              LineaC.ValMor := FormatCurr('0000000000',IBQuery1.FieldByName('DEUDA').AsCurrency);
            LineaC.ValDis := '0000000000';
            LineaC.TpMone := '1';
            LineaC.TpObli := IntToStr(IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger);
            LineaC.TpGara := IntToStr(IBQuery1.FieldByName('ID_GARANTIA').AsInteger);
            LineaC.Califi := IBQuery1.FieldByName('ID_ARRASTRE').AsString;
            LineaC.CResid := Format('%15s',[leftstr(trim(ibsclientes.FieldByName('MUNICIPIO').AsString),15)]);
            LineaC.DResid := Format('%30s',[leftstr(trim(ibsclientes.FieldByName('DIRECCION').AsString),30)]);
            LineaC.TResid := StringReplace(Format('%10s',[leftstr(trim(ibsclientes.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
            LineaC.CLabor := Format('%15s',[LeftStr(trim(ibsclientes.FieldByName('MUNICIPIO').AsString),15)]);
            LineaC.TLabor := StringReplace(Format('%10s',[LeftStr(trim(ibsclientes.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
            LineaC.CCorre := Format('%15s',[leftstr(trim(ibsclientes.FieldByName('MUNICIPIO').AsString),15)]);
            LineaC.DCorre := Format('%30s',[leftstr(trim(ibsclientes.FieldByName('DIRECCION').AsString),30)]);
            LineaC.Ciiu := '000000';
            with IBSCuotas do
             begin
               SQL.Clear;
               SQL.Add('select count(CUOTA_NUMERO) as CUOTAS from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION"');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               try
                 LineaC.TCuota := Format('%.3d',[FieldByName('CUOTAS').AsInteger]);
                 Close;
               except
                 raise;
               end;
             end;
            with IBSCuotas do
             begin
               SQL.Clear;
               SQL.Add('select count(CUOTA_NUMERO) as CUOTASPAG from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
               SQL.Add('PAGADA = 1');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               try
                 LineaC.CCance := Format('%.3d',[FieldByName('CUOTASPAG').AsInteger]);
                 Close;
               except
                 raise;
               end;
             end;
            with IBSCuotas do
             begin
               SQL.Clear;
               SQL.Add('select count(CUOTA_NUMERO) as CUOTASMORA from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
               SQL.Add('FECHA_A_PAGAR <= :"FECHA_CORTE" and');
               SQL.Add('PAGADA = 0');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
               ExecQuery;
               try
                 LineaC.CeMora := Format('%.3d',[FieldByName('CUOTASMORA').AsInteger]);
                 Close;
               except
                 raise;
               end;
             end;
            with IBQuery2 do
             begin
               SQL.Clear;
               SQL.Add('select FECHA_PAGADA from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
               SQL.Add('PAGADA = 1');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               Open;
               try
                 IBQuery2.First;
                 IBQuery2.Last;
                 if IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime <> 0 then
                    LineaC.FUPago := Format('%.4d',[YearOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)])+ Format('%.2d',[monthOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)]) + Format('%.2d',[DayOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)])
                 else
                    LineaC.FUPago := '00000000';
                 Close;
               except
                 ShowMessage(LineaC.FUPago);
                 raise;
               end;
             end;
            LineaC.Oficin := '          OCAÑA';
            LineaC.CRadic := '          OCAÑA';
            LineaC.FoPago := '0';
            case IBQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger of
              30 : LineaC.PePago := '1';
              60 : LineaC.PePago := '2';
              90 : LineaC.PePago := '3';
              180 : LineaC.PePago := '4';
              360 : LineaC.PePago := '5';
              0 : LineaC.PePago := '9';
            end;

            if (DiasMora < 30) then LineaC.EdMora := '001'
            else if (DiasMora >= 30) and (DiasMora < 60) then LineaC.EdMora := '030'
            else if (DiasMora >= 60) and (DiasMora < 90) then LineaC.EdMora := '060'
            else if (DiasMora >= 90) and (DiasMora < 120) then LineaC.EdMora := '090'
            else if (DiasMora >= 120) and (DiasMora < 150) then LineaC.EdMora := '120'
            else if (DiasMora >= 150) and (DiasMora < 180) then LineaC.EdMora := '150'
            else if (DiasMora >= 180) and (DiasMora < 210) then LineaC.EdMora := '180'
            else if (DiasMora >= 210) and (DiasMora < 240) then LineaC.EdMora := '210'
            else if (DiasMora >= 240) and (DiasMora < 270) then LineaC.EdMora := '240'
            else if (DiasMora >= 270) and (DiasMora < 300) then LineaC.EdMora := '270'
            else if (DiasMora >= 300) and (DiasMora < 330) then LineaC.EdMora := '300'
            else if (DiasMora >= 330) and (DiasMora < 360) then LineaC.EdMora := '330'
            else if (DiasMora > 360) then LineaC.EdMora := '360';
            LineaC.FActua := Format('%.4d',[YearOf(EdFechaCorte.Date)]) + Format('%.2d',[monthOf(EdFechaCorte.Date)]) + Format('%.2d',[DayOf(EdFechaCorte.Date)]);
            LineaC.Reclam := '0';
            LineaC.Respon := '00';
            LineaC.Estrac := '3';
            LineaC.Rellen := '              ';
            PlanoReporte.Add(LineaC.Numero + LineaC.Identificacion + LineaC.Nombre +
                             LineaC.FNacim + LineaC.FApert + LineaC.FVenci + LineaC.VCuota +
                             LineaC.Noveda + LineaC.Adjeti + LineaC.TpIden + LineaC.ValIni +
                             LineaC.ValDeu + LineaC.ValMor + LineaC.ValDis + LineaC.TpMone +
                             LineaC.TpObli + LineaC.TpGara + LineaC.Califi + LineaC.CResid +
                             LineaC.DResid + LineaC.TResid + LineaC.CLabor + LineaC.TLabor +
                             LineaC.CCorre + LineaC.DCorre + LineaC.Ciiu + LineaC.TCuota +
                             LineaC.CCance + LineaC.CeMora + LineaC.FUPago + LineaC.Oficin +
                             LineaC.CRadic + LineaC.FoPago + LineaC.PePago + LineaC.EdMora +
                             LineaC.FActua + LineaC.Reclam + LineaC.Respon + LineaC.Estrac + LineaC.Rellen);
           
            SumaRegistros := SumaRegistros + 1;
            IBSClientes.Close;
            // fin de proceso clientes

            // Inicio proceso CODEUDORES
             NoCod := 0;
             with IBSCodeudores do begin
              Close;
              SQL.Clear;
              SQL.Add('select ');
              SQL.Add('"col$colgarantias".ID_IDENTIFICACION,');
              SQL.Add('"col$colgarantias".ID_PERSONA,');
              SQL.Add('"gen$persona".PRIMER_APELLIDO,');
              SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
              SQL.Add('"gen$persona".NOMBRE,');
              SQL.Add('"gen$persona".FECHA_NACIMIENTO');
              SQL.Add('from "col$colgarantias"');
              SQL.Add('left join "gen$persona" on ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA)');
              SQL.Add('where');
              SQL.Add('"col$colgarantias".ID_AGENCIA = :"ID_AGENCIA" and');
              SQL.Add('"col$colgarantias".ID_COLOCACION = :"ID_COLOCACION"');
              ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              ExecQuery;
            end;

            while not IBSCodeudores.Eof do
             begin
               Application.ProcessMessages;
               NoCod := NoCod + 1;
               ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ConverColocacion := StrToInt64(ColocacionNew);
               ColocacionNew := Format('%.16d',[ConverColocacion]);
               ColocacionNew := ColocacionNew + 'C' + IntToStr(NoCod);
               ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);
               NovedadLocal := 0;

               LineaC.Numero := ColocacionNew;
            {   with IBSNoCredito do begin
                IBSNoCredito.Close;
                SQL.Clear;
                SQL.Add('select ID_ANTERIOR from "col$cambioclaves"');
                SQL.Add('where ID_NUEVO = :"ID_NUEVO"');
                ParamByName('ID_NUEVO').AsString := ColocacionNew;
                ExecQuery;
                LineaC.Numero := IBSNoCredito.FieldByName('ID_ANTERIOR').AsString;
                IBSNoCredito.Close;
               end;     }

               LineaC.Identificacion := StringReplace(Format('%11s',[trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString)]),' ','0',[rfReplaceAll]);
//proceso verificacion codeudores
               if DataErrores.Locate('COLOCACION_ERRADO;IDENTIFICACION',VarArrayOf([LineaC.Numero,trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString)]),[locaseinsensitive]) then
                  LineaC.Numero := DataErrores.FieldValues['COLOCACION_CORRECTO'];
//fin
               Nombre := IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString + ' '
                         + IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString + ' '
                         + IBSCodeudores.FieldByName('NOMBRE').AsString;
               LineaC.Nombre := Format('%45s',[trim(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString) + ' '
                       + trim(IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString) + ' '
                       + trim(IBSCodeudores.FieldByName('NOMBRE').AsString)]);
               if Trim(Nombre) = '' then
                begin
                  LineaError := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
                  PlanoErrores.Add(LineaError);
                end;
               Nombre := '';
               if (IBSCodeudores.FieldByName('FECHA_NACIMIENTO').AsString = '') or (IBSCodeudores.FieldByName('FECHA_NACIMIENTO').AsString = '1899/12/30') Then
                LineaC.FNacim := '000000'
               else
                LineaC.FNacim := Format('%.4d',[YearOf(IBSCodeudores.FieldByName('FECHA_NACIMIENTO').AsDateTime)])+Format('%.2d',[monthOf(IBSCodeudores.FieldByName('FECHA_NACIMIENTO').AsDateTime)]);
               SumaNovedad := SumaNovedad + NovedadLocal;
               case IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger of
                 3 : LineaC.TpIden := '1';
                 4 : LineaC.TpIden := '2';
                 6 : LineaC.TpIden := '3';
                 7 : LineaC.TpIden := '4';
                 9 : LineaC.TpIden := '5';
                 0 : LineaC.TpIden := '1';
               end;

              with IBSCuotas do begin
               IBSCuotas.Close;
               SQL.Clear;
               SQL.Add('select first 1');
               SQL.Add('"gen$direccion".ID_DIRECCION,');
               SQL.Add('"gen$direccion".DIRECCION,');
               SQL.Add('"gen$direccion".MUNICIPIO,');
               SQL.Add('"gen$direccion".TELEFONO1');
               SQL.Add('from "gen$direccion"');
               SQL.Add('where');
               SQL.Add('"gen$direccion".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and');
               SQL.Add('"gen$direccion".ID_PERSONA = :"ID_PERSONA"');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
               ExecQuery;
               LineaC.CResid := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
               LineaC.DResid := Format('%30s',[leftstr(trim(ibscuotas.FieldByName('DIRECCION').AsString),30)]);
               LineaC.TResid := StringReplace(Format('%10s',[leftstr(trim(ibscuotas.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
               LineaC.CLabor := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
               LineaC.TLabor := StringReplace(Format('%10s',[leftstr(trim(ibscuotas.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
               LineaC.CCorre := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
               LineaC.DCorre := Format('%30s',[leftstr(trim(ibscuotas.FieldByName('DIRECCION').AsString),30)]);
               IBSCuotas.Close;
              end;

              LineaC.Respon := '01';


              PlanoReporte.Add(LineaC.Numero + LineaC.Identificacion + LineaC.Nombre +
                               LineaC.FNacim + LineaC.FApert + LineaC.FVenci + LineaC.VCuota +
                               LineaC.Noveda + LineaC.Adjeti + LineaC.TpIden + LineaC.ValIni +
                               LineaC.ValDeu + LineaC.ValMor + LineaC.ValDis + LineaC.TpMone +
                               LineaC.TpObli + LineaC.TpGara + LineaC.Califi + LineaC.CResid +
                               LineaC.DResid + LineaC.TResid + LineaC.CLabor + LineaC.TLabor +
                               LineaC.CCorre + LineaC.DCorre + LineaC.Ciiu + LineaC.TCuota +
                               LineaC.CCance + LineaC.CeMora + LineaC.FUPago + LineaC.Oficin +
                               LineaC.CRadic + LineaC.FoPago + LineaC.PePago + LineaC.EdMora +
                               LineaC.FActua + LineaC.Reclam + LineaC.Respon + LineaC.Estrac + LineaC.Rellen);
              SumaRegistros := SumaRegistros + 1;
              IBSCodeudores.Next;
             end; // fin de While Codeudores
            // Fin proceso Codeudores
            Next;
//             end; // fin with IBSClientes
           end; // fin de while
        end; //fin de with principal

        CheckBox2.Checked := True;
end;

procedure TfrmDataProceso.TercerPaso;
var cadena:string;
    LineaC:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Identificador
      cadena := 'ZZZZZZZZZZZZZZZZZZ';
      LineaC := cadena;
// Fecha Proceso
      cadena := Format('%.2d',[dayof(Date)])+Format('%.2d',[monthOf(Date)])+Format('%.4d',[YearOf(Date)]);
      LineaC := LineaC + cadena;
// Numero de Regitros
      cadena := StringReplace(Format('%8d',[SumaRegistros]),' ','0',[rfReplaceAll]);
      LineaC := LineaC + cadena;
// Sumatoria Novedades
      cadena := StringReplace(Format('%8d',[SumaNovedad]),' ','0',[rfReplaceAll]);
      LineaC := LineaC + cadena;
// Relleno
      cadena := '';
      i1 := 1;
      i2 := 318;
      for J := i1 to i2 do
          cadena := cadena + '0';
      LineaC := LineaC + cadena;
      PlanoReporte.Add(LineaC);
      CheckBox3.Checked := True;
end;

procedure TfrmDataProceso.CmdProcesarClick(Sender: TObject);
begin
        CmdProcesar.Enabled := False;
        primerpaso;
        segundopaso;
        tercerpaso;
        cuartopaso;
        CmdGenerar.Enabled := True;
end;

procedure TfrmDataProceso.FormShow(Sender: TObject);
begin
        PlanoReporte := TStringList.Create;
        PlanoErrores := TStringList.Create;
        PlanoReporte.Clear;
        PlanoErrores.Clear;
        dmGeneral.IBDatabase1.Open;
        dmGeneral.IBTransaction1.Active := True;
        dmColocacion.IBDSagencias.Active := True;
end;

function TfrmDataProceso.Novedad(IdAgencia: Integer;
  IdColocacion: string;Dias:Integer): Integer;
var
Mora:Integer;
Novedad:integer;
Saldo:Currency;
Estado:Integer;
begin
        if (Dias < 30) then Novedad := 1 //'01'
        else if (Dias >= 30) and (Dias < 60) then Novedad := 6 //'06'
        else if (Dias >= 60) and (Dias < 90) then Novedad := 7 //'07'
        else if (Dias >= 90) and (Dias < 120) then Novedad := 8 //'08'
        else if (Dias >= 120) and (Dias < 180) then Novedad := 9 //'09'
        else if (Dias >= 180) then Novedad := 12; //'12';

        with IBSCuotas do begin
         Close;
         SQL.Clear;
         SQL.Add('select (VALOR_DESEMBOLSO - ABONOS_CAPITAL) as SALDO, ID_ESTADO_COLOCACION');
         SQL.Add('from "col$colocacion"');
         SQL.Add('where ');
         SQL.Add('ID_AGENCIA =:"ID_AGENCIA" and');
         SQL.Add('ID_COLOCACION =:"ID_COLOCACION"');
         ParamByName('ID_AGENCIA').AsInteger := IDAgencia;
         ParamByName('ID_COLOCACION').AsString := IdColocacion;
         ExecQuery;
         Saldo := FieldByName('SALDO').AsCurrency;
         Estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
        end;

        if (Saldo = 0) then
         begin
           if (Estado = 7) then Novedad := 5 //'05'
           else if (Estado = 6) then Novedad := 14; //'14';
         end
        else
           if (Estado >= 3)then
              Novedad := 13; //'13';

        Result := Novedad;
end;

function TfrmDataProceso.Adjetivo(IdAgencia: Integer;
  IdColocacion: string): string;
var
Estado:Integer;
Castigado,Fallecido:Integer;
begin
        with IBSCuotas do begin
         Close;
         SQL.Clear;
         SQL.Add('select ID_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where');
         SQL.Add('ES_FALLECIDO = 1');
         ExecQuery;
         Fallecido := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('select ID_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where');
         SQL.Add('ES_CASTIGADO = 1');
         ExecQuery;
         Fallecido := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('select ID_ESTADO_COLOCACION from "col$colocacion"');
         SQL.Add('where ');
         SQL.Add('ID_AGENCIA =:"ID_AGENCIA" and');
         SQL.Add('ID_COLOCACION =:"ID_COLOCACION"');
         ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
         ParamByName('ID_COLOCACION').AsString := IdColocacion;
         ExecQuery;
         Estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;
        end;

        if (Estado = Fallecido) then Result := '16'
        else if (Estado = Castigado) then Result := '13'
        else Result := '00';

end;

procedure TfrmDataProceso.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmDataProceso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmDataProceso.CmdGenerarClick(Sender: TObject);
begin
        PlanoReporte.SaveToFile('c:/Datacredito/DataCredito.TXT');
        PlanoErrores.SaveToFile('c:/Datacredito/ErroresDatacredito.TXT');
        CmdVer.Enabled := True;
end;

procedure TfrmDataProceso.CmdVerClick(Sender: TObject);
var frmMuestroArchivo : TfrmMuestroArchivo;
begin
        frmMuestroArchivo := TfrmMuestroArchivo.Create(Self);
        frmMuestroArchivo.ShowModal;
end;

procedure TfrmDataProceso.CuartoPaso;


begin

end;

end.
