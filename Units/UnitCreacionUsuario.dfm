object FrmCreacionUsuarios: TFrmCreacionUsuarios
  Left = 148
  Top = 177
  Width = 489
  Height = 191
  BorderIcons = [biSystemMenu]
  Caption = 'Creaci'#243'n de Usuarios'
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
    Top = 35
    Width = 393
    Height = 33
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 87
      Height = 13
      Caption = 'Tipo Identificaci'#243'n'
    end
    object Label2: TLabel
      Left = 258
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Numero'
    end
    object DbTipo: TDBLookupComboBox
      Left = 108
      Top = 4
      Width = 145
      Height = 21
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DsTipo
      TabOrder = 0
      OnKeyPress = DbTipoKeyPress
    end
    object JvNumero: TJvEdit
      Left = 297
      Top = 4
      Width = 92
      Height = 21
      Alignment = taRightJustify
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 1
      OnExit = JvNumeroExit
      OnKeyPress = JvNumeroKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 68
    Width = 393
    Height = 56
    TabOrder = 3
    object JvStaticText4: TJvStaticText
      Left = 8
      Top = 7
      Width = 99
      Height = 17
      TextMargins.X = 0
      TextMargins.Y = 0
      Caption = 'Nombres y Apellidos'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      TabOrder = 0
      WordWrap = False
    end
    object JvNombre: TJvStaticText
      Left = 108
      Top = 4
      Width = 281
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 1
      WordWrap = False
    end
    object JvStaticText3: TJvStaticText
      Left = 8
      Top = 32
      Width = 93
      Height = 17
      TextMargins.X = 0
      TextMargins.Y = 0
      Caption = 'Numero de Cuenta'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      TabOrder = 2
      WordWrap = False
    end
    object JvCuenta: TJvStaticText
      Left = 108
      Top = 29
      Width = 87
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 3
      WordWrap = False
    end
    object JvStaticText6: TJvStaticText
      Left = 199
      Top = 32
      Width = 115
      Height = 17
      TextMargins.X = 0
      TextMargins.Y = 0
      Caption = 'Fecha de Actualizaci'#243'n'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      TabOrder = 4
      WordWrap = False
    end
    object JvFecha: TJvStaticText
      Left = 314
      Top = 28
      Width = 74
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 5
      WordWrap = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 124
    Width = 393
    Height = 31
    TabOrder = 4
    object JvStaticText2: TJvStaticText
      Left = 8
      Top = 8
      Width = 95
      Height = 17
      TextMargins.X = 0
      TextMargins.Y = 0
      Caption = 'Nombre de Usuario'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      TabOrder = 0
      WordWrap = False
    end
    object JvStaticText1: TJvStaticText
      Left = 198
      Top = 8
      Width = 113
      Height = 17
      TextMargins.X = 0
      TextMargins.Y = 0
      Caption = 'Contrase'#241'a de Entrada'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      TabOrder = 1
      WordWrap = False
    end
    object JvUsuario: TJvStaticText
      Left = 108
      Top = 5
      Width = 86
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 2
      WordWrap = False
    end
    object JVPass: TJvStaticText
      Left = 315
      Top = 4
      Width = 72
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 3
      WordWrap = False
    end
  end
  object Panel4: TPanel
    Left = 393
    Top = -1
    Width = 87
    Height = 157
    TabOrder = 2
    object bCrear: TBitBtn
      Left = 3
      Top = 8
      Width = 80
      Height = 25
      Caption = '&Crear'
      Enabled = False
      TabOrder = 0
      OnClick = bCrearClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000D30E0000D30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        108410189C1831A53139AD3939AD39107B103194292173185A5242736B5AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF21A52131AD314ABD4A52C652399C398C
        BD7B52BD5242BD422173184A4229FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        299C294ABD4A6BCE6B6BC66BF7FFEFF7FFEF63C66363CE6331A5314A6B39FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4ABD4A73CE7352A54AFFFFFFFF
        FFFF6BC66B73CE73319C31FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF18734A3984AD217BBD428CAD63BD63399C39FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF187BC6218CE7298CE721
        8CE7296B52FF00FFFF00FFFF00FF218429218429FF00FFFF00FFFF00FFFF00FF
        FF00FF297BAD399CFF399CFF399CFF399CFF298CE7395252FF00FFFF00FF94DE
        8C218429FF00FFFF00FFFF00FFFF00FFFF00FF2184C642A5FF42A5FF42A5FF42
        A5FF399CF7315A6B21842921842900EE0000C000218429218429FF00FFFF00FF
        6BA5C642A5F74AB5FF52B5FF52BDFF52B5FF4AADFF39739421842900EE0040FF
        4000EE0000C000218429FF00FFFF00FF5294BD42A5EF5ABDFF5ABDFF52B5F74A
        B5EF52B5F739738C21842921842900EE0000C000218429218429FF00FFFF00FF
        63849C2173A54A94C66BADD663ADF74A9CE7216BA5FF00FFFF00FFFF00FF00C0
        00218429FF00FFFF00FFFF00FFFF00FFFF00FF2173A56BADD68CBDE773BDE75A
        ADDE316B7BFF00FFFF00FFFF00FF218429218429FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6BA5BD4A94B54A8CAD63849CFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object bCancelar: TBitBtn
      Left = 3
      Top = 36
      Width = 80
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = bCancelarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B000000010000000100000031DE000031
        E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
        0404040404040404000004000004040404040404040404000004040000000404
        0404040404040000040404000000000404040404040000040404040402000000
        0404040400000404040404040404000000040000000404040404040404040400
        0101010004040404040404040404040401010204040404040404040404040400
        0201020304040404040404040404030201040403030404040404040404050203
        0404040405030404040404040303050404040404040303040404040303030404
        0404040404040403040403030304040404040404040404040404030304040404
        0404040404040404040404040404040404040404040404040404}
    end
    object BitBtn3: TBitBtn
      Left = 3
      Top = 65
      Width = 80
      Height = 25
      Caption = '&Salir'
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
  object Panel5: TPanel
    Left = 1
    Top = 0
    Width = 392
    Height = 34
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 11
      Width = 39
      Height = 13
      Caption = 'Agencia'
    end
    object Label4: TLabel
      Left = 258
      Top = 11
      Width = 36
      Height = 13
      Caption = 'Destino'
    end
    object dBAgencia: TDBLookupComboBox
      Left = 108
      Top = 8
      Width = 145
      Height = 21
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = DsAgencia
      TabOrder = 0
      OnExit = dBAgenciaExit
      OnKeyPress = dBAgenciaKeyPress
    end
    object JvDestino: TJvStaticText
      Left = 297
      Top = 8
      Width = 90
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 1
      WordWrap = False
    end
  end
  object IBAgencia: TIBQuery
    Database = DmPermiso.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$agencia"')
    Left = 8
    Top = 16
  end
  object DsAgencia: TDataSource
    DataSet = IBAgencia
    Left = 40
    Top = 24
  end
  object IBQuery1: TIBQuery
    Database = DmPermiso.IBDatabase1
    Transaction = DmPermiso.IBTransaction1
    Left = 8
    Top = 76
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = DmPermiso.IBDatabase1
    Left = 72
    Top = 56
  end
  object IBTipo: TIBQuery
    Database = DmPermiso.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM'
      ' "gen$tiposidentificacion"')
    Left = 48
    Top = 64
  end
  object DsTipo: TDataSource
    DataSet = IBTipo
    Left = 72
    Top = 16
  end
  object IBQuery2: TIBQuery
    Database = DmPermiso.IBDatabase1
    Transaction = DmPermiso.IBTransaction1
    Left = 24
    Top = 64
  end
  object IBseguro: TIBSecurityService
    TraceFlags = []
    Left = 48
    Top = 72
  end
  object IdTCPClient1: TIdTCPClient
    OnWork = IdTCPClient1Work
    OnWorkBegin = IdTCPClient1WorkBegin
    OnWorkEnd = IdTCPClient1WorkEnd
    Port = 0
    Left = 224
    Top = 8
  end
end
