unit UnitActivarImagenes;

interface

uses
  Clipbrd, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, JPEG;

type
  TfrmActivarImagenes = class(TForm)
    GroupBox8: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    CBTiposIdentificacion: TDBLookupComboBox;
    EdIdentificacion: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    chkFoto: TCheckBox;
    chkFirma: TCheckBox;
    chkHuella: TCheckBox;
    Panel3: TPanel;
    btnAplicar: TBitBtn;
    btnCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    btnOtro: TBitBtn;
    EdNombre: TEdit;
    Label1: TLabel;
    IBSQL2: TIBSQL;
    DataSource2: TDataSource;
    IBQuery2: TIBQuery;
    ImgFotoC: TImage;
    ImgHuellaC: TImage;
    ImgFirmaC: TImage;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdIdentificacionExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBImage1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBImage2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBImage3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOtroClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActivarImagenes: TfrmActivarImagenes;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitGuardaImagen;

procedure TfrmActivarImagenes.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmActivarImagenes.Inicializar;
begin
        if IBQuery2.Transaction.InTransaction then
           IBQuery2.Transaction.Rollback;
        IBQuery2.Transaction.StartTransaction;

        IBQuery1.Open;
        IBQuery1.Last;
        IBQuery1.First;
        GroupBox8.Enabled := True;
        CBTiposIdentificacion.KeyValue := 3;
//        CBTiposIdentificacion.SetFocus;
        EdNombre.Text := '';
        EdIdentificacion.Text := '';
        ImgFotoC.Picture := nil;
        ImgFirmaC.Picture := nil;
        ImgHuellaC.Picture := nil;
        chkFoto.Checked := False;
        chkFirma.Checked := False;
        chkHuella.Checked := False;
        
end;

procedure TfrmActivarImagenes.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmActivarImagenes.EdIdentificacionExit(Sender: TObject);
var
_tImagenR:TImagen;
_TGuardaImagen:TGImagen;
_tImageJPG : TJPEGImage;
begin
        _TGuardaImagen := TGImagen.Create;
        _tImagenR.Foto := TMemoryStream.Create;
        _tImagenR.Huella := TMemoryStream.Create;
        _tImagenR.Firma := TMemoryStream.Create;
        with IBQuery2 do begin
         Close;
         SQL.Clear;
         SQL.Add('select (PRIMER_APELLIDO || '' '' || SEGUNDO_APELLIDO || '' '' || NOMBRE) AS NOMBRE,FOTO,FIRMA,FOTO_HUELLA, DATOS_HUELLA from "gen$persona" where');
         SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
         ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
         ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
         try
          Open;
         except
          Transaction.Rollback;
          raise;
         end;

            _tImagenR := _TGuardaImagen.ConsultaImagen(CBTiposIdentificacion.KeyValue,EdIdentificacion.Text);
            if _tImagenR.Foto.Size > 0 then
             begin
               _tImageJPG := TJPEGImage.Create;
               _tImageJPG.LoadFromStream(_tImagenR.Foto);
               ImgFotoC.Picture.Bitmap.Assign(_tImageJPG);
               FreeAndNil(_tImageJPG);
             end;

            if _tImagenR.Firma.Size > 0 then
             begin
               _tImageJPG := TJPEGImage.Create;
               _tImageJPG.LoadFromStream(_tImagenR.Firma);
               ImgFirmaC.Picture.Bitmap.Assign(_tImageJPG);
               FreeAndNil(_tImageJPG);
             end;

            if _tImagenR.Huella.Size > 0 then
            begin
              _tImageJPG := TJPEGImage.Create;
              _tImageJPG.LoadFromStream(_tImagenR.Huella);
              ImgHuellaC.Picture.Bitmap.Assign(_tImageJPG);
              FreeAndNil(_tImageJPG);
            end;

            FreeAndNil(_tImagenR);
            EdNombre.Text := FieldByName('NOMBRE').AsString;
        end;
        GroupBox8.Enabled := False;
end;

procedure TfrmActivarImagenes.FormCreate(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmActivarImagenes.DBImage1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;
end;

procedure TfrmActivarImagenes.DBImage2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;
end;

procedure TfrmActivarImagenes.DBImage3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;
end;

procedure TfrmActivarImagenes.btnOtroClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmActivarImagenes.btnAplicarClick(Sender: TObject);
var
_TGuardaImagen:TGImagen;
_tImagenR:TImagen;
begin

        if MessageDlg('Seguro de Aplicar la Selección',mtConfirmation,[mbyes,mbno],0) <> mryes then Exit;
        _TGuardaImagen := TGImagen.Create;
        if chkFoto.Checked then
          _TGuardaImagen.LimpiarImagen(0,EdIdentificacion.Text,CBTiposIdentificacion.KeyValue);

        if chkFirma.Checked then
        _TGuardaImagen.LimpiarImagen(1,EdIdentificacion.Text,CBTiposIdentificacion.KeyValue);

        if chkHuella.Checked then
        _TGuardaImagen.LimpiarImagen(2,EdIdentificacion.Text,CBTiposIdentificacion.KeyValue);

        FreeAndNil(_TGuardaImagen);

{        with IBSQL2 do begin
        if chkFoto.Checked then begin
          Close;
          SQL.Clear;
          SQL.Add('update "gen$persona" set FOTO = NULL where');
          SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
          ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
          end;
        end;
        if chkFirma.Checked then begin
          Close;
          SQL.Clear;
          SQL.Add('update "gen$persona" set FIRMA = NULL where');
          SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
          ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
          end;
        end;
        if chkHuella.Checked then begin
          Close;
          SQL.Clear;
          SQL.Add('update "gen$persona" set FOTO_HUELLA = NULL, DATOS_HUELLA = NULL where');
          SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
          ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
          end;
        end;
        Transaction.Commit;
        end;}             

        MessageDlg('Aplicación Finalizada con Exito!',mtInformation,[mbok],0);
        Inicializar;
end;

end.
