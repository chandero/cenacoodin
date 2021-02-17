unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UnitDmGeneral, ComCtrls, ExtCtrls, StdCtrls, Mask,
  Buttons, ToggleButton, DateUtils, JvEdit, JvTypedEdit, DB,
  IBCustomDataSet, IBQuery, IBDatabase, DBClient;

type
  TFrmCierreMes = class(TForm)
    MainMenu1: TMainMenu;
    Manuales1: TMenuItem;
    LiquidacindeIntersdeCaptacin1: TMenuItem;
    mnuAuto: TMenuItem;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    edHoraLiquidacion: TMaskEdit;
    btnHoraLiquidacion: TToggleButton;
    CausacinyProvisindeCartera1: TMenuItem;
    mnuCausacionAuto: TMenuItem;
    Label2: TLabel;
    edHoraCausacion: TMaskEdit;
    btnHoraCausacion: TToggleButton;
    Label3: TLabel;
    edNotas: TJvIntegerEdit;
    IBQnotas: TIBQuery;
    btnNotas: TToggleButton;
    TimerVerificacionProductos: TTimer;
    IBQproducto: TIBQuery;
    IBQejecutar: TIBQuery;
    IBTverificacion: TIBTransaction;
    CDSproducto: TClientDataSet;
    CDSpersona: TClientDataSet;
    CDSpersonaID_IDENTIFICACION: TIntegerField;
    CDSpersonaID_PERSONA: TStringField;
    CDSproductoID_AGENCIA: TIntegerField;
    CDSproductoID_TIPO_CAPTACION: TIntegerField;
    CDSproductoDIGITO_CUENTA: TIntegerField;
    IBQpersona: TIBQuery;
    IBQGuardar: TIBQuery;
    CDSproductoNUMERO_CUENTA: TStringField;
    IBTnotas: TIBTransaction;
    CausacinCdatAuto1: TMenuItem;
    CausacinContractualAuto1: TMenuItem;
    CausacinContractual1: TMenuItem;
    CausacionCdat1: TMenuItem;
    Label4: TLabel;
    edHoraDescuentoContractual: TMaskEdit;
    btnHoraDescuentoContractual: TToggleButton;
    LiquidacionCdatAuto1: TMenuItem;
    LiquidacionCaptacionAuto1: TMenuItem;
    DescuentoContractual1: TMenuItem;
    CausacinContractualAuto2: TMenuItem;
    procedure LiquidacindeIntersdeCaptacin1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnEditarHoraLiquidacionClick(Sender: TObject);
    procedure btnHoraLiquidacionClick(Sender: TObject);
    procedure CausacinyProvisindeCartera1Click(Sender: TObject);
    procedure mnuCausacionAutoClick(Sender: TObject);
    procedure btnHoraCausacionClick(Sender: TObject);
    procedure btnNotasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerVerificacionProductosTimer(Sender: TObject);
    procedure CausacinCdatAuto1Click(Sender: TObject);
    procedure CausacinContractualAuto1Click(Sender: TObject);
    procedure CausacinContractual1Click(Sender: TObject);
    procedure CausacionCdat1Click(Sender: TObject);
    procedure btnHoraDescuentoContractualClick(Sender: TObject);
    procedure LiquidacionCdatAuto1Click(Sender: TObject);
    procedure LiquidacionCaptacionAuto1Click(Sender: TObject);
    procedure DescuentoContractual1Click(Sender: TObject);
    procedure CausacinContractualAuto2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCierreMes: TFrmCierreMes;
  _liquidando, _liquidandocdat, _descontandocontractual, _prorrogandocdat, _cerrandomes, _verificandoProducto : Boolean;

implementation

{$R *.dfm}

uses
IniFiles, UnitLiquidacionInteresesCaptacion, UnitLiquidacionYCausacionAuto, UnitGlobales,
UnitCausacionCarteraDiaria, UnitCausacionCarteraDiariaAuto, UnitCausacionCdat, UnitCausacionCdatAuto, UnitCausacionContractual, UnitCausacionContractualAuto,
UnitLiquidacionCdatAuto, UnitDescuentoContractualAuto;

