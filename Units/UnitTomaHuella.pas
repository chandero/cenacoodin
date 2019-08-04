unit UnitTomaHuella;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,ComObj,
  ExtCtrls, OleServer,Variants ,
  ActiveX,AXCtrls, OleCtrls, StdCtrls, Mask, Buttons,
  JvAni, JvxAnimate, JvGIFCtrl, DPFPDevXLib_TLB, DPFPShrXLib_TLB,
  DPFPEngXLib_TLB;

type
  TfrmRegister = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    cmd_Verify: TBitBtn;
    cmd_Start: TBitBtn;
    cmd_exit: TBitBtn;
    Arrow1: TImage;
    Arrow2: TImage;
    Arrow3: TImage;
    Arrow4: TImage;
    Arrow1a: TJvGIFAnimator;
    JvAnimatedImage1: TJvAnimatedImage;
    DPFPCapture: TDPFPCapture;
    DPFPEnrollment: TDPFPEnrollment;
    DPFPTemplate: TDPFPTemplate;
    DPFPSample: TDPFPSample;
    procedure onSample(Sender: TObject; var pSample: OleVariant);
    procedure nDone(Sender: TObject; var pTemplate: OleVariant);
    procedure nDeCon(Sender: TObject);
    procedure cmd_StartClick(Sender: TObject);
    procedure cmd_VerifyClick(Sender: TObject);
    procedure cmd_exitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DPFPCaptureComplete(ASender: TObject;
      const ReaderSerNum: WideString; const pSample: IDispatch);

  private

        sampleNumber : Integer;
        TomaHuella:Boolean;
        DPFPTemplateSet: IDispatch;
        vrnt : Variant;   //used to store the serialized template
        pImage: TPicture;
        procedure DrawFingerPrint(pBitmap: IDispatch);
        procedure Process(pSample: IDispatch);
        procedure StopCapture();
        function ConvertSampleToBitmap(pSample: IDispatch): IDispatch;
        function ExtractFeatures(pSample : IDispatch; dPurpose: DPFPDataPurposeEnum): IDispatch;
    { Private declarations }
  public
        property Image: TPicture read pImage write pImage;
        property TemplateSet: IDispatch read DPFPTemplateSet write DPFPTemplateSet;
        property Valido:Boolean read TomaHuella Write TomaHuella;
        property Template: Variant read vrnt write vrnt;
    { Public declarations }
  end;

var
  frmRegister : TfrmRegister;
  SeVerifica : boolean;
  fpData : array [0..300000] of Byte;
  FPTemplate : DPFPShrXLib_TLB.DPFPTemplate;


implementation

uses UnitVerificarHuella;

{$R *.DFM}

procedure TfrmRegister.onSample(Sender: TObject; var pSample: OleVariant);
{
var
        smple : IFPSample;
        picDis : IDispatch;
        smDisp : IDispatch;
}
begin
{
   smDisp := IDispatch(pSample);
   smDisp.QueryInterface(IID_IFPSample,smple);
   if sampleNumber = 0 then
   begin
        smple.Set_PictureOrientation(1);
        smple.Set_PictureWidth (Image1.Width);
        smple.Set_PictureHeight(Image1.Height);
        picDis := smple.Get_Picture;
        SetOlePicture(Image1.Picture, IPictureDisp(picDis));
        Arrow1.Visible := False;
        Arrow2.Visible := True;
   end;
   if sampleNumber = 1 then
   begin
        smple.Set_PictureOrientation(1);
        smple.Set_PictureWidth (Image2.Width);
        smple.Set_PictureHeight(Image2.Height);
        picDis := smple.Get_Picture;
        SetOlePicture(Image2.Picture, IPictureDisp(picDis));
        Arrow2.Visible := False;
        Arrow3.Visible := True;
   end ;
   if sampleNumber = 2 then
   begin
        smple.Set_PictureOrientation(1);
        smple.Set_PictureWidth (Image3.Width);
        smple.Set_PictureHeight(Image3.Height);
        picDis := smple.Get_Picture;
        SetOlePicture(Image3.Picture, IPictureDisp(picDis));
        Arrow3.Visible := False;
        Arrow4.Visible := True;
   end;
    if sampleNumber = 3 then
   begin
        smple.Set_PictureOrientation(1);
        smple.Set_PictureWidth (Image4.Width);
        smple.Set_PictureHeight(Image4.Height);
        picDis := smple.Get_Picture;
        SetOlePicture(Image4.Picture, IPictureDisp(picDis));
        Arrow4.Visible := False;
   end;

        sampleNumber := sampleNumber + 1;
 }
 end;

procedure TfrmRegister.nDone(Sender: TObject; var pTemplate: OleVariant);
{
var

             pVal : OleVariant;
            pDisp : IDispatch;
           pArray : PSafeArray;
                i : integer;
              buf : PByteArray;
}
begin
//         pDisp :=  pTemplate;
{
         pTemplate.Export(pVal);
         pArray := PSafeArray(TVarData(pVal).VArray);
         FblobSize := pArray.rgsabound[0].cElements * pArray.cbElements;
         buf := VarArrayLock(pVal);

         for i := 0 to FblobSize - 1 do
               pvData[i] := buf[i];     //pvData is byte array

         VarArrayUnlock(pVal);
         ShowMessage('Muestras Listas, Por Favor Verifique!');
         cmd_Verify.Enabled := True;
         cmd_Start.Enabled := False;
}

