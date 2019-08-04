unit UnitPagarePrueba;

interface

uses
  Windows, Messages, Printers, StrUtils, Math, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,
  JvEdit, JvTypedEdit, IBSQL, NLetra,IBCustomDataSet, IBQuery, DBClient, Grids,
  DB, FR_DSet, FR_DBSet, FR_Class;

type
  TfrmPagarePrueba = class(TForm)
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    CmdImprimir: TBitBtn;
    IBSQLPagare: TIBSQL;
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
    Panel2: TPanel;
    Label1: TLabel;
    EdColocacion: TMemo;
    CHblanco: TCheckBox;
    CHpoder: TCheckBox;
    Label2: TLabel;
    IBSQL2: TIBSQL;
    IBQuery1: TIBQuery;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdImprimirClick(Sender: TObject);
    procedure ReporteGetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ReporteNBeginPage(pgNo: Integer);
    procedure CHblancoClick(Sender: TObject);
    procedure EdColocacionEnter(Sender: TObject);
    procedure CHpoderClick(Sender: TObject);
    procedure EdColocacionExit(Sender: TObject);
    procedure ReporteNPrintReport;
    procedure EdColocacionKeyPress(Sender: TObject; var Key: Char);
  private
    Texto_Personeria :string;
    Texto_Deudor :string;
    vPersoneriaJuridica: Boolean;
    vId_PersonaJur :string;
    Vid_IdentificacionJur :Integer;
           Tyo_nosotros :string;
    procedure imprimir_reporte(cadena: string);
    function conpoder(id_persona: string;
      id_identificacion: integer): string;
    function FirmaPoder(id_persona: string;
      id_identificacion: integer): string;
    { Private declarations }
  public
    { Public declarations }
  end;

type PDeudores = ^TDeudores;
     TDeudores = record
      Identificacion:string;
      Id_Identificacion :Integer;
      Numero:string;
      Expedicion:string;
      Nombre:string;
end;

var
  frmPagarePrueba: TfrmPagarePrueba;
  ListaDeudores:TList;
  Recursos:string;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitGlobalesCol, UnitImpresion, unitMain,
  UnitRegistroPoder, UnitRegistroPersoneria;

procedure TfrmPagarePrueba.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmPagarePrueba.CmdImprimirClick(Sender: TObject);
var     ADeudores: PDeudores;
        i :Integer;
        Tpersona :string;
        vIdPersonaPoder :string;
        Tpersoneria :string;
