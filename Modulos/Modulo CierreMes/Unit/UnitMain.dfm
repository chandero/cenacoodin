object FrmCierreMes: TFrmCierreMes
  Left = 307
  Top = 235
  Width = 520
  Height = 325
  Caption = 'Liquidaci'#243'n Diaria de Intereses / Cierre de Mes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 252
    Width = 512
    Height = 19
    Panels = <
      item
        Alignment = taRightJustify
        Text = '17:12:12'
        Width = 500
      end
      item
        Width = 500
      end>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 64
    Top = 80
    object Manuales1: TMenuItem
      Caption = 'Manuales'
      object LiquidacindeIntersdeCaptacin1: TMenuItem
        Caption = 'Liquidaci'#243'n de Inter'#233's de Captaci'#243'n'
        OnClick = LiquidacindeIntersdeCaptacin1Click
      end
    end
    object mnuAuto: TMenuItem
      Caption = 'Test Autom'#225'tico'
      Visible = False
      OnClick = mnuAutoClick
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 232
  end
end
