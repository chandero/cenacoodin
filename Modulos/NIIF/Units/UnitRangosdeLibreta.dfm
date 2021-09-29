object frmRangosdeLibreta: TfrmRangosdeLibreta
  Left = 221
  Top = 148
  Width = 518
  Height = 307
  Caption = 'Rangos de Libretas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox9: TGroupBox
    Left = 0
    Top = 0
    Width = 510
    Height = 67
    Align = alTop
    TabOrder = 0
    object Label24: TLabel
      Left = 4
      Top = 18
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
      Top = 20
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
      Left = 6
      Top = 42
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
    object DBLCBTipoCaptacion: TDBLookupComboBox
      Left = 110
      Top = 16
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
      TabOrder = 0
      OnEnter = DBLCBTipoCaptacionEnter
    end
    object EdNumeroCap: TJvEdit
      Left = 394
      Top = 16
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
      TabOrder = 1
      OnExit = EdNumeroCapExit
      OnKeyPress = EdNumeroCapKeyPress
    end
    object EdDigitoCap: TStaticText
      Left = 478
      Top = 16
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
      TabOrder = 2
    end
    object EdNombreCap: TStaticText
      Left = 110
      Top = 40
      Width = 389
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
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 115
    Width = 510
    Height = 124
    Align = alClient
    TabOrder = 1
    object GridHistoria: TJvDBGrid
      Left = 1
      Top = 1
      Width = 508
      Height = 122
      Align = alClient
      DataSource = DSHistoria
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      AutoAppend = False
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FECHA_CAMBIO'
          Title.Alignment = taCenter
          Title.Caption = 'FECHA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_INICIAL_OLD'
          Title.Alignment = taCenter
          Title.Caption = 'INICIAL ANTERIOR'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_FINAL_OLD'
          Title.Alignment = taCenter
          Title.Caption = 'FINAL ANTERIOR'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_INICIAL'
          Title.Alignment = taCenter
          Title.Caption = 'NUEVO INICIAL'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_FINAL'
          Title.Alignment = taCenter
          Title.Caption = 'NUEVO FINAL'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 239
    Width = 510
    Height = 34
    Align = alBottom
    Color = clOlive
    TabOrder = 2
    object CmdNuevo: TBitBtn
      Left = 276
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Otra'
      TabOrder = 0
      OnClick = CmdNuevoClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000420B0000420B00000001000000010000CE630000FFD6
        AD00FFE7C600FFEFDE00FFEFE700FFF7EF0042B5F7008CD6F700B5DEF700FF00
        FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
        090909090909090909090900000000000000000000000000000009000B0B0505
        0303030402020101010009000B0B0B050505030303020202010009000B0B0B0B
        0505050303040201010009000B0B0B0B0B0B050503030302010009000B0B0B0B
        0B0B0B0505030402010009000B0B0B0B0B0B0B0B050A0A0A010009000B0B0B0B
        0B0B0B0B0B0A060A010009000B0B0B0B0B0B0B0A0A0A060A0A0A09000B0B0B0B
        0B0B0B0A07080808070A09000B0B0B0B0B0B0B0A0A0A080A0A0A090000000000
        00000000000A080A000009090000000000000000000A0A0A0009090909090909
        0909090909090909090909090909090909090909090909090909}
    end
    object CmdGrabar: TBitBtn
      Left = 353
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      Enabled = False
      TabOrder = 1
      OnClick = CmdGrabarClick
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
      Left = 429
      Top = 5
      Width = 75
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 67
    Width = 510
    Height = 48
    Align = alTop
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 6
      Top = 4
      Width = 247
      Height = 41
      Caption = 'Numeraci'#243'n Actual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 126
        Top = 18
        Width = 9
        Height = 13
        Caption = 'Al'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 4
        Top = 18
        Width = 16
        Height = 13
        Caption = 'Del'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EdNumeroIAnt: TStaticText
        Left = 21
        Top = 15
        Width = 104
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkFlat
        BorderStyle = sbsSunken
        Color = clCaptionText
        ParentColor = False
        TabOrder = 0
      end
      object EdNumeroFAnt: TStaticText
        Left = 139
        Top = 15
        Width = 104
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkFlat
        BorderStyle = sbsSunken
        Color = clCaptionText
        ParentColor = False
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 260
      Top = 4
      Width = 247
      Height = 41
      Caption = 'Nueva Numeraci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label3: TLabel
        Left = 126
        Top = 18
        Width = 9
        Height = 13
        Caption = 'Al'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 4
        Top = 18
        Width = 16
        Height = 13
        Caption = 'Del'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EdNumeroI: TJvEdit
        Left = 22
        Top = 16
        Width = 103
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
        MaxLength = 7
        PasswordChar = #0
        ReadOnly = False
        TabOrder = 0
        OnExit = EdNumeroIExit
        OnKeyPress = EdNumeroIKeyPress
      end
      object EdNumeroF: TJvEdit
        Left = 140
        Top = 16
        Width = 103
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
        MaxLength = 7
        PasswordChar = #0
        ReadOnly = False
        TabOrder = 1
        OnExit = EdNumeroFExit
        OnKeyPress = EdNumeroFKeyPress
      end
    end
  end
  object IBConsulta: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 448
    Top = 48
  end
  object IBHistoria: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select FECHA_CAMBIO, NUMERO_INICIAL_OLD, NUMERO_FINAL_OLD, NUMER' +
        'O_INICIAL, NUMERO_FINAL from "cap$libretashistoria" where ID_AGE' +
        'NCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION' +
        '" and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIG' +
        'ITO_CUENTA"')
    Left = 478
    Top = 48
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
    object IBHistoriaNUMERO_INICIAL_OLD: TIntegerField
      FieldName = 'NUMERO_INICIAL_OLD'
      Origin = '"cap$libretashistoria"."NUMERO_INICIAL_OLD"'
    end
    object IBHistoriaNUMERO_FINAL_OLD: TIntegerField
      FieldName = 'NUMERO_FINAL_OLD'
      Origin = '"cap$libretashistoria"."NUMERO_FINAL_OLD"'
    end
    object IBHistoriaNUMERO_INICIAL: TIntegerField
      FieldName = 'NUMERO_INICIAL'
      Origin = '"cap$libretashistoria"."NUMERO_INICIAL"'
    end
    object IBHistoriaNUMERO_FINAL: TIntegerField
      FieldName = 'NUMERO_FINAL'
      Origin = '"cap$libretashistoria"."NUMERO_FINAL"'
    end
    object IBHistoriaFECHA_CAMBIO: TDateField
      FieldName = 'FECHA_CAMBIO'
      Origin = '"cap$libretashistoria"."FECHA_CAMBIO"'
    end
  end
  object DSHistoria: TDataSource
    AutoEdit = False
    DataSet = IBHistoria
    Left = 422
    Top = 50
  end
  object IBTiposCaptacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select "cap$tipocaptacion".ID_TIPO_CAPTACION,"cap$tipocaptacion"' +
        '.DESCRIPCION from "cap$tipocaptacion" inner join "cap$tiposforma' +
        '" ON "cap$tipocaptacion".ID_FORMA = "cap$tiposforma".ID_FORMA  w' +
        'here "cap$tiposforma".AHORRO = 1')
    Left = 278
    Top = 10
  end
  object DSTiposCaptacion: TDataSource
    AutoEdit = False
    DataSet = IBTiposCaptacion
    Left = 306
    Top = 12
  end
end
