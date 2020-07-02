unit UnitPrestamos;

interface

uses
  DateUtils, StrUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, Grids, StdCtrls,
  Buttons, ExtCtrls, JvTypedEdit, JvEdit, JvSpecialProgress, XLSfile,
  ComCtrls;

type
  TfrmPrestamos = class(TForm)
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
    Label4: TLabel;
    DtFecha: TDateTimePicker;
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  published
    function direccion(id_persona: string;
      id_identificacion: integer): string;
    { Public declarations }
  end;

var
  frmPrestamos: TfrmPrestamos;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmPrestamos.btnProcesarClick(Sender: TObject);
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
  _sNombre :String;
  _dFechaI :TDate;
begin
        _dFechaI := EncodeDate(EdPeriodo.Value,1,1);
        Fila := -1;
        Application.ProcessMessages;

        Sg1.RowCount := 1;
        Sg1.ColWidths[0] := 40;
        Sg1.ColWidths[1] := 40;
        Sg1.ColWidths[2] := 80;
        Sg1.ColWidths[3] := 80;
        Sg1.ColWidths[4] := 80;
        Sg1.ColWidths[5] := 80;
        Sg1.ColWidths[6] := 80;
        Sg1.ColWidths[7] := 80;
        Sg1.ColWidths[8] := 80;
        Sg1.ColWidths[9] := 80;
        Sg1.ColWidths[10] := 80;
        Sg1.ColWidths[11] := 80;
        Sg1.ColWidths[12] := 80;
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
          SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA and "gen$direccion".ID_DIRECCION = 1 ');
          SQL.Add('and "gen$direccion".ID_DIRECCION = 1)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".FECHA_DESEMBOLSO BETWEEN :FECHA1 AND :FECHA2) AND');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN (4,5,10,12,13,17))');
          ParamByName('FECHA1').AsDate := _dFechaI;
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
            IBSQL1.SQL.Add('SELECT');
            IBSQL1.SQL.Add('SUM("col$colocacion".VALOR_DESEMBOLSO) AS VALOR_DESEMBOLSO,');
//            IBSQL1.SQL.Add('"col$colocacion".ID_COLOCACION,');
            IBSQL1.SQL.Add('"col$colocacion".ID_CLASIFICACION');
            IBSQL1.SQL.Add('FROM');
            IBSQL1.SQL.Add('"col$colocacion"');
            IBSQL1.SQL.Add('WHERE');
            IBSQL1.SQL.Add('("col$colocacion".ID_PERSONA = :ID_PERSONA) AND');
            IBSQL1.SQL.Add('("col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION)');
            IBSQL1.SQL.Add('AND ("col$colocacion".FECHA_DESEMBOLSO BETWEEN :FECHA1 AND :FECHA2) AND');
            IBSQL1.SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN (4,5,10,12,13))');
            IBSQL1.SQL.Add('GROUP BY "col$colocacion".ID_CLASIFICACION');
            IBSQL1.ParamByName('FECHA1').AsDate := _dFechaI;
            IBSQL1.ParamByName('FECHA2').AsDate := DtFecha.Date;
            IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
            IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
            IBSQL1.Open;
            IBSQL1.Last;
            IBSQL1.First;
            Bar2.Maximum := IBSQL1.RecordCount;
            CDprestamo.CancelUpdates;
            Saldo := 0;
            while not IBSQL1.Eof DO
            begin
              Bar2.Position := IBSQL1.RecNo;
              Application.ProcessMessages;
              CDprestamo.Append;
              CDprestamo.FieldValues['valor'] := IBSQL1.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
              CDprestamo.FieldValues['inversion'] := FormatCurr('0',IBSQL1.FieldByName('ID_CLASIFICACION').AsInteger);
