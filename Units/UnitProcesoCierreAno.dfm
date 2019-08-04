object frmCierreAno: TfrmCierreAno
  Left = 399
  Top = 164
  Width = 333
  Height = 447
  Caption = 'Proceso de Cierre de A'#241'o'
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
  object TLabel
    Left = 3
    Top = 360
    Width = 90
    Height = 13
    Caption = 'Inicio del Proceso: '
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 40
    Width = 305
    Height = 81
    Caption = 'Tablas de Contabilidad'
    Enabled = False
    TabOrder = 0
    object comprobante: TCheckBox
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'con$comprobante'
      TabOrder = 0
    end
    object auxiliar: TCheckBox
      Left = 8
      Top = 35
      Width = 113
      Height = 17
      Caption = 'CON$AUXILIAR'
      TabOrder = 1
    end
    object cajadiario: TCheckBox
      Left = 8
      Top = 54
      Width = 97
      Height = 17
      Caption = 'con$cajadiario'
      TabOrder = 2
    end
    object saldoscuenta: TCheckBox
      Left = 168
      Top = 16
      Width = 113
      Height = 17
      Caption = 'con$saldoscuenta'
      TabOrder = 3
    end
    object saldosiniciales: TCheckBox
      Left = 168
      Top = 35
      Width = 113
      Height = 17
      Caption = 'con$saldosiniciales'
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = -106
    Top = 0
    Width = 411
    Height = 36
    TabOrder = 1
    object Label1: TLabel
      Left = 133
      Top = 8
      Width = 122
      Height = 13
      Caption = 'Fecha para habilitar Cajas'
    end
    object DTfecha: TDateTimePicker
      Left = 261
      Top = 7
      Width = 91
      Height = 20
      CalAlignment = dtaLeft
      Date = 38563.4397889468
      Time = 38563.4397889468
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 123
    Width = 305
    Height = 86
    Caption = 'Tablas de Caja'
    Enabled = False
    TabOrder = 2
    object movimiento: TCheckBox
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'caj$movimiento'
      TabOrder = 0
    end
    object movimientocol: TCheckBox
      Left = 8
      Top = 35
      Width = 113
      Height = 17
      Caption = 'caj$movimientocol'
      TabOrder = 1
    end
    object cierres: TCheckBox
      Left = 8
      Top = 54
      Width = 97
      Height = 17
      Caption = 'caj$cierres'
      TabOrder = 2
    end
    object movsalida: TCheckBox
      Left = 160
      Top = 35
      Width = 121
      Height = 17
      Caption = 'caj$movremotosalida'
      TabOrder = 3
    end
    object moventrada: TCheckBox
      Left = 160
      Top = 54
      Width = 129
      Height = 17
      Caption = 'caj$movremotoentrada'
      TabOrder = 4
    end
    object cierressuc: TCheckBox
      Left = 160
      Top = 16
      Width = 119
      Height = 17
      Caption = 'caj$cierressucursal'
      TabOrder = 5
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 211
    Width = 305
    Height = 38
    Caption = 'Inicializacion de Tablas'
    Enabled = False
    TabOrder = 3
    object consecutivos: TCheckBox
      Left = 7
      Top = 15
      Width = 113
      Height = 17
      Caption = 'gen$consecutivos'
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 378
    Width = 325
    Height = 35
    Align = alBottom
    Color = clOlive
    TabOrder = 4
    object CmdCerrar: TBitBtn
      Left = 188
      Top = 5
      Width = 116
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
    object BTimportar: TBitBtn
      Left = 69
      Top = 5
      Width = 116
      Height = 25
      Caption = '&Ejecutar'
      Enabled = False
      TabOrder = 1
      OnClick = BTimportarClick
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
  object GroupBox4: TGroupBox
    Left = 0
    Top = 249
    Width = 305
    Height = 64
    Caption = 'Saldos Iniciales Captaciones'
    Enabled = False
    TabOrder = 5
    object Aportes: TCheckBox
      Left = 8
      Top = 16
      Width = 105
      Height = 17
      Caption = 'Aportes Sociales'
      TabOrder = 0
    end
    object Rindediario: TCheckBox
      Left = 8
      Top = 32
      Width = 113
      Height = 17
      Caption = 'Ahorro RindeDiario'
      TabOrder = 1
    end
    object Juvenil: TCheckBox
      Left = 136
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Ahorro Juvenil'
      TabOrder = 2
    end
    object Contractual: TCheckBox
      Left = 136
      Top = 32
      Width = 113
      Height = 17
      Caption = 'Ahorro Contractual'
      TabOrder = 3
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 320
    Width = 305
    Height = 33
    Caption = 'Cartera'
    Enabled = False
    TabOrder = 6
    object Provisiones: TCheckBox
      Left = 61
      Top = 10
      Width = 148
      Height = 17
      Caption = 'Traslado de Provisiones'
      TabOrder = 0
    end
  end
  object hi: TStaticText
    Left = 96
    Top = 356
    Width = 124
    Height = 19
    AutoSize = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvSpace
    BorderStyle = sbsSunken
    Color = clWhite
    ParentColor = False
    TabOrder = 7
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    GoToFirstRecordOnExecute = False
    Transaction = dmGeneral.IBTransaction1
    Left = 272
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 248
    Top = 8
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 272
    Top = 40
  end
  object IBSQL3: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 272
    Top = 72
  end
end
