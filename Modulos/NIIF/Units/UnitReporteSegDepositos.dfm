object frmReporteSegDepositos: TfrmReporteSegDepositos
  Left = 109
  Top = 190
  Width = 855
  Height = 521
  Caption = 'Reporte de Seguro Dep'#243'sitos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 454
    Width = 847
    Height = 33
    Align = alBottom
    Color = clOlive
    TabOrder = 0
    object btnCerrar: TBitBtn
      Left = 700
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
    object btnImprimir: TBitBtn
      Left = 4
      Top = 3
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = btnImprimirClick
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 847
    Height = 454
    ActivePage = TabConsol
    Align = alClient
    TabIndex = 4
    TabOrder = 1
    object Tab01: TTabSheet
      Caption = 'Oficina Oca'#241'a'
      OnShow = Tab01Show
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 839
        Height = 320
        Align = alClient
        TabOrder = 0
        object DBChart1: TDBChart
          Left = 1
          Top = 1
          Width = 837
          Height = 318
          AnimatedZoom = True
          AnimatedZoomSteps = 4
          BackWall.Brush.Color = clWhite
          Gradient.Direction = gdLeftRight
          Gradient.EndColor = clWhite
          Gradient.Visible = True
          LeftWall.Color = 65408
          LeftWall.Size = 4
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Title.Text.Strings = (
            'Cartera por L'#237'neas de Cr'#233'dito Vs Cartera Total a la Fecha')
          Chart3DPercent = 10
          Legend.Alignment = laLeft
          Legend.ColorWidth = 10
          Legend.Font.Charset = ANSI_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -11
          Legend.Font.Name = 'Kabel Bk BT'
          Legend.Font.Style = []
          Legend.Frame.Visible = False
          Legend.Inverted = True
          Legend.LegendStyle = lsValues
          Legend.TextStyle = ltsLeftPercent
          Legend.TopPos = 3
          Legend.Visible = False
          ScaleLastPage = False
          View3DOptions.Elevation = 315
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DOptions.ZoomText = False
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 2
          TabOrder = 0
          object Series1: THorizBarSeries
            ColorEachPoint = True
            Marks.Arrow.Color = clBlue
            Marks.ArrowLength = 15
            Marks.BackColor = clYellow
            Marks.Clip = True
            Marks.Style = smsPercent
            Marks.Visible = True
            DataSource = CDS
            PercentFormat = '##0.### %'
            SeriesColor = clRed
            XLabelsSource = 'DESCRIPCION_LINEA'
            BarWidthPercent = 40
            MultiBar = mbNone
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1
            XValues.Order = loDescending
            XValues.ValueSource = 'PORCENTAJE'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loAscending
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 320
        Width = 839
        Height = 106
        Align = alBottom
        TabOrder = 1
        object Label1: TLabel
          Left = 527
          Top = 4
          Width = 80
          Height = 13
          Caption = 'Total de Cr'#233'ditos'
        end
        object Label2: TLabel
          Left = 527
          Top = 27
          Width = 87
          Height = 13
          Caption = 'Total de la Cartera'
        end
        object Label11: TLabel
          Left = 532
          Top = 51
          Width = 73
          Height = 13
          Caption = 'Fecha de Corte'
        end
        object DBGrid1: TDBGrid
          Left = 4
          Top = 2
          Width = 509
          Height = 59
          DataSource = DS1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ID'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'DESCRIPCION'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEUDA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORCENTAJE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Visible = True
            end>
        end
        object EdCantidad: TStaticText
          Left = 661
          Top = 2
          Width = 106
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvSpace
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 1
        end
        object EdDeuda: TStaticText
          Left = 621
          Top = 24
          Width = 146
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvSpace
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 2
        end
        object EdFechaCorte: TDateTimePicker
          Left = 621
          Top = 49
          Width = 91
          Height = 20
          CalAlignment = dtaLeft
          Date = 38563.4397889468
          Time = 38563.4397889468
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 3
        end
      end
    end
    object Tab02: TTabSheet
      Caption = 'Oficina Abrego'
      ImageIndex = 1
      OnShow = Tab02Show
      object Panel5: TPanel
        Left = 0
        Top = 362
        Width = 839
        Height = 64
        Align = alBottom
        TabOrder = 0
        object Label3: TLabel
          Left = 527
          Top = 4
          Width = 80
          Height = 13
          Caption = 'Total de Cr'#233'ditos'
        end
        object Label4: TLabel
          Left = 527
          Top = 27
          Width = 87
          Height = 13
          Caption = 'Total de la Cartera'
        end
        object DBGrid2: TDBGrid
          Left = 4
          Top = 2
          Width = 509
          Height = 59
          DataSource = DS2
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ID'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'DESCRIPCION'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEUDA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORCENTAJE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Visible = True
            end>
        end
        object EdCantidad02: TStaticText
          Left = 661
          Top = 2
          Width = 106
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvSpace
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 1
        end
        object EdDeuda02: TStaticText
          Left = 621
          Top = 24
          Width = 146
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvSpace
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 2
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 839
        Height = 362
        Align = alClient
        TabOrder = 1
        object DBChart2: TDBChart
          Left = 1
          Top = 1
          Width = 837
          Height = 360
          AnimatedZoom = True
          AnimatedZoomSteps = 4
          BackWall.Brush.Color = clWhite
          Gradient.Direction = gdLeftRight
          Gradient.EndColor = clWhite
          Gradient.Visible = True
          LeftWall.Brush.Color = clWhite
          LeftWall.Color = 65408
          LeftWall.Size = 4
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Title.Text.Strings = (
            'Cartera por L'#237'neas de Cr'#233'dito Vs Cartera Total a la Fecha')
          Chart3DPercent = 10
          Legend.Alignment = laLeft
          Legend.ColorWidth = 10
          Legend.Font.Charset = ANSI_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -11
          Legend.Font.Name = 'Kabel Bk BT'
          Legend.Font.Style = []
          Legend.Frame.Visible = False
          Legend.Inverted = True
          Legend.LegendStyle = lsValues
          Legend.TextStyle = ltsLeftPercent
          Legend.TopPos = 3
          Legend.Visible = False
          ScaleLastPage = False
          View3DOptions.Elevation = 315
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DOptions.ZoomText = False
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 2
          TabOrder = 0
          object HorizBarSeries1: THorizBarSeries
            ColorEachPoint = True
            Marks.Arrow.Color = clBlue
            Marks.ArrowLength = 15
            Marks.BackColor = clYellow
            Marks.Clip = True
            Marks.Style = smsPercent
            Marks.Visible = True
            DataSource = CDS
            PercentFormat = '##0.### %'
            SeriesColor = clRed
            XLabelsSource = 'DESCRIPCION_LINEA'
            BarWidthPercent = 40
            MultiBar = mbNone
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1
            XValues.Order = loDescending
            XValues.ValueSource = 'PORCENTAJE'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loAscending
          end
        end
      end
    end
    object Tab03: TTabSheet
      Caption = 'Oficina Convenci'#243'n'
      ImageIndex = 2
      OnShow = Tab03Show
      object Panel6: TPanel
        Left = 0
        Top = 362
        Width = 839
        Height = 64
        Align = alBottom
        TabOrder = 0
        object Label5: TLabel
          Left = 527
          Top = 4
          Width = 80
          Height = 13
          Caption = 'Total de Cr'#233'ditos'
        end
        object Label6: TLabel
          Left = 527
          Top = 27
          Width = 87
          Height = 13
          Caption = 'Total de la Cartera'
        end
        object DBGrid3: TDBGrid
          Left = 4
          Top = 2
          Width = 509
          Height = 59
          DataSource = DS3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_LINEA'
              Title.Alignment = taCenter
              Title.Caption = 'ID'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_LINEA'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRIPCION'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEUDA'
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORCENTAJE'
              Visible = True
            end>
        end
        object EdCantidad03: TStaticText
          Left = 661
          Top = 2
          Width = 106
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvSpace
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 1
        end
        object EdDeuda03: TStaticText
          Left = 621
          Top = 24
          Width = 146
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvSpace
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 2
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 839
        Height = 362
        Align = alClient
        TabOrder = 1
        object DBChart3: TDBChart
          Left = 1
          Top = 1
          Width = 837
          Height = 360
          AnimatedZoom = True
          AnimatedZoomSteps = 4
          BackWall.Brush.Color = clWhite
          Gradient.Direction = gdLeftRight
          Gradient.EndColor = clWhite
          Gradient.Visible = True
          LeftWall.Brush.Color = clWhite
          LeftWall.Color = 65408
          LeftWall.Size = 4
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Title.Text.Strings = (
            'Cartera por L'#237'neas de Cr'#233'dito Vs Cartera Total a la Fecha')
          Chart3DPercent = 10
          Legend.Alignment = laLeft
          Legend.ColorWidth = 10
          Legend.Font.Charset = ANSI_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -11
          Legend.Font.Name = 'Kabel Bk BT'
          Legend.Font.Style = []
          Legend.Frame.Visible = False
          Legend.Inverted = True
          Legend.LegendStyle = lsValues
          Legend.TextStyle = ltsLeftPercent
          Legend.TopPos = 3
          Legend.Visible = False
          ScaleLastPage = False
          View3DOptions.Elevation = 315
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DOptions.ZoomText = False
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 2
          TabOrder = 0
          object HorizBarSeries2: THorizBarSeries
            ColorEachPoint = True
            Marks.Arrow.Color = clBlue
            Marks.ArrowLength = 15
            Marks.BackColor = clYellow
            Marks.Clip = True
            Marks.Style = smsPercent
            Marks.Visible = True
            DataSource = CDS
            PercentFormat = '##0.### %'
            SeriesColor = clRed
            XLabelsSource = 'DESCRIPCION_LINEA'
            BarWidthPercent = 40
            MultiBar = mbNone
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1
            XValues.Order = loDescending
            XValues.ValueSource = 'PORCENTAJE'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loAscending
          end
        end
      end
    end
    object Tab04: TTabSheet
      Caption = 'Oficina Aguachica'
      ImageIndex = 4
      OnShow = Tab04Show
      object Panel10: TPanel
        Left = 0
        Top = 362
        Width = 839
        Height = 64
        Align = alBottom
        TabOrder = 0
        object Label9: TLabel
          Left = 527
          Top = 4
          Width = 80
          Height = 13
          Caption = 'Total de Cr'#233'ditos'
        end
        object Label10: TLabel
          Left = 527
          Top = 27
          Width = 87
          Height = 13
          Caption = 'Total de la Cartera'
        end
        object DBGrid5: TDBGrid
          Left = 4
          Top = 2
          Width = 509
          Height = 59
          DataSource = DS3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_LINEA'
              Title.Alignment = taCenter
              Title.Caption = 'ID'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_LINEA'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRIPCION'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEUDA'
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORCENTAJE'
              Visible = True
            end>
        end
        object EdCantidad04: TStaticText
          Left = 661
          Top = 2
          Width = 106
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvSpace
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 1
        end
        object EdDeuda04: TStaticText
          Left = 621
          Top = 24
          Width = 146
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvSpace
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 2
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 839
        Height = 362
        Align = alClient
        TabOrder = 1
        object DBChart5: TDBChart
          Left = 1
          Top = 1
          Width = 837
          Height = 360
          AnimatedZoom = True
          AnimatedZoomSteps = 4
          BackWall.Brush.Color = clWhite
          Gradient.Direction = gdLeftRight
          Gradient.EndColor = clWhite
          Gradient.Visible = True
          LeftWall.Brush.Color = clWhite
          LeftWall.Color = 65408
          LeftWall.Size = 4
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Title.Text.Strings = (
            'Cartera por L'#237'neas de Cr'#233'dito Vs Cartera Total a la Fecha')
          Chart3DPercent = 10
          Legend.Alignment = laLeft
          Legend.ColorWidth = 10
          Legend.Font.Charset = ANSI_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -11
          Legend.Font.Name = 'Kabel Bk BT'
          Legend.Font.Style = []
          Legend.Frame.Visible = False
          Legend.Inverted = True
          Legend.LegendStyle = lsValues
          Legend.TextStyle = ltsLeftPercent
          Legend.TopPos = 3
          Legend.Visible = False
          ScaleLastPage = False
          View3DOptions.Elevation = 315
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DOptions.ZoomText = False
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 2
          TabOrder = 0
          object HorizBarSeries4: THorizBarSeries
            ColorEachPoint = True
            Marks.Arrow.Color = clBlue
            Marks.ArrowLength = 15
            Marks.BackColor = clYellow
            Marks.Clip = True
            Marks.Style = smsPercent
            Marks.Visible = True
            DataSource = CDS
            PercentFormat = '##0.### %'
            SeriesColor = clRed
            XLabelsSource = 'DESCRIPCION_LINEA'
            BarWidthPercent = 40
            MultiBar = mbNone
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1
            XValues.Order = loDescending
            XValues.ValueSource = 'PORCENTAJE'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loAscending
          end
        end
      end
    end
    object TabConsol: TTabSheet
      Caption = 'Consolidado'
      ImageIndex = 3
      object Panel8: TPanel
        Left = 0
        Top = 362
        Width = 839
        Height = 64
        Align = alBottom
        TabOrder = 0
        object Label7: TLabel
          Left = 527
          Top = 4
          Width = 80
          Height = 13
          Caption = 'Total de Cr'#233'ditos'
        end
        object Label8: TLabel
          Left = 527
          Top = 27
          Width = 87
          Height = 13
          Caption = 'Total de la Cartera'
        end
        object DBGrid4: TDBGrid
          Left = 4
          Top = 2
          Width = 509
          Height = 59
          DataSource = DSConsol
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ID'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'DESCRIPCION'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEUDA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORCENTAJE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Visible = True
            end>
        end
        object EdCantidadConsol: TStaticText
          Left = 661
          Top = 2
          Width = 106
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvSpace
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 1
        end
        object EdDeudaConsol: TStaticText
          Left = 621
          Top = 24
          Width = 146
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvSpace
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 2
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 839
        Height = 362
        Align = alClient
        TabOrder = 1
        object DBChart4: TDBChart
          Left = 1
          Top = 1
          Width = 837
          Height = 360
          AnimatedZoom = True
          AnimatedZoomSteps = 4
          BackWall.Brush.Color = clWhite
          Gradient.Direction = gdLeftRight
          Gradient.EndColor = clWhite
          Gradient.Visible = True
          LeftWall.Color = 65408
          LeftWall.Size = 4
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Title.Text.Strings = (
            'Cartera por L'#237'neas de Cr'#233'dito Vs Cartera Total a la Fecha')
          Chart3DPercent = 10
          Legend.Alignment = laLeft
          Legend.ColorWidth = 10
          Legend.Font.Charset = ANSI_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -11
          Legend.Font.Name = 'Kabel Bk BT'
          Legend.Font.Style = []
          Legend.Frame.Visible = False
          Legend.Inverted = True
          Legend.LegendStyle = lsValues
          Legend.TextStyle = ltsLeftPercent
          Legend.TopPos = 3
          Legend.Visible = False
          ScaleLastPage = False
          View3DOptions.Elevation = 315
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DOptions.ZoomText = False
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 2
          TabOrder = 0
          object HorizBarSeries3: THorizBarSeries
            ColorEachPoint = True
            Marks.Arrow.Color = clBlue
            Marks.ArrowLength = 15
            Marks.BackColor = clYellow
            Marks.Clip = True
            Marks.Style = smsPercent
            Marks.Visible = True
            DataSource = CDSConsol
            PercentFormat = '##0.### %'
            SeriesColor = clRed
            XLabelsSource = 'DESCRIPCION_LINEA'
            BarWidthPercent = 40
            MultiBar = mbNone
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1
            XValues.Order = loDescending
            XValues.ValueSource = 'PORCENTAJE'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loAscending
          end
        end
      end
    end
  end
  object IBQuery1: TIBQuery
    Database = Database
    Transaction = Transaction
    ForcedRefresh = True
    SQL.Strings = (
      'select * from P_LINEASVSCARTERA')
    Left = 120
    Top = 232
    object IBQuery1AGENCIA: TIntegerField
      FieldName = 'AGENCIA'
      Origin = '"P_LINEASVSCARTERA"."AGENCIA"'
    end
    object IBQuery1ID_LINEA: TSmallintField
      FieldName = 'ID_LINEA'
      ProviderFlags = []
    end
    object IBQuery1DESCRIPCION_LINEA: TIBStringField
      FieldName = 'DESCRIPCION_LINEA'
      ProviderFlags = []
      Size = 50
    end
    object IBQuery1CANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      ProviderFlags = []
      DisplayFormat = '#,0'
    end
    object IBQuery1DEUDA: TIBBCDField
      FieldName = 'DEUDA'
      ProviderFlags = []
      DisplayFormat = '$#,0'
      Precision = 18
      Size = 3
    end
    object IBQuery1PORCENTAJE: TFloatField
      FieldName = 'PORCENTAJE'
      Origin = '"P_LINEASVSCARTERA"."PORCENTAJE"'
      DisplayFormat = '#0.###%'
    end
  end
  object IBTransaction1: TIBTransaction
    AllowAutoStart = False
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    AutoStopAction = saRollback
    Left = 336
    Top = 208
  end
  object DS1: TDataSource
    DataSet = CDS
    Left = 512
    Top = 232
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 336
    Top = 144
  end
  object frChartObject1: TfrChartObject
    Left = 528
    Top = 296
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDS01
    Left = 720
    Top = 312
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = CDS02
    Left = 720
    Top = 280
  end
  object frShapeObject1: TfrShapeObject
    Left = 584
    Top = 288
  end
  object IdTCPClient1: TIdTCPClient
    Port = 0
    Left = 696
    Top = 56
  end
  object CDS: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANTIDAD'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'PORCENTAJE'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 432
    Top = 80
    Data = {
      9D0000009619E0BD0100000018000000060000000000030000009D0007414745
      4E4349410400010000000000045449504F04000100000000000B444553435249
      5043494F4E01004900000001000557494454480200020014000843414E544944
      414404000100000000000556414C4F5208000400000001000753554254595045
      0200490006004D6F6E6579000A504F5243454E54414A45080004000000000000
      00}
    object CDSAGENCIA: TIntegerField
      FieldName = 'AGENCIA'
    end
    object CDSTIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object CDSDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
    end
    object CDSCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object CDSVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object CDSPORCENTAJE: TFloatField
      FieldName = 'PORCENTAJE'
      DisplayFormat = '#0.###%'
    end
  end
  object IBsp1: TIBStoredProc
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'P_LINEASVSCARTERA'
    Left = 336
    Top = 104
  end
  object CDS02: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANTIDAD'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'PORCENTAJE'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 496
    Top = 80
    Data = {
      9D0000009619E0BD0100000018000000060000000000030000009D0007414745
      4E4349410400010000000000045449504F04000100000000000B444553435249
      5043494F4E01004900000001000557494454480200020014000843414E544944
      414404000100000000000556414C4F5208000400000001000753554254595045
      0200490006004D6F6E6579000A504F5243454E54414A45080004000000000000
      00}
    object IntegerField1: TIntegerField
      FieldName = 'AGENCIA'
    end
    object CDS02TIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object CDS02DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
    end
    object IntegerField3: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object CDS02VALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object FloatField1: TFloatField
      FieldName = 'PORCENTAJE'
      DisplayFormat = '#0.###%'
    end
  end
  object CDS03: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANTIDAD'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'PORCENTAJE'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 520
    Top = 80
    Data = {
      9D0000009619E0BD0100000018000000060000000000030000009D0007414745
      4E4349410400010000000000045449504F04000100000000000B444553435249
      5043494F4E01004900000001000557494454480200020014000843414E544944
      414404000100000000000556414C4F5208000400000001000753554254595045
      0200490006004D6F6E6579000A504F5243454E54414A45080004000000000000
      00}
    object IntegerField4: TIntegerField
      FieldName = 'AGENCIA'
    end
    object CDS03TIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object CDS03DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
    end
    object IntegerField6: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object CDS03VALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object FloatField2: TFloatField
      FieldName = 'PORCENTAJE'
      DisplayFormat = '#0.###%'
    end
  end
  object CDSConsol: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_LINEA'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION_LINEA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANTIDAD'
        DataType = ftInteger
      end
      item
        Name = 'DEUDA'
        DataType = ftCurrency
      end
      item
        Name = 'PORCENTAJE'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID_LINEA'
    Params = <>
    StoreDefs = True
    Left = 672
    Top = 176
    Data = {
      AD0000009619E0BD010000001800000005000000000003000000AD000849445F
      4C494E45410400010000000000114445534352495043494F4E5F4C494E454101
      004900000001000557494454480200020014000843414E544944414404000100
      0000000005444555444108000400000001000753554254595045020049000600
      4D6F6E6579000A504F5243454E54414A45080004000000000001000D44454641
      554C545F4F524445520200820000000000}
    object IntegerField8: TIntegerField
      FieldName = 'ID_LINEA'
    end
    object StringField3: TStringField
      FieldName = 'DESCRIPCION_LINEA'
    end
    object IntegerField9: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object CurrencyField3: TCurrencyField
      FieldName = 'DEUDA'
    end
    object FloatField3: TFloatField
      FieldName = 'PORCENTAJE'
      DisplayFormat = '#0.###%'
    end
  end
  object frmBar: TJvProgressForm
    Caption = 'Leyendo Informaci'#243'n, por favor espere un momento...'
    ProgressMin = 0
    ProgressMax = 4
    ProgressStep = 1
    ProgressPosition = 0
    Left = 256
    Top = 144
  end
  object DS2: TDataSource
    DataSet = CDS
    Left = 544
    Top = 232
  end
  object DS3: TDataSource
    DataSet = CDS
    Left = 576
    Top = 232
  end
  object DSConsol: TDataSource
    DataSet = CDSConsol
    Left = 608
    Top = 232
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = CDS03
    Left = 720
    Top = 248
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = CDS04
    Left = 720
    Top = 216
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 672
    Top = 152
  end
  object IBSQL1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 672
    Top = 120
  end
  object CDS01: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANTIDAD'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'PORCENTAJE'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 464
    Top = 80
    Data = {
      9D0000009619E0BD0100000018000000060000000000030000009D0007414745
      4E4349410400010000000000045449504F04000100000000000B444553435249
      5043494F4E01004900000001000557494454480200020014000843414E544944
      414404000100000000000556414C4F5208000400000001000753554254595045
      0200490006004D6F6E6579000A504F5243454E54414A45080004000000000000
      00}
    object IntegerField7: TIntegerField
      FieldName = 'AGENCIA'
    end
    object CDS01TIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object CDS01DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
    end
    object IntegerField11: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object CDS01VALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object FloatField4: TFloatField
      FieldName = 'PORCENTAJE'
      DisplayFormat = '#0.###%'
    end
  end
  object CDS04: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANTIDAD'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'PORCENTAJE'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 544
    Top = 80
    Data = {
      9D0000009619E0BD0100000018000000060000000000030000009D0007414745
      4E4349410400010000000000045449504F04000100000000000B444553435249
      5043494F4E01004900000001000557494454480200020014000843414E544944
      414404000100000000000556414C4F5208000400000001000753554254595045
      0200490006004D6F6E6579000A504F5243454E54414A45080004000000000000
      00}
    object IntegerField12: TIntegerField
      FieldName = 'AGENCIA'
    end
    object CDS04TIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object CDS04DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
    end
    object IntegerField14: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object CDS04VALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object FloatField5: TFloatField
      FieldName = 'PORCENTAJE'
      DisplayFormat = '#0.###%'
    end
  end
  object FrReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = FrReport1GetValue
    Left = 656
    Top = 312
    ReportForm = {19000000}
  end
  object frDBDataSet5: TfrDBDataSet
    DataSet = CDSConsol
    Left = 720
    Top = 184
  end
  object Transaction: TIBTransaction
    DefaultDatabase = Database
    Left = 600
    Top = 8
  end
  object Database: TIBDatabase
    LoginPrompt = False
    DefaultTransaction = Transaction
    AllowStreamedConnected = False
    Left = 568
    Top = 8
  end
end
