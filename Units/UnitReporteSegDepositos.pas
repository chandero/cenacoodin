unit UnitReporteSegDepositos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TeeProcs, TeEngine, Chart, ExtCtrls, Series,
  IBDatabase, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, DbChart,
  Grids, DBGrids, FR_Chart, FR_Class, FR_DSet, FR_DBSet, FR_Shape, sdXMLDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, DBClient,
  IBStoredProc, JvComponent, JvDlg, IBSQL, Math,DateUtils;

type
  TfrmReporteSegDepositos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    btnCerrar: TBitBtn;
    btnImprimir: TBitBtn;
    DS1: TDataSource;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    IBQuery1ID_LINEA: TSmallintField;
    IBQuery1DESCRIPCION_LINEA: TIBStringField;
    IBQuery1CANTIDAD: TIntegerField;
    IBQuery1DEUDA: TIBBCDField;
    EdCantidad: TStaticText;
    EdDeuda: TStaticText;
    IBQuery2: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    frChartObject1: TfrChartObject;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    frShapeObject1: TfrShapeObject;
    IBQuery1PORCENTAJE: TFloatField;
    IdTCPClient1: TIdTCPClient;
    CDS: TClientDataSet;
    CDSAGENCIA: TIntegerField;
    CDSCANTIDAD: TIntegerField;
    CDSPORCENTAJE: TFloatField;
    IBsp1: TIBStoredProc;
    IBQuery1AGENCIA: TIntegerField;
    DBChart1: TDBChart;
    Series1: THorizBarSeries;
    PageControl1: TPageControl;
    Tab01: TTabSheet;
    Tab03: TTabSheet;
    TabConsol: TTabSheet;
    Tab02: TTabSheet;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    EdCantidad02: TStaticText;
    EdDeuda02: TStaticText;
    Panel4: TPanel;
    DBChart2: TDBChart;
    HorizBarSeries1: THorizBarSeries;
    Panel6: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    DBGrid3: TDBGrid;
    EdCantidad03: TStaticText;
    EdDeuda03: TStaticText;
    Panel7: TPanel;
    DBChart3: TDBChart;
    HorizBarSeries2: THorizBarSeries;
    CDS02: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField3: TIntegerField;
    FloatField1: TFloatField;
    CDS03: TClientDataSet;
    IntegerField4: TIntegerField;
    IntegerField6: TIntegerField;
    FloatField2: TFloatField;
    CDSConsol: TClientDataSet;
    IntegerField8: TIntegerField;
    StringField3: TStringField;
    IntegerField9: TIntegerField;
    CurrencyField3: TCurrencyField;
    FloatField3: TFloatField;
    frmBar: TJvProgressForm;
    DS2: TDataSource;
    DS3: TDataSource;
    Panel8: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    DBGrid4: TDBGrid;
    EdCantidadConsol: TStaticText;
    EdDeudaConsol: TStaticText;
    Panel9: TPanel;
    DBChart4: TDBChart;
    HorizBarSeries3: THorizBarSeries;
    DSConsol: TDataSource;
    frDBDataSet3: TfrDBDataSet;
    frDBDataSet4: TfrDBDataSet;
    Tab04: TTabSheet;
    Panel10: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    DBGrid5: TDBGrid;
    EdCantidad04: TStaticText;
    EdDeuda04: TStaticText;
    Panel11: TPanel;
    DBChart5: TDBChart;
    HorizBarSeries4: THorizBarSeries;
    IBSQL2: TIBSQL;
    IBSQL1: TIBQuery;
    CDS01: TClientDataSet;
    IntegerField7: TIntegerField;
    IntegerField11: TIntegerField;
    FloatField4: TFloatField;
    CDS04: TClientDataSet;
    IntegerField12: TIntegerField;
    IntegerField14: TIntegerField;
    FloatField5: TFloatField;
    FrReport1: TfrReport;
    frDBDataSet5: TfrDBDataSet;
    CDSTIPO: TIntegerField;
    CDSDESCRIPCION: TStringField;
    CDSVALOR: TCurrencyField;
    CDS01TIPO: TIntegerField;
    CDS01DESCRIPCION: TStringField;
    CDS01VALOR: TCurrencyField;
    CDS02TIPO: TIntegerField;
    CDS02DESCRIPCION: TStringField;
    CDS02VALOR: TCurrencyField;
    CDS03TIPO: TIntegerField;
    CDS03DESCRIPCION: TStringField;
    CDS03VALOR: TCurrencyField;
    CDS04TIPO: TIntegerField;
    CDS04DESCRIPCION: TStringField;
    CDS04VALOR: TCurrencyField;
    Transaction: TIBTransaction;
    Database: TIBDatabase;
    EdFechaCorte: TDateTimePicker;
    Label11: TLabel;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure Tab01Show(Sender: TObject);
    procedure Tab02Show(Sender: TObject);
    procedure Tab03Show(Sender: TObject);
    procedure Tab04Show(Sender: TObject);
  private
     procedure ExtraerRemoto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReporteSegDepositos: TfrmReporteSegDepositos;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmReporteSegDepositos.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteSegDepositos.FormCreate(Sender: TObject);