procedure TFrmCierreMes.LiquidacindeIntersdeCaptacin1Click(
  Sender: TObject);
  var frmLiquidacionInteresesCaptacion: TfrmLiquidacionInteresesCaptacion;
begin
     frmLiquidacionInteresesCaptacion := TfrmLiquidacionInteresesCaptacion.Create(self);
     frmLiquidacionInteresesCaptacion.ShowModal;
end;

procedure TFrmCierreMes.FormShow(Sender: TObject);
var
  MiINI: String;
begin

  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','100.21.210.24');
    DBPath := ReadString('DBNAME','path','/base/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    _sServerImagen := ReadString('DBNAME','serverimagen','');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','LA PLAYA DE BELEN N.S.');
  finally
    free;
  end;

     dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
     dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
     dmGeneral.IBDatabase1.Params.Values['User_Name'] := 'SYSDBA';
     dmGeneral.IBDatabase1.Params.Values['PassWord'] := 'masterkey';
     dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := 'CAPTACIONES';
     dmGeneral.IBDatabase1.Open;

     _liquidando := False;
     _liquidandocdat := False;
     _descontandocontractual := False;
     _prorrogandocdat := False;
     _cerrandomes := False;
     _verificandoProducto := False;
end;

procedure TFrmCierreMes.Timer1Timer(Sender: TObject);
var
 _fecha: TDateTime;
 _hoy: TDate;
 _vNota, _I: Integer;
 _vUNota: Integer;
 _hora, _ahora, _horaIni, _horaFin: TDate;
 frmLiquidacionYCausacionAuto: TfrmLiquidacionYCausacionAuto;
 frmCausacionCarteraDiariaAuto: TfrmCausacionCarteraDiariaAuto;
 frmCausacionCdatAuto: TfrmCausacionCdatAuto;
 frmCauscionContractualAuto: TfrmCausacionContractualAuto;
 frmLiquidacionCdatAuto : TfrmLiquidacionCdatAuto;
 frmDescuentoContractualAuto: TfrmDescuentoContractualAuto;
