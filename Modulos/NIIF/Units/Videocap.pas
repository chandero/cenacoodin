{********************************** File Header ********************************
File Name   : Videocap.pas
Author      : gcasais
Date Created: 21/01/2004
Language    : ES-AR
Description : Objetos, Wrappers y métodos para VFW
*******************************************************************************}
unit Videocap;

interface

 uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,stdctrls,
  ExtCtrls, VFW, MMSystem, SyncObjs;

type
// Audio
 TChannel = (Stereo, Mono);
 TFrequency = (f8000Hz, f11025Hz, f22050Hz, f44100Hz);
 TResolution  = (r8Bit, r16Bit);

type
  TCapStatusProc        = procedure (Sender: TObject) of object;
  TCapStatusCallback    = procedure (Sender:TObject; nID:integer; status:string) of object;
  TVideoStream          = procedure (sender:TObject; lpVhdr:PVIDEOHDR) of object;
  TAudioStream          = procedure (sender:TObject; lpWHdr:PWAVEHDR) of object;
  TError                = procedure (sender:TObject; nID:integer; errorstr:string) of object;


// Excepciones

type ENoDriverException      = class(Exception);
type ENoCapWindowException   = class(Exception);
type ENotConnectException    = class(Exception);
type ENoOverlayException     = class(Exception);
type EFalseFormat            = class(Exception);
type ENotOpen                = class(Exception);
type EBufferFileError        = class(Exception);


type
TAudioFormat = class (TPersistent)
   private
    FChannels :TChannel;
    FFrequency:TFrequency;
    FRes      :TResolution;
  private
    procedure SetAudio(Handle:Thandle);
  public
   constructor Create;
   published
     property Channels: TChannel read FChannels write Fchannels      default Mono;
     property Frequency: TFrequency read FFrequency write fFrequency default f8000Hz;
     property Resolution : TResolution read FRes write FRes          default r8Bit;
 end;

type
  TVideoCap = class(TCustomControl)
  private
   fdriverIndex         : Integer;
   fVideoDriverName     : String;
   fhCapWnd             : THandle;
   fpDrivercaps         : PCapDriverCaps;
   fpDriverStatus       : pCapStatus;
   fscale               : Boolean;
   fprop                : Boolean;
   fpreviewrate         : Word;
   fmicrosecpframe      : Cardinal;
   fCapVideoFileName    : String;
   fTempFileName        : String;
   fTempFileSize        : Word;
   fCapSingleImageFileName : String;
   fcapAudio               : Boolean;
   fcapTimeLimit           : Word;
   fIndexSize              : Cardinal;
   fcapToFile              : Boolean;
   FAudioFormat            : TAudioFormat;
   fCapStatusProcedure     : TCapStatusProc;
   fcapStatusCallBack      : TCapStatusCallback;
   fcapVideoStream         : TVideoStream;
   fcapAudioStream         : TAudiostream;
   fcapFrameCallback       : TVideoStream;
   fcapError               : TError;

   procedure Setsize(var msg:TMessage); message WM_SIZE;
   function GetDriverCaps: Boolean;
   procedure DeleteDriverProps;
   procedure CreateTmpFile (drvopn: Boolean);
   function GetDriverStatus (callback:boolean): Boolean;
   Procedure SetDriverOpen (value: Boolean) ;
   function GetDriverOpen : Boolean;
   function GetPreview: Boolean;
   function GetOverlay: Boolean;
   procedure SizeCap;
   procedure Setprop (value: Boolean);
   procedure SetMicroSecPerFrame(value: Cardinal);
   procedure setFrameRate (value: Word);
   function  GetFrameRate: Word;

   procedure SetDriverIndex(value:integer);
   function CreateCapWindow:boolean;
   procedure DestroyCapwindow;
   function GetCapWidth:word;
   function GetCapHeight:word;
   function  GetHasDlgVFormat  : Boolean;
   function  GetHasDlgVDisplay : Boolean;
   function  GetHasDlgVSource  : Boolean;
   function  GetHasVideoOverlay: Boolean;
   procedure Setoverlay(value:boolean);
   procedure SetPreview(value:boolean);
   procedure SetScale(value:Boolean);
   procedure SetpreviewRate(value:word);
   function GetCapInProgress:boolean;
   procedure SetIndexSize(value:cardinal);
   function GetBitMapInfoNP:TBITMAPINFO;
   function GetBitmapHeader:TBitmapInfoHeader;
   procedure SetBitmapHeader(Header:TBitmapInfoHeader);
   procedure SetBufferFileSize(value:word);


