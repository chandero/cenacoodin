unit Verify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer,ComObj,OleCtrls,ActiveX,AXCtrls,DpSdkEngLib_TLB,DPSDKOPSLib_TLB, ExtCtrls, StdCtrls;

type
  TfrmVerification = class(TForm)
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    Image1: TImage;
    FPGetTemplate1: TFPGetTemplate;
    procedure FPGetTemplate1SampleReady(Sender: TObject;
      var pSample: OleVariant);
    procedure FormActivate(Sender: TObject);
    procedure FPGetTemplate1Done(Sender: TObject;
      var pTemplate: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerification: TfrmVerification;
        c_IVerify     : IFPVerify;
        c_regTemplate : IFPTemplate;

implementation

uses Register;

{$R *.dfm}

procedure TfrmVerification.FPGetTemplate1SampleReady(Sender: TObject;
  var pSample: OleVariant);
var
        l_fpSample   : IFPSample;
        l_dispatch   : IDispatch;
        l_dispatchFP : IDispatch;
begin
   l_dispatch := IDispatch(pSample);
   l_dispatch.QueryInterface(IID_IFPSample,l_fpSample);
   l_fpSample.Set_PictureOrientation(1);
   l_fpSample.Set_PictureWidth (Image1.Width);
   l_fpSample.Set_PictureHeight(Image1.Height);
   l_dispatchFP := l_fpSample.Get_Picture;
   SetOlePicture(Image1.Picture, IPictureDisp(l_dispatchFP));


end;

procedure TfrmVerification.FormActivate(Sender: TObject);
var
       pErr : AIErrors;
 l_Unknown  : IUnknown;

begin
        Image1.Picture := nil;
        FPGetTemplate1.Run(1,pErr);
end;

procedure TfrmVerification.FPGetTemplate1Done(Sender: TObject;
  var pTemplate: OleVariant);
var
         l_byteBuf : PByteArray;
        l_verifyOk : WordBool;
           l_score : OleVariant;
        l_security : AISecureModeMask;
       l_threshold : OleVariant;
            l_data : OleVariant;
            l_loop : Integer;
        l_learning : WordBool;
        l_Unknown  : IUnknown;
begin
         l_learning := False;
         l_verifyOk := False;
        try
          //Creating Template Object
          l_Unknown := CreateComObject(CLASS_FPTemplate);
          //Asking for IFPTemplate Interface
          l_Unknown.QueryInterface(IID_IFPTemplate,c_RegTemplate);
          l_data := VarArrayCreate([0,Register.blobSize],varByte);
          l_Unknown := CreateComObject(CLASS_FPVerify);
          l_Unknown.QueryInterface(IID_IFPVerify,c_IVerify);
        except
               ShowMessage('Exception occured!!');
        end;
         l_byteBuf := VarArrayLock(l_data);
         l_verifyOk := False;

         for l_loop := 0 to Register.blobSize - 1 do
                l_byteBuf[l_loop] := Register.fpData[l_loop];


         VarArrayUnlock(l_data);

         c_RegTemplate.Import(l_data);

         VarClear(l_data);
         c_IVerify.Compare(c_RegTemplate,pTemplate,l_verifyOk,l_score,l_threshold,l_learning,l_security);


         if l_verifyOk = False then ShowMessage('Not Matched !!')
          else if l_verifyOk = True then ShowMessage('Matched !!');

         c_IVerify := nil;
         c_RegTemplate := nil;
         frmVerification.Hide;
end;
end.