begin
  _ahora := Time;
  StatusBar1.Panels[1].Text := TimeToStr(_ahora);
  try
    _hora := StrToTime(edHoraLiquidacion.Text);
  except
    exit;
  end;
  _horaIni := _hora;
  _horaFin := IncSecond(_horaIni, 30);
  if (_ahora >= _horaIni) and (_ahora <= _horaFin) then
  begin
    if (not _liquidando) then
    begin
      _liquidando := True;
      frmLiquidacionYCausacionAuto := TfrmLiquidacionYCausacionAuto.Create(self);
      frmLiquidacionYCausacionAuto.ShowModal;
      _liquidando := False;
    end;
  end;

  _ahora := Time;
  StatusBar1.Panels[1].Text := TimeToStr(_ahora);
  try
    _hora := StrToTime(edHoraDescuentoContractual.Text);
  except
    exit;
  end;
  _horaIni := _hora;
  _horaFin := IncSecond(_horaIni, 30);
  if (_ahora >= _horaIni) and (_ahora <= _horaFin) then
  begin
    if (not _liquidandocdat) then
    begin
      _liquidandocdat := True;
      frmLiquidacionCdatAuto := TfrmLiquidacionCdatAuto.Create(self);
      frmLiquidacionCdatAuto.ShowModal;
      _liquidandocdat := False;
    end;
    if (not _descontandocontractual) then
    begin
      _descontandocontractual := True;
      frmDescuentoContractualAuto := TfrmDescuentoContractualAuto.Create(self);
      frmDescuentoContractualAuto.ShowModal;
      _descontandocontractual := False;
    end;
  end;

  _hoy := fFechaActual;
  TryEncodeDate(YearOf(_hoy),MonthOf(_hoy),DaysInAMonth(YearOf(_hoy),MonthOf(_hoy)),_fecha);
  if (_hoy = _fecha) then
  begin
     _hora := StrToTime(edHoraCausacion.Text);
     _horaIni := _hora;
     _horaFin := IncSecond(_horaIni, 30);
     if ((_ahora >= _horaIni) and (_ahora <= _horaFin)) then
     begin
       if (not _cerrandomes) then
       begin
         _cerrandomes := True;
         frmCausacionCdatAuto := TfrmCausacionCdatAuto.Create(self);
         frmCausacionCdatAuto.ShowModal;
         frmCausacionContractualAuto := TfrmCausacionContractualAuto.Create(self);
         frmCausacionContractualAuto.ShowModal;
         frmCausacionCarteraDiariaAuto := TfrmCausacionCarteraDiariaAuto.Create(self);
         frmCausacionCarteraDiariaAuto.ShowModal;
         // Notas
        if IBTnotas.InTransaction then
         IBTnotas.Commit;
        IBTnotas.StartTransaction;

        IBQnotas.Transaction := IBTnotas;
        IBQnotas.Close;
        IBQnotas.SQL.Clear;
        IBQnotas.SQL.Add('SELECT g.CONSECUTIVO FROM "gen$consecutivos" g');
        IBQnotas.SQL.Add(' WHERE g.ID_CONSECUTIVO = 1 ');
        IBQnotas.Open;
        _vNota := IBQnotas.FieldByName('CONSECUTIVO').AsInteger;

        IBQnotas.Close;
        IBQnotas.SQL.Clear;
        IBQnotas.SQL.Add('INSERT INTO CON$COMPROBANTE VALUES (:ID_COMPROBANTE, :ID_AGENCIA, :TIPO_COMPROBANTE, :FECHADIA, :DESCRIPCION, :TOTAL_DEBITO, :TOTAL_CREDITO, :ESTADO, :IMPRESO, :ANULACION, :ID_EMPLEADO)');
        IBQnotas.ParamByName('ID_AGENCIA').AsInteger := 1;
        IBQnotas.ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
        IBQnotas.ParamByName('FECHADIA').AsDate := _hoy;
        IBQnotas.ParamByName('DESCRIPCION').AsString := '';
        IBQnotas.ParamByName('TOTAL_DEBITO').AsCurrency := 0;
        IBQnotas.ParamByName('TOTAL_CREDITO').AsCurrency := 0;
        IBQnotas.ParamByName('ESTADO').AsString := 'O';
        IBQnotas.ParamByName('IMPRESO').AsInteger := 0;
        IBQnotas.ParamByName('ANULACION').Clear;
        IBQnotas.ParamByName('ID_EMPLEADO').AsString := 'AUTOMATICO';

        for _I := 1 to edNotas.Value do
        begin
            IBQnotas.ParamByName('ID_COMPROBANTE').AsInteger := _vNota + _I;
            IBQnotas.ExecSQL;
        end;

        _vUNota := _vNota + edNotas.Value;

        IBQnotas.Close;
        IBQnotas.SQL.Clear;
        IBQnotas.SQL.Add('UPDATE "gen$consecutivos" set CONSECUTIVO = :CONSECUTIVO WHERE ID_CONSECUTIVO = 1');
        IBQnotas.ParamByName('CONSECUTIVO').AsInteger := _vUNota;
        IBQnotas.ExecSQL;

        IBQnotas.Close;
        IBQnotas.SQL.Clear;
        IBQnotas.SQL.Add('insert into "con$controlnotas" values (:ID_AGENCIA,:ID_EMPLEADO,:NUMERO_NOTAS,');
        IBQnotas.SQL.Add(':ID_COMPROBANTE_INICIO,:ID_COMPROBANTE_FINAL,:FECHA,:HORA,:ID_EMPLEADO_AGENCIA)');
        IBQnotas.ParamByName('ID_AGENCIA').AsInteger := 1;
        IBQnotas.ParamByName('ID_EMPLEADO').AsString := 'AUTOMATICO';
        IBQnotas.ParamByName('NUMERO_NOTAS').AsInteger := edNotas.Value;
        IBQnotas.ParamByName('ID_COMPROBANTE_INICIO').AsInteger := _vNota + 1;
        IBQnotas.ParamByName('ID_COMPROBANTE_FINAL').AsInteger := _vUnota;
        IBQnotas.ParamByName('FECHA').AsDate := _hoy;
        IBQnotas.ParamByName('HORA').AsTime := fHoraActual;
        IBQnotas.ParamByName('ID_EMPLEADO_AGENCIA').AsString := 'AUTOMATICO';
        IBQnotas.ExecSQL;
        IBTnotas.Commit;
         // Fin Notas

         _cerrandomes := False;
       end;
     end;
  end;


