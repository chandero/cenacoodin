object frmControlCobroCartera: TfrmControlCobroCartera
  Left = 307
  Top = 36
  Width = 792
  Height = 566
  Caption = 'Control de Cobro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 105
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 782
      Height = 98
      Align = alTop
      Caption = 'Condiciones de Busqueda'
      TabOrder = 0
      object RGEstado: TRadioGroup
        Left = 6
        Top = 11
        Width = 350
        Height = 32
        Caption = 'Estado'
        Columns = 5
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Todos'
          'Vigentes'
          'Prejuridicos'
          'Juridicos'
          'Castigados')
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 6
        Top = 37
        Width = 278
        Height = 29
        Caption = 'Morosidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 61
          Top = 8
          Width = 33
          Height = 14
          Caption = 'Desde: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 153
          Top = 8
          Width = 32
          Height = 14
          Caption = 'Hasta :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 242
          Top = 8
          Width = 20
          Height = 14
          Caption = 'Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object EdDiasIni: TJvIntegerEdit
          Left = 96
          Top = 9
          Width = 51
          Height = 22
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 0
          Value = 0
          MaxValue = 0
          MinValue = 0
          HasMaxValue = False
          HasMinValue = False
        end
        object EdDiasFin: TJvIntegerEdit
          Left = 188
          Top = 8
          Width = 51
          Height = 22
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 1
          Value = 0
          MaxValue = 0
          MinValue = 0
          HasMaxValue = False
          HasMinValue = False
        end
      end
      object CmdProcesar: TBitBtn
        Left = 290
        Top = 43
        Width = 66
        Height = 25
        Caption = '&Procesar'
        TabOrder = 3
        OnClick = CmdProcesarClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000D30E0000D30E000000010000000100004A7BB500296B
          C600527BC600186BD600528CD6003194D600397BE7005284E700107BEF00317B
          EF001084EF0029ADEF0039ADEF0010B5EF0008BDEF000073F7001873F7002973
          F7000884F7000894F70018A5F70000CEF70018DEF70063DEF700FF00FF000073
          FF00007BFF000084FF00008CFF000094FF00009CFF0000A5FF0010A5FF0039A5
          FF0052A5FF005AA5FF0000ADFF0029ADFF0031ADFF0000B5FF006BB5FF0084B5
          FF0000BDFF0008BDFF0010BDFF0000C6FF0008C6FF006BC6FF0000CEFF0018CE
          FF0000D6FF0008D6FF0010D6FF0021D6FF0031D6FF0000DEFF0018DEFF0029DE
          FF0042DEFF0000E7FF0010E7FF0018E7FF0039E7FF0000EFFF0018EFFF0039EF
          FF004AEFFF0000F7FF0008F7FF0029F7FF0031F7FF0042F7FF004AF7FF005AF7
          FF0000FFFF0008FFFF0018FFFF0021FFFF0031FFFF0039FFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
          1818181818181818181818181802181818181818181818181818181818090201
          18181818181818181818181818061A0F02181818181818181818181818181E1C
          1C0218181818181818181818181818271C1D0202181818181818181818181818
          272E1E1E02181818181818181818181818272B241E0218181818181818180202
          022D4B462C240202181818181818252D3F43434A42311F02181818181818212D
          3F433F374A4A412E021818181818182E3E42474C4A4A4B4D0218181818181818
          1836444A43322702181818181818181818181836433F241F0218181818181818
          1818181818363A34230218181818181818181818181818362202}
      end
      object JvGroupBox1: TJvGroupBox
        Left = 359
        Top = 2
        Width = 417
        Height = 86
        Caption = 'Buscar Por:'
        TabOrder = 4
        object JvBlinkingLabel1: TJvBlinkingLabel
          Left = 118
          Top = 0
          Width = 238
          Height = 13
          Alignment = taCenter
          Caption = 'Para Buscar una Persona haga click aqu'#237
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          OnClick = JvBlinkingLabel1Click
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          BlinkingDelay = 1000
          BlinkingTime = 1000
        end
        object PageBuscar: TJvPageControl
          Left = 2
          Top = 15
          Width = 413
          Height = 69
          ActivePage = Tab1
          Align = alClient
          Style = tsFlatButtons
          TabIndex = 0
          TabOrder = 0
          object Tab1: TTabSheet
            Caption = 'Documento'
            object Label7: TLabel
              Left = 0
              Top = 21
              Width = 31
              Height = 14
              Caption = 'Tipo Id'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 166
              Top = 21
              Width = 37
              Height = 14
              Caption = 'N'#250'mero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object CBtiposid: TDBLookupComboBox
              Left = 35
              Top = 15
              Width = 131
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyField = 'ID_IDENTIFICACION'
              ListField = 'DESCRIPCION_IDENTIFICACION'
              ListSource = DSTiposId
              ParentFont = False
              TabOrder = 0
            end
            object EdNumeroIdentificacion: TMemo
              Left = 205
              Top = 15
              Width = 122
              Height = 22
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxLength = 15
              ParentFont = False
              TabOrder = 1
              WantReturns = False
              WordWrap = False
            end
            object CmdActualizar1: TBitBtn
              Left = 330
              Top = 15
              Width = 75
              Height = 23
              Caption = '&Actualizar'
              TabOrder = 2
              OnClick = CmdActualizar1Click
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
          object Tab2: TTabSheet
            Caption = 'Captaci'#243'n'
            ImageIndex = 1
            object Label9: TLabel
              Left = 148
              Top = 20
              Width = 37
              Height = 13
              Caption = 'N'#250'mero'
            end
            object Label10: TLabel
              Left = 6
              Top = 21
              Width = 21
              Height = 13
              Caption = 'Tipo'
            end
            object EdCaptacion: TJvEdit
              Left = 192
              Top = 15
              Width = 63
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
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxLength = 7
              ParentFont = False
              PasswordChar = #0
              ReadOnly = False
              TabOrder = 1
              OnExit = EdCaptacionExit
            end
            object CBTiposCaptacion: TDBLookupComboBox
              Left = 31
              Top = 15
              Width = 113
              Height = 21
              KeyField = 'ID_TIPO_CAPTACION'
              ListField = 'DESCRIPCION'
              ListSource = DSTiposCaptacion
              TabOrder = 0
            end
            object CmdActualizar2: TBitBtn
              Left = 265
              Top = 14
              Width = 75
              Height = 23
              Caption = '&Actualizar'
              TabOrder = 2
              OnClick = CmdActualizar2Click
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
          object Tab3: TTabSheet
            Caption = 'Colocaci'#243'n'
            ImageIndex = 2
            object Label18: TLabel
              Left = 6
              Top = 19
              Width = 149
              Height = 13
              Caption = 'N'#250'mero Colocaci'#243'n y/o Pagar'#233
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object EdColocacion: TJvEdit
              Left = 160
              Top = 15
              Width = 87
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
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxLength = 11
              ParentFont = False
              PasswordChar = #0
              ReadOnly = False
              TabOrder = 0
            end
            object CmdActualizar3: TBitBtn
              Left = 260
              Top = 15
              Width = 75
              Height = 23
              Caption = '&Actualizar'
              TabOrder = 1
              OnClick = CmdActualizar3Click
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
        end
        object EdNombre: TJvStaticText
          Left = 6
          Top = 37
          Width = 331
          Height = 18
          TextMargins.X = 0
          TextMargins.Y = 0
          AutoSize = False
          BevelKind = bkSoft
          BevelOuter = bvSpace
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
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
          TabOrder = 1
          WordWrap = False
        end
      end
      object RGTipoCuota: TRadioGroup
        Left = 6
        Top = 64
        Width = 273
        Height = 30
        Caption = 'Tipo de Cuota'
        Columns = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Todas'
          'Fija'
          'Variable')
        ParentFont = False
        TabOrder = 2
      end
      object chCarta: TCheckBox
        Left = 279
        Top = 72
        Width = 76
        Height = 17
        Alignment = taLeftJustify
        Caption = '&Gen. Cartas'
        TabOrder = 5
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 784
    Height = 174
    Align = alTop
    TabOrder = 1
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 780
      Height = 168
      Caption = 'Resultado de la Busqueda'
      TabOrder = 0
      object GridColocaciones: TXStringGrid
        Left = 2
        Top = 15
        Width = 776
        Height = 151
        Align = alClient
        ColCount = 13
        DefaultRowHeight = 18
        DefaultDrawing = False
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnDrawCell = GridColocacionesDrawCell
        OnSelectCell = GridColocacionesSelectCell
        FixedLineColor = clBlack
        Columns = <
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'COLOCACION'
            Width = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'ASOCIADO'
            Width = 250
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'SALDO'
            Width = 222
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Alignment = taRightJustify
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'CUOTA'
            Width = 120
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Alignment = taRightJustify
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'CAPITAL'
            Width = 72
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'INTERES'
            Width = 72
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'ESTADO'
            Width = 171
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'DIAS'
            Width = 36
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Alignment = taRightJustify
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'ID'
            Width = 17
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'IDENTIFICACION'
            Width = 100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            Caption = 'TIPO CUOTA'
            Width = 120
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'EN AHORROS'
            Width = 120
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Alignment = taRightJustify
            EditorInheritsCellProps = False
          end
          item
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = [fsBold]
            HeaderAlignment = taCenter
            Caption = 'EN APORTES'
            Width = 120
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Alignment = taRightJustify
            EditorInheritsCellProps = False
          end>
        MultiLine = False
        ImmediateEditMode = False
        ColWidths = (
          80
          250
          222
          120
          72
          72
          171
          36
          17
          100
          120
          120
          120)
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 312
    Width = 782
    Height = 37
    TabOrder = 2
    object BtnUtilidades: TJvArrowButton
      Left = 8
      Top = 8
      Width = 91
      Height = 22
      DropDown = PopupUtilidades
      Caption = 'Utilidades'
      FillFont.Charset = DEFAULT_CHARSET
      FillFont.Color = clBlack
      FillFont.Height = -11
      FillFont.Name = 'MS Sans Serif'
      FillFont.Style = []
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000320B0000320B00000001000000010000181818003939
        390042393900424242004A4A4A00524A4A00EFA54A00525252005A5A5A00AD6B
        5A006B6B6B00C6846B00B58473009C8C7300CE947300EFB57300FFC67300BD84
        7B00A5947B00C6947B0084848400B5848400B58C8400CE9C8400AD9C8C00C6B5
        9400EFCE940094949C009C9C9C00A5A59C00C6A59C00E7C69C00EFCE9C00A5A5
        A500C6ADA500C6BDA500D6BDA500EFD6A500F7D6A500ADADAD00CEB5AD00D6B5
        AD00EFC6AD00F7D6AD00FFD6AD00D6BDB500DEBDB500DEC6B500E7C6B500EFCE
        B500F7D6B500FFD6B500F7DEB500BDBDBD00EFCEBD00F7DEBD00C6C6C600F7DE
        C600F7E7C600E7CECE00F7E7CE00DEDED600FFDED600F7E7D600FFE7D600FFEF
        D600FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00F7FFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00474715151515
        1515151515151515210347471E413A37342B26201A1A1A27083847471E413C39
        37322620201A350A3814474722420909091C1C1C1C090A000A05474722433F3C
        350405040721010A354747472846091B0209090909020A3D1547474729491D02
        0C090909090C0238154747472D1D0A19402A2B2B1F3C0D02154747472D1D0A24
        0909090909091802154747472E1D0A230C0C090909091202154747472F491D0A
        2C4048463E330221154747473049491D0A2B0909250235161547474730490909
        1D0A0A0A0A1D0F060B47474736494949491D1D1D1D13100E4747474730454444
        444444443B1317474747474730313131313030312D1147474747}
    end
    object BtnExtractos: TJvArrowButton
      Left = 102
      Top = 8
      Width = 91
      Height = 22
      DropDown = PopupExtractos
      Caption = 'Extractos'
      FillFont.Charset = DEFAULT_CHARSET
      FillFont.Color = clBlack
      FillFont.Height = -11
      FillFont.Name = 'MS Sans Serif'
      FillFont.Style = []
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000630F0000630F000000010000000100002C6930003283
        3C00349F3F0041B258004EBF6C00346BAC00FF00FF00589DD70079A9D7004EA5
        ED00F7FFFF000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000060606060606
        060606060606060606060607050505050505050505050505050606070A0A0A0A
        0A0A0A0A0A0A0A0A050606070A000000000000000000000A050606090A000A08
        0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
        0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
        0A080A0A080A000A050606090A000000000000000000000A050606090A0A0A0A
        0A0A0A0A0A0A0A0A050606090A0A00000000000000000A0A050606090A0A0404
        0303020202010A0A050606090A0A0A0A0A0A0A0A0A0A0A0A0506060909090909
        0909090909070707070606060606060606060606060606060606}
    end
    object BtnMantenimientos: TJvArrowButton
      Left = 196
      Top = 8
      Width = 113
      Height = 22
      DropDown = PopupMantenimientos
      Caption = 'Mantenimientos'
      FillFont.Charset = DEFAULT_CHARSET
      FillFont.Color = clBlack
      FillFont.Height = -11
      FillFont.Name = 'MS Sans Serif'
      FillFont.Style = []
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000330F0000330F00000001000000010000D6731800A563
        2100D6732100D67B2100734A2900945A2900A55A2900DE732900DE8429008C52
        3100CE733100DE733100DE843100734A3900845239008C5A3900CE733900DE8C
        3900734A4200635242007B5A4200A5634200E79442007B5A4A00E7944A005A52
        52007B635200BD8C5200EF9C520063635A006B635A0084635A007B6B5A00A57B
        5A00EFA55A0063636300736B6300846B63007B7363008C7363009C846300CE9C
        6300EFA563004A636B005A6B6B006B6B6B007B736B00CE9C6B00DEA56B006B73
        730073737300A58C7300D6A573007B7B7B00847B7B00F7BD7B00527B84008484
        8400948C84008C7B8C008C8C8C00AD8C8C0094949400A59C9400949C9C009C9C
        9C00AD9C9C00A594A500A5A5A500ADA5A500ADADAD00B5ADAD00BDADAD00B5B5
        B500BDADBD00BDBDBD00C6C6C600CECECE00D6D6D600DEDEDE00F7F7F700FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151515151
        5131315151515151515151515151515131270104515151515151515151515151
        1E2800065151515151515151191919511E2800055151515151515139494B4944
        24330009515151515151513939394C4B242F000F19191919235151515151494C
        2429020D494646494319514123234C4B2630020D393939393951514144494439
        1D340B175151515151515151414139512E370A1F515151515151515151515151
        1321152551515151515151515151515119442D195151515151515151513C3C51
        194449195151515151515151384E233C193E4C4C515119315151515138492350
        2D3E46494C4B4131515151512349413C444F4D4B464031515151}
    end
    object BtnInformes: TJvArrowButton
      Left = 312
      Top = 8
      Width = 91
      Height = 22
      DropDown = PopupInformes
      Caption = 'Informes'
      FillFont.Charset = DEFAULT_CHARSET
      FillFont.Color = clBlack
      FillFont.Height = -11
      FillFont.Name = 'MS Sans Serif'
      FillFont.Style = []
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
    object CmdOtraBusqueda: TBitBtn
      Left = 667
      Top = 6
      Width = 110
      Height = 25
      Caption = 'Otra Busqueda'
      TabOrder = 0
      OnClick = CmdOtraBusquedaClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000420B0000420B00000001000000010000004A0000005A
        00000052080018520800005A0800006B080021521000295A1000186310000873
        1000295A1800315A180010631800186B1800185A210039632100108421004263
        29004A632900186B290010942900527331004A7B3100528C390018AD39007373
        4200218C4200529442006394420021B54200639C4A0018BD4A0029C65200639C
        5A0029CE5A0031E76B005A6B730042EF73004A637B00EFBD8400B58C8C00C694
        8C00BD9C8C00BD949400C6949400F7CE9400C6A59C00C6AD9C00CEAD9C00F7CE
        9C004A7BA500CEADA500D6B5A500DEBDA500F7D6A500DEC6AD00FFE7AD00CEB5
        B500F7DEB500FFE7B500D6BDBD00DED6BD00E7DEBD006B9CC600FFEFC600FFF7
        C600FFF7CE00F7EFD600FFFFD6002184DE001884E700188CE700218CEF00B5D6
        EF00FFF7EF00FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004B262B4B4B4B
        4B4B4B4B4B4B4B4B4B4B3F47322C4B4B4B4B4B4B4B4B4B4B4B4B4C4D48322C4B
        4B4B4B4B4B4B4B4B4B4B4B4D4D46322C4B4B4B4B4B4B4B4B4B4B4B4B4D4C4732
        2B4B4B4B4B4B4B4B4B4B4B4B4B4D4C452400000001004B4B4B4B4B4B4B4B4E49
        0E110B07090906334B4B4B4B4B4B4B3934404444081F0519284B4B4B4B000029
        3A364244211818153D4B4B4B000D040F382D00000520220900004B4B021D1D0C
        1727171A142523100F2F4B00102325141A172D1B0C1D1D13432E000009222005
        0000363117040D163E4B4B4B0018180A374F4A2D271C1E412A4B4B4B00051F00
        4B3C4340383B3A304B4B4B4B4B0009090003120F35354B4B4B4B}
    end
    object GroupBox6: TGroupBox
      Left = 456
      Top = -1
      Width = 185
      Height = 37
      Caption = 'Compromisos'
      TabOrder = 1
      object CmdCompromisos: TBitBtn
        Left = 99
        Top = 9
        Width = 80
        Height = 25
        Caption = 'Del D'#237'a'
        TabOrder = 1
        OnClick = CmdCompromisosClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000230B0000230B00000001000000010000EF9C2100F7A5
          5A00636B6B00FFB56B008C8C8C009C9C9400A5A5A500ADADAD00B5B5B500527B
          C600DEDEDE00EFEFEF00F7F7F700FF00FF0039A5FF0000F7FF0094FFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000D0D0D0D0D0D
          0D0D0D0D0D0D0D0D0D0D0D02020202020202020202020202020D0D0411111111
          1111111111111111040D0D04110303030303030303030311040D0D0411031111
          0909110311110311040D0D05110311110F09090311110311050D0D0511030303
          0E0F090909030311050D0D0511011111010E100F09090111050D0D060C011109
          090909100F09090C060D0D060C00000E100F0F0F0F0F0909060D0D070B001111
          0E100F090911000B070D0D070B001111000E100F0909000B070D0D080A000000
          000E100F0F09090A080D0D080A0A0A0A0A0A0E100F0F0909080D0D0808080808
          0808080E100F0F09090D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D}
      end
      object EdFechaCompromiso: TDateTimePicker
        Left = 8
        Top = 13
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 37693.4262030903
        Format = 'yyyy/MM/dd'
        Time = 37693.4262030903
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 0
        OnExit = EdFechaCompromisoExit
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 350
    Width = 782
    Height = 182
    TabOrder = 3
    object GroupBox4: TGroupBox
      Left = 1
      Top = 4
      Width = 780
      Height = 174
      Caption = 'Observaciones y Compromisos'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 776
        Height = 157
        Align = alClient
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'FECHA_OBSERVACION'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'FECHA'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACION'
            ReadOnly = True
            Title.Alignment = taCenter
            Width = 600
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_COMPROMISO'
            Title.Alignment = taCenter
            Title.Caption = 'COMPROMISO'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPLETO'
            Title.Alignment = taCenter
            Title.Caption = 'REPORTO'
            Width = 150
            Visible = True
          end>
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 148
      Width = 780
      Height = 33
      Align = alBottom
      TabOrder = 1
      object CmdAgregar: TBitBtn
        Left = 4
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Agregar'
        Enabled = False
        TabOrder = 0
        OnClick = CmdAgregarClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000E30E0000E30E0000000100000001000031319C003131
          A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
          E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
          FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
          FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
          1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
          0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
          0E1B180E0E0E0B08031B1B0A0E0E0E0E0E1B180E0E0E0E09041B1B0E0E0E0E0E
          0E1B180E0E0E0E0A051B1B0E0E181818181B181818180B0A061B1B0E0E1B1B1B
          1B1B1B1B1B1B0A0A061B1B0E10100E0E0E1B180E0E0B0A0A061B1B0E1313100E
          0E1B180E0E0B0A0A061B1B1015141110101B180E0E0E0B0B061B1B1318151312
          111B180E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
          0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
      end
      object CmdEliminar: TBitBtn
        Left = 172
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Eliminar'
        Enabled = False
        TabOrder = 1
        Visible = False
        OnClick = CmdEliminarClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000E30E0000E30E0000000100000001000031319C003131
          A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
          E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
          FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
          FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
          1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
          0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
          0E0E0E0E0E0E0B08031B1B0A0E0E0E0E0E0E0E0E0E0E0E09041B1B0E0E0E0E0E
          0E0E0E0E0E0E0E0A051B1B0E0E1818181818181818180B0A061B1B0E0E1B1B1B
          1B1B1B1B1B1B0A0A061B1B0E10100E0E0E0E0E0E0E0B0A0A061B1B0E1313100E
          0E0E0E0E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
          11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
          0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
      end
      object CmdImprimir: TBitBtn
        Left = 84
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Imprimir'
        Enabled = False
        TabOrder = 2
        OnClick = CmdImprimirClick
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
  end
  object Panel6: TPanel
    Left = 0
    Top = 279
    Width = 784
    Height = 33
    Align = alTop
    TabOrder = 4
    object Label5: TLabel
      Left = 6
      Top = 10
      Width = 97
      Height = 13
      Caption = 'Total Colocaciones :'
    end
    object Label6: TLabel
      Left = 183
      Top = 10
      Width = 62
      Height = 13
      Caption = 'Total Deuda:'
    end
    object Label3: TLabel
      Left = 435
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Hora Inicio:'
    end
    object Label11: TLabel
      Left = 565
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Hora Fin:'
    end
    object lIni: TLabel
      Left = 488
      Top = 8
      Width = 3
      Height = 13
    end
    object lFin: TLabel
      Left = 608
      Top = 8
      Width = 3
      Height = 13
    end
    object EdTotalColocaciones: TStaticText
      Left = 108
      Top = 7
      Width = 53
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      BevelOuter = bvRaised
      BorderStyle = sbsSunken
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object EdTotalDeuda: TStaticText
      Left = 248
      Top = 7
      Width = 135
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      BevelOuter = bvRaised
      BorderStyle = sbsSunken
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object CmdCerrar: TBitBtn
    Left = 706
    Top = 13
    Width = 66
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 5
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
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 510
    Top = 374
  end
  object IBSQL1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTControlCobro
    Left = 670
    Top = 422
  end
  object IBDataSet1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTControlCobro
    SQL.Strings = (
      
        'select "col$controlcobro".ID_AGENCIA,"col$controlcobro".ID_COLOC' +
        'ACION,"col$controlcobro".FECHA_OBSERVACION,"col$controlcobro". O' +
        'BSERVACION, "col$controlcobro".ES_OBSERVACION,"col$controlcobro"' +
        '.ES_COMPROMISO, "col$controlcobro".FECHA_COMPROMISO, "gen$emplea' +
        'do".PRIMER_APELLIDO,"gen$empleado".NOMBRE from "col$controlcobro' +
        '" '
      
        'INNER JOIN "gen$empleado" ON ("col$controlcobro".ID_USUARIO = "g' +
        'en$empleado".ID_EMPLEADO)'
      
        'where "col$controlcobro".ID_AGENCIA = :ID_AGENCIA and "col$contr' +
        'olcobro".ID_COLOCACION = :ID_COLOCACION ')
    Left = 562
    Top = 352
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
    object IBDataSet1ID_AGENCIA: TSmallintField
      FieldName = 'ID_AGENCIA'
      Origin = 'col$controlcobro.ID_AGENCIA'
      Required = True
    end
    object IBDataSet1ID_COLOCACION: TIBStringField
      FieldName = 'ID_COLOCACION'
      Origin = 'col$controlcobro.ID_COLOCACION'
      Required = True
      FixedChar = True
      Size = 11
    end
    object IBDataSet1FECHA_OBSERVACION: TDateField
      FieldName = 'FECHA_OBSERVACION'
      Origin = 'col$controlcobro.FECHA_OBSERVACION'
    end
    object IBDataSet1OBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'col$controlcobro.OBSERVACION'
      OnGetText = IBDataSet1OBSERVACIONGetText
      BlobType = ftMemo
      Size = 8
    end
    object IBDataSet1ES_OBSERVACION: TSmallintField
      FieldName = 'ES_OBSERVACION'
      Origin = 'col$controlcobro.ES_OBSERVACION'
    end
    object IBDataSet1ES_COMPROMISO: TSmallintField
      FieldName = 'ES_COMPROMISO'
      Origin = 'col$controlcobro.ES_COMPROMISO'
    end
    object IBDataSet1FECHA_COMPROMISO: TDateField
      FieldName = 'FECHA_COMPROMISO'
      Origin = 'col$controlcobro.FECHA_COMPROMISO'
      OnGetText = IBDataSet1FECHA_COMPROMISOGetText
      DisplayFormat = 'yyyy/MM/dd'
    end
    object IBDataSet1PRIMER_APELLIDO: TIBStringField
      FieldName = 'PRIMER_APELLIDO'
      Origin = 'gen$empleado.PRIMER_APELLIDO'
      Size = 30
    end
    object IBDataSet1NOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'gen$empleado.NOMBRE'
      Size = 30
    end
    object IBDataSet1COMPLETO: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPLETO'
      OnGetText = IBDataSet1COMPLETOGetText
      Calculated = True
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTControlCobro
    SQL.Strings = (
      'select * from "gen$agencia"')
    Left = 644
    Top = 352
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = IBQuery1
    Left = 610
    Top = 422
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTControlCobro
    Left = 698
    Top = 350
  end
  object ReporteMora: TprTxReport
    ShowProgress = True
    FromPage = 1
    ToPage = 1
    Title = 'Informe Diario de Cartera'
    ExportFromPage = 0
    ExportToPage = 0
    Values = <
      item
        Name = 'TNoDesembolsos'
        AggFunction = prafCount
        Formula = 'IBTabla.ID_COLOCACION'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBTabla'
      end
      item
        Name = 'TotalDesembolsos'
        AggFunction = prafSum
        Formula = 'IBTabla.VALOR_DESEMBOLSO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBTabla'
        Accumulate = True
      end
      item
        Name = 'TotalCartera'
        AggFunction = prafSum
        Formula = 'IBTabla.SALDO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBTabla'
      end>
    Variables = <
      item
        Name = 'Empresa'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Empleado'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Nit'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'MoraI'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Agencia'
        ValueType = 'prvvtString'
        Value = ''
      end>
    PrinterName = 'EPSON FX-1180+ ESC/P'
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 110
    Top = 424
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 3'
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
      ColNum = 236
      object prTxHPageHeaderBand1: TprTxHPageHeaderBand
        Height = 4
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
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 17
          dRec.Bottom = 1
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
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha de Impresion :[:<yyyy/mm/dd>StartDateTime]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = True
              CanResizeY = True
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 196
          dRec.Top = 2
          dRec.Right = 231
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INFORME GENERAL COLOCACIONES CON MORA A PARTIR DE [MoraI] DIAS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 61
          dRec.Top = 0
          dRec.Right = 126
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Elaboro :  [empleado]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 3
          dRec.Right = 45
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AGENCIA : [Agencia]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 23
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Nit. [Nit]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 28
          dRec.Top = 0
          dRec.Right = 48
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Pagina [Page] de [PagesCount]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 180
          dRec.Top = 0
          dRec.Right = 208
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------------------------')
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
          dRec.Right = 232
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 3
        UseVerticalBands = False
        DetailBand = ReporteMora.prTxHDetailBand1
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = True
        LinkToDetail = True
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------------------------')
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
          dRec.Right = 232
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------------------------')
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
          dRec.Right = 232
          dRec.Bottom = 3
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
          dRec.Left = 122
          dRec.Top = 1
          dRec.Right = 123
          dRec.Bottom = 2
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
          dRec.Left = 170
          dRec.Top = 1
          dRec.Right = 171
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
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
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 14
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
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
          dRec.Left = 38
          dRec.Top = 1
          dRec.Right = 39
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj51: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NIT/CC')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 1
          dRec.Right = 54
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj53: TprTxMemoObj
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
          dRec.Left = 54
          dRec.Top = 1
          dRec.Right = 55
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj54: TprTxMemoObj
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
          dRec.Left = 55
          dRec.Top = 1
          dRec.Right = 98
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj55: TprTxMemoObj
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
          dRec.Left = 98
          dRec.Top = 1
          dRec.Right = 99
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj56: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 99
          dRec.Top = 1
          dRec.Right = 122
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR CUOTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 147
          dRec.Top = 1
          dRec.Right = 170
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
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
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 123
          dRec.Top = 1
          dRec.Right = 146
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA VENC.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 171
          dRec.Top = 1
          dRec.Right = 182
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
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
          dRec.Left = 221
          dRec.Top = 1
          dRec.Right = 222
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DIAS MORA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 222
          dRec.Top = 1
          dRec.Right = 232
          dRec.Bottom = 2
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
          dRec.Left = 25
          dRec.Top = 1
          dRec.Right = 26
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA APERT.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 26
          dRec.Top = 1
          dRec.Right = 38
          dRec.Bottom = 2
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
          dRec.Left = 14
          dRec.Top = 1
          dRec.Right = 15
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj49: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No. CUENTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = True
              CanResizeY = True
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 15
          dRec.Top = 1
          dRec.Right = 25
          dRec.Bottom = 2
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
          dRec.Left = 146
          dRec.Top = 1
          dRec.Right = 147
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
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
          dRec.Left = 182
          dRec.Top = 1
          dRec.Right = 183
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CLASIFICACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 183
          dRec.Top = 1
          dRec.Right = 196
          dRec.Bottom = 2
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
          dRec.Left = 196
          dRec.Top = 1
          dRec.Right = 197
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj37: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'EVALUACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 197
          dRec.Top = 1
          dRec.Right = 207
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj47: TprTxMemoObj
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
          dRec.Left = 207
          dRec.Top = 1
          dRec.Right = 208
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj58: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'ESTADO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 208
          dRec.Top = 1
          dRec.Right = 221
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBTabla'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand1'
          'prTxHDetailFooterBand1')
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
          dRec.Left = 38
          dRec.Top = 0
          dRec.Right = 39
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj60: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBTabla.PRIMER_APELLIDO] [IBTabla.SEGUNDO_APELLIDO] [IBTabla.NO' +
                  'MBRE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 55
          dRec.Top = 0
          dRec.Right = 98
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
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
          dRec.Left = 98
          dRec.Top = 0
          dRec.Right = 99
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj40: TprTxMemoObj
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
          dRec.Left = 170
          dRec.Top = 0
          dRec.Right = 171
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj43: TprTxMemoObj
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
          dRec.Left = 221
          dRec.Top = 0
          dRec.Right = 222
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj64: TprTxMemoObj
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
          dRec.Left = 54
          dRec.Top = 0
          dRec.Right = 55
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj39: TprTxMemoObj
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
          dRec.Left = 122
          dRec.Top = 0
          dRec.Right = 123
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
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
          dRec.Left = 25
          dRec.Top = 0
          dRec.Right = 26
          dRec.Bottom = 1
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
          dRec.Left = 14
          dRec.Top = 0
          dRec.Right = 15
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.ID_COLOCACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 14
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 15
          dRec.Top = 0
          dRec.Right = 25
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBTabla.FECHA_DESEMBOLSO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 26
          dRec.Top = 0
          dRec.Right = 38
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.ID_PERSONA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 0
          dRec.Right = 54
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>IBTabla.VALOR_DESEMBOLSO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 99
          dRec.Top = 0
          dRec.Right = 122
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj52: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>IBTabla.SALDO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 123
          dRec.Top = 0
          dRec.Right = 146
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj66: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBTabla.FECHA_VENCIMIENTO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 171
          dRec.Top = 0
          dRec.Right = 182
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj68: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.MORA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 222
          dRec.Top = 0
          dRec.Right = 232
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj41: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>IBTabla.VALOR_CUOTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 147
          dRec.Top = 0
          dRec.Right = 170
          dRec.Bottom = 1
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
          dRec.Left = 146
          dRec.Top = 0
          dRec.Right = 147
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj42: TprTxMemoObj
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
          dRec.Left = 182
          dRec.Top = 0
          dRec.Right = 183
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj44: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.ID_CLASIFICACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 183
          dRec.Top = 0
          dRec.Right = 196
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj45: TprTxMemoObj
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
          dRec.Left = 196
          dRec.Top = 0
          dRec.Right = 197
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj46: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.ID_EVALUACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 197
          dRec.Top = 0
          dRec.Right = 207
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj59: TprTxMemoObj
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
          dRec.Left = 207
          dRec.Top = 0
          dRec.Right = 208
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj61: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.DESCRIPCION_ESTADO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 208
          dRec.Top = 0
          dRec.Right = 221
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand1: TprTxHDetailFooterBand
        Height = 2
        UseVerticalBands = False
        DetailBand = ReporteMora.prTxHDetailBand1
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------------------------')
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
          dRec.Right = 232
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Valor Total Colocaciones : [:<#,##0.00>TotalDesembolsos] ')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 71
          dRec.Top = 1
          dRec.Right = 126
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No. Colocaciones : [TNoDesembolsos]')
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
          dRec.Right = 28
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj35: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Valor Total Cartera : [:<#,##0.00>TotalCartera] ')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 151
          dRec.Top = 1
          dRec.Right = 206
          dRec.Bottom = 2
          Visible = False
        end
      end
    end
  end
  object IBTabla: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'ID_COLOCACION'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'DESCRIPCION_ESTADO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CUENTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ID_IDENTIFICACION'
        DataType = ftInteger
      end
      item
        Name = 'ID_PERSONA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PRIMER_APELLIDO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SEGUNDO_APELLIDO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VALOR_DESEMBOLSO'
        DataType = ftCurrency
      end
      item
        Name = 'SALDO'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_CUOTA'
        DataType = ftCurrency
      end
      item
        Name = 'FECHA_DESEMBOLSO'
        DataType = ftDate
      end
      item
        Name = 'FECHA_VENCIMIENTO'
        DataType = ftDate
      end
      item
        Name = 'ID_CLASIFICACION'
        DataType = ftSmallint
      end
      item
        Name = 'ID_EVALUACION'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MORA'
        DataType = ftInteger
      end
      item
        Name = 'APORTES'
        DataType = ftCurrency
      end
      item
        Name = 'AHORROS'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 256
    Top = 96
    Data = {
      680200009619E0BD01000000180000001300000000000300000068020A49445F
      4147454E43494104000100000000000D49445F434F4C4F434143494F4E010049
      0000000100055749445448020002000B00124445534352495043494F4E5F4553
      5441444F0100490000000100055749445448020002006400064355454E544101
      00490000000100055749445448020002000A001149445F4944454E5449464943
      4143494F4E04000100000000000A49445F504552534F4E410100490000000100
      055749445448020002000F00064E4F4D42524502004900000001000557494454
      4802000200FF000F5052494D45525F4150454C4C49444F010049000000010005
      5749445448020002001E0010534547554E444F5F4150454C4C49444F01004900
      00000100055749445448020002001E001056414C4F525F444553454D424F4C53
      4F080004000000010007535542545950450200490006004D6F6E657900055341
      4C444F080004000000010007535542545950450200490006004D6F6E6579000B
      56414C4F525F43554F5441080004000000010007535542545950450200490006
      004D6F6E6579001046454348415F444553454D424F4C534F0400060000000000
      1146454348415F56454E43494D49454E544F04000600000000001049445F434C
      4153494649434143494F4E02000100000000000D49445F4556414C554143494F
      4E0100490000000100055749445448020002000100044D4F5241040001000000
      00000741504F5254455308000400000001000753554254595045020049000600
      4D6F6E6579000741484F52524F53080004000000010007535542545950450200
      490006004D6F6E6579000000}
    object IBTablaID_AGENCIA: TIntegerField
      FieldName = 'ID_AGENCIA'
    end
    object IBTablaID_COLOCACION: TStringField
      FieldName = 'ID_COLOCACION'
      Size = 11
    end
    object IBTablaDESCRIPCION_ESTADO: TStringField
      FieldName = 'DESCRIPCION_ESTADO'
      Size = 100
    end
    object IBTablaCUENTA: TStringField
      FieldName = 'CUENTA'
      Size = 10
    end
    object IBTablaID_IDENTIFICACION: TIntegerField
      FieldName = 'ID_IDENTIFICACION'
    end
    object IBTablaID_PERSONA: TStringField
      FieldName = 'ID_PERSONA'
      Size = 15
    end
    object IBTablaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 255
    end
    object IBTablaPRIMER_APELLIDO: TStringField
      FieldName = 'PRIMER_APELLIDO'
      Size = 30
    end
    object IBTablaSEGUNDO_APELLIDO: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Size = 30
    end
    object IBTablaVALOR_DESEMBOLSO: TCurrencyField
      FieldName = 'VALOR_DESEMBOLSO'
    end
    object IBTablaSALDO: TCurrencyField
      FieldName = 'SALDO'
    end
    object IBTablaVALOR_CUOTA: TCurrencyField
      FieldName = 'VALOR_CUOTA'
    end
    object IBTablaFECHA_DESEMBOLSO: TDateField
      FieldName = 'FECHA_DESEMBOLSO'
    end
    object IBTablaFECHA_VENCIMIENTO: TDateField
      FieldName = 'FECHA_VENCIMIENTO'
    end
    object IBTablaID_CLASIFICACION: TSmallintField
      FieldName = 'ID_CLASIFICACION'
    end
    object IBTablaID_EVALUACION: TStringField
      FieldName = 'ID_EVALUACION'
      Size = 1
    end
    object IBTablaMORA: TIntegerField
      FieldName = 'MORA'
    end
    object IBTablaAPORTES: TCurrencyField
      FieldName = 'APORTES'
    end
    object IBTablaAHORROS: TCurrencyField
      FieldName = 'AHORROS'
    end
  end
  object IBTabla1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'ID_COLOCACION'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'DESCRIPCION_ESTADO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CUENTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ID_IDENTIFICACION'
        DataType = ftInteger
      end
      item
        Name = 'ID_PERSONA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PRIMER_APELLIDO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SEGUNDO_APELLIDO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VALOR_DESEMBOLSO'
        DataType = ftCurrency
      end
      item
        Name = 'SALDO'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_CUOTA'
        DataType = ftCurrency
      end
      item
        Name = 'FECHA_DESEMBOLSO'
        DataType = ftDate
      end
      item
        Name = 'FECHA_VENCIMIENTO'
        DataType = ftDate
      end
      item
        Name = 'ID_CLASIFICACION'
        DataType = ftSmallint
      end
      item
        Name = 'ID_EVALUACION'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MORA'
        DataType = ftInteger
      end
      item
        Name = 'APORTES'
        DataType = ftCurrency
      end
      item
        Name = 'AHORROS'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 224
    Top = 96
    Data = {
      680200009619E0BD01000000180000001300000000000300000068020A49445F
      4147454E43494104000100000000000D49445F434F4C4F434143494F4E010049
      0000000100055749445448020002000B00124445534352495043494F4E5F4553
      5441444F0100490000000100055749445448020002006400064355454E544101
      00490000000100055749445448020002000A001149445F4944454E5449464943
      4143494F4E04000100000000000A49445F504552534F4E410100490000000100
      055749445448020002000F00064E4F4D42524502004900000001000557494454
      4802000200FF000F5052494D45525F4150454C4C49444F010049000000010005
      5749445448020002001E0010534547554E444F5F4150454C4C49444F01004900
      00000100055749445448020002001E001056414C4F525F444553454D424F4C53
      4F080004000000010007535542545950450200490006004D6F6E657900055341
      4C444F080004000000010007535542545950450200490006004D6F6E6579000B
      56414C4F525F43554F5441080004000000010007535542545950450200490006
      004D6F6E6579001046454348415F444553454D424F4C534F0400060000000000
      1146454348415F56454E43494D49454E544F04000600000000001049445F434C
      4153494649434143494F4E02000100000000000D49445F4556414C554143494F
      4E0100490000000100055749445448020002000100044D4F5241040001000000
      00000741504F5254455308000400000001000753554254595045020049000600
      4D6F6E6579000741484F52524F53080004000000010007535542545950450200
      490006004D6F6E6579000000}
    object IntegerField1: TIntegerField
      FieldName = 'ID_AGENCIA'
    end
    object StringField1: TStringField
      FieldName = 'ID_COLOCACION'
      Size = 11
    end
    object StringField2: TStringField
      FieldName = 'DESCRIPCION_ESTADO'
      Size = 100
    end
    object StringField3: TStringField
      FieldName = 'CUENTA'
      Size = 10
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_IDENTIFICACION'
    end
    object StringField4: TStringField
      FieldName = 'ID_PERSONA'
      Size = 15
    end
    object StringField5: TStringField
      FieldName = 'NOMBRE'
      Size = 255
    end
    object StringField6: TStringField
      FieldName = 'PRIMER_APELLIDO'
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Size = 30
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'VALOR_DESEMBOLSO'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'SALDO'
    end
    object CurrencyField3: TCurrencyField
      FieldName = 'VALOR_CUOTA'
    end
    object DateField1: TDateField
      FieldName = 'FECHA_DESEMBOLSO'
    end
    object DateField2: TDateField
      FieldName = 'FECHA_VENCIMIENTO'
    end
    object SmallintField1: TSmallintField
      FieldName = 'ID_CLASIFICACION'
    end
    object StringField8: TStringField
      FieldName = 'ID_EVALUACION'
      Size = 1
    end
    object IntegerField3: TIntegerField
      FieldName = 'MORA'
    end
    object IBTabla1APORTES: TCurrencyField
      FieldName = 'APORTES'
    end
    object IBTabla1AHORROS: TCurrencyField
      FieldName = 'AHORROS'
    end
  end
  object ReporteAportes: TprTxReport
    ShowProgress = True
    FromPage = 1
    ToPage = 1
    Title = 'Informe Diario de Cartera'
    ExportFromPage = 0
    ExportToPage = 0
    Values = <
      item
        Name = 'TNoDesembolsos'
        AggFunction = prafCount
        Formula = 'IBTabla.ID_COLOCACION'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBTabla'
      end
      item
        Name = 'TotalDesembolsos'
        AggFunction = prafSum
        Formula = 'IBTabla.VALOR_DESEMBOLSO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBTabla'
        Accumulate = True
      end
      item
        Name = 'TotalCartera'
        AggFunction = prafSum
        Formula = 'IBTabla.SALDO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBTabla'
      end>
    Variables = <
      item
        Name = 'Empresa'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Empleado'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Nit'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'MoraI'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'Agencia'
        ValueType = 'prvvtString'
        Value = ''
      end>
    PrinterName = 'EPSON FX-1180+ ESC/P'
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 110
    Top = 424
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 3'
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
      ColNum = 236
      object prTxHPageHeaderBand1: TprTxHPageHeaderBand
        Height = 4
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
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 17
          dRec.Bottom = 1
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
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha de Impresion :[:<yyyy/mm/dd>StartDateTime]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = True
              CanResizeY = True
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 196
          dRec.Top = 2
          dRec.Right = 231
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INFORME GENERAL COLOCACIONES CON MORA A PARTIR DE [MoraI] DIAS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 61
          dRec.Top = 0
          dRec.Right = 126
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Elaboro :  [empleado]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 3
          dRec.Right = 45
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AGENCIA : [Agencia]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 23
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Nit. [Nit]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 28
          dRec.Top = 0
          dRec.Right = 48
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Pagina [Page] de [PagesCount]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 180
          dRec.Top = 0
          dRec.Right = 208
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------------------------')
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
          dRec.Right = 232
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 3
        UseVerticalBands = False
        DetailBand = ReporteAportes.prTxHDetailBand1
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = True
        LinkToDetail = True
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------------------------')
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
          dRec.Right = 232
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------------------------')
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
          dRec.Right = 232
          dRec.Bottom = 3
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
          dRec.Left = 122
          dRec.Top = 1
          dRec.Right = 123
          dRec.Bottom = 2
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
          dRec.Left = 170
          dRec.Top = 1
          dRec.Right = 171
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
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
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 14
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
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
          dRec.Left = 38
          dRec.Top = 1
          dRec.Right = 39
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj51: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NIT/CC')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 1
          dRec.Right = 54
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj53: TprTxMemoObj
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
          dRec.Left = 54
          dRec.Top = 1
          dRec.Right = 55
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj54: TprTxMemoObj
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
          dRec.Left = 55
          dRec.Top = 1
          dRec.Right = 98
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj55: TprTxMemoObj
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
          dRec.Left = 98
          dRec.Top = 1
          dRec.Right = 99
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj56: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 99
          dRec.Top = 1
          dRec.Right = 122
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR CUOTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 147
          dRec.Top = 1
          dRec.Right = 170
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
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
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 123
          dRec.Top = 1
          dRec.Right = 146
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA VENC.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 171
          dRec.Top = 1
          dRec.Right = 182
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
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
          dRec.Left = 221
          dRec.Top = 1
          dRec.Right = 222
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DIAS MORA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 222
          dRec.Top = 1
          dRec.Right = 232
          dRec.Bottom = 2
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
          dRec.Left = 25
          dRec.Top = 1
          dRec.Right = 26
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA APERT.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 26
          dRec.Top = 1
          dRec.Right = 38
          dRec.Bottom = 2
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
          dRec.Left = 14
          dRec.Top = 1
          dRec.Right = 15
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj49: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No. CUENTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = True
              CanResizeY = True
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 15
          dRec.Top = 1
          dRec.Right = 25
          dRec.Bottom = 2
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
          dRec.Left = 146
          dRec.Top = 1
          dRec.Right = 147
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
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
          dRec.Left = 182
          dRec.Top = 1
          dRec.Right = 183
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj47: TprTxMemoObj
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
          dRec.Left = 207
          dRec.Top = 1
          dRec.Right = 208
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj58: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'ESTADO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 208
          dRec.Top = 1
          dRec.Right = 221
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SALDO APORTES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 183
          dRec.Top = 1
          dRec.Right = 207
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBTabla'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Valid = 'IBTabla.SALDO <= IBTabla.APORTES'
        Bands = (
          'prTxHDetailHeaderBand1'
          'prTxHDetailFooterBand1')
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
          dRec.Left = 38
          dRec.Top = 0
          dRec.Right = 39
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj60: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBTabla.PRIMER_APELLIDO] [IBTabla.SEGUNDO_APELLIDO] [IBTabla.NO' +
                  'MBRE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 55
          dRec.Top = 0
          dRec.Right = 98
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
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
          dRec.Left = 98
          dRec.Top = 0
          dRec.Right = 99
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj40: TprTxMemoObj
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
          dRec.Left = 170
          dRec.Top = 0
          dRec.Right = 171
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj43: TprTxMemoObj
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
          dRec.Left = 221
          dRec.Top = 0
          dRec.Right = 222
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj64: TprTxMemoObj
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
          dRec.Left = 54
          dRec.Top = 0
          dRec.Right = 55
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj39: TprTxMemoObj
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
          dRec.Left = 122
          dRec.Top = 0
          dRec.Right = 123
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
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
          dRec.Left = 25
          dRec.Top = 0
          dRec.Right = 26
          dRec.Bottom = 1
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
          dRec.Left = 14
          dRec.Top = 0
          dRec.Right = 15
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.ID_COLOCACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 14
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 15
          dRec.Top = 0
          dRec.Right = 25
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBTabla.FECHA_DESEMBOLSO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 26
          dRec.Top = 0
          dRec.Right = 38
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.ID_PERSONA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 0
          dRec.Right = 54
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>IBTabla.VALOR_DESEMBOLSO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 99
          dRec.Top = 0
          dRec.Right = 122
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj52: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>IBTabla.SALDO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 123
          dRec.Top = 0
          dRec.Right = 146
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj66: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBTabla.FECHA_VENCIMIENTO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 171
          dRec.Top = 0
          dRec.Right = 182
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj68: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.MORA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 222
          dRec.Top = 0
          dRec.Right = 232
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj41: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>IBTabla.VALOR_CUOTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 147
          dRec.Top = 0
          dRec.Right = 170
          dRec.Bottom = 1
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
          dRec.Left = 146
          dRec.Top = 0
          dRec.Right = 147
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj42: TprTxMemoObj
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
          dRec.Left = 182
          dRec.Top = 0
          dRec.Right = 183
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj59: TprTxMemoObj
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
          dRec.Left = 207
          dRec.Top = 0
          dRec.Right = 208
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj61: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBTabla.DESCRIPCION_ESTADO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 208
          dRec.Top = 0
          dRec.Right = 221
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj36: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>IBTabla.APORTES]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 183
          dRec.Top = 0
          dRec.Right = 207
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand1: TprTxHDetailFooterBand
        Height = 2
        UseVerticalBands = False
        DetailBand = ReporteAportes.prTxHDetailBand1
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Valor Total Colocaciones : [:<#,##0.00>TotalDesembolsos] ')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 71
          dRec.Top = 1
          dRec.Right = 126
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No. Colocaciones : [TNoDesembolsos]')
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
          dRec.Right = 28
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj35: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Valor Total Cartera : [:<#,##0.00>TotalCartera] ')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 151
          dRec.Top = 1
          dRec.Right = 206
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---------------------------------------')
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
          dRec.Right = 232
          dRec.Bottom = 1
          Visible = False
        end
      end
    end
  end
  object ImageList: TImageList
    Left = 96
    Top = 312
    Bitmap = {
      494C010113001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
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
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400A5A5A500424242000000000000000000000000000000
      00000000000000000000000000006B7373006B73730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400ADADAD005A5A5A00C6C6C6000000000000000000000000000000
      000000000000000000006B7373008C736300A5632100734A2900000000000000
      000000000000000000000000000000000000000000005A9CD600316BAD00316B
      AD00316BAD00316BAD00316BAD00316BAD00316BAD00316BAD00316BAD00316B
      AD00316BAD00316BAD00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400BDBDBD006B6B6B00C6C6C600848484000000000000000000000000000000
      000000000000000000006B635A009C846300D6731800A55A2900000000000000
      000000000000000000000000000000000000000000005A9CD600F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFEF
      E700AD6B5A00AD6B5A00AD6B5A009C9C9C009C9C9C009C9C9C009C9C9C00AD6B
      5A006B6B6B00181818006B6B6B00524A4A0000000000000000005A5252005A52
      52005A525200000000006B635A009C846300D6731800945A2900000000000000
      000000000000000000000000000000000000000000005A9CD600F7FFFF00296B
      3100296B3100296B3100296B3100296B3100296B3100296B3100296B3100296B
      3100296B3100F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00BDBDBD004A4A4A00524A4A004A4A4A0052525200A5A5
      A500393939006B6B6B00BDBDBD00000000000000000084848400B5B5B500BDBD
      BD00B5B5B500A5A5A500736B6300A58C7300D67318008C523100000000000000
      000000000000000000000000000000000000000000004AA5EF00F7FFFF00296B
      3100F7FFFF007BADD600F7FFFF007BADD600F7FFFF00F7FFFF007BADD600F7FF
      FF00296B3100F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5AD00FFFF
      F700AD6B5A0094949C0042393900AD6B5A00AD6B5A00AD6B5A00AD6B5A004239
      39006B6B6B00DEDED600B5848400000000000000000084848400848484008484
      8400C6C6C600BDBDBD00736B6300CE9C6B00D67318008C5A39005A5252005A52
      52005A5252005A5252006363630000000000000000004AA5EF00F7FFFF00296B
      31004ABD6B007BADD6004ABD6B007BADD6004ABD6B004ABD6B007BADD6004ABD
      6B00296B3100F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6B5AD00FFFF
      FF00A5A59C0042393900B5847300AD6B5A00AD6B5A00AD6B5A00AD6B5A00B584
      730042393900C6C6C600B5848400000000000000000000000000000000000000
      0000B5B5B500C6C6C600736B6300CE9C6300D6732100734A3900B5B5B500ADAD
      AD00ADADAD00B5B5B500A594A5005A525200000000004AA5EF00F7FFFF00296B
      3100F7FFFF007BADD600F7FFFF007BADD600F7FFFF00F7FFFF007BADD600F7FF
      FF00296B3100F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6BDB500A5A5
      9C006B6B6B00C6B59400FFE7D600EFC6AD00F7D6AD00F7D6AD00E7C69C00F7E7
      CE009C8C730042393900B584840000000000000000009C9C9C00636363006363
      6300C6C6C600BDBDBD007B736300DEA56B00D6732100734A3900848484008484
      840084848400848484008484840000000000000000004AA5EF00F7FFFF00296B
      31004ABD6B007BADD6004ABD6B007BADD6004ABD6B004ABD6B007BADD6004ABD
      6B00296B3100F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6BDB500A5A5
      9C006B6B6B00D6BDA500AD6B5A00AD6B5A00AD6B5A00AD6B5A00AD6B5A00AD6B
      5A00AD9C8C0042393900B584840000000000000000009C9C9C00A5A5A500B5B5
      B500A5A5A5008484840063635A00D6A57300DE7331007B5A4A00000000000000
      000000000000000000000000000000000000000000004AA5EF00F7FFFF00296B
      3100F7FFFF007BADD600F7FFFF007BADD600F7FFFF00F7FFFF007BADD600F7FF
      FF00296B3100F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEBDB500A5A5
      9C006B6B6B00C6BDA500B5847300B5847300AD6B5A00AD6B5A00AD6B5A00AD6B
      5A00A5947B0042393900B58484000000000000000000000000009C9C9C009C9C
      9C0084848400000000007B736B00F7BD7B00CE73310084635A00000000000000
      000000000000000000000000000000000000000000004AA5EF00F7FFFF00296B
      3100296B3100296B3100296B3100296B3100296B3100296B3100296B3100296B
      3100296B3100F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEC6B500FFFF
      FF00A5A59C006B6B6B00FFD6AD00FFE7D600F7FFFF00FFFFF700FFDED600FFD6
      B50042393900A5A5A500B5848400000000000000000000000000000000000000
      0000000000000000000063524200A57B5A00A5634200846B6300000000000000
      000000000000000000000000000000000000000000004AA5EF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00A5A59C006B6B6B00F7D6AD00AD6B5A00AD6B5A00EFD6A5004239
      3900BDBDBD00B58C8400B5848400000000000000000000000000000000000000
      000000000000000000005A525200A5A5A5006B6B6B005A525200000000000000
      000000000000000000000000000000000000000000004AA5EF00F7FFFF00F7FF
      FF00296B3100296B3100296B3100296B3100296B3100296B3100296B3100296B
      3100F7FFFF00F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00AD6B5A00AD6B5A00A5A59C006B6B6B006B6B6B006B6B6B006B6B6B00A5A5
      9C00EFB57300EFA54A00C6846B00000000000000000000000000000000008C8C
      8C008C8C8C00000000005A525200A5A5A500B5B5B5005A525200000000000000
      000000000000000000000000000000000000000000004AA5EF00F7FFFF00F7FF
      FF004ABD6B004ABD6B0042B55A0042B55A00319C3900319C3900319C39003184
      3900F7FFFF00F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A5A59C00A5A59C00A5A59C00A5A59C00C694
      7B00FFC67300CE94730000000000000000000000000000000000527B8400D6D6
      D600636363008C8C8C005A52520094949400C6C6C600C6C6C600000000000000
      00005A5252006B7373000000000000000000000000004AA5EF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00316BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000527B8400B5B5
      B50063636300F7F7F7006B6B6B0094949400ADADAD00B5B5B500C6C6C600BDBD
      BD009C9C9C006B7373000000000000000000000000004AA5EF004AA5EF004AA5
      EF004AA5EF004AA5EF004AA5EF004AA5EF004AA5EF004AA5EF004AA5EF005A9C
      D6005A9CD6005A9CD6005A9CD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B0000000000000000000000000000000000000000000000000063636300B5B5
      B5009C9C9C008C8C8C00A5A5A500DEDEDE00CECECE00BDBDBD00ADADAD00949C
      9C006B7373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00000000000000000000000000000000000000
      000000000000000000009C9C9C00000000000000000000000000848484008484
      84008C8C8C000000000000000000000000000000000000000000000000000000
      0000AD7B6B00AD7B6B00AD7B6B00AD7B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A526300FFEF
      C600F7D6B500EFD6AD00EFCE9C00EFCE9400EFC68C00EFBD8400EFBD7B00EFBD
      8400EFBD8400EFC68400A5636B00000000000000000000000000000000000000
      00009C9C9C009C9C9C00D6CECE009494940039393900525252009C949400C6C6
      C600D6D6D600848484000000000000000000000000000000000000000000AD7B
      6B00DEA57B00EFC69400E7C6A500DEB58C00AD7B6B00AD7B6B00AD7B6B00AD7B
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000636B8400186BC600636B
      8400F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFBD8400EFBD
      7B00EFBD7B00EFC68400A5636B000000000000000000000000009C9C9C009C9C
      9C00F7F7F700FFFFFF00D6D6D6009C9C9C004242420021182100211821003131
      310063636300848484008C8C8C00000000000000000000000000AD7B6B00DEB5
      8C00EFB57B00EFC69C00EFD6B500EFCEA500C69C73007B4A4A008C525200AD7B
      6B00AD7B6B00AD7B6B000000000000000000000000000000000010841000189C
      180031A5310039AD390039AD3900107B100031942900217318005A524200736B
      5A0000000000000000000000000000000000000000000000000031A5FF001073
      D6006B6B8400F7DEBD00EFD6B500EFCEA500EFCE9C00EFC69400EFC68C00EFBD
      8400EFBD7B00EFC68400A5636B0000000000948C8C009C9C9C00EFEFEF00FFFF
      FF00EFE7E700C6C6C6009C9C9C008C8C8C009494940084848400636363003939
      39001821210021182100737373000000000000000000AD7B6B00E7BD9400EFC6
      8C00EFB57B00EFC6A500F7E7CE00F7D6AD00C69C84007B4A4A007B4A4A00CEA5
      7B00EFBD8C00D6A58400AD7B6B0000000000000000000000000021A5210031AD
      31004ABD4A0052C65200399C39008CBD7B0052BD520042BD4200217318004A42
      2900000000000000000000000000000000000000000000000000A5635A0031A5
      FF001073D6005A638400F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFBD8400EFC68400A5636B00000000009C9C9C00E7E7E700E7E7E700BDBD
      BD00A5A5A500B5ADAD00C6BDBD00A5A5A50094949400948C8C00949494009C94
      94008C8C8C006B6B6B008484840000000000AD7B6B00F7CE9C00F7D69400EFC6
      8C00EFB57B00F7CEAD00FFEFDE00FFE7C600CEA58C007B4A4A007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B00000000000000000000000000299C29004ABD
      4A006BCE6B006BC66B00F7FFEF00F7FFEF0063C6630063CE630031A531004A6B
      3900000000000000000000000000000000000000000000000000A5736B00FFF7
      EF0031A5FF00427BAD008C635A00AD7B730094635A00AD7B6B00CEA58400EFC6
      9400EFC68C00EFC68400A5636B000000000094949400ADADAD00A5A5A500ADAD
      AD00C6C6C600D6D6D600EFEFEF00EFEFEF00DEDEDE00C6C6C600ADADAD009C9C
      9C00948C8C00949494008C8C8C0000000000AD7B6B00F7D69C00F7D69400F7C6
      8C00F7B57300F7CEAD00FFF7EF00FFEFDE00CEAD9C00734242007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B00000000000000000000000000000000004ABD
      4A0073CE730052A54A00FFFFFF00FFFFFF006BC66B0073CE7300319C31000000
      0000000000000000000000000000000000000000000000000000A5736B00FFFF
      FF00F7EFE700AD8C8C00B58C8400DEBDA500EFD6B500D6B59C00B58C7300CEA5
      8400EFC69400EFC68C00A5636B0000000000948C8C00ADADAD00C6C6C600CECE
      CE00C6C6C600DEDEDE00CECECE00A5ADA500BDBDBD00CECECE00D6D6D600D6D6
      D600C6C6C600B5B5B5009494940000000000AD7B6B00F7D69C00FFD69400E7BD
      9400B5A59400F7CEAD00FFFFF700FFF7EF00DEC6B50094635A0084524A00CEA5
      8400EFBD8C00DEB58400AD7B6B00000000000000000000000000000000000000
      000018734A003984AD00217BBD00428CAD0063BD6300399C3900000000000000
      0000000000000000000000000000000000000000000000000000BD846B00FFFF
      FF00FFF7EF00AD847B00DEC6B500F7E7CE00F7E7C600FFFFF700D6B59C00AD7B
      6B00EFCE9C00EFCE9400A5636B0000000000000000009C9C9C00CECECE00CECE
      CE00DEDEDE00C6C6C600B5B5B500A5D6A500BDC6BD00C6A5A500ADA5A500A5A5
      A500B5B5B500C6BDBD00A5A5A50000000000AD7B6B00FFD69400D6CEA50052A5
      E7002184F70084ADDE00FFFFEF00FFF7EF00FFF7E700F7E7CE00E7C6A500E7C6
      9C00E7BD9400DEB58400AD7B6B00000000000000000000000000000000000000
      0000187BC600218CE700298CE700218CE700296B520000000000000000000000
      0000000000000000000000000000000000000000000000000000BD846B00FFFF
      FF00FFFFFF0094636300F7EFDE00F7EFDE00F7E7CE00FFFFEF00EFD6B5009463
      5A00EFCEA500F7D6A500A5636B000000000000000000000000009C9C9C00BDBD
      BD00ADADAD00ADADAD00E7E7E700F7EFEF00EFEFEF00EFE7DE00D6D6D600CECE
      CE00B5B5B500949494000000000000000000AD7B6B009CC6C60042B5FF0031AD
      FF00319CFF001884FF0084BDF700FFFFEF00FFF7EF00FFEFDE00F7E7CE00EFD6
      B500EFC69C00DEB58C00A57B7B0000000000000000000000000000000000297B
      AD00399CFF00399CFF00399CFF00399CFF00298CE70039525200000000000000
      0000000000000000000000000000000000000000000000000000D6946B00FFFF
      FF00FFFFFF00B58C8400DEC6C600F7EFE700F7EFDE00FFFFD600DEBDA500AD7B
      7300F7D6AD00EFCEA500A5636B00000000000000000000000000000000009C9C
      9C00D6D6D600CECECE009C9C9C00BDBDBD00D6D6D600D6D6D600D6D6D600C6C6
      C600ADADAD00000000000000000000000000429CF70042A5FF0042ADFF0042B5
      FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFF7EF00FFEFDE00FFE7
      C600DEC6B500948C94009C7B8400000000000000000000000000000000002184
      C60042A5FF0042A5FF0042A5FF0042A5FF00399CF700315A6B00000000000000
      0000000000000000000000000000000000000000000000000000D6946B00FFFF
      FF00FFFFFF00D6BDBD00BD949400DEC6C600F7EFDE00DEC6B500B58C8400B58C
      7B00DECEB500B5AD9400A5636B00000000000000000000000000000000000000
      0000FFE7E700FFDECE00E7C6BD00E7C6BD00E7CEC600DED6CE00CECECE009494
      94000000000000000000000000000000000000000000429CFF0042A5FF0042AD
      FF0042B5FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFFFEF00D6D6
      D600737BAD007B739400000000000000000000000000000000006BA5C60042A5
      F7004AB5FF0052B5FF0052BDFF0052B5FF004AADFF0039739400000000000000
      0000000000000000000000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00D6BDBD00B58C840094636300AD847B00CEA59C00A56B
      5A00A56B5A00A56B5A00A5636B00000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500FFAD9C00000000000000
      0000000000000000000000000000000000000000000000000000429CF70042A5
      FF0042ADFF0042ADFF0039A5FF002994FF001884FF0094C6FF00B5CEE7004A6B
      BD00526BA50000000000000000000000000000000000000000005294BD0042A5
      EF005ABDFF005ABDFF0052B5F7004AB5EF0052B5F70039738C00000000000000
      0000000000000000000000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700D6BDBD00A56B
      5A00E79C5200E78C3100B56B4A00000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9400000000000000
      00000000000000000000000000000000000000000000000000000000000042A5
      FF0042ADFF0042B5FF0042ADFF00319CFF002994FF001884FF00316BE7003163
      C60000000000000000000000000000000000000000000000000063849C002173
      A5004A94C6006BADD60063ADF7004A9CE700216BA50000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B
      5A00FFB55A00BD7B5A0000000000000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042A5FF0042ADFF0042B5FF0039ADFF003994F7001831B5003952DE000000
      0000000000000000000000000000000000000000000000000000000000002173
      A5006BADD6008CBDE70073BDE7005AADDE00316B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00D6BDBD00A56B
      5A00BD846B00000000000000000000000000000000000000000000000000CE9C
      9C00FFE7D600FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042A5FF0042ADFF00000000000000000018109400394ADE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BA5BD004A94B5004A8CAD0063849C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B
      5A0000000000000000000000000000000000000000000000000000000000CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00F7AD9C00F7AD9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018189C00394ADE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636B00525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C6B63009C6B
      63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B
      63009C6B63009C6B6300A56B6B00000000000000000000000000000000000000
      00000000000063636B0094949400A5A5A5003131310000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF000084840000848400000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000084840000848400008484008484
      84000000000000000000000000000000000000000000000000009C736B00FFE7
      C600F7DEB500F7D6AD00F7D69C00F7CE9400EFC68400EFC68400EFC68400EFC6
      8400EFC68400EFC684009C6B6300000000000000000000000000000000000000
      000063636B0094949400D6D6D600DEDEDE00ADADAD0052525200000000000000
      0000000000000000000000000000000000000000000000848400008484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000084840000000000000000000000000000000000848484000084
      840000848400008484008484840000848400C6FFFF0084FFFF0084FFFF000084
      84000000000000000000000000000000000000000000000000009C736B00F7E7
      C600F7DEBD00F7D6AD00EFCEA500EFCE9C00EFC69400EFC68400EFBD7B00EFBD
      7B00EFBD7B00EFBD7B009C6B6300000000000000000000000000000000006363
      6B0094949400D6D6D600D6D6D600DEDEDE00DEDEDE00ADADAD00313131000000
      0000000000000000000000000000000000000000000000000000008484000084
      84000084840000848400008484000084840000FFFF0000FFFF0000FFFF000084
      840000FFFF0000FFFF0000FFFF0000000000000000000000000000848400C6FF
      FF0084FFFF0084FFFF0000848400848484000084840000848400008484008484
      84000084840084848400000000000000000000000000000000009C736B00F7E7
      D600FFEFCE00F7DEBD00FFDEB500F7D6AD00EFCE9C00EFC69400EFC68400EFBD
      7B00EFBD7B00EFBD7B009C6B6300000000000000000000000000636363008484
      8400D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00E7E7DE00ADADAD005252
      5200000000000000000000000000000000000000000000848400008484000084
      84000084840000848400008484000084840000FFFF0000FFFF000084840000FF
      FF0000FFFF000084840000FFFF00000000000000000000000000848484000084
      8400008484000084840084848400000000000000000000848400C6C6C600C6C6
      C600C6C6C6000084840000000000000000000000000000000000A5737300FFF7
      DE00948C8C00948C8C00948C8C00948C8C00E7C69C00EFCE9C00EFC69400EFC6
      8400EFBD7B00EFBD7B009C6B6300000000000000000063636B007B7B7B00ADAD
      AD00BDBDBD00BDBDBD00CECECE00D6D6D600DEDEDE00DEDEDE00E7E7E700ADAD
      AD003131310000000000000000000000000000848400000000000000000000FF
      FF0000FFFF0000FFFF00008484000084840000FFFF0000FFFF000084840000FF
      FF00000000000084840000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000084840000C6C60000C6
      C60000C6C6000084840000000000000000000000000000000000A57B7300FFFF
      F700313129006B7394001029A50021213900D6B58C00F7D6AD00EFCE9C00EFC6
      9400EFC68400EFBD7B009C6B6300000000007B7B7B0063636B00A5A5AD00A5A5
      AD00B5ADBD00BDBDBD00C6C6C600BDBDBD00949494007B7B7B005A525200D6D6
      D600BDBDBD005252520000000000000000000084840000848400008484000084
      84000084840000848400008484000084840000FFFF00008484000084840000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000005A0000005A0000005A
      0000005A0000005A0000005A0000005A0000005A000000848400C6C6C600C6C6
      C600C6C6C60000848400005A0000005A00000000000000000000AD847B00FFFF
      F70031313900637BE7007B94FF0010219C00DEC69C00FFDEB500EFCEA500EFCE
      9C00EFC69400EFC684009C6B63000000000084848C0052526300293163002931
      520042426B0063637B00BDC6C600CECECE00B5B5B500949CA5009C9CA500DEDE
      DE00EFEFEF00B5B5B5004A424A00000000000000000000000000008484000084
      840000000000000000000000000000000000000000000084840000FFFF000084
      84000084840000FFFF00000000000000000000000000005A0000008400000084
      000000C6000000C6000000C6000000C6000000C600000084840000C6C60000C6
      C60000C6C6000084840000840000005A00000000000000000000B58C7B00FFFF
      FF0042424200524A4A005A524A00182994006373D600C6B59C00F7D6B500EFCE
      A500EFCE9C00EFC694009C6B63000000000094949C0073849C007394CE007B9C
      CE006B8CC600526BAD002931840021316300526B9C003973A500EFEFEF00EFEF
      EF00EFEFEF00F7F7F700A5A5A50052525200000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084840000FF
      FF0000FFFF0000000000000000000000000000000000005A00000084000000C6
      000084FF840084FF840084FF8400424242004242420000848400FFFFFF0084FF
      FF0084FFFF000084840000840000005A00000000000000000000BD8C7B00FFFF
      FF00FFFFFF00F7EFE700F7E7D600F7E7D600637BE700425AE700E7CEBD00F7D6
      AD00EFCEA500EFCE9C009C6B63000000000094949C008494AD008CADDE008CAD
      DE0094B5E7008CA5D6006384C6005A73BD006B7BBD0018217300EFEFEF00EFEF
      EF00EFEFEF00F7F7F700EFEFEF00A5A5A5000000000000000000000000000000
      000000FFFF00C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000005A000000C60000C6FF
      C600C6FFC60084FF840042424200C6C6C600C6C6C60000848400008484000084
      84000084840084FF840000C60000005A00000000000000000000C6947B00FFFF
      FF00948C8C00948C8C00948C8C00948C8C00EFE7CE00C6BDDE00EFD6C600F7D6
      B500F7D6AD00E7C69C0094736B0000000000000000000000000084A5DE00738C
      BD00182173001018420052B5DE004294C6006384C6008CA5D600EFEFEF00EFEF
      EF00EFEFEF00F7F7F700DEE7DE00A5A5A500000000000000000000848400C6C6
      C6000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000000000000000000000000000000000005A000000C60000C6FF
      C600C6FFC600C6FFC60042424200C6FFFF00C6C6C600C6C6C6004242420084FF
      840084FF840084FF840000C60000005A00000000000000000000CE9C8400FFFF
      FF0031312900A5A5A5005263AD0029314200D6CEBD00FFF7DE00FFEFCE00F7E7
      C600DECEAD00B5A58C00846B6300000000000000000000000000ADC6E7007BA5
      D6001821520021426B004A8CC600314A8C0084A5D600A5BDDE00EFEFEF00EFEF
      EF00F7F7F700F7F7F700A5A5A500000000000000000000000000000000000084
      840000848400FFFFFF00FFFFFF00FFFFFF000084840000848400008484000084
      84000084840000000000000000000000000000000000005A00000084000000C6
      0000C6FFC600C6FFC600C6FFC60042424200424242004242420084FF840084FF
      840084FF840000C6000000840000005A00000000000000000000CE9C8400FFFF
      FF0042424A007B94FF00426BFF0018297B00E7DEC600FFF7E700E7CEBD00A56B
      6B00A56B6B00A56B6B00A56B6B00000000000000000000000000000000006B73
      840052B5DE0052A5CE008CADDE00A5BDDE00DEDEDE00DEDEDE00EFEFEF00EFEF
      EF00DEDEDE009C9C9C0000000000000000000000000000000000000000000000
      0000008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      84000000000000000000000000000000000000000000005A0000008400000084
      000000C60000C6FFC600C6FFC600C6FFC600C6FFC60084FF840084FF840084FF
      840000C600000084000000840000005A00000000000000000000D6A58400FFFF
      FF0029292900636B84008C8C9C000821A500BDC6F700FFFFF700D6B5AD00A56B
      6B00E79C4A00E78C3100A56B6B000000000000000000000000006B7384002139
      630052A5CE00849CBD00A5BDDE00A5BDDE008C8C8C0094949400EFEFEF00EFEF
      EF009C9C9C000000000000000000000000000000000000000000000000000000
      00000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008484000084
      84000000000000000000000000000000000000000000005A0000005A0000005A
      0000005A0000005A0000005A0000005A0000005A0000005A0000005A0000005A
      0000005A0000005A0000005A0000005A00000000000000000000D6A58400FFFF
      FF00ADB5B50094949400949494008C9CC6004263FF009CB5FF00D6B5BD00A56B
      6B00F7AD5A00A56B6B000000000000000000000000006B73840021219C0052A5
      CE000000000000000000949494008C8C8C00F7F7F700E7E7DE00949494009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6A58400F7EF
      E700FFFFF700FFFFF700FFFFF700FFF7EF00CECEEF005A73EF00B5A5B500A56B
      6B00A56B6B0000000000000000000000000000000000BDB5EF001818AD000000
      0000000000000000000000000000949494009494940094949400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6946B00D69C
      7B00D69C7B00D69C7B00CE947300C68C7300C68C7300C68C7300AD736B00A56B
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700DEDEDE00DEDEDE00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C6363004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000008C8C8C0063636B007B636300ADAD
      AD00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C6363009C636300BD636300BD6B6B004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052638C00314A7B0031395A0000000000000000005A6B
      8C003163BD0031395A000000000000000000848400000000000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400C6C6C600000000000000000000000000637B84004273C6008C7BA5007B63
      6300ADADAD00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C6363009C63
      6300C66B6B00D66B6B00D66B6B00C66B6B00424242009C6363009C6363009C63
      63009C6363009C6363009C6363000000000000000000000000006BADFF00639C
      FF00427BE700214A94005A94FF00427BEF00294A940021428400315ABD003163
      BD00396BD6003163C60031395A0000000000848400008484000084840000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484
      84008484840000000000000000000000000052B5FF004AADFF004273C6008C7B
      A5007B636300ADADAD00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C636300D66B
      6B00D66B6B00D66B6B00CE6B6B00C66B6B0042424200C67B7B00DE8C8C00F794
      9400F7A5A500F7A5A5009C636300000000000000000000000000396BC6005284
      E700396BC60029529C00A5E7FF006BA5FF00315ABD00315ABD002952A5002142
      8C0021428C002952A500526B9C0000000000848400008484000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00848484000000000000000000000000000000000052B5FF004AADFF004273
      C6008C7BA5007B636300ADADAD00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C636300D66B
      6B00D66B6B00D6737300D6737300CE6B73004242420000940000009400000094
      000000940000F7A5A5009C63630000000000000000000000000063A5FF005A94
      FF00427BEF00315AAD004A84F7004A84F7003973E7003973E7003163C6002952
      AD001831630018294A00424A6B0000000000848400008484000084840000C6C6
      C600C6C6C60084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000052B5FF004AAD
      FF004273C6008C7BA500846B6B00EFEFEF00F7F7F700DEDEDE00D6D6D600D6D6
      D600EFEFEF00FFFFFF00000000000000000000000000000000009C636300D673
      7300D6737300DE737300DE737300D67373004242420000940000009400000094
      000000940000F7A5A5009C63630000000000000000000000000084C6FF0073AD
      FF004A84F700315ABD004A84FF004A84F700427BF700427BEF003163CE00295A
      B5001839730018294A000000000000000000848400008484000000000000FFFF
      FF00FFFFFF000000000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000000000000052B5
      FF004AADFF004273C6006B6B6B00737373008C6B6B009C636300C6949400A57B
      7B00635A5A00A5A5A500FFFFFF000000000000000000000000009C636300E77B
      7B00E77B7B00E77B7B00E7848400D67373004242420000940000008400000084
      000000840000F7A5A5009C636300000000000000000000000000396BC6005284
      E700396BC6002952AD00528CFF004A8CFF006BA5FF005A94FF00396BD600295A
      B50018316B0018294A000000000000000000848400008484000084840000C6C6
      C600C6C6C600C6C6C600FFFF0000FF00000084848400C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      000052B5FF00BDBDBD00847B7B00DEAD9400FFEFBD00FFFFD600FFFFD600FFFF
      DE00F7EFCE00846363009C9C9C00FFFFFF0000000000000000009C636300F784
      8C00EF848400EF949400FFDEDE00DE8C8C004242420000840000008400000063
      000000630000F7A5A5009C63630000000000000000000000000094D6FF007BB5
      FF00528CFF00315ABD005294FF005A9CFF0094CEFF006BA5FF00396BD600295A
      B50018316300293952000000000000000000848400008484000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFF0000FF000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000D6D6D600E7B59400FFFFD600FFF7BD00FFFFD600FFFFE700FFFF
      EF00FFFFFF00FFF7E70063525200D6D6D60000000000000000009C636300F784
      8C00EF848400F79C9C00FFFFFF00DE8C8C0042424200FFCEAD00F7B58400F7B5
      8400F7B58400F7A5A5009C636300000000000000000000000000396BC6005284
      E700396BC600294A9C005A9CFF0063ADFF009CD6FF0063A5FF003163C6002952
      A50031395A00000000000000000000000000848400008484000084840000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF0000FF00000084848400C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000C69C9C00FFEFBD00FFE7AD00FFF7C600FFFFDE00FFFFEF00FFFF
      FF00FFFFFF00FFFFDE00B59484009494940000000000000000009C636300F78C
      8C00F78C8C00F78C8C00F78C8C00DE7B840042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C6363000000000000000000000000009CDEFF007BBD
      FF00528CFF00315ABD00528CFF004A84FF004A7BDE00427BE700315ABD00294A
      940000000000000000000000000000000000848400008484000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF0000FF000000C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00D6AD9C00FFFFCE00FFDEAD00FFF7C600FFFFD600FFFFE700FFFF
      EF00FFFFEF00FFFFDE00EFE7BD006B6B6B0000000000000000009C636300F78C
      8C00F7949400F7949400F78C8C00E784840042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      000000000000000000006BADFF0073ADFF00295AB50021397300395284000000
      000000000000000000000000000000000000848400008484000084840000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF0000FF00
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000E7BDA500FFFFC600FFD6A500FFEFB500FFFFCE00FFFFDE00FFFF
      DE00FFFFDE00FFFFD600FFF7C6007B7B7B0000000000000000009C636300F78C
      8C00FF949400FF949400F7949400E78C8C0042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      000000000000526B9C009CDEFF006BA5FF00294A9400394A6B00000000000000
      000000000000000000000000000000000000848400008484000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      0000FF0000008484840000000000000000000000000000000000000000000000
      000000000000CEA59C00FFFFD600FFE7BD00FFDEAD00FFF7BD00FFFFC600FFFF
      CE00FFFFCE00FFFFCE00DEB59400B5B5B50000000000000000009C636300F78C
      8C00FF949400FF9C9C00FF949400E78C8C0042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      0000000000007BA5DE009CDEFF004A84F7002139630000000000000000000000
      000000000000000000000000000000000000848400008484000084840000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600FFFF0000FF00000084848400000000000000000000000000000000000000
      000000000000E7D6D600FFF7C600FFFFFF00FFFFEF00FFDEAD00FFE7AD00FFE7
      B500FFE7B500FFEFBD009C6B6B00EFEFEF0000000000000000009C6363009C63
      6300E79C9C00FF949400FF9C9C00EF8C940042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      0000000000007BA5DE0094CEFF004A84F700213963004A525A00000000000000
      0000000000000000000000000000000000000000000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFF0000FF000000000000000000000000000000000000000000
      00000000000000000000BD8C8C00FFFFFF00FFFFEF00FFFFD600FFDEAD00FFF7
      C600FFE7BD00C68C8400DEDEDE00000000000000000000000000000000000000
      00009C636300B5737300D6848400DE8C8C00424242009C6363009C6363009C63
      63009C6363009C6363009C636300000000000000000000000000000000000000
      0000000000009CDEFF0063A5FF005294FF003963CE00294A9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000C6A5A500DEBD9C00FFEFB500FFE7AD00EFC6
      A500B5848400EFEFEF0000000000000000000000000000000000000000000000
      000000000000000000009C6363009C6363004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007BA5DE004A84F7003963C600526B9C00000000000000
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
      000000000000C6C6C6008484840000000000000000000000000000FFFF0000FF
      FF0000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000FF000000000000000000000000000000F7F7F700BDBDBD00A5A5A500A5A5
      A500A5A5A500ADADAD00CECECE00EFEFEF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      000000000000C6C6C600C6C6C60084848400000000000000000000FFFF0000FF
      FF00C6C6C600C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600FF00000000000000FFFFFF00FFFF
      FF0084848400000000000000000000000000BD522900D64A2100EF5A3900FF63
      5200FF635200D64A2100A539180063524A009C9C9C00949494007B7B7B007373
      7300737373007B7B7B00BDBDBD00FFFFFF00000000000000000084840000C6C6
      C600C6C6C600000000000000000000000000848484000000000000FFFF0000FF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008484
      840000000000000000000000000000000000C6421000EF5A4200FF735A00FF7B
      6300CE5A2900D6845200FF6B5A00EF5A420042B542002994290052C652004ABD
      4A0039B5390021AD21005A635A00F7F7F7000000000084840000C6C6C600C6C6
      C600C6C6C60084840000C6C6C600848400000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FF000000FFFFFF00FF00
      0000FF000000FF000000FF000000FF0000000000000000000000FFFFFF00C6C6
      C600C6C6C600C6C6C6000000000000000000D6947B00FF6B5A00FF846B00EF84
      5A00FFDEA500FFDEA500FF846B00FF63520063CE6300BDDEAD00429C42006BCE
      6B0052C6520039B539006B7B6B00FFFFFF000000000000000000848400008484
      0000C6C6C600C6C6C600C6C6C600C6C6C6008484000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C600000000000000000000000000CE633900FF8C6B00EF9C
      7B00BD8C8400FFBD9400FF8C7300BD4A180084DE8400FFFFFF00FFFFFF0063C6
      63006BCE6B00299C2900DEDEDE000000000000000000FFFF0000000000008484
      000084840000C6C6C60000FF000000FF00008484000084840000000000008484
      840000000000C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000EFEFEF004A4A4A00000000000821
      7B001029940000107B00635A5A00319C310094E79400DED6BD00428CAD009CB5
      A50042A54200D6D6D600000000000000000000000000FFFF0000848400000000
      00008484000084840000848400008484000084840000C6C6C600848400000000
      000084848400C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF000000FFFFFF00FF00
      0000FF000000FF000000FF000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000101010001010100008296B00184A
      AD00184AB500184AAD0008186B00BDBDBD0094B5C6002994F7002994F7002994
      EF00105A8C00A5A5A500FFFFFF00000000000000000000000000FFFF000000FF
      000000000000848400008484000084840000C6C6C600C6C6C600C6C6C6008484
      0000000000008484840000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00000000000000000018181800212121002163C600216B
      CE00216BD6002163CE0010429C00A5A5A500298CDE0039A5FF0039A5FF0039A5
      FF00319CFF005A636300EFEFEF0000000000000000000000000000000000FFFF
      000000FF0000000000008484000084840000C6C6C600C6C6C600C6C6C60000FF
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000029292900313131002163B500298C
      F7003194FF00298CF7001863C600A5A5A50042ADFF004AB5FF004AB5FF004AAD
      FF0042ADFF00185A8400DEDEDE00000000000000000000000000000000000000
      0000FFFF000000FF0000000000008484000084840000C6C6C600C6C6C6008484
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FF000000FFFFFF00FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000001818180042424200292929001042
      9C00216BDE003194F700105AA500D6D6D60052B5FF0052BDFF0052BDFF0052BD
      FF004AB5FF00187BBD00D6D6D600000000000000000000000000C6C6C6000000
      000000000000FFFF000000FF0000000000008484000000FF0000848400000000
      0000FFFF00008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000DEDEDE0052525200636363009C9C
      9C00737373002929290039394200FFFFFF001884BD00298CBD00318CBD001884
      CE002184CE0010638C00EFEFEF000000000000000000C6C6C600C6C6C600C6C6
      C6000000000000000000FFFF000000FF00000000000084840000000000008484
      0000FFFF00008484840000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      00000000000000000000000000000000000000000000BDBDBD00636363009494
      94006B6B6B0029292900F7F7F700000000007BADCE0063ADDE0084C6E7009CCE
      E7003994C600B5B5BD00FFFFFF00000000000000000000000000C6C6C6000000
      0000000000000000000000000000FFFF000000FF00000000000084840000FFFF
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BADCE005AA5C600398C
      BD00C6D6DE00FFFFFF0000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000FFFF000084840000FFFF00008484
      8400000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000000000000FFFF0000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C000FE7FFFFF0000C000FC3F80010000
      C000FC3F80010000C000C43F80010000C001803F80010000C001800180010000
      C001F00080010000C001800180010000C001803F80010000C001C43F80010000
      C001FC3F80010000C001FC3F80010000C001E43F80010000C003C03380010000
      C007C00380010000C00FC007FFFF0000C001FDC7F0FFFFFFC001F003E00FFFFF
      8001C001C003C00FC00100018001C00FC00100010001C00FC00100010001E01F
      C00100010001F03FC00180010001F07FC001C0030001E03FC001E0070001E03F
      C001F00F8003C03FC001F03FC007C03FC001F03FE00FC07FC003F03FF01FE07F
      C007E03FF99FF0FFC00FE07FFF9FFFFFFCFFFFFFFFFFC001F87FC003FE0FC001
      F03F8001C00FC001E01F8001C003C001C00F0001C183C00180070001FF83C001
      000300018000C001000180018000C001000080038000C0010000800F8000C001
      C000800F8000C001C001C0078000C001E003E0078000C001C007E0078000C003
      8C0FF81FFFFFC0079E1FFFFFFFFFC00F9FFF0FFFFE7FFFFF000107FFF07FFC63
      000103FFC001C001000101FFC001C001000180FFC001C0010001C003C001C003
      0001E001C001C0030001F000C001C0030001F800C001C0070001F800C001C00F
      0001F000C001FC1F0001F800C001F83F0001F800C001F87F0001F800C001F83F
      0001FC01F001F83FFFF8FE03FC7FFC3FFFFFF7FFC003FFFFFFFFE1C18003FE03
      007FC08080030007000080408003000700000039800300030000801F80030003
      800180098003000100038001800300010001C003800300030001E00380030001
      0001F00780030001000188038003000300018C038003001F81018E078007001F
      FF83F30F800F003FFFFFF39F801F007F00000000000000000000000000000000
      000000000000}
  end
  object IBSQL3: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTControlCobro
    Left = 168
    Top = 112
  end
  object DSTiposId: TDataSource
    AutoEdit = False
    DataSet = IBDSTiposId
    Left = 438
    Top = 84
  end
  object IBDSTiposId: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = IBTControlCobro
    SelectSQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 462
    Top = 84
  end
  object IBDSTiposCaptacion: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = IBTControlCobro
    SelectSQL.Strings = (
      'select * from "cap$tipocaptacion"')
    Left = 408
    Top = 86
  end
  object DSTiposCaptacion: TDataSource
    AutoEdit = False
    DataSet = IBDSTiposCaptacion
    Left = 382
    Top = 86
  end
  object IBSQL4: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTControlCobro
    Left = 144
    Top = 112
  end
  object PopupUtilidades: TPopupMenu
    Images = ImageList
    Left = 608
    Top = 16
    object Informacin1: TMenuItem
      Bitmap.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000107B10001084
        100021731800189C180018A51800315A210021A521004A42290039632900396B
        2900298C290031942900299C2900319C290029AD2900425A310042633100426B
        3100318C3100398C3100319C3100399C310031A5310031AD310031B531004A6B
        39004284390039943900399C390039AD390039B539005A524200526342005273
        42004A8C42004A9C42004AA5420042BD4200636B4A0018734A00528C4A0052A5
        4A004ABD4A0039525200296B5200637B520052B5520052BD520052C65200736B
        5A005AC65A007B736300428463006B84630063A5630063BD630063C6630063CE
        6300315A6B0073B56B006BC66B006BCE6B00426B730073AD730073CE730073D6
        7300316B7B0094B57B0084BD7B008CBD7B007BCE7B007BD67B00296B8400316B
        8400948C840084B5840039738C009CB58C008CBD8C0039739400216B9C005A84
        9C0063849C00216BA5002173A5002173AD00297BAD003984AD00428CAD004A8C
        AD00107BB500217BB500428CB5004A94B500217BBD004294BD005294BD00529C
        BD006BA5BD00D6E7BD00187BC6002184C6002984C600298CC600318CC600428C
        C6003994C6004294C6004A94C60063A5C6006BA5C600BDC6C600BDCEC6002184
        CE00218CCE00298CCE00398CCE002994CE00E7DECE00D6E7CE006BADD6006BB5
        D6003194DE005AADDE0063ADDE00218CE700298CE700319CE7004A9CE70073BD
        E7008CBDE7008CC6E7009CCEE7002994EF0042A5EF004AB5EF007BBDEF008CC6
        EF00F7FFEF002994F700319CF700399CF70042A5F70063ADF70052B5F700FF00
        FF003194FF00319CFF00399CFF0039A5FF0042A5FF0042ADFF004AADFF004AB5
        FF0052B5FF0052BDFF005ABDFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00919191919191
        919191919191919191919191919191919191919191919191919191910103161D
        1D000B021F3191919191919106172A301C452F2502079191919191910C2A3D3C
        8A8A38391619919191919191912A40299D9D3C40149191919191919191912757
        5E58371C91919191919191919191647D7E7D2C91919191919191919191569494
        94947E2B91919191919191919165969696968D3A91919191919191916E8E999A
        9B9A984F919191919191919160869C9C9087904C919191919191919152546C78
        8F805391919191919191919191547882817B429191919191919191919191625D
        5952919191919191919191919191919191919191919191919191}
      Caption = 'Informaci'#243'n'
      ImageIndex = 15
      OnClick = Informacin1Click
    end
    object Garantas1: TMenuItem
      Caption = 'Garant'#237'as'
      ImageIndex = 14
      OnClick = Garantas1Click
    end
    object Liquidacin1: TMenuItem
      Caption = 'Liquidaci'#243'n'
      ImageIndex = 10
      OnClick = Liquidacin1Click
    end
    object CartasdeCobro1: TMenuItem
      Caption = 'Carta de Cobro'
      ImageIndex = 8
      OnClick = CartasdeCobro1Click
    end
    object Costas1: TMenuItem
      Caption = 'Costas'
      ImageIndex = 17
      OnClick = Costas1Click
    end
    object RegistrodeCartas1: TMenuItem
      Caption = 'Registro de Cartas'
      Visible = False
      OnClick = RegistrodeCartas1Click
    end
    object MasivoCartas1: TMenuItem
      Caption = 'Masivo Cartas'
      OnClick = MasivoCartas1Click
    end
  end
  object PopupExtractos: TPopupMenu
    Images = ImageList
    Left = 632
    Top = 16
    object Captaciones1: TMenuItem
      Caption = 'Captaciones'
      ImageIndex = 2
      OnClick = Captaciones1Click
    end
    object Colocaciones1: TMenuItem
      Caption = 'Colocaciones'
      ImageIndex = 4
      OnClick = Colocaciones1Click
    end
  end
  object PopupMantenimientos: TPopupMenu
    Images = ImageList
    Left = 656
    Top = 16
    object Personas1: TMenuItem
      Caption = 'Personas'
      ImageIndex = 0
      OnClick = Personas1Click
    end
  end
  object PopupInformes: TPopupMenu
    Images = ImageList
    Left = 680
    Top = 16
    object PorMora1: TMenuItem
      Caption = 'Por Mora'
      ImageIndex = 11
      OnClick = PorMora1Click
    end
    object PorAportes1: TMenuItem
      Caption = 'Por Aportes'
      ImageIndex = 12
      OnClick = PorAportes1Click
    end
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 96
    ReportForm = {19000000}
  end
  object frCompositeReport1: TfrCompositeReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    DoublePassReport = False
    Left = 128
    ReportForm = {19000000}
  end
  object Rcostas: TprTxReport
    Values = <
      item
        Name = 'PCostas'
        AggFunction = prafSum
        Formula = 'CDpagadas.valor_costa'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'CDpagadas'
      end
      item
        Name = 'Phonorarios'
        AggFunction = prafSum
        Formula = 'CDpagadas.valor_honorario'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'CDpagadas'
      end
      item
        Name = 'Potros'
        AggFunction = prafSum
        Formula = 'CDpagadas.valor_otro'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'CDpagadas'
      end
      item
        Name = 'CCostas'
        AggFunction = prafSum
        Formula = 'CDcargada.valor_costa'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'CDcargada'
      end
      item
        Name = 'Chonorarios'
        AggFunction = prafSum
        Formula = 'CDcargada.valor_honorario'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'CDcargada'
      end
      item
        Name = 'Cotros'
        AggFunction = prafSum
        Formula = 'CDcargada.valor_otro'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'CDcargada'
      end>
    Variables = <
      item
        Name = 'empresa'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'nit'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'empleado'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'colocacion'
        ValueType = 'prvvtString'
        Value = ''
      end>
    Left = 120
    Top = 200
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 3'
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
      ColNum = 132
      object prTxHTitleBand1: TprTxHTitleBand
        Height = 5
        UseVerticalBands = False
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[empresa] Nit. [nit]')
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
          dRec.Right = 55
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'Descripci'#243'n : RELACION DE COSTAS PAGADAS POR COLOCACION No. [col' +
                  'ocacion]')
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
          dRec.Right = 73
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA DE REALIZACION : [:<d>StartDateTime]')
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
          dRec.Right = 51
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'REALIZO : [empleado]')
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
          dRec.Right = 59
          dRec.Bottom = 4
          Visible = False
        end
      end
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 3
        UseVerticalBands = False
        DetailBand = Rcostas.prTxHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'RELACION DE COSTAS PAGADAS')
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
          dRec.Right = 27
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
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
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 10
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR COSTAS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 1
          dRec.Right = 26
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR HONORARIOS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 27
          dRec.Top = 1
          dRec.Right = 44
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR OTROS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 45
          dRec.Top = 1
          dRec.Right = 60
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DESCRIPCION')
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
          dRec.Top = 1
          dRec.Right = 91
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'CDpagadas'
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand1'
          'prTxHDetailFooterBand1')
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<d>CDpagadas.fecha]')
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
          dRec.Right = 10
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>CDpagadas.valor_costa]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 0
          dRec.Right = 26
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>CDpagadas.valor_honorario]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 27
          dRec.Top = 0
          dRec.Right = 44
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>CDpagadas.valor_otro]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 45
          dRec.Top = 0
          dRec.Right = 60
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDpagadas.descripcion]')
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
          dRec.Right = 125
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>Phonorarios]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 27
          dRec.Top = 1
          dRec.Right = 44
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>Potros]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 45
          dRec.Top = 1
          dRec.Right = 60
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailFooterBand1: TprTxHDetailFooterBand
        Height = 2
        UseVerticalBands = False
        DetailBand = Rcostas.prTxHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTALES:')
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
          dRec.Right = 10
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>PCostas]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 0
          dRec.Right = 26
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailHeaderBand2: TprTxHDetailHeaderBand
        Height = 3
        UseVerticalBands = False
        DetailBand = Rcostas.prTxHDetailBand2
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'RELACION DE COSTAS CARGADAS')
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
          dRec.Right = 28
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
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
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 10
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR COSTAS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 1
          dRec.Right = 26
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR HONORARIOS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 27
          dRec.Top = 1
          dRec.Right = 44
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR OTROS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 45
          dRec.Top = 1
          dRec.Right = 60
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DESCRIPCION')
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
          dRec.Top = 1
          dRec.Right = 91
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailBand2: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'CDcargada'
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand2'
          'prTxHDetailFooterBand2')
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<d>CDcargada.fecha]')
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
          dRec.Right = 10
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>CDcargada.valor_costa]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 0
          dRec.Right = 26
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>CDcargada.valor_honorario]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 27
          dRec.Top = 0
          dRec.Right = 44
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>CDcargada.valor_otro]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 45
          dRec.Top = 0
          dRec.Right = 60
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDcargada.descripcion]')
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
          dRec.Right = 125
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand2: TprTxHDetailFooterBand
        Height = 1
        UseVerticalBands = False
        DetailBand = Rcostas.prTxHDetailBand2
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTALES:')
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
          dRec.Right = 10
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>CCostas]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 0
          dRec.Right = 26
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>Chonorarios]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 27
          dRec.Top = 0
          dRec.Right = 44
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj34: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0>Cotros]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 45
          dRec.Top = 0
          dRec.Right = 60
          dRec.Bottom = 1
          Visible = False
        end
      end
    end
  end
  object CDcostas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 192
    Data = {
      8F0000009619E0BD0100000018000000040000000000030000008F0006646562
      69746F080004000000010007535542545950450200490006004D6F6E65790007
      6372656469746F080004000000010007535542545950450200490006004D6F6E
      6579000B6465736372697063696F6E0200490000000100055749445448020002
      00FF0005666563686104000600000000000000}
    object CDcostasdebito: TCurrencyField
      FieldName = 'debito'
    end
    object CDcostascredito: TCurrencyField
      FieldName = 'credito'
    end
    object CDcostasdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 255
    end
    object CDcostasfecha: TDateField
      FieldName = 'fecha'
    end
  end
  object CDhonorarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 192
    Data = {
      8F0000009619E0BD0100000018000000040000000000030000008F0006646562
      69746F080004000000010007535542545950450200490006004D6F6E65790007
      6372656469746F080004000000010007535542545950450200490006004D6F6E
      6579000B6465736372697063696F6E0200490000000100055749445448020002
      00FF0005666563686104000600000000000000}
    object CDhonorariosdebito: TCurrencyField
      FieldName = 'debito'
    end
    object CDhonorarioscredito: TCurrencyField
      FieldName = 'credito'
    end
    object CDhonorariosdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 255
    end
    object CDhonorariosfecha: TDateField
      FieldName = 'fecha'
    end
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDcostas
    Left = 264
    Top = 184
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = CDhonorarios
    Left = 216
    Top = 192
  end
  object IBcarta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 176
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 208
  end
  object IBTControlCobro: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 256
  end
  object RepCobro: TprTxReport
    FromPage = 1
    ToPage = 1
    Title = 'GESTION DE COBRO'
    Values = <>
    Variables = <
      item
        Name = 'EMPRESA'
        ValueType = 'prvvtString'
        Value = 'CREDISERVIR LTDA'
      end
      item
        Name = 'NIT'
        ValueType = 'prvvtString'
        Value = '890.505.363-6'
      end
      item
        Name = 'ASOCIADO'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'IDENTIFICACION'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'EMPLEADO'
        ValueType = 'prvvtString'
        Value = ''
      end>
    PrinterName = 'EPSON FX-1180+ ESC/P'
    ESCModelName = 'Epson printers'
    WrapAfterColumn = 0
    FromLine = 1
    ToLine = 1
    Left = 170
    Top = 412
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 3'
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
      ColNum = 132
      object prTxHPageHeaderBand1: TprTxHPageHeaderBand
        Height = 4
        UseVerticalBands = False
        PrintOnFirstPage = True
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[EMPRESA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold)
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 19
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INFORME DE GESTION DE COBRO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 0
          dRec.Right = 111
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>StartDateTime]')
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
          dRec.Right = 130
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[NIT]')
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
          dRec.Right = 19
          dRec.Bottom = 2
          Visible = False
        end
        object prTxHLineObj4: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 0
          dRec.Top = 3
          dRec.Right = 130
          dRec.Bottom = 4
          Visible = False
        end
        object prTxCommandObj1: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcCondensedOff)
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 1
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Colocacion No. [IBDataset1.ID_COLOCACION]')
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
          dRec.Right = 40
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Nit/CC : [IDENTIFICACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 41
          dRec.Top = 2
          dRec.Right = 64
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Asociado : [ASOCIADO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 65
          dRec.Top = 2
          dRec.Right = 130
          dRec.Bottom = 3
          Visible = False
        end
        object prTxVLineObj5: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 40
          dRec.Top = 2
          dRec.Right = 41
          dRec.Bottom = 3
          Visible = False
        end
        object prTxVLineObj6: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 64
          dRec.Top = 2
          dRec.Right = 65
          dRec.Bottom = 3
          Visible = False
        end
      end
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 2
        UseVerticalBands = False
        DetailBand = RepCobro.prTxHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prTxHLineObj1: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 130
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj1: TprTxMemoObj
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
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 10
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA COMPROMISO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 114
          dRec.Top = 0
          dRec.Right = 130
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'OBSERVACION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 0
          dRec.Right = 113
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj1: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 10
          dRec.Top = 0
          dRec.Right = 11
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj2: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 113
          dRec.Top = 0
          dRec.Right = 114
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBDataSet1'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand1')
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBDataset1.FECHA_OBSERVACION]')
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
          dRec.Right = 10
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBDataset1.OBSERVACION]')
              DeleteEmptyLinesAtEnd = True
              DeleteEmptyLines = True
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 0
          dRec.Right = 113
          dRec.Bottom = 1
          dRec.HeightAsHorizontalBand = True
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBDataset1.FECHA_COMPROMISO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 114
          dRec.Top = 0
          dRec.Right = 130
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj3: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 10
          dRec.Top = 0
          dRec.Right = 11
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj4: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 113
          dRec.Top = 0
          dRec.Right = 114
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHPageFooterBand1: TprTxHPageFooterBand
        Height = 1
        UseVerticalBands = False
        PrintOnFirstPage = False
        PrintOnLastPage = True
        PrintAfterLastBandOnPage = False
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'EMPLEADO : [EMPLEADO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 60
          dRec.Bottom = 1
          Visible = False
        end
      end
    end
  end
  object frReport2: TfrReport
    Dataset = frDBDataSet3
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport2GetValue
    Left = 232
    Top = 408
    ReportForm = {19000000}
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = IBDataSet1
    Left = 320
    Top = 424
  end
  object CdCarta: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_COLOCACION'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'FECHA'
        DataType = ftDate
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DIRECCION'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DIAS'
        DataType = ftInteger
      end
      item
        Name = 'MUNICIPIO'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 392
    Top = 184
    Data = {
      C70000009619E0BD010000001800000007000000000003000000C7000D49445F
      434F4C4F434143494F4E0100490000000100055749445448020002000B000546
      454348410400060000000000064E4F4D42524502004900000001000557494454
      4802000200FF0009444952454343494F4E020049000000010005574944544802
      000200FF00045449504F0100490000000100055749445448020002000A000444
      4941530400010000000000094D554E49434950494F0200490000000100055749
      44544802000200FF000000}
    object CdCartaID_COLOCACION: TStringField
      FieldName = 'ID_COLOCACION'
      Size = 11
    end
    object CdCartaFECHA: TDateField
      FieldName = 'FECHA'
    end
    object CdCartaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 255
    end
    object CdCartaDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Size = 255
    end
    object CdCartaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object CdCartaDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object CdCartaMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 255
    end
  end
  object JvProgreso: TJvProgressDlg
    Text = 'Progress'
    Left = 200
    Top = 96
  end
  object IBDatoCodeudor: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'SELECT '
      
        '  "gen$direccion".DIRECCION || '#39' Barrio '#39' || "gen$direccion".BAR' +
        'RIO AS BARRIO,'
      '  "gen$direccion".MUNICIPIO,'
      
        '  "gen$persona".NOMBRE || '#39' '#39' || "gen$persona".PRIMER_APELLIDO |' +
        '| '#39' '#39' || "gen$persona".SEGUNDO_APELLIDO AS NOMBRE'
      'FROM'
      '  "gen$direccion"'
      
        '  INNER JOIN "gen$persona" ON ("gen$direccion".ID_IDENTIFICACION' +
        ' = "gen$persona".ID_IDENTIFICACION)'
      '  AND ("gen$direccion".ID_PERSONA = "gen$persona".ID_PERSONA)'
      'WHERE'
      '  "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND '
      '  "gen$direccion".ID_PERSONA = :ID_PERSONA AND '
      '  "gen$direccion".ID_DIRECCION = 1')
    Transaction = IBTControlCobro
    Left = 728
    Top = 280
  end
  object IbDireccion: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'SELECT '
      
        '  "gen$direccion".DIRECCION || '#39' Barrio '#39' || "gen$direccion".BAR' +
        'RIO as BARRIO,'
      '  "gen$direccion".MUNICIPIO'
      'FROM'
      '  "gen$direccion"'
      'WHERE'
      '  "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND '
      '  "gen$direccion".ID_PERSONA = :ID_PERSONA AND '
      '  "gen$direccion".ID_DIRECCION = 1')
    Transaction = IBTControlCobro
    Left = 736
    Top = 352
  end
end
