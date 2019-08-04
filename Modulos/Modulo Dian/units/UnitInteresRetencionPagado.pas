unit UnitInteresRetencionPagado;

interface

uses
  StrUtils, DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvTypedEdit, JvEdit, Buttons, ExtCtrls,
  JvScrollingLabel, DB, IBCustomDataSet, IBQuery, DBClient, Grids, IBSQL,XLSfile;

type
  TfrmMnu020101 = class(TForm)
    GroupBox1: TGroupBox;
    EdMonto: TJvCurrencyEdit;
    EdPeriodo: TJvYearEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    IBQuery1: TIBQuery;
    btnCerrar: TBitBtn;
    Sg1: TStringGrid;
    Cds1: TClientDataSet;
    IBSQL1: TIBSQL;
    Cds1Tipo: TIntegerField;
    Cds1Codigo: TIntegerField;
    Cds1SubCodigo: TIntegerField;
    Cds1TipoIde: TStringField;
    Cds1NumeroIde: TStringField;
    Cds1DigitoIde: TStringField;
    Cds1Nombre: TStringField;
    Cds1Primer: TCurrencyField;
    Cds1Segundo: TCurrencyField;
    Cds1TercerValor: TCurrencyField;
    Cds1Direccion: TStringField;
    Cds1DptoMun: TStringField;
    btnAExcel: TBitBtn;
    sd1: TSaveDialog;
    lbs1: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMnu020101: TfrmMnu020101;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmMnu020101.FormShow(Sender: TObject);
begin
        EdPeriodo.Value := yearof(ffechaactual) - 1;
        EdMonto.Value := 0;
end;

procedure TfrmMnu020101.btnProcesarClick(Sender: TObject);
var
  Id:string;
  Dg:string;
  Tp:string;
  Nm:string;
  Pa:string;
  Sa:string;
  Rz:string;
  Dr:string;
  Dpto:string;
  Mn:string;
  Fila:Integer;
