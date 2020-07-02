unit UnitPrestamosCorte;

interface

uses
  DateUtils, StrUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, Grids, StdCtrls,
  Buttons, ExtCtrls, JvTypedEdit, JvEdit, JvSpecialProgress, XLSfile,Math,
  ComCtrls;

type
  TfrmPrestamosCorte = class(TForm)
    Bar2: TJvSpecialProgress;
    Bar1: TJvSpecialProgress;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdPeriodo: TJvYearEdit;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    btnAExcel: TBitBtn;
    Sg1: TStringGrid;
    IBQuery1: TIBQuery;
    sd1: TSaveDialog;
    IBSQL2: TIBSQL;
    IBSQL1: TIBQuery;
    Bar3: TJvSpecialProgress;
    IBQuery2: TIBQuery;
    CDprestamo: TClientDataSet;
    CDprestamovalor: TCurrencyField;
    CDprestamoinversion: TStringField;
    CDprestamocol: TStringField;
    Label3: TLabel;
    EdNumero: TEdit;
    DtFecha: TDateTimePicker;
    Label4: TLabel;
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DtFechaExit(Sender: TObject);
  private
    { Private declarations }
  public
  published
    function direccion(id_persona: string;
      id_identificacion: integer): string;
    { Public declarations }
  end;

var
  frmPrestamosCorte: TfrmPrestamosCorte;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmPrestamosCorte.btnProcesarClick(Sender: TObject);
var
  Id:string;
  Dg:string;
  Tp:string;
  Nm:string;
  Dr:string;
  Mn:string;
  Dpto :string;
  Total:Integer;
  Fila:Integer;
  Saldo,Credito,Interes:Currency;
  Saldo1,Credito1,Interes1:Currency;
  Cuenta:string;
  valor_inicial :Currency;
  id_persona :string;
  id_identificacion :Integer;
  vCodMunicipio :string;
  _sNombre :string;
  _cProvision :Currency;
  _iDias :Integer;