//  CallBacks de captura
    procedure SetStatCallBack(value:TCapStatusCallback);
    procedure SetCapVideoStream(value:TVideoStream);
    procedure SetCapAudioStream(value:TAudioStream);
    procedure SetCapFrameCallback(value:TVideoStream);
    procedure SetCapError(value:TError);

  public
     procedure SetDriverName(value:String);
     constructor Create(AOwner: TComponent); override;
     destructor destroy; override;
     property  HasDlgFormat:Boolean read GetHasDlgVFormat;
     property  HasDlgDisplay:Boolean read GetHasDlgVDisplay;
     property  HasDlgSource:Boolean read GetHasDlgVSource;
     property  HasVideoOverlay:boolean read GetHasVideoOverlay;
     property  CapWidth: word read GetCapWidth;
     property  CapHeight: word read GetCapHeight;
     property  CapInProgess: boolean read getCapinProgress;
     property  BitMapInfo:TBitmapinfo read GetBitmapInfoNP;
//  Header Bitmapinfo
    function DlgVFormat:Boolean;
    function DlgVDisplay:boolean;
    function DlgVSource:boolean;
    function DlgVCompression:Boolean;
    function GrabFrame:boolean;
    function GrabFrameNoStop:boolean;
    function SaveAsDIB:Boolean;
    function SaveToClipboard:Boolean;
    function StartCapture:Boolean;
    function StopCapture:Boolean;
    function GetBitmapInfo(var p:Pointer):integer;
    procedure SetBitmapInfo(p:Pointer;size:integer);
    property  BitMapInfoHeader:TBitmapInfoHeader read GetBitmapHeader write SetBitmapHeader;
    function SaveCap:boolean;
    function CapSingleFramesOpen:boolean;
    function CapSingleFramesClose:boolean;
    function CapSingleFrame:boolean;
 published
   property align;
   property color;
   property visible;
   property DriverOpen: boolean read getDriveropen write setDriverOpen;
   property DriverIndex:integer read fdriverindex write SetDriverIndex;
   property DriverName: string read fVideoDriverName write SetDrivername;
   property VideoOverlay:boolean read GetOverlay write SetOverlay;
   property VideoPreview:boolean read GetPreview write SetPreview;
   property PreviewScaleToWindow:boolean read fscale write Setscale;
   property PreviewScaleProportional:boolean read  fprop write Setprop;
   property PreviewRate:word read fpreviewrate write SetpreviewRate;
   property MicroSecPerFrame:cardinal read  fmicrosecpframe write SetMicroSecPerFrame;
   property FrameRate:word read  getFramerate write setFrameRate;
   Property CapAudio:Boolean read fcapAudio write fcapAudio;
   property VideoFileName:string read fCapVideoFileName   write fCapVideoFileName;
   property SingleImageFile:string read FCapSingleImageFileName write FCapSingleImageFileName;
   property CapTimeLimit:word read fCapTimeLimit write fCapTimeLimit;
   property CapIndexSize:cardinal read findexSize write setIndexSize;
   property CapToFile:boolean read fcaptoFile write fcapToFile;
   property CapAudioFormat:TAudioformat read FAudioformat write FAudioFormat;
   property BufferFileSize:word read ftempfilesize write SetBufferFileSize;
   property OnStatus:TCapStatusProc read fCapStatusProcedure write FCapStatusProcedure;
   property OnStatusCallback:TCapStatusCallback read fcapStatuscallback write SetStatCallback;
   property OnVideoStream:TVideoStream read fcapVideoStream write SetCapVideoStream;
   property OnFrameCallback:TVideoStream read FcapFramecallback write SetCapFrameCallback;
   property OnAudioStream:TAudioStream read fcapAudioStream write SetCapAudioStream;
   property OnError:TError read fcapError write SetCapError;
   property OnMouseMove;
   property OnMouseUp;
   property OnMouseDown;
   property OnClick;
   Property OnDblClick;
 end;


function GetDriverList: TStringList;
procedure FrameToBitmap(Bitmap:TBitmap;FrameBuffer:pointer; BitmapInfo:TBitmapInfo);
procedure BitmapToFrame(Bitmap:TBitmap; FrameBuffer:pointer; BitmapInfo:TBitmapInfo);


implementation


function StatusCallbackProc(hWnd : HWND; nID : Integer; lpsz : Pchar): LongInt; stdcall;
var
    Control:TVideoCap;
begin
    Control:=TVideoCap(capGetUserData(hwnd));
    if assigned(control) then begin
        if assigned(control.fcapStatusCallBack) then
            control.fcapStatusCallBack(control,nId,strPas(lpsz));
    end;
    Result:= 1;
end;

// Callback para video stream
function VideoStreamCallbackProc(hWnd:Hwnd; lpVHdr:PVIDEOHDR):longint; stdcall;
 var
    Control:TVideoCap;
begin
    Control:= TVideoCap(capGetUserData(hwnd));
    if Assigned(control) then begin
        if Assigned(control.fcapVideoStream ) then
            control.fcapVideoStream(control,lpvHdr);
    end;
    Result:= 1;
end;

