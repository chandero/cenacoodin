object frmTablaLiquidacion: TfrmTablaLiquidacion
  Left = 264
  Top = 146
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Tabla de Pago Colocaci'#243'n'
  ClientHeight = 409
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GridTablaLiq: TXStringGrid
    Left = 0
    Top = 59
    Width = 665
    Height = 319
    ColCount = 7
    TabOrder = 0
    FixedLineColor = clBlack
    Columns = <
      item
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        Caption = 'No. Cuota'
        Width = 60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Alignment = taCenter
        EditorInheritsCellProps = False
      end
      item
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        Caption = 'Fecha Pago'
        Width = 80
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Alignment = taCenter
        EditorInheritsCellProps = False
      end
      item
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        Caption = 'Valor Capital'
        Width = 114
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
        Caption = 'Valor Inter'#233's'
        Width = 114
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
        Caption = 'Valor Total Cuota'
        Color = clInfoBk
        Width = 114
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
        Caption = 'Saldo Final'
        Color = clInfoBk
        Width = 114
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
        Caption = 'Pagada'
        Width = 42
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Editor = Checked
        EditorInheritsCellProps = False
      end>
    MultiLine = False
    ImmediateEditMode = False
    ColWidths = (
      60
      80
      114
      114
      114
      114
      42)
  end
  object Panel4: TPanel
    Left = 0
    Top = 378
    Width = 664
    Height = 31
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object CmdCerrar: TBitBtn
      Left = 294
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Cerrar'
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 57
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 8
      Top = 2
      Width = 369
      Height = 52
      TabOrder = 0
      object Label1: TLabel
        Left = 134
        Top = 18
        Width = 108
        Height = 13
        Caption = 'Colocaci'#243'n o Pagar'#233':  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 20
        Width = 39
        Height = 13
        Caption = 'Agencia'
      end
      object EdNumeroColocacion: TMaskEdit
        Left = 249
        Top = 14
        Width = 105
        Height = 24
        EditMask = '99999999999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 11
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '           '
      end
      object EdAgencia: TDBLookupComboBox
        Left = 59
        Top = 15
        Width = 69
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'ID_AGENCIA'
        ListField = 'DESCRIPCION_AGENCIA'
        ListSource = dmColocacion.DSagencia
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = EdAgenciaKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 394
      Top = 1
      Width = 257
      Height = 53
      TabOrder = 1
      object EdSaldoActual: TLabeledEdit
        Left = 8
        Top = 28
        Width = 115
        Height = 21
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = 'Saldo Actual'
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 0
      end
      object EdTasaMax: TLabeledEdit
        Left = 128
        Top = 28
        Width = 56
        Height = 21
        EditLabel.Width = 50
        EditLabel.Height = 13
        EditLabel.Caption = 'Tasa Max.'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 1
      end
      object EdTasaNominal: TLabeledEdit
        Left = 189
        Top = 28
        Width = 49
        Height = 21
        EditLabel.Width = 52
        EditLabel.Height = 13
        EditLabel.Caption = 'Tasa Nom.'
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 2
      end
    end
  end
  object Checked: TCheckListCellEditor
    DropdownHeight = 50
    DropDownStyle = dsFixed
    DropdownWidth = 0
    Columns = 0
    Items.Strings = (
      'SI'
      'NO')
    Left = 616
    Top = 104
  end
end
