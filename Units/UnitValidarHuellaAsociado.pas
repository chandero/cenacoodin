unit UnitValidarHuellaAsociado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, IBDatabase, OleServer, DPSDKOPSLib_TLB,  DpSdkEngLib_TLB,
  AXCtrls,ComObj,ActiveX, IBSQL, JvLabel, JvBlinkingLabel, DPFPEngXLib_TLB,
  DPFPDevXLib_TLB, DPFPShrXLib_TLB;

type
  TfrmValidarHuellaAsociado = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    btnComenzar: TBitBtn;
    Panel2: TPanel;
    GroupBox11: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    DBLCBTiposIdentificacion: TDBLookupComboBox;
    EdNumeroIdentificacion: TMemo;
    EdPrimerApellido: TStaticText;
    EdSegundoApellido: TStaticText;
    EdNombres: TStaticText;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    Panel3: TPanel;
    btnCerrar: TBitBtn;
    IBQuery2: TIBQuery;
    btnOtro: TBitBtn;
    LblAccion: TJvBlinkingLabel;
    DPFPCapture1: TDPFPCapture;
    DPFPVerification1: TDPFPVerification;
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnComenzarClick(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure btnOtroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DPFPCapture1Complete(ASender: TObject;
      const ReaderSerNum: WideString; const pSample: IDispatch);
    procedure FormShow(Sender: TObject);
  private
     pvData:array[0..2047] of Byte;
     blobSize:Integer;
     ValidacionOK:Boolean;
    id_identificacion: Integer;
    id_persona: String;
    IniciarCaptura: Boolean;
    procedure ValidarResultado;
    procedure Process(pSample: IDispatch);
    procedure StopCapture;
    function ExtractFeatures(pSample : IDispatch; dPurpose: DPFPDataPurposeEnum): IDispatch;
    procedure DrawFingerPrint(pBitmap: IDispatch);
    function ConvertSampleToBitmap(pSample: IDispatch): IDispatch;
    { Private declarations }
  public
     c_IVerify : IFPVerify;
     c_regTemplate : IFPTemplate;
     property TipoDocumento : Integer read id_identificacion write id_identificacion;
     property Documento : String read id_persona write id_persona;
    { Public declarations }
  end;

var
  frmValidarHuellaAsociado: TfrmValidarHuellaAsociado;
  pErr : AIErrors;


implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmValidarHuellaAsociado.FormCreate(Sender: TObject);
begin
  IBTransaction1.StartTransaction;
  IBQuery1.Open;
  IniciarCaptura := False;
end;

procedure TfrmValidarHuellaAsociado.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmValidarHuellaAsociado.btnComenzarClick(Sender: TObject);
var
  m_tUnknown : IUnknown;
begin
        btnComenzar.Enabled := False;
        DPFPCapture1.StartCapture;
        LblAccion.Font.Color := clBlue;
        LblAccion.Caption := 'Por Favor Tome la Huella';
        Application.ProcessMessages;
end;

procedure TfrmValidarHuellaAsociado.EdNumeroIdentificacionExit(
  Sender: TObject);
var
    BlobStream:TMemoryStream;
    longitud:Int64;
begin
       with IBQuery2 do begin
           Close;
           SQL.Clear;
           SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,DATOS_HUELLA');
           SQL.Add('from "gen$persona"');
           SQL.Add('where');
           SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
           ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacion.KeyValue;
           ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
           Open;
           if RecordCount > 0 then
           try
                 BlobStream := TMemoryStream.Create;
                 (FieldByName('DATOS_HUELLA') as TBlobField).SaveToStream(BlobStream);
                 BlobStream.Seek(0,soFromBeginning);
                 longitud := BlobStream.Size;
                 blobSize := 0;
                 if longitud > 0 then
                 begin
                  blobSize := longitud;// + 1;
                  btnComenzar.Enabled := True;
                  btnComenzar.SetFocus;
                  EdPrimerApellido.Caption := FieldByName('PRIMER_APELLIDO').AsString;
                  EdSegundoApellido.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
                  EdNombres.Caption := FieldByName('NOMBRE').AsString;
                  BlobStream.read(pvData,longitud);
                  BlobStream.Free;
                  if (IniciarCaptura) then btnComenzar.Click;
                 end
                 else
                 begin
                   ShowMessage('No Tiene Informacion para Comparar');
                   Transaction.Rollback;
                   Exit;
                 end;
           except
              Transaction.Rollback;
              raise;
           end;
        end;

end;

procedure TfrmValidarHuellaAsociado.btnOtroClick(Sender: TObject);
begin
        IBTransaction1.Commit;
        IBTransaction1.StartTransaction;
        IBQuery1.Open;
        DBLCBTiposIdentificacion.SetFocus;
        EdNumeroIdentificacion.Text := '';
        EdPrimerApellido.Caption := '';
        EdSegundoApellido.Caption := '';
        EdNombres.Caption := '';
        LblAccion.Caption := '';
        Image1.Picture.Bitmap.FreeImage;
        Image1.Refresh;
end;

procedure TfrmValidarHuellaAsociado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  EnterTabs(Key,Self);
end;

procedure TfrmValidarHuellaAsociado.ValidarResultado;
begin
        if ValidacionOK then
        begin
          LblAccion.Font.Color := clGreen;
          LblAccion.Caption := 'Huella Concuerda';
        end
        else
        begin
          LblAccion.Font.Color := clRed;
          lblaccion.Caption := 'Huella No Concuerda';
        end;

end;

procedure TfrmValidarHuellaAsociado.DPFPCapture1Complete(ASender: TObject;
  const ReaderSerNum: WideString; const pSample: IDispatch);
begin
       Process(pSample);
end;

procedure TfrmValidarHuellaAsociado.Process(pSample: IDispatch);
var
  FeatureSet : IDispatch;
  Response : IDPFPVerificationResult;
  TemplateSet: IDPFPTemplate;
  vrnt: Variant;
  vt : integer ;
  vtByteBuf : PByteArray;  //Reference to the raw data array in the variant
  aryLow : integer;
  aryHigh : integer;
  rawDataSize: integer;
  loopIndex : integer;
begin
       TemplateSet := coDPFPTemplate.Create;
       FeatureSet := ExtractFeatures(pSample, DataPurposeVerification);
       if (FeatureSet <> nil) then
       begin
          rawDataSize := High(pvData) - Low(pvData);
          try
            vrnt := VarArrayCreate([0,rawDataSize],varByte); //Allocate the array required to store the fpdata in your variant
            vtByteBuf:=VarArrayLock(vrnt);

            for loopIndex := 0 to rawDataSize - 1 do
               vtByteBuf[loopIndex]:=pvData[loopIndex];

            VarArrayUnlock(vrnt);
          except
          on E: Exception do
           begin
            showmessage('Ole exception');
            showmessage(e.Message);
           end;
          end;
          TemplateSet.Deserialize(vrnt);
          Response := DPFPVerification1.Verify(FeatureSet, TemplateSet) as DPFPEngXLib_TLB.DPFPVerificationResult;
          if (Response.Verified = true) then
           begin
                 LblAccion.Font.Color := clGreen;
                 LblAccion.Caption := 'Huella Concuerda';
           end
           else
           begin
                 LblAccion.Font.Color := clRed;
                 lblaccion.Caption := 'Huella No Concuerda';
           end;
       end;
       StopCapture();
end;

procedure TfrmValidarHuellaAsociado.StopCapture;
begin
        DPFPCapture1.StopCapture;
end;

function TfrmValidarHuellaAsociado.ExtractFeatures(pSample : IDispatch; dPurpose: DPFPDataPurposeEnum): IDispatch;
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

procedure TfrmValidarHuellaAsociado.DrawFingerPrint(pBitmap: IDispatch);
begin
     SetOlePicture(Image1.Picture, IPictureDisp(pBitmap));
end;

function TfrmValidarHuellaAsociado.ConvertSampleToBitmap(pSample: IDispatch): IDispatch;
var
   Convertor : TDPFPSampleConversion;
   Bitmap :  IDispatch;
begin
     Convertor := TDPFPSampleConversion.Create(nil);
     Bitmap := Convertor.ConvertToPicture(pSample);
     result := Bitmap;
end;

procedure TfrmValidarHuellaAsociado.FormShow(Sender: TObject);
begin
  if (TipoDocumento > 0) then DBLCBTiposIdentificacion.KeyValue := TipoDocumento;
  if (Documento <> '') then EdNumeroIdentificacion.Text := Documento;
  if ( (TipoDocumento > 0) and (Documento <> '') ) then
  begin
    iniciarCaptura := True;
    EdNumeroIdentificacionExit(Self);
  end;
end;

end.
