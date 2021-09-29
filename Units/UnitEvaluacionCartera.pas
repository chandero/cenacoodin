unit UnitEvaluacionCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Math, DateUtils, Dialogs, StdCtrls, Mask, ComCtrls, Buttons, IBDatabase, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmEvaluacionCartera = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    txtAnho: TMaskEdit;
    cbPeriodo: TComboBox;
    pbar: TProgressBar;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    dbHandler: TIBDatabase;
    trHandler: TIBTransaction;
    qrConsulta: TIBQuery;
    lblColocacion: TLabel;
    txtColocacion: TEdit;
    qrEvaluacion: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
  private
    { Private declarations }
    function MoraPromedio(idColocacion:string):Integer;

    function PuntajeActualizacion(Fecha: TDate): Integer;
    function PuntajeGarantia(Garantia: Integer): Integer;
    function PuntajeMora(Mora: Integer): Integer;
    function PuntajeCapacidadPago(Capacidad:Double): Integer;
    function PuntajeEndeudamiento(Endeudamiento:Double): Integer;
    function PuntajeCifin(Categoria: String): Integer;
    function PuntajeCastigado(Castigado: String): Integer;
  public
    { Public declarations }
  end;

var
  frmEvaluacionCartera: TfrmEvaluacionCartera;
  FechaCorte : TDate;
  DBServer:String;
  DBPath:String;
  DBName:String;
  Empresa:String;
  Nit:String;
  MinMora:Integer;

implementation

{$R *.dfm}

uses
IniFiles;

procedure TfrmEvaluacionCartera.FormCreate(Sender: TObject);
var
  MiINI :String;
  Mensaje: String;
