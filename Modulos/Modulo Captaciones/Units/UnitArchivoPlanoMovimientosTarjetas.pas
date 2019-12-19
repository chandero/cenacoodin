unit UnitArchivoPlanoMovimientosTarjetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, IBDatabase, DB, IBCustomDataSet,
  IBQuery, ExtCtrls, StrUtils, DateUtils;

type
  TfrmArchivoPlanoMovimientosTarjetas = class(TForm)
    GroupBox1: TGroupBox;
    edFechaInicial: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edFechaFinal: TDateTimePicker;
    btnProcesar: TBitBtn;
    IBQmovs: TIBQuery;
    IBTransaction1: TIBTransaction;
    Panel1: TPanel;
    btnCerrar: TBitBtn;
    ProgressBar1: TProgressBar;
    IBQpersona: TIBQuery;
    IBQsaldo: TIBQuery;
    IBQmaestro: TIBQuery;
    IBQtarjeta: TIBQuery;
    SD1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


type
   THeader = Record
     Consecutivo: String; // 10 alineado a la derecha
     CodigoEntidad: String; // 8  SSTTTCCC  SS Sector , TTT Tipo Entidad, CCC Código
     FechaCorte: String; // 10  AAAA-MM-DD
     NumeroMovs: String; // 10  Alineado a la derecha
     FinRegistro: String; // 263 completo con X
end;

type
  TRegistro = Record
    Consecutivo: String; // 10 alineado a la derecha inicia en 1
    FechaTransaccion: String; // 10
    ValorTransaccion: String; // 20 Alineado a la derecha sin decimales
    TipoTransaccion: String; // 2 Según Tabla
    PaisTransaccion: String; // 2 Según ISO3166
    CodigoDeptoMuni: String; // 5 si no es Colombia usar 00099
    TipoTarjeta: String; // 2 segun tabla
    NumeroTarjeta: String; // 20 Alineado a la derecha
    ValorCupo: String; // 20 Alineado a la derecha, colocar ceros para debito
    CodigoFranquicia: String; // 2
    SaldoTarjeta: String; // 20 alineado a la derecha
    TipoIdentificacion: String; // 2
    NumeroIdentificacion: String; // 15
    DigitoVerificacion: String; // 1
    PrimerApellido: String; // 30
    SegundoApellido: String; // 30
    PrimerNombre: String; // 30
    SegundoNombre: String; // 30
    RazonSocial: String; // 40
end;

type
  TFooter = Record
    Consecutivo: String; // 10 Cero alineado a la derecha
    CodigoEntidad: String; // 8  SSTTTCCC  SS Sector , TTT Tipo Entidad, CCC Código
    NumeroMovs: String; // 10  Alineado a la derecha
    FinRegistro: String; // 273 completo con X
end;

var
  frmArchivoPlanoMovimientosTarjetas: TfrmArchivoPlanoMovimientosTarjetas;
  _datos : TStringList;

implementation

uses UnitDmGeneral, UnitGlobales;

{$R *.dfm}

procedure TfrmArchivoPlanoMovimientosTarjetas.FormShow(Sender: TObject);
begin
        IBTransaction1.StartTransaction;
end;

procedure TfrmArchivoPlanoMovimientosTarjetas.btnCerrarClick(
  Sender: TObject);
begin
        Close;
end;

procedure TfrmArchivoPlanoMovimientosTarjetas.btnProcesarClick(
  Sender: TObject);
var
   vFechaInicial, vFechaFinal : String;
   _documento: String;
   _cuenta: String;
   _agencia: Integer;
   _tipocuenta: Integer;
   _numerocuenta: Integer;
   _digitocuenta: Integer;
   _valor: LongInt;
   _saldo: LongInt;
   _fechacorte: String;
   _fechainicial: TDate;
   _tarjeta: String;
   _tipo_transaccion: String;

   _header: THeader;
   _record: TRegistro;
   _foot : TFooter;

   _id_identificacion : Integer;
   _id_persona: String;

   _fechatmp: String;
   _departamento, _municipio: Integer;

   _consecutivo: Integer;
   _nombrecompleto, _nombre, _otro : String;
   _listnombre : TStringList;
   Buffer: String;
   _descripcion: String;

   _records : array of TRegistro;
   _str: String;