function FrameCallbackProc(hwnd:Hwnd; lpvhdr:PVideoHdr):longint;stdcall;
var
    Control:TVideoCap;
begin
    Control:= TVideoCap(capGetUserData(hwnd));
    if Assigned(Control) then begin
        if Assigned(Control.fcapFrameCallback ) then
            Control.fcapFrameCallback(control,lpvHdr);
    end;
    Result:= 1;
end;

function AudioStreamCallbackProc(hwnd:HWND;lpWHdr:PWaveHdr):longInt; stdcall;
var
    Control: TVideoCap;
begin
    Control:= TVideoCap(capGetUserData(hwnd));
    if assigned(control) then
        if assigned(control.fcapAudioStream) then begin
            Control.fcapAudioStream(control,lpwhdr);
        end;
    Result:= 1;
end;


function ErrorCallbackProc(hwnd:HWND;nId:integer;lzError:Pchar):longint;stdcall;
var
    Control:TVideoCap;
begin
 Control:= TVideoCap(capGetUserData(hwnd));
 if assigned(control) then
  if assigned(control.fcaperror) then begin
     control.fcapError(control,nId,StrPas(lzError));
    end;
    result:= 1;
end;



function WCapproc(hw:THandle;messa:DWord; w:wParam; l:lParam):integer;stdcall;
 var
    oldwndProc:Pointer;
    parentWnd:Thandle;
 begin
    oldwndproc:=Pointer(GetWindowLong(hw,GWL_USERDATA));
    case Messa of
     WM_MOUSEMOVE,
     WM_LBUTTONDBLCLK,
     WM_LBUTTONDOWN,WM_RBUTTONDOWN,WM_MBUTTONDOWN ,
     WM_LBUTTONUP,WM_RBUTTONUP,WM_MBUTTONUP:
       begin
        ParentWnd:=Thandle(GetWindowLong(hw,GWL_HWNDPARENT));
        sendMessage(ParentWnd,messa,w,l);
        result := integer(true);
       end
    else
       result:= callWindowProc(oldwndproc,hw,messa,w,l);
   end;
end;

constructor TVideoCap.Create(aowner:TComponent);
begin
    inherited create(aowner);
    height                  := 240;
    width                   := 320;
    Color                   := clWhite;
    fVideoDriverName        := '';
    fdriverindex            := -1 ;
    fhCapWnd                := 0;
    fCapVideoFileName       := 'Video.avi';
    fCapSingleImageFileName := 'Capture.bmp';
    fscale                  := false;
    fprop                   := false;
    fpreviewrate            := 15;
    fmicrosecpframe         := 66667;
    fpDrivercaps            := nil;
    fpDriverStatus          := nil;
    fcapToFile              := true;
    findexSize              := 0;
    ftempFileSize           := 0;
    fCapStatusProcedure     := nil;
    fcapStatusCallBack      := nil;
    fcapVideoStream         := nil;
    fcapAudioStream         := nil;
    FAudioformat:= TAudioFormat.Create;
end;

Destructor TVideoCap.destroy;
Begin
    DestroyCapWindow;
    deleteDriverProps;
    fAudioformat.free;
    inherited destroy;
end;

procedure TVideoCap.SetSize(var msg:TMessage);
begin
    if (fhCapWnd <> 0) and (Fscale) then begin
        if msg.msg = WM_SIZE then SizeCap;
    end;
end;


procedure TVideoCap.SizeCap;
var
    h,w:integer;
    f,cf:single;
begin
    if not fscale then MoveWindow(fhcapWnd,0,0,Capwidth,capheight,true) else begin
        if fprop then begin
            f:= Width/height;
            cf:= CapWidth/CapHeight;
            if f >  cf then begin
                h:= height;
                w:= round(h*cf);
            end else begin
                w:= width;
                h:= round(w*1/cf);
            end
        end else begin
            h:= height;
            w:= Width;
       end;
       MoveWindow(fhcapWnd,0,0,w, h,true);
    end;
end;

procedure TVideoCap.DeleteDriverProps;
begin
    if assigned(fpDrivercaps) then begin
        Dispose(fpDrivercaps);
      fpDriverCaps:= nil;
    end;
    if assigned(fpDriverStatus) then begin
       dispose(fpDriverStatus);
       fpDriverStatus:= nil;
    end;
 end;

procedure TVideoCap.CreateTmpFile(drvOpn:boolean);
var
    s,f: Array [0..MAX_PATH] of char;
    size :Word;
    ok   :Boolean;
    e    :Exception;

