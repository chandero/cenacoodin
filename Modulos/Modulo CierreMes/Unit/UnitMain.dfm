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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 191
    Height = 13
    Caption = 'Hora Ejecuci'#243'n Liquidaci'#243'n de Intereses'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 178
    Height = 13
    Caption = 'Hora Ejecuci'#243'n Causaci'#243'n de Cartera'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 252
    Width = 512
    Height = 19
    Panels = <
      item
        Alignment = taRightJustify
        Text = '17:12:12'
        Width = 400
      end
      item
        Alignment = taRightJustify
        Width = 5
      end>
    SimplePanel = False
  end
  object edHoraLiquidacion: TMaskEdit
    Left = 208
    Top = 8
    Width = 57
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = '23:50:00'
  end
  object btnHoraLiquidacion: TToggleButton
    Left = 269
    Top = 8
    Width = 25
    Height = 23
    Caption = 'E'
    TabOrder = 2
    OnClick = btnHoraLiquidacionClick
    GroupIndex = 0
  end
  object edHoraCausacion: TMaskEdit
    Left = 208
    Top = 40
    Width = 57
    Height = 21
    ReadOnly = True
    TabOrder = 3
    Text = '20:50:00'
  end
  object btnHoraCausacion: TToggleButton
    Left = 269
    Top = 40
    Width = 25
    Height = 23
    Caption = 'E'
    TabOrder = 4
    OnClick = btnHoraCausacionClick
    GroupIndex = 0
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
      object CausacinyProvisindeCartera1: TMenuItem
        Caption = 'Causaci'#243'n y Provisi'#243'n de Cartera'
        OnClick = CausacinyProvisindeCartera1Click
      end
    end
    object mnuAuto: TMenuItem
      Caption = 'Test Autom'#225'tico'
      Visible = False
      OnClick = mnuAutoClick
    end
    object mnuCausacionAuto: TMenuItem
      Caption = 'Causaci'#243'n Autom'#225'tico'
      OnClick = mnuCausacionAutoClick
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 232
  end
end
