object FrmEstadoSolicitud: TFrmEstadoSolicitud
  Left = 410
  Top = 218
  Width = 434
  Height = 129
  BorderIcons = [biSystemMenu]
  Caption = 'Reporte de Solicitudes por Estado o General'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 193
    Height = 59
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 100
      Height = 13
      Caption = 'Estado de la solicitud'
    end
    object DBestado: TDBLookupComboBox
      Left = 6
      Top = 25
      Width = 179
      Height = 21
      KeyField = 'id_estado'
      ListField = 'estado'
      ListSource = DataSource1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 193
    Top = 0
    Width = 232
    Height = 59
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 6
      Width = 73
      Height = 13
      Caption = 'Fecha de Inicio'
    end
    object Label3: TLabel
      Left = 10
      Top = 34
      Width = 73
      Height = 13
      Caption = 'Fecha de Corte'
    end
    object DTfechaini: TDateTimePicker
      Left = 88
      Top = 3
      Width = 135
      Height = 21
      CalAlignment = dtaLeft
      Date = 38258.6097956366
      Time = 38258.6097956366
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object DTfechafin: TDateTimePicker
      Left = 88
      Top = 31
      Width = 135
      Height = 21
      CalAlignment = dtaLeft
      Date = 38258.6098323495
      Time = 38258.6098323495
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 59
    Width = 425
    Height = 35
    Color = clOlive
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 16
      Top = 6
      Width = 151
      Height = 25
      Caption = '&Ejecutar Consulta'
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 256
      Top = 6
      Width = 151
      Height = 25
      Caption = '&Cerrar Formulario'
      TabOrder = 1
      OnClick = BitBtn2Click
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
  object CDestado: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 24
    Data = {
      470000009619E0BD01000000180000000200000000000300000047000969645F
      65737461646F02000100000000000665737461646F0100490000000100055749
      4454480200020032000000}
    object CDestadoid_estado: TSmallintField
      FieldName = 'id_estado'
    end
    object CDestadoestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
  end
  object IBrepSolicitud: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
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
      '  ("col$solicitud".ESTADO = :ESTADO) AND '
      
        '  ("col$solicitud".FECHA_RECEPCION BETWEEN :FECHA_INI AND :FECHA' +
        '_FIN)'
      'ORDER BY "col$solicitud".ID_SOLICITUD')
    Left = 104
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_INI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FIN'
        ParamType = ptUnknown
      end>
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 96
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = IBrepSolicitud
    Left = 64
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 32
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = CDestado
    Left = 96
    Top = 24
  end
  object IBtotal: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "col$solicitud".ID_SOLICITUD,'
      '  "col$solicitud".FECHA_RECEPCION,'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".NUMERO_CODEUDORES,'
      '  "col$estadosolicitud".DESCRIPCION_ESTADO,'
      '  "col$solicitud".ESTADO'
      'FROM'
      '  "col$estadosolicitud"'
      
        '  INNER JOIN "col$solicitud" ON ("col$estadosolicitud".ID_ESTADO' +
        ' = "col$solicitud".ESTADO)'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen' +
        '$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "' +
        'gen$persona".ID_IDENTIFICACION)'
      'WHERE'
      
        '  ("col$solicitud".FECHA_RECEPCION BETWEEN :FECHA_INI AND :FECHA' +
        '_FIN)'
      'ORDER BY "col$solicitud".ESTADO,ID_SOLICITUD')
    Top = 24
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
      end>
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = IBtotal
  end
  object CDaprobado: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nombre'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'fecha'
        DataType = ftDate
      end
      item
        Name = 'solicitud'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'valor'
        DataType = ftInteger
      end
      item
        Name = 'dias'
        DataType = ftInteger
      end
      item
        Name = 'dias_ratificado'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'fecha_ratificado'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'desc_agencia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'id_agencia'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'id_agencia'
    Params = <>
    StoreDefs = True
    Left = 32
    Top = 24
    Data = {
      F90000009619E0BD010000001800000009000000000003000000F900066E6F6D
      627265020049000000010005574944544802000200F401056665636861040006
      000000000009736F6C6963697475640100490000000100055749445448020002
      000F000576616C6F720400010000000000046469617304000100000000000F64
      6961735F7261746966696361646F010049000000010005574944544802000200
      03001066656368615F7261746966696361646F01004900000001000557494454
      48020002000A000C646573635F6167656E636961010049000000010005574944
      54480200020032000A69645F6167656E63696104000100000000000000}
    object CDaprobadonombre: TStringField
      FieldName = 'nombre'
      Size = 500
    end
    object CDaprobadofecha: TDateField
      FieldName = 'fecha'
    end
    object CDaprobadosolicitud: TStringField
      FieldName = 'solicitud'
      Size = 15
    end
    object CDaprobadovalor: TIntegerField
      FieldName = 'valor'
    end
    object CDaprobadodias: TIntegerField
      FieldName = 'dias'
    end
    object CDaprobadodias_ratificado: TStringField
      FieldName = 'dias_ratificado'
      Size = 3
    end
    object CDaprobadofecha_ratificado: TStringField
      FieldName = 'fecha_ratificado'
      Size = 10
    end
    object CDaprobadodesc_agencia: TStringField
      FieldName = 'desc_agencia'
      Size = 50
    end
    object CDaprobadoid_agencia: TIntegerField
      FieldName = 'id_agencia'
    end
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = CDaprobado
    Left = 32
  end
  object CDcreditos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 56
    Data = {
      A70000009619E0BD010000001800000004000000000003000000A70009736F6C
      6963697475640100490000000100055749445448020002000F00066E6F6D6272
      65020049000000010005574944544802000200F4010E76616C6F725F6170726F
      6261646F080004000000010007535542545950450200490006004D6F6E657900
      0C646573656D626F6C7361646F08000400000001000753554254595045020049
      0006004D6F6E6579000000}
    object CDcreditossolicitud: TStringField
      FieldName = 'solicitud'
      Size = 15
    end
    object CDcreditosnombre: TStringField
      FieldName = 'nombre'
      Size = 500
    end
    object CDcreditosvalor_aprobado: TCurrencyField
      FieldName = 'valor_aprobado'
    end
    object CDcreditosdesembolsado: TCurrencyField
      FieldName = 'desembolsado'
    end
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = CDcreditos
    Left = 128
  end
  object JV: TJvDBProgress
    Active = False
    SessionName = 'Default'
    TraceFlags = [tfQPrepare, tfQExecute, tfError, tfStmt, tfConnect, tfTransact, tfBlob, tfMisc, tfVendor, tfDataIn, tfDataOut]
    OnPercentChange = JVPercentChange
    Left = 200
    Top = 65528
  end
  object IBRatifica: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      'SELECT '
      '  "col$registrosesion".FECHA'
      'FROM'
      ' "col$registrosesion"'
      'WHERE'
      '  ("col$registrosesion".ID_SOLICITUD = :ID_SOLICITUD) AND '
      '  ("col$registrosesion".ESTADO = 16) AND '
      '  ("col$registrosesion".ID_AGENCIA = :ID_AGENCIA)')
    Left = 192
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 240
    Top = 8
  end
  object IBanalisis: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "col$solicitud".ID_SOLICITUD,'
      '  "col$solicitud".FECHA_ANALISIS,'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".NUMERO_CODEUDORES'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen' +
        '$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "' +
        'gen$persona".ID_IDENTIFICACION)'
      'WHERE'
      '  ("col$solicitud".ESTADO = :ESTADO) AND'
      
        '  ("col$solicitud".FECHA_ANALISIS BETWEEN :FECHA_INI AND :FECHA_' +
        'FIN)'
      'ORDER BY "col$solicitud".ID_SOLICITUD')
    Left = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_INI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FIN'
        ParamType = ptUnknown
      end>
  end
  object frDBDataSet5: TfrDBDataSet
    DataSet = IBanalisis
    Left = 368
  end
  object IdTCPClient1: TIdTCPClient
    Port = 0
    Left = 136
    Top = 8
  end
  object IBagencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select ID_AGENCIA, DESCRIPCION_AGENCIA from "gen$agencia" WHERE ' +
        'ID_AGENCIA > 1')
    Left = 208
    Top = 64
  end
end
