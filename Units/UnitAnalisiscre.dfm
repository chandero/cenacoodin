object FrmAnalisiscre: TFrmAnalisiscre
  Left = 453
  Top = 156
  Width = 585
  Height = 503
  AutoSize = True
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
    ActivePage = TabSheet3
    Enabled = False
    Images = ImageList1
    TabIndex = 2
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Estado Crediticio '
      object DBGrid1: TDBGrid
        Left = 3
        Top = 4
        Width = 419
        Height = 121
        Color = clWhite
        DataSource = DScodeudores
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          Top = 6
          Width = 135
          Height = 22
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
          Top = 28
          Width = 135
          Height = 22
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
          Top = 50
          Width = 135
          Height = 22
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
          Top = 72
          Width = 135
          Height = 22
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
        object BitBtn6: TBitBtn
          Left = 6
          Top = 94
          Width = 135
          Height = 22
          Caption = 'Fianzas &Atrasadas'
          TabOrder = 4
          OnClick = BitBtn6Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000F30E0000F30E000000010000000100002D2D2D001855
            6F0042424200454442004A4A4A0052424A004A524A0058534E0063635A00635A
            6B005160610054777B00636363006B6363006B736B00736B7300737373007373
            7B007B737B007C7078007B7B7B00B56D3E00C1713500C07638008A5B5200947E
            7500AD7B73008C847B00EFA65A00EDA75F00F0A85C0000009A000316AC004174
            9600477AA9000018C6001029D600106BFF00FF00FF0035A8F5004A9EED006D8A
            FD00848484008C848C008C8C8C00949494009C9C9C009CA594009891A200A5A5
            A500ADADAD00ADADB500B5B5B500BDBDBD00F1BC8600F8C28C00F9C48D00FBD3
            A900C6C6C600D6D6D600DEDEDE00E7DED6000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000262626262626
            26262626262626262626262626262626262626262626262626262626262A2E10
            0C10323435312A2A2626262626043C2A0C1431353B3A322E2626262626020007
            0C1031343B3A322E26262626260407030A1431343B3A312D262626262604310B
            2201183435312A2A2626262626023B0B211916183B3A322E2626262626023B2B
            13361E17183A322E2626262626023C2B1A39381C1718322E2626262626053110
            0C1A39381E1618142626262626053D2B0D101A39371D15182626262626053D2B
            080E2E1A393027201F26262626053110090E2D321A282424201F26262606332C
            2F313131322329252426262626261B120F111010101423232626}
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
          OnEnter = JVingresosEnter
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
          OnEnter = JVdeduccionesEnter
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
          OnEnter = JVdisponibleEnter
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
          OnEnter = JVdispagoEnter
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
          OnEnter = JVcuotaEnter
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
          OnCellClick = DBcolocacionCellClick
          OnColExit = DBcolocacionColExit
          OnDrawColumnCell = DBcolocacionDrawColumnCell
          OnDblClick = DBcolocacionDblClick
          OnKeyPress = DBcolocacionKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'colocacion'
              Title.Caption = 'Colocaci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'saldo'
              Title.Alignment = taRightJustify
              Title.Caption = 'Saldo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fecha'
              Title.Caption = 'F. Capital'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'fecha_interes'
              Title.Caption = 'F. Inter'#233's'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cuota'
              Title.Alignment = taRightJustify
              Title.Caption = 'Cuota'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'criterio'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'es_descuento'
              Title.Caption = 'Desc.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'desc_estado'
              Title.Caption = 'Estado'
              Visible = True
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
          object DBCheckBox1: TDBCheckBox
            Left = -48
            Top = -64
            Width = 33
            Height = 17
            DataField = 'es_descuento'
            DataSource = DScredito
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
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
      object DbFianzas: TDBGrid
        Left = 3
        Top = 145
        Width = 554
        Height = 112
        Hint = 'Para Autorizar la Fianza Haga doble clic sobre la Colocaci'#243'n'
        DataSource = DsFianzas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        OnColExit = DbFianzasColExit
        OnDrawColumnCell = DbFianzasDrawColumnCell
        OnDblClick = DbFianzasDblClick
        OnKeyPress = DbFianzasKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'id_colocacion'
            Title.Caption = 'COLOCACION'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'saldo_actual'
            Title.Caption = 'SALDO ACTUAL'
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id_agencia'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'dias'
            Title.Caption = 'No. DIAS'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'estado'
            Title.Caption = 'ESTADO ACTUAL'
            Width = 134
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'autoriza'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'AU.'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id_persona'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'id_identificacion'
            Visible = False
          end>
      end
      object DBCheckBox2: TDBCheckBox
        Left = -48
        Top = -64
        Width = 49
        Height = 17
        DataField = 'autoriza'
        DataSource = DsFianzas
        TabOrder = 10
        ValueChecked = 'True'
        ValueUnchecked = 'False'
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
        Left = 3
        Top = 333
        Width = 140
        Height = 41
        TabOrder = 2
        object BitBtn5: TBitBtn
          Left = 13
          Top = 6
          Width = 108
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
        Left = 145
        Top = 333
        Width = 140
        Height = 41
        TabOrder = 3
        object BitBtn4: TBitBtn
          Left = 14
          Top = 6
          Width = 108
          Height = 30
          Caption = '&Ver Entrevista'
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
          ReadOnly = True
          TabOrder = 0
          OnEnter = JVvaloraprobadoEnter
          HasMaxValue = False
          HasMinValue = False
          ClipBoardCommands = [caCopy]
        end
        object JVplazoaprobado: TJvIntegerEdit
          Left = 299
          Top = 15
          Width = 121
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 1
          OnEnter = JVplazoaprobadoEnter
          Value = 0
          MaxValue = 0
          MinValue = 0
          HasMaxValue = False
          HasMinValue = False
          ClipBoardCommands = [caCopy]
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
          Width = 89
          Height = 13
          Caption = 'Ente Aprobador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 294
          Top = 12
          Width = 104
          Height = 13
          Caption = 'Concepto Analista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object DBente: TDBLookupComboBox
          Left = 96
          Top = 10
          Width = 193
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
        object rFavorable: TRadioButton
          Left = 407
          Top = 11
          Width = 77
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Favorable'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          TabStop = True
          Visible = False
        end
        object rNegativo: TRadioButton
          Left = 488
          Top = 11
          Width = 71
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Negativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
      end
      object Panel8: TPanel
        Left = 286
        Top = 333
        Width = 140
        Height = 41
        TabOrder = 8
        object BitBtn7: TBitBtn
          Left = 16
          Top = 6
          Width = 108
          Height = 30
          Caption = 'Ver &Bancoldex'
          TabOrder = 0
          OnClick = BitBtn7Click
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
      end
      object Panel9: TPanel
        Left = 427
        Top = 333
        Width = 140
        Height = 41
        TabOrder = 9
        object BitBtn8: TBitBtn
          Left = 13
          Top = 6
          Width = 108
          Height = 30
          Caption = 'Ver  &F. N. G.'
          Enabled = False
          TabOrder = 0
          OnClick = BitBtn4Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000420B0000420B00000001000000010000985869009860
            600098606900A1606900A1696900AB696900AB697200B6727100B5727200BF7B
            7200FFA61C00E5943C00C9847B00D38E7200D38E7B005858FF00FF00FF005B97
            F10040BDEC00D3B5AB00DFBFAB00E9BFB500E9C9AB0089D0F900A9E3F6000000
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
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000101001040404
            0404040404040404041010100018181818181818111111110410101000181818
            11111118181811180410101000181812181118181818111804101010020B0B0B
            181807071818111104101010030B0B12170707071118181104101010050B1218
            180F0F0F1818181104101010060B0B12180F0F0F1818181104101010080B0B0B
            0B1217111811181104101010080A0B0B0B0B17181111181104101010090A0A0B
            0B0B0B1718181811041010100C0A0A0A0A0B121717171111041010100E0A0A0A
            0B0B121818181118041010100E0A0A0A0B12121811181118041010100E0A0A0A
            0B12181811181118041010100D1416150B0B1313131313131310}
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
    Left = 248
    Top = 152
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
      end
      item
        Name = 'desc_estado'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 184
    Top = 152
    Data = {
      0E0100009619E0BD0100000018000000090000000000030000000E010A636F6C
      6F636163696F6E01004900000001000557494454480200020014000573616C64
      6F080004000000010007535542545950450200490006004D6F6E657900056665
      63686104000600000000000665737461646F0100490000000100055749445448
      020002001E000D66656368615F696E746572657304000600000000000563756F
      7461080004000000010007535542545950450200490006004D6F6E6579000863
      7269746572696F01004900000001000557494454480200020002000C65735F64
      65736375656E746F02000300000000000B646573635F65737461646F01004900
      000001000557494454480200020014000000}
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
    object CDcreditodesc_estado: TStringField
      FieldName = 'desc_estado'
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
    Left = 88
    Top = 152
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
      00000000000000000000000000000000000000000000C64A0000C64A0000C64A
      0000C64A0000C64A0000C64A0000C64A0000C64A0000C64A0000C64A0000C64A
      0000C64A0000C64A0000C64A0000C64A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A55A3900A55A3900B5290800B529
      1000C6311000B531100084311000733929000000000000000000000000000000
      00000000000000000000000000000000000000000000C64A0000FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFCE00FFE7B500FFD6A500FFCE9C00FFCE9C00FFCE
      9C00FFCE9C00FFCE9C00FFCE9C00C64A00000000000000000000006B00000884
      0800188C1800219C2100219C210000630000187B1000105A0800423929005A52
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5290800B5290800E7422100F74A
      3100FF524200EF4A3100E7422100EF422900733110004A5A4200215A2100185A
      180010631000105A100018521800425A420000000000C64A0000FFFFFF00FFB5
      6B00FFB56B00FFFFF700FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFCE9C00C64A00000000000000000000108C1000189C
      180031AD310039B539002184210073AD630039AD390029AD2900105A08003129
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6311000C6311000FF5A4200FF63
      4A00D6522900EFA56B00D6633100F75A4200E7422100637321006BAD5A004A9C
      42004AB54A0039B5390018A51800087B080000000000C64A0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFCE00FFE7B500FFD6A500FFCE
      9C00FFCE9C00FFCE9C00FFCE9C00C64A000000000000000000001084100031AD
      310052C6520052B55200F7FFEF00F7FFEF004AB54A004AC64A00188C18003152
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE6B4A00FF634A00FF73
      5200D6734200FFCE8400D6734200EF634200E7422100638C3900B5D6A500CEE7
      B5005ACE5A004AC64A0029A529000873080000000000C64A0000FFFFFF00FFB5
      6B00FFB56B00FFFFFF00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFCE9C00C64A000000000000000000000000000031AD
      31005AC65A00398C3100FFFFFF00FFFFFF0052B552005AC65A00188418000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C4A29007318
      080010105A00101063008C393100B54218005AA542006BD66B00FFF7E700FFF7
      E700639C4A004AAD4A00217321000000000000000000C64A0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFCE00FFE7
      B500FFD6A500FFCE9C00FFCE9C00C64A00000000000000000000000000000000
      0000085A3100216B9C001063AD0029739C004AAD4A0021842100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808000000
      000000187B0000187B0000085A004A394200318C31004AAD4A007B9CA5003173
      A5004A7B8C00186B2100000000000000000000000000C64A0000FFFFFF00FFB5
      6B00FFB56B00FFFFFF00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFCE9C00C64A00000000000000000000000000000000
      00000863B5001073E7001073E7001073E7001052390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000008000831
      8C000842AD000842AD000839AD00001873000000000000000000187BF700187B
      F700187BF700107BEF00000000000000000000000000C64A0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFCE00FFCE8C00FFD6A500C64A00000000000000000000000000001063
      9C002184FF002184FF002184FF002184FF001073E70021393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800001018000842
      AD001052C6001052C600104AC60000319C00000000003984C600218CFF00218C
      FF002184FF002184FF00295263000000000000000000C64A0000FFFFFF00FFB5
      6B00FFB56B00FFFFFF00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFE7B500C64A0000000000000000000000000000106B
      B500298CFF00298CFF00298CFF00298CFF002184F70018425200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018181800101010001042
      8C00187BF700187BF7001073F7001052C60000000000298CE70031A5FF0039A5
      FF0031A5FF00319CFF001073C6000000000000000000C64A0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFCE00C64A00000000000000000000528CB500298C
      F70031A5FF0039A5FF0039ADFF0039A5FF00319CFF00215A7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018181800313131000810
      29001052C6001063E700187BF7001052B50000000000318CE70039ADFF0042AD
      FF0039ADFF0039A5FF00187BD6000000000000000000C64A0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700C64A00000000000000000000397BAD00298C
      EF0042ADFF0042ADFF0039A5F70031A5EF0039A5F700215A7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242005252
      52008C8C8C006B6B6B001818180031313100000000003984B500217BB5003184
      C600187BC6001073C600005284000000000000000000C64A0000C64A0000C64A
      0000C64A0000C64A0000C64A0000C64A0000C64A0000C64A0000C64A0000C64A
      0000C64A0000C64A0000C64A0000C64A000000000000000000004A6B8400105A
      8C00317BB500529CCE004A9CF7003184E70010528C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000292929005A5A
      5A00737373006B6B6B0021212100000000000000000000000000428CCE0052A5
      D6009CCEEF005AA5CE00296B8C00000000000000000000000000C64A0000C64A
      0000C64A0000C64A0000C64A0000C64A0000C64A0000C64A0000C64A0000C64A
      0000C64A0000C64A0000C64A000000000000000000000000000000000000105A
      8C00529CCE0073ADE7005AADE700429CD6001852630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084B5D60073AD
      CE006BA5CE0073A5C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000528CAD00317BA50031739C004A6B84000000000000000000000000000000
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
    FieldDefs = <
      item
        Name = 'si'
        DataType = ftBoolean
      end
      item
        Name = 'no'
        DataType = ftBoolean
      end
      item
        Name = 'bancoldex'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 616
    Top = 64
    Data = {
      420000009619E0BD010000001800000003000000000003000000420002736902
      00030000000000026E6F02000300000000000962616E636F6C64657802000300
      000000000000}
    object CDsinosi: TBooleanField
      FieldName = 'si'
    end
    object CDsinono: TBooleanField
      FieldName = 'no'
    end
    object CDsinobancoldex: TBooleanField
      FieldName = 'bancoldex'
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
      end
      item
        Name = 'desc_estado'
        DataType = ftString
        Size = 20
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
      620100009619E0BD01000000180000000B0000000000030000006201066E756D
      65726F02000100000000000A636F6C6F636163696F6E01004900000001000557
      494454480200020014000576616C6F7208000400000001000753554254595045
      0200490006004D6F6E6579000B76616C6F725F63756F74610800040000000100
      07535542545950450200490006004D6F6E6579000573616C646F080004000000
      010007535542545950450200490006004D6F6E6579000A69645F706572736F6E
      610100490000000100055749445448020002000F001169645F6964656E746966
      69636163696F6E02000100000000000A646566696E6963696F6E010049000000
      01000557494454480200020032000665737461646F0100490000000100055749
      445448020002003200066E6F6D62726501004900000001000557494454480200
      020064000B646573635F65737461646F01004900000001000557494454480200
      020014000000}
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
    object CDcreditodeudordesc_estado: TStringField
      FieldName = 'desc_estado'
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
    Left = 166
    Top = 282
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
    Left = 192
    Top = 288
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
    Left = 24
    Top = 152
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
    Top = 152
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
    Left = 152
    Top = 152
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
    Left = 56
    Top = 152
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 152
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
    Left = 120
    Top = 152
    object VerInformacinGeneral1: TMenuItem
      Caption = 'Ver Informaci'#243'n General'
      OnClick = VerInformacinGeneral1Click
    end
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 344
    Top = 84
    ReportForm = {19000000}
  end
  object DsFianzas: TDataSource
    DataSet = CdFianzas
    Left = 440
    Top = 264
  end
  object CdFianzas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_colocacion'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'id_agencia'
        DataType = ftSmallint
      end
      item
        Name = 'dias'
        DataType = ftInteger
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'autoriza'
        DataType = ftBoolean
      end
      item
        Name = 'saldo_actual'
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
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 344
    Top = 304
    Data = {
      EA0000009619E0BD010000001800000008000000000003000000EA000D69645F
      636F6C6F636163696F6E0100490000000100055749445448020002000B000A69
      645F6167656E6369610200010000000000046469617304000100000000000665
      737461646F0100490000000100055749445448020002003200086175746F7269
      7A6102000300000000000C73616C646F5F61637475616C080004000000010007
      535542545950450200490006004D6F6E6579000A69645F706572736F6E610100
      490000000100055749445448020002000F001169645F6964656E746966696361
      63696F6E02000100000000000000}
    object CdFianzasid_colocacion: TStringField
      DisplayWidth = 14
      FieldName = 'id_colocacion'
      Size = 11
    end
    object CdFianzasid_agencia: TSmallintField
      DisplayWidth = 12
      FieldName = 'id_agencia'
    end
    object CdFianzasdias: TIntegerField
      DisplayWidth = 12
      FieldName = 'dias'
    end
    object CdFianzasestado: TStringField
      DisplayWidth = 60
      FieldName = 'estado'
      Size = 50
    end
    object CdFianzasautoriza: TBooleanField
      DisplayWidth = 8
      FieldName = 'autoriza'
    end
    object CdFianzassaldo_actual: TCurrencyField
      FieldName = 'saldo_actual'
    end
    object CdFianzasid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CdFianzasid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction3
    Left = 328
    Top = 8
  end
  object IBTransaction3: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 360
    Top = 40
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 456
    Top = 32
  end
  object IBSQL3: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'select NOMBRE from "gen$destinoban" where CODIGO = :CODIGO')
    Transaction = IBTransaction4
    Left = 360
    Top = 8
  end
  object IBSQL4: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'select NOMBRE from "gen$tipogarantiaban" where CODIGO = :CODIGO')
    Transaction = IBTransaction4
    Left = 384
    Top = 8
  end
  object IBTransaction4: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 456
    Top = 40
  end
  object IBSQL5: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      
        'select DESCRIPCION from "gen$tiposociedadban" where id_tipo = :t' +
        'ipo')
    Transaction = IBTransaction4
    Left = 408
    Top = 8
  end
end
