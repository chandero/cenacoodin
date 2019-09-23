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
  Buttons;

type
    TfrmVerify = class(TForm)
    Image1: TImage;
    FPGetTemplate1: TFPGetTemplate;
    procedure FPGetTemplate1Done(Sender: TObject;
      var pTemplate: OleVariant);
    procedure FPGetTemplate1SampleReady(Sender: TObject;
      var pSample: OleVariant);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
//     pvData:array[0..2047] of Byte;
     ValidacionOK:Boolean;
     blobsize:Integer;
     pvData: Array of Byte;
    procedure SetDatos(index:Integer; Data: Byte);
    procedure SetTamano(blobsize:Integer);
        { Private declarations }
  public

     property Datos[index:Integer]:Byte  Write SetDatos;
     property Tamano:Integer read blobSize Write SetTamano;
     property Validacion:Boolean read ValidacionOk Write ValidacionOk;
    { Public declarations }
  end;

var
  frmVerify: TfrmVerify;
        c_IVerify : IFPVerify;
        c_regTemplate : IFPTemplate;


implementation

{$R *.DFM}

procedure TfrmVerify.FPGetTemplate1Done(Sender: TObject;
  var pTemplate: OleVariant);
var
         m_byteBuf : PByteArray;
        m_verifyOk : WordBool;
           m_score : OleVariant;
        m_security : AISecureModeMask;
       m_threshold : OleVariant;
            m_data : OleVariant;
            m_loop : Integer;
        m_learning : WordBool;
        m_tUnknown : IUnknown;
begin
         m_learning := False;
         m_verifyOk := False;
        try
          m_tUnknown := CreateComObject(CLASS_FPTemplate);
          //Asking for IFPTemplate Interface
          m_tUnknown.QueryInterface(IID_IFPTemplate,c_RegTemplate);
          m_data := VarArrayCreate([0,blobsize],varByte);
          m_tUnknown := CreateComObject(CLASS_FPVerify);
          m_tUnknown.QueryInterface(IID_IFPVerify,c_IVerify);

        except
               ShowMessage('Ocurrio un Error!!');
               raise;
        end;

         m_byteBuf := VarArrayLock(m_data);
         m_verifyOk := False;

         for m_loop := 0 to blobSize - 1 do
                m_byteBuf[m_loop] := pvData[m_loop];

         VarArrayUnlock(m_data);

         c_RegTemplate.Import(m_data);

         VarClear(m_data);
         c_IVerify.Compare(c_RegTemplate,pTemplate,m_verifyOk,m_score,m_threshold,m_learning,m_security);


         if m_verifyOk = False then ShowMessage('No Concuerda !!')
          else if m_verifyOk = True then ShowMessage('Verificación Exitosa !!');

         ValidacionOK := m_verifyOk;

         c_Iverify := nil;
         c_RegTemplate := nil;
         Close;
end;

procedure TfrmVerify.FPGetTemplate1SampleReady(Sender: TObject;
  var pSample: OleVariant);
var
        smple : IFPSample;
        picDis : IDispatch;
        smDisp : IDispatch;
begin
   smDisp := IDispatch(pSample);
   smDisp.QueryInterface(IID_IFPSample,smple);
   smple.Set_PictureOrientation(1);
   smple.Set_PictureWidth (Image1.Width);
   smple.Set_PictureHeight(Image1.Height);
   picDis := smple.Get_Picture;
   SetOlePicture(Image1.Picture, IPictureDisp(picDis));

end;

procedure TfrmVerify.SetTamano(blobsize:Integer);
begin
       SetLength(pvData, blobsize);
       self.blobsize := blobsize;
end;

procedure TfrmVerify.SetDatos(index:Integer; Data: Byte);
begin
           pvData[index] := Data;
end;

procedure TfrmVerify.FormActivate(Sender: TObject);
//var
//   pErr : AIErrors;
//   m_tUnknown  : IUnknown;
begin
//        Image1.Picture := nil;
//        FPGetTemplate1.Run(1,pErr);
end;

procedure TfrmVerify.FormShow(Sender: TObject);
var
   pErr : AIErrors;
   m_tUnknown  : IUnknown;
begin
        Image1.Picture := nil;
        FPGetTemplate1.Run(1,pErr);
end;

procedure TfrmVerify.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Action := caHide;
end;

end.


