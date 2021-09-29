unit unitPlanoProducto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls, StrUtils, DateUtils, unitConnectionFactory;

type

  { TfrmPlanoProducto }

  TfrmPlanoProducto = class(TForm)
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    edFechaIni: TDateTimePicker;
    edFechaFin: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SD1: TSaveDialog;
    _queryMaestroTitular: TSQLQuery;
    _progressbar: TProgressBar;
    _queryMaestro: TSQLQuery;
    _transaction: TSQLTransaction;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure edFechaFinKeyPress(Sender: TObject; var Key: char);
    procedure edFechaIniKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    function validarNombre(_nombre:String): String;
  public
    { public declarations }
    Server: String;
    Path: String;
    Dbname: String;
  end;

var
  frmPlanoProducto: TfrmPlanoProducto;
  connectionFactory: TConnectionFactory;

implementation

{$R *.lfm}

{ TfrmPlanoProducto }

uses unitGlobal;

procedure TfrmPlanoProducto.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlanoProducto.btnProcesarClick(Sender: TObject);
var
  _headerFile: String;
  _footerFile: String;
  _textFile: TStringList;
  _textRow, _textTmp : String;
  _tipoDocumento,
  _tipoProducto,
  _nombre: String;
  _splitText : TStringList;
  _loop,_linea : Integer;
  _anho,_mes:Word;
begin
     _splitText := TStringList.Create;
     _queryMaestro.Close;
     _queryMaestro.ParamByName('FECHA_APERTURA').AsDate := edFechaFin.Date;
     _queryMaestro.Open;
     _queryMaestro.Last;
     _queryMaestro.First;

     _progressbar.Min:=0;
     _progressbar.Max:=_queryMaestro.RecordCount;
     _progressbar.Position:=0;

     _textFile := TStringList.Create;

     _linea := 1;

     while not _queryMaestro.EOF do
     begin
       _progressbar.Position:=_queryMaestro.RecNo;
       Application.ProcessMessages;
       _textRow :=  PadLeft(IntToStr(_linea),10);
       _queryMaestroTitular.Close;
       _queryMaestroTitular.ParamByName('ID_AGENCIA').AsInteger:=_queryMaestro.FieldByName('ID_AGENCIA').AsInteger;
       _queryMaestroTitular.ParamByName('ID_TIPO_CAPTACION').AsInteger:=_queryMaestro.FieldByName('ID_TIPO_CAPTACION').AsInteger;
       _queryMaestroTitular.ParamByName('NUMERO_CUENTA').AsInteger:=_queryMaestro.FieldByName('NUMERO_CUENTA').AsInteger;
       _queryMaestroTitular.ParamByName('DIGITO_CUENTA').AsInteger:=_queryMaestro.FieldByName('DIGITO_CUENTA').AsInteger;
       _queryMaestroTitular.Open;
       if (_queryMaestroTitular.RecordCount > 0) then
       begin
             case _queryMaestroTitular.FieldByName('ID_IDENTIFICACION').AsInteger of
                  1: _tipoDocumento := '11';
                  2: _tipoDocumento := '12';
                  3: _tipoDocumento := '13';
                  4: _tipoDocumento := '31';
                  else
                    _tipoDocumento := '00';
             end;

             case _queryMaestro.FieldByName('ID_TIPO_CAPTACION').AsInteger of
                  1: _tipoProducto:='02';
                  2,3,4: _tipoProducto := '02';
                  5: _tipoProducto := '08';
                  6: _tipoProducto := '04';
                  else
                    _tipoProducto := '11';
             end;
             _textRow:=_textRow+Format('%.*d',[1,_queryMaestro.FieldByName('ID_TIPO_CAPTACION').AsInteger]);
             _textRow:=_textRow+Format('%.*d',[2,_queryMaestro.FieldByName('ID_AGENCIA').AsInteger]);
             _textRow:=_textRow+Format('%.*d',[7,_queryMaestro.FieldByName('NUMERO_CUENTA').AsInteger]);
             _textRow:=_textRow+Format('%.*d',[1,_queryMaestro.FieldByName('DIGITO_CUENTA').AsInteger]);
             _textRow:=_textRow+PadLeft(' ',9);
             _textRow:=_textRow+FormatDateTime('YYYY-MM-DD',_queryMaestro.FieldByName('FECHA_APERTURA').AsDateTime);
             _textRow:=_textRow+_tipoProducto;
             _textRow:=_textRow+'54398';
             _textRow:=_textRow+_tipoDocumento;
             _textRow:=_textRow+PadRight(_queryMaestroTitular.FieldByName('ID_PERSONA').AsString,20);
             _nombre := _queryMaestroTitular.FieldByName('PRIMER_APELLIDO').AsString;
             _nombre := validarNombre(_nombre);
             _textRow := _textRow + PadRight(_nombre, 40);
             _nombre := _queryMaestroTitular.FieldByName('SEGUNDO_APELLIDO').AsString;
             _nombre := validarNombre(_nombre);
             _textRow := _textRow + PadRight(_nombre, 40);

             if (_tipoDocumento = '31') then
             begin
                 _textRow := _textRow + PadRight(' ', 40);
                 _textRow := _textRow + PadRight(' ', 40);
             end
             else
             begin
                 _splitText.Delimiter:= ' ';
                 _nombre:=_queryMaestroTitular.FieldByName('NOMBRE').AsString;
                 _nombre := validarNombre(_nombre);
                 _splitText.DelimitedText:=_nombre;
                 _textRow := _textRow + PadRight(_splitText[0],40);
                 _nombre := '';
                 if (_splitText.Count > 1) then
                 begin
                      for _loop := 1 to _splitText.Count - 1 do
                      begin
                         _nombre := _nombre + _splitText[_loop];
                      end;
                      _nombre := validarNombre(_nombre);
                      _textRow := _textRow + PadRight(_nombre, 40);
                 end
                 else
                 begin
                     _textRow := _textRow + PadRight(' ',40);
                 end;
             end;

             if (_tipoDocumento = '31') then
             begin
                 _nombre := _queryMaestroTitular.FieldByName('NOMBRE').AsString;
                 _nombre := validarNombre(_nombre);
                 _textRow := _textRow + PadRight(_nombre,60);
             end
             else
             begin
                 _textRow := _textRow + PadRight(' ',60);
             end;
             _textRow := _textRow + '00';
             _textRow := _textRow + PadRight(' ',20);
             _textRow := _textRow + PadRight(' ',40);
             _textRow := _textRow + PadRight(' ',40);
             _textRow := _textRow + PadRight(' ',40);
             _textRow := _textRow + PadRight(' ',40);
             _textRow := _textRow + PadRight(' ',60);
             _textFile.Add(_textRow);
             _linea := _linea + 1;
       end;
       _queryMaestro.Next;
     end;

     _linea := _linea - 1;

     _textRow := PadLeft('0',10);
     _textRow := _textRow + '06007002';
     _textRow := _textRow + FormatDateTime('YYYY-MM-DD',edFechaIni.Date);
     _textRow := _textRow + FormatDateTime('YYYY-MM-DD',edFechaFin.Date);
     _textRow := _textRow + Format('%.*d',[10 ,_linea]);
     _textTmp := PadLeft('X',483);
     _textTmp := ReplaceText(_textTmp,' ','X');
     _textRow := _textRow + _textTmp;

     _headerFile:=_textRow;

     _textFile.Insert(0,_textRow);


     _textRow := PadLeft('0',10);
     _textRow := _textRow + '06007002';
     _textRow := _textRow + Format('%.*d',[10 ,_linea]);
     _textTmp := PadLeft('X',503);
     _textTmp := ReplaceText(_textTmp,' ','X');
     _textRow := _textRow + _textTmp;
     _footerFile:=_textRow;


     _textFile.Add(_textRow);



     _anho := YearOf(edFechaFin.Date);
     _mes := MonthOf(edFechaFin.Date);

     SD1.FileName:='COODIN'+Format('%.*d',[4, _anho])+Format('%.*d',[2,_mes]);
     if SD1.Execute then
     begin
          _textFile.SaveToFile(SD1.FileName);
          ShowMessage('Archivo guardado...!');
     end;

     _transaction.Commit;
     _queryMaestroTitular.Close;
     _queryMaestro.Close;

