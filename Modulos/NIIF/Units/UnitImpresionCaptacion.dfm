object frmImpresionCaptacion: TfrmImpresionCaptacion
  Left = 337
  Top = 245
  Width = 512
  Height = 296
  Caption = 'Impresi'#243'n de la Captaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 504
    Height = 141
    Align = alTop
    TabOrder = 0
    object Label24: TLabel
      Left = 110
      Top = 10
      Width = 105
      Height = 13
      Caption = 'Tipo de Captaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 350
      Top = 8
      Width = 44
      Height = 13
      Caption = 'N'#250'mero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 2
      Top = 52
      Width = 44
      Height = 13
      Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 28
      Top = 10
      Width = 47
      Height = 13
      Caption = 'Agencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 2
      Top = 82
      Width = 100
      Height = 13
      Caption = 'Impresora Actual:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLCBTipoCaptacion: TDBLookupComboBox
      Left = 110
      Top = 24
      Width = 235
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'ID_TIPO_CAPTACION'
      ListField = 'DESCRIPCION'
      ListSource = DSTiposCaptacion
      ParentFont = False
      TabOrder = 1
    end
    object EdNumeroCap: TJvEdit
      Left = 348
      Top = 24
      Width = 81
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 7
      ParentFont = False
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 2
      OnEnter = EdNumeroCapEnter
      OnExit = EdNumeroCapExit
      OnKeyPress = EdNumeroCapKeyPress
    end
    object EdDigitoCap: TStaticText
      Left = 430
      Top = 24
      Width = 21
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkFlat
      BorderStyle = sbsSunken
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
    object EdNombreCap: TStaticText
      Left = 50
      Top = 50
      Width = 449
      Height = 21
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 5
    end
    object CmdImprimir: TBitBtn
      Left = 6
      Top = 110
      Width = 121
      Height = 25
      Caption = '&Imprimir Formulario'
      Enabled = False
      TabOrder = 3
      OnClick = CmdImprimirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B0000000100000001000000840000088C
        0800108C080018941000219410001894180029941800219C2100299C210029A5
        2900E78C31005AA53900B56B4A006BAD4A0073AD4A008C6B5200946B5200E79C
        5200A5635A00A56B5A00BD7B5A0084B55A00FFB55A0063BD6300A5636B00A573
        6B00BD846B00C6846B00D6946B00A5B56B0073BD6B00DE9C7300CEB5730094BD
        73009CBD7300ADBD730073C673007BC6730084C6730094C673009CC67300E7AD
        7B00DEBD7B00EFBD7B009CC67B00EFC67B00EFBD84009CC68400EFC68400F7C6
        840084CE8400EFC68C00F7CE8C00B5AD9400ADB59400EFC69400A5CE9400C6CE
        9400D6CE9400E7CE9400F7CE9400BDCE9C00EFCE9C00BDD69C00EFCEA500ADD6
        A500BDD6A500F7D6A500A5DEA500EFD6AD00F7D6AD00B5DEAD00DECEB500F7D6
        B500F7DEB500F7DEBD00DEC6C600FFEFC600FFEFCE00E7E7D600F7EFD600FFEF
        DE00DEF7DE00E7F7DE00FFEFE700E7F7E700FFF7E700F7F7EF00FFF7EF00FFF7
        F700F7FFF700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C18181818
        1818181818181818185C5C5C184D393A3E3B302E2B2E2E30185C5C5C184E2208
        0D04040B202B2B30185C5C5C12513D0200000000062A2B30185C5C5C12563D03
        0003230E000E2E30185C5C5C19584201000015401D0D3330185C5C5C195D4F38
        2F212245402C3733185C5C5C1A5D4454502F212122403E3C185C5C5C1A5D2441
        5426000001454043185C5C5C1C5D32002541050002494640185C5C5C1C5D5709
        00000000024E4835185C5C5C1F5D5D521707071E08101313185C5C5C1F5D5D5D
        5D52525B360F110A0C5C5C5C295D5D5D5D5D5D5D4C1316145C5C5C5C29575757
        575757574C131A5C5C5C5C5C291C1C1C1C1C1C1C1C135C5C5C5C}
    end
    object DBLCBAgencia: TDBLookupComboBox
      Left = 4
      Top = 24
      Width = 105
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = DSAgencia
      ParentFont = False
      TabOrder = 0
    end
    object CmdImprimirTarjeta: TBitBtn
      Left = 130
      Top = 110
      Width = 121
      Height = 25
      Caption = '&Imprimir Tarjeta'
      Enabled = False
      TabOrder = 6
      OnClick = CmdImprimirTarjetaClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000330B0000330B000000010000000100002D2D2D001855
        6F004544420058534E005160610054777B006E6E6E007C707800B56D3E00C171
        3500C07638008A5B520098586A0098606A00947E7500A16A6A00AD7B7300B673
        7300C07B7300FFA13800EFA65A00EDA75F00F0A85C00CA847B00D48F7B000000
        9A000316AC0041749600477AA9000018C6001029D600106BFF00FF00FF0035A8
        F5004A9EED006D8AFD00848484009891A200A1A1A100F1BC8600F8C28C00F9C4
        8D00F7D6AD00FBD3A900F7DEBD00F7E7CE00F7EFE700FFF7EF00FFF4F400FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020200F0F0F0F0F0F0F0F0F0F0F0F0F20200C302E0003
        2A2D2D2D2C2C2C2A2A0F200C2F300302042A2D2D2D2C2C2C2A0F200D2F2F2E05
        1C010B2A2D2D2D2C2C0F200D312626051B0E090B062424242C0F20113131312F
        0727160A0B2C2E2D2C0F201131313131102B29140A0B2C2E2D0F201231262626
        26102B2916090B242E0F2012313131313131102B2815080B2C0F201713131313
        131313102B25211A19202018131313130F20202010221E1E1A19202018181818
        20202020201D231F1E202020202020202020202020201D1D2020}
    end
    object EdImpresora: TStaticText
      Left = 104
      Top = 78
      Width = 313
      Height = 21
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 7
    end
    object CmdImpresora: TBitBtn
      Left = 422
      Top = 76
      Width = 75
      Height = 25
      Caption = '&Impresora'
      TabOrder = 8
      OnClick = CmdImpresoraClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000420B0000420B00000001000000010000313131003131
        39004A4A4200525252005A5A63006B6363007B7363006B6B6B007B7B7B008484
        84008C8C8C009C9C9C00A5A5A500ADA5A5002139AD00ADA5AD00ADADAD00B5AD
        AD00FFBDAD00FFC6AD00B5B5B500BDB5B500DEB5B500B5BDB500D6BDB500F7BD
        B500FFCEB500BDBDBD00C6BDBD00BDDEBD00C6BDC600C6C6C600FFD6C600CECE
        CE00D6CECE00EFD6CE00FFDECE00D6D6D600DEDEDE00E7DEDE00FFE7DE00DEE7
        E700E7E7E700F7EFE7007B94EF00EFEFEF00F7F7F700FF00FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002F2F2F2F2F2F
        092F2F2F0B0B0C2F2F2F2F2F2F2F0909260D03071021260B2F2F2F2F09092E30
        261104000003090B0C2F09092D302D25140C0F0B080301010A2F092D2A211414
        21140D0C0F100C090B2F091B141425262D2E2A211B100C0F0C2F09142525252A
        261714252626221F102F2F0926252A25141D2114151B1F211B2F2F2F09211B1C
        2A2E2D2B27141F092F2F2F2F2F092925142126262625092F2F2F2F2F2F2F2B28
        232323270202020202022F2F2F2F162824201A13022C0E2828052F2F2F2F1628
        20201A122C0E2C0E28052F2F2F2F162820201A120228280E2C062F2F2F162828
        24201A12022828280E2C2F2F2F1616161619192F02050505060E}
    end
    object CmdCerrar: TBitBtn
      Left = 424
      Top = 108
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 9
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
    object CmdNuevoReporte: TBitBtn
      Left = 252
      Top = 110
      Width = 109
      Height = 25
      Caption = 'Formulario'
      Enabled = False
      TabOrder = 10
      OnClick = CmdNuevoReporteClick
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
  object DSTiposCaptacion: TDataSource
    DataSet = dmCaptacion.IBTiposCaptacion
    Left = 314
    Top = 152
  end
  object ReporteCer: TprTxReport
    FromPage = 1
    ToPage = 1
    ExportFromPage = 0
    ExportToPage = 0
    Values = <>
    Variables = <
      item
        Name = 'LETRAS'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'NOMINAL'
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
    Left = 116
    Top = 150
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
      ColNum = 160
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 22
        UseVerticalBands = False
        DataSetName = 'IBQuery'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<dd>IBQuery.FECHA_APERTURA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 35
          dRec.Top = 6
          dRec.Right = 37
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<MM>IBQuery.FECHA_APERTURA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 6
          dRec.Right = 42
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy>IBQuery.FECHA_APERTURA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 44
          dRec.Top = 6
          dRec.Right = 48
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<dd>IBQuery.FECHA_VENCIMIENTO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 50
          dRec.Top = 6
          dRec.Right = 52
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<MM>IBQuery.FECHA_VENCIMIENTO]')
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
          dRec.Top = 6
          dRec.Right = 57
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy>IBQuery.FECHA_VENCIMIENTO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 6
          dRec.Right = 63
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>IBQuery.VALOR_INICIAL]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 37
          dRec.Top = 9
          dRec.Right = 51
          dRec.Bottom = 10
          Visible = False
        end
        object prTxCommandObj1: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txcReset
                txcCondensedOff
                txcNormal)
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 1
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuery.DESCRIPCION_AGENCIA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 9
          dRec.Top = 9
          dRec.Right = 19
          dRec.Bottom = 10
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBQuery.ID_TIPO_CAPTACION_ABONO][:<00>IBQuery.ID_AGENCIA]-[:<00' +
                  '00000>IBQuery.NUMERO_CUENTA_ABONO]')
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
          dRec.Top = 9
          dRec.Right = 34
          dRec.Bottom = 10
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<0000000>IBQuery.NUMERO_CUENTA]')
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
                tfoWide
                tfo12cpi)
            end>
          dRec.Left = 65
          dRec.Top = 5
          dRec.Right = 72
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuery.ID_PERSONA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 53
          dRec.Top = 9
          dRec.Right = 65
          dRec.Bottom = 10
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQuery.LUGAR_EXPEDICION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 66
          dRec.Top = 9
          dRec.Right = 77
          dRec.Bottom = 10
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBQuery.PRIMER_APELLIDO] [IBQuery.SEGUNDO_APELLIDO] [IBQuery.NO' +
                  'MBRE]xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
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
                tfoWide
                tfo12cpi)
            end>
          dRec.Left = 13
          dRec.Top = 11
          dRec.Right = 51
          dRec.Bottom = 12
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[LETRAS]xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
                  'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
                  'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
                  'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
                  'xxxxxxxxxxxxxxxxxxxxxx')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoCondensed
                tfoBold)
            end>
          dRec.Left = 14
          dRec.Top = 13
          dRec.Right = 123
          dRec.Bottom = 14
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#0.00%>NOMINAL]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfo12cpi)
            end>
          dRec.Left = 22
          dRec.Top = 18
          dRec.Right = 29
          dRec.Bottom = 19
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#0.00%>IBQuery.TASA_EFECTIVA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 35
          dRec.Top = 18
          dRec.Right = 45
          dRec.Bottom = 19
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CADA [IBQuery.AMORTIZACION] DIAS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 16
          dRec.Top = 20
          dRec.Right = 75
          dRec.Bottom = 21
          Visible = False
        end
      end
    end
  end
  object IBQuery: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "cap$maestro".ID_AGENCIA,'
      '  "cap$maestro".ID_TIPO_CAPTACION,'
      '  "cap$maestro".NUMERO_CUENTA,'
      '  "cap$maestro".DIGITO_CUENTA,'
      '  "cap$maestro".VALOR_INICIAL,'
      '  "cap$maestro".ID_FORMA,'
      '  "cap$maestro".FECHA_APERTURA,'
      '  "cap$maestro".PLAZO_CUENTA,'
      '  "cap$maestro".TIPO_INTERES,'
      '  "cap$maestro".ID_INTERES,'
      '  "cap$maestro".TASA_EFECTIVA,'
      '  "cap$maestro".PUNTOS_ADICIONALES,'
      '  "cap$maestro".MODALIDAD,'
      '  "cap$maestro".AMORTIZACION,'
      '  "cap$maestro".CUOTA,'
      '  "cap$maestro".CUOTA_CADA,'
      '  "cap$maestro".ID_PLAN,'
      '  "cap$maestro".ID_ESTADO,'
      '  "cap$maestro".FECHA_VENCIMIENTO,'
      '  "cap$maestro".FECHA_ULTIMO_PAGO,'
      '  "cap$maestro".FECHA_PROXIMO_PAGO,'
      '  "cap$maestro".FECHA_PRORROGA,'
      '  "cap$maestro".FECHA_VENCIMIENTO_PRORROGA,'
      '  "cap$maestro".FIRMAS,'
      '  "cap$maestro".SELLOS,'
      '  "cap$maestro".PROTECTOGRAFOS,'
      '  "cap$maestro".ID_TIPO_CAPTACION_ABONO,'
      '  "cap$maestro".NUMERO_CUENTA_ABONO,'
      '  "cap$tiposestado".DESCRIPCION,'
      '  "cap$tiposestado".PARA_ACTIVAR,'
      '  "cap$tiposestado".PARA_SALDAR,'
      '  "cap$tiposestado".PERMITE_MOVIMIENTO,'
      '  "gen$agencia".DESCRIPCION_AGENCIA,'
      '  "gen$persona".ID_IDENTIFICACION,'
      '  "gen$persona".ID_PERSONA,'
      '  "gen$persona".LUGAR_EXPEDICION,'
      '  "gen$persona".FECHA_EXPEDICION,'
      '  "gen$persona".SEXO,'
      '  "gen$persona".FECHA_NACIMIENTO,'
      '  "gen$persona".LUGAR_NACIMIENTO,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$persona".ID_IDENTIFICACION_CONYUGE,'
      '  "gen$persona".ID_CONYUGE,'
      '  "gen$persona".PRIMER_APELLIDO_CONYUGE,'
      '  "gen$persona".SEGUNDO_APELLIDO_CONYUGE,'
      '  "gen$persona".NOMBRE_CONYUGE,'
      '  "gen$persona".INGRESOS_CONYUGE,'
      '  "gen$persona".INGRESOS_CONYUGE_OTROS,'
      '  "gen$persona".EGRESOS_CONYUGE,'
      '  "gen$persona".OTROS_EGRESOS_CONYUGE,'
      '  "gen$persona".PROFESION,'
      '  "gen$persona".EMPRESA_LABORA,'
      '  "gen$persona".CARGO_ACTUAL,'
      '  "gen$persona".DECLARACION,'
      '  "gen$persona".INGRESOS_A_PRINCIPAL,'
      '  "gen$persona".INGRESOS_OTROS,'
      '  "gen$persona".DESC_INGR_OTROS,'
      '  "gen$persona".EGRESOS_ALQUILER,'
      '  "gen$persona".EGRESOS_ALIMENTACION,'
      '  "gen$persona".EGRESOS_TRANSPORTE,'
      '  "gen$persona".EGRESOS_SERVICIOS,'
      '  "gen$persona".EGRESOS_DEUDAS,'
      '  "gen$persona".EGRESOS_OTROS,'
      '  "gen$persona".TOTAL_ACTIVOS,'
      '  "gen$persona".TOTAL_PASIVOS,'
      '  "gen$tiposestadocivil".DESCRIPCION_ESTADO_CIVIL,'
      '  "gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION'
      'FROM'
      '  "cap$maestro"'
      
        '  LEFT JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = ' +
        '"cap$maestrotitular".ID_AGENCIA) AND ("cap$maestro".ID_TIPO_CAPT' +
        'ACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ("cap$maestr' +
        'o".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap' +
        '$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)'
      '  LEFT JOIN "gen$agencia" ON'
      '("cap$maestro".ID_AGENCIA = "gen$agencia".ID_AGENCIA)'
      
        '  LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICA' +
        'CION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular' +
        '".ID_PERSONA = "gen$persona".ID_PERSONA)'
      
        '  LEFT JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap' +
        '$tiposestado".ID_ESTADO)'
      
        ' LEFT JOIN "gen$tiposestadocivil" ON "gen$persona".ID_TIPO_ESTAD' +
        'O_CIVIL = "gen$tiposestadocivil".ID_TIPO_ESTADO_CIVIL'
      ' LEFT JOIN "gen$tiposidentificacion" ON'
      
        '("gen$persona".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_' +
        'IDENTIFICACION)'
      'WHERE'
      '  ("cap$maestro".ID_AGENCIA = :ID_AGENCIA) AND '
      '  ("cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND '
      '  ("cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA) AND '
      '  ("cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA)'
      'ORDER BY'
      '  "cap$maestrotitular".NUMERO_TITULAR')
    Left = 152
    Top = 150
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
  object IBAgencias: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$agencia"')
    Left = 258
    Top = 152
  end
  object DSAgencia: TDataSource
    DataSet = IBAgencias
    Left = 286
    Top = 152
  end
  object IBSql: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 178
    Top = 152
  end
  object NLetra: TNLetra
    Numero = 0
    Letras = 'Cero'
    Left = 206
    Top = 152
  end
  object ReporteCap: TprTxReport
    FromPage = 1
    ToPage = 1
    ExportFromPage = 0
    ExportToPage = 0
    Values = <>
    Variables = <
      item
        Name = 'CUENTA'
        ValueType = 'prvvtString'
        Value = '201-0026305'
      end
      item
        Name = 'APERTURA'
        ValueType = 'prvvtDateTime'
        Value = 36948d
      end
      item
        Name = 'CIUDAD'
        ValueType = 'prvvtString'
        Value = 'OCA'#209'A'
      end
      item
        Name = 'FIRMAS'
        ValueType = 'prvvtInteger'
        Value = 0
      end
      item
        Name = 'TIPO_CUENTA'
        ValueType = 'prvvtString'
        Value = 'Individual'
      end
      item
        Name = 'SELLOS'
        ValueType = 'prvvtInteger'
        Value = 0
      end
      item
        Name = 'PROTECTOGRAFOS'
        ValueType = 'prvvtInteger'
        Value = 0
      end>
    PrinterName = 'EPSON FX-1180+ ESC/P'
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 6
    Top = 150
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
      LineNum = 100
      ColNum = 140
      object prTxHTitleBand1: TprTxHTitleBand
        Height = 5
        UseVerticalBands = False
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FORMULARIO DE APERTURA Y ACTUALIZACION DE DATOS')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = True
            end>
          dRec.Left = 60
          dRec.Top = 2
          dRec.Right = 87
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Impreso:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 121
          dRec.Top = 4
          dRec.Right = 129
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
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
          dRec.Left = 129
          dRec.Top = 4
          dRec.Right = 139
          dRec.Bottom = 5
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
      end
      object prTxHPageHeaderBand1: TprTxHPageHeaderBand
        Height = 5
        UseVerticalBands = False
        PrintOnFirstPage = True
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Cuenta No.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 64
          dRec.Top = 0
          dRec.Right = 74
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
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
          dRec.Left = 74
          dRec.Top = 0
          dRec.Right = 85
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha de Apertura:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 86
          dRec.Top = 0
          dRec.Right = 104
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>APERTURA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 104
          dRec.Top = 0
          dRec.Right = 114
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Ciudad:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 115
          dRec.Top = 0
          dRec.Right = 122
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CIUDAD]')
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
          dRec.Right = 132
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'I. CONDICIONES DE MANEJO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 64
          dRec.Top = 2
          dRec.Right = 88
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tipo de Cuenta: ')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 64
          dRec.Top = 3
          dRec.Right = 79
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[TIPO_CUENTA]')
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
          dRec.Top = 3
          dRec.Right = 89
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Requisitos: Nro de Firmas:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 91
          dRec.Top = 3
          dRec.Right = 117
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<00>FIRMAS]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 117
          dRec.Top = 3
          dRec.Right = 119
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Nro de Sellos:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 120
          dRec.Top = 3
          dRec.Right = 134
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<00>SELLOS]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 134
          dRec.Top = 3
          dRec.Right = 136
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Protectografos:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 91
          dRec.Top = 4
          dRec.Right = 106
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<00>PROTECTOGRAFOS]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 106
          dRec.Top = 4
          dRec.Right = 108
          dRec.Bottom = 5
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 9
        UseVerticalBands = False
        DataSetName = 'IBPersona'
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INFORMACION SOLICITANTE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 0
          dRec.Right = 44
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBPersona.RecNo]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 47
          dRec.Top = 0
          dRec.Right = 48
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Nombres y Apellidos:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 1
          dRec.Right = 40
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '[IBPersona.NOMBRE] [IBPersona.PRIMER_APELLIDO] [IBPersona.SEGUND' +
                  'O_APELLIDO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 40
          dRec.Top = 1
          dRec.Right = 122
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Identificacion No.:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 2
          dRec.Right = 39
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBPersona.ID_PERSONA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 39
          dRec.Top = 2
          dRec.Right = 51
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Expedida en:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 52
          dRec.Top = 2
          dRec.Right = 64
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBPersona.LUGAR_EXPEDICION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 64
          dRec.Top = 2
          dRec.Right = 84
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha Exp:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 85
          dRec.Top = 2
          dRec.Right = 95
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBPersona.FECHA_EXPEDICION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 95
          dRec.Top = 2
          dRec.Right = 105
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Sexo:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 106
          dRec.Top = 2
          dRec.Right = 111
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'iif(IBPersona.SEXO = M,Masculino,Femenino)')
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
          dRec.Top = 2
          dRec.Right = 122
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha de Nacimiento:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 20
          dRec.Top = 3
          dRec.Right = 40
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/mm/dd>IBPersona.FECHA_NACIMIENTO]')
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
          dRec.Top = 3
          dRec.Right = 49
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Lugar de Nacimiento:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 50
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
                '[IBPersona.LUGAR_NACIMIENTO]')
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
          dRec.Top = 3
          dRec.Right = 91
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj35: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Estado Civil:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 92
          dRec.Top = 3
          dRec.Right = 105
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj36: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 106
          dRec.Top = 3
          dRec.Right = 116
          dRec.Bottom = 4
          Visible = False
        end
      end
    end
  end
  object IBPersona: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select * from "gen$persona" where ID_IDENTIFICACION = :ID_IDENTI' +
        'FICACION and ID_PERSONA = :ID_PERSONA')
    Left = 62
    Top = 150
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
  object IBTitulares: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    AfterScroll = IBTitularesAfterScroll
    Active = True
    SQL.Strings = (
      'SELECT'
      '"cap$maestrotitular".ID_IDENTIFICACION,'
      '"cap$maestrotitular".ID_PERSONA,'
      '"gen$persona".LUGAR_EXPEDICION,'
      '"gen$persona".FECHA_EXPEDICION,'
      '"gen$persona".SEXO,'
      '"gen$persona".FECHA_NACIMIENTO,'
      '"gen$persona".LUGAR_NACIMIENTO,'
      '"gen$persona".NOMBRE,'
      '"gen$persona".PRIMER_APELLIDO,'
      '"gen$persona".SEGUNDO_APELLIDO,'
      '"gen$persona".ID_IDENTIFICACION_CONYUGE,'
      '"gen$persona".ID_CONYUGE,'
      '"gen$persona".PRIMER_APELLIDO_CONYUGE,'
      '"gen$persona".SEGUNDO_APELLIDO_CONYUGE,'
      '"gen$persona".NOMBRE_CONYUGE,'
      '"gen$persona".INGRESOS_CONYUGE,'
      '"gen$persona".INGRESOS_CONYUGE_OTROS,'
      '"gen$persona".EGRESOS_CONYUGE,'
      '"gen$persona".OTROS_EGRESOS_CONYUGE,'
      '"gen$persona".PROFESION,'
      '"gen$persona".EMPRESA_LABORA,'
      '"gen$persona".CARGO_ACTUAL,'
      '"gen$persona".DECLARACION,'
      '"gen$persona".INGRESOS_A_PRINCIPAL,'
      '"gen$persona".INGRESOS_OTROS,'
      '"gen$persona".DESC_INGR_OTROS,'
      '"gen$persona".EGRESOS_ALQUILER,'
      '"gen$persona".EGRESOS_ALIMENTACION,'
      '"gen$persona".EGRESOS_TRANSPORTE,'
      '"gen$persona".EGRESOS_SERVICIOS,'
      '"gen$persona".EGRESOS_DEUDAS,'
      '"gen$persona".EGRESOS_OTROS,'
      '"gen$persona".TOTAL_ACTIVOS,'
      '"gen$persona".TOTAL_PASIVOS,'
      '"gen$persona".EDUCACION,'
      '"gen$tiposestadocivil".DESCRIPCION_ESTADO_CIVIL,'
      '"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,'
      '"gen$tiposidentificacion".INICIAL_IDENTIFICACION,'
      '"cap$tipostitulares".ID_TIPO_TITULAR,'
      '"cap$maestrotitular".NUMERO_TITULAR,'
      '"cap$tipostitulares".DESCRIPCION_TIPO_TITULAR'
      'FROM "cap$maestrotitular"'
      
        'INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICAC' +
        'ION = "gen$persona".ID_IDENTIFICACION and'
      '"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)'
      
        'INNER JOIN "cap$tipostitulares" ON ("cap$maestrotitular".TIPO_TI' +
        'TULAR = "cap$tipostitulares".ID_TIPO_TITULAR)'
      
        ' LEFT JOIN "gen$tiposestadocivil" ON "gen$persona".ID_TIPO_ESTAD' +
        'O_CIVIL = "gen$tiposestadocivil".ID_TIPO_ESTADO_CIVIL'
      ' LEFT JOIN "gen$tiposidentificacion" ON'
      
        '("gen$persona".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_' +
        'IDENTIFICACION)'
      ''
      'where'
      '"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and'
      '"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and'
      '"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and'
      '"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA'
      'Order By'
      
        '"cap$maestrotitular".TIPO_TITULAR,"cap$maestrotitular".NUMERO_TI' +
        'TULAR')
    Left = 34
    Top = 150
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
  object IBDirRes: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select first 1 * from "gen$direccion" where ID_IDENTIFICACION = ' +
        ':ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_DIRECCION' +
        ' = 1')
    Left = 34
    Top = 178
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
  object IBDirCor: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select first 1 * from "gen$direccion" where ID_IDENTIFICACION = ' +
        ':ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_DIRECCION' +
        ' = 2')
    Left = 62
    Top = 178
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
  object IBDirEmp: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select first 1 * from "gen$direccion" where ID_IDENTIFICACION = ' +
        ':ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_DIRECCION' +
        ' = 3')
    Left = 90
    Top = 178
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
  object IBAutorizado: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$persona".ID_PERSONA,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$persona".NOMBRE,'
      '  "cap$maestrotitular".ID_PERSONA'
      'FROM'
      '  "cap$maestro"'
      
        '  INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA =' +
        ' "cap$maestrotitular".ID_AGENCIA) AND ("cap$maestro".ID_TIPO_CAP' +
        'TACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ("cap$maest' +
        'ro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("ca' +
        'p$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)'
      
        '  INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFIC' +
        'ACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitula' +
        'r".ID_PERSONA = "gen$persona".ID_PERSONA)'
      'WHERE'
      '  ("cap$maestro".ID_AGENCIA = :ID_AGENCIA) AND '
      '  ("cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND '
      '  ("cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA) AND '
      '  ("cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA) AND '
      '  ("cap$maestrotitular".TIPO_TITULAR = 2)')
    Left = 34
    Top = 206
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
  object IBReferencias: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Active = True
    SQL.Strings = (
      'SELECT'
      '  "gen$referencias".PRIMER_APELLIDO_REFERENCIA,'
      '  "gen$referencias".SEGUNDO_APELLIDO_REFERENCIA,'
      '  "gen$referencias".NOMBRE_REFERENCIA,'
      '  "gen$referencias".DIRECCION_REFERENCIA,'
      '  "gen$referencias".TELEFONO_REFERENCIA,'
      '  "gen$tiposreferencia".DESCRIPCION_REFERENCIA,'
      '  "gen$tiposparentesco".DESCRIPCION_PARENTESCO'
      'FROM'
      '  "gen$referencias"'
      
        '  INNER JOIN "gen$tiposreferencia" ON ("gen$referencias".TIPO_RE' +
        'FERENCIA = "gen$tiposreferencia".ID_REFERENCIA)'
      
        '  INNER JOIN "gen$tiposparentesco" ON ("gen$referencias".PARENTE' +
        'SCO_REFERENCIA = "gen$tiposparentesco".ID_PARENTESCO)'
      ' WHERE'
      '"gen$referencias".TIPO_ID_REFERENCIA = :ID_IDENTIFICACION and'
      '"gen$referencias".ID_REFERENCIA = :ID_PERSONA')
    Left = 64
    Top = 206
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
  object IBFuncionario: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO from "gen$emple' +
        'ado" where ID_EMPLEADO = :ID_EMPLEADO')
    Left = 92
    Top = 206
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_EMPLEADO'
        ParamType = ptUnknown
      end>
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 380
    Top = 150
  end
  object prTxReport1: TprTxReport
    FromPage = 1
    ToPage = 1
    ExportFromPage = 0
    ExportToPage = 0
    Values = <>
    Variables = <
      item
        Name = 'Empresa'
        ValueType = 'prvvtString'
        Value = 'COOPSERVIR LTDA'
      end>
    PrinterName = 'EPSON FX-1180+ ESC/P'
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 132
    Top = 184
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
      ColNum = 160
      object prTxHPageHeaderBand1: TprTxHPageHeaderBand
        Height = 15
        UseVerticalBands = False
        PrintOnFirstPage = True
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '---------------------------+')
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
          dRec.Right = 92
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
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
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 2
          dRec.Top = 1
          dRec.Right = 15
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SOLICITUD DE INGRESO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 16
          dRec.Top = 1
          dRec.Right = 36
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Impreso el:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 37
          dRec.Top = 1
          dRec.Right = 48
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>StartDateTime]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 49
          dRec.Top = 1
          dRec.Right = 59
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Captacion:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 60
          dRec.Top = 1
          dRec.Right = 71
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
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
          dRec.Right = 90
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
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
          dRec.Left = 91
          dRec.Top = 1
          dRec.Right = 92
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '---------------------------+')
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
          dRec.Right = 92
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
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
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 1
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
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
          dRec.Left = 0
          dRec.Top = 3
          dRec.Right = 1
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
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
          dRec.Left = 0
          dRec.Top = 5
          dRec.Right = 1
          dRec.Bottom = 6
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
          dRec.Left = 0
          dRec.Top = 7
          dRec.Right = 1
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
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
          dRec.Left = 0
          dRec.Top = 9
          dRec.Right = 1
          dRec.Bottom = 10
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
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
          dRec.Left = 0
          dRec.Top = 11
          dRec.Right = 1
          dRec.Bottom = 12
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
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
          dRec.Left = 0
          dRec.Top = 13
          dRec.Right = 1
          dRec.Bottom = 14
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '---------------------------+')
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
          dRec.Top = 4
          dRec.Right = 92
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '---------------------------+')
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
          dRec.Top = 6
          dRec.Right = 92
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '---------------------------+')
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
          dRec.Top = 8
          dRec.Right = 92
          dRec.Bottom = 9
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '---------------------------+')
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
          dRec.Top = 10
          dRec.Right = 92
          dRec.Bottom = 11
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '---------------------------+')
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
          dRec.Top = 12
          dRec.Right = 92
          dRec.Bottom = 13
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '+---------------------------------------------------------------' +
                  '---------------------------+')
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
          dRec.Top = 14
          dRec.Right = 92
          dRec.Bottom = 15
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Id:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 2
          dRec.Top = 3
          dRec.Right = 5
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 6
          dRec.Top = 3
          dRec.Right = 18
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tp:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 19
          dRec.Top = 3
          dRec.Right = 22
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 23
          dRec.Top = 3
          dRec.Right = 42
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
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
          dRec.Left = 18
          dRec.Top = 3
          dRec.Right = 19
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
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
          dRec.Left = 43
          dRec.Top = 3
          dRec.Right = 44
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Exp:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 44
          dRec.Top = 3
          dRec.Right = 48
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 49
          dRec.Top = 3
          dRec.Right = 69
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha Nac:')
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
          dRec.Top = 3
          dRec.Right = 80
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
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
          dRec.Top = 3
          dRec.Right = 91
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
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
          dRec.Left = 69
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
          dRec.Left = 91
          dRec.Top = 3
          dRec.Right = 92
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj35: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NOMBRE:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 2
          dRec.Top = 5
          dRec.Right = 10
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj36: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 5
          dRec.Right = 75
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj37: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tel:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 76
          dRec.Top = 5
          dRec.Right = 80
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj38: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
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
          dRec.Top = 5
          dRec.Right = 91
          dRec.Bottom = 6
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
          dRec.Left = 75
          dRec.Top = 5
          dRec.Right = 76
          dRec.Bottom = 6
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
          dRec.Left = 91
          dRec.Top = 5
          dRec.Right = 92
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj41: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AUTORI:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 2
          dRec.Top = 7
          dRec.Right = 10
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj42: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 11
          dRec.Top = 7
          dRec.Right = 75
          dRec.Bottom = 8
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
          dRec.Left = 75
          dRec.Top = 7
          dRec.Right = 76
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj44: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tel:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 76
          dRec.Top = 7
          dRec.Right = 80
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj45: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
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
          dRec.Top = 7
          dRec.Right = 91
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj46: TprTxMemoObj
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
          dRec.Left = 91
          dRec.Top = 7
          dRec.Right = 92
          dRec.Bottom = 8
          Visible = False
        end
      end
    end
  end
  object FormularioN: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = FormularioNGetValue
    Left = 164
    Top = 184
    ReportForm = {
      19000000A157000019FFFFFFFF11004850204C617365724A6574207031353035
      00FFFFFFFFFF050000006F080000E40D00004800000000000000000000000000
      000000FFFF00000000FFFF000000000000000000000000030400466F726D000F
      000080DC000000780000007C0100002C010000040000000200DA0000000B0050
      6167654865616465723100020100000000100000000B0300005F000000300002
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200470100000D004D617374657248656164657231000201000000009300
      00000B030000180000007000040001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200BF0100000B004D6173746572446174
      613100020100000000AA0000000B0300007C0000003000050001000000000000
      000000FFFFFF1F000000000D0066724942546974756C61726573000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      010000000000000200370200000B004D61737465724461746132000201000000
      00610100000B030000900000003000050001000000000000000000FFFFFF1F00
      0000000D0066724942546974756C6172657300000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00B10200000B004D6173746572446174613300020100000000270200000B0300
      00200000003000050001000000000000000000FFFFFF1F000000000F00667249
      425265666572656E6369617300000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002001F0300000E
      005265706F727453756D6D6172793100020100000000870300000B030000E400
      00003800010001000000000000000000FFFFFF1F000000000000000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      0100000000000002008C0300000D004D61737465724865616465723200020100
      000000030200000B030000140000007000040001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200F90300000D004D617374
      65724865616465723300020100000000380100000B0300001400000030000400
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000200660400000D004D61737465724865616465723400020100000000580200
      000B030000140000003000040001000000000000000000FFFFFF1F0000000000
      00000000000000000000000000000002000000010000000000000001000000C8
      00000014000000010000000000000200E10400000B004D617374657244617461
      3400020100000000800200000B03000014000000380005000100000000000000
      0000FFFFFF1F0000000010006672444242656E65666963696172696F00000000
      0000000000000000000002000000010000000000000001000000C80000001400
      00000100000000000002004E0500000D004D6173746572486561646572350002
      0100000000A40200000B030000140000003000040001000000000000000000FF
      FFFF1F0000000000000000000000000000000000000000020000000100000000
      00000001000000C800000014000000010000000000000200C40500000B004D61
      73746572446174613500020100000000CC0200000B0300001400000038000500
      01000000000000000000FFFFFF1F000000000B0066724442617578696C696F00
      0000000000000000000000000002000000010000000000000001000000C80000
      0014000000010000000000000200310600000D004D6173746572486561646572
      3600020100000000F40200000B03000014000000300004000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C800000014000000010000000000000200A90600000B
      004D61737465724461746136000201000000001C0300000B0300002800000030
      00050001000000000000000000FFFFFF1F000000000D00667244424164696369
      6F6E616C00000000000000FFFF00000000000200000001000000000000000100
      0000C8000000140000000100000000000000005607000005004D656D6F310002
      00330100001500000074010000210000000300000001000000000000000000FF
      FFFF1F2E02000000000001002F00464F524D554C4152494F2044452041504552
      5455524120592041435455414C495A4143494F4E204445204441544F53000000
      00FFFF00000000000200000001000000000500417269616C000C000000020000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      F007000005004D656D6F32000200AC0200001600000044000000140000000300
      000001000000000000000000FFFFFF1F2E02000000000001001C00486F6A6120
      5B50414745235D206465205B544F54414C50414745535D00000000FFFF000000
      00000200000001000000000500417269616C00080000000200000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000800800000500
      4D656D6F350002004D0000004300000066000000100000000300000001000000
      000000000000FFFFFF1F2E0200000000000100120046656368612056696E6375
      6C616369F36E3A00000000FFFF00000000000200000001000000000500417269
      616C0008000000000000000000090000000100020000000000FFFFFF00000000
      020000000000000000001709000005004D656D6F36000200B400000043000000
      5C000000100000000300000001000000000000000000FFFFFF1F2C0004020A00
      797979792F6D6D2F64640001000F005B464543484141504552545552415D0000
      0000FFFF00000000000200000001000000000500417269616C00080000000200
      00000000080000000100020000000000FFFFFF00000000020000000000000000
      009C09000005004D656D6F370002007A01000043000000280000001000000003
      00000001000000000000000000FFFFFF1F2E0200000000000100070043697564
      61643A00000000FFFF00000000000200000001000000000500417269616C0008
      000000000000000000080000000100020000000000FFFFFF0000000002000000
      0000000000002C0A000005004D656D6F38000200B90200002D00000030000000
      100000000300000001000000000000000000FFFFFF1F2C0004020A0079797979
      2F6D6D2F64640001000800496D707265736F3A00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000008000000010002
      0000000000FFFFFF0000000002000000000000000000BA0A000005004D656D6F
      39000200B20200003E0000003C00000010000000030000000100000000000000
      0000FFFFFF1F2C0004020A00797979792F6D6D2F646400010006005B44415445
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000020000000100020000000000FFFFFF00000000020000000000
      00000000410B000006004D656D6F3130000200A4010000430000006700000010
      0000000300000001000000000000000000FFFFFF1F2C00000000000001000800
      5B4349554441445D00000000FFFF000000000002000000010000000005004172
      69616C0009000000020000000000080000000100020000000000FFFFFF000000
      0002000000000000000000D80B000006004D656D6F31310002004C0000005400
      0000A8000000140000000300000001000000000000000000FFFFFF1F2E020000
      00000001001800492E20434F4E444943494F4E4553204445204D414E454A4F00
      000000FFFF00000000000200000001000000000500417269616C000800000003
      0000000000080000000100020000000000FFFFFF000000000200000000000000
      00006B0C000006004D656D6F323100020060000000AC0000006C000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010014004E6F
      6D627265732079204170656C6C69646F733A00000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000000000001000200
      00000000FFFFFF0000000002000000000000000000460D000006004D656D6F32
      32000200D1000000AC000000D601000010000000010000000100000000000000
      0000FFFFFF1F2E02000000000001005C005B5452494D284942546974756C6172
      65732E4E4F4D4252452B272027202B4942546974756C617265732E5052494D45
      525F4150454C4C49444F2B2720272B4942546974756C617265732E534547554E
      444F5F4150454C4C49444F295D00000000FFFF00000000000200000001000000
      000500417269616C000A000000020000000000000000000100020000000000FF
      FFFF0000000002000000000000000000D80D000006004D656D6F323300020060
      000000BA00000059000000100000000300000001000000000000000000FFFFFF
      1F2E020000000000010013004964656E7469666963616369F36E204E6F2E3A00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000980E000006004D656D6F3234000200BB000000BA00000060000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010041005B49
      42546974756C617265732E22494E494349414C5F4944454E5449464943414349
      4F4E225D2D5B4942546974756C617265732E2249445F504552534F4E41225D00
      000000FFFF00000000000200000001000000000500417269616C000800000002
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000240F000006004D656D6F32350002001C010000BA00000044000000100000
      000300000001000000000000000000FFFFFF1F2E02000000000001000D004578
      70656469646F20656E3A2000000000FFFF000000000002000000010000000005
      00417269616C0008000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000C30F000006004D656D6F3236000200620100
      00BA00000075000000100000000300000001000000000000000000FFFFFF1F2E
      020000000000010020005B4942546974756C617265732E224C554741525F4558
      5045444943494F4E225D00000000FFFF00000000000200000001000000000500
      417269616C0008000000020000000000000000000100020000000000FFFFFF00
      000000020000000000000000004C10000006004D656D6F3237000200D9010000
      BA0000003C000000100000000300000001000000000000000000FFFFFF1F2E02
      000000000001000A004665636861204578703A00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000000000000010002
      0000000000FFFFFF0000000002000000000000000000F510000006004D656D6F
      323800020016020000BA00000060000000100000000300000001000000000000
      000000FFFFFF1F2C0004020A00797979792F6D6D2F646400010020005B494254
      6974756C617265732E2246454348415F45585045444943494F4E225D00000000
      FFFF00000000000200000001000000000500417269616C000800000002000000
      0000000000000100020000000000FFFFFF000000000200000000000000000079
      11000006004D656D6F323900020077020000BA00000020000000100000000300
      000001000000000000000000FFFFFF1F2E020000000000010005005365786F3A
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      0000005C12000006004D656D6F333000020096020000BA000000610000001000
      00000300000001000000000000000000FFFFFF1F2E020000000000010064005B
      4946285B4942546974756C617265732E225345584F225D203D20274D272C2027
      4D415343554C494E4F272C204946285B4942546974756C617265732E22534558
      4F225D203D202746272C202746454D454E494E4F272C20274E494E47554E4F27
      29295D00000000FFFF00000000000200000001000000000500417269616C0008
      000000020000000000000000000100020000000000FFFFFF0000000002000000
      000000000000EF12000006004D656D6F333100020060000000C90000006C0000
      00100000000300000001000000000000000000FFFFFF1F2E0200000000000100
      14004665636861206465204E6163696D69656E746F3A00000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000000000000
      0100020000000000FFFFFF00000000020000000000000000009813000006004D
      656D6F3332000200CB000000C900000050000000100000000300000001000000
      000000000000FFFFFF1F2C0004020A00797979792F6D6D2F646400010020005B
      4942546974756C617265732E2246454348415F4E4143494D49454E544F225D00
      000000FFFF00000000000200000001000000000500417269616C000800000002
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00002B14000006004D656D6F33330002001B010000C90000006C000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010014004C75
      676172206465204E6163696D69656E746F3A00000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000000000001000200
      00000000FFFFFF0000000002000000000000000000B714000006004D656D6F33
      3400020058020000C90000004000000010000000030000000100000000000000
      0000FFFFFF1F2E02000000000001000D0045737461646F20436976696C3A0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      005E15000006004D656D6F333500020098020000C90000006000000010000000
      0300000001000000000000000000FFFFFF1F2E020000000000010028005B4942
      546974756C617265732E224445534352495043494F4E5F45535441444F5F4349
      56494C225D00000000FFFF00000000000200000001000000000500417269616C
      0008000000020000000000000000000100020000000000FFFFFF000000000200
      0000000000000000FD15000006004D656D6F333600020088010000C9000000CE
      000000100000000300000001000000000000000000FFFFFF1F2E020000000000
      010020005B4942546974756C617265732E224C554741525F4E4143494D49454E
      544F225D00000000FFFF00000000000200000001000000000500417269616C00
      08000000020000000000000000000100020000000000FFFFFF00000000020000
      000000000000009116000006004D656D6F333700020060000000D80000006C00
      0000100000000300000001000000000000000000FFFFFF1F2E02000000000001
      00150044697265636369F36E205265736964656E6369613A00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000000
      00000100020000000000FFFFFF00000000020000000000000000003A17000006
      004D656D6F3338000200CC000000D80000001001000010000000030000000100
      0000000000000000FFFFFF1F2E02000000000001002A005B4942446972526573
      2E22444952454343494F4E225D205B49424469725265732E2242415252494F22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000000000000100020000000000FFFFFF00000000020000000000
      00000000C317000006004D656D6F3339000200DC010000D80000003400000010
      0000000300000001000000000000000000FFFFFF1F2E02000000000001000A00
      4D756E69636970696F3A00000000FFFF00000000000200000001000000000500
      417269616C0008000000000000000000000000000100020000000000FFFFFF00
      000000020000000000000000005818000006004D656D6F343000020010020000
      D800000064000000100000000300000001000000000000000000FFFFFF1F2E02
      0000000000010016005B49424469725265732E224D554E49434950494F225D00
      000000FFFF00000000000200000001000000000500417269616C000800000002
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000E018000006004D656D6F343100020073020000D800000034000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010009005465
      6CE9666F6E6F3A00000000FFFF00000000000200000001000000000500417269
      616C0008000000000000000000000000000100020000000000FFFFFF00000000
      020000000000000000007519000006004D656D6F3432000200A8020000D80000
      0050000000100000000300000001000000000000000000FFFFFF1F2E02000000
      0000010016005B49424469725265732E2254454C45464F4E4F31225D00000000
      FFFF00000000000200000001000000000500417269616C000800000002000000
      0000000000000100020000000000FFFFFF00000000020000000000000000000E
      1A000006004D656D6F343300020060000000E70000008B000000100000000300
      000001000000000000000000FFFFFF1F2E02000000000001001A004469726563
      6369F36E20436F72726573706F6E64656E6369613A00000000FFFF0000000000
      0200000001000000000500417269616C00080000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000B71A000006004D65
      6D6F3434000200ED000000E7000000EE00000010000000030000000100000000
      0000000000FFFFFF1F2E02000000000001002A005B4942446972436F722E2244
      4952454343494F4E225D205B4942446972436F722E2242415252494F225D0000
      0000FFFF00000000000200000001000000000500417269616C00080000000200
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      00401B000006004D656D6F3435000200DC010000E70000003400000010000000
      0300000001000000000000000000FFFFFF1F2E02000000000001000A004D756E
      69636970696F3A00000000FFFF00000000000200000001000000000500417269
      616C0008000000000000000000000000000100020000000000FFFFFF00000000
      02000000000000000000D51B000006004D656D6F343600020010020000E70000
      0064000000100000000300000001000000000000000000FFFFFF1F2E02000000
      0000010016005B4942446972436F722E224D554E49434950494F225D00000000
      FFFF00000000000200000001000000000500417269616C000800000002000000
      0000000000000100020000000000FFFFFF00000000020000000000000000005D
      1C000006004D656D6F343700020073020000E700000034000000100000000300
      000001000000000000000000FFFFFF1F2E0200000000000100090054656CE966
      6F6E6F3A00000000FFFF00000000000200000001000000000500417269616C00
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000F21C000006004D656D6F3438000200A8020000E70000005000
      0000100000000300000001000000000000000000FFFFFF1F2E02000000000001
      0016005B4942446972436F722E2254454C45464F4E4F31225D00000000FFFF00
      000000000200000001000000000500417269616C000800000002000000000000
      0000000100020000000000FFFFFF0000000002000000000000000000851D0000
      06004D656D6F343900020060000000F60000006C000000100000000300000001
      000000000000000000FFFFFF1F2E020000000000010014004163746976696461
      642045636F6EF36D6963613A00000000FFFF0000000000020000000100000000
      0500417269616C0008000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000000001D1E000006004D656D6F3530000200CC00
      0000F600000010010000100000000300000001000000000000000000FFFFFF1F
      2E020000000000010019005B4942546974756C617265732E2250524F46455349
      4F4E225D00000000FFFF00000000000200000001000000000500417269616C00
      08000000020000000000000000000100020000000000FFFFFF00000000020000
      00000000000000A81E000006004D656D6F3531000200DC010000F60000004000
      0000100000000300000001000000000000000000FFFFFF1F2E02000000000001
      000C00446573637269706369F36E3A00000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000000000001000200000000
      00FFFFFF0000000002000000000000000000431F000006004D656D6F35320002
      001A020000F6000000DC000000100000000300000001000000000000000000FF
      FFFF1F2E02000000000001001C005B4942546974756C617265732E2243415247
      4F5F41435455414C225D00000000FFFF00000000000200000001000000000500
      417269616C0008000000020000000000000000000100020000000000FFFFFF00
      00000002000000000000000000D71F000006004D656D6F353300020060000000
      0401000074000000100000000300000001000000000000000000FFFFFF1F2E02
      000000000001001500456D707265736120646F6E6465206C61626F72613A0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      007420000006004D656D6F3534000200D4000000040100008500000010000000
      0300000001000000000000000000FFFFFF1F2E02000000000001001E005B4942
      546974756C617265732E22454D50524553415F4C41424F5241225D00000000FF
      FF00000000000200000001000000000500417269616C00080000000200000000
      00000000000100020000000000FFFFFF0000000002000000000000000000FD20
      000006004D656D6F35350002005A010000040100003400000010000000030000
      0001000000000000000000FFFFFF1F2E02000000000001000A00446972656363
      69F36E3A00000000FFFF00000000000200000001000000000500417269616C00
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000009221000006004D656D6F35360002008D010000040100007800
      0000100000000300000001000000000000000000FFFFFF1F2E02000000000001
      0016005B4942446972456D702E22444952454343494F4E225D00000000FFFF00
      000000000200000001000000000500417269616C000800000002000000000000
      0000000100020000000000FFFFFF00000000020000000000000000001B220000
      06004D656D6F3537000200060200000401000034000000100000000300000001
      000000000000000000FFFFFF1F2E02000000000001000A004D756E6963697069
      6F3A00000000FFFF00000000000200000001000000000500417269616C000800
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      0000000000B022000006004D656D6F3538000200390200000401000050000000
      100000000300000001000000000000000000FFFFFF1F2E020000000000010016
      005B4942446972456D702E224D554E49434950494F225D00000000FFFF000000
      00000200000001000000000500417269616C0008000000020000000000000000
      000100020000000000FFFFFF0000000002000000000000000000382300000600
      4D656D6F35390002008A02000004010000310000001000000003000000010000
      00000000000000FFFFFF1F2E0200000000000100090054656CE9666F6E6F3A00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000CD23000006004D656D6F3630000200BC020000040100003C000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010016005B49
      42446972456D702E2254454C45464F4E4F31225D00000000FFFF000000000002
      00000001000000000500417269616C0008000000020000000000000000000100
      020000000000FFFFFF00000000020000000000000000006824000006004D656D
      6F36310002006000000012010000980000001000000003000000010000000000
      00000000FFFFFF1F2E02000000000001001C004E6F6D62726573207920417065
      6C6C69646F7320436F6E797567653A00000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000000000001000200000000
      00FFFFFF00000000020000000000000000006725000006004D656D6F36320002
      00F80000001201000000020000100000000300000001000000000000000000FF
      FFFF1F2E020000000000010080005B7472696D285B4942546974756C61726573
      2E224E4F4D4252455F434F4E59554745225D2B2720272B5B4942546974756C61
      7265732E225052494D45525F4150454C4C49444F5F434F4E59554745225D2B27
      20272B205B4942546974756C617265732E22534547554E444F5F4150454C4C49
      444F5F434F4E59554745225D295D00000000FFFF000000000002000000010000
      00000500417269616C0009000000020000000000000000000100020000000000
      FFFFFF00000000020000000000000000000126000006004D656D6F3635000200
      6100000072010000980200001D0000000B00000001000000000000000000FFFF
      FF1F2E02000000000001001B005B4942546974756C617265732E224445434C41
      524143494F4E225D00000000FFFF000000000002000000010000000005004172
      69616C0008000000020000000000000000000100020000000000FFFFFF000000
      0002000000000000000000AC26000006004D656D6F3636000200AA0000009001
      000060000000100000000300000001000000000000000000FFFFFF1F2E020401
      08002420232C232E303000010024005B4942546974756C617265732E22494E47
      5245534F535F415F5052494E434950414C225D00000000FFFF00000000000200
      000001000000000500417269616C000800000002000000000001000000010002
      0000000000FFFFFF00000000020000000000000000003827000006004D656D6F
      3637000200610000009001000048000000100000000300000001000000000000
      000000FFFFFF1F2E02000000000001000D00496E677265736F73204D65733A00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000C627000006004D656D6F36380002000A0100009001000050000000100000
      000300000001000000000000000000FFFFFF1F2E02000000000001000F00496E
      677265736F73204F74726F733A00000000FFFF00000000000200000001000000
      000500417269616C0008000000000000000000000000000100020000000000FF
      FFFF00000000020000000000000000006B28000006004D656D6F36390002005C
      0100009001000060000000100000000300000001000000000000000000FFFFFF
      1F2E02040108002420232C232E30300001001E005B4942546974756C61726573
      2E22494E475245534F535F4F54524F53225D00000000FFFF0000000000020000
      0001000000000500417269616C00080000000200000000000100000001000200
      00000000FFFFFF0000000002000000000000000000F628000006004D656D6F37
      30000200BC010000900100004000000010000000030000000100000000000000
      0000FFFFFF1F2E02000000000001000C00446573637269706369F36E3A000000
      00FFFF00000000000200000001000000000500417269616C0008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      9429000006004D656D6F3731000200FC01000090010000FD0000001000000003
      00000001000000000000000000FFFFFF1F2E02000000000001001F005B494254
      6974756C617265732E22444553435F494E47525F4F54524F53225D00000000FF
      FF00000000000200000001000000000500417269616C00080000000200000000
      00000000000100020000000000FFFFFF0000000002000000000000000000242A
      000006004D656D6F373200020061000000A00100006000000010000000030000
      0001000000000000000000FFFFFF1F2E02000000000001001100496E67726573
      6F7320436F6E797567653A00000000FFFF000000000002000000010000000005
      00417269616C0008000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000CB2A000006004D656D6F3733000200C00000
      00A001000060000000100000000300000001000000000000000000FFFFFF1F2E
      02040108002420232C232E303000010020005B4942546974756C617265732E22
      494E475245534F535F434F4E59554745225D00000000FFFF0000000000020000
      0001000000000500417269616C00080000000200000000000100000001000200
      00000000FFFFFF0000000002000000000000000000612B000006004D656D6F37
      3400020020010000A00100008000000010000000030000000100000000000000
      0000FFFFFF1F2E02000000000001001700496E677265736F73204F74726F7320
      436F6E797567653A00000000FFFF000000000002000000010000000005004172
      69616C0008000000000000000000000000000100020000000000FFFFFF000000
      00020000000000000000000E2C000006004D656D6F3735000200A0010000A001
      000060000000100000000300000001000000000000000000FFFFFF1F2E020401
      08002420232C232E303000010026005B4942546974756C617265732E22494E47
      5245534F535F434F4E595547455F4F54524F53225D00000000FFFF0000000000
      0200000001000000000500417269616C00080000000200000000000100000001
      00020000000000FFFFFF00000000020000000000000000009E2C000006004D65
      6D6F373600020060000000B00100006000000010000000030000000100000000
      0000000000FFFFFF1F2E0200000000000100110045677265736F732041727269
      656E646F3A00000000FFFF00000000000200000001000000000500417269616C
      0008000000000000000000000000000100020000000000FFFFFF000000000200
      0000000000000000452D000006004D656D6F3737000200C0000000B001000060
      000000100000000300000001000000000000000000FFFFFF1F2E020401080024
      20232C232E303000010020005B4942546974756C617265732E2245475245534F
      535F414C5155494C4552225D00000000FFFF0000000000020000000100000000
      0500417269616C0008000000020000000000010000000100020000000000FFFF
      FF0000000002000000000000000000D92D000006004D656D6F37380002002001
      0000B001000070000000100000000300000001000000000000000000FFFFFF1F
      2E0200000000000100150045677265736F7320416C696D656E74616369F36E3A
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      000000842E000006004D656D6F3739000200A1010000B0010000600000001000
      00000300000001000000000000000000FFFFFF1F2E02040108002420232C232E
      303000010024005B4942546974756C617265732E2245475245534F535F414C49
      4D454E544143494F4E225D00000000FFFF000000000002000000010000000005
      00417269616C0008000000020000000000010000000100020000000000FFFFFF
      0000000002000000000000000000162F000006004D656D6F3830000200010200
      00B00100006A000000100000000300000001000000000000000000FFFFFF1F2E
      0200000000000100130045677265736F73205472616E73706F7274653A000000
      00FFFF00000000000200000001000000000500417269616C0008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      BF2F000006004D656D6F383100020069020000B0010000600000001000000003
      00000001000000000000000000FFFFFF1F2E02040108002420232C232E303000
      010022005B4942546974756C617265732E2245475245534F535F5452414E5350
      4F525445225D00000000FFFF0000000000020000000100000000050041726961
      6C0008000000020000000000010000000100020000000000FFFFFF0000000002
      0000000000000000005030000006004D656D6F383200020060000000C0010000
      60000000100000000300000001000000000000000000FFFFFF1F2E0200000000
      000100120045677265736F7320536572766963696F733A00000000FFFF000000
      00000200000001000000000500417269616C0008000000000000000000000000
      000100020000000000FFFFFF0000000002000000000000000000F83000000600
      4D656D6F3833000200C0000000C0010000600000001000000003000000010000
      00000000000000FFFFFF1F2E02040108002420232C232E303000010021005B49
      42546974756C617265732E2245475245534F535F534552564943494F53225D00
      000000FFFF00000000000200000001000000000500417269616C000800000002
      0000000000010000000100020000000000FFFFFF000000000200000000000000
      00008531000006004D656D6F383400020020010000C001000070000000100000
      000300000001000000000000000000FFFFFF1F2E02000000000001000E004567
      7265736F73204F74726F733A00000000FFFF0000000000020000000100000000
      0500417269616C0008000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000000002932000006004D656D6F3835000200A001
      0000C001000060000000100000000300000001000000000000000000FFFFFF1F
      2E02040108002420232C232E30300001001D005B4942546974756C617265732E
      2245475245534F535F4F54524F53225D00000000FFFF00000000000200000001
      000000000500417269616C000800000002000000000001000000010002000000
      0000FFFFFF0000000002000000000000000000B832000006004D656D6F383600
      020060000000D001000060000000100000000300000001000000000000000000
      FFFFFF1F2E0200000000000100100045677265736F7320436F6E797567653A00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00005E33000006004D656D6F3837000200C0000000D001000060000000100000
      000300000001000000000000000000FFFFFF1F2E02040108002420232C232E30
      300001001F005B4942546974756C617265732E2245475245534F535F434F4E59
      554745225D00000000FFFF00000000000200000001000000000500417269616C
      0008000000020000000000010000000100020000000000FFFFFF000000000200
      0000000000000000F333000006004D656D6F383800020021010000D00100007C
      000000100000000300000001000000000000000000FFFFFF1F2E020000000000
      0100160045677265736F73204F74726F7320436F6E797567653A00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      000000000100020000000000FFFFFF00000000020000000000000000009F3400
      0006004D656D6F3839000200A0010000D0010000600000001000000003000000
      01000000000000000000FFFFFF1F2E02040108002420232C232E303000010025
      005B4942546974756C617265732E224F54524F535F45475245534F535F434F4E
      59554745225D00000000FFFF0000000000020000000100000000050041726961
      6C0008000000020000000000010000000100020000000000FFFFFF0000000002
      0000000000000000002C35000006004D656D6F393000020060000000E0010000
      60000000100000000300000001000000000000000000FFFFFF1F2E0200000000
      0001000E00546F74616C2041637469766F733A00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000000000000010002
      0000000000FFFFFF0000000002000000000000000000D035000006004D656D6F
      3931000200C0000000E001000060000000100000000300000001000000000000
      000000FFFFFF1F2E02040108002420232C232E30300001001D005B4942546974
      756C617265732E22544F54414C5F41435449564F53225D00000000FFFF000000
      00000200000001000000000500417269616C0008000000020000000000010000
      000100020000000000FFFFFF00000000020000000000000000005D3600000600
      4D656D6F393200020020010000E0010000600000001000000003000000010000
      00000000000000FFFFFF1F2E02000000000001000E00546F74616C2050617369
      766F733A00000000FFFF00000000000200000001000000000500417269616C00
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000000137000006004D656D6F393300020080010000E00100008000
      0000100000000300000001000000000000000000FFFFFF1F2E02040108002420
      232C232E30300001001D005B4942546974756C617265732E22544F54414C5F50
      415349564F53225D00000000FFFF000000000002000000010000000005004172
      69616C0008000000020000000000010000000100020000000000FFFFFF000000
      00020000000000000000001038000006004D656D6F39350002005C0000002902
      0000E8000000100000000300000001000000000000000000FFFFFF1F2E020000
      000000010090005B5B5452494D285B49425265666572656E636961732E224E4F
      4D4252455F5245464552454E434941225D2B2720272B5B49425265666572656E
      636961732E225052494D45525F4150454C4C49444F5F5245464552454E434941
      225D2B2720272B5B49425265666572656E636961732E22534547554E444F5F41
      50454C4C49444F5F5245464552454E434941225D295D5D00000000FFFF000000
      00000200000001000000000500417269616C0008000000020000000000000000
      000100020000000000FFFFFF0000000002000000000000000000A23800000600
      4D656D6F39360002004601000029020000640000001000000003000000010000
      00000000000000FFFFFF1F2E020000000000010013005469706F206465205265
      666572656E6369613A00000000FFFF0000000000020000000100000000050041
      7269616C0008000000000000000000000000000100020000000000FFFFFF0000
      0000020000000000000000004939000006004D656D6F3937000200AC01000029
      0200007A000000100000000300000001000000000000000000FFFFFF1F2E0200
      00000000010028005B49425265666572656E636961732E224445534352495043
      494F4E5F5245464552454E434941225D00000000FFFF00000000000200000001
      000000000500417269616C000800000002000000000000000000010002000000
      0000FFFFFF0000000002000000000000000000D339000006004D656D6F393800
      0200280200002902000040000000100000000300000001000000000000000000
      FFFFFF1F2E02000000000001000B00506172656E746573636F3A00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      000000000100020000000000FFFFFF00000000020000000000000000007A3A00
      0006004D656D6F393900020068020000290200008C0000001000000003000000
      01000000000000000000FFFFFF1F2E020000000000010028005B494252656665
      72656E636961732E224445534352495043494F4E5F504152454E544553434F22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000000000000100020000000000FFFFFF00000000020000000000
      00000000043B000007004D656D6F3130300002005C0000003602000038000000
      100000000300000001000000000000000000FFFFFF1F2E02000000000001000A
      0044697265636369F36E3A00000000FFFF000000000002000000010000000005
      00417269616C0008000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000AA3B000007004D656D6F3130310002009400
      00003602000093010000100000000300000001000000000000000000FFFFFF1F
      2E020000000000010026005B49425265666572656E636961732E224449524543
      43494F4E5F5245464552454E434941225D00000000FFFF000000000002000000
      01000000000500417269616C0008000000020000000000000000000100020000
      000000FFFFFF00000000020000000000000000004F3C000007004D656D6F3130
      3200020068020000360200008C00000010000000030000000100000000000000
      0000FFFFFF1F2E020000000000010025005B49425265666572656E636961732E
      2254454C45464F4E4F5F5245464552454E434941225D00000000FFFF00000000
      000200000001000000000500417269616C000800000002000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000D83C000007004D
      656D6F3130330002002802000036020000400000001000000003000000010000
      00000000000000FFFFFF1F2E0200000000000100090054656CE9666F6E6F3A00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000B23E000007004D656D6F313034000200480000008F030000B20200002800
      00000300000001000000000000000000FFFFFF1F2E02000000000001005A0144
      65636C61726F28616D6F73292071756520636F6E6F63656D6F73207920616365
      7074616D6F73206C617320636F6E646963696F6E6573206465206D616E656A6F
      2064652065737461206D6F64616C696461642064652061686F72726F2E204175
      746F72697A616D6F732061205B454D50524553415D20706172613A2061292052
      65706F72746172206F20636F6E73756C746172206375616C717569657220696E
      666F726D616369F36E2072656C6163696F6E61646120636F6E206D6973286E75
      657374726173292061637469766964616465732066696E616E63696572617320
      656E206C61732063656E7472616C65732064652072696573676F2E2062292051
      756520656E206361736F206465206D75657274652C20656C2076616C6F722064
      65206C6F732061706F7274657320736F6369616C65732073656120656E747265
      6761646F2061206D69732062656E65666963696172696F732E00000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000000
      0000000100020000000000FFFFFF0000000002000000000000000400013F0000
      05004C696E653200020048000000BB030000B202000000000000010008000200
      0000000000000000FFFFFF002E020000000000000000000000FFFF0000000000
      0200000001000000000000863F000007004D656D6F313035000200980000002F
      04000060000000100000000300000001000000000000000000FFFFFF1F2E0200
      00000000010005004669726D6100000000FFFF00000000000200000001000000
      000500417269616C0008000000000000000000020000000100020000000000FF
      FFFF0000000002000000000000000400D53F000005004C696E65330002004C00
      00002F040000F4000000000000000100080002000000000000000000FFFFFF00
      2E020000000000000000000000FFFF000000000002000000010000000000005A
      40000007004D656D6F313036000200F00100002F040000600000001000000003
      00000001000000000000000000FFFFFF1F2E020000000000010005004669726D
      6100000000FFFF00000000000200000001000000000500417269616C00080000
      00000000000000020000000100020000000000FFFFFF00000000020000000000
      00000400A940000005004C696E6534000200A40100002F040000F40000000000
      00000100080002000000000000000000FFFFFF002E0200000000000000000000
      00FFFF00000000000200000001000000000A0C00546672536861706556696577
      00001A410000060053686170653100020041010000BF030000600000006C0000
      000100000002000000000000000000FFFFFF1F2E02000000000001000F004855
      454C4C412044414354494C415200000000FFFF00000000000200000001000000
      00010A0C0054667253686170655669657700008B410000060053686170653200
      020099020000BF030000600000006C0000000100000002000000000000000000
      FFFFFF1F2E02000000000001000F004855454C4C412044414354494C41520000
      0000FFFF00000000000200000001000000000100001642000007004D656D6F31
      3037000200680000005F040000680000000C0000000300000001000000000000
      000000FFFFFF1F2E02000000000001000B0046756E63696F6E6172696F000000
      00FFFF00000000000200000001000000000500417269616C0007000000000000
      000000020000000100020000000000FFFFFF0000000002000000000000000000
      A342000007004D656D6F3130380002004800000053040000AC0000000C000000
      0300000001000000000000000000FFFFFF1F2E02000000000001000D005B4655
      4E43494F4E4152494F5D00000000FFFF00000000000200000001000000000500
      417269616C0007000000000000000000030000000100020000000000FFFFFF00
      000000020000000000000000003543000006004D656D6F323000020060000000
      93000000A4000000140000000300000001000000000000000000FFFFFF1F2E02
      000000000001001300494E464F524D4143494F4E2047454E4552414C00000000
      FFFF00000000000200000001000000000500417269616C000800000003000000
      0000020000000100020000000000FFFFFF0000000002000000000000000000C4
      43000006004D656D6F39340002004C0000000302000068000000140000000300
      000001000000000000000000FFFFFF1F2E020000000000010010004949492E20
      5245464552454E4349415300000000FFFF000000000002000000010000000005
      00417269616C0008000000030000000000000000000100020000000000FFFFFF
      00000000020000000000000004001344000005004C696E653100020048000000
      8D030000B2020000000000000100080002000000000000000000FFFFFF002E02
      0000000000000000000000FFFF00000000000200000001000000000000A24400
      0007004D656D6F31303900020048010000C00300005400000010000000030000
      0001000000000000000000FFFFFF1F2E02000000000001000F004855454C4C41
      2044414354494C415200000000FFFF0000000000020000000100000000050041
      7269616C0006000000000000000000020000000100020000000000FFFFFF0000
      0000020000000000000000003145000007004D656D6F313130000200A0020000
      C003000054000000100000000300000001000000000000000000FFFFFF1F2E02
      000000000001000F004855454C4C412044414354494C415200000000FFFF0000
      0000000200000001000000000500417269616C00060000000000000000000200
      00000100020000000000FFFFFF0000000002000000000000000000CA45000006
      004D656D6F36330002004800000038010000AC00000014000000030000000100
      0000000000000000FFFFFF1F2E02000000000001001A0049492E20494E464F52
      4D4143494F4E2046494E414E434945524100000000FFFF000000000002000000
      01000000000500417269616C0008000000030000000000000000000100020000
      000000FFFFFF00000000020000000000000000009846000006004D656D6F3634
      00020061000000610100009C0100001000000003000000010000000000000000
      00FFFFFF1F2E02000000000001004F004465636C61726F28616D6F7329207175
      65206C6F7320666F6E646F73206D616E656A61646F7320656E2065737461206D
      6F64616C696461642064652061686F72726F2070726F7669656E656E20646500
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00002947000007004D656D6F31313100020049000000590200006C0000001200
      00000300000001000000000000000000FFFFFF1F2E0200000000000100110049
      562E2042454E45464943494152494F5300000000FFFF00000000000200000001
      000000000500417269616C000800000003000000000000000000010002000000
      0000FFFFFF00000000020000000000000000000948000007004D656D6F313132
      0002006500000082020000E80000001000000003000000010000000000000000
      00FFFFFF1F2E020000000000010060005B494262656E65666963696172696F2E
      224E4F4D425245225D205B494262656E65666963696172696F2E225052494D45
      525F4150454C4C49444F225D205B494262656E65666963696172696F2E225345
      47554E444F5F4150454C4C49444F225D00000000FFFF00000000000200000001
      000000000500417269616C000800000002000000000000000000010002000000
      0000FFFFFF00000000020000000000000000009448000007004D656D6F313133
      0002004E01000082020000400000001000000003000000010000000000000000
      00FFFFFF1F2E02000000000001000B00506172656E746573636F3A00000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      00000000000100020000000000FFFFFF00000000020000000000000000003D49
      000007004D656D6F31313400020090010000820200008C000000100000000300
      000001000000000000000000FFFFFF1F2E020000000000010029005B49426265
      6E65666963696172696F2E224445534352495043494F4E5F504152454E544553
      434F225D00000000FFFF00000000000200000001000000000500417269616C00
      08000000020000000000000000000100020000000000FFFFFF00000000020000
      00000000000000DB49000007004D656D6F313135000200310200008202000030
      000000100000000300000001000000000000000000FFFFFF1F2E020000000000
      01001E005B494262656E65666963696172696F2E22504F5243454E54414A4522
      5D2500000000FFFF00000000000200000001000000000500417269616C000800
      0000020000000000000000000100020000000000FFFFFF000000000200000000
      00000000007D4A000007004D656D6F31313700020049000000A5020000F80000
      00120000000300000001000000000000000000FFFFFF1F2E0200000000000100
      2200562E2042454E45464943494152494F20415558494C494F20504F52204D55
      4552544500000000FFFF00000000000200000001000000000500417269616C00
      08000000030000000000000000000100020000000000FFFFFF00000000020000
      000000000000004E4B000007004D656D6F31313800020060000000CE020000E8
      000000100000000300000001000000000000000000FFFFFF1F2E020000000000
      010051005B4942417578696C696F2E224E4F4D425245225D205B494241757869
      6C696F2E225052494D45525F4150454C4C49444F225D205B4942417578696C69
      6F2E22534547554E444F5F4150454C4C49444F225D00000000FFFF0000000000
      0200000001000000000500417269616C00080000000200000000000000000001
      00020000000000FFFFFF0000000002000000000000000000D94B000007004D65
      6D6F31313900020049010000CE02000040000000100000000300000001000000
      000000000000FFFFFF1F2E02000000000001000B00506172656E746573636F3A
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      0000007D4C000007004D656D6F3132300002008B010000CE0200008C00000010
      0000000300000001000000000000000000FFFFFF1F2E02000000000001002400
      5B4942417578696C696F2E224445534352495043494F4E5F504152454E544553
      434F225D00000000FFFF00000000000200000001000000000500417269616C00
      08000000020000000000000000000100020000000000FFFFFF00000000020000
      00000000000000064D000007004D656D6F313136000200AB020000AD00000038
      000000100000000300000001000000000000000000FFFFFF1F2E020000000000
      0100090045647563616369F36E00000000FFFF00000000000200000001000000
      000500417269616C0008000000000000000000000000000100020000000000FF
      FFFF0000000002000000000000000A0F00546672436865636B426F7856696577
      0000884D00000600436865636B31000200E7020000AE0000000C0000000C0000
      0001000F0002000000000000000000FFFFFF1F2E020000000000010019005B49
      42546974756C617265732E22454455434143494F4E225D00000000FFFF000000
      000002000000010000000001000000000000114E000007004D656D6F31323100
      02004A00000015000000DB000000180000000300000001000000000000000000
      FFFFFF1F2E020000000000010009005B454D50524553415D00000000FFFF0000
      0000000200000001000000000500417269616C000E0000000200000000000200
      00000100020000000000FFFFFF00000000020000000000000000009A4E000007
      004D656D6F3132320002004A0000002C000000DB000000100000000300000001
      000000000000000000FFFFFF1F2E020000000000010009004E69743A5B4E4954
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      000000000000000A0000000100020000000000FFFFFF00000000020000000000
      00000000464F000007004D656D6F3132330002004C000000F402000030010000
      120000000300000001000000000000000000FFFFFF1F2E02000000000001002C
      0056492E20494E464F524D4143494F4E20504552534F4E414C2059204C41424F
      52414C2041444943494F4E414C00000000FFFF00000000000200000001000000
      000500417269616C0008000000030000000000000000000100020000000000FF
      FFFF0000000002000000000000000000D74F000007004D656D6F313234000200
      4C0000001C03000060000000100000000300000001000000000000000000FFFF
      FF1F2E02000000000001001100506572736F6E6173206120436172676F3A0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      007A50000007004D656D6F313235000200B00000001C0300001C000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010023005B49
      425141646963696F6E616C65732E22504552534F4E41535F415F434152474F22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000000000000100020000000000FFFFFF00000000020000000000
      000000000D51000007004D656D6F313236000200D00000001C03000068000000
      100000000300000001000000000000000000FFFFFF1F2E020000000000010013
      004F637570616369F36E205072696E636970616C00000000FFFF000000000002
      00000001000000000500417269616C0008000000000000000000000000000100
      020000000000FFFFFF0000000002000000000000000000A951000007004D656D
      6F3132370002003C0100001C0300007C00000010000000030000000100000000
      0000000000FFFFFF1F2E02000000000001001C005B49425141646963696F6E61
      6C65732E224F4355504143494F4E225D00000000FFFF00000000000200000001
      000000000500417269616C000800000002000000000000000000010002000000
      0000FFFFFF00000000020000000000000000002E52000007004D656D6F313330
      000200BA0100001C0300001C0000001000000003000000010000000000000000
      00FFFFFF1F2E02000000000001000500434949553A00000000FFFF0000000000
      0200000001000000000500417269616C00080000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000D152000007004D65
      6D6F313331000200D90100001C03000020010000100000000300000001000000
      000000000000FFFFFF1F2E020000000000010023005B49425141646963696F6E
      616C65732E224445534352495043494F4E5F43494955225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000200000000000000
      00000100020000000000FFFFFF00000000020000000000000000005F53000007
      004D656D6F3133320002004C0000002C03000048000000100000000300000001
      000000000000000000FFFFFF1F2E02000000000001000E005469706F20436F6E
      747261746F3A00000000FFFF0000000000020000000100000000050041726961
      6C0008000000000000000000000000000100020000000000FFFFFF0000000002
      000000000000000000FA53000007004D656D6F313333000200980000002C0300
      0094000000100000000300000001000000000000000000FFFFFF1F2E02000000
      000001001B005B49425141646963696F6E616C65732E22434F4E545241544F22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000000000000100020000000000FFFFFF00000000020000000000
      000000009C54000007004D656D6F313334000200400100002C030000B4000000
      100000000300000001000000000000000000FFFFFF1F2E020000000000010022
      00536563746F7220456D70726573617269616C20496E646570656E6469656E74
      65733A00000000FFFF00000000000200000001000000000500417269616C0008
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      0000000000003555000007004D656D6F313335000200F40100002C030000A400
      0000100000000300000001000000000000000000FFFFFF1F2E02000000000001
      0019005B49425141646963696F6E616C65732E22534543544F52225D00000000
      FFFF00000000000200000001000000000500417269616C000800000002000000
      0000000000000100020000000000FFFFFF0000000002000000000000000000C3
      55000007004D656D6F3133360002009C0200002C0300004C0000001000000003
      00000001000000000000000000FFFFFF1F2E02000000000001000E004465636C
      6172612052656E74613A00000000FFFF00000000000200000001000000000500
      417269616C0008000000000000000000000000000100020000000000FFFFFF00
      00000002000000000000000A0F00546672436865636B426F785669657700004C
      5600000600436865636B32000200E80200002C03000010000000100000000100
      0F0002000000000000000000FFFFFF1F2E020000000000010020005B49425141
      646963696F6E616C65732E224445434C4152415F52454E5441225D00000000FF
      FF00000000000200000001000000000100000000FEFEFF0B0000000A00204765
      6E6572616C65730000000006004355454E5441000F00273230312D3030323633
      30352D3827000D0046454348414150455254555241000A00323030342F30312F
      3031000600434955444144000D00274255434152414D414E474127000A005449
      504F4355454E5441000C0027496E646976696475616C270006004649524D4153
      0001003100060053454C4C4F5300010031000E0050524F544543544F47524146
      4F5300010031000700454D5052455341000000000B0046554E43494F4E415249
      4F0000000003004E4954000F00273030302E3030302E3030302D302700000000
      0000000000FC00002F00464F524D554C4152494F204445204150455254555241
      20592041435455414C495A4143494F4E204445204441544F530E00414C455841
      4E444552204352555A01003101003101003001003000004D00E54F558615AAE2
      4053E99D4696D2E340}
  end
  object FormularioJ: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 192
    Top = 184
    ReportForm = {19000000}
  end
  object frIBTitulares: TfrDBDataSet
    DataSet = IBTitulares
    Left = 164
    Top = 210
  end
  object frIBReferencias: TfrDBDataSet
    DataSet = IBReferencias
    Left = 192
    Top = 210
  end
  object frShapeObject1: TfrShapeObject
    Left = 222
    Top = 184
  end
  object IBbeneficiario: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Active = True
    SQL.Strings = (
      'SELECT '
      '  "gen$tiposparentesco".DESCRIPCION_PARENTESCO,'
      '  "gen$beneficiario".ID_AGENCIA,'
      '  "gen$beneficiario".ID_PERSONA,'
      '  "gen$beneficiario".ID_IDENTIFICACION,'
      '  "gen$beneficiario".PRIMER_APELLIDO,'
      '  "gen$beneficiario".SEGUNDO_APELLIDO,'
      '  "gen$beneficiario".NOMBRE,'
      '  "gen$beneficiario".ID_PARENTESCO,'
      '  "gen$beneficiario".AUXILIO,'
      '  "gen$beneficiario".PORCENTAJE'
      'FROM'
      '  "gen$beneficiario"'
      
        '  INNER JOIN "gen$tiposparentesco" ON ("gen$beneficiario".ID_PAR' +
        'ENTESCO = "gen$tiposparentesco".ID_PARENTESCO)'
      
        'where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :I' +
        'D_PERSONA and AUXILIO = 0')
    Left = 272
    Top = 192
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
  object frDBBeneficiario: TfrDBDataSet
    DataSet = IBbeneficiario
    Left = 368
    Top = 224
  end
  object frDBauxilio: TfrDBDataSet
    DataSet = IBAuxilio
    Left = 328
    Top = 192
  end
  object IBAuxilio: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Active = True
    SQL.Strings = (
      'SELECT '
      '  "gen$tiposparentesco".DESCRIPCION_PARENTESCO,'
      '  "gen$beneficiario".ID_AGENCIA,'
      '  "gen$beneficiario".ID_PERSONA,'
      '  "gen$beneficiario".ID_IDENTIFICACION,'
      '  "gen$beneficiario".PRIMER_APELLIDO,'
      '  "gen$beneficiario".SEGUNDO_APELLIDO,'
      '  "gen$beneficiario".NOMBRE,'
      '  "gen$beneficiario".ID_PARENTESCO,'
      '  "gen$beneficiario".AUXILIO,'
      '  "gen$beneficiario".PORCENTAJE'
      'FROM'
      '  "gen$beneficiario"'
      
        '  INNER JOIN "gen$tiposparentesco" ON ("gen$beneficiario".ID_PAR' +
        'ENTESCO = "gen$tiposparentesco".ID_PARENTESCO)'
      
        'where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :I' +
        'D_PERSONA and AUXILIO = 1')
    Left = 264
    Top = 224
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
  object IBQAdicionales: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Active = True
    SQL.Strings = (
      'SELECT '
      '  "gen$persona".EMPRESA_LABORA,'
      '  "gen$persona".FECHA_INGRESO_EMPRESA,'
      '  "gen$persona".CARGO_ACTUAL,'
      '  "gen$tiposciiu".DESCRIPCION_CIIU,'
      '  "gen$persadicional".NUMERO_HIJOS,'
      '  "gen$tiposocupacion".DESCRIPCION AS OCUPACION,'
      '  "gen$tiposcontrato".DESCRIPCION AS CONTRATO,'
      '  "gen$tipossectorcomercial".DESCRIPCION AS SECTOR,'
      '  "gen$persadicional".DESCRIPCION_CONTRATO,'
      '  "gen$persadicional".DESCRIPCION_SECTOR,'
      '  "gen$persadicional".VENTA_ANUAL,'
      '  "gen$persadicional".FECHA_ULTIMO_BALANCE,'
      '  "gen$persadicional".NUMERO_EMPLEADOS,'
      '  "gen$persadicional".DECLARA_RENTA,'
      '  "gen$persadicional".PERSONAS_A_CARGO'
      'FROM'
      ' "gen$persona"'
      
        ' LEFT JOIN "gen$tiposciiu" ON ("gen$persona".ID_CIIU=CAST("gen$t' +
        'iposciiu".ID_CIIU AS INTEGER))'
      
        ' LEFT JOIN "gen$persadicional" ON ("gen$persona".ID_IDENTIFICACI' +
        'ON="gen$persadicional".ID_IDENTIFICACION)'
      '  AND ("gen$persona".ID_PERSONA="gen$persadicional".ID_PERSONA)'
      
        ' LEFT JOIN "gen$tiposcontrato" ON ("gen$persadicional".ID_TIPOCO' +
        'NTRATO="gen$tiposcontrato".ID_CONTRATO)'
      
        ' LEFT JOIN "gen$tiposocupacion" ON ("gen$persadicional".ID_OCUPA' +
        'CION="gen$tiposocupacion".ID_OCUPACION)'
      
        ' LEFT JOIN "gen$tipossectorcomercial" ON ("gen$persadicional".ID' +
        '_SECTOR="gen$tipossectorcomercial".ID_SECTOR)'
      'WHERE'
      '  ("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND '
      '  ("gen$persona".ID_PERSONA = :ID_PERSONA)')
    Left = 32
    Top = 232
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
  object frDBAdicional: TfrDBDataSet
    DataSet = IBQAdicionales
    Left = 160
    Top = 232
  end
end
