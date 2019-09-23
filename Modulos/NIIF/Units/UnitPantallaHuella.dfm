object frmPantallaHuella: TfrmPantallaHuella
  Left = 337
  Top = 262
  BorderStyle = bsNone
  Caption = 'Pantalla Huella'
  ClientHeight = 173
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 230
    Top = 6
    Width = 105
    Height = 137
  end
  object JvBlinkingLabel1: TJvBlinkingLabel
    Left = 24
    Top = 32
    Width = 181
    Height = 49
    Alignment = taCenter
    AutoSize = False
    Caption = 'FAVOR COLOCAR HUELLA DACTILAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clBlack
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    BlinkingDelay = 200
    BlinkingTime = 600
  end
  object JvTransparentForm1: TJvTransparentForm
    Active = True
    AutoSize = False
    Left = 120
    Top = 2
  end
end
