object frmMigraciondeNotasColgaap: TfrmMigraciondeNotasColgaap
  Left = 509
  Top = 248
  Width = 445
  Height = 183
  Caption = 'Migraci'#243'n de Notas Colgaap'
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 437
    Height = 49
    Align = alTop
    Caption = 'Periodo a Migrar'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 48
      Height = 13
      Caption = 'Desde el: '
    end
    object Label2: TLabel
      Left = 168
      Top = 24
      Width = 45
      Height = 13
      Caption = 'Hasta el: '
    end
    object edFechaDesde: TDateTimePicker
      Left = 59
      Top = 20
      Width = 94
      Height = 21
      CalAlignment = dtaLeft
      Date = 42465.2608740625
      Time = 42465.2608740625
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object edFechaHasta: TDateTimePicker
      Left = 219
      Top = 20
      Width = 94
      Height = 21
      CalAlignment = dtaLeft
      Date = 42465.2608740625
      Time = 42465.2608740625
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object btnProcesar: TBitBtn
      Left = 340
      Top = 14
      Width = 81
      Height = 25
      Caption = '&Procesar'
      TabOrder = 2
      OnClick = btnProcesarClick
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 116
    Width = 437
    Height = 33
    Align = alBottom
    Color = clTeal
    TabOrder = 1
    object CmdCerrar: TBitBtn
      Left = 357
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
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
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 437
    Height = 64
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 66
      Height = 13
      Caption = 'Comprobante:'
    end
    object edComprobante: TEdit
      Left = 80
      Top = 4
      Width = 353
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object pgb: TProgressBar
      Left = 8
      Top = 27
      Width = 425
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 1
    end
    object pgb2: TProgressBar
      Left = 8
      Top = 45
      Width = 425
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 2
    end
  end
  object IBQcomprobante: TIBQuery
    SQL.Strings = (
      
        'SELECT * FROM "con$comprobante" c WHERE c.FECHADIA BETWEEN :FECH' +
        'ADESDE and :FECHAHASTA and c.ESTADO = '#39'C'#39)
    Left = 8
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHADESDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHAHASTA'
        ParamType = ptUnknown
      end>
  end
  object IBQauxiliar: TIBQuery
    SQL.Strings = (
      'SELECT '
      '* '
      'FROM '
      '"con$auxiliar" a'
      'WHERE'
      'a.ID_COMPROBANTE = :ID_COMPROBANTE')
    Left = 40
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_COMPROBANTE'
        ParamType = ptUnknown
      end>
  end
  object IBQcodigo: TIBQuery
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM'
      'CON$PARALELO p'
      'WHERE'
      'p.COLGAAP = :COLGAAP')
    Left = 72
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COLGAAP'
        ParamType = ptUnknown
      end>
  end
  object IBQinscomprobante: TIBQuery
    SQL.Strings = (
      'INSERT INTO CON$COMPROBANTE '
      '('
      'ID_COMPROBANTE,'
      'ID_AGENCIA,'
      'TIPO_COMPROBANTE,'
      'FECHADIA,'
      'DESCRIPCION,'
      'TOTAL_DEBITO,'
      'TOTAL_CREDITO,'
      'ESTADO,'
      'IMPRESO,'
      'ANULACION,'
      'ID_EMPLEADO'
      ')'
      'VALUES'
      '('
      ':ID_COMPROBANTE,'
      ':ID_AGENCIA,'
      ':TIPO_COMPROBANTE,'
      ':FECHADIA,'
      ':DESCRIPCION,'
      ':TOTAL_DEBITO,'
      ':TOTAL_CREDITO,'
      ':ESTADO,'
      ':IMPRESO,'
      ':ANULACION,'
      ':ID_EMPLEADO'
      ')')
    Left = 104
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_COMPROBANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_COMPROBANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHADIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPCION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TOTAL_DEBITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TOTAL_CREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IMPRESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANULACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_EMPLEADO'
        ParamType = ptUnknown
      end>
  end
  object IBQinsauxiliar: TIBQuery
    SQL.Strings = (
      'INSERT INTO CON$AUXILIAR '
      '('
      'TIPO_COMPROBANTE,'
      'ID_COMPROBANTE,'
      'ID_AGENCIA,'
      'FECHA,'
      'CODIGO,'
      'DEBITO,'
      'CREDITO,'
      'ID_CUENTA,'
      'ID_COLOCACION,'
      'ID_IDENTIFICACION,'
      'ID_PERSONA,'
      'MONTO_RETENCION,'
      'TASA_RETENCION,'
      'ESTADOAUX'
      ')'
      'VALUES'
      '('
      ':TIPO_COMPROBANTE,'
      ':ID_COMPROBANTE,'
      ':ID_AGENCIA,'
      ':FECHA,'
      ':CODIGO,'
      ':DEBITO,'
      ':CREDITO,'
      ':ID_CUENTA,'
      ':ID_COLOCACION,'
      ':ID_IDENTIFICACION,'
      ':ID_PERSONA,'
      ':MONTO_RETENCION,'
      ':TASA_RETENCION,'
      ':ESTADOAUX'
      ')')
    Left = 134
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TIPO_COMPROBANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COMPROBANTE'
        ParamType = ptUnknown
      end
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
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COLOCACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MONTO_RETENCION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TASA_RETENCION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADOAUX'
        ParamType = ptUnknown
      end>
  end
  object IBQbuscacomprobante: TIBQuery
    SQL.Strings = (
      'SELECT * FROM CON$COMPROBANTE c'
      'WHERE'
      'c.TIPO_COMPROBANTE = :TIPO_COMPROBANTE and'
      'c.ID_COMPROBANTE = :ID_COMPROBANTE')
    Left = 200
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TIPO_COMPROBANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COMPROBANTE'
        ParamType = ptUnknown
      end>
  end
end
