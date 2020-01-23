object FrmCierreMes: TFrmCierreMes
  Left = 590
  Top = 271
  Width = 539
  Height = 325
  Caption = 'Cierre de Mes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
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
  end
end
