object frmLiquidacionCdatAuto: TfrmLiquidacionCdatAuto
  Left = 561
  Top = 293
  Width = 568
  Height = 152
  Caption = 'Prorroga de Cdat Auto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 61
    Height = 13
    Caption = 'Prorrogando:'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 95
    Height = 13
    Caption = 'Estado del Proceso:'
  end
  object Label3: TLabel
    Left = 8
    Top = 65
    Width = 154
    Height = 13
    Caption = 'Cantidad de Cuentas a Prorrogar'
  end
  object edCaptacion: TEdit
    Left = 96
    Top = 5
    Width = 441
    Height = 21
    TabOrder = 0
  end
  object edEstado: TEdit
    Left = 112
    Top = 38
    Width = 425
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object edCantidad: TJvIntegerEdit
    Left = 192
    Top = 63
    Width = 89
    Height = 21
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 2
    Value = 0
    MaxValue = 0
    MinValue = 0
    HasMaxValue = False
    HasMinValue = False
    ClipBoardCommands = [caCopy]
  end
  object progreso: TProgressBar
    Left = 8
    Top = 88
    Width = 529
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 3
  end
end
