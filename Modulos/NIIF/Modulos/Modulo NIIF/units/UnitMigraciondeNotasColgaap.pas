unit UnitMigraciondeNotasColgaap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, UnitdmGeneral;

type
  TfrmMigraciondeNotasColgaap = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edFechaDesde: TDateTimePicker;
    Label2: TLabel;
    edFechaHasta: TDateTimePicker;
    Panel2: TPanel;
    CmdCerrar: TBitBtn;
    btnProcesar: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    edComprobante: TEdit;
    pgb: TProgressBar;
    IBQcomprobante: TIBQuery;
    IBQauxiliar: TIBQuery;
    IBQcodigo: TIBQuery;
    IBQinscomprobante: TIBQuery;
    IBQinsauxiliar: TIBQuery;
    pgb2: TProgressBar;
    IBQbuscacomprobante: TIBQuery;
    procedure btnProcesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMigraciondeNotasColgaap: TfrmMigraciondeNotasColgaap;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses DateUtils, UnitGlobales;

procedure TfrmMigraciondeNotasColgaap.btnProcesarClick(Sender: TObject);
begin
        if (edFechaDesde.Date > edFechaHasta.Date) then
        begin
           ShowMessage('Rango de Fechas Invalido!!, por favor verifique');
           Exit;
        end;

        if (MessageDlg('Seguro de Realizar la Migración de Notas del Periodo Seleccionado?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
        begin
            btnProcesar.Enabled := False;
            IBQcomprobante.Close;
            IBQcomprobante.ParamByName('FECHADESDE').AsDate := edFechaDesde.Date;
            IBQcomprobante.ParamByName('FECHAHASTA').AsDate := edFechaHasta.Date;
            IBQcomprobante.Open;
            IBQcomprobante.Last;
            IBQcomprobante.First;

            pgb.Min := 0;
            pgb.Max := IBQcomprobante.RecordCount;
            pgb.Position := 0;

            while not IBQcomprobante.Eof do
            begin

              pgb.Position := IBQcomprobante.RecNo;
              Application.ProcessMessages;
              edComprobante.Text := InttoStr(IBQcomprobante.FieldByName('ID_COMPROBANTE').AsInteger) + ' ' + IBQcomprobante.FieldByName('DESCRIPCION').AsString;
                // Verificar que comprobante no hay sido migrado
              IBQbuscacomprobante.Close;
              IBQbuscacomprobante.ParamByName('TIPO_COMPROBANTE').AsString := '1';
              IBQbuscacomprobante.ParamByName('ID_COMPROBANTE').AsInteger := IBQcomprobante.FieldByName('ID_COMPROBANTE').AsInteger;
              IBQbuscacomprobante.Open;
              if (IBQbuscacomprobante.RecordCount < 1) then
              begin

                // Insertar Comprobante
                IBQinscomprobante.Close;
                IBQinscomprobante.ParamByName('TIPO_COMPROBANTE').AsString := '1';
                IBQinscomprobante.ParamByName('ID_COMPROBANTE').AsInteger := IBQcomprobante.FieldByName('ID_COMPROBANTE').AsInteger;
                IBQinscomprobante.ParamByName('ID_AGENCIA').AsInteger := IBQcomprobante.FieldByName('ID_AGENCIA').AsInteger;
                IBQinscomprobante.ParamByName('TIPO_COMPROBANTE').AsString := IBQcomprobante.FieldByName('TIPO_COMPROBANTE').AsString;
                IBQinscomprobante.ParamByName('FECHADIA').AsDateTime := IBQcomprobante.FieldByName('FECHADIA').AsDateTime;
                IBQinscomprobante.ParamByName('DESCRIPCION').AsString := IBQcomprobante.FieldByName('DESCRIPCION').AsString;
                IBQinscomprobante.ParamByName('TOTAL_DEBITO').AsCurrency := IBQcomprobante.FieldByName('TOTAL_DEBITO').AsCurrency;
                IBQinscomprobante.ParamByName('TOTAL_CREDITO').AsCurrency := IBQcomprobante.FieldByName('TOTAL_CREDITO').AsCurrency;
                IBQinscomprobante.ParamByName('ESTADO').AsString := IBQcomprobante.FieldByName('ESTADO').AsString;
                IBQinscomprobante.ParamByName('IMPRESO').AsInteger := IBQcomprobante.FieldByName('IMPRESO').AsInteger;
                IBQinscomprobante.ParamByName('ANULACION').AsString := IBQcomprobante.FieldByName('ANULACION').AsString;
                IBQinscomprobante.ParamByName('ID_EMPLEADO').AsString := IBQcomprobante.FieldByName('ID_EMPLEADO').AsString;                
                IBQinscomprobante.ExecSQL;

                // Buscar Detallado Comprobante
                IBQauxiliar.Close;
                IBQauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := IBQcomprobante.FieldByName('ID_COMPROBANTE').AsInteger;
                //IBQauxiliar.ParamByName('TIPO_COMPROBANTE').AsString := '1';
                IBQauxiliar.Open;
                IBQauxiliar.Last;
                IBQauxiliar.First;

                pgb2.Min := 0;
                pgb2.Max := ibqauxiliar.RecordCount;
                pgb2.Position := 0;

                while not IBQauxiliar.Eof do
                begin
                    pgb2.Position := IBQauxiliar.RecNo;
                    Application.ProcessMessages;

                    IBQcodigo.Close;
                    IBQcodigo.ParamByName('COLGAAP').AsString := IBQauxiliar.FieldByName('CODIGO').AsString;
                    IBQcodigo.Open;
                    IBQcodigo.Last;
                    IBQcodigo.First;
                    if (IBQcodigo.RecordCount > 0) then
                       while not IBQcodigo.Eof do
                       begin
                        IBQinsauxiliar.Close;
                        IBQinsauxiliar.ParamByName('TIPO_COMPROBANTE').AsString := '1';
                        IBQinsauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := IBQauxiliar.FieldByName('ID_COMPROBANTE').AsInteger;
                        IBQinsauxiliar.ParamByName('ID_AGENCIA').AsInteger := IBQauxiliar.FieldByName('ID_AGENCIA').AsInteger;
                        IBQinsauxiliar.ParamByName('FECHA').AsDateTime := IBQauxiliar.FieldByName('FECHA').AsDateTime;
                        IBQinsauxiliar.ParamByName('CODIGO').AsString := IBQcodigo.FieldByName('NIIF').AsString;
                        IBQinsauxiliar.ParamByName('DEBITO').AsCurrency := IBQauxiliar.FieldByName('DEBITO').AsCurrency * (IBQcodigo.FieldByName('PORCENTAJE').AsCurrency / 100);
                        IBQinsauxiliar.ParamByName('CREDITO').AsCurrency := IBQauxiliar.FieldByName('CREDITO').AsCurrency * (IBQcodigo.FieldByName('PORCENTAJE').AsCurrency / 100);
                        IBQinsauxiliar.ParamByName('ID_CUENTA').AsString := IBQauxiliar.FieldByName('ID_CUENTA').AsString;
                        IBQinsauxiliar.ParamByName('ID_COLOCACION').AsString := IBQauxiliar.FieldByName('ID_COLOCACION').AsString;
                        IBQinsauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQauxiliar.FieldByName('ID_IDENTIFICACION').AsInteger;
                        IBQinsauxiliar.ParamByName('ID_PERSONA').AsString := IBQauxiliar.FieldByName('ID_PERSONA').AsString;
                        IBQinsauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := IBQauxiliar.FieldByName('MONTO_RETENCION').AsCurrency;
                        IBQinsauxiliar.ParamByName('TASA_RETENCION').AsFloat := IBQauxiliar.FieldByName('TASA_RETENCION').AsFloat;
                        IBQinsauxiliar.ParamByName('ESTADOAUX').AsString := IBQauxiliar.FieldByName('ESTADOAUX').AsString;
                        IBQinsauxiliar.ExecSQL;

                        IBQcodigo.Next;

                      end  // fin while IBcodigo
                    else
                    begin
                        // Que pasa si no hay codigo paralelo, dejar el mismo código
                        IBQinsauxiliar.Close;
                        IBQinsauxiliar.ParamByName('TIPO_COMPROBANTE').AsString := '1';                        
                        IBQinsauxiliar.ParamByName('ID_COMPROBANTE').AsInteger := IBQauxiliar.FieldByName('ID_COMPROBANTE').AsInteger;
                        IBQinsauxiliar.ParamByName('ID_AGENCIA').AsInteger := IBQauxiliar.FieldByName('ID_AGENCIA').AsInteger;
                        IBQinsauxiliar.ParamByName('FECHA').AsDateTime := IBQauxiliar.FieldByName('FECHA').AsDateTime;
                        IBQinsauxiliar.ParamByName('CODIGO').AsString := IBQauxiliar.FieldByName('CODIGO').AsString;
                        IBQinsauxiliar.ParamByName('DEBITO').AsCurrency := IBQauxiliar.FieldByName('DEBITO').AsCurrency;
                        IBQinsauxiliar.ParamByName('CREDITO').AsCurrency := IBQauxiliar.FieldByName('CREDITO').AsCurrency;
                        IBQinsauxiliar.ParamByName('ID_CUENTA').AsString := IBQauxiliar.FieldByName('ID_CUENTA').AsString;
                        IBQinsauxiliar.ParamByName('ID_COLOCACION').AsString := IBQauxiliar.FieldByName('ID_COLOCACION').AsString;
                        IBQinsauxiliar.ParamByName('ID_IDENTIFICACION').AsInteger := IBQauxiliar.FieldByName('ID_IDENTIFICACION').AsInteger;
                        IBQinsauxiliar.ParamByName('ID_PERSONA').AsString := IBQauxiliar.FieldByName('ID_PERSONA').AsString;
                        IBQinsauxiliar.ParamByName('MONTO_RETENCION').AsCurrency := IBQauxiliar.FieldByName('MONTO_RETENCION').AsCurrency;
                        IBQinsauxiliar.ParamByName('TASA_RETENCION').AsFloat := IBQauxiliar.FieldByName('TASA_RETENCION').AsFloat;
                        IBQinsauxiliar.ParamByName('ESTADOAUX').AsString := IBQauxiliar.FieldByName('ESTADOAUX').AsString;
                        IBQinsauxiliar.ExecSQL;
                    end;  // fin If IBcodigo
                    IBQauxiliar.Next;
                end; // fin if IBQauxiliar
             end; // end if ibqbuscacomprobante
                IBQcomprobante.Next;
            end;
            IBQcomprobante.Transaction.Commit;
            ShowMessage('Proceso Finalizado con Exito!!');
        end;
end;

procedure TfrmMigraciondeNotasColgaap.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQcomprobante.Database := dmGeneral.IBDatabase1;
        IBQauxiliar.Database := dmGeneral.IBDatabase1;
        IBQcodigo.Database := dmGeneral.IBDatabase1;
        IBQinscomprobante.Database := dmGeneral.IBDatabase1;
        IBQinsauxiliar.Database := dmGeneral.IBDatabase1;
        IBQbuscacomprobante.Database := dmGeneral.IBDatabase1;

        IBQcomprobante.Transaction := dmGeneral.IBTransaction1;
        IBQauxiliar.Transaction := dmGeneral.IBTransaction1;
        IBQcodigo.Transaction := dmGeneral.IBTransaction1;
        IBQinscomprobante.Transaction := dmGeneral.IBTransaction1;
        IBQinsauxiliar.Transaction := dmGeneral.IBTransaction1;
        IBQbuscacomprobante.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmMigraciondeNotasColgaap.FormShow(Sender: TObject);
var
  FechaHoy :TDateTime;
begin
        FechaHoy := fFechaActual;
        TryEncodeDate(YearOf(FechaHoy), MonthOf(FechaHoy), 01, FechaHoy);
        edFechaDesde.Date := FechaHoy;
        TryEncodeDate(YearOf(FechaHoy), MonthOf(FechaHoy), DaysInAMonth(YearOf(FechaHoy), MonthOf(FechaHoy)), FechaHoy);
        edFechaHasta.Date := FechaHoy;
end;

procedure TfrmMigraciondeNotasColgaap.CmdCerrarClick(Sender: TObject);
begin
        dmGeneral.Free;
        Close;
end;

end.
