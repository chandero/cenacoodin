unit UnitInformeTesoreriaExcentasGMF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, IBCustomDataSet,
  IBQuery, IBDatabase, DateUtils, FR_Class, Math, FR_DSet, FR_DBSet, IBSQL,
  DBClient;

type
  TfrmInformeTesoreriaExcentasGMF = class(TForm)
    Panel1: TPanel;
    btnCerrar: TBitBtn;
    btnProcesar: TBitBtn;
    btnInforme: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdFecha1: TDateTimePicker;
    EdFecha2: TDateTimePicker;
    Label3: TLabel;
    EdTotalDescuento: TStaticText;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    Rpt01: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    IBQuery2: TIBQuery;
    IBSQL1: TIBSQL;
    CDSdescuento: TClientDataSet;
    CDSdescuentoID_AGENCIA: TIntegerField;
    CDSdescuentoID_TIPO_CAPTACION: TIntegerField;
    CDSdescuentoNUMERO_CUENTA: TIntegerField;
    CDSdescuentoDIGITO_CUENTA: TIntegerField;
    CDSdescuentoMOVIMIENTOS_CAPTACION: TCurrencyField;
    CDSdescuentoDESCUENTO_CAPTACION: TCurrencyField;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    edCuenta: TStaticText;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure EdFecha1Exit(Sender: TObject);
    procedure EdFecha2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInformeClick(Sender: TObject);
    procedure Rpt01GetValue(const ParName: String; var ParValue: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeTesoreriaExcentasGMF: TfrmInformeTesoreriaExcentasGMF;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmInformeTesoreriaExcentasGMF.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeTesoreriaExcentasGMF.btnProcesarClick(
  Sender: TObject);
var TotalDescuento:Currency;
    valoruvt,vecesuvt,valorgmf,gmf,valormaximoexcento:Currency;
    movimientocaptacion,descuentocaptacion :Currency;
    Total:Integer;
begin
        TotalDescuento := 0;

        if IBTransaction1.InTransaction then
             IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;

        with IBSQL1 do
        begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT VALOR_MINIMO FROM "gen$minimos" where ID_MINIMO = 12');
         try
          ExecQuery;
          valorgmf := FieldByName('VALOR_MINIMO').AsCurrency;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add('SELECT VALOR_MINIMO FROM "gen$minimos" where ID_MINIMO = 35');
         try
          ExecQuery;
          valoruvt := FieldByName('VALOR_MINIMO').AsCurrency;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add('SELECT VALOR_MINIMO FROM "gen$minimos" where ID_MINIMO = 36');
         try
          ExecQuery;
          vecesuvt := FieldByName('VALOR_MINIMO').AsCurrency;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;

        end; // del with ibsql1
        
        valormaximoexcento := vecesuvt * valoruvt;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('    SELECT');
          SQL.Add('      COUNT(*) AS CONTEO');
          SQL.Add('    FROM "cap$maestroexcentas"');
          SQL.Add('    WHERE');
          SQL.Add('      GMF = 1');
          Open;
          Total := FieldByName('CONTEO').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('    SELECT');
          SQL.Add('      ID_AGENCIA,');
          SQL.Add('      ID_TIPO_CAPTACION,');
          SQL.Add('      NUMERO_CUENTA,');
          SQL.Add('      DIGITO_CUENTA,');
          SQL.Add('      GMF');
          SQL.Add('    FROM "cap$maestroexcentas"');
          SQL.Add('    WHERE');
          SQL.Add('      GMF = 1');
          SQL.Add('    ORDER BY');
          SQL.Add('      ID_AGENCIA,');
          SQL.Add('      ID_TIPO_CAPTACION,');
          SQL.Add('      NUMERO_CUENTA,');
          SQL.Add('      DIGITO_CUENTA');
          try
           Open;
          except
           Transaction.Rollback;
           raise;
           Exit;
          end;

          ProgressBar1.Min := 0;
          ProgressBar1.Max := Total;
          ProgressBar1.Position := 0;

          while not Eof do
          begin
             ProgressBar1.Position := RecNo;
             edCuenta.Caption := FieldByName('NUMERO_CUENTA').AsString;
             Application.ProcessMessages;
             IBQuery2.Close;
             IBQuery2.SQL.Clear;
             IBQuery2.SQL.Add('      SELECT');
             IBQuery2.SQL.Add('        SUM(VALOR_CREDITO) AS CREDITO');
             IBQuery2.SQL.Add('      FROM');
             IBQuery2.SQL.Add('        "cap$extracto"');
             IBQuery2.SQL.Add('      WHERE');
             IBQuery2.SQL.Add('        ID_AGENCIA = :ID_AGENCIA and');
             IBQuery2.SQL.Add('        ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
             IBQuery2.SQL.Add('        NUMERO_CUENTA = :NUMERO_CUENTA and');
             IBQuery2.SQL.Add('        DIGITO_CUENTA = :DIGITO_CUENTA and');
             IBQuery2.SQL.Add('        ID_TIPO_MOVIMIENTO IN (2,4,17) and');
             IBQuery2.SQL.Add('        FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
             IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
             IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
             IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
             IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
             IBQuery2.ParamByName('FECHA1').AsDate := EdFecha1.Date;
             IBQuery2.ParamByName('FECHA2').AsDate := EdFecha2.Date;
             try
              IBQuery2.Open;
              if IBQuery2.RecordCount > 0 then
                movimientocaptacion := IBQuery2.FieldByName('CREDITO').AsCurrency
              else
                movimientocaptacion := 0;

              if movimientocaptacion <> 0 then
              begin
                  if movimientocaptacion > valormaximoexcento then
                    movimientocaptacion := valormaximoexcento;

                  descuentocaptacion :=  SimpleRoundTo(movimientocaptacion/1000*valorgmf,0);

                  CDSdescuento.Open;
                  CDSdescuento.Append;
                  CDSdescuento.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                  CDSdescuento.FieldByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  CDSdescuento.FieldByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  CDSdescuento.FieldByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  CDSdescuento.FieldByName('MOVIMIENTOS_CAPTACION').AsCurrency := movimientocaptacion;
                  CDSdescuento.FieldByName('DESCUENTO_CAPTACION').AsCurrency := descuentocaptacion;
                  CDSdescuento.Post;
                  CDSdescuento.Close;
              end;
             except
              Transaction.Rollback;
              raise;
              Exit;
             end;
             Next;
            end; // del while
          end;  // del with ibquery1


          CDSdescuento.Open;

          while not CDSdescuento.Eof do
          begin
             TotalDescuento := TotalDescuento + SimpleRoundTo(CDSdescuento.FieldByName('DESCUENTO_CAPTACION').AsCurrency,0);
             CDSdescuento.Next;
          end;
          EdTotalDescuento.Caption := FormatCurr('$#,0.00',TotalDescuento);
          CDSdescuento.First;
          btnProcesar.Enabled := False;
          btnInforme.Enabled := True;


end;

procedure TfrmInformeTesoreriaExcentasGMF.EdFecha1Exit(Sender: TObject);
begin
        if EdFecha1.Date > EdFecha2.Date then
           EdFecha1.Date := EdFecha2.Date;
end;

procedure TfrmInformeTesoreriaExcentasGMF.EdFecha2Exit(Sender: TObject);
begin
        if EdFecha2.Date < EdFecha1.Date then
           EdFecha2.Date := EdFecha1.Date;
end;

procedure TfrmInformeTesoreriaExcentasGMF.FormCreate(Sender: TObject);
begin
        EdFecha2.Date := fFechaActual;
        EdFecha1.Date := IncDay(fFechaActual,-7);
end;

procedure TfrmInformeTesoreriaExcentasGMF.btnInformeClick(Sender: TObject);
begin
        Rpt01.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reportes\repExcentasGMF.frf');
        if Rpt01.PrepareReport then
           Rpt01.ShowPreparedReport;
end;

procedure TfrmInformeTesoreriaExcentasGMF.Rpt01GetValue(
  const ParName: String; var ParValue: Variant);
begin
        if ParName = 'EMPRESA' then ParValue := Empresa
        else
        if ParName = 'NIT' then ParValue := Nit
        else
        if ParName = 'FECHA1' then ParValue := EdFecha1.Date
        else
        if ParName = 'FECHA2' then ParValue := EdFecha2.Date
        else
        if ParName = 'FECHA' then ParValue := fFechaActual
        else
        if ParName = 'OFICINA' then ParValue := Ciudad;

end;

end.
