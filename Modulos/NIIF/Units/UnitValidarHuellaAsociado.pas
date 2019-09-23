unit UnitValidarHuellaAsociado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, IBDatabase, OleServer, DPSDKOPSLib_TLB,  DpSdkEngLib_TLB,
  AXCtrls,ComObj,ActiveX, IBSQL, JvLabel, JvBlinkingLabel;

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
    FPGetTemplate1: TFPGetTemplate;
    IBQuery2: TIBQuery;
    btnOtro: TBitBtn;
    LblAccion: TJvBlinkingLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FPGetTemplate1Done(Sender: TObject;
      var pTemplate: OleVariant);
    procedure btnComenzarClick(Sender: TObject);
    procedure FPGetTemplate1SampleReady(Sender: TObject;
      var pSample: OleVariant);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure btnOtroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
     pvData:array[0..2047] of Byte;
     blobSize:Integer;
     ValidacionOK:Boolean;
    procedure ValidarResultado;
    { Private declarations }
  public
     c_IVerify : IFPVerify;
     c_regTemplate : IFPTemplate;
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
end;

procedure TfrmValidarHuellaAsociado.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmValidarHuellaAsociado.FPGetTemplate1Done(Sender: TObject;
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
         FPGetTemplate1.Cancel(pErr);
         FPGetTemplate1.Disconnect;
         m_learning := False;
         m_verifyOk := False;
        try
          //Creating Template Object
          m_tUnknown := CreateComObject(CLASS_FPTemplate);
          //Asking for IFPTemplate Interface
          m_tUnknown.QueryInterface(IID_IFPTemplate,c_RegTemplate);
          m_data := VarArrayCreate([0,blobSize],varByte);
          m_tUnknown := CreateComObject(CLASS_FPVerify);
          m_tUnknown.QueryInterface(IID_IFPVerify,c_IVerify);

        except
               raise;
        end;
         m_byteBuf := VarArrayLock(m_data);
         m_verifyOk := False;

//         for m_loop := 0 to frmRegister.blobSize - 1 do         
         for m_loop := 0 to blobSize - 1 do
//                m_byteBuf[m_loop] := frmRegister.pvData[m_loop];
                m_byteBuf[m_loop] := pvData[m_loop];

         VarArrayUnlock(m_data);

         c_RegTemplate.Import(m_data);

         VarClear(m_data);
         c_IVerify.Compare(c_RegTemplate,pTemplate,m_verifyOk,m_score,m_threshold,m_learning,m_security);

         ValidacionOK := m_verifyOk;
         

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

         c_Iverify := nil;         
         c_RegTemplate._Release;
         c_RegTemplate := nil;
         c_IVerify := nil;


//         ValidarResultado;
         
end;

procedure TfrmValidarHuellaAsociado.btnComenzarClick(Sender: TObject);
var
  m_tUnknown : IUnknown;
begin
        btnComenzar.Enabled := False;
        FPGetTemplate1.Connect;
        m_tUnknown := CreateComObject(CLASS_FPVerify);
        m_tUnknown.QueryInterface(IID_IFPVerify,c_IVerify);
        FPGetTemplate1.Run(1,pErr);
        LblAccion.Font.Color := clBlue;
        LblAccion.Caption := 'Por Favor Tome la Huella';
        Application.ProcessMessages;
end;

procedure TfrmValidarHuellaAsociado.FPGetTemplate1SampleReady(
  Sender: TObject; var pSample: OleVariant);
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

end.
