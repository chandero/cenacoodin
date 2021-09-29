object frmRevalorizacionAportes: TfrmRevalorizacionAportes
  Left = 561
  Top = 263
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Revalorizaci'#243'n de Aportes'
  ClientHeight = 180
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 257
    Height = 180
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 14
      Width = 102
      Height = 13
      Caption = 'A'#241'o a Revalorizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 40
      Width = 83
      Height = 13
      Caption = 'Tasa a Aplicar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 14
      Top = 68
      Width = 90
      Height = 13
      Caption = 'Fecha a Aplicar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 14
      Top = 94
      Width = 82
      Height = 13
      Caption = 'Nota Contable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RGproceso: TRadioGroup
      Left = 8
      Top = 122
      Width = 215
      Height = 41
      Caption = 'Tipo de Proceso'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Prueba'
        'Definitivo')
      ParentFont = False
      TabOrder = 0
    end
    object EdTasa: TJvFloatEdit
      Left = 120
      Top = 36
      Width = 41
      Height = 21
      Alignment = taRightJustify
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 1
    end
    object EdYear: TJvYearEdit
      Left = 120
      Top = 10
      Width = 41
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = False
      TabOrder = 2
      Value = 2000
      MaxValue = 9999
      MinValue = 1984
      HasMaxValue = True
      HasMinValue = True
      WindowsillYear = 71
    end
    object EdFechaAplicar: TDateTimePicker
      Left = 120
      Top = 60
      Width = 99
      Height = 21
      CalAlignment = dtaLeft
      Date = 38078.2973854167
      Time = 38078.2973854167
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 3
    end
    object EdCbte: TJvIntegerEdit
      Left = 120
      Top = 88
      Width = 49
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = False
      TabOrder = 4
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
  end
  object Panel2: TPanel
    Left = 257
    Top = 0
    Width = 124
    Height = 180
    Align = alRight
    Color = clOlive
    TabOrder = 1
    object CmdRevalorizar: TBitBtn
      Left = 4
      Top = 4
      Width = 117
      Height = 25
      Caption = '&Calcular Promedios'
      TabOrder = 0
      OnClick = CmdRevalorizarClick
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
    object CmdInforme: TBitBtn
      Left = 4
      Top = 85
      Width = 117
      Height = 25
      Caption = 'Ver &Informe'
      TabOrder = 1
      OnClick = CmdInformeClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000181818002118
        21001821210031313100393939004242420052525200636363006B6B6B007373
        7300848484008C8C8C00948C8C00949494009C949400F7AD94009C9C9C00CE9C
        9C00F7AD9C00FFAD9C00FFB59C009C9CA500A5A5A500ADA5A500C6A5A500A5AD
        A500FFBDA500A5D6A500ADADAD00B5ADAD00FFC6AD00B5B5B500FFC6B500BDBD
        BD00C6BDBD00BDC6BD00E7C6BD00EFCEBD00FFCEBD00BDBDC600C6C6C600CEC6
        C600E7CEC600CECECE00D6CECE00DED6CE00FFDECE00D6D6D600FFE7D600D6DE
        DE00DEDEDE00EFE7DE00E7E7E700EFE7E700FFE7E700EFEFEF00F7EFEF00F7EF
        F700F7F7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003B3B3B3B3B3B
        103B3B3B0A0A0B3B3B3B3B3B3B3B10102C0D04060E282F0A3B3B3B3B10103A3C
        2F1005010103070A0B3B0C10373C3528100B0D0A07040201093B10343421161D
        22160D0C0D0E0B080A3B0D1C161C282F373732281C100C0D0B3B0C1C282B2832
        2B19212B2F2F281F0D3B3B102B2B32281F1B231817161F22163B3B3B10211C1C
        343837332F2B1F0D3B3B3B3B3B102F2B10212F2F2F281C3B3B3B3B3B3B3B362E
        24242A2D2B0D3B3B3B3B3B3B3B3B112E261E1A133B3B3B3B3B3B3B3B3B3B112E
        261E1A0F3B3B3B3B3B3B3B3B3B3B112E261E1A123B3B3B3B3B3B3B3B3B11302E
        261E1A123B3B3B3B3B3B3B3B3B1111111112123B3B3B3B3B3B3B}
    end
    object CmdAplicar: TBitBtn
      Left = 4
      Top = 58
      Width = 117
      Height = 25
      Caption = '&Aplicar       '
      Enabled = False
      TabOrder = 2
      OnClick = CmdAplicarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
        840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
        C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
        F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
        FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
        1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
        0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F0F0F
        1D111111110E0A08031F1F0A0E11131D1F1D1111110E0B09041F1F0C11131D1F
        1D1F1D11110E0B0A051F1F0E131D1F1D11111F1D0F0C0A0A061F1F0F13131D11
        1111111F1D0B0A0A061F1F131515131311100F0F1F1D0A0A061F1F1318181514
        13130F0E0C1F1D0A061F1F151A1916151514110F0E0C1F0A061F1F181C1A1817
        16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
        1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
    end
    object CmdCerrar: TBitBtn
      Left = 4
      Top = 138
      Width = 117
      Height = 25
      Caption = '&Cerrar        '
      TabOrder = 3
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
    object cmdComputar: TBitBtn
      Left = 4
      Top = 31
      Width = 117
      Height = 25
      Hint = 'Aplica la tasa de inter'#233's al promedio calculado'
      Caption = '&Computar Valor'
      Enabled = False
      TabOrder = 4
      OnClick = cmdComputarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = ibt
    Left = 202
    Top = 72
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = ibt
    SQL.Strings = (
      'select * from "cap$revalorizacion"')
    Left = 196
    Top = 40
  end
  object MData: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'FECHA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DEBITO'
        DataType = ftCurrency
      end
      item
        Name = 'CREDITO'
        DataType = ftCurrency
      end
      item
        Name = 'SALDO'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 54
    Top = 6
    Data = {
      9D0000009619E0BD0100000018000000040000000000030000009D0005464543
      484101004900000001000557494454480200020008000644454249544F080004
      000000010007535542545950450200490006004D6F6E65790007435245444954
      4F080004000000010007535542545950450200490006004D6F6E657900055341
      4C444F080004000000010007535542545950450200490006004D6F6E65790000
      00}
    object MDataFECHA: TStringField
      FieldName = 'FECHA'
      Size = 8
    end
    object MDataDEBITO: TCurrencyField
      FieldName = 'DEBITO'
    end
    object MDataCREDITO: TCurrencyField
      FieldName = 'CREDITO'
    end
    object MDataSALDO: TCurrencyField
      FieldName = 'SALDO'
    end
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = ibt
    Left = 148
    Top = 64
  end
  object IBPagar: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = ibt
    Left = 192
    Top = 4
  end
  object Reporte: TprTxReport
    ExportFromPage = 0
    ExportToPage = 0
    Values = <
      item
        Group = Reporte.prGAplica
        Name = 'TotalRevalorizacion'
        AggFunction = prafCount
        Formula = 'IBQuery5.NUMERO_CUENTA'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuery5'
        Accumulate = True
      end
      item
        Group = Reporte.prGAplica
        Name = 'TotalSuma'
        AggFunction = prafSum
        Formula = 'IBQuery5.REVALORIZACION'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuery5'
        Accumulate = True
      end
      item
        Group = Reporte.prGAplica
        Name = 'TotalNoRevalorizacion'
        AggFunction = prafCount
        Formula = 'IBQuery5.NUMERO_CUENTA'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuery5'
      end
      item
        Group = Reporte.prGNoAplica
        Name = 'TotalNoSuma'
        AggFunction = prafSum
        Formula = 'IBQuery5.REVALORIZACION'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuery5'
      end>
    Variables = <
      item
        Name = 'Empresa'
        ValueType = 'prvvtString'
        Value = 'CREDISERVIR LTDA'
      end
      item
        Name = 'Ano'
        ValueType = 'prvvtInteger'
        Value = 2003
      end
      item
        Name = 'FechaAplicada'
        ValueType = 'prvvtDateTime'
        Value = 38077d
      end
      item
        Name = 'Agencia'
        ValueType = 'prvvtString'
        Value = 'Oca'#241'a'
      end>
    OnUnknownVariable = ReporteUnknownVariable
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 128
    Top = 42
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 3'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 1'
      'ProcessorType: 586'
      ''
      'Compiler version: Delphi6'
      'PReport version: 1.9.4')
    object prTxPage1: TprTxPage
      PageType = tptPage
      LineNum = 60
      ColNum = 132
      object prTxHPageHeaderBand1: TprTxHPageHeaderBand
        Height = 3
        UseVerticalBands = False
        PrintOnFirstPage = True
        object prTxCommandObj1: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcNormal)
            end>
          dRec.Left = 20
          dRec.Top = 0
          dRec.Right = 21
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[Empresa]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 20
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INFORME REVALORIZACION DE APORTES A#O [:<0000>ANO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 32
          dRec.Top = 0
          dRec.Right = 75
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Impreso:[:<yyyy/mm/dd>StartDateTime]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 80
          dRec.Top = 0
          dRec.Right = 99
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Pagina:[:<000>Page]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 101
          dRec.Top = 0
          dRec.Right = 111
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---+')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 2
          dRec.Right = 132
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha Aplicacion: [:<yyyy/MM/dd>FechaAplicada]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 41
          dRec.Top = 1
          dRec.Right = 70
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AGENCIA:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 10
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[Agencia]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 1
          dRec.Right = 32
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 2
        UseVerticalBands = False
        DetailBand = Reporte.prTxHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = True
        LinkToDetail = True
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---+')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 132
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CAPTACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 14
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'IDENTIFICACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 15
          dRec.Top = 0
          dRec.Right = 29
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NOMBRE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 30
          dRec.Top = 0
          dRec.Right = 79
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'REVALORIZACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 80
          dRec.Top = 0
          dRec.Right = 95
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'APLICA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 0
          dRec.Right = 102
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBQuery5'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Groups = (
          'prGAplica')
        Bands = (
          'prTxHDetailHeaderBand1')
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBQuery5.ID_TIPO_CAPTACION][:<00>IBQuery5.ID_AGENCIA]-[:<000000' +
                  '0>IBQuery5.NUMERO_CUENTA]-[IBQuery5.DIGITO_CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 14
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBQuery5.PRIMER_APELLIDO] [IBQuery5.SEGUNDO_APELLIDO] [IBQuery5' +
                  '.NOMBRE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 15
          dRec.Top = 0
          dRec.Right = 79
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBQuery5.REVALORIZACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 80
          dRec.Top = 0
          dRec.Right = 95
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuery5.SE_PAGA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 0
          dRec.Right = 102
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHGroupHeaderBand1: TprTxHGroupHeaderBand
        Height = 1
        UseVerticalBands = False
        Group = Reporte.prGAplica
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = True
        StartNewPage = False
        ReprintOnEachPage = True
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CUENTAS A REVALORIZAR')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 24
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHGroupFooterBand1: TprTxHGroupFooterBand
        Height = 3
        UseVerticalBands = False
        Group = Reporte.prGAplica
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = True
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---+')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 132
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Total Revalorizacion')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 24
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[TotalRevalorizacion]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 56
          dRec.Top = 1
          dRec.Right = 62
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>TotalSuma]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 75
          dRec.Top = 1
          dRec.Right = 95
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---+')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 2
          dRec.Right = 132
          dRec.Bottom = 3
          Visible = False
        end
      end
    end
    object prGAplica: TprGroup
      Valid = 'IBQuery5.SE_PAGA'
      DetailBand = Reporte.prTxHDetailBand1
    end
    object prGNoAplica: TprGroup
      Valid = 'IBQuery5.SE_PAGA = 0'
    end
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = ibt
    Left = 158
    Top = 6
  end
  object IBQuery5: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = ibt
    SQL.Strings = (
      'SELECT '
      '  "cap$revalorizacion".*,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$persona".NOMBRE'
      'FROM'
      ' "cap$revalorizacion"'
      
        ' INNER JOIN "cap$maestrotitular" ON ("cap$revalorizacion".ID_AGE' +
        'NCIA="cap$maestrotitular".ID_AGENCIA)'
      
        '  AND ("cap$revalorizacion".ID_TIPO_CAPTACION="cap$maestrotitula' +
        'r".ID_TIPO_CAPTACION)'
      
        '  AND ("cap$revalorizacion".NUMERO_CUENTA="cap$maestrotitular".N' +
        'UMERO_CUENTA)'
      
        '  AND ("cap$revalorizacion".DIGITO_CUENTA="cap$maestrotitular".D' +
        'IGITO_CUENTA)'
      
        ' INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICA' +
        'CION="gen$persona".ID_IDENTIFICACION)'
      '  AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)'
      'WHERE'
      ' "cap$revalorizacion".REVALORIZACION > 0'
      
        'order by SE_PAGA, ID_AGENCIA,ID_TIPO_CAPTACION, NUMERO_CUENTA,DI' +
        'GITO_CUENTA')
    Left = 174
    Top = 98
    object IBQuery5ID_AGENCIA: TSmallintField
      FieldName = 'ID_AGENCIA'
      Origin = '"cap$revalorizacion"."ID_AGENCIA"'
      Required = True
    end
    object IBQuery5ID_TIPO_CAPTACION: TSmallintField
      FieldName = 'ID_TIPO_CAPTACION'
      Origin = '"cap$revalorizacion"."ID_TIPO_CAPTACION"'
      Required = True
    end
    object IBQuery5NUMERO_CUENTA: TIntegerField
      FieldName = 'NUMERO_CUENTA'
      Origin = '"cap$revalorizacion"."NUMERO_CUENTA"'
      Required = True
    end
    object IBQuery5DIGITO_CUENTA: TSmallintField
      FieldName = 'DIGITO_CUENTA'
      Origin = '"cap$revalorizacion"."DIGITO_CUENTA"'
    end
    object IBQuery5ANO: TIntegerField
      FieldName = 'ANO'
      Origin = '"cap$revalorizacion"."ANO"'
    end
    object IBQuery5PROMEDIO: TIBBCDField
      FieldName = 'PROMEDIO'
      Origin = '"cap$revalorizacion"."PROMEDIO"'
      Precision = 18
      Size = 3
    end
    object IBQuery5TASA: TFloatField
      FieldName = 'TASA'
      Origin = '"cap$revalorizacion"."TASA"'
    end
    object IBQuery5MES_CANCELO: TIntegerField
      FieldName = 'MES_CANCELO'
      Origin = '"cap$revalorizacion"."MES_CANCELO"'
    end
    object IBQuery5SE_PAGA: TSmallintField
      FieldName = 'SE_PAGA'
      Origin = '"cap$revalorizacion"."SE_PAGA"'
    end
    object IBQuery5DIAS: TIntegerField
      FieldName = 'DIAS'
      Origin = '"cap$revalorizacion"."DIAS"'
    end
    object IBQuery5REVALORIZACION: TIBBCDField
      FieldName = 'REVALORIZACION'
      Origin = '"cap$revalorizacion"."REVALORIZACION"'
      Precision = 18
      Size = 3
    end
    object IBQuery5ESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"cap$revalorizacion"."ESTADO"'
      FixedChar = True
      Size = 1
    end
    object IBQuery5VALOR_AJUSTADO: TIBBCDField
      FieldName = 'VALOR_AJUSTADO'
      Origin = '"cap$revalorizacion"."VALOR_AJUSTADO"'
      Precision = 18
      Size = 3
    end
    object IBQuery5ESTADO_AJUSTE: TIBStringField
      FieldName = 'ESTADO_AJUSTE'
      Origin = '"cap$revalorizacion"."ESTADO_AJUSTE"'
      FixedChar = True
      Size = 1
    end
    object IBQuery5PAGADO: TSmallintField
      FieldName = 'PAGADO'
      Origin = '"cap$revalorizacion"."PAGADO"'
    end
    object IBQuery5PRIMER_APELLIDO: TIBStringField
      FieldName = 'PRIMER_APELLIDO'
      Origin = '"gen$persona"."PRIMER_APELLIDO"'
      Size = 30
    end
    object IBQuery5SEGUNDO_APELLIDO: TIBStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Origin = '"gen$persona"."SEGUNDO_APELLIDO"'
      Size = 30
    end
    object IBQuery5NOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = '"gen$persona"."NOMBRE"'
      Size = 255
    end
  end
  object MFecha: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 86
    Top = 6
    Data = {
      6F0000009619E0BD0100000018000000030000000000030000006F0005464543
      484104000600000000000644454249544F080004000000010007535542545950
      450200490006004D6F6E657900074352454449544F0800040000000100075355
      42545950450200490006004D6F6E6579000000}
    object MFechaFECHA: TDateField
      FieldName = 'FECHA'
    end
    object MFechaDEBITO: TCurrencyField
      FieldName = 'DEBITO'
    end
    object MFechaCREDITO: TCurrencyField
      FieldName = 'CREDITO'
    end
  end
  object MSaldos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 44
    Data = {
      490000009619E0BD01000000180000000200000000000300000049000553414C
      444F080004000000010007535542545950450200490006004D6F6E6579000444
      49415304000100000000000000}
    object MSaldosSALDO: TCurrencyField
      FieldName = 'SALDO'
    end
    object MSaldosDIAS: TIntegerField
      FieldName = 'DIAS'
    end
  end
  object cdsRevalorizacion: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRevalorizacion'
    Left = 16
    Top = 88
    object cdsRevalorizacionID_AGENCIA: TSmallintField
      FieldName = 'ID_AGENCIA'
      Required = True
    end
    object cdsRevalorizacionID_TIPO_CAPTACION: TSmallintField
      FieldName = 'ID_TIPO_CAPTACION'
      Required = True
    end
    object cdsRevalorizacionNUMERO_CUENTA: TIntegerField
      FieldName = 'NUMERO_CUENTA'
      Required = True
    end
    object cdsRevalorizacionDIGITO_CUENTA: TSmallintField
      FieldName = 'DIGITO_CUENTA'
      Required = True
    end
    object cdsRevalorizacionANO: TIntegerField
      FieldName = 'ANO'
      Required = True
    end
    object cdsRevalorizacionPROMEDIO: TBCDField
      FieldName = 'PROMEDIO'
      Precision = 18
      Size = 3
    end
    object cdsRevalorizacionTASA: TFloatField
      FieldName = 'TASA'
    end
    object cdsRevalorizacionMES_CANCELO: TIntegerField
      FieldName = 'MES_CANCELO'
    end
    object cdsRevalorizacionSE_PAGA: TSmallintField
      FieldName = 'SE_PAGA'
    end
    object cdsRevalorizacionDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object cdsRevalorizacionREVALORIZACION: TBCDField
      FieldName = 'REVALORIZACION'
      Precision = 18
      Size = 3
    end
    object cdsRevalorizacionESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 1
    end
    object cdsRevalorizacionVALOR_AJUSTADO: TBCDField
      FieldName = 'VALOR_AJUSTADO'
      Precision = 18
      Size = 3
    end
    object cdsRevalorizacionESTADO_AJUSTE: TStringField
      FieldName = 'ESTADO_AJUSTE'
      FixedChar = True
      Size = 1
    end
    object cdsRevalorizacionPAGADO: TSmallintField
      FieldName = 'PAGADO'
    end
  end
  object dspRevalorizacion: TDataSetProvider
    DataSet = ibqRevalorizacion
    Constraints = True
    Options = [poPropogateChanges]
    Left = 48
    Top = 88
  end
  object ibqRevalorizacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = ibt
    SQL.Strings = (
      'select * from "cap$revalorizaciontmp"')
    Left = 80
    Top = 88
    object ibqRevalorizacionID_AGENCIA: TSmallintField
      FieldName = 'ID_AGENCIA'
      Origin = '"cap$revalorizaciontmp"."ID_AGENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibqRevalorizacionID_TIPO_CAPTACION: TSmallintField
      FieldName = 'ID_TIPO_CAPTACION'
      Origin = '"cap$revalorizaciontmp"."ID_TIPO_CAPTACION"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibqRevalorizacionNUMERO_CUENTA: TIntegerField
      FieldName = 'NUMERO_CUENTA'
      Origin = '"cap$revalorizaciontmp"."NUMERO_CUENTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibqRevalorizacionDIGITO_CUENTA: TSmallintField
      FieldName = 'DIGITO_CUENTA'
      Origin = '"cap$revalorizaciontmp"."DIGITO_CUENTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibqRevalorizacionANO: TIntegerField
      FieldName = 'ANO'
      Origin = '"cap$revalorizaciontmp"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibqRevalorizacionPROMEDIO: TIBBCDField
      FieldName = 'PROMEDIO'
      Origin = '"cap$revalorizaciontmp"."PROMEDIO"'
      Precision = 18
      Size = 3
    end
    object ibqRevalorizacionTASA: TFloatField
      FieldName = 'TASA'
      Origin = '"cap$revalorizaciontmp"."TASA"'
    end
    object ibqRevalorizacionMES_CANCELO: TIntegerField
      FieldName = 'MES_CANCELO'
      Origin = '"cap$revalorizaciontmp"."MES_CANCELO"'
    end
    object ibqRevalorizacionSE_PAGA: TSmallintField
      FieldName = 'SE_PAGA'
      Origin = '"cap$revalorizaciontmp"."SE_PAGA"'
    end
    object ibqRevalorizacionDIAS: TIntegerField
      FieldName = 'DIAS'
      Origin = '"cap$revalorizaciontmp"."DIAS"'
    end
    object ibqRevalorizacionREVALORIZACION: TIBBCDField
      FieldName = 'REVALORIZACION'
      Origin = '"cap$revalorizaciontmp"."REVALORIZACION"'
      Precision = 18
      Size = 3
    end
    object ibqRevalorizacionESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"cap$revalorizaciontmp"."ESTADO"'
      FixedChar = True
      Size = 1
    end
    object ibqRevalorizacionVALOR_AJUSTADO: TIBBCDField
      FieldName = 'VALOR_AJUSTADO'
      Origin = '"cap$revalorizaciontmp"."VALOR_AJUSTADO"'
      Precision = 18
      Size = 3
    end
    object ibqRevalorizacionESTADO_AJUSTE: TIBStringField
      FieldName = 'ESTADO_AJUSTE'
      Origin = '"cap$revalorizaciontmp"."ESTADO_AJUSTE"'
      FixedChar = True
      Size = 1
    end
    object ibqRevalorizacionPAGADO: TSmallintField
      FieldName = 'PAGADO'
      Origin = '"cap$revalorizaciontmp"."PAGADO"'
    end
  end
  object ibt: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Left = 56
    Top = 120
  end
  object IBClientDataSet1: TIBClientDataSet
    Aggregates = <>
    Options = [poAllowCommandText]
    Params = <>
    Left = 80
    Top = 64
  end
end
