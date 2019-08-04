unit UnitVerificarHuella;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  OleServer,
  ComObj,
  OleCtrls,
  ActiveX,
  AXCtrls,
  DPSDKOPSLib_TLB,
  DpSdkEngLib_TLB,
  ExtCtrls,
  StdCtrls,
  Buttons, DPFPEngXLib_TLB, DPFPDevXLib_TLB, DPFPShrXLib_TLB;

type
    TfrmVerify = class(TForm)
    Image1: TImage;
    DPFPVerification: TDPFPVerification;
    DPFPCapture: TDPFPCapture;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DPFPCaptureComplete(ASender: TObject;
      const ReaderSerNum: WideString; const pSample: IDispatch);

  private
//     pvData:array[0..2047] of Byte;
     ValidacionOK:Boolean;
     DPFPTemplateSet : IDispatch;
    procedure Process(pSample: IDispatch);
    procedure DrawFingerPrint(pBitmap: IDispatch);
    procedure StopCapture();
    function ConvertSampleToBitmap(pSample: IDispatch): IDispatch;
    function ExtractFeatures(pSample : IDispatch; dPurpose: DPFPDataPurposeEnum): IDispatch;

        { Private declarations }
  public
     property TemplateSet:IDispatch read DPFPTemplateSet write DPFPTemplateSet;
     property Validacion:Boolean read ValidacionOk Write ValidacionOk;
    { Public declarations }
  end;

var
  frmVerify: TfrmVerify;

implementation

{$R *.DFM}


procedure TfrmVerify.FormShow(Sender: TObject);
begin
        Image1.Picture := nil;
        DPFPCapture.StartCapture;
end;

procedure TfrmVerify.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Action := caHide;
end;

procedure TfrmVerify.DPFPCaptureComplete(ASender: TObject;
  const ReaderSerNum: WideString; const pSample: IDispatch);
begin
       Process(pSample);
end;

procedure TfrmVerify.Process(pSample: IDispatch);
var
  FeatureSet : IDispatch;
  Response : IDPFPVerificationResult;
begin
       FeatureSet := ExtractFeatures(pSample, DataPurposeVerification);
       if (FeatureSet <> nil) then
       begin
          Response := DPFPVerification.Verify(FeatureSet, TemplateSet as DPFPShrXLib_TLB.DPFPTemplate) as DPFPEngXLib_TLB.DPFPVerificationResult;
          if (Response.Verified = true) then
           begin
              Validacion := true;
              ShowMessage('OK - Validación Correcta');
              self.Close;
           end
          else
              Validacion := false;
       end;
       StopCapture();
end;

function TfrmVerify.ExtractFeatures(pSample : IDispatch; dPurpose: DPFPDataPurposeEnum): IDispatch;
var
  Extractor : TDPFPFeatureExtraction;
  FeedBack :  DPFPCaptureFeedbackEnum;
  FeatureSet : IDispatch;
  Sample : TDPFPSample;
begin
       Extractor := TDPFPFeatureExtraction.Create(self);
       FeedBack := CaptureFeedbackNone;
       FeedBack := Extractor.CreateFeatureSet(pSample, dPurpose);
       FeatureSet := Extractor.FeatureSet;
       if (Feedback = CaptureFeedbackGood) then
       begin
           DrawFingerPrint(ConvertSampleToBitmap(pSample));
           result := FeatureSet;
       end
       else
           result := nil;
       
end;

procedure TfrmVerify.DrawFingerPrint(pBitmap: IDispatch);
begin
     SetOlePicture(Image1.Picture, IPictureDisp(pBitmap));
end;

function TfrmVerify.ConvertSampleToBitmap(pSample: IDispatch): IDispatch;
var
   Convertor : TDPFPSampleConversion;
   Bitmap :  IDispatch;
begin
     Convertor := TDPFPSampleConversion.Create(nil);
     Bitmap := Convertor.ConvertToPicture(pSample);
     result := Bitmap;
end;

procedure TfrmVerify.StopCapture();
begin
     DPFPCapture.StopCapture;
end;
end.


