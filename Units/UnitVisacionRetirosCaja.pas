unit UnitVisacionRetirosCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvLabel, JvBlinkingLabel, Buttons, ExtCtrls,
  IBDatabase, IBSQL, IBEvents;

type
  TfrmVisacionRetirosCaja = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LblInfo: TJvBlinkingLabel;
    Panel1: TPanel;
    btnAnular: TBitBtn;
    IBTRetiro: TIBTransaction;
    IBSQL1: TIBSQL;
    IBEvents1: TIBEvents;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure IBEvents1EventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure btnAnularClick(Sender: TObject);
  private
    FIdCaja:Integer;
    FIdAgencia:Integer;
    FIdTipoCaptacion:Integer;
    FNumeroCuenta:Integer;
    FDigitoCuenta:Integer;
    FNumeroTalon:Integer;
    FValorRetiro:Currency;
    FFechaIngreso:TDate;
    FHoraIngreso:TTime;
    { Private declarations }
  public
    property IdCaja:Integer read FIdCaja Write FIdCaja;
    property IdAgencia:Integer read FIdAgencia Write FIdAgencia;
    property IdTipoCaptacion:Integer read FIdTipoCaptacion Write FIdTipoCaptacion;
    property NumeroCuenta:Integer read FNumeroCuenta Write FNumeroCuenta;
    property DigitoCuenta:Integer read FDigitoCuenta Write FDigitoCuenta;
    property NumeroTalon:Integer read FNumeroTalon Write FNumeroTalon;
    property ValorRetiro:Currency read FValorRetiro Write FValorRetiro; 
    { Public declarations }
  end;

var
  frmVisacionRetirosCaja: TfrmVisacionRetirosCaja;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmVisacionRetirosCaja.FormShow(Sender: TObject);
begin
        with IBEvents1 do begin
          Database := dmGeneral.IBDatabase1;
          Events.Clear;
          Events.Add('retiro_visado');
          Registered := True;
        end;
        with IBSQL1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('insert into "tes$vretiros" (');
           SQL.Add('ID_CAJA,');
           SQL.Add('ID_AGENCIA,');
           SQL.Add('ID_TIPO_CAPTACION,');
           SQL.Add('NUMERO_CUENTA,');
           SQL.Add('DIGITO_CUENTA,');
           SQL.Add('NUMERO_TALON,');
           SQL.Add('VALOR_RETIRO,');
           SQL.Add('FECHA_INGRESO,');
           SQL.Add('HORA_INGRESO,');
           SQL.Add('VISADO,');
           SQL.Add('NEGADO,');
           SQL.Add('ANULADO');
           SQL.Add(')');
           SQL.Add(' values (');
           SQL.Add(':ID_CAJA,');
           SQL.Add(':ID_AGENCIA,');
           SQL.Add(':ID_TIPO_CAPTACION,');
           SQL.Add(':NUMERO_CUENTA,');
           SQL.Add(':DIGITO_CUENTA,');
           SQL.Add(':NUMERO_TALON,');
           SQL.Add(':VALOR_RETIRO,');
           SQL.Add(':FECHA_INGRESO,');
           SQL.Add(':HORA_INGRESO,');
           SQL.Add(':VISADO,');
           SQL.Add(':NEGADO,');
           SQL.Add(':ANULADO');
           SQL.Add(')');
           ParamByName('ID_CAJA').AsInteger := FIdCaja;
           ParamByName('ID_AGENCIA').AsInteger := FIdAgencia;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := FIdTipoCaptacion;
           ParamByName('NUMERO_CUENTA').AsInteger := FNumeroCuenta;
           ParamByName('DIGITO_CUENTA').AsInteger := FDigitoCuenta;
           ParamByName('NUMERO_TALON').AsInteger := FNumeroTalon;
           ParamByName('VALOR_RETIRO').AsCurrency:= FValorRetiro;
           FFechaIngreso := fFechaActual;
           FHoraIngreso := fHoraActual;
           ParamByName('FECHA_INGRESO').AsDate := FFechaIngreso;
           ParamByName('HORA_INGRESO').AsTime := FHoraIngreso;
           ParamByName('VISADO').AsInteger := 0;
           ParamByName('NEGADO').AsInteger := 0;
           ParamByName('ANULADO').AsInteger := 0;
           try
            ExecQuery;
            Transaction.Commit;
           except
            Transaction.Rollback;
            raise;
            btnAnular.Click;
            Exit;
           end;
        end;
