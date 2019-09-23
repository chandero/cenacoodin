unit UnitCorrigeColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvStaticText, StdCtrls, ComCtrls, JvEdit, JvTypedEdit, Buttons,
  ExtCtrls, DB, IBCustomDataSet, IBQuery;

type
  TFrmCorregirColocacion = class(TForm)
    gRColocacion: TGroupBox;
    Label1: TLabel;
    EdColocacion: TEdit;
    JvNombre: TJvStaticText;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    JvCapital: TJvStaticText;
    JvInteres: TJvStaticText;
    JvPagada: TJvStaticText;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    dtFechaK: TDateTimePicker;
    dtFechaI: TDateTimePicker;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    JvNumeroM: TJvIntegerEdit;
    JvNumeroD: TJvIntegerEdit;
    Panel1: TPanel;
    BitAplicar: TBitBtn;
    BitCancelar: TBitBtn;
    BitBtn3: TBitBtn;
    IBConsulta: TIBQuery;
    BtBuscar: TButton;
    Label9: TLabel;
    Jvsaldo: TJvStaticText;
    Label10: TLabel;
    JvEstado: TJvStaticText;
    JvCuota: TJvStaticText;
    Label11: TLabel;
    procedure BtBuscarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitCancelarClick(Sender: TObject);
    procedure EdColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure JvNumeroMEnter(Sender: TObject);
    procedure JvNumeroDEnter(Sender: TObject);
    procedure BitAplicarClick(Sender: TObject);
  private
     _sActual :string;
     _sCambio :string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCorregirColocacion: TFrmCorregirColocacion;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TFrmCorregirColocacion.BtBuscarClick(Sender: TObject);
