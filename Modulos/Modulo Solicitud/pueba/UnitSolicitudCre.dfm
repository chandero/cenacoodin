object FrmSolicitudCre: TFrmSolicitudCre
  Left = 110
  Top = 119
  Width = 547
  Height = 385
  BorderIcons = [biSystemMenu]
  Caption = 'Solicitud de Creditos'
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
    Top = 0
    Width = 539
    Height = 81
    Alignment = taLeftJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 2
      Width = 131
      Height = 13
      Caption = 'Informacion Solicitante'
    end
    object JvLabel1: TJvLabel
      Left = 4
      Top = 24
      Width = 65
      Height = 13
      Caption = 'Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvLabel2: TJvLabel
      Left = 197
      Top = 24
      Width = 50
      Height = 13
      Caption = 'Nombres'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Label2: TLabel
      Left = 4
      Top = 50
      Width = 44
      Height = 13
      Caption = 'Aportes'
    end
    object Label3: TLabel
      Left = 197
      Top = 50
      Width = 41
      Height = 13
      Caption = 'Cuenta'
    end
    object JVnombres: TJvEdit
      Left = 254
      Top = 22
      Width = 283
      Height = 21
      TabStop = False
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      BorderStyle = bsNone
      CharCase = ecUpperCase
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 1
    end
    object Direccion: TEdit
      Left = 254
      Top = 48
      Width = 99
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 2
    end
    object JVdocumento: TJvEdit
      Left = 72
      Top = 22
      Width = 121
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
      CharCase = ecUpperCase
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 0
      OnExit = JVdocumentoExit
    end
    object JVtotal: TJvCurrencyEdit
      Left = 72
      Top = 48
      Width = 121
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object Capacitacion: TCheckBox
      Left = 376
      Top = 50
      Width = 121
      Height = 17
      TabStop = False
      Alignment = taLeftJustify
      Caption = 'Capacitaci'#243'n'
      State = cbGrayed
      TabOrder = 4
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 81
    Width = 538
    Height = 229
    ActivePage = TabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '     &Cr'#233'ditos y Fianzas'
      object Panel2: TPanel
        Left = 1
        Top = -1
        Width = 529
        Height = 202
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label4: TLabel
          Left = 5
          Top = 2
          Width = 77
          Height = 13
          Caption = 'Colocaciones'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 6
          Top = 99
          Width = 44
          Height = 13
          Caption = 'Fianzas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBcolocacion: TDBGrid
          Left = 5
          Top = 19
          Width = 520
          Height = 78
          TabStop = False
          DataSource = DScolocacion
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
              FieldName = 'colocacion'
              Title.Caption = 'Colocacion'
              Width = 126
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'valor'
              Title.Caption = 'Saldo'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fecha_interes'
              Title.Caption = 'F. Interes'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado'
              Title.Caption = 'Estado'
              Width = 118
              Visible = True
            end>
        end
        object DBfianza: TDBGrid
          Left = 3
          Top = 115
          Width = 522
          Height = 78
          TabStop = False
          DataSource = DSfianza
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'fianza'
              Title.Caption = 'Colocacion'
              Width = 132
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'valor'
              Title.Caption = 'Saldo'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Fecha_interes'
              Title.Caption = 'F. Interes'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado'
              Title.Caption = 'Estado'
              Width = 120
              Visible = True
            end>
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '     Datos del Credito'
      ImageIndex = 1
      object Label7: TLabel
        Left = 197
        Top = 13
        Width = 90
        Height = 13
        Caption = 'Valor Solicitado'
      end
      object JvLabel4: TJvLabel
        Left = 10
        Top = 174
        Width = 32
        Height = 13
        Caption = 'Plazo'
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clBlack
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object me: TJvLabel
        Left = 112
        Top = 174
        Width = 26
        Height = 13
        Caption = 'Dias'
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clBlack
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object Label6: TLabel
        Left = 432
        Top = 13
        Width = 29
        Height = 13
        Caption = 'Tasa'
      end
      object Label10: TLabel
        Left = 153
        Top = 174
        Width = 81
        Height = 13
        Caption = 'Tipo de Cuota'
      end
      object Label8: TLabel
        Left = -1
        Top = 35
        Width = 118
        Height = 13
        Caption = 'Inversion del Cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object JvLabel3: TJvLabel
        Left = 341
        Top = 174
        Width = 67
        Height = 13
        Caption = 'Valor Cuota'
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clBlack
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object Label9: TLabel
        Left = 2
        Top = 13
        Width = 32
        Height = 13
        Caption = 'Linea'
      end
      object JVvalor: TJvCurrencyEdit
        Left = 292
        Top = 11
        Width = 131
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 1
        OnExit = JVvalorExit
        HasMaxValue = False
        HasMinValue = False
      end
      object JVinteres: TJvFloatEdit2
        Left = 471
        Top = 11
        Width = 49
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 2
        MaxDecimals = 5
        HasMaxValue = False
        HasMinValue = False
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 122
        Width = 531
        Height = 37
        Caption = 'Forma de Pago'
        TabOrder = 4
        object Rmensual: TRadioButton
          Left = 3
          Top = 16
          Width = 113
          Height = 17
          Caption = '&Mensual'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RmensualClick
        end
        object Rbimensual: TRadioButton
          Left = 104
          Top = 16
          Width = 113
          Height = 17
          Caption = '&Bimensual'
          TabOrder = 1
          OnClick = RbimensualClick
        end
        object Rtrimestral: TRadioButton
          Left = 214
          Top = 16
          Width = 113
          Height = 17
          Caption = '&Trimestral'
          TabOrder = 2
          OnClick = RtrimestralClick
        end
        object Rsemestral: TRadioButton
          Left = 331
          Top = 16
          Width = 103
          Height = 17
          Caption = '&Semestral'
          TabOrder = 3
          OnClick = RsemestralClick
        end
        object Ranual: TRadioButton
          Left = 445
          Top = 16
          Width = 73
          Height = 17
          Caption = '&Anual'
          TabOrder = 4
          OnClick = RanualClick
        end
      end
      object TipoCuota: TJvComboBox
        Left = 237
        Top = 172
        Width = 97
        Height = 21
        MaxPixel.Font.Charset = DEFAULT_CHARSET
        MaxPixel.Font.Color = clBlack
        MaxPixel.Font.Height = -11
        MaxPixel.Font.Name = 'MS Sans Serif'
        MaxPixel.Font.Style = []
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 6
        OnClick = TipoCuotaClick
        Items.Strings = (
          'FIJA'
          'VARIABLE')
      end
      object JVvalorcuota: TJvCurrencyEdit
        Left = 412
        Top = 172
        Width = 108
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 7
        OnExit = JVvalorcuotaExit
        HasMaxValue = False
        HasMinValue = False
      end
      object MInversion: TMemo
        Left = 1
        Top = 57
        Width = 525
        Height = 62
        ScrollBars = ssVertical
        TabOrder = 3
        WantReturns = False
        WantTabs = True
        OnExit = MInversionExit
        OnKeyPress = MInversionKeyPress
      end
      object plazo: TJvIntegerEdit
        Left = 49
        Top = 172
        Width = 53
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 5
        Value = 0
        MaxValue = 0
        MinValue = 0
        HasMaxValue = False
        HasMinValue = False
      end
      object DBlinea: TDBLookupComboBox
        Left = 38
        Top = 11
        Width = 151
        Height = 21
        KeyField = 'ID_LINEA'
        ListField = 'DESCRIPCION_LINEA'
        ListSource = DataSource1
        TabOrder = 0
        OnExit = DBlineaExit
      end
    end
    object TabSheet3: TTabSheet
      Caption = '     &Descuentos y Requisitos'
      ImageIndex = 2
      object Label11: TLabel
        Left = 256
        Top = 24
        Width = 96
        Height = 13
        Caption = 'Aportes Sociales'
      end
      object Label12: TLabel
        Left = 8
        Top = 51
        Width = 41
        Height = 13
        Caption = 'Seguro'
      end
      object Label13: TLabel
        Left = 256
        Top = 51
        Width = 74
        Height = 13
        Caption = 'Saldo Deuda'
      end
      object Label14: TLabel
        Left = 256
        Top = 81
        Width = 93
        Height = 13
        Caption = 'Total a Entregar'
      end
      object Label15: TLabel
        Left = 8
        Top = 81
        Width = 53
        Height = 13
        Caption = 'Intereses'
      end
      object JvLabel5: TJvLabel
        Left = 8
        Top = 24
        Width = 87
        Height = 13
        Caption = 'Estudio Credito'
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clBlack
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object Label16: TLabel
        Left = 7
        Top = 111
        Width = 110
        Height = 13
        Caption = 'No. de Codeudores'
      end
      object Label17: TLabel
        Left = 6
        Top = 145
        Width = 52
        Height = 13
        Caption = 'Opci'#243'n 2'
      end
      object Label18: TLabel
        Left = 256
        Top = 145
        Width = 52
        Height = 13
        Caption = 'Opci'#243'n 3'
      end
      object Label19: TLabel
        Left = 256
        Top = 111
        Width = 92
        Height = 13
        Caption = 'Amortiza Interes'
      end
      object JvLabel6: TJvLabel
        Left = 470
        Top = 111
        Width = 26
        Height = 13
        Caption = 'Dias'
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clBlack
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel7: TJvLabel
        Left = 470
        Top = 145
        Width = 26
        Height = 13
        Caption = 'Dias'
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clBlack
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel8: TJvLabel
        Left = 223
        Top = 145
        Width = 26
        Height = 13
        Caption = 'Dias'
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clBlack
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object AportesS: TJvCurrencyEdit
        Left = 376
        Top = 22
        Width = 121
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 1
        HasMaxValue = False
        HasMinValue = False
      end
      object Seguro: TJvCurrencyEdit
        Left = 128
        Top = 49
        Width = 121
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 2
        HasMaxValue = False
        HasMinValue = False
      end
      object SaldoDeuda: TJvCurrencyEdit
        Left = 376
        Top = 49
        Width = 121
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 3
        HasMaxValue = False
        HasMinValue = False
      end
      object Intereses: TJvCurrencyEdit
        Left = 128
        Top = 79
        Width = 121
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 4
        HasMaxValue = False
        HasMinValue = False
      end
      object Total: TJvCurrencyEdit
        Left = 376
        Top = 79
        Width = 121
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 5
        OnEnter = TotalEnter
        HasMaxValue = False
        HasMinValue = False
      end
      object Estudio: TJvCurrencyEdit
        Left = 128
        Top = 22
        Width = 121
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 0
        HasMaxValue = False
        HasMinValue = False
      end
      object BTrequisitos: TBitBtn
        Left = 132
        Top = 178
        Width = 249
        Height = 25
        Caption = 'Requisitos Para Solicitar Credito'
        TabOrder = 9
        OnClick = BTrequisitosClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000030F0000030F000000010000000100000094000000C6
          0000319C42004A524A00429C4A0052525200527352005A5A5A00635A5A005AAD
          5A005AB55A004ABD5A005A63630063636300636B63006384630063636B006B63
          6B006B6B6B006B946B00736B7300737373007394730073737B007B737B007B7B
          7B008C847B00738C7B006B9C7B007B9C7B0084CE7B0073D67B007B8484008484
          84007B9484007B9C840073AD84008C848C008C8C8C0094948C008CA58C009494
          940084A594009C949C009C9C9C00A5A5A500ADADAD00B5B5AD00B5B5B500BDB5
          B500BDBDBD00C6BDBD00CEC6BD00C6C6C600D6D6D600FF00FF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373737373737
          3737373737373737373737373737373737373737373737373737373737122C0D
          12212E32322D262937373737370D321212262E3536322D2E3737373737073212
          12212E3536322D2E37373737370D2E0D0712152A00242C263737373737072D0D
          0D212E011F002626373737373708331211212E011F002D2E37373737370C3212
          060F1D011F001D233737373737083010040000010B0000000237373737082D0E
          091E1E1E1F0101010937373737083312061B28011F00161D3737373737082F12
          0D202C011F002C2D373737373707290D071215011F0026263737373737032921
          27292922131C26193737373737371A1814171515151921373737}
      end
      object codeudores: TJvIntegerEdit
        Left = 128
        Top = 109
        Width = 121
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
      object frPreview1: TfrPreview
        Left = 496
        Top = 8
        Width = 185
        Height = 41
        BevelOuter = bvLowered
        Caption = 'frPreview1'
        TabOrder = 10
        ScrollBars = ssBoth
      end
      object opcion1: TJvIntegerEdit
        Left = 128
        Top = 143
        Width = 88
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 7
        Value = 0
        MaxValue = 0
        MinValue = 0
        HasMaxValue = False
        HasMinValue = False
      end
      object opcion2: TJvIntegerEdit
        Left = 379
        Top = 143
        Width = 86
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 8
        Value = 0
        MaxValue = 0
        MinValue = 0
        HasMaxValue = False
        HasMinValue = False
      end
      object Ainteres: TJvIntegerEdit
        Left = 377
        Top = 109
        Width = 88
        Height = 21
        Alignment = taRightJustify
        ReadOnly = False
        TabOrder = 11
        Value = 30
        MaxValue = 0
        MinValue = 0
        HasMaxValue = False
        HasMinValue = False
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 309
    Width = 417
    Height = 41
    Color = clOlive
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object BTnuevo: TSpeedButton
      Left = 7
      Top = 8
      Width = 126
      Height = 25
      Caption = '&Nueva Solicitud'
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
      OnClick = BTnuevoClick
    end
    object BTgrafico: TBitBtn
      Left = 144
      Top = 8
      Width = 126
      Height = 25
      Caption = 'Reporte &Grafico'
      TabOrder = 0
      TabStop = False
      OnClick = BTgraficoClick
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
    object BTtextual: TBitBtn
      Left = 280
      Top = 8
      Width = 126
      Height = 25
      Caption = 'Reporte &Textual'
      TabOrder = 1
      TabStop = False
      OnClick = BTtextualClick
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
  end
  object Panel4: TPanel
    Left = 417
    Top = 309
    Width = 121
    Height = 41
    Color = clOlive
    TabOrder = 3
    object BTcerrar: TSpeedButton
      Left = 20
      Top = 7
      Width = 81
      Height = 25
      Caption = '&Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      ParentFont = False
      OnClick = BTcerrarClick
    end
  end
  object CDcolocacion: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'colocacion'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'fecha_interes'
        DataType = ftDate
      end
      item
        Name = 'valor'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 504
    Top = 312
    Data = {
      840000009619E0BD01000000180000000400000000000300000084000A636F6C
      6F636163696F6E0100490000000100055749445448020002001E000665737461
      646F0100490000000100055749445448020002001E000D66656368615F696E74
      6572657304000600000000000576616C6F720100490000000100055749445448
      020002001E000000}
    object CDcolocacioncolocacion: TStringField
      DisplayWidth = 16
      FieldName = 'colocacion'
      Size = 30
    end
    object CDcolocacionestado: TStringField
      FieldName = 'estado'
      Size = 30
    end
    object CDcolocacionfecha_interes: TDateField
      FieldName = 'fecha_interes'
    end
    object CDcolocacionvalor: TStringField
      FieldName = 'valor'
      Size = 30
    end
  end
  object CDfianzas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'fianza'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Fecha_interes'
        DataType = ftDate
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'valor'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 504
    Top = 312
    Data = {
      800000009619E0BD010000001800000004000000000003000000800006666961
      6E7A610100490000000100055749445448020002001E000D46656368615F696E
      746572657304000600000000000665737461646F010049000000010005574944
      5448020002001E000576616C6F72010049000000010005574944544802000200
      1E000000}
    object CDfianzasfianza: TStringField
      DisplayWidth = 20
      FieldName = 'fianza'
      Size = 30
    end
    object CDfianzasFecha_interes: TDateField
      DisplayWidth = 13
      FieldName = 'Fecha_interes'
    end
    object CDfianzasestado: TStringField
      FieldName = 'estado'
      Size = 30
    end
    object CDfianzasvalor: TStringField
      FieldName = 'valor'
      Size = 30
    end
  end
  object DScolocacion: TDataSource
    DataSet = CDcolocacion
    Left = 288
    Top = 88
  end
  object DSfianza: TDataSource
    DataSet = CDfianzas
    Left = 280
    Top = 80
  end
  object IBConsulta: TIBQuery
    Database = DataGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 256
    Top = 80
  end
  object IBdatos: TIBQuery
    Database = DataGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 296
    Top = 128
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = DataGeneral.IBDatabase1
    Left = 304
    Top = 88
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 320
    Top = 80
    ReportForm = {19000000}
  end
  object frCompositeReport1: TfrCompositeReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    DoublePassReport = False
    Left = 360
    Top = 80
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDcolocacion
    Left = 344
    Top = 88
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = CDfianzas
    Left = 320
    Top = 136
  end
  object CDrequisitos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 312
    Data = {
      5B0000009619E0BD0100000018000000020000000000030000005B000E646573
      6372697063696F6E5F7265010049000000010005574944544802000200640009
      72657175697369746F01004900000001000557494454480200020064000000}
    object CDrequisitosdescripcion_re: TStringField
      FieldName = 'descripcion_re'
      Size = 100
    end
    object CDrequisitosrequisito: TStringField
      FieldName = 'requisito'
      Size = 100
    end
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = CDrequisitos
    Left = 392
    Top = 88
  end
  object conyugue: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 312
    Data = {
      3A0000009619E0BD0100000018000000010000000000030000003A000B646573
      6372697063696F6E01004900000001000557494454480200020064000000}
    object conyuguedescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object solicitante: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 312
    Data = {
      3A0000009619E0BD0100000018000000010000000000030000003A000B646573
      6372697063696F6E01004900000001000557494454480200020064000000}
    object solicitantedescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object codeudor: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 312
    Data = {
      3A0000009619E0BD0100000018000000010000000000030000003A000B646573
      6372697063696F6E01004900000001000557494454480200020064000000}
    object codeudordescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object PRreport: TprTxReport
    ShowProgress = True
    CanUserEdit = False
    DesignerFormMode = fmNormal
    PreviewFormMode = fmNormal
    Collate = False
    Copies = 1
    FromPage = 1
    ToPage = 1
    PrintPagesMode = ppmAll
    Title = 'Liquidaci'#243'n Barrido'
    ExportOptions = [preoShowParamsDlg, preoShowProgress, preoShowAfterGenerate]
    ExportPagesMode = ppmAll
    ExportFromPage = 0
    ExportToPage = 0
    Values = <>
    Variables = <
      item
        Name = 'empresa'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'fecha'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'nit'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'nombre'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'aportes'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'codeudores'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'vsolicitado'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'vcuota'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'fpago'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'plazo'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'tcuota'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'interes'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'inversion'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'aportess'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'sdeuda'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'credito'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'seguro'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'dinteres'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'tdescuento'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'ttotal'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'linea'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'interesess'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'empleado'
        ValueType = 'prvvtString'
        Value = ''
      end>
    PrinterName = '\\DEPARTAS02\EPSON FX-1180+ ESC/P'
    ESCModelName = 'Epson printers'
    LeftSpaces = 0
    WrapAfterColumn = 0
    StartNewLineOnWrap = False
    EjectPageAfterPrint = False
    PaperType = ptPage
    UseLinesOnPage = False
    LinesOnPage = 0
    MakeFormFeedOnRulon = False
    PrintRulonMode = prmAllLines
    FromLine = 0
    ToLine = 0
    ExportTxOptions = []
    ExportFromLine = 0
    ExportToLine = 0
    ExportCodePage = prtxcpDOS866
    Left = 400
    Top = 144
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 1'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 1'
      'ProcessorType: 586'
      ''
      'Compiler version: Delphi6'
      'PReport version: 1.83')
    object prTxPage1: TprTxPage
      PageType = tptPage
      LineNum = 60
      ColNum = 150
      object prTxHTitleBand1: TprTxHTitleBand
        Height = 10
        UseVerticalBands = False
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[empresa]'
                '')
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
          dRec.Top = 1
          dRec.Right = 24
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
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
          dRec.Left = 4
          dRec.Top = 2
          dRec.Right = 24
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'REQUISITOS PARA SOLICITAR CREDITO'
                'INFORMACION SOLICITANTE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 24
          dRec.Top = 1
          dRec.Right = 71
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
                  '----------------------------------------------------------------' +
                  '---------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 4
          dRec.Right = 137
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INFORMACION GENERAL DEL SOLICITANTE ')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 5
          dRec.Right = 137
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 6
          dRec.Right = 137
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'NOMBRES: [nombre]    APORTES A LA FECHA: [aportes]    No CODEUDO' +
                  'RES: [codeudores]')
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
          dRec.Top = 7
          dRec.Right = 137
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj36: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INVERSION: [inversion]')
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
          dRec.Top = 8
          dRec.Right = 137
          dRec.Bottom = 9
          Visible = False
        end
        object prTxCommandObj2: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcCondensedOff
                txcBoldOn)
            end>
          dRec.Left = 2
          dRec.Top = 1
          dRec.Right = 3
          dRec.Bottom = 2
          Visible = False
        end
        object prTxCommandObj1: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcCondensedOn
                txcNormal
                txcBoldOff)
            end>
          dRec.Left = 2
          dRec.Top = 2
          dRec.Right = 3
          dRec.Bottom = 3
          Visible = False
        end
        object prTxCommandObj4: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcCondensedOn
                txcNormal
                txcBoldOff)
            end>
          dRec.Left = 3
          dRec.Top = 4
          dRec.Right = 4
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj56: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha Realizacion: [fecha]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 75
          dRec.Top = 3
          dRec.Right = 130
          dRec.Bottom = 4
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        VisibleFormula = '(CDcolocacion.colocacion)<>""'
        Height = 1
        UseVerticalBands = False
        DataSetName = 'CDcolocacion'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand1')
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDcolocacion.colocacion]')
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
          dRec.Right = 45
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDcolocacion.valor]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 46
          dRec.Top = 0
          dRec.Right = 72
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<dd/mmm/yy>CDcolocacion.fecha_interes]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 72
          dRec.Top = 0
          dRec.Right = 94
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDcolocacion.estado]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 94
          dRec.Top = 0
          dRec.Right = 112
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        VisibleFormula = 'CDtitulo.titulo <> ""'
        Height = 1
        UseVerticalBands = False
        DetailBand = PRreport.prTxHDetailBand1
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDtitulo.titulo]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 2
          dRec.Top = -1
          dRec.Right = 137
          dRec.Bottom = 0
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDtitulo.pagare]')
              DeleteEmptyLinesAtEnd = True
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
          dRec.Right = 45
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDtitulo.saldo]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 46
          dRec.Top = 0
          dRec.Right = 72
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDtitulo.fecha]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 72
          dRec.Top = 0
          dRec.Right = 94
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDtitulo.estado]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 94
          dRec.Top = 0
          dRec.Right = 112
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
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
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 45
          dRec.Top = 0
          dRec.Right = 46
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
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
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 45
          dRec.Top = 2
          dRec.Right = 46
          dRec.Bottom = 3
          Visible = False
        end
      end
      object prTxHDetailBand2: TprTxHDetailBand
        Height = 7
        UseVerticalBands = False
        DataSetName = 'CDcredito'
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDcredito.titulo1]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 1
          dRec.Right = 71
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 0
          dRec.Right = 137
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 2
          dRec.Right = 137
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDcredito.titulo2]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 72
          dRec.Top = 1
          dRec.Right = 137
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
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
          dRec.Left = 71
          dRec.Top = 1
          dRec.Right = 72
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR SOLICITADO: ')
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
          dRec.Top = 3
          dRec.Right = 21
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR CUOTA:')
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
          dRec.Top = 4
          dRec.Right = 21
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FORMA DE PAGO')
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
          dRec.Top = 5
          dRec.Right = 21
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$[vsolicitado]')
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
          dRec.Right = 41
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$[vcuota][interesess]')
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
          dRec.Right = 41
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[fpago]')
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
          dRec.Right = 41
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'PLAZO:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 42
          dRec.Top = 3
          dRec.Right = 53
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TIPO CUOTA:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 42
          dRec.Top = 4
          dRec.Right = 53
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INTERES:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 42
          dRec.Top = 5
          dRec.Right = 53
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[plazo] DIAS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 54
          dRec.Top = 3
          dRec.Right = 70
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj34: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[tcuota]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 54
          dRec.Top = 4
          dRec.Right = 70
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj35: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[interes]%')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 54
          dRec.Top = 5
          dRec.Right = 70
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj37: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'APORTES SOCIALES:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 72
          dRec.Top = 3
          dRec.Right = 89
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj38: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SALDO DEUDA:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 72
          dRec.Top = 4
          dRec.Right = 89
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj39: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'EST. CREDITO:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 72
          dRec.Top = 5
          dRec.Right = 89
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj40: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$[aportess]')
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
          dRec.Top = 3
          dRec.Right = 108
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj41: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$[sdeuda]')
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
          dRec.Right = 108
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj42: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$[credito]')
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
          dRec.Top = 5
          dRec.Right = 108
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj43: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SEGURO:')
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
          dRec.Top = 3
          dRec.Right = 117
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj44: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INTERES:')
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
          dRec.Top = 4
          dRec.Right = 117
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj45: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$[seguro]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 118
          dRec.Top = 3
          dRec.Right = 137
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj46: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$[dinteres]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 118
          dRec.Top = 4
          dRec.Right = 137
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj47: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR TOTAL A ENTREGAR: $[ttotal]')
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
          dRec.Top = 6
          dRec.Right = 70
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj48: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTAL DESCUENTOS: $[tdescuento]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 72
          dRec.Top = 6
          dRec.Right = 137
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj52: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'LINEA:')
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
          dRec.Top = 5
          dRec.Right = 117
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj53: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[linea]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 118
          dRec.Top = 5
          dRec.Right = 137
          dRec.Bottom = 6
          Visible = False
        end
      end
      object prrequisito: TprTxHGroupHeaderBand
        Height = 3
        UseVerticalBands = False
        Group = PRreport.prGroup1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        StartNewPage = False
        ReprintOnEachPage = False
        object prTxMemoObj49: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'REQUISITOS : [CDrequisitos.descripcion_re]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 1
          dRec.Right = 137
          dRec.Bottom = 2
          Visible = False
        end
        object prTxCommandObj5: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcBoldOn)
            end>
          dRec.Left = 3
          dRec.Top = 1
          dRec.Right = 4
          dRec.Bottom = 2
          Visible = False
        end
        object prTxCommandObj6: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcBoldOff)
            end>
          dRec.Left = 137
          dRec.Top = 1
          dRec.Right = 138
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj54: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 2
          dRec.Right = 137
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj55: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 0
          dRec.Right = 137
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailBand3: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'CDrequisitos'
        ColCount = 2
        ColDirection = prcdLeftRightTopBottom
        Groups = (
          'prGroup1')
        object prTxMemoObj50: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '- [CDrequisitos.requisito]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = True
              CanResizeY = True
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = True
            end>
          dRec.Left = 4
          dRec.Top = 0
          dRec.Right = 67
          dRec.Bottom = 1
          dRec.WidthAsVerticalBand = True
          dRec.HeightAsHorizontalBand = True
          Visible = False
        end
      end
      object prTxHSummaryBand1: TprTxHSummaryBand
        Height = 7
        UseVerticalBands = False
        object prTxMemoObj51: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[empleado]'
                'Empleado Responsable')
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
          dRec.Top = 3
          dRec.Right = 41
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj57: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'NOTA: LAS SOLICITUDES DE CREDITOS QUEDAN SUJETAS A LOS CAMBIOS Q' +
                  'UE PUEDAN PRESENTARSE')
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
          dRec.Top = 1
          dRec.Right = 99
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj58: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 0
          dRec.Right = 137
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj59: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'RECUERDE: En Crediservir obtiene mas y mejores servicios. Credis' +
                  'ervir Aumenta su'
                'patrimonio, protege y cuida sus intereses.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 4
          dRec.Top = 5
          dRec.Right = 138
          dRec.Bottom = 7
          Visible = False
        end
      end
    end
    object prGroup1: TprGroup
      Valid = 'CDrequisitos.descripcion_re'
      DetailBand = PRreport.prTxHDetailBand3
    end
  end
  object CDtitulo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'titulo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'pagare'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'fecha'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'saldo'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 504
    Top = 312
    Data = {
      9F0000009619E0BD0100000018000000050000000000030000009F0006746974
      756C6F0100490000000100055749445448020002003200067061676172650100
      4900000001000557494454480200020032000566656368610100490000000100
      0557494454480200020032000665737461646F01004900000001000557494454
      480200020032000573616C646F0100490000000100055749445448020002000F
      000000}
    object CDtitulotitulo: TStringField
      FieldName = 'titulo'
      Size = 50
    end
    object CDtitulopagare: TStringField
      FieldName = 'pagare'
      Size = 50
    end
    object CDtitulofecha: TStringField
      FieldName = 'fecha'
      Size = 50
    end
    object CDtituloestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object CDtitulosaldo: TStringField
      FieldName = 'saldo'
      Size = 15
    end
  end
  object CDcredito: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 80
    Data = {
      520000009619E0BD010000001800000002000000000003000000520007746974
      756C6F310100490000000100055749445448020002001E0007746974756C6F32
      0100490000000100055749445448020002001E000000}
    object CDcreditotitulo1: TStringField
      FieldName = 'titulo1'
      Size = 30
    end
    object CDcreditotitulo2: TStringField
      FieldName = 'titulo2'
      Size = 30
    end
  end
  object IBlineas: TIBQuery
    Database = DataGeneral.IBDatabase1
    Transaction = DataGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "col$lineas".ID_LINEA,'
      '  "col$lineas".DESCRIPCION_LINEA,'
      '  "col$lineas".VECES_APORTES'
      'FROM'
      '  "col$lineas"')
    Left = 368
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = IBlineas
    Left = 248
    Top = 80
  end
  object reporte: TprReport
    ShowProgress = True
    CanUserEdit = False
    DesignerFormMode = fmNormal
    PreviewFormMode = fmNormal
    Collate = False
    Copies = 1
    FromPage = 1
    ToPage = 1
    PrintPagesMode = ppmAll
    ExportOptions = [preoShowParamsDlg, preoShowProgress, preoShowAfterGenerate]
    ExportPagesMode = ppmAll
    ExportFromPage = 0
    ExportToPage = 0
    Values = <>
    Variables = <
      item
        Name = 'empresa'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'fecha'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'nit'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'nombre'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'aportes'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'codeudores'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'vsolicitado'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'vcuota'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'fpago'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'plazo'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'tcuota'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'interes'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'inversion'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'aportess'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'sdeuda'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'credito'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'seguro'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'dinteres'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'tdescuento'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'ttotal'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'linea'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'interesess'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'empleado'
        ValueType = 'prvvtString'
        Value = ''
      end>
    PrinterName = '\\DEPARTAS02\EPSON FX-1180+ ESC/P'
    ExportPrecision = 1
    ExportPrecisionLow = 10
    ExportPrecisionNormal = 5
    ExportPrecisionHigh = 1
    PreviewParams.Options = []
    PreviewParams.ShowToolbars = [prptPreviewCommon]
    Left = 328
    Top = 65528
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 1'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 1'
      'ProcessorType: 586'
      ''
      'Compiler version: Delphi6'
      'PReport version: 1.83')
    LOGPIXELSX = 96
    LOGPIXELSY = 96
    object prPage1: TprPage
      Width = 2159
      Height = 2794
      PaperSize = 1
      Orientation = poPortrait
      lMargin = 10
      rMargin = 10
      tMargin = 10
      bMargin = 10
      object prHTitleBand1: TprHTitleBand
        Height = 72
        UseVerticalBands = False
        object prImageObj1: TprImageObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              ImageSource = isPicture
              Picture.Data = {
                0A544A504547496D6167652C270000FFD8FFE000104A4649460001010100C800
                C80000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
                0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
                3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
                3232323232323232323232323232323232323232323232323232323232323232
                32323232323232323232323232FFC0001108008500F403012200021101031101
                FFC4001F0000010501010101010100000000000000000102030405060708090A
                0BFFC400B5100002010303020403050504040000017D01020300041105122131
                410613516107227114328191A1082342B1C11552D1F02433627282090A161718
                191A25262728292A3435363738393A434445464748494A535455565758595A63
                6465666768696A737475767778797A838485868788898A92939495969798999A
                A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
                D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
                01010101010101010000000000000102030405060708090A0BFFC400B5110002
                0102040403040705040400010277000102031104052131061241510761711322
                328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
                292A35363738393A434445464748494A535455565758595A636465666768696A
                737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
                A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
                E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
                28A2800A28A2800A28A86EAEA0B2B596EAE6558A0894BC9239C0503A93400CD4
                350B5D2AC26BEBD9961B685773BB761FD4F6C5782EBBF12757D47C4B16A7612B
                DA5B5AB116D6E4E432F73201C12DDC76E80F1930F8EBC6D3F8B6FC4716E8B4B8
                1F30447AB9E9E630F5C741D81F735C95348F0F198D72972D37A23E97F09F8AEC
                BC59A50BAB6FDDCE985B8B7272D137F5079C1EFEC7206FD7CB7A0EB97BE1CD5A
                2D46C1F6CA9F2B21FBB221EAADEC703E9C1AFA33C35E24B1F1469097F64D83F7
                65858FCD13F753FE3DE91DF84C5AAD1B3F891B14514507685145140051451400
                5145140051451400514578F7C4BF881F6833F87F4797F75CA5E5C21FBDD8C6BE
                DEA7BF4F5A0C6B568D187348ABF117E223EA333691A1DC3A59C6DFBEBA89B066
                607A291FC23D7B9F61CF57F0EFC7E9E208174BD49C26AD12FCAFD05CA81D47A3
                0EE3F11DC0F09A7452C904F1CF0C8D1CB1B07474382AC0E4107B1CD3B1E2C31F
                5155E77B763EB4A2B88F87FE3B8FC4F67F63BC2B1EAB02FCEA38132FF7D7FA8E
                DF435DBD23DDA7523522A51D828A28A0B0A28A2800A28A2800A28A2800A28A6B
                BAC68CEEC151465989C003D4D0024D3476F0BCD348B1C51A96776380A07524D7
                80F8FBC772F8A2ECD959B347A4C2F951D0CEC3A3B7B7A0FC4F3D2D7C44F1FB78
                8656D2B4C90AE951B7CF20E0DCB0EFFEE0EC3BF5F4AE029A3C5C76339BF774DE
                9D428A28A679615AFE1BF11DF785F565BFB26DC0FCB342C70B2A7A1FE87B7E60
                E45141509383E68EE7D47A06BD65E22D262D42C64DD1BF0C87EF46DDD587622B
                4EBE67F09F8AAF3C27AB0BAB7CC96F2616E2DC9C0917FA30EC7FA57D15A46AF6
                5AE6990EA1613096DE51907BA9EEA47623D2A4FA1C2E29578F997A8A28A0EB0A
                28A2800A28A2800A28AF34F88FF10469492689A44BFE9EE313CEA7FD403D87FB
                67F4FAD06756AC69479A453F895F104DB99B40D1A6C4D82B757287EE7AA29FEF
                7A9EDD3AF4F1F000181D2968A67CE622BCAB4B9A414514533025B5BAB8B1BB86
                EED66786E2160F1C887054FF009FCEBE82F0278DE0F15D818E60B0EA700FDF44
                3A38FEFAFB1F4EC7F027E78AB3A7EA175A56A10DF58CCD0DCC2DB91C7F223B83
                D08A475617152A12F23EADA2B98F0678CAD3C5BA6F98A0437D1002E2DF3F74FF
                00797D54FF00F5ABA7A47D1426A71E68EC14514505051451400514514005788F
                C48F1FFF006B492689A44DFE80871713A1FF005E47F083FDC1FAFD3ADBF893F1
                08DC99B41D1A6FDC729777287EFF00AC6A7D3D4F7E9D339F2CA68F1F1D8CFF00
                9774FE6145141008C1008EE0D33C910104020E41E4114B404288A4F46CE0FA90
                707F1E84FF00BD5E9FF09BC2DA4EB365AADEEA96305E1DE2DA359D03045DB962
                01E84E473D78A573AA9615D4ABECD3F3BF91E61485D57EF301F538AB17F6A2C3
                54BFB10E5D6D2EA6B70EDD584723264FD42E6ABC0DE45CF9F2A13B586531CEDE
                E31EB8C8C7AE451722347DE6A6EC93B7E3FF000E2D749E0DF185D784B54F3577
                4B633102E6DC1EA3FBCBE8C3F5E9F4E7268CDB49246EC1BCB38DC0F0C3190C3D
                88C303DC106BD4EE3E1BE9917C2D1A98593FB656C85EB4FE6360B6DDE63DB9DB
                B71F2F4CF7EB45CDB0D87AAE6DC1D9C4F58D3B50B5D574F86FACA659ADA65DC8
                EBDC7F883C11D88A923BBB69A69218AE227963FBE8AE0B2FD476AF9E7C11E35B
                EF0B5E186253716572D86B727A39E1597D0E719F51F8576F6564343B1D03C631
                B2C924D330BF963C1DF04DD3711D4821588EF231F5A47B386C42AF0E6EA7AAD1
                599AEDF4965A05D5D5AB0F3B60585BA8DEC42A9FCC8ACE8AC57C3FAC69896D35
                C3C37C5EDE7134CD2179446D22C877138388DC1C75C8F4141D0744EE91C6D248
                CA88A0966638000EE4D3629E19B7F952A49B1B6B6C60769EB83E87915CA78E09
                D564D2FC2B19FF0090A5C06BAC7F0DB47F3BFF00DF580BE9CE3BD72DE2BD764F
                02EBDAAFF64A40CFA8431BEC0062D9CE46E2A3E8C47A9739E30084CE4A11727D
                0D7F88BE3E5D0216D2B4D901D5645F9DC73F6753DCFF00B44741F8FA67C2D999
                D99998B33125998E4927B9AEABC07A245E2CF19F95AABC93C22392EAE32E774C
                D900066EBC96C9FA53FE247872CFC35E2A5834E431D9DCDBACE91162DE5B6E2A
                C013CE3853F527B6299E262154AF4FDBBDBB1C8160B8C903270327A9A0104641
                047B54C9F25A48F8E666F2978ECA55DFF5F2C7E247AD42B1ED8F781F2EEDA7D8
                E323F31C7D518F7A2E72BA3EEDEFADAF6F2FEB5F4168AECFE1A785ECBC4DAF5C
                8D4A3696CED200E620E543BB1C2E4820E0618FE5585E28D21341F14EA5A5C6C5
                A2B79B1196393B1955D413DC80C07E140E5869468AADD1991919C6793DA96A30
                A4CC5C8E001B7FCFD0E7E847A5494CCA70E4762E695AADE68BA943A8584C62B8
                88E41ECC3BA91DC1F4AFA2FC25E2AB3F166922EADF11CF1E16E2DC9CB44DFD41
                E707BFE06BE68AD2D0B5DBEF0E6AB1EA3A7C9B654E191BEEC8BDD587707F4EB4
                99D384C5BA32B3F859F525158DE18F12D8F8A7484BEB36DAC3E59A1639689FD0
                FF0043DEB6691F4319292BAD828A28A0615E55F12BE20FD9C4DA068D31F3F94B
                BB943FEAFD6353FDEF53DBA75276DAF893F100E94AFA26912E2FDD71713A1FF5
                00F607FBE7F4FAE2BC4C00060533CAC763397F774F7EA2818181D28A28A678C1
                45145006EF87B4A93C4367AA6956C85EFE0886A366A07DED8424C9FF0002578B
                1FED20AD4F0178F57C1F16A114D6335DC172049108995592503186DC47CA4632
                46482BD0E78ADF0EAEBEC7F103487C90B23BC2D8EE1A36C0FF00BE829FC2BD63
                5FF85DA06BBA93DFE6E2CA795B74DF65601653DC952080C7B918CF7A93D8C342
                73A71A94DFBCB4D7AA3C5F47B0975BD4AFB50BD01EDAD564D4751908F95B24B9
                4FABBE463D371ED838FB9DC992424C8C4B3B7AB1E49FCC9AF6BF1E699A77847E
                175C699A5C3E4ADCCD142CC4E5E5258162C7A92554FF004C015E294D1CD8D87B
                25185EEDEAFD4D84D2A5D5FC34D7F6D119A4D2888AF621925ADCE4C6F8041217
                E68CE390AAB8FBA71DE9F8C16AFE12FB3FF6429D4193C9F279FB2F978C6FDD9C
                EDDBFC3D73C671F35733F0C7573A4F8EAD10B620BE56B49013C64FCC87EBB976
                FF00C0CD7B2B780FC2AFA81BD6D06C4CC5B711E5FC85BAEE29F749CF39C673CD
                23BF0BCD529A9C1D9BD1E9D575FEB43C0134F934ED006AF3218DAFCB43A72723
                1191FBC946724A853E5A92727CCDDCE01AD0F0EF8B24D234EBBD26EF74BA5DC2
                960B8C98251F32BA8F4DC0647E23918367E266AE756F1CDE22B66DEC00B48F1D
                323973FF007D12BFF00AE469A47057ACE956B53FB3F9F53E86B1DDA9787E6D04
                CA048F6A27D3E763912427050FD632550FAE15B8DD8165EFA5BBBCB7D4752B49
                74EB2D2A379A66B8C733152985C13B942B3F2383B862B3BC0D6D0EBFF0DB4337
                1BD25B5468A19E36DB244D13345B95BB121483D8824104122BA08F41125CC336
                A37F73A8790C1E18E5DAB1AB0E8C55400CC3A827383823040348F793BABA3CF7
                5BF16FFC23FABDF6A73A06D726B644B7B56FF9765724A86F4DAAAAC47779081C
                0C8F33B7BEFB4EB46E3569A4962BD6315EC84E58A391F3FD5182483DE302AE78
                CEECDF78E35CB93DEF1A318F48C0887FE819FC6B0880C083D08C1A763C2C4E2A
                4EBF9459D9681AADEFC32F175CDB6A5A7A4ECD84999410E61ECF0924295270DC
                8ED8C822A6F136BD75F12FC4969A7E95A6A442263F67965044A233F7DE520955
                8F3838C13F28E7276D7A3784E1D2FC71F0FF004B3ACD9417925BA981FCC5CB23
                A1D8595872A4800F04706A0F1B43A6F827E1FDFC3A259436525F95B50F12E198
                BE43333752C137E092790291E97B2B42DCDEE6FB74EDFD6A7896A12C125E32DA
                316B4814416EC472C8A4FCDF5666773EEE6B47C31A77F6E5F5C688AC893DE5BB
                1B567380278FE74CFB11BD4FB31AC40000000001D00ED5ADE18BA7B1F17E8972
                87056FE1427D15DC46DFF8EB9A7D0F1E8D5E6C4294BABB7DFA1B9F0FBC4D0F83
                FC49743558A78609A3304E3612D0C88C71B9473D77038F5AA92C73FC41F1F5D3
                DBAB431DE4A65924618F22DD02A976F43B54607F7881EB5EC5E27F875A2789EF
                3EDD379D6B7A40579ED9803201C0DC08209038CE338C0CE00C66EBBA0697E07F
                867AFC7A5C4CB25CDB185EE1DB748ED27EED496F405F8030073C72728F5561A4
                92A726B916BE7E8CF0C9AE12EEE25B9893CB8A562F1A7F750FDD1F82E05328E3
                B0C0ED4551E14E4E72727D428A28A0935FC35E23BDF0BEAE97F66770FBB342C7
                0B327F74FA7B1EDF983F46E85AED8F88B4A8F51D3E42F13F0CADC346DDD58762
                33FD4706BE5BADCF0A78A6F7C27AB0BBB6CC904985B8B72702551FC9864E0F6C
                9EC4D2677E0F16E93E597C3F91F4D5154749D5ACF5BD321D42C2512DBCA320F7
                07B823B11DC5148F7934D5D155FC27E1C91DA47D034A77762CCCD67192C4F249
                38E4E693FE111F0D7FD0BDA4FF00E0147FE15B34502E48F631BFE111F0D7FD0B
                DA4FFE0147FE147FC223E1AFFA17B49FFC028FFC2B668A03923D8C6FF8447C35
                FF0042F693FF008051FF00851FF088F86BFE85ED27FF0000A3FF000AD9A280E4
                8F63C335DB5B5D37E3469D0595B436D02DD5AE2286308A338CF038AF73AF14F1
                2A193E39E9EA3FE7E6D4FE401FE952F8EBE266A9178825D3B41B95B682C6431C
                B3045732CA3EF2F391B54F1EA483E941C74AAC28C67296DCCFF436BE36B7FC53
                3A4AFAEA40FE504D5A3E04F0DE857BE08D2EE6EB45D3679E48897965B546663B
                8F52464D715E35F130F16FC35D1EFDD163BC875510DD469F755FC89791DF6B65
                48CF4CE39C57A47C3AFF00910347FF00AE47FF00426A0A5CB3C4DF75CBFA916B
                DE1DD0ACEC62FB0E8DA75BDFCB731476B2436A88EB21707702067E500B1C7653
                5D6D73F2DD5B5E78DA1B47B887769F6E65584C8371964C80C17AE55038CFA486
                B53FB5F4DFB57D97FB42D3ED1BB6793E72EFDDE9B739CFB5075A496C73DA3787
                3439DF5382FB45D36E2F60BF98CB2CB6A8ED20918CA8C49193F2C8067D54FA56
                A7FC223E1AFF00A17B49FF00C028FF00C2ABB5F5A5AF8DE3816EA0F32FADCC4D
                10906F12C797505739E519CFD12BA1A05C91EC60F85E086CE3D52C6DA18E1B7B
                6D42458E28D42AA8655908007039735BD5C95B6A135BC17BF62557BFD4B559E2
                B757FBABB3F76D237FB2A2227DCE1720B0ABDBEF741BCB53777F2DED85D3AC0F
                24A8A1A1998E10FCA00D8CD85C750CCBD89C0514BC3BE19D0AF3C3F677577A2E
                9B3DC4E9E6C92CB6A8CCECC492492324F35A7FF088F86BFE85ED27FF0000A3FF
                000A3C284FFC23162A7EF4686261E8558A9FD455AD6F538B47D12F3519595560
                88B0DC4005BF8473EA703F1A09E48F6337C31696D6B71AD1D3EDA1B6D3DAF76C
                51C28114BA468923003007CEA571EA84F7A3C5167693CDA4CD7F6B0DD59C778B
                14B14F187506506346C1EA77B20FA31AB5A54963A4F876CC4B7D6DE4AA053706
                65D8EE7258863C1CB6EA3549B4DD57C3D7886FEDBECD346D0F9E265DAAC46010
                D9C020E0FD682ACB61BFF088F86BFE85DD27FF0000A3FF00E26BC8FE2BD858E8
                DE23D37FB36CADACD440252B6F12C60B0932090A073C57B2685A92EAFA1D9DFA
                BA399A2058A105770E1B18F706BCA3E30C26E7C5FA35BAFDE9A14887D5A5DA3F
                9D072E26294159755F99ED15C37C5B94A7806E101E24B8814FE1206FFD96B07E
                24FC43BFD33561A2E87702092050D77701033063C88D7231C0C127FDA03D7199
                AAF8B24F17FC27BE379B06A5A7DCDBFDA368C0915A4012403B672411D8A9ED8A
                0752B41F3D34F5499D5FC3EF0E6877FE07D36E6F346D3AE27757DD2CB6A8ECDF
                39EA48C9AE9BFE111F0D7FD0BDA4FF00E0147FE1597F0CFF00E49FE97FEEBFFE
                86D5D6D0550847D9474E88C6FF008447C35FF42F693FF8051FF851FF00088F86
                BFE85ED27FF00A3FF0AD9A2835E48F631BFE111F0D7FD0BDA4FF00E0147FE147
                FC223E1AFF00A17B49FF00C028FF00C2B668A03923D8CEB7D0748B34296BA5D9
                DBA31DC561815013D33803AF03F2A2B468A07CA828AE28FC57F088241BE9F20E
                3FE3D25FFE268FF85AFE11FF009FE9FF00F0125FFE26833F6F4BF997DE76B457
                15FF000B5FC23FF3FD3FFE024BFF00C4D1FF000B5FC23FF3FD3FFE024BFF00C4
                D01EDE97F32FBCED68AE2BFE16BF847FE7FA7FFC0497FF0089A3FE16BF847FE7
                FA7FFC0497FF0089A03DBD2FE65F79C478B2E8E9DF16AF7530013A7D8B5D807F
                BC22F2D3FF0022491D79A28207CCC59BBB1392C7B927B93D6BABF1BEBF61ACF8
                8353BAD39A4923BB16D1891A32A3CB40CCE39E7264580F4E886B95A68F131B51
                36A3177D5BFBDFF91A16170DFD95ABE9C7EE4F0A5CA67B49038638FAC466FF00
                BE457BFF00C3AFF910348FFAE47FF426AF9DECA68EDEFA0965566895F1205192
                50F0D8F7DA4D7AE782FE22786F46F07E99A75FDDCD1DD4116D9145B48C01DC4F
                50083D7B52675606AC6C9C9DAC9AFC533A6D7EEB1ACF9D12234BA744BE48207C
                D773E628BF2567FC24F6AD3FF846ACBFE11EFECA2899F27619CA82E5FA9909EA
                5B77CD9EE79AF3AD1BE206812EAA97DAA4B73094965BADAD6ECD99DFE45C6DCF
                11C23CB078CEE2715D57FC2D7F08FF00CFF4FF00F8092FFF001341E8FB7A5FCC
                BEF27F0F5DA9D60BCF12473DFA334A303E4BB87114CA0FB80A47A8524575A485
                52C4E001924D790EB3F107C3EBA8CB79A74973333C915DC656065F2EE231B0E7
                7638788EC24678CFB56E6AFF00153C33368B791DADD5C3DC490B2A27D99C1248
                C632401FAD01EDE97F32FBCD2F06466EE596F9C7FAA42003FC324EDF69931F84
                918FF809F4AE9B54B15D4B4ABAB26C01344C809EC48E0FE0706B80F0E7C46F0A
                697A15BDB4D7B3ACE4B4B28FB2C870EEC5C8C818382D8FA015ABFF000B5FC23F
                F3FD3FFE024BFF00C4D01EDE97F32FBCD0F04DE35D693728E3124777233E7D65
                C4C47E0652BF5535AFAC5E47A7E8F75752A09047192B1919DEDD1540EE49C003
                D4D79A68DF10FC3BA6789B557FB45C0D3EE4F991CBF6773C93BC8C637677C92F
                6C636F353F887E28787EE64B116AD73750C3235C3A08194348A3F741B76380E4
                3E467051680F6F4BF997DE74BA06971C978B14891CB069519832541592EA4F9E
                771EB8C819F52E3A8A678834A09A86CB6448CDFA8683E5C2ADE400BC6C47FB4A
                A55BD5500E959BA4FC48F08697A5C169FDA33C8E809924FB24BFBC76259DBEEF
                7624FE34CD6BE23F84B53D2A5B78F519A3B81B65B790DA4A7CB9508646FBBC80
                C06477191DE80F6F4BF997DE775A5DDC37FA5DB5DDBA6C8A68C3AA63EEE7A8FC
                0F15E61F118443E25786E59DFCB82DA3FB64AFFDD4819A663F947567C3BF147C
                3F6C6F63B96BAB5B7925F3E146819B6338CC8836E7203EE604E3FD6631F2D729
                F10BC57A5EBDAB2DC6972CB2AB69E6D77188A05DD282E0EEC1E5032F19FBC683
                1AD5A938FC4B477DFB6A713737735FDDCF7B739F3EE6469A4CF6663923F0CE3F
                0AB9A44AFE65ED928DC6FACE58157FBD281E6443F192355FF81567D3A29A5B69
                E2B980E2682459623E8EA4329FCC0A67874AAB5594E5DF5F9EE7D0FF000CCAB7
                C3ED2D94E54AB907D46F6AEB6BCB7C1FF10BC2BA2786ADF4E96E2E21F25E5091
                9B672550C8C5065411F748EF5BBFF0B5FC23FF003FD3FF00E024BFFC4D23DFA7
                569460A3CCB4F33B5A2B8AFF0085AFE11FF9FE9FFF000125FF00E268FF0085AF
                E11FF9FE9FFF000125FF00E2682FDBD2FE65F79DAD15C57FC2D7F08FFCFF004F
                FF008092FF00F1347FC2D7F08FFCFF004FFF008092FF00F13407B7A5FCCBEF3B
                5A2B9183E25F862E50BC5773B28383FE8B275FFBE68A07EDA9FF00323E7E8EDE
                6BCBF16D6D13CB3CB26C8E34192C49E82BD12CFE0D5FB59F9FA96B36B64D8DCC
                8B119420F762CA33F4C8F7A4F83DA7A5C78A752BE7009B4876A67B348C4647E0
                AC3F1A97E32EB170FAADA68C9232DAC7089E440701DC92067D40038F727DA99E
                352A34E145D6A8AFD919BE20F8612E85E1EB8D623D662BD8A20A42C76FB7702C
                0139DE7A67F1AE77C2FE1C3E28D49B4F8AFE0B5B8D9BE359518F998CEEC11D30
                39E7AE7D8D58F0E7883EC3A5EADA2DE4CC34EBEB570AA72447301952076C9183
                F81ED577E16FFC940D3FFDC97FF45B5066951A9521CAB47BA346F3E145C69DE5
                FDB7C45A55B798709E7129B8FB66AAEBFF000BB58D07499B523756975040374A
                B1EE5651EA01183F9FE75D9FC55F0EEA7E24D4342B4D36D9A5389C3C847C9102
                63E58F61FA9C54BF11BC456BE1FF000AAF8722779AFAE2DD62191F7630305C9F
                538207BFD291D7530D463CF78D92D9DCF2CF0B7869BC53A8C9610DFC16B7013C
                C459518F98075C11DC71F9FB1AE9EEFE13DCE9E10DEF88B4AB60E70A6625377D
                33543E157FC8FF0069FF005CA5FF00D04D7A0FC46F0A1F13DFE949FDAD636223
                0EBB6E1FE77DC57EE2F73C7F2A6CCB0F4213A1CFCB777EE798F8AFC1571E14B5
                B19E6BE86ED6F0B6D30A90A0000839279CE7F4A7784FC11378BA0B87B4D4ADA1
                9ADD8092196362403D1B238E707F2A3C5172DA6BEABE1665736B6BA97DA2C86E
                C881086CA73CE08753F507D6BABF825FF1FF00AD7FD7287F9BD0670A54E58950
                B69D8CF97E10EA2938B64D6F4A376CBB9207665661EB8C138F7C571FAEF87354
                F0DDE0B6D4EDBCB2D931C8A7724807753DFF009F3C8AE9FE295C4F6BF114DC5B
                CAD14F0C10B46EA70548C918AF4CD42D20F1E7C398A5745F3AE2D96E222067CB
                982F6FC72A7D89A0D5E1A954738415A51FC4F11F0CF87CF89B55FECD8EFA1B5B
                8652D10951889303240C74200CF35A9E2AF01CFE12B18AE2F354B695E67DB143
                1C6F97C7539E8300F7A4F86591F117490460FEFB23FED8BD765F1B7FD468BFEF
                CBFC96832A7460F0B2A8D6ABFE01C1F853C19A978BAE24168D1C16D09025B897
                24293D801F78F7C703DC719E965F84E86E9ACAD3C55A7CD7EA39B678B637AF67
                623F2AECFE113407C0A822C7982E65F3BFDECF1FF8EEDAE63C4DF0BF5A83589F
                59D06EC4ECD31B85467D93C6E4E7E56E8D824F520FD691BC70B08D18CD4799BD
                F53CEB5AD2E4D135ABBD326916492D9F633A8C03C03903F1AED34FF84B7DAA69
                D6F7F69ACD93DBDC46244631B8C83ED5CA78A2FAEB52F12DE5DDF5A35A5DBF96
                2681C60ABAC6AA4E303AE33F8F7AF76F02A97F873A52EE0336A4649E075A6658
                5A14EA559C5AD16C79A5A7C289AFA668EDFC49A54EC9F7D6025D947D01AE0E38
                17EDCB6D7128B75F37CB925652C23E704903938F6AEDA7F0ACBE10F0F1F115A6
                AF6B75A85BDE44229ACA42CB1AF3B813DF765410474F5CD71BAADD457DAADDDE
                43118639E669163273B72738A11962210825EED9FADF43BE93E0EEA10DBB5C4B
                ADE9C90AAEF691958285F527D2A283E11EA17B69F68B0D734BBA439DAC858A93
                E9B8038AF49F16DBCD77F0E2F20B789E69A4B44558D14B331F97802B1BC250FF
                00C2BAF00DC5DEBC4C4D2CE6730A0DCC0B2AAAA7A6E3B7E833C9E3348EF784A2
                A7671D2D7BDCF28D1FC3136A9E2393429AEE1B1BD56640B32960CEBD5411DF00
                9FC2B63C4BF0E2EBC2FA3BEA379AADA3A860891A46FB9D8F61E9C64F3E95CFB6
                BB3BF8AC7880A059BED82EF603C0C36EDB9F4C715EE3F11ACD757F87D7B34277
                88516EE323BAAF24FF00DF39A672D0A34AA539D96AB63C8FC2DE0A93C5567733
                DB6AB6B6ED6A479D1CC8DF229CE1B3D30707E98A8FC37E101E28D4AF2C6C757B
                60F6FF003233C4E04C99C165E38E71C1E79ADBD24FF627C1ED5EFBEECFABDC7D
                96320F58C7CA7FF6AFE628F83DFF002394BFF5E8FF00FA12D04C2953E6A706B5
                7B989E2CF074BE116B68EEB51B7B89E7CB2C512302147F11278EBC7FFAAB43C3
                7F0E2EBC4FA3A6A365AB5A2A9628F1BC6FBA371D54FAF041FC6B4BE33FFC8CF6
                1FF5E5FF00B3B5751F063FE451BDFF00B083FF00E8B8E834850A6F12E9B5A1C9
                47F0A2E26BD92CA3F11694F751FDF85492EBF51D6B9AF14F84B51F095E4305FB
                43224EACD0CB09243052011820104647E639AF47F0CF85B533F14753D76681E0
                B28A79BCB77183316E3E51DC7BF4AE47E2678AEDBC4DAD410D902D69601D1652
                08F31D88DC71E836003F1A42AF469468B95ACEFA7998BA27FC7A49FF005D0FF2
                1451A2FF00C7A49FF5D0FF00214533187C28EBBE0F5FA5BF8AB51B27603ED70E
                E5CF7646271F9331FC297E3369D2C5AED86A414F913C1E496F47524E0FD4371F
                43E95E7F6B7D73A66AB1DF59C863B8825DF1B75C107B8EE3B115EBD17C41F09F
                8B7436D3FC469F647703CC491494DC3F891C671F8E0FD6837A33855A0E849D9F
                43C6ADE096EEEA1B6810BCD33AC71A0EACC4E00FCCD75DF0C50C7F116CA32549
                513292A411C237423823DEB604FF000FBC371DE5DE917F717BAAAC2E2CCC8ACC
                B1B918041DA17233D4D73DF0F752D2B43F1226A7AADE9B78EDE3658D160790C8
                CC0AFF000838007AFA8F7C0634E92A5561792BDFB9EA9E3AF16DC78575DF0FC9
                E67FC4BE6330BB8F683B946C01B3D72BB89E2A0F8AFA147AAF857FB4E1506E2C
                0F98187F1447861FC9BF0F7AE3BE26F89B41F14DAD84BA5DFBC97168CE0C0F6D
                226F57DBC866000C6DE9DF3EDCF53A77C40F07DBF862D747BDD525B911DA2DB4
                AFF639809004DA7F8691E8CAA46A4AA5394959DADA9C27C2AFF91FECFF00EB94
                BFFA09AE87E36806F346C807F772FF0035AE7BC13A8683E1CF184F7F75AB3359
                5BA325B48B6B2169F7719200CAE075CF7E9C5755E2CF117803C5EB6BF6BD5AF6
                17B62DB1E1B49390D8C8394F6145CE6A714F0AE9F32BDFB9E7612E7C4735EEA1
                72E545958AB5C4E72C5CA2AC69927F89C85FFC78D777F04BFE3FB5AFFAE50FF3
                7AC9F126B5E15B7F052E87E169656335CA3DD34B0BAB48AA09CB33019F982F02
                A4F867E24D0BC2E97F71AA6A0F1CD72511614B691F6AAE4EE2CA08E7774F6A08
                A2A30C446F24FBB2A7C59FF91F26FF00AF78BF91AF56F00C66C7E1E6926E3E40
                2DCCC49ECAC4B83F9115C3EB9AA7C37F10EBE9AB5FEA77CCC1151E15B6942385
                E99F933FAD41E32F8A16FA86932691E1F8668A0917CB92E1D427C9FDD45EA323
                8C9C71DBBD06F19428D49D6725AED6303E1C3AC9F1334E75FBACF391F431495D
                7FC6DFF51A2FFBF2FF0025AE1FC05A8E97A378A60D5355BD36D15AA3145581E4
                3233295C7CA0E300E726BA3F895E29F0FF008A74EB36D335177B8B5918F92F6B
                22EF56C02431000C633CF5A0C29C97D5269B576FFC8E7F4AD5F56F05DB699AA6
                9B39306A513BCB0CAB98D992574231F40A73D7935EADE0BF88D69E2AB936135A
                B5A6A010B85DDB92403192A7A83EC474EE6B84D0F5BF075D781ACB40F11BCC92
                C324B224B144C4C459C918600F507A608F5ED5A7A0DEFC3DF06CF26A76BAB5CD
                FDD98CA46BE596600F50060004E3A9341B61E52A6E3CB35CBD55C8FE355B4097
                FA4DD28513C91C88E40E59410467E849FCEBB8F047FC935D33FEBD0FF5AF12F1
                778A2E3C59AD1BD953C98117CBB78739D8B9EFEE7A9FC076AF4EF0FF008FFC21
                A3786AC749975496530402376167300C7BFF000FB9A0742B53962273BD91E376
                97F2D9D8DEDAA60C37912A48A7A7CAEAEADF50571F89A9B57D31B489E0B695C9
                B86B78E69908C794CF9609F5DA509F72476AEEB4B1F0BB4ED4C5E36A37D7411F
                7C70CF6B214539E32027CD8F7AE3B5ABF875DF16DE5ECD7061B6BABA27CE642D
                B23CE01DA39385038F6A670D4A5C905769BE9AEC7BCF896FEEB4CF87D757B653
                186E61B4568E4001DA7819C1E2A3D12FED3C7FE0561728BFE931B5BDCA01F724
                1D48F4ECC3D322B9DD77C79E10D5FC2D79A3C7AACD1B4D6FE523B594A4020704
                8DBEA0573DF0CFC5DA278634CBE4D57519237B89C3240B6F23850171BB201193
                D31FEC8F5A47AB2AF1F6AA375CAD773CF6FACE5D3EFEE2C6E0626B791A27FA83
                8AFA0BC0B771EBDF0F2CE39C093F72D6932B739DB95C1FA8C7E75E43E3FBED0B
                57F101D5344BB6945CA8FB444D03C7B5C0C6E0580C8231F8827BF1D17C35F196
                89E19D0EEADB55D41E379AE4CA90A5B48FB46D55C96504738E9DB1EF41C58471
                A588945B5628FC4751A2E9BE1EF0AC6E1FEC36DE74CC3A3331DA0FE8E7F114BF
                07BFE47297FEBD1FFF00425AE7FC6FAADB6B7E2DBCD42CEE8DC5B4A13CB631B4
                7B405036E1B9E31D7BD6A7C36D6F46F0EEB175A8EAD7AD09F27CA8A3581E42D9
                39272A0E318FC73ED4FA10A69E2D3BE89FE08D3F8CFF00F234587FD797FECED5
                D47C18FF009146F7FEC20FFF00A2E3AE2BE25EBDA27896F6C6FB49BE79648E33
                0C913DBBA606770605801DC8C7D2B73E1EF8C7C35E17F0D1B4BED4A4FB54D3B4
                F222DACA446480BB721483C28E47AD237A728AC64A4DAB7A9D2F85BC617179E3
                3D73C3F7F26F68A777B36DA06114E0A71E9C11F8E4F4AF3CF8A9A12E8FE2BFB5
                C3184B7D454CC00181E602038FD54FFC0A92DF59D16DBE2A7F6E47AABFF66B4C
                D706516D206CB290632B8CF53D718AE83C7FE2CF0978AF40F22DB51905EDBBF9
                B6FBAD251B8E30532578C8FC320503A928D5A328C9ABA6EDA9C268BFF1E927FD
                743FC8514689FF001E727FD743FC8514CE387C28A12591F35FF79FC47F87DFEB
                4CFB09FF009E9FF8EFFF005E8A2998B8A0FB0FFD34FF00C77FFAF47D87FE9A7F
                E3BFFD7A28A039507D87FE9A7FE3BFFD7A3EC3FF004D3FF1DFFEBD14501CA83E
                C3FF004D3FF1DFFEBD1F61FF00A69FF8EFFF005E8A280E541F61FF00A69FF8EF
                FF005E8FB0FF00D34FFC77FF00AF4514072A0FB0FF00D34FFC77FF00AF47D84F
                FCF4FF00C77FFAF4514072A0FB0FFD34FF00C77FFAF47D87FE9A7FE3BFFD7A28
                A039507D87FE9A7FE3BFFD7A3EC27FE7A7FE3BFF00D7A28A039507D84FFCF5FF
                00C77FFAF47D87FE9A7FE3BFFD7A28A039507D87FE9A7FE3BFFD7A3EC27FE7A7
                FE3BFF00D7A28A039507D87FE9A7FE3BFF00D7A3EC3FF4D3FF001DFF00EBD145
                01CA83EC3FF4D3FF001DFF00EBD1F61FFA69FF008EFF00F5E8A280E541F61FFA
                69FF008EFF00F5E8FB0FFD34FF00C77FFAF4514072A0FB0FFD34FF00C77FFAF4
                7D87FE9A7FE3BFFD7A28A039507D87FE9A7FE3BFFD7A3EC3FF004D3FF1DFFEBD
                14501CA8DBD1AD0ADA483CCFF9687F87D85145148EA825CA8FFFD9}
              DrawMode = prdmStretch
              FillColor = clNone
            end>
          dRec.Left = 10
          dRec.Top = 2
          dRec.Right = 147
          dRec.Bottom = 67
          Visible = False
        end
      end
    end
  end
  object CDopcion: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 64
    Data = {
      5C0000009619E0BD0100000018000000020000000000030000005C000576616C
      6F72080004000000010007535542545950450200490006004D6F6E6579000B64
      65736372697063696F6E01004900000001000557494454480200020064000000}
    object CDopcionvalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDopciondescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = CDopcion
    Left = 440
    Top = 72
  end
end
