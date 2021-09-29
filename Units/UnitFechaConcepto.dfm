object FrmFechaConcepto: TFrmFechaConcepto
  Left = 98
  Top = 168
  Width = 544
  Height = 375
  Caption = 'Cambiar Fecha Aprobaci'#243'n'
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
    Width = 353
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 13
      Width = 63
      Height = 13
      Caption = 'Fecha Actual'
    end
    object Label2: TLabel
      Left = 165
      Top = 12
      Width = 65
      Height = 13
      Caption = 'Nueva Fecha'
    end
    object fecha1: TDateTimePicker
      Left = 72
      Top = 10
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 38978.4986007986
      Time = 38978.4986007986
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object fecha2: TDateTimePicker
      Left = 236
      Top = 10
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 38978.4986234028
      Time = 38978.4986234028
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = -1
    Top = 41
    Width = 354
    Height = 41
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 78
      Top = 8
      Width = 92
      Height = 25
      Caption = '&Actualizar'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 211
      Top = 8
      Width = 92
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
    end
  end
end