begin
        _sActual := '';
        if EdColocacion.Text = '' then
           Exit;
        with IBConsulta do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"gen$persona".ID_IDENTIFICACION,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('"col$colocacion".ID_AGENCIA = :ID_AGENCIA AND ');
          SQL.Add('"col$colocacion".ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          if RecordCount = 0 then
          begin
            ShowMessage('Registros no Encontrados');
            Exit;
          end;
          gRColocacion.Enabled := False;
          JvNombre.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          JvEstado.Caption := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
          JvCapital.Caption := FormatDateTime('yyyy/MM/dd',FieldByName('FECHA_CAPITAL').AsDateTime);
          JvInteres.Caption := FormatDateTime('yyyy/MM/dd',FieldByName('FECHA_INTERES').AsDateTime);
          Jvsaldo.Caption := CurrToStrF(FieldByName('SALDO').AsCurrency,ffCurrency,2);
          dtFechaK.DateTime := FieldByName('FECHA_CAPITAL').AsDateTime;
          dtFechaI.DateTime := FieldByName('FECHA_INTERES').AsDateTime;
          JvCuota.Caption := CurrToStrF(FieldByName('VALOR_CUOTA').AsCurrency,ffCurrency,2);
          Close;
          SQL.Clear;
          SQL.Add('select max(CUOTA_NUMERO) AS CUOTA from "col$tablaliquidacion"');
          SQL.Add('where ID_COLOCACION = :ID_COLOCACION and PAGADA = 1');
          SQL.Add('and ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          JvPagada.Caption := FormatCurr('0000',FieldByName('CUOTA').AsInteger);
          _sActual := 'FK:' + JvCapital.Caption + ',FI:' + JvInteres.Caption + ',CUO:' + FieldByName('CUOTA').AsString;
        end;
end;

procedure TFrmCorregirColocacion.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmCorregirColocacion.BitCancelarClick(Sender: TObject);
begin
          JvNombre.Caption := '';
          JvEstado.Caption := '';
          JvCapital.Caption := '';
          JvInteres.Caption := '';
          Jvsaldo.Caption := '';
          dtFechaK.DateTime := fFechaActual;
          dtFechaI.DateTime := fFechaActual;
          JvCuota.Caption := '';
          JvPagada.Caption := '';
          gRColocacion.Enabled := True;
          JvNumeroM.Value := 0;
          JvNumeroD.Value := 0;
          EdColocacion.Text := '';
          EdColocacion.SetFocus;
          BitAplicar.Enabled := True;

end;

procedure TFrmCorregirColocacion.EdColocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           BtBuscar.Click
end;

procedure TFrmCorregirColocacion.JvNumeroMEnter(Sender: TObject);
begin
        JvNumeroD.Value := 0;
end;

procedure TFrmCorregirColocacion.JvNumeroDEnter(Sender: TObject);
begin
        JvNumeroM.Value := 0;
end;

procedure TFrmCorregirColocacion.BitAplicarClick(Sender: TObject);
var     _dFechaExtracto :TDate;
        _tHoraExtracto :TTime;
        _sCuota :string;
begin

       if MessageDlg('Esta Seguro(a) de Realizar el Cambio',mtInformation,[mbyes,mbno],0) = mrno then
          Exit;
        with IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select max(FECHA_EXTRACTO) as FECHA_EXTRACTO from "col$extracto"');
          SQL.Add('where ID_COLOCACION = :ID_COLOCACION and ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          _dFechaExtracto := FieldByName('FECHA_EXTRACTO').AsDateTime;
          Close;
          SQL.Clear;
          SQL.Add('select max(HORA_EXTRACTO)as HORA_EXTRACTO from "col$extracto"');
          SQL.Add('where ID_COLOCACION = :ID_COLOCACION');
          SQL.Add('and ID_AGENCIA = :ID_AGENCIA AND FECHA_EXTRACTO = :FECHA_EXTRACTO');
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('FECHA_EXTRACTO').AsDateTime := _dFechaExtracto;
          Open;
          _tHoraExtracto := FieldByName('HORA_EXTRACTO').AsDateTime;
          Close;
          //Actualizar Colocación
          SQL.Clear;
          SQL.Add('update "col$colocacion" set FECHA_CAPITAL = :FECHA_CAPITAL, FECHA_INTERES = :FECHA_INTERES');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('FECHA_INTERES').AsDateTime := dtFechaI.DateTime;
          ParamByName('FECHA_CAPITAL').AsDateTime := dtFechaK.DateTime;
          ExecSQL;
          Close;
          //Actualizar Extracto
          SQL.Clear;
          SQL.Add('update "col$extracto" set CAPITAL_PAGO_HASTA = :FECHA_CAPITAL, INTERES_PAGO_HASTA = :FECHA_INTERES');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
          SQL.Add('and FECHA_EXTRACTO = :FECHA_EXTRACTO and HORA_EXTRACTO = :HORA_EXTRACTO');
          ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('FECHA_EXTRACTO').AsDateTime := _dFechaExtracto;
          ParamByName('HORA_EXTRACTO').AsTime := _tHoraExtracto;
          ParamByName('FECHA_INTERES').AsDateTime := dtFechaI.DateTime;
          ParamByName('FECHA_CAPITAL').AsDateTime := dtFechaK.DateTime;
          ExecSQL;
          //Actualizar Tabla de Liquidación
          Close;
          SQL.Clear;
          if JvNumeroM.Value > 0 then
          begin
            SQL.Add('update "col$tablaliquidacion" set PAGADA = 1');
            SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
            SQL.Add('and CUOTA_NUMERO <= :CUOTA');
            ParamByName('CUOTA').AsInteger := JvNumeroM.Value;
            _sCuota := IntToStr(JvNumeroM.Value);
            ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ExecSQL;
          end
          else if JvNumeroD.Value > 0 then
          begin
            SQL.Add('update "col$tablaliquidacion" set PAGADA = 0');
            SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
            SQL.Add('and CUOTA_NUMERO >= :CUOTA');
            ParamByName('CUOTA').AsInteger := JvNumeroD.Value;
            _sCuota := IntToStr(JvNumeroD.Value);
            ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ExecSQL;
          end;
          _sCambio := 'FK:' + FormatDateTime('yyyy/MM/dd',dtFechaK.DateTime) + ',FI:' + FormatDateTime('yyyy/MM/dd',dtFechaI.DateTime) + ',CUO:' + _sCuota;
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO');
          SQL.Add('"per$cambios"(');
          SQL.Add('ID_EMPLEADO,');
          SQL.Add('FECHA,');
          SQL.Add('COLOCACION,');
          SQL.Add('ACTUAL,');
          SQL.Add('CAMBIO)');
          SQL.Add('VALUES(');
          SQL.Add(':ID_EMPLEADO,');
          SQL.Add(':FECHA,');
          SQL.Add(':COLOCACION,');
          SQL.Add(':ACTUAL,');
          SQL.Add(':CAMBIO)');
          ParamByName('ID_EMPLEADO').AsString :=DBAlias;
          ParamByName('COLOCACION').AsString := EdColocacion.Text;
          ParamByName('FECHA').AsDateTime := fFechaActual;
          ParamByName('ACTUAL').AsString := _sActual;
          ParamByName('CAMBIO').AsString := _sCambio;
          ExecSQL;
          Transaction.Commit;
          BitAplicar.Enabled := False;
          ShowMessage('Registro Actualizado con Exito');
          BitCancelar.Click;
        end;
end;

end.
