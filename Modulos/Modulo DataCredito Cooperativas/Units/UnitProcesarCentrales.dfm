object frmProcesarCentrales: TfrmProcesarCentrales
  Left = 367
  Top = 197
  Width = 532
  Height = 299
  Caption = 'Proceso Centrales de Riesgo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 410
    Top = 0
    Width = 114
    Height = 265
    Align = alRight
    Color = clOlive
    TabOrder = 0
    object CmdProcesar: TBitBtn
      Left = 6
      Top = 4
      Width = 105
      Height = 25
      Caption = 'Procesar'
      TabOrder = 0
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
    object CmdGenerar: TBitBtn
      Left = 6
      Top = 56
      Width = 105
      Height = 29
      Caption = 'Generar Archivo'
      Enabled = False
      TabOrder = 1
      OnClick = CmdGenerarClick
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
    object CmdEnviar: TBitBtn
      Left = 6
      Top = 118
      Width = 105
      Height = 25
      Caption = 'Enviar Archivo'
      Enabled = False
      TabOrder = 2
      Visible = False
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
    object CmdVer: TBitBtn
      Left = 6
      Top = 86
      Width = 105
      Height = 27
      Caption = 'Ver Archivo'
      Enabled = False
      TabOrder = 3
      OnClick = CmdVerClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000230B0000230B00000001000000010000291818002108
        21002921210039292900423939004A4242006B395A00FFCE6300F7C66B00FFCE
        6B00947373009C737300A5737300AD737300EFBD7300FFD67300A57B7B00AD7B
        7B00C6847B00CE9C7B00EFBD7B00FFD67B00AD848400B5848400CE9C8400CEA5
        8400FFDE8400B58C8C00EFC68C00FFDE8C00FFE78C00B5949400BD949400C694
        9400C6A59400FFE79400C69C9C00FFE79C00B5A5A500CEA5A500FFEFA500C6AD
        AD00F7E7AD00FFEFAD00D6B5B500D6BDB500EFDEB500EFDEDE00FF00FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00303030303030
        303030303030303030303030291B1B1B1B1B1B1B1B1B100530303030302C2424
        24241B1B1B1B06303030300A0A040303030302020202010A3030272727272720
        17161616161616160C3027160B0B0B0B0B0A0A0A0A0A0A260C30270E07080808
        08080808080807070C30270E090912121212121213090707113027141515122F
        31313131180F15091130271C1A1A122F31313131191A1A091130271C1D1D122F
        31313131191D1D1A2030271C1D23122F313122220D231A1A2030271C2328122F
        3131220D2825231A2030271C2828122D2D2D0D2A2B28251D2430272E2E2E2E2E
        2E2E2E2E2E2E2E2E243030272727272727272727272727273030}
    end
    object CmdCerrar: TBitBtn
      Left = 6
      Top = 30
      Width = 105
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 4
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 265
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Fecha de Corte'
    end
    object Label2: TLabel
      Left = 8
      Top = 184
      Width = 53
      Height = 13
      Caption = 'Colocaci'#243'n'
    end
    object lblColocacion: TLabel
      Left = 72
      Top = 184
      Width = 177
      Height = 19
      AutoSize = False
      Color = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object EdFechaCorte: TDateTimePicker
      Left = 86
      Top = 4
      Width = 93
      Height = 21
      CalAlignment = dtaLeft
      Date = 38076.6573846181
      Time = 38076.6573846181
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnExit = EdFechaCorteExit
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 28
      Width = 275
      Height = 109
      Caption = 'Estado del Proceso'
      Enabled = False
      TabOrder = 1
      object LbOficina: TJvBlinkingLabel
        Left = 11
        Top = 15
        Width = 252
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Color = clInactiveBorder
        ParentColor = False
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clBlack
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object ChkActiva: TCheckBox
        Left = 8
        Top = 38
        Width = 195
        Height = 17
        Caption = 'Registro Cartera Activa'
        TabOrder = 0
      end
      object Ed1: TEdit
        Left = 192
        Top = -16
        Width = 105
        Height = 21
        TabOrder = 1
        Visible = False
      end
      object ChkSaldada: TCheckBox
        Left = 8
        Top = 68
        Width = 201
        Height = 17
        Caption = 'Registro Cartera Saldada'
        TabOrder = 2
      end
      object ChkCastigada: TCheckBox
        Left = 8
        Top = 53
        Width = 145
        Height = 17
        Caption = 'Registro Cartera Castigada'
        TabOrder = 3
      end
      object ChkInsertarTabla: TCheckBox
        Left = 8
        Top = 83
        Width = 201
        Height = 17
        Caption = 'Insertando en Tabla'
        TabOrder = 4
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 143
      Width = 275
      Height = 35
      TabOrder = 2
      object Bar: TProgressBar
        Left = 2
        Top = 10
        Width = 269
        Height = 19
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object Ed2: TEdit
      Left = 192
      Top = 0
      Width = 105
      Height = 21
      TabOrder = 3
      Visible = False
    end
  end
  object IBSNoCredito: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 304
    Top = 224
  end
  object IBSClientes: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 248
    Top = 152
  end
  object IBSCuotas: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 328
    Top = 224
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 304
    Top = 184
  end
  object OpenDialog1: TOpenDialog
    Left = 264
    Top = 65528
  end
  object DataActual: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DPActual'
    StoreDefs = True
    BeforeApplyUpdates = DataActualBeforeApplyUpdates
    AfterApplyUpdates = DataActualAfterApplyUpdates
    Left = 16
    Top = 144
  end
  object IBTmp: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 376
    Top = 168
  end
  object IBSReporteAnt: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 344
    Top = 176
  end
  object IBQuery3: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 264
    Top = 176
  end
  object Database: TIBDatabase
    LoginPrompt = False
    DefaultTransaction = Transaction
    Left = 232
    Top = 64
  end
  object Transaction: TIBTransaction
    Left = 208
    Top = 64
  end
  object DPActual: TDataSetProvider
    DataSet = IBActual
    Constraints = True
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 144
  end
  object IBActual: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "col$centralriesgotmp"')
    Left = 72
    Top = 144
  end
  object IBAgencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = Transaction1
    SQL.Strings = (
      
        'select ID_AGENCIA, DESCRIPCION_AGENCIA from "gen$agencia" where ' +
        'ID_AGENCIA >0  order by ID_AGENCIA ASC')
    Left = 152
    Top = 48
  end
  object Transaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 208
    Top = 96
  end
  object ClienteData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataProvider'
    Left = 128
    Top = 120
  end
  object DataProvider: TDataSetProvider
    DataSet = IBData
    Constraints = True
    Left = 152
    Top = 120
  end
  object IBData: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 176
    Top = 120
  end
  object IBQcodpucbasico: TIBQuery
    Database = Database
    Transaction = Transaction
    Left = 24
    Top = 210
  end
end
