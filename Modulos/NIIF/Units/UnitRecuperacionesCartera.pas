unit UnitRecuperacionesCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBClient, IBSQL, DateUtils ,
  FR_DSet, FR_DBSet, FR_Class, frOLEExl,Grids, DBGrids;

type
  TfrmRecuperacionesCartera = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdFechaCorte: TDateTimePicker;
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdCerrar: TBitBtn;
    CDRecupera: TClientDataSet;
    CDRecuperaID_AGENCIA: TSmallintField;
    CDRecuperaID_COLOCACION: TStringField;
    CDRecuperaID_CLASIFICACION: TSmallintField;
    CDRecuperaID_GARANTIA: TSmallintField;
    CDRecuperaID_EDAD: TStringField;
    CDRecuperaID_ARRASTRE: TStringField;
    CDRecuperaKREC: TCurrencyField;
    CDRecuperaIREC: TCurrencyField;
    CDRecuperaCREC: TCurrencyField;
    CDRecuperaFECHA: TDateField;
    CDRecuperaCBTE: TIntegerField;
    CDRecuperaCUOTA: TIntegerField;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    Reporte: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    Acumulado: TCheckBox;
    Label2: TLabel;
    BtnExportar: TBitBtn;
    SaveD1: TSaveDialog;
    CdCausacion: TClientDataSet;
    SmallintField1: TSmallintField;
    StringField1: TStringField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    StringField2: TStringField;
    StringField3: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    DateField1: TDateField;
    CDExtracto: TClientDataSet;
    SmallintField4: TSmallintField;
    StringField5: TStringField;
    DateField2: TDateField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    CurrencyField12: TCurrencyField;
    CurrencyField13: TCurrencyField;
    CurrencyField14: TCurrencyField;
    CurrencyField15: TCurrencyField;
    CurrencyField16: TCurrencyField;
    CDRecuperaVCUOTA: TCurrencyField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    CDRecuperaFECHACORTE: TDateField;
    CmdReporte: TBitBtn;
    CDRecuperaCLASIFICACION: TStringField;
    procedure FormShow(Sender: TObject);
    procedure cmdProcesarClick(Sender: TObject);
    procedure ReporteGetValue(const ParName: String;
      var ParValue: Variant);
    procedure cmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnExportarClick(Sender: TObject);
    procedure CmdReporteClick(Sender: TObject);
  private
    procedure ImprimirReporte(cadena:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecuperacionesCartera: TfrmRecuperacionesCartera;
  DescAgencia:string;

implementation

{$R *.dfm}

uses UnitdmGeneral, UnitImpresion, UnitGlobales, DataSetToExcel;

procedure TfrmRecuperacionesCartera.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := fFechaActual;
        with IBSQL1 do begin
          if Transaction.InTransaction then
            Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA = :ID');
          ParamByName('ID').AsInteger := Agencia;
          ExecQuery;
          DescAgencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
          Close;
        end;
end;

procedure TfrmRecuperacionesCartera.cmdProcesarClick(Sender: TObject);
var Control:Boolean;
PagAnt:string;
begin
        CDRecupera.CancelUpdates;
        with IBSQL1 do begin
          if Transaction.InTransaction then
            Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT "col$causaciondiaria".FECHA_CORTE, "col$causaciondiaria".ID_AGENCIA,');
          SQL.Add('"col$causaciondiaria".ID_COLOCACION,');
          SQL.Add('"col$causaciondiaria".ID_CLASIFICACION,');
          SQL.Add('"col$causaciondiaria".ID_GARANTIA,');
          SQL.Add('"col$causaciondiaria".ID_EDAD_ANT,');
          SQL.Add('"col$causaciondiaria".ID_ARRASTRE,');
          SQL.Add('"col$causaciondiaria".PCAPITAL_REC,');
          SQL.Add('"col$causaciondiaria".PINTERES_REC,');
          SQL.Add('"col$causaciondiaria".PCOSTAS_REC,');
          SQL.Add('"col$causacionescontrol".ID_COMPROBANTE,');
          SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION');
          SQL.Add('FROM "col$causaciondiaria"');
          SQL.Add('left join "col$causacionescontrol" on ("col$causaciondiaria".FECHA_CORTE = "col$causacionescontrol".FECHA)');
          SQL.Add('inner join "col$clasificacion" on ("col$causaciondiaria".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          SQL.Add('WHERE');
          if Acumulado.Checked then
            SQL.Add('("col$causaciondiaria".FECHA_CORTE between :FECHA1 AND :FECHA) AND')
          else
            SQL.Add('("col$causaciondiaria".FECHA_CORTE = :FECHA) AND');
          SQL.Add('(("col$causaciondiaria".PCAPITAL_REC > 0) OR');
          SQL.Add('("col$causaciondiaria".PINTERES_REC > 0) OR');
          SQL.Add('("col$causaciondiaria".PCOSTAS_REC > 0))');
          SQL.Add('ORDER BY ID_COLOCACION ASC');
          if Acumulado.Checked then
            ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
          ParamByName('FECHA').AsDate := EdFechaCorte.Date;
          ExecQuery;
          while not IBSQL1.Eof do begin
            CDRecupera.Append;
            CDRecupera.FieldValues['ID_AGENCIA'] := FieldByName('ID_AGENCIA').AsInteger;
            CDRecupera.FieldValues['ID_COLOCACION'] := FieldByName('ID_COLOCACION').AsString;
            CDRecupera.FieldValues['ID_CLASIFICACION'] := FieldByName('ID_CLASIFICACION').AsString;
            CDRecupera.FieldValues['ID_GARANTIA'] := FieldByName('ID_GARANTIA').AsInteger;
            CDRecupera.FieldValues['ID_EDAD'] := FieldByName('ID_EDAD_ANT').AsString;
            CDRecupera.FieldValues['ID_ARRASTRE'] := FieldByName('ID_ARRASTRE').AsString;
            CDRecupera.FieldValues['KREC'] := FieldByName('PCAPITAL_REC').AsCurrency;
            CDRecupera.FieldValues['IREC'] := FieldByName('PINTERES_REC').AsCurrency;
            CDRecupera.FieldValues['CREC'] := FieldByName('PCOSTAS_REC').AsCurrency;
            CDRecupera.FieldValues['FECHA'] := FieldByName('FECHA_CORTE').AsDate;
            CDRecupera.FieldValues['CBTE'] := 0; //FieldByName('ID_COMPROBANTE').AsInteger;
            CDRecupera.FieldValues['CUOTA'] := 0;
            CDRecupera.FieldValues['VCUOTA'] := 0;
            CDRecupera.FieldValues['FECHACORTE'] := FieldByName('FECHA_CORTE').AsDate;
            CDRecupera.FieldValues['CLASIFICACION'] := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
            CDRecupera.Post;

            Application.ProcessMessages;

            IBSQL2.Close;
            IBSQL2.SQL.Clear;
            IBSQL2.SQL.Add('SELECT "col$extracto".FECHA_EXTRACTO,');
            IBSQL2.SQL.Add('"col$extracto".ID_CBTE_COLOCACION,');
            IBSQL2.SQL.Add('"col$extracto".CUOTA_EXTRACTO,');
            IBSQL2.SQL.Add('("col$extracto".ABONO_CAPITAL+"col$extracto".ABONO_CXC+"col$extracto".ABONO_ANTICIPADO+');
            IBSQL2.SQL.Add('"col$extracto".ABONO_SERVICIOS+"col$extracto".ABONO_MORA) AS ABONO');
            IBSQL2.SQL.Add('FROM "col$extracto" WHERE');
            IBSQL2.SQL.Add('("col$extracto".FECHA_EXTRACTO BETWEEN :FECHA1 AND :FECHA2) AND');
            IBSQL2.SQL.Add('"col$extracto".ID_AGENCIA = :ID_AGENCIA AND');
            IBSQL2.SQL.Add('"col$extracto".ID_COLOCACION = :ID_COLOCACION');
            IBSQL2.ParamByName('ID_AGENCIA').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
            IBSQL2.ParamByName('ID_COLOCACION').AsString := IBSQL1.FieldByName('ID_COLOCACION').AsString;
            if Acumulado.Checked then
              IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(IBSQL1.FieldByName('FECHA_CORTE').AsDate),MonthOf(IBSQL1.FieldByName('FECHA_CORTE').AsDate),01)
            else
              IBSQL2.ParamByName('FECHA1').AsDate := RecodeDay(IBSQL1.FieldByName('FECHA_CORTE').AsDate,01);
            IBSQL2.ParamByName('FECHA2').AsDate := RecodeDay(IBSQL1.FieldByName('FECHA_CORTE').AsDate,Dayof(EndOfAMonth(YearOf(IBSQL1.FieldByName('FECHA_CORTE').AsDate),MonthOf(IBSQL1.FieldByName('FECHA_CORTE').AsDate))));
            IBSQL2.ExecQuery;
            Control := False;
            if IBSQL2.RecordCount > 0 then begin
              while not IBSQL2.Eof do begin
               if Control then begin
                CDRecupera.Append;
                CDRecupera.FieldValues['ID_AGENCIA'] := FieldByName('ID_AGENCIA').AsInteger;
                CDRecupera.FieldValues['ID_COLOCACION'] := FieldByName('ID_COLOCACION').AsString;
                CDRecupera.FieldValues['ID_CLASIFICACION'] := FieldByName('ID_CLASIFICACION').AsString;
                CDRecupera.FieldValues['ID_GARANTIA'] := FieldByName('ID_GARANTIA').AsInteger;
                CDRecupera.FieldValues['ID_EDAD'] := FieldByName('ID_EDAD_ANT').AsString;
                CDRecupera.FieldValues['ID_ARRASTRE'] := FieldByName('ID_ARRASTRE').AsString;
                CDRecupera.FieldValues['KREC'] := 0;//FieldByName('PCAPITAL_REC').AsCurrency;
                CDRecupera.FieldValues['IREC'] := 0;//FieldByName('PINTERES_REC').AsCurrency;
                CDRecupera.FieldValues['CREC'] := 0;//FieldByName('PCOSTAS_REC').AsCurrency;
                CDRecupera.FieldValues['FECHA'] := IBSQL2.FieldByName('FECHA_EXTRACTO').AsDate;
                CDRecupera.FieldValues['CBTE'] := IBSQL2.FieldByName('ID_CBTE_COLOCACION').AsInteger;
                CDRecupera.FieldValues['CUOTA'] := IBSQL2.FieldByName('CUOTA_EXTRACTO').AsInteger;
                CDRecupera.FieldValues['VCUOTA'] := IBSQL2.FieldByName('ABONO').AsCurrency;
                CDRecupera.FieldValues['FECHACORTE'] := FieldByName('FECHA_CORTE').AsDate;
                CDRecupera.FieldValues['CLASIFICACION'] := FieldByName('DESCRIPCION_CLASIFICACION').AsString;                
                CDRecupera.Post;
                Control := False;
               end
               else
               begin
                CDRecupera.Edit;
                CDRecupera.FieldValues['FECHA'] := IBSQL2.FieldByName('FECHA_EXTRACTO').AsDate;
                CDRecupera.FieldValues['CBTE'] := IBSQL2.FieldByName('ID_CBTE_COLOCACION').AsInteger;
                CDRecupera.FieldValues['CUOTA'] := IBSQL2.FieldByName('CUOTA_EXTRACTO').AsInteger;
                CDRecupera.FieldValues['VCUOTA'] := IBSQL2.FieldByName('ABONO').AsCurrency;
                CDRecupera.Post;
                Control := True;                
               end;
               IBSQL2.Next;
              end; //Fin while IBSQL2
            end
            else
            begin
              CDRecupera.Edit;
              CDRecupera.FieldValues['FECHA'] := IBSQL1.FieldByName('FECHA_CORTE').AsDate;
              CDRecupera.FieldValues['CBTE'] := IBSQL1.FieldByName('ID_COMPROBANTE').AsInteger;
              CDRecupera.FieldValues['CUOTA'] := 0;
              CDRecupera.FieldValues['VCUOTA'] := IBSQL1.FieldByName('PCAPITAL_REC').AsCurrency + IBSQL1.FieldByName('PINTERES_REC').AsCurrency + IBSQL1.FieldByName('PCOSTAS_REC').AsCurrency;
              CDRecupera.Post;
            end;
            IBSQL1.Next;
          end;  //fin de While IBSQL1
        end; // fIN DE WITH
        MessageDlg('Proceso Terminado con Exito',mtConfirmation,[mbok],0);
        CmdReporte.Enabled := True;
        BtnExportar.Enabled := True;
end;

procedure TfrmRecuperacionesCartera.ImprimirReporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        Reporte.LoadFromFile(cadena);
        Reporte.Preview := FrmImpresion.frPreview1;
        Reporte.ShowReport;
        FrmImpresion.ShowModal;
end;

procedure TfrmRecuperacionesCartera.ReporteGetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'Empresa' then ParValue := Empresa;
        if ParName = 'Nit' then ParValue := Nit;
        if ParName = 'FechaCorte' then ParValue := DateToStr(EdFechaCorte.Date);
        if ParName = 'Empleado' then ParValue := Nombres + ' ' + Apellidos;
        if ParName = 'Agencia' then ParValue := DescAgencia;
end;

procedure TfrmRecuperacionesCartera.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmRecuperacionesCartera.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRecuperacionesCartera.BtnExportarClick(Sender: TObject);
var  ExcelFile:TDataSetToExcel;
begin
        if SaveD1.Execute then
        begin
          CDRecupera.First;
          ExcelFile := TDataSetToExcel.Create(CDRecupera,SaveD1.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

procedure TfrmRecuperacionesCartera.CmdReporteClick(Sender: TObject);
begin
        Empleado;
        ImprimirReporte(ExtractFilePath(Application.ExeName)+'\Reporte\RepRecuperaCartera1.frf');
end;

end.