end;

procedure TFrmCierreMes.btnEditarHoraLiquidacionClick(Sender: TObject);
begin
        edHoraLiquidacion.ReadOnly := False;
end;

procedure TFrmCierreMes.btnHoraLiquidacionClick(Sender: TObject);
begin
        if (btnHoraLiquidacion.Checked) then
           edHoraLiquidacion.ReadOnly := False
        else
           edHoraLiquidacion.ReadOnly := True;
end;

procedure TFrmCierreMes.CausacinyProvisindeCartera1Click(Sender: TObject);
var
  frmCausacionCarteraDiaria : TfrmCausacionCarteraDiaria;
begin
       frmCausacionCarteraDiaria := TfrmCausacionCarteraDiaria.Create(self);
       frmCausacionCarteraDiaria.ShowModal;
end;

procedure TFrmCierreMes.mnuCausacionAutoClick(Sender: TObject);
var
  frmCausacionCarteraDiariaAuto : TfrmCausacionCarteraDiariaAuto;
begin
       frmCausacionCarteraDiariaAuto := TfrmCausacionCarteraDiariaAuto.Create(self);
       frmCausacionCarteraDiariaAuto.ShowModal;
end;

procedure TFrmCierreMes.btnHoraCausacionClick(Sender: TObject);
begin
        if (btnHoraCausacion.Checked) then
           edHoraCausacion.ReadOnly := False
        else
           edHoraCausacion.ReadOnly := True;
end;

procedure TFrmCierreMes.btnNotasClick(Sender: TObject);
begin
        if (btnNotas.Checked) then
        begin
           edNotas.ReadOnly := False;
        end
        else
        begin
           edNotas.ReadOnly := True;
        end;
end;

procedure TFrmCierreMes.FormCreate(Sender: TObject);
begin
        if FindWindow(Nil, 'Procesos Automáticos') > 0 then Exit;

end;

procedure TFrmCierreMes.TimerVerificacionProductosTimer(Sender: TObject);
var
  _vicu_id: Integer;
  _numero: Int64;