begin
   if (ftempFileName ='') and (ftempFileSize = 0) then exit;
   if drvOpn then Size := ftempFileSize else size:=0;
   if fTempFileName = '' then begin
       GetTempPath(sizeof(s),@s);
       GetTempFileName(s,'cap',0,f);
       ftempfilename := f;
   end;
   if size <> 0 then begin
       capFileSetCaptureFile(fhCapWnd,strpCopy(f,ftempfilename));
       ok:=capFileAlloc(fhcapWnd, 1024 * 1024 * ftempFileSize);
      if not ok then begin
         e:= EBufferFileError.Create('No se puede crear el archivo temporal');
         raise e;
      end;
    end else begin
        capFileSetCaptureFile(fhCapWnd,strpCopy(f, fCapVideoFileName));
        DeleteFile(fTempfileName);
        fTempFileName:= '';
    end;
 end;

procedure TVideoCap.SetBufferFileSize(Value:word);
begin
   if value = fTempFilesize then exit;
   ftempFileSize:=value;
   if DriverOpen Then CreateTmpFile(true);
end;

function TVideoCap.GetDriverCaps:boolean;
var
    savestat : integer;
begin
    result:= false;
   if assigned(fpDrivercaps) then begin
       result:= true;
       exit;
   end;
   if fdriverIndex = -1 then exit;
   savestat := fhCapwnd;
   if fhCapWnd = 0 then CreateCapWindow;
   if fhCapWnd = 0 then exit;
   new(fpDrivercaps);
   if capDriverGetCaps(fhCapWnd, fpDriverCaps, sizeof(TCapDriverCaps)) then begin
        result:= true;
        if savestat = 0 then destroyCapWindow;
        exit;
   end;
   Dispose(fpDriverCaps);
   fpDriverCaps := nil;
   if savestat = 0 then destroyCapWindow;
 end;

function TVideoCap.GetBitMapInfoNp:TBitmapinfo;
var
    e:Exception;
begin
    if DriverOpen then begin
        capGetVideoFormat(fhcapWnd, @result,sizeof(TBitmapInfo));
        exit;
    end ;
    FillChar(result, sizeof(TBitmapInfo),0);
    e:= ENotOpen.Create('El Driver está cerrado');
    raise e;
end;

function TVideoCap.GetBitMapInfo(var p:Pointer):integer;
var
    size:integer;
    e:Exception;
begin
    p:=nil;
    if driverOpen then begin
        Size:= capGetVideoFormat(fhcapWnd,p,0);
        GetMem(p,size);
        capGetVideoFormat(fhcapwnd,p,size);
        result:=size;
        exit;
    end;
    e:= ENotOpen.Create('El Driver está cerrado');
    raise e;
end;


procedure TVideoCap.SetBitmapInfo(p:Pointer;size:integer);
var
    e: Exception;
    supported: Boolean;
begin
    if driverOpen then begin
        supported:=capSetVideoFormat(fhcapWnd,p,size);
        if not supported then begin
            e:=EFalseFormat.Create('Formato no soportado' );
            raise e;
        end;
        Exit;
    end;
    e:= ENotOpen.Create('El Driver está cerrado');
    raise e;
end;


function TVideoCap.GetBitMapHeader:TBitmapinfoHeader;
var
    e:Exception;
begin
    if DriverOpen then begin
        capGetVideoFormat(fhcapWnd, @result,sizeof(TBitmapInfoHeader));
        exit;
    end;
    FillChar(result,sizeof(TBitmapInfoHeader),0);
    e:= ENotOpen.Create('El Driver está cerrado');
    raise e;
end;

procedure TVideoCap.SetBitMapHeader(header:TBitmapInfoHeader);
var
    e: Exception;
begin
  if driveropen then begin
        if not capSetVideoFormat(fhcapWnd,@header,sizeof(TBitmapInfoHeader)) then begin
            e:= EFalseFormat.Create('Formato no soportado');
            raise e;
        end;
        exit;
   end else begin
        e:= ENotOpen.Create('El Driver está cerrado');
        raise e;
   end;
end;


function TVideoCap.getDriverStatus(callback:boolean):boolean;
begin
  result := false;
  if fhCapWnd <> 0 then begin
        if not assigned(fpDriverstatus) then new(fpDriverStatus);
        if capGetStatus(fhCapWnd,fpdriverstatus, sizeof(TCapStatus)) then begin
            result:= true;
        end;
  end;
 if assigned(fCapStatusProcedure)and callback then fcapStatusProcedure (Self);
end;

procedure TVideoCap.SetDrivername(value:string);
var i:integer;
    name:array[0..80] of char;
    ver :array[0..80] of char;
begin
 if fVideoDrivername = value then exit;
 for i:= 0 to 9 do
  if capGetDriverDescription( i,name,80,ver,80) then
    if strpas(name) = value then
     begin
      fVideoDriverName := value;
      Driverindex:= i;
      exit;
    end;
 fVideoDrivername:= '';
 DriverIndex:= -1;
end;


procedure TVideoCap.SetDriverIndex(value:integer);
var  name:array[0..80] of char;
     ver :array[0..80] of char;

