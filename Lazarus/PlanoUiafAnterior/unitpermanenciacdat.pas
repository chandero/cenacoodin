unit unitPermanenciaCdat;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, dateutils, strutils;

type

  { TfrmPermanenciaCdat }

  TfrmPermanenciaCdat = class(TForm)
    btnCerrar: TBitBtn;
    btnProcesar: TBitBtn;
    edFechaFin: TDateTimePicker;
    edFechaIni: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SD1: TSaveDialog;
    _progressbar: TProgressBar;
    _queryMaestro: TSQLQuery;
    _queryMaestroTitular: TSQLQuery;
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
  public
    { public declarations }
    Path,Server,Dbname: String;
  end;

  type TMaestroVo = Object
    Numero:Integer;
    FechaApertura: TDate;
    FechaVencimiento: TDate;
    FechaProrroga: TDate;
    FechaVencimientoProrroga: TDate;
    Permanencia: Double;
  end;

var
  frmPermanenciaCdat: TfrmPermanenciaCdat;


implementation

{$R *.lfm}

{ TfrmPermanenciaCdat }

uses unitConnectionFactory, unitGlobal;

procedure TfrmPermanenciaCdat.FormCreate(Sender: TObject);
begin
     connectionFactory:= TConnectionFactory.Create(nil);
     _transaction.DataBase := connectionFactory.Connection;
     _queryMaestro.DataBase := connectionFactory.Connection;
     _queryMaestro.Transaction := _transaction;

     _queryMaestroTitular.DataBase := connectionFactory.Connection;
     _queryMaestroTitular.Transaction := _transaction;

end;

procedure TfrmPermanenciaCdat.FormKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TfrmPermanenciaCdat.btnProcesarClick(Sender: TObject);
var
  _textFile: TStringList;
  _textRow, _textTmp : String;
  _numero:Integer;
  _fechaInicial:TDate;
  _fechaFinal:TDate;
  _fechaMayor:TDate;
  _permanencia:Double;
  _maestroVo : TMaestroVo;
  _diasCdat: Integer;
  _diasTotal: Integer;
  _anho,_mes:Word;
begin
     _textFile := TStringList.Create;

     _anho := YearOf(edFechaFin.Date);
     _mes := MonthOf(edFechaFin.Date);


     _diasTotal := DaysBetween(edFechaIni.Date, edFechaFin.Date);

     _queryMaestro.Close;
     _queryMaestro.ParamByName('FECHA_APERTURA').AsDate := edFechaFin.Date;
     _queryMaestro.Open;
     _queryMaestro.Last;
     _queryMaestro.First;

     _progressbar.Min:=0;
     _progressbar.Max:=_queryMaestro.RecordCount;
     _progressbar.Position:=0;

     while not _queryMaestro.EOF do begin

           _progressbar.Position:= _queryMaestro.RecNo;
           Application.ProcessMessages;

           _maestroVo.Numero:=_queryMaestro.FieldByName('NUMERO_CUENTA').AsInteger;
           _maestroVo.FechaApertura:= _queryMaestro.FieldByName('FECHA_APERTURA').AsDateTime;
           _maestroVo.FechaVencimiento:= _queryMaestro.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
           if (not _queryMaestro.FieldByName('FECHA_PRORROGA').IsNull) then begin
             _maestroVo.FechaProrroga:=_queryMaestro.FieldByName('FECHA_PRORROGA').AsDateTime;
           end
           else
           begin
                 _maestroVo.FechaProrroga:=_queryMaestro.FieldByName('FECHA_APERTURA').AsDateTime;
           end;
           if (not _queryMaestro.FieldByName('FECHA_VENCIMIENTO_PRORROGA').IsNull) then begin
                _maestroVo.FechaVencimientoProrroga:= _queryMaestro.FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime;
           end
           else
           begin
                _maestroVo.FechaVencimientoProrroga:=_queryMaestro.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
           end;

           if (_maestroVo.FechaVencimiento > _maestroVo.FechaVencimientoProrroga) then begin
                _fechaMayor:=_maestroVo.FechaVencimiento;
           end
           else
           begin
                 _fechaMayor := _maestroVo.FechaVencimientoProrroga;
           end;

           if (_fechaMayor > edFechaIni.Date) and (_maestroVo.FechaApertura < edFechaIni.Date) then begin
              if (_maestroVo.FechaApertura < edFechaIni.Date) then begin
                 _fechaInicial:=edFechaini.Date;
              end
              else
              begin
                    _fechaInicial := _fechaMayor;
              end;

              if (_fechaMayor > edFechaFin.Date) then begin
                 _fechaFinal:=edfechafin.Date;
              end
              else
              begin
                  _fechaFinal := _fechaMayor;
              end;

              _diasCdat:=DaysBetween(_fechaInicial,_fechaFinal);
              _maestroVo.Permanencia:=(_diasCdat/_diasTotal)*100;

              _textRow:=PadLeft(IntToStr(_maestroVo.Numero), 10);
              _textRow := _textRow + ';';
              _textRow := _textRow + FormatDateTime('YYYY-MM-DD',_fechaInicial);
              _textRow := _textRow + ';';
              _textRow := _textRow + FormatDateTime('YYYY-MM-DD',_fechaFinal);
              _textRow := _textRow + ';';
              _textRow := _textRow + Format('%3.2f',[_maestroVo.Permanencia]);
              _textFile.Add(_textRow);
           end;
           _queryMaestro.Next;
     end;

     SD1.FileName:='PERMANENCIA'+Format('%.*d',[4, _anho])+Format('%.*d',[2,_mes]);
     if SD1.Execute then
     begin
          _textFile.SaveToFile(SD1.FileName);
          ShowMessage('Archivo guardado...!');
     end;

     _transaction.Commit;
     _queryMaestroTitular.Close;
     _queryMaestro.Close;

end;

procedure TfrmPermanenciaCdat.edFechaFinKeyPress(Sender: TObject; var Key: char
  );
begin

end;

procedure TfrmPermanenciaCdat.edFechaIniKeyPress(Sender: TObject; var Key: char
  );
begin

end;

procedure TfrmPermanenciaCdat.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   _queryMaestro.Close;
   ConnectionFactory.Free;
end;

procedure TfrmPermanenciaCdat.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPermanenciaCdat.FormShow(Sender: TObject);
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

end.

