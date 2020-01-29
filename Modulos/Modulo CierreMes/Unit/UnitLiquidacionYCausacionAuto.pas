unit UnitLiquidacionYCausacionAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, IBStoredProc, IB, DBClient, IBDatabase, IBCustomDataSet, IBSQL, DB,
  StdCtrls, ComCtrls, Math, Buttons;

type
  TfrmLiquidacionYCausacionAuto = class(TForm)
    Label1: TLabel;
    edCaptacion: TEdit;
    Label2: TLabel;
    edEstado: TEdit;
    progreso: TProgressBar;
    IBTotalCaptaciones: TIBStoredProc;
    IBTotalCaptacionesTOTAL: TIntegerField;
    CmdCerrar: TBitBtn;
    CDStemp: TClientDataSet;
    CDStempID_AGENCIA: TIntegerField;
    CDStempID_TIPO_CAPTACION: TIntegerField;
    CDStempNUMERO_CUENTA: TIntegerField;
    CDStempDIGITO_CUENTA: TIntegerField;
    CDStempID_IDENTIFICACION: TIntegerField;
    CDStempID_PERSONA: TStringField;
    CDStempNOMBRE: TStringField;
    CDStempSALDO_ACTUAL: TCurrencyField;
    CDStempSALDO_LIQUIDACION: TCurrencyField;
    CDStempINTERES: TCurrencyField;
    CDStempRETENCION: TCurrencyField;
    CDStempID_TIPO_CAPTACION_ABONO: TIntegerField;
    CDStempNUMERO_CUENTA_ABONO: TIntegerField;
    CDStempTASA_LIQUIDACION: TFloatField;
    CDStempDIAS: TIntegerField;
    CDStempCAUSADO: TCurrencyField;
    CDStempRETEINTERES: TCurrencyField;
    CDStempRETECAUSADO: TCurrencyField;
    CDStempNETO: TCurrencyField;
    CDStempTOTALINTERES: TAggregateField;
    CDStempTOTALRETENCION: TAggregateField;
    CDStempTOTALCAUSADO: TAggregateField;
    CDStempTOTALRETEINTERES: TAggregateField;
    CDStempTOTALRETECAUSADO: TAggregateField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure ProcesarAhorros;
  public
    { Public declarations }
  end;

var
  frmLiquidacionYCausacionAuto: TfrmLiquidacionYCausacionAuto;
  _queryCaptacion, _queryRetefuente, _queryDiasLiquidados : TIBQuery;
  _queryALiquidar: TIBQuery;
  _queryProcedure : TIBStoredProc;
  _transaction: TIBTransaction;
  _fechaProceso: TDate;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitCaptaciones, UnitGlobalesCol, UnitGlobales;

procedure TfrmLiquidacionYCausacionAuto.FormCreate(Sender: TObject);
begin
        _queryCaptacion := TIBQuery.Create(self);
        _queryRetefuente := TIBQuery.Create(self);
        _queryDiasLiquidados := TIBQuery.Create(self);
        _queryALiquidar := TIBQuery.Create(self);
        _queryProcedure := TIBStoredProc.Create(self);
        _transaction := TIBTransaction.Create(self);

        _transaction.DefaultDatabase := dmGeneral.IBDatabase1;

        _queryCaptacion.Database := dmGeneral.IBDatabase1;
        _queryRetefuente.Database := dmGeneral.IBDatabase1;
        _queryDiasLiquidados.Database := dmGeneral.IBDatabase1;
        _queryALiquidar.Database := dmGeneral.IBDatabase1;
        _queryProcedure.Database := dmGeneral.IBDatabase1;
        
        _queryCaptacion.Transaction := _transaction;
        _queryRetefuente.Transaction := _transaction;
        _queryALiquidar.Transaction := _transaction;
        _queryDiasLiquidados.Transaction := _transaction;
        _queryProcedure.Transaction := _transaction;
        
end;

procedure TfrmLiquidacionYCausacionAuto.ProcesarAhorros;
var
  DiarioR: Currency;
  TasaR: Extended;
  MinCaptacion,MaxCaptacion:Integer;
  Ag,Numero,Digito:Integer;
  L:tInteres;
  FechaCorte: TDate;
  tipo: Integer;
  cada: Integer;
  interes, TasaN: Double;
  SaldoMinimo: Currency;