end;

procedure TfrmPlanoProducto.edFechaFinKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TfrmPlanoProducto.edFechaIniKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TfrmPlanoProducto.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  connectionFactory.Free;
end;

procedure TfrmPlanoProducto.FormCreate(Sender: TObject);
begin
     connectionFactory:= TConnectionFactory.Create(nil);
     _transaction.DataBase := connectionFactory.Connection;
     _queryMaestro.DataBase := connectionFactory.Connection;
     _queryMaestro.Transaction := _transaction;

     _queryMaestroTitular.DataBase := connectionFactory.Connection;
     _queryMaestroTitular.Transaction := _transaction;


end;

procedure TfrmPlanoProducto.FormKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TfrmPlanoProducto.FormShow(Sender: TObject);
begin
     connectionFactory.Connection.DatabaseName:=Path + Dbname;
     connectionFactory.Connection.HostName:=Server;
     connectionFactory.Connection.Password:='masterkey';
     connectionFactory.Connection.UserName:='SYSDBA';
     connectionFactory.Connection.CharSet:='ISO8859_1';
     connectionFactory.Connection.Params.Values['lc_ctype'] := 'ISO8859_1';
     connectionFactory.Connection.Params.Values['User_Name'] := 'SYSDBA';
     connectionFactory.Connection.Params.Values['PassWord'] := 'masterkey';

     connectionFactory.Connection.Open;
end;

function TfrmPlanoProducto.validarNombre(_nombre:String):String;
begin
      if (Length(_nombre) > 40) then begin
           _nombre := LeftStr(_nombre,40);
      end
      else
      begin
        _nombre := PadRight(_nombre, 40);
      end;
      _nombre := ReplaceText(_nombre,'Ñ', 'N');
      _nombre := ReplaceText(_nombre,'ñ', 'n');
      _nombre := ReplaceText(_nombre,'á', 'a');
      _nombre := ReplaceText(_nombre,'é', 'e');
      _nombre := ReplaceText(_nombre,'í', 'i');
      _nombre := ReplaceText(_nombre,'ó', 'o');
      _nombre := ReplaceText(_nombre,'ú', 'u');

      validarNombre := _nombre;
end;

end.