begin
        Fila := -1;
        Application.ProcessMessages;
        Sg1.RowCount := 1;
        Sg1.ColWidths[0] := 30;
        Sg1.ColWidths[1] := 10;
        Sg1.ColWidths[2] := 20;
        Sg1.ColWidths[3] := 20;
        Sg1.ColWidths[4] := 140;
        Sg1.ColWidths[5] := 10;
        Sg1.ColWidths[6] := 10;
        Sg1.ColWidths[7] := 600;
        Sg1.ColWidths[8] := 200;
        Sg1.ColWidths[9] := 200;
        Sg1.ColWidths[10] := 200;
        Sg1.ColWidths[11] := 140;
        Sg1.ColWidths[12] := 400;
        Sg1.ColWidths[13] := 50;
        Sg1.ColWidths[14] := 80;
        Sg1.ColWidths[16] := 80;// Dias de Mora
        Sg1.RowCount := 1;
        Fila := 1;
        Sg1.Cells[0,Fila] := 'Concepto';
        Sg1.Cells[1,Fila] := 'TIPO DOC';
        Sg1.Cells[2,Fila] := 'NUMERO DOC';
        Sg1.Cells[3,Fila] := 'DV';
        Sg1.Cells[4,Fila] := 'P. APELLIDO';
        Sg1.Cells[5,Fila] := 'S. APELLIDO';
        Sg1.Cells[6,Fila] := 'P. NOMBRE';
        Sg1.Cells[7,Fila] := 'S. APELLIDO';
        Sg1.Cells[8,Fila] :='RZ';
        Sg1.Cells[9,Fila] := 'DIRECCION';
        Sg1.Cells[10,Fila] := 'DPTO';
        Sg1.Cells[11,Fila] := 'MNCP';
        Sg1.Cells[12,Fila] := 'PAIS';
        Sg1.Cells[13,Fila] := 'SALDO';

        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT distinct');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"gen$persona".ID_IDENTIFICACION,');
          SQL.Add('"gen$direccion".DIRECCION || '' '' || "gen$direccion".BARRIO AS DIRECCION,');
          SQL.Add('"gen$direccion".MUNICIPIO AS MUNICIPIO,"gen$direccion".COD_MUNICIPIO');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and');
          SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA ');
          SQL.Add('and "gen$direccion".ID_DIRECCION = 1)');
          SQL.Add('WHERE');
          //sql.Add('"gen$persona".ID_PERSONA = :id1  and');
          SQL.Add('("col$colocacion".FECHA_DESEMBOLSO BETWEEN :FECHA1 AND :FECHA2) AND');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN (4,5,10,12,13))'); // 10,12,13 TRASLADADAS
          //ParamByName('FECHA1').AsDate := StrToDate('1900/01/01');// reporta todos lo creditos de la base de datos
          ParamByName('FECHA1').AsDate := StrToDate('2010/01/01');
          ParamByName('FECHA2').AsDate := DtFecha.DateTime;
          Open;
          Last;
          Total := RecordCount;
          First;
          Saldo := 0;
          Bar3.Maximum := Total;
          while not Eof do
          begin
            Bar3.Position := RecNo;
            Application.ProcessMessages;
            vCodMunicipio := FieldByName('COD_MUNICIPIO').AsString;
            if (vCodMunicipio = '') Then vCodMunicipio := '00000';
            IBSQL1.SQL.Clear;
            IBSQL1.SQL.Add('SELECT ');
            IBSQL1.SQL.Add('"col$causaciondiaria".ID_CLASIFICACION,"col$causaciondiaria".ID_COLOCACION,');
            IBSQL1.SQL.Add('("col$causaciondiaria".DEUDA + "col$causaciondiaria".CAUSADOS + "col$causaciondiaria".COSTAS ) AS VALOR_DESEMBOLSO,');
            IBSQL1.SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
            IBSQL1.SQL.Add('"col$causaciondiaria".ID_PERSONA,');
            IBSQL1.SQL.Add('"col$causaciondiaria".DIAS,');
            IBSQL1.SQL.Add('"col$causaciondiaria".PCAPITAL,');
            IBSQL1.SQL.Add('"col$causaciondiaria".PINTERES');
            IBSQL1.SQL.Add('FROM');
            IBSQL1.SQL.Add('"col$causaciondiaria"');
            IBSQL1.SQL.Add('WHERE');
            IBSQL1.SQL.Add('("col$causaciondiaria".FECHA_CORTE = :FECHA) AND ');
            IBSQL1.SQL.Add('("col$causaciondiaria".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
            IBSQL1.SQL.Add('("col$causaciondiaria".ID_PERSONA = :ID_PERSONA)');
            IBSQL1.ParamByName('FECHA').AsDate := DtFecha.DateTime;
            IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
            IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
            IBSQL1.Open;
            IBSQL1.Last;
            IBSQL1.First;
            Bar2.Maximum := IBSQL1.RecordCount;
            CDprestamo.CancelUpdates;
            Saldo := 0;
            _cProvision := 0;
            while not IBSQL1.Eof DO
            begin
              Bar2.Position := IBSQL1.RecNo;
              Application.ProcessMessages;
              _iDias := IBSQL1.FieldByName('DIAS').AsInteger;
             {
              if _iDias > 360 then
                _cProvision := _cProvision + SimpleRoundTo((IBSQL1.FieldByName('VALOR_DESEMBOLSO').AsCurrency * 0.15),0)
                else if (_iDias > 180) and (_iDias <= 360) then
                  _cProvision := _cProvision + SimpleRoundTo((IBSQL1.FieldByName('VALOR_DESEMBOLSO').AsCurrency * 0.10),0)
                  else if (_iDias > 90) and (_iDias <= 180) then
                    _cProvision := _cProvision + SimpleRoundTo((IBSQL1.FieldByName('VALOR_DESEMBOLSO').AsCurrency * 0.05),0);
              }
              _cProvision := _cProvision + SimpleRoundTo(IBSQL1.FieldByName('PCAPITAL').AsCurrency + IBSQL1.FieldByName('PINTERES').AsCurrency,0);
              CDprestamo.Append;
              CDprestamo.FieldValues['valor'] := IBSQL1.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
              CDprestamo.FieldValues['inversion'] := FormatCurr('0',IBSQL1.FieldByName('ID_CLASIFICACION').AsInteger);
              CDprestamo.FieldValues['col'] := '0'+ IntToStr(Agencia)+IBSQL1.FieldByName('ID_COLOCACION').AsString;
              CDprestamo.Post;
              Saldo := Saldo + IBSQL1.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
              IBSQL1.Next;
            end;

            // VALIDA SALDO
            if Saldo >= EdMonto.Value then
            begin
             Inc(Fila);
             Sg1.RowCount := Fila + 1;
             //Sg1.Cells[0,Fila] := '60';
             Sg1.Cells[0,Fila] := '1315';//CDprestamo.FieldByName('inversion').AsString; //CLASIFICACION
             if FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
             begin
               Id := LeftStr(FieldByName('ID_PERSONA').AsString,Length(FieldByName('ID_PERSONA').AsString)-1);
               Dg := RightStr(FieldByName('ID_PERSONA').AsString,1);
             end
             else
             begin
               Id := FieldByName('ID_PERSONA').AsString;
               Dg := '';
             end; // FIN DEL VALIDA IDENTIFICACION
             case FieldByName('ID_IDENTIFICACION').AsInteger of
             1: tp := '11';
             2: Tp := '12';
             3: Tp := '13';
             4: Tp := '31';
             6: Tp := '22';
             9: Tp := '11';
             end;

             Sg1.Cells[1,Fila] := Tp;//TIPO DE DOCUMENTOS
             Sg1.Cells[2,Fila] := Id;//NUMERO DOCUMNETO
             Sg1.Cells[3,Fila] :=  Dg;//DIGITO VERIFICACION OPCIONAL
               try
               if StrLen(PChar(vCodMunicipio)) = 4 then
                  vCodMunicipio := '0' +  vCodMunicipio;
               Dpto := FormatCurr('00',StrToInt(LeftStr(vCodMunicipio,2)));
               Mn := FormatCurr('000',StrToInt(RightStr(vCodMunicipio,3)));
               except
               begin
                 Mn := '0';
                 Dpto := '0';
               end;
               end;
             Nm := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString);
             Dr := direccion(FieldByName('ID_PERSONA').AsString,FieldByName('ID_IDENTIFICACION').AsInteger);

             Sg1.Cells[4,Fila] := Trim(FieldByName('PRIMER_APELLIDO').AsString);//PRIMER APELLIDO
             Sg1.Cells[5,Fila] := Trim(FieldByName('SEGUNDO_APELLIDO').AsString);//SEGUNDO APELLIDO
             _sNombre := Trim(FieldByName('NOMBRE').AsString);
             Sg1.Cells[6,Fila] := _sNombre;
             if Pos(' ', _sNombre) > 0 then
             begin
               Sg1.Cells[6,Fila] := LeftStr(_sNombre,Pos(' ', _sNombre)-1);
               Sg1.Cells[7,Fila] := RightStr(_sNombre,Length(_sNombre) - Pos(' ', _sNombre));
             end;

             if Tp = '31' then
               Sg1.Cells[8,Fila] := Nm
             else
               Sg1.Cells[8,Fila] := '';
             Sg1.Cells[9,Fila] := Dr;
             Sg1.Cells[10,Fila] := Dpto;
             Sg1.Cells[11,Fila] := Mn;
             Sg1.Cells[12,Fila] := '169';
             Sg1.Cells[13,Fila] := FormatCurr('#0',saldo);
             //CDprestamo.Next;
             //end;
           if _cProvision > 0 then
           begin
             Inc(Fila);
             Sg1.RowCount := Fila + 1;
             //Sg1.Cells[0,Fila] := '60';
             Sg1.Cells[0,Fila] := '1318';//CDprestamo.FieldByName('inversion').AsString; //CLASIFICACION
             if FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
             begin
               Id := LeftStr(FieldByName('ID_PERSONA').AsString,Length(FieldByName('ID_PERSONA').AsString)-1);
               Dg := RightStr(FieldByName('ID_PERSONA').AsString,1);
             end
             else
             begin
               Id := FieldByName('ID_PERSONA').AsString;
               Dg := '';
             end; // FIN DEL VALIDA IDENTIFICACION
             case FieldByName('ID_IDENTIFICACION').AsInteger of
             1: tp := '11';
             2: Tp := '12';
             3: Tp := '13';
             4: Tp := '31';
             6: Tp := '22';
             9: Tp := '11';
             end;

             Sg1.Cells[1,Fila] := Tp;//TIPO DE DOCUMENTOS
             Sg1.Cells[2,Fila] := Id;//NUMERO DOCUMNETO
             Sg1.Cells[3,Fila] := Dg;//DIGITO VERIFICACION OPCIONAL
               try
               if StrLen(PChar(vCodMunicipio)) = 4 then
                  vCodMunicipio := '0' +  vCodMunicipio;
               Dpto := FormatCurr('00',StrToInt(LeftStr(vCodMunicipio,2)));
               Mn := FormatCurr('000',StrToInt(RightStr(vCodMunicipio,3)));
               except
               begin
                 Mn := '0';
                 Dpto := '0';
               end;
               end;
             Nm := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString);
             Dr := direccion(FieldByName('ID_PERSONA').AsString,FieldByName('ID_IDENTIFICACION').AsInteger);

             Sg1.Cells[4,Fila] := Trim(FieldByName('PRIMER_APELLIDO').AsString);//PRIMER APELLIDO
             Sg1.Cells[5,Fila] := Trim(FieldByName('SEGUNDO_APELLIDO').AsString);//SEGUNDO APELLIDO
             _sNombre := Trim(FieldByName('NOMBRE').AsString);
             Sg1.Cells[6,Fila] := _sNombre;
             if Pos(' ', _sNombre) > 0 then
             begin
               Sg1.Cells[6,Fila] := LeftStr(_sNombre,Pos(' ', _sNombre)-1);
               Sg1.Cells[7,Fila] := RightStr(_sNombre,Length(_sNombre) - Pos(' ', _sNombre));
             end;

             if Tp = '31' then
               Sg1.Cells[8,Fila] := Nm
             else
               Sg1.Cells[8,Fila] := '';
             Sg1.Cells[9,Fila] := Dr;
             Sg1.Cells[10,Fila] := Dpto;
             Sg1.Cells[11,Fila] := Mn;
             Sg1.Cells[12,Fila] := '169';
             Sg1.Cells[13,Fila] := FormatCurr('#0',_cProvision);

           end;
           end;
           EdNumero.Text := FormatCurr('0000',Fila);
           Application.ProcessMessages;
           Next;
          end; // fin de la validación de saldo

          //end;
          Transaction.Commit;
        end; //fin del ibquery


