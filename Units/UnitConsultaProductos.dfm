object frmConsultaProductos: TfrmConsultaProductos
  Left = 391
  Top = 111
  ActiveControl = PageBuscar
  BorderStyle = bsDialog
  Caption = 'Productos de un Asociado'
  ClientHeight = 506
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object EnterAsTab: TJvEnterAsTab
    Left = 576
    Top = 62
    Width = 28
    Height = 28
  end
  object Panel3: TPanel
    Left = 0
    Top = 448
    Width = 673
    Height = 58
    Align = alBottom
    TabOrder = 2
    object Label5: TLabel
      Left = 2
      Top = 6
      Width = 89
      Height = 13
      Caption = 'Total Aportaciones'
    end
    object Label6: TLabel
      Left = 2
      Top = 30
      Width = 86
      Height = 13
      Caption = 'Total Captaciones'
    end
    object Label7: TLabel
      Left = 246
      Top = 6
      Width = 91
      Height = 13
      Caption = 'Total Colocaciones'
    end
    object Label8: TLabel
      Left = 246
      Top = 30
      Width = 63
      Height = 13
      Caption = 'Total Fianzas'
    end
    object EdTotalAportaciones: TJvStaticText
      Left = 98
      Top = 2
      Width = 129
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taRightJustify
      AutoSize = False
      BevelOuter = bvRaised
      BorderStyle = sbsSunken
      Caption = '0.00'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
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
      TabOrder = 0
      WordWrap = False
    end
    object EdTotalCaptaciones: TJvStaticText
      Left = 98
      Top = 26
      Width = 129
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taRightJustify
      AutoSize = False
      BevelOuter = bvRaised
      BorderStyle = sbsSunken
      Caption = '0.00'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
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
    object EdTotalColocaciones: TJvStaticText
      Left = 342
      Top = 2
      Width = 129
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taRightJustify
      AutoSize = False
      BevelOuter = bvRaised
      BorderStyle = sbsSunken
      Caption = '0.00'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
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
      TabOrder = 2
      WordWrap = False
    end
    object EdTotalFianzas: TJvStaticText
      Left = 342
      Top = 26
      Width = 129
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taRightJustify
      AutoSize = False
      BevelOuter = bvRaised
      BorderStyle = sbsSunken
      Caption = '0.00'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
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
      TabOrder = 3
      WordWrap = False
    end
    object Panel4: TPanel
      Left = 591
      Top = 1
      Width = 81
      Height = 56
      Align = alRight
      Color = clOlive
      TabOrder = 4
      object CmdCerrar: TBitBtn
        Left = 4
        Top = 28
        Width = 75
        Height = 25
        Caption = '&Cerrar'
        ModalResult = 2
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
      object CmdOtro: TBitBtn
        Left = 4
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Otro'
        TabOrder = 1
        OnClick = CmdOtroClick
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 85
    Align = alTop
    TabOrder = 0
    object JvGroupBox1: TJvGroupBox
      Left = 2
      Top = 2
      Width = 613
      Height = 81
      Caption = 'Buscar Por:'
      TabOrder = 0
      object cmdBuscar: TJvBlinkingLabel
        Left = 348
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
        OnClick = CmdBuscarClick
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
        Width = 609
        Height = 64
        ActivePage = Tab1
        Align = alClient
        Style = tsFlatButtons
        TabIndex = 0
        TabOrder = 0
        object Tab1: TTabSheet
          Caption = 'Documento'
          OnShow = Tab1Show
          object Label1: TLabel
            Left = 8
            Top = 10
            Width = 86
            Height = 14
            Caption = 'Tipo Identificaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 296
            Top = 10
            Width = 103
            Height = 14
            Caption = 'N'#250'mero Identificaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object CBtiposid: TDBLookupComboBox
            Left = 104
            Top = 4
            Width = 185
            Height = 21
            Color = clWhite
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
            Left = 402
            Top = 3
            Width = 119
            Height = 22
            Alignment = taRightJustify
            Color = clWhite
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
            OnKeyPress = EdNumeroIdentificacionKeyPress
          end
          object CmdActualizar1: TBitBtn
            Left = 524
            Top = 0
            Width = 75
            Height = 25
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
          Caption = 'Cap&taci'#243'n'
          ImageIndex = 1
          OnShow = Tab2Show
          object Label3: TLabel
            Left = 320
            Top = 10
            Width = 114
            Height = 13
            Caption = 'N'#250'mero de la Captaci'#243'n'
          end
          object Label4: TLabel
            Left = 6
            Top = 10
            Width = 87
            Height = 13
            Caption = 'Tipo de Captaci'#243'n'
          end
          object EdCaptacion: TJvEdit
            Left = 440
            Top = 8
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
            Color = clWhite
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
            OnKeyPress = EdCaptacionKeyPress
          end
          object CBTiposCaptacion: TDBLookupComboBox
            Left = 100
            Top = 6
            Width = 219
            Height = 21
            Color = clWhite
            KeyField = 'ID_TIPO_CAPTACION'
            ListField = 'DESCRIPCION'
            ListSource = DSTiposCaptacion
            TabOrder = 0
          end
          object CmdActualizar2: TBitBtn
            Left = 524
            Top = 2
            Width = 75
            Height = 25
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
          OnShow = Tab3Show
          object Label18: TLabel
            Left = 6
            Top = 8
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
            Top = 6
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
            Color = clWhite
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
            OnKeyPress = EdColocacionKeyPress
          end
          object CmdActualizar3: TBitBtn
            Left = 524
            Top = 2
            Width = 75
            Height = 25
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
        Left = 228
        Top = 20
        Width = 379
        Height = 22
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 673
    Height = 363
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object PanelTree: TPanel
      Left = 1
      Top = 1
      Width = 280
      Height = 361
      Align = alLeft
      Caption = 'Aqu'#237' los Productos del Asociado'
      TabOrder = 0
      object Arbol: TJvTreeView
        Left = 1
        Top = 1
        Width = 278
        Height = 359
        Align = alClient
        Images = ImageTree
        Indent = 19
        PopupMenu = PMenu1
        ReadOnly = True
        TabOrder = 0
        OnChange = ArbolChange
      end
    end
    object splitter: TJvxSplitter
      Left = 281
      Top = 1
      Width = 3
      Height = 361
      ControlFirst = PanelTree
      ControlSecond = PanelDatos
      Align = alLeft
      Ctl3D = True
      OnMouseMove = splitterMouseMove
    end
    object PanelDatos: TPanel
      Left = 289
      Top = 1
      Width = 383
      Height = 361
      Align = alRight
      Caption = 'Vera aqu'#237' la Informaci'#243'n del Asociado'
      Color = clBtnHighlight
      TabOrder = 2
      object PageControl: TJvPageControl
        Left = 1
        Top = 1
        Width = 381
        Height = 359
        ActivePage = Hoja0
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        Color = clBtnFace
        object Hoja1: TTabSheet
          Caption = 'Aportaciones'
          TabVisible = False
          object PageControl1: TPageControl
            Left = 0
            Top = 0
            Width = 373
            Height = 349
            ActivePage = TabAportes
            Align = alClient
            TabOrder = 0
            object TabAportes: TTabSheet
              TabVisible = False
              object Panel5: TPanel
                Left = 0
                Top = 0
                Width = 365
                Height = 338
                Align = alClient
                Caption = 'Panel5'
                TabOrder = 0
                object Panel6: TPanel
                  Left = 1
                  Top = 1
                  Width = 363
                  Height = 68
                  Align = alTop
                  TabOrder = 0
                  object Label9: TLabel
                    Left = 16
                    Top = -1
                    Width = 96
                    Height = 13
                    Caption = 'Saldo Inicial del A'#241'o'
                  end
                  object Label10: TLabel
                    Left = 156
                    Top = -1
                    Width = 80
                    Height = 13
                    Caption = 'Saldo a la Fecha'
                  end
                  object Label11: TLabel
                    Left = 270
                    Top = -1
                    Width = 66
                    Height = 13
                    Caption = 'Estado Actual'
                  end
                  object Label83: TLabel
                    Left = 7
                    Top = 43
                    Width = 73
                    Height = 13
                    Caption = 'Fecha Apertura'
                  end
                  object EdSaldoIAporte: TJvStaticText
                    Left = 2
                    Top = 13
                    Width = 127
                    Height = 21
                    TextMargins.X = 5
                    TextMargins.Y = 0
                    Alignment = taRightJustify
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Caption = '0.00'
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 0
                    WordWrap = False
                  end
                  object EdSaldoAporte: TJvStaticText
                    Left = 132
                    Top = 13
                    Width = 127
                    Height = 21
                    TextMargins.X = 5
                    TextMargins.Y = 0
                    Alignment = taRightJustify
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Caption = '0.00'
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                  object EdEstadoAporte: TJvStaticText
                    Left = 262
                    Top = 13
                    Width = 83
                    Height = 21
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    Alignment = taCenter
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 2
                    WordWrap = False
                  end
                  object EdFechaAperturaApo: TJvStaticText
                    Left = 88
                    Top = 38
                    Width = 101
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    Alignment = taCenter
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 3
                    WordWrap = False
                  end
                end
                object Panel9: TPanel
                  Left = 1
                  Top = 69
                  Width = 363
                  Height = 268
                  Align = alClient
                  TabOrder = 1
                  object GridSaldosMes: TXStringGrid
                    Left = 1
                    Top = 1
                    Width = 361
                    Height = 266
                    Align = alClient
                    ColCount = 4
                    DefaultRowHeight = 17
                    RowCount = 13
                    TabOrder = 0
                    FixedLineColor = clBlack
                    Columns = <
                      item
                        HeaderFont.Charset = DEFAULT_CHARSET
                        HeaderFont.Color = clBlack
                        HeaderFont.Height = -11
                        HeaderFont.Name = 'MS Sans Serif'
                        HeaderFont.Style = [fsBold]
                        HeaderAlignment = taCenter
                        Caption = 'MES'
                        Width = 70
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
                        Caption = 'DEBITO'
                        Width = 90
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
                        Caption = 'CREDITO'
                        Width = 90
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
                        Caption = 'SALDO'
                        Width = 90
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
                      70
                      90
                      90
                      90)
                  end
                end
              end
            end
          end
        end
        object Hoja2: TTabSheet
          Caption = 'Captaciones'
          ImageIndex = 1
          TabVisible = False
          object PageControlCaptacion: TJvPageControl
            Left = 0
            Top = 0
            Width = 373
            Height = 349
            ActivePage = TabContractual
            Align = alClient
            TabOrder = 0
            object TabAlaVista: TTabSheet
              Caption = 'A la Vista'
              TabVisible = False
              object Panel7: TPanel
                Left = 0
                Top = 0
                Width = 365
                Height = 79
                Align = alTop
                TabOrder = 0
                object Label12: TLabel
                  Left = 18
                  Top = 4
                  Width = 96
                  Height = 13
                  Caption = 'Saldo Inicial del A'#241'o'
                end
                object Label13: TLabel
                  Left = 158
                  Top = 4
                  Width = 80
                  Height = 13
                  Caption = 'Saldo a la Fecha'
                end
                object Label14: TLabel
                  Left = 276
                  Top = 4
                  Width = 66
                  Height = 13
                  Caption = 'Estado Actual'
                end
                object Label21: TLabel
                  Left = 10
                  Top = 42
                  Width = 73
                  Height = 13
                  Caption = 'Fecha Apertura'
                end
                object Label79: TLabel
                  Left = 180
                  Top = 42
                  Width = 68
                  Height = 13
                  Caption = 'Otros Titulares'
                end
                object EdSaldoIAno: TJvStaticText
                  Left = 2
                  Top = 18
                  Width = 127
                  Height = 21
                  TextMargins.X = 5
                  TextMargins.Y = 0
                  Alignment = taRightJustify
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Caption = '0.00'
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 0
                  WordWrap = False
                end
                object EdSaldoActual: TJvStaticText
                  Left = 130
                  Top = 18
                  Width = 127
                  Height = 21
                  TextMargins.X = 5
                  TextMargins.Y = 0
                  Alignment = taRightJustify
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Caption = '0.00'
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                object EdEstadoCaptacion: TJvStaticText
                  Left = 258
                  Top = 18
                  Width = 89
                  Height = 21
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 2
                  WordWrap = False
                end
                object EdFechaAperturaCaptacion: TJvStaticText
                  Left = 3
                  Top = 56
                  Width = 89
                  Height = 21
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 3
                  WordWrap = False
                end
                object CBOtrosTitulares: TComboBox
                  Left = 96
                  Top = 56
                  Width = 249
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 4
                end
              end
              object Panel8: TPanel
                Left = 0
                Top = 79
                Width = 365
                Height = 260
                Align = alClient
                TabOrder = 1
                object GridCaptaciones1: TXStringGrid
                  Left = 1
                  Top = 1
                  Width = 363
                  Height = 166
                  Align = alClient
                  ColCount = 4
                  DefaultRowHeight = 16
                  RowCount = 13
                  TabOrder = 0
                  FixedLineColor = clBlack
                  Columns = <
                    item
                      HeaderFont.Charset = DEFAULT_CHARSET
                      HeaderFont.Color = clBlack
                      HeaderFont.Height = -11
                      HeaderFont.Name = 'MS Sans Serif'
                      HeaderFont.Style = [fsBold]
                      HeaderAlignment = taCenter
                      Caption = 'MES'
                      Width = 70
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
                      Caption = 'DEBITO'
                      Width = 90
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
                      Caption = 'CREDITO'
                      Width = 90
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
                      Caption = 'SALDO'
                      Width = 90
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
                    70
                    90
                    90
                    90)
                  RowHeights = (
                    16
                    16
                    16
                    16
                    16
                    16
                    16
                    16
                    16
                    16
                    16
                    16
                    16)
                end
              end
            end
            object TabContractual: TTabSheet
              Caption = 'Contractual'
              ImageIndex = 1
              TabVisible = False
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 365
                Height = 333
                Align = alTop
                TabOrder = 0
                object Panel11: TPanel
                  Left = 1
                  Top = 1
                  Width = 363
                  Height = 104
                  Align = alTop
                  TabOrder = 0
                  object Label15: TLabel
                    Left = 2
                    Top = 6
                    Width = 21
                    Height = 13
                    Caption = 'Plan'
                  end
                  object Label17: TLabel
                    Left = 177
                    Top = 32
                    Width = 71
                    Height = 13
                    Caption = 'Pr'#243'ximo Abono'
                  end
                  object Label19: TLabel
                    Left = 2
                    Top = 54
                    Width = 28
                    Height = 13
                    Caption = 'Cuota'
                  end
                  object Label20: TLabel
                    Left = 177
                    Top = 6
                    Width = 36
                    Height = 13
                    Caption = 'Estado '
                  end
                  object Label22: TLabel
                    Left = 2
                    Top = 32
                    Width = 40
                    Height = 13
                    Caption = 'Apertura'
                  end
                  object Label76: TLabel
                    Left = 2
                    Top = 78
                    Width = 72
                    Height = 13
                    Caption = 'Saldo I del A'#241'o'
                  end
                  object Label77: TLabel
                    Left = 177
                    Top = 76
                    Width = 80
                    Height = 13
                    Caption = 'Saldo a la Fecha'
                  end
                  object Label103: TLabel
                    Left = 177
                    Top = 54
                    Width = 44
                    Height = 13
                    Caption = 'Incentivo'
                  end
                  object EdProximoAbonoContractual: TJvStaticText
                    Left = 257
                    Top = 26
                    Width = 102
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    Alignment = taCenter
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 0
                    WordWrap = False
                  end
                  object EdCuotaContractual: TJvStaticText
                    Left = 74
                    Top = 50
                    Width = 102
                    Height = 22
                    TextMargins.X = 5
                    TextMargins.Y = 0
                    Alignment = taRightJustify
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Caption = '0.00'
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                  object EdFechaAperturaContractual: TJvStaticText
                    Left = 74
                    Top = 26
                    Width = 102
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    Alignment = taCenter
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 2
                    WordWrap = False
                  end
                  object EdSaldoIContractual: TJvStaticText
                    Left = 74
                    Top = 74
                    Width = 102
                    Height = 21
                    TextMargins.X = 5
                    TextMargins.Y = 0
                    Alignment = taRightJustify
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Caption = '0.00'
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 3
                    WordWrap = False
                  end
                  object EdSaldoAContractual: TJvStaticText
                    Left = 258
                    Top = 74
                    Width = 102
                    Height = 21
                    TextMargins.X = 5
                    TextMargins.Y = 0
                    Alignment = taRightJustify
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Caption = '0.00'
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 4
                    WordWrap = False
                  end
                  object EdIncentivo: TJvStaticText
                    Left = 257
                    Top = 50
                    Width = 102
                    Height = 22
                    TextMargins.X = 5
                    TextMargins.Y = 0
                    Alignment = taRightJustify
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Caption = '0.00'
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 5
                    WordWrap = False
                  end
                  object EdEstadoContractual: TJvStaticText
                    Left = 257
                    Top = 2
                    Width = 102
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    Alignment = taCenter
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 6
                    WordWrap = False
                  end
                  object EdPlanContractual: TJvStaticText
                    Left = 74
                    Top = 2
                    Width = 102
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    Alignment = taCenter
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clCaptionText
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 7
                    WordWrap = False
                  end
                end
                object Panel12: TPanel
                  Left = 1
                  Top = 105
                  Width = 363
                  Height = 227
                  Align = alClient
                  Caption = 'Panel12'
                  TabOrder = 1
                  object GridCaptaciones2: TXStringGrid
                    Left = 1
                    Top = 1
                    Width = 361
                    Height = 225
                    Align = alClient
                    ColCount = 4
                    DefaultRowHeight = 16
                    RowCount = 13
                    TabOrder = 0
                    FixedLineColor = clBlack
                    Columns = <
                      item
                        HeaderFont.Charset = DEFAULT_CHARSET
                        HeaderFont.Color = clBlack
                        HeaderFont.Height = -11
                        HeaderFont.Name = 'MS Sans Serif'
                        HeaderFont.Style = [fsBold]
                        HeaderAlignment = taCenter
                        Caption = 'MES'
                        Width = 70
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
                        Caption = 'DEBITO'
                        Width = 90
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
                        Caption = 'CREDITO'
                        Width = 90
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
                        Caption = 'SALDO'
                        Width = 90
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
                      70
                      90
                      90
                      90)
                  end
                end
              end
            end
            object TabCertificados: TTabSheet
              Caption = 'Certificados'
              ImageIndex = 2
              TabVisible = False
              object Label16: TLabel
                Left = 90
                Top = 22
                Width = 36
                Height = 13
                Caption = 'CDATS'
              end
              object Panel13: TPanel
                Left = 0
                Top = 0
                Width = 365
                Height = 117
                Align = alTop
                TabOrder = 0
                object Label23: TLabel
                  Left = 12
                  Top = 4
                  Width = 73
                  Height = 13
                  Caption = 'Fecha Apertura'
                end
                object Label24: TLabel
                  Left = 112
                  Top = 4
                  Width = 26
                  Height = 13
                  Caption = 'Plazo'
                end
                object Label25: TLabel
                  Left = 224
                  Top = 4
                  Width = 24
                  Height = 13
                  Caption = 'Tasa'
                end
                object Label26: TLabel
                  Left = 272
                  Top = 4
                  Width = 40
                  Height = 13
                  Caption = 'Amortiza'
                end
                object Label27: TLabel
                  Left = 156
                  Top = 4
                  Width = 48
                  Height = 13
                  Caption = 'Tipo Tasa'
                end
                object Label28: TLabel
                  Left = 4
                  Top = 42
                  Width = 91
                  Height = 13
                  Caption = 'Fecha Vencimiento'
                end
                object Label29: TLabel
                  Left = 102
                  Top = 42
                  Width = 90
                  Height = 13
                  Caption = 'Fecha Ultimo Pago'
                end
                object Label30: TLabel
                  Left = 224
                  Top = 42
                  Width = 33
                  Height = 13
                  Caption = 'Estado'
                end
                object Label78: TLabel
                  Left = 195
                  Top = 77
                  Width = 54
                  Height = 13
                  Caption = 'Valor Inicial'
                end
                object Label80: TLabel
                  Left = 11
                  Top = 78
                  Width = 73
                  Height = 13
                  Caption = 'Fecha Prorroga'
                end
                object Label81: TLabel
                  Left = 100
                  Top = 77
                  Width = 89
                  Height = 13
                  Caption = 'Fecha Venc Prorro'
                end
                object EdFechaAperturaCertificado: TJvStaticText
                  Left = 3
                  Top = 18
                  Width = 94
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 0
                  WordWrap = False
                end
                object EdPlazoCertificado: TJvStaticText
                  Left = 99
                  Top = 18
                  Width = 54
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                object EdTasaCertificado: TJvStaticText
                  Left = 211
                  Top = 18
                  Width = 54
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 2
                  WordWrap = False
                end
                object EdAmortizaCertificado: TJvStaticText
                  Left = 267
                  Top = 18
                  Width = 54
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 3
                  WordWrap = False
                end
                object EdTipoTasaCertificado: TJvStaticText
                  Left = 155
                  Top = 18
                  Width = 54
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 4
                  WordWrap = False
                end
                object EdFechaVencimientoCertificado: TJvStaticText
                  Left = 3
                  Top = 56
                  Width = 94
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 5
                  WordWrap = False
                end
                object EdFechaUltimoPagoCertificado: TJvStaticText
                  Left = 99
                  Top = 56
                  Width = 94
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 6
                  WordWrap = False
                end
                object EdEstadoCertificado: TJvStaticText
                  Left = 195
                  Top = 56
                  Width = 94
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 7
                  WordWrap = False
                end
                object EdValorInicial: TJvStaticText
                  Left = 194
                  Top = 91
                  Width = 114
                  Height = 22
                  TextMargins.X = 5
                  TextMargins.Y = 0
                  Alignment = taRightJustify
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Caption = '$0.00'
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 8
                  WordWrap = False
                end
                object EdFechaProrrogaCer: TJvStaticText
                  Left = 2
                  Top = 92
                  Width = 94
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 9
                  WordWrap = False
                end
                object EdFechaVProrrogaCer: TJvStaticText
                  Left = 99
                  Top = 91
                  Width = 94
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clCaptionText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 10
                  WordWrap = False
                end
              end
              object Panel14: TPanel
                Left = 0
                Top = 117
                Width = 365
                Height = 130
                Align = alClient
                Caption = 'Panel14'
                TabOrder = 1
                object GridCertificados: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 363
                  Height = 128
                  Align = alClient
                  DataSource = DSTablaLiquidacion
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clBlack
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  Columns = <
                    item
                      ButtonStyle = cbsNone
                      Expanded = False
                      FieldName = 'FECHA_PAGO'
                      Title.Alignment = taCenter
                      Title.Caption = 'FECHA PAGO'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 80
                      Visible = True
                    end
                    item
                      ButtonStyle = cbsNone
                      Expanded = False
                      FieldName = 'VALOR'
                      Title.Alignment = taCenter
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      ButtonStyle = cbsNone
                      Expanded = False
                      FieldName = 'PAGADO'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Visible = True
                    end>
                end
              end
            end
          end
        end
        object Hoja3: TTabSheet
          Caption = 'Colocaciones'
          ImageIndex = 2
          TabVisible = False
          object Panel15: TPanel
            Left = 0
            Top = 0
            Width = 373
            Height = 348
            Align = alClient
            Caption = 'Panel15'
            TabOrder = 0
            object Panel16: TPanel
              Left = 1
              Top = 1
              Width = 371
              Height = 157
              Align = alTop
              TabOrder = 0
              object Label31: TLabel
                Left = 11
                Top = 4
                Width = 59
                Height = 13
                Caption = 'Clasificaci'#243'n'
              end
              object Label32: TLabel
                Left = 169
                Top = 4
                Width = 45
                Height = 13
                Caption = 'Categoria'
              end
              object Label33: TLabel
                Left = 249
                Top = 4
                Width = 54
                Height = 13
                Caption = 'Calificaci'#243'n'
              end
              object Label34: TLabel
                Left = 11
                Top = 26
                Width = 26
                Height = 13
                Caption = 'Linea'
              end
              object Label35: TLabel
                Left = 181
                Top = 26
                Width = 43
                Height = 13
                Caption = 'Inversi'#243'n'
              end
              object Label36: TLabel
                Left = 11
                Top = 48
                Width = 56
                Height = 13
                Caption = 'Tipo Inter'#233's'
              end
              object Label37: TLabel
                Left = 167
                Top = 48
                Width = 52
                Height = 13
                Caption = 'Tasa Efec.'
              end
              object Label38: TLabel
                Left = 291
                Top = 48
                Width = 26
                Height = 13
                Caption = 'Plazo'
              end
              object Label39: TLabel
                Left = 11
                Top = 70
                Width = 53
                Height = 13
                Caption = 'Amortiza K.'
              end
              object Label40: TLabel
                Left = 103
                Top = 70
                Width = 49
                Height = 13
                Caption = 'Amortiza I.'
              end
              object Label43: TLabel
                Left = 189
                Top = 70
                Width = 85
                Height = 13
                Caption = 'Fecha Prox. Pago'
              end
              object Label44: TLabel
                Left = 11
                Top = 136
                Width = 72
                Height = 13
                Caption = 'D'#237'as Mora Hoy'
              end
              object Label45: TLabel
                Left = 139
                Top = 136
                Width = 90
                Height = 13
                Caption = 'Valor Deuda a Hoy'
              end
              object Label41: TLabel
                Left = 11
                Top = 92
                Width = 40
                Height = 13
                Caption = 'Fecha K'
              end
              object Label42: TLabel
                Left = 133
                Top = 92
                Width = 36
                Height = 13
                Caption = 'Fecha I'
              end
              object Label100: TLabel
                Left = 252
                Top = 93
                Width = 63
                Height = 13
                Caption = 'Reciprocidad'
              end
              object Label101: TLabel
                Left = 11
                Top = 115
                Width = 55
                Height = 13
                Caption = 'Valor Cuota'
              end
              object Label102: TLabel
                Left = 201
                Top = 115
                Width = 27
                Height = 13
                Caption = 'Saldo'
              end
              object EdClasificacion: TJvStaticText
                Left = 70
                Top = 0
                Width = 94
                Height = 22
                TextMargins.X = 0
                TextMargins.Y = 0
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 0
                WordWrap = False
              end
              object EdCategoria: TJvStaticText
                Left = 224
                Top = 0
                Width = 22
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
              object EdEvaluacion: TJvStaticText
                Left = 304
                Top = 0
                Width = 22
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 2
                WordWrap = False
              end
              object EdLinea: TJvStaticText
                Left = 38
                Top = 22
                Width = 138
                Height = 22
                TextMargins.X = 0
                TextMargins.Y = 0
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 3
                WordWrap = False
              end
              object EdInversion: TJvStaticText
                Left = 228
                Top = 22
                Width = 132
                Height = 22
                TextMargins.X = 0
                TextMargins.Y = 0
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 4
                WordWrap = False
              end
              object EdTipoInteres: TJvStaticText
                Left = 69
                Top = 44
                Width = 57
                Height = 22
                TextMargins.X = 0
                TextMargins.Y = 0
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 5
                WordWrap = False
              end
              object EdTasaE: TJvStaticText
                Left = 227
                Top = 44
                Width = 61
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taRightJustify
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 6
                WordWrap = False
              end
              object EdInteresVariable: TJvStaticText
                Left = 127
                Top = 44
                Width = 37
                Height = 22
                TextMargins.X = 0
                TextMargins.Y = 0
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 7
                WordWrap = False
              end
              object EdPlazoColocacion: TJvStaticText
                Left = 319
                Top = 44
                Width = 41
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taRightJustify
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 8
                WordWrap = False
              end
              object EdAmortizaK: TJvStaticText
                Left = 69
                Top = 66
                Width = 33
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taRightJustify
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 9
                WordWrap = False
              end
              object EdAmortizaI: TJvStaticText
                Left = 155
                Top = 66
                Width = 33
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taRightJustify
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 10
                WordWrap = False
              end
              object EdProxPagoColocacion: TJvStaticText
                Left = 277
                Top = 66
                Width = 83
                Height = 22
                TextMargins.X = 0
                TextMargins.Y = 0
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 11
                WordWrap = False
              end
              object EdDiasMora: TJvStaticText
                Left = 87
                Top = 132
                Width = 47
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taRightJustify
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 12
                WordWrap = False
              end
              object EdValorDeuda: TJvStaticText
                Left = 233
                Top = 132
                Width = 127
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taRightJustify
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 13
                WordWrap = False
              end
              object EdFechaCapital: TJvStaticText
                Left = 53
                Top = 88
                Width = 79
                Height = 22
                TextMargins.X = 0
                TextMargins.Y = 0
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 14
                WordWrap = False
              end
              object EdFechaInteres: TJvStaticText
                Left = 170
                Top = 88
                Width = 79
                Height = 22
                TextMargins.X = 0
                TextMargins.Y = 0
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 15
                WordWrap = False
              end
              object EdReciprocidad: TJvStaticText
                Left = 319
                Top = 89
                Width = 41
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taRightJustify
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 16
                WordWrap = False
              end
              object EdValorCuota: TJvStaticText
                Left = 68
                Top = 111
                Width = 127
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taRightJustify
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 17
                WordWrap = False
              end
              object EdSaldo: TJvStaticText
                Left = 233
                Top = 111
                Width = 127
                Height = 22
                TextMargins.X = 5
                TextMargins.Y = 0
                Alignment = taRightJustify
                AutoSize = False
                BevelKind = bkSoft
                BevelOuter = bvSpace
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
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
                TabOrder = 18
                WordWrap = False
              end
            end
            object Panel17: TPanel
              Left = 1
              Top = 158
              Width = 371
              Height = 189
              Align = alClient
              Caption = 'Panel17'
              TabOrder = 1
              object GridColocacion: TDBGrid
                Left = 1
                Top = 1
                Width = 369
                Height = 187
                Align = alClient
                DataSource = DSTablaLiquidacionColocacion
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CUOTA_NUMERO'
                    Title.Alignment = taCenter
                    Title.Caption = 'CUOTA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 45
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'FECHA_A_PAGAR'
                    Title.Caption = 'FECHA CUOTA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CAPITAL_A_PAGAR'
                    Title.Alignment = taCenter
                    Title.Caption = 'A CAPITAL'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'INTERES_A_PAGAR'
                    Title.Alignment = taCenter
                    Title.Caption = 'A INTERES'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PAGADA'
                    Title.Alignment = taCenter
                    Title.Caption = 'P'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 15
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'FECHA_PAGADA'
                    Title.Caption = 'FECHA PAGO'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 90
                    Visible = True
                  end>
              end
            end
          end
        end
        object Hoja4: TTabSheet
          Caption = 'Fianzas'
          ImageIndex = 3
          TabVisible = False
          object Panel19: TPanel
            Left = 0
            Top = 0
            Width = 373
            Height = 180
            Align = alTop
            TabOrder = 0
            object Label46: TLabel
              Left = 13
              Top = 4
              Width = 59
              Height = 13
              Caption = 'Clasificaci'#243'n'
            end
            object Label47: TLabel
              Left = 171
              Top = 4
              Width = 47
              Height = 13
              Caption = 'Categor'#237'a'
            end
            object Label48: TLabel
              Left = 251
              Top = 4
              Width = 53
              Height = 13
              Caption = 'Evaluaci'#243'n'
            end
            object Label49: TLabel
              Left = 13
              Top = 26
              Width = 26
              Height = 13
              Caption = 'Linea'
            end
            object Label50: TLabel
              Left = 183
              Top = 26
              Width = 43
              Height = 13
              Caption = 'Inversi'#243'n'
            end
            object Label51: TLabel
              Left = 13
              Top = 48
              Width = 56
              Height = 13
              Caption = 'Tipo Inter'#233's'
            end
            object Label52: TLabel
              Left = 169
              Top = 48
              Width = 52
              Height = 13
              Caption = 'Tasa Efec.'
            end
            object Label53: TLabel
              Left = 293
              Top = 48
              Width = 26
              Height = 13
              Caption = 'Plazo'
            end
            object Label54: TLabel
              Left = 13
              Top = 70
              Width = 53
              Height = 13
              Caption = 'Amortiza K.'
            end
            object Label55: TLabel
              Left = 105
              Top = 70
              Width = 49
              Height = 13
              Caption = 'Amortiza I.'
            end
            object Label56: TLabel
              Left = 13
              Top = 92
              Width = 40
              Height = 13
              Caption = 'Fecha K'
            end
            object Label57: TLabel
              Left = 135
              Top = 92
              Width = 36
              Height = 13
              Caption = 'Fecha I'
            end
            object Label58: TLabel
              Left = 191
              Top = 70
              Width = 85
              Height = 13
              Caption = 'Fecha Prox. Pago'
            end
            object Label59: TLabel
              Left = 13
              Top = 136
              Width = 72
              Height = 13
              Caption = 'D'#237'as Mora Hoy'
            end
            object Label60: TLabel
              Left = 141
              Top = 136
              Width = 90
              Height = 13
              Caption = 'Valor Deuda a Hoy'
            end
            object Label61: TLabel
              Left = 13
              Top = 158
              Width = 35
              Height = 13
              Caption = 'Deudor'
            end
            object Label97: TLabel
              Left = 11
              Top = 115
              Width = 55
              Height = 13
              Caption = 'Valor Cuota'
            end
            object Label98: TLabel
              Left = 203
              Top = 115
              Width = 27
              Height = 13
              Caption = 'Saldo'
            end
            object Label99: TLabel
              Left = 254
              Top = 93
              Width = 63
              Height = 13
              Caption = 'Reciprocidad'
            end
            object EdClasificacionF: TJvStaticText
              Left = 72
              Top = 0
              Width = 94
              Height = 22
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 0
              WordWrap = False
            end
            object EdCategoriaF: TJvStaticText
              Left = 226
              Top = 0
              Width = 22
              Height = 22
              TextMargins.X = 5
              TextMargins.Y = 0
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
            object EdEvaluacionF: TJvStaticText
              Left = 306
              Top = 0
              Width = 22
              Height = 22
              TextMargins.X = 5
              TextMargins.Y = 0
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 2
              WordWrap = False
            end
            object EdLineaF: TJvStaticText
              Left = 40
              Top = 22
              Width = 138
              Height = 22
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 3
              WordWrap = False
            end
            object EdInversionF: TJvStaticText
              Left = 230
              Top = 22
              Width = 132
              Height = 22
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 4
              WordWrap = False
            end
            object EdTipoInteresF: TJvStaticText
              Left = 71
              Top = 44
              Width = 57
              Height = 22
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 5
              WordWrap = False
            end
            object EdTasaEF: TJvStaticText
              Left = 229
              Top = 44
              Width = 61
              Height = 22
              TextMargins.X = 5
              TextMargins.Y = 0
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 6
              WordWrap = False
            end
            object EdInteresVariableF: TJvStaticText
              Left = 129
              Top = 44
              Width = 37
              Height = 22
              TextMargins.X = 0
              TextMargins.Y = 0
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 7
              WordWrap = False
            end
            object EdPlazoColocacionF: TJvStaticText
              Left = 321
              Top = 44
              Width = 41
              Height = 22
              TextMargins.X = 5
              TextMargins.Y = 0
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 8
              WordWrap = False
            end
            object EdAmortizaKF: TJvStaticText
              Left = 71
              Top = 66
              Width = 33
              Height = 22
              TextMargins.X = 5
              TextMargins.Y = 0
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 9
              WordWrap = False
            end
            object EdAmortizaIF: TJvStaticText
              Left = 157
              Top = 66
              Width = 33
              Height = 22
              TextMargins.X = 5
              TextMargins.Y = 0
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 10
              WordWrap = False
            end
            object EdFechaCapitalF: TJvStaticText
              Left = 55
              Top = 88
              Width = 79
              Height = 22
              TextMargins.X = 0
              TextMargins.Y = 0
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 11
              WordWrap = False
            end
            object EdFechaInteresF: TJvStaticText
              Left = 172
              Top = 88
              Width = 79
              Height = 22
              TextMargins.X = 0
              TextMargins.Y = 0
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 12
              WordWrap = False
            end
            object EdProxPagoColocacionF: TJvStaticText
              Left = 279
              Top = 66
              Width = 83
              Height = 22
              TextMargins.X = 0
              TextMargins.Y = 0
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 13
              WordWrap = False
            end
            object EdDiasMoraF: TJvStaticText
              Left = 89
              Top = 132
              Width = 47
              Height = 22
              TextMargins.X = 0
              TextMargins.Y = 0
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 14
              WordWrap = False
            end
            object EdValorDeudaF: TJvStaticText
              Left = 235
              Top = 132
              Width = 127
              Height = 22
              TextMargins.X = 5
              TextMargins.Y = 0
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 15
              WordWrap = False
            end
            object EdDeudorF: TJvStaticText
              Left = 49
              Top = 154
              Width = 313
              Height = 22
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 16
              WordWrap = False
            end
            object EdValorCuotaF: TJvStaticText
              Left = 70
              Top = 111
              Width = 127
              Height = 22
              TextMargins.X = 5
              TextMargins.Y = 0
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 17
              WordWrap = False
            end
            object EdSaldoF: TJvStaticText
              Left = 235
              Top = 111
              Width = 127
              Height = 22
              TextMargins.X = 5
              TextMargins.Y = 0
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 18
              WordWrap = False
            end
            object EdReciprocidadF: TJvStaticText
              Left = 321
              Top = 89
              Width = 41
              Height = 22
              TextMargins.X = 5
              TextMargins.Y = 0
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkSoft
              BevelOuter = bvSpace
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
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
              TabOrder = 19
              WordWrap = False
            end
          end
          object Panel20: TPanel
            Left = 0
            Top = 180
            Width = 373
            Height = 168
            Align = alClient
            Caption = 'Panel17'
            TabOrder = 1
            object GridFianzas: TDBGrid
              Left = 1
              Top = 1
              Width = 371
              Height = 166
              Align = alClient
              DataSource = DSTablaLiquidacionColocacion
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CUOTA_NUMERO'
                  Title.Alignment = taCenter
                  Title.Caption = 'CUOTA'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 45
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'FECHA_A_PAGAR'
                  Title.Caption = 'FECHA CUOTA'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CAPITAL_A_PAGAR'
                  Title.Alignment = taCenter
                  Title.Caption = 'A CAPITAL'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INTERES_A_PAGAR'
                  Title.Alignment = taCenter
                  Title.Caption = 'A INTERES'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PAGADA'
                  Title.Alignment = taCenter
                  Title.Caption = 'P'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 15
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'FECHA_PAGADA'
                  Title.Caption = 'FECHA PAGO'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 90
                  Visible = True
                end>
            end
          end
        end
        object Hoja5: TTabSheet
          Caption = 'Observaciones'
          ImageIndex = 4
          TabVisible = False
          object Panel18: TPanel
            Left = 0
            Top = 0
            Width = 373
            Height = 348
            Align = alClient
            Caption = 'Observaciones'
            TabOrder = 0
            object GridObservaciones: TDBGrid
              Left = 1
              Top = 1
              Width = 354
              Height = 276
              DataSource = DSObservaciones
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnDrawColumnCell = GridObservacionesDrawColumnCell
              Columns = <
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Title.Alignment = taCenter
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBSERVACION'
                  Title.Alignment = taCenter
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SEMAFORO'
                  Title.Caption = '  '
                  Width = 16
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_EMPLEADO'
                  Title.Alignment = taCenter
                  Title.Caption = 'RESPONSABLE'
                  Width = 200
                  Visible = True
                end>
            end
            object Memo: TMemo
              Left = 2
              Top = 280
              Width = 347
              Height = 59
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
              WordWrap = False
            end
          end
        end
        object Hoja0: TTabSheet
          Caption = 'Hoja0'
          ImageIndex = 5
          TabVisible = False
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 373
            Height = 349
            ActivePage = TabSheet1
            Align = alClient
            TabIndex = 0
            TabOrder = 0
            object TabSheet1: TTabSheet
              Caption = 'Datos Personales'
              object PanelPersona: TPanel
                Left = 0
                Top = 0
                Width = 365
                Height = 321
                Align = alClient
                Caption = 'PanelPersona'
                Enabled = False
                TabOrder = 0
                object Label63: TLabel
                  Left = 284
                  Top = 3
                  Width = 24
                  Height = 13
                  Caption = 'Sexo'
                end
                object Label65: TLabel
                  Left = 2
                  Top = 39
                  Width = 86
                  Height = 13
                  Caption = 'Fecha Nacimiento'
                end
                object Label66: TLabel
                  Left = 233
                  Top = 75
                  Width = 51
                  Height = 13
                  Caption = 'Educaci'#243'n'
                end
                object Label62: TLabel
                  Left = 2
                  Top = 3
                  Width = 78
                  Height = 13
                  Caption = 'Tipo de Persona'
                end
                object Label64: TLabel
                  Left = 115
                  Top = 3
                  Width = 55
                  Height = 13
                  Caption = 'Estado Civil'
                end
                object Label67: TLabel
                  Left = 116
                  Top = 39
                  Width = 83
                  Height = 13
                  Caption = 'Lugar Nacimiento'
                end
                object Label68: TLabel
                  Left = 2
                  Top = 75
                  Width = 81
                  Height = 13
                  Caption = 'Tipo de Afiliaci'#243'n'
                end
                object Label69: TLabel
                  Left = 116
                  Top = 75
                  Width = 75
                  Height = 13
                  Caption = 'Fecha Afiliaci'#243'n'
                end
                object EdEstudio: TCheckBox
                  Left = 251
                  Top = 89
                  Width = 15
                  Height = 17
                  Color = clBtnFace
                  ParentColor = False
                  TabOrder = 0
                end
                object EdTipoPersona: TJvStaticText
                  Left = 1
                  Top = 16
                  Width = 110
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                object EdEstadoCivil: TJvStaticText
                  Left = 113
                  Top = 16
                  Width = 128
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 2
                  WordWrap = False
                end
                object EdSexo: TJvStaticText
                  Left = 242
                  Top = 16
                  Width = 107
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 3
                  WordWrap = False
                end
                object EdFechaNacimiento: TJvStaticText
                  Left = 1
                  Top = 52
                  Width = 110
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 4
                  WordWrap = False
                end
                object EdLugarNacimiento: TJvStaticText
                  Left = 115
                  Top = 52
                  Width = 238
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 5
                  WordWrap = False
                end
                object EdTipoAfiliacion: TJvStaticText
                  Left = 1
                  Top = 88
                  Width = 110
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 6
                  WordWrap = False
                end
                object EdFechaAfiliacion: TJvStaticText
                  Left = 115
                  Top = 88
                  Width = 110
                  Height = 22
                  TextMargins.X = 0
                  TextMargins.Y = 0
                  AutoSize = False
                  BevelKind = bkSoft
                  BevelOuter = bvSpace
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
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
                  TabOrder = 7
                  WordWrap = False
                end
                object GroupBox4: TGroupBox
                  Left = 2
                  Top = 110
                  Width = 351
                  Height = 155
                  Caption = 'Profesi'#243'n u Oficio'
                  Enabled = False
                  TabOrder = 8
                  object Label70: TLabel
                    Left = 235
                    Top = 50
                    Width = 83
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Fecha de Ingreso'
                  end
                  object Label71: TLabel
                    Left = 2
                    Top = 110
                    Width = 62
                    Height = 13
                    Caption = 'Total Activos'
                  end
                  object Label72: TLabel
                    Left = 2
                    Top = 132
                    Width = 64
                    Height = 13
                    Caption = 'Total Pasivos'
                  end
                  object Label73: TLabel
                    Left = 3
                    Top = 14
                    Width = 44
                    Height = 13
                    Caption = 'Profesi'#243'n'
                  end
                  object Label74: TLabel
                    Left = 187
                    Top = 14
                    Width = 41
                    Height = 13
                    Caption = 'Empresa'
                  end
                  object Label75: TLabel
                    Left = 3
                    Top = 50
                    Width = 28
                    Height = 13
                    Caption = 'Cargo'
                  end
                  object EdRetefuente: TCheckBox
                    Left = 2
                    Top = 88
                    Width = 169
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 'Aplica Retenci'#243'n en la Fuente'
                    Checked = True
                    State = cbChecked
                    TabOrder = 0
                  end
                  object EdProfesion: TJvStaticText
                    Left = 3
                    Top = 28
                    Width = 180
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                  object EdEmpresa: TJvStaticText
                    Left = 186
                    Top = 28
                    Width = 159
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 2
                    WordWrap = False
                  end
                  object EdCargo: TJvStaticText
                    Left = 3
                    Top = 64
                    Width = 226
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 3
                    WordWrap = False
                  end
                  object EdFechaIngreso: TJvStaticText
                    Left = 235
                    Top = 64
                    Width = 110
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 4
                    WordWrap = False
                  end
                  object EdTotalActivos: TJvStaticText
                    Left = 71
                    Top = 106
                    Width = 166
                    Height = 22
                    TextMargins.X = 5
                    TextMargins.Y = 0
                    Alignment = taRightJustify
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Caption = '$0.00'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 5
                    WordWrap = False
                  end
                  object EdTotalPasivos: TJvStaticText
                    Left = 71
                    Top = 130
                    Width = 166
                    Height = 22
                    TextMargins.X = 5
                    TextMargins.Y = 0
                    Alignment = taRightJustify
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Caption = '$0.00'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
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
                    TabOrder = 6
                    WordWrap = False
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 2
                  Top = 262
                  Width = 351
                  Height = 53
                  Caption = 'Informaci'#243'n Ultima Actualizaci'#243'n de Datos'
                  TabOrder = 9
                  object Label84: TLabel
                    Left = 7
                    Top = 12
                    Width = 47
                    Height = 13
                    Caption = 'Empleado'
                  end
                  object Label85: TLabel
                    Left = 273
                    Top = 12
                    Width = 30
                    Height = 13
                    Caption = 'Fecha'
                  end
                  object EDempleado_act: TJvStaticText
                    Left = 6
                    Top = 26
                    Width = 257
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clBlack
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'MS Sans Serif'
                    HotTrackFont.Style = []
                    Layout = tlCenter
                    ParentColor = False
                    ParentFont = False
                    TabOrder = 0
                    WordWrap = False
                  end
                  object EDfecha_act: TJvStaticText
                    Left = 272
                    Top = 26
                    Width = 77
                    Height = 22
                    TextMargins.X = 0
                    TextMargins.Y = 0
                    AutoSize = False
                    BevelKind = bkSoft
                    BevelOuter = bvSpace
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clBlack
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'MS Sans Serif'
                    HotTrackFont.Style = []
                    Layout = tlCenter
                    ParentColor = False
                    ParentFont = False
                    TabOrder = 1
                    WordWrap = False
                  end
                end
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'Imagenes'
              ImageIndex = 1
              object ImgFotoC: TImage
                Left = 4
                Top = 4
                Width = 135
                Height = 135
                Hint = 'Fotografia del Asociado'
                ParentShowHint = False
                ShowHint = True
                Stretch = True
              end
              object ImFirma: TImage
                Left = 0
                Top = 144
                Width = 320
                Height = 135
              end
            end
            object TabSheet3: TTabSheet
              Caption = 'Resumen'
              ImageIndex = 2
              object GroupBox1: TGroupBox
                Left = 2
                Top = 0
                Width = 361
                Height = 111
                Caption = 'Aportaciones y Captaciones'
                TabOrder = 0
                object GridRCaptaciones: TStringGrid
                  Left = 2
                  Top = 15
                  Width = 357
                  Height = 94
                  Align = alClient
                  ColCount = 8
                  DefaultRowHeight = 18
                  DefaultDrawing = False
                  FixedCols = 0
                  Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
                  PopupMenu = PopMCaptaciones
                  TabOrder = 0
                  OnDrawCell = GridRCaptacionesDrawCell
                  OnSelectCell = GridRCaptacionesSelectCell
                  ColWidths = (
                    64
                    64
                    64
                    64
                    64
                    64
                    64
                    64)
                end
              end
              object GroupBox2: TGroupBox
                Left = 2
                Top = 112
                Width = 361
                Height = 109
                Caption = 'Colocaciones'
                TabOrder = 1
                object GridRColocaciones: TXStringGrid
                  Left = 2
                  Top = 12
                  Width = 355
                  Height = 94
                  ColCount = 9
                  DefaultRowHeight = 18
                  FixedCols = 0
                  RowCount = 2
                  PopupMenu = PMenu2
                  TabOrder = 0
                  OnDrawCell = GridRColocacionesDrawCell
                  OnSelectCell = GridRColocacionesSelectCell
                  FixedLineColor = clBlack
                  Columns = <
                    item
                      HeaderFont.Charset = DEFAULT_CHARSET
                      HeaderFont.Color = clBlack
                      HeaderFont.Height = -11
                      HeaderFont.Name = 'MS Sans Serif'
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Colocaci'#243'n'
                      Width = 70
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Valor'
                      Width = 70
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Saldo'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'F.Inter'#233's'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Capital'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Inter'#233's'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Costas'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Deuda Hoy'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Estado'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      EditorInheritsCellProps = False
                    end>
                  MultiLine = False
                  ImmediateEditMode = False
                  ColWidths = (
                    70
                    70
                    64
                    64
                    64
                    64
                    64
                    64
                    64)
                end
              end
              object GroupBox3: TGroupBox
                Left = 1
                Top = 220
                Width = 362
                Height = 95
                Caption = 'Fianzas'
                TabOrder = 2
                object GridRFianzas: TXStringGrid
                  Left = 2
                  Top = 14
                  Width = 357
                  Height = 79
                  ColCount = 10
                  DefaultRowHeight = 18
                  FixedCols = 0
                  RowCount = 2
                  PopupMenu = PMenu3
                  TabOrder = 0
                  OnDrawCell = GridRFianzasDrawCell
                  OnSelectCell = GridRFianzasSelectCell
                  FixedLineColor = clBlack
                  Columns = <
                    item
                      HeaderFont.Charset = DEFAULT_CHARSET
                      HeaderFont.Color = clBlack
                      HeaderFont.Height = -11
                      HeaderFont.Name = 'MS Sans Serif'
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Colocaci'#243'n'
                      Width = 70
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Valor'
                      Width = 70
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Saldo'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'F.Inter'#233's'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Capital'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Inter'#233's'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Costas'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Deuda Hoy'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Estado'
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
                      HeaderFont.Style = []
                      HeaderAlignment = taCenter
                      Caption = 'Deudor'
                      Width = 200
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      EditorInheritsCellProps = False
                    end>
                  MultiLine = False
                  ImmediateEditMode = False
                  ColWidths = (
                    70
                    70
                    64
                    64
                    64
                    64
                    64
                    64
                    64
                    200)
                end
              end
            end
          end
        end
        object HojaIni: TTabSheet
          Caption = 'HojaIni'
          ImageIndex = 6
          TabVisible = False
          object Panel21: TPanel
            Left = 0
            Top = 0
            Width = 373
            Height = 348
            Align = alClient
            Caption = 'Aqu'#237' vera la informaci'#243'n relacionada con la persona buscada'
            TabOrder = 0
          end
        end
        object HojaSolicitud: TTabSheet
          Caption = 'Solicitudes'
          ImageIndex = 7
          TabVisible = False
          object Label82: TLabel
            Left = 6
            Top = 2
            Width = 223
            Height = 13
            Caption = 'SOLICITUD CON RADICADO N'#218'MERO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object JVSolicitud: TJvStaticText
            Left = 239
            Top = -2
            Width = 130
            Height = 21
            TextMargins.X = 0
            TextMargins.Y = 0
            Alignment = taCenter
            AutoSize = False
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            Layout = tlCenter
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            WordWrap = False
          end
          object JvGroupBox2: TJvGroupBox
            Left = 0
            Top = 58
            Width = 370
            Height = 43
            Caption = 'Datos Empleado Recepci'#243'n de Solicitud'
            TabOrder = 1
            object JVempleadoRec: TJvStaticText
              Left = 3
              Top = 15
              Width = 245
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              WordWrap = False
            end
            object JVfechaRec: TJvStaticText
              Left = 251
              Top = 15
              Width = 115
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              WordWrap = False
            end
          end
          object JvGroupBox3: TJvGroupBox
            Left = 0
            Top = 100
            Width = 370
            Height = 41
            Caption = 'Datos Empleado Secci'#243'n Cr'#233'ditos'
            TabOrder = 2
            object JVempleadoCre: TJvStaticText
              Left = 3
              Top = 15
              Width = 245
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              WordWrap = False
            end
            object JVfechaCre: TJvStaticText
              Left = 251
              Top = 15
              Width = 115
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              WordWrap = False
            end
          end
          object JvGroupBox4: TJvGroupBox
            Left = 0
            Top = 139
            Width = 370
            Height = 41
            Caption = 'Datos Empleado Secci'#243'n An'#225'lisis'
            TabOrder = 3
            object JVempleadoAna: TJvStaticText
              Left = 3
              Top = 14
              Width = 245
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              WordWrap = False
            end
            object JVfechaAna: TJvStaticText
              Left = 251
              Top = 14
              Width = 115
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              WordWrap = False
            end
          end
          object JvGroupBox5: TJvGroupBox
            Left = 0
            Top = 176
            Width = 369
            Height = 167
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object JvLabel7: TJvLabel
              Left = 6
              Top = 8
              Width = 33
              Height = 13
              Caption = 'Estado'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel8: TJvLabel
              Left = 6
              Top = 42
              Width = 77
              Height = 13
              Caption = 'Linea de Cr'#233'dito'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel9: TJvLabel
              Left = 220
              Top = 42
              Width = 45
              Height = 13
              Caption = 'Respaldo'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel10: TJvLabel
              Left = 220
              Top = 75
              Width = 40
              Height = 13
              Caption = 'Garantia'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel11: TJvLabel
              Left = 6
              Top = 75
              Width = 67
              Height = 13
              Caption = 'Tipo de Cuota'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel12: TJvLabel
              Left = 220
              Top = 7
              Width = 73
              Height = 13
              Caption = 'Valor Solicitado'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel13: TJvLabel
              Left = 6
              Top = 165
              Width = 26
              Height = 13
              Caption = 'Plazo'
              Visible = False
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel14: TJvLabel
              Left = 148
              Top = 165
              Width = 75
              Height = 13
              Caption = 'Amortiza Capital'
              Visible = False
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object Label95: TLabel
              Left = 267
              Top = 165
              Width = 75
              Height = 13
              Caption = 'Amortiza Interes'
              Visible = False
            end
            object Label96: TLabel
              Left = 7
              Top = 108
              Width = 148
              Height = 13
              Caption = 'Observaciones Ente Aprobador'
            end
            object JVestado: TJvStaticText
              Left = 3
              Top = 20
              Width = 206
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              WordWrap = False
            end
            object JVlinea: TJvStaticText
              Left = 3
              Top = 54
              Width = 206
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              WordWrap = False
            end
            object JVrespaldo: TJvStaticText
              Left = 220
              Top = 54
              Width = 145
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              WordWrap = False
            end
            object JVgarantia: TJvStaticText
              Left = 220
              Top = 88
              Width = 145
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              WordWrap = False
            end
            object JVcuota: TJvStaticText
              Left = 3
              Top = 88
              Width = 206
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              WordWrap = False
            end
            object JVvalor: TJvStaticText
              Left = 220
              Top = 20
              Width = 145
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              Alignment = taRightJustify
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              WordWrap = False
            end
            object JVplazo: TJvStaticText
              Left = 6
              Top = 177
              Width = 115
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 6
              Visible = False
              WordWrap = False
            end
            object JVcapital: TJvStaticText
              Left = 148
              Top = 177
              Width = 95
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 7
              Visible = False
              WordWrap = False
            end
            object JVinteres: TJvStaticText
              Left = 266
              Top = 177
              Width = 95
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 8
              Visible = False
              WordWrap = False
            end
            object Mobservacion: TMemo
              Left = 3
              Top = 120
              Width = 362
              Height = 45
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 9
            end
          end
          object JvGroupBox6: TJvGroupBox
            Left = 1
            Top = 17
            Width = 370
            Height = 43
            Caption = 'Datos Ultimo Empleado Informaci'#243'n de Cr'#233'dito'
            TabOrder = 5
            object JVempleadoInf: TJvStaticText
              Left = 3
              Top = 15
              Width = 245
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              WordWrap = False
            end
            object JVfechaInf: TJvStaticText
              Left = 250
              Top = 15
              Width = 115
              Height = 21
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlCenter
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              WordWrap = False
            end
          end
        end
        object HojaTarjetaDebito: TTabSheet
          Caption = 'HojaTarjetaDebito'
          ImageIndex = 8
          TabVisible = False
          object Label86: TLabel
            Left = 8
            Top = 10
            Width = 110
            Height = 14
            Caption = 'TARJETA DEBITO No.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label87: TLabel
            Left = 1
            Top = 48
            Width = 85
            Height = 13
            Caption = 'Fecha Asignaci'#243'n'
          end
          object Label88: TLabel
            Left = 190
            Top = 49
            Width = 72
            Height = 13
            Caption = 'Fecha Bloqueo'
          end
          object Label89: TLabel
            Left = 1
            Top = 81
            Width = 92
            Height = 13
            Caption = 'Fecha Cancelaci'#243'n'
          end
          object Label94: TLabel
            Left = 193
            Top = 81
            Width = 66
            Height = 13
            Caption = 'Estado Actual'
          end
          object EdTarjetaDebito: TStaticText
            Left = 128
            Top = 2
            Width = 233
            Height = 29
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = sbsSunken
            Color = clBtnHighlight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object EdFechaAsignacion: TStaticText
            Left = 95
            Top = 43
            Width = 94
            Height = 27
            AutoSize = False
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = sbsSunken
            Color = clBtnHighlight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object EdFechaBloqueo: TStaticText
            Left = 268
            Top = 44
            Width = 94
            Height = 27
            AutoSize = False
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = sbsSunken
            Color = clBtnHighlight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object EdFechaCancelacion: TStaticText
            Left = 95
            Top = 76
            Width = 94
            Height = 27
            AutoSize = False
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = sbsSunken
            Color = clBtnHighlight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object GroupBox6: TGroupBox
            Left = 0
            Top = 112
            Width = 369
            Height = 97
            Caption = 'Cupos Asignados'
            TabOrder = 4
            object Label90: TLabel
              Left = 8
              Top = 24
              Width = 23
              Height = 13
              Caption = 'ATM'
            end
            object Label91: TLabel
              Left = 8
              Top = 56
              Width = 22
              Height = 13
              Caption = 'POS'
            end
            object Label92: TLabel
              Left = 184
              Top = 24
              Width = 96
              Height = 13
              Caption = 'Transacciones ATM'
            end
            object Label93: TLabel
              Left = 184
              Top = 56
              Width = 95
              Height = 13
              Caption = 'Transacciones POS'
            end
            object EdCupoATM: TStaticText
              Left = 39
              Top = 19
              Width = 134
              Height = 26
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = sbsSunken
              Color = clBtnHighlight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 0
            end
            object EdCupoPOS: TStaticText
              Left = 39
              Top = 51
              Width = 134
              Height = 26
              Alignment = taRightJustify
              AutoSize = False
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = sbsSunken
              Color = clBtnHighlight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 1
            end
            object EdTransaATM: TStaticText
              Left = 288
              Top = 19
              Width = 37
              Height = 26
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = sbsSunken
              Color = clBtnHighlight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 2
            end
            object EdTransaPOS: TStaticText
              Left = 288
              Top = 51
              Width = 37
              Height = 26
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = sbsSunken
              Color = clBtnHighlight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 3
            end
          end
          object EdEstado: TStaticText
            Left = 268
            Top = 76
            Width = 94
            Height = 27
            AutoSize = False
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = sbsSunken
            Color = clBtnHighlight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object GroupBox7: TGroupBox
            Left = 0
            Top = 207
            Width = 369
            Height = 47
            Caption = 'Datos de la Cuenta'
            TabOrder = 6
            object EdCuentaTarjeta: TStaticText
              Left = 8
              Top = 16
              Width = 353
              Height = 26
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BevelOuter = bvRaised
              BorderStyle = sbsSunken
              Color = clBtnHighlight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object DSTiposCaptacion: TDataSource
    AutoEdit = False
    DataSet = IBDSTiposCaptacion
    Left = 630
    Top = 222
  end
  object IBDSTiposCaptacion: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SelectSQL.Strings = (
      'select * from "cap$tipocaptacion"')
    Left = 616
    Top = 46
  end
  object IBDSTiposId: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SelectSQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 590
    Top = 12
  end
  object DSTiposId: TDataSource
    AutoEdit = False
    DataSet = IBDSTiposId
    Left = 638
    Top = 252
  end
  object ImageTree: TImageList
    Left = 518
    Top = 46
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FF00
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400008484000000000000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000084840000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6008484840084848400C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000084840000000000FFFF0000FFFF0000FF00
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6008484
      8400000000008484840084848400C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000084840000000000FFFFFF00000000000084
      84000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000008400C6C6C600C6C6C600848484000000
      0000FFFFFF00848484008484840084848400C6C6C6000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000C6C6C60084848400000000000000
      0000848484008484840084848400000000008484840000000000C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00C6C6C600FFFFFF00FF000000FFFFFF00FF000000C6C6C600FFFF
      FF00FFFFFF00FF000000FFFFFF008484840000000000FFFF0000FFFF0000FF00
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000FFFFFF00FFFFFF00848484008484840000000000C6C6C600C6C6C6008484
      8400C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FF000000FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF008484840000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C600848484008484
      840084848400C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FF000000FFFF
      FF00C6C6C600FFFFFF00FF000000FFFFFF00C6C6C600FF000000FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF008484840000000000FFFFFF0000000000FF00
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00C6C6C600C6C6C60084848400848484008484
      84008484840084848400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF008484840000000000FFFF0000FFFF0000FF00
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000C6C6C6008484840084848400848484000000
      0000000000008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FF000000C6C6C600FFFFFF00FF000000FFFFFF00FFFFFF00C6C6
      C600FF000000FFFFFF00FFFFFF008484840000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400848484008484840000000000FFFF
      FF00000000008484840084848400000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840000000000FFFFFF0000000000FF00
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000C6C6C600FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000008400000000000000FFFF0000FFFF0000FF00
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400FFFFFF00FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000008400000000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000C6C6
      C600FFFFFF000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000000084848400C6C6
      C60084848400C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840000000000C6C6C6000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000840000008400000084000000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000000000000000DEDE
      DE00CECECE00CECECE00CECECE00DEDEDE00F7FFFF00F7FFFF00F7FFFF00DEDE
      DE00DEDEDE00F7FFFF000000000000000000008484008484840084848400C6C6
      C60084848400C6C6C6000084840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000FFFFFF00FFFFFF00FFFFFF000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000F7FFFF00CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C600C6C6C600CECECE00CECECE00CECECE00CECE
      CE00CECECE00DEDEDE00F7FFFF000000000084848400C6C6C600848484000000
      000084848400C6C6C6008484840084848400C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000084
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6
      C60084848400FFFFFF00FFFFFF0000000000C6C6C60000000000848484000000
      000000000000FFFFFF00C6C6C6000000000000000000CECECE00A5A5A500C6C6
      C6005252520042424200A5A5A500A5A5A500A5A5A500C6C6C600C6C6C600C6C6
      C600CECECE00A5A5A500F7FFFF00000000000000000000000000848484000000
      000084848400C6C6C600FFFFFF0084848400C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
      840000000000FFFFFF00C6C6C60000000000C6C6C60000000000848484000000
      000084848400FFFFFF00C6C6C6000000000000000000DEDEDE00CECECE00DEDE
      DE00CECECE00F7FFFF0010101000C6C6C600A5A5A500C6C6C600C6C6C600CECE
      CE0000310000008C000063636300000000000000000000000000848484000000
      000084848400C6C6C600FFFFFF0084848400C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000840000008400000084000000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6
      C60084848400FFFFFF00C6C6C60000000000C6C6C60000000000C6C6C6008484
      840084848400FFFFFF00C6C6C6000000000000000000F7FFFF0052525200F7FF
      FF00CECECE00FFFFFF00F7FFFF00CECECE00C6C6C600CECECE003131310000BD
      0000003100000073000000210000F7FFFF000000000000000000848484000000
      000084848400C6C6C600FFFFFF0084848400C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000840000FFFF
      FF00FFFFFF00FFFFFF000084000000840000FFFFFF00FFFFFF00FFFFFF000084
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00C6C6C600FFFFFF00FFFFFF00000000008484840000000000C6C6C600C6C6
      C60084848400FFFFFF00C6C6C6000000000000000000F7FFFF00636363009C9C
      9C00A5A5A500DEDEDE00C6C6C600F7FFFF00C6C6C600A5A5A5000031000000BD
      0000003100000052000073737300000000000000000000000000848484000000
      000084848400C6C6C6000084840000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00008400000084
      0000FFFFFF00FFFFFF000084000000840000FFFFFF00FFFFFF00008400000084
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000008484840000000000FFFFFF00C6C6
      C60000000000FFFFFF00C6C6C600000000000000000000000000737373002121
      21009C9C9C00C6C6C600CECECE00F7FFFF009C9C9C0000CE000000CE00000052
      0000004200000000000000000000000000000000000000000000848484000084
      8400848484000084840000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00008400000084
      000000840000FFFFFF000084000000840000FFFFFF0000840000008400000084
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00C6C6C600FFFFFF00FFFFFF00000000008484840000000000FFFFFF00C6C6
      C60000000000FFFFFF00C6C6C600000000000000000000000000000000000000
      000042424200A5A5A500CECECE0042424200DEDEDE0000730000009C31000000
      000000000000000000000000000000000000008484008484840084848400C6C6
      C6008484840000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00008400000084
      000000840000FFFFFF0000840000FFFFFF00FFFFFF0000840000008400000084
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6
      C60084848400FFFFFF00FFFFFF0000000000C6C6C6000000000084848400C6C6
      C60084848400FFFFFF00C6C6C600000000000000000000000000000000000000
      00000000000021212100C6C6C600DEDEDE003131310000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600848484000000
      000084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00008400000084
      0000008400000084000000840000FFFFFF000084000000840000008400000084
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6
      C60084848400FFFFFF00C6C6C60000000000848484000000000084848400C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      000052525200A5A5A500A5A5A500CECECE00DEDEDE00DEDEDE00000000000000
      0000000000000000000000000000000000008484840000000000848484000000
      000084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00008400000084
      0000008400000084000000840000FFFFFF00008400000084000000840000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6
      C60084848400FFFFFF00C6C6C60000000000848484000000000084840000C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000DEDEDE007373
      7300313131000000000000000000A5A5A500DEDEDE0031313100000000000000
      00000000000000000000000000000000000084848400C6C6C600848484000000
      000084848400C6C6C6000084840000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000084
      0000008400000084000000840000FFFFFF00008400000084000000840000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
      000084840000FFFFFF00C6C6C60000000000848484000000000084840000FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000009C9C9C00F7FFFF00636363000000
      00000000000000000000424242009C9C9C00C6C6C600F7FFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000848400848484000000
      0000848484000084840084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF008484840000000000FFFFFF00FFFFFF00FFFFFF000084
      0000008400000084000000840000FFFFFF000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
      000084840000FFFFFF00C6C6C60000000000848484000000000084840000FFFF
      FF0084848400FFFFFF00C6C6C600000000006363630042424200000000000000
      00000000000000000000313131009C9C9C00525252009C9C9C00C6C6C6009C9C
      9C00000000000000000000000000000000000000000000000000848484000084
      84008484840000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008400000084000000840000FFFFFF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
      000084840000FFFFFF00FFFFFF00000000008484840000000000848400008484
      000084840000FFFFFF00C6C6C600000000000000000000000000000000000000
      00000000000000000000737373009C9C9C001010100000000000A5A5A5000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A50021212100000000000000000000000000000000006B73
      7B0042638C006394CE00528CBD00295A7B00424A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000292929006B6B6B008C8C8C0000000000000000006B737B005A94
      C6006394CE006394CE00528CBD00316B9400295A7B0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A5A5A00BDBDBD00BDBDBD00D6D6D600000000006394CE006394CE00528C
      BD00316B94006B9CD600528CBD00316B9400316B9400295A7B00394A4A000000
      00000000000000000000000000000000000000000000D6B5AD00F7EFE700F7E7
      CE00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7D6AD00F7D6AD00D6B5AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C008C8C8C000000
      000039393900949494008C8C8C0000000000000000006394CE0021528400316B
      940008396B006394CE00528CBD006B9CCE00316B9400316B9400295A7B008484
      84000000000000000000000000000000000000000000FFF7F700FFF7F700F7EF
      E700F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DEBD00F7DE
      BD00F7DEBD00F7D6AD00F7D6AD00000000000000000000000000000000000000
      0000000000000000000039210000633131006331310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400FFFFFF00FFFFFF00FFFFFF0039393900DEAD8C00EFE7DE00EFDED6007363
      520063636300000000000000000000000000000000006394CE0021528400639C
      D6007BADE7009CB5D600B5B5BD00847B8400A5B5C600316B9400316B9400295A
      7B00394A4A0000000000000000000000000000000000FFF7F700E7E7E700A5A5
      A500A5A5A5008484840084848400F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7DEBD00F7D6AD00F7D6AD00000000000000000000000000523918005242
      3100000000003121000029210000CE630000523100006B42180000639C000073
      B5000073B5000000000000000000000000000000000000000000000000009494
      9400FFFFFF00DEDEDE00DEDEDE00BD9C7B00EFDED600E7CEB500E7CEB500E7CE
      B5004A4A4A00000000000000000000000000000000006394CE00639CD6008CBD
      EF009CB5D600CEC6CE00D6CED600948C9400B5B5B500528CB500316B9400316B
      9400295A7B0084848400000000000000000000000000FFF7F700FFF7EF00FFF7
      EF00F7EFE700F7EFE70029292900B5B5B500F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7DEBD00F7DEBD00000000000000000029210000D68400005A31
      00003921000021180000CE6300009C3100005A3900007B4A18007363520000A5
      E700188CCE0000639C0000000000000000000000000000000000000000009C9C
      9C00FFFFFF00D6D6D600D6D6D600EFD6C600EFDED600FFDECE00FFDECE00FFDE
      CE0094847B00000000000000000000000000000000004A7BB500949CA500E7E7
      E700E7E7E700EFEFEF00DED6DE00B5ADB500BDBDBD008C848C00ADBDC600316B
      9400316B9400295A7B00424A4A000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00D6D6D600428CDE0018526B00D6D6D600F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00F7DEBD000000000073634A00D6840000CE6300006339
      00004229000021180000211800005231080063390000734208005A5A5A0029BD
      FF0000A5E7000073B50000639C00000000000000000000000000000000009C9C
      9C00FFFFFF00FFFFFF00FFFFFF00CEBD9C00FFE7AD00FFFFFF00FFFFFF00FFE7
      AD007B7B7B00000000000000000000000000000000003963940094949C00EFEF
      EF00E7EFEF00ADADAD008C8C8C00DED6DE00B5ADB50094949400C6BDC600528C
      B500316B9400316B9400214252000000000000000000FFF7F700E7E7E700A5A5
      A500A5A5A500A5A5A500A5A5A500297B9C008C7B7B008C5A5200848484008484
      84008484840084848400F7DEBD000000000063523100211800004A2900006339
      00004A2900008C6339009C632900844A0000633900003952520039ADD60000AD
      F70000CEFF0008B5FF0000A5E70000000000000000000000000000000000A5A5
      A500F7F7F700F7F7F700F7F7F700ADADAD0094949400EFD6C600E7CEB5009C9C
      9C00F7F7F7000000000000000000000000000000000000000000527B520039A5
      5A0029733100CE8CCE0094849400D6CED600D6CED600B5ADB500C6C6C6008484
      8400B5BDCE00316B9400214252000000000000000000FFF7F700E7E7E700A5A5
      A500A5A5A500A5A5A500A5A5A500847B7B00FFCE9400FFB56300D67318008484
      84008484840084848400F7E7CE00000000000000000063313100845208005A39
      00005231080039ADD6005A847B00845200008452080039ADD60000CEFF0063CE
      FF0029BDFF0029BDFF0008B5FF000073B500000000000000000000000000A5A5
      A500EFEFEF00C6C6C600C6C6C600C6C6C600BDBDBD009C9C9C00A5A5A500EFEF
      EF00000000000000000000000000000000000000000000000000396B3900525A
      5200AD6BAD009C319C00947B8C00BDB5BD009C949C00DED6DE00BDBDBD009494
      9400CECECE004A84AD00214252000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD7B7300FFC68400FFB563008C5A
      5200D6D6D600F7EFE700F7EFE700000000000000000000000000736B42004A6B
      630039ADD60000ADF70000A5E70000ADF70000ADF70029BDFF0000CEFF0063CE
      FF0063CEFF0029BDFF0000CEFF0000639C00000000000000000000000000ADAD
      AD00E7E7E700BDBDBD00BDBDBD00E7E7E700ADADAD009C9C9C009C9C9C000000
      000000000000000000000000000000000000000000000000000000000000734A
      73007B394200F7944200D64A310073E7E70084A5A500CEC6CE00DED6DE00A5A5
      A500D6CED6004A6B8C00848C94000000000000000000EF8C3900EF8C3900EF8C
      3900EF8C3900EF8C3900EF8C3900EF8C3900EF8C3900AD7B7300FFD6AD00FFB5
      6300D6731800CE847B00EF8C39000000000000000000000000000073B50039AD
      D60000CEFF0029BDFF0000ADF700009CE70000ADF70000ADF70029BDFF0000CE
      FF0063CEFF008CD6FF0029BDFF0000639C00000000000000000000000000ADAD
      AD00DEDEDE00DEDEDE00DEDEDE00D6D6D6009C9C9C00DEDEDE00EFEFEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C4A4A00945A63005AC6CE005ADEF7007B949C00C6BDC60094949400DED6
      DE00CEC6CE0000000000000000000000000000000000EFC68C00FFA53900FFA5
      3900FFA53900FFA53900FFA53900FFA53900FFA53900FFA53900AD7B7300BD84
      8400299CEF000863A500CE847B00000000000000000000000000000000000073
      B500009CCE009CDEFF0000CEFF0000ADF70000A5E70000ADF700009CCE0029BD
      FF0029BDFF009CDEFF0000A5E70000000000000000000000000000000000BDBD
      BD00CECECE00CECECE00CECECE00BDBDBD00ADADAD00EFEFEF00D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000738494004A6352004ABD730029943900C694C600A58CA5000000
      00000000000000000000000000000000000000000000EFC68C00EFC68C00EFB5
      7300EFB57300FFB55200A56B6B00000000000000000000000000000000004ABD
      FF00299CEF001029D6000010AD00000000000000000000000000000000000000
      00000073B50000ADF7009CDEFF0029BDFF0000ADF70000639C000000000000AD
      F70029BDFF0000A5E70000639C0000000000000000000000000000000000ADAD
      AD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00C6C6C600DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A7B5A004A6B4A00A57BA500AD42AD008C638C000000
      00000000000000000000000000000000000000000000D6B5AD00D6B5AD00D6B5
      AD00D6B5AD00D6B5AD0000000000000000000000000000000000000000000000
      00000018C600106BFF000018C600000000000000000000000000000000000000
      000000000000009CCE00009CCE00009CCE00009CCE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000FFEFFFFFFFFFF0007F1FFFFFF0001
      0007E1FF91FF00000007C0FFF1FF00000007807FF9FF00000000006FFF9F0000
      00070047FF9F000000070083FFFF000000078001FF9F000000078000FF8F0000
      0007C000FF8F00000007E401F3FF00000007FE03F3FF00000007FF03FFFF0000
      0007FF871EFF00000007FFCF16FF0001C3FF00000000FFFF80FF00000000E003
      00000000000080011000000000008001D000000000008001D000000000008000
      D000000000008001D00000000000C007C00000000000F01F000000000000F87F
      100000000000F03F500000000000C43F1000000000001C1F8001000000003C0F
      C00300000000FC5FD00700000000FE7FFFFFFFFFFCFFFFFFFFFFFFF9E07FFFFF
      FFFFFFF8C03FFFFFFFFFFFF0801F8001FFFFFF91800F8001FC7FE00780078001
      C807E007800380018003E007800180010001E007800180010001E007C0018001
      8000E00FC0018001C000E01FE0018001C000E01FF0078001E001E01FF81F81E1
      F021E03FFC1F83F1F87FFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object IBSaldosMes: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select * from P_CAP_0009 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO' +
        '_CUENTA,:DIGITO_CUENTA,:ANO)')
    Left = 448
    Top = 460
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
      end
      item
        DataType = ftUnknown
        Name = 'ANO'
        ParamType = ptUnknown
      end>
  end
  object DSSaldosMes: TDataSource
    AutoEdit = False
    DataSet = IBSaldosMes
    Left = 418
    Top = 454
  end
  object IBTablaLiquidacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select FECHA_PAGO,VALOR,PAGADO from "cap$tablaliquidacion" where' +
        ' ( ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_' +
        'CAPTACION" and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENT' +
        'A = :"DIGITO_CUENTA" )'
      ''
      '')
    Left = 446
    Top = 446
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
  object DSTablaLiquidacion: TDataSource
    AutoEdit = False
    DataSet = IBTablaLiquidacion
    Left = 418
    Top = 444
  end
  object IBTablaLiquidacionColocacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select * from "col$tablaliquidacion" where ID_AGENCIA = :"ID_AGE' +
        'NCIA" and ID_COLOCACION = :"ID_COLOCACION" order by "col$tablali' +
        'quidacion".CUOTA_NUMERO')
    Left = 388
    Top = 460
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
    object IBTablaLiquidacionColocacionID_AGENCIA: TSmallintField
      FieldName = 'ID_AGENCIA'
      Origin = '"col$tablaliquidacion"."ID_AGENCIA"'
      Required = True
    end
    object IBTablaLiquidacionColocacionID_COLOCACION: TIBStringField
      FieldName = 'ID_COLOCACION'
      Origin = '"col$tablaliquidacion"."ID_COLOCACION"'
      Required = True
      FixedChar = True
      Size = 11
    end
    object IBTablaLiquidacionColocacionCUOTA_NUMERO: TIntegerField
      FieldName = 'CUOTA_NUMERO'
      Origin = '"col$tablaliquidacion"."CUOTA_NUMERO"'
      Required = True
    end
    object IBTablaLiquidacionColocacionFECHA_A_PAGAR: TDateField
      FieldName = 'FECHA_A_PAGAR'
      Origin = '"col$tablaliquidacion"."FECHA_A_PAGAR"'
      Required = True
    end
    object IBTablaLiquidacionColocacionCAPITAL_A_PAGAR: TIBBCDField
      FieldName = 'CAPITAL_A_PAGAR'
      Origin = '"col$tablaliquidacion"."CAPITAL_A_PAGAR"'
      Precision = 18
      Size = 3
    end
    object IBTablaLiquidacionColocacionINTERES_A_PAGAR: TIBBCDField
      FieldName = 'INTERES_A_PAGAR'
      Origin = '"col$tablaliquidacion"."INTERES_A_PAGAR"'
      Precision = 18
      Size = 3
    end
    object IBTablaLiquidacionColocacionPAGADA: TSmallintField
      FieldName = 'PAGADA'
      Origin = '"col$tablaliquidacion"."PAGADA"'
      OnGetText = IBTablaLiquidacionColocacionPAGADAGetText
    end
    object IBTablaLiquidacionColocacionFECHA_PAGADA: TDateField
      FieldName = 'FECHA_PAGADA'
      Origin = '"col$tablaliquidacion"."FECHA_PAGADA"'
    end
  end
  object DSTablaLiquidacionColocacion: TDataSource
    AutoEdit = False
    DataSet = IBTablaLiquidacionColocacion
    Left = 410
    Top = 464
  end
  object DSObservaciones: TDataSource
    AutoEdit = False
    DataSet = IBObservaciones
    Left = 394
    Top = 446
  end
  object IBObservaciones: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    AfterScroll = IBObservacionesAfterScroll
    SQL.Strings = (
      
        'select FECHA, OBSERVACION, SEMAFORO, ID_EMPLEADO from "gen$obser' +
        'vaciones" where ID_PERSONA = :"ID_PERSONA" and ID_IDENTIFICACION' +
        ' = :"ID_IDENTIFICACION" order by FECHA DESC,SEMAFORO DESC')
    Left = 396
    Top = 430
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
    object IBObservacionesFECHA: TDateField
      FieldName = 'FECHA'
      Origin = '"gen$observaciones"."FECHA"'
    end
    object IBObservacionesOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = '"gen$observaciones"."OBSERVACION"'
      ProviderFlags = [pfInUpdate]
      OnGetText = IBObservacionesOBSERVACIONGetText
      BlobType = ftMemo
      Size = 8
    end
    object IBObservacionesSEMAFORO: TIntegerField
      FieldName = 'SEMAFORO'
      Origin = '"gen$observaciones"."SEMAFORO"'
      OnGetText = IBObservacionesSEMAFOROGetText
    end
    object IBObservacionesID_EMPLEADO: TIBStringField
      FieldName = 'ID_EMPLEADO'
      Origin = '"gen$observaciones"."ID_EMPLEADO"'
      OnGetText = IBObservacionesID_EMPLEADOGetText
      Size = 15
    end
  end
  object IBFormas: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "cap$tiposforma" where ID_FORMA = :"ID_FORMA"')
    Left = 332
    Top = 428
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_FORMA'
        ParamType = ptUnknown
      end>
  end
  object IBConsulta2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "cap$maestrotitular".ID_AGENCIA,'
      '  "cap$maestrotitular".ID_TIPO_CAPTACION,'
      '  "cap$maestrotitular".NUMERO_CUENTA,'
      '  "cap$maestrotitular".DIGITO_CUENTA,'
      '  "cap$maestrotitular".NUMERO_TITULAR,'
      '  "cap$maestrotitular".TIPO_TITULAR,'
      '  "cap$tiposestado".DESCRIPCION AS ESTADO'
      'FROM'
      '  "cap$maestrotitular"'
      
        '  INNER JOIN "cap$tipocaptacion" ON ("cap$maestrotitular".ID_TIP' +
        'O_CAPTACION = "cap$tipocaptacion".ID_TIPO_CAPTACION)'
      
        '  INNER JOIN "cap$tiposforma" ON ("cap$tipocaptacion".ID_FORMA =' +
        ' "cap$tiposforma".ID_FORMA)'
      
        ' LEFT JOIN "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA="ca' +
        'p$maestro".ID_AGENCIA)'
      
        '  AND ("cap$maestrotitular".ID_TIPO_CAPTACION="cap$maestro".ID_T' +
        'IPO_CAPTACION)'
      
        '  AND ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_C' +
        'UENTA)'
      
        '  AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_C' +
        'UENTA)'
      
        ' LEFT JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO="cap$ti' +
        'posestado".ID_ESTADO)'
      'WHERE'
      
        '("cap$tipocaptacion".ID_FORMA = :"ID_FORMA") and ("cap$maestroti' +
        'tular".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION") and ("cap$maest' +
        'rotitular".ID_IDENTIFICACION = :"ID_IDENTIFICACION") and ("cap$m' +
        'aestrotitular".ID_PERSONA = :"ID_PERSONA")')
    Left = 330
    Top = 458
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_FORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TIPO_CAPTACION'
        ParamType = ptUnknown
      end
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
  object IBColocaciones: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select * from "col$colocacion" where ( ID_IDENTIFICACION = :"ID_' +
        'IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA" )'
      'ORDER BY'
      '"col$colocacion".ID_AGENCIA,'
      '"col$colocacion".ID_COLOCACION')
    Left = 304
    Top = 428
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
  object IBConsulta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 274
    Top = 458
  end
  object IBFianzas: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select * from "col$colgarantias" where ( ID_IDENTIFICACION = :"I' +
        'D_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA" )'
      
        'order by "col$colgarantias".ID_AGENCIA, "col$colgarantias".ID_CO' +
        'LOCACION')
    Left = 302
    Top = 460
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
  object IBPersona: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersona
    SQL.Strings = (
      
        'select ID_TIPO_PERSONA,SEXO,ID_TIPO_ESTADO_CIVIL,FECHA_REGISTRO,' +
        ' PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE,FECHA_NACIMIENTO,LUGA' +
        'R_NACIMIENTO,ID_TIPO_RELACION, EDUCACION,PROFESION,EMPRESA_LABOR' +
        'A,CARGO_ACTUAL,FECHA_INGRESO_EMPRESA, RETEFUENTE,TOTAL_ACTIVOS, ' +
        'TOTAL_PASIVOS, FOTO,FIRMA,ID_EMPLEADO,FECHA_ACTUALIZACION from "' +
        'gen$persona" where (ID_IDENTIFICACION = :"ID_IDENTIFICACION" and' +
        ' ID_PERSONA = :"ID_PERSONA" )')
    Left = 472
    Top = 396
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
  object IBCaptaciones: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "cap$maestrotitular".ID_AGENCIA,'
      '  "cap$maestrotitular".ID_TIPO_CAPTACION,'
      '  "cap$maestrotitular".NUMERO_CUENTA,'
      '  "cap$maestrotitular".DIGITO_CUENTA,'
      '  "cap$maestrotitular".NUMERO_TITULAR,'
      '  "cap$maestrotitular".TIPO_TITULAR'
      'FROM'
      '  "cap$maestrotitular"'
      'WHERE'
      '  (ID_IDENTIFICACION = :"ID_IDENTIFICACION") AND '
      '  (ID_PERSONA = :"ID_PERSONA")'
      'ORDER BY'
      '  "cap$maestrotitular".ID_AGENCIA,'
      '  "cap$maestrotitular".ID_TIPO_CAPTACION,'
      '  "cap$maestrotitular".NUMERO_CUENTA,'
      '  "cap$maestrotitular".DIGITO_CUENTA'
      '')
    Left = 244
    Top = 438
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
  object IBConsulta1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT DISTINCT '
      '  "cap$tipocaptacion".ID_TIPO_CAPTACION,'
      '  "cap$tipocaptacion".DESCRIPCION'
      'FROM'
      '  "cap$maestrotitular"'
      
        '  INNER JOIN "cap$tipocaptacion" ON ("cap$maestrotitular".ID_TIP' +
        'O_CAPTACION = "cap$tipocaptacion".ID_TIPO_CAPTACION)'
      
        '  INNER JOIN "cap$tiposforma" ON ("cap$tipocaptacion".ID_FORMA =' +
        ' "cap$tiposforma".ID_FORMA)'
      'WHERE'
      '  ("cap$tiposforma".ID_FORMA = :"ID_FORMA") AND '
      '  (ID_PERSONA = :"ID_PERSONA") AND '
      '  (ID_IDENTIFICACION = :"ID_IDENTIFICACION")')
    Left = 246
    Top = 460
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_FORMA'
        ParamType = ptUnknown
      end
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
  object IBSQL: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 476
    Top = 468
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 502
    Top = 468
  end
  object DSPersona: TDataSource
    AutoEdit = False
    DataSet = IBPersona
    Left = 544
    Top = 398
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 472
    Top = 446
  end
  object IBDeudaHoy: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 502
    Top = 448
  end
  object PopMCaptaciones: TPopupMenu
    Images = ImageCap
    Left = 158
    Top = 252
    object Ir1: TMenuItem
      Caption = 'Ir A'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ConsultadeExtracto1: TMenuItem
      Caption = 'Consulta de Extracto'
      ImageIndex = 0
      OnClick = ConsultadeExtracto1Click
    end
    object CambiosdeEstado1: TMenuItem
      Caption = 'Cambios de Estado'
      ImageIndex = 1
      OnClick = CambiosdeEstado1Click
    end
  end
  object ImageCap: TImageList
    Left = 468
    Top = 68
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE63000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE63000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE63000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6008CF7FF008CF7
      FF008CEFFF0073DEF70073DEF70073DEF70073DEF70073DEF70029ADD60029AD
      D60073DEF70073DEF70029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6008CF7FF008CF7
      FF008CF7FF008CEFFF008CEFFF0073DEF70073DEF70073DEF70029ADD600ADFF
      FF0029ADD60073DEF70029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE63000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF008CF7
      FF008CF7FF008CF7FF008CEFFF008CEFFF0073DEF70073DEF70029ADD600ADFF
      FF00ADFFFF0029ADD60029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF009CFF
      FF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF0073DEF70029ADD60029AD
      D60029ADD60029ADD60029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE63000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF0073DEF70073DE
      F70073DEF70073DEF70029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEF
      FF0073DEF70073DEF70029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEF
      FF008CEFFF0073DEF70029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF008CF7FF008CF7FF008CEFFF008CEF
      FF008CEFFF008CEFFF0029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFFFFFF000000006111FFFF00000000
      FFFFFFFF000000006111FFFF00000000FFFF8001000000006111800100000000
      FFFF8001000000006111800100000000FFFF8001000000006111800100000000
      FFFF8001000000000000800100000000FFFF800100000000E111800100000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object PMenu1: TPopupMenu
    Left = 120
    Top = 312
    object IraObservaciones1: TMenuItem
      Caption = 'Ir a &Observaciones'
      OnClick = IraObservaciones1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object ExpandirTodo1: TMenuItem
      Caption = 'Expandir Todo'
      OnClick = ExpandirTodo1Click
    end
    object ContraerTodo1: TMenuItem
      Caption = 'Contraer Todo'
      OnClick = ContraerTodo1Click
    end
  end
  object IBllenaSolicitud: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBtranSolicitud
    SQL.Strings = (
      'SELECT DISTINCT '
      '  "col$solicitud".ID_SOLICITUD,'
      '  "col$solicitud".VALOR_SOLICITADO,'
      '  "col$solicitud".FECHA_RECEPCION,'
      '  "col$solicitud".ESTADO,'
      '  "col$estadosolicitud".DESCRIPCION_ESTADO,'
      '  "gen$empleado".NOMBRE|| '#39' '#39' ||  "gen$empleado".PRIMER_APELLIDO'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = ' +
        '"col$estadosolicitud".ID_ESTADO)'
      
        '  LEFT OUTER JOIN "gen$empleado" ON ("col$solicitud".ID_ANALISIS' +
        ' = "gen$empleado".ID_EMPLEADO)'
      'WHERE'
      '  ("col$solicitud".ID_PERSONA = :ID_PERSONA) AND '
      '  ("col$solicitud".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND '
      '  ("col$solicitud".ESTADO IN (1,2,3,4,8,10,12,13))')
    Left = 8
    Top = 40
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
  object DSllenaSolicitud: TDataSource
    DataSet = IBllenaSolicitud
    Left = 40
    Top = 40
  end
  object IBtranSolicitud: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 72
    Top = 40
  end
  object PMenu2: TPopupMenu
    Left = 138
    Top = 252
    object IrA1: TMenuItem
      Caption = 'Ir A'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ExtractodeColocacin1: TMenuItem
      Caption = 'Extracto de Colocaci'#243'n'
      OnClick = ExtractodeColocacin1Click
    end
  end
  object PMenu3: TPopupMenu
    Left = 184
    Top = 252
    object MenuItem1: TMenuItem
      Caption = 'Ir A'
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuItem3: TMenuItem
      Caption = 'Extracto de Colocaci'#243'n'
      OnClick = MenuItem3Click
    end
  end
  object IdTCPClient1: TIdTCPClient
    Port = 0
    Left = 8
    Top = 88
  end
  object IBTransaction1: TIBTransaction
    AllowAutoStart = False
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    AutoStopAction = saRollback
    Left = 576
    Top = 72
  end
  object IBTPersona: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 504
    Top = 400
  end
end