var
   tCantidad:Integer;
   tDeuda:Currency;
   i:Integer;
   Descripcion:string;
begin

        with IBSQL1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from "gen$agencia" order by ID_AGENCIA ASC');
           try
             Open;
             First;
           except
             Transaction.Rollback;
             raise;
             Exit;
           end;
        end;

        ExtraerRemoto;
        frmBar.Execute;
        while not IBSQL1.Eof do
        begin
          frmBar.InfoLabel := 'Leyendo oficina: '+ IBSQL1.FieldByName('DESCRIPCION_AGENCIA').AsString;
          frmBar.ProgressStepIt;
          Application.ProcessMessages;

          tCantidad := 0;
          tDeuda := 0;
          CDS.Open;
          CDS.Filter := 'AGENCIA = ' + IntToStr(IBSQL1.FieldByName('ID_AGENCIA').AsInteger);
          CDS.Filtered := True;
          while not CDS.Eof do
          begin
            tCantidad := tCantidad + CDS.FieldByName('CANTIDAD').AsInteger;
            tDeuda := tDeuda + CDS.FieldByName('VALOR').AsFloat;
            CDS.Next;
          end;
          CDS.Filtered := False;
          CDS.Close;
          case IBSQL1.FieldByName('ID_AGENCIA').AsInteger of
          1: begin
               EdCantidad.Caption := FormatCurr('#,0',tCantidad);
               EdDeuda.Caption := FormatCurr('$#,0',tDeuda);
             end;
          2: begin
               EdCantidad02.Caption := FormatCurr('#,0',tCantidad);
               EdDeuda02.Caption := FormatCurr('$#,0',tDeuda);
             end;
          3: begin
               EdCantidad03.Caption := FormatCurr('#,0',tCantidad);
               EdDeuda03.Caption := FormatCurr('$#,0',tDeuda);
             end;
          4: begin
               EdCantidad04.Caption := FormatCurr('#,0',tCantidad);
               EdDeuda04.Caption := FormatCurr('$#,0',tDeuda);
             end;
          end;
          IBSQL1.Next;
        end;
        frmBar.Free;

        IBSQL1.First;

        tCantidad := 0;
        tDeuda := 0;

        with CDS do begin
         Open;
         Filtered := False;
         First;
         while not Eof do
         begin
          CDSConsol.Open;
          if CDSConsol.Locate('ID_LINEA',VarArrayOf([FieldByName('ID_LINEA').AsInteger]),[loCaseInsensitive]) then
          begin
              CDSConsol.Edit;
              CDSConsol.FieldByName('CANTIDAD').AsInteger := CDSConsol.FieldByName('CANTIDAD').AsInteger + FieldByName('CANTIDAD').AsInteger;
              CDSConsol.FieldByName('DEUDA').AsCurrency := CDSConsol.FieldByName('DEUDA').AsCurrency + FieldByName('DEUDA').AsCurrency;
              CDSConsol.Post;
              CDSConsol.Close;
          end
          else
          begin
              CDSConsol.Append;
              CDSConsol.FieldByName('ID_LINEA').AsInteger := FieldByName('ID_LINEA').AsInteger;
              CDSConsol.FieldByName('DESCRIPCION_LINEA').AsString := FieldByName('DESCRIPCION_LINEA').AsString;
              CDSConsol.FieldByName('CANTIDAD').AsInteger := FieldByName('CANTIDAD').AsInteger;
              CDSConsol.FieldByName('DEUDA').AsCurrency := FieldByName('DEUDA').AsCurrency;
              CDSConsol.FieldByName('PORCENTAJE').AsFloat := 0;
              CDSConsol.Post;
              CDSConsol.Close;
          end;
          tCantidad := tCantidad + FieldByName('CANTIDAD').AsInteger;
          tDeuda := tDeuda + FieldByName('DEUDA').AsCurrency;
          Next;
          end; // del while
         end; // del with

        with CDSConsol do begin
         Open;
         while not Eof do
         begin
           Edit;
           FieldByName('PORCENTAJE').AsFloat := SimpleRoundTo((FieldByName('DEUDA').AsFloat / tDeuda ) * 100,-3);
           Post;
           Next;
         end;
        end;

        EdCantidadConsol.Caption := FormatCurr('#,0',tCantidad);
        EdDeudaConsol.Caption := FormatCurr('$#,0',tDeuda);

        CDS.First;
        CDSConsol.First;
