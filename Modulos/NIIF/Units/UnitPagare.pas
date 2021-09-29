unit UnitPagare;

interface

uses
  Windows, Messages, Printers, StrUtils, Math, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,
  JvEdit, JvTypedEdit, IBSQL, NLetra,IBCustomDataSet, IBQuery, DBClient, Grids,
  DB, FR_DSet, FR_DBSet, FR_Class;

type
  TfrmPagare = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    CmdImprimir: TBitBtn;
    IBSQLPagare: TIBSQL;
    EdColocacion: TMemo;
    frDBDataSet1: TfrDBDataSet;
    IBSQLCodeudores: TIBSQL;
    NLetra: TNLetra;
    IBSQLCuotas: TIBSQL;
    IBSQL1: TIBSQL;
    CDSCodeudores: TClientDataSet;
    CDSCodeudoresNOMBRE: TStringField;
    GridDeudores: TStringGrid;
    ReporteN: TfrReport;
    CDSCodeudoresIDENTIFICACION: TStringField;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdImprimirClick(Sender: TObject);
    procedure EdColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure ReporteGetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ReporteNBeginPage(pgNo: Integer);
  private
  a :Integer;
    procedure imprimir_reporte(cadena: string);
    { Private declarations }
  public
    { Public declarations }
  end;

type PDeudores = ^TDeudores;
     TDeudores = record
      Identificacion:string;
      Numero:string;
      Expedicion:string;
      Nombre:string;
end;

var
  frmPagare: TfrmPagare;
  ListaDeudores:TList;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitGlobalesCol, UnitImpresion, unitMain;

