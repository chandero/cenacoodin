object frmConsultaProductosAg: TfrmConsultaProductosAg
  Left = 115
  Top = 184
  ActiveControl = PageBuscar
  BorderStyle = bsDialog
  Caption = 'Productos de un Asociado'
  ClientHeight = 499
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
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
    Top = 441
    Width = 668
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
    object Panel4: TPanel
      Left = 586
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
    Width = 668
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
        Visible = False
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
        Color = clCaptionText
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
    Width = 668
    Height = 356
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object PanelTree: TPanel
      Left = 1
      Top = 1
      Width = 280
      Height = 354
      Align = alLeft
      Caption = 'Aqu'#237' los Productos del Asociado'
      TabOrder = 0
      object Arbol: TJvTreeView
        Left = 1
        Top = 1
        Width = 278
        Height = 352
        Align = alClient
        Images = ImageTree
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnChange = ArbolChange
      end
    end
    object splitter: TJvxSplitter
      Left = 281
      Top = 1
      Width = 3
      Height = 354
      ControlFirst = PanelTree
      ControlSecond = PanelDatos
      Align = alLeft
      Ctl3D = True
    end
    object PanelDatos: TPanel
      Left = 284
      Top = 1
      Width = 383
      Height = 354
      Align = alRight
      Caption = 'Vera aqu'#237' la Informaci'#243'n del Asociado'
      Color = clBtnHighlight
      TabOrder = 2
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 385
        Height = 569
        Caption = 'Panel5'
        TabOrder = 0
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 383
          Height = 567
          ActivePage = TabSheet2
          Align = alClient
          TabIndex = 1
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = 'Datos Personales'
            object PanelPersona: TPanel
              Left = 0
              Top = 0
              Width = 375
              Height = 539
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
            Caption = 'Captaciones y Colocaciones'
            ImageIndex = 1
            object GroupBox1: TGroupBox
              Left = 2
              Top = 0
              Width = 361
              Height = 174
              Caption = 'Aportaciones y Captaciones'
              TabOrder = 0
              object dbCaptacion: TDBGrid
                Left = 2
                Top = 12
                Width = 355
                Height = 156
                DataSource = DsCaptacion
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = dbCaptacionDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NUMERO'
                    Title.Caption = 'N'#250'mero'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SALDOA'
                    Title.Caption = 'Saldo Act.'
                    Width = 86
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CANJE'
                    Title.Caption = 'Canje'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DISPONIBLE'
                    Title.Caption = 'Disponible'
                    Width = 83
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO'
                    Title.Caption = 'Estado'
                    Width = 116
                    Visible = True
                  end>
              end
            end
            object GroupBox2: TGroupBox
              Left = 2
              Top = 165
              Width = 361
              Height = 163
              Caption = 'Colocaciones'
              TabOrder = 1
              object dbColocacion: TDBGrid
                Left = 1
                Top = 12
                Width = 356
                Height = 148
                DataSource = DsColocacion
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = dbColocacionDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COLOCACION'
                    Title.Caption = 'Colocacion'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Caption = 'Valor'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SALDO'
                    Title.Caption = 'Saldo'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FINTERES'
                    Title.Caption = 'F. Interes'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FCAPITAL'
                    Title.Caption = 'F. Capital'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO'
                    Title.Caption = 'Estado'
                    Width = 71
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VESTADO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'CUOTA'
                    Title.Caption = 'T. Cuota'
                    Width = 108
                    Visible = True
                  end>
              end
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Fianzas y Solicitudes'
            ImageIndex = 2
            object GroupBox3: TGroupBox
              Left = 1
              Top = -2
              Width = 362
              Height = 174
              Caption = 'Fianzas'
              TabOrder = 0
              object dbFinzas: TDBGrid
                Left = 3
                Top = 15
                Width = 349
                Height = 157
                DataSource = dsFianzas
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = dbFinzasDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COLOCACION'
                    Title.Caption = 'Colocacion'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Caption = 'Valor'
                    Width = 69
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SALDO'
                    Title.Caption = 'Saldo'
                    Width = 66
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FINTERES'
                    Title.Caption = 'F. Interes'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FCAPITAL'
                    Title.Caption = 'F. Capital'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO'
                    Title.Caption = 'Estado'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VESTADO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'CUOTA'
                    Title.Caption = 'Cuota'
                    Width = 101
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE'
                    Title.Caption = 'Asociado'
                    Visible = True
                  end>
              end
            end
            object GroupBox6: TGroupBox
              Left = 2
              Top = 169
              Width = 361
              Height = 161
              Caption = 'Solicitudes'
              TabOrder = 1
              object dbSolicitud: TDBGrid
                Left = 2
                Top = 13
                Width = 348
                Height = 141
                DataSource = DsSol
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = dbSolicitudDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SOLICITUD'
                    Title.Caption = 'Solicitud'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Caption = 'Valor'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO'
                    Title.Caption = 'Estado'
                    Width = 98
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VESTADO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA'
                    Title.Caption = 'F. Recepcion'
                    Visible = True
                  end>
              end
            end
          end
        end
      end
    end
  end
  object ImageTree: TImageList
    Left = 446
    Top = 38
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
      0000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000808000008080000000000000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000080800000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C0008080800080808000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000080800000000000FFFF0000FFFF0000FF00
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C0008080
      8000000000008080800080808000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000080800000000000FFFFFF00000000000080
      80000080800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000008000C0C0C000C0C0C000808080000000
      0000FFFFFF00808080008080800080808000C0C0C0000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008080800000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000C0C0C00080808000000000000000
      0000808080008080800080808000000000008080800000000000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00C0C0C000FFFFFF00FF000000FFFFFF00FF000000C0C0C000FFFF
      FF00FFFFFF00FF000000FFFFFF008080800000000000FFFF0000FFFF0000FF00
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000FFFFFF00FFFFFF00808080008080800000000000C0C0C000C0C0C0008080
      8000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000FF000000FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000FFFFFF008080800000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C000808080008080
      800080808000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FF000000FFFF
      FF00C0C0C000FFFFFF00FF000000FFFFFF00C0C0C000FF000000FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF008080800000000000FFFFFF0000000000FF00
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00C0C0C000C0C0C00080808000808080008080
      80008080800080808000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF008080800000000000FFFF0000FFFF0000FF00
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000C0C0C0008080800080808000808080000000
      0000000000008080800080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FF000000C0C0C000FFFFFF00FF000000FFFFFF00FFFFFF00C0C0
      C000FF000000FFFFFF00FFFFFF008080800000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080808000808080008080800000000000FFFF
      FF00000000008080800080808000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008080800000000000FFFFFF0000000000FF00
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000C0C0C000FFFF
      FF00FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000008000000000000000FFFF0000FFFF0000FF00
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000FFFFFF00FFFF
      FF00C0C0C000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000008000000000000000FFFFFF00FFFFFF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000000000C0C0
      C000FFFFFF000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000000080808000C0C0
      C00080808000C0C0C00000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000808080000080
      8000808080000080800000000000C0C0C0000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000800000008000000080000000800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000000000000000000000000000000000DDDD
      DD00CCCCCC00CCCCCC00CCCCCC00DDDDDD00F0FBFF00F0FBFF00F0FBFF00DDDD
      DD00DDDDDD00F0FBFF000000000000000000008080008080800080808000C0C0
      C00080808000C0C0C0000080800000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFFFF000080
      0000008000000080000000800000008000000080000000800000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0000000000000000000F0FBFF00CCCCCC00CCCC
      CC00C0C0C000C0C0C000C0C0C000C0C0C000CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00DDDDDD00F0FBFF000000000080808000C0C0C000808080000000
      000080808000C0C0C0008080800080808000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000080
      000000800000008000000080000000800000008000000080000000800000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C0C0
      C00080808000FFFFFF00FFFFFF0000000000C0C0C00000000000808080000000
      000000000000FFFFFF00C0C0C0000000000000000000CCCCCC00A4A0A000C0C0
      C0005555550044444400A4A0A000A4A0A000A4A0A000C0C0C000C0C0C000C0C0
      C000CCCCCC00A4A0A000F0FBFF00000000000000000000000000808080000000
      000080808000C0C0C000FFFFFF0080808000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008000000080000000800000008000000080000000800000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008080
      800000000000FFFFFF00C0C0C00000000000C0C0C00000000000808080000000
      000080808000FFFFFF00C0C0C0000000000000000000DDDDDD00CCCCCC00DDDD
      DD00CCCCCC00F0FBFF0011111100C0C0C000A4A0A000C0C0C000C0C0C000CCCC
      CC00003300000088000066666600000000000000000000000000808080000000
      000080808000C0C0C000FFFFFF0080808000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000800000008000000080000000800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C0C0
      C00080808000FFFFFF00C0C0C00000000000C0C0C00000000000C0C0C0008080
      800080808000FFFFFF00C0C0C0000000000000000000F0FBFF0055555500F0FB
      FF00CCCCCC00FFFFFF00F0FBFF00CCCCCC00C0C0C000CCCCCC003333330000BB
      0000003300000077000000220000F0FBFF000000000000000000808080000000
      000080808000C0C0C000FFFFFF0080808000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000800000FFFF
      FF00FFFFFF00FFFFFF000080000000800000FFFFFF00FFFFFF00FFFFFF000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00C0C0C000FFFFFF00FFFFFF00000000008080800000000000C0C0C000C0C0
      C00080808000FFFFFF00C0C0C0000000000000000000F0FBFF00666666009999
      9900A4A0A000DDDDDD00C0C0C000F0FBFF00C0C0C000A4A0A0000033000000BB
      0000003300000055000077777700000000000000000000000000808080000000
      000080808000C0C0C0000080800000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00008000000080
      0000FFFFFF00FFFFFF000080000000800000FFFFFF00FFFFFF00008000000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000008080800000000000FFFFFF00C0C0
      C00000000000FFFFFF00C0C0C000000000000000000000000000777777002222
      220099999900C0C0C000CCCCCC00F0FBFF009999990000CC000000CC00000055
      0000004400000000000000000000000000000000000000000000808080000080
      8000808080000080800000000000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00008000000080
      000000800000FFFFFF000080000000800000FFFFFF0000800000008000000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00C0C0C000FFFFFF00FFFFFF00000000008080800000000000FFFFFF00C0C0
      C00000000000FFFFFF00C0C0C000000000000000000000000000000000000000
      000044444400A4A0A000CCCCCC0044444400DDDDDD0000770000009933000000
      000000000000000000000000000000000000008080008080800080808000C0C0
      C0008080800000000000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00008000000080
      000000800000FFFFFF0000800000FFFFFF00FFFFFF0000800000008000000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C0C0
      C00080808000FFFFFF00FFFFFF0000000000C0C0C0000000000080808000C0C0
      C00080808000FFFFFF00C0C0C000000000000000000000000000000000000000
      00000000000022222200C0C0C000DDDDDD003333330000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000808080000000
      000080808000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00008000000080
      0000008000000080000000800000FFFFFF000080000000800000008000000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C0C0
      C00080808000FFFFFF00C0C0C00000000000808080000000000080808000C0C0
      C000C0C0C000FFFFFF00C0C0C000000000000000000000000000000000000000
      000055555500A4A0A000A4A0A000CCCCCC00DDDDDD00DDDDDD00000000000000
      0000000000000000000000000000000000008080800000000000808080000000
      000080808000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00008000000080
      0000008000000080000000800000FFFFFF00008000000080000000800000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C0C0
      C00080808000FFFFFF00C0C0C00000000000808080000000000080800000C0C0
      C000C0C0C000FFFFFF00C0C0C000000000000000000000000000DDDDDD007777
      7700333333000000000000000000A4A0A000DDDDDD0033333300000000000000
      00000000000000000000000000000000000080808000C0C0C000808080000000
      000080808000C0C0C0000080800000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000080
      0000008000000080000000800000FFFFFF00008000000080000000800000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008080
      000080800000FFFFFF00C0C0C00000000000808080000000000080800000FFFF
      FF00C0C0C000FFFFFF00C0C0C0000000000099999900F0FBFF00666666000000
      000000000000000000004444440099999900C0C0C000F0FBFF00C0C0C0000000
      0000000000000000000000000000000000000000000000808000808080000000
      0000808080000080800080808000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF008080800000000000FFFFFF00FFFFFF00FFFFFF000080
      0000008000000080000000800000FFFFFF000080000000800000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008080
      000080800000FFFFFF00C0C0C00000000000808080000000000080800000FFFF
      FF0080808000FFFFFF00C0C0C000000000006666660044444400000000000000
      0000000000000000000033333300999999005555550099999900C0C0C0009999
      9900000000000000000000000000000000000000000000000000808080000080
      80008080800000000000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080808000808080000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008000000080000000800000FFFFFF0000800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008080
      000080800000FFFFFF00FFFFFF00000000008080800000000000808000008080
      000080800000FFFFFF00C0C0C000000000000000000000000000000000000000
      0000000000000000000077777700999999001111110000000000A4A0A0000000
      0000000000000000000000000000000000000000000000000000808080000000
      000080808000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080808000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000A4A0A0004444440000000000000000000000
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
      00000000000000000000000000000000000000000000D4B6AB00F7EFE700F7E7
      CE00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7D6AD00F7D6AD00D4B6AB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C008C8C8C000000
      000039393900949494008C8C8C0000000000000000006394CE0021528400316B
      940008396B006394CE00528CBD006B9CCE00316B9400316B9400295A7B008484
      84000000000000000000000000000000000000000000FFF4F400FFF4F400F7EF
      E700F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DEBD00F7DE
      BD00F7DEBD00F7D6AD00F7D6AD00000000000000000000000000000000000000
      0000000000000000000039210000633131006331310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400FFFFFF00FFFFFF00FFFFFF0039393900DEAD8C00EFE7DE00EFDED6007363
      520063636300000000000000000000000000000000006394CE0021528400639C
      D6007BADE7009CB5D600B5B5BD00847B8400A5B5C600316B9400316B9400295A
      7B00394A4A0000000000000000000000000000000000FFF4F400E0E0E000A1A1
      A100A1A1A1008484840084848400F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7DEBD00F7D6AD00F7D6AD00000000000000000000000000523918005242
      3100000000003121000029210000CE630000523100006B42180000639C000073
      B5000073B5000000000000000000000000000000000000000000000000009494
      9400FFFFFF00DEDEDE00DEDEDE00BD9C7B00EFDED600E7CEB500E7CEB500E7CE
      B5004A4A4A00000000000000000000000000000000006394CE00639CD6008CBD
      EF009CB5D600CEC6CE00D6CED600948C9400B5B5B500528CB500316B9400316B
      9400295A7B0084848400000000000000000000000000FFF4F400FFF7EF00FFF7
      EF00F7EFE700F7EFE7002D2D2D00B5B5B500F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7DEBD00F7DEBD00000000000000000029210000D68400005A31
      00003921000021180000CE6300009C3100005A3900007B4A18007363520000A5
      E700188CCE0000639C0000000000000000000000000000000000000000009C9C
      9C00FFFFFF00D6D6D600D6D6D600EFD6C600EFDED600FFDECE00FFDECE00FFDE
      CE0094847B00000000000000000000000000000000004A7BB500949CA500E7E7
      E700E7E7E700EFEFEF00DED6DE00B5ADB500BDBDBD008C848C00ADBDC600316B
      9400316B9400295A7B00424A4A000000000000000000FFF4F400FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00D6D6D600428CDE0018556F00D6D6D600F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00F7DEBD000000000073634A00D6840000CE6300006339
      00004229000021180000211800005231080063390000734208005A5A5A0029BD
      FF0000A5E7000073B50000639C00000000000000000000000000000000009C9C
      9C00FFFFFF00FFFFFF00FFFFFF00CEBD9C00FFE7AD00FFFFFF00FFFFFF00FFE7
      AD007B7B7B00000000000000000000000000000000003963940094949C00EFEF
      EF00E7EFEF00ADADAD008C8C8C00DED6DE00B5ADB50094949400C6BDC600528C
      B500316B9400316B9400214252000000000000000000FFF4F400E0E0E000A1A1
      A100A1A1A100A1A1A100A1A1A10029799A008D787F008A5B5200848484008484
      84008484840084848400F7DEBD000000000063523100211800004A2900006339
      00004A2900008C6339009C632900844A0000633900003952520039ADD60000AD
      F70000CEFF0008B5FF0000A5E70000000000000000000000000000000000A5A5
      A500F7F7F700F7F7F700F7F7F700ADADAD0094949400EFD6C600E7CEB5009C9C
      9C00F7F7F7000000000000000000000000000000000000000000527B520039A5
      5A0029733100CE8CCE0094849400D6CED600D6CED600B5ADB500C6C6C6008484
      8400B5BDCE00316B9400214252000000000000000000FFF4F400E0E0E000A1A1
      A100A1A1A100A1A1A100A1A1A10085787C00FBCA9500F8B26600D47719008484
      84008484840084848400F7E7CE00000000000000000063313100845208005A39
      00005231080039ADD6005A847B00845200008452080039ADD60000CEFF0063CE
      FF0029BDFF0029BDFF0008B5FF000073B500000000000000000000000000A5A5
      A500EFEFEF00C6C6C600C6C6C600C6C6C600BDBDBD009C9C9C00A5A5A500EFEF
      EF00000000000000000000000000000000000000000000000000396B3900525A
      5200AD6BAD009C319C00947B8C00BDB5BD009C949C00DED6DE00BDBDBD009494
      9400CECECE004A84AD00214252000000000000000000FFF4F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD7B7300F9C08600F8B266008A5B
      5200D6D6D600F7EFE700F7EFE700000000000000000000000000736B42004A6B
      630039ADD60000ADF70000A5E70000ADF70000ADF70029BDFF0000CEFF0063CE
      FF0063CEFF0029BDFF0000CEFF0000639C00000000000000000000000000ADAD
      AD00E7E7E700BDBDBD00BDBDBD00E7E7E700ADADAD009C9C9C009C9C9C000000
      000000000000000000000000000000000000000000000000000000000000734A
      73007B394200F7944200D64A310073E7E70084A5A500CEC6CE00DED6DE00A5A5
      A500D6CED6004A6B8C00848C94000000000000000000EA8F3800EA8F3800EA8F
      3800EA8F3800EA8F3800EA8F3800EA8F3800EA8F3800AD7B7300FBD3A900F8B2
      6600D4771900CA847B00EA8F38000000000000000000000000000073B50039AD
      D60000CEFF0029BDFF0000ADF700009CE70000ADF70000ADF70029BDFF0000CE
      FF0063CEFF008CD6FF0029BDFF0000639C00000000000000000000000000ADAD
      AD00DEDEDE00DEDEDE00DEDEDE00D6D6D6009C9C9C00DEDEDE00EFEFEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C4A4A00945A63005AC6CE005ADEF7007B949C00C6BDC60094949400DED6
      DE00CEC6CE0000000000000000000000000000000000EFC68C00FFA13800FFA1
      3800FFA13800FFA13800FFA13800FFA13800FFA13800FFA13800AD7B7300B985
      8500299CEF000A62A000CA847B00000000000000000000000000000000000073
      B500009CCE009CDEFF0000CEFF0000ADF70000A5E70000ADF700009CCE0029BD
      FF0029BDFF009CDEFF0000A5E70000000000000000000000000000000000BDBD
      BD00CECECE00CECECE00CECECE00BDBDBD00ADADAD00EFEFEF00D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000738494004A6352004ABD730029943900C694C600A58CA5000000
      00000000000000000000000000000000000000000000EFC68C00EFC68C00EAB6
      7300EAB67300FFB55200A16A6A00000000000000000000000000000000004ABD
      FF00299CEF001029D6000316AC00000000000000000000000000000000000000
      00000073B50000ADF7009CDEFF0029BDFF0000ADF70000639C000000000000AD
      F70029BDFF0000A5E70000639C0000000000000000000000000000000000ADAD
      AD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00C6C6C600DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A7B5A004A6B4A00A57BA500AD42AD008C638C000000
      00000000000000000000000000000000000000000000D4B6AB00D4B6AB00D4B6
      AB00D4B6AB00D4B6AB0000000000000000000000000000000000000000000000
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
  object ImageCap: TImageList
    Left = 412
    Top = 28
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
  object IdTCPClient1: TIdTCPClient
    OnWork = IdTCPClient1Work
    OnWorkBegin = IdTCPClient1WorkBegin
    OnWorkEnd = IdTCPClient1WorkEnd
    Port = 0
    Left = 288
  end
  object DSTiposId: TDataSource
    AutoEdit = False
    DataSet = IbTipoId
    Left = 22
    Top = 124
  end
  object IbTipoId: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 336
    Top = 56
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 424
    Top = 65528
  end
  object IBAgencias: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT'
      '  "gen$agencia".DESCRIPCION_AGENCIA,'
      '  "gen$servidor".ID_HOST,'
      '  "gen$servidor".ID_PUERTO,'
      '  "gen$servidor".ID_AGENCIA'
      'FROM'
      ' "gen$servidor"'
      
        ' INNER JOIN "gen$agencia" ON ("gen$servidor".ID_AGENCIA="gen$age' +
        'ncia".ID_AGENCIA)'
      'WHERE'
      '  ("gen$servidor".ID_SERVICIO = 1) AND'
      '  ("gen$servidor".ID_AGENCIA <> :ID_AGENCIA) AND'
      '  ("gen$servidor".ID_AGENCIA > 0)')
    Left = 304
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
  object cdPersona: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TPERSONA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ECIVIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SEXO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FECHAN'
        DataType = ftDate
      end
      item
        Name = 'TIPOA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EDUCACION'
        DataType = ftSmallint
      end
      item
        Name = 'PROFESION'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'FECHAE'
        DataType = ftDate
      end
      item
        Name = 'CARGO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'RETENCION'
        DataType = ftSmallint
      end
      item
        Name = 'ACTIVO'
        DataType = ftCurrency
      end
      item
        Name = 'PASIVO'
        DataType = ftCurrency
      end
      item
        Name = 'FECHAACT'
        DataType = ftDate
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'AGENCIA'
        DataType = ftSmallint
      end
      item
        Name = 'LUGARN'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'FECHAA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'EMPLEADO'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 200
    Data = {
      F00100009619E0BD010000001800000013000000000003000000F00108545045
      52534F4E4101004900000001000557494454480200020032000645434956494C
      0100490000000100055749445448020002003200045345584F01004900000001
      00055749445448020002000F000646454348414E040006000000000005544950
      4F41010049000000010005574944544802000200320009454455434143494F4E
      02000100000000000950524F464553494F4E0200490000000100055749445448
      02000200F40107454D5052455341020049000000010005574944544802000200
      FF0006464543484145040006000000000005434152474F020049000000010005
      574944544802000200FF0009524554454E43494F4E0200010000000000064143
      5449564F080004000000010007535542545950450200490006004D6F6E657900
      0650415349564F080004000000010007535542545950450200490006004D6F6E
      6579000846454348414143540400060000000000064E4F4D4252450200490000
      000100055749445448020002002C01074147454E434941020001000000000006
      4C554741524E020049000000010005574944544802000200FF00064645434841
      410100490000000100055749445448020002000A0008454D504C4541444F0200
      49000000010005574944544802000200FF000000}
    object cdPersonaTPERSONA: TStringField
      FieldName = 'TPERSONA'
      Size = 50
    end
    object cdPersonaECIVIL: TStringField
      FieldName = 'ECIVIL'
      Size = 50
    end
    object cdPersonaSEXO: TStringField
      FieldName = 'SEXO'
      Size = 15
    end
    object cdPersonaFECHAN: TDateField
      FieldName = 'FECHAN'
    end
    object cdPersonaTIPOA: TStringField
      FieldName = 'TIPOA'
      Size = 50
    end
    object cdPersonaEDUCACION: TSmallintField
      FieldName = 'EDUCACION'
    end
    object cdPersonaPROFESION: TStringField
      FieldName = 'PROFESION'
      Size = 500
    end
    object cdPersonaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 255
    end
    object cdPersonaFECHAE: TDateField
      FieldName = 'FECHAE'
    end
    object cdPersonaCARGO: TStringField
      FieldName = 'CARGO'
      Size = 255
    end
    object cdPersonaRETENCION: TSmallintField
      FieldName = 'RETENCION'
    end
    object cdPersonaACTIVO: TCurrencyField
      FieldName = 'ACTIVO'
    end
    object cdPersonaPASIVO: TCurrencyField
      FieldName = 'PASIVO'
    end
    object cdPersonaFECHAACT: TDateField
      FieldName = 'FECHAACT'
    end
    object cdPersonaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 300
    end
    object cdPersonaAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
    end
    object cdPersonaLUGARN: TStringField
      FieldName = 'LUGARN'
      Size = 255
    end
    object cdPersonaFECHAA: TStringField
      FieldName = 'FECHAA'
      Size = 10
    end
    object cdPersonaEMPLEADO: TStringField
      FieldName = 'EMPLEADO'
      Size = 255
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 200
    Top = 8
  end
  object cdCaptacion: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'SALDOA'
        DataType = ftCurrency
      end
      item
        Name = 'CANJE'
        DataType = ftCurrency
      end
      item
        Name = 'DISPONIBLE'
        DataType = ftCurrency
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AGENCIA'
        DataType = ftSmallint
      end
      item
        Name = 'TIPO'
        DataType = ftSmallint
      end
      item
        Name = 'VESTADO'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 544
    Top = 80
    Data = {
      E90000009619E0BD010000001800000008000000000003000000E900064E554D
      45524F0100490000000100055749445448020002000B000653414C444F410800
      04000000010007535542545950450200490006004D6F6E6579000543414E4A45
      080004000000010007535542545950450200490006004D6F6E6579000A444953
      504F4E49424C45080004000000010007535542545950450200490006004D6F6E
      6579000645535441444F01004900000001000557494454480200020014000741
      47454E4349410200010000000000045449504F02000100000000000756455354
      41444F02000100000000000000}
    object cdCaptacionNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 11
    end
    object cdCaptacionSALDOA: TCurrencyField
      FieldName = 'SALDOA'
    end
    object cdCaptacionCANJE: TCurrencyField
      FieldName = 'CANJE'
    end
    object cdCaptacionDISPONIBLE: TCurrencyField
      FieldName = 'DISPONIBLE'
    end
    object cdCaptacionESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object cdCaptacionAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
    end
    object cdCaptacionTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdCaptacionVESTADO: TSmallintField
      FieldName = 'VESTADO'
    end
  end
  object DsCaptacion: TDataSource
    DataSet = CdCuenta
    Left = 56
    Top = 96
  end
  object CdCuenta: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'SALDOA'
        DataType = ftCurrency
      end
      item
        Name = 'CANJE'
        DataType = ftCurrency
      end
      item
        Name = 'DISPONIBLE'
        DataType = ftCurrency
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VESTADO'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 32
    Top = 320
    Data = {
      CC0000009619E0BD010000001800000006000000000003000000CC00064E554D
      45524F0100490000000100055749445448020002000B000653414C444F410800
      04000000010007535542545950450200490006004D6F6E6579000543414E4A45
      080004000000010007535542545950450200490006004D6F6E6579000A444953
      504F4E49424C45080004000000010007535542545950450200490006004D6F6E
      6579000645535441444F01004900000001000557494454480200020014000756
      45535441444F02000100000000000000}
    object StringField1: TStringField
      FieldName = 'NUMERO'
      Size = 11
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'SALDOA'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'CANJE'
    end
    object CurrencyField3: TCurrencyField
      FieldName = 'DISPONIBLE'
    end
    object StringField2: TStringField
      FieldName = 'ESTADO'
    end
    object CdCuentaVESTADO: TSmallintField
      FieldName = 'VESTADO'
    end
  end
  object cdColocacion: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COLOCACION'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'SALDO'
        DataType = ftCurrency
      end
      item
        Name = 'FINTERES'
        DataType = ftDate
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FCAPITAL'
        DataType = ftDate
      end
      item
        Name = 'CUOTA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'AGENCIA'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 168
    Data = {
      000100009619E0BD01000000180000000900000000000300000000010A434F4C
      4F434143494F4E0100490000000100055749445448020002000F000556414C4F
      52080004000000010007535542545950450200490006004D6F6E657900055341
      4C444F080004000000010007535542545950450200490006004D6F6E65790008
      46494E544552455304000600000000000645535441444F010049000000010005
      5749445448020002001400075645535441444F01004900000001000557494454
      4802000200140008464341504954414C04000600000000000543554F54410100
      490000000100055749445448020002001E00074147454E434941020001000000
      00000000}
    object cdColocacionCOLOCACION: TStringField
      FieldName = 'COLOCACION'
      Size = 15
    end
    object cdColocacionVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object cdColocacionSALDO: TCurrencyField
      FieldName = 'SALDO'
    end
    object cdColocacionFINTERES: TDateField
      FieldName = 'FINTERES'
    end
    object cdColocacionESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object cdColocacionVESTADO: TStringField
      FieldName = 'VESTADO'
    end
    object cdColocacionFCAPITAL: TDateField
      FieldName = 'FCAPITAL'
    end
    object cdColocacionCUOTA: TStringField
      FieldName = 'CUOTA'
      Size = 30
    end
    object cdColocacionAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
    end
  end
  object CdCol: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'VESTADO'
    Params = <>
    Left = 16
    Top = 200
    Data = {
      F00000009619E0BD010000001800000008000000000003000000F0000A434F4C
      4F434143494F4E0100490000000100055749445448020002000F000556414C4F
      52080004000000010007535542545950450200490006004D6F6E657900055341
      4C444F080004000000010007535542545950450200490006004D6F6E65790008
      46494E544552455304000600000000000645535441444F010049000000010005
      5749445448020002001400075645535441444F01004900000001000557494454
      4802000200140008464341504954414C04000600000000000543554F54410100
      490000000100055749445448020002001E000000}
    object StringField3: TStringField
      FieldName = 'COLOCACION'
      Size = 15
    end
    object CurrencyField4: TCurrencyField
      FieldName = 'VALOR'
    end
    object CurrencyField5: TCurrencyField
      FieldName = 'SALDO'
    end
    object DateField1: TDateField
      FieldName = 'FINTERES'
    end
    object DateField2: TDateField
      FieldName = 'FCAPITAL'
    end
    object StringField4: TStringField
      FieldName = 'ESTADO'
    end
    object StringField5: TStringField
      FieldName = 'VESTADO'
    end
    object StringField6: TStringField
      FieldName = 'CUOTA'
      Size = 30
    end
  end
  object DsColocacion: TDataSource
    DataSet = CdCol
    Left = 24
    Top = 96
  end
  object cdFianzas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COLOCACION'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'SALDO'
        DataType = ftCurrency
      end
      item
        Name = 'FINTERES'
        DataType = ftDate
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FCAPITAL'
        DataType = ftDate
      end
      item
        Name = 'CUOTA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AGENCIA'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'VESTADO'
    Params = <>
    StoreDefs = True
    Left = 112
    Top = 240
    Data = {
      1B0100009619E0BD01000000180000000A0000000000030000001B010A434F4C
      4F434143494F4E0100490000000100055749445448020002000F000556414C4F
      52080004000000010007535542545950450200490006004D6F6E657900055341
      4C444F080004000000010007535542545950450200490006004D6F6E65790008
      46494E544552455304000600000000000645535441444F010049000000010005
      5749445448020002001400075645535441444F01004900000001000557494454
      4802000200140008464341504954414C04000600000000000543554F54410100
      490000000100055749445448020002001E00064E4F4D42524502004900000001
      0005574944544802000200FF00074147454E43494102000100000000000000}
    object StringField7: TStringField
      FieldName = 'COLOCACION'
      Size = 15
    end
    object CurrencyField6: TCurrencyField
      FieldName = 'VALOR'
    end
    object CurrencyField7: TCurrencyField
      FieldName = 'SALDO'
    end
    object DateField3: TDateField
      FieldName = 'FINTERES'
    end
    object StringField8: TStringField
      FieldName = 'ESTADO'
    end
    object StringField9: TStringField
      FieldName = 'VESTADO'
    end
    object DateField4: TDateField
      FieldName = 'FCAPITAL'
    end
    object StringField10: TStringField
      FieldName = 'CUOTA'
      Size = 30
    end
    object cdFianzasNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 255
    end
    object cdFianzasAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
    end
  end
  object cdF: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COLOCACION'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'SALDO'
        DataType = ftCurrency
      end
      item
        Name = 'FINTERES'
        DataType = ftDate
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FCAPITAL'
        DataType = ftDate
      end
      item
        Name = 'CUOTA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'VESTADO'
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 168
    Data = {
      0B0100009619E0BD0100000018000000090000000000030000000B010A434F4C
      4F434143494F4E0100490000000100055749445448020002000F000556414C4F
      52080004000000010007535542545950450200490006004D6F6E657900055341
      4C444F080004000000010007535542545950450200490006004D6F6E65790008
      46494E544552455304000600000000000645535441444F010049000000010005
      5749445448020002001400075645535441444F01004900000001000557494454
      4802000200140008464341504954414C04000600000000000543554F54410100
      490000000100055749445448020002001E00064E4F4D42524502004900000001
      0005574944544802000200FF000000}
    object StringField11: TStringField
      FieldName = 'COLOCACION'
      Size = 15
    end
    object CurrencyField8: TCurrencyField
      FieldName = 'VALOR'
    end
    object CurrencyField9: TCurrencyField
      FieldName = 'SALDO'
    end
    object DateField5: TDateField
      FieldName = 'FINTERES'
    end
    object StringField12: TStringField
      FieldName = 'ESTADO'
    end
    object StringField13: TStringField
      FieldName = 'VESTADO'
    end
    object DateField6: TDateField
      FieldName = 'FCAPITAL'
    end
    object StringField14: TStringField
      FieldName = 'CUOTA'
      Size = 30
    end
    object StringField15: TStringField
      FieldName = 'NOMBRE'
      Size = 255
    end
  end
  object dsFianzas: TDataSource
    DataSet = cdF
    Left = 168
    Top = 192
  end
  object cdSolicitud: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SOLICITUD'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'VESTADO'
        DataType = ftSmallint
      end
      item
        Name = 'FECHA'
        DataType = ftDate
      end
      item
        Name = 'AGENCIA'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 264
    Data = {
      A30000009619E0BD010000001800000006000000000003000000A30009534F4C
      4943495455440100490000000100055749445448020002000C000556414C4F52
      080004000000010007535542545950450200490006004D6F6E65790006455354
      41444F0100490000000100055749445448020002001900075645535441444F02
      000100000000000546454348410400060000000000074147454E434941020001
      00000000000000}
    object cdSolicitudSOLICITUD: TStringField
      FieldName = 'SOLICITUD'
      Size = 12
    end
    object cdSolicitudVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object cdSolicitudESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 25
    end
    object cdSolicitudVESTADO: TSmallintField
      FieldName = 'VESTADO'
    end
    object cdSolicitudFECHA: TDateField
      FieldName = 'FECHA'
    end
    object cdSolicitudAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
    end
  end
  object cdSol: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 288
    Data = {
      930000009619E0BD010000001800000005000000000003000000930009534F4C
      4943495455440100490000000100055749445448020002000C000556414C4F52
      080004000000010007535542545950450200490006004D6F6E65790006455354
      41444F0100490000000100055749445448020002001900075645535441444F02
      0001000000000005464543484104000600000000000000}
    object StringField16: TStringField
      FieldName = 'SOLICITUD'
      Size = 12
    end
    object CurrencyField10: TCurrencyField
      FieldName = 'VALOR'
    end
    object StringField17: TStringField
      FieldName = 'ESTADO'
      Size = 25
    end
    object SmallintField1: TSmallintField
      FieldName = 'VESTADO'
    end
    object DateField7: TDateField
      FieldName = 'FECHA'
    end
  end
  object DsSol: TDataSource
    DataSet = cdSol
    Left = 144
    Top = 304
  end
end
