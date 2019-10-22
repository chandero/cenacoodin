object frmAdministracionProductosVirtuales: TfrmAdministracionProductosVirtuales
  Left = 472
  Top = 128
  Width = 693
  Height = 514
  Caption = 'Administraci'#243'n de Productos Virtuales'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 673
    Height = 89
    Caption = 'Informaci'#243'n del Asociado'
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
    object CBTiposIdentificacion: TDBLookupComboBox
      Left = 6
      Top = 28
      Width = 165
      Height = 21
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DSTipoIdentificacion
      TabOrder = 0
    end
    object EdIdentificacion: TMemo
      Left = 174
      Top = 28
      Width = 147
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnExit = EdIdentificacionExit
    end
    object EdPrimerApellido: TLabeledEdit
      Left = 437
      Top = 8
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
      TabOrder = 2
    end
    object EdSegundoApellido: TLabeledEdit
      Left = 437
      Top = 36
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
      TabOrder = 3
    end
    object EdNombres: TLabeledEdit
      Left = 437
      Top = 64
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
      TabOrder = 4
    end
    object btnBuscar: TBitBtn
      Left = 324
      Top = 25
      Width = 21
      Height = 25
      TabOrder = 5
      OnClick = btnBuscarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
        73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
        8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
        9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
        A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
        AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
        BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
        D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
        E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
        F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
        424242424242424242422B39180B42424242424242424242424243443C180B42
        4242424242424242424242444438180B42424242424242424242424244433918
        0A424242424242424242424242444335004201101A114242424242424242453D
        05072F343434291942424242424242221A2D34343437403E0442424242424206
        231C303437404146284242424242421B210F30373A414140310D42424242421F
        20032434373A3A37321342424242421D25030F2D37373737311042424242420D
        2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
        4227312D21252314424242424242424242420E141B1B42424242}
    end
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 224
    Width = 673
    Height = 209
    Caption = 'Informaci'#243'n de Productos'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 17
      Width = 248
      Height = 13
      Caption = 'ATM - CAJERO AUTOMATICO - TARJETA DEBITO'
    end
    object Label2: TLabel
      Left = 8
      Top = 69
      Width = 133
      Height = 13
      Caption = 'POS - PUNTOS DE VENTA'
    end
    object Label3: TLabel
      Left = 331
      Top = 69
      Width = 100
      Height = 13
      Caption = 'N'#250'mero Operaciones'
    end
    object Label4: TLabel
      Left = 477
      Top = 71
      Width = 25
      Height = 13
      Caption = 'Tope'
    end
    object Label5: TLabel
      Left = 8
      Top = 115
      Width = 170
      Height = 13
      Caption = 'WEB - PORTAL TRANSACCIONAL'
    end
    object Label6: TLabel
      Left = 331
      Top = 113
      Width = 100
      Height = 13
      Caption = 'N'#250'mero Operaciones'
    end
    object Label7: TLabel
      Left = 477
      Top = 115
      Width = 25
      Height = 13
      Caption = 'Tope'
    end
    object Label8: TLabel
      Left = 8
      Top = 139
      Width = 105
      Height = 13
      Caption = 'MOV - BANCA MOVIL'
    end
    object Label9: TLabel
      Left = 331
      Top = 137
      Width = 100
      Height = 13
      Caption = 'N'#250'mero Operaciones'
    end
    object Label10: TLabel
      Left = 477
      Top = 139
      Width = 25
      Height = 13
      Caption = 'Tope'
    end
    object Label11: TLabel
      Left = 8
      Top = 163
      Width = 68
      Height = 13
      Caption = 'OFI - OFICINA'
    end
    object Label12: TLabel
      Left = 331
      Top = 161
      Width = 100
      Height = 13
      Caption = 'N'#250'mero Operaciones'
    end
    object Label13: TLabel
      Left = 477
      Top = 163
      Width = 25
      Height = 13
      Caption = 'Tope'
    end
    object Label14: TLabel
      Left = 8
      Top = 93
      Width = 129
      Height = 13
      Caption = 'IVR - AUDIO RESPUESTA'
    end
    object Label15: TLabel
      Left = 331
      Top = 91
      Width = 100
      Height = 13
      Caption = 'N'#250'mero Operaciones'
    end
    object Label16: TLabel
      Left = 477
      Top = 93
      Width = 25
      Height = 13
      Caption = 'Tope'
    end
    object Label17: TLabel
      Left = 8
      Top = 187
      Width = 177
      Height = 13
      Caption = 'CNB - CORRESPONSAL BANCARIO'
    end
    object Label18: TLabel
      Left = 331
      Top = 185
      Width = 100
      Height = 13
      Caption = 'N'#250'mero Operaciones'
    end
    object Label19: TLabel
      Left = 477
      Top = 184
      Width = 25
      Height = 13
      Caption = 'Tope'
    end
    object Label20: TLabel
      Left = 331
      Top = 37
      Width = 100
      Height = 13
      Caption = 'N'#250'mero Operaciones'
    end
    object Label21: TLabel
      Left = 477
      Top = 39
      Width = 25
      Height = 13
      Caption = 'Tope'
    end
    object edTarjetaDebito: TEdit
      Left = 263
      Top = 10
      Width = 209
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '0000000000000000000'
    end
    object btnReasignar: TBitBtn
      Left = 618
      Top = 9
      Width = 52
      Height = 25
      Caption = 'ReAsignar'
      Enabled = False
      TabOrder = 1
      OnClick = btnReasignarClick
    end
    object chkATM: TCheckBox
      Left = 263
      Top = 35
      Width = 66
      Height = 17
      Caption = 'Activar'
      Enabled = False
      TabOrder = 2
    end
    object edNopeATM: TJvIntegerEdit
      Left = 440
      Top = 36
      Width = 31
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 3
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object edTopeATM: TJvCurrencyEdit
      Left = 512
      Top = 36
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 4
      Value = 1
      HasMaxValue = False
      HasMinValue = False
    end
    object chkPOS: TCheckBox
      Left = 263
      Top = 67
      Width = 66
      Height = 17
      Caption = 'Activar'
      TabOrder = 5
    end
    object edNopePOS: TJvIntegerEdit
      Left = 440
      Top = 68
      Width = 31
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 6
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object edTopePOS: TJvCurrencyEdit
      Left = 512
      Top = 68
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 7
      Value = 1
      HasMaxValue = False
      HasMinValue = False
    end
    object chkIVR: TCheckBox
      Left = 263
      Top = 89
      Width = 66
      Height = 17
      Caption = 'Activar'
      TabOrder = 8
    end
    object edNopeIVR: TJvIntegerEdit
      Left = 440
      Top = 90
      Width = 31
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 9
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object edTopeIVR: TJvCurrencyEdit
      Left = 512
      Top = 90
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 10
      Value = 1
      HasMaxValue = False
      HasMinValue = False
    end
    object chkWEB: TCheckBox
      Left = 263
      Top = 111
      Width = 66
      Height = 17
      Caption = 'Activar'
      TabOrder = 11
    end
    object edNopeWEB: TJvIntegerEdit
      Left = 440
      Top = 112
      Width = 31
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 12
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object edTopeWEB: TJvCurrencyEdit
      Left = 512
      Top = 112
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 13
      Value = 1
      HasMaxValue = False
      HasMinValue = False
    end
    object chkMOV: TCheckBox
      Left = 263
      Top = 135
      Width = 66
      Height = 17
      Caption = 'Activar'
      TabOrder = 14
    end
    object edNopeMOV: TJvIntegerEdit
      Left = 440
      Top = 136
      Width = 31
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 15
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object edTopeMOV: TJvCurrencyEdit
      Left = 512
      Top = 136
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 16
      Value = 1
      HasMaxValue = False
      HasMinValue = False
    end
    object chkOFI: TCheckBox
      Left = 263
      Top = 159
      Width = 66
      Height = 17
      Caption = 'Activar'
      TabOrder = 17
    end
    object edNopeOFI: TJvIntegerEdit
      Left = 440
      Top = 160
      Width = 31
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 18
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object edTopeOFI: TJvCurrencyEdit
      Left = 512
      Top = 160
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 19
      Value = 1
      HasMaxValue = False
      HasMinValue = False
    end
    object chkCNB: TCheckBox
      Left = 263
      Top = 183
      Width = 66
      Height = 17
      Caption = 'Activar'
      TabOrder = 20
    end
    object edNopeCNB: TJvIntegerEdit
      Left = 440
      Top = 184
      Width = 31
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 21
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object edTopeCNB: TJvCurrencyEdit
      Left = 512
      Top = 184
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 22
      Value = 1
      HasMaxValue = False
      HasMinValue = False
    end
    object btnMarcar: TBitBtn
      Left = 512
      Top = 9
      Width = 49
      Height = 25
      Caption = '&Marcar'
      Enabled = False
      TabOrder = 23
      OnClick = btnMarcarClick
    end
    object btnFormato: TBitBtn
      Left = 565
      Top = 9
      Width = 49
      Height = 25
      Caption = '&Formato'
      Enabled = False
      TabOrder = 24
      OnClick = btnFormatoClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 1
    Top = 432
    Width = 673
    Height = 42
    Caption = 'Acciones'
    TabOrder = 2
    object btnGrabar: TBitBtn
      Left = 5
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 0
      OnClick = btnGrabarClick
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
    object CmdCerrar: TBitBtn
      Left = 595
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
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
    object BitBtn1: TBitBtn
      Left = 514
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 88
    Width = 673
    Height = 137
    Caption = 'Cuentas de Ahorro'
    TabOrder = 3
    object DBGCuentas: TDBGrid
      Left = 8
      Top = 16
      Width = 657
      Height = 113
      DataSource = DSCuentas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_AGENCIA'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_TIPO_CAPTACION'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 134
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_CUENTA'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIGITO_CUENTA'
          Width = 91
          Visible = True
        end>
    end
  end
  object DSCuentas: TDataSource
    DataSet = IBQCuentas
    Left = 96
    Top = 152
  end
  object IBQCuentas: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    AfterScroll = IBQCuentasAfterScroll
    SQL.Strings = (
      'SELECT * FROM "cap$maestrotitular" t'
      
        'INNER JOIN "cap$maestro" m ON m.ID_AGENCIA = t.ID_AGENCIA and m.' +
        'ID_TIPO_CAPTACION = t.ID_TIPO_CAPTACION and m.NUMERO_CUENTA = t.' +
        'NUMERO_CUENTA and m.DIGITO_CUENTA = t.DIGITO_CUENTA and t.TIPO_T' +
        'ITULAR = 1'
      
        'INNER JOIN "cap$tipocaptacion" c ON c.ID_TIPO_CAPTACION = m.ID_T' +
        'IPO_CAPTACION'
      
        'WHERE t.ID_TIPO_CAPTACION IN (2,3,4) and t.ID_IDENTIFICACION = :' +
        'ID_IDENTIFICACION and t.ID_PERSONA = :ID_PERSONA'
      'AND m.ID_ESTADO IN (1,3,4)'
      'ORDER BY m.ID_TIPO_CAPTACION, m.NUMERO_CUENTA')
    Left = 128
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
        Value = 3
      end
      item
        DataType = ftString
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
        Value = '5458997'
      end>
  end
  object IBQCanal: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM VIRTUAL_CANAL')
    Left = 200
    Top = 152
  end
  object IBQTarjeta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'SELECT FIRST 1 vt.VITA_ID, vt.VITA_TARJETA FROM VIRTUAL_CUENTA v' +
        'c'
      
        'INNER JOIN VIRTUAL_TARJETA_CUENTA vtc ON vtc.VICU_ID = vc.VICU_I' +
        'D'
      'INNER JOIN VIRTUAL_TARJETA vt ON vt.VITA_ID = vtc.VITA_ID'
      'WHERE '
      'vc.VICU_ID_AGENCIA = :ID_AGENCIA'
      'AND'
      'vc.VICU_TIPO_CUENTA = :ID_TIPO_CAPTACION'
      'AND'
      'vc.VICU_NUMERO_CUENTA = :NUMERO_CUENTA'
      'AND'
      'vc.VICU_DIGITO_CUENTA = :DIGITO_CUENTA'
      'AND vtc.VITC_ESTADO <> 9')
    Left = 200
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TIPO_CAPTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIGITO_CUENTA'
        ParamType = ptUnknown
      end>
  end
  object IBQGuardar: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 176
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VICU_ID'
        ParamType = ptUnknown
        Value = 0
      end>
    object IBQGuardarVICU_ID: TIntegerField
      FieldName = 'VICU_ID'
    end
  end
  object IBQCaptacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM VIRTUAL_CUENTA'
      'WHERE '
      'VICU_TIPO_CUENTA = :ID_TIPO_CAPTACION'
      'AND'
      'VICU_ID_AGENCIA = :ID_AGENCIA'
      'AND'
      'VICU_NUMERO_CUENTA = :NUMERO_CUENTA'
      'AND'
      'VICU_DIGITO_CUENTA = :DIGITO_CUENTA')
    Left = 240
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_TIPO_CAPTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIGITO_CUENTA'
        ParamType = ptUnknown
      end>
  end
  object IBQTipoIdentificacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM "gen$tiposidentificacion"')
    Left = 152
    Top = 56
  end
  object DSTipoIdentificacion: TDataSource
    DataSet = IBQTipoIdentificacion
    Left = 120
    Top = 56
  end
  object IBQCuentaCanal: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM VIRTUAL_CUENTA vc'
      'LEFT JOIN VIRTUAL_CUENTA_CANAL vcc ON vcc.VICU_ID = vc.VICU_ID'
      
        'WHERE vc.VICU_ID_AGENCIA = :ID_AGENCIA and vc.VICU_TIPO_CUENTA =' +
        ' :ID_TIPO_CAPTACION and'
      'vc.VICU_NUMERO_CUENTA = :NUMERO_CUENTA and'
      'vc.VICU_DIGITO_CUENTA = :DIGITO_CUENTA')
    Left = 272
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TIPO_CAPTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIGITO_CUENTA'
        ParamType = ptUnknown
      end>
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 560
    Top = 168
    ReportForm = {
      19000000B7010000190000000001000100FFFFFFFFFF01000000EA0A00006F08
      0000160000000E000000190000000B00000001FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000000E500000005004D656D6F3200020016000000A500000044
      020000140000000300000001000000000000000000FFFFFF1F2E020000000000
      010008005B4E4F4D4252455D00000000FFFF0000000000020000000100000000
      0500417269616C0008000000020000000000000000000100020000000000FFFF
      FF00000000020000000000000000006B01000005004D656D6F31000200180000
      00D4020000E0020000140000000300000001000000000000000000FFFFFF1F2E
      020000000000010008005B4E4F4D4252455D00000000FFFF0000000000020000
      0001000000000500417269616C00080000000200000000000000000001000200
      00000000FFFFFF000000000200000000000000FEFEFF0200000008002047656E
      6572616C0000000006004E4F4D425245000000000000000000000000FC000000
      000000000000000000000000004D000717B6C7545DE34025B713BA145EE540}
  end
  object IBQvCuenta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'SELECT COUNT(*) AS EXISTE FROM VIRTUAL_CUENTA vc WHERE vc.VICU_I' +
        'D_AGENCIA = :ID_AGENCIA and vc.VICU_TIPO_CUENTA = :ID_TIPO_CAPTA' +
        'CION and'
      'vc.VICU_NUMERO_CUENTA = :NUMERO_CUENTA and'
      'vc.VICU_DIGITO_CUENTA = :DIGITO_CUENTA')
    Left = 240
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TIPO_CAPTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIGITO_CUENTA'
        ParamType = ptUnknown
      end>
  end
  object frFormatoSolicitudTD: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 616
    Top = 176
    ReportForm = {19000000}
  end
  object IBQDireccion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT FIRST 1 * FROM "gen$direccion" d'
      'WHERE d.ID_IDENTIFICACION = :ID_IDENTIFICACION and'
      'd.ID_PERSONA = :ID_PERSONA and d.ID_DIRECCION = 1')
    Left = 128
    Top = 184
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
  end
end