begin

  if not _verificandoProducto then
  begin
     StatusBar1.Panels[0].Text := 'Verificando Productos';
     Application.ProcessMessages;
     _verificandoProducto := True;
    // Verificar si todos los productos de los asociados están reportados
    if IBTverificacion.InTransaction then
    begin
        IBTverificacion.Commit;
    end;
    IBTverificacion.StartTransaction;

    IBQpersona.Close;
    IBQpersona.Open;

    CDSpersona.Open;
    CDSpersona.EmptyDataSet;
    while not IBQpersona.Eof do
    begin
        Application.ProcessMessages; 
        CDSpersona.Insert;
        CDSpersonaID_IDENTIFICACION.Value := IBQpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
        CDSpersonaID_PERSONA.Value := IBQpersona.FieldByName('ID_PERSONA').AsString;
        CDSpersona.Post;
        IBQpersona.Next;
    end;
    IBQpersona.Close;
    // Buscar productos por Cada Persona
    CDSproducto.Open;
    CDSproducto.EmptyDataSet;
    CDSpersona.First;
    while Not CDSpersona.Eof do
    begin
      Application.ProcessMessages;
      IBQproducto.Close;
      IBQproducto.ParamByName('ID_IDENTIFICACION').AsInteger := CDSpersonaID_IDENTIFICACION.Value;
      IBQproducto.ParamByName('ID_PERSONA').AsString := CDSpersonaID_PERSONA.Value;
      IBQproducto.Open;

      while Not IBQproducto.Eof do
      begin
         Application.ProcessMessages;
         CDSproducto.Insert;
         CDSproductoID_AGENCIA.Value := IBQproducto.FieldByName('ID_AGENCIA').AsInteger;
         CDSproductoID_TIPO_CAPTACION.Value := IBQproducto.FieldByName('ID_TIPO_CAPTACION').AsInteger;
         CDSproductoNUMERO_CUENTA.Value := IBQproducto.FieldByName('NUMERO_CUENTA').AsString;;
         CDSproductoDIGITO_CUENTA.Value := IBQproducto.FieldByName('DIGITO_CUENTA').AsInteger;
         CDSproducto.Post;
         IBQproducto.Next;
      end;
      CDSpersona.Next;
    end;

    // Validar si el producto está registrado y si no ingresarlo
    CDSproducto.First;
    while not CDSproducto.Eof do
    begin
       Application.ProcessMessages;
       IBQejecutar.Close;
       IBQejecutar.SQL.Clear;
       IBQejecutar.SQL.Add('SELECT COUNT(*) AS EXISTE FROM VIRTUAL_CUENTA vc WHERE');
       IBQejecutar.SQL.Add('vc.VICU_ID_AGENCIA = :ID_AGENCIA and');
       IBQejecutar.SQL.Add('vc.VICU_TIPO_CUENTA = :ID_TIPO_CAPTACION and');
       IBQejecutar.SQL.Add('vc.VICU_NUMERO_CUENTA = :NUMERO_CUENTA and');
       IBQejecutar.SQL.Add('vc.VICU_DIGITO_CUENTA = :DIGITO_CUENTA');
       IBQejecutar.ParamByName('ID_AGENCIA').AsInteger := CDSproductoID_AGENCIA.Value;
       IBQejecutar.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDSproductoID_TIPO_CAPTACION.Value;
       IBQejecutar.ParamByName('NUMERO_CUENTA').AsString := CDSproductoNUMERO_CUENTA.Value;
       IBQejecutar.ParamByName('DIGITO_CUENTA').AsInteger := CDSproductoDIGITO_CUENTA.Value;
       IBQejecutar.Open;
       if (IBQejecutar.FieldByName('EXISTE').AsInteger <= 0 ) then
       begin
         // Agregar el Producto
             _vicu_id := ObtenerConsecutivoVirtual(50);
             IBQGuardar.Close;
             IBQGuardar.SQL.Clear;
             IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA (VICU_ID, VICU_TIPO_CUENTA, VICU_NUMERO_CUENTA, VICU_DIGITO_CUENTA, VICU_ESTADO, VICU_FECHA_REGISTRO, VICU_ID_AGENCIA, VICU_ESLEIDO) VALUES (');
             IBQGuardar.SQL.Add(':VICU_ID, :VICU_TIPO_CUENTA, :VICU_NUMERO_CUENTA, :VICU_DIGITO_CUENTA, :VICU_ESTADO, :VICU_FECHA_REGISTRO, :VICU_ID_AGENCIA, :VICU_ESLEIDO)');
             IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
             IBQGuardar.ParamByName('VICU_TIPO_CUENTA').AsInteger := CDSproductoID_TIPO_CAPTACION.Value;
             IBQGuardar.ParamByName('VICU_NUMERO_CUENTA').AsString := CDSproductoNUMERO_CUENTA.Value;
             IBQGuardar.ParamByName('VICU_DIGITO_CUENTA').AsInteger := CDSproductoDIGITO_CUENTA.Value;
             IBQGuardar.ParamByName('VICU_ESTADO').AsInteger := 0;
             IBQGuardar.ParamByName('VICU_ESLEIDO').AsInteger := 0;
             IBQGuardar.ParamByName('VICU_FECHA_REGISTRO').AsDateTime := fFechaHoraActual;
             IBQGuardar.ParamByName('VICU_ID_AGENCIA').AsInteger := CDSproductoID_AGENCIA.Value;
             IBQGuardar.ExecSQL;
             IBQGuardar.Close;
       end;
       CDSproducto.Next;
    end;
    CDSproducto.Close;
    CDSpersona.Close;
    _verificandoProducto := False;
    StatusBar1.Panels[0].Text := 'En Espera';
    Application.ProcessMessages;    
  end;
end;

procedure TFrmCierreMes.CausacinCdatAuto1Click(Sender: TObject);
var
    frmCausacionCdatAuto : TfrmCausacionCdatAuto;
begin
        frmCausacionCdatAuto := TfrmCausacionCdatAuto.Create(self);
        frmCausacionCdatAuto.ShowModal;
end;

procedure TFrmCierreMes.CausacinContractualAuto1Click(Sender: TObject);
var
  frmCausacionContractualAuto : TfrmCausacionContractualAuto;
begin
        frmCausacionContractualAuto := TfrmCausacionContractualAuto.Create(self);
        frmCausacionContractualAuto.ShowModal;
end;

procedure TFrmCierreMes.CausacinContractual1Click(Sender: TObject);
var
  frmCausacionContractual: TfrmCausacionContractual;
begin
    frmCausacionContractual := TfrmCausacionContractual.Create(self);
    frmCausacionContractual.ShowModal;
end;

procedure TFrmCierreMes.CausacionCdat1Click(Sender: TObject);
var
  frmCausacionCdat: TfrmCausacionCdat;
begin
    frmCausacionCdat := TfrmCausacionCdat.Create(self);
    frmCausacionCdat.ShowModal;
end;

procedure TFrmCierreMes.btnHoraDescuentoContractualClick(Sender: TObject);
begin
        if (btnHoraDescuentoContractual.Checked) then
           edHoraDescuentoContractual.ReadOnly := False
        else
           edHoraDescuentoContractual.ReadOnly := True;
end;

procedure TFrmCierreMes.LiquidacionCdatAuto1Click(Sender: TObject);
var
  frmLiquidacionCdatAuto: TfrmLiquidacionCdatAuto;
begin
   frmLiquidacionCdatAuto := TfrmLiquidacionCdatAuto.Create(Self);
   frmLiquidacionCdatAuto.ShowModal;
end;

procedure TFrmCierreMes.LiquidacionCaptacionAuto1Click(Sender: TObject);
var
  frmLiquidacionYCausacionAuto : TfrmLiquidacionYCausacionAuto;
begin
   frmLiquidacionYCausacionAuto := TfrmLiquidacionYCausacionAuto.Create(self);
   frmLiquidacionYCausacionAuto.ShowModal;
end;

procedure TFrmCierreMes.DescuentoContractual1Click(Sender: TObject);
var
  frmDescuentoContractualAuto:  TfrmDescuentoContractualAuto;
begin
   frmDescuentoContractualAuto := TfrmDescuentoContractualAuto.Create(self);
   frmDescuentoContractualAuto.ShowModal;
end;

procedure TFrmCierreMes.CausacinContractualAuto2Click(Sender: TObject);
var
  frmCausacionContractualAuto:  TfrmCausacionContractualAuto;
begin
         frmCausacionContractualAuto := TfrmCausacionContractualAuto.Create(self);
         frmCausacionContractualAuto.ShowModal;
end;

end.
