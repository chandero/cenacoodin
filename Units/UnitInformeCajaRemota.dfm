object FrmInformeCajaRemota: TFrmInformeCajaRemota
  Left = 213
  Top = 231
  Width = 291
  Height = 112
  BorderIcons = [biSystemMenu]
  Caption = 'Informe Diario Caja Remota'
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
    Width = 185
    Height = 78
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 38
      Width = 40
      Height = 13
      Caption = 'Fecha '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Caja: TLabel
      Left = 10
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Caja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdFecha: TDateTimePicker
      Left = 52
      Top = 34
      Width = 108
      Height = 21
      CalAlignment = dtaLeft
      Date = 37896.7333220602
      Time = 37896.7333220602
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
      TabOrder = 1
    end
    object EdCaja: TJvIntegerEdit
      Left = 52
      Top = 8
      Width = 25
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = False
      TabOrder = 0
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
  end
  object Panel2: TPanel
    Left = 186
    Top = 0
    Width = 97
    Height = 78
    Align = alRight
    Color = clOlive
    TabOrder = 1
    object CmdGenera: TBitBtn
      Left = 6
      Top = 6
      Width = 85
      Height = 25
      Caption = 'Generar'
      TabOrder = 0
      OnClick = CmdGeneraClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000230F0000230F00000001000000010000393939004218
        21004A2121004A4A4A004A525200525252005A52520052525A007B4A52006363
        63006B6B63006B6B6B007B636B007B7B7B00844A52008C4A5A00845A6B008463
        6B00846B6B008C6B6B008C637300846B73008C6B73009C6B730084737300A56B
        7B00A5737B00A57B7B007B847B008CFF7B00847B8400A57BA500FF00FF008C8C
        8C00948C8C009C8C8C0084948C008C849C008C9494008C9C94008C9C9C009494
        94009C94940094949C00949C9C009C9C9C00B5848400BD8C8C00BD8C9400A5A5
        A500ADADAD00ADB5B500B5B5B500BDBDBD00C68C8C00C68C9400C6A59400BDD6
        BD00FECC9A00FFD6A500E7C6B500C6C6CE00CECECE00D6DEDE00DEDEDE00F7DE
        C600FFEFDE00F7F7F700F7FFFF00FFFFFF000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000202020202020
        2020202020202020202020202020203C3C3C3C3C3C3C2020202020202020013C
        43424141453C0120202020202005013C433B3A3A453C01052020200B0303033C
        43424141433C030301200D030605032D32333434312B03070403051E2C28272C
        29211C24262C25341D01052D353222151211100C13141F0F340109323F16171B
        2F373030361A190F390521343E080E030101010101030E0F3D0521343E010331
        40404040403100023E092031332A183C45454343432E0C23332020202020203C
        4545433838382020202020202020203C4445433845382020202020202020203C
        4343433838202020202020202020203C3C3C3C38202020202020}
    end
    object CmdCerrar: TBitBtn
      Left = 6
      Top = 32
      Width = 85
      Height = 25
      Caption = 'Cerrar'
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
  end
  object CDinforme: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_agencia'
        DataType = ftSmallint
      end
      item
        Name = 'agencia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'id_caja'
        DataType = ftSmallint
      end
      item
        Name = 'fecha_mov'
        DataType = ftDateTime
      end
      item
        Name = 'origen_movimiento'
        DataType = ftSmallint
      end
      item
        Name = 'id_tipo_captacion'
        DataType = ftSmallint
      end
      item
        Name = 'numero_cuenta'
        DataType = ftInteger
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'documento'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_tipo_movimiento'
        DataType = ftSmallint
      end
      item
        Name = 'efectivo_db'
        DataType = ftCurrency
      end
      item
        Name = 'cheque_db'
        DataType = ftCurrency
      end
      item
        Name = 'efectivo_cr'
        DataType = ftCurrency
      end
      item
        Name = 'cheque_cr'
        DataType = ftCurrency
      end
      item
        Name = 'id_agencia_remota'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 136
    Top = 8
    Data = {
      BF0100009619E0BD01000000180000000F000000000003000000BF010A69645F
      6167656E6369610200010000000000076167656E636961010049000000010005
      57494454480200020032000769645F63616A6102000100000000000966656368
      615F6D6F760800080000000000116F726967656E5F6D6F76696D69656E746F02
      000100000000001169645F7469706F5F636170746163696F6E02000100000000
      000D6E756D65726F5F6375656E74610400010000000000066E6F6D6272650200
      49000000010005574944544802000200FF0009646F63756D656E746F01004900
      00000100055749445448020002000F001269645F7469706F5F6D6F76696D6965
      6E746F02000100000000000B656665637469766F5F6462080004000000010007
      535542545950450200490006004D6F6E657900096368657175655F6462080004
      000000010007535542545950450200490006004D6F6E6579000B656665637469
      766F5F6372080004000000010007535542545950450200490006004D6F6E6579
      00096368657175655F6372080004000000010007535542545950450200490006
      004D6F6E6579001169645F6167656E6369615F72656D6F746102000100000000
      000000}
    object CDinformeid_agencia: TSmallintField
      FieldName = 'id_agencia'
    end
    object CDinformeagencia: TStringField
      FieldName = 'agencia'
      Size = 50
    end
    object CDinformeid_caja: TSmallintField
      FieldName = 'id_caja'
    end
    object CDinformefecha_mov: TDateTimeField
      FieldName = 'fecha_mov'
    end
    object CDinformeorigen_movimiento: TSmallintField
      FieldName = 'origen_movimiento'
    end
    object CDinformeid_tipo_captacion: TSmallintField
      FieldName = 'id_tipo_captacion'
    end
    object CDinformenumero_cuenta: TIntegerField
      FieldName = 'numero_cuenta'
    end
    object CDinformenombre: TStringField
      FieldName = 'nombre'
      Size = 255
    end
    object CDinformedocumento: TStringField
      FieldName = 'documento'
      Size = 15
    end
    object CDinformeid_tipo_movimiento: TSmallintField
      FieldName = 'id_tipo_movimiento'
    end
    object CDinformeefectivo_db: TCurrencyField
      FieldName = 'efectivo_db'
    end
    object CDinformecheque_db: TCurrencyField
      FieldName = 'cheque_db'
    end
    object CDinformeefectivo_cr: TCurrencyField
      FieldName = 'efectivo_cr'
    end
    object CDinformecheque_cr: TCurrencyField
      FieldName = 'cheque_cr'
    end
    object CDinformeid_agencia_remota: TSmallintField
      FieldName = 'id_agencia_remota'
    end
    object CDinformesumefectivo_db: TAggregateField
      FieldName = 'sumefectivo_db'
      Active = True
      Expression = 'sum(efectivo_db)'
    end
    object CDinformesumefectivo_cr: TAggregateField
      FieldName = 'sumefectivo_cr'
      Active = True
      Expression = 'sum(efectivo_cr)'
    end
    object CDinformesumcheque_db: TAggregateField
      FieldName = 'sumcheque_db'
      Active = True
      Expression = 'sum(cheque_db)'
    end
    object CDinformesumcheque_cr: TAggregateField
      FieldName = 'sumcheque_cr'
      Active = True
      Expression = 'sum(cheque_cr)'
    end
    object CDinformecontador: TAggregateField
      FieldName = 'contador'
      Active = True
      Expression = 'count(origen_movimiento)'
    end
  end
  object IBQuery: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 52
    Top = 58
  end
  object Report: TprTxReport
    ExportFromPage = 0
    ExportToPage = 0
    Values = <
      item
        Name = 'TEfectivoDB'
        AggFunction = prafSum
        Formula = 'CDinforme.efectivo_db'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'CDinforme'
      end
      item
        Name = 'TChequesDB'
        AggFunction = prafSum
        Formula = 'CDinforme.cheque_db'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'CDinforme'
      end
      item
        Name = 'TEfectivoCR'
        AggFunction = prafSum
        Formula = 'CDinforme.efectivo_cr'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'CDinforme'
      end
      item
        Name = 'TChequesCR'
        AggFunction = prafSum
        Formula = 'CDinforme.cheque_cr'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'CDinforme'
      end
      item
        Group = Report.prGroup1
        Name = 'sumefectivo_db'
        AggFunction = prafSum
        Formula = 'CDinforme.efectivo_db'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'CDinforme'
      end
      item
        Group = Report.prGroup1
        Name = 'sumefectivo_cr'
        AggFunction = prafSum
        Formula = 'CDinforme.efectivo_cr'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'CDinforme'
      end
      item
        Group = Report.prGroup1
        Name = 'sumcheque_db'
        AggFunction = prafSum
        Formula = 'CDinforme.cheque_db'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'CDinforme'
      end
      item
        Group = Report.prGroup1
        Name = 'sumcheque_cr'
        AggFunction = prafSum
        Formula = 'CDinforme.cheque_cr'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'CDinforme'
      end>
    Variables = <
      item
        Name = 'Empresa'
        ValueType = 'prvvtString'
        Value = 'COOPSERVIR LTDA'
      end
      item
        Name = 'Caja'
        ValueType = 'prvvtInteger'
        Value = 9
      end
      item
        Name = 'Agencia'
        ValueType = 'prvvtString'
        Value = 'OCA'#209'A'
      end
      item
        Name = 'Empleado'
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
    Left = 18
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
        Height = 2
        UseVerticalBands = False
        PrintOnFirstPage = False
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
                tfoCondensed)
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 21
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'INFORME DE MOVIMIENTOS DEL DIA [:<yyyy/MM/dd>CDinforme.fecha_mov' +
                  '] - CAJA [:<000>CAJA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 38
          dRec.Top = 0
          dRec.Right = 91
          dRec.Bottom = 1
          Visible = False
        end
        object prTxCommandObj1: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcCondensedOn)
            end>
          dRec.Left = 21
          dRec.Top = 0
          dRec.Right = 22
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'IMPRESO EL:[:<yyyy/MM/dd>StartDateTime]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 92
          dRec.Top = 0
          dRec.Right = 113
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Pag:[Page] de [PagesCount]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 118
          dRec.Top = 0
          dRec.Right = 130
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj65: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AG:[AGENCIA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 22
          dRec.Top = 0
          dRec.Right = 37
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj68: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'RESPONSABLE:[Empleado]')
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
          dRec.Right = 108
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'CDinforme'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Groups = (
          'prGroup1')
        Bands = (
          'prTxHDetailHeaderBand1')
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDinforme.origen_movimiento]')
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
          dRec.Right = 3
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[CDinforme.id_tipo_captacion][:<00>CDinforme.id_agencia]-[:<0000' +
                  '000>CDinforme.numero_cuenta]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 3
          dRec.Top = 0
          dRec.Right = 15
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDinforme.nombre]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 16
          dRec.Top = 0
          dRec.Right = 52
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDinforme.documento]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 53
          dRec.Top = 0
          dRec.Right = 61
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Formula = 'IBQuery1.ID_TIPO_MOVIMIENTO = 1'
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>CDinforme.efectivo_db]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 62
          dRec.Top = 0
          dRec.Right = 78
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Formula = 'IBQuery1.ID_TIPO_MOVIMIENTO = 1'
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>CDinforme.cheque_db]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 79
          dRec.Top = 0
          dRec.Right = 95
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Formula = 'IBQuery1.ID_TIPO_MOVIMIENTO = 2'
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>CDinforme.efectivo_cr]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 0
          dRec.Right = 112
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Formula = 'IBQuery1.ID_TIPO_MOVIMIENTO = 2'
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>CDinforme.cheque_cr]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 0
          dRec.Right = 129
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 4
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = True
        LinkToDetail = True
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '-+')
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
          dRec.Right = 130
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '-+')
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
          dRec.Top = 3
          dRec.Right = 130
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
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
          dRec.Left = 0
          dRec.Top = 2
          dRec.Right = 1
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
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
          dRec.Left = 129
          dRec.Top = 2
          dRec.Right = 130
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'O')
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
          dRec.Right = 2
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CUENTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 3
          dRec.Top = 2
          dRec.Right = 15
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
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
          dRec.Left = 16
          dRec.Top = 2
          dRec.Right = 52
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
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
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 53
          dRec.Top = 2
          dRec.Right = 61
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'EFECTIVO DB')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 62
          dRec.Top = 2
          dRec.Right = 78
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CHEQUE DB')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 79
          dRec.Top = 2
          dRec.Right = 95
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'EFECTIVO CR')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 2
          dRec.Right = 112
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CHEQUE CR')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 2
          dRec.Right = 129
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'MOVIMIENTO CAPTACIONES')
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
          dRec.Right = 35
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailHeaderBand3: TprTxHDetailHeaderBand
        Height = 2
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand3
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'RESUMEN GENERAL DE OPERACIONES DE LAS AGENCIAS')
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
          dRec.Right = 56
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'ORIGEN')
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
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'OPERACIONES')
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
          dRec.Right = 19
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailBand3: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'CDorigen'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand3'
          'prTxHDetailFooterBand3')
        object prTxMemoObj34: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDorigen.origen_movimiento]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 0
          dRec.Right = 5
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj35: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<0000>CDorigen.contador]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 8
          dRec.Top = 0
          dRec.Right = 19
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj36: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Formula = 'IBQuery1.ID_TIPO_MOVIMIENTO = 1'
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>CDorigen.efectivo_db]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 62
          dRec.Top = 0
          dRec.Right = 78
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj37: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Formula = 'IBQuery1.ID_TIPO_MOVIMIENTO = 1'
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>CDorigen.cheque_db]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 79
          dRec.Top = 0
          dRec.Right = 95
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj38: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Formula = 'IBQuery1.ID_TIPO_MOVIMIENTO = 2'
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>CDorigen.efectivo_cr]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 0
          dRec.Right = 112
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj39: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Formula = 'IBQuery1.ID_TIPO_MOVIMIENTO = 2'
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>CDorigen.cheque_cr]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 0
          dRec.Right = 129
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand3: TprTxHDetailFooterBand
        Height = 2
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand3
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj59: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>TEfectivoDB]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 62
          dRec.Top = 1
          dRec.Right = 78
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj60: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '-+')
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
          dRec.Right = 130
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj61: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTALES')
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
          dRec.Right = 18
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj62: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>TChequesDB]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 79
          dRec.Top = 1
          dRec.Right = 95
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj63: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>TEfectivoCR]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 1
          dRec.Right = 112
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj64: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>TChequesCR]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 1
          dRec.Right = 129
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHGroupHeaderBand1: TprTxHGroupHeaderBand
        Height = 2
        UseVerticalBands = False
        Group = Report.prGroup1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = True
        StartNewPage = True
        ReprintOnEachPage = False
        object prTxMemoObj69: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'MOVIMIENTOS REALIZADOS EN LA AGENCIA : [CDinforme.agencia]')
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
          dRec.Right = 51
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHSummaryBand1: TprTxHSummaryBand
        Height = 7
        UseVerticalBands = False
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FIRMA EMPLEADO RESPONSABLE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 5
          dRec.Top = 6
          dRec.Right = 35
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '-----------------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 3
          dRec.Top = 5
          dRec.Right = 37
          dRec.Bottom = 6
          Visible = False
        end
      end
      object prTxHGroupFooterBand1: TprTxHGroupFooterBand
        Height = 7
        UseVerticalBands = False
        Group = Report.prGroup1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTALES AGENCIA [CDinforme.agencia]')
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
          dRec.Right = 40
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '-+')
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
          dRec.Right = 130
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '-+')
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
          dRec.Right = 130
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj40: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>sumefectivo_db]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 62
          dRec.Top = 1
          dRec.Right = 78
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj41: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>sumcheque_db]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 79
          dRec.Top = 1
          dRec.Right = 95
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj42: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>sumefectivo_cr]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 1
          dRec.Right = 112
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj43: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>sumcheque_cr]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 1
          dRec.Right = 129
          dRec.Bottom = 2
          Visible = False
        end
      end
    end
    object prGroup1: TprGroup
      Valid = 'CDinforme.id_agencia_remota'
      DetailBand = Report.prTxHDetailBand1
    end
  end
  object CDorigen: TClientDataSet
    Active = True
    Aggregates = <
      item
        Visible = False
      end>
    FieldDefs = <
      item
        Name = 'origen_movimiento'
        DataType = ftSmallint
      end
      item
        Name = 'cheque_db'
        DataType = ftCurrency
      end
      item
        Name = 'cheque_cr'
        DataType = ftCurrency
      end
      item
        Name = 'efectivo_db'
        DataType = ftCurrency
      end
      item
        Name = 'efectivo_cr'
        DataType = ftCurrency
      end
      item
        Name = 'contador'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 8
    Data = {
      E10000009619E0BD010000001800000006000000000003000000E100116F7269
      67656E5F6D6F76696D69656E746F0200010000000000096368657175655F6462
      080004000000010007535542545950450200490006004D6F6E65790009636865
      7175655F6372080004000000010007535542545950450200490006004D6F6E65
      79000B656665637469766F5F6462080004000000010007535542545950450200
      490006004D6F6E6579000B656665637469766F5F637208000400000001000753
      5542545950450200490006004D6F6E65790008636F6E7461646F720400010000
      0000000000}
    object CDorigenorigen_movimiento: TSmallintField
      FieldName = 'origen_movimiento'
    end
    object CDorigencheque_db: TCurrencyField
      FieldName = 'cheque_db'
    end
    object CDorigencheque_cr: TCurrencyField
      FieldName = 'cheque_cr'
    end
    object CDorigenefectivo_db: TCurrencyField
      FieldName = 'efectivo_db'
    end
    object CDorigenefectivo_cr: TCurrencyField
      FieldName = 'efectivo_cr'
    end
    object CDorigencontador: TIntegerField
      FieldName = 'contador'
    end
  end
end
