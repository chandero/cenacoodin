object FrmConsultaSolicitud: TFrmConsultaSolicitud
  Left = 200
  Top = 162
  Width = 375
  Height = 147
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'FrmConsultaSolicitud'
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
    Width = 367
    Height = 72
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Empleado'
    end
    object Label2: TLabel
      Left = 5
      Top = 47
      Width = 50
      Height = 13
      Caption = 'F. Inicial'
    end
    object Label3: TLabel
      Left = 168
      Top = 47
      Width = 43
      Height = 13
      Caption = 'F. Final'
    end
    object DBempleado: TDBLookupComboBox
      Left = 62
      Top = 14
      Width = 299
      Height = 21
      KeyField = 'ID_EMPLEADO'
      ListField = 'NOMBRE_COMPLETO'
      ListSource = DataSource1
      TabOrder = 0
      OnKeyPress = DBempleadoKeyPress
    end
    object Fecha1: TDateTimePicker
      Left = 62
      Top = 45
      Width = 104
      Height = 21
      CalAlignment = dtaLeft
      Date = 38413.3580065394
      Time = 38413.3580065394
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnKeyPress = Fecha1KeyPress
    end
    object Fecha2: TDateTimePicker
      Left = 215
      Top = 45
      Width = 100
      Height = 21
      CalAlignment = dtaLeft
      Date = 38380.3580248032
      Time = 38380.3580248032
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnKeyPress = Fecha2KeyPress
    end
    object Ctotal: TCheckBox
      Left = 312
      Top = 47
      Width = 47
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdRightToLeftReadingOnly
      Caption = 'Total'
      ParentBiDiMode = False
      TabOrder = 3
    end
    object Rfundacion: TRadioButton
      Left = 20
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Fundaci'#243'n'
      Checked = True
      TabOrder = 4
      TabStop = True
      Visible = False
      OnClick = RfundacionClick
    end
    object Rcreditos: TRadioButton
      Left = 148
      Top = 15
      Width = 113
      Height = 17
      Caption = 'Cr'#233'ditos'
      TabOrder = 5
      Visible = False
      OnClick = RcreditosClick
    end
    object RGeneral: TRadioButton
      Left = 273
      Top = 14
      Width = 113
      Height = 17
      Caption = 'General'
      TabOrder = 6
      Visible = False
      OnClick = RGeneralClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 72
    Width = 367
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Bejecutar: TBitBtn
      Left = 131
      Top = 8
      Width = 105
      Height = 25
      Caption = '&Ejecutar'
      TabOrder = 0
      OnClick = BejecutarClick
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
    object Bcerrar: TBitBtn
      Left = 246
      Top = 8
      Width = 105
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = BcerrarClick
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
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 105
      Height = 25
      Caption = '&Nuevo'
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000EFA54A00C684
        6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00CE9C7B00B584
        8400B58C8400CE9C8400B5948C00C6A59400EFCE9400F7CE9400C6A59C00EFCE
        9C00F7CE9C00F7D69C00C6ADA500CEADA500F7D6A500CEB5AD00D6B5AD00C6BD
        AD00F7D6AD00F7DEAD00D6BDB500DEBDB500DEC6B500E7C6B500EFC6B500EFCE
        B500F7D6B500F7DEB500FFDEB500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7
        C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
        DE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373709090909
        09090909090909090937373710302926231A16110E0E0E130937373710302C28
        26221611110E0E110937373714322E2C2826221A11110E110937373714332E2C
        292823221A11110E093737371736322E2E2C2826221A11110937373718383432
        2E2C2928261A1616093737371C383534312E2C292826221A093737371C383835
        34322E2C28262323093737371D3838383532312E2C282822093737371E383838
        3835323131302719093737371F383838383834342E0D0C0A093737371F383838
        383838362A0204000137373725383838383838382B070503373737371F353434
        343434342A070B37373737371F212121211F1F211C0637373737}
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 128
    Top = 120
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select NOMBRE || '#39' '#39' || PRIMER_APELLIDO || '#39' '#39' || SEGUNDO_APELLI' +
        'DO AS NOMBRE_COMPLETO, ID_EMPLEADO'
      'from "gen$empleado"'
      'where PRIMER_APELLIDO <> '#39'BARRIDO'#39
      'order by NOMBRE')
    Left = 40
    Top = 120
    object IBQuery1NOMBRE_COMPLETO: TIBStringField
      FieldName = 'NOMBRE_COMPLETO'
      ProviderFlags = []
      Size = 92
    end
    object IBQuery1ID_EMPLEADO: TIBStringField
      FieldName = 'ID_EMPLEADO'
      Origin = '"gen$empleado"."ID_EMPLEADO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 8
    Top = 120
  end
  object IBparcial: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      'SELECT'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "col$solicitud".ID_SOLICITUD,'
      '  "col$solicitud".FECHA_RECEPCION,'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".NUMERO_CODEUDORES'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen' +
        '$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "' +
        'gen$persona".ID_IDENTIFICACION)'
      'WHERE'
      
        '  ("col$solicitud".FECHA_RECEPCION BETWEEN :FECHA_INI AND :FECHA' +
        '_FIN) AND'
      '  ("col$solicitud".ID_EMPLEADO = :ID_EMPLEADO)'
      'ORDER BY "col$solicitud".ID_SOLICITUD')
    Left = 96
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_INI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_EMPLEADO'
        ParamType = ptUnknown
      end>
  end
  object IBtotal: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      'SELECT'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "col$solicitud".ID_SOLICITUD,'
      '  "col$solicitud".FECHA_RECEPCION,'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".NUMERO_CODEUDORES'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen' +
        '$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "' +
        'gen$persona".ID_IDENTIFICACION)'
      'WHERE'
      '  ("col$solicitud".ID_EMPLEADO = :ID_EMPLEADO)'
      'ORDER BY "col$solicitud".ID_SOLICITUD')
    Left = 160
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_EMPLEADO'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 64
    Top = 120
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = IBparcial
    Left = 192
    Top = 120
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = IBtotal
    Left = 224
    Top = 120
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 152
    Top = 72
    ReportForm = {19000000}
  end
  object IBtotalFundacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      'SELECT'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "col$solicitud".ID_SOLICITUD,'
      '  "col$solicitud".FECHA_RECEPCION,'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".NUMERO_CODEUDORES'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen' +
        '$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "' +
        'gen$persona".ID_IDENTIFICACION)'
      'WHERE'
      
        '  ("col$solicitud".ES_FUNDACION BETWEEN :FUNDACION1 AND :FUNDACI' +
        'ON2)'
      'ORDER BY "col$solicitud".ID_SOLICITUD')
    Left = 256
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FUNDACION1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FUNDACION2'
        ParamType = ptUnknown
      end>
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = IBtotalFundacion
    Left = 320
    Top = 120
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = IBfundacionParcial
    Left = 352
    Top = 120
  end
  object IBfundacionParcial: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      'SELECT'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "col$solicitud".ID_SOLICITUD,'
      '  "col$solicitud".FECHA_RECEPCION,'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".NUMERO_CODEUDORES'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen' +
        '$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "' +
        'gen$persona".ID_IDENTIFICACION)'
      'WHERE'
      
        '  ("col$solicitud".FECHA_RECEPCION BETWEEN :FECHA_INI AND :FECHA' +
        '_FIN) AND'
      
        '  ("col$solicitud".ES_FUNDACION BETWEEN :FUNDACION1 AND :FUNDACI' +
        'ON2)'
      'ORDER BY "col$solicitud".ID_SOLICITUD')
    Left = 288
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_INI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FUNDACION1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FUNDACION2'
        ParamType = ptUnknown
      end>
  end
  object IBgeneral: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction3
    SQL.Strings = (
      'SELECT'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".FECHA_RECEPCION,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$empleado".PRIMER_APELLIDO,'
      '  "gen$empleado".SEGUNDO_APELLIDO,'
      '  "gen$empleado".NOMBRE,'
      '  "gen$empleado".ID_EMPLEADO,'
      '  "col$solicitud".ID_SOLICITUD,'
      '   "col$estadosolicitud".DESCRIPCION_ESTADO'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "gen$empleado" ON ("col$solicitud".ID_EMPLEADO = "g' +
        'en$empleado".ID_EMPLEADO)'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen' +
        '$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "' +
        'gen$persona".ID_IDENTIFICACION)'
      
        '  INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = ' +
        '"col$estadosolicitud".ID_ESTADO)'
      'WHERE'
      '  ("col$solicitud".FECHA_RECEPCION BETWEEN :FECHA1 AND :FECHA2)'
      'ORDER BY'
      '"gen$empleado".ID_EMPLEADO,"col$solicitud".ID_SOLICITUD')
    Left = 80
    Top = 41
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction3: TIBTransaction
    Active = True
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 232
    Top = 33
  end
  object frDBDataSet5: TfrDBDataSet
    DataSet = IBgeneral
    Left = 128
    Top = 48
  end
  object CDestados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 40
    Data = {
      560000009619E0BD01000000180000000300000000000300000056000969645F
      65737461646F04000100000000000665737461646F0100490000000100055749
      445448020002006400066E756D65726F04000100000000000000}
    object CDestadosid_estado: TIntegerField
      FieldName = 'id_estado'
    end
    object CDestadosestado: TStringField
      FieldName = 'estado'
      Size = 100
    end
    object CDestadosnumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object frDBDataSet6: TfrDBDataSet
    DataSet = CDestados
    Left = 48
    Top = 40
  end
  object IBanalisis: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction3
    Active = True
    SQL.Strings = (
      'SELECT'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".FECHA_ANALISIS,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$empleado".PRIMER_APELLIDO,'
      '  "gen$empleado".SEGUNDO_APELLIDO,'
      '  "gen$empleado".NOMBRE,'
      '  "gen$empleado".ID_EMPLEADO,'
      '  "col$solicitud".ID_SOLICITUD,'
      '   "col$estadosolicitud".DESCRIPCION_ESTADO'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "gen$empleado" ON ("col$solicitud".ID_ANALISIS = "g' +
        'en$empleado".ID_EMPLEADO)'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen' +
        '$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "' +
        'gen$persona".ID_IDENTIFICACION)'
      
        '  INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = ' +
        '"col$estadosolicitud".ID_ESTADO)'
      'WHERE'
      '  ("col$solicitud".FECHA_ANALISIS BETWEEN :FECHA1 AND :FECHA2)'
      'ORDER BY'
      '"gen$empleado".ID_EMPLEADO,"col$solicitud".ID_SOLICITUD')
    Left = 24
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA2'
        ParamType = ptUnknown
      end>
  end
  object frDBDataSet7: TfrDBDataSet
    DataSet = IBanalisis
    Left = 32
    Top = 16
  end
end
