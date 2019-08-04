unit UnitImagenJpeg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, IBCustomDataSet, IBQuery,Jpeg,UnitGlobales,
  StdCtrls, Buttons;

type
  TFrmImagenJpg = class(TForm)
    Panel1: TPanel;
    ImgFoto: TImage;
    ImgHuella: TImage;
    ImFirma: TImage;
    IBQuery1: TIBQuery;
    Panel2: TPanel;
    CmdCerrar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
    FCaptacion:TCaptacion;
  public
  _sIdPersona :string;
  _iIdentificacion :Integer;
    property Captacion:TCaptacion read FCaptacion Write FCaptacion;  
    { Public declarations }
  end;

var
  FrmImagenJpg: TFrmImagenJpg;

implementation
uses UnitGuardaImagen;

{$R *.dfm}

procedure TFrmImagenJpg.FormShow(Sender: TObject);
var
     jpg :TJPEGImage;
    _tImagen:TGImagen;
    _tImagenR:TImagen;
begin
                 _tImagen := TGImagen.Create;
//                 _tImagenR.Foto := TMemoryStream.Create;
//                 _tImagenR.Firma := TMemoryStream.Create;
//                 _tImagenR.Huella := TMemoryStream.Create;
                 _tImagenR := _tImagen.ConsultaImagen(_iIdentificacion,_sIdPersona);
                 if _tImagenR.Foto.Size > 0 then  //validar foto
                 begin
                     jpg := TJPEGImage.Create;
                     jpg.LoadFromStream(_tImagenR.Foto);
                     ImgFoto.Picture.Bitmap.Assign(jpg);
                     FreeAndNil(jpg);
//                     ImFirma.Repaint;
//                     ImgFoto.Picture.Bitmap.Dormant;
//                     ImgFoto.Picture.Bitmap.FreeImage;

                 end;
                 if _tImagenR.Huella.Size > 0 then // validar huella
                 begin
                     jpg := TJPEGImage.Create;
                     jpg.LoadFromStream(_tImagenR.Huella);
                     ImgHuella.Picture.Bitmap.Assign(jpg);
                     FreeAndNil(jpg);
//                     ImgHuella.Repaint;
//                     ImgHuella.Picture.Bitmap.Dormant;
//                     ImgHuella.Picture.Bitmap.FreeImage;
                 end;
                 if _tImagenR.Firma.Size > 0 then // validar FIRMA
                 begin
                     jpg := TJPEGImage.Create;
                     jpg.LoadFromStream(_tImagenR.Firma);
                     ImFirma.Picture.Bitmap.Assign(jpg);
                     FreeAndNil(jpg);
//                     ImFirma.Repaint;
//                     ImFirma.Picture.Bitmap.Dormant;
//                     ImFirma.Picture.Bitmap.FreeImage;
                  end;
                  FreeAndNil(_tImagen);
//                 _tImagenR.Foto.Clear;
//                 _tImagenR.Firma.Clear;
//                 _tImagenR.Huella.Clear;
//                 _tImagenR.

end;

procedure TFrmImagenJpg.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

end.