begin
        Application.ProcessMessages;
        with _queryRetefuente do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select DIARIO_RETEFUENTE, TASA_RETEFUENTE from "gen$valorretefuente" WHERE ID_RETEFUENTE = :ID_RETEFUENTE');
             ParamByName('ID_RETEFUENTE').AsInteger := 1;
             try
                Open;
                DiarioR := FieldByName('DIARIO_RETEFUENTE').AsCurrency;
                TasaR := FieldByName('TASA_RETEFUENTE').AsFloat;
             except
                DiarioR := 0;
                TasaR := 0;
             end;
             Close;
        end;

        cada := 1;

        _queryCaptacion.SQL.Clear;
        _queryCaptacion.SQL.Add('SELECT * FROM "cap$tipocaptacion" a WHERE a.ID_FORMA = :ID_FORMA');
        _queryCaptacion.ParamByName('ID_FORMA').AsInteger := 2;
        _queryCaptacion.Open;

        while not _queryCaptacion.Eof do
        begin
          edCaptacion.Text := _queryCaptacion.FieldByName('DESCRIPCION').AsString;
          // Inicio Ciclo Captacion
          tipo := _queryCaptacion.FieldByName('ID_TIPO_CAPTACION').AsInteger;
          MinCaptacion := 1;
          MaxCaptacion := 1;
          Application.ProcessMessages;
          FechaCorte := _fechaProceso;
          interes := _queryCaptacion.FieldByName('INTERES_EFECTIVO').AsFloat;
          SaldoMinimo := _queryCaptacion.FieldByName('SALDO_MINIMO_PARA_INTERES').AsCurrency;
          cada:= _queryCaptacion.FieldByName('INTERES_CADA').AsInteger;
          TasaN := TasaNominalVencida(interes,30);
          with _queryProcedure do
          begin
              StoredProcName := 'P_CAP_0001';
              ParamByName('ID').AsInteger := tipo;
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Prepare;
                 ExecProc;
                 Screen.Cursor := crDefault;
              except
                 EdEstado.Text := 'Error Localizando Captaciones a Liquidar';
                 Continue;
              end;
              MaxCaptacion := ParamByName('TOTAL').AsInteger;
              if MaxCaptacion = 0 then
              begin
                 edEstado.Text := 'No existen captaciones a las cuales liquidarles intereses';
                 Continue;
              end;
              Close;
// Crear Tabla Temporal
//              frmProgreso.InfoLabel := 'Creando Tabla Temporal';
          end;

          edEstado.Text := 'Iniciando Proceso de Liquidación';

          with _queryALiquidar do
          begin
              SQL.Clear;
              SQL.Add('SELECT ');
              SQL.Add('* FROM P_CAP_0002 (:ID)');
              ParamByName('ID').AsInteger := tipo;
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Open;
                 Screen.Cursor := crDefault;
              except
                 EdEstado.Text := 'Error Localizando Captaciones a Liquidar';
                 Continue;
              end;

              progreso.Min  := MinCaptacion;
              progreso.Max := MaxCaptacion;
              progreso.Position:= 1;
              Screen.Cursor := crHourGlass;
              CmdCerrar.Enabled := False;
              CDStemp.Open;
              CDStemp.EmptyDataSet;

              while not Eof do
              begin
                Application.ProcessMessages;
                edEstado.Text := 'Liquidando Captacion:' + IntToStr(tipo) + '-' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                         Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                         IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Numero := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                progreso.Position := RecNo;
                case cada of
                  1: begin
                       L := InteresDiario(ag,tipo,numero,digito,FechaCorte,TasaN,SaldoMinimo,DiarioR,TasaR);
                       CDSTemp.Insert;
                       CDStempID_AGENCIA.Value := Ag;
                       CDStempID_TIPO_CAPTACION.Value := tipo;
                       CDStempNUMERO_CUENTA.Value := Numero;
                       CDStempDIGITO_CUENTA.Value := Digito;
                       CDStempID_IDENTIFICACION.Value := FieldByName('ID_IDENTIFICACION').AsInteger;
                       CDStempID_PERSONA.Value := FieldByName('ID_PERSONA').AsString;
                       CDStempNOMBRE.Value := FieldbyName('PRIMER_APELLIDO').AsString + ' ' +
                                              FieldbyName('SEGUNDO_APELLIDO').AsString + ' ' +
                                              FieldbyName('NOMBRE').AsString;
                       CDStempSALDO_ACTUAL.Value := L.SaldoAFecha;
                       CDStempSALDO_LIQUIDACION.Value := L.SaldoLiquidacion;
                       CDStempCAUSADO.Value := 0;
                       CDStempRETEINTERES.Value := 0;
                       CDStempRETECAUSADO.Value := 0;
                       CDStempINTERES.Value := L.Interes;
                       if not InttoBoolean(FieldByName('RETEFUENTE').AsInteger) then
                          L.Retencion := 0;
                       CDStempRETENCION.Value := L.Retencion;
                       if (L.Interes > 0) then
                         CDStemp.Post
                       else
                         CDStemp.Cancel;
                     end;
                end;
                Next;
              end;

              Close;
              Screen.Cursor := crDefault;
              // CmdLiquidar.Enabled := False;
              // CmdVer.Enabled := True;

          end;

          edEstado.Text := 'Proceso de Liquidación Culminado con Exito!';

          // Continuación Ciclo _queryCaptacion
          _queryCaptacion.Next;

        end;
        _transaction.Commit;
        CmdCerrar.Enabled := True;
end;

procedure TfrmLiquidacionYCausacionAuto.FormShow(Sender: TObject);
begin
        _transaction.StartTransaction;
        _fechaProceso := fFechaActual;
        
end;

procedure TfrmLiquidacionYCausacionAuto.CmdCerrarClick(Sender: TObject);
begin
       Close;
end;

procedure TfrmLiquidacionYCausacionAuto.FormActivate(Sender: TObject);
begin
        ProcesarAhorros;
end;

end.
