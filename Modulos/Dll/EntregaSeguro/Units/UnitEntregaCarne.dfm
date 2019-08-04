object FrmEntregaCarne: TFrmEntregaCarne
  Left = 0
  Top = 0
  Caption = 'Entrega de Carn'#233's Juveniles'
  ClientHeight = 443
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 616
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 712
    Height = 441
    ActivePage = TabCarne
    TabOrder = 1
    object TabCarne: TTabSheet
      Caption = 'Entrega de Carnes'
      OnShow = TabCarneShow
      object GroupBox1: TGroupBox
        Left = 0
        Top = 2
        Width = 601
        Height = 51
        Caption = 'Opciones de Busqueda'
        TabOrder = 0
        object Label1: TLabel
          Left = 7
          Top = 24
          Width = 95
          Height = 13
          Caption = 'Nombres del Juvenil'
        end
        object Label2: TLabel
          Left = 348
          Top = 24
          Width = 90
          Height = 13
          Caption = 'Numero de Cuenta'
        end
        object EdNombre: TEdit
          Left = 105
          Top = 21
          Width = 242
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = EdNombreChange
        end
        object EdCuenta: TEdit
          Left = 444
          Top = 21
          Width = 83
          Height = 21
          TabOrder = 1
          OnChange = EdCuentaChange
        end
        object BitBtn4: TBitBtn
          Left = 533
          Top = 19
          Width = 49
          Height = 25
          Caption = 'Todos'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = BitBtn4Click
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 51
        Width = 601
        Height = 362
        Caption = 'Carnes No Entregados'
        TabOrder = 1
        object DBCarne: TDBGrid
          Left = 3
          Top = 14
          Width = 595
          Height = 345
          DataSource = DsCarne
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBCarneCellClick
          OnDrawColumnCell = DBCarneDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'CUENTA'
              ReadOnly = True
              Title.Caption = 'No. Cuenta'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRES'
              ReadOnly = True
              Title.Caption = 'Nombres y Apellidos'
              Width = 147
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHASEGURO'
              ReadOnly = True
              Title.Caption = 'F. Seguro'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHAENTREGA'
              ReadOnly = True
              Title.Caption = 'F. Entrega'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTREGADO'
              ReadOnly = True
              Title.Caption = 'Ent.'
              Width = 23
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERSONA'
              Title.Caption = 'Persona'
              Width = 184
              Visible = True
            end>
        end
      end
      object Panel1: TPanel
        Left = 604
        Top = 8
        Width = 98
        Height = 401
        TabOrder = 2
        object BitBuscar: TBitBtn
          Left = 3
          Top = 2
          Width = 90
          Height = 25
          Caption = '&Buscar'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BitBuscarClick
        end
        object BitAplicar: TBitBtn
          Left = 3
          Top = 31
          Width = 90
          Height = 25
          Caption = '&Aplicar'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
          OnClick = BitAplicarClick
        end
        object BitCancelar: TBitBtn
          Left = 3
          Top = 61
          Width = 90
          Height = 25
          Caption = '&Cancelar'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = BitCancelarClick
        end
        object BitBtn3: TBitBtn
          Left = 3
          Top = 92
          Width = 90
          Height = 25
          Caption = '&Salir'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 3
          OnClick = BitBtn3Click
        end
      end
    end
    object TabReporte: TTabSheet
      Caption = 'Reportes Entrega Carnes'
      ImageIndex = 1
      OnShow = TabReporteShow
      object GroupBox3: TGroupBox
        Left = 0
        Top = 47
        Width = 701
        Height = 51
        Caption = 'Opciones de Busqueda'
        TabOrder = 0
        object Label3: TLabel
          Left = 7
          Top = 24
          Width = 95
          Height = 13
          Caption = 'Nombres del Juvenil'
        end
        object Label4: TLabel
          Left = 348
          Top = 24
          Width = 90
          Height = 13
          Caption = 'Numero de Cuenta'
        end
        object Edit1: TEdit
          Left = 105
          Top = 21
          Width = 242
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = Edit1Change
        end
        object Edit2: TEdit
          Left = 444
          Top = 21
          Width = 83
          Height = 21
          TabOrder = 1
          OnChange = Edit2Change
        end
        object BitBtn5: TBitBtn
          Left = 533
          Top = 19
          Width = 49
          Height = 25
          Caption = 'Todos'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = BitBtn4Click
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 96
        Width = 701
        Height = 314
        Caption = 'Carnes No Entregados'
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 3
          Top = 15
          Width = 684
          Height = 296
          DataSource = DsCarne
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CUENTA'
              Title.Caption = 'No. Cuenta'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRES'
              Title.Caption = 'Nombres y Apellidos'
              Width = 194
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHASEGURO'
              Title.Caption = 'F. Seguro'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHAENTREGA'
              Title.Caption = 'F. Entrega'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERSONA'
              Title.Caption = 'Persona'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPLEADO'
              Title.Caption = 'Empleado'
              Width = 97
              Visible = True
            end>
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 409
        Height = 50
        Caption = 'Filtrar por fechas de Entrega'
        TabOrder = 2
        object Label5: TLabel
          Left = 8
          Top = 23
          Width = 48
          Height = 13
          Caption = 'Fecha Ini.'
        end
        object Label6: TLabel
          Left = 181
          Top = 23
          Width = 50
          Height = 13
          Caption = 'Fecha Fin.'
        end
        object DtFecha1: TDateTimePicker
          Left = 60
          Top = 20
          Width = 116
          Height = 21
          Date = 39758.475597233800000000
          Time = 39758.475597233800000000
          TabOrder = 0
        end
        object DtFecha2: TDateTimePicker
          Left = 236
          Top = 20
          Width = 104
          Height = 21
          Date = 39758.475668298610000000
          Time = 39758.475668298610000000
          TabOrder = 1
        end
        object ChTodo: TCheckBox
          Left = 352
          Top = 22
          Width = 49
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Todos'
          TabOrder = 2
        end
      end
      object Panel2: TPanel
        Left = 410
        Top = 9
        Width = 291
        Height = 41
        TabOrder = 3
        object BitEjecutar: TBitBtn
          Left = 4
          Top = 9
          Width = 67
          Height = 25
          Caption = '&Ejecutar'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BitEjecutarClick
        end
        object BitCancelar1: TBitBtn
          Left = 151
          Top = 9
          Width = 67
          Height = 25
          Caption = '&Cancelar'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
          OnClick = BitCancelar1Click
        end
        object BitBtn8: TBitBtn
          Left = 220
          Top = 9
          Width = 67
          Height = 25
          Caption = '&Salir'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = BitBtn8Click
        end
        object BitBtn9: TBitBtn
          Left = 79
          Top = 9
          Width = 67
          Height = 25
          Caption = '&Reporte'
          DoubleBuffered = True
          Enabled = False
          ParentDoubleBuffered = False
          TabOrder = 3
          OnClick = BitBtn9Click
        end
      end
    end
  end
  object DsCarne: TDataSource
    DataSet = CdCarne
    Left = 664
    Top = 400
  end
  object CdCarne: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CUENTA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMBRES'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'FECHASEGURO'
        DataType = ftDate
      end
      item
        Name = 'FECHAENTREGA'
        DataType = ftDate
      end
      item
        Name = 'ENTREGADO'
        DataType = ftInteger
      end
      item
        Name = 'PERSONA'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EMPLEADO'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 368
    Top = 248
    Data = {
      C50000009619E0BD010000001800000007000000000003000000C50006435545
      4E54410100490000000100055749445448020002001400074E4F4D4252455302
      0049000000010005574944544802000200FF000B464543484153454755524F04
      000600000000000C4645434841454E5452454741040006000000000009454E54
      52454741444F040001000000000007504552534F4E4102004900000001000557
      4944544802000200FF0008454D504C4541444F01004900000001000557494454
      480200020014000000}
    object CdCarneCUENTA: TStringField
      FieldName = 'CUENTA'
      Size = 10
    end
    object CdCarneNOMBRES: TStringField
      FieldName = 'NOMBRES'
      Size = 255
    end
    object CdCarneFECHASEGURO: TDateField
      FieldName = 'FECHASEGURO'
    end
    object CdCarneFECHAENTREGA: TDateField
      FieldName = 'FECHAENTREGA'
    end
    object CdCarneENTREGADO: TIntegerField
      FieldName = 'ENTREGADO'
    end
    object CdCarnePERSONA: TStringField
      FieldName = 'PERSONA'
      Size = 255
    end
    object CdCarneEMPLEADO: TStringField
      FieldName = 'EMPLEADO'
    end
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 496
    Top = 240
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Opciones de Impresi'#243'n'
    TitleStatus = 'Estado de Impresi'#243'n'
    TitlePreview = 'Reporte de Carnes Entregados'
    SystemOptions = [soShowStatus, soAllowSaveFromPreview, soPreviewModal]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 192
    Top = 208
  end
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CdCarne
    Left = 216
    Top = 320
  end
end
