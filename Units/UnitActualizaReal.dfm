object frmActualizaReal: TfrmActualizaReal
  Left = 281
  Top = 246
  Width = 594
  Height = 241
  Caption = 'Modificar Garant'#237'a Real'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 177
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 13
      Width = 265
      Height = 13
      Caption = 'Digite el N'#250'mero de la Colocaci'#243'n y/o Pagar'#233' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdNumeroColocacion: TMaskEdit
      Left = 287
      Top = 8
      Width = 98
      Height = 24
      EditMask = '99999999999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 11
      ParentFont = False
      TabOrder = 0
      Text = '           '
      OnExit = EdNumeroColocacionExit
      OnKeyPress = EdNumeroColocacionKeyPress
    end
    object DBGridReal: TDBGrid
      Left = 16
      Top = 48
      Width = 553
      Height = 113
      DataSource = DSReal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnEditButtonClick = DBGridRealEditButtonClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMERO_ESCRITURA'
          ReadOnly = True
          Title.Caption = 'No. de ESCRITURA'
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ESCRITURA'
          ReadOnly = True
          Title.Caption = 'FECHA ESCRITURA'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_NOTARIA'
          ReadOnly = True
          Title.Caption = 'NOMBRE NOTARIA'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIUDAD_ESCRITURA'
          ReadOnly = True
          Title.Caption = 'CIUDAD ESCRITURA'
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MATRICULA_INMOBILIARIA'
          ReadOnly = True
          Title.Caption = 'MATRICULA INMOBILIARIA'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_REGISTRO'
          ReadOnly = True
          Title.Caption = 'FECHA REGISTRO'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AVALUO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_AVALUO'
          Title.Caption = 'FECHA AVALUO'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUENTAS_DE_ORDEN'
          Title.Caption = 'CUENTAS DE ORDEN'
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POLIZA_INCENDIO'
          Title.Caption = 'POLIZA INCENDIO'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_ASEGURADO'
          Title.Caption = 'VALOR ASEGURADO'
          Width = 100
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'FECHA_INICIAL_POLIZA'
          Title.Caption = 'FECHA INICIAL POLIZA'
          Width = 99
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'FECHA_FINAL_POLIZA'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 177
    Width = 586
    Height = 30
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object BtnAceptar: TBitBtn
      Left = 362
      Top = 4
      Width = 105
      Height = 25
      Caption = '&Aplicar Cambios'
      Enabled = False
      TabOrder = 0
      OnClick = BtnAceptarClick
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
    object BtnCerrar: TBitBtn
      Left = 482
      Top = 4
      Width = 97
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = BtnCerrarClick
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
  object DSReal: TDataSource
    DataSet = IBDSReal
    Left = 96
    Top = 176
  end
  object IBDSReal: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from "col$colgarantiasreal"'
      'where'
      '  "col$colgarantiasreal"."ID_AGENCIA" = :"OLD_ID_AGENCIA" and'
      
        '  "col$colgarantiasreal"."ID_COLOCACION" = :"OLD_ID_COLOCACION" ' +
        'and'
      
        '  "col$colgarantiasreal"."MATRICULA_INMOBILIARIA" = :"OLD_MATRIC' +
        'ULA_INMOBILIARIA" and'
      
        '  "col$colgarantiasreal"."NUMERO_ESCRITURA" = :"OLD_NUMERO_ESCRI' +
        'TURA"')
    InsertSQL.Strings = (
      'insert into "col$colgarantiasreal"'
      
        '  ("col$colgarantiasreal"."AVALUO", "col$colgarantiasreal"."CIUD' +
        'AD_ESCRITURA", '
      
        '   "col$colgarantiasreal"."CODIGO_ASEGURADORA", "col$colgarantia' +
        'sreal"."CUENTAS_DE_ORDEN", '
      
        '   "col$colgarantiasreal"."FECHA_AVALUO", "col$colgarantiasreal"' +
        '."FECHA_ESCRITURA", '
      
        '   "col$colgarantiasreal"."FECHA_FINAL_POLIZA", "col$colgarantia' +
        'sreal"."FECHA_INICIAL_POLIZA", '
      
        '   "col$colgarantiasreal"."FECHA_REGISTRO", "col$colgarantiasrea' +
        'l"."ID_AGENCIA", '
      
        '   "col$colgarantiasreal"."ID_COLOCACION", "col$colgarantiasreal' +
        '"."MATRICULA_INMOBILIARIA", '
      
        '   "col$colgarantiasreal"."NOMBRE_NOTARIA", "col$colgarantiasrea' +
        'l"."NUMERO_ESCRITURA", '
      
        '   "col$colgarantiasreal"."POLIZA_INCENDIO", "col$colgarantiasre' +
        'al"."VALOR_ASEGURADO")'
      'values'
      
        '  (:"AVALUO", :"CIUDAD_ESCRITURA", :"CODIGO_ASEGURADORA", :"CUEN' +
        'TAS_DE_ORDEN", '
      
        '   :"FECHA_AVALUO", :"FECHA_ESCRITURA", :"FECHA_FINAL_POLIZA", :' +
        '"FECHA_INICIAL_POLIZA", '
      
        '   :"FECHA_REGISTRO", :"ID_AGENCIA", :"ID_COLOCACION", :"MATRICU' +
        'LA_INMOBILIARIA", '
      
        '   :"NOMBRE_NOTARIA", :"NUMERO_ESCRITURA", :"POLIZA_INCENDIO", :' +
        '"VALOR_ASEGURADO")')
    RefreshSQL.Strings = (
      'Select '
      '  "col$colgarantiasreal"."ID_AGENCIA",'
      '  "col$colgarantiasreal"."ID_COLOCACION",'
      '  "col$colgarantiasreal"."NUMERO_ESCRITURA",'
      '  "col$colgarantiasreal"."FECHA_ESCRITURA",'
      '  "col$colgarantiasreal"."NOMBRE_NOTARIA",'
      '  "col$colgarantiasreal"."CIUDAD_ESCRITURA",'
      '  "col$colgarantiasreal"."MATRICULA_INMOBILIARIA",'
      '  "col$colgarantiasreal"."FECHA_REGISTRO",'
      '  "col$colgarantiasreal"."AVALUO",'
      '  "col$colgarantiasreal"."FECHA_AVALUO",'
      '  "col$colgarantiasreal"."CUENTAS_DE_ORDEN",'
      '  "col$colgarantiasreal"."POLIZA_INCENDIO",'
      '  "col$colgarantiasreal"."VALOR_ASEGURADO",'
      '  "col$colgarantiasreal"."FECHA_INICIAL_POLIZA",'
      '  "col$colgarantiasreal"."FECHA_FINAL_POLIZA",'
      '  "col$colgarantiasreal"."CODIGO_ASEGURADORA"'
      'from "col$colgarantiasreal" '
      'where'
      '  "col$colgarantiasreal"."ID_AGENCIA" = :"ID_AGENCIA" and'
      '  "col$colgarantiasreal"."ID_COLOCACION" = :"ID_COLOCACION"')
    SelectSQL.Strings = (
      'select * from "col$colgarantiasreal" where'
      '"col$colgarantiasreal"."ID_AGENCIA" =:"ID_AGENCIA" and'
      '"col$colgarantiasreal"."ID_COLOCACION" =:"ID_COLOCACION"')
    ModifySQL.Strings = (
      'update "col$colgarantiasreal"'
      'set'
      '  "col$colgarantiasreal"."AVALUO" = :"AVALUO",'
      
        '  "col$colgarantiasreal"."CIUDAD_ESCRITURA" = :"CIUDAD_ESCRITURA' +
        '",'
      
        '  "col$colgarantiasreal"."CODIGO_ASEGURADORA" = :"CODIGO_ASEGURA' +
        'DORA",'
      
        '  "col$colgarantiasreal"."CUENTAS_DE_ORDEN" = :"CUENTAS_DE_ORDEN' +
        '",'
      '  "col$colgarantiasreal"."FECHA_AVALUO" = :"FECHA_AVALUO",'
      '  "col$colgarantiasreal"."FECHA_ESCRITURA" = :"FECHA_ESCRITURA",'
      
        '  "col$colgarantiasreal"."FECHA_FINAL_POLIZA" = :"FECHA_FINAL_PO' +
        'LIZA",'
      
        '  "col$colgarantiasreal"."FECHA_INICIAL_POLIZA" = :"FECHA_INICIA' +
        'L_POLIZA",'
      '  "col$colgarantiasreal"."FECHA_REGISTRO" = :"FECHA_REGISTRO",'
      '  "col$colgarantiasreal"."ID_AGENCIA" = :"ID_AGENCIA",'
      '  "col$colgarantiasreal"."ID_COLOCACION" = :"ID_COLOCACION",'
      
        '  "col$colgarantiasreal"."MATRICULA_INMOBILIARIA" = :"MATRICULA_' +
        'INMOBILIARIA",'
      '  "col$colgarantiasreal"."NOMBRE_NOTARIA" = :"NOMBRE_NOTARIA",'
      
        '  "col$colgarantiasreal"."NUMERO_ESCRITURA" = :"NUMERO_ESCRITURA' +
        '",'
      '  "col$colgarantiasreal"."POLIZA_INCENDIO" = :"POLIZA_INCENDIO",'
      '  "col$colgarantiasreal"."VALOR_ASEGURADO" = :"VALOR_ASEGURADO"'
      'where'
      '  "col$colgarantiasreal"."ID_AGENCIA" = :"OLD_ID_AGENCIA" and'
      
        '  "col$colgarantiasreal"."ID_COLOCACION" = :"OLD_ID_COLOCACION" ' +
        'and'
      
        '  "col$colgarantiasreal"."MATRICULA_INMOBILIARIA" = :"OLD_MATRIC' +
        'ULA_INMOBILIARIA" and'
      
        '  "col$colgarantiasreal"."NUMERO_ESCRITURA" = :"OLD_NUMERO_ESCRI' +
        'TURA"')
    Left = 128
    Top = 176
    object IBDSRealID_AGENCIA: TSmallintField
      FieldName = 'ID_AGENCIA'
      Origin = '"col$colgarantiasreal"."ID_AGENCIA"'
      Required = True
    end
    object IBDSRealID_COLOCACION: TIBStringField
      FieldName = 'ID_COLOCACION'
      Origin = '"col$colgarantiasreal"."ID_COLOCACION"'
      Required = True
      FixedChar = True
      Size = 11
    end
    object IBDSRealNUMERO_ESCRITURA: TIBStringField
      FieldName = 'NUMERO_ESCRITURA'
      Origin = '"col$colgarantiasreal"."NUMERO_ESCRITURA"'
      Required = True
      Size = 30
    end
    object IBDSRealFECHA_ESCRITURA: TDateField
      FieldName = 'FECHA_ESCRITURA'
      Origin = '"col$colgarantiasreal"."FECHA_ESCRITURA"'
    end
    object IBDSRealNOMBRE_NOTARIA: TIBStringField
      FieldName = 'NOMBRE_NOTARIA'
      Origin = '"col$colgarantiasreal"."NOMBRE_NOTARIA"'
    end
    object IBDSRealCIUDAD_ESCRITURA: TIBStringField
      FieldName = 'CIUDAD_ESCRITURA'
      Origin = '"col$colgarantiasreal"."CIUDAD_ESCRITURA"'
      Size = 50
    end
    object IBDSRealMATRICULA_INMOBILIARIA: TIBStringField
      FieldName = 'MATRICULA_INMOBILIARIA'
      Origin = '"col$colgarantiasreal"."MATRICULA_INMOBILIARIA"'
      Size = 30
    end
    object IBDSRealFECHA_REGISTRO: TDateField
      FieldName = 'FECHA_REGISTRO'
      Origin = '"col$colgarantiasreal"."FECHA_REGISTRO"'
    end
    object IBDSRealAVALUO: TIBBCDField
      FieldName = 'AVALUO'
      Origin = '"col$colgarantiasreal"."AVALUO"'
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 3
    end
    object IBDSRealFECHA_AVALUO: TDateField
      FieldName = 'FECHA_AVALUO'
      Origin = '"col$colgarantiasreal"."FECHA_AVALUO"'
    end
    object IBDSRealCUENTAS_DE_ORDEN: TIBBCDField
      FieldName = 'CUENTAS_DE_ORDEN'
      Origin = '"col$colgarantiasreal"."CUENTAS_DE_ORDEN"'
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 3
    end
    object IBDSRealPOLIZA_INCENDIO: TIBStringField
      FieldName = 'POLIZA_INCENDIO'
      Origin = '"col$colgarantiasreal"."POLIZA_INCENDIO"'
      Size = 30
    end
    object IBDSRealVALOR_ASEGURADO: TIBBCDField
      FieldName = 'VALOR_ASEGURADO'
      Origin = '"col$colgarantiasreal"."VALOR_ASEGURADO"'
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 3
    end
    object IBDSRealFECHA_INICIAL_POLIZA: TDateField
      FieldName = 'FECHA_INICIAL_POLIZA'
      Origin = '"col$colgarantiasreal"."FECHA_INICIAL_POLIZA"'
    end
    object IBDSRealFECHA_FINAL_POLIZA: TDateField
      FieldName = 'FECHA_FINAL_POLIZA'
      Origin = '"col$colgarantiasreal"."FECHA_FINAL_POLIZA"'
    end
    object IBDSRealCODIGO_ASEGURADORA: TIBStringField
      FieldName = 'CODIGO_ASEGURADORA'
      Origin = '"col$colgarantiasreal"."CODIGO_ASEGURADORA"'
      FixedChar = True
      Size = 5
    end
  end
end
