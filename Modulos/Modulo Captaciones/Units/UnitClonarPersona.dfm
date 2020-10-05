object frmClonarPersona: TfrmClonarPersona
  Left = 361
  Top = 270
  Width = 704
  Height = 225
  Caption = 'Clonar Persona'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 665
    Height = 97
    Caption = 'GroupBox1'
    TabOrder = 0
    object GroupBox8: TGroupBox
      Left = 0
      Top = 0
      Width = 343
      Height = 91
      Caption = 'Informaci'#243'n de la Identificaci'#243'n'
      TabOrder = 0
      object Label49: TLabel
        Left = 6
        Top = 16
        Width = 102
        Height = 13
        Caption = 'Tipo de Identificaci'#243'n'
      end
      object Label50: TLabel
        Left = 174
        Top = 14
        Width = 118
        Height = 13
        Caption = 'N'#250'mero de Identificaci'#243'n'
      end
      object Label52: TLabel
        Left = 7
        Top = 51
        Width = 82
        Height = 13
        Caption = 'Lugar Expedici'#243'n'
      end
      object Label53: TLabel
        Left = 183
        Top = 72
        Width = 86
        Height = 13
        Caption = 'Fecha Nacimiento'
      end
      object Label54: TLabel
        Left = 175
        Top = 51
        Width = 85
        Height = 13
        Caption = 'Fecha Expedici'#243'n'
      end
      object CBTiposIdentificacion: TDBLookupComboBox
        Left = 6
        Top = 28
        Width = 165
        Height = 21
        KeyField = 'ID_IDENTIFICACION'
        ListField = 'DESCRIPCION_IDENTIFICACION'
        ListSource = dmPersona.DStiposidentificacion
        TabOrder = 0
      end
      object EdIdentificacion: TMemo
        Left = 174
        Top = 27
        Width = 165
        Height = 21
        Alignment = taRightJustify
        TabOrder = 1
        WantReturns = False
        WordWrap = False
        OnExit = EdIdentificacionExit
      end
      object EdFechaExpedicion: TDateTimePicker
        Left = 176
        Top = 64
        Width = 163
        Height = 21
        CalAlignment = dtaLeft
        Date = 0.583911585701571
        Format = 'yyyy/MM/dd'
        Time = 0.583911585701571
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        Kind = dtkDate
        ParseInput = False
        TabOrder = 3
      end
      object EdLugarExpedicion: TEdit
        Left = 8
        Top = 63
        Width = 160
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 2
      end
    end
    object EdPrimerApellido: TLabeledEdit
      Left = 442
      Top = 4
      Width = 193
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = 'Primer Apellido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdSegundoApellido: TLabeledEdit
      Left = 442
      Top = 32
      Width = 193
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 83
      EditLabel.Height = 13
      EditLabel.Caption = 'Segundo Apellido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EdNombres: TLabeledEdit
      Left = 442
      Top = 61
      Width = 193
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 42
      EditLabel.Height = 13
      EditLabel.Caption = 'Nombres'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 104
    Width = 345
    Height = 65
    Caption = 'Nuevo Documento'
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 16
      Width = 102
      Height = 13
      Caption = 'Tipo de Identificaci'#243'n'
    end
    object Label2: TLabel
      Left = 174
      Top = 14
      Width = 118
      Height = 13
      Caption = 'N'#250'mero de Identificaci'#243'n'
    end
    object cbsNuevoTipo: TDBLookupComboBox
      Left = 6
      Top = 28
      Width = 165
      Height = 21
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = dmPersona.DStiposidentificacion
      TabOrder = 0
    end
    object edNuevoNumeroIdentificacion: TMemo
      Left = 174
      Top = 27
      Width = 165
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnExit = EdIdentificacionExit
    end
  end
  object Panel1: TPanel
    Left = 352
    Top = 128
    Width = 305
    Height = 37
    TabOrder = 2
    object btnClonar: TBitBtn
      Left = 6
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Clonar'
      TabOrder = 0
      OnClick = btnClonarClick
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
    object btnCerrar: TBitBtn
      Left = 230
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = btnCerrarClick
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
  object _ibq: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = _ibt
    Left = 144
    Top = 16
  end
  object _ibt: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 192
    Top = 16
  end
end
