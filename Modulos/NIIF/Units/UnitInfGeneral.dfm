object FrmInfGeneral: TFrmInfGeneral
  Left = 76
  Top = 188
  Width = 633
  Height = 332
  BorderIcons = [biSystemMenu]
  Caption = 'FrmInfGeneral'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 625
    Height = 97
    Caption = 'Actividad Economica'
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 43
      Width = 52
      Height = 13
      Caption = 'Ocupacion'
    end
    object Label2: TLabel
      Left = 331
      Top = 43
      Width = 44
      Height = 13
      Caption = 'Profesion'
    end
    object Label3: TLabel
      Left = 8
      Top = 66
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label4: TLabel
      Left = 332
      Top = 66
      Width = 28
      Height = 13
      Caption = 'Cargo'
    end
    object Label5: TLabel
      Left = 10
      Top = 21
      Width = 40
      Height = 13
      Caption = 'Estudios'
    end
    object Label6: TLabel
      Left = 332
      Top = 21
      Width = 41
      Height = 13
      Caption = 'Vivienda'
    end
    object Ocupacion: TEdit
      Left = 65
      Top = 41
      Width = 246
      Height = 21
      TabOrder = 0
      Text = 'Ocupacion'
    end
    object Profesion: TEdit
      Left = 381
      Top = 41
      Width = 227
      Height = 21
      TabOrder = 1
    end
    object Empresa: TEdit
      Left = 65
      Top = 64
      Width = 247
      Height = 21
      TabOrder = 2
    end
    object Cargo: TEdit
      Left = 381
      Top = 64
      Width = 227
      Height = 21
      TabOrder = 3
    end
    object DBestudio: TDBLookupComboBox
      Left = 65
      Top = 19
      Width = 247
      Height = 21
      KeyField = 'ID_NIVEL'
      ListField = 'DESCRIPCION_NIVEL'
      ListSource = DSestudio
      TabOrder = 4
    end
    object DBvivienda: TDBLookupComboBox
      Left = 381
      Top = 19
      Width = 228
      Height = 21
      KeyField = 'ID_TIPOVIVIENDA'
      ListField = 'DESCRIPCION_TIPO'
      ListSource = DSvivienda
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 264
    Width = 625
    Height = 33
    Color = clOlive
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 275
      Top = 4
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
  object PageControl1: TPageControl
    Left = 0
    Top = 96
    Width = 625
    Height = 169
    ActivePage = TabSheet3
    TabIndex = 2
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Bienes Raices'
      object DBGrid2: TDBGrid
        Left = 4
        Top = 1
        Width = 609
        Height = 137
        DataSource = DSbien
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
            FieldName = 'DESCRIPCION_BIEN'
            Title.Caption = 'Descripci'#243'n'
            Width = 282
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BARRIO'
            Title.Caption = 'Barrio'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DIRECCION'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CIUDAD'
            Title.Caption = 'Ciudad'
            Width = 174
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_COMERCIAL'
            Title.Caption = 'Valor'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ES_HIPOTECA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'AFAVORDE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_IDENTIFICACION'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_PERSONA'
            Visible = False
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Vehiculos y/o Maquinaria'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 5
        Top = 1
        Width = 604
        Height = 136
        DataSource = DataSource1
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
            FieldName = 'ID_VEHICULO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NUMERO_PLACA'
            Title.Caption = 'Placa'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 219
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PIGNORADO'
            Title.Caption = 'Pignorado'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'VALOR_COMERCIAL'
            Title.Caption = 'Valor'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_IDENTIFICACION'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_PERSONA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'MARCA'
            Title.Caption = 'Marca'
            Width = 125
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Informaci'#243'n Crediticia'
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 8
        Top = 0
        Width = 601
        Height = 137
        DataSource = DScrediticia
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ENTIDAD'
            Title.Caption = 'Entidad'
            Width = 184
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_INICIAL'
            Title.Caption = 'Valor Inicial'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO'
            Title.Caption = 'Saldo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUOTA_MENSUAL'
            Title.Caption = 'Cuota Mensual'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VENCIMIENTO'
            Title.Caption = 'Vencimiento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_PERSONA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_IDENTIFICACION'
            Visible = False
          end>
      end
    end
  end
  object IBvehiculo: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$vehiculo"'
      'where  ID_IDENTIFICACION = :ID_IDENTIFICACION'
      'and  ID_PERSONA = :ID_PERSONA')
    Left = 312
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end>
    object IBvehiculoID_VEHICULO: TIntegerField
      FieldName = 'ID_VEHICULO'
      Origin = '"gen$vehiculo"."ID_VEHICULO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBvehiculoNUMERO_PLACA: TIBStringField
      FieldName = 'NUMERO_PLACA'
      Origin = '"gen$vehiculo"."NUMERO_PLACA"'
    end
    object IBvehiculoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = '"gen$vehiculo"."DESCRIPCION"'
      Size = 50
    end
    object IBvehiculoPIGNORADO: TSmallintField
      FieldName = 'PIGNORADO'
      Origin = '"gen$vehiculo"."PIGNORADO"'
    end
    object IBvehiculoVALOR_COMERCIAL: TIBBCDField
      FieldName = 'VALOR_COMERCIAL'
      Origin = '"gen$vehiculo"."VALOR_COMERCIAL"'
      currency = True
      Precision = 18
      Size = 1
    end
    object IBvehiculoID_IDENTIFICACION: TSmallintField
      FieldName = 'ID_IDENTIFICACION'
      Origin = '"gen$vehiculo"."ID_IDENTIFICACION"'
    end
    object IBvehiculoID_PERSONA: TIBStringField
      FieldName = 'ID_PERSONA'
      Origin = '"gen$vehiculo"."ID_PERSONA"'
      Size = 15
    end
    object IBvehiculoMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = '"gen$vehiculo"."MARCA"'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = IBvehiculo
    Left = 280
    Top = 48
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 280
    Top = 65528
  end
  object IBbienes: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$bienesraices"'
      'where  ID_IDENTIFICACION = :ID_IDENTIFICACION'
      'and ID_PERSONA = :ID_PERSONA and'
      'ID_SOLICITUD = :ID_SOLICITUD')
    Left = 312
    Top = 40
    ParamData = <
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
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end>
    object IBbienesDESCRIPCION_BIEN: TIBStringField
      FieldName = 'DESCRIPCION_BIEN'
      Origin = '"gen$bienesraices"."DESCRIPCION_BIEN"'
      Size = 150
    end
    object IBbienesBARRIO: TIBStringField
      FieldName = 'BARRIO'
      Origin = '"gen$bienesraices"."BARRIO"'
      Size = 50
    end
    object IBbienesDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = '"gen$bienesraices"."DIRECCION"'
      Size = 100
    end
    object IBbienesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = '"gen$bienesraices"."CIUDAD"'
      Size = 50
    end
    object IBbienesVALOR_COMERCIAL: TIBBCDField
      FieldName = 'VALOR_COMERCIAL'
      Origin = '"gen$bienesraices"."VALOR_COMERCIAL"'
      currency = True
      Precision = 18
      Size = 1
    end
    object IBbienesES_HIPOTECA: TSmallintField
      FieldName = 'ES_HIPOTECA'
      Origin = '"gen$bienesraices"."ES_HIPOTECA"'
    end
    object IBbienesAFAVORDE: TIBStringField
      FieldName = 'AFAVORDE'
      Origin = '"gen$bienesraices"."AFAVORDE"'
      Size = 100
    end
    object IBbienesID_IDENTIFICACION: TSmallintField
      FieldName = 'ID_IDENTIFICACION'
      Origin = '"gen$bienesraices"."ID_IDENTIFICACION"'
    end
    object IBbienesID_PERSONA: TIBStringField
      FieldName = 'ID_PERSONA'
      Origin = '"gen$bienesraices"."ID_PERSONA"'
      Size = 15
    end
  end
  object DSbien: TDataSource
    DataSet = IBbienes
    Left = 280
    Top = 16
  end
  object DScrediticia: TDataSource
    DataSet = IBcrediticia
    Left = 280
    Top = 80
  end
  object IBcrediticia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select *  from "gen$infcrediticia"'
      'where  ID_IDENTIFICACION = :ID_IDENTIFICACION'
      'and ID_PERSONA = :ID_PERSONA and'
      'ID_SOLICITUD = :ID_SOLICITUD'
      '')
    Left = 312
    Top = 80
    ParamData = <
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
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end>
  end
  object DSestudio: TDataSource
    DataSet = IBestudio
    Left = 280
    Top = 144
  end
  object DSvivienda: TDataSource
    DataSet = IBvivienda
    Left = 280
    Top = 112
  end
  object IBvivienda: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$tipovivienda"')
    Left = 312
    Top = 112
  end
  object IBestudio: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$nivelestudio"')
    Left = 312
    Top = 144
  end
end
