unit unitLoadFile;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ComCtrls, Spin;

type

  { TfrmLoadFile }

  TfrmLoadFile = class(TForm)
    btnLoad: TButton;
    Button1: TButton;
    Button2: TButton;
    edSeparator: TComboBox;
    edFile: TEdit;
    Label1: TLabel;
    edOpenFile: TOpenDialog;
    Label2: TLabel;
    edBar: TProgressBar;
    edQuery: TSQLQuery;
    edTransaction: TSQLTransaction;
    Label3: TLabel;
    edSkip: TSpinEdit;
    procedure btnLoadClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmLoadFile: TfrmLoadFile;

implementation

{$R *.lfm}

{ TfrmLoadFile }

uses unitConnectionFactory;

procedure TfrmLoadFile.btnLoadClick(Sender: TObject);
begin
  if edOpenFile.Execute then
  begin
       edFile.Text:= edOpenFile.FileName;
  end;
end;

procedure TfrmLoadFile.Button1Click(Sender: TObject);
  var
    _aStringList:Tstringlist;
    _aStringRow:TStringList;
    _i,_j:Integer;
    _separator:Char;
begin
    _aStringlist:=TStringlist.Create;
    _aStringRow := TStringList.Create;
    If FileExists(edFile.Text) then _aStringlist.LoadFromFile(edFile.Text);

    if (_aStringList.Count > 0) then
    begin

         // conect to database
         ConnectionFactory.IBConnection1.Open;

         if ConnectionFactory.IBConnection1.Connected then
         begin

              edTransaction.DataBase := ConnectionFactory.IBConnection1;
              edQuery.DataBase := ConnectionFactory.IBConnection1;
              edQuery.Transaction:= edTransaction;

              edTransaction.StartTransaction;



              case edSeparator.ItemIndex of
                   0: _separator := ',';
                   1: _separator := ';';
                   2: _separator := Char(9);
              end;

 //             _aStringList.Delimiter:=Char(13);
//              _aStringList.CommaText:=_separator;

              edBar.Min:=edSkip.Value;
              edBar.Max:=_aStringlist.Count - edSkip.Value;
              edBar.Position:=0;

              _aStringRow.Clear;
              _aStringRow.StrictDelimiter := true;
              _aStringRow.Delimiter := _separator;

              edBar.BarShowText:=true;

              _j := 0;
              for _i := edSkip.Value to _aStringList.Count - 1 do
              begin
                  Application.ProcessMessages;
                  edBar.Position:= _i;
                  edQuery.Close;
                  _aStringRow.Clear;
                  _aStringRow.DelimitedText := _aStringList[_i];
                  edQuery.Params.ParamByName('PROD_CODE').AsString:=_aStringRow[0];
                  edQuery.Params.ParamByName('PROD_BARCODE').AsString:=_aStringRow[1];
                  edQuery.Params.ParamByName('PROD_NAME').AsString := _aStringRow[2];
                  edQuery.Params.ParamByName('PROD_PRESENTATION').AsString := _aStringRow[3];
                  edQuery.Params.ParamByName('PROD_REFERENCE').AsString := _aStringRow[4];
                  edQuery.Params.ParamByName('PROD_COST').AsCurrency := StrToCurr(_aStringRow[5]);
                  edQuery.Params.ParamByName('PROD_PROVIDER').AsString := _aStringRow[6];
                  edQuery.Params.ParamByName('PROD_PROVIDERNAME').AsString := _aStringRow[7];
                  edQuery.Params.ParamByName('PROD_LINEGROUP').AsString := _aStringRow[8];
                  edQuery.Params.ParamByName('PROD_LINENAME').AsString := _aStringRow[9];
                  edQuery.Params.ParamByName('PROD_LOCATION').AsString := _aStringRow[10];
                  edQuery.Params.ParamByName('PROD_LOCATIONNAME').AsString := _aStringRow[11];
                  edQuery.Params.ParamByName('PROD_TAX').AsCurrency:=StrToCurr(_aStringRow[12]);
                  edQuery.Params.ParamByName('PROD_INVENTORY').AsCurrency:=StrToCurr(_aStringRow[13]);
                  edQuery.Params.ParamByName('PROD_SALE01').AsCurrency:=StrToCurr(_aStringRow[14]);
                  edQuery.Params.ParamByName('PROD_SALE02').AsCurrency:=StrToCurr(_aStringRow[15]);
                  edQuery.Params.ParamByName('PROD_SALE03').AsCurrency:=StrToCurr(_aStringRow[16]);
                  edQuery.Params.ParamByName('PROD_SALE04').AsCurrency:=StrToCurr(_aStringRow[17]);
                  edQuery.Params.ParamByName('PROD_SALE05').AsCurrency:=StrToCurr(_aStringRow[18]);
                  edQuery.Params.ParamByName('PROD_SALE06').AsCurrency:=StrToCurr(_aStringRow[19]);
                  edQuery.Params.ParamByName('PROD_SALE07').AsCurrency:=StrToCurr(_aStringRow[20]);
                  edQuery.Params.ParamByName('PROD_SALE08').AsCurrency:=StrToCurr(_aStringRow[21]);
                  edQuery.Params.ParamByName('PROD_SALE09').AsCurrency:=StrToCurr(_aStringRow[22]);
                  edQuery.Params.ParamByName('PROD_SALE10').AsCurrency:=StrToCurr(_aStringRow[23]);
                  edQuery.Params.ParamByName('PROD_MINIMAL').AsInteger:=StrToInt(_aStringRow[24]);
                  edQuery.Params.ParamByName('PROD_GAIN').AsCurrency:=StrToCurr(_aStringRow[25]);
                  edQuery.Params.ParamByName('PROD_DUEDATE').Clear;
                  edQuery.ExecSQL;
                  _j := _j+1;
              end;
             edTransaction.Commit;
             ShowMessage('Carga finalizada: '+IntToStr(_j)+' Registros' );
         end
         else
         begin
           ShowMessage('No se pudo conectar a la base de datos');
         end;

         ConnectionFactory.IBConnection1.Close(true);
    end;



end;

procedure TfrmLoadFile.Button2Click(Sender: TObject);
begin
     Close;
end;

end.

