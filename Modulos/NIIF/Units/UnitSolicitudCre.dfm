object FrmSolicitudCre: TFrmSolicitudCre
  Left = 98
  Top = 146
  Width = 864
  Height = 478
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
      Left = 208
      Top = 24
      Width = 44
      Height = 13
      Caption = 'N'#250'mero'
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
      Left = 0
      Top = 51
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
      Left = 366
      Top = 24
      Width = 44
      Height = 13
      Caption = 'Aportes'
    end
    object Label3: TLabel
      Left = 292
      Top = 50
      Width = 41
      Height = 13
      Caption = 'Cuenta'
    end
    object Label17: TLabel
      Left = 0
      Top = 24
      Width = 26
      Height = 13
      Caption = 'Tipo'
    end
    object JVnombres: TJvEdit
      Left = 53
      Top = 49
      Width = 226
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
      CharCase = ecUpperCase
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 2
    end
    object Direccion: TEdit
      Left = 336
      Top = 48
      Width = 99
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 3
    end
    object JVdocumento: TJvEdit
      Left = 255
      Top = 22
      Width = 108
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
      TabOrder = 1
      OnExit = JVdocumentoExit
    end
    object JVtotal: TJvCurrencyEdit
      Left = 412
      Top = 22
      Width = 121
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = False
      TabOrder = 4
      HasMaxValue = False
      HasMinValue = False
    end
    object Capacitacion: TCheckBox
      Left = 435
      Top = 50
      Width = 95
      Height = 17
      TabStop = False
      Alignment = taLeftJustify
      Caption = 'Capacitaci'#243'n'
      State = cbGrayed
      TabOrder = 5
    end
    object DBtipo: TDBLookupComboBox
      Left = 28
      Top = 22
      Width = 176
      Height = 21
      DropDownWidth = 255
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DStipo
      TabOrder = 0
      OnEnter = DBtipoEnter
      OnKeyPress = DBtipoKeyPress
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
    TabOrder = 3
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fecha_interes'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'reciprocidad'
              Visible = False
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
      object Label6: TLabel
        Left = 432
        Top = 13
        Width = 29
        Height = 13
        Caption = 'Tasa'
      end
      object Label10: TLabel
        Left = 23
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
        Left = 284
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
        OnEnter = JVvalorEnter
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
        Left = 520
        Top = 2
        Width = 531
        Height = 37
        Caption = 'Forma de Pago'
        TabOrder = 8
        Visible = False
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
        Left = 107
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
          'V. ANTICIPADA')
      end
      object JVvalorcuota: TJvCurrencyEdit
        Left = 355
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
        Height = 70
        ScrollBars = ssVertical
        TabOrder = 3
        WantReturns = False
        WantTabs = True
        OnExit = MInversionExit
        OnKeyPress = MInversionKeyPress
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
      object GroupBox2: TGroupBox
        Left = 3
        Top = 128
        Width = 225
        Height = 40
        Caption = 'Amortizacion'
        TabOrder = 4
        object JvLabel11: TJvLabel
          Left = 7
          Top = 16
          Width = 40
          Height = 13
          Caption = 'Capital'
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvLabel12: TJvLabel
          Left = 110
          Top = 16
          Width = 40
          Height = 13
          Caption = 'Interes'
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvAmortizaK: TJvIntegerEdit
          Left = 55
          Top = 13
          Width = 53
          Height = 21
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 0
          OnExit = JvAmortizaKExit
          Value = 0
          MaxValue = 0
          MinValue = 0
          HasMaxValue = False
          HasMinValue = False
        end
        object JvAmortizaI: TJvIntegerEdit
          Left = 157
          Top = 13
          Width = 53
          Height = 21
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 1
          OnExit = JvAmortizaIExit
          Value = 0
          MaxValue = 0
          MinValue = 0
          HasMaxValue = False
          HasMinValue = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 234
        Top = 128
        Width = 289
        Height = 40
        Caption = 'Plazo'
        TabOrder = 5
        object JvLabel4: TJvLabel
          Left = 8
          Top = 15
          Width = 52
          Height = 13
          Caption = 'Opcion 1'
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvLabel7: TJvLabel
          Left = 131
          Top = 15
          Width = 8
          Height = 13
          Caption = '2'
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvLabel8: TJvLabel
          Left = 216
          Top = 15
          Width = 8
          Height = 13
          Caption = '3'
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object plazo: TJvIntegerEdit
          Left = 61
          Top = 11
          Width = 50
          Height = 21
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 0
          Value = 0
          MaxValue = 0
          MinValue = 0
          HasMaxValue = False
          HasMinValue = False
        end
        object opcion1: TJvIntegerEdit
          Left = 142
          Top = 11
          Width = 50
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
        object opcion2: TJvIntegerEdit
          Left = 229
          Top = 11
          Width = 50
          Height = 21
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 2
          Value = 0
          MaxValue = 0
          MinValue = 0
          HasMaxValue = False
          HasMinValue = False
        end
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
        Top = 77
        Width = 93
        Height = 13
        Caption = 'Total a Entregar'
      end
      object Label15: TLabel
        Left = 8
        Top = 77
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
        Top = 104
        Width = 110
        Height = 13
        Caption = 'No. de Codeudores'
      end
      object Label18: TLabel
        Left = 256
        Top = 104
        Width = 96
        Height = 13
        Caption = 'Tipo de Garantia'
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
        Top = 75
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
        Top = 75
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
        Left = 131
        Top = 166
        Width = 249
        Height = 25
        Caption = 'Requisitos Para Solicitar Credito'
        TabOrder = 8
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
        Top = 101
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
      object DesGarantia: TComboBox
        Left = 376
        Top = 101
        Width = 122
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 7
        Text = 'ADMISIBLE'
        Items.Strings = (
          'ADMISIBLE'
          'NO ADMISIBLE')
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
    TabOrder = 1
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
      Enabled = False
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
    TabOrder = 2
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
      end
      item
        Name = 'reciprocidad'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 616
    Top = 128
    Data = {
      990000009619E0BD01000000180000000500000000000300000099000A636F6C
      6F636163696F6E0100490000000100055749445448020002001E000665737461
      646F0100490000000100055749445448020002001E000D66656368615F696E74
      6572657304000600000000000576616C6F720100490000000100055749445448
      020002001E000C7265636970726F636964616404000100000000000000}
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
    object CDcolocacionreciprocidad: TIntegerField
      FieldName = 'reciprocidad'
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
    Left = 616
    Top = 168
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
    Left = 776
    Top = 64
  end
  object DSfianza: TDataSource
    DataSet = CDfianzas
    Left = 808
    Top = 64
  end
  object IBConsulta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 608
    Top = 56
  end
  object IBdatos: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 544
    Top = 80
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 648
    Top = 8
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 776
    Top = 8
    ReportForm = {19000000}
  end
  object frCompositeReport1: TfrCompositeReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    DoublePassReport = True
    Left = 808
    Top = 24
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDcolocacion
    Left = 800
    Top = 120
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = CDfianzas
    Left = 800
    Top = 160
  end
  object CDrequisitos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 128
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
    Left = 800
    Top = 200
  end
  object conyugue: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 128
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
    Left = 648
    Top = 128
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
    Left = 656
    Top = 168
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
    FromPage = 1
    ToPage = 1
    Title = 'Liquidaci'#243'n Barrido'
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
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 832
    Top = 8
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
      ColNum = 140
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
          dRec.Left = 26
          dRec.Top = 1
          dRec.Right = 73
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Top = 2
          dRec.Right = 130
          dRec.Bottom = 3
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
        Height = 2
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
          dRec.Right = 138
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
          dRec.Top = 1
          dRec.Right = 45
          dRec.Bottom = 2
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
          dRec.Top = 1
          dRec.Right = 72
          dRec.Bottom = 2
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
          dRec.Top = 1
          dRec.Right = 94
          dRec.Bottom = 2
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
          dRec.Top = 1
          dRec.Right = 112
          dRec.Bottom = 2
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
          dRec.Top = 1
          dRec.Right = 46
          dRec.Bottom = 2
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Right = 139
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
          dRec.Left = 139
          dRec.Top = 1
          dRec.Right = 140
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
          dRec.Right = 139
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
          dRec.Right = 139
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
        Height = 5
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
          dRec.Top = 1
          dRec.Right = 41
          dRec.Bottom = 3
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
    Left = 552
    Top = 168
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
    Left = 584
    Top = 168
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
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "col$lineas".ID_LINEA,'
      '  "col$lineas".DESCRIPCION_LINEA,'
      '  "col$lineas".VECES_APORTES'
      'FROM'
      '  "col$lineas"'
      '')
    Left = 640
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = IBlineas
    Left = 728
    Top = 88
  end
  object CDopcion: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'descripcion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'inter'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 680
    Top = 128
    Data = {
      760000009619E0BD01000000180000000300000000000300000076000576616C
      6F72080004000000010007535542545950450200490006004D6F6E6579000B64
      65736372697063696F6E01004900000001000557494454480200020064000569
      6E74657201004900000001000557494454480200020014000000}
    object CDopcionvalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDopciondescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
    object CDopcioninter: TStringField
      FieldName = 'inter'
    end
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = CDopcion
    Left = 800
    Top = 240
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 544
  end
  object DStipo: TDataSource
    DataSet = IBTipo
    Left = 680
    Top = 64
  end
  object IBTipo: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 544
    Top = 48
  end
  object IBSproc: TIBStoredProc
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    AutoCalcFields = False
    Left = 584
    Top = 80
    ParamData = <
      item
        DataType = ftBCD
        Name = 'SALDO_ACTUAL'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'AG'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DGT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FECHA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FECHA2'
        ParamType = ptInput
      end>
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    Left = 576
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 680
    Top = 8
  end
  object IBTransaction3: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Left = 704
    Top = 8
  end
  object IBSQL3: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction3
    Left = 728
    Top = 16
  end
end