end;

procedure TfrmVisacionRetirosCaja.IBEvents1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
begin
   if EventName  = 'retiro_visado' then
   begin
      with IBSQL1 do begin
       if Transaction.InTransaction then
          Transaction.Commit;
       Transaction.StartTransaction;
       SQL.Clear;
       SQL.Add('select * from "tes$vretiros" where');
       SQL.Add('ID_CAJA = :ID_CAJA and');
       SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
       SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
       SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
       SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA and');
       SQL.Add('NUMERO_TALON = :NUMERO_TALON and');
       SQL.Add('FECHA_INGRESO = :FECHA_INGRESO and');
       SQL.Add('HORA_INGRESO = :HORA_INGRESO');
       ParamByName('ID_CAJA').AsInteger := FIdCaja;
       ParamByName('ID_AGENCIA').AsInteger := FIdAgencia;
       ParamByName('ID_TIPO_CAPTACION').AsInteger := FIdTipoCaptacion;
       ParamByName('NUMERO_CUENTA').AsInteger := FNumeroCuenta;
       ParamByName('DIGITO_CUENTA').AsInteger := FDigitoCuenta;
       ParamByName('NUMERO_TALON').AsInteger := FNumeroTalon;
       ParamByName('FECHA_INGRESO').AsDate := FFechaIngreso;
       ParamByName('HORA_INGRESO').AsTime := FHoraIngreso;
       try
        ExecQuery;
        if RecordCount > 0 then
        begin
          if FieldByName('VISADO').AsInteger = 1 then
          begin
            LblInfo.Caption := 'Retiro Aprobado, ACEPTAR';
            btnAceptar.Enabled := True;
            btnCancelar.Enabled := False;
          end
          else
          if FieldByName('NEGADO').AsInteger = 1 then
          begin
            LblInfo.Caption := 'Retiro Negado, CANCELAR';
            btnCancelar.Left := btnAceptar.Left;
            btnAceptar.Enabled := False;
            btnCancelar.Enabled := True;
          end;
        end;
        Transaction.Commit;
       except
        Transaction.Rollback;
        raise;
       end;
      end;

   end;
end;

procedure TfrmVisacionRetirosCaja.btnAnularClick(Sender: TObject);
begin
        with IBSQL1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('update "tes$vretiros" set ANULADO = 1 where ');
          SQL.Add('ID_CAJA = :ID_CAJA and');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
          SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA and');
          SQL.Add('NUMERO_TALON = :NUMERO_TALON and');
          SQL.Add('FECHA_INGRESO = :FECHA_INGRESO and');
          SQL.Add('HORA_INGRESO = :HORA_INGRESO');
          ParamByName('ID_CAJA').AsInteger := FIdCaja;
          ParamByName('ID_AGENCIA').AsInteger := FIdAgencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := FIdTipoCaptacion;
          ParamByName('NUMERO_CUENTA').AsInteger := FNumeroCuenta;
          ParamByName('DIGITO_CUENTA').AsInteger := FDigitoCuenta;
          ParamByName('NUMERO_TALON').AsInteger := FNumeroTalon;
          ParamByName('FECHA_INGRESO').AsDate := FFechaIngreso;
          ParamByName('HORA_INGRESO').AsTime := FHoraIngreso;
          try
           ExecQuery;
           Transaction.Commit;
          except
           Transaction.Rollback;
           raise;
          end;
        end;

end;

end.
