object frmImagenAmpliada: TfrmImagenAmpliada
  Left = 232
  Top = 121
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 242
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 322
    Height = 242
    Align = alClient
    OnClick = Image1Click
  end
  object JvAppearingLabel1: TJvAppearingLabel
    Left = 4
    Top = 226
    Width = 227
    Height = 13
    Alignment = taCenter
    Caption = 'De Click Sobre La Imagen Para Cerrarla'
    Color = clCaptionText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    Visible = False
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clBlack
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    FirstInterval = 150
    AutoStart = True
  end
end
