object frmEntregaAyudasSolidaridad: TfrmEntregaAyudasSolidaridad
  Left = 439
  Top = 131
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Ayudas de Solidaridad y Educaci'#243'n'
  ClientHeight = 526
  ClientWidth = 685
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 685
    Height = 526
    ActivePage = TabAportes
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabAportes: TTabSheet
      Caption = 'Asociados'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 677
        Height = 109
        Align = alTop
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 1
          Top = 1
          Width = 675
          Height = 107
          Align = alClient
          Caption = 'Seleccione el Asociado'
          TabOrder = 0
          object PageControl4: TPageControl
            Left = 2
            Top = 15
            Width = 671
            Height = 90
            ActivePage = TabSheet2
            Align = alClient
            TabIndex = 0
            TabOrder = 0
            object TabSheet2: TTabSheet
              Caption = 'Buscar por Documento'
              object Label1: TLabel
                Left = 6
                Top = 4
                Width = 94
                Height = 13
                Caption = 'Tipo de Documento'
              end
              object DBLCBTipoDocumento: TDBLookupComboBox
                Left = 6
                Top = 22
                Width = 205
                Height = 21
                KeyField = 'ID_IDENTIFICACION'
                ListField = 'DESCRIPCION_IDENTIFICACION'
                ListSource = DSTiposDocumento
                TabOrder = 0
              end
              object EdDocumento: TEdit
                Left = 214
                Top = 22
                Width = 147
                Height = 21
                MaxLength = 15
                TabOrder = 1
              end
              object CmdBuscarAsociadoDocumento: TBitBtn
                Left = 365
                Top = 20
                Width = 77
                Height = 24
                Caption = '&Buscar'
                TabOrder = 2
                OnClick = CmdBuscarAsociadoDocumentoClick
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
            object TabSheet5: TTabSheet
              Caption = 'Buscar por Cuenta'
              ImageIndex = 1
              object Label2: TLabel
                Left = 4
                Top = 4
                Width = 128
                Height = 13
                Caption = 'Cuenta de Aportes N'#250'mero'
              end
              object EdCuentaAportes: TJvIntegerEdit
                Left = 138
                Top = 2
                Width = 77
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
              object CmdBuscarAsociadoCuenta: TBitBtn
                Left = 221
                Top = 0
                Width = 77
                Height = 24
                Caption = '&Buscar'
                TabOrder = 1
                OnClick = CmdBuscarAsociadoCuentaClick
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
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 109
        Width = 677
        Height = 106
        Align = alTop
        TabOrder = 1
        object Label3: TLabel
          Left = 4
          Top = 1
          Width = 101
          Height = 13
          Caption = 'Nombre del Asociado'
        end
        object Label11: TLabel
          Left = 380
          Top = 17
          Width = 177
          Height = 13
          Caption = 'M'#225'xima Ayuda a la que puede aspirar'
        end
        object Label12: TLabel
          Left = 380
          Top = 38
          Width = 96
          Height = 13
          Caption = 'Ayuda ya Entregada'
        end
        object Label13: TLabel
          Left = 380
          Top = 59
          Width = 75
          Height = 13
          Caption = 'Valor Pendiente'
        end
        object EdNombreAsociado: TStaticText
          Left = 2
          Top = 17
          Width = 371
          Height = 23
          AutoSize = False
          BevelKind = bkSoft
          BevelOuter = bvSpace
          Color = clWhite
          ParentColor = False
          TabOrder = 0
        end
        object EdMaximaAyuda: TStaticText
          Left = 562
          Top = 15
          Width = 101
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          BevelKind = bkSoft
          Caption = '$ 0.00'
          Color = clWhite
          ParentColor = False
          TabOrder = 1
        end
        object EdAyudaEntregada: TStaticText
          Left = 562
          Top = 36
          Width = 101
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          BevelKind = bkSoft
          Caption = '$ 0.00'
          Color = clWhite
          ParentColor = False
          TabOrder = 2
        end
        object EdDisponible: TStaticText
          Left = 562
          Top = 57
          Width = 101
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          BevelKind = bkSoft
          Caption = '$ 0.00'
          Color = clWhite
          ParentColor = False
          TabOrder = 3
        end
        object GroupBox4: TGroupBox
          Left = 4
          Top = 37
          Width = 369
          Height = 68
          Caption = 'Requisitos'
          Enabled = False
          TabOrder = 4
          object chkEducacion: TCheckBox
            Left = 6
            Top = 14
            Width = 85
            Height = 17
            Caption = 'Educaci'#243'n'
            TabOrder = 0
          end
          object chkJuvenil: TCheckBox
            Left = 6
            Top = 37
            Width = 85
            Height = 17
            Caption = 'Ahorro Juvenil'
            TabOrder = 1
          end
          object chkAportesAnoAnterior: TCheckBox
            Left = 100
            Top = 13
            Width = 123
            Height = 17
            Caption = 'Aportes A'#241'o Anterior'
            TabOrder = 2
          end
          object chkAportesPresenteAno: TCheckBox
            Left = 100
            Top = 31
            Width = 127
            Height = 17
            Caption = 'Aportes Presente A'#241'o'
            TabOrder = 3
          end
          object chkDeudas: TCheckBox
            Left = 230
            Top = 13
            Width = 123
            Height = 17
            Caption = 'Deudas al D'#237'a'
            TabOrder = 4
          end
          object chkFianzas: TCheckBox
            Left = 230
            Top = 31
            Width = 127
            Height = 17
            Caption = 'Fianzas al D'#237'a'
            TabOrder = 5
          end
          object chkAhorrosPresenteAno: TCheckBox
            Left = 101
            Top = 48
            Width = 127
            Height = 17
            Caption = 'Ahorros Presente A'#241'o'
            TabOrder = 6
          end
          object chkApertura: TCheckBox
            Left = 230
            Top = 48
            Width = 127
            Height = 17
            Caption = 'Fecha de Apertura'
            TabOrder = 7
          end
        end
        object EdMensajes: TStaticText
          Left = 378
          Top = 80
          Width = 286
          Height = 21
          AutoSize = False
          BevelKind = bkSoft
          Color = clWhite
          ParentColor = False
          TabOrder = 5
        end
        object RadioGroup1: TRadioGroup
          Left = 680
          Top = 56
          Width = 185
          Height = 105
          Caption = 'RadioGroup1'
          TabOrder = 6
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 215
        Width = 677
        Height = 248
        Align = alClient
        TabOrder = 2
        object GroupBox3: TGroupBox
          Left = 1
          Top = 1
          Width = 675
          Height = 246
          Align = alClient
          Caption = 'Ayudas a Entregar'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          object Label14: TLabel
            Left = 248
            Top = 143
            Width = 57
            Height = 13
            Caption = 'Valor Ayuda'
          end
          object Label18: TLabel
            Left = 384
            Top = 143
            Width = 64
            Height = 13
            Caption = 'Valor Copago'
          end
          object Label9: TLabel
            Left = 248
            Top = 106
            Width = 55
            Height = 13
            Caption = 'Beneficiario'
          end
          object dbListmedicos: TDBLookupListBox
            Left = 248
            Top = 37
            Width = 274
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            KeyField = 'ID_MEDICO'
            ListField = 'NOMBRE'
            ListSource = DSMedicos
            ParentFont = False
            TabOrder = 0
            OnClick = dbListmedicosClick
          end
          object EdValor: TStaticText
            Left = 248
            Top = 158
            Width = 137
            Height = 24
            Alignment = taRightJustify
            AutoSize = False
            BevelInner = bvLowered
            BevelKind = bkTile
            BevelOuter = bvSpace
            BiDiMode = bdLeftToRight
            BorderStyle = sbsSunken
            Color = clBtnHighlight
            ParentBiDiMode = False
            ParentColor = False
            TabOrder = 1
          end
          object HeaderControl1: THeaderControl
            Left = 250
            Top = 17
            Width = 227
            Height = 17
            Align = alNone
            DragReorder = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Sections = <
              item
                AllowClick = False
                ImageIndex = -1
                MaxWidth = 233
                MinWidth = 181
                Text = 'MEDICO - INSTITUCION'
                Width = 233
              end>
            ParentFont = False
          end
          object EdCopago: TStaticText
            Left = 386
            Top = 158
            Width = 142
            Height = 24
            Alignment = taRightJustify
            AutoSize = False
            BevelInner = bvLowered
            BevelKind = bkTile
            BevelOuter = bvSpace
            BiDiMode = bdLeftToRight
            BorderStyle = sbsSunken
            Color = clBtnHighlight
            ParentBiDiMode = False
            ParentColor = False
            TabOrder = 3
          end
          object grpAyudas: TRadioGroup
            Left = 2
            Top = 32
            Width = 239
            Height = 209
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = grpAyudasClick
          end
          object HeaderControl2: THeaderControl
            Left = 2
            Top = 15
            Width = 239
            Height = 17
            Align = alNone
            DragReorder = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Sections = <
              item
                Alignment = taCenter
                AllowClick = False
                ImageIndex = -1
                MaxWidth = 200
                MinWidth = 42
                Text = 'Tipo de Ayuda'
                Width = 160
              end
              item
                AllowClick = False
                ImageIndex = -1
                MaxWidth = 181
                MinWidth = 181
                Text = 'Valor M'#225'ximo'
                Width = 181
              end>
            ParentFont = False
          end
          object GroupBox7: TGroupBox
            Left = 240
            Top = 184
            Width = 433
            Height = 57
            Caption = 'Ayudas Entregadas en el Periodo'
            TabOrder = 6
            object lAyuda: TListBox
              Left = 1
              Top = 13
              Width = 200
              Height = 40
              ItemHeight = 13
              TabOrder = 0
            end
            object lLista1: TListBox
              Left = 201
              Top = 13
              Width = 228
              Height = 40
              ItemHeight = 13
              TabOrder = 1
            end
          end
          object EdBeneficiario: TEdit
            Left = 248
            Top = 120
            Width = 190
            Height = 21
            TabOrder = 7
          end
          object cbParentesco: TComboBox
            Left = 440
            Top = 120
            Width = 82
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            MaxLength = 200
            TabOrder = 8
            Text = 'TITULAR'
            Items.Strings = (
              'TITULAR'
              'ESPOSO(A)'
              'HIJO(A('
              'HERMANO(A)'
              'PADRE'
              'MADRE')
          end
          object Panel7: TPanel
            Left = 526
            Top = 39
            Width = 144
            Height = 146
            BorderStyle = bsSingle
            TabOrder = 9
            object ImgFotoC: TImage
              Left = 2
              Top = 4
              Width = 135
              Height = 135
              Hint = 'Fotografia del Asociado'
              ParentShowHint = False
              ShowHint = True
              Stretch = True
            end
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 463
        Width = 677
        Height = 35
        Align = alBottom
        Color = clOlive
        TabOrder = 3
        object CmdCerrar: TBitBtn
          Left = 596
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Cerrar'
          TabOrder = 2
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
        object CmdAplicar: TBitBtn
          Left = 486
          Top = 6
          Width = 105
          Height = 25
          Caption = '&Aplicar Ayuda'
          TabOrder = 0
          OnClick = CmdAplicarClick
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
        object CmdOtro: TBitBtn
          Left = 6
          Top = 8
          Width = 75
          Height = 23
          Caption = '&Otro'
          TabOrder = 1
          OnClick = CmdOtroClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            080000000000000100000E0F00000E0F00000001000000010000FF00FF00B584
            8400B5948C00C6A59C00D6BDB500E7C6B500E7CECE0000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000020101010101010200000000000000000106060606
            0606010100000000000000010606060606060103010000000000000204040404
            0404010303010000000000000205050505050501030301000000000000020505
            0505050501030301000000000000020505050505050103030100000000000002
            0505050505050103010000000000000002050505050505010100000000000000
            0002050505050505010000000000000000000201010101010200000000000000
            0000000000000000000000000000000000000000000000000000}
        end
      end
    end
    object TabJuvenil: TTabSheet
      Caption = 'Ni'#241'o Ahorrador'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 677
        Height = 97
        Align = alTop
        Caption = 'Seleccione el Ni'#241'o'
        TabOrder = 0
        object PageControl5: TPageControl
          Left = 2
          Top = 15
          Width = 673
          Height = 80
          ActivePage = TabSheet6
          Align = alClient
          TabIndex = 0
          TabOrder = 0
          object TabBuscarDocumentoAsociadoJuvenil: TTabSheet
            Caption = 'Buscar por Documento'
            TabVisible = False
            object Label7: TLabel
              Left = 6
              Top = 4
              Width = 94
              Height = 13
              Caption = 'Tipo de Documento'
            end
            object DBLCBTipoDocumentoJuvenil: TDBLookupComboBox
              Left = 6
              Top = 22
              Width = 205
              Height = 21
              KeyField = 'ID_IDENTIFICACION'
              ListField = 'DESCRIPCION_IDENTIFICACION'
              ListSource = DSTiposDocumento
              TabOrder = 0
            end
            object EdDocumentoJuvenil: TEdit
              Left = 214
              Top = 22
              Width = 147
              Height = 21
              MaxLength = 15
              TabOrder = 1
            end
            object CmdBuscarJuvenilDoc: TBitBtn
              Left = 365
              Top = 20
              Width = 77
              Height = 24
              Caption = '&Buscar'
              TabOrder = 2
              OnClick = CmdBuscarJuvenilDocClick
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
          object TabSheet6: TTabSheet
            Caption = 'Buscar por Cuenta'
            ImageIndex = 1
            object Label8: TLabel
              Left = 4
              Top = 4
              Width = 110
              Height = 13
              Caption = 'Cuenta Juvenil N'#250'mero'
            end
            object EdCuentaJuvenil: TJvIntegerEdit
              Left = 138
              Top = 2
              Width = 77
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
            object CmdBuscarJuvenilCuenta: TBitBtn
              Left = 221
              Top = 0
              Width = 77
              Height = 24
              Caption = '&Buscar'
              TabOrder = 1
              OnClick = CmdBuscarJuvenilCuentaClick
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
      end
      object Panel3: TPanel
        Left = 0
        Top = 97
        Width = 677
        Height = 140
        Align = alTop
        TabOrder = 1
        object Label4: TLabel
          Left = 4
          Top = 4
          Width = 79
          Height = 13
          Caption = 'Nombre del Ni'#241'o'
        end
        object Label5: TLabel
          Left = 256
          Top = 6
          Width = 110
          Height = 13
          Caption = 'Identificaci'#243'n Asociado'
        end
        object Label6: TLabel
          Left = 371
          Top = 6
          Width = 101
          Height = 13
          Caption = 'Nombre del Asociado'
        end
        object Label15: TLabel
          Left = 380
          Top = 50
          Width = 177
          Height = 13
          Caption = 'M'#225'xima Ayuda a la que puede aspirar'
        end
        object Label16: TLabel
          Left = 380
          Top = 71
          Width = 96
          Height = 13
          Caption = 'Ayuda ya Entregada'
        end
        object Label17: TLabel
          Left = 380
          Top = 92
          Width = 75
          Height = 13
          Caption = 'Valor Pendiente'
        end
        object EdNombreJuvenil: TStaticText
          Left = 2
          Top = 22
          Width = 251
          Height = 23
          AutoSize = False
          BevelKind = bkSoft
          BevelOuter = bvSpace
          Color = clWhite
          ParentColor = False
          TabOrder = 0
        end
        object EdIdentificacionAsociadoJuvenil: TStaticText
          Left = 256
          Top = 22
          Width = 111
          Height = 23
          AutoSize = False
          BevelKind = bkSoft
          BevelOuter = bvSpace
          Color = clWhite
          ParentColor = False
          TabOrder = 1
        end
        object EdNombreAsociadoJuvenil: TStaticText
          Left = 369
          Top = 22
          Width = 303
          Height = 23
          AutoSize = False
          BevelKind = bkSoft
          BevelOuter = bvSpace
          Color = clWhite
          ParentColor = False
          TabOrder = 2
        end
        object GroupBox5: TGroupBox
          Left = 2
          Top = 43
          Width = 369
          Height = 80
          Caption = 'Requisitos'
          Enabled = False
          TabOrder = 3
          object chkEducacionJ: TCheckBox
            Left = 6
            Top = 14
            Width = 85
            Height = 17
            Caption = 'Educaci'#243'n'
            TabOrder = 0
          end
          object chkJuvenilJ: TCheckBox
            Left = 6
            Top = 37
            Width = 85
            Height = 17
            Caption = 'Ahorro Juvenil'
            TabOrder = 1
          end
          object chkAportesAnoAnteriorJ: TCheckBox
            Left = 100
            Top = 13
            Width = 123
            Height = 17
            Caption = 'Aportes A'#241'o Anterior'
            TabOrder = 2
          end
          object chkAportesPresenteAnoJ: TCheckBox
            Left = 100
            Top = 28
            Width = 127
            Height = 17
            Caption = 'Aportes Presente A'#241'o'
            TabOrder = 3
          end
          object chkDeudasJ: TCheckBox
            Left = 230
            Top = 13
            Width = 123
            Height = 17
            Caption = 'Deudas al D'#237'a'
            TabOrder = 4
          end
          object chkFianzasJ: TCheckBox
            Left = 230
            Top = 30
            Width = 127
            Height = 17
            Caption = 'Fianzas al D'#237'a'
            TabOrder = 5
          end
          object chkAhorrosPresenteAnoJ: TCheckBox
            Left = 101
            Top = 43
            Width = 127
            Height = 17
            Caption = 'Ahorros Presente A'#241'o'
            TabOrder = 6
          end
          object chkAperturaJ: TCheckBox
            Left = 230
            Top = 47
            Width = 127
            Height = 17
            Caption = 'Fecha de Apertura'
            TabOrder = 7
          end
        end
        object EdMaximaAyudaJ: TStaticText
          Left = 562
          Top = 48
          Width = 101
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          BevelKind = bkSoft
          Caption = '$ 0.00'
          Color = clWhite
          ParentColor = False
          TabOrder = 4
        end
        object EdAyudaEntregadaJ: TStaticText
          Left = 562
          Top = 69
          Width = 101
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          BevelKind = bkSoft
          Caption = '$ 0.00'
          Color = clWhite
          ParentColor = False
          TabOrder = 5
        end
        object EdDisponibleJ: TStaticText
          Left = 562
          Top = 90
          Width = 101
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          BevelKind = bkSoft
          Caption = '$ 0.00'
          Color = clWhite
          ParentColor = False
          TabOrder = 6
        end
        object EdMensajesJ: TStaticText
          Left = 378
          Top = 113
          Width = 286
          Height = 21
          AutoSize = False
          BevelKind = bkSoft
          Color = clWhite
          ParentColor = False
          TabOrder = 7
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 238
        Width = 287
        Height = 47
        Caption = 'Ayuda Juvenil'
        TabOrder = 2
        object EdValorJ: TJvCurrencyEdit
          Left = 92
          Top = 14
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          ReadOnly = False
          TabOrder = 0
          OnExit = EdValorJExit
          HasMaxValue = True
          HasMinValue = False
        end
      end
      object Imagen1J: TDBImage
        Left = 292
        Top = 236
        Width = 191
        Height = 171
        DataField = 'FOTO'
        DataSource = DSPersonaJ
        Stretch = True
        TabOrder = 3
      end
      object Imagen2J: TDBImage
        Left = 484
        Top = 236
        Width = 191
        Height = 171
        DataField = 'FOTO'
        DataSource = DSPersona
        Stretch = True
        TabOrder = 4
      end
      object Panel6: TPanel
        Left = 0
        Top = 463
        Width = 677
        Height = 35
        Align = alBottom
        Color = clOlive
        TabOrder = 5
        object CmdCerrarJ: TBitBtn
          Left = 596
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Cerrar'
          TabOrder = 2
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
        object CmdAplicarAyudaJ: TBitBtn
          Left = 486
          Top = 6
          Width = 105
          Height = 25
          Caption = '&Aplicar Ayuda'
          TabOrder = 0
          OnClick = CmdAplicarAyudaJClick
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
        object CmdOtroJ: TBitBtn
          Left = 6
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Otro'
          TabOrder = 1
          OnClick = CmdOtroClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            080000000000000100000E0F00000E0F00000001000000010000FF00FF00B584
            8400B5948C00C6A59C00D6BDB500E7C6B500E7CECE0000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000020101010101010200000000000000000106060606
            0606010100000000000000010606060606060103010000000000000204040404
            0404010303010000000000000205050505050501030301000000000000020505
            0505050501030301000000000000020505050505050103030100000000000002
            0505050505050103010000000000000002050505050505010100000000000000
            0002050505050505010000000000000000000201010101010200000000000000
            0000000000000000000000000000000000000000000000000000}
        end
      end
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 646
    Top = 92
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 646
    Top = 82
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 618
    Top = 92
  end
  object DSTiposDocumento: TDataSource
    DataSet = IBQTiposDocumentos
    Left = 38
    Top = 38
  end
  object IBQTiposDocumentos: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 66
    Top = 38
  end
  object DSPersona: TDataSource
    DataSet = IBQPersona
    Left = 646
    Top = 216
  end
  object IBQPersona: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 618
    Top = 216
  end
  object Reporte: TprTxReport
    FromPage = 1
    ToPage = 1
    Title = 'FORMATO DE ENTREGA DE AYUDA'
    ExportFromPage = 0
    ExportToPage = 0
    Values = <>
    Variables = <
      item
        Name = 'EMPRESA'
        ValueType = 'prvvtString'
        Value = 'FUNDACION COOPSERVIR'
      end
      item
        Name = 'OFICINA'
        ValueType = 'prvvtString'
        Value = 'OCA'#209'A'
      end
      item
        Name = 'ASOCIADO'
        ValueType = 'prvvtString'
        Value = 'CRUZ MARQUEZ ALEXANDER DAVID'
      end
      item
        Name = 'AHORRADOR'
      end
      item
        Name = 'CUENTA'
        ValueType = 'prvvtString'
        Value = '101-0026305-7'
      end
      item
        Name = 'AYUDA'
        ValueType = 'prvvtString'
        Value = 'Auxilio por Enfermedad'
      end
      item
        Name = 'VALOR'
        ValueType = 'prvvtInteger'
        Value = 40000
      end
      item
        Name = 'CONSECUTIVO'
        ValueType = 'prvvtInteger'
        Value = 1
      end
      item
        Name = 'USUARIO'
        ValueType = 'prvvtString'
        Value = 'ALEXANDER DAVID CRUZ MARQUEZ'
      end
      item
        Name = 'CUENTAJ'
        ValueType = 'prvvtString'
        Value = '401-0003065-8'
      end
      item
        Name = 'MEDICO'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'VALIDO'
        ValueType = 'prvvtDateTime'
        Value = 38883d
      end
      item
        Name = 'COPAGO'
        ValueType = 'prvvtDouble'
        Value = 4000
      end
      item
        Name = 'DIRECCION'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'BENEFICIARIO'
        ValueType = 'prvvtString'
        Value = ''
      end>
    PrinterName = 'EPSON FX-1180+ ESC/P'
    ESCModelName = 'Epson printers'
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 646
    Top = 64
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
      LineNum = 20
      ColNum = 132
      object prTxHPageHeaderBand1: TprTxHPageHeaderBand
        Height = 20
        UseVerticalBands = False
        PrintOnFirstPage = True
        object prTxMemoObj1: TprTxMemoObj
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
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 22
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AYUDA ENTREGADA No.:')
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
          dRec.Right = 42
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA ENTREGA:[:<yyyy/MM/dd>StartDateTime]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 79
          dRec.Top = 0
          dRec.Right = 104
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'OFICINA:[OFICINA]')
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
          dRec.Right = 78
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'ASOCIADO:')
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
          dRec.Right = 10
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[ASOCIADO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 11
          dRec.Top = 2
          dRec.Right = 57
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Cuenta No.:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 58
          dRec.Top = 2
          dRec.Right = 69
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 70
          dRec.Top = 2
          dRec.Right = 83
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AYUDA:')
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
          dRec.Right = 7
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[AYUDA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold)
            end>
          dRec.Left = 8
          dRec.Top = 4
          dRec.Right = 65
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<000000>CONSECUTIVO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 42
          dRec.Top = 0
          dRec.Right = 50
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'APROBADA POR:')
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
          dRec.Top = 12
          dRec.Right = 80
          dRec.Bottom = 13
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[USUARIO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 81
          dRec.Top = 12
          dRec.Right = 126
          dRec.Bottom = 13
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '_________________________________________________')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 81
          dRec.Top = 11
          dRec.Right = 126
          dRec.Bottom = 12
          Visible = False
        end
        object prTxCommandObj1: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcCondensedOn)
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
          dRec.Left = 126
          dRec.Top = 11
          dRec.Right = 127
          dRec.Bottom = 12
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'MEDICO - INSTITUCION :')
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
          dRec.Right = 24
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[MEDICO]')
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
          dRec.Top = 6
          dRec.Right = 65
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CONSULTA VALIDA HASTA EL:')
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
          dRec.Right = 27
          dRec.Bottom = 11
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<dd "de" MMMM "de" yyyy>VALIDO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 27
          dRec.Top = 10
          dRec.Right = 62
          dRec.Bottom = 11
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR COPAGO  ')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 66
          dRec.Top = 4
          dRec.Right = 79
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<$#0,0>COPAGO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 79
          dRec.Top = 4
          dRec.Right = 89
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[DIRECCION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 66
          dRec.Top = 6
          dRec.Right = 125
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[BENEFICIARIO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold)
            end>
          dRec.Left = 1
          dRec.Top = 8
          dRec.Right = 65
          dRec.Bottom = 9
          Visible = False
        end
      end
    end
  end
  object IBSQL3: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 618
    Top = 64
  end
  object IBQPersonaJ: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 554
    Top = 214
  end
  object DSPersonaJ: TDataSource
    DataSet = IBQPersonaJ
    Left = 582
    Top = 214
  end
  object IBQMedicos: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT "fun$medicos".ID_MEDICO,"fun$medicos".NOMBRE'
      'FROM "fun$medicos"'
      
        'INNER JOIN "fun$medayu" ON ("fun$medayu".ID_MEDICO = "fun$medico' +
        's".ID_MEDICO)'
      
        'INNER JOIN "fun$ayudas" ON ("fun$ayudas".ID_AYUDA = "fun$medayu"' +
        '.ID_AYUDA)'
      'WHERE'
      '"fun$ayudas".ID_AYUDA = :ID_AYUDA')
    Left = 440
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AYUDA'
        ParamType = ptUnknown
      end>
    object IBQMedicosID_MEDICO: TSmallintField
      FieldName = 'ID_MEDICO'
      ProviderFlags = []
    end
    object IBQMedicosNOMBRE: TIBStringField
      DisplayWidth = 150
      FieldName = 'NOMBRE'
      ProviderFlags = []
      Size = 150
    end
  end
  object DSMedicos: TDataSource
    DataSet = IBQMedicos
    Left = 464
    Top = 216
  end
  object _ibq1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = _ibt1
    Left = 96
    Top = 296
  end
  object _ibt1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Left = 144
    Top = 296
  end
end