procedure TfrmPagare.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmPagare.CmdImprimirClick(Sender: TObject);
var     ADeudores: PDeudores;
begin
 begin
        CDSCodeudores.CancelUpdates;
        with IBSQLPagare do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          ParamByName('AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          try
           ExecQuery;
           if RecordCount < 1 then
            begin
              MessageDlg('Colocación no existe!',mtError,[mbcancel],0);
              Exit;
            end;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

        with IBSQLCodeudores do begin
         Close;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
          end;
        end;

        with IBSQLCuotas do begin
         Close;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
          end;
        end;
        ListaDeudores := TList.Create;
        New(ADeudores);
        ADeudores^.Identificacion := IBSQLPagare.FieldByName('DESCRIPCION_IDENTIFICACION').AsString;
        ADeudores^.Numero := IBSQLPagare.FieldByName('ID_PERSONA').AsString;
        ADeudores^.Expedicion := IBSQLPagare.FieldByName('LUGAR_EXPEDICION').AsString;
        ADeudores^.Nombre := IBSQLPagare.FieldByName('NOMBRE').AsString + ' ' +
                              IBSQLPagare.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                              IBSQLPagare.FieldByName('SEGUNDO_APELLIDO').AsString;
        ListaDeudores.Add(ADeudores);
        CDSCodeudores.Open;
        CDSCodeudores.Insert;
        CDSCodeudores.FieldByName('NOMBRE').AsString := 'DEUDOR';
        CDSCodeudores.FieldByName('IDENTIFICACION').AsString := IBSQLPagare.FieldByName('ID_PERSONA').AsString + ' de ' + IBSQLPagare.FieldByName('LUGAR_EXPEDICION').AsString;
        CDSCodeudores.Post;
        CDSCodeudores.Close;

        while not IBSQLCodeudores.Eof do
        begin
          New(Adeudores);
          ADeudores^.Identificacion := IBSQLCodeudores.FieldByName('DESCRIPCION_IDENTIFICACION').AsString;
          ADeudores^.Numero := IBSQLCodeudores.FieldByName('ID_PERSONA').AsString;
          ADeudores^.Expedicion := IBSQLCodeudores.FieldByName('LUGAR_EXPEDICION').AsString;
          ADeudores^.Nombre := IBSQLCodeudores.FieldByName('NOMBRE').AsString + ' ' +
                              IBSQLCodeudores.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                              IBSQLCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString;
          ListaDeudores.Add(ADeudores);

          CDSCodeudores.Open;
          CDSCodeudores.Insert;
          CDSCodeudores.FieldByName('NOMBRE').AsString := 'CODEUDOR';
          CDSCodeudores.FieldByName('IDENTIFICACION').AsString := IBSQLCodeudores.FieldByName('ID_PERSONA').AsString + ' de ' + IBSQLCodeudores.FieldByName('LUGAR_EXPEDICION').AsString;
          CDSCodeudores.Post;
          CDSCodeudores.Close;

          IBSQLCodeudores.Next;
        end;

//        Reporte.Dataset := nil;
//        Reporte.ShowReport;
//        ReporteN.ShowReport;
        imprimir_reporte(frmMain.ruta1 + '\Reporte\RepPagareNuevo.frf');
 end;
end;

procedure TfrmPagare.EdColocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmPagare.ReporteGetValue(const ParName: String;
  var ParValue: Variant);
var i,Total:Integer;
    ADeudores:PDeudores;
    ADeudores1:PDeudores;
    CuotaF:Currency;
    Texto : string;
    Periodicidad, Periodicidad_I:string;
    FechaAnterior,FechaI:TDate;
    Tasa:Extended;
    ESPACIOS:string[255];
    SALTO:string;
    Iniciales:TStringList;
    TasaDecimal:Extended;
    CadenaTasa:string;
    LugarExp :string;
begin
        for i := 0 to 254 do
          ESPACIOS[i] := ' ';

        SALTO := #13 + #13 + #13 + #13 + #13;

        if ParName = 'PAGARE' then
           ParValue := IBSQLPagare.FieldByName('ID_COLOCACION').AsString;

        if ParName = 'CUENTA' then
           ParValue := '2' + Format('%.2d',[Agencia]) + '-' +  Format('%.7d',[IBSQLPagare.FieldByName('NUMERO_CUENTA').AsInteger]);

        if ParName = 'VALOR' then
           ParValue := IBSQLPagare.FieldByName('VALOR_DESEMBOLSO').AsCurrency;

        if ParName = 'FECHA_DESEMBOLSO' then
           ParValue := IBSQLPagare.FieldByName('FECHA_DESEMBOLSO').AsString;

        if ParName = 'VENCIMIENTO_L' then begin
           Texto := IntToStr(dayof(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate)) + ' DE ' + UpperCase(Meses[MonthOf(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate)]) + ' DE ' + IntToStr(Yearof(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate));
           ParValue := Texto;
        end;

        if ParName = 'EMPRESA' then
           ParValue := Empresa;

        if ParName = 'NIT' then
           ParValue := 'NIT: '+ Nit;

        if ParName = 'RECURSOS' then
           ParValue := 'PROPIOS';

        if ParName = 'DESTINO' then
           ParValue := IBSQLPagare.FieldByName('DESCRIPCION_INVERSION').AsString;

        if ParName = 'GARANTIAS' then
           ParValue := IBSQLPagare.FieldByName('DESCRIPCION_GARANTIA').AsString;

        if ParName = 'DEUDORES' then begin
           ParValue := '';
           for i := 0 to ListaDeudores.Count - 1 do
           begin
            ADeudores := ListaDeudores.Items[i];
            ParValue := ParValue + Adeudores^.Nombre + ' ' +
                       'IDENTIFICADO CON '+ Adeudores^.Identificacion + ' ' +
                       'No. '+ Adeudores^.Numero + ' ' +
                       'DE ' + Trim(Adeudores^.Expedicion) + ' COMO ';
            if i=0 then ParValue := ParValue + ' DEUDOR PRINCIPAL'
            else ParValue := ParValue + ' CODEUDOR';

            if (ListaDeudores.Count > 1) and (i <> (ListaDeudores.Count - 1)) then
            begin
              if (i = 0) and (ListaDeudores.Count > 2) then
                 ParValue := ParValue + ' Y NOSOTROS '
              else
                begin
                 ADeudores1 := ListaDeudores.Items[i+1];
                 if (LeftStr(ADeudores1^.Nombre,1) = 'I') or
                    (LeftStr(ADeudores1^.Nombre,2) = 'HI')
                 then
                     ParValue := ParValue + ' E '
                 else
                     ParValue := ParValue + ' Y ';
                end;
            end;
           end;
        end;

         {if ParName = 'FIRMAS' then begin
           Texto:= '';
           for i := 0 to ListaDeudores.Count - 1 do
           begin
            ADeudores1 := ListaDeudores.Items[i];
            LugarExp := Adeudores1^.Numero + ' ' + 'DE ' + Trim(Adeudores1^.Expedicion);
            if i = 0 then
              Texto := Texto + 'DEUDOR' + #13 + 'C.C. No.'+ LugarExp + ESPACIOS + ESPACIOS + ESPACIOS + ESPACIOS + 'HUELLA'
            else
              Texto := Texto + SALTO + 'CODEUDOR' + #13 + 'C.C. No.' + LugarExp + ESPACIOS + ESPACIOS + ESPACIOS + ESPACIOS + 'HUELLA';
           end;
           ParValue := Texto;
         end;}

         if ParName = 'CIUDAD' then
            ParValue := Ciudad;

         if ParName = 'DEPARTAMENTO' then
            ParValue := Departamento;

         if ParName = 'LA_SUMA_DE' then
         begin
              NLetra.Numero := IBSQLPagare.FieldByName('VALOR_DESEMBOLSO').AsInteger;
              Texto := NLetra.Letras;
              if RightStr(Texto,4) = 'mil ' then
                 Texto := Texto + 'PESOS'
              else
              if RightStr(Texto,9) = 'millones ' then
                 Texto := Texto + 'DE PESOS'
              else
              if RightStr(Texto,7) = 'millon ' then
                 Texto := Texto + 'DE PESOS'
              else
                 Texto := Texto + 'PESOS';

              Texto := UpperCase(Texto);
              ParValue := Texto;
            end;

         if ParName = 'EN_NUMERO' then
            ParValue := FormatCurr('$#,#0.00',IBSQLPagare.FieldByName('VALOR_DESEMBOLSO').AsCurrency);

            with IBSQL1 do begin
              Close;
              SQL.Clear;
              SQL.Add('select count(*) as TOTAL from "col$tablaliquidacion"');
              SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
              try
               ExecQuery;
              except
               Transaction.Rollback;
               raise;
              end; // del try
            end; // del with
            Total := IBSQL1.FieldByName('TOTAL').AsInteger;
       if Total > 1 then begin

        case IBSQLPagare.FieldByName('AMORTIZA_CAPITAL').AsInteger of
          15: Periodicidad := 'QUINCENALES';
          30: Periodicidad := 'MENSUALES';
          60: Periodicidad := 'BIMESTRALES';
          90: Periodicidad := 'TRIMESTRALES';
         120: Periodicidad := 'CUATRIMESTRALES';
         150: Periodicidad := 'QUINTUMESTRALES';
         180: Periodicidad := 'SEMESTRALES';
         360: Periodicidad := 'ANUAL';
        end;


        case IBSQLPagare.FieldByName('AMORTIZA_INTERES').AsInteger of
          15: Periodicidad_I := 'QUINCENALES';
          30: Periodicidad_I := 'MENSUALES';
          60: Periodicidad_I := 'BIMESTRALES';
          90: Periodicidad_I := 'TRIMESTRALES';
         120: Periodicidad_I := 'CUATRIMESTRALES';
         150: Periodicidad_I := 'QUINTUMESTRALES';
         180: Periodicidad_I := 'SEMESTRALES';
         360: Periodicidad_I := 'ANUAL';
        end;

       end
       else
       begin
        case IBSQLPagare.FieldByName('AMORTIZA_CAPITAL').AsInteger of
          15: Periodicidad := 'QUINCENAL';
          30: Periodicidad := 'MENSUAL';
          60: Periodicidad := 'BIMESTRAL';
          90: Periodicidad := 'TRIMESTRAL';
         120: Periodicidad := 'CUATRIMESTRAL';
         150: Periodicidad := 'QUINTUMESTRAL';
         180: Periodicidad := 'SEMESTRAL';
         360: Periodicidad := 'ANUAL';
        end;


        case IBSQLPagare.FieldByName('AMORTIZA_INTERES').AsInteger of
          15: Periodicidad_I := 'QUINCENAL';
          30: Periodicidad_I := 'MENSUAL';
          60: Periodicidad_I := 'BIMESTRAL';
          90: Periodicidad_I := 'TRIMESTRAL';
         120: Periodicidad_I := 'CUATRIMESTRAL';
         150: Periodicidad_I := 'QUINTUMESTRAL';
         180: Periodicidad_I := 'SEMESTRAL';
         360: Periodicidad_I := 'ANUAL';
        end;

       end;

       if ParName = 'FORMA_PAGO' then
       begin  // begin 1

          if IBSQLPagare.FieldByName('TIPO_CUOTA').AsString = 'F' then
          begin // begin 2

            with IBSQL1 do begin
              Close;
              SQL.Clear;
              SQL.Add('select count(*) as TOTAL from "col$tablaliquidacion"');
              SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
              try
               ExecQuery;
              except
               Transaction.Rollback;
               raise;
              end; // del try
            end; // del with
            Total := IBSQL1.FieldByName('TOTAL').AsInteger;

            if Total > 1 then
            begin // begin 3
                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('select first 1 * from "col$tablaliquidacion"');
                IBSQL1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
                IBSQL1.SQL.Add('order by CUOTA_NUMERO DESC');
                IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBSQL1.ParamByName('ID_COLOCACION').AsString := IBSQLPagare.FieldByName('ID_COLOCACION').AsString;
                try
                 IBSQL1.ExecQuery;
                except
                 IBSQL1.Transaction.Rollback;
                 raise;
                end;

                CuotaF := IBSQL1.FieldByName('CAPITAL_A_PAGAR').AsCurrency + IBSQL1.FieldByName('INTERES_A_PAGAR').AsCurrency;

                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('select first 1 * from "col$tablaliquidacion"');
                IBSQL1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
                IBSQL1.SQL.Add('order by CUOTA_NUMERO ASC');
                IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBSQL1.ParamByName('ID_COLOCACION').AsString := IBSQLPagare.FieldByName('ID_COLOCACION').AsString;
                try
                 IBSQL1.ExecQuery;
                except
                 IBSQL1.Transaction.Rollback;
                 raise;
                end;

                FechaI := IBSQL1.FieldByName('FECHA_A_PAGAR').AsDate;

                IBSQL1.Close;

                if CuotaF <> IBSQLPagare.FieldByName('VALOR_CUOTA').AsCurrency then
                begin // begin 4
                  NLetra.Numero := Total;
                  Texto := UpperCase(NLetra.Letras) + ' ('+IntToStr(Total)+') CUOTAS '+ Periodicidad + ' DE LAS CUALES ';
                  NLetra.Numero := Total - 1;
                  Texto := Texto + UpperCase(NLetra.Letras) + ' ('+IntToStr(Total-1)+') CUOTAS SON POR VALOR DE ';
                  NLetra.Numero := IBSQLPagare.FieldByName('VALOR_CUOTA').AsInteger;
                  Texto := Texto + UpperCase(NLetra.Letras) + ' ';
                  if RightStr(NLetra.Letras,4) = 'mil ' then
                     Texto := Texto + 'PESOS'
                  else
                  if RightStr(NLetra.Letras,9) = 'millones ' then
                     Texto := Texto + 'DE PESOS'
                  else
                  if RightStr(NLetra.Letras,7) = 'millon ' then
                     Texto := Texto + 'DE PESOS'
                  else
                     Texto := Texto + 'PESOS';
                  Texto := Texto + ' MCTE (';
                  Texto := Texto + FormatCurr('$#,#0.00',IBSQLPagare.FieldByName('VALOR_CUOTA').AsCurrency) + ') CADA UNA DESDE EL ';
                  Texto := Texto + IntToStr(DayOf(FechaI)) + ' DE ' + UpperCase(Meses[MonthOf(FechaI)]) + ' DE ' + IntToStr(YearOf(FechaI)) + ' ' ;
                  FechaAnterior := CalculoFecha(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate,-IBSQLPagare.FieldByName('AMORTIZA_CAPITAL').AsInteger);
                  Texto := Texto + 'HASTA EL ' + IntToStr(dayof(FechaAnterior)) + ' DE ' + UpperCase(Meses[MonthOf(FechaAnterior)]) + ' DE ' + IntToStr(Yearof(FechaAnterior));
                  Texto := Texto + ' Y UNA ULTIMA CUOTA POR VALOR DE ';
                  NLetra.Numero := Trunc(CuotaF);
                  Texto := Texto + UpperCase(NLetra.Letras) + ' PESOS MCTE ('+ FormatCurr('$#,#0.00',CuotaF) + ') EL ';
                  Texto := Texto + IntToStr(dayof(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate)) + ' DE ' + UpperCase(Meses[MonthOf(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate)]) + ' DE ' + IntToStr(Yearof(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate));
                  Texto := Texto + ', CORRESPONDIENTES A CAPITAL E INTERESES';
                end // begin 4
                else
                begin  // begin 4
                  NLetra.Numero := Total;
                  Texto := UpperCase(NLetra.Letras) + ' ('+IntToStr(Total)+') CUOTAS '+ Periodicidad + ' CADA UNA POR UN VALOR DE ';
                  NLetra.Numero := IBSQLPagare.FieldByName('VALOR_CUOTA').AsInteger;
                  Texto := Texto + UpperCase(NLetra.Letras) + ' ';
                  if RightStr(NLetra.Letras,4) = 'mil ' then
                     Texto := Texto + 'PESOS'
                  else
                  if RightStr(NLetra.Letras,9) = 'millones ' then
                     Texto := Texto + 'DE PESOS'
                  else
                  if RightStr(NLetra.Letras,7) = 'millon ' then
                     Texto := Texto + 'DE PESOS'
                  else
                     Texto := Texto + 'PESOS';
                  Texto := Texto + ' MCTE (';
                  Texto := Texto + FormatCurr('$#,#0.00',IBSQLPagare.FieldByName('VALOR_CUOTA').AsCurrency) + ') CADA UNA DESDE EL ';
                  Texto := Texto + IntToStr(DayOf(FechaI)) + ' DE ' + UpperCase(Meses[MonthOf(FechaI)]) + ' DE ' + IntToStr(YearOf(FechaI)) + ' ' ;
                  FechaAnterior := IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate;
                  Texto := Texto + 'HASTA EL ' + IntToStr(dayof(FechaAnterior)) + ' DE ' + UpperCase(Meses[MonthOf(FechaAnterior)]) + ' DE ' + IntToStr(Yearof(FechaAnterior));
                end; // begin 4 - if CuotaF
                ParValue := Texto;
               end
               else
               begin // begin 3
                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('select first 1 * from "col$tablaliquidacion"');
                IBSQL1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
                IBSQL1.SQL.Add('order by CUOTA_NUMERO DESC');
                IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBSQL1.ParamByName('ID_COLOCACION').AsString := IBSQLPagare.FieldByName('ID_COLOCACION').AsString;
                try
                 IBSQL1.ExecQuery;
                except
                 IBSQL1.Transaction.Rollback;
                 raise;
                end;

                CuotaF := IBSQL1.FieldByName('CAPITAL_A_PAGAR').AsCurrency + IBSQL1.FieldByName('INTERES_A_PAGAR').AsCurrency;

                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('select first 1 * from "col$tablaliquidacion"');
                IBSQL1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
                IBSQL1.SQL.Add('order by CUOTA_NUMERO ASC');
                IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBSQL1.ParamByName('ID_COLOCACION').AsString := IBSQLPagare.FieldByName('ID_COLOCACION').AsString;
                try
                 IBSQL1.ExecQuery;
                except
                 IBSQL1.Transaction.Rollback;
                 raise;
                end;

                FechaI := IBSQL1.FieldByName('FECHA_A_PAGAR').AsDate;

                IBSQL1.Close;

                Texto := 'UNA CUOTA ' + Periodicidad + ' POR VALOR DE ';
                NLetra.Numero := IBSQLPagare.FieldByName('VALOR_CUOTA').AsInteger;
                Texto := Texto + UpperCase(NLetra.Letras) + ' ';
                  if RightStr(NLetra.Letras,4) = 'mil ' then
                     Texto := Texto + 'PESOS'
                  else
                  if RightStr(NLetra.Letras,9) = 'millones ' then
                     Texto := Texto + 'DE PESOS'
                  else
                  if RightStr(NLetra.Letras,7) = 'millon ' then
                     Texto := Texto + 'DE PESOS'
                  else
                     Texto := Texto + 'PESOS';
                Texto := Texto + ' MCTE (';
                Texto := Texto + FormatCurr('$#,#0.00',IBSQLPagare.FieldByName('VALOR_CUOTA').AsCurrency) + ') LA CUAL ';
                if ListaDeudores.Count > 1 then
                  Texto := Texto + ' CANCELAREMOS EL DIA '
                else
                  Texto := Texto + ' CANCELARE EL DIA ';
                Texto := Texto + IntToStr(DayOf(FechaI)) + ' DE ' + UpperCase(Meses[MonthOf(FechaI)]) + ' DE ' + IntToStr(YearOf(FechaI)) + ' ' ;
               end; // begin 3 -  if Total
           end  // begin 2 - Cuota "F"
          else
              begin // begin 2
               with IBSQL1 do begin
                 Close;
                 SQL.Clear;
                 SQL.Add('select count(*) as TOTAL from "col$tablaliquidacion"');
                 SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
                 ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
                 try
                  ExecQuery;
                 except
                  Transaction.Rollback;
                  raise;
                 end; // del try
               end; // del with
               Total := IBSQL1.FieldByName('TOTAL').AsInteger;
               if Total > 1 then
               begin // begin 3
                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('select first 1 * from "col$tablaliquidacion"');
                IBSQL1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
                IBSQL1.SQL.Add('order by CUOTA_NUMERO DESC');
                IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBSQL1.ParamByName('ID_COLOCACION').AsString := IBSQLPagare.FieldByName('ID_COLOCACION').AsString;
                try
                 IBSQL1.ExecQuery;
                except
                 IBSQL1.Transaction.Rollback;
                 raise;
                end;

                CuotaF := IBSQL1.FieldByName('CAPITAL_A_PAGAR').AsCurrency + IBSQL1.FieldByName('INTERES_A_PAGAR').AsCurrency;

                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('select first 1 * from "col$tablaliquidacion"');
                IBSQL1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
                IBSQL1.SQL.Add('order by CUOTA_NUMERO ASC');
                IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBSQL1.ParamByName('ID_COLOCACION').AsString := IBSQLPagare.FieldByName('ID_COLOCACION').AsString;
                try
                 IBSQL1.ExecQuery;
                except
                 IBSQL1.Transaction.Rollback;
                 raise;
                end;

                FechaI := IBSQL1.FieldByName('FECHA_A_PAGAR').AsDate;

                IBSQL1.Close;

                if CuotaF <> IBSQLPagare.FieldByName('VALOR_CUOTA').AsCurrency then
                begin // begin 4
                  NLetra.Numero := Total;
                  Texto := UpperCase(NLetra.Letras) + ' ('+IntToStr(Total)+') CUOTAS '+ Periodicidad + ' DE LAS CUALES ';
                  NLetra.Numero := Total - 1;
                  Texto := Texto + UpperCase(NLetra.Letras) + ' ('+IntToStr(Total-1)+') CUOTAS SON POR VALOR DE ';
                  NLetra.Numero := IBSQLPagare.FieldByName('VALOR_CUOTA').AsInteger;
                  Texto := Texto + UpperCase(NLetra.Letras) + ' ';
                  if RightStr(NLetra.Letras,4) = 'mil ' then
                     Texto := Texto + 'PESOS'
                  else
                  if RightStr(NLetra.Letras,9) = 'millones ' then
                     Texto := Texto + 'DE PESOS'
                  else
                  if RightStr(NLetra.Letras,7) = 'millon ' then
                     Texto := Texto + 'DE PESOS'
                  else
                     Texto := Texto + 'PESOS';
                  Texto := Texto + ' MCTE (';
                  Texto := Texto + FormatCurr('$#,#0.00',IBSQLPagare.FieldByName('VALOR_CUOTA').AsCurrency) + ') CADA UNA DESDE EL ';
                  Texto := Texto + IntToStr(DayOf(FechaI)) + ' DE ' + UpperCase(Meses[MonthOf(FechaI)]) + ' DE ' + IntToStr(YearOf(FechaI)) + ' ' ;
                  FechaAnterior := CalculoFecha(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate,-IBSQLPagare.FieldByName('AMORTIZA_CAPITAL').AsInteger);
                  Texto := Texto + 'HASTA EL ' + IntToStr(dayof(FechaAnterior)) + ' DE ' + UpperCase(Meses[MonthOf(FechaAnterior)]) + ' DE ' + IntToStr(Yearof(FechaAnterior));
                  Texto := Texto + ' Y UNA ULTIMA CUOTA POR VALOR DE ';
                  NLetra.Numero := Trunc(CuotaF);
                  Texto := Texto + UpperCase(NLetra.Letras) + ' PESOS MCTE ('+ FormatCurr('$#,#0.00',CuotaF) + ') EL ';
                  Texto := Texto + IntToStr(dayof(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate)) + ' DE ' + UpperCase(Meses[MonthOf(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate)]) + ' DE ' + IntToStr(Yearof(IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate));
                end // begin 4
                else
                begin  // begin 4
                  NLetra.Numero := Total;
                  Texto := UpperCase(NLetra.Letras) + ' ('+IntToStr(Total)+') CUOTAS '+ Periodicidad + ' CADA UNA POR UN VALOR DE ';
                  NLetra.Numero := IBSQLPagare.FieldByName('VALOR_CUOTA').AsInteger;
                  Texto := Texto + UpperCase(NLetra.Letras) + ' ';
                  if RightStr(NLetra.Letras,4) = 'mil ' then
                     Texto := Texto + 'PESOS'
                  else
                  if RightStr(NLetra.Letras,9) = 'millones ' then
                     Texto := Texto + 'DE PESOS'
                  else
                  if RightStr(NLetra.Letras,7) = 'millon ' then
                     Texto := Texto + 'DE PESOS'
                  else
                     Texto := Texto + 'PESOS';
                  Texto := Texto + ' MCTE (';
                  Texto := Texto + FormatCurr('$#,#0.00',IBSQLPagare.FieldByName('VALOR_CUOTA').AsCurrency) + ') CADA UNA DESDE EL ';
                  Texto := Texto + IntToStr(DayOf(FechaI)) + ' DE ' + UpperCase(Meses[MonthOf(FechaI)]) + ' DE ' + IntToStr(YearOf(FechaI)) + ' ' ;
                  FechaAnterior := IBSQLPagare.FieldByName('FECHA_VENCIMIENTO').AsDate;
                  Texto := Texto + 'HASTA EL ' + IntToStr(dayof(FechaAnterior)) + ' DE ' + UpperCase(Meses[MonthOf(FechaAnterior)]) + ' DE ' + IntToStr(Yearof(FechaAnterior));
                end;  // begin 4
               end // begin 3
              else
               begin  // begin 3
                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('select first 1 * from "col$tablaliquidacion"');
                IBSQL1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
                IBSQL1.SQL.Add('order by CUOTA_NUMERO DESC');
                IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBSQL1.ParamByName('ID_COLOCACION').AsString := IBSQLPagare.FieldByName('ID_COLOCACION').AsString;
                try
                 IBSQL1.ExecQuery;
                except
                 IBSQL1.Transaction.Rollback;
                 raise;
                end;

                CuotaF := IBSQL1.FieldByName('CAPITAL_A_PAGAR').AsCurrency + IBSQL1.FieldByName('INTERES_A_PAGAR').AsCurrency;

                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('select first 1 * from "col$tablaliquidacion"');
                IBSQL1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and CAPITAL_A_PAGAR <> 0');
                IBSQL1.SQL.Add('order by CUOTA_NUMERO ASC');
                IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBSQL1.ParamByName('ID_COLOCACION').AsString := IBSQLPagare.FieldByName('ID_COLOCACION').AsString;
                try
                 IBSQL1.ExecQuery;
                except
                 IBSQL1.Transaction.Rollback;
                 raise;
                end;

                FechaI := IBSQL1.FieldByName('FECHA_A_PAGAR').AsDate;

                IBSQL1.Close;

                Texto := 'UNA CUOTA ' + Periodicidad + ' POR VALOR DE ';
                NLetra.Numero := IBSQLPagare.FieldByName('VALOR_CUOTA').AsInteger;
                Texto := Texto + UpperCase(NLetra.Letras) + ' ';
                  if RightStr(NLetra.Letras,4) = 'mil ' then
                     Texto := Texto + 'PESOS'
                  else
                  if RightStr(NLetra.Letras,9) = 'millones ' then
                     Texto := Texto + 'DE PESOS'
                  else
                  if RightStr(NLetra.Letras,7) = 'millon ' then
                     Texto := Texto + 'DE PESOS'
                  else
                     Texto := Texto + 'PESOS';
                Texto := Texto + ' MCTE (';
                Texto := Texto + FormatCurr('$#,#0.00',IBSQLPagare.FieldByName('VALOR_CUOTA').AsCurrency) + ') LA CUAL ';
                if ListaDeudores.Count > 1 then
                  Texto := Texto + ' CANCELAREMOS EL DIA '
                else
                  Texto := Texto + ' CANCELARE EL DIA ';
                Texto := Texto + IntToStr(DayOf(FechaI)) + ' DE ' + UpperCase(Meses[MonthOf(FechaI)]) + ' DE ' + IntToStr(YearOf(FechaI)) + ' ' ;
              end; // begin 3
            end; // begin 2


            if IBSQLPagare.FieldByName('TIPO_CUOTA').AsString = 'F' then
             begin
               Text := ', CORRESPONDIENTES A CAPITAL E INTERESES';
             end
            else
             begin
                  Texto := Texto + ', ADEMAS ';
                  if ListaDeudores.Count > 1 then
                    Texto := Texto + 'CANCELAREMOS'
                  else
                    Texto := Texto + 'CANCELARE';
                  Texto := Texto + ' INTERESES ' + Periodicidad_I + ' ' ;

                  if IBSQLPagare.FieldByName('INTERES').AsString = 'V' then
                    Periodicidad := 'VENCIDOS'
                else
                  Periodicidad := 'ANTICIPADOS';
                Texto := Texto + Periodicidad;
             end;
             ParValue := Texto;

          end; // begin 1

        if ParName = 'TASA_DE_INTERES' then begin
          if IBSQLPagare.FieldByName('ID_INTERES').AsInteger = 0 then begin
           Tasa := SimpleRoundTo(IBSQLPagare.FieldByName('TASA_INTERES_CORRIENTE').AsFloat,-2);
           NLetra.Numero := trunc(Tasa);
           Texto := ' ' + UpperCase(NLetra.Letras) + ' PUNTO ';
           TasaDecimal := frac(Tasa)*100;
           CadenaTasa := FloatToStr(SimpleRoundTo(TasaDecimal,0));
           NLetra.Numero := strtoint(CadenaTasa);
           Texto := Texto + UpperCase(NLetra.Letras) + ' POR CIENTO (' + Format('%2.2f%%',[tasa]) + ') EFECTIVO ANUAL';
          end
          else
          begin
            Texto :=  IBSQLPagare.FieldByName('DESCRIPCION_TASA').AsString + '+' + FloatToStr(IBSQLPagare.FieldByName('PUNTOS_INTERES').AsFloat);
          end;
          Texto := Texto + ', PAGADEROS EN ';

          case IBSQLPagare.FieldByName('AMORTIZA_INTERES').AsInteger of
            15: Periodicidad := 'QUINCENAS';
            30: Periodicidad := 'MENSUALIDADES';
            60: Periodicidad := 'BIMENSUALIDADES';
            90: Periodicidad := 'TRIMESTRES';
           120: Periodicidad := 'CUATRIMESTRES';
           150: Periodicidad := 'QUINTUMESTRES';
           180: Periodicidad := 'SEMESTRES';
           360: Periodicidad := 'ANUAL';
          end;

          Texto := Texto + Periodicidad + ' ';

          if IBSQLPagare.FieldByName('INTERES').AsString = 'V' then
            case IBSQLPagare.FieldByName('AMORTIZA_INTERES').AsInteger of
              15: Periodicidad := 'VENCIDAS';
              30: Periodicidad := 'VENCIDAS';
              60: Periodicidad := 'VENCIDAS';
              90: Periodicidad := 'VENCIDOS';
             120: Periodicidad := 'VENCIDOS';
             150: Periodicidad := 'VENCIDOS';
             180: Periodicidad := 'VENCIDOS';
             360: Periodicidad := 'ANUAL';
            end
          else
            case IBSQLPagare.FieldByName('AMORTIZA_INTERES').AsInteger of
              15: Periodicidad := 'ANTICIPADAS';
              30: Periodicidad := 'ANTICIPADAS';
              60: Periodicidad := 'ANTICIPADAS';
              90: Periodicidad := 'ANTICIPADOS';
             120: Periodicidad := 'ANTICIPADOS';
             150: Periodicidad := 'ANTICIPADOS';
             180: Periodicidad := 'ANTICIPADOS';
             360: Periodicidad := 'ANUAL';
            end;

          Texto := Texto + Periodicidad;

          ParValue := Texto;
        end;

        if ParName = 'CAPITALIZACION_L' then
           ParValue := 'CERO';

        if ParName = 'CAPITALIZACION_N' then
           ParValue := '0.00%';

        if ParName = 'DIA_L' then begin
          NLetra.Numero := DayOf(IBSQLPagare.FieldByName('FECHA_DESEMBOLSO').AsDate);
          ParValue := UpperCase(NLetra.Letras);
        end;

        if ParName = 'DIA_N' then
           ParValue := DayOf(IBSQLPagare.FieldByName('FECHA_DESEMBOLSO').AsDate);

        if ParName = 'MES_L' then
           ParValue := UpperCase(Meses[MonthOf(IBSQLPagare.FieldByName('FECHA_DESEMBOLSO').AsDate)]);

        if ParName = 'ANO_L' then begin
           NLetra.Numero := YearOf(IBSQLPagare.FieldByName('FECHA_DESEMBOLSO').AsDate);
           ParValue := UpperCase(NLetra.Letras);
        end;

        if ParName = 'ANO_N' then
           ParValue :=YearOf(IBSQLPagare.FieldByName('FECHA_DESEMBOLSO').AsDate);

        if ListaDeudores.Count > 1 then
        begin
         if ParName = 'YO_NOSOTROS' then
            ParValue := 'Yo';
         if ParName = 'ME_NOS' then
            ParValue := 'Nos';
         if ParName = 'HARE_MOS' then
            ParValue := 'HAREMOS';
         if ParName = 'AUTORIZO' then
            ParValue := 'autorizamos';
         if ParName = 'AUTORIZOM' then
            ParValue := 'Autorizamos';
         if ParName = 'OBLIGO' then
            ParValue := 'obligamos';
         if ParName = 'MI_NUESTRO' then
            ParValue := 'nuestro';
         if ParName = 'TENGA_MOS' then
            ParValue := 'tengamos';
         if ParName = 'FUERE' then
            ParValue := 'fueremos';
         if ParName = 'DEMANDA' then
            ParValue := 'demandados';
         if ParName = 'MIS_NUESTROS' then
            ParValue := 'nuestros';
         if ParName = 'INCUMPLIERA_MOS' then
            ParValue := 'incumplieramos';
         if ParName = 'ACTUALIZO_AMOS' then
            ParValue := 'actualizamos';
         if ParName = 'COMPROMETO' then
            ParValue := 'comprometemos';
         if ParName = 'REALIZAR' then
            ParValue := 'realizarnos';
         if ParName = 'ADEUDAR' then
            ParValue := 'adeudemos';
         if ParName = 'ACEPTO' then
            ParValue := 'aceptamos';
         if ParName = 'COMPROMISO' then
            ParValue := 'comprometemos';
         if ParName = 'CANCELAR' then
            ParValue := 'cancelaremos';
        end
        else
        begin
         if ParName = 'YO_NOSOTROS' then
            ParValue := 'Yo';
         if ParName = 'ME_NOS' then
            ParValue := 'Me';
         if ParName = 'HARE_MOS' then
            ParValue := 'HARE';
         if ParName = 'AUTORIZO' then
            ParValue := 'autorizo';
         if ParName = 'AUTORIZOM' then
            ParValue := 'Autorizo';
         if ParName = 'OBLIGO' then
            ParValue := 'obligo';
         if ParName = 'MI_NUESTRO' then
            ParValue := 'mi';
         if ParName = 'TENGA_MOS' then
            ParValue := 'tenga';
         if ParName = 'FUERE' then
            ParValue := 'fuere';
         if ParName = 'DEMANDA' then
            ParValue := 'demandado';
         if ParName = 'MIS_NUESTROS' then
            ParValue := 'mis';
         if ParName = 'INCUMPLIERA_MOS' then
            ParValue := 'incumpliera';
         if ParName = 'ACTUALIZO_AMOS' then
            ParValue := 'actualizo';
         if ParName = 'COMPROMETO' then
            ParValue := 'comprometo';
         if ParName = 'REALIZAR' then
            ParValue := 'realizarme';
         if ParName = 'ADEUDAR' then
            ParValue := 'adeudo';
         if ParName = 'ACEPTO' then
            ParValue := 'acepto';
         if ParName = 'COMPROMISO' then
            ParValue := 'comprometo';
         if ParName = 'CANCELAR' then
            ParValue := 'cancelaré';
        end;

        if ParName = 'INICIALES' then begin
          Empleado;
          Iniciales := TStringList.Create;
          Texto := Nombres + ' ' + Apellidos;
          Iniciales.Text := StringReplace(Texto,' ',#13,[rfReplaceAll]);
          Texto := '';
          for i := 0 to Iniciales.Count - 1 do
            Texto := Texto + LeftStr(Iniciales.Strings[I],1);
          Texto := Texto + '.';
          Texto := LowerCase(Texto);
          Texto := UpperCase(LeftStr(Texto,1)) + RightStr(Texto,Length(Texto)-1);
          ParValue := Texto;
          Iniciales.Free;
        end;

end;

procedure TfrmPagare.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmPagare.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        ReporteN.LoadFromFile(cadena);
        //frCompositeReport1.DoublePass := True;
        //frCompositeReport1.Reports.Clear;
        //frCompositeReport1.Reports.Add(frReport1);
        ReporteN.Preview := FrmImpresion.frPreview1;
        ReporteN.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TfrmPagare.ReporteNBeginPage(pgNo: Integer);
begin
 if (pgNo mod 2) = 0 then
 begin
   ReporteN.FindObject('memo1').x := 82;
   //ReporteN.FindObject('memo18').x := 86;
   ReporteN.FindObject('memo19').x := 82;
   ReporteN.FindObject('memo20').x := 82;
   ReporteN.FindObject('memo22').x := 610;
 end
 else
 begin
   ReporteN.FindObject('memo1').x := 64;
   //ReporteN.FindObject('memo18').x := 64;
   ReporteN.FindObject('memo19').x := 64;
   ReporteN.FindObject('memo20').x := 64;
   ReporteN.FindObject('memo22').x := 586;
 end;
end;

end.
