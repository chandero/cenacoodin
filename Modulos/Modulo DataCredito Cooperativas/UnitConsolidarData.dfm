object frmConsolidarData: TfrmConsolidarData
  Left = 445
  Top = 143
  Width = 557
  Height = 304
  BorderIcons = [biSystemMenu]
  Caption = 'Consolidar Informaci'#243'n y Generar Plano'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 36
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 11
      Width = 73
      Height = 13
      Caption = 'Fecha de Corte'
    end
    object DTfecha: TDateTimePicker
      Left = 117
      Top = 7
      Width = 91
      Height = 20
      CalAlignment = dtaLeft
      Date = 38563.4397889468
      Time = 38563.4397889468
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnExit = DTfechaExit
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 155
    Width = 210
    Height = 79
    Caption = 'Estado Plano Datacredito'
    Enabled = False
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Registro de Control'
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 35
      Width = 113
      Height = 17
      Caption = 'Registro de Clientes'
      TabOrder = 1
    end
    object CheckBox5: TCheckBox
      Left = 8
      Top = 54
      Width = 97
      Height = 17
      Caption = 'Registro de Fin'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 424
    Top = 0
    Width = 125
    Height = 270
    Align = alRight
    Color = clOlive
    TabOrder = 2
    object CmdDatacredito: TBitBtn
      Left = 5
      Top = 55
      Width = 116
      Height = 25
      Caption = 'Plano Datacredito'
      TabOrder = 0
      OnClick = CmdDatacreditoClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        804000804000804000804000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08040008040
        00804000804000FF00FFFF00FF80400080400080400080400080400080400080
        4000804000804000804000804000804000804000804000804000FF00FF804000
        804000804000804000C0C0C0C0C0C0FF0000FFFFFFFFFFFFFFFFFFFFFFFF8040
        00804000804000804000FF00FF804000804000804000804000C0C0C0FF0000FF
        0000FFFFFFFFFFFFFFFFFFFFFFFF804000804000804000804000FF00FF804000
        804000804000804000C0C0C0FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF8040
        00804000804000804000FF00FF804000804000804000804000C0C0C0C0C0C0C0
        C0C0FFFFFFFFFFFFFFFFFFFFFFFF804000804000804000804000FF00FF804000
        8040008040008040008040008040008040008040008040008040008040008040
        00804000804000804000FF00FF80400080400080400080400080400080400080
        4000804000804000804000804000804000804000804000804000FF00FF804000
        804000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF804000804000FF00FF804000804000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF804000804000FF00FF804000
        804000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF804000804000FF00FF804000804000FFFFFFFFFFFF80808080808080
        8080808080808080808080808080FFFFFFFFFFFF804000804000FF00FF804000
        804000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF804000804000FF00FF804000804000FFFFFFFFFFFF80808080808080
        8080808080808080808080808080FFFFFFFFFFFF804000804000FF00FF804000
        804000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF804000804000FF00FFFF00FF804000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF804000FF00FF}
    end
    object CmdEnviar: TBitBtn
      Left = 5
      Top = 107
      Width = 116
      Height = 25
      Caption = 'Enviar Archivo'
      Enabled = False
      TabOrder = 1
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C30E0000C30E000000010000000100005A423900634A
        3900634A420063524A006B524A0073524A006B5A4A006B5A5200735A52007B5A
        5200845A52007B6B6300846B6B009C736B00A5737300A57B730094847B00AD84
        84009C8C8400BD8C8C00B5948C00C6949400AD9C9400BD9C940042739C004A7B
        9C0073849C009C8C9C00B59C9C00CE9C9C00D69C9C00D6A59C00DEAD9C00EFB5
        9C00EFC69C00F7C69C00297BA500317BA500B5A5A500C6A5A500CEA5A500C6AD
        A500D6ADA500DEB5A500FFD6A500FFDEA500CEADAD00D6ADAD00DEBDAD00EFCE
        AD00F7D6AD00FFDEAD00398CB500428CB500BDA5B500BDADB500D6B5B500DEB5
        B500C6BDB500DEBDB500E7CEB500F7D6B500FFE7B500FFEFB5005294BD00529C
        BD00B5A5BD00BDB5BD00DEBDBD00F7E7BD00F7EFBD00FFEFBD00FFF7BD00CEC6
        C600F7E7C600FFF7C600FFFFC60084B5CE00EFDECE00F7E7CE00FFFFCE008CBD
        D600ADC6D600DED6D600F7E7D600FFFFD6005ABDDE00ADD6DE00F7E7DE00F7EF
        DE00FFFFDE0073C6E700A5DEE700BDDEE700FFFFE700A5E7EF00FFFFEF009CCE
        F700D6EFF700DEEFF700DEF7F700FF00FF008CC6FF008CCEFF0094CEFF0094DE
        FF0094E7FF0094EFFF00DEFFFF00E7FFFF00EFFFFF00F7FFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00652E11090002
        070C122665656565656565281D1F1D130D090200040B1016656565281D202C22
        211F1D150E0A050006106528221D313E332C2C2321201D1D0F07652832311D45
        4B473E3E332C231D1D036528454B3C2A5555504C4B471F201D0265284A55502B
        3B5E5A5A552A2B2C1D0265284F5A4A2A1D4458592A304B471D0265284E301D53
        6349371D273050501D0265281D4370706F6E6D6C642E30551D0365381B407070
        706F6E6E6D621C3B1D0865653735635D514D353424181A1D1D12656565251941
        565B67686866421D1765656565653A1D5F6B696961361529656565656565653A
        1D575C521D143A6565656565656565653A2F2F383A6565656565}
    end
    object CmdCerrar: TBitBtn
      Left = 5
      Top = 133
      Width = 116
      Height = 25
      Caption = 'Cerrar'
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
    object BTimportar: TBitBtn
      Left = 5
      Top = 3
      Width = 116
      Height = 25
      Caption = '&Importar'
      TabOrder = 3
      OnClick = BTimportarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000320B0000320B00000001000000010000CE6300009C39
        0800EFA54A00F7AD4A00C6846B00BD8C7300CE947300EFB57300FFC67300BD84
        7B00C6947B00B5848400B58C8400CE9C8400B5948C00C6A59400EFCE9400C6A5
        9C00EFCE9C00F7D69C00C6ADA500F7D6A500CEB5AD00D6B5AD00C6BDAD00F7D6
        AD00D6BDB500DEBDB500DEC6B500E7C6B500EFCEB500F7D6B500F7DEB500EFCE
        BD00F7DEBD00E7DEC600F7DEC600F7E7C600E7CECE00E7D6CE00F7E7CE00F7E7
        D600FFEFD600FFEFDE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0031310B0B0B0B
        0B0B0B0B0B0B0B0B0B313131112A252220191512101010130B313131112A2824
        221F0112121010120B313131142C292824010119121210120B313131142D2928
        0101001F191212100B31313116302C0100000000000012120B31313117322E2C
        03030024220015150B3131311A322F2E2B03032524001F190B3131311A32322F
        2E2C0328240020200B3131311B3232322F2C2B292800241F0B3131311C323232
        322F2C2B2B2A23180B3131311D32323232322E2E290F0E0C0B3131311D323232
        3232323026050702043131312132323232323232270A0806313131311D2F2E2E
        2E2E2E2E260A0D31313131311D1E1E1E1E1D1D1E1A0931313131}
    end
    object BTelimina: TBitBtn
      Left = 5
      Top = 29
      Width = 116
      Height = 25
      Caption = '&Eliminar'
      TabOrder = 4
      OnClick = BTeliminaClick
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
    object CmdCifin: TBitBtn
      Left = 5
      Top = 81
      Width = 116
      Height = 25
      Caption = '    Plano Cifin        '
      TabOrder = 5
      OnClick = CmdCifinClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000942929009431
        31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
        4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
        5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
        73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
        8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
        A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
        BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
        CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
        E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
        33343433332505050B4848191516111B27384647452D0002131048191515111A
        05184046492E0102121048191515111C03032F42493200011210481915151120
        0601243A493200011210481915151221231D1F27322C04041310481915151515
        1515151313151515160F48190D111E282B292B2828292B26150C481909384544
        4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
        3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
        4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
        4343434343434630130F4848092D3A363636363636363A2A0748}
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 234
    Width = 210
    Height = 35
    Caption = 'Generando Archivo Datacredito'
    TabOrder = 3
    object BarD: TProgressBar
      Left = 4
      Top = 11
      Width = 201
      Height = 19
      Min = 0
      Max = 100
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 39
    Width = 310
    Height = 110
    Caption = 'Cargando Informaci'#243'n a Procesar'
    TabOrder = 4
    object BarOcana: TJvProgressBar
      Left = 4
      Top = 14
      Width = 301
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 0
      BarColor = clBackground
    end
    object BarAbrego: TJvProgressBar
      Left = 4
      Top = 34
      Width = 301
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 1
      BarColor = clPurple
    end
    object BarConvencion: TJvProgressBar
      Left = 4
      Top = 54
      Width = 301
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 2
      BarColor = clTeal
    end
    object BarAguachica: TJvProgressBar
      Left = 4
      Top = 74
      Width = 301
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 3
      BarColor = clMaroon
    end
  end
  object GroupBox4: TGroupBox
    Left = 311
    Top = 39
    Width = 110
    Height = 110
    Caption = 'Oficinas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object ChOcana: TCheckBox
      Left = 13
      Top = 16
      Width = 82
      Height = 17
      Caption = 'Oca'#241'a'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object ChAbrego: TCheckBox
      Left = 13
      Top = 36
      Width = 82
      Height = 17
      Caption = 'Abrego'
      Color = clPurple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object ChConvencion: TCheckBox
      Left = 13
      Top = 56
      Width = 82
      Height = 17
      Caption = 'Convencion'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object ChAguachica: TCheckBox
      Left = 13
      Top = 76
      Width = 82
      Height = 17
      Caption = 'Aguachica'
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
  end
  object GroupBox5: TGroupBox
    Left = 211
    Top = 155
    Width = 210
    Height = 79
    Caption = 'Estado Plano Cifin'
    Enabled = False
    TabOrder = 6
    object CheckBox3: TCheckBox
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Registro de Control'
      TabOrder = 0
    end
    object CheckBox4: TCheckBox
      Left = 8
      Top = 35
      Width = 121
      Height = 17
      Caption = 'Registro de Clientes'
      TabOrder = 1
    end
    object CheckBox6: TCheckBox
      Left = 8
      Top = 54
      Width = 97
      Height = 17
      Caption = 'Registro de Fin'
      TabOrder = 2
    end
  end
  object GroupBox6: TGroupBox
    Left = 213
    Top = 234
    Width = 210
    Height = 35
    Caption = 'Generando Archivo Cifin'
    TabOrder = 7
    object BarC: TProgressBar
      Left = 4
      Top = 11
      Width = 201
      Height = 19
      Min = 0
      Max = 100
      TabOrder = 0
    end
  end
  object IdTCPClient1: TIdTCPClient
    OnWork = IdTCPClient1Work
    OnWorkBegin = IdTCPClient1WorkBegin
    Port = 0
    Left = 534
    Top = 165
  end
  object SQLQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 488
    Top = 193
  end
  object SQLQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 512
    Top = 193
  end
  object frDBDataSet1: TfrDBDataSet
    Left = 512
    Top = 165
  end
  object frDBDataSet2: TfrDBDataSet
    Left = 488
    Top = 165
  end
  object IBDataSet1: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SelectSQL.Strings = (
      'select * from "col$estado"')
    Left = 488
    Top = 217
    object IBDataSet1ID_ESTADO_COLOCACION: TSmallintField
      FieldName = 'ID_ESTADO_COLOCACION'
      Origin = '"col$estado"."ID_ESTADO_COLOCACION"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDataSet1DESCRIPCION_ESTADO_COLOCACION: TIBStringField
      FieldName = 'DESCRIPCION_ESTADO_COLOCACION'
      Origin = '"col$estado"."DESCRIPCION_ESTADO_COLOCACION"'
      Required = True
      Size = 100
    end
    object IBDataSet1ES_PREJURIDICO: TSmallintField
      FieldName = 'ES_PREJURIDICO'
      Origin = '"col$estado"."ES_PREJURIDICO"'
    end
    object IBDataSet1ES_JURIDICO: TSmallintField
      FieldName = 'ES_JURIDICO'
      Origin = '"col$estado"."ES_JURIDICO"'
    end
    object IBDataSet1ES_CASTIGADO: TSmallintField
      FieldName = 'ES_CASTIGADO'
      Origin = '"col$estado"."ES_CASTIGADO"'
    end
    object IBDataSet1ES_NOVISADO: TSmallintField
      FieldName = 'ES_NOVISADO'
      Origin = '"col$estado"."ES_NOVISADO"'
    end
    object IBDataSet1ES_ANULADO: TSmallintField
      FieldName = 'ES_ANULADO'
      Origin = '"col$estado"."ES_ANULADO"'
    end
    object IBDataSet1ES_CANCELADO: TSmallintField
      FieldName = 'ES_CANCELADO'
      Origin = '"col$estado"."ES_CANCELADO"'
    end
    object IBDataSet1ES_VIGENTE: TSmallintField
      FieldName = 'ES_VIGENTE'
      Origin = '"col$estado"."ES_VIGENTE"'
    end
    object IBDataSet1ES_SALDADO: TSmallintField
      FieldName = 'ES_SALDADO'
      Origin = '"col$estado"."ES_SALDADO"'
    end
    object IBDataSet1COLOR: TSmallintField
      FieldName = 'COLOR'
      Origin = '"col$estado"."COLOR"'
    end
    object IBDataSet1ES_FALLECIDO: TSmallintField
      FieldName = 'ES_FALLECIDO'
      Origin = '"col$estado"."ES_FALLECIDO"'
    end
    object IBDataSet1ES_INCAPACITADO: TSmallintField
      FieldName = 'ES_INCAPACITADO'
      Origin = '"col$estado"."ES_INCAPACITADO"'
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 512
    Top = 217
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 536
    Top = 192
  end
  object IBSClientes: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 536
    Top = 216
  end
  object IBTransaction1: TIBTransaction
    Left = 360
  end
  object IBTransaction2: TIBTransaction
    Left = 272
  end
  object IBDatabase1: TIBDatabase
    Left = 384
  end
  object IBDatabase2: TIBDatabase
    Left = 248
  end
end
