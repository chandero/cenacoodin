object frmCargarCostasJudiciales: TfrmCargarCostasJudiciales
  Left = 289
  Top = 178
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Cargar Costas Judiciales'
  ClientHeight = 295
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 264
    Width = 729
    Height = 31
    Align = alBottom
    Color = clOlive
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 10
      Width = 83
      Height = 13
      Caption = 'Comprobante No.'
      Color = clWhite
      ParentColor = False
    end
    object CmdCerrar: TBitBtn
      Left = 642
      Top = 4
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
    object CmdAplicar: TBitBtn
      Left = 440
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Aplicar'
      TabOrder = 0
      OnClick = CmdAplicarClick
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
    object CmdComprobante: TBitBtn
      Left = 518
      Top = 4
      Width = 111
      Height = 25
      Caption = 'Ver Comprobante'
      Enabled = False
      TabOrder = 2
      OnClick = CmdComprobanteClick
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
    object EdComprobante: TStaticText
      Left = 96
      Top = 6
      Width = 65
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      ParentColor = False
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 231
    Align = alTop
    TabOrder = 0
    object GridCostas: TJvStringGrid
      Left = 1
      Top = 1
      Width = 727
      Height = 229
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 18
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goEditing, goTabs]
      TabOrder = 0
      OnSelectCell = GridCostasSelectCell
      Alignment = taLeftJustify
      OnExitCell = GridCostasExitCell
      OnGetCellAlignment = GridCostasGetCellAlignment
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 231
    Width = 729
    Height = 33
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 186
      Top = 6
      Width = 62
      Height = 13
      Caption = 'Cta a Abonar'
    end
    object Label2: TLabel
      Left = 598
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object EdCuenta: TEdit
      Left = 250
      Top = 4
      Width = 53
      Height = 21
      TabOrder = 0
      OnExit = EdCuentaExit
      OnKeyPress = EdCuentaKeyPress
    end
    object EdNombre: TStaticText
      Left = 306
      Top = 4
      Width = 279
      Height = 21
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      ParentColor = False
      TabOrder = 1
    end
    object EdTotalCostas: TStaticText
      Left = 625
      Top = 4
      Width = 100
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      ParentColor = False
      TabOrder = 2
    end
    object ChSucursal: TCheckBox
      Left = 5
      Top = 5
      Width = 104
      Height = 17
      Caption = 'Sucursal Agencia'
      TabOrder = 3
      OnClick = ChSucursalClick
      OnExit = ChSucursalExit
    end
    object EdAgencia: TDBLookupComboBox
      Left = 113
      Top = 3
      Width = 69
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = DSAgencia
      ParentFont = False
      TabOrder = 4
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 38
    Top = 130
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 66
    Top = 130
  end
  object IBPagar: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 98
    Top = 130
  end
  object IBAuxiliar: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select'
      '         "con$auxiliar".ID_COMPROBANTE,'
      '         "gen$agencia".DESCRIPCION_AGENCIA,'
      '         "con$tipocomprobante".DESCRIPCION AS TIPO,'
      '         "con$comprobante".FECHADIA,'
      '         "con$comprobante".DESCRIPCION,'
      '         "gen$empleado".PRIMER_APELLIDO,'
      '         "gen$empleado".SEGUNDO_APELLIDO,'
      '         "gen$empleado".NOMBRE,'
      '         "con$auxiliar".CODIGO,'
      '         "con$puc".NOMBRE AS CUENTA,'
      '         "con$auxiliar".ID_CUENTA,'
      '         "con$auxiliar".ID_COLOCACION,'
      '         "con$auxiliar".ID_IDENTIFICACION,'
      '         "con$auxiliar".ID_PERSONA,'
      '         "gen$persona".PRIMER_APELLIDO AS PRIMER_APELLIDO1,'
      '         "gen$persona".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,'
      '         "gen$persona".NOMBRE AS NOMBRE1,'
      '         "con$auxiliar".DEBITO,'
      '         "con$auxiliar".CREDITO'
      '         from'
      '"con$comprobante"'
      
        'LEFT JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = ' +
        '"con$auxiliar".ID_COMPROBANTE)'
      
        'LEFT JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPR' +
        'OBANTE  = "con$tipocomprobante".ID ) '
      
        'LEFT JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$age' +
        'ncia".ID_AGENCIA)'
      
        'LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO' +
        ')'
      
        'LEFT JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "ge' +
        'n$empleado".ID_EMPLEADO) '
      
        'LEFT JOIN "gen$persona" ON ("con$auxiliar".ID_IDENTIFICACION = "' +
        'gen$persona".ID_IDENTIFICACION and "con$auxiliar".ID_PERSONA = "' +
        'gen$persona".ID_PERSONA )'
      'where ("con$comprobante".ID_AGENCIA = :"ID_AGENCIA" ) and'
      
        '           ("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE"' +
        ' )'
      'Order By  "con$auxiliar".CODIGO ASC')
    Left = 128
    Top = 76
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COMPROBANTE'
        ParamType = ptUnknown
      end>
  end
  object ReporteC: TprTxReport
    ShowProgress = True
    FromPage = 1
    ToPage = 1
    Title = 'COMPROBANTE CONTABLE'
    ExportFromPage = 0
    ExportToPage = 0
    Values = <
      item
        Name = 'TotalDebito'
        AggFunction = prafSum
        Formula = 'IBAuxiliar.DEBITO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBAuxiliar'
      end
      item
        Name = 'TotalCredito'
        AggFunction = prafSum
        Formula = 'IBAuxiliar.CREDITO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBAuxiliar'
      end>
    Variables = <
      item
        Name = 'EMPRESA'
        ValueType = 'prvvtString'
        Value = 'COOPSERVIR LTDA'
      end
      item
        Name = 'NIT'
        ValueType = 'prvvtString'
        Value = '890.505.363-6'
      end
      item
        Name = 'ALIAS'
        ValueType = 'prvvtString'
        Value = 'ALEXANDER CRUZ'
      end
      item
        Name = 'vNOMBREVALIDAR'
        ValueType = 'prvvtString'
        Value = ''
      end>
    PrinterName = 'Epson FX-1170'
    OnInitDetailBandDataSet = ReporteCInitDetailBandDataSet
    OnPrintComplete = ReporteCPrintComplete
    ESCModelName = 'Epson printers'
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 1
    ToLine = 1
    ExportFromLine = 0
    ExportToLine = 0
    Left = 86
    Top = 346
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 2'
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
      ColNum = 140
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 7
        UseVerticalBands = False
        DetailBand = ReporteC.Detalle
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = True
        LinkToDetail = True
        object prTxMemoObj52: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CODIGO')
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
          dRec.Top = 5
          dRec.Right = 17
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj53: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CUENTA CONTABLE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 5
          dRec.Right = 65
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj54: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DEBITO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 95
          dRec.Top = 5
          dRec.Right = 113
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj55: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CREDITO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 114
          dRec.Top = 5
          dRec.Right = 132
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj62: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---')
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
          dRec.Top = 6
          dRec.Right = 132
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[EMPRESA]')
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
          dRec.Right = 17
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NIT:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 0
          dRec.Right = 23
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[NIT]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 24
          dRec.Top = 0
          dRec.Right = 42
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Comprobante No.:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 43
          dRec.Top = 0
          dRec.Right = 59
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<000000>IBAuxiliar.ID_COMPROBANTE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 0
          dRec.Right = 66
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA:')
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
          dRec.Right = 7
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>IBAuxiliar.FECHADIA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 8
          dRec.Top = 1
          dRec.Right = 18
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.CODIGO]')
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
          dRec.Top = 7
          dRec.Right = 17
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 7
          dRec.Right = 48
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AGENCIA:[IBAuxiliar.DESCRIPCION_AGENCIA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 19
          dRec.Top = 1
          dRec.Right = 43
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No. Cta/Credito')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 66
          dRec.Top = 5
          dRec.Right = 81
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 65
          dRec.Top = 5
          dRec.Right = 66
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 17
          dRec.Top = 5
          dRec.Right = 18
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Ident.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 82
          dRec.Top = 5
          dRec.Right = 94
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 94
          dRec.Top = 5
          dRec.Right = 95
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 5
          dRec.Right = 114
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 81
          dRec.Top = 5
          dRec.Right = 82
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 17
          dRec.Top = 5
          dRec.Right = 18
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---')
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
          dRec.Top = 4
          dRec.Right = 132
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tipo de Comprobante:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 67
          dRec.Top = 0
          dRec.Right = 87
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj34: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.TIPO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 87
          dRec.Top = 0
          dRec.Right = 132
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Descripci'#243'n:[IBAuxiliar.DESCRIPCION]'
                '')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = True
              CanResizeY = True
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = True
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 132
          dRec.Bottom = 4
          dRec.WidthAsVerticalBand = True
          dRec.HeightAsHorizontalBand = True
          Visible = False
        end
      end
      object Detalle: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBAuxiliar'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        PrintWithChildDetail = ReporteC.SubDetalle
        Bands = (
          'prTxHDetailHeaderBand1'
          'prTxHDetailFooterBand1'
          'SubDetalle')
        object prTxMemoObj65: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 94
          dRec.Top = 0
          dRec.Right = 95
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj66: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 0
          dRec.Right = 114
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj69: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 17
          dRec.Top = 0
          dRec.Right = 18
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBAuxiliar.CREDITO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 114
          dRec.Top = 0
          dRec.Right = 132
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBAuxiliar.DEBITO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 95
          dRec.Top = 0
          dRec.Right = 113
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 0
          dRec.Right = 65
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.CODIGO]')
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
          dRec.Right = 17
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 65
          dRec.Top = 0
          dRec.Right = 66
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[iif(IBAuxiliar.IsNullField("ID_CUENTA"),IBAuxiliar.ID_COLOCACIO' +
                  'N,IBAuxiliar.ID_CUENTA)]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 66
          dRec.Top = 0
          dRec.Right = 81
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 81
          dRec.Top = 0
          dRec.Right = 82
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.ID_PERSONA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 82
          dRec.Top = 0
          dRec.Right = 94
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand1: TprTxHDetailFooterBand
        Height = 4
        UseVerticalBands = False
        DetailBand = ReporteC.Detalle
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = True
        object prTxMemoObj60: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---')
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
          dRec.Right = 132
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj61: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SUMAS IGUALES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 74
          dRec.Top = 1
          dRec.Right = 94
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj63: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>TotalDebito]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 95
          dRec.Top = 1
          dRec.Right = 113
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj64: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>TotalCredito]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 114
          dRec.Top = 1
          dRec.Right = 132
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj70: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---')
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
          dRec.Top = 2
          dRec.Right = 132
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                ':')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 94
          dRec.Top = 1
          dRec.Right = 95
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'ELABORO:[IBAuxiliar.PRIMER_APELLIDO+" "+IBAuxiliar.SEGUNDO_APELL' +
                  'IDO+" "+IBAuxiliar.NOMBRE]')
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
          dRec.Top = 3
          dRec.Right = 74
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha de Impresi'#243'n :')
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
          dRec.Right = 21
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>StartDateTime]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 1
          dRec.Right = 31
          dRec.Bottom = 2
          Visible = False
        end
      end
      object SubDetalle: TprTxHDetailBand
        VisibleFormula = 'IBAuxiliar.ID_PERSONA <> ""'
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBAuxiliar1'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        ParentDetail = ReporteC.Detalle
        object prTxMemoObj35: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[Trim(IBAuxiliar1.PRIMER_APELLIDO+" "+IBAuxiliar1.SEGUNDO_APELLI' +
                  'DO+" "+IBAuxiliar1.NOMBRE)]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 0
          dRec.Right = 81
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj36: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 81
          dRec.Top = 0
          dRec.Right = 82
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj37: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 94
          dRec.Top = 0
          dRec.Right = 95
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj38: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 0
          dRec.Right = 114
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj39: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 17
          dRec.Top = 0
          dRec.Right = 18
          dRec.Bottom = 1
          Visible = False
        end
      end
    end
  end
  object IBSQL3: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 16
    Top = 136
  end
  object IBAuxiliar1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select "gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APEL' +
        'LIDO,"gen$persona".NOMBRE from "gen$persona" where ID_IDENTIFICA' +
        'CION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA')
    Left = 168
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end>
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 208
    Top = 144
  end
  object prReport1: TprReport
    FromPage = 1
    ToPage = 1
    Values = <
      item
        Name = 'TotalDebito'
        AggFunction = prafSum
        Formula = 'IBAuxiliar.DEBITO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBAuxiliar'
        Accumulate = True
      end
      item
        Name = 'TotalCredito'
        AggFunction = prafSum
        Formula = 'IBAuxiliar.CREDITO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBAuxiliar'
      end>
    Variables = <
      item
        Name = 'EMPRESA'
        ValueType = 'prvvtString'
        Value = 'CREDISERVIR LTDA'
      end
      item
        Name = 'NIT'
        ValueType = 'prvvtString'
        Value = '890.505.363-6'
      end
      item
        Name = 'FechaHoy'
        ValueType = 'prvvtDateTime'
        Value = 38455d
      end>
    PrinterName = 'Virtual printer'
    PreviewParams.Options = []
    PreviewParams.ShowToolbars = [prptPreviewCommon]
    Left = 88
    Top = 318
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 2'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 1'
      'ProcessorType: 586'
      ''
      'Compiler version: Delphi6'
      'PReport version: 1.9.4')
    LOGPIXELSX = 96
    LOGPIXELSY = 96
    object prPage1: TprPage
      Width = 2159
      Height = 2794
      PaperSize = 1
      Orientation = poPortrait
      lMargin = 10
      rMargin = 10
      tMargin = 10
      bMargin = 10
      PageScaleInfo.PaperSize = -1
      PageScaleInfo.PageWidth = 2159
      PageScaleInfo.PageHeight = 1397
      object prHDetailHeaderBand1: TprHDetailHeaderBand
        Height = 94
        UseVerticalBands = False
        DetailBand = prReport1.prHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prMemoObj1: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[EMPRESA]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 2
          dRec.Top = 2
          dRec.Right = 139
          dRec.Bottom = 17
          Visible = False
        end
        object prMemoObj2: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NIT:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 142
          dRec.Top = 2
          dRec.Right = 171
          dRec.Bottom = 17
          Visible = False
        end
        object prMemoObj3: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[NIT]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 174
          dRec.Top = 2
          dRec.Right = 283
          dRec.Bottom = 17
          Visible = False
        end
        object prMemoObj4: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Comprobante No.:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 286
          dRec.Top = 2
          dRec.Right = 379
          dRec.Bottom = 17
          Visible = False
        end
        object prMemoObj5: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<000000>IBAuxiliar.ID_COMPROBANTE]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 384
          dRec.Top = 2
          dRec.Right = 451
          dRec.Bottom = 17
          Visible = False
        end
        object prMemoObj6: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tipo de Comprobante:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 456
          dRec.Top = 0
          dRec.Right = 567
          dRec.Bottom = 15
          Visible = False
        end
        object prMemoObj7: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.TIPO]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 568
          dRec.Top = 0
          dRec.Right = 723
          dRec.Bottom = 15
          Visible = False
        end
        object prMemoObj8: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 2
          dRec.Top = 14
          dRec.Right = 55
          dRec.Bottom = 29
          Visible = False
        end
        object prMemoObj9: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>IBAuxiliar.FECHADIA]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 56
          dRec.Top = 14
          dRec.Right = 157
          dRec.Bottom = 29
          Visible = False
        end
        object prMemoObj10: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AGENCIA:[IBAuxiliar.DESCRIPCION_AGENCIA]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 160
          dRec.Top = 16
          dRec.Right = 723
          dRec.Bottom = 29
          Visible = False
        end
        object prMemoObj11: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Descripci'#243'n:[IBAuxiliar.DESCRIPCION]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 2
          dRec.Top = 32
          dRec.Right = 723
          dRec.Bottom = 71
          Visible = False
        end
        object prMemoObj12: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CODIGO')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 4
          dRec.Top = 72
          dRec.Right = 99
          dRec.Bottom = 91
          Visible = False
        end
        object prMemoObj13: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CUENTA CONTABLE')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 108
          dRec.Top = 72
          dRec.Right = 355
          dRec.Bottom = 91
          Visible = False
        end
        object prMemoObj14: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No. Cta/Cr'#233'dito')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 362
          dRec.Top = 72
          dRec.Right = 441
          dRec.Bottom = 91
          Visible = False
        end
        object prMemoObj15: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Ident.')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 444
          dRec.Top = 72
          dRec.Right = 519
          dRec.Bottom = 91
          Visible = False
        end
        object prMemoObj16: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DEBITO')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 528
          dRec.Top = 72
          dRec.Right = 629
          dRec.Bottom = 91
          Visible = False
        end
        object prMemoObj17: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CREDITO')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 630
          dRec.Top = 72
          dRec.Right = 731
          dRec.Bottom = 91
          Visible = False
        end
      end
      object prHDetailFooterBand1: TprHDetailFooterBand
        Height = 52
        UseVerticalBands = False
        DetailBand = prReport1.prHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = True
        object prMemoObj25: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'ELABORO:[IBAuxiliar.PRIMER_APELLIDO+" "+IBAuxiliar.SEGUNDO_APELL' +
                  'IDO+" "+IBAuxiliar.NOMBRE]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 4
          dRec.Top = 26
          dRec.Right = 509
          dRec.Bottom = 43
          Visible = False
        end
        object prMemoObj26: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha de Impresi'#243'n :')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 4
          dRec.Top = 10
          dRec.Right = 105
          dRec.Bottom = 27
          Visible = False
        end
        object prShapeObj1: TprShapeObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 4
          dRec.Top = -4
          dRec.Right = 731
          dRec.Bottom = 15
          Visible = False
        end
        object prMemoObj28: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>TotalDebito]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 532
          dRec.Top = 8
          dRec.Right = 629
          dRec.Bottom = 23
          Visible = False
        end
        object prMemoObj29: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>TotalCredito]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 633
          dRec.Top = 8
          dRec.Right = 730
          dRec.Bottom = 23
          Visible = False
        end
        object prMemoObj30: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SUMAS IGUALES:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 427
          dRec.Top = 9
          dRec.Right = 528
          dRec.Bottom = 26
          Visible = False
        end
        object prMemoObj27: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>FechaHoy]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 109
          dRec.Top = 11
          dRec.Right = 224
          dRec.Bottom = 26
          Visible = False
        end
      end
      object prHDetailBand1: TprHDetailBand
        Height = 16
        UseVerticalBands = False
        DataSetName = 'IBAuxiliar'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prHDetailHeaderBand1'
          'prHDetailBand2'
          'prHDetailFooterBand1')
        object prMemoObj18: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.CODIGO]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 4
          dRec.Top = 2
          dRec.Right = 97
          dRec.Bottom = 17
          Visible = False
        end
        object prMemoObj19: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.CUENTA]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 106
          dRec.Top = 2
          dRec.Right = 353
          dRec.Bottom = 17
          Visible = False
        end
        object prMemoObj20: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[iif(IBAuxiliar.IsNullField("ID_CUENTA"),IBAuxiliar.ID_COLOCACIO' +
                  'N,IBAuxiliar.ID_CUENTA)]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 362
          dRec.Top = 2
          dRec.Right = 441
          dRec.Bottom = 17
          Visible = False
        end
        object prMemoObj21: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.ID_PERSONA]'
                '')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 447
          dRec.Top = 1
          dRec.Right = 522
          dRec.Bottom = 16
          Visible = False
        end
        object prMemoObj22: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBAuxiliar.DEBITO]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 528
          dRec.Top = 0
          dRec.Right = 625
          dRec.Bottom = 15
          Visible = False
        end
        object prMemoObj23: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBAuxiliar.CREDITO]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 632
          dRec.Top = 0
          dRec.Right = 729
          dRec.Bottom = 15
          Visible = False
        end
        object prShapeObj2: TprShapeObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Style = prssCenterVertLine
            end>
          dRec.Left = 98
          dRec.Top = 2
          dRec.Right = 105
          dRec.Bottom = 15
          Visible = False
        end
        object prShapeObj3: TprShapeObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Style = prssCenterVertLine
            end>
          dRec.Left = 355
          dRec.Top = 2
          dRec.Right = 362
          dRec.Bottom = 15
          Visible = False
        end
        object prShapeObj4: TprShapeObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Style = prssCenterVertLine
            end>
          dRec.Left = 440
          dRec.Top = 2
          dRec.Right = 447
          dRec.Bottom = 15
          Visible = False
        end
        object prShapeObj5: TprShapeObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Style = prssCenterVertLine
            end>
          dRec.Left = 521
          dRec.Top = 2
          dRec.Right = 528
          dRec.Bottom = 15
          Visible = False
        end
        object prShapeObj6: TprShapeObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Style = prssCenterVertLine
            end>
          dRec.Left = 626
          dRec.Top = 2
          dRec.Right = 633
          dRec.Bottom = 15
          Visible = False
        end
      end
      object prHDetailBand2: TprHDetailBand
        Height = 16
        UseVerticalBands = False
        DataSetName = 'IBAuxiliar1'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        ParentDetail = prReport1.prHDetailBand1
        object prMemoObj24: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[Trim(IBAuxiliar1.PRIMER_APELLIDO+" "+IBAuxiliar1.SEGUNDO_APELLI' +
                  'DO+" "+IBAuxiliar1.NOMBRE)]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 108
          dRec.Top = 4
          dRec.Right = 523
          dRec.Bottom = 19
          Visible = False
        end
      end
    end
  end
  object DSAgencia: TDataSource
    DataSet = IBAgencia
    Left = 304
    Top = 48
  end
  object IBAgencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$agencia"')
    Left = 344
    Top = 48
  end
end
