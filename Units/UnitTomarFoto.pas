unit UnitTomarFoto;

interface

uses
  Clipbrd, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, VideoCap, VFW;

type
  TfrmTomarFoto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdTomarFoto: TBitBtn;
    cmdCerrar: TBitBtn;
    Panel3: TPanel;
    cbDrivers: TComboBox;
    Label1: TLabel;
    cmdPreview: TBitBtn;
    procedure CmdTomarFotoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmdPreviewClick(Sender: TObject);
  private
    FCap: TVideoCap;
    FDriverList : TStringList;
    FBitMapInfo : TBitmapInfo;
    procedure OnVideoStream(sender: TObject; lpVhdr: PVIDEOHDR);
    { Private declarations }
  public
    BS:TStream;
    function Inicializar:Boolean;
    procedure Finalizar;
    { Public declarations }
  end;

var
  frmTomarFoto: TfrmTomarFoto;
  yatomada:Boolean;
  
implementation

{$R *.dfm}

uses UnitGlobales;

function TfrmTomarFoto.Inicializar: Boolean;
begin
    FDriverList := GetDriverList;
    Result := FDriverList.Count > 0;
    if Result then begin
        cbDrivers.Items.Assign(FDriverList);
        cbDrivers.ItemIndex := 0;
        FCap := TVideoCap.Create(Self);
        //No queremos que escriba un AVI
        FCap.CapToFile := False;
        // CallBack
        FCap.OnVideoStream := OnVideoStream;
        // Configuración
        FCap.Width  := 320;
        FCap.Height := 240;
        FCap.Parent := Panel1;
        //Drivers
        FCap.CapAudio       := False;
//        FCap.DriverIndex    := 0;//cbDrivers.ItemIndex;
    end;
end;

procedure TfrmTomarFoto.Finalizar;
begin
// Detener Dispositivo
    if FCap.VideoPreview then begin
        FCap.DriverOpen := False;
        FCap.VideoPreview := False;
    end;
end;

procedure TfrmTomarFoto.CmdTomarFotoClick(Sender: TObject);
begin
    FBitMapInfo := FCap.BitmapInfo;
    FCap.StartCapture;
    Sleep(100);
end;

procedure TfrmTomarFoto.FormShow(Sender: TObject);
begin
//    if not FCap.VideoPreview then begin
//       FCap.DriverOpen := True;
//       FCap.VideoPreview := True;
//    end;
end;

procedure TfrmTomarFoto.OnVideoStream(sender: TObject; lpVhdr: PVIDEOHDR);
var
    t: AnsiString;
begin
     Sleep(400);
    try
        FrameToBitmap(Bitmap, lpVhdr^.lpData, FBitMapInfo);
        FCap.StopCapture;
        with Bitmap.Canvas do begin
            Font.Color:= clYellow;
            SetBkMode(Handle, Windows.transparent);
            t:= DateTimeToStr(Now);
            Textout(10, FBitMapInfo.bmiHeader.biHeight - textheight(text), t);
            yatomada := True;
        end;
    finally
        cmdCerrar.Click;
    end;
end;


procedure TfrmTomarFoto.cmdCerrarClick(Sender: TObject);
begin
    Self.ModalResult := mrOk;
    Self.Close;
end;

procedure TfrmTomarFoto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Finalizar;
        Action := caFree;
end;

procedure TfrmTomarFoto.cmdPreviewClick(Sender: TObject);
begin
    FCap.DriverIndex    := cbDrivers.ItemIndex;
    if not FCap.VideoPreview then begin
       FCap.DriverOpen := True;
       FCap.VideoPreview := True;
    end;
    yatomada := False;
end;

end.
