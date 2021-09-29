unit UnitActualizacionSDN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ExtActns, ComCtrls, IBSQL, Wininet,
  AbBrowse, AbMeter, AbBase, AbZBrows, AbUnzper;

type
  TfrmActualizacionSDN = class(TForm)
    Label1: TLabel;
    ST1: TStaticText;
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdCerrar: TBitBtn;
    Label2: TLabel;
    ST2: TStaticText;
    Label3: TLabel;
    ST3: TStaticText;
    IBSQL1: TIBSQL;
    AbUnZipper1: TAbUnZipper;
    AbMeter1: TAbMeter;
    AbVCLMeterLink1: TAbVCLMeterLink;
    ProgressBar1: TProgressBar;
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     function BajarArchivo
        (const fileURL, FileName: String): boolean;

     function PrimerPaso:Boolean;
     function SegundoPaso:Boolean;
     function TercerPaso:Boolean;
  public
    { Public declarations }
  end;

var
  frmActualizacionSDN: TfrmActualizacionSDN;

implementation

{$R *.dfm}

uses unitDmGeneral,UnitGlobales;

procedure TfrmActualizacionSDN.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

function TfrmActualizacionSDN.PrimerPaso:Boolean;
begin
        ST3.Caption := 'Descargando Archivo';
        if BajarArchivo(ST1.Caption,ST2.Caption)=True then
           Result := True
        else
           Result := False;

end;


procedure TfrmActualizacionSDN.cmdProcesarClick(Sender: TObject);
begin
        cmdProcesar.Enabled := False;
        Application.ProcessMessages;
        if PrimerPaso then  // Descargar Archivo desde Internet
          if SegundoPaso then  //Descomprimir Archivo
             if TercerPaso then
               MessageDlg('Proceso finalizado con exito!',mtInformation,[mbok],0)
             else
               messagedlg('Error al Insertar Registros!',mterror,[mbok],0)
          else
             messagedlg('Error al Descomprimir el Archivo!',mtError,[mbok],0)
        else
          messagedlg('Error al Descargar el Archivo!' + #13 +
                     'Actualización no se realizo',mterror,[mbok],0);// Actualizar Tabla
end;

procedure TfrmActualizacionSDN.FormShow(Sender: TObject);
begin
        if IBSQL1.Transaction.InTransaction then
           IBSQL1.Transaction.Rollback;
        IBSQL1.Transaction.StartTransaction;

        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select * from "sipla$url"');
        try
         IBSQL1.ExecQuery;
         if IBSQL1.RecordCount > 0 then
            ST1.Caption := IBSQL1.FieldByName('UBICACION').AsString;
        except
         IBSQL1.Transaction.Rollback;
         raise;
        end;
        IBSQL1.Transaction.Commit;
end;

function TfrmActualizacionSDN.BajarArchivo
(const fileURL, FileName: String): boolean;
const BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  SizeFile:DWORD;
  f: File;
  sAppName: string;
begin
 Result:=False;
 sAppName := ExtractFileName(Application.ExeName);
 hSession := InternetOpen(PChar(sAppName),
                INTERNET_OPEN_TYPE_PRECONFIG,
               nil, nil, 0);
 try
  hURL := InternetOpenURL(hSession,
            PChar(fileURL),
            nil,0,0,0);
  try
   AssignFile(f, FileName);
   Rewrite(f,1);
   repeat
    Application.ProcessMessages;
    InternetReadFile(hURL, @Buffer,
                     SizeOf(Buffer), BufferLen);
    BlockWrite(f, Buffer, BufferLen);
    SizeFile := SizeFile + BufferLen;
    ST3.Caption := 'Descargando Archivo ' + FormatCurr('#,#0',SizeFile)+ ' bytes';
   until BufferLen = 0;
   CloseFile(f);
   Result:=True;
  finally
   InternetCloseHandle(hURL)
  end
 finally
  InternetCloseHandle(hSession)
 end
end;


function TfrmActualizacionSDN.SegundoPaso:Boolean;
begin
        ProgressBar1.Visible := False;
        AbMeter1.Visible := True;
        ST3.Caption := 'Descomprimiendo Archivo';
        with AbUnZipper1 do begin
           FileName := ST2.Caption;
           BaseDirectory := ExtractFilePath(ST2.Caption);
           ExtractFiles( '*.*' );
        end;
        AbMeter1.Visible := False;
        Result := True;
