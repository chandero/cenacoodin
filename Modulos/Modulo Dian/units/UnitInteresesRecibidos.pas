unit UnitInteresesRecibidos;

interface                            

uses
  StrUtils,DateUtils,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, Grids,  
  Buttons, ExtCtrls, JvTypedEdit, JvEdit,XLSfile, DataSetToExcel, ComCtrls;

type
  TfrmInteresesRecibidos = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdPeriodo: TJvYearEdit;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    btnAExcel: TBitBtn;
    IBQuery1: TIBQuery;
    Cds1: TClientDataSet;
    Cds1Tipo: TIntegerField;
    Cds1Codigo: TIntegerField;
    Cds1SubCodigo: TIntegerField;
    Cds1NumeroIde: TStringField;
    Cds1DigitoIde: TStringField;
    Cds1TipoIde: TStringField;
    Cds1Nombre: TStringField;
    Cds1Primer: TCurrencyField;
    Cds1Segundo: TCurrencyField;
    Cds1TercerValor: TCurrencyField;
    Cds1Direccion: TStringField;
    Cds1DptoMun: TStringField;
    IBSQL1: TIBSQL;
    sd1: TSaveDialog;
    lbs1: TStaticText;
    IBQuery2: TIBQuery;
    cdValor: TClientDataSet;
    cdValorCONCEPTO: TStringField;
    cdValorTIPO: TStringField;
    cdValorNUMERO: TStringField;
    cdValorDV: TStringField;
    cdValorP_APELLIDO: TStringField;
    cdValorS_APELLIDO: TStringField;
    cdValorP_NOMBRE: TStringField;
    cdValorS_NOMBRE: TStringField;
    cdValorRZ: TStringField;
    cdValorINGRESO: TStringField;
    save: TSaveDialog;
    IBQuery3: TIBQuery;
    Label3: TLabel;
    DtFecha: TDateTimePicker;
    cdValorPAIS: TStringField;
    cdValorINGRESOS2: TStringField;
    cdValorINGRESOS3: TStringField;
    cdValorINGRESOS4: TStringField;
    cdValorINGRESOS5: TStringField;
    cdValorINGRESOS6: TStringField;
    cdValorDEVOLUCION: TStringField;
    procedure btnProcesarClick(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInteresesRecibidos: TfrmInteresesRecibidos;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales, unitMain;

procedure TfrmInteresesRecibidos.btnProcesarClick(Sender: TObject);
var
  Id:string;
  Dg:string;
  Tp:string;
  Nm:string;
  Dr:string;
  Mn:string;
  Fila:Integer;
  ExcelFile:TDataSetToExcel;
  _sNombre :string;
  _dFechaI :TDate;
begin
        _dFechaI := Encodedate(EdPeriodo.Value,1,1);
        Fila := 0;
        lbs1.Visible := True;
        btnProcesar.Enabled := False;
        Application.ProcessMessages;
        with IBQuery1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          Close;
          SQL.Clear;
          SQL.Add('select * from "dian$interesesrecibidos"');
          Open;
          if RecordCount >= 0 then
          begin
           Close;
           SQL.Clear;
           SQL.Add('delete from "dian$interesesrecibidos"');
           ExecSQL;
           Transaction.Commit;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('insert into "dian$interesesrecibidos" ');
           SQL.Add('select');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA,');
           SQL.Add('SUM("col$extracto".ABONO_CXC + "col$extracto".ABONO_ANTICIPADO + "col$extracto".ABONO_SERVICIOS + "col$extracto".ABONO_MORA) AS VALOR');
           SQL.Add('from');
           SQL.Add('"col$extracto"');
           SQL.Add('inner join');
           SQL.Add('"col$colocacion" on ("col$extracto".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
           SQL.Add('where');
           SQL.Add('"col$extracto".TIPO_OPERACION = 1 and');
           SQL.Add('"col$extracto".FECHA_EXTRACTO BETWEEN :FECHA1 and :FECHA2 and "col$extracto".TIPO_ABONO = 0 AND "col$colocacion".ID_ESTADO_COLOCACION not in (10,12,13)');
           SQL.Add('group by');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA');
           SQL.Add('order by');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA');
           ParamByName('FECHA1').AsDate := _dFechaI;
           ParamByName('FECHA2').AsDate := DtFecha.DateTime;
           try
             ExecSQL;
           except
             Transaction.Rollback;
             raise;
           end;
           Transaction.Commit;
          end;
        end;
        {
        with IBQuery1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$interesesrecibidos" ');
          SQL.Add('select');
          SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
          SQL.Add('"col$causaciondiaria".ID_PERSONA,');
//          SQL.Add('"col$colocacion".ID_GARANTIA,');
          SQL.Add('SUM(PINTERES_REC) AS VALOR');
          SQL.Add('from');
          SQL.Add('"col$causaciondiaria"');
          SQL.Add('where');
          SQL.Add('"col$causaciondiaria".FECHA_CORTE BETWEEN :FECHA1 and :FECHA2');
          SQL.Add('group by');
          SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
          SQL.Add('"col$causaciondiaria".ID_PERSONA');
          SQL.Add('order by');
          SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
          SQL.Add('"col$causaciondiaria".ID_PERSONA');
//          SQL.Add('"col$colocacion".ID_GARANTIA');
          ParamByName('FECHA1').AsDate := _dFechaI;
          ParamByName('FECHA2').AsDate := DtFecha.DateTime;
          //ParamByName('MONTO').AsCurrency := EdMonto.Value;
          try
            ExecSQL;
          except
            Transaction.Rollback;
            raise;
          end;
          Transaction.Commit;
        end;
        }
        with IBQuery3 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          ParamByName('MONTO').AsCurrency := EdMonto.Value;
          Open;
          while not Eof do
          begin
            with IBQuery2 do
            begin
              Close;
              ParamByName('ID_PERSONA').AsString := IBQuery3.FieldByName('ID_PERSONA').AsString;
              Open;
              while not Eof do
              begin
                case FieldByName('ID_IDENTIFICACION').AsInteger of
                  1: tp := '11';
                  2: Tp := '12';
                  3: Tp := '13';
                  4: Tp := '31';
                  6: Tp := '22';
                  9: Tp := '11';
                 end;
                 cdValor.Append;
//                 if FieldByName('ID_GARANTIA').AsInteger = 1 then
//                   cdValor.FieldValues['CONCEPTO'] := '4004'
//                 else
                   cdValor.FieldValues['CONCEPTO'] := '4001';
                 if Tp = '31' then
                 begin
                   Id := LeftStr(FieldByName('ID_PERSONA').AsString,Length(FieldByName('ID_PERSONA').AsString)-1);
                   Dg := RightStr(FieldByName('ID_PERSONA').AsString,1);
                 end
                 else
                 begin
                   Id := FieldByName('ID_PERSONA').AsString;
                   Dg := '';
                  end;
                 cdValor.FieldValues['TIPO'] := Tp;
                 cdValor.FieldValues['NUMERO'] := Id;
                 cdValor.FieldValues['DV'] := Dg;
                 if Tp <> '31' then
                 begin
                   cdValor.FieldValues['P_APELLIDO'] := FieldByName('PRIMER_APELLIDO').AsString;
                   cdValor.FieldValues['S_APELLIDO'] := FieldByName('SEGUNDO_APELLIDO').AsString;
                   _sNombre := Trim(FieldByName('NOMBRE').AsString);
                   cdValor.FieldValues['P_NOMBRE'] := _sNombre;
                   if Pos(' ', _sNombre) > 0 then
                   begin
                       cdValor.FieldValues['P_NOMBRE'] := LeftStr(_sNombre,Pos(' ', _sNombre)-1);
                       cdValor.FieldValues['S_NOMBRE'] := RightStr(_sNombre,Length(_sNombre) - Pos(' ', _sNombre));
                   end;
                 end
                 else
                 cdValor.FieldValues['RZ'] := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString);
                 cdValor.FieldValues['PAIS'] := 169;
                 cdValor.FieldValues['INGRESO'] := FieldByName('VALOR').AsCurrency;
                 cdValor.FieldValues['INGRESOS2'] := 0;
                 cdValor.FieldValues['INGRESOS3'] := 0;
                 cdValor.FieldValues['INGRESOS4'] := 0;
                 cdValor.FieldValues['INGRESOS5'] := 0;
                 cdValor.FieldValues['INGRESOS6'] := 0;
                 cdValor.FieldValues['DEVOLUCION'] := 0;
                 Next; // FIND DEL WHILE
              end;
            end; //FIN DEL IBQUERY2
            Next;
          end; //FIN DEL WHILE
          end; //FIND DE IBQUERY2
        lbs1.Caption := 'Proceso Terminado con Exito......';
        Application.ProcessMessages;
        btnProcesar.Enabled := True;
        if Save.Execute then
        begin
          cdValor.First;
          ExcelFile := TDataSetToExcel.Create(cdValor,Save.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

procedure TfrmInteresesRecibidos.btnAExcelClick(Sender: TObject);
var
  ExcelFile:TDataSetToExcel;
begin
        if Save.Execute then
        begin
          cdValor.First;
          ExcelFile := TDataSetToExcel.Create(cdValor,Save.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

procedure TfrmInteresesRecibidos.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInteresesRecibidos.FormCreate(Sender: TObject);
begin
        EdPeriodo.Value := YearOf(fFechaActual) - 1;
        DtFecha.Date := EncodeDate(EdPeriodo.Value,12,31);
end;

end.
