object frmInformeDesembolsosxempleado: TfrmInformeDesembolsosxempleado
  Left = 272
  Top = 206
  Width = 270
  Height = 230
  Caption = 'Informe Desembolsos por Empleado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 2
    Width = 261
    Height = 161
    TabOrder = 0
    object Label1: TLabel
      Left = -94
      Top = -8
      Width = 123
      Height = 13
      Caption = 'Digite el Login del Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label4: TLabel
      Left = 39
      Top = 9
      Width = 60
      Height = 13
      Caption = 'Fecha Inicial'
    end
    object Label3: TLabel
      Left = 153
      Top = 9
      Width = 55
      Height = 13
      Caption = 'Fecha Final'
    end
    object Label2: TLabel
      Left = 29
      Top = 106
      Width = 114
      Height = 13
      Caption = 'Seleccione el Empleado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdEmpleado: TEdit
      Left = -95
      Top = -10
      Width = 197
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      Visible = False
      OnEnter = EdEmpleadoEnter
      OnExit = EdEmpleadoExit
    end
    object GroupBox5: TGroupBox
      Left = 30
      Top = 53
      Width = 201
      Height = 38
      Caption = 'Filtrar por Usuario'
      TabOrder = 3
      TabStop = True
      OnExit = GroupBox5Exit
      object Todos: TRadioButton
        Left = 8
        Top = 15
        Width = 81
        Height = 18
        Caption = 'Todos'
        TabOrder = 0
        OnClick = TodosClick
      end
      object Definido: TRadioButton
        Left = 112
        Top = 17
        Width = 65
        Height = 13
        Caption = 'Definido'
        TabOrder = 1
        OnClick = DefinidoClick
      end
    end
    object EdFechaInicial: TDateTimePicker
      Left = 34
      Top = 23
      Width = 82
      Height = 21
      CalAlignment = dtaLeft
      Date = 37792.4540174653
      Format = 'yyyy/MM/dd'
      Time = 37792.4540174653
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnExit = EdFechaInicialExit
    end
    object EdFechaFinal: TDateTimePicker
      Left = 141
      Top = 23
      Width = 82
      Height = 21
      CalAlignment = dtaLeft
      Date = 37792.4540174653
      Format = 'yyyy/MM/dd'
      Time = 37792.4540174653
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnExit = EdFechaFinalExit
    end
    object TipoInforme: TRadioGroup
      Left = -122
      Top = -19
      Width = 185
      Height = 31
      Hint = 'Seleccione el tipo de informe'
      Caption = 'Tipo de Informe'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Borrador'
        'Presentaci'#243'n')
      TabOrder = 4
      Visible = False
    end
    object DBEmpleado: TDBLookupComboBox
      Left = 28
      Top = 120
      Width = 207
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'ID_EMPLEADO'
      ListField = 'EMPLEADO'
      ListSource = DSEmpleado
      ParentFont = False
      TabOrder = 5
      OnExit = DBEmpleadoExit
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 163
    Width = 262
    Height = 33
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object CmdAceptar: TBitBtn
      Left = 88
      Top = 5
      Width = 81
      Height = 25
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = CmdAceptarClick
      OnKeyPress = CmdAceptarKeyPress
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
      Left = 174
      Top = 5
      Width = 81
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = CmdCerrarClick
      OnKeyPress = CmdCerrarKeyPress
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
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'SELECT sum("col$colocacion".VALOR_DESEMBOLSO) as VALOR, count("c' +
        'ol$colocacion".ID_COLOCACION) as TOTAL, "col$colocacion".FECHA_D' +
        'ESEMBOLSO,'
      
        '"col$colocacion".ID_EMPLEADO, "gen$empleado".NOMBRE, "gen$emplea' +
        'do".SEGUNDO_APELLIDO,'
      
        '"gen$empleado".PRIMER_APELLIDO FROM "col$colocacion" INNER JOIN ' +
        '"gen$empleado" ON ("col$colocacion".ID_EMPLEADO="gen$empleado".I' +
        'D_EMPLEADO)'
      
        'WHERE ("col$colocacion".FECHA_DESEMBOLSO BETWEEN :FECHA_INICIAL ' +
        'AND :FECHA_FINAL)'
      
        'GROUP BY "col$colocacion".FECHA_DESEMBOLSO, "col$colocacion".ID_' +
        'EMPLEADO,'
      
        '"gen$empleado".PRIMER_APELLIDO, "gen$empleado".SEGUNDO_APELLIDO,' +
        ' "gen$empleado".NOMBRE')
    Left = 32
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FINAL'
        ParamType = ptUnknown
      end>
    object IBQuery1VALOR: TIBBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object IBQuery1TOTAL: TIntegerField
      FieldName = 'TOTAL'
      ProviderFlags = []
    end
    object IBQuery1FECHA_DESEMBOLSO: TDateField
      FieldName = 'FECHA_DESEMBOLSO'
      ProviderFlags = []
    end
    object IBQuery1ID_EMPLEADO: TIBStringField
      FieldName = 'ID_EMPLEADO'
      ProviderFlags = []
      FixedChar = True
      Size = 15
    end
    object IBQuery1NOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      ProviderFlags = []
      Size = 30
    end
    object IBQuery1SEGUNDO_APELLIDO: TIBStringField
      FieldName = 'SEGUNDO_APELLIDO'
      ProviderFlags = []
      Size = 30
    end
    object IBQuery1PRIMER_APELLIDO: TIBStringField
      FieldName = 'PRIMER_APELLIDO'
      ProviderFlags = []
      Size = 30
    end
  end
  object IBQuery: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Top = 144
  end
  object InformeDiario: TprTxReport
    ShowProgress = True
    Title = 'Informe Diario de Cartera'
    ExportFromPage = 0
    ExportToPage = 0
    Values = <
      item
        Group = InformeDiario.funcionario
        Name = 'TNoxFuncionario'
        AggFunction = prafCount
        Formula = 'IBQuery2.ID_COLOCACION'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuery2'
      end
      item
        Group = InformeDiario.funcionario
        Name = 'TValorxFuncionario'
        AggFunction = prafSum
        Formula = 'IBQuery2.VALOR_DESEMBOLSO'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuery2'
      end
      item
        Name = 'TotalDesembolsos'
        AggFunction = prafCount
        Formula = 'IBQuery2.ID_COLOCACION'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuery2'
      end
      item
        Name = 'ValorDesembolsos'
        AggFunction = prafSum
        Formula = 'IBQuery2.VALOR_DESEMBOLSO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuery2'
      end>
    Variables = <
      item
        Name = 'Empresa'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Hoy'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'empleado'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'usuario'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'FechaInicial'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'FechaFinal'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Nit'
        ValueType = 'prvvtString'
        Value = ''
      end>
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 110
    Top = 424
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 2'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 2'
      'ProcessorType: 586'
      ''
      'Compiler version: Delphi6'
      'PReport version: 1.9.4')
    object prTxPage1: TprTxPage
      PageType = tptPage
      LineNum = 60
      ColNum = 80
      object prTxHPageHeaderBand1: TprTxHPageHeaderBand
        Height = 3
        UseVerticalBands = False
        PrintOnFirstPage = True
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
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 27
          dRec.Bottom = 1
          Visible = False
        end
        object prTxCommandObj1: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcWideOn)
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 1
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha Informe :  [:<yyyy/mm/dd>Hoy]')
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
          dRec.Right = 36
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'INFORME DE DESEMBOLSOS DIARIOS POR EMPLEADO ENTRE [:<yyyy/mm/dd>' +
                  'FechaInicial] y [:<yyyy/mm/dd>FechaFinal]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 80
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj79: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'P'#225'gina [Page] de [PagesCount]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 54
          dRec.Top = 2
          dRec.Right = 80
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Nit. [Nit]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 54
          dRec.Top = 0
          dRec.Right = 78
          dRec.Bottom = 1
          Visible = False
        end
        object prTxCommandObj2: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcWideOff
                txcCondensedOn)
            end>
          dRec.Left = 79
          dRec.Top = 0
          dRec.Right = 80
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Visible = False
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBQuery2'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Groups = (
          'Fecha'
          'funcionario')
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuery2.ID_COLOCACION]')
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
        object prTxMemoObj42: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>IBQuery2.VALOR_DESEMBOLSO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 15
          dRec.Top = 0
          dRec.Right = 35
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHGroupFooterBand1: TprTxHGroupFooterBand
        Height = 1
        UseVerticalBands = False
        Group = InformeDiario.funcionario
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>TValorxFuncionario]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 53
          dRec.Top = 0
          dRec.Right = 73
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[TNoxFuncionario]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 0
          dRec.Right = 52
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuery2.NOMBRE_EMPLEADO]')
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
          dRec.Right = 38
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHGroupHeaderBand2: TprTxHGroupHeaderBand
        Height = 3
        UseVerticalBands = False
        Group = InformeDiario.Fecha
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        StartNewPage = False
        ReprintOnEachPage = False
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuery2.FECHA_DESEMBOLSO]')
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
          dRec.Right = 51
          dRec.Bottom = 2
          Visible = False
        end
        object prTxHLineObj3: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 80
          dRec.Bottom = 3
          Visible = False
        end
        object prTxHLineObj4: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 80
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHSummaryBand1: TprTxHSummaryBand
        Height = 4
        UseVerticalBands = False
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------')
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
          dRec.Right = 80
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTAL :')
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
          dRec.Right = 8
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[TotalDesembolsos]')
              DeleteEmptyLinesAtEnd = True
              DeleteEmptyLines = True
              CanResizeX = True
              CanResizeY = True
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = True
            end>
          dRec.Left = 39
          dRec.Top = 1
          dRec.Right = 52
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>ValorDesembolsos]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 53
          dRec.Top = 1
          dRec.Right = 73
          dRec.Bottom = 2
          Visible = False
        end
        object prTxHLineObj2: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 80
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Elabor'#243' :  [empleado]')
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
          dRec.Right = 45
          dRec.Bottom = 4
          Visible = False
        end
      end
      object prTxHGroupFooterBand2: TprTxHGroupFooterBand
        Visible = False
        Height = 1
        UseVerticalBands = False
        Group = InformeDiario.Fecha
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
      end
      object prTxHGroupHeaderBand3: TprTxHGroupHeaderBand
        Visible = False
        Height = 1
        UseVerticalBands = False
        Group = InformeDiario.funcionario
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        StartNewPage = False
        ReprintOnEachPage = False
      end
    end
    object Fecha: TprGroup
      Valid = 'IBQuery2.FECHA_DESEMBOLSO'
      DetailBand = InformeDiario.prTxHDetailBand1
    end
    object funcionario: TprGroup
      Valid = 'IBQuery2.ID_EMPLEADO'
      DetailBand = InformeDiario.prTxHDetailBand1
    end
  end
  object Reporte: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = ReporteGetValue
    Left = 184
    ReportForm = {
      19000000C50C0000190000FFFF01000100FFFFFFFFFF010000006F080000EA0A
      00002400000048000000240000002400000000FFFF00000000FFFF0000000000
      000000000500506167653100030400466F726D000F000080DC00000078000000
      7C0100002C010000040000000200CF0000000B00506167654865616465723100
      020100000000110000000B030000560000003000020001000000000000000000
      FFFFFF1F00000000000000000000000000FFFF00000000000200000001000000
      0000000001000000C800000014000000010000000000000200580100000C0047
      726F75704865616465723100020100000000730000000B030000120000003000
      100001000000000000000000FFFFFF1F000000001D005B49425175657279312E
      2246454348415F444553454D424F4C534F225D00000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200CF0100000B004D61737465724461746131000201000000009D0000000B03
      0000120000003000050001000000000000000000FFFFFF1F000000000C006672
      4442446174615365743100000000000000FFFF00000000000200000001000000
      0000000001000000C8000000140000000100000000000002003C0200000D004D
      6173746572466F6F7465723100020100000000EB0000000B0300001400000030
      00060001000000000000000000FFFFFF1F00000000000000000000000000FFFF
      000000000002000000010000000000000001000000C800000014000000010000
      000000000200A80200000C0047726F7570466F6F7465723100020100000000C6
      0000000B030000140000003000110001000000000000000000FFFFFF1F000000
      00000000000000000000FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200160300000E005265706F72745375
      6D6D6172793100020100000000070100000B0300001400000030000100010000
      00000000000000F9F9F90000000000000000000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000000
      9D03000005004D656D6F310002002500000014000000C1020000140000000300
      000001000000000000000000FFFFFF1F2E020000000000010009005B456D7072
      6573615D00000000FFFF00000000000200000001000000000500417269616C00
      0A000000020000000000020000000100020000000000FFFFFF00000000020000
      000000000000002404000005004D656D6F320002002500000027000000C10200
      00140000000300000001000000000000000000FFFFFF1F2E0200000000000100
      09004E6974205B4E69745D00000000FFFF000000000002000000010000000005
      00417269616C000A000000020000000000020000000100020000000000FFFFFF
      0000000002000000000000000000FB04000005004D656D6F3300020025000000
      3D000000C1020000140000000300000001000000000000000000FFFFFF1F2C00
      04020A00797979792F4D4D2F64640001004F00494E464F524D45204445204445
      53454D424F4C534F532044494152494F5320504F5220454D504C4541444F2045
      4E545245205B4665636861496E696369616C5D2079205B466563686146696E61
      6C5D00000000FFFF00000000000200000001000000000500417269616C000A00
      0000000000000000020000000100020000000000FFFFFF000000000200000000
      00000000009805000005004D656D6F3400020027000000530000008601000014
      0000000300000001000000000000000000FFFFFF1F2E02000000000001001F00
      466563686120496E666F726D65203A205B444154455D202D205B54494D455D00
      000000FFFF00000000000200000001000000000500417269616C000A00000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00003406000005004D656D6F35000200EA01000053000000F900000014000000
      0300000001000000000000000000FFFFFF1F2E02000000000001001E00506167
      696E61205B50414745235D206465205B544F54414C50414745535D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      00010000000100020000000000FFFFFF0000000002000000000000000000CF06
      000005004D656D6F360002002100000074000000C40200000F00000003000000
      01000000000000000000F9F9F9002E02000000000001001D005B494251756572
      79312E2246454348415F444553454D424F4C534F225D00000000FFFF00000000
      000200000001000000000500417269616C000900000000000000000002000000
      0100020000000000FFFFFF00000000020000000000000000009B07000005004D
      656D6F37000200270000009E000000760100000F000000030000000100000000
      0000000000FFFFFF1F2E02000000000001004E005B49425175657279312E224E
      4F4D425245225D205B49425175657279312E225052494D45525F4150454C4C49
      444F225D205B49425175657279312E22534547554E444F5F4150454C4C49444F
      225D00000000FFFF00000000000200000001000000000500417269616C000900
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      00000000002B08000005004D656D6F38000200A70100009E000000600000000F
      0000000300000001000000000000000000FFFFFF1F2E02000100000001001200
      5B49425175657279312E22544F54414C225D00000000FFFF0000000000020000
      0001000000000500417269616C00090000000000000000000100000001000200
      00000000FFFFFF0000000002000000000000000000BB08000005004D656D6F39
      000200130200009E000000D00000000F00000003000000010000000000000000
      00FFFFFF1F2E020301000000010012005B49425175657279312E2256414C4F52
      225D00000000FFFF00000000000200000001000000000500417269616C000900
      0000000000000000010000000100020000000000FFFFFF000000000200000000
      00000000005309000006004D656D6F3130000200A8010000ED00000060000000
      100000000300000001000000000000000000FFFFFF1F2E020000000000010019
      005B53554D285B49425175657279312E22544F54414C225D295D00000000FFFF
      00000000000200000001000000000500417269616C0009000000020000000000
      010000000100020000000000FFFFFF0000000002000000000000000000EB0900
      0006004D656D6F313100020014020000ED000000D00000001000000003000000
      01000000000000000000FFFFFF1F2E020301000000010019005B53554D285B49
      425175657279312E2256414C4F52225D295D00000000FFFF0000000000020000
      0001000000000500417269616C00090000000200000000000100000001000200
      00000000FFFFFF0000000002000000000000000000830A000006004D656D6F31
      32000200A8010000C8000000600000000F000000030000000100000000000000
      0000FFFFFF1F2E020000000000010019005B53554D285B49425175657279312E
      22544F54414C225D295D00000000FFFF00000000000200000001000000000500
      417269616C0009000000020000000000010000000100020000000000FFFFFF00
      000000020000000000000000001B0B000006004D656D6F313300020014020000
      C8000000D00000000F0000000300000001000000000000000000FFFFFF1F2E02
      0301000000010019005B53554D285B49425175657279312E2256414C4F52225D
      295D00000000FFFF00000000000200000001000000000500417269616C000900
      0000020000000000010000000100020000000000FFFFFF000000000200000000
      0000000000AE0B000006004D656D6F313400020026000000080100006C010000
      140000000300000001000000000000000000F9F9F9002E020000000000010014
      00456C61626F726F203A205B456D706C6561646F5D00000000FFFF0000000000
      0200000001000000000500417269616C00090000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000340C000006004D65
      6D6F3135000200A8000000C8000000EE00000010000000030000000100000000
      0000000000F9F9F9002E02000000000001000700544F54414C455300000000FF
      FF00000000000200000001000000000500417269616C000A0000000200000000
      00000000000100020000000000FFFFFF000000000200000000000000FEFEFF07
      0000000A00205661726961626C6573000000000700456D707265736100000000
      03004E6974000000000C004665636861496E696369616C000000000A00466563
      686146696E616C000000000300486F79000000000800456D706C6561646F0000
      00000000000000000000FC000000000000000000000000000000004D001CC2A8
      CD4AE2E240B5814E0B373BE340}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = IBQuery1
    Left = 208
  end
  object DSEmpleado: TDataSource
    DataSet = IBEmpleado
    Left = 144
    Top = 160
  end
  object IBEmpleado: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select "gen$empleado".NOMBRE || '#39' '#39' || "gen$empleado".PRIMER_APE' +
        'LLIDO || '#39' '#39' || "gen$empleado".SEGUNDO_APELLIDO as EMPLEADO, "ge' +
        'n$empleado".ID_EMPLEADO from "gen$empleado"')
    Left = 112
    Top = 160
  end
end
