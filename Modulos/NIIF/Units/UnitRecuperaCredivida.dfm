object FrmRecuperaCredivida: TFrmRecuperaCredivida
  Left = 123
  Top = 242
  Width = 538
  Height = 253
  BorderIcons = [biSystemMenu]
  Caption = 'Recuperar Credivida'
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
    Width = 529
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 11
      Width = 126
      Height = 13
      Caption = 'Fecha de Renovaci'#243'n'
    end
    object DtFecha: TDateTimePicker
      Left = 135
      Top = 9
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 38968.6497891319
      Time = 38968.6497891319
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 242
      Top = 7
      Width = 86
      Height = 26
      Caption = '&Ejecutar'
      TabOrder = 1
      OnClick = BitBtn1Click
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 529
    Height = 176
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 526
      Height = 174
      Hint = 
        'Para Recuperar el Reporte del Credivida Haga doble clic sobre la' +
        ' celda'
      DataSource = DsCredivida
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'poliza'
          Title.Caption = 'Certificado'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'id_persona'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'id_identificacion'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'nombres'
          Title.Caption = 'Nombres y Apellidos'
          Width = 277
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'db'
          Title.Caption = 'Empleado'
          Visible = True
        end>
    end
  end
  object CdCredivida: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'poliza'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'nombres'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'db'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'expedicion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'nacimiento'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'fechan'
        DataType = ftDate
      end
      item
        Name = 'empresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'cargo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'direccion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'telefono'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'municipio'
        DataType = ftString
        Size = 70
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 136
    Data = {
      7D0100009619E0BD01000000180000000D0000000000030000007D0106706F6C
      697A6101004900000001000557494454480200020007000A69645F706572736F
      6E610100490000000100055749445448020002000F001169645F6964656E7469
      6669636163696F6E0200010000000000076E6F6D627265730200490000000100
      05574944544802000200FF000264620100490000000100055749445448020002
      000F000A65787065646963696F6E010049000000010005574944544802000200
      64000A6E6163696D69656E746F01004900000001000557494454480200020064
      000666656368616E040006000000000007656D70726573610100490000000100
      05574944544802000200640005636172676F0100490000000100055749445448
      02000200640009646972656363696F6E01004900000001000557494454480200
      020064000874656C65666F6E6F01004900000001000557494454480200020046
      00096D756E69636970696F010049000000010005574944544802000200460000
      00}
    object CdCredividapoliza: TStringField
      FieldName = 'poliza'
      Size = 7
    end
    object CdCredividaid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CdCredividaid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CdCredividanombres: TStringField
      FieldName = 'nombres'
      Size = 255
    end
    object CdCredividadb: TStringField
      FieldName = 'db'
      Size = 15
    end
    object CdCredividaexpedicion: TStringField
      FieldName = 'expedicion'
      Size = 100
    end
    object CdCredividanacimiento: TStringField
      FieldName = 'nacimiento'
      Size = 100
    end
    object CdCredividafechan: TDateField
      FieldName = 'fechan'
    end
    object CdCredividaempresa: TStringField
      FieldName = 'empresa'
      Size = 100
    end
    object CdCredividacargo: TStringField
      FieldName = 'cargo'
      Size = 100
    end
    object CdCredividadireccion: TStringField
      FieldName = 'direccion'
      Size = 100
    end
    object CdCredividatelefono: TStringField
      FieldName = 'telefono'
      Size = 70
    end
    object CdCredividamunicipio: TStringField
      FieldName = 'municipio'
      Size = 70
    end
  end
  object DsCredivida: TDataSource
    DataSet = CdCredivida
    Left = 208
    Top = 128
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 144
    Top = 136
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    OnPrintReport = frReport1PrintReport
    Left = 424
    Top = 112
    ReportForm = {19000000}
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 144
    Top = 112
  end
  object CDbeneficiarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 24
    Data = {
      6E0000009619E0BD0100000018000000030000000000030000006E00066E6F6D
      627265020049000000010005574944544802000200FF0009706F726369656E74
      6F080004000000010007535542545950450200490006004D6F6E6579000A7061
      72656E746573636F04000100000000000000}
    object CDbeneficiariosnombre: TStringField
      FieldName = 'nombre'
      Size = 255
    end
    object CDbeneficiariosporciento: TCurrencyField
      FieldName = 'porciento'
    end
    object CDbeneficiariosparentesco: TIntegerField
      FieldName = 'parentesco'
    end
  end
end
