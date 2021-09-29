unit UnitTomaHuella;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,ComObj,
  ExtCtrls, DpSdkEngLib_TLB,DPSDKOPSLib_TLB, OleServer,Variants ,
  ActiveX,AXCtrls, OleCtrls, StdCtrls, Mask, Buttons,
  JvAni, JvxAnimate, JvGIFCtrl;

type
  TfrmRegister = class(TForm)
    Image1: TImage;
    FPRegisterTemplate1: TFPRegisterTemplate;
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
    procedure onSample(Sender: TObject; var pSample: OleVariant);
    procedure nDone(Sender: TObject; var pTemplate: OleVariant);
    procedure nDeCon(Sender: TObject);
    procedure cmd_StartClick(Sender: TObject);
    procedure cmd_VerifyClick(Sender: TObject);
    procedure cmd_exitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

        sampleNumber : Integer;
        TomaHuella:Boolean;
        Fblobsize: integer;

        function GetData(I:Integer):Byte;
    { Private declarations }
  public
        property blobsize:Integer read Fblobsize write Fblobsize;
        property Datos[I:integer]:Byte read GetData;
//        property Tamano:Integer read blobsize;
        property Valido:Boolean read TomaHuella Write TomaHuella;
    { Public declarations }
  end;

var
  frmRegister : TfrmRegister;
  SeVerifica : boolean;
  pvData : array[0..2047] of Byte;



implementation

uses UnitVerificarHuella;

{$R *.DFM}

function TfrmRegister.GetData(I:integer):Byte;
begin
        Result := pvdata[I];
end;


procedure TfrmRegister.onSample(Sender: TObject; var pSample: OleVariant);
var
        smple : IFPSample;
        picDis : IDispatch;
        smDisp : IDispatch;

begin
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

 end;

procedure TfrmRegister.nDone(Sender: TObject; var pTemplate: OleVariant);
var
             pVal : OleVariant;
            pDisp : IDispatch;
           pArray : PSafeArray;
                i : integer;
              buf : PByteArray;
begin
//         pDisp :=  pTemplate;
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


end;

procedure TfrmRegister.nDeCon(Sender: TObject);
begin
    ShowMessage('Conectando/Desconectando Lector');
end;


procedure TfrmRegister.cmd_StartClick(Sender: TObject);
var
 pErr: AIErrors;

begin
   sampleNumber := 0;
   FPRegisterTemplate1.Run(1,pErr);
end;

procedure TfrmRegister.cmd_VerifyClick(Sender: TObject);
var
    i:Integer;
    frmVerify: TfrmVerify;
begin
        SeVerifica := True;
        frmVerify := TfrmVerify.Create(self);
        frmVerify.Tamano := High(pvData);
        for i := 0 to High(pvData) do
        begin
          frmVerify.Datos[i] := pvData[i];
        end;
        frmVerify.ShowModal;
        self.TomaHuella := frmVerify.Validacion;
        FreeAndNil(frmVerify);
end;

procedure TfrmRegister.cmd_exitClick(Sender: TObject);
var
er : TOleEnum;
begin
  FPRegisterTemplate1.Cancel(er);
  FPRegisterTemplate1.Free;
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

end.