begin
  if value = fdriverindex then exit;
  destroyCapWindow;
  deleteDriverProps;
  if value > -1 then
    begin
     if capGetDriverDescription(value,name,80,ver,80) then
        fVideoDriverName:= StrPas(name)
     else
       value:= -1;
   end;
 if value = -1 then  fvideoDriverName:= '';
 fdriverindex:= value;
end;

function TVideoCap.CreateCapWindow;
var
    Ex:Exception;
    savewndproc:integer;
begin
    if fhCapWnd <> 0 then begin
      result:= true;
      exit;
    end;

    if fdriverIndex = -1 then begin
        Ex := ENoDriverException.Create('No hay un driver seleccionado');
        GetDriverStatus(true);
        raise ex;
        exit;
    end;

    fhCapWnd :=
    capCreateCaptureWindow( PChar(Name),
        WS_CHILD or WS_VISIBLE , 0, 0,
            Width, Height, Handle, 5001);
    if fhCapWnd =0 then begin
       Ex:= ENoCapWindowException.Create('No se puede crear la ventana de captura');
       GetDriverStatus(true);
       raise ex;
       exit;
    end;


    capSetUserData(fhCapwnd,integer(self));

    savewndproc:=SetWindowLong(fhcapWnd,GWL_WNDPROC,integer(@WCapProc));

    SetWindowLong(fhcapWnd,GWL_USERDATA,savewndProc);

    if assigned(fcapStatusCallBack ) then capSetCallbackOnStatus(fhcapWnd , @StatusCallbackProc);
    if assigned(fcapFrameCallback) then capSetCallbackOnFrame(fhcapWnd, @FrameCallbackProc);
    if assigned(fcapError) then capSetCallbackOnError(fhcapWnd, @ErrorCallBackProc);
    if assigned(fcapVideoStream) then capSetCallbackOnVideoStream(fhcapwnd, @VideoStreamCallbackProc);
    if assigned(fcapAudioStream) then capSetCallbackOnWaveStream(fhcapWnd, @AudioStreamCallbackProc);

    if not capDriverConnect(fhCapWnd, fdriverIndex) then begin
        Ex:= ENotConnectException.Create('No se puede conectar el driver con la ventana de captura');
        Destroycapwindow;
        GetDriverStatus(true);
        raise ex;
        exit;
    end;


    CreateTmpFile(True);
    capPreviewScale(fhCapWnd, fscale);
    capPreviewRate(fhCapWnd, round( 1/fpreviewrate*1000));
    GetDriverStatus(true);
    Sizecap;
    result:= true;
end;

procedure TVideoCap.SetStatCallBack(value:TCapStatusCallback);
begin
 fcapStatusCallBack := value;
 if DriverOpen then
   if assigned(fcapStatusCallBack) then
      capSetCallbackOnStatus(fhcapWnd , @StatusCallbackProc)
   else
    capSetCallbackOnStatus(fhcapWnd ,nil);
end;


procedure TVideoCap.SetCapVideoStream(value:TVideoStream);
 begin
  fcapVideoStream:= value;
  if DriverOpen then
   if assigned(fcapVideoStream) then
     capSetCallbackOnVideoStream(fhcapwnd, @VideoStreamCallbackProc)
   else
    capSetCallbackOnVideoStream(fhcapwnd, nil);
 end;

procedure TVideoCap.SetCapFrameCallback(value:TVideoStream);
begin
 fcapframeCallback:= value;
 if DriverOpen then
   if assigned(fcapFrameCallback) then
     capSetCallbackOnFrame(fhcapwnd, @FrameCallBackProc)
   else
    capSetCallbackOnFrame(fhcapwnd, nil);
 end;



procedure TVideoCap.SetCapAudioStream(value:TAudioStream);
  begin
   fcapAudioStream:= value;
    if DriverOpen then
     if assigned(fcapAudioStream) then
       capSetCallbackOnWaveStream(fhcapWnd, @AudioStreamCallbackProc)
     else
      capSetCallbackOnWaveStream(fhcapWnd,nil);
  end;


 procedure TVideoCap.SetCapError(value:TError);
 begin
  fcapError:= value;
  if DriverOpen then
     if assigned(fcapError) then
       capSetCallbackOnError(fhcapWnd, @ErrorCallbackProc)
     else
      capSetCallbackOnError(fhcapWnd,nil);
 end;

procedure TVideoCap.DestroyCapWindow;
begin
  if fhCapWnd = 0 then exit;
  CreateTmpFile(False);
  CapDriverDisconnect(fhCapWnd);
  SetWindowLong(fhcapWnd,GWL_WNDPROC,GetWindowLong(fhcapwnd,GWL_USERDATA));
  DestroyWindow( fhCapWnd ) ;
  fhCapWnd := 0;
end;

function  TVideoCap.GetHasVideoOverlay:Boolean;
begin
   if getDriverCaps then
     Result := fpDriverCaps^.fHasOverlay
   else
     result:= false;
 end;

