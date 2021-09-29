object FrmAgencia: TFrmAgencia
  Left = 493
  Top = 270
  Width = 217
  Height = 75
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Seleccione la Agencia'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 209
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 12
      Width = 47
      Height = 13
      Caption = 'Agencia'
    end
    object Cb: TComboBox
      Left = 55
      Top = 9
      Width = 118
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnKeyPress = CbKeyPress
      Items.Strings = (
        'AGENCIA 01'
        'AGENCIA 02')
    end
    object Button1: TButton
      Left = 175
      Top = 7
      Width = 25
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