end;

procedure TfrmPrestamosCorte.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrestamosCorte.btnAExcelClick(Sender: TObject);
begin
        if sd1.Execute then
           StringGridToXLS(Sg1,sd1.FileName);
end;

function TfrmPrestamosCorte.direccion(id_persona: string;
  id_identificacion: integer): string;
begin
        with IBSQL2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT  * FROM "gen$direccion"');
          SQL.Add('WHERE');
          SQL.Add('("gen$direccion".ID_DIRECCION = 1) AND');
          SQL.Add('("gen$direccion".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION)');
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ExecQuery;
          Result := FieldByName('DIRECCION').AsString;
        end;
end;

procedure TfrmPrestamosCorte.FormCreate(Sender: TObject);
begin
        EdPeriodo.Value := YearOf(fFechaActual) -1 ;
        if _iAno < YearOf(Date) then
        begin
          DtFecha.DateTime := StrToDate(IntToStr(EdPeriodo.Value)+'/12/30');
          DtFecha.Enabled := False;
        end
        else
        begin
        if MonthOf(Date) <> 3 then
           DtFecha.DateTime := EncodeDate(EdPeriodo.Value,MonthOf(Date) -1,30)
        else
           DtFecha.DateTime := EncodeDate(EdPeriodo.Value,MonthOf(Date)-1,28)
        end;
        
end;

procedure TfrmPrestamosCorte.DtFechaExit(Sender: TObject);
begin
        if MonthOf(DtFecha.DateTime) <> 2 then
           DtFecha.DateTime := EncodeDate(_iAno,MonthOf(DtFecha.DateTime),30)
        else
           DtFecha.DateTime := EncodeDate(_iAno,MonthOf(DtFecha.DateTime),28)
end;

end.