begin

        Fila := 0;
        lbs1.Visible := True;
        Application.ProcessMessages;
        
        with IBQuery1 do begin
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          SQL.Add('SUM("cap$extracto".VALOR_DEBITO) AS INTERES,');
          SQL.Add('SUM("cap$extracto".VALOR_CREDITO) AS RETENCION');
          SQL.Add('from');
          SQL.Add('"cap$extracto"');
          SQL.Add('inner join');
          SQL.Add('"cap$maestrotitular" on ("cap$extracto".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
          SQL.Add('"cap$extracto".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
          SQL.Add('"cap$extracto".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
          SQL.Add('"cap$extracto".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('where');
          SQL.Add('("cap$extracto".ID_TIPO_CAPTACION IN (2,4)) and');
          SQL.Add('("cap$extracto".ID_TIPO_MOVIMIENTO IN (7,8,15,16)) and');
          SQL.Add('("cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2) and');
          SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1)');
          SQL.Add('group by');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA');
          SQL.Add('having');
          SQL.Add('SUM("cap$extracto".VALOR_DEBITO) >= :MONTO');
          SQL.Add('order by');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA');
          ParamByName('FECHA1').AsDate := EncodeDate(EdPeriodo.Value,01,01);
          ParamByName('FECHA2').AsDate := EncodeDate(EdPeriodo.Value,12,31);
          ParamByName('MONTO').AsCurrency := EdMonto.Value;
          try
           Open;
           Last;
           First;
          except
           Transaction.Rollback;
           raise;
          end;

          Sg1.RowCount := RecordCount+1;
          Sg1.ColWidths[0] := 20; // Registro Nro.
          Sg1.ColWidths[1] := 20; // Concepto
          Sg1.ColWidths[2] := 10; // Tipo Documento
          Sg1.ColWidths[3] := 20; // Numero de Identificación
          Sg1.ColWidths[4] := 10; // Digito de Verificacion
          Sg1.ColWidths[5] := 80; // Primer Apellido
          Sg1.ColWidths[6] := 80; // Segundo Apellido
          Sg1.ColWidths[7] := 80; // Primer Nombre
          Sg1.ColWidths[8] := 80; // Segundo Nombre
          Sg1.ColWidths[9] := 400; // Razon Social
          Sg1.ColWidths[10] := 200; // Dirección
          Sg1.ColWidths[11] := 20; // Código Departamento
          Sg1.ColWidths[12] := 20; // Código Municipio
          Sg1.ColWidths[13] := 80; // Valor Base Retención
          Sg1.ColWidths[14] := 80; // Valor Retención Practicada

          Self.Height := 327;
          Application.ProcessMessages;

          while not Eof do
          begin
             IBSQL1.Close;
             IBSQL1.SQL.Clear;
             IBSQL1.SQL.Add('select');
             IBSQL1.SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
             IBSQL1.SQL.Add('"gen$direccion".DIRECCION || '' '' || "gen$direccion".BARRIO AS DIRECCION');
             IBSQL1.SQL.Add('from');
             IBSQL1.SQL.Add('"gen$persona"');
             IBSQL1.SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and');
             IBSQL1.SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA and "gen$direccion".ID_DIRECCION = 1 ');
             IBSQL1.SQL.Add('and "gen$direccion".ID_DIRECCION = 1)');
             IBSQL1.SQL.Add('where');
             IBSQL1.SQL.Add('"gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION and "gen$persona".ID_PERSONA = :ID_PERSONA');
             IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
             IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
             try
              IBSQL1.ExecQuery;
              if IBSQL1.RecordCount > 0 then begin
                 Nm := Trim(IBSQL1.FieldByName('NOMBRE').AsString);
                 Pa := Trim(IBSQL1.FieldByName('PRIMER_APELLIDO').AsString);
                 Sa := Trim(IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString);
                 Dr := Trim(IBSQL1.FieldByName('DIRECCION').AsString);
              end
              else
              begin
                 Nm := '';
                 Pa := '';
                 Sa := '';
                 Dr := '';
              end;
             except
              Transaction.Rollback;
              raise;
             end;

             Sg1.RowCount := Fila+1;
             Sg1.Cells[0,Fila] := IntToStr(RecNo);
             Sg1.Cells[1,Fila] := '2316';
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

             Sg1.Cells[3,Fila] := Id;
             Sg1.Cells[4,Fila] := Dg;

             case FieldByName('ID_IDENTIFICACION').AsInteger of
             1: Tp := '11';
             2: Tp := '12';
             3: Tp := '13';
             4: Tp := '31';
             6: Tp := '22';
             end;

             Dpto := '54';

             case Agencia of
             1: Mn := '498';
             2: Mn := '003';
             3: Mn := '206';
             end;

             Rz := '';

             if Tp = '31' then
             begin
               Rz := Nm+Pa+Sa;
               Nm := '';
               Pa := '';
               Sa := '';
             end;


             Sg1.Cells[2,Fila] := Tp;
             Sg1.Cells[5,Fila] := Pa;
             Sg1.Cells[6,Fila] := Sa;
             Sg1.Cells[7,Fila] := Nm;
             Sg1.Cells[8,Fila] := '';
             Sg1.Cells[9,Fila] := Rz;
             Sg1.Cells[13,Fila] := FormatCurr('#0',FieldByName('INTERES').AsCurrency);
             Sg1.Cells[14,Fila] := '';
             Sg1.Cells[10,Fila] := Dr;
             Sg1.Cells[11,Fila] := Dpto;
             Sg1.Cells[12,Fila] := Mn;

             if FieldByName('RETENCION').AsCurrency > 0 then
             begin
               Inc(Fila);
               Sg1.RowCount := Fila+1;               
               Sg1.Cells[0,Fila] := IntToStr(RecNo);
               Sg1.Cells[1,Fila] := '2';
               Sg1.Cells[2,Fila] := '72';
               Sg1.Cells[3,Fila] := '21';
               Sg1.Cells[4,Fila] := Id;
               Sg1.Cells[5,Fila] := Dg;
               Sg1.Cells[6,Fila] := Tp;
               Sg1.Cells[7,Fila] := Nm;
               Sg1.Cells[8,Fila] := FormatCurr('#0',FieldByName('RETENCION').AsCurrency);
               Sg1.Cells[9,Fila] := '0';
               Sg1.Cells[10,Fila] := '0';
               Sg1.Cells[11,Fila] := Dr;
               Sg1.Cells[12,Fila] := Mn;
             end;

             Inc(Fila);

             Next;
          end;
          Transaction.Commit;
        end;


end;

procedure TfrmMnu020101.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmMnu020101.btnAExcelClick(Sender: TObject);
begin
        if sd1.Execute then
           StringGridToXLS(Sg1,sd1.FileName);
end;

end.
