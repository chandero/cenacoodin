object frmCalculoTasas: TfrmCalculoTasas
  Left = 472
  Top = 190
  Width = 325
  Height = 254
  Caption = 'C'#225'lculo de Tasas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 187
    Width = 317
    Height = 33
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object CmdAceptar: TBitBtn
      Left = 124
      Top = 5
      Width = 73
      Height = 25
      Caption = '&Calcular'
      TabOrder = 0
      OnClick = CmdAceptarClick
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
      Left = 205
      Top = 5
      Width = 73
      Height = 25
      Caption = 'C&errar'
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
  end
  object ControlTipoTasa: TPageControl
    Left = 0
    Top = 0
    Width = 314
    Height = 185
    ActivePage = InfoNomEfec
    TabIndex = 0
    TabOrder = 0
    OnChange = ControlTipoTasaChange
    object InfoNomEfec: TTabSheet
      Caption = 'Nominal a Efectiva'
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 297
        Height = 151
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 6
          Top = 43
          Width = 281
          Height = 102
          Caption = 'C'#225'lculo Tasa Efectiva Vencida'
          TabOrder = 2
          Visible = False
          object EdTasaNomVen: TLabeledEdit
            Left = 8
            Top = 37
            Width = 65
            Height = 21
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = 'Tasa Nominal'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 0
            OnExit = EdTasaNomVenExit
            OnKeyPress = EdTasaNomVenKeyPress
          end
          object EdAmortizaNomVen: TLabeledEdit
            Left = 84
            Top = 36
            Width = 73
            Height = 21
            EditLabel.Width = 60
            EditLabel.Height = 13
            EditLabel.Caption = 'Amortizaci'#243'n'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 1
            OnExit = EdAmortizaNomVenExit
            OnKeyPress = EdAmortizaNomVenKeyPress
          end
          object EdResEfecVen: TLabeledEdit
            Left = 166
            Top = 36
            Width = 81
            Height = 21
            Color = clSilver
            EditLabel.Width = 81
            EditLabel.Height = 13
            EditLabel.Caption = 'Efectiva Vencida'
            LabelPosition = lpAbove
            LabelSpacing = 3
            ReadOnly = True
            TabOrder = 2
          end
          object edMensualEfectiva: TLabeledEdit
            Left = 164
            Top = 74
            Width = 85
            Height = 21
            EditLabel.Width = 81
            EditLabel.Height = 13
            EditLabel.Caption = 'Nominal Mensual'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 3
          end
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 43
          Width = 281
          Height = 102
          Caption = 'C'#225'lculo Tasa Efectiva Anticipada'
          TabOrder = 1
          Visible = False
          object EdTasaNomAnt: TLabeledEdit
            Left = 8
            Top = 37
            Width = 65
            Height = 21
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = 'Tasa Nominal'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 0
            OnExit = EdTasaNomAntExit
            OnKeyPress = EdTasaNomAntKeyPress
          end
          object EdAmortizaNomAnt: TLabeledEdit
            Left = 84
            Top = 36
            Width = 73
            Height = 21
            EditLabel.Width = 60
            EditLabel.Height = 13
            EditLabel.Caption = 'Amortizaci'#243'n'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 1
            OnExit = EdAmortizaNomAntExit
            OnKeyPress = EdAmortizaNomAntKeyPress
          end
          object EdResEfecAnt: TLabeledEdit
            Left = 166
            Top = 36
            Width = 81
            Height = 21
            Color = clSilver
            EditLabel.Width = 92
            EditLabel.Height = 13
            EditLabel.Caption = 'Efectiva Anticipada'
            LabelPosition = lpAbove
            LabelSpacing = 3
            ReadOnly = True
            TabOrder = 2
          end
          object edEfectivaAnticipadaMensual: TLabeledEdit
            Left = 164
            Top = 74
            Width = 85
            Height = 21
            EditLabel.Width = 82
            EditLabel.Height = 13
            EditLabel.Caption = 'Efectiva Mensual'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 3
          end
        end
        object RadioEfectiva: TRadioGroup
          Left = 7
          Top = 0
          Width = 281
          Height = 41
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Anticipada'
            'Vencida')
          TabOrder = 0
          OnClick = RadioEfectivaClick
        end
      end
    end
    object InfoEfecNom: TTabSheet
      Caption = 'Efectiva a Nominal'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 297
        Height = 155
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 6
          Top = 43
          Width = 281
          Height = 99
          Caption = 'C'#225'lculo Tasa Nominal Vencida'
          TabOrder = 2
          Visible = False
          object EdTasaEfecVen: TLabeledEdit
            Left = 8
            Top = 37
            Width = 65
            Height = 21
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = 'Tasa Efectiva'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 0
            OnExit = EdTasaEfecVenExit
            OnKeyPress = EdTasaEfecVenKeyPress
          end
          object EdAmortizaEfecVen: TLabeledEdit
            Left = 84
            Top = 36
            Width = 73
            Height = 21
            EditLabel.Width = 60
            EditLabel.Height = 13
            EditLabel.Caption = 'Amortizaci'#243'n'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 1
            OnExit = EdAmortizaEfecVenExit
            OnKeyPress = EdAmortizaEfecVenKeyPress
          end
          object EdResNomVen: TLabeledEdit
            Left = 166
            Top = 36
            Width = 81
            Height = 21
            Color = clSilver
            EditLabel.Width = 80
            EditLabel.Height = 13
            EditLabel.Caption = 'Nominal Vencida'
            LabelPosition = lpAbove
            LabelSpacing = 3
            ReadOnly = True
            TabOrder = 2
          end
          object edMensualNominal: TLabeledEdit
            Left = 164
            Top = 74
            Width = 85
            Height = 21
            EditLabel.Width = 81
            EditLabel.Height = 13
            EditLabel.Caption = 'Nominal Mensual'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 3
          end
        end
        object RadioNominal: TRadioGroup
          Left = 7
          Top = 0
          Width = 281
          Height = 41
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Nominal Anticipada'
            'Nominal Vencida')
          TabOrder = 0
          OnClick = RadioNominalClick
        end
        object GroupBox3: TGroupBox
          Left = 6
          Top = 43
          Width = 281
          Height = 99
          Caption = 'C'#225'lculo Tasa Nominal Anticipada'
          TabOrder = 1
          Visible = False
          object EdTasaEfecAnt: TLabeledEdit
            Left = 8
            Top = 37
            Width = 65
            Height = 21
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = 'Tasa Efectiva'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 0
            OnExit = EdTasaEfecAntExit
            OnKeyPress = EdTasaEfecAntKeyPress
          end
          object EdAmortizaEfecAnt: TLabeledEdit
            Left = 84
            Top = 36
            Width = 73
            Height = 21
            EditLabel.Width = 60
            EditLabel.Height = 13
            EditLabel.Caption = 'Amortizaci'#243'n'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 1
            OnExit = EdAmortizaEfecAntExit
            OnKeyPress = EdAmortizaEfecAntKeyPress
          end
          object EdResNomAnt: TLabeledEdit
            Left = 166
            Top = 36
            Width = 81
            Height = 21
            Color = clSilver
            EditLabel.Width = 91
            EditLabel.Height = 13
            EditLabel.Caption = 'Nominal Anticipada'
            LabelPosition = lpAbove
            LabelSpacing = 3
            ReadOnly = True
            TabOrder = 2
          end
          object edMensualNominalAnticipada: TLabeledEdit
            Left = 164
            Top = 74
            Width = 85
            Height = 21
            EditLabel.Width = 81
            EditLabel.Height = 13
            EditLabel.Caption = 'Nominal Mensual'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 3
          end
        end
      end
    end
  end
end