end;

procedure TfrmReporteSegDepositos.btnImprimirClick(Sender: TObject);
var
 ruta:string;
begin
        CDS01.EmptyDataSet;
        CDS02.EmptyDataSet;
        CDS03.EmptyDataSet;
        CDS04.EmptyDataSet;

        CDS.Filtered := False;
        CDS.First;
        CDS.Filter := 'AGENCIA = 1';
        CDS.Filtered := True;

        while not CDS.Eof do
        begin
          CDS01.Open;
          CDS01.Append;
          CDS01.FieldByName('AGENCIA').AsInteger := CDS.FieldByName('AGENCIA').AsInteger;
          CDS01.FieldByName('ID_LINEA').AsInteger := CDS.FieldByName('ID_LINEA').AsInteger;
          CDS01.FieldByName('DESCRIPCION_LINEA').AsString := CDS.FieldByName('DESCRIPCION_LINEA').AsString;
          CDS01.FieldByName('CANTIDAD').AsInteger := CDS.FieldByName('CANTIDAD').AsInteger;
          CDS01.FieldByName('DEUDA').AsCurrency := CDS.FieldByName('DEUDA').AsCurrency;
          CDS01.FieldByName('PORCENTAJE').AsFloat  := CDS.FieldByName('PORCENTAJE').AsFloat;
          CDS01.Post;
          CDS01.Close;
          CDS.Next;
        end;

        CDS.Filtered := False;
        CDS.First;
        CDS.Filter := 'AGENCIA = 2';
        CDS.Filtered := True;

        while not CDS.Eof do
        begin
          CDS02.Open;
          CDS02.Append;
          CDS02.FieldByName('AGENCIA').AsInteger := CDS.FieldByName('AGENCIA').AsInteger;
          CDS02.FieldByName('ID_LINEA').AsInteger := CDS.FieldByName('ID_LINEA').AsInteger;
          CDS02.FieldByName('DESCRIPCION_LINEA').AsString  := CDS.FieldByName('DESCRIPCION_LINEA').AsString;
          CDS02.FieldByName('CANTIDAD').AsInteger := CDS.FieldByName('CANTIDAD').AsInteger;
          CDS02.FieldByName('DEUDA').AsCurrency  := CDS.FieldByName('DEUDA').AsCurrency;
          CDS02.FieldByName('PORCENTAJE').AsFloat := CDS.FieldByName('PORCENTAJE').AsFloat;
          CDS02.Post;
          CDS02.Close;
          CDS.Next;
        end;

        CDS.Filtered := False;
        CDS.First;
        CDS.Filter := 'AGENCIA = 3';
        CDS.Filtered := True;

        while not CDS.Eof do
        begin
          CDS03.Open;
          CDS03.Append;
          CDS03.FieldByName('AGENCIA').AsInteger := CDS.FieldByName('AGENCIA').AsInteger;
          CDS03.FieldByName('ID_LINEA').AsInteger := CDS.FieldByName('ID_LINEA').AsInteger;
          CDS03.FieldByName('DESCRIPCION_LINEA').AsString  := CDS.FieldByName('DESCRIPCION_LINEA').AsString;
          CDS03.FieldByName('CANTIDAD').AsInteger := CDS.FieldByName('CANTIDAD').AsInteger;
          CDS03.FieldByName('DEUDA').AsCurrency := CDS.FieldByName('DEUDA').AsCurrency;
          CDS03.FieldByName('PORCENTAJE').AsFloat := CDS.FieldByName('PORCENTAJE').AsFloat;
          CDS03.Post;
          CDS03.Close;
          CDS.Next;
        end;

        CDS.Filtered := False;
        CDS.First;        
        CDS.Filter := 'AGENCIA = 4';
        CDS.Filtered := True;

        while not CDS.Eof do
        begin
          CDS04.Open;
          CDS04.Append;
          CDS04.FieldByName('AGENCIA').AsInteger := CDS.FieldByName('AGENCIA').AsInteger;
          CDS04.FieldByName('ID_LINEA').AsInteger := CDS.FieldByName('ID_LINEA').AsInteger;
          CDS04.FieldByName('DESCRIPCION_LINEA').AsString  := CDS.FieldByName('DESCRIPCION_LINEA').AsString;
          CDS04.FieldByName('CANTIDAD').AsInteger := CDS.FieldByName('CANTIDAD').AsInteger;
          CDS04.FieldByName('DEUDA').AsCurrency := CDS.FieldByName('DEUDA').AsCurrency;
          CDS04.FieldByName('PORCENTAJE').AsFloat := CDS.FieldByName('PORCENTAJE').AsFloat;
          CDS04.Post;
          CDS04.Close;
          CDS.Next;
        end;

        ruta := ExtractFilePath(Application.exename)+'reporte\repLineasVsCarteraNew.frf';
        frReport1.LoadFromFile(ruta);
        if frReport1.PrepareReport then
           frReport1.ShowPreparedReport
        else
          ShowMessage('Error al preparar el reporte');

