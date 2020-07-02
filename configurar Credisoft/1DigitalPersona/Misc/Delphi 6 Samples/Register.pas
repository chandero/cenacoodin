unit Register;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleServer,ActiveX,AXCtrls,DpSdkEngLib_TLB,
  DPSDKOPSLib_TLB,OleCtrls,ExtCtrls, Verify;

type
  TfrmRegister = class(TForm)
    GroupBox1: TGroupBox;
    fpImage1: TImage;
    fpImage2: TImage;
    fpImage3: TImage;
    fpImage4: TImage;
    FPRegisterTemplate1: TFPRegisterTemplate;
    btnRegister: TButton;
    btnVerify: TButton;
    btnExit: TButton;
    txtMessage: TLabel;
    txtEvtMessage: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    procedure FPRegisterTemplate1SampleReady(Sender: TObject;
      var pSample: OleVariant);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FPRegisterTemplate1Done(Sender: TObject;
      var pTemplate: OleVariant);
    procedure FPRegisterTemplate1Error(Sender: TObject; errcode: TOleEnum);
    procedure FPRegisterTemplate1DevConnected(Sender: TObject);
    procedure FPRegisterTemplate1DevDisconnected(Sender: TObject);
    procedure FPRegisterTemplate1SampleQuality(Sender: TObject;
      Quality: TOleEnum);
    procedure btnVerifyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegister: TfrmRegister;
  sampleNumber: Integer;
  fpData : array[0..2047] of Byte;
  blobSize: Integer;
  mode : Integer;


implementation


{$R *.dfm}

procedure TfrmRegister.FPRegisterTemplate1SampleReady(Sender: TObject; var pSample: OleVariant);
var
        l_sample : IFPSample;
        l_dispatch1 : IDispatch;
        l_dispatch2 : IDispatch;

begin
   l_dispatch1 := IDispatch(pSample);
   l_dispatch1.QueryInterface(IID_IFPSample,l_sample);
   if sampleNumber = 0 then
   begin
        l_sample.Set_PictureOrientation(1);
        l_sample.Set_PictureWidth (fpImage1.Width);
        l_sample.Set_PictureHeight(fpImage1.Height);
        l_dispatch2 := l_sample.Get_Picture;
        SetOlePicture(fpImage1.Picture, IPictureDisp(l_dispatch2));
        txtEvtMessage.Caption := 'Image #1';
   end;
   if sampleNumber = 1 then
   begin
        l_sample.Set_PictureOrientation(1);
        l_sample.Set_PictureWidth (fpImage2.Width);
        l_sample.Set_PictureHeight(fpImage2.Height);
        l_dispatch2 := l_sample.Get_Picture;
        SetOlePicture(fpImage2.Picture, IPictureDisp(l_dispatch2));
        txtEvtMessage.Caption := 'Image #2';

   end ;
   if sampleNumber = 2 then
   begin
        l_sample.Set_PictureOrientation(1);
        l_sample.Set_PictureWidth (fpImage3.Width);
        l_sample.Set_PictureHeight(fpImage3.Height);
        l_dispatch2 := l_sample.Get_Picture;
        SetOlePicture(fpImage3.Picture, IPictureDisp(l_dispatch2));
        txtEvtMessage.Caption := 'Image #3';

   end;
    if sampleNumber = 3 then
   begin
        l_sample.Set_PictureOrientation(1);
        l_sample.Set_PictureWidth (fpImage4.Width);
        l_sample.Set_PictureHeight(fpImage4.Height);
        l_dispatch2 := l_sample.Get_Picture;
        SetOlePicture(fpImage4.Picture, IPictureDisp(l_dispatch2));
        txtEvtMessage.Caption := 'Image #4';

   end;

        sampleNumber := sampleNumber + 1;

 end;

procedure TfrmRegister.btnRegisterClick(Sender: TObject);
var
pErr: AIErrors;

begin
   sampleNumber := 0;
   fpImage1.Picture := nil;
   fpImage2.Picture := nil;
   fpImage3.Picture := nil;
   fpImage4.Picture := nil;
   txtEvtMessage.Caption := 'Registration Mode';
   mode := 1; //In registeration mode
   btnVerify.Enabled := False;
   FPRegisterTemplate1.Run(1,pErr);
end;

procedure TfrmRegister.btnExitClick(Sender: TObject);
begin
  application.Terminate;

end;



procedure TfrmRegister.FPRegisterTemplate1Error(Sender: TObject;
  errcode: TOleEnum);
begin
  txtEvtMessage.Caption := 'Error !!';
end;

procedure TfrmRegister.FPRegisterTemplate1DevConnected(Sender: TObject);
begin
  txtEvtMessage.Caption := 'Sensor Connected !!';
  sleep(1000);
  if mode = 1 then
     txtEvtMessage.Caption := ' Continue Registation Mode !!';

  end;

procedure TfrmRegister.FPRegisterTemplate1DevDisconnected(Sender: TObject);
begin
  txtEvtMessage.Caption := 'Sensor Disconnected !!';
end;

procedure TfrmRegister.FPRegisterTemplate1SampleQuality(Sender: TObject;
  Quality: TOleEnum);
begin
    if Quality <> Sq_Good then
    begin
      txtEvtMessage.Caption := 'Image Quality Not good !!';
      sampleNumber := sampleNumber -1;
    end

end;

procedure TfrmRegister.btnVerifyClick(Sender: TObject);
begin
    frmVerification.Show;
end;

procedure TfrmRegister.FormCreate(Sender: TObject);
begin
    btnVerify.Enabled := False;
end;

end.
