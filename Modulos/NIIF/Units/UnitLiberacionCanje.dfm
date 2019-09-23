object frmLiberacionCanje: TfrmLiberacionCanje
  Left = 263
  Top = 469
  BorderStyle = bsDialog
  Caption = 'Liberaci'#243'n de Canjes'
  ClientHeight = 114
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000EEEEEEEEEEEEEEEEEEEEEEEEEEEEE000E00
    E00E0E000EEEEEEEEEEEEEEEEE000EEEEEEEEEEEEEEEEEEEEEEEEEEEEE000EEE
    EEEEEEEEEEEEEE8E8E8E8E8E8E000EEEEEEEEEEEEEEEEEEEEEEEEEEEEE000E00
    0EEEEEEEEEEEEEEEEEEEEEEEEE000EEE3B7E8E8E8E8E8E8E8E8E8E8E8E000EEE
    3350EEEEEEEEEEEEEEEEEE7E7E000EEEEE057EEEEEEEEEEEEEEEEEEEEE000E77
    7EE55777777E77E777E7EE0E0E000EEEEEEE55DEEEEEEEEEEEEEEEEEEE000EEE
    EEEEE55DEEEEEEEEEEEEEEEEEE000EEEEEEEEE55DEEEEEEEEE878E87EE000E88
    8EEEEEE55DEEEEEEEEEEEEEEEE000EEEEEEEEEEE55DEEEEEEEEEEE7E7E000EEE
    EEEEEEEEE55DEEEEEEEEEEEEEE000000000000000005D0000000000000000000
    0000000000065D00000000000000000000000000000065500000000000000000
    0000000000000650000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000001FFFE3FFFFFFF1FFFFFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFF}
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PgC: TPageControl
    Left = 0
    Top = 0
    Width = 564
    Height = 114
    ActivePage = TabCheques
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabCheques: TTabSheet
      Caption = 'Cheques'
      object PageControl1: TPageControl
        Left = 235
        Top = 0
        Width = 321
        Height = 86
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          TabVisible = False
          object Label1: TLabel
            Left = 6
            Top = 8
            Width = 67
            Height = 13
            Caption = 'Fecha Desde:'
          end
          object Label2: TLabel
            Left = 6
            Top = 30
            Width = 64
            Height = 13
            Caption = 'Fecha Hasta:'
          end
          object EdFecha1: TDateTimePicker
            Left = 78
            Top = 4
            Width = 133
            Height = 21
            CalAlignment = dtaLeft
            Date = 37973.6544351389
            Format = 'MMMM-dd- yyyy'
            Time = 37973.6544351389
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
          object EdFecha2: TDateTimePicker
            Left = 78
            Top = 26
            Width = 133
            Height = 21
            CalAlignment = dtaLeft
            Date = 37973.6544351389
            Format = 'MMMM-dd- yyyy'
            Time = 37973.6544351389
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          TabVisible = False
          object Label3: TLabel
            Left = 2
            Top = 4
            Width = 72
            Height = 13
            Caption = 'Tipo Captaci'#243'n'
          end
          object Label4: TLabel
            Left = 4
            Top = 28
            Width = 88
            Height = 13
            Caption = 'N'#250'mero Captaci'#243'n'
          end
          object DBLCBTiposCaptacion: TDBLookupComboBox
            Left = 84
            Top = 0
            Width = 215
            Height = 21
            KeyField = 'ID_TIPO_CAPTACION'
            ListField = 'DESCRIPCION'
            ListSource = DataSource1
            TabOrder = 0
            OnExit = DBLCBTiposCaptacionExit
          end
          object EdNumeroCaptacion: TMemo
            Left = 96
            Top = 24
            Width = 89
            Height = 21
            Alignment = taRightJustify
            MaxLength = 7
            TabOrder = 1
            WantReturns = False
            WordWrap = False
            OnExit = EdNumeroCaptacionExit
            OnKeyPress = EdNumeroCaptacionKeyPress
          end
          object EdNombre: TStaticText
            Left = 4
            Top = 52
            Width = 311
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clCaptionText
            ParentColor = False
            TabOrder = 2
          end
          object EdDigito: TStaticText
            Left = 190
            Top = 24
            Width = 23
            Height = 21
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clCaptionText
            ParentColor = False
            TabOrder = 3
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'TabSheet3'
          ImageIndex = 2
          TabVisible = False
          object Label5: TLabel
            Left = 8
            Top = 12
            Width = 31
            Height = 13
            Caption = 'Banco'
          end
          object Label6: TLabel
            Left = 8
            Top = 48
            Width = 60
            Height = 13
            Caption = 'Cheque Nro:'
          end
          object EdCheque: TEdit
            Left = 72
            Top = 46
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object DBLCBBancos: TDBLookupComboBox
            Left = 47
            Top = 10
            Width = 265
            Height = 21
            KeyField = 'ID_BANCO'
            ListField = 'DESCRIPCION'
            ListSource = DataSource2
            TabOrder = 0
          end
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 0
        Top = 0
        Width = 135
        Height = 86
        Align = alLeft
        Caption = 'Liberar por '
        ItemIndex = 0
        Items.Strings = (
          'Limites de Fechas'
          'N'#250'mero de Captaci'#243'n'
          'N'#250'mero de Cheque')
        TabOrder = 1
        TabStop = True
        OnClick = RadioGroup1Click
      end
      object Panel2: TPanel
        Left = 135
        Top = 0
        Width = 100
        Height = 86
        Align = alLeft
        TabOrder = 2
        object RGPlaza: TRadioGroup
          Left = 1
          Top = 1
          Width = 98
          Height = 84
          Align = alClient
          Caption = 'Plaza'
          ItemIndex = 0
          Items.Strings = (
            'Local'
            'Otras'
            'Todas')
          TabOrder = 0
        end
      end
    end
    object TabMonedas: TTabSheet
      Caption = 'Monedas'
      ImageIndex = 1
      object PageControl3: TPageControl
        Left = 135
        Top = 0
        Width = 421
        Height = 86
        ActivePage = TabSheet5
        Align = alClient
        TabOrder = 0
        object TabSheet4: TTabSheet
          Caption = 'TabSheet1'
          TabVisible = False
          object Label7: TLabel
            Left = 6
            Top = 8
            Width = 67
            Height = 13
            Caption = 'Fecha Desde:'
          end
          object Label8: TLabel
            Left = 6
            Top = 30
            Width = 64
            Height = 13
            Caption = 'Fecha Hasta:'
          end
          object EdFecha1M: TDateTimePicker
            Left = 78
            Top = 4
            Width = 133
            Height = 21
            CalAlignment = dtaLeft
            Date = 37973.6544351389
            Format = 'MMMM-dd- yyyy'
            Time = 37973.6544351389
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
          object EdFecha2M: TDateTimePicker
            Left = 78
            Top = 26
            Width = 133
            Height = 21
            CalAlignment = dtaLeft
            Date = 37973.6544351389
            Format = 'MMMM-dd- yyyy'
            Time = 37973.6544351389
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          TabVisible = False
          object Label9: TLabel
            Left = 2
            Top = 4
            Width = 72
            Height = 13
            Caption = 'Tipo Captaci'#243'n'
          end
          object Label10: TLabel
            Left = 4
            Top = 28
            Width = 88
            Height = 13
            Caption = 'N'#250'mero Captaci'#243'n'
          end
          object DBLCBTiposCaptacionMon: TDBLookupComboBox
            Left = 84
            Top = 0
            Width = 215
            Height = 21
            KeyField = 'ID_TIPO_CAPTACION'
            ListField = 'DESCRIPCION'
            ListSource = DataSource1
            TabOrder = 0
            OnExit = DBLCBTiposCaptacionMonExit
          end
          object EdNumeroCaptacionMon: TMemo
            Left = 96
            Top = 24
            Width = 89
            Height = 21
            Alignment = taRightJustify
            MaxLength = 7
            TabOrder = 1
            WantReturns = False
            WordWrap = False
            OnExit = EdNumeroCaptacionMonExit
            OnKeyPress = EdNumeroCaptacionMonKeyPress
          end
          object EdNombreMon: TStaticText
            Left = 4
            Top = 52
            Width = 311
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clCaptionText
            ParentColor = False
            TabOrder = 2
          end
          object EdDigitoMon: TStaticText
            Left = 190
            Top = 24
            Width = 23
            Height = 21
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clCaptionText
            ParentColor = False
            TabOrder = 3
          end
        end
      end
      object RGLibMon: TRadioGroup
        Left = 0
        Top = 0
        Width = 135
        Height = 86
        Align = alLeft
        Caption = 'Liberar por '
        ItemIndex = 0
        Items.Strings = (
          'Limites de Fechas'
          'N'#250'mero de Captaci'#243'n')
        TabOrder = 1
        TabStop = True
        OnClick = RGLibMonClick
      end
    end
  end
  object Panel1: TPanel
    Left = 564
    Top = 0
    Width = 85
    Height = 114
    Align = alRight
    Color = clOlive
    TabOrder = 1
    object CmdAceptar: TBitBtn
      Left = 4
      Top = 8
      Width = 79
      Height = 25
      Caption = '&Aceptar'
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
    object CmdCancelar: TBitBtn
      Left = 4
      Top = 36
      Width = 79
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = CmdCancelarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B000000010000000100000031DE000031
        E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
        0404040404040404000004000004040404040404040404000004040000000404
        0404040404040000040404000000000404040404040000040404040402000000
        0404040400000404040404040404000000040000000404040404040404040400
        0101010004040404040404040404040401010204040404040404040404040400
        0201020304040404040404040404030201040403030404040404040404050203
        0404040405030404040404040303050404040404040303040404040303030404
        0404040404040403040403030304040404040404040404040404030304040404
        0404040404040404040404040404040404040404040404040404}
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "cap$tipocaptacion"')
    Left = 438
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 464
    Top = 2
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 486
    Top = 36
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$bancos"')
    Left = 438
    Top = 56
  end
  object DataSource2: TDataSource
    DataSet = IBQuery2
    Left = 468
    Top = 56
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 466
    Top = 30
  end
  object IBSQL3: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 406
    Top = 56
  end
end
