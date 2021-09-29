object frmInformeAsociadosDatosActualizadosRango: TfrmInformeAsociadosDatosActualizadosRango
  Left = 477
  Top = 228
  Width = 383
  Height = 154
  Caption = 'Informe Asociados con datos Actualizados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Fecha Inicial'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 55
    Height = 13
    Caption = 'Fecha Final'
  end
  object Panel1: TPanel
    Left = 0
    Top = 86
    Width = 375
    Height = 34
    Align = alBottom
    Color = clOlive
    TabOrder = 0
    object btnExcel: TBitBtn
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Excel'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 296
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object edFechaInicial: TDateTimePicker
    Left = 77
    Top = 14
    Width = 100
    Height = 21
    CalAlignment = dtaLeft
    Date = 44312.4453976273
    Time = 44312.4453976273
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object edFechaFinal: TDateTimePicker
    Left = 77
    Top = 46
    Width = 100
    Height = 21
    CalAlignment = dtaLeft
    Date = 44312.4453976273
    Time = 44312.4453976273
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
  end
  object IBQuery1: TIBQuery
    Left = 224
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Left = 256
    Top = 8
  end
end
