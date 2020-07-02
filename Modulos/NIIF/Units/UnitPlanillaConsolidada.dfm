object FrmPlanillaConsolidada: TFrmPlanillaConsolidada
  Left = 507
  Top = 142
  Width = 225
  Height = 98
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Sumatoria Consolidada'
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
    Width = 217
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 99
      Height = 13
      Caption = 'Fecha Recuperar'
    end
    object DTFecha: TDateTimePicker
      Left = 110
      Top = 5
      Width = 100
      Height = 21
      CalAlignment = dtaLeft
      Date = 36892.4953559028
      Time = 36892.4953559028
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 32
    Width = 217
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 54
      Top = 3
      Width = 104
      Height = 25
      Caption = '&Ejecutar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E000000010000000100004A7BB500296B
        C600527BC600186BD600528CD6003194D600397BE7005284E700107BEF00317B
        EF001084EF0029ADEF0039ADEF0010B5EF0008BDEF000073F7001873F7002973
        F7000884F7000894F70018A5F70000CEF70018DEF70063DEF700FF00FF000073
        FF00007BFF000084FF00008CFF000094FF00009CFF0000A5FF0010A5FF0039A5
        FF0052A5FF005AA5FF0000ADFF0029ADFF0031ADFF0000B5FF006BB5FF0084B5
        FF0000BDFF0008BDFF0010BDFF0000C6FF0008C6FF006BC6FF0000CEFF0018CE
        FF0000D6FF0008D6FF0010D6FF0021D6FF0031D6FF0000DEFF0018DEFF0029DE
        FF0042DEFF0000E7FF0010E7FF0018E7FF0039E7FF0000EFFF0018EFFF0039EF
        FF004AEFFF0000F7FF0008F7FF0029F7FF0031F7FF0042F7FF004AF7FF005AF7
        FF0000FFFF0008FFFF0018FFFF0021FFFF0031FFFF0039FFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
        1818181818181818181818181802181818181818181818181818181818090201
        18181818181818181818181818061A0F02181818181818181818181818181E1C
        1C0218181818181818181818181818271C1D0202181818181818181818181818
        272E1E1E02181818181818181818181818272B241E0218181818181818180202
        022D4B462C240202181818181818252D3F43434A42311F02181818181818212D
        3F433F374A4A412E021818181818182E3E42474C4A4A4B4D0218181818181818
        1836444A43322702181818181818181818181836433F241F0218181818181818
        1818181818363A34230218181818181818181818181818362202}
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 88
  end
  object cdSumatoria: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'AGENCIA'
        DataType = ftSmallint
      end
      item
        Name = 'TIPO'
        DataType = ftSmallint
      end
      item
        Name = 'DESTIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'APORTES'
        DataType = ftCurrency
      end
      item
        Name = 'AHORROS'
        DataType = ftCurrency
      end
      item
        Name = 'JUVENIL'
        DataType = ftCurrency
      end
      item
        Name = 'CDAT'
        DataType = ftCurrency
      end
      item
        Name = 'CARTERA'
        DataType = ftCurrency
      end
      item
        Name = 'DESCAGENCIA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONTRACTUAL'
        DataType = ftCurrency
      end
      item
        Name = 'DESEMBOLSO'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'AGENCIA;TIPO'
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 24
    Data = {
      890100009619E0BD01000000180000000B000000000003000000890107414745
      4E4349410200010000000000045449504F020001000000000007444553544950
      4F01004900000001000557494454480200020014000741504F52544553080004
      000000010007535542545950450200490006004D6F6E6579000741484F52524F
      53080004000000010007535542545950450200490006004D6F6E657900074A55
      56454E494C080004000000010007535542545950450200490006004D6F6E6579
      000443444154080004000000010007535542545950450200490006004D6F6E65
      7900074341525445524108000400000001000753554254595045020049000600
      4D6F6E6579000B444553434147454E4349410100490000000100055749445448
      0200020014000B434F4E545241435455414C0800040000000100075355425459
      50450200490006004D6F6E6579000A444553454D424F4C534F08000400000001
      0007535542545950450200490006004D6F6E65790001000D44454641554C545F
      4F524445520200820000000000}
    object cdSumatoriaAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
    end
    object cdSumatoriaTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdSumatoriaDESTIPO: TStringField
      FieldName = 'DESTIPO'
    end
    object cdSumatoriaAPORTES: TCurrencyField
      FieldName = 'APORTES'
    end
    object cdSumatoriaAHORROS: TCurrencyField
      FieldName = 'AHORROS'
    end
    object cdSumatoriaJUVENIL: TCurrencyField
      FieldName = 'JUVENIL'
    end
    object cdSumatoriaCDAT: TCurrencyField
      FieldName = 'CDAT'
    end
    object cdSumatoriaCARTERA: TCurrencyField
      FieldName = 'CARTERA'
    end
    object cdSumatoriaDESCAGENCIA: TStringField
      FieldName = 'DESCAGENCIA'
    end
    object cdSumatoriaCONTRACTUAL: TCurrencyField
      FieldName = 'CONTRACTUAL'
    end
    object cdSumatoriaDESEMBOLSO: TCurrencyField
      FieldName = 'DESEMBOLSO'
    end
  end
  object ibSI: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$planilladiaria".SALDO_ACTUAL,'
      '  "gen$planilladiaria".ID_TIPO_CAPTACION'
      'FROM'
      ' "gen$planilladiaria"'
      'WHERE'
      '  ("gen$planilladiaria".FECHA = :FECHA) AND '
      '  ("gen$planilladiaria".ID_AGENCIA = :ID_AGENCIA)')
    Left = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
  object ibSA: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$planilladiaria".SALDO_ACTUAL,'
      '  "gen$planilladiaria".ID_TIPO_CAPTACION'
      'FROM'
      ' "gen$planilladiaria"'
      'WHERE'
      '  ("gen$planilladiaria".FECHA = :FECHA) AND '
      '  ("gen$planilladiaria".ID_AGENCIA = :ID_AGENCIA)')
    Left = 176
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 144
    Top = 16
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = cdSumatoria
    Left = 24
  end
end
