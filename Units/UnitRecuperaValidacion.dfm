object FrmRecuperaValidacion: TFrmRecuperaValidacion
  Left = 372
  Top = 206
  Width = 313
  Height = 163
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Recuperar Ultima Validaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 305
    Height = 89
    Caption = 'Observaci'#243'n'
    TabOrder = 0
    object mObservacion: TMemo
      Left = 2
      Top = 15
      Width = 295
      Height = 63
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 88
    Width = 304
    Height = 41
    TabOrder = 1
    object btValidar: TButton
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Validar'
      TabOrder = 0
      OnClick = btValidarClick
    end
    object Button1: TButton
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object IBValidacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 144
    Top = 80
  end
end