end;

function TfrmActualizacionSDN.TercerPaso:Boolean;
var S1:TStringList;
    Registros:Integer;
    F:TextFile;
    Texto, Cadena,Identificacion:string;
    campos:TStringList;
    S2,S3:TStringList;
    i,j:Integer;
    Valor:Extended;
    Codigo:integer;
begin
        ST3.Caption := 'Insertando registros a la Base de Datos';
        ProgressBar1.Min := 0;
        ProgressBar1.Position := 0;
        ProgressBar1.Visible := True;
        AbMeter1.Visible := False;
        Application.ProcessMessages;
        S1 := TStringList.Create;
        S1.LoadFromFile(ExtractFilePath(ST2.Caption)+'\sdn.del');
        Registros := S1.Count;
        ProgressBar1.Max := Registros;
        S1.Free;
        AssignFile(F,ExtractFilePath(ST2.Caption)+'\sdn.del');
        FileMode := 0;
        Reset(F);
        if IBSQL1.Transaction.InTransaction then
           IBSQL1.Transaction.Rollback;
        IBSQL1.Transaction.StartTransaction;
        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('delete from "sipla$sdn"');
        IBSQL1.ExecQuery;
        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('insert into "sipla$sdn" values (');
        IBSQL1.SQL.Add(':ENT_NUM,:SDN_NAME,:SDN_TYPE,:PROGRAM,:TITLE,:CALL_SIGN,');
        IBSQL1.SQL.Add(':VESS_TYPE,:TONNAGE,:GRT,:VESS_FLAG,:VESS_OWNER,:REMARKS)');

        campos:= TStringList.Create;
        Registros := 0;

        while not Eof(F) do begin
          Registros := Registros + 1;
          ProgressBar1.Position := Registros;
          Application.ProcessMessages;
          Readln(F,Texto);
          campos.Text := StringReplace(Texto,'@',#13,[rfReplaceAll]);
          try
            IBSQL1.ParamByName('ENT_NUM').AsInteger := StrToInt(campos.Strings[0]);
            IBSQL1.ParamByName('SDN_NAME').AsString := StringReplace(campos.Strings[1],'"','',[rfreplaceall]);
            IBSQL1.ParamByName('SDN_TYPE').AsString := StringReplace(campos.Strings[2],'"','',[rfreplaceall]);
            IBSQL1.ParamByName('PROGRAM').AsString := StringReplace(campos.Strings[3],'"','',[rfreplaceall]);
            IBSQL1.ParamByName('TITLE').AsString := StringReplace(campos.Strings[4],'"','',[rfreplaceall]);
            IBSQL1.ParamByName('CALL_SIGN').AsString := StringReplace(campos.Strings[5],'"','',[rfreplaceall]);
            IBSQL1.ParamByName('VESS_TYPE').AsString := StringReplace(campos.Strings[6],'"','',[rfreplaceall]);
            IBSQL1.ParamByName('TONNAGE').AsString := StringReplace(campos.Strings[7],'"','',[rfreplaceall]);
            IBSQL1.ParamByName('GRT').AsString := StringReplace(campos.Strings[8],'"','',[rfreplaceall]);
            IBSQL1.ParamByName('VESS_FLAG').AsString := StringReplace(campos.Strings[9],'"','',[rfreplaceall]);
            IBSQL1.ParamByName('VESS_OWNER').AsString := StringReplace(campos.Strings[10],'"','',[rfreplaceall]);
            IBSQL1.ParamByName('REMARKS').AsString := StringReplace(campos.Strings[11],'"','',[rfreplaceall]);
            if Pos('Colombia',campos.Strings[11])> 0 then
            try
              IBSQL1.ExecQuery;
            except
              MessageDlg('Error al Insertar a :' + campos.Strings[1] + #13 +
                         'Marcas: ' + campos.strings[11],mterror,[mbok],0);
            end;
            campos.Clear;
          except
          end;
        end;
        IBSQL1.Transaction.Commit;
        ProgressBar1.Visible := False;
        Result := True;
end;

end.