end;

procedure TfrmRegister.nDeCon(Sender: TObject);
begin
    ShowMessage('Conectando/Desconectando Lector');
end;


procedure TfrmRegister.cmd_StartClick(Sender: TObject);
{
var
 pErr: AIErrors;
}

begin
   sampleNumber := 0;
   DPFPCapture.StartCapture;
   //FPRegisterTemplate1.Run(1,pErr);
end;

procedure TfrmRegister.cmd_VerifyClick(Sender: TObject);
var
    i:Integer;
    frmVerify: TfrmVerify;
begin
        SeVerifica := True;
        frmVerify := TfrmVerify.Create(self);
        frmVerify.TemplateSet := TemplateSet;
        frmVerify.ShowModal;
        self.TomaHuella := frmVerify.Validacion;
        FreeAndNil(frmVerify);
end;

procedure TfrmRegister.cmd_exitClick(Sender: TObject);
{
var
er : TOleEnum;
}
begin
  //FPRegisterTemplate1.Cancel(er);
  //FPRegisterTemplate1.Free;
  Close;
end;

procedure TfrmRegister.FormShow(Sender: TObject);
begin
   Arrow1.Visible := True;
   Arrow2.Visible := False;
   Arrow3.Visible := False;
   Arrow4.Visible := False;
   cmd_Verify.Enabled := False;
   cmd_Start.Enabled := True;
   cmd_Start.Click;
end;

procedure TfrmRegister.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action := caHide;
end;

function TfrmRegister.ExtractFeatures(pSample : IDispatch; dPurpose: DPFPDataPurposeEnum): IDispatch;
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
           sampleNumber := sampleNumber + 1;
           result := FeatureSet;
       end
       else
           result := nil;
       
end;

procedure TfrmRegister.DrawFingerPrint(pBitmap: IDispatch);
var
  pImageTemp : IDispatch;
begin
       case sampleNumber of
       0: begin
                pImage := TPicture.Create();
                SetOlePicture(pImage,IPictureDisp(pBitmap));
                Image1.Picture.Assign(pImage);
                //SetOlePicture(Image1.Picture, IPictureDisp(pBitmap));
                Arrow1.Visible := False;
                Arrow2.Visible := True;
          end;
       1: begin
                SetOlePicture(Image2.Picture, IPictureDisp(pBitmap));
                Arrow2.Visible := False;
                Arrow3.Visible := True;
          end;
       2: begin
                SetOlePicture(Image3.Picture, IPictureDisp(pBitmap));
                Arrow3.Visible := False;
                Arrow4.Visible := True;
          end;
       3: begin
                SetOlePicture(Image4.Picture, IPictureDisp(pBitmap));
                Arrow4.Visible := False;
          end;
       end;
end;

function TfrmRegister.ConvertSampleToBitmap(pSample: IDispatch): IDispatch;
var
   Convertor : TDPFPSampleConversion;
   Bitmap :  IDispatch;
begin
     Convertor := TDPFPSampleConversion.Create(nil);
     Bitmap := Convertor.ConvertToPicture(pSample);
     result := Bitmap;
end;

procedure TfrmRegister.Process(pSample: IDispatch);
var
    FeatureSet : IDispatch;
    // Para extractar el Template.
    vt : integer ;
    vtByteBuf : PByteArray;  //Reference to the raw data array in the variant
    aryLow : integer;
    aryHigh : integer;
    rawDataSize: integer;
    loopIndex : integer;

begin
       FeatureSet := ExtractFeatures(pSample, DataPurposeEnrollment);
       if (FeatureSet <> nil) then
       begin
        try
          DPFPEnrollment.AddFeatures(FeatureSet);
        finally
           case DPFPEnrollment.TemplateStatus of
            TemplateStatusTemplateReady:
             begin;
                StopCapture();
                TemplateSet := DPFPEnrollment.Template;
                cmd_Verify.Enabled := true;
                FPTemplate:=DPFPEnrollment.Template as DPFPShrXLib_TLB.DPFPTemplate;
               //Before saving data to database you will need to get the raw data (variant)
                try
                   vrnt:=FPTemplate.Serialize;  //raw data is now stored in this variant
                   //Now that you have the variant, try to get raw byte array
                except
                 on E: Exception do showmessage('Problemas al Serializar los datos de la Huella');

                end;

             end;
            TemplateStatusCreationFailed:
             begin
               DPFPEnrollment.Clear;
               StopCapture();
             end;
           end;
        end;
       end;

end;

procedure TfrmRegister.StopCapture();
begin
    DPFPCapture.StopCapture;
end;

procedure TfrmRegister.DPFPCaptureComplete(ASender: TObject;
  const ReaderSerNum: WideString; const pSample: IDispatch);
begin
        Process(pSample);
end;

end.



