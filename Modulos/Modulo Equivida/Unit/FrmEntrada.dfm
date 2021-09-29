object Entrada: TEntrada
  Left = 104
  Top = 175
  Width = 515
  Height = 206
  BorderIcons = [biSystemMenu]
  Caption = 'Entrada de Registros de Equivida'
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
    Width = 505
    Height = 129
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 13
      Width = 107
      Height = 13
      Caption = 'Tipo Identificaci'#243'n'
    end
    object Label2: TLabel
      Left = 323
      Top = 13
      Width = 44
      Height = 13
      Caption = 'N'#250'mero'
    end
    object JvLabel1: TJvLabel
      Left = 4
      Top = 43
      Width = 115
      Height = 13
      Caption = 'Nombres y Apellidos'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvLabel2: TJvLabel
      Left = 6
      Top = 72
      Width = 92
      Height = 13
      Caption = 'Fecha Afiliaci'#243'n'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvLabel3: TJvLabel
      Left = 247
      Top = 72
      Width = 127
      Height = 13
      Caption = 'Fecha de Vencimiento'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Label3: TLabel
      Left = 8
      Top = 101
      Width = 74
      Height = 13
      Caption = 'Valor Seguro'
    end
    object Label4: TLabel
      Left = 247
      Top = 101
      Width = 76
      Height = 13
      Caption = 'Fecha Actual'
    end
    object DBtipo: TDBLookupComboBox
      Left = 128
      Top = 11
      Width = 192
      Height = 21
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DataSource1
      TabOrder = 0
      OnEnter = DBtipoEnter
      OnKeyPress = DBtipoKeyPress
    end
    object EDnumero: TJvEdit
      Left = 372
      Top = 11
      Width = 129
      Height = 21
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 1
      OnExit = EDnumeroExit
      OnKeyPress = EDnumeroKeyPress
    end
    object EDnombre: TJvEdit
      Left = 128
      Top = 41
      Width = 372
      Height = 21
      TabStop = False
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = EDnombreKeyPress
    end
    object Fecha_a: TDateTimePicker
      Left = 127
      Top = 70
      Width = 116
      Height = 21
      CalAlignment = dtaLeft
      Date = 38350.6100117477
      Time = 38350.6100117477
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      OnKeyPress = Fecha_aKeyPress
    end
    object Fecha_v: TDateTimePicker
      Left = 385
      Top = 70
      Width = 116
      Height = 21
      CalAlignment = dtaLeft
      Date = 38350.6100531597
      Time = 38350.6100531597
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
      OnKeyPress = Fecha_vKeyPress
    end
    object Valor: TJvCurrencyEdit
      Left = 126
      Top = 99
      Width = 116
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 5
      OnKeyPress = ValorKeyPress
      HasMaxValue = False
      HasMinValue = False
    end
    object Fecha_hoy: TDateTimePicker
      Left = 385
      Top = 99
      Width = 116
      Height = 21
      CalAlignment = dtaLeft
      Date = 38350.6127884375
      Time = 38350.6127884375
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 6
      TabStop = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 505
    Height = 41
    Color = clOlive
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 113
      Height = 25
      Caption = '&Registrar'
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 185
      Top = 8
      Width = 113
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 380
      Top = 8
      Width = 113
      Height = 25
      Caption = 'C&errar'
      TabOrder = 2
      OnClick = BitBtn3Click
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
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 56
    Top = 24
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$tiposidentificacion".ID_IDENTIFICACION,'
      '  "gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION'
      'FROM'
      '  "gen$tiposidentificacion"')
    Left = 32
    Top = 56
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 72
    Top = 104
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 120
    Top = 112
  end
  object prTxReport1: TprTxReport
    FromPage = 1
    ToPage = 1
    Values = <>
    Variables = <>
    PrinterName = '\\SISTEMAS01\EPSON FX-1180+ ESC/P'
    ESCModelName = 'Epson printers'
    LinesOnPage = 80
    Left = 328
    Top = 96
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 1'
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
      ColNum = 80
      object prTxHTitleBand1: TprTxHTitleBand
        Height = 57
        UseVerticalBands = False
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                ''
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.'
                
                  'Un Sistema de Informaci'#243'n, es aqu'#233'l que permite recopilar, admin' +
                  'istrar y manipular un conjunto de datos que conforman la informa' +
                  'ci'#243'n necesaria para que los estamentos ejecutivos de una organiz' +
                  'aci'#243'n puedan realizar una toma de decisiones informadamente. Por' +
                  ' otra parte, los Sistemas de Informaci'#243'n en las grandes empresas' +
                  ' est'#225'n orientados hacia el uso de las bases de datos como compon' +
                  'entes estructurales clave en su dise'#241'o, pues se define como la p' +
                  'rincipal fuerza de integraci'#243'n del Sistema de Informaci'#243
                
                  'Por esta raz'#243'n, las organizaciones privadas y/o p'#250'blicas le dan ' +
                  'gran importancia a la automatizaci'#243'n de sus operaciones, con el ' +
                  'objetivo de ingresar o mantenerse en un mercado cada vez m'#225's com' +
                  'petitivo.'
                
                  'La Cooperativa de Ahorro y Cr'#233'dito CREDISERVIR encaminada a brin' +
                  'dar los mejores servicios a la comunidad conformada por los Asoc' +
                  'iados de la Cooperativa y de la comunidad en general, decide Imp' +
                  'lementar el Sistema para la realizaci'#243'n del formulario de cr'#233'dit' +
                  'os desde el sistema, el cual permite de una manera '#243'ptima maneja' +
                  'r la informaci'#243'n, logrando as'#237', un mejor aprovechamiento del rec' +
                  'urso humano y f'#237'sico de la Entidad.')
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
          dRec.Bottom = 56
          Visible = False
        end
      end
    end
  end
end
