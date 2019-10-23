object frmConciliacionBancariaServiciosVirtuales: TfrmConciliacionBancariaServiciosVirtuales
  Left = 542
  Top = 180
  Width = 672
  Height = 361
  Caption = 'Conciliaci'#243'n Bancaria Servicios Virtuales'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 664
    Height = 73
    Align = alTop
    Caption = 'Selecci'#243'n de Archivos'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 210
      Height = 13
      Caption = 'Seleccione el Archivo con extensi'#243'n comaut'
    end
    object Label2: TLabel
      Left = 340
      Top = 24
      Width = 208
      Height = 13
      Caption = 'Seleccione el Archivo con extensi'#243'n autcon'
    end
    object edComautFile: TJvFilenameEdit
      Left = 8
      Top = 40
      Width = 321
      Height = 21
      Filter = 'comaut Files (*.comaut)|*.comaut'
      ButtonFlat = False
      NumGlyphs = 1
      TabOrder = 0
    end
    object edAutconFile: TJvFilenameEdit
      Left = 340
      Top = 40
      Width = 309
      Height = 21
      Filter = 'autcon files (*.autcon)|*.autcon'
      ButtonFlat = False
      NumGlyphs = 1
      TabOrder = 1
    end
  end
  object OD1: TOpenDialog
    Left = 344
    Top = 104
  end
end
