object frmInteresPagadoDeposito: TfrmInteresPagadoDeposito
  Left = 263
  Top = 172
  Width = 991
  Height = 434
  Caption = 'Inter'#233's Pagado Depositos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 369
    Width = 983
    Height = 31
    Align = alBottom
    Color = clOlive
    TabOrder = 0
    object btnProcesar: TBitBtn
      Left = 3
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Procesar'
      TabOrder = 0
      OnClick = btnProcesarClick
    end
    object btnCerrar: TBitBtn
      Left = 881
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = btnCerrarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 983
    Height = 369
    Align = alClient
    DataSource = DS1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'P_APELLIDO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_APELLIDO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'P_NOMBRE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'S_NOMBRE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RAZON'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DPTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MCP'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PAIS'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOABONOCUENTADEDUCIBLE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOABONOCUENTANODEDUCIBLE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IVAMAYORVALORDEDUCIBLE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IVAMAYORVALORNODEDUCIBLE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETENCION'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETENCIONASUMIDA'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETENCIONIVA'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETENCIONIVAASUMIDA'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETENCIONIVANODIMICILIADO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETENCIONCREE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETENCIONASUMIDACREE'
        Width = 80
        Visible = True
      end>
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 56
    Top = 112
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 56
    Top = 152
  end
  object save: TSaveDialog
    FileName = 'Retenciones'
    Filter = 'Archivos Excel|*.xls'
    Left = 216
    Top = 168
  end
  object DS1: TDataSource
    DataSet = CD
    Left = 240
    Top = 216
  end
  object CD: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CONCEPTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TP'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NM'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DV'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'P_APELLIDO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'S_APELLIDO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'P_NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'S_NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'RAZON'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DIRECCION'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DPTO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'MCP'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PAGOABONOCUENTADEDUCIBLE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PAGOABONOCUENTANODEDUCIBLE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IVAMAYORVALORDEDUCIBLE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IVAMAYORVALORNODEDUCIBLE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RETENCION'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RETENCIONASUMIDA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RETENCIONIVA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RETENCIONIVAASUMIDA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RETENCIONIVANODOMICILIADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RETENCIONCREE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RETENCIONASUMIDACREE'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 376
    Top = 240
    Data = {
      2F0300009619E0BD0100000018000000180000000000030000002F0308434F4E
      434550544F010049000000010005574944544802000200140002545001004900
      00000100055749445448020002000200024E4D01004900000001000557494454
      48020002000F0002445601004900000001000557494454480200020002000A50
      5F4150454C4C49444F01004900000001000557494454480200020064000A535F
      4150454C4C49444F010049000000010005574944544802000200640008505F4E
      4F4D425245010049000000010005574944544802000200640008535F4E4F4D42
      524501004900000001000557494454480200020064000552415A4F4E02004900
      0000010005574944544802000200FF0009444952454343494F4E020049000000
      010005574944544802000200FF00044450544F01004900000001000557494454
      48020002000300034D4350010049000000010005574944544802000200030004
      504149530100490000000100055749445448020002001400185041474F41424F
      4E4F4355454E5441444544554349424C45010049000000010005574944544802
      00020014001A5041474F41424F4E4F4355454E54414E4F444544554349424C45
      0100490000000100055749445448020002001400164956414D41594F5256414C
      4F52444544554349424C45010049000000010005574944544802000200140018
      4956414D41594F5256414C4F524E4F444544554349424C450100490000000100
      05574944544802000200140009524554454E43494F4E01004900000001000557
      4944544802000200320010524554454E43494F4E4153554D4944410100490000
      0001000557494454480200020014000C524554454E43494F4E49564101004900
      0000010005574944544802000200140013524554454E43494F4E495641415355
      4D494441010049000000010005574944544802000200140019524554454E4349
      4F4E4956414E4F444F4D4943494C4941444F0100490000000100055749445448
      0200020014000D524554454E43494F4E43524545010049000000010005574944
      544802000200140014524554454E43494F4E4153554D49444143524545010049
      00000001000557494454480200020014000000}
    object CDCONCEPTO: TStringField
      FieldName = 'CONCEPTO'
    end
    object CDTP: TStringField
      DisplayWidth = 5
      FieldName = 'TP'
      Size = 2
    end
    object CDNM: TStringField
      DisplayWidth = 5
      FieldName = 'NM'
      Size = 15
    end
    object CDDV: TStringField
      DisplayWidth = 3
      FieldName = 'DV'
      Size = 2
    end
    object CDP_APELLIDO: TStringField
      DisplayWidth = 120
      FieldName = 'P_APELLIDO'
      Size = 100
    end
    object CDS_APELLIDO: TStringField
      DisplayWidth = 120
      FieldName = 'S_APELLIDO'
      Size = 100
    end
    object CDP_NOMBRE: TStringField
      DisplayWidth = 120
      FieldName = 'P_NOMBRE'
      Size = 100
    end
    object CDS_NOMBRE: TStringField
      DisplayWidth = 120
      FieldName = 'S_NOMBRE'
      Size = 100
    end
    object CDRAZON: TStringField
      DisplayWidth = 306
      FieldName = 'RAZON'
      Size = 255
    end
    object CDDIRECCION: TStringField
      DisplayWidth = 306
      FieldName = 'DIRECCION'
      Size = 255
    end
    object CDDPTO: TStringField
      DisplayWidth = 6
      FieldName = 'DPTO'
      Size = 3
    end
    object CDMCP: TStringField
      DisplayWidth = 5
      FieldName = 'MCP'
      Size = 3
    end
    object CDPAIS: TStringField
      FieldName = 'PAIS'
    end
    object CDPAGOABONOCUENTADEDUCIBLE: TStringField
      FieldName = 'PAGOABONOCUENTADEDUCIBLE'
    end
    object CDPAGOABONOCUENTANODEDUCIBLE: TStringField
      FieldName = 'PAGOABONOCUENTANODEDUCIBLE'
    end
    object CDIVAMAYORVALORDEDUCIBLE: TStringField
      FieldName = 'IVAMAYORVALORDEDUCIBLE'
    end
    object CDIVAMAYORVALORNODEDUCIBLE: TStringField
      FieldName = 'IVAMAYORVALORNODEDUCIBLE'
    end
    object CDRETENCION: TStringField
      DisplayWidth = 60
      FieldName = 'RETENCION'
      Size = 50
    end
    object CDRETENCIONASUMIDA: TStringField
      FieldName = 'RETENCIONASUMIDA'
    end
    object CDRETENCIONIVA: TStringField
      FieldName = 'RETENCIONIVA'
    end
    object CDRETENCIONIVAASUMIDA: TStringField
      FieldName = 'RETENCIONIVAASUMIDA'
    end
    object CDRETENCIONIVANODOMICILIADO: TStringField
      FieldName = 'RETENCIONIVANODOMICILIADO'
    end
    object CDRETENCIONCREE: TStringField
      FieldName = 'RETENCIONCREE'
    end
    object CDRETENCIONASUMIDACREE: TStringField
      FieldName = 'RETENCIONASUMIDACREE'
    end
  end
end