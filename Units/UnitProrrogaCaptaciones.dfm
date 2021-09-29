object frmProrrogaCaptacion: TfrmProrrogaCaptacion
  Left = 484
  Top = 275
  Width = 486
  Height = 147
  BorderIcons = []
  Caption = 'Prorroga de Captaciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox9: TGroupBox
    Left = 0
    Top = 0
    Width = 373
    Height = 113
    Align = alLeft
    TabOrder = 0
    object Label24: TLabel
      Left = 4
      Top = 18
      Width = 105
      Height = 13
      Caption = 'Tipo de Captaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 4
      Top = 42
      Width = 103
      Height = 13
      Caption = 'Fecha a Prorrogar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLCBTipoCaptacion: TDBLookupComboBox
      Left = 110
      Top = 16
      Width = 235
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'ID_TIPO_CAPTACION'
      ListField = 'DESCRIPCION'
      ListSource = DSTiposCaptacion
      ParentFont = False
      TabOrder = 0
      OnEnter = DBLCBTipoCaptacionEnter
    end
    object EdFecha: TDateTimePicker
      Left = 110
      Top = 40
      Width = 97
      Height = 21
      CalAlignment = dtaLeft
      Date = 37827.4390843056
      Time = 37827.4390843056
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
    object RadioTipoProrroga: TRadioGroup
      Left = 4
      Top = 64
      Width = 197
      Height = 33
      Caption = 'Tipo de Prorroga'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Prueba'
        'Definitiva')
      ParentFont = False
      TabOrder = 2
      OnClick = RadioTipoProrrogaClick
    end
  end
  object Panel1: TPanel
    Left = 374
    Top = 0
    Width = 104
    Height = 113
    Align = alRight
    Color = clOlive
    TabOrder = 1
    object CmdProrrogar: TBitBtn
      Left = 6
      Top = 6
      Width = 93
      Height = 25
      Caption = '&Prorrogar'
      Enabled = False
      TabOrder = 0
      OnClick = CmdProrrogarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF4A49494A49494A49494A49494A49494A49494A49494A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A49498E8F8FADABABB9B1AD51
        6481516481B9B1ACABA8A8949393474848FF00FFFF00FFFF00FFFF00FFFF00FF
        464646BEBABAC8C7C7C5C0BD6B7B9A00689B00689B6B7B9ADDD9D6BDBCBCB3AF
        AF474848FF00FFFF00FFFF00FF797A7A979595C0C0C0DDDAD86B7B9A00ACE800
        AFE200AFE2009FDB6B7B9ADCDAD9A9A6A69695954A4949FF00FFFF00FF797A7A
        ADAAAABDBBBBFCFFFF6B7B9A6B7B9A00689B00689B00AFE26D7E9DE9E5E1BEBD
        BDAEABAB4A4949FF00FFFF00FF797A7AA9A7A7C9C9C9EAEAE9D3E0EA6B7B9A00
        AFE200AFE200A1D9D4D6E1E8EAE9BCBBBBABA8A84A4949FF00FFFF00FF797A7A
        B1AEAEBBBABAF6F5F36B7B9A00AFE200A6D900689B6B7B9A6B7B9AEBE7E4AFAD
        ADADACAC4A4949FF00FFFF00FFFF00FF797A7AADA9A9DBD9D7C3C5D26B7B9A00
        AADD00AFE200ACE86B7B9ACECDCCACA9A94A4949FF00FFFF00FFFF00FFFF00FF
        797A7AAFAEAEC5C3C3E8E5E16B7B9A00689B00689B6B7B9ADBD8D5AAA5A5B2B1
        B14A4949FF00FFFF00FFFF00FFFF00FFFF00FF797A7A979494A6A2A2CFC7C34C
        5C794C5D79C8C1BCBBB7B79493934A4949FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF797A7A797A7A6A6A6A716E6B726F6B6A6A6A4747474A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF79797969
        67676969697D7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF8C8989CCCFD09195968F8D8DFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9A9AD6D4D3F3
        FDFFCBD2D5C8C4C47B7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF202020A5A5A5333333929090969494353535A8A8A8222222FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object CmdCerrar: TBitBtn
      Left = 6
      Top = 84
      Width = 93
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
    object CmdVer: TBitBtn
      Left = 6
      Top = 32
      Width = 93
      Height = 25
      Caption = '&Ver Informe'
      Enabled = False
      TabOrder = 2
      OnClick = CmdVerClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF4A49494A49494A49494A49494A49494A49494A49494A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A49498E8F8FADABABB9B1AD51
        6481516481B9B1ACABA8A8949393474848FF00FFFF00FFFF00FFFF00FFFF00FF
        464646BEBABAC8C7C7C5C0BD6B7B9A00689B00689B6B7B9ADDD9D6BDBCBCB3AF
        AF474848FF00FFFF00FFFF00FF797A7A979595C0C0C0DDDAD86B7B9A00ACE800
        AFE200AFE2009FDB6B7B9ADCDAD9A9A6A69695954A4949FF00FFFF00FF797A7A
        ADAAAABDBBBBFCFFFF6B7B9A6B7B9A00689B00689B00AFE26D7E9DE9E5E1BEBD
        BDAEABAB4A4949FF00FFFF00FF797A7AA9A7A7C9C9C9EAEAE9D3E0EA6B7B9A00
        AFE200AFE200A1D9D4D6E1E8EAE9BCBBBBABA8A84A4949FF00FFFF00FF797A7A
        B1AEAEBBBABAF6F5F36B7B9A00AFE200A6D900689B6B7B9A6B7B9AEBE7E4AFAD
        ADADACAC4A4949FF00FFFF00FFFF00FF797A7AADA9A9DBD9D7C3C5D26B7B9A00
        AADD00AFE200ACE86B7B9ACECDCCACA9A94A4949FF00FFFF00FFFF00FFFF00FF
        797A7AAFAEAEC5C3C3E8E5E16B7B9A00689B00689B6B7B9ADBD8D5AAA5A5B2B1
        B14A4949FF00FFFF00FFFF00FFFF00FFFF00FF797A7A979494A6A2A2CFC7C34C
        5C794C5D79C8C1BCBBB7B79493934A4949FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF797A7A797A7A6A6A6A716E6B726F6B6A6A6A4747474A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF79797969
        67676969697D7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF8C8989CCCFD09195968F8D8DFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9A9AD6D4D3F3
        FDFFCBD2D5C8C4C47B7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF202020A5A5A5333333929090969494353535A8A8A8222222FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object CmdAplicar: TBitBtn
      Left = 6
      Top = 58
      Width = 93
      Height = 25
      Caption = '&Aplicar'
      Enabled = False
      TabOrder = 3
      OnClick = CmdAplicarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF4A49494A49494A49494A49494A49494A49494A49494A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A49498E8F8FADABABB9B1AD51
        6481516481B9B1ACABA8A8949393474848FF00FFFF00FFFF00FFFF00FFFF00FF
        464646BEBABAC8C7C7C5C0BD6B7B9A00689B00689B6B7B9ADDD9D6BDBCBCB3AF
        AF474848FF00FFFF00FFFF00FF797A7A979595C0C0C0DDDAD86B7B9A00ACE800
        AFE200AFE2009FDB6B7B9ADCDAD9A9A6A69695954A4949FF00FFFF00FF797A7A
        ADAAAABDBBBBFCFFFF6B7B9A6B7B9A00689B00689B00AFE26D7E9DE9E5E1BEBD
        BDAEABAB4A4949FF00FFFF00FF797A7AA9A7A7C9C9C9EAEAE9D3E0EA6B7B9A00
        AFE200AFE200A1D9D4D6E1E8EAE9BCBBBBABA8A84A4949FF00FFFF00FF797A7A
        B1AEAEBBBABAF6F5F36B7B9A00AFE200A6D900689B6B7B9A6B7B9AEBE7E4AFAD
        ADADACAC4A4949FF00FFFF00FFFF00FF797A7AADA9A9DBD9D7C3C5D26B7B9A00
        AADD00AFE200ACE86B7B9ACECDCCACA9A94A4949FF00FFFF00FFFF00FFFF00FF
        797A7AAFAEAEC5C3C3E8E5E16B7B9A00689B00689B6B7B9ADBD8D5AAA5A5B2B1
        B14A4949FF00FFFF00FFFF00FFFF00FFFF00FF797A7A979494A6A2A2CFC7C34C
        5C794C5D79C8C1BCBBB7B79493934A4949FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF797A7A797A7A6A6A6A716E6B726F6B6A6A6A4747474A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF79797969
        67676969697D7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF8C8989CCCFD09195968F8D8DFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9A9AD6D4D3F3
        FDFFCBD2D5C8C4C47B7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF202020A5A5A5333333929090969494353535A8A8A8222222FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object IBTiposCaptacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT'
      
        '  "cap$tipocaptacion".ID_TIPO_CAPTACION, "cap$tipocaptacion".DES' +
        'CRIPCION from "cap$tipocaptacion" '
      'INNER JOIN'
      
        ' "cap$tiposforma" on ("cap$tipocaptacion".ID_FORMA = "cap$tiposf' +
        'orma".ID_FORMA)'
      'WHERE'
      
        ' "cap$tipocaptacion".PAGA_INTERES <> 0 and "cap$tiposforma".CERT' +
        'IFICADO <> 0'
      '')
    Left = 226
    Top = 4
  end
  object DSTiposCaptacion: TDataSource
    AutoEdit = False
    DataSet = IBTiposCaptacion
    Left = 198
    Top = 4
  end
  object Reporte: TprTxReport
    FromPage = 2
    ToPage = 2
    PrintPagesMode = ppmPagesRange
    ExportFromPage = 0
    ExportToPage = 0
    Values = <>
    Variables = <
      item
        Name = 'EMPRESA'
        ValueType = 'prvvtString'
        Value = 'COOPSERVIR'
      end
      item
        Name = 'FECHACORTE'
        ValueType = 'prvvtDateTime'
        Value = 37835d
      end
      item
        Name = 'AGENCIA'
        ValueType = 'prvvtString'
        Value = 'OCA'#209'A'
      end
      item
        Name = 'CAPTACION'
        ValueType = 'prvvtString'
        Value = 'AHORRO RINDE DIARIO'
      end
      item
        Name = 'NIT'
        ValueType = 'prvvtString'
        Value = '890.505.363-6'
      end
      item
        Name = 'TIPOPRORROGA'
        ValueType = 'prvvtString'
        Value = ' DE PRUEBA'
      end>
    PrinterName = '\\creditos_01\EPSON LX-300'
    ESCModelName = 'Epson printers'
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 262
    Top = 40
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
      ColNum = 140
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'CDStemp'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand1'
          'prTxHDetailFooterBand1'
          'prTxHDetailHeaderBand1'
          'prTxHDetailFooterBand1')
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<0000000>CDStemp.NUMERO_CUENTA]-[CDStemp.DIGITO_CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 11
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDStemp.ID_IDENTIFICACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 12
          dRec.Top = 0
          dRec.Right = 14
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDStemp.ID_PERSONA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 15
          dRec.Top = 0
          dRec.Right = 26
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDStemp.NOMBRE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 27
          dRec.Top = 0
          dRec.Right = 75
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>CDStemp.FECHA_INI_ACT]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 83
          dRec.Top = 0
          dRec.Right = 96
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>CDStemp.FECHA_FIN_ACT]')
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
          dRec.Top = 0
          dRec.Right = 109
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>CDStemp.FECHA_INI_NEW]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 109
          dRec.Top = 0
          dRec.Right = 122
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>CDStemp.FECHA_FIN_NEW]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 122
          dRec.Top = 0
          dRec.Right = 135
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDStemp.AMORTIZACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 76
          dRec.Top = 0
          dRec.Right = 82
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
        object prTxMemoObj9: TprTxMemoObj
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
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 11
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
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
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 12
          dRec.Top = 0
          dRec.Right = 26
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
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
          dRec.Left = 27
          dRec.Top = 0
          dRec.Right = 75
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
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
          dRec.Top = 1
          dRec.Right = 135
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Vencimiento')
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
          dRec.Top = 0
          dRec.Right = 109
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Prorroga')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 109
          dRec.Top = 0
          dRec.Right = 122
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Venc Prorroga')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 122
          dRec.Top = 0
          dRec.Right = 135
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AMORTIZ')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 75
          dRec.Top = 0
          dRec.Right = 83
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand1: TprTxHDetailFooterBand
        Height = 2
        UseVerticalBands = False
        DetailBand = Reporte.prTxHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj17: TprTxMemoObj
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
          dRec.Right = 135
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHPageHeaderBand1: TprTxHPageHeaderBand
        Height = 4
        UseVerticalBands = False
        PrintOnFirstPage = True
        object prTxMemoObj20: TprTxMemoObj
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
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 24
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
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
          dRec.Top = 3
          dRec.Right = 135
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'PRORROGA DE CAPTACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold)
            end>
          dRec.Left = 56
          dRec.Top = 0
          dRec.Right = 81
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'P'#225'gina:')
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
          dRec.Right = 101
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<000>Page]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 102
          dRec.Top = 0
          dRec.Right = 105
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA CORTE:')
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
          dRec.Right = 12
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>FECHACORTE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 12
          dRec.Top = 1
          dRec.Right = 22
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Agencia:')
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
          dRec.Right = 8
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[AGENCIA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 9
          dRec.Top = 2
          dRec.Right = 21
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj34: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CAPTACION:[CAPTACION]')
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
          dRec.Top = 2
          dRec.Right = 135
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj35: TprTxMemoObj
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
              TxFontOptionsEx = (
                tfoBold)
            end>
          dRec.Left = 25
          dRec.Top = 0
          dRec.Right = 29
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj36: TprTxMemoObj
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
              TxFontOptionsEx = (
                tfoBold)
            end>
          dRec.Left = 30
          dRec.Top = 0
          dRec.Right = 53
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Apertura')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 83
          dRec.Top = 4
          dRec.Right = 96
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TIPO PRORROGA: [TIPOPRORROGA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 56
          dRec.Top = 1
          dRec.Right = 85
          dRec.Bottom = 2
          Visible = False
        end
      end
    end
  end
  object IBProrroga: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      '')
    Left = 232
    Top = 42
  end
  object IBConsulta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 232
    Top = 70
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 260
    Top = 70
  end
  object IBDias: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 286
    Top = 70
  end
  object IBTasa: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'select TACD_TASAE from "cap$tasacdat" where'
      ':FECHA BETWEEN TACD_FECHAI AND TACD_FECHAF AND'
      ':MONTO BETWEEN TACD_MONTOI AND TACD_MONTOF AND'
      ':PLAZO BETWEEN TACD_PLAZOI AND TACD_PLAZOF')
    Transaction = dmGeneral.IBTransaction1
    Left = 288
    Top = 40
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 312
    Top = 40
  end
  object CDStemp: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 56
    Data = {
      980100009619E0BD01000000180000001000000000000300000098010A49445F
      4147454E43494104000100000000001149445F5449504F5F434150544143494F
      4E04000100000000000D4E554D45524F5F4355454E544104000100000000000D
      44494749544F5F4355454E544104000100000000001149445F4944454E544946
      49434143494F4E04000100000000000A49445F504552534F4E41010049000000
      0100055749445448020002003200064E4F4D4252450100490000000100055749
      4454480200020096000C414D4F5254495A4143494F4E04000100000000000554
      4153414508000400000000000D46454348415F494E495F414354040006000000
      00000D46454348415F46494E5F41435404000600000000000D46454348415F49
      4E495F4E455704000600000000000D46454348415F46494E5F4E455704000600
      000000000D56414C4F525F494E494349414C0800040000000100075355425459
      50450200490006004D6F6E65790005504C415A4F0400010000000000094D4F44
      414C4944414401004900000001000557494454480200020001000000}
    object CDStempID_AGENCIA: TIntegerField
      FieldName = 'ID_AGENCIA'
    end
    object CDStempID_TIPO_CAPTACION: TIntegerField
      FieldName = 'ID_TIPO_CAPTACION'
    end
    object CDStempNUMERO_CUENTA: TIntegerField
      FieldName = 'NUMERO_CUENTA'
    end
    object CDStempDIGITO_CUENTA: TIntegerField
      FieldName = 'DIGITO_CUENTA'
    end
    object CDStempID_IDENTIFICACION: TIntegerField
      FieldName = 'ID_IDENTIFICACION'
    end
    object CDStempID_PERSONA: TStringField
      FieldName = 'ID_PERSONA'
      Size = 50
    end
    object CDStempNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 150
    end
    object CDStempAMORTIZACION: TIntegerField
      FieldName = 'AMORTIZACION'
    end
    object CDStempTASAE: TFloatField
      FieldName = 'TASAE'
    end
    object CDStempFECHA_INI_ACT: TDateField
      FieldName = 'FECHA_INI_ACT'
    end
    object CDStempFECHA_FIN_ACT: TDateField
      FieldName = 'FECHA_FIN_ACT'
    end
    object CDStempFECHA_INI_NEW: TDateField
      FieldName = 'FECHA_INI_NEW'
    end
    object CDStempFECHA_FIN_NEW: TDateField
      FieldName = 'FECHA_FIN_NEW'
    end
    object CDStempVALOR_INICIAL: TCurrencyField
      FieldName = 'VALOR_INICIAL'
    end
    object CDStempPLAZO: TIntegerField
      FieldName = 'PLAZO'
    end
    object CDStempMODALIDAD: TStringField
      FieldName = 'MODALIDAD'
      Size = 1
    end
  end
end