function  TVideoCap.GetHasDlgVFormat:Boolean;
begin
  if getDriverCaps then
     Result := fpDriverCaps^.fHasDlgVideoFormat
   else
     result:= false;
end;

function  TVideoCap.GetHasDlgVDisplay : Boolean;

begin
  if getDriverCaps then
     Result := fpDriverCaps^.fHasDlgVideoDisplay
   else
     result:= false;
end;

function  TVideoCap.GetHasDlgVSource  : Boolean;
begin
  if getDriverCaps then
     Result := fpDriverCaps^.fHasDlgVideoSource
   else
     result:= false;
end;


function TVideoCap.DlgVFormat:boolean;
var
    savestat : integer;
begin
   result:= false;
   if fdriverIndex = -1 then exit;
   savestat := fhCapwnd;
   if fhCapWnd = 0 then if not CreateCapWindow then exit;
   result :=capDlgVideoFormat(fhCapWnd);
   if result then GetDriverStatus(true);
   if savestat = 0 then destroyCapWindow;
   if result then begin
        Sizecap;
        Repaint;
   end;
end;

function TVideoCap.DlgVDisplay:boolean;
var
    savestat : integer;
begin
   result:= false;
   if fdriverIndex = -1 then exit;
   savestat := fhCapwnd;
   if fhCapWnd = 0 then
       if not CreateCapWindow then exit;
   result:=capDlgVideoDisplay(fhCapWnd) ;
   if result then GetDriverStatus(true);
   if savestat = 0 then destroyCapWindow;
   if result then begin
        SizeCap;
        Repaint;
  end;
end;


function TVideoCap.DlgVSource:boolean;
var
    savestat : integer;
begin
    result:= false;
    if fdriverIndex = -1 then exit;
    savestat := fhCapwnd;
    if fhCapWnd = 0 then
    if not createCapWindow then exit;
    result:= capDlgVideoSource(fhCapWnd);
    if result then GetDriverStatus(true);
    if savestat = 0 then destroyCapWindow;
    if result then begin
        SizeCap;
        Repaint;
    end;
end;


function TVideoCap.DlgVCompression;
var
    savestat : integer;
begin
    result:= false;
    if fdriverIndex = -1 then exit;
    savestat := fhCapwnd;
    if fhCapWnd = 0 then
    if not createCapWindow then exit;
    result:=capDlgVideoCompression(fhCapWnd);
    if savestat = 0 then destroyCapWindow;
end;



function TVideoCap.GrabFrame:boolean;
begin
    result:= false;
    if not DriverOpen then exit;
    Result:= capGrabFrame(fhcapwnd);
    if result then GetDriverStatus(true);
end;

function TVideoCap.GrabFrameNoStop:boolean;
begin
    result:= false;
    if not DriverOpen then exit;
    Result:= capGrabFrameNoStop(fhcapwnd);
    if result then GetDriverStatus(true);
end;

function TVideoCap.SaveAsDIB:Boolean;
var
  s:array[0..MAX_PATH] of char;
begin
    result:= false;
   if not DriverOpen then exit;
   result := capFileSaveDIB(fhcapwnd,strpCopy(s,fCapSingleImageFileName));
end;

function  TVideoCap.SaveToClipboard:boolean;
begin
    result:= false;
    if not Driveropen then exit;
    result:= capeditCopy(fhcapwnd);
end;

procedure TVideoCap.Setoverlay(value:boolean);
var
    ex:Exception;
begin
    if value = GetOverlay then exit;
    if gethasVideoOverlay = false then begin
        Ex:= ENoOverlayException.Create('El driver no soporta OverLay');
        raise ex;
        exit;
    end;
    if value = true then begin
        if fhcapWnd = 0 then  CreateCapWindow;
        GrabFrame;
    end;
    capOverlay(fhCapWnd,value);
    GetDriverStatus(true);
    invalidate;
end;

function TVideoCap.GetOverlay:boolean;
begin
    if fhcapWnd = 0 then result := false
        else Result:= fpDriverStatus^.fOverlayWindow;
end;

procedure TVideoCap.SetPreview(value:boolean);
begin
    if value = GetPreview then exit;
    if value = true then
    if fhcapWnd = 0 then  CreateCapWindow;
    capPreview(fhCapWnd,value);
    GetDriverStatus(true);
    invalidate;
end;

function TVideoCap.GetPreview:boolean;
begin
if fhcapWnd = 0 then result := false
    else Result:= fpDriverStatus^.fLiveWindow;
end;



procedure TVideoCap.SetPreviewRate(value:word);
begin
    if value = fpreviewrate then exit;
    if value < 1 then value := 1;
    if value > 30 then value := 30;
    fpreviewrate:= value;
    if DriverOpen then capPreviewRate(fhCapWnd, round( 1/fpreviewrate*1000));
