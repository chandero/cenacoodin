object FrmMantenimientoGarantiaReal: TFrmMantenimientoGarantiaReal
  Left = 194
  Top = 248
  Width = 692
  Height = 427
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Mantenimiento Garantia Real'
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
    Width = 203
    Height = 48
    Caption = 'Tipo de Busqueda'
    TabOrder = 0
    object CbTipo: TComboBox
      Left = 2
      Top = 16
      Width = 196
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'COLOCACION'
      OnKeyPress = CbTipoKeyPress
      Items.Strings = (
        'COLOCACION'
        'MATRICULA')
    end
  end
  object GroupBox3: TGroupBox
    Left = 201
    Top = 0
    Width = 213
    Height = 48
    Caption = 'Filtro de Busqueda'
    TabOrder = 1
    object EdFiltro: TEdit
      Left = 4
      Top = 16
      Width = 173
      Height = 21
      TabOrder = 0
      OnKeyPress = EdFiltroKeyPress
    end
  end
  object GroupBox4: TGroupBox
    Left = 412
    Top = 0
    Width = 272
    Height = 48
    TabOrder = 2
    object BitBuscar: TBitBtn
      Left = 6
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Buscar'
      TabOrder = 0
      OnClick = BitBuscarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E000000010000000100004A7BB500296B
        C600527BC600186BD600528CD6003194D600397BE7005284E700107BEF00317B
        EF001084EF0029ADEF0039ADEF0010B5EF0008BDEF000073F7001873F7002973
        F7000884F7000894F70018A5F70000CEF70018DEF70063DEF700FF00FF000073
        FF00007BFF000084FF00008CFF000094FF00009CFF0000A5FF0010A5FF0039A5
        FF0052A5FF005AA5FF0000ADFF0029ADFF0031ADFF0000B5FF006BB5FF0084B5
        FF0000BDFF0008BDFF0010BDFF0000C6FF0008C6FF006BC6FF0000CEFF0018CE
        FF0000D6FF0008D6FF0010D6FF0021D6FF0031D6FF0000DEFF0018DEFF0029DE
        FF0042DEFF0000E7FF0010E7FF0018E7FF0039E7FF0000EFFF0018EFFF0039EF
        FF004AEFFF0000F7FF0008F7FF0029F7FF0031F7FF0042F7FF004AF7FF005AF7
        FF0000FFFF0008FFFF0018FFFF0021FFFF0031FFFF0039FFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
        1818181818181818181818181802181818181818181818181818181818090201
        18181818181818181818181818061A0F02181818181818181818181818181E1C
        1C0218181818181818181818181818271C1D0202181818181818181818181818
        272E1E1E02181818181818181818181818272B241E0218181818181818180202
        022D4B462C240202181818181818252D3F43434A42311F02181818181818212D
        3F433F374A4A412E021818181818182E3E42474C4A4A4B4D0218181818181818
        1836444A43322702181818181818181818181836433F241F0218181818181818
        1818181818363A34230218181818181818181818181818362202}
    end
    object BitBtn2: TBitBtn
      Left = 98
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Limpiar'
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000E0F00000E0F00000001000000010000FF00FF00B584
        8400B5948C00C6A59C00D6BDB500E7C6B500E7CECE0000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000020101010101010200000000000000000106060606
        0606010100000000000000010606060606060103010000000000000204040404
        0404010303010000000000000205050505050501030301000000000000020505
        0505050501030301000000000000020505050505050103030100000000000002
        0505050505050103010000000000000002050505050505010100000000000000
        0002050505050505010000000000000000000201010101010200000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object BitBtn3: TBitBtn
      Left = 186
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Cerrar'
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
  object GroupBox5: TGroupBox
    Left = 0
    Top = 45
    Width = 684
    Height = 142
    Caption = 'Resultado de la Busqueda'
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 1
      Top = 15
      Width = 680
      Height = 120
      DataSource = DataSource1
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'MATRICULA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_ESCRITURA'
          Title.Caption = 'ESCRITURA'
          Width = 72
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
          Title.Caption = 'F. AVALUO'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUENTAS_DE_ORDEN'
          Title.Caption = 'C. DE ORDEN'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POLIZA_INCENDIO'
          Title.Caption = 'POLIZA'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_ASEGURADO'
          Title.Caption = 'V. SEGURO'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_INICIAL_POLIZA'
          Title.Caption = 'F. INI. POLIZA'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_FINAL_POLIZA'
          Title.Caption = 'F.FIN.POLIZA'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_ASEGURADORA'
          Title.Caption = 'COD.ASEGU.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 56
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 184
    Width = 683
    Height = 209
    Caption = 'Cr'#233'ditos Respaldados'
    TabOrder = 4
    object DBGrid2: TDBGrid
      Left = 1
      Top = 15
      Width = 672
      Height = 186
      DataSource = DataSource2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_COLOCACION'
          Title.Caption = 'COLOCACION'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Caption = 'ASOCIADO'
          Width = 243
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO'
          Title.Caption = 'SALDO ACTUAL'
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION_CLASIFICACION'
          Title.Caption = 'CLASIFICACION'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION_ESTADO_COLOCACION'
          Title.Caption = 'ESTADO'
          Width = 82
          Visible = True
        end>
    end
  end
  object IBConsulta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    AfterOpen = IBConsultaAfterOpen
    Left = 728
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = IBConsulta
    Left = 760
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 760
    Top = 112
    object ActualizarGarantia1: TMenuItem
      Caption = 'Actualizar Garantia'
      OnClick = ActualizarGarantia1Click
    end
  end
  object DataSource2: TDataSource
    DataSet = IBQuery1
    Left = 744
    Top = 232
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    AfterOpen = IBQuery1AfterOpen
    SQL.Strings = (
      'SELECT '
      
        '  "gen$persona".NOMBRE || '#39' '#39' || "gen$persona".PRIMER_APELLIDO |' +
        '| '#39' '#39' || "gen$persona".SEGUNDO_APELLIDO AS NOMBRE,'
      '  "col$colocacion".ID_COLOCACION,'
      
        '  ("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_C' +
        'APITAL) AS SALDO,'
      '  "col$clasificacion".DESCRIPCION_CLASIFICACION,'
      '  "col$estado".DESCRIPCION_ESTADO_COLOCACION'
      'FROM'
      '  "col$garantiacol"'
      
        '  INNER JOIN "col$colocacion" ON ("col$garantiacol".ID_AGENCIA =' +
        ' "col$colocacion".ID_AGENCIA)'
      
        '  AND ("col$garantiacol".ID_COLOCACION = "col$colocacion".ID_COL' +
        'OCACION)'
      
        '  INNER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACIO' +
        'N = "gen$persona".ID_IDENTIFICACION)'
      '  AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)'
      
        '  INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFI' +
        'CACION = "col$clasificacion".ID_CLASIFICACION)'
      
        '  INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCAC' +
        'ION = "col$estado".ID_ESTADO_COLOCACION)'
      'WHERE'
      '  "col$garantiacol".MATRICULA = :MATRICULA AND '
      '  "col$colocacion".ID_AGENCIA = :ID_AGENCIA AND '
      '  "col$colocacion".ID_ESTADO_COLOCACION <= 2')
    Left = 784
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
end