begin
        // Leer archivo de configuracion
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','127.0.0.1');
    DBPath := ReadString('DBNAME','path','C:\');
    DBname := ReadString('DBNAME','name','database.fdb');
    Empresa := ReadString('EMPRESA','name','PERSONAL');
    Nit     := ReadString('EMPRESA','nit','000.000.000-6');
    MinMora := ReadInteger('EMPRESA','minmora',30);
  finally
    free;
  end;

  dbHandler.DatabaseName := dbserver + ':' + dbpath + dbname;
  dbHandler.Params.Values['lc_ctype'] := 'ISO8859_1';
  dbHandler.Params.Values['User_Name'] := 'sysdba';
  dbHandler.Params.Values['PassWord'] := 'masterkey';
  dbHandler.DefaultTransaction := trHandler;

  try
     dbHandler.Connected := True;
     trHandler.Active := True;
     except
     on E: Exception do
     begin
     if StrLIComp(PChar(E.Message),PChar('Your user name'),14) = 0 then
     begin
        Mensaje :='Verifique su Nombre y su Contraseña' + #10 + #13 + 'Mensaje:' + E.Message;
        MessageBox(0,PChar(Mensaje),PChar('Usuario Invalido'),MB_OK OR MB_ICONERROR);
       end
       else
       begin
        Mensaje := 'Verifique su Configuración o Informe al Administrador de la Red' + #10 + #13 + 'Mensaje:' + E.Message;
        MessageBox(0,PChar(Mensaje),PChar('Configuración Erronea'),MB_OK OR MB_ICONERROR);
       end;
     end; //fin del begin de la excepción.
  end; // fin del try

  txtAnho.Text := IntToStr(YearOf(Now));

end;

procedure TfrmEvaluacionCartera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    trHandler.Commit;
    dbHandler.Close;
    Action := caFree;
end;

procedure TfrmEvaluacionCartera.btnCerrarClick(Sender: TObject);
begin
        self.Close;
end;

procedure TfrmEvaluacionCartera.btnProcesarClick(Sender: TObject);
var

  Dia: Integer;
  Total: Integer;

  DiasDesembolso: Integer;
  PorcPago: Double;

  // temporales

  ingresos: Currency;
  egresos: Currency;

  activos: Currency;
  pasivos: Currency;

  fila: integer;

  //Datos

  _documento: string;
  _nombre: string;
  _oficina: string;
  _saldo: string;
  _provision: string;
  _calificacion: string;
  _fecha_actualizacion: string;
  _puntaje_fecha: string;
  _puntajeFecha:integer;
  _reestructuracion: string;
  _garantias: string;
  _puntaje_garantia: string;
  _puntajeGarantia: integer;
  _moraPromedio: Integer;
  _mora_promedio: string;
  _puntaje_mora: string;
  _puntajeMora: integer;
  _ingresos: string;
  _egresos: string;
  _capacidadpago: string;
  _puntaje_capacidadpago: string;
  _puntajeCapacidadpago: integer;
  _activos: string;
  _pasivos: string;
  _endeudamiento: string;
  _puntaje_endeudamiento: string;
  _puntajeEndeudamiento: Integer;
  _cifin: string;
  _puntaje_cifin: string;
  _puntajeCifin: integer;
  _carteracastigada: string;
  _puntaje_castigada: string;
  _puntajeCastigada: integer;
  _total_calificacion: string;
  _totalCalificacion: Integer;
  _calificacionhoy: string;
  _calificacionnueva: string;

  // text file
  Cadena:string;
  Archivo:TextFile;
begin

   btnProcesar.Enabled := False;

   Dia := DaysInAMonth(StrToInt(txtAnho.text),cbPeriodo.ItemIndex + 1);
   if Dia > 30 then Dia := 30;
   FechaCorte := EncodeDate(StrToInt(txtAnho.text),cbPeriodo.ItemIndex + 1,Dia);

   qrConsulta.SQL.Clear;
   qrConsulta.SQL.Add('SELECT COUNT(*) AS TOTAL FROM "col$causaciondiaria" WHERE FECHA_CORTE = :FECHA_CORTE');
   qrConsulta.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
   try
     qrConsulta.Open;
     Total := qrConsulta.FieldByName('TOTAL').AsInteger;
   except
      raise;
   end;

   pbar.Max := Total;

   AssignFile(Archivo,'C:/PlanosFinMes/EvaluacionCartera' + IntToStr(YearOf(FechaCorte)) + cbPeriodo.Text + '.csv');
   Rewrite(Archivo);

   // Encabezado
   Cadena := 'Documento' + ';' +
             'Nombre' + ';' +
             'Oficina' + ';' +
             'Saldo' + ';' +
             'Provision' + ';' +
             'Calificacion' + ';' +
             'Fecha Actualizacion' + ';' +
             'Puntaje Actualizacion' + ';' +
             'Reestructuracion' + ';' +
             'Garantia' + ';' +
             'Puntaje Garantia' + ';' +
             'Mora Promedio' + ';' +
             'Puntaje Mora' + ';' +
             'Ingresos' + ';' +
             'Egresos' + ';' +
             'Capacidad Pago' + ';' +
             'Puntaje Capacidad Pago' + ';' +
             'Activos' + ';' +
             'Pasivos' + ';' +
             'Endeudamiento' + ';' +
             'Puntaje Endeudamiento' + ';' +
             'Cifin' + ';' +
             'Puntaje Cifin' + ';' +
             'Castigada Sector Financiero' + ';' +
             'Puntaje Castigada' + ';' +
             'Total Calificacion' + ';' +
             'Calificacion Hoy' + ';' +
             'Nueva Calificacion';

   Writeln(Archivo, Cadena);

   qrConsulta.Close;
   qrConsulta.SQL.Clear;
   qrConsulta.SQL.Add('SELECT c.*, p.*, a.DESCRIPCION_AGENCIA FROM "col$causaciondiaria" c ');
   qrConsulta.SQL.Add('LEFT JOIN "gen$persona" p ON p.ID_IDENTIFICACION = c.ID_IDENTIFICACION and p.ID_PERSONA = c.ID_PERSONA ');
   qrConsulta.SQL.Add('LEFT JOIN "gen$agencia" a ON c.ID_AGENCIA = a.ID_AGENCIA ');
   qrConsulta.SQL.Add('WHERE c.FECHA_CORTE = :FECHA_CORTE');
   qrConsulta.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
   try
     qrConsulta.Open;
     while not qrConsulta.Eof do
     begin
        pbar.Position := qrConsulta.RecNo;
        fila := qrConsulta.RecNo;
        txtColocacion.Text := qrConsulta.FieldByName('ID_COLOCACION').AsString;
        Application.ProcessMessages;

        DiasDesembolso := Abs(DaysBetween(FechaCorte, qrConsulta.FieldByName('FECHA_DESEMBOLSO').AsDateTime));
        PorcPago := (qrConsulta.FieldByName('DEUDA').AsCurrency / qrConsulta.FieldByName('VALOR').AsCurrency) * 100;

        if (qrConsulta.FieldByName('ID_EDAD_ACT').AsString = 'E') or (DiasDesembolso <= 180) or
           (PorcPago <= 30)
        then
        begin
            qrConsulta.Next;
            continue;
        end;

        // Procesar Datos de la Colocacion
        _documento := qrConsulta.FieldByName('ID_PERSONA').AsString;
        _nombre := qrConsulta.FieldByName('NOMBRE').AsString + ' ' +qrConsulta.FieldByName('PRIMER_APELLIDO').AsString + ' ' + qrConsulta.FieldByName('SEGUNDO_APELLIDO').AsString;
        _oficina := qrConsulta.FieldByName('DESCRIPCION_AGENCIA').AsString;
        _saldo := qrConsulta.FieldByName('DEUDA').AsString;
        _provision := qrConsulta.FieldByName('PCAPITAL').AsString;
        _calificacion := qrConsulta.FieldByName('ID_EDAD_ACT').AsString;
        _fecha_actualizacion := qrConsulta.FieldByName('FECHA_ACTUALIZACION').AsString;
        _puntajeFecha := PuntajeActualizacion(qrConsulta.FieldByName('FECHA_ACTUALIZACION').AsDateTime);
        _puntaje_fecha := IntToStr(_puntajeFecha);
        _reestructuracion := 'No';
        _garantias := qrConsulta.FieldByName('ID_GARANTIA').AsString;
        _puntajeGarantia := PuntajeGarantia(qrConsulta.FieldByName('ID_GARANTIA').AsInteger);
        _puntaje_garantia := IntToStr(_puntajeGarantia);
        _moraPromedio := MoraPromedio(qrConsulta.FieldByName('ID_COLOCACION').AsString);
        _mora_promedio := IntToStr(_moraPromedio);
        _puntajeMora := PuntajeMora(_moraPromedio);
        _puntaje_mora := IntToStr(_puntajeMora);
        ingresos := qrConsulta.FieldByName('INGRESOS_A_PRINCIPAL').AsCurrency +
                    qrConsulta.FieldByName('INGRESOS_OTROS').AsCurrency;
        egresos := qrConsulta.FieldByName('EGRESOS_ALQUILER').AsCurrency +
                   qrConsulta.FieldByName('EGRESOS_SERVICIOS').AsCurrency +
                   qrConsulta.FieldByName('EGRESOS_TRANSPORTE').AsCurrency +
                   qrConsulta.FieldByName('EGRESOS_ALIMENTACION').AsCurrency +
                   qrConsulta.FieldByName('EGRESOS_DEUDAS').AsCurrency +
                   qrConsulta.FieldByName('EGRESOS_OTROS').AsCurrency;
        _ingresos := CurrToStr(ingresos);
        _egresos := CurrToStr(egresos);
        _capacidadpago := FloatToStr(RoundTo((egresos/ingresos) * 100,0));
        _puntajeCapacidadpago := PuntajeCapacidadPago(egresos/ingresos);
        _puntaje_capacidadpago := IntToStr(_puntajeCapacidadpago);
        activos := qrConsulta.FieldByName('TOTAL_ACTIVOS').AsCurrency;
        pasivos := qrConsulta.FieldByName('TOTAL_PASIVOS').AsCurrency;
        _activos := CurrToStr(activos);
        _pasivos := CurrToStr(pasivos);
        _endeudamiento := FloatToStr(RoundTo((pasivos/activos) * 100,0));
        _puntajeEndeudamiento := PuntajeEndeudamiento(pasivos/activos);
        _puntaje_endeudamiento := IntToStr(_puntajeEndeudamiento);
        _cifin := 'A';
        _puntajeCifin := PuntajeCifin(_cifin);
        _puntaje_cifin := IntToStr(_puntajeCifin);
        _carteracastigada := 'NO';
        _puntajeCastigada := PuntajeCastigado(_carteracastigada);
        _puntaje_castigada := IntToStr(_puntajeCastigada);
        _calificacionhoy := qrConsulta.FieldByName('ID_EDAD_ACT').AsString;

        _totalCalificacion := _puntajeFecha +
                              _puntajeGarantia +
                              _puntajeMora +
                              _puntajeCapacidadpago +
                              _puntajeEndeudamiento +
                              _puntajeCifin +
                              _puntajeCastigada;

        if (_totalCalificacion <= 100) and (_totalCalificacion > 70) then
           _calificacionnueva := 'A'
        else
        if (_totalCalificacion <= 70) and (_totalCalificacion > 40) then
           _calificacionnueva := 'B'
        else
        if (_totalCalificacion <= 40) and (_totalCalificacion > 20) then
           _calificacionnueva := 'C'
        else
        if (_totalCalificacion <= 20) and (_totalCalificacion > 10) then
           _calificacionnueva := 'D'
        else
           _calificacionnueva := 'E';

        _total_calificacion := IntToStr(_totalCalificacion);

        Cadena := _documento + ';' +
                  _nombre + ';' +
                  _oficina + ';' +
                  _saldo + ';' +
                  _provision + ';' +
                  _calificacion + ';' +
                  _fecha_actualizacion + ';' +
                  _puntaje_fecha + ';' +
                  _reestructuracion + ';' +
                  _garantias + ';' +
                  _puntaje_garantia + ';' +
                  _mora_promedio + ';' +
                  _puntaje_mora + ';' +
                  _ingresos + ';' +
                  _egresos + ';' +
                  _capacidadpago + ';' +
                  _puntaje_capacidadpago + ';' +
                  _activos + ';' +
                  _pasivos + ';' +
                  _endeudamiento + ';' +
                  _puntaje_endeudamiento + ';' +
                  _cifin + ';' +
                  _puntaje_cifin + ';' +
                  _carteracastigada + ';' +
                  _puntaje_castigada + ';' +
                  _total_calificacion + ';' +
                  _calificacionhoy + ';' +
                  _calificacionnueva;

        Writeln(Archivo, Cadena);
        // Fin proceso de datos Colocacion

        qrConsulta.Next;
     end;
   except
     raise;
   end;
   CloseFile(Archivo);
   qrConsulta.Close;
   ShowMessage('Proceso Finalizado');
   btnProcesar.Enabled := true;




end;

function TfrmEvaluacionCartera.MoraPromedio(idColocacion:string):integer;
var
  morap: integer;
  contador: integer;
  mora: integer;
begin
       morap := 0;
       contador := 0;
       qrEvaluacion.Close;
       qrEvaluacion.SQL.Clear;
       qrEvaluacion.SQL.Add('SELECT MOROSIDAD FROM "col$causaciondiaria" c WHERE c.ID_COLOCACION = :ID_COLOCACION');
       qrEvaluacion.ParamByName('ID_COLOCACION').AsString := idColocacion;
       try
         qrEvaluacion.Open;
         while not qrEvaluacion.Eof do
         begin
              if qrEvaluacion.FieldByName('MOROSIDAD').IsNull then
                mora := 0
              else
                mora := qrEvaluacion.FieldByName('MOROSIDAD').AsInteger;
              morap := morap + mora;
              contador := contador + 1;
              qrEvaluacion.Next;
         end;
       except
         raise;
       end;
       morap := morap div contador;
       result := morap;
end;


function TfrmEvaluacionCartera.PuntajeActualizacion(Fecha: TDate): Integer;
begin
     if (Abs(DaysBetween(FechaCorte, Fecha)) > 365) then
      result := 0
     else
      result := 5;
end;

function TfrmEvaluacionCartera.PuntajeGarantia(Garantia: Integer): Integer;
begin
   case Garantia of
   1: result := 5;
   else
     result := 4;
   end;
end;

function TfrmEvaluacionCartera.PuntajeMora(Mora: Integer): Integer;
begin
      if (Mora >= 0) and (Mora <= 10) then result := 30
      else
      if (Mora >= 11) and (Mora <= 15) then result := 25
      else
      if (Mora >= 16) and (Mora <= 30) then result := 20
      else
      if (Mora >= 31) and (Mora <= 45) then result := 5
      else
          result := 0;
end;

function TfrmEvaluacionCartera.PuntajeCapacidadPago(Capacidad:Double): Integer;
var
  porcentaje : double;
begin
       porcentaje := Capacidad * 100;
       if (porcentaje >= 0) and (porcentaje <= 25) then result := 20
       else
       if (porcentaje >= 26) and (porcentaje <= 35) then result := 15
       else
       if (porcentaje >= 36) and (porcentaje <= 50) then result := 10
       else
       if (porcentaje >= 51) and (porcentaje <= 60) then result := 5
       else
         result := 0;
end;

function TfrmEvaluacionCartera.PuntajeEndeudamiento(Endeudamiento:Double): Integer;
var
  porcentaje: double;
begin
       porcentaje := Endeudamiento * 100;
       if (porcentaje >= 0) and (porcentaje <= 30) then result := 15
       else
       if (porcentaje >= 31) and (porcentaje <= 50) then result := 10
       else
       if (porcentaje >= 51) and (porcentaje <= 70) then result := 5
       else
         result := 0;
end;

function TfrmEvaluacionCartera.PuntajeCifin(Categoria: String): Integer;
begin
     result := 15;
end;

function TfrmEvaluacionCartera.PuntajeCastigado(Castigado: String): Integer;
begin
     result := 10;
end;

end.