end;

procedure TfrmReporteSegDepositos.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'EMPRESA' then
          ParValue := Empresa;
        if ParName =  'NIT' then
          ParValue := Nit;
        if ParName = 'FECHA' then
          ParValue := fFechaHoraActual;
end;

procedure TfrmReporteSegDepositos.ExtraerRemoto;
var
    Total,Posicion:Integer;
begin
// Ocaña
   DBpath1 := dbpath + '03' + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('0000',YearOf(EdFechaCorte.Date)) + '/';
//   DBpath1 := '03012008/';
//   lblEstado.Caption := 'Procesando Ocaña ...';
   Database.DataBaseName := DBserver1 + ':' + DBpath1 + DBname;
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
   try
     Database.Connected := True;
   except
     raise;
   end;

   frmbar.execute;
   if IBQuery1.Transaction.InTransaction then
      IBQuery1.Transaction.Rollback;
   IBQuery1.Transaction.StartTransaction;

   with IBQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE from "cap$saldosdepositos"');
      ExecSQL;
      Close;
    end;

   with IBquery1 do begin
    Close;
    SQL.Clear;
    SQL.Add('EXECUTE PROCEDURE SALDOS_CUENTAS_SEGVIDA(:ANO,:FECHA1,:FECHA2)');
    ParamByName('ANO').AsString := IntToStr(YearOf(EdFechaCorte.Date));
    ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
    ParamByName('FECHA2').AsDate := EdFechaCorte.Date;
    try
      ExecSQL;
      Transaction.Commit;
    except
      MessageDlg('Error Aplicando Procedimiento Saldos Cuentas Seguro',mtInformation,[mbok],0);
      Transaction.Rollback;
      Exit;
    end;

    Transaction.StartTransaction;
    Close;
    SQL.Clear;
    SQL.Add('select count(*) as TOTAL from  "cap$saldosdepositos');
    try
      ExecSQL;
      Total := FieldByName('TOTAL').AsInteger;
    except
      Transaction.Rollback;
      raise;
      Exit;
    end;

    frmBar.InfoLabel := 'Buscando DEPOSITOS a Trabajar';
    frmBar.ProgressStepIt;
    Application.ProcessMessages;

    Close;
    SQL.Clear;
    SQL.Add('select * from  "cap$saldosdepositos');
    try
      ExecSQL;
    except
      Transaction.Rollback;
      raise;
      Exit;
    end;

    while not Eof do begin
