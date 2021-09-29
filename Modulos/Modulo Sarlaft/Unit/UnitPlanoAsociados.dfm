object frmPlanoAsociados: TfrmPlanoAsociados
  Left = 536
  Top = 196
  Width = 335
  Height = 80
  Caption = 'Plano de Asociados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 91
    Height = 13
    Caption = 'Periodo A Procesar'
  end
  object edFechaCorte: TDateTimePicker
    Left = 112
    Top = 8
    Width = 97
    Height = 21
    CalAlignment = dtaLeft
    Date = 44389.3363336921
    Time = 44389.3363336921
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 219
    Top = 6
    Width = 95
    Height = 25
    Caption = 'Generar Excel'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object _trans: TIBTransaction
    AllowAutoStart = False
    Left = 40
    Top = 18
  end
  object _query: TIBQuery
    Left = 8
    Top = 8
  end
  object SD1: TSaveDialog
    Left = 80
    Top = 16
  end
end
