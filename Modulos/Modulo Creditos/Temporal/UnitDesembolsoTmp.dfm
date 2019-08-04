object FrmDesembolsoTmp: TFrmDesembolsoTmp
  Left = 308
  Top = 234
  Width = 661
  Height = 508
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Nueva ColocacionTmp'
  Color = clBtnFace
  UseDockManager = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 537
    Height = 74
    Caption = 'Informaci'#243'n del Asociado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 18
      Width = 75
      Height = 14
      Caption = 'T. Identificaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 293
      Top = 18
      Width = 73
      Height = 14
      Caption = 'No. Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 5
      Top = 45
      Width = 37
      Height = 14
      Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 293
      Top = 48
      Width = 40
      Height = 14
      Caption = 'Solicitud'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object CBtiposid: TDBLookupComboBox
      Left = 83
      Top = 16
      Width = 208
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DStipoid
      ParentFont = False
      TabOrder = 0
      OnEnter = CBtiposidEnter
      OnExit = CBtiposidExit
      OnKeyPress = CBtiposidKeyPress
    end
    object EdNombre: TEdit
      Left = 43
      Top = 43
      Width = 246
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EdNumeroIdentificacion: TMemo
      Left = 368
      Top = 14
      Width = 163
      Height = 22
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnExit = EdNumeroIdentificacionExit
      OnKeyPress = EdNumeroIdentificacionKeyPress
    end
    object DBsolicitud: TDBLookupComboBox
      Left = 340
      Top = 43
      Width = 115
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'ID_SOLICITUD'
      ListField = 'DESCRIPCION'
      ListSource = DataSource1
      ParentFont = False
      TabOrder = 3
      OnExit = DBsolicitudExit
      OnKeyPress = DBsolicitudKeyPress
    end
    object BitBuscar: TBitBtn
      Left = 457
      Top = 42
      Width = 75
      Height = 21
      Caption = '&Buscar'
      TabOrder = 4
      OnClick = BitBuscarClick
      OnKeyPress = BitBuscarKeyPress
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
    Top = 68
    Width = 652
    Height = 154
    Caption = 'Informaci'#243'n de la Colocaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = True
    object Label31: TLabel
      Left = 5
      Top = 14
      Width = 59
      Height = 13
      Caption = 'Clasificaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 110
      Top = 14
      Width = 28
      Height = 13
      Caption = 'L'#237'nea'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 245
      Top = 14
      Width = 43
      Height = 13
      Caption = 'Inversi'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label34: TLabel
      Left = 369
      Top = 14
      Width = 45
      Height = 13
      Caption = 'Respaldo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label35: TLabel
      Left = 432
      Top = 14
      Width = 42
      Height = 13
      Caption = 'Garant'#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label37: TLabel
      Left = 519
      Top = 14
      Width = 80
      Height = 13
      Caption = 'Valor Colocaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label38: TLabel
      Left = 104
      Top = 49
      Width = 55
      Height = 13
      Caption = 'Plazo(D'#237'as)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label39: TLabel
      Left = 291
      Top = 82
      Width = 40
      Height = 13
      Caption = 'Tasa Ef.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label41: TLabel
      Left = 259
      Top = 49
      Width = 67
      Height = 13
      Caption = 'Tipo de Cuota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label42: TLabel
      Left = 168
      Top = 49
      Width = 43
      Height = 13
      Caption = 'Amt. Cap'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label43: TLabel
      Left = 216
      Top = 49
      Width = 36
      Height = 13
      Caption = 'Amt. Int'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label46: TLabel
      Left = 2
      Top = 82
      Width = 48
      Height = 13
      Caption = 'Tipo Tasa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label47: TLabel
      Left = 123
      Top = 82
      Width = 46
      Height = 13
      Caption = 'Tasa Var.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label48: TLabel
      Left = 229
      Top = 84
      Width = 48
      Height = 13
      Caption = 'Ptos Adic.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label51: TLabel
      Left = 351
      Top = 82
      Width = 52
      Height = 13
      Caption = 'Tasa Nom.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label53: TLabel
      Left = 405
      Top = 49
      Width = 74
      Height = 13
      Caption = 'Ente Aprobador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 5
      Top = 48
      Width = 86
      Height = 13
      Caption = 'Fecha Colocaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 4
      Top = 116
      Width = 73
      Height = 13
      Caption = 'Fecha de Pago'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 617
      Top = -22
      Width = 93
      Height = 13
      Caption = 'N'#250'mero Colocaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 106
      Top = 116
      Width = 91
      Height = 13
      Caption = 'Fecha Vencimiento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 207
      Top = 115
      Width = 65
      Height = 13
      Caption = 'Fecha Capital'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 307
      Top = 115
      Width = 65
      Height = 13
      Caption = 'Fecha Interes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 519
      Top = 82
      Width = 73
      Height = 13
      Caption = 'No. Colocaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 593
      Top = 48
      Width = 44
      Height = 13
      Caption = 'P. Gracia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 415
      Top = 82
      Width = 55
      Height = 13
      Caption = 'Valor Cuota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 436
      Top = 116
      Width = 79
      Height = 14
      Caption = 'Cuenta  Aportes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 534
      Top = 114
      Width = 63
      Height = 13
      Caption = 'Nota Contab.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdFechaDesembolso: TDateTimePicker
      Left = 5
      Top = 61
      Width = 99
      Height = 21
      CalAlignment = dtaLeft
      Date = 37650.3339290741
      Time = 37650.3339290741
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 6
      TabStop = False
    end
    object EdFechaPago: TDateTimePicker
      Left = 4
      Top = 129
      Width = 110
      Height = 21
      CalAlignment = dtaLeft
      Date = 37650.3339290741
      Time = 37650.3339290741
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 20
      OnChange = EdFechaPagoChange
      OnExit = EdFechaPagoExit
      OnKeyPress = EdFechaPagoKeyPress
    end
    object EdNumeroColocacion: TEdit
      Left = 519
      Top = 95
      Width = 131
      Height = 21
      Color = clWhite
      Enabled = False
      ReadOnly = True
      TabOrder = 19
    end
    object EdFechaVencimiento: TDateTimePicker
      Left = 112
      Top = 129
      Width = 110
      Height = 21
      CalAlignment = dtaLeft
      Date = 37650.3339290741
      Time = 37650.3339290741
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 21
      TabStop = False
    end
    object EdFechaCapital: TDateTimePicker
      Left = 220
      Top = 128
      Width = 110
      Height = 21
      CalAlignment = dtaLeft
      Date = 37650.3339290741
      Time = 37650.3339290741
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 22
      TabStop = False
    end
    object EdFechaInteres: TDateTimePicker
      Left = 328
      Top = 128
      Width = 110
      Height = 21
      CalAlignment = dtaLeft
      Date = 37650.3339290741
      Time = 37650.3339290741
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 23
      TabStop = False
    end
    object EDclasificacion: TJvEdit
      Left = 5
      Top = 27
      Width = 103
      Height = 21
      TabStop = False
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 0
    end
    object EDlinea: TJvEdit
      Left = 109
      Top = 27
      Width = 134
      Height = 21
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 1
    end
    object EDinversion: TJvEdit
      Left = 243
      Top = 27
      Width = 126
      Height = 21
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 2
    end
    object EDrespaldo: TJvEdit
      Left = 368
      Top = 27
      Width = 63
      Height = 21
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 3
    end
    object EDgarantia: TJvEdit
      Left = 431
      Top = 27
      Width = 88
      Height = 21
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 4
    end
    object EDvalorcolocacion: TJvCurrencyEdit
      Left = 519
      Top = 27
      Width = 129
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      OnExit = EDvalorcolocacionExit
      OnKeyPress = EDvalorcolocacionKeyPress
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object EDplazo: TJvEdit
      Left = 103
      Top = 61
      Width = 61
      Height = 21
      TabStop = False
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 7
    end
    object EDamortizacap: TJvEdit
      Left = 165
      Top = 61
      Width = 46
      Height = 21
      TabStop = False
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 8
    end
    object EDamortizaint: TJvEdit
      Left = 212
      Top = 61
      Width = 46
      Height = 21
      TabStop = False
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 9
    end
    object EDpuntos: TJvEdit
      Left = 227
      Top = 95
      Width = 63
      Height = 21
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 15
      OnKeyPress = EDpuntosKeyPress
    end
    object EDtasaefectiva: TJvEdit
      Left = 290
      Top = 95
      Width = 63
      Height = 21
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 16
      OnExit = EDtasaefectivaExit
      OnKeyPress = EDtasaefectivaKeyPress
    end
    object EDtasanom: TJvEdit
      Left = 352
      Top = 95
      Width = 62
      Height = 21
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 17
      OnKeyPress = EDtasanomKeyPress
    end
    object EDtipocuota: TJvEdit
      Left = 257
      Top = 61
      Width = 147
      Height = 21
      TabStop = False
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 10
    end
    object Edenteaprobador: TJvEdit
      Left = 402
      Top = 61
      Width = 191
      Height = 21
      TabStop = False
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 11
    end
    object CBtasavariable: TDBLookupComboBox
      Left = 121
      Top = 95
      Width = 107
      Height = 21
      KeyField = 'ID_INTERES'
      ListField = 'DESCRIPCION_TASA'
      ListSource = dmColocacion.DStasavariable
      TabOrder = 14
      OnClick = CBtasavariableClick
      OnExit = CBtasavariableExit
      OnKeyPress = CBtasavariableKeyPress
    end
    object EDperiodogracia: TJvEdit
      Left = 592
      Top = 61
      Width = 58
      Height = 21
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 12
      OnEnter = EDperiodograciaEnter
      OnExit = EDperiodograciaExit
      OnKeyPress = EDperiodograciaKeyPress
    end
    object EdValorCuota: TStaticText
      Left = 413
      Top = 95
      Width = 107
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkTile
      Color = clMoneyGreen
      ParentColor = False
      TabOrder = 18
    end
    object Edcuentaaportes: TJvStaticText
      Left = 437
      Top = 128
      Width = 95
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentColor = False
      ParentFont = False
      TabOrder = 24
      WordWrap = False
    end
    object EdNotaContable: TMaskEdit
      Left = 533
      Top = 128
      Width = 116
      Height = 21
      TabStop = False
      Color = clActiveBorder
      ReadOnly = True
      TabOrder = 25
    end
    object Edtipotasa: TComboBox
      Left = 3
      Top = 95
      Width = 118
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 13
      OnEnter = EdTipoTasaEnter
      OnExit = EdtipotasaExit
      OnKeyPress = EdtipotasaKeyPress
      Items.Strings = (
        'FIJA'
        'VARIABLE')
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 445
    Width = 653
    Height = 29
    Align = alBottom
    Color = clOlive
    TabOrder = 2
    object cmdnuevo: TSpeedButton
      Left = 423
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Nuevo'
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000EFA54A00C684
        6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00CE9C7B00B584
        8400B58C8400CE9C8400B5948C00C6A59400EFCE9400F7CE9400C6A59C00EFCE
        9C00F7CE9C00F7D69C00C6ADA500CEADA500F7D6A500CEB5AD00D6B5AD00C6BD
        AD00F7D6AD00F7DEAD00D6BDB500DEBDB500DEC6B500E7C6B500EFC6B500EFCE
        B500F7D6B500F7DEB500FFDEB500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7
        C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
        DE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373709090909
        09090909090909090937373710302926231A16110E0E0E130937373710302C28
        26221611110E0E110937373714322E2C2826221A11110E110937373714332E2C
        292823221A11110E093737371736322E2E2C2826221A11110937373718383432
        2E2C2928261A1616093737371C383534312E2C292826221A093737371C383835
        34322E2C28262323093737371D3838383532312E2C282822093737371E383838
        3835323131302719093737371F383838383834342E0D0C0A093737371F383838
        383838362A0204000137373725383838383838382B070503373737371F353434
        343434342A070B37373737371F212121211F1F211C0637373737}
      OnClick = CmdNuevoClick
    end
    object CmdGrabar: TBitBtn
      Left = 498
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Grabar'
      TabOrder = 0
      OnClick = CmdGrabarClick
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
    object CmdCerrar: TBitBtn
      Left = 575
      Top = 2
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
    object CmdVerTabla: TBitBtn
      Left = 2
      Top = 2
      Width = 81
      Height = 25
      Hint = 'Ver Tabla de Liquidaci'#243'n'
      Caption = '&Ver Tabla'
      Enabled = False
      TabOrder = 2
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000420B0000420B00000001000000010000CE630000CE63
        6300FF9C9C00FFD6A500FFD6AD00FFDEB500FFE7C600FFEFD600FFF7E700FFFF
        F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000A0A0A0A0A0A
        0A0A0A0A0A0A0A0A0A0A0A0000000000000000000000000000000A000B0B0908
        070605040404040404000A000B010109010106010104010104000A000B0B0B0B
        090807060504040404000A000B01010B020208020205020204000A000B0B0B0B
        0B0B09080706050404000A000B01010B02020B020208020204000A000B0B0B0B
        0B0B0B0B0908070305000A000B01010B02020B02020B020206000A000B0B0B0B
        0B0B0B0B0B0B090807000A000B0B0B0B0B0B0B0B0B0B0B0908000A0000000000
        000000000000000000000A0A000000000000000000000000000A0A0A0A0A0A0A
        0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A}
    end
    object CmdInforme: TBitBtn
      Left = 84
      Top = 2
      Width = 103
      Height = 25
      Caption = 'Generar &Informe'
      Enabled = False
      TabOrder = 3
      OnClick = CmdInformeClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000181818002118
        21001821210031313100393939004242420052525200636363006B6B6B007373
        7300848484008C8C8C00948C8C00949494009C949400F7AD94009C9C9C00CE9C
        9C00F7AD9C00FFAD9C00FFB59C009C9CA500A5A5A500ADA5A500C6A5A500A5AD
        A500FFBDA500A5D6A500ADADAD00B5ADAD00FFC6AD00B5B5B500FFC6B500BDBD
        BD00C6BDBD00BDC6BD00E7C6BD00EFCEBD00FFCEBD00BDBDC600C6C6C600CEC6
        C600E7CEC600CECECE00D6CECE00DED6CE00FFDECE00D6D6D600FFE7D600D6DE
        DE00DEDEDE00EFE7DE00E7E7E700EFE7E700FFE7E700EFEFEF00F7EFEF00F7EF
        F700F7F7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003B3B3B3B3B3B
        103B3B3B0A0A0B3B3B3B3B3B3B3B10102C0D04060E282F0A3B3B3B3B10103A3C
        2F1005010103070A0B3B0C10373C3528100B0D0A07040201093B10343421161D
        22160D0C0D0E0B080A3B0D1C161C282F373732281C100C0D0B3B0C1C282B2832
        2B19212B2F2F281F0D3B3B102B2B32281F1B231817161F22163B3B3B10211C1C
        343837332F2B1F0D3B3B3B3B3B102F2B10212F2F2F281C3B3B3B3B3B3B3B362E
        24242A2D2B0D3B3B3B3B3B3B3B3B112E261E1A133B3B3B3B3B3B3B3B3B3B112E
        261E1A0F3B3B3B3B3B3B3B3B3B3B112E261E1A123B3B3B3B3B3B3B3B3B11302E
        261E1A123B3B3B3B3B3B3B3B3B1111111112123B3B3B3B3B3B3B}
    end
    object BTliquida: TBitBtn
      Left = 187
      Top = 2
      Width = 110
      Height = 25
      Caption = '&Liquidar Cuotas'
      TabOrder = 4
      OnClick = BTliquidaClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888F8800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
    end
    object BTcuotas: TBitBtn
      Left = 299
      Top = 2
      Width = 75
      Height = 25
      Caption = 'C&uotas'
      TabOrder = 5
      Visible = False
      OnClick = BTcuotasClick
    end
  end
  object JvGroupBox1: TJvGroupBox
    Left = 1
    Top = 218
    Width = 275
    Height = 46
    Caption = 'Informacion Descuentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object BTtotal: TBitBtn
      Left = 5
      Top = 15
      Width = 85
      Height = 25
      Caption = '&Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BTtotalClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000130B0000130B00000001000000010000005A00000084
        000000C6000042424200008484008484840084FF840000C6C600C6C6C600C6FF
        C600FF00FF0084FFFF00C6FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000A0A0A0A0A0A
        0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A05040404050A0A0A0A0A0A05040404
        05040C0B0B040A0A0A0A0A0A040C0B0B04050404040504050A0A0A0A05040404
        050A0A04080808040A0A0A0A0A0A0A0A0A0A0A04070707040A0A0A0000000000
        000000040808080400000A0001010202020202040707070401000A0001020606
        060303040D0B0B0401000A0002090906030808040404040602000A0002090909
        030C08080306060602000A0001020909090303030606060201000A0001010209
        090909060606020101000A0000000000000000000000000000000A0A0A0A0A0A
        0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A}
    end
    object BTparcial: TBitBtn
      Left = 95
      Top = 15
      Width = 85
      Height = 25
      Caption = '&Parcial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BTparcialClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000420B0000420B0000000100000001000000000000E162
        2300E4753E00BD8C7300BD847B00EFA54A00C6846B00CE947300C6947B00E88E
        6000EFB57300FFC67300FF00FF0029ADD600B5848400B58C8400B5948C00CE9C
        8400C6A59400C6A59C00C6ADA500CEB5AD00C6BDAD00D6B5AD00D6BDB500DEBD
        B500DEC6B500FFD6A500E7C6B500EFCEB500EFCEBD008CF7FF00E7CECE00E7DE
        C600E7D6CE00FFEFD600FFF7EF00FFF7F700FFFFFF0000000000000000000000
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
        00000000000000000000000000000000000000000000000000000C0C0E0E0E0E
        0E0E0E0E0E0E0E0E0E0C0C0C130D0D0D0D0D0D0D0D0D0D0D0E0C0C0C130D1F1F
        1F1F1F1F1F1F1F0D0E0C0C0C140D1F090909020201011F0D0E0C0C0C140D1F1F
        1F1F1F1F1F1F1F0D0E0C0C0C150D0D0D0D0D0D0D0D0D0D0D0E0C0C0C17262625
        25252525252524240E0C0C0C1826232323000000232323240E0C0C0C18261B1B
        1B1B001B1B1B1B250E0C0C0C1926262626260025252525250E0C0C0C1A262323
        23230023232321160E0C0C0C1C261B1B1B1B001B1B12100F0E0C0C0C1C262626
        2600002520030A05060C0C0C1E2626262626002622080B070C0C0C0C1C252424
        242424242008110C0C0C0C0C1C1D1D1D1D1C1C1D18040C0C0C0C}
    end
    object BTJudCas: TBitBtn
      Left = 185
      Top = 15
      Width = 85
      Height = 25
      Caption = '&Judicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BTJudCasClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF4A49494A49494A49494A49494A49494A49494A49494A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A49498E8F8FADABABB9B1AD51
        6481516481B9B1ACABA8A8949393474848FF00FFFF00FFFF00FFFF00FFFF00FF
        464646BEBABAC8C7C7C5C0BD6B7B9A00689B00689B6B7B9ADDD9D6BDBCBCB3AF
        AF474848FF00FFFF00FFFF00FF797A7A979595C0C0C0DDDAD86B7B9A00ACE800
        AFE200AFE2009FDB6B7B9ADCDAD9A9A6A69695954A4949FF00FFFF00FF797A7A
        ADAAAABDBBBBFCFFFF6B7B9A6B7B9A00689B00689B00AFE26D7E9DE9E5E1BEBD
        BDAEABAB4A4949FF00FFFF00FF797A7AA9A7A7C9C9C9EAEAE9D3E0EA6B7B9A00
        AFE200AFE200A1D9D4D6E1E8EAE9BCBBBBABA8A84A4949FF00FFFF00FF797A7A
        B1AEAEBBBABAF6F5F36B7B9A00AFE200A6D900689B6B7B9A6B7B9AEBE7E4AFAD
        ADADACAC4A4949FF00FFFF00FFFF00FF797A7AADA9A9DBD9D7C3C5D26B7B9A00
        AADD00AFE200ACE86B7B9ACECDCCACA9A94A4949FF00FFFF00FFFF00FFFF00FF
        797A7AAFAEAEC5C3C3E8E5E16B7B9A00689B00689B6B7B9ADBD8D5AAA5A5B2B1
        B14A4949FF00FFFF00FFFF00FFFF00FFFF00FF797A7A979494A6A2A2CFC7C34C
        5C794C5D79C8C1BCBBB7B79493934A4949FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF797A7A797A7A6A6A6A716E6B726F6B6A6A6A4747474A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF79797969
        67676969697D7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF8C8989CCCFD09195968F8D8DFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9A9AD6D4D3F3
        FDFFCBD2D5C8C4C47B7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF202020A5A5A5333333929090969494353535A8A8A8222222FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object JvGroupBox2: TJvGroupBox
    Left = 277
    Top = 218
    Width = 189
    Height = 46
    Caption = 'Informacion Garantias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object BTadmisible: TBitBtn
      Left = 8
      Top = 16
      Width = 85
      Height = 25
      Caption = '&Admisible'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BTadmisibleClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000230B0000230B00000001000000010000000000008484
        840042ADBD001094CE0042CEEF00FF00FF005ADEFF009CE7FF00ADF7FF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
        0303030303050505050505050505020204060606040303050505050505020407
        0707000606060403050505050204070707070007070606040305050502080707
        0707000707070606030505050208080707000000070707060305050502080808
        0701000107070706030505050204080808080707070707040305050505020202
        0202020202020202050505050505050505050505020703050505050505050303
        0305050502070305050505050505020703050505020703050505050505050207
        0305050502070305050505050505020404030303040403050505050505050502
        0407070704030505050505050505050502020202030505050505}
    end
    object BTnoadmisible: TBitBtn
      Left = 98
      Top = 16
      Width = 85
      Height = 25
      Caption = '&No Admisible'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BTnoadmisibleClick
      Glyph.Data = {
        AE030000424DAE03000000000000AE0200002800000010000000100000000100
        08000000000000010000D10E0000D10E00009E0000009E00000006600600066A
        060011580B000B840B000B8F0B001C401100118F1100312A1600234816002350
        1600167316001C7B1600168416001C841600169816002A401C002A481C002A50
        1C001C731C0023731C001C841C0023841C001C8F1C001C981C001CA11C003150
        23002A6A2300237B2300238423002398230023A1230040382A0038482A003858
        2A0031732A0031842A00318F2A002AAB2A00485031000B58310038733100388F
        310031AB310023383800165038004860380038A1380038AB380038B638005850
        400040B64000605848002A6A4800506A4800488F480048AB480048B6480048C0
        48001C40500058A1500050B6500050C050002A5058005898580058C0580058CA
        58001C5060007BA160006AAB600073AB600060C0600060CA600016506A001C50
        6A007B736A006AA16A002358730084A1730073AB730023587B0011508400406A
        8400486A840011508F0011588F001158980016609800236A98002A7398003173
        98000660A1001160A1002A73A100317BA1001160AB002A7BAB00387BAB003884
        AB00508FAB00CAE0AB000B60B600116AB600166AB6001673B6001C73B6002A73
        B600237BB6002A7BB600317BB600488FB600508FB600ABB6B600ABC0B600116A
        C0001173C0001673C0002373C000167BC000E0D4C000CAE0C0005098CA0050A1
        CA001C7BD4004098D4004898D4001173E0001673E0001C84E0003184E00058AB
        E00073ABE00073B6E00084C0E000167BEA002A8FEA0031A1EA0060ABEA0073B6
        EA00F4FFEA00167BF4001C84F4002384F4002A8FF4004898F40038A1F400FF00
        FF001C7BFF001C84FF002384FF00238FFF002A8FFF002A98FF003198FF0031A1
        FF0038A1FF0038ABFF0040ABFF00FFFFFF009191919191919191919191919191
        91919191919191919191919191919191919191910103161D1D000B021F319191
        9191919106172A301C452F2502079191919191910C2A3D3C8A8A383916199191
        91919191912A40299D9D3C401491919191919191919127575E58371C91919191
        919191919191647D7E7D2C9191919191919191919156949494947E2B91919191
        919191919165969696968D3A91919191919191916E8E999A9B9A984F91919191
        9191919160869C9C9087904C919191919191919152546C788F80539191919191
        9191919191547882817B429191919191919191919191625D5952919191919191
        919191919191919191919191919191919191}
    end
  end
  object Grupoinformacion: TGroupBox
    Left = 0
    Top = 262
    Width = 653
    Height = 181
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object DBGridReal: TDBGrid
      Left = 6
      Top = 15
      Width = 632
      Height = 153
      DataSource = DSgarantiareal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupReal
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnKeyPress = DBGridRealKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'numero_escritura'
          ReadOnly = True
          Title.Caption = 'No. de ESCRITURA'
          Title.Color = clActiveBorder
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fecha_escritura'
          ReadOnly = True
          Title.Caption = 'FECHA ESCRITURA'
          Title.Color = clActiveBorder
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nombre_notaria'
          ReadOnly = True
          Title.Caption = 'NOMBRE NOTARIA'
          Title.Color = clActiveBorder
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ciudad_notaria'
          ReadOnly = True
          Title.Caption = 'CIUDAD ESCRITURA'
          Title.Color = clActiveBorder
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'matricula'
          ReadOnly = True
          Title.Caption = 'MATRICULA INMOBILIARIA'
          Title.Color = clActiveBorder
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fecha_registro'
          ReadOnly = True
          Title.Caption = 'FECHA REGISTRO'
          Title.Color = clActiveBorder
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'avaluo'
          ReadOnly = True
          Title.Caption = 'AVALUO'
          Title.Color = clActiveBorder
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fecha_avaluo'
          ReadOnly = True
          Title.Caption = 'FECHA AVALUO'
          Title.Color = clActiveBorder
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cuentas_orden'
          ReadOnly = True
          Title.Caption = 'CUENTAS DE ORDEN'
          Title.Color = clActiveBorder
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'poliza_incendio'
          Title.Caption = 'POLIZA INCENDIO'
          Title.Color = clActiveBorder
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_asegurado'
          ReadOnly = True
          Title.Caption = 'VALOR ASEGURADO'
          Title.Color = clActiveBorder
          Width = 100
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'fecha_ini_poliza'
          Title.Caption = 'FECHA INICIAL POLIZA'
          Title.Color = clActiveBorder
          Width = 99
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'fecha_fin_poliza'
          Title.Caption = 'FECHA FIN POLIZA'
          Title.Color = clActiveBorder
          Visible = True
        end>
    end
    object DBGridPersonal: TDBGrid
      Left = 6
      Top = 16
      Width = 631
      Height = 151
      DataSource = DSgarantias
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
      Columns = <
        item
          Expanded = False
          FieldName = 'id_persona'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'IDENTIFICACION'
          Title.Color = clActiveBorder
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'apellido1'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'PRIMER APELLIDO'
          Title.Color = clActiveBorder
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'apellido2'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'SEGUNDO APELLIDO'
          Title.Color = clActiveBorder
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nombre'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'NOMBRES'
          Title.Color = clActiveBorder
          Width = 140
          Visible = True
        end>
    end
    object DBGridInicial: TDBGrid
      Left = 6
      Top = 16
      Width = 632
      Height = 151
      DataSource = DSJudicial
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          Title.Caption = 'IDENTIFICACION'
          Title.Color = clActiveBorder
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'PRIMER APELLIDO'
          Title.Color = clActiveBorder
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'SEGUNDO APELLIDO'
          Title.Color = clActiveBorder
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'NOMBRES'
          Title.Color = clActiveBorder
          Width = 139
          Visible = True
        end>
    end
    object DBGridDescParcial: TDBGrid
      Left = 6
      Top = 17
      Width = 632
      Height = 151
      DataSource = DScolParcial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'id_agencia'
          Title.Color = clActiveBorder
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'id_colocacion'
          Title.Caption = 'COLOCACION'
          Title.Color = clActiveBorder
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fechacorte'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'clasificacion'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'garantia'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'categoria'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'estado'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valorcuota'
          Title.Caption = 'VALOR CUOTA'
          Title.Color = clActiveBorder
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fechapagok'
          Title.Caption = 'F. PAGO K'
          Title.Color = clActiveBorder
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fechapagoi'
          Title.Caption = 'F. PAGO I'
          Title.Color = clActiveBorder
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipointeres'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valortasa'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valormora'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'puntosadic'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'saldo_actual'
          Title.Caption = 'SALDO ACTUAL'
          Title.Color = clActiveBorder
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'amortizak'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'amortizai'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'diasproroga'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'cuotas_liquidar'
          Title.Caption = 'No CUOTAS'
          Title.Color = clActiveBorder
          Visible = False
        end>
    end
    object DBGridCuotas: TDBGrid
      Left = 7
      Top = 16
      Width = 630
      Height = 154
      DataSource = DScuotas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = DBGridCuotasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id_agencia'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'id_colocacion'
          Title.Caption = 'COLOCACION'
          Title.Color = clActiveBorder
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fechacorte'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'clasificacion'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'garantia'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'categoria'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'estado'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valorcuota'
          Title.Caption = 'VALOR CUOTA'
          Title.Color = clActiveBorder
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fechapagok'
          Title.Caption = 'F. PAGO K'
          Title.Color = clActiveBorder
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fechapagoi'
          Title.Caption = 'F. PAGO I'
          Title.Color = clActiveBorder
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipointeres'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valor_tasa'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valor_mora'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'puntos'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'saldoactual'
          Title.Caption = 'SALDO ACTUAL'
          Title.Color = clActiveBorder
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'amortizak'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'amortizaint'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'diasprorroga'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'cuotas'
          Title.Caption = 'CUOTAS'
          Title.Color = clActiveBorder
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo_c'
          Title.Caption = 'TIPO'
          Title.Color = clActiveBorder
          Width = 81
          Visible = True
        end>
    end
    object DBGridJudicial: TDBGrid
      Left = 7
      Top = 15
      Width = 630
      Height = 154
      DataSource = DSJudicial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = DBGridCuotasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id_agencia'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'id_colocacion'
          Title.Caption = 'COLOCACION'
          Title.Color = clActiveBorder
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fechacorte'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'clasificacion'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'garantia'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'categoria'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'estado'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valorcuota'
          Title.Caption = 'VALOR CUOTA'
          Title.Color = clActiveBorder
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fechapagok'
          Title.Caption = 'F. PAGO K'
          Title.Color = clActiveBorder
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fechapagoi'
          Title.Caption = 'F. PAGO I'
          Title.Color = clActiveBorder
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipointeres'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valor_tasa'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valor_mora'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'puntos'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'saldo_actual'
          Title.Caption = 'SALDO ACTUAL'
          Title.Color = clActiveBorder
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'amortizak'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'amortizaint'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'diasprorroga'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'cuotas'
          Title.Caption = 'CUOTAS'
          Title.Color = clActiveBorder
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'tipo_c'
          Title.Caption = 'TIPO'
          Title.Color = clActiveBorder
          Visible = False
        end>
    end
    object Panel1: TPanel
      Left = 7
      Top = 113
      Width = 628
      Height = 152
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object Label8: TLabel
        Left = 4
        Top = 4
        Width = 112
        Height = 13
        Caption = 'Descuentos y Otros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object DBGridBancoldex: TDBGrid
      Left = 6
      Top = 16
      Width = 630
      Height = 154
      DataSource = DSBancoldex
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = DBGridCuotasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NO_BANCOLDEX'
          Title.Alignment = taCenter
          Title.Caption = 'NO BANCOLDEX'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLEOS_ACT'
          Title.Alignment = taCenter
          Title.Caption = 'EMP. ACT'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLEOS_GENERAR'
          Title.Alignment = taCenter
          Title.Caption = 'EMP. GEN'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_ACTIVOS'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL ACTIVOS'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ACTIVOS'
          Title.Alignment = taCenter
          Title.Caption = 'FECHA'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESTINO1'
          Title.Alignment = taCenter
          Title.Caption = 'DESTINO 1'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTO1'
          Title.Alignment = taCenter
          Title.Caption = 'MONTO 1'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESTINO2'
          Title.Alignment = taCenter
          Title.Caption = 'DESTINO 2'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTO2'
          Title.Alignment = taCenter
          Title.Caption = 'MONTO 2'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESTINO3'
          Title.Alignment = taCenter
          Title.Caption = 'DESTINO 3'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTO3'
          Title.Alignment = taCenter
          Title.Caption = 'MONTO 3'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GARANTIA1'
          Title.Alignment = taCenter
          Title.Caption = 'GARANTIA 1'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VGARANTIA1'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR 1'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GARANTIA2'
          Title.Alignment = taCenter
          Title.Caption = 'GARANTIA 2'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VGARANTIA2'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR 2'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GARANTIA3'
          Title.Alignment = taCenter
          Title.Caption = 'GARANTIA 3'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VGARANTIA3'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR 3'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA'
          Title.Alignment = taCenter
          Width = 50
          Visible = True
        end>
    end
    object PCuenta: TPanel
      Left = 4
      Top = 11
      Width = 648
      Height = 166
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object Label10: TLabel
        Left = 0
        Top = 9
        Width = 73
        Height = 13
        Caption = 'Tipo de Cuenta'
      end
      object Label11: TLabel
        Left = 178
        Top = 11
        Width = 54
        Height = 13
        Caption = 'No. Cuenta'
      end
      object Label12: TLabel
        Left = 250
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Asociado'
      end
      object DbTipocuenta: TDBLookupComboBox
        Left = 3
        Top = 27
        Width = 171
        Height = 21
        KeyField = 'ID_TIPO_CAPTACION'
        ListField = 'DESCRIPCION'
        TabOrder = 0
      end
      object JvNumero: TJvIntegerEdit
        Left = 178
        Top = 26
        Width = 69
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 1
        Value = 0
        MaxValue = 0
        MinValue = 0
        HasMaxValue = False
        HasMinValue = False
      end
      object JvAsociado: TJvStaticText
        Left = 250
        Top = 25
        Width = 280
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
      object Panel2: TPanel
        Left = 536
        Top = 3
        Width = 104
        Height = 159
        TabOrder = 3
        object BitAgregar: TBitBtn
          Left = 7
          Top = 11
          Width = 86
          Height = 25
          Caption = 'Agregar'
          TabOrder = 0
        end
        object BitEliminar: TBitBtn
          Left = 9
          Top = 43
          Width = 86
          Height = 25
          Caption = 'Eliminar'
          TabOrder = 1
        end
      end
      object DbCuentas: TDBGrid
        Left = 0
        Top = 56
        Width = 529
        Height = 106
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 535
    Top = 1
    Width = 118
    Height = 74
    Caption = 'Informaci'#243'n'
    TabOrder = 6
    object Chedad: TCheckBox
      Left = 4
      Top = 12
      Width = 105
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Mayor de 70'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ChedadClick
    end
    object Chreestructurado: TCheckBox
      Left = 4
      Top = 40
      Width = 105
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Reestructurado'
      TabOrder = 1
    end
    object Chvdeudor: TCheckBox
      Left = 4
      Top = 26
      Width = 105
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Seg. Vida Deudor'
      TabOrder = 2
    end
    object CHcredivida: TCheckBox
      Left = 5
      Top = 55
      Width = 103
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Seguro Credivida'
      TabOrder = 3
      OnClick = CHcredividaClick
    end
  end
  object JvGroupBox3: TJvGroupBox
    Left = 467
    Top = 218
    Width = 185
    Height = 46
    Caption = 'Otra Informacion'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object BTBancoldex: TBitBtn
      Left = 6
      Top = 16
      Width = 85
      Height = 25
      Caption = '&Bancoldex'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BTBancoldexClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C30E0000C30E0000000100000001000073424A00844A
        4A00734A5200735263007B526300846363008C6363008C6B6300846B6B008C6B
        6B00846B7300847373008C7373009473730084737B008C737B00A57B7B00847B
        84008C7B840084848C008C848C0094848C00AD8C8C007B8494007B8C9400848C
        94008C8C9400A58C9400A5949400B5949400527BA500737BA5007B84A5007B8C
        A500848CA5008494A5008C94A5009494A500A594A500ADA5A500B5A5A5002931
        AD007384AD007B84AD006B8CAD008C8CAD008C94AD009494AD008CA5AD0094A5
        AD00A5A5AD00B5ADAD00BDADAD002931B5004A84B500528CB50094ADB500A5AD
        B500ADADB500B5ADB5001029BD002931BD005263BD00A5ADBD00A5B5BD00ADB5
        BD00B5B5BD00B5BDBD00BDBDBD00CEBDBD00316BC6003173C600ADBDC600B5BD
        C600BDBDC600BDC6CE00C6C6CE00C6CECE00CECECE00106BD600218CD600B5C6
        D600BDCED600CECED600CED6D600D6D6D6000084E7003994E700D6D6E700E7D6
        E700E7E7E700C6E7EF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C5C5C5C5C
        5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C
        5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C2424191919
        191919191919191919245C4343554C4B4A483F3231311F2118195C4358554C4A
        32323124241F3D4F37195C434E55544E4841323224203C4636195C434C4C4D4C
        413F3F322524483F30195C435A5A54534B4A413F32315B5231195C435A595553
        4B4A413F32311A2423195C4355451D27271B1C1C120A0A0E23195C435A102744
        1C27261512141A1123195C4343584E4E4C4A4A43323F313231195C5C5C5C5C5C
        5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C}
    end
    object BTfng: TBitBtn
      Left = 95
      Top = 16
      Width = 85
      Height = 25
      Caption = '&Cuentas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BTfngClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
  end
  object IBsolicitud: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTSolicitud
    SQL.Strings = (
      'SELECT '
      '  "col$solicitud".ID_SOLICITUD,'
      '  "col$solicitud".ID_SOLICITUD as DESCRIPCION,'
      '  "col$solicitud".ESTADO'
      'FROM'
      '  "col$solicitud"'
      'WHERE'
      '  ("col$solicitud".ID_PERSONA = :ID_PERSONA) AND '
      '  ("col$solicitud".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND '
      '  ("col$solicitud".ESTADO = 4 or "col$solicitud".ESTADO = 12 )')
    Left = 681
    Top = 46
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end>
  end
  object IBTSolicitud: TIBTransaction
    AllowAutoStart = False
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 680
    Top = 126
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 648
    Top = 275
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 656
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = IBsolicitud
    Left = 652
    Top = 46
  end
  object CDgarantias: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_identificacion'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'apellido1'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'apellido2'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'csc_garantia'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 786
    Top = 44
    Data = {
      CB0000009619E0BD010000001800000006000000000003000000CB001169645F
      6964656E74696669636163696F6E010049000000010005574944544802000200
      0F000A69645F706572736F6E610100490000000100055749445448020002000F
      00066E6F6D627265020049000000010005574944544802000200FF0009617065
      6C6C69646F310100490000000100055749445448020002003200096170656C6C
      69646F3201004900000001000557494454480200020032000C6373635F676172
      616E74696104000100000000000000}
    object CDgarantiasid_identificacion: TStringField
      FieldName = 'id_identificacion'
      Size = 15
    end
    object CDgarantiasid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDgarantiasnombre: TStringField
      FieldName = 'nombre'
      Size = 255
    end
    object CDgarantiasapellido1: TStringField
      FieldName = 'apellido1'
      Size = 50
    end
    object CDgarantiasapellido2: TStringField
      FieldName = 'apellido2'
      Size = 50
    end
    object CDgarantiascsc_garantia: TIntegerField
      FieldName = 'csc_garantia'
    end
  end
  object DSgarantias: TDataSource
    DataSet = CDgarantias
    Left = 760
    Top = 45
  end
  object IBtipoid: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      'SELECT * FROM "gen$tiposidentificacion"')
    Left = 673
    Top = 3
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 682
    Top = 96
  end
  object DStipoid: TDataSource
    DataSet = IBtipoid
    Left = 650
    Top = 2
  end
  object CDgarantiareal: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'numero_escritura'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'fecha_escritura'
        DataType = ftDate
      end
      item
        Name = 'nombre_notaria'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ciudad_notaria'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'matricula'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'fecha_registro'
        DataType = ftDate
      end
      item
        Name = 'avaluo'
        DataType = ftCurrency
      end
      item
        Name = 'cuentas_orden'
        DataType = ftCurrency
      end
      item
        Name = 'poliza_incendio'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'valor_asegurado'
        DataType = ftCurrency
      end
      item
        Name = 'fecha_ini_poliza'
        DataType = ftDate
      end
      item
        Name = 'fecha_fin_poliza'
        DataType = ftDate
      end
      item
        Name = 'fecha_avaluo'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 725
    Top = 3
    Data = {
      B60100009619E0BD01000000180000000D000000000003000000B601106E756D
      65726F5F65736372697475726101004900000001000557494454480200020014
      000F66656368615F65736372697475726104000600000000000E6E6F6D627265
      5F6E6F74617269610100490000000100055749445448020002001E000E636975
      6461645F6E6F7461726961010049000000010005574944544802000200320009
      6D6174726963756C6101004900000001000557494454480200020014000E6665
      6368615F726567697374726F0400060000000000066176616C756F0800040000
      00010007535542545950450200490006004D6F6E6579000D6375656E7461735F
      6F7264656E080004000000010007535542545950450200490006004D6F6E6579
      000F706F6C697A615F696E63656E64696F010049000000010005574944544802
      0002001E000F76616C6F725F61736567757261646F0800040000000100075355
      42545950450200490006004D6F6E6579001066656368615F696E695F706F6C69
      7A6104000600000000001066656368615F66696E5F706F6C697A610400060000
      0000000C66656368615F6176616C756F04000600000000000000}
    object CDgarantiarealnumero_escritura: TStringField
      FieldName = 'numero_escritura'
    end
    object CDgarantiarealfecha_escritura: TDateField
      FieldName = 'fecha_escritura'
    end
    object CDgarantiarealnombre_notaria: TStringField
      FieldName = 'nombre_notaria'
      Size = 30
    end
    object CDgarantiarealciudad_notaria: TStringField
      FieldName = 'ciudad_notaria'
      Size = 50
    end
    object CDgarantiarealmatricula: TStringField
      FieldName = 'matricula'
    end
    object CDgarantiarealfecha_registro: TDateField
      FieldName = 'fecha_registro'
    end
    object CDgarantiarealavaluo: TCurrencyField
      FieldName = 'avaluo'
    end
    object CDgarantiarealcuentas_orden: TCurrencyField
      FieldName = 'cuentas_orden'
    end
    object CDgarantiarealpoliza_incendio: TStringField
      FieldName = 'poliza_incendio'
      Size = 30
    end
    object CDgarantiarealvalor_asegurado: TCurrencyField
      FieldName = 'valor_asegurado'
    end
    object TDateField
      FieldName = 'fecha_ini_poliza'
    end
    object CDgarantiarealfecha_fin_poliza: TDateField
      FieldName = 'fecha_fin_poliza'
    end
    object CDgarantiarealfecha_avaluo: TDateField
      FieldName = 'fecha_avaluo'
    end
  end
  object DSgarantiareal: TDataSource
    DataSet = CDgarantiareal
    Left = 701
    Top = 2
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 671
    Top = 275
  end
  object CDcolParcial: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_agencia'
        DataType = ftInteger
      end
      item
        Name = 'id_colocacion'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'cuotas_liquidar'
        DataType = ftInteger
      end
      item
        Name = 'fechacorte'
        DataType = ftDate
      end
      item
        Name = 'garantia'
        DataType = ftInteger
      end
      item
        Name = 'clasificacion'
        DataType = ftInteger
      end
      item
        Name = 'categoria'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'estado'
        DataType = ftInteger
      end
      item
        Name = 'valorcuota'
        DataType = ftCurrency
      end
      item
        Name = 'fechapagok'
        DataType = ftDate
      end
      item
        Name = 'fechapagoi'
        DataType = ftDate
      end
      item
        Name = 'tipointeres'
        DataType = ftInteger
      end
      item
        Name = 'puntosadic'
        DataType = ftCurrency
      end
      item
        Name = 'saldo_actual'
        DataType = ftCurrency
      end
      item
        Name = 'amortizak'
        DataType = ftInteger
      end
      item
        Name = 'amortizai'
        DataType = ftInteger
      end
      item
        Name = 'diasproroga'
        DataType = ftInteger
      end
      item
        Name = 'valortasa'
        DataType = ftFloat
      end
      item
        Name = 'valormora'
        DataType = ftFloat
      end
      item
        Name = 'tipo'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 733
    Top = 46
    Data = {
      E80100009619E0BD010000001800000014000000000003000000E8010A69645F
      6167656E63696104000100000000000D69645F636F6C6F636163696F6E010049
      0000000100055749445448020002000B000F63756F7461735F6C697175696461
      7204000100000000000A6665636861636F727465040006000000000008676172
      616E74696104000100000000000D636C6173696669636163696F6E0400010000
      0000000963617465676F72696101004900000001000557494454480200020001
      000665737461646F04000100000000000A76616C6F7263756F74610800040000
      00010007535542545950450200490006004D6F6E6579000A6665636861706167
      6F6B04000600000000000A66656368617061676F6904000600000000000B7469
      706F696E746572657304000100000000000A70756E746F736164696308000400
      0000010007535542545950450200490006004D6F6E6579000C73616C646F5F61
      637475616C080004000000010007535542545950450200490006004D6F6E6579
      0009616D6F7274697A616B040001000000000009616D6F7274697A6169040001
      00000000000B6469617370726F726F676104000100000000000976616C6F7274
      61736108000400000000000976616C6F726D6F72610800040000000000047469
      706F04000100000000000000}
    object CDcolParcialid_agencia: TIntegerField
      FieldName = 'id_agencia'
    end
    object CDcolParcialid_colocacion: TStringField
      FieldName = 'id_colocacion'
      Size = 11
    end
    object CDcolParcialcuotas_liquidar: TIntegerField
      FieldName = 'cuotas_liquidar'
    end
    object CDcolParcialfechacorte: TDateField
      FieldName = 'fechacorte'
    end
    object CDcolParcialgarantia: TIntegerField
      FieldName = 'garantia'
    end
    object CDcolParcialclasificacion: TIntegerField
      FieldName = 'clasificacion'
    end
    object CDcolParcialcategoria: TStringField
      FieldName = 'categoria'
      Size = 1
    end
    object CDcolParcialestado: TIntegerField
      FieldName = 'estado'
    end
    object CDcolParcialvalorcuota: TCurrencyField
      FieldName = 'valorcuota'
    end
    object CDcolParcialfechapagok: TDateField
      FieldName = 'fechapagok'
    end
    object CDcolParcialfechapagoi: TDateField
      FieldName = 'fechapagoi'
    end
    object CDcolParcialtipointeres: TIntegerField
      FieldName = 'tipointeres'
    end
    object CDcolParcialpuntosadic: TCurrencyField
      FieldName = 'puntosadic'
    end
    object CDcolParcialsaldo_actual: TCurrencyField
      FieldName = 'saldo_actual'
    end
    object CDcolParcialamortizak: TIntegerField
      FieldName = 'amortizak'
    end
    object CDcolParcialamortizai: TIntegerField
      FieldName = 'amortizai'
    end
    object CDcolParcialdiasproroga: TIntegerField
      FieldName = 'diasproroga'
    end
    object CDcolParcialvalortasa: TFloatField
      FieldName = 'valortasa'
    end
    object CDcolParcialvalormora: TFloatField
      FieldName = 'valormora'
    end
    object CDcolParcialtipo: TIntegerField
      FieldName = 'tipo'
    end
  end
  object DScolParcial: TDataSource
    DataSet = CDcolParcial
    Left = 709
    Top = 46
  end
  object CDcuotas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_agencia'
        DataType = ftInteger
      end
      item
        Name = 'id_colocacion'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'cuotas'
        DataType = ftInteger
      end
      item
        Name = 'fechacorte'
        DataType = ftDate
      end
      item
        Name = 'clasificacion'
        DataType = ftInteger
      end
      item
        Name = 'garantia'
        DataType = ftInteger
      end
      item
        Name = 'categoria'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'estado'
        DataType = ftInteger
      end
      item
        Name = 'valorcuota'
        DataType = ftCurrency
      end
      item
        Name = 'fechapagok'
        DataType = ftDate
      end
      item
        Name = 'fechapagoi'
        DataType = ftDate
      end
      item
        Name = 'tipointeres'
        DataType = ftInteger
      end
      item
        Name = 'valor_tasa'
        DataType = ftCurrency
      end
      item
        Name = 'valor_mora'
        DataType = ftCurrency
      end
      item
        Name = 'puntos'
        DataType = ftCurrency
      end
      item
        Name = 'saldoactual'
        DataType = ftCurrency
      end
      item
        Name = 'amortizak'
        DataType = ftInteger
      end
      item
        Name = 'amortizaint'
        DataType = ftInteger
      end
      item
        Name = 'diasprorroga'
        DataType = ftInteger
      end
      item
        Name = 'tipo'
        DataType = ftInteger
      end
      item
        Name = 'tipo_c'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 775
    Top = 3
    Data = {
      220200009619E0BD01000000180000001500000000000300000022020A69645F
      6167656E63696104000100000000000D69645F636F6C6F636163696F6E010049
      0000000100055749445448020002000B000663756F7461730400010000000000
      0A6665636861636F72746504000600000000000D636C6173696669636163696F
      6E040001000000000008676172616E7469610400010000000000096361746567
      6F72696101004900000001000557494454480200020001000665737461646F04
      000100000000000A76616C6F7263756F74610800040000000100075355425459
      50450200490006004D6F6E6579000A66656368617061676F6B04000600000000
      000A66656368617061676F6904000600000000000B7469706F696E7465726573
      04000100000000000A76616C6F725F7461736108000400000001000753554254
      5950450200490006004D6F6E6579000A76616C6F725F6D6F7261080004000000
      010007535542545950450200490006004D6F6E6579000670756E746F73080004
      000000010007535542545950450200490006004D6F6E6579000B73616C646F61
      637475616C080004000000010007535542545950450200490006004D6F6E6579
      0009616D6F7274697A616B04000100000000000B616D6F7274697A61696E7404
      000100000000000C6469617370726F72726F6761040001000000000004746970
      6F0400010000000000067469706F5F6301004900000001000557494454480200
      020014000000}
    object CDcuotasid_agencia: TIntegerField
      FieldName = 'id_agencia'
    end
    object CDcuotasid_colocacion: TStringField
      FieldName = 'id_colocacion'
      Size = 11
    end
    object CDcuotascuotas: TIntegerField
      FieldName = 'cuotas'
    end
    object CDcuotasfechacorte: TDateField
      FieldName = 'fechacorte'
    end
    object CDcuotasclasificacion: TIntegerField
      FieldName = 'clasificacion'
    end
    object CDcuotasgarantia: TIntegerField
      FieldName = 'garantia'
    end
    object CDcuotascategoria: TStringField
      FieldName = 'categoria'
      Size = 1
    end
    object CDcuotasestado: TIntegerField
      FieldName = 'estado'
    end
    object CDcuotasvalorcuota: TCurrencyField
      FieldName = 'valorcuota'
    end
    object CDcuotasfechapagok: TDateField
      FieldName = 'fechapagok'
    end
    object CDcuotasfechapagoi: TDateField
      FieldName = 'fechapagoi'
    end
    object CDcuotastipointeres: TIntegerField
      FieldName = 'tipointeres'
    end
    object CDcuotasvalor_tasa: TCurrencyField
      FieldName = 'valor_tasa'
    end
    object CDcuotasvalor_mora: TCurrencyField
      FieldName = 'valor_mora'
    end
    object CDcuotaspuntos: TCurrencyField
      FieldName = 'puntos'
    end
    object CDcuotassaldoactual: TCurrencyField
      FieldName = 'saldoactual'
    end
    object CDcuotasamortizak: TIntegerField
      FieldName = 'amortizak'
    end
    object CDcuotasamortizaint: TIntegerField
      FieldName = 'amortizaint'
    end
    object CDcuotasdiasprorroga: TIntegerField
      FieldName = 'diasprorroga'
    end
    object CDcuotastipo: TIntegerField
      FieldName = 'tipo'
    end
    object CDcuotastipo_c: TStringField
      FieldName = 'tipo_c'
    end
  end
  object DScuotas: TDataSource
    DataSet = CDcuotas
    Left = 752
    Top = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 592
    Top = 184
    object ConsultaColocacin1: TMenuItem
      Caption = '&Consulta Colocaci'#243'n'
      OnClick = ConsultaColocacin1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 544
    Top = 168
    object ConsultaColocacion1: TMenuItem
      Caption = 'Consulta Colocacion'
      OnClick = ConsultaColocacion1Click
    end
    object AgregarCrdito1: TMenuItem
      Caption = '&Agregar Cr'#233'dito'
      OnClick = AgregarCrdito1Click
    end
  end
  object IBConsecB: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction3
    Left = 683
    Top = 324
  end
  object IBExtracto: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 736
    Top = 324
  end
  object IBTransaction3: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 709
    Top = 96
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 489
    Top = 369
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = IBQueryGarReal
    Left = 656
    Top = 371
  end
  object Report: TprTxReport
    ShowProgress = True
    FromPage = 1
    ToPage = 1
    Title = 'ENTREGA DE  CREDITOS'
    ExportFromPage = 0
    ExportToPage = 0
    Values = <
      item
        Name = 'TotalDebito'
        AggFunction = prafSum
        Formula = 'IBQuerycontable.DEBITO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuerycontable'
      end
      item
        Name = 'TotalCredito'
        AggFunction = prafSum
        Formula = 'IBQuerycontable.CREDITO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuerycontable'
      end
      item
        Name = 'TotalCapital'
        AggFunction = prafSum
        Formula = 'IBQuerytabla.CAPITAL_A_PAGAR'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuerytabla'
      end
      item
        Name = 'TotalInteres'
        AggFunction = prafSum
        Formula = 'IBQuerytabla.INTERES_A_PAGAR'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBQuerytabla'
      end>
    Variables = <
      item
        Name = 'Empresa'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Hoy'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Desembolso'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Empleado'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'TasaNominal'
        ValueType = 'prvvtString'
        Value = ''
      end>
    PrinterName = '\\DEPARTAS02\Epson LX-300'
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 683
    Top = 418
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 2'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 1'
      'ProcessorType: 586'
      ''
      'Compiler version: Delphi6'
      'PReport version: 1.9.4')
    object prTxPage1: TprTxPage
      PageType = tptPage
      LineNum = 60
      ColNum = 80
      object prTxHPageHeaderBand1: TprTxHPageHeaderBand
        Height = 2
        UseVerticalBands = False
        PrintOnFirstPage = True
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[Empresa]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 17
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'ENTREGA DE CREDITOS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 0
          dRec.Right = 41
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>Hoy]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 67
          dRec.Top = 0
          dRec.Right = 78
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '-------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 78
          dRec.Bottom = 2
          Visible = False
        end
        object prTxCommandObj1: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 1
          dRec.Bottom = 1
          Visible = False
        end
        object prTxCommandObj2: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 17
          dRec.Top = 0
          dRec.Right = 18
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 14
        UseVerticalBands = False
        DataSetName = 'IBQuerycolocacion'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Colocaci'#243'n No.   :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 20
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Asociado         :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 20
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Inversi'#243'n        :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 4
          dRec.Right = 20
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tipo Garant'#237'a    :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 5
          dRec.Right = 20
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Valor Colocaci'#243'n :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 6
          dRec.Right = 20
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Periodo Gracia   :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 7
          dRec.Right = 20
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tipo Inter'#233's     :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 8
          dRec.Right = 20
          dRec.Bottom = 9
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Int.Efectivo Ini :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 9
          dRec.Right = 20
          dRec.Bottom = 10
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Puntos Adicional :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 10
          dRec.Right = 20
          dRec.Bottom = 11
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Amortiza Capital :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 11
          dRec.Right = 20
          dRec.Bottom = 12
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Valor Cuota      :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 12
          dRec.Right = 20
          dRec.Bottom = 13
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Inter'#233's Hasta    :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 13
          dRec.Right = 20
          dRec.Bottom = 14
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.ID_COLOCACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 0
          dRec.Right = 36
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBQuerycolocacion.PRIMER_APELLIDO + " " + IBQueryColocacion.SEG' +
                  'UNDO_APELLIDO + " " + IBQueryColocacion.NOMBRE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 2
          dRec.Right = 78
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Clasificaci'#243'n    :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 3
          dRec.Right = 20
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.DESCRIPCION_CLASIFICACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 3
          dRec.Right = 37
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.DESCRIPCION_INVERSION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 4
          dRec.Right = 37
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.DESCRIPCION_GARANTIA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 5
          dRec.Right = 37
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<$#,##0>IBQuerycolocacion.VALOR_DESEMBOLSO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 6
          dRec.Right = 37
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.PERIODO_GRACIA] D'#237'as')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 7
          dRec.Right = 37
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.TIPO_INTERES]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 8
          dRec.Right = 37
          dRec.Bottom = 9
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#0.00%>IBQuerycolocacion.TASA_INTERES_CORRIENTE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 9
          dRec.Right = 37
          dRec.Bottom = 10
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#0.00>IBQuerycolocacion.PUNTOS_INTERES]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 10
          dRec.Right = 37
          dRec.Bottom = 11
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.AMORTIZA_CAPITAL] D'#237'as')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 11
          dRec.Right = 37
          dRec.Bottom = 12
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<$#,##0>IBQuerycolocacion.VALOR_CUOTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 12
          dRec.Right = 37
          dRec.Bottom = 13
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBQuerycolocacion.FECHA_INTERES]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 13
          dRec.Right = 37
          dRec.Bottom = 14
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'L'#237'nea            :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 3
          dRec.Right = 58
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Respaldo         :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 4
          dRec.Right = 58
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha Colocaci'#243'n :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 5
          dRec.Right = 58
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj34: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Plazo Colocaci'#243'n :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 6
          dRec.Right = 58
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj35: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha Vencimiento:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 7
          dRec.Right = 58
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj36: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Inter'#233's Variable :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 8
          dRec.Right = 58
          dRec.Bottom = 9
          Visible = False
        end
        object prTxMemoObj37: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tipo de Cuota    :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 10
          dRec.Right = 58
          dRec.Bottom = 11
          Visible = False
        end
        object prTxMemoObj38: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Amortiza Inter'#233's :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 11
          dRec.Right = 58
          dRec.Bottom = 12
          Visible = False
        end
        object prTxMemoObj39: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Capital Hasta    :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 12
          dRec.Right = 58
          dRec.Bottom = 13
          Visible = False
        end
        object prTxMemoObj40: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Inter'#233's Nominal  :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 9
          dRec.Right = 58
          dRec.Bottom = 10
          Visible = False
        end
        object prTxMemoObj41: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.DESCRIPCION_LINEA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 3
          dRec.Right = 75
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj42: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.DESCRIPCION_RESPALDO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 4
          dRec.Right = 75
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj43: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBQuerycolocacion.FECHA_DESEMBOLSO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 5
          dRec.Right = 75
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj44: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.PLAZO_COLOCACION] D'#237'as')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 6
          dRec.Right = 75
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj45: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBQuerycolocacion.FECHA_VENCIMIENTO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 7
          dRec.Right = 75
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj46: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.DESCRIPCION_TASA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 8
          dRec.Right = 75
          dRec.Bottom = 9
          Visible = False
        end
        object prTxMemoObj47: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#0.00%>TasaNominal]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 9
          dRec.Right = 75
          dRec.Bottom = 10
          Visible = False
        end
        object prTxMemoObj48: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.DESCRIPCION_TIPO_CUOTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 10
          dRec.Right = 75
          dRec.Bottom = 11
          Visible = False
        end
        object prTxMemoObj49: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.AMORTIZA_INTERES]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 11
          dRec.Right = 75
          dRec.Bottom = 12
          Visible = False
        end
        object prTxMemoObj50: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBQuerycolocacion.FECHA_CAPITAL]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 12
          dRec.Right = 75
          dRec.Bottom = 13
          Visible = False
        end
        object prTxCommandObj3: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 20
          dRec.Top = 2
          dRec.Right = 21
          dRec.Bottom = 3
          Visible = False
        end
        object prTxCommandObj4: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 78
          dRec.Top = 2
          dRec.Right = 79
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj111: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Cuenta No        :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 1
          dRec.Right = 58
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj112: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.NUMERO_CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 1
          dRec.Right = 75
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj113: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Nota Contable No :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 13
          dRec.Right = 58
          dRec.Bottom = 14
          Visible = False
        end
        object prTxMemoObj114: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.NOTA_CONTABLE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 13
          dRec.Right = 75
          dRec.Bottom = 14
          Visible = False
        end
        object prTxMemoObj115: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Documento Ident. :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 20
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj116: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IbQueryColocacion.ID_PERSONA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 1
          dRec.Right = 37
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 4
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand2
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prTxMemoObj51: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CONTABILIZACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 22
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj52: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CODIGO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 17
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj53: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NOMBRE DE LA CUENTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 19
          dRec.Top = 2
          dRec.Right = 49
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj54: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DEBITO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 51
          dRec.Top = 2
          dRec.Right = 62
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj55: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CREDITO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 64
          dRec.Top = 2
          dRec.Right = 75
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj62: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 3
          dRec.Right = 78
          dRec.Bottom = 4
          Visible = False
        end
      end
      object prTxHDetailBand2: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBQuerycontable'
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand1'
          'prTxHDetailFooterBand1')
        object prTxMemoObj56: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycontable.CODIGO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 17
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj57: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycontable.nombre]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 0
          dRec.Right = 48
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj58: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>IBQuerycontable.DEBITO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 49
          dRec.Top = 0
          dRec.Right = 63
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj59: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>IBQuerycontable.CREDITO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 64
          dRec.Top = 0
          dRec.Right = 78
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj65: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 48
          dRec.Top = 0
          dRec.Right = 49
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj66: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 63
          dRec.Top = 0
          dRec.Right = 64
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj67: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 48
          dRec.Top = 2
          dRec.Right = 49
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj68: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 63
          dRec.Top = 2
          dRec.Right = 64
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj69: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 17
          dRec.Top = 0
          dRec.Right = 18
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand1: TprTxHDetailFooterBand
        Height = 3
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand2
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = True
        object prTxMemoObj60: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 78
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj61: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTALES -->')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 1
          dRec.Right = 48
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj63: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>TotalDebito]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 49
          dRec.Top = 1
          dRec.Right = 63
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj64: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>TotalCredito]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 64
          dRec.Top = 1
          dRec.Right = 78
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj70: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 78
          dRec.Bottom = 3
          Visible = False
        end
      end
      object prTxHDetailHeaderBand3: TprTxHDetailHeaderBand
        Height = 3
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand3
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prTxMemoObj79: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'GARANTIAS NO ADMISIBLES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 34
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj80: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 78
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj81: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'IDENTIFICACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 16
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj82: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NOMBRE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 34
          dRec.Top = 1
          dRec.Right = 58
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailBand3: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBQueryGarPersonal'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand3'
          'prTxHDetailFooterBand2')
        object prTxMemoObj83: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQueryGarPersonal.ID_PERSONA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 2
          dRec.Top = 0
          dRec.Right = 14
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj84: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBQueryGarPersonal.PRIMER_APELLIDO + " " + IBQueryGarPersonal.S' +
                  'EGUNDO_APELLIDO + " " + IBQueryGarPersonal.NOMBRE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 5
          dRec.Top = 1
          dRec.Right = 61
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailFooterBand2: TprTxHDetailFooterBand
        Height = 1
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand3
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj85: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 78
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailHeaderBand4: TprTxHDetailHeaderBand
        Height = 3
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand4
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prTxMemoObj86: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 78
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj87: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'GARANTIAS ADMISIBLES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 34
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj100: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'MATRICULA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 18
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj101: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'ESCRITURA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 1
          dRec.Right = 33
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj102: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 35
          dRec.Top = 1
          dRec.Right = 46
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj103: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AVALUO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 48
          dRec.Top = 1
          dRec.Right = 65
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj91: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'POLIZA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 67
          dRec.Top = 1
          dRec.Right = 76
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailBand4: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBQueryGarReal'
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand4'
          'prTxHDetailFooterBand3')
        object prTxMemoObj88: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQueryGarReal.NUMERO_ESCRITURA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 0
          dRec.Right = 33
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj90: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBQueryGarReal.FECHA_ESCRITURA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 35
          dRec.Top = 0
          dRec.Right = 46
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj94: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>IBQueryGarReal.AVALUO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 48
          dRec.Top = 0
          dRec.Right = 65
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj92: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQueryGarReal.POLIZA_INCENDIO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 67
          dRec.Top = 0
          dRec.Right = 76
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj89: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQueryGarReal.MATRICULA_INMOBILIARIA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 18
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand3: TprTxHDetailFooterBand
        Height = 2
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand4
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj93: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 78
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj124: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'Empleado : [IBQueryColocacion.NOMBRE1] [IBQueryColocacion.PRIMER' +
                  '_APELLIDO1] [IBQueryColocacion.SEGUNDO_APELLIDO1]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 45
          dRec.Bottom = 2
          Visible = False
        end
      end
    end
    object prTxPage2: TprTxPage
      PageType = tptPage
      LineNum = 60
      ColNum = 80
      object prTxHPageHeaderBand2: TprTxHPageHeaderBand
        Height = 4
        UseVerticalBands = False
        PrintOnFirstPage = True
        object prTxCommandObj5: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 1
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj72: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[Empresa]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 17
          dRec.Bottom = 1
          Visible = False
        end
        object prTxCommandObj6: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 17
          dRec.Top = 0
          dRec.Right = 18
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj71: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'TABLA DE LIQUIDACION COLOCACION No.: [IBQuerycolocacion.ID_COLOC' +
                  'ACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 0
          dRec.Right = 70
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj117: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Documento Ident. :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 20
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj118: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IbQueryColocacion.ID_PERSONA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 1
          dRec.Right = 37
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj119: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Cuenta No        :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 1
          dRec.Right = 58
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj120: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuerycolocacion.NUMERO_CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 1
          dRec.Right = 75
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj121: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Asociado         :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 20
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj122: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBQuerycolocacion.PRIMER_APELLIDO + " " + IBQueryColocacion.SEG' +
                  'UNDO_APELLIDO + " " + IBQueryColocacion.NOMBRE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 2
          dRec.Right = 78
          dRec.Bottom = 3
          Visible = False
        end
        object prTxCommandObj7: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 20
          dRec.Top = 2
          dRec.Right = 21
          dRec.Bottom = 3
          Visible = False
        end
        object prTxCommandObj8: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 78
          dRec.Top = 2
          dRec.Right = 79
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj123: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '-------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 3
          dRec.Right = 77
          dRec.Bottom = 4
          Visible = False
        end
      end
      object prTxHDetailHeaderBand2: TprTxHDetailHeaderBand
        Height = 3
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand5
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prTxMemoObj73: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CUOTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 10
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj74: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA PAGO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 0
          dRec.Right = 22
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj75: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CAPITAL')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 24
          dRec.Top = 0
          dRec.Right = 33
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj76: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INTERES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 36
          dRec.Top = 0
          dRec.Right = 45
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj77: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTAL')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 49
          dRec.Top = 0
          dRec.Right = 58
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj78: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SALDO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 62
          dRec.Top = 0
          dRec.Right = 71
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj95: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '-------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 2
          dRec.Right = 77
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj110: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<$#,##0>Desembolso]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 62
          dRec.Top = 1
          dRec.Right = 76
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailBand5: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBQuerytabla'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand2'
          'prTxHDetailFooterBand4')
        object prTxMemoObj96: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<000>IBQuerytabla.CUOTA_NUMERO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 10
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj97: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mmm/dd>IBQueryTabla.FECHA_A_PAGAR]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 0
          dRec.Right = 22
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj98: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>IBQuerytabla.CAPITAL_A_PAGAR]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 23
          dRec.Top = 0
          dRec.Right = 35
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj99: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>IBQuerytabla.INTERES_A_PAGAR]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 36
          dRec.Top = 0
          dRec.Right = 46
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj104: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>IBQuerytabla.TOTALCUOTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 49
          dRec.Top = 0
          dRec.Right = 60
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj105: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>IBQuerytabla.Field("CAPITAL_A_PAGAR")]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = True
              WordWrap = False
            end>
          dRec.Left = 62
          dRec.Top = 0
          dRec.Right = 76
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand4: TprTxHDetailFooterBand
        Height = 4
        UseVerticalBands = False
        DetailBand = Report.prTxHDetailBand5
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj106: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '--------------------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 77
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj107: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTALES -->')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 1
          dRec.Right = 22
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj108: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>TotalCapital]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 23
          dRec.Top = 1
          dRec.Right = 35
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj109: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>TotalInteres]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 36
          dRec.Top = 1
          dRec.Right = 46
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj126: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '-------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 78
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj125: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'Empleado : [IBQueryColocacion.NOMBRE1] [IBQueryColocacion.PRIMER' +
                  '_APELLIDO1] [IBQueryColocacion.SEGUNDO_APELLIDO1]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 3
          dRec.Right = 45
          dRec.Bottom = 4
          Visible = False
        end
      end
    end
  end
  object IBQueryGarPersonal: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBtranreporte
    Active = True
    SQL.Strings = (
      'SELECT '
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$persona".NOMBRE,'
      '  "col$colgarantias".ID_COLOCACION,'
      '  "col$colgarantias".ID_PERSONA'
      'FROM'
      '  "col$colgarantias"'
      
        '  INNER JOIN "gen$persona" ON ("col$colgarantias".ID_PERSONA = "' +
        'gen$persona".ID_PERSONA) AND ("col$colgarantias".ID_IDENTIFICACI' +
        'ON = "gen$persona".ID_IDENTIFICACION)'
      '')
    Left = 709
    Top = 225
  end
  object IBQuerycolocacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBtranreporte
    SQL.Strings = (
      'SELECT '
      '  "col$colocacion".ID_COLOCACION,'
      ' "col$colocacion".ID_PERSONA,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,'
      '  "col$clasificacion".DESCRIPCION_CLASIFICACION,'
      '  "col$lineas".DESCRIPCION_LINEA,'
      '  "col$inversion".DESCRIPCION_INVERSION,'
      '  "col$respaldo".DESCRIPCION_RESPALDO,'
      '  "col$garantia".DESCRIPCION_GARANTIA,'
      '  "col$colocacion".FECHA_DESEMBOLSO,'
      '  "col$colocacion".VALOR_DESEMBOLSO,'
      '  "col$colocacion".PLAZO_COLOCACION,'
      '  "col$colocacion".FECHA_VENCIMIENTO,'
      '  "col$colocacion".TIPO_INTERES,'
      '  "col$tasavariables".DESCRIPCION_TASA,'
      '  "col$colocacion".TASA_INTERES_CORRIENTE,'
      '  "col$colocacion".TASA_INTERES_MORA,'
      '  "col$colocacion".PUNTOS_INTERES,'
      '  "col$tiposcuota".DESCRIPCION_TIPO_CUOTA,'
      '  "col$colocacion".AMORTIZA_CAPITAL,'
      '  "col$colocacion".AMORTIZA_INTERES,'
      '  "col$colocacion".PERIODO_GRACIA,'
      '  "col$colocacion".VALOR_CUOTA,'
      '  "col$colocacion".FECHA_CAPITAL,'
      '  "col$colocacion".FECHA_INTERES,'
      
        '  "col$colocacion".NUMERO_CUENTA,   "col$colocacion".NOTA_CONTAB' +
        'LE,'
      '  "gen$empleado".PRIMER_APELLIDO AS PRIMER_APELLIDO1,'
      '  "gen$empleado".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,'
      '  "gen$empleado".NOMBRE AS NOMBRE1'
      'FROM'
      '  "col$colocacion"'
      
        '  INNER JOIN "gen$persona" ON ("col$colocacion".ID_PERSONA = "ge' +
        'n$persona".ID_PERSONA) AND ("col$colocacion".ID_IDENTIFICACION =' +
        ' "gen$persona".ID_IDENTIFICACION)'
      
        '  INNER JOIN "gen$tiposidentificacion" ON ("gen$persona".ID_IDEN' +
        'TIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)'
      
        '  INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFI' +
        'CACION = "col$clasificacion".ID_CLASIFICACION)'
      
        '  INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$l' +
        'ineas".ID_LINEA)'
      
        '  INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION =' +
        ' "col$inversion".ID_INVERSION)'
      
        '  INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "' +
        'col$respaldo".ID_RESPALDO)'
      
        '  INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "' +
        'col$garantia".ID_GARANTIA)'
      
        '  LEFT OUTER JOIN "col$tasavariables" ON ("col$colocacion".ID_IN' +
        'TERES = "col$tasavariables".ID_INTERES)'
      
        '  INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA' +
        ' = "col$tiposcuota".ID_TIPOS_CUOTA)'
      
        '  INNER JOIN "gen$empleado" ON ("col$colocacion".ID_EMPLEADO = "' +
        'gen$empleado".ID_EMPLEADO)')
    Left = 681
    Top = 225
  end
  object IBQuerycontable: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBtranreporte
    Active = True
    SQL.Strings = (
      'select ID_COLOCACION,"col$concol"."CODIGO",NOMBRE,DEBITO,CREDITO'
      'FROM "col$concol" left join CON$PUC ON'
      
        '("col$concol"."CODIGO" = CON$PUC."CODIGO" and "col$concol"."ID' +
        '_AGENCIA" = CON$PUC."ID_AGENCIA")'
      
        'where ("col$concol".ID_AGENCIA = :"ID_AGENCIA") AND ("col$concol' +
        '".ID_COLOCACION = :"ID_COLOCACION") ORDER BY CREDITO,"col$concol' +
        '"."CODIGO"')
    Left = 757
    Top = 178
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COLOCACION'
        ParamType = ptUnknown
      end>
  end
  object IBQuerytabla: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBtranreporte
    SQL.Strings = (
      
        'select ID_COLOCACION,CUOTA_NUMERO, FECHA_A_PAGAR, CAPITAL_A_PAGA' +
        'R, INTERES_A_PAGAR, (CAPITAL_A_PAGAR + INTERES_A_PAGAR) as TOTAL' +
        'CUOTA from "col$tablaliquidacion"')
    Left = 739
    Top = 225
    object IBQuerytablaID_COLOCACION: TIBStringField
      FieldName = 'ID_COLOCACION'
      Origin = '"col$tablaliquidacion"."ID_COLOCACION"'
      Required = True
      FixedChar = True
      Size = 11
    end
    object IBQuerytablaCUOTA_NUMERO: TIntegerField
      FieldName = 'CUOTA_NUMERO'
      Origin = '"col$tablaliquidacion"."CUOTA_NUMERO"'
      Required = True
    end
    object IBQuerytablaFECHA_A_PAGAR: TDateField
      FieldName = 'FECHA_A_PAGAR'
      Origin = '"col$tablaliquidacion"."FECHA_A_PAGAR"'
      Required = True
    end
    object IBQuerytablaCAPITAL_A_PAGAR: TIBBCDField
      FieldName = 'CAPITAL_A_PAGAR'
      Origin = '"col$tablaliquidacion"."CAPITAL_A_PAGAR"'
      Precision = 18
      Size = 3
    end
    object IBQuerytablaINTERES_A_PAGAR: TIBBCDField
      FieldName = 'INTERES_A_PAGAR'
      Origin = '"col$tablaliquidacion"."INTERES_A_PAGAR"'
      Precision = 18
      Size = 3
    end
    object IBQuerytablaTOTALCUOTA: TIBBCDField
      FieldName = 'TOTALCUOTA'
      Required = True
      Precision = 18
      Size = 3
    end
  end
  object IBQueryGarReal: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBtranreporte
    Active = True
    SQL.Strings = (
      'SELECT '
      '  "col$colgarantiasreal".ID_COLOCACION,'
      '  "col$colgarantiasreal".NUMERO_ESCRITURA,'
      '  "col$colgarantiasreal".FECHA_ESCRITURA,'
      '  "col$colgarantiasreal".NOMBRE_NOTARIA,'
      '  "col$colgarantiasreal".CIUDAD_ESCRITURA,'
      '  "col$colgarantiasreal".MATRICULA_INMOBILIARIA,'
      '  "col$colgarantiasreal".FECHA_REGISTRO,'
      '  "col$colgarantiasreal".AVALUO,'
      '  "col$colgarantiasreal".CUENTAS_DE_ORDEN,'
      '  "col$colgarantiasreal".POLIZA_INCENDIO,'
      '  "col$colgarantiasreal".VALOR_ASEGURADO,'
      '  "col$colgarantiasreal".FECHA_INICIAL_POLIZA,'
      '  "col$colgarantiasreal".FECHA_FINAL_POLIZA,'
      '  "col$colgarantiasreal".CODIGO_ASEGURADORA'
      'FROM'
      '  "col$colgarantiasreal"')
    Left = 653
    Top = 225
  end
  object IBtranreporte: TIBTransaction
    Active = True
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 734
    Top = 125
  end
  object frCompositeReport1: TfrCompositeReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    DoublePassReport = False
    Left = 797
    Top = 417
    ReportForm = {19000000}
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = IBQueryGarPersonal
    Left = 684
    Top = 371
  end
  object IBQuery: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction4
    Left = 766
    Top = 225
  end
  object IBTransaction4: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 739
    Top = 97
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction4
    Left = 705
    Top = 178
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction5
    SQL.Strings = (
      'SELECT '
      '  "col$extractotmp".CUOTA_EXTRACTO,'
      '  "col$extractotmp".ID_EMPLEADO,'
      '  "col$extractodettmp".ID_CBTE_COLOCACION,'
      '  "col$extractodettmp".CODIGO_PUC,'
      '  "col$extractodettmp".FECHA_FINAL,'
      '  "col$extractodettmp".FECHA_INICIAL,'
      '  "col$extractodettmp".DIAS_APLICADOS,'
      '  "col$extractodettmp".TASA_LIQUIDACION,'
      '  "col$extractodettmp".VALOR_DEBITO,'
      '  "col$extractodettmp".VALOR_CREDITO'
      'FROM'
      '  "col$extractodettmp"'
      
        '  INNER JOIN "col$extractotmp" ON ("col$extractodettmp".ID_COLOC' +
        'ACION = "col$extractotmp".ID_COLOCACION) AND ("col$extractodettm' +
        'p".ID_AGENCIA = "col$extractotmp".ID_AGENCIA)'
      'WHERE'
      '  ("col$extractodettmp".ID_COLOCACION = :id)'
      
        '  order by "col$extractodettmp".ID_CBTE_COLOCACION,"col$extracto' +
        'tmp".CUOTA_EXTRACTO')
    Left = 729
    Top = 178
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction5: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 769
    Top = 95
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = IBQuerycontable
    Left = 711
    Top = 371
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = CDliquidacion
    Left = 739
    Top = 371
  end
  object IBgrupo1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTgrupos
    Left = 653
    Top = 178
  end
  object IBgrupo2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTgrupos
    Left = 681
    Top = 178
  end
  object IBTgrupos: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 761
    Top = 124
  end
  object reporte: TprTxReport
    ShowProgress = True
    DesignerFormMode = fmMDIChild
    Title = 'Liquidaci'#243'n Barrido'
    ExportFromPage = 0
    ExportToPage = 0
    Values = <
      item
        Group = reporte.grupo1
        Name = 'TDebito'
        AggFunction = prafSum
        Formula = 'IBGrupo1.VALOR_DEBITO'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'IBGrupo1'
      end
      item
        Group = reporte.grupo1
        Name = 'TCredito'
        AggFunction = prafSum
        Formula = 'IBGrupo1.VALOR_CREDITO'
        ResetOn = rvtGroup
        CalcOn = cvtDataSetNext
        DataSetName = 'IBGrupo1'
      end>
    Variables = <
      item
        Name = 'EMPRESA'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'NIT'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'EMPLEADO'
        ValueType = 'prvvtString'
        Value = ''
      end>
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    PaperType = ptRulon
    UseLinesOnPage = True
    LinesOnPage = 30
    PrintRulonMode = prmLinesRange
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 655
    Top = 418
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 2'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 1'
      'ProcessorType: 586'
      ''
      'Compiler version: Delphi6'
      'PReport version: 1.9.4')
    object prTxPage2: TprTxPage
      PageType = tptPage
      LineNum = 60
      ColNum = 80
      object prTxHGroupHeaderBand1: TprTxHGroupHeaderBand
        Height = 6
        UseVerticalBands = False
        Group = reporte.grupo1
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = True
        StartNewPage = True
        ReprintOnEachPage = True
        object prTxMemoObj60: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'COLOCACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 12
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj61: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 12
          dRec.Top = 1
          dRec.Right = 13
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj62: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'ASOCIADO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 13
          dRec.Top = 1
          dRec.Right = 43
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj63: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 43
          dRec.Top = 1
          dRec.Right = 44
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj64: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'COMP. No.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 44
          dRec.Top = 1
          dRec.Right = 52
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj65: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 52
          dRec.Top = 1
          dRec.Right = 53
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj66: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA LIQUIDACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 62
          dRec.Top = 1
          dRec.Right = 82
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj67: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 82
          dRec.Top = 1
          dRec.Right = 83
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj68: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CAPITAL HASTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 83
          dRec.Top = 1
          dRec.Right = 97
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj69: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 97
          dRec.Top = 1
          dRec.Right = 98
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj70: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INTERES HASTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 98
          dRec.Top = 1
          dRec.Right = 112
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '-------------------------------------------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 3
          dRec.Right = 128
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CUOTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 4
          dRec.Right = 5
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 5
          dRec.Top = 4
          dRec.Right = 6
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 24
          dRec.Top = 4
          dRec.Right = 25
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CODIGO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 6
          dRec.Top = 4
          dRec.Right = 24
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CUENTA CONTABLE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 25
          dRec.Top = 4
          dRec.Right = 63
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 63
          dRec.Top = 4
          dRec.Right = 64
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA INICIAL')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 64
          dRec.Top = 4
          dRec.Right = 74
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA FINAL')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 75
          dRec.Top = 4
          dRec.Right = 85
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 85
          dRec.Top = 4
          dRec.Right = 86
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DIAS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 86
          dRec.Top = 4
          dRec.Right = 90
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 90
          dRec.Top = 4
          dRec.Right = 91
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TASA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 91
          dRec.Top = 4
          dRec.Right = 96
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 4
          dRec.Right = 97
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DEBITO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 97
          dRec.Top = 4
          dRec.Right = 112
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 112
          dRec.Top = 4
          dRec.Right = 113
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CREDITO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 4
          dRec.Right = 128
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '-------------------------------------------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 5
          dRec.Right = 128
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj40: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[Empresa]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 0
          dRec.Right = 22
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj41: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'LIQUIDACION DE CARTERA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 51
          dRec.Top = 0
          dRec.Right = 77
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj42: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Hoy:[:<yyyy/MM/dd>StartDateTime]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 109
          dRec.Top = 0
          dRec.Right = 128
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj43: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBGrupo1.ID_COLOCACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 2
          dRec.Right = 12
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj44: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 12
          dRec.Top = 2
          dRec.Right = 13
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj45: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBGrupo1.NOMBRE] [IBGrupo1.PRIMER_APELLIDO] [IBGrupo1.SEGUNDO_A' +
                  'PELLIDO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 13
          dRec.Top = 2
          dRec.Right = 43
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj46: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 43
          dRec.Top = 2
          dRec.Right = 44
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj47: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBGrupo1.ID_CBTE_COLOCACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 44
          dRec.Top = 2
          dRec.Right = 52
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj48: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 52
          dRec.Top = 2
          dRec.Right = 53
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj49: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBGrupo1.FECHA_EXTRACTO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 62
          dRec.Top = 2
          dRec.Right = 82
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj50: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 82
          dRec.Top = 2
          dRec.Right = 83
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj51: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBGrupo1.CAPITAL_PAGO_HASTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 83
          dRec.Top = 2
          dRec.Right = 97
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj52: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 97
          dRec.Top = 2
          dRec.Right = 98
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj53: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBGrupo1.INTERES_PAGO_HASTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 98
          dRec.Top = 2
          dRec.Right = 112
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj55: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Nit. [nit]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 22
          dRec.Top = 0
          dRec.Right = 41
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 74
          dRec.Top = 4
          dRec.Right = 75
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj56: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 112
          dRec.Top = 1
          dRec.Right = 113
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj57: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 112
          dRec.Top = 2
          dRec.Right = 113
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj58: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SALDO ANTERIOR')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 1
          dRec.Right = 128
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj59: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBGrupo1.SALDO_ANTERIOR_EXTRACTO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 2
          dRec.Right = 128
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj71: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CUENTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 53
          dRec.Top = 1
          dRec.Right = 61
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj72: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBGrupo1.NUMERO_CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 53
          dRec.Top = 2
          dRec.Right = 61
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj73: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 61
          dRec.Top = 1
          dRec.Right = 62
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj74: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 61
          dRec.Top = 2
          dRec.Right = 62
          dRec.Bottom = 3
          Visible = False
        end
        object prTxCommandObj1: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcNormal
                txcCondensedOn)
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 1
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHGroupFooterBand1: TprTxHGroupFooterBand
        Height = 3
        UseVerticalBands = False
        Group = reporte.grupo1
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = True
        object prTxMemoObj106: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Nuevo Saldo:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 12
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj107: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Pr'#243'xima Cuota:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 33
          dRec.Top = 1
          dRec.Right = 47
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj108: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Empleado :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 2
          dRec.Right = 11
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj109: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SUMAS IGUALES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 82
          dRec.Top = 1
          dRec.Right = 96
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj110: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 1
          dRec.Right = 97
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj111: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 112
          dRec.Top = 1
          dRec.Right = 113
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj112: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>TCredito]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 1
          dRec.Right = 128
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj113: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>TDebito]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 97
          dRec.Top = 1
          dRec.Right = 112
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBGrupo1.SALDO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 12
          dRec.Top = 1
          dRec.Right = 27
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 47
          dRec.Top = 1
          dRec.Right = 62
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBGrupo1.NOMEMPLEADO] [IBGrupo1.APE1EMPLEADO] [IBGrupo1.APE2EMP' +
                  'LEADO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 2
          dRec.Right = 53
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj54: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '-------------------------------------------------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 128
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailBand3: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBGrupo1'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Groups = (
          'grupo1')
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<000>IBGrupo1.CUOTA_EXTRACTO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 5
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 5
          dRec.Top = 0
          dRec.Right = 6
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBGrupo1.CODIGO_PUC]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 6
          dRec.Top = 0
          dRec.Right = 24
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 24
          dRec.Top = 0
          dRec.Right = 25
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBGrupo1.CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 25
          dRec.Top = 0
          dRec.Right = 63
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 63
          dRec.Top = 0
          dRec.Right = 64
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBGrupo1.FECHA_INICIAL]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 64
          dRec.Top = 0
          dRec.Right = 74
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 74
          dRec.Top = 0
          dRec.Right = 75
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBGrupo1.FECHA_FINAL]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 75
          dRec.Top = 0
          dRec.Right = 85
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBGrupo1.DIAS_APLICADOS]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 86
          dRec.Top = 0
          dRec.Right = 90
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 85
          dRec.Top = 0
          dRec.Right = 86
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj34: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 90
          dRec.Top = 0
          dRec.Right = 91
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj35: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#0.00>IBGrupo1.TASA_LIQUIDACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 91
          dRec.Top = 0
          dRec.Right = 96
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj36: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 0
          dRec.Right = 97
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj37: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBGrupo1.VALOR_DEBITO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 97
          dRec.Top = 0
          dRec.Right = 112
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj38: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 112
          dRec.Top = 0
          dRec.Right = 113
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj39: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBGrupo1.VALOR_CREDITO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 0
          dRec.Right = 128
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHSummaryBand1: TprTxHSummaryBand
        Height = 1
        UseVerticalBands = False
      end
    end
    object grupo1: TprGroup
      Valid = 'IBGrupo1.ID_CBTE_COLOCACION'
      DetailBand = reporte.prTxHDetailBand3
    end
  end
  object IBDescuentos: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 784
    Top = 177
  end
  object IBSQL3: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 700
    Top = 275
  end
  object IBConsecutivo: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTConsecutivo
    Left = 714
    Top = 325
  end
  object IBTConsecutivo: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 708
    Top = 126
  end
  object frReport2: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 773
    Top = 417
    ReportForm = {19000000}
  end
  object CDliquidacion: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cuota'
        DataType = ftInteger
      end
      item
        Name = 'fecha_pago'
        DataType = ftDate
      end
      item
        Name = 'capital'
        DataType = ftCurrency
      end
      item
        Name = 'interes'
        DataType = ftCurrency
      end
      item
        Name = 'saldo'
        DataType = ftCurrency
      end
      item
        Name = 'totalcuota'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 800
    Data = {
      CC0000009619E0BD010000001800000006000000000003000000CC000563756F
      746104000100000000000A66656368615F7061676F0400060000000000076361
      706974616C080004000000010007535542545950450200490006004D6F6E6579
      0007696E7465726573080004000000010007535542545950450200490006004D
      6F6E6579000573616C646F080004000000010007535542545950450200490006
      004D6F6E6579000A746F74616C63756F74610800040000000100075355425459
      50450200490006004D6F6E6579000000}
    object CDliquidacioncuota: TIntegerField
      FieldName = 'cuota'
    end
    object CDliquidacionfecha_pago: TDateField
      FieldName = 'fecha_pago'
    end
    object CDliquidacioncapital: TCurrencyField
      FieldName = 'capital'
    end
    object CDliquidacioninteres: TCurrencyField
      FieldName = 'interes'
    end
    object CDliquidacionsaldo: TCurrencyField
      FieldName = 'saldo'
    end
    object CDliquidaciontotalcuota: TCurrencyField
      FieldName = 'totalcuota'
    end
  end
  object frRtfAdvExport1: TfrRtfAdvExport
    Left = 711
    Top = 418
  end
  object PopupReal: TPopupMenu
    Left = 616
    Top = 184
    object Eliminar1: TMenuItem
      Caption = '&Eliminar'
      OnClick = Eliminar1Click
    end
    object Modificar1: TMenuItem
      Caption = '&Modificar'
      OnClick = Modificar1Click
    end
    object Agregar1: TMenuItem
      Caption = '&Agregar'
      OnClick = Agregar1Click
    end
  end
  object IBSQL4: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction4
    Left = 727
    Top = 275
  end
  object frDBDataSet5: TfrDBDataSet
    DataSet = IBentidad
    Left = 768
    Top = 371
  end
  object IBhorario: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM "gen$horario"'
      'ORDER BY ID_HORARIO')
    Left = 792
    Top = 224
  end
  object IBTransaction7: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 799
    Top = 96
  end
  object IBSQL5: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBtranreporte
    Left = 754
    Top = 275
  end
  object IBSQL6: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction8
    Left = 777
    Top = 275
  end
  object IBSQL7: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction8
    Left = 801
    Top = 275
  end
  object IBTransaction8: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 656
    Top = 124
  end
  object IBSQL8: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction8
    Left = 657
    Top = 323
  end
  object IBentidad: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Active = True
    SQL.Strings = (
      'SELECT '
      '* FROM'
      '  "gen$entidades"')
    Left = 809
    Top = 178
  end
  object DSJudicial: TDataSource
    DataSet = CDJudicial
    Left = 813
    Top = 46
  end
  object CDJudicial: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_agencia'
        DataType = ftInteger
      end
      item
        Name = 'id_colocacion'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'cuotas_liquidar'
        DataType = ftInteger
      end
      item
        Name = 'fechacorte'
        DataType = ftDate
      end
      item
        Name = 'garantia'
        DataType = ftInteger
      end
      item
        Name = 'clasificacion'
        DataType = ftInteger
      end
      item
        Name = 'categoria'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'estado'
        DataType = ftInteger
      end
      item
        Name = 'valorcuota'
        DataType = ftCurrency
      end
      item
        Name = 'fechapagok'
        DataType = ftDate
      end
      item
        Name = 'fechapagoi'
        DataType = ftDate
      end
      item
        Name = 'tipointeres'
        DataType = ftInteger
      end
      item
        Name = 'puntosadic'
        DataType = ftCurrency
      end
      item
        Name = 'saldo_actual'
        DataType = ftCurrency
      end
      item
        Name = 'amortizak'
        DataType = ftInteger
      end
      item
        Name = 'amortizai'
        DataType = ftInteger
      end
      item
        Name = 'diasproroga'
        DataType = ftInteger
      end
      item
        Name = 'valortasa'
        DataType = ftFloat
      end
      item
        Name = 'valormora'
        DataType = ftFloat
      end
      item
        Name = 'tipo'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 837
    Top = 46
    Data = {
      E80100009619E0BD010000001800000014000000000003000000E8010A69645F
      6167656E63696104000100000000000D69645F636F6C6F636163696F6E010049
      0000000100055749445448020002000B000F63756F7461735F6C697175696461
      7204000100000000000A6665636861636F727465040006000000000008676172
      616E74696104000100000000000D636C6173696669636163696F6E0400010000
      0000000963617465676F72696101004900000001000557494454480200020001
      000665737461646F04000100000000000A76616C6F7263756F74610800040000
      00010007535542545950450200490006004D6F6E6579000A6665636861706167
      6F6B04000600000000000A66656368617061676F6904000600000000000B7469
      706F696E746572657304000100000000000A70756E746F736164696308000400
      0000010007535542545950450200490006004D6F6E6579000C73616C646F5F61
      637475616C080004000000010007535542545950450200490006004D6F6E6579
      0009616D6F7274697A616B040001000000000009616D6F7274697A6169040001
      00000000000B6469617370726F726F676104000100000000000976616C6F7274
      61736108000400000000000976616C6F726D6F72610800040000000000047469
      706F04000100000000000000}
    object IntegerField1: TIntegerField
      FieldName = 'id_agencia'
    end
    object StringField1: TStringField
      FieldName = 'id_colocacion'
      Size = 11
    end
    object IntegerField2: TIntegerField
      FieldName = 'cuotas_liquidar'
    end
    object DateField1: TDateField
      FieldName = 'fechacorte'
    end
    object IntegerField3: TIntegerField
      FieldName = 'garantia'
    end
    object IntegerField4: TIntegerField
      FieldName = 'clasificacion'
    end
    object StringField2: TStringField
      FieldName = 'categoria'
      Size = 1
    end
    object IntegerField5: TIntegerField
      FieldName = 'estado'
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'valorcuota'
    end
    object DateField2: TDateField
      FieldName = 'fechapagok'
    end
    object DateField3: TDateField
      FieldName = 'fechapagoi'
    end
    object IntegerField6: TIntegerField
      FieldName = 'tipointeres'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'puntosadic'
    end
    object CurrencyField3: TCurrencyField
      DisplayWidth = 20
      FieldName = 'saldo_actual'
    end
    object IntegerField7: TIntegerField
      FieldName = 'amortizak'
    end
    object IntegerField8: TIntegerField
      FieldName = 'amortizai'
    end
    object IntegerField9: TIntegerField
      FieldName = 'diasproroga'
    end
    object FloatField1: TFloatField
      FieldName = 'valortasa'
    end
    object FloatField2: TFloatField
      FieldName = 'valormora'
    end
    object IntegerField10: TIntegerField
      FieldName = 'tipo'
    end
  end
  object IBHonorarios: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 824
    Top = 272
  end
  object IBExtractoInt: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 760
    Top = 328
  end
  object IBSQL9: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 792
    Top = 328
  end
  object IBSQL10: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 816
    Top = 328
  end
  object IBcdat: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 224
    Top = 104
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
        DataType = ftDate
      end
      item
        Name = 'DESTINO1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MONTO1'
        DataType = ftCurrency
      end
      item
        Name = 'DESTINO2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MONTO2'
        DataType = ftCurrency
      end
      item
        Name = 'DESTINO3'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MONTO3'
        DataType = ftCurrency
      end
      item
        Name = 'GARANTIA1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VGARANTIA1'
        DataType = ftCurrency
      end
      item
        Name = 'GARANTIA2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VGARANTIA2'
        DataType = ftCurrency
      end
      item
        Name = 'GARANTIA3'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VGARANTIA3'
        DataType = ftCurrency
      end
      item
        Name = 'LINEA'
        DataType = ftString
        Size = 4
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 856
    Top = 6
    Data = {
      680200009619E0BD01000000180000001200000000000300000068020C4E4F5F
      42414E434F4C4445580100490000000100055749445448020002000F000B454D
      504C454F535F41435401004900000001000557494454480200020003000F454D
      504C454F535F47454E4552415201004900000001000557494454480200020003
      000D544F54414C5F41435449564F530800040000000100075355425459504502
      00490006004D6F6E6579000D46454348415F41435449564F5304000600000000
      000844455354494E4F310100490000000100055749445448020002001E00064D
      4F4E544F31080004000000010007535542545950450200490006004D6F6E6579
      000844455354494E4F320100490000000100055749445448020002001E00064D
      4F4E544F32080004000000010007535542545950450200490006004D6F6E6579
      000844455354494E4F330100490000000100055749445448020002001E00064D
      4F4E544F33080004000000010007535542545950450200490006004D6F6E6579
      0009474152414E544941310100490000000100055749445448020002001E000A
      56474152414E5449413108000400000001000753554254595045020049000600
      4D6F6E65790009474152414E5449413201004900000001000557494454480200
      02001E000A56474152414E544941320800040000000100075355425459504502
      00490006004D6F6E65790009474152414E544941330100490000000100055749
      445448020002001E000A56474152414E54494133080004000000010007535542
      545950450200490006004D6F6E657900054C494E454101004900000001000557
      494454480200020004000000}
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
    object CDBancoldexFECHA_ACTIVOS: TDateField
      DisplayWidth = 4
      FieldName = 'FECHA_ACTIVOS'
    end
    object CDBancoldexDESTINO1: TStringField
      FieldName = 'DESTINO1'
      Size = 30
    end
    object CDBancoldexMONTO1: TCurrencyField
      FieldName = 'MONTO1'
    end
    object CDBancoldexDESTINO2: TStringField
      FieldName = 'DESTINO2'
      Size = 30
    end
    object CDBancoldexMONTO2: TCurrencyField
      FieldName = 'MONTO2'
    end
    object CDBancoldexDESTINO3: TStringField
      FieldName = 'DESTINO3'
      Size = 30
    end
    object CDBancoldexMONTO3: TCurrencyField
      FieldName = 'MONTO3'
    end
    object CDBancoldexGARANTIA1: TStringField
      FieldName = 'GARANTIA1'
      Size = 30
    end
    object CDBancoldexVGARANTIA1: TCurrencyField
      FieldName = 'VGARANTIA1'
    end
    object CDBancoldexGARANTIA2: TStringField
      FieldName = 'GARANTIA2'
      Size = 30
    end
    object CDBancoldexVGARANTIA2: TCurrencyField
      FieldName = 'VGARANTIA2'
    end
    object CDBancoldexGARANTIA3: TStringField
      FieldName = 'GARANTIA3'
      Size = 30
    end
    object CDBancoldexVGARANTIA3: TCurrencyField
      FieldName = 'VGARANTIA3'
    end
    object CDBancoldexLINEA: TStringField
      FieldName = 'LINEA'
      Size = 4
    end
  end
  object DSBancoldex: TDataSource
    DataSet = CDBancoldex
    Left = 832
    Top = 6
  end
  object IBSQL11: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'select NOMBRE from "gen$destinoban" where CODIGO = :CODIGO')
    Transaction = IBTransaction6
    Left = 864
    Top = 48
  end
  object IBSQL12: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'select NOMBRE from "gen$tipogarantiaban" where CODIGO = :CODIGO')
    Transaction = IBTransaction6
    Left = 864
    Top = 80
  end
  object IBTransaction6: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 800
    Top = 136
  end
  object IBSQL13: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction9
    Left = 840
    Top = 328
  end
  object IBTransaction9: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Left = 832
    Top = 136
  end
  object IBQuery3: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 616
    Top = 8
  end
  object DsTipocuanta: TDataSource
    DataSet = IbTipocuenta
    Left = 336
    Top = 368
  end
  object IbTipocuenta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      'SELECT '
      '  "cap$tipocaptacion".ID_TIPO_CAPTACION,'
      '  "cap$tipocaptacion".DESCRIPCION'
      'FROM'
      ' "cap$tipocaptacion"'
      'WHERE'
      '  ("cap$tipocaptacion".ID_TIPO_CAPTACION IN (2,4))')
    Left = 416
    Top = 376
  end
end
