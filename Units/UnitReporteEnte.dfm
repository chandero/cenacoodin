object FrmReporteEnte: TFrmReporteEnte
  Left = 250
  Top = 183
  Width = 313
  Height = 176
  BorderIcons = [biSystemMenu]
  Caption = 'Solicitudes por Fecha de Estudio'
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
    Width = 305
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 14
      Width = 74
      Height = 13
      Caption = 'Ente Aprobador'
    end
    object DBente: TDBLookupComboBox
      Left = 83
      Top = 12
      Width = 214
      Height = 21
      KeyField = 'ID_ENTE_APROBADOR'
      ListField = 'DESCRIPCION_ENTE_APROBADOR'
      ListSource = DataSource1
      TabOrder = 0
      OnKeyPress = DBenteKeyPress
    end
  end
  object TPanel
    Left = 0
    Top = 108
    Width = 304
    Height = 33
    TabOrder = 1
    object BTreporte: TBitBtn
      Left = 42
      Top = 5
      Width = 91
      Height = 25
      Caption = '&Reporte'
      TabOrder = 0
      OnClick = BTreporteClick
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
    object BTcerrar: TBitBtn
      Left = 183
      Top = 5
      Width = 91
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = BTcerrarClick
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
  object GroupBox1: TGroupBox
    Left = -1
    Top = 38
    Width = 154
    Height = 71
    Caption = 'Informaci'#243'n Fecha'
    TabOrder = 2
    object Label2: TLabel
      Left = 1
      Top = 20
      Width = 44
      Height = 13
      Caption = 'F. Sesi'#243'n'
    end
    object TDfecha: TDateTimePicker
      Left = 47
      Top = 18
      Width = 104
      Height = 20
      CalAlignment = dtaLeft
      Date = 38462.4231920833
      Time = 38462.4231920833
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnChange = TDfechaChange
      OnKeyPress = TDfechaKeyPress
    end
    object ChTotal: TCheckBox
      Left = 0
      Top = 44
      Width = 148
      Height = 16
      Alignment = taLeftJustify
      BiDiMode = bdRightToLeft
      Caption = 'Total Analizadas a la Fecha'
      ParentBiDiMode = False
      TabOrder = 1
      OnClick = ChTotalClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 151
    Top = 38
    Width = 154
    Height = 71
    Caption = 'Informaci'#243'n Hora'
    TabOrder = 3
    object Label3: TLabel
      Left = 8
      Top = 20
      Width = 39
      Height = 13
      Caption = 'H. Inicio'
    end
    object Label4: TLabel
      Left = 9
      Top = 44
      Width = 28
      Height = 13
      Caption = 'H. Fin'
    end
    object DBhoraini: TDBLookupComboBox
      Left = 54
      Top = 18
      Width = 85
      Height = 21
      KeyField = 'HORA_INICIO'
      ListField = 'HORA_INICIO'
      ListSource = DShora_ini
      TabOrder = 0
      OnClick = DBhorainiClick
    end
    object DBhorafin: TDBLookupComboBox
      Left = 54
      Top = 42
      Width = 85
      Height = 21
      KeyField = 'HORA_FIN'
      ListField = 'HORA_FIN'
      ListFieldIndex = 1
      ListSource = DShora_fin
      TabOrder = 1
      OnEnter = DBhorafinEnter
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "col$enteaprobador"')
    Left = 16
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 16
  end
  object IBtotal: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT'
      '  "col$registrosesion".ESTADO,'
      '  "col$registrosesion".FECHA,'
      '  "col$registrosesion".DBALIAS,'
      '   "col$registrosesion".ACTA,'
      '  "col$estadosolicitud".DESCRIPCION_ESTADO,'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".VALOR_APROBADO,'
      '  "col$registrosesion".ID_SOLICITUD,'
      '  "col$solicitud".GARANTIA,'
      '  "col$garantia".DESCRIPCION_GARANTIA,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      
        '  "gen$empleado".NOMBRE || '#39' '#39' || "gen$empleado".PRIMER_APELLIDO' +
        ' || '#39' '#39'  ||  "gen$empleado".SEGUNDO_APELLIDO AS EMPLEADO'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "col$registrosesion" ON ("col$solicitud".ID_SOLICIT' +
        'UD = "col$registrosesion".ID_SOLICITUD)'
      
        '  INNER JOIN "col$estadosolicitud" ON ("col$registrosesion".ESTA' +
        'DO = "col$estadosolicitud".ID_ESTADO)'
      
        '  INNER JOIN "col$garantia" ON ("col$solicitud".GARANTIA = "col$' +
        'garantia".ID_GARANTIA)'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_IDENTIFICACION' +
        ' = "gen$persona".ID_IDENTIFICACION) AND ("col$solicitud".ID_PERS' +
        'ONA = "gen$persona".ID_PERSONA) AND ("col$registrosesion".ID_AGE' +
        'NCIA = :ID_AGENCIA)'
      
        '  INNER JOIN "gen$empleado" ON ("col$registrosesion".DBALIAS = "' +
        'gen$empleado".ID_EMPLEADO)'
      'WHERE'
      '  ("col$registrosesion".FECHA = :FECHA) AND'
      '  ("col$registrosesion".ID_ENTE_APROBADOR = :ID_APROBADOR)')
    Left = 40
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_APROBADOR'
        ParamType = ptUnknown
      end>
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 48
    Top = 88
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDreporte
    Left = 8
    Top = 104
  end
  object CDreporte: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'garantia'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'nombres'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'solicitud'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'agencia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'empleado'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'solicitado'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 32
    Data = {
      0E0100009619E0BD0100000018000000080000000000030000000E0108676172
      616E7469610100490000000100055749445448020002006400076E6F6D627265
      73020049000000010005574944544802000200FF000576616C6F720800040000
      00010007535542545950450200490006004D6F6E65790009736F6C6963697475
      640100490000000100055749445448020002000F000665737461646F01004900
      00000100055749445448020002003200076167656E6369610100490000000100
      05574944544802000200320008656D706C6561646F0200490000000100055749
      44544802000200FF000A736F6C6963697461646F080004000000010007535542
      545950450200490006004D6F6E6579000000}
    object CDreportegarantia: TStringField
      FieldName = 'garantia'
      Size = 100
    end
    object CDreportenombres: TStringField
      FieldName = 'nombres'
      Size = 255
    end
    object CDreportevalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDreportesolicitud: TStringField
      FieldName = 'solicitud'
      Size = 15
    end
    object CDreporteestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object CDreporteagencia: TStringField
      FieldName = 'agencia'
      Size = 50
    end
    object CDreporteempleado: TStringField
      FieldName = 'empleado'
      Size = 255
    end
    object CDreportesolicitado: TCurrencyField
      FieldName = 'solicitado'
    end
  end
  object IBhoraini: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT DISTINCT '
      '  "col$registrosesion".HORA_INICIO'
      'FROM'
      '  "col$registrosesion"'
      'WHERE'
      '  ("col$registrosesion".FECHA = :FECHA) AND'
      '  ("col$registrosesion".ID_ENTE_APROBADOR = :ID_ENTE)')
    Left = 240
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ENTE'
        ParamType = ptUnknown
      end>
  end
  object IBhorafin: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT distinct'
      '  "col$registrosesion".HORA_FIN'
      'FROM'
      '  "col$registrosesion"'
      'WHERE'
      '  ("col$registrosesion".HORA_INICIO = :HORA)')
    Left = 152
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'HORA'
        ParamType = ptUnknown
      end>
  end
  object DShora_ini: TDataSource
    DataSet = IBhoraini
    Left = 16
    Top = 9
  end
  object DShora_fin: TDataSource
    DataSet = IBhorafin
    Left = 16
    Top = 8
  end
  object CDestado: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'descripcion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'total'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 328
    Top = 40
    Data = {
      480000009619E0BD01000000180000000200000000000300000048000B646573
      6372697063696F6E010049000000010005574944544802000200140005746F74
      616C04000100000000000000}
    object CDestadodescripcion: TStringField
      FieldName = 'descripcion'
    end
    object CDestadototal: TIntegerField
      FieldName = 'total'
    end
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = CDestado
    Left = 128
    Top = 88
  end
  object IBtotal_of: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT'
      '  "col$registrosesion".DBALIAS,'
      '  "col$registroagencia".ASOCIADO,'
      '  "col$registrosesion".ESTADO,'
      '  "col$registroagencia".VALOR_SOLICITUD,'
      '  "col$registrosesion".ID_SOLICITUD,'
      '  "col$registroagencia".GARANTIA,'
      '  "gen$agencia".DESCRIPCION_AGENCIA,'
      '  "col$garantia".DESCRIPCION_GARANTIA,'
      '  "col$estadosolicitud".DESCRIPCION_ESTADO'
      'FROM'
      '  "col$registroagencia"'
      
        '  INNER JOIN "col$registrosesion" ON ("col$registroagencia".ID_S' +
        'OLICITUD = "col$registrosesion".ID_SOLICITUD)'
      
        '  INNER JOIN "gen$agencia" ON ("col$registrosesion".ID_AGENCIA =' +
        ' "gen$agencia".ID_AGENCIA)'
      
        '  INNER JOIN "col$estadosolicitud" ON ("col$registrosesion".ESTA' +
        'DO = "col$estadosolicitud".ID_ESTADO)'
      
        '  left outer JOIN "col$garantia" ON ("col$registroagencia".GARAN' +
        'TIA = "col$garantia".ID_GARANTIA)'
      'WHERE'
      '  ("col$registroagencia".FECHA_ANALISIS = :FECHA) AND'
      '  ("col$registroagencia".ENTE_APROBADOR = :ID_ENTE) AND'
      '  ("col$registrosesion".ACTA = :ACTA) AND'
      '  ("col$registrosesion".ID_AGENCIA <> 1)')
    Left = 72
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACTA'
        ParamType = ptUnknown
      end>
  end
  object IBtotal_h: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT'
      '  "col$registrosesion".ESTADO,'
      '  "col$registrosesion".FECHA,'
      '   "col$registrosesion".ACTA,'
      '  "col$estadosolicitud".DESCRIPCION_ESTADO,'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".VALOR_APROBADO,'
      '  "col$registrosesion".ID_SOLICITUD,'
      '  "col$solicitud".GARANTIA,'
      '  "col$garantia".DESCRIPCION_GARANTIA,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "col$registrosesion" ON ("col$solicitud".ID_SOLICIT' +
        'UD = "col$registrosesion".ID_SOLICITUD)'
      
        '  INNER JOIN "col$estadosolicitud" ON ("col$registrosesion".ESTA' +
        'DO = "col$estadosolicitud".ID_ESTADO)'
      
        '  INNER JOIN "col$garantia" ON ("col$solicitud".GARANTIA = "col$' +
        'garantia".ID_GARANTIA)'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_IDENTIFICACION' +
        ' = "gen$persona".ID_IDENTIFICACION) AND ("col$solicitud".ID_PERS' +
        'ONA = "gen$persona".ID_PERSONA) AND ("col$registrosesion".ID_AGE' +
        'NCIA = :ID_AGENCIA)'
      'WHERE'
      '  ("col$registrosesion".FECHA = :FECHA) AND'
      '  ("col$registrosesion".ID_ENTE_APROBADOR = :ID_APROBADOR) AND'
      '  ("col$registrosesion".HORA_INICIO = :HORA)')
    Left = 16
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_APROBADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA'
        ParamType = ptUnknown
      end>
  end
  object IBtotal_of_h: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "col$registrosesion".CUENTA,'
      '  "col$registrosesion".ID_AGENCIA,'
      '  "col$registrosesion".ID_SOLICITUD,'
      '  "col$estadosolicitud".DESCRIPCION_ESTADO,'
      '  "gen$agencia".DESCRIPCION_AGENCIA,'
      '  "col$registrosesion".ESTADO,'
      '  "col$registrosesion".ACTA'
      'FROM'
      ' "col$registrosesion"'
      
        ' INNER JOIN "col$estadosolicitud" ON ("col$registrosesion".ESTAD' +
        'O="col$estadosolicitud".ID_ESTADO)'
      
        ' INNER JOIN "gen$agencia" ON ("col$registrosesion".ID_AGENCIA="g' +
        'en$agencia".ID_AGENCIA)'
      'WHERE'
      '  ("col$registrosesion".FECHA = :FECHA) AND '
      '  ("col$registrosesion".ID_ENTE_APROBADOR = :ENTE) AND '
      '  ("col$registrosesion".ID_AGENCIA <> 1) AND '
      '  ("col$registrosesion".HORA_INICIO = :HORA)')
    Left = 72
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA'
        ParamType = ptUnknown
      end>
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = frmMain.CDparticipantes
    Left = 104
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      
        '  "gen$empleado".NOMBRE || '#39' '#39' || "gen$empleado".PRIMER_APELLIDO' +
        '    || '#39' '#39' ||'
      '  "gen$empleado".SEGUNDO_APELLIDO as NOMBRE'
      'FROM'
      '  "gen$empleado"'
      'WHERE'
      '  ("gen$empleado".ID_EMPLEADO = :ID_EMPLEADO)')
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_EMPLEADO'
        ParamType = ptUnknown
      end>
  end
  object IBQuery3: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "col$registroagencia".ASOCIADO,'
      '  "col$registroagencia".VALOR_SOLICITUD,'
      '  "col$garantia".DESCRIPCION_GARANTIA,'
      '"col$registroagencia".GARANTIA'
      'FROM'
      ' "col$registroagencia"'
      
        ' INNER JOIN "col$garantia" ON ("col$registroagencia".GARANTIA="c' +
        'ol$garantia".ID_GARANTIA)'
      'WHERE'
      '  ("col$registroagencia".ID_AGENCIA = :ID) AND '
      '  ("col$registroagencia".ID_SOLICITUD = :ID_SOLICITUD) AND '
      '  ("col$registroagencia".ENTE_APROBADOR = :ENTE)')
    Left = 168
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ENTE'
        ParamType = ptUnknown
      end>
  end
  object IBQuery4: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 280
  end
end