begin
        Texto_Personeria := '';
        vIdPersonaPoder := '';
        CDSCodeudores.CancelUpdates;
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT ID_PERSONA from "col$infbancoldex" WHERE ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := Trim(EdColocacion.Text);
          Open;
          if FieldByName('ID_PERSONA').AsString <> '' then
             Recursos := 'BANCOLDEX'
          else
             Recursos := 'PROPIOS';
          Close;
        end;

        if CHblanco.Checked then// VALIDACION DEL PAGARE EN BLANCO
        begin
          for i := 1 to StrToInt(EdColocacion.Text) do
          begin
             if i = 1 then
                Tpersona := 'DEUDOR'
             else
                Tpersona := 'CODEUDOR';
             CDSCodeudores.Append;
             CDSCodeudores.FieldByName('NOMBRE').AsString := Tpersona;
             CDSCodeudores.FieldByName('IDENTIFICACION').AsString := '';
             CDSCodeudores.Post;
          end;
          imprimir_reporte(frmMain.ruta1 + 'Reporte\RepPagareBlanco.frf');
          Exit;
        end// FIN VALIDACION DEL PAGARE EN BLANCO
        else
        begin
        if vPersoneriaJuridica then//VALIDACION PERSONERIA JURIDICA
        begin
           with IBQuery1 do
           begin
             if Transaction.InTransaction then
                Transaction.Commit;
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('SELECT ID_PERSONA from "col$infbancoldex" WHERE ID_COLOCACION = :ID_COLOCACION');
             ParamByName('ID_COLOCACION').AsString := Trim(EdColocacion.Text);
             Open;
             if FieldByName('ID_PERSONA').AsString <> '' then
               Recursos := 'BANCOLDEX'
             else
               Recursos := 'PROPIOS';

             Close;
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('PERSONERIA');
             SQL.Add('FROM');
             SQL.Add('"col$personeriajur" where');
             SQL.Add('(ID_PERSONA = :ID_PERSONA) AND ');
             SQL.Add('(ID_IDENTIFICACION = :ID_IDENTIFICACION)');
             ParamByName('ID_PERSONA').AsString := vId_PersonaJur;
             ParamByName('ID_IDENTIFICACION').AsInteger := Vid_IdentificacionJur;
             Open;
             Tpersoneria := FieldByName('PERSONERIA').AsString;
             Close;
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('"gen$persona".LUGAR_EXPEDICION,');
             SQL.Add('"gen$persona".NOMBRE,');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,');
             SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$persona".ID_PERSONA,');
             SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION');
             SQL.Add('FROM');
             SQL.Add('"col$representantescol"');
             SQL.Add('INNER JOIN "gen$persona" ON ("col$representantescol".ID_PERSONA="gen$persona".ID_PERSONA)');
             SQL.Add('AND ("col$representantescol".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "gen$tiposidentificacion" ON ("gen$tiposidentificacion".ID_IDENTIFICACION="col$representantescol".ID_IDENTIFICACION)');
             SQL.Add('WHERE');
             SQL.Add('("col$representantescol".ID_COLOCACION = :ID_COLOCACION)');
             ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
             Open;
             Last;
             First;
             if RecordCount > 1 then
                Tyo_nosotros := 'Nosotros, '
             else
                Tyo_nosotros := 'Yo, ';
             while not Eof do
             begin
               if RecNo > 1 then
               begin
                 if (LeftStr(FieldByName('NOMBRE').AsString,1) = 'I') or
                    (LeftStr(FieldByName('NOMBRE').AsString,2) = 'HI')
                 then
                     Texto_Personeria := Texto_Personeria + ' E '
                 else
                     Texto_Personeria := Texto_Personeria + ' Y ';
               end;
               CDSCodeudores.Append;

               CDSCodeudores.FieldValues['NOMBRE'] := 'DEUDOR';