end;


procedure TVideoCap.SetMicroSecPerFrame(value:cardinal);
begin
    if value =  fmicrosecpframe then exit;
    if value < 33333 then value := 33333;
    fmicrosecpframe := value;
end;

procedure TVideoCap.setFrameRate(value:word);
begin
    if value <> 0 then fmicrosecpframe:= round(1.0/value*1000000.0);
end;

function  TVideoCap.GetFrameRate:word;
begin
    if fmicrosecpFrame > 0 then result:= round(1./ fmicrosecpframe * 1000000.0)
        else result:= 0;
end;


function TVideoCap.StartCapture;
var
    CapParms:TCAPTUREPARMS;
    name:array[0..MAX_PATH] of char;
begin
    result := false;
    if not DriverOpen then exit;
    capCaptureGetSetup(fhCapWnd, @CapParms, sizeof(TCAPTUREPARMS));
    if ftempfilename='' then capFileSetCaptureFile(fhCapWnd,strpCopy(name, fCapVideoFileName));
    CapParms.dwRequestMicroSecPerFrame := fmicrosecpframe;
    CapParms.fLimitEnabled    := BOOL(FCapTimeLimit);
    CapParms.wTimeLimit       := fCapTimeLimit;
    CapParms.fCaptureAudio    := fCapAudio;
    CapParms.fMCIControl      := FALSE;
    CapParms.fYield           := TRUE;
    CapParms.vKeyAbort        := VK_ESCAPE;
    CapParms.fAbortLeftMouse  := FALSE;
    CapParms.fAbortRightMouse := FALSE;
    if CapParms.fLimitEnabled then begin
        CapParms.dwIndexSize:= frameRate*FCapTimeLimit;
        if fCapAudio then
            CapParms.dwIndexSize := CapParms.dwIndexSize + 5*FCapTimeLimit;
        end
    else begin
        if CapParms.dwIndexSize = 0 then CapParms.DwIndexSize := 100000
            else CapParms.dwIndexSize := findexSize;
    end;
    if CapParms.dwIndexSize < 1800 then CapParms.dwIndexSize:= 1800;
    if CapParms.dwIndexSize > 324000 then CapParms.dwIndexSize:= 324000;
    capCaptureSetSetup(fhCapWnd, @CapParms, sizeof(TCAPTUREPARMS));
    if fCapAudio then FAudioformat.SetAudio(fhcapWnd);
    if CapToFile then result:= capCaptureSequence(fhCapWnd)
        else result := capCaptureSequenceNoFile(fhCapWnd);
    GetDriverStatus(true);
end;

function TVideoCap.StopCapture;
begin
    result:=false;
    if not DriverOpen then exit;
    result:=CapCaptureStop(fhcapwnd);
    GetDriverStatus(true);
end;

function TVideoCap.SaveCap:Boolean;
var
    name:array[0..MAX_PATH] of char;
begin
    result := capFileSaveAs(fhcapwnd,strPCopy(name,fCapVideoFileName));
end;

procedure TVideoCap.SetIndexSize(value:cardinal);
begin
    if value = 0 then begin
        findexSize:= 0;
        exit;
    end;
    if value < 1800 then value := 1800;
    if value > 324000 then value := 324000;
    findexsize:= value;
end;


function TVideoCap.GetCapInProgress:boolean;
begin
    result:= false;
    if not DriverOpen then exit;
    GetDriverStatus(false);
    result:= fpDriverStatus^.fCapturingNow ;
end;

Procedure TVideoCap.SetScale(value:boolean);
begin
    if value = fscale then  exit;
    fscale:= value;
    if DriverOpen then begin
        capPreviewScale(fhCapWnd, fscale);
        SizeCap;
    end;
    Repaint;
end;

Procedure TVideoCap.Setprop(value:Boolean);
begin
    if value = fprop then exit;
    fprop:=value;
    if DriverOpen then Sizecap;
    Repaint;
end;

function TVideoCap.GetCapWidth;
begin
    if assigned(fpDriverStatus) then result:= fpDriverStatus^.uiImageWidth
        else Result:= 0;
end;

function TVideoCap.GetCapHeight;
begin
    if assigned(fpDriverStatus) then result:= fpDriverStatus^.uiImageHeight
        else Result:= 0;
end;

Procedure TVideoCap.SetDriverOpen(value:boolean);
begin
    if value = GetDriverOpen then exit;
    if value = false then DestroyCapWindow;
    if value = true then CreateCapWindow;
end;

function TVideoCap.GetDriverOpen:boolean;
begin
    result := fhcapWnd <> 0;
end;

function TVideoCap.CapSingleFramesOpen:boolean;
var
    name :array [0..MAX_PATH] of char;
    CapParms:TCAPTUREPARMS;

