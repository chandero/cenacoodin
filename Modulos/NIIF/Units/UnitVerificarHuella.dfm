object frmVerify: TfrmVerify
  Left = 492
  Top = 404
  Width = 184
  Height = 207
  Caption = 'Verificaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 38
    Top = 5
    Width = 100
    Height = 130
    Proportional = True
    Stretch = True
  end
  object FPGetTemplate1: TFPGetTemplate
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnDone = FPGetTemplate1Done
    OnSampleReady = FPGetTemplate1SampleReady
    Left = 34
    Top = 48
  end
end
