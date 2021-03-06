object frmConsultaPeriodoGracia: TfrmConsultaPeriodoGracia
  Left = 87
  Top = 96
  Width = 1206
  Height = 521
  Caption = 'Colocaciones con Periodo de Gracia Activo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1198
    Height = 342
    Align = alClient
    Caption = 'Colocaciones con Periodo de Gracia'
    TabOrder = 0
    object DBGperiodogracias: TDBGrid
      Left = 2
      Top = 15
      Width = 1194
      Height = 325
      Align = alClient
      DataSource = DSperiodogracia
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGperiodograciasCellClick
      OnDrawColumnCell = DBGperiodograciasDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_COLOCACION'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Width = 362
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_CAPITAL'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_INTERES'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_REGISTRO'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SE_CAUSA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 455
    Width = 1198
    Height = 32
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object btnCerrar: TBitBtn
      Left = 1118
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
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
    object btnExcel: TBitBtn
      Left = 4
      Top = 5
      Width = 75
      Height = 25
      Caption = 'A Excel'
      TabOrder = 1
      OnClick = btnExcelClick
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
  object Panel2: TPanel
    Left = 0
    Top = 342
    Width = 1198
    Height = 113
    Align = alBottom
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Colocaci'#243'n'
    end
    object Label2: TLabel
      Left = 134
      Top = 8
      Width = 44
      Height = 13
      Caption = 'Asociado'
    end
    object Label3: TLabel
      Left = 480
      Top = 8
      Width = 50
      Height = 13
      Caption = 'D'#237'as Mora'
    end
    object Label4: TLabel
      Left = 713
      Top = 0
      Width = 73
      Height = 26
      Alignment = taCenter
      Caption = 'Peri'#243'do Gracia En D'#237'as'
      WordWrap = True
    end
    object CmdBuscar: TSpeedButton
      Left = 107
      Top = 19
      Width = 21
      Height = 22
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
      OnClick = CmdBuscarClick
    end
    object Label5: TLabel
      Left = 584
      Top = 0
      Width = 35
      Height = 13
      Caption = 'Fechas'
    end
    object Label6: TLabel
      Left = 552
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Capital'
    end
    object Label7: TLabel
      Left = 620
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Inter'#233's'
    end
    object edColocacion: TMaskEdit
      Left = 7
      Top = 21
      Width = 98
      Height = 21
      TabOrder = 0
      OnExit = edColocacionExit
    end
    object edAsociado: TEdit
      Left = 134
      Top = 21
      Width = 345
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edMora: TJvIntegerEdit
      Left = 480
      Top = 21
      Width = 50
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 2
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object btnAgregar: TBitBtn
      Left = 925
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 3
      OnClick = btnAgregarClick
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
    object btnEliminar: TBitBtn
      Left = 925
      Top = 84
      Width = 75
      Height = 25
      Caption = 'Quitar'
      Enabled = False
      TabOrder = 4
      OnClick = btnEliminarClick
    end
    object edPeriodoGracia: TJvIntegerEdit
      Left = 721
      Top = 29
      Width = 50
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 5
      Value = 120
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object edFechaCapital: TDateTimePicker
      Left = 535
      Top = 20
      Width = 82
      Height = 21
      CalAlignment = dtaLeft
      Date = 43917.5391161111
      Time = 43917.5391161111
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 6
    end
    object edFechaInteres: TDateTimePicker
      Left = 620
      Top = 20
      Width = 82
      Height = 21
      CalAlignment = dtaLeft
      Date = 43917.5391161111
      Time = 43917.5391161111
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 7
    end
    object chkCausa: TCheckBox
      Left = 784
      Top = 16
      Width = 137
      Height = 41
      Caption = 'Causa Inter'#233's Normal'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object btnLimpiar: TBitBtn
      Left = 925
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Limpiar'
      TabOrder = 9
      OnClick = btnLimpiarClick
    end
    object btnNormalizar: TButton
      Left = 5
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Normalizar'
      Enabled = False
      TabOrder = 10
      OnClick = btnNormalizarClick
    end
    object btnReversoNormalizar: TButton
      Left = 5
      Top = 77
      Width = 75
      Height = 25
      Caption = 'Reverso'
      Enabled = False
      TabOrder = 11
      OnClick = btnReversoNormalizarClick
    end
    object btnActualizar: TBitBtn
      Left = 925
      Top = 60
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      Enabled = False
      TabOrder = 12
      OnClick = btnActualizarClick
    end
  end
  object CDSperiodogracia: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_COLOCACION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FECHA_CAPITAL'
        DataType = ftDate
      end
      item
        Name = 'FECHA_INTERES'
        DataType = ftDate
      end
      item
        Name = 'FECHA_REGISTRO'
        DataType = ftDateTime
      end
      item
        Name = 'DIAS'
        DataType = ftInteger
      end
      item
        Name = 'SE_CAUSA'
        DataType = ftBoolean
      end
      item
        Name = 'ESTADO'
        DataType = ftInteger
      end
      item
        Name = 'ID'
        DataType = ftLargeint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 656
    Top = 192
    Data = {
      D20000009619E0BD010000001800000009000000000003000000D2000D49445F
      434F4C4F434143494F4E0100490000000100055749445448020002001400064E
      4F4D42524501004900000001000557494454480200020014000D46454348415F
      4341504954414C04000600000000000D46454348415F494E5445524553040006
      00000000000E46454348415F524547495354524F080008000000000004444941
      5304000100000000000853455F43415553410200030000000000064553544144
      4F040001000000000002494408000100000000000000}
    object CDSperiodograciaID_COLOCACION: TStringField
      DisplayWidth = 17
      FieldName = 'ID_COLOCACION'
    end
    object CDSperiodograciaNOMBRE: TStringField
      DisplayWidth = 64
      FieldName = 'NOMBRE'
    end
    object CDSperiodograciaFECHA_CAPITAL: TDateField
      DisplayWidth = 19
      FieldName = 'FECHA_CAPITAL'
    end
    object CDSperiodograciaFECHA_INTERES: TDateField
      DisplayWidth = 20
      FieldName = 'FECHA_INTERES'
    end
    object CDSperiodograciaFECHA_REGISTRO: TDateTimeField
      DisplayWidth = 21
      FieldName = 'FECHA_REGISTRO'
    end
    object CDSperiodograciaDIAS: TIntegerField
      DisplayWidth = 7
      FieldName = 'DIAS'
    end
    object CDSperiodograciaSE_CAUSA: TBooleanField
      DisplayWidth = 19
      FieldName = 'SE_CAUSA'
    end
    object CDSperiodograciaESTADO: TIntegerField
      DisplayWidth = 35
      FieldName = 'ESTADO'
      OnGetText = CDSperiodograciaESTADOGetText
    end
    object CDSperiodograciaID: TLargeintField
      DisplayWidth = 18
      FieldName = 'ID'
    end
  end
  object DSperiodogracia: TDataSource
    DataSet = CDSperiodogracia
    Left = 616
    Top = 168
  end
  object IBQperiodogracia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTperiodogracia
    Left = 376
    Top = 168
  end
  object IBTperiodogracia: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 408
    Top = 232
  end
  object SD1: TSaveDialog
    Left = 88
    Top = 240
  end
  object IBQcolocacion: TIBQuery
    Left = 88
    Top = 320
  end
  object IBSQL1: TIBSQL
    Left = 248
    Top = 320
  end
  object IBQproceso: TIBQuery
    Left = 848
    Top = 240
  end
  object IBTproceso: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 456
    Top = 248
  end
end
