object FrmTiraSumadora: TFrmTiraSumadora
  Left = 308
  Top = 153
  Width = 749
  Height = 487
  Caption = 'Consultar Tira Sumadora'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 11
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object dtFecha: TDateTimePicker
      Left = 42
      Top = 8
      Width = 87
      Height = 21
      CalAlignment = dtaLeft
      Date = 40682.4717255787
      Time = 40682.4717255787
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 136
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Mostrar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 225
    Height = 392
    Caption = 'Panel2'
    TabOrder = 1
    object mCalc: TMemo
      Left = 3
      Top = 3
      Width = 219
      Height = 383
      Alignment = taRightJustify
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Pitch = fpFixed
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      WordWrap = False
    end
  end
  object Panel3: TPanel
    Left = 225
    Top = 0
    Width = 88
    Height = 433
    TabOrder = 2
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
