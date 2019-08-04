object FrmCambioSistemas: TFrmCambioSistemas
  Left = 344
  Top = 272
  Width = 273
  Height = 99
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Informe Cambios a Sistemas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 169
    Height = 65
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 13
      Width = 60
      Height = 13
      Caption = 'Fecha Inicial'
    end
    object Label2: TLabel
      Left = 5
      Top = 39
      Width = 55
      Height = 13
      Caption = 'Fecha Final'
    end
    object dtFecha1: TDateTimePicker
      Left = 72
      Top = 11
      Width = 94
      Height = 21
      CalAlignment = dtaLeft
      Date = 40423.3495665972
      Time = 40423.3495665972
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtFecha2: TDateTimePicker
      Left = 71
      Top = 37
      Width = 94
      Height = 21
      CalAlignment = dtaLeft
      Date = 40423.3495665972
      Time = 40423.3495665972
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 169
    Top = 0
    Width = 96
    Height = 65
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 6
      Top = 21
      Width = 81
      Height = 25
      Caption = '&Ejecutar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT'
      '  "per$solicitud".CONSECUTIVO,'
      '  "per$solicitud".AREA,'
      '  "per$solicitud".FECHAR,'
      '  "per$solicitud".REQUERIMIENTO,'
      '  "per$solicitud".EXPLICACION,'
      '  "per$solicitud".ID_EMPLEADO'
      'FROM'
      '  "per$solicitud"'
      'WHERE'
      '  "per$solicitud".VISADO = 1 AND'
      '  "per$solicitud".ESTADO = 1 AND'
      '  "per$solicitud".APLICADO = 1 AND'
      '  "per$solicitud".FECHAR BETWEEN :FECHA1 AND :FECHA2')
    Left = 104
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
        ParamType = ptUnknown
      end>
  end
end
