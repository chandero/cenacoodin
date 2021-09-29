object frmAsignacionAbogado: TfrmAsignacionAbogado
  Left = 161
  Top = 42
  BorderStyle = bsDialog
  Caption = 'Asignacion y Control de Informes Abogados'
  ClientHeight = 610
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 577
    Width = 721
    Height = 33
    Align = alBottom
    Color = clOlive
    TabOrder = 0
    object cmdActualizar: TBitBtn
      Left = 561
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Actualizar'
      TabOrder = 0
      OnClick = cmdActualizarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
        840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
        C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
        F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
        FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
        1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
        0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F0F0F
        1D111111110E0A08031F1F0A0E11131D1F1D1111110E0B09041F1F0C11131D1F
        1D1F1D11110E0B0A051F1F0E131D1F1D11111F1D0F0C0A0A061F1F0F13131D11
        1111111F1D0B0A0A061F1F131515131311100F0F1F1D0A0A061F1F1318181514
        13130F0E0C1F1D0A061F1F151A1916151514110F0E0C1F0A061F1F181C1A1817
        16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
        1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
    end
    object cmdCerrar: TBitBtn
      Left = 639
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = cmdCerrarClick
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
  object GroupBox1: TGroupBox
    Left = 1
    Top = 1
    Width = 720
    Height = 199
    Caption = 'Asignaci'#243'n de Colocaciones'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label31: TLabel
      Left = 12
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Agencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 124
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Colocaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 275
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 396
      Top = 16
      Width = 70
      Height = 14
      Caption = 'Fecha Entrega'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 562
      Top = 16
      Width = 58
      Height = 14
      Caption = 'Cta Aportes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 527
      Top = 153
      Width = 36
      Height = 13
      Caption = 'Fecha I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 422
      Top = 153
      Width = 40
      Height = 13
      Caption = 'Fecha K'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 263
      Top = 153
      Width = 67
      Height = 14
      Caption = 'K Demandado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 4
      Top = 153
      Width = 70
      Height = 14
      Caption = 'Otros Pagares'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 286
      Top = 176
      Width = 41
      Height = 14
      Caption = 'K Actual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 422
      Top = 176
      Width = 40
      Height = 13
      Caption = 'Fecha K'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 527
      Top = 172
      Width = 36
      Height = 13
      Caption = 'Fecha I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 5
      Top = 172
      Width = 51
      Height = 13
      Caption = 'Abogado'
    end
    object EdAgencia: TDBLookupComboBox
      Left = 52
      Top = 14
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
      TabOrder = 0
    end
    object EdColocacion: TEdit
      Left = 181
      Top = 13
      Width = 92
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnExit = EdColocacionExit
      OnKeyPress = EdColocacionKeyPress
    end
    object EdEstado: TStaticText
      Left = 310
      Top = 13
      Width = 83
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvSpace
      BorderStyle = sbsSunken
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 34
      Width = 708
      Height = 113
      ActivePage = TabCodeudores
      TabIndex = 1
      TabOrder = 3
      object TabTitular: TTabSheet
        Caption = 'Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object DBTitular: TDBGrid
          Left = 1
          Top = 5
          Width = 696
          Height = 75
          DataSource = DSTitular
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_PERSONA'
              Title.Caption = 'CC / NIT'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRIMER_APELLIDO'
              Title.Caption = '1 APELLIDO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEGUNDO_APELLIDO'
              Title.Caption = '2 APELLIDO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_DIRECCION'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DIRECCION'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BARRIO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MUNICIPIO'
              Width = 70
              Visible = True
            end>
        end
      end
      object TabCodeudores: TTabSheet
        Caption = 'Codeudores'
        ImageIndex = 1
        object DBCodeudor: TDBGrid
          Left = 1
          Top = 5
          Width = 696
          Height = 75
          DataSource = DSCodeudor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_PERSONA'
              Title.Caption = 'CC / NIT'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRIMER_APELLIDO'
              Title.Caption = '1 APELLIDO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEGUNDO_APELLIDO'
              Title.Caption = '2 APELLIDO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_DIRECCION'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DIRECCION'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BARRIO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MUNICIPIO'
              Width = 70
              Visible = True
            end>
        end
      end
    end
    object EdFechaEntrega: TDateTimePicker
      Left = 469
      Top = 13
      Width = 92
      Height = 21
      CalAlignment = dtaLeft
      Date = 37693.4262030903
      Format = 'yyyy/MM/dd'
      Time = 37693.4262030903
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 4
    end
    object EdCtaAportes: TStaticText
      Left = 621
      Top = 13
      Width = 92
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      BevelEdges = []
      BevelInner = bvLowered
      BorderStyle = sbsSunken
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 5
    end
    object FechaID: TStaticText
      Left = 564
      Top = 151
      Width = 63
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 6
    end
    object FechaKD: TStaticText
      Left = 463
      Top = 151
      Width = 63
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 7
    end
    object EdKD: TStaticText
      Left = 330
      Top = 151
      Width = 92
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      BevelEdges = []
      BevelInner = bvLowered
      BorderStyle = sbsSunken
      Color = clCaptionText
      ParentColor = False
      TabOrder = 8
    end
    object StaticText1: TStaticText
      Left = 330
      Top = 173
      Width = 92
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      BevelEdges = []
      BevelInner = bvLowered
      BorderStyle = sbsSunken
      Color = clCaptionText
      ParentColor = False
      TabOrder = 9
    end
    object StaticText2: TStaticText
      Left = 463
      Top = 173
      Width = 63
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 10
    end
    object StaticText3: TStaticText
      Left = 564
      Top = 173
      Width = 63
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 11
    end
    object DBLCBAbogado: TDBLookupComboBox
      Left = 59
      Top = 173
      Width = 227
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'ID_ABOGADO'
      ListField = 'NOMBRE;PRIMER_APELLIDO;SEGUNDO_APELLIDO'
      ListSource = DSAbogados
      ParentFont = False
      TabOrder = 12
    end
    object Panel2: TPanel
      Left = 629
      Top = 151
      Width = 90
      Height = 41
      Align = alCustom
      Color = clOlive
      TabOrder = 13
    end
    object EdOtrosP: TEdit
      Left = 73
      Top = 150
      Width = 189
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
      OnExit = EdColocacionExit
      OnKeyPress = EdColocacionKeyPress
    end
    object BitBtn1: TBitBtn
      Left = 633
      Top = 158
      Width = 84
      Height = 26
      Caption = '&Actualizar'
      TabOrder = 15
      OnClick = cmdActualizarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
        840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
        C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
        F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
        FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
        1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
        0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F0F0F
        1D111111110E0A08031F1F0A0E11131D1F1D1111110E0B09041F1F0C11131D1F
        1D1F1D11110E0B0A051F1F0E131D1F1D11111F1D0F0C0A0A061F1F0F13131D11
        1111111F1D0B0A0A061F1F131515131311100F0F1F1D0A0A061F1F1318181514
        13130F0E0C1F1D0A061F1F151A1916151514110F0E0C1F0A061F1F181C1A1817
        16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
        1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
    end
  end
  object GroupBox2: TGroupBox
    Left = 2
    Top = 199
    Width = 719
    Height = 378
    Caption = 'Informacion Abogado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label2: TLabel
      Left = 3
      Top = 16
      Width = 63
      Height = 13
      Caption = 'Tipo Proceso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 149
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Ciudad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 274
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Juzgado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 592
      Top = 102
      Width = 28
      Height = 13
      Caption = 'Etapa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 436
      Top = 17
      Width = 45
      Height = 14
      Caption = 'Radicado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 579
      Top = 17
      Width = 30
      Height = 14
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 592
      Top = 79
      Width = 46
      Height = 13
      Caption = 'Estado P.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 592
      Top = 126
      Width = 23
      Height = 13
      Caption = 'Exito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdTipoP: TDBLookupComboBox
      Left = 69
      Top = 15
      Width = 77
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_ABOGADO'
      ListField = 'NOMBRE;PRIMER_APELLIDO;SEGUNDO_APELLIDO'
      ListSource = DSAbogados
      ParentFont = False
      TabOrder = 0
    end
    object EdCiudad: TDBLookupComboBox
      Left = 187
      Top = 15
      Width = 83
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_ABOGADO'
      ListField = 'NOMBRE;PRIMER_APELLIDO;SEGUNDO_APELLIDO'
      ListSource = DSAbogados
      ParentFont = False
      TabOrder = 1
    end
    object EdJuzgado: TDBLookupComboBox
      Left = 319
      Top = 15
      Width = 116
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_ABOGADO'
      ListField = 'NOMBRE;PRIMER_APELLIDO;SEGUNDO_APELLIDO'
      ListSource = DSAbogados
      ParentFont = False
      TabOrder = 2
    end
    object EdEtapa: TDBLookupComboBox
      Left = 638
      Top = 100
      Width = 76
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_ABOGADO'
      ListField = 'NOMBRE;PRIMER_APELLIDO;SEGUNDO_APELLIDO'
      ListSource = DSAbogados
      ParentFont = False
      TabOrder = 3
    end
    object EdRadicado: TEdit
      Left = 482
      Top = 14
      Width = 94
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnExit = EdColocacionExit
      OnKeyPress = EdColocacionKeyPress
    end
    object EdFechaR: TDateTimePicker
      Left = 611
      Top = 14
      Width = 92
      Height = 21
      CalAlignment = dtaLeft
      Date = 37693.4262030903
      Format = 'yyyy/MM/dd'
      Time = 37693.4262030903
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 5
    end
    object EdEstadoP: TDBLookupComboBox
      Left = 638
      Top = 77
      Width = 77
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_ABOGADO'
      ListField = 'NOMBRE;PRIMER_APELLIDO;SEGUNDO_APELLIDO'
      ListSource = DSAbogados
      ParentFont = False
      TabOrder = 6
    end
    object EdExito: TDBLookupComboBox
      Left = 638
      Top = 124
      Width = 76
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID_ABOGADO'
      ListField = 'NOMBRE;PRIMER_APELLIDO;SEGUNDO_APELLIDO'
      ListSource = DSAbogados
      ParentFont = False
      TabOrder = 7
    end
    object CHCautelar: TCheckBox
      Left = 592
      Top = 149
      Width = 117
      Height = 17
      Caption = 'Medidas Cautelares'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object GroupBox5: TGroupBox
      Left = 6
      Top = 202
      Width = 708
      Height = 135
      Caption = 'Evolucion del Proceso'
      TabOrder = 9
      object DBGrid2: TDBGrid
        Left = 2
        Top = 15
        Width = 704
        Height = 118
        Align = alClient
        DataSource = DSActuacion
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'FECHA_ACTUACION'
            Title.Caption = 'FECHA'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_ACTUACION'
            Title.Caption = 'ACTUACION'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACION'
            Width = 410
            Visible = True
          end>
      end
    end
    object CmdAgregar: TBitBtn
      Left = 11
      Top = 345
      Width = 75
      Height = 25
      Caption = 'Agregar'
      Enabled = False
      TabOrder = 10
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E0000000100000001000031319C003131
        A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
        E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
        FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
        FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
        0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
        0E1B180E0E0E0B08031B1B0A0E0E0E0E0E1B180E0E0E0E09041B1B0E0E0E0E0E
        0E1B180E0E0E0E0A051B1B0E0E181818181B181818180B0A061B1B0E0E1B1B1B
        1B1B1B1B1B1B0A0A061B1B0E10100E0E0E1B180E0E0B0A0A061B1B0E1313100E
        0E1B180E0E0B0A0A061B1B1015141110101B180E0E0E0B0B061B1B1318151312
        111B180E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
        0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
    end
    object PageControl2: TPageControl
      Left = 8
      Top = 40
      Width = 577
      Height = 153
      ActivePage = TabSheet1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabIndex = 0
      TabOrder = 11
      object TabSheet1: TTabSheet
        Caption = 'Acuerdo de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object DBAcuerdo: TDBGrid
          Left = 5
          Top = 2
          Width = 468
          Height = 60
          DataSource = DSAcuerdo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_AGENCIA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_COLOCACION'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ACUERDO'
              Width = 530
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 477
          Top = 1
          Width = 90
          Height = 61
          Color = clOlive
          TabOrder = 1
          object CmdAgregarAcuerdo: TBitBtn
            Left = 5
            Top = 19
            Width = 81
            Height = 25
            Caption = '&Agregar'
            TabOrder = 0
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
          end
        end
        object EdAcuerdo: TMemo
          Left = 3
          Top = 66
          Width = 565
          Height = 41
          Lines.Strings = (
            'EdAcuerdo')
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Medidas Cautelares Bienes'
        ImageIndex = 1
        object DBBienesC: TDBGrid
          Left = 0
          Top = 0
          Width = 569
          Height = 125
          Align = alClient
          DataSource = DSBienesC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRIPCION_BIEN'
              Title.Caption = 'DESCRIPCION'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BARRIO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIRECCION'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIUDAD'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESCRITURA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTARIA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATRICULA'
              Width = 80
              Visible = True
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Medidas Cautelares Salarios'
        ImageIndex = 2
        object Label18: TLabel
          Left = 345
          Top = 73
          Width = 42
          Height = 14
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 8
          Top = 77
          Width = 31
          Height = 14
          Caption = 'Tipo Id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 174
          Top = 77
          Width = 37
          Height = 14
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 6
          Top = 101
          Width = 56
          Height = 14
          Caption = 'Vinculacion'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 217
          Top = 105
          Width = 33
          Height = 14
          Caption = 'Salario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object DBSalarios: TDBGrid
          Left = 5
          Top = 2
          Width = 468
          Height = 60
          DataSource = DSSalarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_DOC'
              Title.Caption = 'TIPO DOC'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOCUMENTO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VINCULACION'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALARIO'
              Width = 120
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 477
          Top = 1
          Width = 90
          Height = 61
          Color = clOlive
          TabOrder = 1
          object CmdAgregarSal: TBitBtn
            Left = 5
            Top = 19
            Width = 81
            Height = 25
            Caption = '&Agregar'
            TabOrder = 0
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
          end
        end
        object EdEmpresa: TEdit
          Left = 395
          Top = 70
          Width = 94
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnExit = EdColocacionExit
          OnKeyPress = EdColocacionKeyPress
        end
        object CBtiposid: TDBLookupComboBox
          Left = 43
          Top = 71
          Width = 131
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyField = 'ID_IDENTIFICACION'
          ListField = 'DESCRIPCION_IDENTIFICACION'
          ParentFont = False
          TabOrder = 3
        end
        object EdNumeroIdentificacion: TMemo
          Left = 213
          Top = 71
          Width = 122
          Height = 22
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 15
          ParentFont = False
          TabOrder = 4
          WantReturns = False
          WordWrap = False
        end
        object Memo2: TMemo
          Left = 77
          Top = 95
          Width = 122
          Height = 22
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 15
          ParentFont = False
          TabOrder = 5
          WantReturns = False
          WordWrap = False
        end
        object EdSalario: TJvCurrencyEdit
          Left = 269
          Top = 96
          Width = 115
          Height = 21
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 6
          HasMaxValue = False
          HasMinValue = False
        end
      end
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 564
    Top = 56
  end
  object IBQAbogados: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELL' +
        'IDO,"gen$persona".NOMBRE, "gen$abogados".ID_IDENTIFICACION,"gen$' +
        'abogados".ID_PERSONA, "gen$abogados".ID_ABOGADO from "gen$abogad' +
        'os"'
      
        'inner join "gen$persona" on ("gen$abogados".ID_IDENTIFICACION = ' +
        '"gen$persona".ID_IDENTIFICACION and "gen$abogados".ID_PERSONA = ' +
        '"gen$persona".ID_PERSONA)')
    Left = 636
    Top = 54
    object IBQAbogadosPRIMER_APELLIDO: TIBStringField
      FieldName = 'PRIMER_APELLIDO'
      Origin = '"gen$persona"."PRIMER_APELLIDO"'
      Size = 30
    end
    object IBQAbogadosSEGUNDO_APELLIDO: TIBStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Origin = '"gen$persona"."SEGUNDO_APELLIDO"'
      Size = 30
    end
    object IBQAbogadosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = '"gen$persona"."NOMBRE"'
      OnGetText = IBQAbogadosNOMBREGetText
      Size = 255
    end
    object IBQAbogadosID_IDENTIFICACION: TSmallintField
      FieldName = 'ID_IDENTIFICACION'
      Origin = '"gen$abogados"."ID_IDENTIFICACION"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQAbogadosID_PERSONA: TIBStringField
      FieldName = 'ID_PERSONA'
      Origin = '"gen$abogados"."ID_PERSONA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object IBQAbogadosID_ABOGADO: TSmallintField
      FieldName = 'ID_ABOGADO'
      Origin = '"gen$abogados"."ID_ABOGADO"'
      Required = True
    end
  end
  object IBTransaction1: TIBTransaction
    AllowAutoStart = False
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Left = 574
    Top = 100
  end
  object DSAbogados: TDataSource
    DataSet = IBQAbogados
    Left = 664
    Top = 54
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 592
    Top = 58
  end
  object IBTitular: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$persona".ID_PERSONA,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$direccion".ID_DIRECCION,'
      '  "gen$direccion".DIRECCION,'
      '  "gen$direccion".BARRIO,'
      '  "gen$direccion".MUNICIPIO'
      'FROM'
      ' "gen$persona"'
      
        ' INNER JOIN "gen$direccion" ON ("gen$persona".ID_IDENTIFICACION=' +
        '"gen$direccion".ID_IDENTIFICACION)'
      '  AND ("gen$persona".ID_PERSONA="gen$direccion".ID_PERSONA)'
      'WHERE'
      '  ("gen$persona".ID_IDENTIFICACION = :ID) AND '
      '  ("gen$persona".ID_PERSONA = :PERSONA) AND '
      '  ("gen$direccion".ID_DIRECCION = 1)')
    Left = 128
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PERSONA'
        ParamType = ptUnknown
      end>
    object IBTitularID_PERSONA: TIBStringField
      FieldName = 'ID_PERSONA'
      Origin = '"gen$persona"."ID_PERSONA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object IBTitularNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = '"gen$persona"."NOMBRE"'
      Size = 255
    end
    object IBTitularPRIMER_APELLIDO: TIBStringField
      FieldName = 'PRIMER_APELLIDO'
      Origin = '"gen$persona"."PRIMER_APELLIDO"'
      Size = 30
    end
    object IBTitularSEGUNDO_APELLIDO: TIBStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Origin = '"gen$persona"."SEGUNDO_APELLIDO"'
      Size = 30
    end
    object IBTitularID_DIRECCION: TSmallintField
      FieldName = 'ID_DIRECCION'
      Origin = '"gen$direccion"."ID_DIRECCION"'
      Required = True
      Visible = False
    end
    object IBTitularDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = '"gen$direccion"."DIRECCION"'
      Size = 100
    end
    object IBTitularBARRIO: TIBStringField
      FieldName = 'BARRIO'
      Origin = '"gen$direccion"."BARRIO"'
      Size = 50
    end
    object IBTitularMUNICIPIO: TIBStringField
      FieldName = 'MUNICIPIO'
      Origin = '"gen$direccion"."MUNICIPIO"'
      Size = 50
    end
  end
  object IBCodeudor: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$persona".ID_PERSONA,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$direccion".ID_DIRECCION,'
      '  "gen$direccion".DIRECCION,'
      '  "gen$direccion".BARRIO,'
      '  "gen$direccion".MUNICIPIO'
      'FROM'
      ' "gen$persona"'
      
        ' INNER JOIN "gen$direccion" ON ("gen$persona".ID_IDENTIFICACION=' +
        '"gen$direccion".ID_IDENTIFICACION)'
      '  AND ("gen$persona".ID_PERSONA="gen$direccion".ID_PERSONA)'
      'WHERE'
      '  ("gen$persona".ID_IDENTIFICACION = :ID) AND '
      '  ("gen$persona".ID_PERSONA = :PERSONA) AND '
      '  ("gen$direccion".ID_DIRECCION = 1)')
    Left = 176
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PERSONA'
        ParamType = ptUnknown
      end>
    object IBCodeudorID_PERSONA: TIBStringField
      FieldName = 'ID_PERSONA'
      Origin = '"gen$persona"."ID_PERSONA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object IBCodeudorNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = '"gen$persona"."NOMBRE"'
      Size = 255
    end
    object IBCodeudorPRIMER_APELLIDO: TIBStringField
      FieldName = 'PRIMER_APELLIDO'
      Origin = '"gen$persona"."PRIMER_APELLIDO"'
      Size = 30
    end
    object IBCodeudorSEGUNDO_APELLIDO: TIBStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Origin = '"gen$persona"."SEGUNDO_APELLIDO"'
      Size = 30
    end
    object IBCodeudorID_DIRECCION: TSmallintField
      FieldName = 'ID_DIRECCION'
      Origin = '"gen$direccion"."ID_DIRECCION"'
      Required = True
      Visible = False
    end
    object IBCodeudorDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = '"gen$direccion"."DIRECCION"'
      Size = 100
    end
    object IBCodeudorBARRIO: TIBStringField
      FieldName = 'BARRIO'
      Origin = '"gen$direccion"."BARRIO"'
      Size = 50
    end
    object IBCodeudorMUNICIPIO: TIBStringField
      FieldName = 'MUNICIPIO'
      Origin = '"gen$direccion"."MUNICIPIO"'
      Size = 50
    end
  end
  object DSTitular: TDataSource
    DataSet = IBTitular
    Left = 152
    Top = 96
  end
  object DSCodeudor: TDataSource
    DataSet = IBCodeudor
    Left = 200
    Top = 96
  end
  object DSAcuerdo: TDataSource
    DataSet = IBAcuerdo
    Left = 432
    Top = 376
  end
  object IBAcuerdo: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select * from "col$acuerdopago" where ID_AGENCIA = :ID_AGENCIA A' +
        'ND ID_COLOCACION = :ID_COLOCACION')
    Left = 408
    Top = 376
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
    object IBAcuerdoID_AGENCIA: TSmallintField
      FieldName = 'ID_AGENCIA'
      Origin = '"col$acuerdopago"."ID_AGENCIA"'
      Required = True
      Visible = False
    end
    object IBAcuerdoID_COLOCACION: TIBStringField
      FieldName = 'ID_COLOCACION'
      Origin = '"col$acuerdopago"."ID_COLOCACION"'
      Visible = False
      Size = 11
    end
    object IBAcuerdoACUERDO: TMemoField
      FieldName = 'ACUERDO'
      Origin = '"col$acuerdopago"."ACUERDO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSBienesC: TDataSource
    DataSet = IBBienesC
    Left = 496
    Top = 376
  end
  object IBBienesC: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$bienesraices".DESCRIPCION_BIEN,'
      '  "gen$bienesraices".BARRIO,'
      '  "gen$bienesraices".DIRECCION,'
      '  "gen$bienesraices".CIUDAD,'
      '  "gen$bienesraices".ESCRITURA,'
      '  "gen$bienesraices".NOTARIA,'
      '  "gen$bienesraices".MATRICULA,'
      '  "gen$bienesraices".ES_INFORMACION,'
      '  "gen$bienesraices".ES_GARANTIAREAL,'
      '  "gen$bienesraices".ES_GARANTIAPERSONAL'
      'FROM'
      ' "gen$bienesraices"'
      'WHERE'
      
        '  ("gen$bienesraices".ID_IDENTIFICACION = :ID_IDENTIFICACION) AN' +
        'D '
      '  ("gen$bienesraices".ID_PERSONA = :ID_PERSONA)')
    Left = 472
    Top = 376
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
    object IBBienesCDESCRIPCION_BIEN: TIBStringField
      FieldName = 'DESCRIPCION_BIEN'
      Origin = '"gen$bienesraices"."DESCRIPCION_BIEN"'
      Size = 150
    end
    object IBBienesCBARRIO: TIBStringField
      FieldName = 'BARRIO'
      Origin = '"gen$bienesraices"."BARRIO"'
      Size = 50
    end
    object IBBienesCDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = '"gen$bienesraices"."DIRECCION"'
      Size = 100
    end
    object IBBienesCCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = '"gen$bienesraices"."CIUDAD"'
      Size = 50
    end
    object IBBienesCESCRITURA: TIBStringField
      FieldName = 'ESCRITURA'
      Origin = '"gen$bienesraices"."ESCRITURA"'
      Size = 30
    end
    object IBBienesCNOTARIA: TIBStringField
      FieldName = 'NOTARIA'
      Origin = '"gen$bienesraices"."NOTARIA"'
      Size = 100
    end
    object IBBienesCMATRICULA: TIBStringField
      FieldName = 'MATRICULA'
      Origin = '"gen$bienesraices"."MATRICULA"'
      Size = 50
    end
    object IBBienesCES_INFORMACION: TSmallintField
      FieldName = 'ES_INFORMACION'
      Origin = '"gen$bienesraices"."ES_INFORMACION"'
    end
    object IBBienesCES_GARANTIAREAL: TSmallintField
      FieldName = 'ES_GARANTIAREAL'
      Origin = '"gen$bienesraices"."ES_GARANTIAREAL"'
    end
    object IBBienesCES_GARANTIAPERSONAL: TSmallintField
      FieldName = 'ES_GARANTIAPERSONAL'
      Origin = '"gen$bienesraices"."ES_GARANTIAPERSONAL"'
    end
  end
  object CDSalarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 376
    Data = {
      A90000009619E0BD010000001800000005000000000003000000A90008544950
      4F5F444F43040001000000000009444F43554D454E544F010049000000010005
      5749445448020002000F0007454D505245534101004900000001000557494454
      480200020064000B56494E43554C4143494F4E01004900000001000557494454
      480200020064000753414C4152494F0800040000000100075355425459504502
      00490006004D6F6E6579000000}
    object CDSalariosTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
    end
    object CDSalariosDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object CDSalariosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 100
    end
    object CDSalariosVINCULACION: TStringField
      FieldName = 'VINCULACION'
      Size = 100
    end
    object CDSalariosSALARIO: TCurrencyField
      FieldName = 'SALARIO'
    end
  end
  object DSSalarios: TDataSource
    DataSet = CDSalarios
    Left = 552
    Top = 376
  end
  object DSActuacion: TDataSource
    DataSet = IBActuacion
    Left = 376
    Top = 496
  end
  object IBActuacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "col$informeabogado".FECHA_ACTUACION,'
      '  "col$informeabogado".ID_ACTUACION,'
      '  "col$informeabogado".OBSERVACION'
      'FROM'
      ' "col$informeabogado"'
      'WHERE'
      '  ("col$informeabogado".ID_AGENCIA = :ID_AGENCIA) AND '
      '  ("col$informeabogado".ID_COLOCACION = :ID_COLOCACION)'
      'ORDER BY FECHA_ACTUACION ASC')
    Left = 408
    Top = 496
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
    object IBActuacionFECHA_ACTUACION: TDateField
      FieldName = 'FECHA_ACTUACION'
      Origin = '"col$informeabogado"."FECHA_ACTUACION"'
    end
    object IBActuacionID_ACTUACION: TSmallintField
      FieldName = 'ID_ACTUACION'
      Origin = '"col$informeabogado"."ID_ACTUACION"'
    end
    object IBActuacionOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = '"col$informeabogado"."OBSERVACION"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
end
