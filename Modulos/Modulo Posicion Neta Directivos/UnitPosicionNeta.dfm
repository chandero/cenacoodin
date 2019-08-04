object frmPosicionNeta: TfrmPosicionNeta
  Left = 324
  Top = 178
  Width = 1098
  Height = 418
  Caption = 'Posici'#243'n Neta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 5
    Width = 19
    Height = 13
    Caption = 'A'#241'o'
  end
  object Label2: TLabel
    Left = 16
    Top = 26
    Width = 60
    Height = 13
    Caption = 'Fecha Inicial'
  end
  object Label3: TLabel
    Left = 16
    Top = 48
    Width = 55
    Height = 13
    Caption = 'Fecha Final'
  end
  object Label4: TLabel
    Left = 16
    Top = 72
    Width = 83
    Height = 13
    Caption = 'Fecha Causaci'#243'n'
  end
  object CmdProcesar: TBitBtn
    Left = 400
    Top = 4
    Width = 97
    Height = 25
    Caption = '&Iniciar Proceso'
    TabOrder = 0
    OnClick = CmdProcesarClick
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
  object CmdReporte: TBitBtn
    Left = 400
    Top = 32
    Width = 97
    Height = 25
    Caption = 'A Excel'
    TabOrder = 1
    OnClick = CmdReporteClick
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
  object CmdCerrar: TBitBtn
    Left = 400
    Top = 60
    Width = 97
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 2
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 96
    Width = 1073
    Height = 281
    DataSource = DSpn
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object EdAnho: TJvYearEdit
    Left = 109
    Top = 2
    Width = 121
    Height = 21
    Alignment = taRightJustify
    ReadOnly = False
    TabOrder = 4
    Value = 2000
    MaxValue = 9999
    MinValue = 0
    HasMaxValue = True
    HasMinValue = True
    WindowsillYear = 71
  end
  object EdFechaInicial: TJvDateEdit
    Left = 109
    Top = 24
    Width = 121
    Height = 21
    ButtonFlat = False
    NumGlyphs = 2
    TabOrder = 5
  end
  object EdFechaFinal: TJvDateEdit
    Left = 109
    Top = 48
    Width = 121
    Height = 21
    ButtonFlat = False
    NumGlyphs = 2
    TabOrder = 6
  end
  object EdFechaCorte: TJvDateEdit
    Left = 109
    Top = 72
    Width = 121
    Height = 21
    ButtonFlat = False
    NumGlyphs = 2
    TabOrder = 7
  end
  object CDSCaptacion: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TIPO_IDE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMERO_IDE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SALDO'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 366
    Top = 112
    Data = {
      780000009619E0BD010000001800000003000000000003000000780008544950
      4F5F49444501004900000001000557494454480200020001000A4E554D45524F
      5F4944450100490000000100055749445448020002000F000553414C444F0800
      04000000010007535542545950450200490006004D6F6E6579000000}
    object CDSCaptacionTIPO_IDE: TStringField
      FieldName = 'TIPO_IDE'
      Size = 1
    end
    object CDSCaptacionNUMERO_IDE: TStringField
      FieldName = 'NUMERO_IDE'
      Size = 15
    end
    object CDSCaptacionSALDO: TCurrencyField
      FieldName = 'SALDO'
    end
  end
  object CDSColocacion: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TIPO_IDE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMERO_IDE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SALDO_CAPITAL'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 394
    Top = 112
    Data = {
      800000009619E0BD010000001800000003000000000003000000800008544950
      4F5F49444501004900000001000557494454480200020001000A4E554D45524F
      5F4944450100490000000100055749445448020002000F000D53414C444F5F43
      41504954414C080004000000010007535542545950450200490006004D6F6E65
      79000000}
    object CDSColocacionTIPO_IDE: TStringField
      FieldName = 'TIPO_IDE'
      Size = 1
    end
    object CDSColocacionNUMERO_IDE: TStringField
      FieldName = 'NUMERO_IDE'
      Size = 15
    end
    object CDSColocacionSALDO_CAPITAL: TCurrencyField
      FieldName = 'SALDO_CAPITAL'
    end
  end
  object CDSAportes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TIPO_IDE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMERO_IDE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SALDO_APO'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 414
    Top = 112
    Data = {
      7C0000009619E0BD0100000018000000030000000000030000007C0008544950
      4F5F49444501004900000001000557494454480200020001000A4E554D45524F
      5F4944450100490000000100055749445448020002000F000953414C444F5F41
      504F080004000000010007535542545950450200490006004D6F6E6579000000}
    object CDSAportesTIPO_IDE: TStringField
      FieldName = 'TIPO_IDE'
      Size = 1
    end
    object CDSAportesNUMERO_IDE: TStringField
      FieldName = 'NUMERO_IDE'
      Size = 15
    end
    object CDSAportesSALDO_APO: TCurrencyField
      FieldName = 'SALDO_APO'
    end
  end
  object CDSDocumentos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TIPO_IDE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMERO_IDE'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 382
    Top = 140
    Data = {
      560000009619E0BD010000001800000002000000000003000000560008544950
      4F5F49444501004900000001000557494454480200020001000A4E554D45524F
      5F4944450100490000000100055749445448020002000F000000}
    object CDSDocumentosTIPO_IDE: TStringField
      FieldName = 'TIPO_IDE'
      Size = 1
    end
    object CDSDocumentosNUMERO_IDE: TStringField
      FieldName = 'NUMERO_IDE'
      Size = 15
    end
  end
  object CDSPosicion: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NUMERO_IDE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CAPTACION'
        DataType = ftCurrency
      end
      item
        Name = 'COLOCACION'
        DataType = ftCurrency
      end
      item
        Name = 'APORTES'
        DataType = ftCurrency
      end
      item
        Name = 'POSICION'
        DataType = ftCurrency
      end
      item
        Name = 'PRIMER_APELLIDO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SEGUNDO_APELLIDO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 410
    Top = 140
    Data = {
      330100009619E0BD01000000180000000800000000000300000033010A4E554D
      45524F5F4944450100490000000100055749445448020002000F000943415054
      4143494F4E080004000000010007535542545950450200490006004D6F6E6579
      000A434F4C4F434143494F4E0800040000000100075355425459504502004900
      06004D6F6E6579000741504F5254455308000400000001000753554254595045
      0200490006004D6F6E65790008504F534943494F4E0800040000000100075355
      42545950450200490006004D6F6E6579000F5052494D45525F4150454C4C4944
      4F0100490000000100055749445448020002001E0010534547554E444F5F4150
      454C4C49444F0100490000000100055749445448020002001E00064E4F4D4252
      4501004900000001000557494454480200020032000000}
    object CDSPosicionNUMERO_IDE: TStringField
      FieldName = 'NUMERO_IDE'
      Size = 15
    end
    object CDSPosicionCAPTACION: TCurrencyField
      FieldName = 'CAPTACION'
    end
    object CDSPosicionCOLOCACION: TCurrencyField
      FieldName = 'COLOCACION'
    end
    object CDSPosicionAPORTES: TCurrencyField
      FieldName = 'APORTES'
    end
    object CDSPosicionPOSICION: TCurrencyField
      FieldName = 'POSICION'
    end
    object CDSPosicionPRIMER_APELLIDO: TStringField
      FieldName = 'PRIMER_APELLIDO'
      Size = 30
    end
    object CDSPosicionSEGUNDO_APELLIDO: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Size = 30
    end
    object CDSPosicionNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 50
    end
  end
  object Reporte: TprTxReport
    Values = <>
    Variables = <>
    Left = 422
    Top = 166
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
        Height = 2
        UseVerticalBands = False
        PrintOnFirstPage = False
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'POSICION NETA DIRECTIVOS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 26
          dRec.Top = 0
          dRec.Right = 50
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'CDSPosicion'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand1')
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDSPosicion.NUMERO_IDE]')
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
          dRec.Right = 15
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,0.00>CDSPosicion.POSICION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 0
          dRec.Right = 32
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,0.00>CDSPosicion.COLOCACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 52
          dRec.Top = 0
          dRec.Right = 70
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,0.00>CDSPosicion.CAPTACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 33
          dRec.Top = 0
          dRec.Right = 51
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,0.00>CDSPosicion.APORTES]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 71
          dRec.Top = 0
          dRec.Right = 89
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[CDSPosicion.PRIMER_APELLIDO] [CDSPosicion.SEGUNDO_APELLIDO] [CD' +
                  'SPosicion.NOMBRE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 90
          dRec.Top = 0
          dRec.Right = 132
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 2
        UseVerticalBands = False
        DetailBand = Reporte.prTxHDetailBand1
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = True
        LinkToDetail = True
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DOCUMENTO')
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
          dRec.Right = 15
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'POSICION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 0
          dRec.Right = 32
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CAPTACIONES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 33
          dRec.Top = 0
          dRec.Right = 51
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'COLOCACIONES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 52
          dRec.Top = 0
          dRec.Right = 70
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'APORTES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 71
          dRec.Top = 0
          dRec.Right = 89
          dRec.Bottom = 1
          Visible = False
        end
        object prTxHLineObj1: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 89
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'ASOCIADO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 90
          dRec.Top = 0
          dRec.Right = 132
          dRec.Bottom = 1
          Visible = False
        end
      end
    end
  end
  object IBQuery1: TIBQuery
    Left = 464
    Top = 96
  end
  object CDSpn: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = CDSpnCalcFields
    Left = 392
    Top = 176
    Data = {
      2D0100009619E0BD0100000018000000080000000000030000002D011149445F
      4944454E54494649434143494F4E04000100000000000A49445F504552534F4E
      410100490000000100055749445448020002001E000F5052494D45525F415045
      4C4C49444F010049000000010005574944544802000200320010534547554E44
      4F5F4150454C4C49444F0100490000000100055749445448020002003200074E
      4F4D4252455301004900000001000557494454480200020064000B4341505441
      43494F4E4553080004000000010007535542545950450200490006004D6F6E65
      79000C434F4C4F434143494F4E45530800040000000100075355425459504502
      00490006004D6F6E6579000741504F5254455308000400000001000753554254
      5950450200490006004D6F6E6579000000}
    object CDSpnID_IDENTIFICACION: TIntegerField
      FieldName = 'ID_IDENTIFICACION'
    end
    object CDSpnID_PERSONA: TStringField
      FieldName = 'ID_PERSONA'
      Size = 30
    end
    object CDSpnPRIMER_APELLIDO: TStringField
      FieldName = 'PRIMER_APELLIDO'
      Size = 50
    end
    object CDSpnSEGUNDO_APELLIDO: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Size = 50
    end
    object CDSpnNOMBRES: TStringField
      FieldName = 'NOMBRES'
      Size = 100
    end
    object CDSpnCAPTACIONES: TCurrencyField
      FieldName = 'CAPTACIONES'
    end
    object CDSpnCOLOCACIONES: TCurrencyField
      FieldName = 'COLOCACIONES'
    end
    object CDSpnBRECHA_PASIVA_ACTIVA: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'BRECHA_PASIVA_ACTIVA'
      Calculated = True
    end
    object CDSpnAPORTES: TCurrencyField
      FieldName = 'APORTES'
    end
    object CDSpnPOSICION_NETA: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'POSICION_NETA'
      Calculated = True
    end
  end
  object DSpn: TDataSource
    DataSet = CDSpn
    Left = 360
    Top = 176
  end
  object SD1: TJvSaveDialog
    Height = 0
    Width = 0
    Left = 304
    Top = 40
  end
end
