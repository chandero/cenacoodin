object frmVerify: TfrmVerify
  Left = 512
  Top = 185
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 38
    Top = 21
    Width = 100
    Height = 130
    Proportional = True
    Stretch = True
  end
  object DPFPVerification: TDPFPVerification
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 8
    Top = 64
  end
  object DPFPCapture: TDPFPCapture
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnComplete = DPFPCaptureComplete
    Left = 8
    Top = 32
  end
end
