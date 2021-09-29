object frmMain: TfrmMain
  Left = 419
  Top = 150
  Width = 500
  Height = 434
  Caption = 'SARLAFT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 72
    Top = 152
    object SARL1: TMenuItem
      Caption = 'SARL v1'
      object PlanoAsociados1: TMenuItem
        Caption = 'Plano Asociados'
        OnClick = PlanoAsociados1Click
      end
    end
    object Movimientos1: TMenuItem
      Caption = 'Movimientos'
      OnClick = Movimientos1Click
    end
    object Salir1: TMenuItem
      Caption = 'Salir'
      OnClick = Salir1Click
    end
  end
end