begin
        _listnombre := TStringList.Create;
        _datos := TStringList.Create;
        DateTimeToString(vFechaInicial, 'yyyyMMdd', edFechaInicial.Date);
        DateTimeToString(vFechaFinal, 'yyyyMMdd', edFechaFinal.Date);
        IBQmovs.Close;
        IBQmovs.ParamByName('FECHA_INICIAL').AsString := vFechaInicial;
        IBQmovs.ParamByName('FECHA_FINAL').AsString := vFechaFinal;
        IBQmovs.Open;
        IBQMovs.Last;
        IBQMovs.First;
        ProgressBar1.Max := IBQMovs.RecordCount;
        ProgressBar1.Min := 0;
        ProgressBar1.Position := 0;

        _header.Consecutivo := Format('%.10d',[0]);
        _header.CodigoEntidad := '06007002';
        _header.NumeroMovs := Format('%.10d', [IBQmovs.RecordCount]);
        DateTimeToString(_fechacorte, 'yyyy-MM-dd', edFechaFinal.Date);
        _header.FechaCorte := _fechacorte;
        _header.FinRegistro := RightStr(StringOfChar('X',263) + 'X', 263 ); // Format('%.*s', [263, 'X']);

        _foot.Consecutivo := Format('%.10d',[0]);
        _foot.CodigoEntidad := '06007002';
        _foot.NumeroMovs := Format('%.10d', [IBQmovs.RecordCount]);
        _foot.FinRegistro := RightStr(StringOfChar('X',273) + 'X', 273 ); // Format('%.*s', [273, 'X']);

        _fechainicial := EncodeDate(YearOf(edFechaFinal.Date),01,01);

        _datos.Add(_header.Consecutivo + _header.CodigoEntidad + _header.FechaCorte + _header.NumeroMovs + _header.FinRegistro);

        while not IBQmovs.Eof do
        begin
          Application.ProcessMessages;
          ProgressBar1.Position := IBQmovs.RecNo;
          _documento := IBQmovs.FieldByName('DOCUMENTO').AsString;
          _cuenta := IBQmovs.FieldByName('CUENTA').AsString;
          _tipocuenta := StrToInt(LeftStr(_cuenta,1));
          _agencia := StrToInt(MidStr(_cuenta,2,2));
          _numerocuenta := StrToInt(MidStr(_cuenta,4,6));
          _digitocuenta := StrToInt(RightStr(_cuenta,1));

          IBQsaldo.Close;
          IBQsaldo.ParamByName('ID_AGENCIA').AsInteger := _agencia;
          IBQsaldo.ParamByName('ID_TIPO_CAPTACION').AsInteger := _tipocuenta;
          IBQsaldo.ParamByName('NUMERO_CUENTA').AsInteger := _numerocuenta;
          IBQsaldo.ParamByName('DIGITO_CUENTA').AsInteger := _digitocuenta;
          IBQsaldo.ParamByName('ANHO').AsInteger := YearOf(edFechaFinal.Date);
          IBQsaldo.ParamByName('FECHA_INICIAL').AsDate := _fechainicial;
          IBQsaldo.ParamByName('FECHA_FINAL').AsDate := edFechaFinal.Date;
          IBQsaldo.Open;
          _saldo := IBQsaldo.FieldByName('SALDO_ACTUAL').AsInteger;

          IBQmaestro.Close;
          IBQmaestro.ParamByName('ID_AGENCIA').AsInteger := _agencia;
          IBQmaestro.ParamByName('ID_TIPO_CAPTACION').AsInteger := _tipocuenta;
          IBQmaestro.ParamByName('NUMERO_CUENTA').AsInteger := _numerocuenta;
          IBQmaestro.ParamByName('DIGITO_CUENTA').AsInteger := _digitocuenta;
          IBQmaestro.Open;
          _id_identificacion := IBQmaestro.FieldByName('ID_IDENTIFICACION').AsInteger;
          _id_persona := IBQmaestro.FieldByName('ID_PERSONA').AsString;
          

          IBQtarjeta.Close;
          IBQtarjeta.ParamByName('ID_AGENCIA').AsInteger := _agencia;
          IBQtarjeta.ParamByName('ID_TIPO_CAPTACION').AsInteger := _tipocuenta;
          IBQtarjeta.ParamByName('NUMERO_CUENTA').AsInteger := _numerocuenta;
          IBQtarjeta.ParamByName('DIGITO_CUENTA').AsInteger := _digitocuenta;
          IBQtarjeta.Open;
          _tarjeta := IBQtarjeta.FieldByName('VITA_TARJETA').AsString;

          IBQpersona.Close;
          IBQpersona.ParamByName('ID_IDENTIFICACION').AsInteger := _id_identificacion;
          IBQpersona.ParamByName('ID_PERSONA').AsString := _id_persona;
          IBQpersona.Open;

          _record.Consecutivo := '';
          _record.FechaTransaccion := '';
          _record.ValorTransaccion := '';
          _record.TipoTransaccion := '';
          _record.PaisTransaccion := '';
          _record.CodigoDeptoMuni := '';
          _record.TipoTarjeta := '';
          _record.NumeroTarjeta := '';
          _record.ValorCupo := '';
          _record.CodigoFranquicia := '';
          _record.SaldoTarjeta := '';
          _record.TipoIdentificacion := '';
          _record.NumeroIdentificacion := '';
          _record.DigitoVerificacion := '';
          _record.PrimerApellido := '';
          _record.SegundoApellido := '';
          _record.PrimerNombre := '';
          _record.SegundoNombre := '';
          _record.RazonSocial := '';
          _nombre := '';
          _otro := '';

          _record.Consecutivo := Format('%.10d', [IBQmovs.RecNo]);
          _fechatmp := IBQmovs.FieldByName('FECHA_REGISTRO').AsString;
          _fechatmp := LeftStr(_fechatmp, 4) + '-' + MidStr(_fechatmp, 5, 2) + '-' + RightStr(_fechatmp, 2);
          _record.FechaTransaccion := _fechatmp;
          _str := IBQmovs.FieldByName('VALOR').AsString;
          if (VarIsEmpty(_str) or VarIsNull(_str)) then
          begin
            _str := '0';
          end;
          _valor := StrToInt64(_str) div 100;
          _record.ValorTransaccion := Format('%20d', [_valor]);
          _descripcion := UpperCase(IBQmovs.FieldByname('DESCRIPCION').AsString);
          if (StrPos(PChar(_descripcion), PChar('RETIRO')) <> nil) then
          begin
             _tipo_transaccion := '01';
          end
          else if (StrPos(PChar(_descripcion), PChar('CONSIGNACION')) <> nil) then
          begin
               _tipo_transaccion := '10';
          end
          else if (StrPos(PChar(_descripcion), PChar('COMPRA')) <> nil) then
          begin
               _tipo_transaccion := '06';
          end
          else if (StrPos(PChar(_descripcion), PChar('PAGO')) <> nil) then
          begin
               _tipo_transaccion := '02';
          end
          else if (StrPos(PChar(_descripcion), PChar('TRANSFERENCIA')) <> nil) then
          begin
               _tipo_transaccion := '03';
          end
          else
          begin
              _tipo_transaccion := '10';
          end;

          _record.TipoTransaccion := _tipo_transaccion; // Mirar Tabla
          _record.PaisTransaccion := IBQmovs.FieldByName('TERMINAL_PAIS').AsString;
          _str := IBQMovs.FieldByName('TERMINAL_DEPARTAMENTO').AsString;
          if (VarIsEmpty(_str) or VarIsNull(_str) or (_str = '')) then
          begin
            _str := '0';
          end;
          _departamento := StrToInt(_str);
          _str := IBQmovs.FieldByName('TERMINAL_CIUDAD').AsString;
          if (VarIsEmpty(_str) or VarIsNull(_str) or (_str = '')) then
          begin
            _str := '0';
          end;
          _municipio := StrToInt(_str);
          if (_record.PaisTransaccion <> 'CO') then
          begin
                  _record.CodigoDeptoMuni := '00099';
          end
          else
          begin
                  _record.CodigoDeptoMuni := Format('%.2d%.3d', [_departamento, _municipio]);
          end;
          _record.TipoTarjeta := '01';
          _record.NumeroTarjeta := LeftStr( trim(_tarjeta) + StringOfChar(' ',20), 20 ); //Format('%.20d', [StrToInt64(_tarjeta)]);
          _record.ValorCupo := '                   0';
          _record.CodigoFranquicia := '01';
          _record.SaldoTarjeta := Format('%20d', [_saldo]);
          case _id_identificacion of
            2: _record.TipoIdentificacion := '12';
            3: _record.TipoIdentificacion := '13';
            4: _record.TipoIdentificacion := '31';
            6: _record.TipoIdentificacion := '22';
            8: _record.TipoIdentificacion := '41';
          end;
          _record.NumeroIdentificacion := Format('%15s', [_id_persona]);
          _record.DigitoVerificacion := ' ';
          if (_id_identificacion <> 4) then
          begin
                  _record.PrimerApellido := LeftStr( trim(IBQpersona.FieldByName('PRIMER_APELLIDO').AsString) + StringOfChar(' ',30), 30 );// Format('%.30s', [trim(IBQpersona.FieldByName('PRIMER_APELLIDO').AsString)]);
                  _record.SegundoApellido := LeftStr( trim(IBQPersona.FieldByName('SEGUNDO_APELLIDO').AsString) + StringOfChar(' ', 30), 30);
                  _nombrecompleto := IBQpersona.FieldByName('NOMBRE').AsString;
                  Buffer := _nombrecompleto;
                  _listnombre.Clear;
                  While pos(' ',Buffer) > 0 do
                  begin
                    _listnombre.Add(Copy(buffer,0,pos(' ',buffer)-1));
                    Buffer := Copy(buffer,pos(' ',buffer)+1,Length(buffer));
                  end;
                  _listnombre.Add(Copy(buffer,0,Length(buffer)));
                  _nombre := _listnombre.Strings[0];
                  if (_listnombre.Count > 1) then
                      _otro := _listnombre.Strings[1];
                  _record.PrimerNombre := LeftStr( trim(_nombre) + StringOfChar(' ',30), 30 );//Format('%.30s', [trim(_nombre)]);
                  _record.SegundoNombre := LeftStr( trim(_otro) + StringOfChar(' ',40), 40 ); //Format('%.30s', [trim(_otro)]);
                  _record.RazonSocial := LeftStr( trim('') + StringOfChar(' ',40), 40 );
          end
          else
          begin
                  _record.PrimerApellido := LeftStr( trim('') + StringOfChar(' ',30), 30 );// Format('%.30s', [trim(IBQpersona.FieldByName('PRIMER_APELLIDO').AsString)]);
                  _record.SegundoApellido := LeftStr( trim('') + StringOfChar(' ',30), 30 );// Format('%.30s', [trim(IBQpersona.FieldByName('PRIMER_APELLIDO').AsString)]);
                  _nombrecompleto := IBQpersona.FieldByName('NOMBRE').AsString;
                  _record.PrimerNombre := LeftStr( trim('') + StringOfChar(' ',30), 30 );// Format('%.30s', [trim(IBQpersona.FieldByName('PRIMER_APELLIDO').AsString)]);
                  _record.SegundoNombre := LeftStr( trim('') + StringOfChar(' ',40), 40 );// Format('%.30s', [trim(IBQpersona.FieldByName('PRIMER_APELLIDO').AsString)]);
                  _record.RazonSocial := LeftStr( trim(_nombrecompleto) + StringOfChar(' ',40), 40 );// Format('%.30s', [trim(IBQpersona.FieldByName('PRIMER_APELLIDO').AsString)]);
          end;
          _record.PrimerApellido := StringReplace(_record.PrimerApellido, 'Ñ', 'N', [rfReplaceAll]);
          _record.SegundoApellido := StringReplace(_record.SegundoApellido, 'Ñ', 'N', [rfReplaceAll]);
          _record.PrimerNombre := StringReplace(_record.PrimerNombre, 'Ñ', 'N', [rfReplaceAll]);
          _record.SegundoNombre := StringReplace(_record.SegundoNombre, 'Ñ', 'N', [rfReplaceAll]);
          _record.RazonSocial := StringReplace(_record.RazonSocial, 'Ñ', 'N', [rfReplaceAll]);                    
          _datos.Add(_record.Consecutivo + _record.FechaTransaccion + _record.ValorTransaccion + _record.TipoTransaccion + _record.PaisTransaccion + _record.CodigoDeptoMuni + _record.TipoTarjeta + _record.NumeroTarjeta + _record.ValorCupo + _record.CodigoFranquicia + _record.SaldoTarjeta + _record.TipoIdentificacion + _record.NumeroIdentificacion + _record.DigitoVerificacion + _record.PrimerApellido + _record.SegundoApellido + _record.PrimerNombre + _record.SegundoNombre + _record.RazonSocial );
          IBQmovs.Next;
        end;
        _datos.Add(_foot.Consecutivo + _foot.CodigoEntidad + _foot.NumeroMovs + _foot.FinRegistro);

        if (SD1.Execute) then
        begin
            _datos.SaveToFile(SD1.FileName);
        end;
end;

end.