begin
    result := false;
    if not DriverOpen then exit;
    capCaptureGetSetup(fhCapWnd, @CapParms, sizeof(TCAPTUREPARMS));
    if ftempfilename='' then capFileSetCaptureFile(fhCapWnd,strpCopy(name, fCapVideoFileName));
    CapParms.dwRequestMicroSecPerFrame := fmicrosecpframe;
    CapParms.fLimitEnabled    := BOOL(0);
    CapParms.fCaptureAudio    := false;
    CapParms.fMCIControl      := FALSE;
    CapParms.fYield           := TRUE;
    CapParms.vKeyAbort        := VK_ESCAPE;
    CapParms.dwIndexSize := findexSize;
    if CapParms.dwIndexSize < 1800 then CapParms.dwIndexSize:= 1800;
    if CapParms.dwIndexSize > 324000 then CapParms.dwIndexSize:= 324000;
    capCaptureSetSetup(fhCapWnd, @CapParms, sizeof(TCAPTUREPARMS));
    result:= capCaptureSingleFrameOpen(fhcapWnd);
end;

function TVideoCap.CapSingleFramesClose:boolean;
var
    E:Exception;
begin
    if not driverOpen then begin
        e:= ENotOpen.Create('El driver no está activo');
        raise e;
        exit;
    end;
    result:= CapCaptureSingleFrameClose(fhcapWnd);
end;

function TVideoCap.CapSingleFrame:boolean;
var
    E:Exception;
begin
    if not driverOpen then begin
        e:= ENotOpen.Create('El driver no está activo');
        raise e;
        exit;
    end;
    result:= CapCaptureSingleFrame(fhcapWnd);
end;

constructor TAudioFormat.create;
begin
     inherited create;
     FChannels:=Mono;
     FFrequency:=f8000Hz;
     Fres:=r8Bit;
end;

procedure TAudioFormat.SetAudio(handle:Thandle);
Var
    WAVEFORMATEX:TWAVEFORMATEX;
begin
     if handle= 0 then exit;
     capGetAudioFormat(handle,@WAVEFORMATEX, SizeOf(TWAVEFORMATEX));
     case FFrequency of
          f8000hz  :WAVEFORMATEX.nSamplesPerSec:=8000;
          f11025Hz:WAVEFORMATEX.nSamplesPerSec:=11025;
          f22050Hz:WAVEFORMATEX.nSamplesPerSec:=22050;
          f44100Hz:WAVEFORMATEX.nSamplesPerSec:=44100;
     end;
     WAVEFORMATEX.nAvgBytesPerSec:= WAVEFORMATEX.nSamplesPerSec;
     if FChannels=Mono then
          WAVEFORMATEX.nChannels:=1
     else
          WAVEFORMATEX.nChannels:=2;
     if FRes=r8Bit then
        WAVEFORMATEX.wBitsPerSample:=8
     else
        WAVEFORMATEX.wBitsPerSample:=16;
     capSetAudioFormat(handle,@WAVEFORMATEX, SizeOf(TWAVEFORMATEX));
end;

Function GetDriverList:TStringList;
var
    i: integer;
    Name: array[0..80] of char;
    Ver : array[0..80] of char;
begin
    result:= TStringList.Create;
    result.Capacity:= 10;
    result.Sorted:= false;
    for i:= 0 to 9 do begin
        if capGetDriverDescription(i, Name, Length(Name), Ver, Length(Ver)) then begin
            Result.Add(StrPas(name) + ' ' + StrPas(Ver));
        end else begin
            Exit;
        end;
    end;
end;

procedure FrameToBitmap(Bitmap: TBitmap; FrameBuffer: Pointer; BitmapInfo:TBitmapInfo);
var
    hdd:Thandle;
begin
    with Bitmap  do begin
        Width:= BitmapInfo.bmiHeader.biWidth;
        Height:=Bitmapinfo.bmiHeader.biHeight;
        hdd:= DrawDibOpen;
        DrawDibDraw(hdd,canvas.handle,0,0,BitmapInfo.BmiHeader.biwidth,BitmapInfo.bmiheader.biheight,@BitmapInfo.bmiHeader,
        frameBuffer,0,0,bitmapInfo.bmiHeader.biWidth,bitmapInfo.bmiHeader.biheight,0);
        DrawDibClose(hdd);
    end;
end;



procedure BitmapToFrame(Bitmap:TBitmap; FrameBuffer:pointer; BitmapInfo:TBitmapInfo);
var
    ex:Exception;
begin
    if bitmapInfo.bmiHeader.BiCompression <> bi_RGB then begin
        ex:=  EFalseFormat.Create('El formato DIB no está soportado ');
        raise ex ;
    end;
    with Bitmap do
        GetDiBits(canvas.handle,handle,0,BitmapInfo.bmiHeader.biheight,FrameBuffer,BitmapInfo,DIB_RGB_COLORS);
    end;
end.
