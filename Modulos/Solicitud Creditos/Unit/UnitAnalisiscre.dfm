object FrmAnalisiscre: TFrmAnalisiscre
  Left = 57
  Top = 40
  Width = 587
  Height = 504
  BorderIcons = [biSystemMenu]
  Caption = 'An'#225'lisis de Cr'#233'ditos'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 34
    Width = 577
    Height = 403
    ActivePage = TabSheet1
    Enabled = False
    Images = ImageList1
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Estado Crediticio '
      object DBGrid1: TDBGrid
        Left = 3
        Top = 5
        Width = 419
        Height = 121
        Color = clWhite
        DataSource = DScodeudores
        PopupMenu = PopupMenu2
        ReadOnly = True
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
            FieldName = 'id_persona'
            Title.Caption = 'Identificaci'#243'n'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id_identificacion'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nombres'
            Title.Caption = 'Nombres y Apellidos'
            Width = 201
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'definicion'
            Title.Caption = 'Definici'#243'n'
            Width = 93
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 424
        Top = 5
        Width = 143
        Height = 120
        Color = clOlive
        TabOrder = 1
        object BTcredito: TBitBtn
          Left = 6
          Top = 5
          Width = 135
          Height = 27
          Caption = '&Cr'#233'ditos Vigentes'
          TabOrder = 0
          OnClick = BTcreditoClick
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
        object BTfianzas: TBitBtn
          Left = 6
          Top = 33
          Width = 135
          Height = 27
          Caption = '&Fianzas Vigentes'
          TabOrder = 1
          OnClick = BTfianzasClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000420B0000420B00000000000000000000FF00FFFF00FF
            000000FF00FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00
            FF000000FF00FFFF00FFFF00FF000000FF00FF000000FF00FFFF00FF000000FF
            00FF000000FF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00FF000000
            FF00FF000000FF00FFFF00FF000000FF00FF000000FF00FF000000FF00FFFF00
            FF000000FF00FFFF00FFFF00FF000000FF00FF000000FF00FF000000000000FF
            00FF000000FF00FF000000FF00FF000000000000FF00FFFF00FFFF00FFFF00FF
            000000FF00FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00
            FF000000FF00FFFF00FFFF00FF8080808D5E5D8D5E5D8D5E5D8D5E5D8D5E5D8D
            5E5D8D5E5D8D5E5D8D5E5DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080
            FFFAEBF9F1E2F9F0DFF7EEDCF7EEDBF7EDDAF8EFDBF2E5D18E5F5EFF00FFFF00
            FFC00000FF00FFFF00FFFF00FF808080F9F1E4F5E2CDF5E0CAF4DFC9F3DEC5F2
            DDC3F2E2CDEBDBC98E5F5EFF00FFFF0000FF0000C00000FF00FFFF00FF808080
            FCF5EAFCD8B5FCD8B4FCD8B3FBD7B3FBD7B2FADAB8EBDECE926462FF0000FF00
            00FF0000FF0000C00000FF00FF808080FEFBF5FDD2A7FDD2A7FDD2A7FDD2A7FD
            D2A7FDD2A7F0E5DAA57A75FF00FFFF0000FF0000C00000FF00FFFF00FF808080
            FFFDFBFDEAD8FCE7D4FBE6D3FAE6D1FDE9D3FDF4E6E8E0D9C00000C00000FF00
            00FF0000C00000FF00FFFF00FF808080FFFFFFFDD2A7FDD2A7FDD2A7FDD2A7EB
            DFDBFF0000FF0000FF0000FF0000FF0000FF0000C00000FF00FFFF00FF808080
            FFFFFFFCE7D4FCE7D4FCE7D4FCE7D4B48E88B48E88B48E88B48E88FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4
            8E88EBB56FC68C78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080
            808080808080808080808080808080808080808080FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BTdocumentos: TBitBtn
          Left = 6
          Top = 61
          Width = 135
          Height = 27
          Caption = '&Documentos Exigidos'
          TabOrder = 2
          OnClick = BTdocumentosClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000320B0000320B00000001000000010000E1622300E475
            3E00BD8C7300BD847B00EFA54A00C6846B00CE947300C6947B00E88E6000EFB5
            7300FFC67300FF00FF0029ADD600B5848400B58C8400B5948C00CE9C8400C6A5
            9400C6A59C00C6ADA500CEB5AD00C6BDAD00D6B5AD00D6BDB500DEBDB500DEC6
            B500FFD6A500E7C6B500EFCEB500EFCEBD008CF7FF00E7CECE00E7DEC600E7D6
            CE00FFEFD600FFF7EF00FFF7F700FFFFFF000000000000000000000000000000
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
            00000000000000000000000000000000000000000000000000000B0B0D0D0D0D
            0D0D0D0D0D0D0D0D0D0B0B0B120C0C0C0C0C0C0C0C0C0C0C0D0B0B0B120C1E1E
            1E1E1E1E1E1E1E0C0D0B0B0B130C1E080808010100001E0C0D0B0B0B130C1E1E
            1E1E1E1E1E1E1E0C0D0B0B0B140C0C0C0C0C0C0C0C0C0C0C0D0B0B0B16252524
            24242424242423230D0B0B0B1725222222222222222222230D0B0B0B17251A1A
            1A1A1A1A1A1A1A240D0B0B0B1825252525252424242424240D0B0B0B19252222
            22222222222220150D0B0B0B1B251A1A1A1A1A1A1A110F0E0D0B0B0B1B252525
            252525241F020904050B0B0B1D2525252525252521070A060B0B0B0B1B242323
            232323231F07100B0B0B0B0B1B1C1C1C1C1B1B1C17030B0B0B0B}
        end
        object BitBtn1: TBitBtn
          Left = 6
          Top = 89
          Width = 135
          Height = 27
          Caption = '&Ingresos y Egresos'
          TabOrder = 3
          OnClick = BitBtn1Click
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
      end
      object Ganalisis: TGroupBox
        Left = 1
        Top = 270
        Width = 457
        Height = 71
        Caption = 'An'#225'lisis Capacidad de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label2: TLabel
          Left = 2
          Top = 23
          Width = 40
          Height = 13
          Caption = 'Ingresos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object JvLabel2: TJvLabel
          Left = 144
          Top = 23
          Width = 63
          Height = 13
          Caption = 'Deducciones'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvLabel3: TJvLabel
          Left = 301
          Top = 23
          Width = 49
          Height = 13
          Caption = 'Disponible'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvLabel4: TJvLabel
          Left = 1
          Top = 46
          Width = 52
          Height = 13
          Caption = 'Disp. Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvLabel5: TJvLabel
          Left = 143
          Top = 46
          Width = 55
          Height = 13
          Caption = 'Valor Cuota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JVingresos: TJvCurrencyEdit
          Left = 56
          Top = 21
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = False
          TabOrder = 0
          HasMaxValue = False
          HasMinValue = False
        end
        object JVdeducciones: TJvCurrencyEdit
          Left = 210
          Top = 21
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = False
          TabOrder = 1
          OnExit = JVdeduccionesExit
          HasMaxValue = False
          HasMinValue = False
        end
        object JVdisponible: TJvCurrencyEdit
          Left = 366
          Top = 20
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = False
          TabOrder = 2
          OnExit = JVdisponibleExit
          HasMaxValue = False
          HasMinValue = False
        end
        object JVdispago: TJvCurrencyEdit
          Left = 56
          Top = 44
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = False
          TabOrder = 3
          HasMaxValue = False
          HasMinValue = False
        end
        object JVcuota: TJvCurrencyEdit
          Left = 210
          Top = 44
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = False
          TabOrder = 4
          OnExit = JVcuotaExit
          HasMaxValue = False
          HasMinValue = False
        end
        object JvSolvencia: TJvCheckBox
          Left = 297
          Top = 46
          Width = 153
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Solvencia Economica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          AutoSize = False
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 1
        Top = 339
        Width = 456
        Height = 35
        Caption = 'Experiencia en Creditos'
        TabOrder = 3
      end
      object Rbuena: TRadioButton
        Left = 34
        Top = 352
        Width = 52
        Height = 17
        Alignment = taLeftJustify
        Caption = '&Buena'
        Checked = True
        TabOrder = 4
        TabStop = True
        OnClick = RbuenaClick
      end
      object Rregular: TRadioButton
        Left = 203
        Top = 352
        Width = 63
        Height = 17
        Alignment = taLeftJustify
        Caption = '&Regular'
        TabOrder = 5
        OnClick = RregularClick
      end
      object Rmala: TRadioButton
        Left = 379
        Top = 352
        Width = 50
        Height = 17
        Alignment = taLeftJustify
        Caption = '&Mala'
        TabOrder = 6
        OnClick = RmalaClick
      end
      object Resultado: TGroupBox
        Left = 1
        Top = 130
        Width = 561
        Height = 133
        Caption = 'Resultados de la Consulta'
        TabOrder = 7
        object DBcolocacion: TDBGrid
          Left = 4
          Top = 13
          Width = 545
          Height = 112
          TabStop = False
          DataSource = DScredito
          PopupMenu = PopupMenu1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Visible = False
          OnDblClick = DBcolocacionDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'colocacion'
              Title.Caption = 'Colocacion'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'saldo'
              Title.Caption = 'Saldo'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fecha'
              Title.Caption = 'F. Interes'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fecha_interes'
              Title.Caption = 'F. Capital'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado'
              Title.Caption = 'Estado'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'cuota'
              Title.Caption = 'Cuota'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'criterio'
              Title.Caption = 'Desc.'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'es_descuento'
              Visible = False
            end>
        end
        object JVdocumentos: TJvHtListBox
          Left = 5
          Top = 13
          Width = 545
          Height = 112
          HideSel = False
          TabOrder = 1
          Visible = False
        end
        object Gingreso: TGroupBox
          Left = 0
          Top = 1
          Width = 560
          Height = 44
          Caption = 'Ingresos'
          Enabled = False
          TabOrder = 2
          Visible = False
          object Label20: TLabel
            Left = 3
            Top = 17
            Width = 40
            Height = 13
            Caption = 'Principal'
          end
          object JvLabel7: TJvLabel
            Left = 184
            Top = 19
            Width = 25
            Height = 13
            Caption = 'Otros'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object JvLabel8: TJvLabel
            Left = 370
            Top = 19
            Width = 30
            Height = 13
            Caption = 'Total'
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
          object JVingreso: TJvCurrencyEdit
            Left = 52
            Top = 16
            Width = 128
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 0
            HasMaxValue = False
            HasMinValue = False
          end
          object JVotroingreso: TJvCurrencyEdit
            Left = 239
            Top = 16
            Width = 128
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 1
            HasMaxValue = False
            HasMinValue = False
          end
          object JVtotalingreso: TJvCurrencyEdit
            Left = 423
            Top = 16
            Width = 128
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = False
            TabOrder = 2
            HasMaxValue = False
            HasMinValue = False
          end
        end
        object Gegreso: TGroupBox
          Left = 0
          Top = 43
          Width = 561
          Height = 90
          Caption = 'Egresos'
          Enabled = False
          TabOrder = 3
          Visible = False
          object JvLabel9: TJvLabel
            Left = 3
            Top = 17
            Width = 39
            Height = 13
            Caption = 'Arriendo'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object JvLabel10: TJvLabel
            Left = 3
            Top = 42
            Width = 45
            Height = 13
            Caption = 'Alimentos'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object JvLabel11: TJvLabel
            Left = 184
            Top = 17
            Width = 51
            Height = 13
            Caption = 'Transporte'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object JvLabel12: TJvLabel
            Left = 184
            Top = 42
            Width = 37
            Height = 13
            Caption = 'Deudas'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object JvLabel13: TJvLabel
            Left = 370
            Top = 17
            Width = 43
            Height = 13
            Caption = 'Servicios'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object JvLabel14: TJvLabel
            Left = 370
            Top = 42
            Width = 25
            Height = 13
            Caption = 'Otros'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object JvLabel15: TJvLabel
            Left = 184
            Top = 66
            Width = 30
            Height = 13
            Caption = 'Total'
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
          object JVarriendo: TJvCurrencyEdit
            Left = 52
            Top = 15
            Width = 128
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 0
            HasMaxValue = False
            HasMinValue = False
          end
          object JVtransporte: TJvCurrencyEdit
            Left = 239
            Top = 15
            Width = 128
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 1
            HasMaxValue = False
            HasMinValue = False
          end
          object JVservicios: TJvCurrencyEdit
            Left = 424
            Top = 15
            Width = 128
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 2
            HasMaxValue = False
            HasMinValue = False
          end
          object JVdeudas: TJvCurrencyEdit
            Left = 239
            Top = 40
            Width = 128
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 3
            HasMaxValue = False
            HasMinValue = False
          end
          object JValimentos: TJvCurrencyEdit
            Left = 52
            Top = 40
            Width = 128
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 4
            HasMaxValue = False
            HasMinValue = False
          end
          object JVotrosegresos: TJvCurrencyEdit
            Left = 424
            Top = 40
            Width = 128
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 5
            HasMaxValue = False
            HasMinValue = False
          end
          object JVtotalegreso: TJvCurrencyEdit
            Left = 239
            Top = 63
            Width = 128
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = False
            TabOrder = 6
            HasMaxValue = False
            HasMinValue = False
          end
        end
      end
      object Panel4: TPanel
        Left = 459
        Top = 275
        Width = 102
        Height = 96
        Color = clOlive
        TabOrder = 8
        object BitBtn2: TBitBtn
          Left = 8
          Top = 16
          Width = 89
          Height = 25
          Caption = '&Aceptar'
          Enabled = False
          TabOrder = 0
          OnClick = BitBtn2Click
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
        object BitBtn3: TBitBtn
          Left = 8
          Top = 56
          Width = 89
          Height = 25
          Caption = '&Ca&ncelar'
          TabOrder = 1
          OnClick = BitBtn3Click
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
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Informaci'#243'n Deudor'
      ImageIndex = 2
      object Label1: TLabel
        Left = 1
        Top = 9
        Width = 95
        Height = 13
        Caption = 'Nombres y Apellidos'
      end
      object Label4: TLabel
        Left = 361
        Top = 9
        Width = 89
        Height = 13
        Caption = 'Numero de Cuenta'
      end
      object JVsolicitante: TJvStaticText
        Left = 101
        Top = 7
        Width = 253
        Height = 17
        TextMargins.X = 0
        TextMargins.Y = 0
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnHighlight
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clBlack
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        Layout = tlTop
        ParentColor = False
        TabOrder = 4
        WordWrap = False
      end
      object numero_cuenta: TJvStaticText
        Left = 462
        Top = 7
        Width = 97
        Height = 17
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
        Layout = tlTop
        ParentColor = False
        TabOrder = 5
        WordWrap = False
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 28
        Width = 568
        Height = 113
        Caption = 'Informaci'#243'n Solicitud'
        Enabled = False
        TabOrder = 6
        object Label5: TLabel
          Left = 5
          Top = 19
          Width = 73
          Height = 13
          Caption = 'Valor Solicitado'
        end
        object Label7: TLabel
          Left = 285
          Top = 19
          Width = 40
          Height = 13
          Caption = 'Garantia'
        end
        object Label6: TLabel
          Left = 5
          Top = 88
          Width = 43
          Height = 13
          Caption = 'Inversi'#243'n'
        end
        object Label8: TLabel
          Left = 285
          Top = 43
          Width = 60
          Height = 13
          Caption = 'Amortizaci'#243'n'
        end
        object Label9: TLabel
          Left = 5
          Top = 43
          Width = 60
          Height = 13
          Caption = 'Pago Interes'
        end
        object Label10: TLabel
          Left = 5
          Top = 65
          Width = 26
          Height = 13
          Caption = 'Linea'
        end
        object Label11: TLabel
          Left = 285
          Top = 65
          Width = 24
          Height = 13
          Caption = 'Tasa'
        end
        object JvLabel6: TJvLabel
          Left = 421
          Top = 65
          Width = 65
          Height = 13
          Caption = 'Plazo en Dias'
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JVvalor: TJvCurrencyEdit
          Left = 82
          Top = 17
          Width = 191
          Height = 21
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 0
          HasMaxValue = False
          HasMinValue = False
        end
        object EDinversion: TEdit
          Left = 82
          Top = 86
          Width = 479
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object JVtasa: TJvFloatEdit
          Left = 352
          Top = 63
          Width = 63
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
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 1
        end
        object JVplazo: TJvIntegerEdit
          Left = 498
          Top = 63
          Width = 61
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
        object JVgarantia: TJvStaticText
          Left = 352
          Top = 17
          Width = 207
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
          TabOrder = 4
          WordWrap = False
        end
        object JVpagointeres: TJvStaticText
          Left = 82
          Top = 41
          Width = 191
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
        object JVamortizacion: TJvStaticText
          Left = 352
          Top = 41
          Width = 207
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
          TabOrder = 6
          WordWrap = False
        end
        object JVlinea: TJvStaticText
          Left = 82
          Top = 63
          Width = 191
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
          TabOrder = 7
          WordWrap = False
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 333
        Width = 284
        Height = 41
        TabOrder = 2
        object BitBtn5: TBitBtn
          Left = 13
          Top = 6
          Width = 259
          Height = 30
          Caption = 'Ver &Referencias'
          TabOrder = 0
          OnClick = BitBtn5Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000230B0000230B00000001000000010000000000005A5A
            5A006B6B6B0073737300A5947B0084848400B584840094949C009C9C9C00A5A5
            9C00C6A59C00A5A5A500C6ADA500B5B5A500CEBDA500ADADAD00B5B5AD00D6B5
            AD00F7D6AD00CEC6B500DEC6B500BDBDBD00C6C6C600F7E7C600CECECE00D6D6
            D600FFEFDE00FFEFE700FFF7EF00FFF7F700FF00FF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001E1E1E1E1E1E
            1E1E1E1E1E1E1E1E1E1E0606060606060606061E1E1E1E1E0F1E0A1212121212
            1212061E1E1E1E0F01080A1F1A1717171212061E1E1E0F0119050C1F1F1F1A1A
            1712061E1E0F0116051E0C1F0E0E0E05080802050F0108051E1E111F1F1F0802
            1A1A1A020108051E1E1E111F0E07051A1B1C1C0A05021E1E1E1E141F15021A00
            00001C0A1C02161E1E1E141F101A1B1D1C1C1C0A1C1D031E1E1E141F081A0000
            00001D0A1C1C051E1E1E1414101A1B1C1C1C1C0A1C1C051E1E1E1E1E15020A0A
            0A0A0A0A1D040B1E1E1E1E1E1E18021C1C1C1C1D050B1E1E1E1E1E1E1E1E1802
            1C1C1C0E151E1E1E1E1E1E1E1E1E1E0B0D0213091E1E1E1E1E1E}
        end
      end
      object Panel6: TPanel
        Left = 284
        Top = 333
        Width = 283
        Height = 41
        TabOrder = 3
        object BitBtn4: TBitBtn
          Left = 12
          Top = 6
          Width = 259
          Height = 30
          Caption = '&Ver Concepto Entrevista'
          TabOrder = 0
          OnClick = BitBtn4Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000D30E0000D30E0000000100000001000063636300BD84
            7300DE9C7300525A8C0063739400FFCE94005A639C00EFBD9C00F7CE9C00EFCE
            A5008494AD00DEBDAD00EFC6AD00FFDEAD00C6B5B500E7CEB5008C84BD00FFDE
            BD00FFE7BD00638CC600FFE7C6005A8CCE00F7DECE00FFE7CE00FFEFCE00639C
            D600FFEFD6007BB5DE00B5BDDE00FFEFDE00F7EFE700FFF7E700FFF7EF004284
            F700FFFFF700FF00FF00104AFF003184FF002994FF003994FF00399CFF00429C
            FF004A9CFF007BA5FF0052ADFF005AADFF0052B5FF007BB5FF009CBDFF0063C6
            FF007BC6FF008CC6FF00A5D6FF00ADD6FF00C6DEFF00CEDEFF00EFF7FF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00232323232323
            2323232323232323232323232323232323232323232323232323232323232323
            242401242323232323232323132424242507010E2524232323232323250B0D11
            141A02111E2B152323232315211111181F0C081120392B1523232329291A1D22
            39020D1A2039392A15232327161D223916081722393938261523192920222022
            020D1F393939332D1523290F1F1F221E09141F22393928152323291D39393730
            1C1D393939342C15232329322929232323363639392C15232323232323232323
            2323293532311523232323232323232323232323321523232323232323232323
            2323232323232323232323232323232323232323232323232323}
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 228
        Width = 568
        Height = 67
        Caption = 'Valores Aprobados'
        TabOrder = 0
        object Label12: TLabel
          Left = 9
          Top = 17
          Width = 73
          Height = 13
          Caption = 'Valor Solicitado'
        end
        object Label18: TLabel
          Left = 217
          Top = 17
          Width = 78
          Height = 13
          Caption = 'Plazo Solicittado'
        end
        object Label19: TLabel
          Left = 429
          Top = 17
          Width = 73
          Height = 13
          Caption = 'Tasa a Aprobar'
        end
        object Label23: TLabel
          Left = 9
          Top = 42
          Width = 43
          Height = 13
          Caption = 'Inversi'#243'n'
        end
        object Label24: TLabel
          Left = 294
          Top = 42
          Width = 59
          Height = 13
          Caption = 'Clasificaci'#243'n'
        end
        object JVvaloraprobado: TJvCurrencyEdit
          Left = 86
          Top = 15
          Width = 121
          Height = 21
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 0
          HasMaxValue = False
          HasMinValue = False
        end
        object JVplazoaprobado: TJvIntegerEdit
          Left = 299
          Top = 15
          Width = 121
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
        object JVtasaaprobada: TJvFloatEdit2
          Left = 507
          Top = 15
          Width = 53
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 2
          MaxDecimals = 5
          HasMaxValue = False
          HasMinValue = False
          ClipBoardCommands = [caCopy]
        end
        object DBinversion: TDBLookupComboBox
          Left = 86
          Top = 40
          Width = 198
          Height = 21
          KeyField = 'ID_INVERSION'
          ListField = 'DESCRIPCION_INVERSION'
          ListSource = DSinversion
          TabOrder = 3
          OnExit = DBinversionExit
        end
        object DBclasificacion: TDBLookupComboBox
          Left = 357
          Top = 40
          Width = 203
          Height = 21
          KeyField = 'ID_CLASIFICACION'
          ListField = 'DESCRIPCION_CLASIFICACION'
          ListSource = DSclasificacion
          TabOrder = 4
          OnExit = DBclasificacionExit
        end
      end
      object GroupBox7: TGroupBox
        Left = 1
        Top = 141
        Width = 567
        Height = 89
        Caption = 'Informaci'#243'n Financiera'
        Enabled = False
        TabOrder = 7
        object Label13: TLabel
          Left = 5
          Top = 19
          Width = 86
          Height = 13
          Caption = 'Aportes Ordinarios'
        end
        object Label17: TLabel
          Left = 5
          Top = 42
          Width = 67
          Height = 13
          Caption = 'Ahorro Juvenil'
        end
        object Label16: TLabel
          Left = 5
          Top = 65
          Width = 155
          Height = 13
          Caption = 'Certicado de Deposito a Termino'
        end
        object Label14: TLabel
          Left = 312
          Top = 19
          Width = 76
          Height = 13
          Caption = 'Ahorro Ordinario'
        end
        object Label15: TLabel
          Left = 312
          Top = 42
          Width = 88
          Height = 13
          Caption = 'Ahorro Contractual'
        end
        object Label22: TLabel
          Left = 312
          Top = 65
          Width = 129
          Height = 13
          Caption = 'Creditos en Crediservir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object JVcdat: TJvCurrencyEdit
          Left = 164
          Top = 63
          Width = 145
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 0
          HasMaxValue = False
          HasMinValue = False
          ClipBoardCommands = [caCopy]
        end
        object JVjuvenil: TJvCurrencyEdit
          Left = 164
          Top = 40
          Width = 145
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 1
          HasMaxValue = False
          HasMinValue = False
          ClipBoardCommands = [caCopy]
        end
        object JVaportes: TJvCurrencyEdit
          Left = 164
          Top = 17
          Width = 145
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 2
          HasMaxValue = False
          HasMinValue = False
          ClipBoardCommands = [caCopy]
        end
        object JVahorro: TJvCurrencyEdit
          Left = 417
          Top = 17
          Width = 145
          Height = 21
          Alignment = taRightJustify
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
          HasMaxValue = False
          HasMinValue = False
          ClipBoardCommands = [caCopy]
          DisabledTextColor = clHighlightText
        end
        object JVcontractual: TJvCurrencyEdit
          Left = 417
          Top = 40
          Width = 145
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 4
          HasMaxValue = False
          HasMinValue = False
          ClipBoardCommands = [caCopy]
        end
        object Rsi: TRadioButton
          Left = 457
          Top = 65
          Width = 34
          Height = 17
          Alignment = taLeftJustify
          BiDiMode = bdRightToLeft
          Caption = 'SI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 5
        end
        object Rno: TRadioButton
          Left = 523
          Top = 65
          Width = 38
          Height = 17
          Alignment = taLeftJustify
          BiDiMode = bdRightToLeft
          Caption = 'NO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 6
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 294
        Width = 567
        Height = 39
        TabOrder = 1
        object Label21: TLabel
          Left = 4
          Top = 12
          Width = 165
          Height = 13
          Caption = 'Destino Solicitud de Cr'#233'ditos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBente: TDBLookupComboBox
          Left = 185
          Top = 10
          Width = 376
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyField = 'ID_ENTE_APROBADOR'
          ListField = 'DESCRIPCION_ENTE_APROBADOR'
          ListSource = DSente
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Observaciones y Conceptos'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 3
        Top = 8
        Width = 561
        Height = 65
        Caption = 'Obsevaciones Analisis de Pago'
        TabOrder = 0
        object Manalisis: TMemo
          Left = 6
          Top = 15
          Width = 546
          Height = 45
          ScrollBars = ssVertical
          TabOrder = 0
          WantReturns = False
          OnExit = ManalisisExit
          OnKeyPress = ManalisisKeyPress
        end
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 71
        Width = 561
        Height = 105
        Caption = 'Observaciones Generales'
        TabOrder = 1
        object Mobservacion: TMemo
          Left = 6
          Top = 14
          Width = 546
          Height = 84
          ScrollBars = ssVertical
          TabOrder = 0
          WantReturns = False
          OnExit = MobservacionExit
          OnKeyPress = MobservacionKeyPress
        end
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 172
        Width = 561
        Height = 105
        Caption = 'Concepto Final'
        TabOrder = 2
        object Mconcepto: TMemo
          Left = 6
          Top = 14
          Width = 546
          Height = 84
          ScrollBars = ssVertical
          TabOrder = 0
          WantReturns = False
          OnExit = MconceptoExit
          OnKeyPress = MconceptoKeyPress
        end
      end
      object GroupBox5: TGroupBox
        Left = 3
        Top = 273
        Width = 561
        Height = 103
        Caption = 'Recomendaciones Especiales'
        TabOrder = 3
        object Mrecomendaciones: TMemo
          Left = 6
          Top = 16
          Width = 546
          Height = 84
          ScrollBars = ssVertical
          TabOrder = 0
          WantReturns = False
          OnExit = MrecomendacionesExit
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 35
    TabOrder = 0
    object JvLabel1: TJvLabel
      Left = 2
      Top = 9
      Width = 101
      Height = 13
      Caption = 'Numero de Radicado'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Label3: TLabel
      Left = 256
      Top = 9
      Width = 85
      Height = 13
      Caption = 'Fecha Recepci'#243'n'
    end
    object MKsolicitud: TMaskEdit
      Left = 104
      Top = 7
      Width = 67
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '          '
      OnKeyPress = MKsolicitudKeyPress
    end
    object BTbuscar: TBitBtn
      Left = 178
      Top = 7
      Width = 75
      Height = 21
      Caption = '&Buscar'
      TabOrder = 1
      OnClick = BTbuscarClick
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
    object JvStaticText2: TJvStaticText
      Left = 440
      Top = 9
      Width = 37
      Height = 17
      TextMargins.X = 0
      TextMargins.Y = 0
      Caption = 'Oficina'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      TabOrder = 2
      WordWrap = False
    end
    object Jvoficina: TJvStaticText
      Left = 477
      Top = 7
      Width = 94
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
      Layout = tlTop
      ParentColor = False
      TabOrder = 3
      WordWrap = False
    end
    object JVfecha: TJvStaticText
      Left = 346
      Top = 7
      Width = 88
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
      TabOrder = 4
      WordWrap = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 438
    Width = 577
    Height = 31
    Color = clOlive
    TabOrder = 2
    object BTnuevo: TBitBtn
      Left = 15
      Top = 5
      Width = 123
      Height = 24
      Caption = '&Nuevo'
      TabOrder = 0
      TabStop = False
      OnClick = BTnuevoClick
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
    end
    object BTaceptar: TBitBtn
      Left = 156
      Top = 5
      Width = 123
      Height = 24
      Caption = '&Registrar'
      Enabled = False
      TabOrder = 1
      TabStop = False
      OnClick = BTaceptarClick
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
    object BTcerrar: TBitBtn
      Left = 438
      Top = 5
      Width = 123
      Height = 24
      Caption = '&Salir'
      TabOrder = 2
      TabStop = False
      OnClick = BTcerrarClick
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
    object BTreporte: TBitBtn
      Left = 297
      Top = 5
      Width = 123
      Height = 24
      Caption = 'R&eporte&'
      Enabled = False
      TabOrder = 3
      TabStop = False
      OnClick = BTreporteClick
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
  end
  object CDcodeudores: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'nombres'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'definicion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'numero'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    IndexFieldNames = 'definicion'
    Params = <>
    StoreDefs = True
    Left = 320
    Top = 192
    Data = {
      9D0000009619E0BD0100000018000000050000000000030000009D000A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E0200010000000000076E6F6D62726573010049
      00000001000557494454480200020064000A646566696E6963696F6E01004900
      00000100055749445448020002001400066E756D65726F020001000000000000
      00}
    object CDcodeudoresid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDcodeudoresid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDcodeudoresnombres: TStringField
      FieldName = 'nombres'
      Size = 100
    end
    object CDcodeudoresdefinicion: TStringField
      FieldName = 'definicion'
    end
    object CDcodeudoresnumero: TSmallintField
      FieldName = 'numero'
    end
  end
  object DScodeudores: TDataSource
    DataSet = CDcodeudores
    Left = 616
    Top = 65535
  end
  object CDcredito: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'colocacion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'saldo'
        DataType = ftCurrency
      end
      item
        Name = 'fecha'
        DataType = ftDate
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
        Name = 'cuota'
        DataType = ftCurrency
      end
      item
        Name = 'criterio'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'es_descuento'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 432
    Top = 56
    Data = {
      EE0000009619E0BD010000001800000008000000000003000000EE000A636F6C
      6F636163696F6E01004900000001000557494454480200020014000573616C64
      6F080004000000010007535542545950450200490006004D6F6E657900056665
      63686104000600000000000665737461646F0100490000000100055749445448
      020002001E000D66656368615F696E746572657304000600000000000563756F
      7461080004000000010007535542545950450200490006004D6F6E6579000863
      7269746572696F01004900000001000557494454480200020002000C65735F64
      65736375656E746F02000300000000000000}
    object CDcreditocolocacion: TStringField
      FieldName = 'colocacion'
    end
    object CDcreditosaldo: TCurrencyField
      FieldName = 'saldo'
    end
    object CDcreditofecha: TDateField
      FieldName = 'fecha'
    end
    object CDcreditoestado: TStringField
      FieldName = 'estado'
      Size = 30
    end
    object CDcreditofecha_interes: TDateField
      FieldName = 'fecha_interes'
    end
    object CDcreditocuota: TCurrencyField
      FieldName = 'cuota'
    end
    object CDcreditocriterio: TStringField
      FieldName = 'criterio'
      Size = 2
    end
    object CDcreditoes_descuento: TBooleanField
      FieldName = 'es_descuento'
    end
  end
  object DScredito: TDataSource
    DataSet = CDcredito
    Left = 584
  end
  object IBoficina: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$agencia"')
    Left = 648
    Top = 32
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 760
    Top = 8
  end
  object DSoficina: TDataSource
    DataSet = IBoficina
    Left = 648
  end
  object DSgarantia: TDataSource
    DataSet = IBgarantia
    Left = 680
  end
  object IBlinea: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      ' SELECT * FROM "col$lineas"')
    Left = 712
    Top = 32
  end
  object IBgarantia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM'
      '  "col$garantia"')
    Left = 680
    Top = 32
  end
  object IBamortiza: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT * FROM "col$amortizacion"')
    Left = 584
    Top = 96
  end
  object DSamortizacion: TDataSource
    DataSet = IBamortiza
    Left = 584
    Top = 64
  end
  object DSlinea: TDataSource
    DataSet = IBlinea
    Left = 712
  end
  object ImageList1: TImageList
    Left = 392
    Top = 56
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      00000000000000000000000000000000000000000000C0480000C0480000C048
      0000C0480000C0480000C0480000C0480000C0480000C0480000C0480000C048
      0000C0480000C0480000C0480000C04800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1583800A1583800B62A0B00B62A
      1100C0311600B63116008431160073382A000000000000000000000000000000
      00000000000000000000000000000000000000000000C0480000FFFFFF00FFFF
      FF00FFFFF400FFF4E000FFEACA00FFE0B600FFD4A100FFCA9800FFCA9800FFCA
      9800FFCA9800FFCA9800FFCA9800C04800000000000000000000066A06000B84
      0B001C8F1C002398230023982300066006001C7B160011580B0040382A005850
      4000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B62A0B00B62A0B00E0402300F448
      3100FF504000EA483100E0402300EA402A007331160048584000235823001C58
      1C0016601600165816001C501C004058400000000000C0480000FFFFFF00FFB6
      6A00FFB66A00FFFFF400FFB66A00FFB66A00FFB66A00FFB66A00FFB66A00FFB6
      6A00FFB66A00FFB66A00FFCA9800C04800000000000000000000118F11001C98
      1C0031AB310038B638002384230073AB600038AB38002AAB2A0011580B00312A
      1600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0311100C0311100FF584000FF60
      4800D4502A00EAA16A00D4603100F4584000E0402300607323006AAB58004898
      400048B6480038B638001CA11C000B7B0B0000000000C0480000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF400FFF4E000FFEACA00FFE0B600FFD4A100FFCA
      9800FFCA9800FFCA9800FFCA9800C048000000000000000000001684160031AB
      310050C0500050B65000F4FFEA00F4FFEA0048B6480048C048001C8F1C003150
      2300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA6A4800FF604800FF73
      5000D4734000FFCA8400D4734000EA604000E0402300608F3800B6D4A100CAE0
      B60058CA580048C048002AA12A000B730B0000000000C0480000FFFFFF00FFB6
      6A00FFB66A00FFFFFF00FFB66A00FFB66A00FFB66A00FFB66A00FFB66A00FFB6
      6A00FFB66A00FFB66A00FFCA9800C048000000000000000000000000000031AB
      310058C05800388F3100FFFFFF00FFFFFF0050B6500058C058001C841C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F482A00731C
      0B0011115800111160008F383100B6401C0058A140006AD46A00FFF4E000FFF4
      E0006098480048AB4800237323000000000000000000C0480000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF400FFF4E000FFEACA00FFE0
      B600FFD4A100FFCA9800FFCA9800C04800000000000000000000000000000000
      00000B583100236A98001160AB002A73980048AB480023842300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000B0B0B000303
      0300061C7B00061C7B00060B580048384000318F310048AB48007B98A1003173
      A100487B8F001C6A2300000000000000000000000000C0480000FFFFFF00FFB6
      6A00FFB66A00FFFFFF00FFB66A00FFB66A00FFB66A00FFB66A00FFB66A00FFB6
      6A00FFB66A00FFB66A00FFCA9800C04800000000000000000000000000000000
      00000B60B6001173E0001673E0001173E0001650380000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000606060003060B000B31
      8F000B40AB000B40AB000B38AB00061C730000000000000000001C7BF4001C7B
      F4001C7BF400167BEA00000000000000000000000000C0480000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF400FFF4
      E000FFEACA00FFCA8F00FFD4A100C04800000000000000000000000000001660
      98002384FF002384FF002384FF002384FF001673E00023383800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0B0B0006111C000B40
      AB001150C0001150C0001148C00006319800000000003884C000238FFF00238F
      FF002384FF002384FF002A5060000000000000000000C0480000FFFFFF00FFB6
      6A00FFB66A00FFFFFF00FFB66A00FFB66A00FFB66A00FFB66A00FFB66A00FFB6
      6A00FFB66A00FFB66A00FFE0B600C0480000000000000000000000000000116A
      B6002A8FFF002A8FFF002A8FFF002A8FFF002384F4001C405000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C1C1C00161616001140
      8F001C7BF4001C7BF4001673F4001150C000000000002A8FE00031A1FF0038A1
      FF0031A1FF003198FF001673C0000000000000000000C0480000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF400FFF4E000FFEACA00C04800000000000000000000508FB6002A8F
      F40031A1FF0038A1FF0038ABFF0038A1FF003198FF0023587B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C1C1C00313131000B16
      2A001150C0001660E0001C7BF4001150B60000000000318FE00038ABFF0040AB
      FF0038ABFF0038A1FF001C7BD4000000000000000000C0480000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF400FFF4E000C04800000000000000000000387BAB002A8F
      EA0040ABFF0040ABFF0038A1F40031A1EA0038A1F40023587300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000404040005050
      50008F8F8F006A6A6A001C1C1C0031313100000000003884B600237BB6003184
      C0001C7BC0001673C000065084000000000000000000C0480000C0480000C048
      0000C0480000C0480000C0480000C0480000C0480000C0480000C0480000C048
      0000C0480000C0480000C0480000C04800000000000000000000486A84001158
      8F00317BB6005098CA004898F4003184E00011508F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002A2A2A005858
      5800737373006A6A6A0023232300000000000000000000000000408FCA0050A1
      D40098CAEA0058A1CA002A6A8F00000000000000000000000000C0480000C048
      0000C0480000C0480000C0480000C0480000C0480000C0480000C0480000C048
      0000C0480000C0480000C0480000000000000000000000000000000000001158
      8F005098CA0073ABE00058ABE0004098D4001C50600000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084B6D40073AB
      CA006AA1CA0073A1C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000508FAB00317BA10031739800486A84000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFF8000FFFF0000
      00FF8000C00F000000008000C00F000000008000C00F000080008000E01F0000
      C0018000F03F0000C0038000F07F000080C38000E03F000080818000E03F0000
      80818000C03F000080818000C03F0000C0818000C07F0000C1C1C001E07F0000
      FFC3FFFFF0FF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object CDcapacidad: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'ingresos'
        DataType = ftCurrency
      end
      item
        Name = 'deducciones'
        DataType = ftCurrency
      end
      item
        Name = 'disponible'
        DataType = ftCurrency
      end
      item
        Name = 'valor_cuota'
        DataType = ftCurrency
      end
      item
        Name = 'disp_pago'
        DataType = ftCurrency
      end
      item
        Name = 'solv_economica'
        DataType = ftSmallint
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'definicion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'exp_creditos'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'definicion'
    Params = <>
    StoreDefs = True
    Left = 584
    Top = 256
    Data = {
      820100009619E0BD01000000180000000A00000000000300000082011169645F
      6964656E74696669636163696F6E020001000000000008696E677265736F7308
      0004000000010007535542545950450200490006004D6F6E6579000B64656475
      6363696F6E6573080004000000010007535542545950450200490006004D6F6E
      6579000A646973706F6E69626C65080004000000010007535542545950450200
      490006004D6F6E6579000B76616C6F725F63756F746108000400000001000753
      5542545950450200490006004D6F6E65790009646973705F7061676F08000400
      0000010007535542545950450200490006004D6F6E6579000E736F6C765F6563
      6F6E6F6D69636102000100000000000A69645F706572736F6E61010049000000
      0100055749445448020002000F000A646566696E6963696F6E01004900000001
      000557494454480200020014000C6578705F6372656469746F73010049000000
      010005574944544802000200140001000D44454641554C545F4F524445520200
      820000000000}
    object CDcapacidadid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDcapacidadingresos: TCurrencyField
      FieldName = 'ingresos'
    end
    object CDcapacidaddeducciones: TCurrencyField
      FieldName = 'deducciones'
    end
    object CDcapacidaddisponible: TCurrencyField
      FieldName = 'disponible'
    end
    object CDcapacidadvalor_cuota: TCurrencyField
      FieldName = 'valor_cuota'
    end
    object CDcapacidaddisp_pago: TCurrencyField
      FieldName = 'disp_pago'
    end
    object CDcapacidadsolv_economica: TSmallintField
      FieldName = 'solv_economica'
    end
    object CDcapacidadid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDcapacidaddefinicion: TStringField
      DisplayWidth = 20
      FieldName = 'definicion'
    end
    object CDcapacidadexp_creditos: TStringField
      FieldName = 'exp_creditos'
    end
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 432
    Top = 376
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDsino
    Left = 40
    Top = 472
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = CDcreditodeudor
    Left = 72
    Top = 472
  end
  object CDsino: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 64
    Data = {
      300000009619E0BD010000001800000002000000000003000000300002736902
      00030000000000026E6F02000300000000000000}
    object CDsinosi: TBooleanField
      FieldName = 'si'
    end
    object CDsinono: TBooleanField
      FieldName = 'no'
    end
  end
  object CDcreditodeudor: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'numero'
        DataType = ftSmallint
      end
      item
        Name = 'colocacion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'valor_cuota'
        DataType = ftCurrency
      end
      item
        Name = 'saldo'
        DataType = ftCurrency
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'definicion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    IndexFieldNames = 'numero'
    MasterFields = 'numero'
    MasterSource = DScreditodeudor
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 584
    Top = 160
    Data = {
      420100009619E0BD01000000180000000A0000000000030000004201066E756D
      65726F02000100000000000A636F6C6F636163696F6E01004900000001000557
      494454480200020014000576616C6F7208000400000001000753554254595045
      0200490006004D6F6E6579000B76616C6F725F63756F74610800040000000100
      07535542545950450200490006004D6F6E6579000573616C646F080004000000
      010007535542545950450200490006004D6F6E6579000A69645F706572736F6E
      610100490000000100055749445448020002000F001169645F6964656E746966
      69636163696F6E02000100000000000A646566696E6963696F6E010049000000
      01000557494454480200020032000665737461646F0100490000000100055749
      445448020002003200066E6F6D62726501004900000001000557494454480200
      020064000000}
    object CDcreditodeudornumero: TSmallintField
      FieldName = 'numero'
    end
    object CDcreditodeudorcolocacion: TStringField
      FieldName = 'colocacion'
    end
    object CDcreditodeudorvalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDcreditodeudorvalor_cuota: TCurrencyField
      FieldName = 'valor_cuota'
    end
    object CDcreditodeudorsaldo: TCurrencyField
      FieldName = 'saldo'
    end
    object CDcreditodeudorid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDcreditodeudorid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDcreditodeudordefinicion: TStringField
      FieldName = 'definicion'
      Size = 50
    end
    object CDcreditodeudorestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object CDcreditodeudornombre: TStringField
      FieldName = 'nombre'
      Size = 100
    end
  end
  object CDfianzadeudor: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'numero'
        DataType = ftSmallint
      end
      item
        Name = 'colocacion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'valor_cuota'
        DataType = ftCurrency
      end
      item
        Name = 'saldo'
        DataType = ftCurrency
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'definicion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    IndexFieldNames = 'numero'
    MasterFields = 'numero'
    MasterSource = DScreditodeudor
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 584
    Top = 128
    Data = {
      420100009619E0BD01000000180000000A0000000000030000004201066E756D
      65726F02000100000000000A636F6C6F636163696F6E01004900000001000557
      494454480200020014000576616C6F7208000400000001000753554254595045
      0200490006004D6F6E6579000B76616C6F725F63756F74610800040000000100
      07535542545950450200490006004D6F6E6579000573616C646F080004000000
      010007535542545950450200490006004D6F6E6579000A69645F706572736F6E
      610100490000000100055749445448020002000F001169645F6964656E746966
      69636163696F6E02000100000000000A646566696E6963696F6E010049000000
      01000557494454480200020032000665737461646F0100490000000100055749
      445448020002003200066E6F6D62726501004900000001000557494454480200
      020064000000}
    object CDfianzadeudornumero: TSmallintField
      FieldName = 'numero'
    end
    object CDfianzadeudorcolocacion: TStringField
      FieldName = 'colocacion'
    end
    object CDfianzadeudorvalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDfianzadeudorvalor_cuota: TCurrencyField
      FieldName = 'valor_cuota'
    end
    object CDfianzadeudorsaldo: TCurrencyField
      FieldName = 'saldo'
    end
    object CDfianzadeudorid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDfianzadeudorid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDfianzadeudordefinicion: TStringField
      FieldName = 'definicion'
      Size = 50
    end
    object CDfianzadeudorestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object CDfianzadeudornombre: TStringField
      FieldName = 'nombre'
      Size = 100
    end
  end
  object DScreditodeudor: TDataSource
    DataSet = CDgeneral
    Left = 616
    Top = 96
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = CDfianzadeudor
    Left = 104
    Top = 472
  end
  object CDgeneral: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'numero'
        DataType = ftSmallint
      end
      item
        Name = 'definicion'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'primary'
        Fields = 'numero'
        Options = [ixPrimary, ixUnique]
      end>
    IndexName = 'primary'
    Params = <>
    StoreDefs = True
    Left = 584
    Top = 224
    Data = {
      480000009619E0BD0100000018000000020000000000030000004800066E756D
      65726F02000100000000000A646566696E6963696F6E01004900000001000557
      494454480200020014000000}
    object CDgeneralnumero: TSmallintField
      FieldName = 'numero'
    end
    object CDgeneraldefinicion: TStringField
      FieldName = 'definicion'
    end
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = CDgeneral
    Left = 136
    Top = 472
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT DISTINCT '
      '  "col$requisitos".DESCRIPCION,'
      '  "col$solicitudrequisito".ID_PERSONA'
      'FROM'
      '  "col$requisitos"'
      
        '  INNER JOIN "col$solicitudrequisito" ON ("col$requisitos".ID_RE' +
        'QUISITO = "col$solicitudrequisito".ID_REQUISITO)'
      'WHERE'
      '  ("col$solicitudrequisito".ID_SOLICITUD = :ID_SOLICITUD)')
    Left = 142
    Top = 298
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end>
  end
  object frDBDataSet5: TfrDBDataSet
    DataSet = CDrequisitos
    Left = 168
    Top = 472
  end
  object CDrequisitos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'numero'
        DataType = ftSmallint
      end
      item
        Name = 'No'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DOCUMENTOS'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'EXIGIDOS'
        DataType = ftString
        Size = 150
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'numero'
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 264
    Data = {
      920000009619E0BD0100000018000000040000000000030000009200066E756D
      65726F0200010000000000024E6F010049000000010005574944544802000200
      64000A444F43554D454E544F5301004900000001000557494454480200020002
      00084558494749444F5301004900000001000557494454480200020096000100
      0D44454641554C545F4F524445520200820000000000}
    object CDrequisitosnumero: TSmallintField
      FieldName = 'numero'
    end
    object CDrequisitosNo: TStringField
      FieldName = 'No'
      Size = 100
    end
    object CDrequisitosDOCUMENTOS: TStringField
      FieldName = 'DOCUMENTOS'
      Size = 2
    end
    object CDrequisitosEXIGIDOS: TStringField
      FieldName = 'EXIGIDOS'
      Size = 150
    end
  end
  object frDBDataSet6: TfrDBDataSet
    DataSet = CDcapacidad
    Left = 200
    Top = 472
  end
  object frDBDataSet7: TfrDBDataSet
    DataSet = IBQuery2
    Left = 232
    Top = 472
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      'SELECT DISTINCT '
      '  "col$tipoobservacion".DESCRIPCION,'
      '  "col$observacion".OBSERVACION,'
      '  "col$tipoobservacion".ID_TIPO'
      'FROM'
      '  "col$tipoobservacion"'
      
        '  INNER JOIN "col$observacion" ON ("col$tipoobservacion".ID_TIPO' +
        ' = "col$observacion".ID_OBSERVACION)'
      'WHERE'
      '  ("col$observacion".ID_SOLICITUD = :ID_SOLICITUD) AND '
      '  ("col$tipoobservacion".ID_TIPO IN (1,2,3,4,5))'
      'ORDER BY'
      '  "col$tipoobservacion".ID_TIPO')
    Left = 264
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end>
  end
  object DSente: TDataSource
    DataSet = IBente
    Left = 336
    Top = 64
  end
  object IBente: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "col$enteaprobador".ID_ENTE_APROBADOR,'
      '  "col$enteaprobador".DESCRIPCION_ENTE_APROBADOR'
      'FROM'
      '  "col$enteaprobador"'
      'WHERE'
      '  ("col$enteaprobador".ID_ENTE_APROBADOR <> 3)')
    Left = 280
    Top = 88
  end
  object DSinversion: TDataSource
    DataSet = IBinversion
    Left = 600
    Top = 392
  end
  object DSclasificacion: TDataSource
    DataSet = IBclasificacion
    Left = 640
    Top = 400
  end
  object IBinversion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select *  from "col$inversion"')
    Left = 608
    Top = 432
  end
  object IBclasificacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "col$clasificacion"')
    Left = 648
    Top = 456
  end
  object CDdescuento: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 32
    Data = {
      720000009619E0BD01000000180000000300000000000300000072000C69645F
      736F6C6963697475640100490000000100055749445448020002000A000D6964
      5F636F6C6F636163696F6E0100490000000100055749445448020002000B000C
      65735F6465736375656E746F02000300000000000000}
    object CDdescuentoid_solicitud: TStringField
      FieldName = 'id_solicitud'
      Size = 10
    end
    object CDdescuentoid_colocacion: TStringField
      FieldName = 'id_colocacion'
      Size = 11
    end
    object CDdescuentoes_descuento: TBooleanField
      FieldName = 'es_descuento'
    end
  end
  object ActionList1: TActionList
    Left = 376
    Top = 40
  end
  object PopupMenu1: TPopupMenu
    Left = 536
    Top = 40
    object VerInformacionGeneral1: TMenuItem
      Caption = 'Ver Informacion General'
      OnClick = VerInformacionGeneral1Click
    end
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 288
    Top = 472
  end
  object PopupMenu2: TPopupMenu
    Left = 440
    Top = 40
    object VerInformacinGeneral1: TMenuItem
      Caption = 'Ver Informaci'#243'n General'
      OnClick = VerInformacinGeneral1Click
    end
  end
end
