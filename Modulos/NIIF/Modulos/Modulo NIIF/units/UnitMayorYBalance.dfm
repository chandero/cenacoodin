object frmMayorYBalance: TfrmMayorYBalance
  Left = 209
  Top = 205
  Width = 366
  Height = 132
  Caption = 'Mayor y Balance'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -7
    Top = -1
    Width = 351
    Height = 50
    TabOrder = 0
    object Label5: TLabel
      Left = 16
      Top = 13
      Width = 99
      Height = 13
      Caption = 'Balance con corte a:'
    end
    object Label4: TLabel
      Left = 240
      Top = 12
      Width = 22
      Height = 13
      Caption = 'A'#241'o:'
    end
    object CBMeses: TComboBox
      Left = 128
      Top = 9
      Width = 105
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Enero'
      Items.Strings = (
        'Enero'
        'Febrero'
        'Marzo'
        'Abril'
        'Mayo'
        'Junio'
        'Julio'
        'Agosto'
        'Septiembre'
        'Octubre'
        'Noviembre'
        'Diciembre')
    end
    object EdAno: TMaskEdit
      Left = 264
      Top = 8
      Width = 31
      Height = 21
      EditMask = '!9999;1;_'
      MaxLength = 4
      ReadOnly = True
      TabOrder = 1
      Text = '    '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 358
    Height = 33
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object CmdAceptar: TBitBtn
      Left = 7
      Top = 5
      Width = 81
      Height = 25
      Caption = '&Procesar'
      TabOrder = 0
      OnClick = CmdAceptarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000008C00000094
        0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
        210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
        420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
        94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
        04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
        0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
        170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
        13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
        1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
        1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
        1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
    end
    object CmdCerrar: TBitBtn
      Left = 278
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = CmdCerrarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000006400004242
        42008C6363009A666600B9666600BB686800B0717200C3686900C66A6B00C76A
        6D00CF6C6E00D2686900D16D6E00CC6E7100C0797A00D2707200D4707100D572
        7300D0727500D3747600D9757600D8767700E37D7E000080000000960000DC7F
        8000FF00FF00D7868700DA888800D8888A00DA888A00DF898A00E6808100E085
        8500E9818200EE868700E3888900E78C8D00F0878800F18B8C00F28B8C00F18D
        8E00F48C8D00F48E8F00EB8F9000EC969700E49A9800F3919200F7909100F791
        9200F2939400F9909200F9949500FA949500F9969700F0999A00FC999A00FF9D
        9E00F7B58400F5A7A500FACCAA00FBD6BB00FADCDC00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001A1A1A1A1A1A
        1A02011A1A1A1A1A1A1A1A1A1A1A02030405011A1A1A1A1A1A1A1A1A0203080B
        0B07010303030303031A1A1A030C0C0C0A09010E1F323B3B031A1A1A030C0C10
        0F0D01181818183B031A1A1A03111114151201181818183B031A1A1A03161616
        201301181717173B031A1A1A0326222D3E1D01171700003B031A1A1A03262337
        3F1E013C3A3A3A3B031A1A1A03272B282A19013C3D3D3D3B031A1A1A03273031
        2921013C3D3D3D3B031A1A1A032734352F24013C3D3D3D3B031A1A1A03273338
        3625013C3D3D3D3B031A1A1A03032E33392C013C3D3D3D3B031A1A1A1A1A0306
        1B1C010303030303031A1A1A1A1A1A1A0303011A1A1A1A1A1A1A}
    end
    object btnReporte: TBitBtn
      Left = 91
      Top = 5
      Width = 84
      Height = 25
      Caption = '&Reporte'
      Enabled = False
      TabOrder = 2
      OnClick = btnReporteClick
    end
    object btnAExcel: TBitBtn
      Left = 179
      Top = 5
      Width = 91
      Height = 25
      Caption = 'A Excel'
      Enabled = False
      TabOrder = 3
      OnClick = btnAExcelClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000320B0000320B00000001000000010000EFA54A00C684
        6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00B5848400B58C
        8400CE9C8400EFCE94009C9C9C00C6A59C00EFCE9C00F7D69C00C6ADA500F7D6
        A500CEB5AD00D6B5AD00C6BDAD00F7D6AD00D6BDB500DEBDB500DEC6B500E7C6
        B500EFCEB500F7D6B500F7DEB500EFCEBD00F7DEBD00527BC600E7DEC600F7DE
        C600F7E7C600E7CECE00E7D6CE00F7E7D600FFEFD600DEDEDE00FFEFE700FFF7
        E700FFF7EF00FFF7F700FFFFF700FF00FF0039A5FF0000F7FF0094FFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002D2D08080808
        0808080808080808082D2D2D0D261F1F1C15110E0B0B0B0F082D2D2D0D262F1F
        1F0C0C0C0C0C0C0E082D2D2D10282E2F1F1F1F150E0E0B0E082D2D2D1029252E
        302F1F1F150E0E0B082D2D2D121F1F1F1F302F1F1F0C0C0E082D2D2D132E302F
        2F2F2F2F1F1F1111082D2D2D16312E302F1F1F22211E1B15082D2D2D1631272E
        302F1F1F0C0C0C1C082D2D2D1731312E302F2F1F1F21211B082D2D2D18313131
        2E302F2F1F1F2014082D2D2D1931270C0C2E302F2F1F1F09082D2D2D19313131
        3131312C23020400012D2D2D1D31313131313131240705032D2D2D2D192B2A2A
        2A2A2A2A23070A2D2D2D2D2D191A1A1A1A19191A16062D2D2D2D}
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 48
    Width = 345
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 2
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 280
    Top = 32
    ReportForm = {19000000}
  end
  object frOLEExcelExport1: TfrOLEExcelExport
    Left = 248
    Top = 32
  end
  object IBQPuc: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 5
    Top = 31
  end
  object IBQTabla: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DEBITOANT'
        DataType = ftCurrency
      end
      item
        Name = 'CREDITOANT'
        DataType = ftCurrency
      end
      item
        Name = 'DEBITOMOV'
        DataType = ftCurrency
      end
      item
        Name = 'CREDITOMOV'
        DataType = ftCurrency
      end
      item
        Name = 'DEBITOACT'
        DataType = ftCurrency
      end
      item
        Name = 'CREDITOACT'
        DataType = ftCurrency
      end
      item
        Name = 'DESCRIPCION_AGENCIA'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'IBQTablaIndex1'
        Fields = 'CODIGO'
      end>
    IndexName = 'IBQTablaIndex1'
    Params = <>
    StoreDefs = True
    OnCalcFields = IBQTablaCalcFields
    Left = 82
    Top = 26
    Data = {
      5F0100009619E0BD0100000018000000090000000000030000005F0106434F44
      49474F0100490000000100055749445448020002000400064E4F4D4252450100
      4900000001000557494454480200020064000944454249544F414E5408000400
      0000010007535542545950450200490006004D6F6E6579000A4352454449544F
      414E54080004000000010007535542545950450200490006004D6F6E65790009
      44454249544F4D4F56080004000000010007535542545950450200490006004D
      6F6E6579000A4352454449544F4D4F5608000400000001000753554254595045
      0200490006004D6F6E6579000944454249544F41435408000400000001000753
      5542545950450200490006004D6F6E6579000A4352454449544F414354080004
      000000010007535542545950450200490006004D6F6E65790013444553435249
      5043494F4E5F4147454E43494101004900000001000557494454480200020064
      000000}
    object IBQTablaCODIGO: TStringField
      DisplayWidth = 4
      FieldName = 'CODIGO'
      Size = 4
    end
    object IBQTablaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object IBQTablaDEBITOANT: TCurrencyField
      FieldName = 'DEBITOANT'
    end
    object IBQTablaCREDITOANT: TCurrencyField
      FieldName = 'CREDITOANT'
    end
    object IBQTablaDEBITOMOV: TCurrencyField
      FieldName = 'DEBITOMOV'
    end
    object IBQTablaCREDITOMOV: TCurrencyField
      FieldName = 'CREDITOMOV'
    end
    object IBQTablaDEBITOACT: TCurrencyField
      FieldName = 'DEBITOACT'
    end
    object IBQTablaCREDITOACT: TCurrencyField
      FieldName = 'CREDITOACT'
    end
    object IBQTablaDESCRIPCION_AGENCIA: TStringField
      FieldName = 'DESCRIPCION_AGENCIA'
      Size = 100
    end
  end
  object IBQsaldo: TIBQuery
    Left = 40
    Top = 32
  end
  object IBQTabla1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DEBITOANT'
        DataType = ftCurrency
      end
      item
        Name = 'CREDITOANT'
        DataType = ftCurrency
      end
      item
        Name = 'DEBITOMOV'
        DataType = ftCurrency
      end
      item
        Name = 'CREDITOMOV'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'IBQTablaIndex1'
        Fields = 'CODIGO'
      end>
    IndexName = 'IBQTablaIndex1'
    Params = <>
    StoreDefs = True
    OnCalcFields = IBQTabla1CalcFields
    Left = 110
    Top = 26
    Data = {
      EA0000009619E0BD010000001800000006000000000003000000EA0006434F44
      49474F0100490000000100055749445448020002000400064E4F4D4252450100
      4900000001000557494454480200020064000944454249544F414E5408000400
      0000010007535542545950450200490006004D6F6E6579000A4352454449544F
      414E54080004000000010007535542545950450200490006004D6F6E65790009
      44454249544F4D4F56080004000000010007535542545950450200490006004D
      6F6E6579000A4352454449544F4D4F5608000400000001000753554254595045
      0200490006004D6F6E6579000000}
    object StringField1: TStringField
      DisplayWidth = 4
      FieldName = 'CODIGO'
      Size = 4
    end
    object StringField2: TStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'DEBITOANT'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'CREDITOANT'
    end
    object CurrencyField3: TCurrencyField
      FieldName = 'DEBITOMOV'
    end
    object CurrencyField4: TCurrencyField
      FieldName = 'CREDITOMOV'
    end
    object IBQTabla1DEBITOACT: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'DEBITOACT'
      Calculated = True
    end
    object IBQTabla1CREDITOACT: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CREDITOACT'
      Calculated = True
    end
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = IBQTabla
    Left = 184
    Top = 32
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = IBQTabla1
    Left = 216
    Top = 32
  end
  object SD1: TSaveDialog
    Left = 248
    Top = 48
  end
end