//      if (FieldByName('ID_IDENTIFICACION').AsInteger = 4) or (FieldByName('ID_IDENTIFICACION').AsInteger = 7) then
//       begin
//         CDJuridicas.Append;
//         CDJuridicas.FieldByName('')
      CDS.Open;
      CDS.Append;
      CDS.FieldByName('AGENCIA').AsInteger := FieldByName('AG').AsInteger;
      CDS.FieldByName('TIPO').AsInteger := FieldByName('TIPO_CUENTA').AsInteger;
      case FieldByName('TIPO_CUENTA').AsInteger of
          1: CDS.FieldByName('DESCRIPCION').AsString := 'APORTES';
          2: CDS.FieldByName('DESCRIPCION').AsString := 'RINDEDIARIO';
          4: CDS.FieldByName('DESCRIPCION').AsString := 'JUVENIL';
          5: CDS.FieldByName('DESCRIPCION').AsString := 'CONTRACTUAL';
          6: CDS.FieldByName('DESCRIPCION').AsString := 'CDAT';
      end;
      CDS.FieldByName('VALOR').AsCurrency := FieldByName('SALDO_ACTUAL').AsCurrency;
      CDS.Post;
      CDS.Close;
      Application.ProcessMessages;
      Next;
    end; // while
   end; // with
   Database.Close;
// FIN OCAÑA
end;

procedure TfrmReporteSegDepositos.Tab01Show(Sender: TObject);
begin
        CDS.Filtered := False;
        CDS.First;
        CDS.Filter := 'AGENCIA = 1';
        CDS.Filtered := True;
        DBChart1.RefreshData;
end;

procedure TfrmReporteSegDepositos.Tab02Show(Sender: TObject);
begin
        CDS.Filtered := False;
        CDS.First;
        CDS.Filter := 'AGENCIA = 2';
        CDS.Filtered := True;
        DBChart2.RefreshData;
end;

procedure TfrmReporteSegDepositos.Tab03Show(Sender: TObject);
begin
        CDS.Filtered := False;
        CDS.First;
        CDS.Filter := 'AGENCIA = 3';
        CDS.Filtered := True;
        DBChart3.RefreshData;
end;

procedure TfrmReporteSegDepositos.Tab04Show(Sender: TObject);
begin
        CDS.Filtered := False;
        CDS.First;
        CDS.Filter := 'AGENCIA = 4';
        CDS.Filtered := True;
        DBChart5.RefreshData;
end;

end.