//               CDSCodeudores.FieldValues['IDENTIFICACION'] := Trim(FieldByName('ID_PERSONA').AsString) + ' DE ' + Trim(FieldByName('LUGAR_EXPEDICION').AsString); Original 
               CDSCodeudores.FieldValues['IDENTIFICACION'] := 'NIT. No. ' + Trim(vId_PersonaJur);
               CDSCodeudores.Post;
               Texto_Personeria := Texto_Personeria + ' ' + Trim(FieldByName('NOMBRE').AsString) + ' ' + Trim(FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
               Trim(FieldByName('SEGUNDO_APELLIDO').AsString) + ' IDENTIFICADO CON ' + FieldByName('DESCRIPCION_IDENTIFICACION').AsString +
               ' No. ' + Trim(FieldByName('ID_PERSONA').AsString) + ' DE ' + Trim(FieldByName('LUGAR_EXPEDICION').AsString);// + ',' +
               Next;
             end;
           end;
        end;// FIN VALIDACION PERSONERIA JURIDICA
        Texto_Personeria := Texto_Personeria + ' ' + Tpersoneria;
        //ShowMessage(Texto_Personeria);
        with IBSQLPagare do
        begin
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
          with IBSQLCodeudores do
          begin
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
          with IBSQLCuotas do
          begin
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
          ADeudores^.Id_Identificacion := IBSQLPagare.FieldByName('ID_IDENTIFICACION').AsInteger;
          ADeudores^.Numero := IBSQLPagare.FieldByName('ID_PERSONA').AsString;
          ADeudores^.Expedicion := IBSQLPagare.FieldByName('LUGAR_EXPEDICION').AsString;
          ADeudores^.Nombre := IBSQLPagare.FieldByName('NOMBRE').AsString + ' ' +
                              IBSQLPagare.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                              IBSQLPagare.FieldByName('SEGUNDO_APELLIDO').AsString;
          ListaDeudores.Add(ADeudores);
          if not(vPersoneriaJuridica) then
          begin
            CDSCodeudores.Open;
            CDSCodeudores.Insert;
            if CHpoder.Checked then
               vIdPersonaPoder := firmapoder(IBSQLPagare.FieldByName('ID_PERSONA').AsString,IBSQLPagare.FieldByName('ID_IDENTIFICACION').AsInteger);
            CDSCodeudores.FieldByName('NOMBRE').AsString := 'DEUDOR';
            if vIdPersonaPoder = '' then
               CDSCodeudores.FieldByName('IDENTIFICACION').AsString := 'C.C. No. ' + IBSQLPagare.FieldByName('ID_PERSONA').AsString + ' de ' + IBSQLPagare.FieldByName('LUGAR_EXPEDICION').AsString
            else
               CDSCodeudores.FieldByName('IDENTIFICACION').AsString := vIdPersonaPoder;
            CDSCodeudores.Post;
            CDSCodeudores.Close;
          end;
          while not IBSQLCodeudores.Eof do
          begin
            vIdPersonaPoder := '';
            New(Adeudores);
            ADeudores^.Identificacion := IBSQLCodeudores.FieldByName('DESCRIPCION_IDENTIFICACION').AsString;
            ADeudores^.Id_Identificacion := IBSQLCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
            ADeudores^.Numero := IBSQLCodeudores.FieldByName('ID_PERSONA').AsString;
            ADeudores^.Expedicion := IBSQLCodeudores.FieldByName('LUGAR_EXPEDICION').AsString;
            ADeudores^.Nombre := IBSQLCodeudores.FieldByName('NOMBRE').AsString + ' ' +
                                 IBSQLCodeudores.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                 IBSQLCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString;
            ListaDeudores.Add(ADeudores);

            CDSCodeudores.Open;
            CDSCodeudores.Insert;
            if CHpoder.Checked then
                vIdPersonaPoder := firmapoder(IBSQLCodeudores.FieldByName('ID_PERSONA').AsString,IBSQLCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger);
            CDSCodeudores.FieldByName('NOMBRE').AsString := 'CODEUDOR';
            if vIdPersonaPoder = '' then
               CDSCodeudores.FieldByName('IDENTIFICACION').AsString := 'C.C. No. ' + IBSQLCodeudores.FieldByName('ID_PERSONA').AsString + ' de ' + IBSQLCodeudores.FieldByName('LUGAR_EXPEDICION').AsString
            else
               CDSCodeudores.FieldByName('IDENTIFICACION').AsString := vIdPersonaPoder;
            CDSCodeudores.Post;
            CDSCodeudores.Close;
            IBSQLCodeudores.Next;
          end;
        end;
        imprimir_reporte(frmMain.ruta1 + '\Reporte\RepPagareNuevo.frf');
        end;

procedure TfrmPagarePrueba.ReporteGetValue(const ParName: String;
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
    DeudorConPoder :string;
begin
        DeudorConPoder := '';
        if not (CHblanco.Checked) then // VALIDACION PAGARE EN BLANCO
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
        if ParName = 'RECURSOS' then
           ParValue := Recursos;

        if ParName = 'DESTINO' then
           ParValue := IBSQLPagare.FieldByName('DESCRIPCION_INVERSION').AsString;

        if ParName = 'GARANTIAS' then
           ParValue := IBSQLPagare.FieldByName('DESCRIPCION_GARANTIA').AsString;
        if ParName = 'DEUDORES' then begin
           ParValue := '';
           if not (vPersoneriaJuridica) then // VALIDA PERSONERIA JURIDICA
           begin
           for i := 0 to ListaDeudores.Count - 1 do
           begin
            ADeudores := ListaDeudores.Items[i];
            if CHpoder.Checked then
               DeudorConPoder := conpoder(Adeudores^.Numero,Adeudores^.Id_Identificacion);
            if DeudorConPoder <> '' then
               ParValue := ParValue + DeudorConPoder;
            ParValue := ParValue + Trim(Adeudores^.Nombre) + ' ' +
                       'IDENTIFICADO CON '+ Adeudores^.Identificacion + ' ' +
                       'No. '+ Adeudores^.Numero + ' ' +
                       'DE ' + Trim(Adeudores^.Expedicion) + ' COMO ';
            if i=0 then
               ParValue := ParValue + ' DEUDOR PRINCIPAL'
            else
               ParValue := ParValue + ' CODEUDOR';
            if DeudorConPoder <> '' then
               ParValue := ParValue + ', SEGUN PODER ADJUNTO';
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
           end // fin valida personeria juridica
           else
           begin
             ParValue := Texto_Personeria;
           end;
           ParValue := ParValue + '.';
        end;
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
         with IBSQL1 do
         begin
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
               //Texto := texto + ', CORRESPONDIENTES A CAPITAL E INTERESES';
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
          //Texto := Texto + ', PAGADEROS EN ';
          case IBSQLPagare.FieldByName('AMORTIZA_INTERES').AsInteger of
            15: Periodicidad := ', PAGADEROS EN QUINCENAS';
            30: Periodicidad := ', PAGADEROS EN MENSUALIDADES';
            60: Periodicidad := ', PAGADEROS EN BIMENSUALIDADES';
            90: Periodicidad := ', PAGADEROS EN TRIMESTRES';
           120: Periodicidad := ', PAGADEROS EN CUATRIMESTRES';
           150: Periodicidad := ', PAGADEROS EN QUINTUMESTRES';
           180: Periodicidad := ', PAGADEROS EN SEMESTRES';
           360: Periodicidad := ', PAGADEROS EN ANUAL';
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
         if not(vPersoneriaJuridica) then
            ParValue := 'Yo, '
         else
            ParValue := Tyo_nosotros;
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
         if ParName = 'YO_NOSOTROS' then // VALIDACION POR TIPO DE PAGARÉ (PER_JUR O NORMAL)
         if not(vPersoneriaJuridica) then
            ParValue := 'Yo, '
         else
            ParValue := Tyo_nosotros;
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
        end; // FIN VALIDACION PAGARÉ EN BLANCO
        if ParName = 'CIUDAD' then
           ParValue := Ciudad;
        if ParName = 'DEPARTAMENTO' then
           ParValue := Departamento;
        if ParName = 'EMPRESA' then
           ParValue := Empresa;
        if ParName = 'NIT' then
           ParValue := 'NIT: '+ Nit;
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

procedure TfrmPagarePrueba.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmPagarePrueba.imprimir_reporte(cadena: string);
var
   _tFrfpict1 : TfrPictureView;
   _sRutaLogo :string;
begin
        FrmImpresion := TFrmImpresion.Create(self);
        ReporteN.LoadFromFile(cadena);
        //frCompositeReport1.DoublePass := True;
        //frCompositeReport1.Reports.Clear;
        //frCompositeReport1.Reports.Add(frReport1);
        _tFrfpict1 := TfrPictureView(ReporteN.FindObject('picture1'));
        _sRutaLogo := frmMain.wpath + 'logo\logo.jpg';
        if Assigned(_tFrfPict1) then
        begin
           _tFrfPict1.Picture.LoadFromFile(_sRutaLogo);
        end;
        ReporteN.Preview := FrmImpresion.frPreview1;
        ReporteN.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TfrmPagarePrueba.ReporteNBeginPage(pgNo: Integer);
begin
 if (pgNo mod 2) = 0 then
 begin
   ReporteN.FindObject('memo1').x := 82;
   //ReporteN.FindObject('memo18').x := 86;
   ReporteN.FindObject('memo19').x := 82;
   ReporteN.FindObject('memo20').x := 82;
   ReporteN.FindObject('memo22').x := 610;
   if Agencia in [1,2,3,4] then
   begin
     ReporteN.FindObject('line2').x := 80;
     ReporteN.FindObject('line1').x := 80;
     ReporteN.FindObject('line3').x := 80;
     ReporteN.FindObject('line4').x := 731;
   end;
 end
 else
 begin
   ReporteN.FindObject('memo1').x := 64;
   //ReporteN.FindObject('memo18').x := 64;
   ReporteN.FindObject('memo19').x := 64;
   ReporteN.FindObject('memo20').x := 64;
   ReporteN.FindObject('memo22').x := 586;
   if Agencia in [1,2,3,4] then //ojo ocaña
   begin
     ReporteN.FindObject('line2').x := 62;
     ReporteN.FindObject('line1').x := 62;
     ReporteN.FindObject('line3').x := 62;
     ReporteN.FindObject('line4').x := 713;
   end;
 end;
end;

procedure TfrmPagarePrueba.CHblancoClick(Sender: TObject);
begin
        if CHblanco.Checked = False then
           Exit;
        if CHblanco.Checked then
        begin
           Label1.Caption := 'No. DE FIRMAS:';
           CHpoder.Checked := False;
        end
        else
           Label1.Caption := 'COLOCACIÓN No:';
        EdColocacion.SetFocus;
end;

procedure TfrmPagarePrueba.EdColocacionEnter(Sender: TObject);
begin
        EdColocacion.SelectAll;
end;

procedure TfrmPagarePrueba.CHpoderClick(Sender: TObject);
var     vRegistro :Boolean;
begin
        if CHpoder.Enabled = False then
           Exit;
          if CHpoder.Checked then
          begin
            with IBSQL1 do
            begin
              Close;
              if Transaction.InTransaction then
                 Transaction.Rollback;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('select * from "col$colocacionpoder" where ID_COLOCACION = :ID_COLOCACION');
              ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
              ExecQuery;
              if (FieldByName('IMPRESO').AsInteger = 1) then
              begin
                 CHpoder.Checked := False;
                 CHpoder.Enabled := False;
                 Exit;
              end;
            CHblanco.Checked := False;
            FrmRegistroPoder := TFrmRegistroPoder.Create(self);
            FrmRegistroPoder.id_colocacion := EdColocacion.Text;
            FrmRegistroPoder.ShowModal;
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "col$colocacionpoder" where ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          ExecQuery;
          if RecordCount <> 0 then
          begin
            CHblanco.Checked := False;
            CHpoder.Enabled := False;
            CHpoder.Checked := True;
            CHblanco.Enabled := False;
          end
          else
          begin
            CHblanco.Enabled := True;
            CHpoder.Enabled := True;
            CHpoder.Checked := False;
            CHblanco.Checked := False;
          end;
        end;
          end;
          end;
end;

procedure TfrmPagarePrueba.EdColocacionExit(Sender: TObject);
var     Vfecha_Desembolso :TDate;
begin
        CHblanco.Visible := True;
        CHpoder.Visible  := True;
        Label2.Visible := False;
        if StrLen(PChar(EdColocacion.Text)) < 10 then
           Exit;
        vPersoneriaJuridica := False;
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select ID_IDENTIFICACION,ID_PERSONA, FECHA_DESEMBOLSO from "col$colocacion" where ID_COLOCACION = :ID_COLOCACION and ID_IDENTIFICACION = 4');
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          ExecQuery;
          if RecordCount > 0 then
          begin
            vId_PersonaJur := FieldByName('ID_PERSONA').AsString;
            Vid_IdentificacionJur := FieldByName('ID_IDENTIFICACION').AsInteger;
            vPersoneriaJuridica := True;
            CHblanco.Visible:= False;
            CHpoder.Visible := False;
            Label2.Visible := True;
            if FieldByName('FECHA_DESEMBOLSO').AsDate <> fFechaActual then
            begin
              //vPersoneriaJuridica := False;
              //Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select distinct ID_PERSONA,ID_IDENTIFICACION from "cap$maestrotitular" where NUMERO_CUENTA');
            SQL.Add('in (select NUMERO_CUENTA from "cap$maestrotitular" where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_TIPO_CAPTACION = 2)');
            ParamByName('ID_PERSONA').AsString := vId_PersonaJur;
            ParamByName('ID_IDENTIFICACION').AsInteger := Vid_IdentificacionJur;
            ExecQuery;
            FrmRegistroPersoneria := TFrmRegistroPersoneria.Create(self);
            while not Eof do
            begin
              if (FieldByName('ID_PERSONA').AsString <> vId_PersonaJur) and (FieldByName('ID_IDENTIFICACION').AsInteger <> 4) then
              begin
                  IBSQL2.Close;
                  IBSQL2.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                  IBSQL2.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                  IBSQL2.ExecQuery;
                  FrmRegistroPersoneria.CDrepresentante.Append;
                  FrmRegistroPersoneria.CDrepresentante.FieldValues['nombre'] := IBSQL2.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBSQL2.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + IBSQL2.FieldByName('NOMBRE').AsString;
                  FrmRegistroPersoneria.CDrepresentante.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
                  FrmRegistroPersoneria.CDrepresentante.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
                  FrmRegistroPersoneria.CDrepresentante.FieldValues['representante'] := False;
                  FrmRegistroPersoneria.CDrepresentante.Post;
              end;
              Next;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select * from "col$representantescol" where ID_COLOCACION = :ID_COLOCACION');
            ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
            ExecQuery;
            if FieldByName('IMPRESO').AsInteger = 1 then
            begin
              vPersoneriaJuridica := True;
              CHblanco.Visible:= False;
              CHpoder.Visible := False;
              Label2.Visible := True;
              Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"gen$persona".NOMBRE,');
            SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
            SQL.Add('"gen$persona".LUGAR_EXPEDICION,');
            SQL.Add('"gen$persona".ID_PERSONA');
            SQL.Add('FROM');
            SQL.Add('"gen$tiposidentificacion"');
            SQL.Add('INNER JOIN "gen$persona" ON ("gen$tiposidentificacion".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
            SQL.Add('WHERE');
            SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA) AND ');
            SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION)');
            ParamByName('ID_PERSONA').AsString := vId_PersonaJur;
            ParamByName('ID_IDENTIFICACION').AsInteger := Vid_IdentificacionJur;
            ExecQuery;
            FrmRegistroPersoneria.Texto_Per := 'ACTUANDO COMO REPRESENTANTE LEGAL DE(LA) ' + FieldByName('NOMBRE').AsString + ', ENTIDAD CONSTITUIDA CON PERSONERIA JURIDICA ********** '
            + ' CON DOMICILIO PRINCIPAL EN '  + Trim(FieldByName('LUGAR_EXPEDICION').AsString) + ', IDENTIFICADA CON ' + FieldByName('DESCRIPCION_IDENTIFICACION').AsString +
            ' No. ' + FieldByName('ID_PERSONA').AsString + ' DEBIDAMENTE FACULTADO PARA COMPROMETER A LA ENTIDAD';
            FrmRegistroPersoneria.vId_Colocacion := EdColocacion.Text;
            FrmRegistroPersoneria.vNit_Empresa := vId_PersonaJur;
            FrmRegistroPersoneria.ShowModal;
            Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('select FECHA_DESEMBOLSO from "col$colocacion" where ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          ExecQuery;
          Vfecha_Desembolso := FieldByName('FECHA_DESEMBOLSO').AsDate;
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$colocacionpoder" where ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          ExecQuery;
          if (FieldByName('IMPRESO').AsInteger = 1) then
          begin
            CHblanco.Checked := False;
            CHpoder.Enabled := False;
            CHpoder.Checked := True;
            CHblanco.Enabled := False;
          end
          {else if Vfecha_Desembolso <> fFechaActual then
          begin
            CHblanco.Checked := False;
            CHpoder.Enabled := False;
            CHpoder.Checked := False;
            CHblanco.Enabled := False;
            CmdImprimir.Enabled := False;
          end }
          else
          begin
            CHblanco.Enabled := True;
            CHpoder.Enabled := True;
            CHpoder.Checked := False;

            CHblanco.Checked := False;
          end; 
        end;

end;

function TfrmPagarePrueba.conpoder(id_persona: string;
  id_identificacion: integer): string;
begin
        with IBSQL1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('"gen$persona".NOMBRE,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$persona".LUGAR_EXPEDICION,');
           SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
           SQL.Add('"col$colocacionpoder".ID_PERSONAPODER,');
           SQL.Add('"col$colocacionpoder".ID_IDENTIFICACIONPODER');
           SQL.Add('FROM');
           SQL.Add('"gen$persona"');
           SQL.Add('INNER JOIN "col$colocacionpoder" ON ("gen$persona".ID_IDENTIFICACION="col$colocacionpoder".ID_IDENTIFICACIONPODER)');
           SQL.Add('AND ("gen$persona".ID_PERSONA="col$colocacionpoder".ID_PERSONAPODER)');
           SQL.Add('INNER JOIN "gen$tiposidentificacion" ON ("gen$persona".ID_IDENTIFICACION="gen$tiposidentificacion".ID_IDENTIFICACION)');
           SQL.Add('WHERE');
           SQL.Add('("col$colocacionpoder".ID_PERSONA = :ID_PERSONA) AND ');
           SQL.Add('("col$colocacionpoder".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
           SQL.Add('("col$colocacionpoder".ID_COLOCACION = :ID_COLOCACION)');
           ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
           ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
           ParamByName('ID_PERSONA').AsString := id_persona;
           ExecQuery;
           if RecordCount > 0 then
           begin
             Result := Trim(FieldByName('NOMBRE').AsString) + ' ' + Trim(FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
             Trim(FieldByName('SEGUNDO_APELLIDO').AsString) + ' IDENTIFICADO CON ' + Trim(FieldByName('DESCRIPCION_IDENTIFICACION').AsString) +
             ' No. ' + Trim(FieldByName('ID_PERSONAPODER').AsString) + ' DE ' + Trim(FieldByName('LUGAR_EXPEDICION').AsString) + ' EN REPRESENTACION DE ';
           end
           else
             Result := '';
        end;
end;

function TfrmPagarePrueba.FirmaPoder(id_persona: string;
  id_identificacion: integer): string;
begin
        with IBSQL1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"gen$persona".LUGAR_EXPEDICION,');
           SQL.Add('"col$colocacionpoder".ID_PERSONAPODER,');
           SQL.Add('"col$colocacionpoder".ID_IDENTIFICACIONPODER');
           SQL.Add('FROM');
           SQL.Add('"gen$persona"');
           SQL.Add('INNER JOIN "col$colocacionpoder" ON ("gen$persona".ID_IDENTIFICACION="col$colocacionpoder".ID_IDENTIFICACIONPODER)');
           SQL.Add('AND ("gen$persona".ID_PERSONA="col$colocacionpoder".ID_PERSONAPODER)');
           SQL.Add('WHERE');
           SQL.Add('("col$colocacionpoder".ID_PERSONA = :ID_PERSONA) AND');
           SQL.Add('("col$colocacionpoder".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
           SQL.Add('("col$colocacionpoder".ID_COLOCACION = :ID_COLOCACION)');
           ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
           ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
           ParamByName('ID_PERSONA').AsString := id_persona;
           ExecQuery;
           if RecordCount <> 0 then
              Result := 'C.C. No. ' + Trim(FieldByName('ID_PERSONAPODER').AsString) + ' DE ' + Trim(FieldByName('LUGAR_EXPEDICION').AsString)
           else
              Result := '';
        end;
end;

procedure TfrmPagarePrueba.ReporteNPrintReport;
begin
        if (CHpoder.Checked) or (vPersoneriaJuridica) then
        begin
          with IBSQL1 do
          begin
            Close;
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('update');
            if CHpoder.Checked then
               SQL.Add('"col$colocacionpoder"');
            if vPersoneriaJuridica then
               SQL.Add('"col$representantescol"');
            SQL.Add('set IMPRESO = 1 where ID_COLOCACION = :ID_COLOCACION');
            ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
            ExecQuery;
            Transaction.Commit;
          end;
        end;
end;

procedure TfrmPagarePrueba.EdColocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

end.
