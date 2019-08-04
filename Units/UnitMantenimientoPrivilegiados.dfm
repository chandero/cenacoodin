object frmMantenimientoPrivilegiados: TfrmMantenimientoPrivilegiados
  Left = 204
  Top = 143
  Width = 633
  Height = 485
  Caption = 'Mantenimiento de Privilegiados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = -1
    Top = 0
    Width = 626
    Height = 183
    Caption = 'Informaci'#243'n del Privilegiado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object GridPrivilegiados: TDBGrid
      Left = 4
      Top = 24
      Width = 616
      Height = 131
      DataSource = DSPrivilegiados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnCellClick = GridPrivilegiadosCellClick
      OnColExit = GridPrivilegiadosColExit
      OnColumnMoved = GridPrivilegiadosColumnMoved
      OnDrawColumnCell = GridPrivilegiadosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_IDENTIFICACION_PRIV'
          Title.Alignment = taCenter
          Title.Caption = 'T. DOC'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_PERSONA_PRIV'
          Title.Alignment = taCenter
          Title.Caption = 'DOCUMENTO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRES_PRIV'
          Title.Alignment = taCenter
          Title.Caption = 'NOMBRES'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_AGENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'AGENCIA'
          Width = 60
          Visible = True
        end>
    end
    object ComboTipoIdPriv: TDBLookupComboBox
      Left = 16
      Top = 72
      Width = 142
      Height = 22
      DataField = 'ID_IDENTIFICACION_PRIV'
      DataSource = DSPrivilegiados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DmComprobante.Dstipoid
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object ComboAgenciaPriv: TDBLookupComboBox
      Left = 440
      Top = 72
      Width = 142
      Height = 22
      DataField = 'ID_AGENCIA'
      DataSource = DSPrivilegiados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = DmComprobante.Dsagencia
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object DBNavigator2: TDBNavigator
      Left = 180
      Top = 156
      Width = 252
      Height = 26
      DataSource = DSPrivilegiados
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Hints.Strings = (
        'Primer Registro'
        'Anterior Registro'
        'Pr'#243'ximo Registro'
        'Ultimo Registro'
        'Insertar '
        'Borrar '
        'Editar '
        'Grabar'
        'Cancelar'
        'Actualizar')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 422
    Width = 625
    Height = 29
    Align = alBottom
    Color = clOlive
    TabOrder = 2
    object CmdCerrar: TBitBtn
      Left = 545
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 0
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
    object BtnAplicar: TBitBtn
      Left = 457
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Aplicar'
      TabOrder = 1
      OnClick = BtnAplicarClick
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 182
    Width = 625
    Height = 238
    Caption = 'Parientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      625
      238)
    object GridParientes: TDBGrid
      Left = 4
      Top = 14
      Width = 616
      Height = 197
      DataSource = DSParientes
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColExit = GridParientesColExit
      OnDrawColumnCell = GridParientesDrawColumnCell
      Columns = <
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'ID_IDENTIFICACION_PAR'
          Title.Alignment = taCenter
          Title.Caption = 'T. DOC.'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_PERSONA_PARIENTE'
          Title.Alignment = taCenter
          Title.Caption = 'DOCUMENTO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRES'
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'ID_PARENTESCO'
          Title.Alignment = taCenter
          Title.Caption = 'PARENTESCO'
          Width = 80
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'ID_AGENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'AGENCIA'
          Width = 60
          Visible = True
        end>
    end
    object ComboParentesco: TDBLookupComboBox
      Left = 156
      Top = 72
      Width = 142
      Height = 22
      DataField = 'ID_PARENTESCO'
      DataSource = DSParientes
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyField = 'ID_PARENTESCO'
      ListField = 'DESCRIPCION_PARENTESCO'
      ListSource = DSParentesco
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object ComboAgencia: TDBLookupComboBox
      Left = 312
      Top = 72
      Width = 142
      Height = 22
      DataField = 'ID_AGENCIA'
      DataSource = DSParientes
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = DmComprobante.Dsagencia
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object DBNavigator1: TDBNavigator
      Left = 180
      Top = 212
      Width = 252
      Height = 26
      DataSource = DSParientes
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Anchors = [akLeft, akTop, akRight, akBottom]
      Hints.Strings = (
        'Primer Registro'
        'Anterior Registro'
        'Pr'#243'ximo Registro'
        'Ultimo Registro'
        'Insertar'
        'Borrar'
        'Editar'
        'Grabar'
        'Cancelar'
        'Actualizar')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      BeforeAction = DBNavigator1BeforeAction
    end
    object ComboTipoId: TDBLookupComboBox
      Left = 8
      Top = 72
      Width = 142
      Height = 22
      DataField = 'ID_IDENTIFICACION_PAR'
      DataSource = DSParientes
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DmComprobante.Dstipoid
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnKeyPress = ComboTipoIdKeyPress
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 262
    Top = 65527
  end
  object Parientes: TIBTable
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    BeforeEdit = ParientesBeforeEdit
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'ID_IDENTIFICACION_PRIV'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_PERSONA_PRIV'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ID_IDENTIFICACION_PAR'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_PERSONA_PARIENTE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ID_PARENTESCO'
        DataType = ftInteger
      end
      item
        Name = 'ID_AGENCIA'
        DataType = ftSmallint
      end>
    Filter = 'ID_PERSONA_PRIV = ID_PERSONA_PRIV'
    Filtered = True
    IndexDefs = <
      item
        Name = 'PK_gen$parientesprivilegiados'
        Fields = 
          'ID_IDENTIFICACION_PRIV;ID_PERSONA_PRIV;ID_IDENTIFICACION_PAR;ID_' +
          'PERSONA_PARIENTE'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'gen$parientesprivilegiados'
    Left = 313
    Top = 65529
    object ParientesID_IDENTIFICACION_PRIV: TSmallintField
      FieldName = 'ID_IDENTIFICACION_PRIV'
    end
    object ParientesID_PERSONA_PRIV: TIBStringField
      FieldName = 'ID_PERSONA_PRIV'
      Size = 15
    end
    object ParientesID_IDENTIFICACION_PAR: TSmallintField
      FieldName = 'ID_IDENTIFICACION_PAR'
      OnGetText = ParientesID_IDENTIFICACION_PARGetText
    end
    object ParientesID_PERSONA_PARIENTE: TIBStringField
      FieldName = 'ID_PERSONA_PARIENTE'
      Size = 15
    end
    object ParientesID_PARENTESCO: TIntegerField
      FieldName = 'ID_PARENTESCO'
      OnGetText = ParientesID_PARENTESCOGetText
    end
    object ParientesID_AGENCIA: TSmallintField
      FieldName = 'ID_AGENCIA'
      OnGetText = ParientesID_AGENCIAGetText
    end
    object ParientesNOMBRES: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOMBRES'
      OnGetText = ParientesNOMBRESGetText
      Calculated = True
    end
  end
  object DSParientes: TDataSource
    DataSet = Parientes
    Left = 336
    Top = 65528
  end
  object DSParentesco: TDataSource
    DataSet = IBParentesco
    Left = 440
    Top = 65528
  end
  object IBParentesco: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposparentesco"')
    Left = 416
    Top = 65528
  end
  object DSPrivilegiados: TDataSource
    DataSet = Privilegiados
    Left = 388
    Top = 65528
  end
  object Privilegiados: TIBTable
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    AfterScroll = PrivilegiadosAfterScroll
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'ID_IDENTIFICACION_PRIV'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_PERSONA_PRIV'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ID_AGENCIA'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_gen$privilegiados'
        Fields = 'ID_IDENTIFICACION_PRIV;ID_PERSONA_PRIV'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'gen$privilegiados'
    Left = 364
    Top = 65528
    object PrivilegiadosID_IDENTIFICACION_PRIV: TSmallintField
      FieldName = 'ID_IDENTIFICACION_PRIV'
      Required = True
      OnGetText = PrivilegiadosID_IDENTIFICACION_PRIVGetText
    end
    object PrivilegiadosID_PERSONA_PRIV: TIBStringField
      FieldName = 'ID_PERSONA_PRIV'
      Required = True
      Size = 15
    end
    object PrivilegiadosID_AGENCIA: TSmallintField
      FieldName = 'ID_AGENCIA'
      OnGetText = PrivilegiadosID_AGENCIAGetText
    end
    object PrivilegiadosNOMBRES_PRIV: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOMBRES_PRIV'
      OnGetText = PrivilegiadosNOMBRES_PRIVGetText
      Size = 200
      Calculated = True
    end
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 288
    Top = 65528
  end
  object IBDataParientes: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    ForcedRefresh = True
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from "gen$parientesprivilegiados"'
      'where'
      
        '  "gen$parientesprivilegiados"."ID_AGENCIA" = :"OLD_ID_AGENCIA" ' +
        'and'
      
        '  "gen$parientesprivilegiados"."ID_IDENTIFICACION_PAR" = :"OLD_I' +
        'D_IDENTIFICACION_PAR" and'
      
        '  "gen$parientesprivilegiados"."ID_IDENTIFICACION_PRIV" = :"OLD_' +
        'ID_IDENTIFICACION_PRIV" and'
      
        '  "gen$parientesprivilegiados"."ID_PARENTESCO" = :"OLD_ID_PARENT' +
        'ESCO" and'
      
        '  "gen$parientesprivilegiados"."ID_PERSONA_PARIENTE" = :"OLD_ID_' +
        'PERSONA_PARIENTE" and'
      
        '  "gen$parientesprivilegiados"."ID_PERSONA_PRIV" = :"OLD_ID_PERS' +
        'ONA_PRIV"')
    InsertSQL.Strings = (
      'insert into "gen$parientesprivilegiados"'
      
        '  ("gen$parientesprivilegiados"."ID_AGENCIA", "gen$parientespriv' +
        'ilegiados"."ID_IDENTIFICACION_PAR", '
      
        '   "gen$parientesprivilegiados"."ID_IDENTIFICACION_PRIV", "gen$p' +
        'arientesprivilegiados"."ID_PARENTESCO", '
      
        '   "gen$parientesprivilegiados"."ID_PERSONA_PARIENTE", "gen$pari' +
        'entesprivilegiados"."ID_PERSONA_PRIV")'
      'values'
      
        '  (:"ID_AGENCIA", :"ID_IDENTIFICACION_PAR", :"ID_IDENTIFICACION_' +
        'PRIV", '
      '   :"ID_PARENTESCO", :"ID_PERSONA_PARIENTE", :"ID_PERSONA_PRIV")')
    RefreshSQL.Strings = (
      'Select '
      '  "gen$parientesprivilegiados"."ID_IDENTIFICACION_PRIV",'
      '  "gen$parientesprivilegiados"."ID_PERSONA_PRIV",'
      '  "gen$parientesprivilegiados"."ID_IDENTIFICACION_PAR",'
      '  "gen$parientesprivilegiados"."ID_PERSONA_PARIENTE",'
      '  "gen$parientesprivilegiados"."ID_PARENTESCO",'
      '  "gen$parientesprivilegiados"."ID_AGENCIA"'
      'from "gen$parientesprivilegiados" '
      'where'
      '  "gen$parientesprivilegiados"."ID_AGENCIA" = :"ID_AGENCIA" and'
      
        '  "gen$parientesprivilegiados"."ID_IDENTIFICACION_PAR" = :"ID_ID' +
        'ENTIFICACION_PAR" and'
      
        '  "gen$parientesprivilegiados"."ID_IDENTIFICACION_PRIV" = :"ID_I' +
        'DENTIFICACION_PRIV" and'
      
        '  "gen$parientesprivilegiados"."ID_PARENTESCO" = :"ID_PARENTESCO' +
        '" and'
      
        '  "gen$parientesprivilegiados"."ID_PERSONA_PARIENTE" = :"ID_PERS' +
        'ONA_PARIENTE" and'
      
        '  "gen$parientesprivilegiados"."ID_PERSONA_PRIV" = :"ID_PERSONA_' +
        'PRIV"')
    SelectSQL.Strings = (
      'select * from "gen$parientesprivilegiados"')
    ModifySQL.Strings = (
      'update "gen$parientesprivilegiados"'
      'set'
      '  "gen$parientesprivilegiados"."ID_AGENCIA" = :"ID_AGENCIA",'
      
        '  "gen$parientesprivilegiados"."ID_IDENTIFICACION_PAR" = :"ID_ID' +
        'ENTIFICACION_PAR",'
      
        '  "gen$parientesprivilegiados"."ID_IDENTIFICACION_PRIV" = :"ID_I' +
        'DENTIFICACION_PRIV",'
      
        '  "gen$parientesprivilegiados"."ID_PARENTESCO" = :"ID_PARENTESCO' +
        '",'
      
        '  "gen$parientesprivilegiados"."ID_PERSONA_PARIENTE" = :"ID_PERS' +
        'ONA_PARIENTE",'
      
        '  "gen$parientesprivilegiados"."ID_PERSONA_PRIV" = :"ID_PERSONA_' +
        'PRIV"'
      'where'
      
        '  "gen$parientesprivilegiados"."ID_AGENCIA" = :"OLD_ID_AGENCIA" ' +
        'and'
      
        '  "gen$parientesprivilegiados"."ID_IDENTIFICACION_PAR" = :"OLD_I' +
        'D_IDENTIFICACION_PAR" and'
      
        '  "gen$parientesprivilegiados"."ID_IDENTIFICACION_PRIV" = :"OLD_' +
        'ID_IDENTIFICACION_PRIV" and'
      
        '  "gen$parientesprivilegiados"."ID_PARENTESCO" = :"OLD_ID_PARENT' +
        'ESCO" and'
      
        '  "gen$parientesprivilegiados"."ID_PERSONA_PARIENTE" = :"OLD_ID_' +
        'PERSONA_PARIENTE" and'
      
        '  "gen$parientesprivilegiados"."ID_PERSONA_PRIV" = :"OLD_ID_PERS' +
        'ONA_PRIV"')
    Filtered = True
    Left = 192
    Top = 65528
  end
end