//              CDprestamo.FieldValues['col'] := '0'+ IntToStr(Agencia)+IBSQL1.FieldByName('ID_COLOCACION').AsString;
              CDprestamo.Post;
              Saldo := Saldo + IBSQL1.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
              IBSQL1.Next;
            end;
            // VALIDA SALDO
            if Saldo >= EdMonto.Value then
            begin
              CDprestamo.First;
             while not CDprestamo.Eof do
             begin
               Inc(Fila);
               Sg1.RowCount := Fila + 1;
               //Sg1.Cells[0,Fila] := '2';
               //Sg1.Cells[1,Fila] := '60';
               Sg1.Cells[0,Fila] := CDprestamo.FieldByName('inversion').AsString; //CLASIFICACION
               if FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
               begin
                 Id := LeftStr(FieldByName('ID_PERSONA').AsString,Length(FieldByName('ID_PERSONA').AsString)-1);
                 Dg := RightStr(FieldByName('ID_PERSONA').AsString,1);
               end
               else
               begin
                 Id := FieldByName('ID_PERSONA').AsString;
                 Dg := '';
               end;
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
              { with IBSQL1 do
               begin
                Close;
                SQL.Clear;
                SQL.Add('select DPTO,MUN from "dian$con_personas" where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
                ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                 ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                 Open;
                 Mn := FormatCurr('000',FieldByName('MUN').AsInteger);
                 Dpto := FormatCurr('00',FieldByName('DPTO').AsInteger);
               end;}
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
               Sg1.Cells[12,Fila] := FormatCurr('#0',CDprestamo.FieldByName('valor').AsCurrency);
               //Sg1.Cells[15,Fila] := FieldByName('MUNICIPIO').AsString;

{             Sg1.Cells[8,Fila] := FormatCurr('#0',CDprestamo.FieldByName('valor').AsCurrency);
             Sg1.Cells[9,Fila] := '0';
             Sg1.Cells[10,Fila] := '0';
             Sg1.Cells[11,Fila] := CDprestamo.FieldByName('col').AsString;
             Sg1.Cells[12,Fila] := Dr;
             Sg1.Cells[13,Fila] := Mn;
             sg1.CElls[14,Fila] := FieldByName('MUNICIPIO').AsString;}
             CDprestamo.Next;
             end; // fin del while cdprestamo
             end;
           Next;
          end; // fin de la validación de saldo

          //end;
          Transaction.Commit;
        end; //fin del ibquery


end;

procedure TfrmPrestamos.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrestamos.btnAExcelClick(Sender: TObject);
begin
        if sd1.Execute then
           StringGridToXLS(Sg1,sd1.FileName);
end;

function TfrmPrestamos.direccion(id_persona: string;
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

procedure TfrmPrestamos.FormCreate(Sender: TObject);
begin
        EdPeriodo.Value := YearOf(fFechaActual) - 1;
        DtFecha.Date := EncodeDate(EdPeriodo.Value,12,31);
end;

end.
=======
unit UnitPrestamos;

interface

uses
  DateUtils, StrUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, Grids, StdCtrls,
  Buttons, ExtCtrls, JvTypedEdit, JvEdit, JvSpecialProgress, XLSfile,
  ComCtrls;

type
  TfrmPrestamos = class(TForm)
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
    Label4: TLabel;
    DtFecha: TDateTimePicker;
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  published
    function direccion(id_persona: string;
      id_identificacion: integer): string;
    { Public declarations }
  end;

var
  frmPrestamos: TfrmPrestamos;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmPrestamos.btnProcesarClick(Sender: TObject);
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
  _sNombre :String;
  _dFechaI :TDate;
begin
        _dFechaI := EncodeDate(EdPeriodo.Value,1,1);
        Fila := -1;
        Application.ProcessMessages;

        Sg1.RowCount := 1;
        Sg1.ColWidths[0] := 40;
        Sg1.ColWidths[1] := 40;
        Sg1.ColWidths[2] := 80;
        Sg1.ColWidths[3] := 80;
        Sg1.ColWidths[4] := 80;
        Sg1.ColWidths[5] := 80;
        Sg1.ColWidths[6] := 80;
        Sg1.ColWidths[7] := 80;
        Sg1.ColWidths[8] := 80;
        Sg1.ColWidths[9] := 80;
        Sg1.ColWidths[10] := 80;
        Sg1.ColWidths[11] := 80;
        Sg1.ColWidths[12] := 80;
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
          SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA and "gen$direccion".ID_DIRECCION = 1 ');
          SQL.Add('and "gen$direccion".ID_DIRECCION = 1)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".FECHA_DESEMBOLSO BETWEEN :FECHA1 AND :FECHA2) AND');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN (4,5,10,12,13,17))');
          ParamByName('FECHA1').AsDate := _dFechaI;
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
            IBSQL1.SQL.Add('SELECT');
            IBSQL1.SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
            IBSQL1.SQL.Add('"col$colocacion".ID_COLOCACION,');
            IBSQL1.SQL.Add('"col$colocacion".ID_CLASIFICACION');
            IBSQL1.SQL.Add('FROM');
            IBSQL1.SQL.Add('"col$colocacion"');
            IBSQL1.SQL.Add('WHERE');
            IBSQL1.SQL.Add('("col$colocacion".ID_PERSONA = :ID_PERSONA) AND');
            IBSQL1.SQL.Add('("col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION)');
            IBSQL1.SQL.Add('AND ("col$colocacion".FECHA_DESEMBOLSO BETWEEN :FECHA1 AND :FECHA2) AND');
            IBSQL1.SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN (4,5,10,12,13))');
            IBSQL1.ParamByName('FECHA1').AsDate := _dFechaI;
            IBSQL1.ParamByName('FECHA2').AsDate := DtFecha.Date;
            IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
            IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
            IBSQL1.Open;
            IBSQL1.Last;
            IBSQL1.First;
            Bar2.Maximum := IBSQL1.RecordCount;
            CDprestamo.CancelUpdates;
            Saldo := 0;
            while not IBSQL1.Eof DO
            begin
              Bar2.Position := IBSQL1.RecNo;
              Application.ProcessMessages;
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
              CDprestamo.First;
             while not CDprestamo.Eof do
             begin
               Inc(Fila);
               Sg1.RowCount := Fila + 1;
               //Sg1.Cells[0,Fila] := '2';
               //Sg1.Cells[1,Fila] := '60';
               Sg1.Cells[0,Fila] := CDprestamo.FieldByName('inversion').AsString; //CLASIFICACION
               if FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
               begin
                 Id := LeftStr(FieldByName('ID_PERSONA').AsString,Length(FieldByName('ID_PERSONA').AsString)-1);
                 Dg := RightStr(FieldByName('ID_PERSONA').AsString,1);
               end
               else
               begin
                 Id := FieldByName('ID_PERSONA').AsString;
                 Dg := '';
               end;
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
              { with IBSQL1 do
               begin
                Close;
                SQL.Clear;
                SQL.Add('select DPTO,MUN from "dian$con_personas" where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
                ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                 ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                 Open;
                 Mn := FormatCurr('000',FieldByName('MUN').AsInteger);
                 Dpto := FormatCurr('00',FieldByName('DPTO').AsInteger);
               end;}
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
               Sg1.Cells[12,Fila] := FormatCurr('#0',CDprestamo.FieldByName('valor').AsCurrency);
               //Sg1.Cells[15,Fila] := FieldByName('MUNICIPIO').AsString;

{             Sg1.Cells[8,Fila] := FormatCurr('#0',CDprestamo.FieldByName('valor').AsCurrency);
             Sg1.Cells[9,Fila] := '0';
             Sg1.Cells[10,Fila] := '0';
             Sg1.Cells[11,Fila] := CDprestamo.FieldByName('col').AsString;
             Sg1.Cells[12,Fila] := Dr;
             Sg1.Cells[13,Fila] := Mn;
             sg1.CElls[14,Fila] := FieldByName('MUNICIPIO').AsString;}
             CDprestamo.Next;
             end; // fin del while cdprestamo
             end;
           Next;
          end; // fin de la validación de saldo

          //end;
          Transaction.Commit;
        end; //fin del ibquery


end;

procedure TfrmPrestamos.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrestamos.btnAExcelClick(Sender: TObject);
begin
        if sd1.Execute then
           StringGridToXLS(Sg1,sd1.FileName);
end;

function TfrmPrestamos.direccion(id_persona: string;
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

procedure TfrmPrestamos.FormCreate(Sender: TObject);
begin
        EdPeriodo.Value := YearOf(fFechaActual) - 1;
        DtFecha.Date := EncodeDate(EdPeriodo.Value,12,31);
end;

end.

