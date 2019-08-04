object frmInformacionBancoldexEnte: TfrmInformacionBancoldexEnte
  Left = 184
  Top = 111
  Width = 461
  Height = 326
  Caption = 'Informacion Bancoldex'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 257
    Width = 453
    Height = 35
    Align = alBottom
    Color = clOlive
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 196
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = BitBtn1Click
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 453
    Height = 257
    TabOrder = 1
    object GroupBox19: TGroupBox
      Left = 1
      Top = -1
      Width = 440
      Height = 40
      Caption = 'Datos de Linea Bancoldex'
      TabOrder = 0
      object Label121: TLabel
        Left = 7
        Top = 15
        Width = 79
        Height = 13
        Caption = 'Linea Bancoldex'
      end
      object Label124: TLabel
        Left = 259
        Top = 15
        Width = 27
        Height = 13
        Caption = 'Saldo'
      end
      object EdSaldoB: TJvCurrencyEdit
        Left = 293
        Top = 13
        Width = 140
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 0
        HasMaxValue = False
        HasMinValue = False
        ClipBoardCommands = [caCopy]
      end
      object CBLineaB: TDBLookupComboBox
        Left = 89
        Top = 13
        Width = 159
        Height = 21
        KeyField = 'ID_LINEA'
        ListField = 'LINEA'
        ListSource = DSLineaB
        TabOrder = 1
        OnExit = CBLineaBExit
      end
    end
    object GroupBox20: TGroupBox
      Left = 2
      Top = 39
      Width = 441
      Height = 75
      Caption = 'Datos Entidad'
      TabOrder = 1
      object Label125: TLabel
        Left = 2
        Top = 14
        Width = 32
        Height = 13
        Caption = 'T Soc.'
      end
      object Label126: TLabel
        Left = 172
        Top = 14
        Width = 43
        Height = 13
        Caption = 'Emp. Act'
      end
      object Label127: TLabel
        Left = 296
        Top = 14
        Width = 74
        Height = 13
        Caption = 'Emp. a Generar'
      end
      object Label128: TLabel
        Left = 2
        Top = 46
        Width = 35
        Height = 13
        Caption = 'Activos'
      end
      object Label129: TLabel
        Left = 173
        Top = 47
        Width = 19
        Height = 13
        Caption = 'A'#241'o'
      end
      object Label1: TLabel
        Left = 296
        Top = 48
        Width = 25
        Height = 13
        Caption = 'Visita'
      end
      object EdEmpAct: TEdit
        Left = 218
        Top = 12
        Width = 48
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object EdEmpGen: TEdit
        Left = 381
        Top = 12
        Width = 48
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object EdActivos: TJvCurrencyEdit
        Left = 40
        Top = 44
        Width = 113
        Height = 21
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 2
        HasMaxValue = False
        HasMinValue = False
        ClipBoardCommands = [caCopy]
      end
      object EdFechaCorteActivos: TEdit
        Left = 219
        Top = 44
        Width = 46
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object EdSociedad: TEdit
        Left = 40
        Top = 12
        Width = 113
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object ChkVisita: TCheckBox
        Left = 328
        Top = 48
        Width = 17
        Height = 17
        TabOrder = 5
      end
      object EdFechaVisita: TDateTimePicker
        Left = 348
        Top = 46
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 38926.4670949074
        Time = 38926.4670949074
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 6
      end
    end
    object PaginaDesGarB: TPageControl
      Left = 4
      Top = 118
      Width = 441
      Height = 131
      ActivePage = InfoGarantiaB
      TabIndex = 1
      TabOrder = 2
      object InfoDestinoB: TTabSheet
        Caption = 'Destino'
        object DBDestinoB: TDBGrid
          Left = 8
          Top = 0
          Width = 417
          Height = 96
          TabStop = False
          DataSource = DSDestinoB
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NO'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESTINO'
              Width = 235
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO'
              Width = 130
              Visible = True
            end>
        end
      end
      object InfoGarantiaB: TTabSheet
        Caption = 'Garantias'
        ImageIndex = 1
        object DBGarantiaB: TDBGrid
          Left = 8
          Top = 0
          Width = 409
          Height = 96
          TabStop = False
          DataSource = DSGarantiaB
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NO'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLASEG'
              Title.Caption = 'CLASE'
              Width = 233
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORG'
              Title.Caption = 'VALOR'
              Width = 128
              Visible = True
            end>
        end
      end
    end
  end
  object CDBancoldex: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NO_BANCOLDEX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'EMPLEOS_ACT'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'EMPLEOS_GENERAR'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TOTAL_ACTIVOS'
        DataType = ftCurrency
      end
      item
        Name = 'FECHA_ACTIVOS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'LINEA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'VISITA'
        DataType = ftInteger
      end
      item
        Name = 'FECHA_VISITA'
        DataType = ftDate
      end
      item
        Name = 'TIPO_SOCIEDAD'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 856
    Top = 6
    Data = {
      2B0100009619E0BD0100000018000000090000000000030000002B010C4E4F5F
      42414E434F4C4445580100490000000100055749445448020002000F000B454D
      504C454F535F41435401004900000001000557494454480200020003000F454D
      504C454F535F47454E4552415201004900000001000557494454480200020003
      000D544F54414C5F41435449564F530800040000000100075355425459504502
      00490006004D6F6E6579000D46454348415F41435449564F5301004900000001
      00055749445448020002000400054C494E454101004900000001000557494454
      480200020004000656495349544104000100000000000C46454348415F564953
      49544104000600000000000D5449504F5F534F43494544414401004900000001
      000557494454480200020014000000}
    object CDBancoldexNO_BANCOLDEX: TStringField
      FieldName = 'NO_BANCOLDEX'
      Size = 15
    end
    object CDBancoldexEMPLEOS_ACT: TStringField
      FieldName = 'EMPLEOS_ACT'
      Size = 3
    end
    object CDBancoldexEMPLEOS_GENERAR: TStringField
      FieldName = 'EMPLEOS_GENERAR'
      Size = 3
    end
    object CDBancoldexTOTAL_ACTIVOS: TCurrencyField
      FieldName = 'TOTAL_ACTIVOS'
    end
    object CDBancoldexFECHA_ACTIVOS: TStringField
      FieldName = 'FECHA_ACTIVOS'
      Size = 4
    end
    object CDBancoldexLINEA: TStringField
      FieldName = 'LINEA'
      Size = 4
    end
    object CDBancoldexVISITA: TIntegerField
      FieldName = 'VISITA'
    end
    object CDBancoldexFECHA_VISITA: TDateField
      FieldName = 'FECHA_VISITA'
    end
    object CDBancoldexTIPO_SOCIEDAD: TStringField
      FieldName = 'TIPO_SOCIEDAD'
    end
  end
  object DSBancoldex: TDataSource
    DataSet = CDBancoldex
    Left = 832
    Top = 6
  end
  object CDDestinoB: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NO'
        DataType = ftInteger
      end
      item
        Name = 'DESTINO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MONTO'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 504
    Top = 16
    Data = {
      630000009619E0BD0100000018000000030000000000030000006300024E4F04
      000100000000000744455354494E4F0100490000000100055749445448020002
      001E00054D4F4E544F080004000000010007535542545950450200490006004D
      6F6E6579000000}
    object CDDestinoBNO: TIntegerField
      FieldName = 'NO'
    end
    object CDDestinoBDESTINO: TStringField
      DisplayWidth = 30
      FieldName = 'DESTINO'
      Size = 30
    end
    object CDDestinoBMONTO: TCurrencyField
      FieldName = 'MONTO'
    end
  end
  object DSDestinoB: TDataSource
    DataSet = CDDestinoB
    Left = 480
    Top = 16
  end
  object DSGarantiaB: TDataSource
    DataSet = CDGarantiaB
    Left = 480
    Top = 48
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 488
    Top = 88
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 512
    Top = 88
  end
  object CDGarantiaB: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NO'
        DataType = ftInteger
      end
      item
        Name = 'CLASEG'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VALORG'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 512
    Top = 48
    Data = {
      630000009619E0BD0100000018000000030000000000030000006300024E4F04
      0001000000000006434C41534547010049000000010005574944544802000200
      1E000656414C4F5247080004000000010007535542545950450200490006004D
      6F6E6579000000}
    object CDGarantiaBNO: TIntegerField
      FieldName = 'NO'
    end
    object CDGarantiaBCLASEG: TStringField
      DisplayWidth = 30
      FieldName = 'CLASEG'
      Size = 30
    end
    object CDGarantiaBVALORG: TCurrencyField
      FieldName = 'VALORG'
    end
  end
  object IBLineaB: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "col$creditosbancoldex" where saldo > 0')
    Left = 504
    Top = 184
  end
  object DSLineaB: TDataSource
    DataSet = IBLineaB
    Left = 480
    Top = 184
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "col$creditosbancoldex"')
    Left = 504
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 480
    Top = 136
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      
        'select ID_OBLIGACION, TASA_EA, MARGEN from "col$creditosbancolde' +
        'x" where linea = :Linea and id_obligacion = :obligacion')
    Transaction = dmGeneral.IBTransaction1
    Left = 544
    Top = 88
  end
end
