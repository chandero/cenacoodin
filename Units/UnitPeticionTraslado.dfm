object FrmPeticionTraslado: TFrmPeticionTraslado
  Left = 148
  Top = 88
  Width = 676
  Height = 531
  BorderIcons = [biSystemMenu]
  Caption = 'Realizar Petici'#243'n de Traslados'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 231
      Top = 9
      Width = 41
      Height = 13
      Caption = 'Oficina'
    end
    object Label2: TLabel
      Left = 5
      Top = 8
      Width = 76
      Height = 13
      Caption = 'Oficina Local'
    end
    object DbOficina: TDBLookupComboBox
      Left = 276
      Top = 7
      Width = 165
      Height = 21
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = DsOficina
      TabOrder = 0
      OnEnter = DbOficinaEnter
      OnKeyPress = DbOficinaKeyPress
    end
    object JvOficina: TJvStaticText
      Left = 84
      Top = 5
      Width = 144
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
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
      TabOrder = 1
      WordWrap = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 449
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label3: TLabel
      Left = 5
      Top = 8
      Width = 57
      Height = 13
      Caption = 'Tipo Doc.'
    end
    object Label4: TLabel
      Left = 231
      Top = 9
      Width = 44
      Height = 13
      Caption = 'N'#250'mero'
    end
    object DbTipo: TDBLookupComboBox
      Left = 84
      Top = 5
      Width = 146
      Height = 21
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DsTipo
      TabOrder = 0
      OnEnter = DbTipoEnter
      OnKeyPress = DbOficinaKeyPress
    end
    object jvNumero: TJvEdit
      Left = 278
      Top = 5
      Width = 162
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
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 1
      OnKeyPress = jvNumeroKeyPress
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 66
    Width = 449
    Height = 63
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label5: TLabel
      Left = 5
      Top = 7
      Width = 120
      Height = 13
      Caption = 'N'#250'mero de Radicado'
    end
    object Label6: TLabel
      Left = 226
      Top = 7
      Width = 106
      Height = 13
      Caption = 'Numero de Cuenta'
    end
    object Label7: TLabel
      Left = 5
      Top = 34
      Width = 115
      Height = 13
      Caption = 'Nombres y Apellidos'
    end
    object JvRadicado: TJvStaticText
      Left = 129
      Top = 3
      Width = 92
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
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
      TabOrder = 0
      WordWrap = False
    end
    object JvCuenta: TJvStaticText
      Left = 336
      Top = 3
      Width = 104
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
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
      TabOrder = 1
      WordWrap = False
    end
    object JvNombre: TJvStaticText
      Left = 129
      Top = 30
      Width = 312
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
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
      TabOrder = 2
      WordWrap = False
    end
  end
  object Panel3: TPanel
    Left = 449
    Top = -1
    Width = 90
    Height = 130
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 3
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Enviar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        7A020000424D7A020000000000007A0100002800000010000000100000000100
        08000000000000010000D10E0000D10E000051000000510000003160A1001650
        B6003860B6000B50CA003873CA001C7BCA002360E000386AE0000660EA001C60
        EA00066AEA001698EA002398EA0006A1EA0003ABEA000058F4000B58F4001658
        F400036AF400037BF4000B8FF40000C0F4000BD4F40048D4F400FF00FF000058
        FF000060FF00006AFF000073FF00007BFF000084FF00008FFF00068FFF00238F
        FF00388FFF00408FFF000098FF001698FF001C98FF0000A1FF0050A1FF006AA1
        FF0000ABFF0003ABFF0006ABFF0000B6FF0003B6FF0050B6FF0000C0FF000BC0
        FF0000CAFF0003CAFF0006CAFF0011CAFF001CCAFF0000D4FF000BD4FF0016D4
        FF002AD4FF0000E0FF0006E0FF000BE0FF0023E0FF0000EAFF000BEAFF0023EA
        FF0031EAFF0000F4FF0003F4FF0016F4FF001CF4FF002AF4FF0031F4FF0040F4
        FF0000FFFF0003FFFF000BFFFF0011FFFF001CFFFF0023FFFF00FFFFFF001818
        1818181818181818181818181818181818021818181818181818181818181818
        1809020118181818181818181818181818061A0F021818181818181818181818
        18181E1C1C0218181818181818181818181818271C1D02021818181818181818
        18181818272E1E1E02181818181818181818181818272B241E02181818181818
        18180202022D4B462C240202181818181818252D3F43434A42311F0218181818
        1818212D3F433F374A4A412E021818181818182E3E42474C4A4A4B4D02181818
        181818181836444A43322702181818181818181818181836433F241F02181818
        181818181818181818363A34230218181818181818181818181818362202}
    end
    object BitBtn3: TBitBtn
      Left = 3
      Top = 68
      Width = 81
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = BitBtn3Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C30E0000C30E0000000100000001000000380000003F
        0200004800000050000000500200005802000258060002580A0000600200007B
        02000A691C0002840600068410000A841600068E160010982A0010A12A0010AB
        2A00229858001CBF48003F8E690022D350002ADF58000069B5000272B5000272
        BF00067BBF00FF00FF001C98840038BF8E0022A1A10072D3BF000A84C9001698
        C900108ED3001698D3001CA1D3001CA1DF0022ABDF002AB5DF0030B5D3002AB5
        E90030B5E90030BFE90038BFE9003FC9DF0038C9E9003FC9E9003FD3E9003FC9
        F4003FD3F40058DFC90050D3E90048D3F40048DFF40050DFF40058DFF40069C9
        E90072D3F40050E9F40058E9FF0060E9FF0069E9FF0069F4F40060F4FF0069F4
        FF0069FFFF0072F4FF0072FFFF007BFFFF0084C9E9008ED3E90098FFFF00B5F4
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
        00000000000000000000000000000000000000000000000000001B211A1A1B1B
        1B1B1B1B1B1B1B1B1B1B1B21362B24232018171B1B1B1B1B1B1B1B21403C3B36
        322C25232019201B1B1B1B2142403C37352F2E2B292A26221A1B1B214442403C
        37352F282B2929261A1B1B21444241403C3735001E2A29261A1B1B2144424241
        403C372D002B2A271A1B1B2142424242413D3B3605002B271A1B1B2144424212
        02413D3D08002E2B1A1B1B2149481F04043F3D020800312C1A1B1B212020000F
        010102090002352E1A1B1B21301C0716100E0B03003C37321A1B1B2144001315
        110000003E403C371A1B1B21451D000D0C00144746393A341A1B1B213843330A
        0600002121212121211B1B1B21212121211B1B1B1B1B1B1B1B1B}
    end
    object BitBtn2: TBitBtn
      Left = 3
      Top = 38
      Width = 81
      Height = 25
      Caption = '&Nuevo'
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        1A020000424D1A020000000000001A0100002800000010000000100000000100
        08000000000000010000210B0000210B00003900000039000000EA8F3100B66A
        5000AB735800C07B5800EAA15800FFB65800AB6A6000B67B6000C0846000A16A
        6A00A1736A00C0846A00A17B7300B68F7B00EAC07B00F4C07B00B68F8400EAC0
        8400F4C08400F4CA8400B6988F00C0988F00F4CA8F00C0A19800CAA19800B6AB
        9800F4CA9800F4D49800CAABA100D4ABA100D4B6A100E0B6A100EAB6A100EAC0
        A100F4CAA100F4D4A100FFD4A100EAC0AB00F4D4AB00E0D4B600F4D4B600F4E0
        B600E0C0C000E0CAC000F4E0C000E0CACA00F4E0CA00FFE0CA00FFEACA00FFEA
        D400FFEAE000FFF4E000FFF4EA00FFF4F400FFFFF400FF00FF00FFFFFF003737
        0909090909090909090909090937373710302926231A16110E0E0E1309373737
        10302C2826221611110E0E110937373714322E2C2826221A11110E1109373737
        14332E2C292823221A11110E093737371736322E2E2C2826221A111109373737
        183834322E2C2928261A1616093737371C383534312E2C292826221A09373737
        1C38383534322E2C28262323093737371D3838383532312E2C28282209373737
        1E3838383835323131302719093737371F383838383834342E0D0C0A09373737
        1F383838383838362A0204000137373725383838383838382B07050337373737
        1F353434343434342A070B37373737371F212121211F1F211C0637373737}
    end
  end
  object IbTipo: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$tiposidentificacion".ID_IDENTIFICACION,'
      '  "gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION'
      'FROM'
      ' "gen$tiposidentificacion"')
    Left = 232
    Top = 224
  end
  object IbOficina: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  ID_AGENCIA,'
      '  DESCRIPCION_AGENCIA'
      'FROM'
      ' "gen$agencia"'
      'WHERE'
      '  (ID_AGENCIA <> :ID)')
    Left = 104
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object DsOficina: TDataSource
    DataSet = IbOficina
    Left = 136
    Top = 320
  end
  object DsTipo: TDataSource
    DataSet = IbTipo
    Left = 40
    Top = 232
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 184
    Top = 336
  end
  object IBconsulta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 152
    Top = 184
  end
  object IdTCPClient1: TIdTCPClient
    OnWork = IdTCPClient1Work
    OnWorkBegin = IdTCPClient1WorkBegin
    OnWorkEnd = IdTCPClient1WorkEnd
    Port = 0
    Left = 448
    Top = 152
  end
end
