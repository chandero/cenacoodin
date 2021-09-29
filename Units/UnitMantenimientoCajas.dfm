object frmMantenimientoCajas: TfrmMantenimientoCajas
  Left = 279
  Top = 217
  Width = 533
  Height = 315
  Caption = 'Mantenimiento de Cajas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 154
    Width = 47
    Height = 13
    Caption = 'Caja Nro.:'
  end
  object Label2: TLabel
    Left = 194
    Top = 154
    Width = 59
    Height = 13
    Caption = 'Descripci'#243'n:'
  end
  object Label3: TLabel
    Left = 196
    Top = 178
    Width = 39
    Height = 13
    Caption = 'Usuario:'
  end
  object Label4: TLabel
    Left = 2
    Top = 204
    Width = 53
    Height = 13
    Caption = 'Hora Inicial'
  end
  object Label5: TLabel
    Left = 152
    Top = 204
    Width = 48
    Height = 13
    Caption = 'Hora Final'
  end
  object Label6: TLabel
    Left = 2
    Top = 180
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 525
    Height = 145
    Align = alTop
    DataSource = DSCajas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'ID_CAJA'
        Title.Caption = 'Id'
        Width = 15
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ESTADO_CAJA'
        Title.Caption = 'Estado'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_EMPLEADO'
        Title.Caption = 'Cajero'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_INICIO'
        Title.Caption = 'Hora Inicial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_FINAL'
        Title.Caption = 'Hora Final'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo PUC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERVICAJA'
        Title.Caption = 'Es Servicaja'
        Visible = True
      end>
  end
  object EdCaja: TDBEdit
    Left = 52
    Top = 150
    Width = 43
    Height = 21
    DataField = 'ID_CAJA'
    DataSource = DSCajas
    TabOrder = 1
  end
  object EdDescripcion: TDBEdit
    Left = 256
    Top = 150
    Width = 266
    Height = 21
    DataField = 'DESCRIPCION'
    DataSource = DSCajas
    TabOrder = 2
  end
  object DBLCBEmpleados: TDBLookupComboBox
    Left = 255
    Top = 174
    Width = 267
    Height = 21
    DataField = 'ID_EMPLEADO'
    DataSource = DSCajas
    KeyField = 'ID_EMPLEADO'
    ListField = 'NOMBRE;PRIMER_APELLIDO;SEGUNDO_APELLIDO'
    ListSource = DSEmpleado
    TabOrder = 3
  end
  object EdHoraIni: TDBEdit
    Left = 62
    Top = 200
    Width = 81
    Height = 21
    DataField = 'HORA_INICIO'
    DataSource = DSCajas
    MaxLength = 8
    TabOrder = 4
  end
  object EdHoraFin: TDBEdit
    Left = 210
    Top = 200
    Width = 81
    Height = 21
    DataField = 'HORA_FINAL'
    DataSource = DSCajas
    MaxLength = 8
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 0
    Top = 250
    Width = 525
    Height = 31
    Align = alBottom
    Color = clOlive
    TabOrder = 6
    object CmdCerrar: TBitBtn
      Left = 446
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cerrar'
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
  object DBNavigator: TDBNavigator
    Left = 0
    Top = 225
    Width = 525
    Height = 25
    DataSource = DSCajas
    Align = alBottom
    TabOrder = 7
    OnClick = DBNavigatorClick
  end
  object EdServicaja: TDBCheckBox
    Left = 304
    Top = 202
    Width = 97
    Height = 17
    Caption = 'Es Servicaja'
    DataField = 'SERVICAJA'
    DataSource = DSCajas
    TabOrder = 8
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object EdCodigo: TDBEdit
    Left = 52
    Top = 174
    Width = 121
    Height = 21
    DataField = 'CODIGO'
    DataSource = DSCajas
    TabOrder = 9
  end
  object DSCajas: TDataSource
    DataSet = IBCajas
    Left = 330
    Top = 8
  end
  object DSEmpleado: TDataSource
    DataSet = IBEmpleado
    Left = 276
    Top = 12
  end
  object IBEmpleado: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$empleado"')
    Left = 278
    Top = 42
  end
  object IBCajas: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BeforePost = IBCajasBeforePost
    DeleteSQL.Strings = (
      'delete from CAJ$CAJAS'
      'where'
      '  CAJ$CAJAS."ID_CAJA" = :"OLD_ID_CAJA"')
    InsertSQL.Strings = (
      'insert into CAJ$CAJAS'
      
        '  (CAJ$CAJAS."CODIGO", CAJ$CAJAS."DESCRIPCION", CAJ$CAJAS.' +
        '"HORA_FINAL", '
      
        '   CAJ$CAJAS."HORA_INICIO", CAJ$CAJAS."ID_EMPLEADO", "caj$ca' +
        'jas"."ID_ESTADO_CAJA", '
      '   CAJ$CAJAS."SERVICAJA")'
      'values'
      
        '  (:"CODIGO", :"DESCRIPCION", :"HORA_FINAL", :"HORA_INICIO", :"I' +
        'D_EMPLEADO", '
      '   :"ID_ESTADO_CAJA", :"SERVICAJA")')
    RefreshSQL.Strings = (
      'Select '
      '  CAJ$CAJAS."ID_CAJA",'
      '  CAJ$CAJAS."DESCRIPCION",'
      '  CAJ$CAJAS."ID_ESTADO_CAJA",'
      '  CAJ$CAJAS."ID_EMPLEADO",'
      '  CAJ$CAJAS."HORA_INICIO",'
      '  CAJ$CAJAS."HORA_FINAL",'
      '  CAJ$CAJAS."CODIGO",'
      '  CAJ$CAJAS."SERVICAJA"'
      'from CAJ$CAJAS '
      'where'
      '  CAJ$CAJAS."ID_CAJA" = :"ID_CAJA"')
    SelectSQL.Strings = (
      'select * from CAJ$CAJAS order by ID_CAJA')
    ModifySQL.Strings = (
      'update CAJ$CAJAS'
      'set'
      '  CAJ$CAJAS."CODIGO" = :"CODIGO",'
      '  CAJ$CAJAS."DESCRIPCION" = :"DESCRIPCION",'
      '  CAJ$CAJAS."HORA_FINAL" = :"HORA_FINAL",'
      '  CAJ$CAJAS."HORA_INICIO" = :"HORA_INICIO",'
      '  CAJ$CAJAS."ID_EMPLEADO" = :"ID_EMPLEADO",'
      '  CAJ$CAJAS."ID_ESTADO_CAJA" = :"ID_ESTADO_CAJA",'
      '  CAJ$CAJAS."SERVICAJA" = :"SERVICAJA"'
      'where'
      '  CAJ$CAJAS."ID_CAJA" = :"OLD_ID_CAJA"')
    Left = 330
    Top = 40
    object IBCajasID_CAJA: TSmallintField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAJA'
      Origin = 'CAJ$CAJAS.ID_CAJA'
      Required = True
    end
    object IBCajasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CAJ$CAJAS.DESCRIPCION'
    end
    object IBCajasID_ESTADO_CAJA: TSmallintField
      DisplayLabel = 'ESTADO'
      FieldName = 'ID_ESTADO_CAJA'
      Origin = 'CAJ$CAJAS.ID_ESTADO_CAJA'
      Required = True
    end
    object IBCajasID_EMPLEADO: TIBStringField
      DisplayLabel = 'EMPLEADO'
      FieldName = 'ID_EMPLEADO'
      Origin = 'CAJ$CAJAS.ID_EMPLEADO'
      Size = 15
    end
    object IBCajasHORA_INICIO: TTimeField
      DisplayLabel = 'HORA INICIAL'
      FieldName = 'HORA_INICIO'
      Origin = 'CAJ$CAJAS.HORA_INICIO'
      Required = True
      DisplayFormat = 'hh:nn:ss'
      EditMask = '#0:00:00'
    end
    object IBCajasHORA_FINAL: TTimeField
      DisplayLabel = 'HORA FINAL'
      FieldName = 'HORA_FINAL'
      Origin = 'CAJ$CAJAS.HORA_FINAL'
      Required = True
      DisplayFormat = 'hh:nn:ss'
      EditMask = '#0:00:00'
    end
    object IBCajasCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'CAJ$CAJAS."CODIGO"'
      FixedChar = True
      Size = 18
    end
    object IBCajasSERVICAJA: TSmallintField
      FieldName = 'SERVICAJA'
      Origin = 'CAJ$CAJAS."SERVICAJA"'
      Required = True
      MaxValue = 1
    end
  end
end
