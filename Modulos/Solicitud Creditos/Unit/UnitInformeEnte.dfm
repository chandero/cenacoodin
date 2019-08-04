object FrmInformeEnte: TFrmInformeEnte
  Left = 178
  Top = 260
  Width = 419
  Height = 114
  BorderIcons = [biSystemMenu]
  Caption = 'Informe Diario Ente Aprobador'
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
    Width = 410
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 12
      Width = 74
      Height = 13
      Caption = 'Ente Aprobador'
    end
    object Label2: TLabel
      Left = 294
      Top = 13
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object DBente: TDBLookupComboBox
      Left = 84
      Top = 10
      Width = 209
      Height = 21
      KeyField = 'ID_ENTE_APROBADOR'
      ListField = 'DESCRIPCION_ENTE_APROBADOR'
      ListSource = DataSource1
      TabOrder = 0
    end
    object JVfecha: TJvStaticText
      Left = 329
      Top = 10
      Width = 76
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
    Top = 41
    Width = 410
    Height = 38
    Caption = 'Panel2'
    Color = clOlive
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 131
      Top = 7
      Width = 126
      Height = 25
      Caption = '&Ejecutar Informe'
      TabOrder = 0
      OnClick = BitBtn1Click
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
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select *  from "col$enteaprobador"')
    Left = 24
    Top = 65528
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Top = 8
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    ReportType = rtMultiple
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Top = 32
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = frmMain.CDinforme
    Left = 40
    Top = 32
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT DISTINCT '
      '  "col$solicitud".ID_SOLICITUD,'
      '  "col$solicitud".VALOR_APROBADO,'
      '  "col$solicitud".FECHA_RECEPCION,'
      '  "col$solicitud".ESTADO,'
      '  "col$estadosolicitud".DESCRIPCION_ESTADO,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '   "col$solicitud".NUMERO_ACTA'
      'FROM'
      '  "col$solicitud"'
      
        '  INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = ' +
        '"col$estadosolicitud".ID_ESTADO)'
      
        '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen' +
        '$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "' +
        'gen$persona".ID_IDENTIFICACION)'
      'WHERE'
      '  ("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD) '
      '')
    Left = 72
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 104
    Top = 40
  end
  object CDinforme: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 40
    Data = {
      900000009619E0BD010000001800000004000000000003000000900009736F6C
      6963697475640100490000000100055749445448020002000A00066E6F6D6272
      65020049000000010005574944544802000200FF000665737461646F01004900
      000001000557494454480200020032000576616C6F7208000400000001000753
      5542545950450200490006004D6F6E6579000000}
    object CDinformesolicitud: TStringField
      FieldName = 'solicitud'
      Size = 10
    end
    object CDinformenombre: TStringField
      FieldName = 'nombre'
      Size = 255
    end
    object CDinformeestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object CDinformevalor: TCurrencyField
      FieldName = 'valor'
    end
  end
  object CDestado: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'descripcion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'total'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 328
    Top = 40
    Data = {
      480000009619E0BD01000000180000000200000000000300000048000B646573
      6372697063696F6E010049000000010005574944544802000200140005746F74
      616C04000100000000000000}
    object CDestadodescripcion: TStringField
      FieldName = 'descripcion'
    end
    object CDestadototal: TIntegerField
      FieldName = 'total'
    end
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = CDestado
    Left = 48
    Top = 48
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = CDfirmas
    Left = 208
    Top = 24
  end
  object CDfirmas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 8
    Data = {
      340000009619E0BD010000001800000001000000000003000000340005666972
      6D6101004900000001000557494454480200020064000000}
    object CDfirmasfirma: TStringField
      FieldName = 'firma'
      Size = 100
    end
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = frmMain.CDparticipantes
    Left = 696
    Top = 120
  end
  object IBQuery3: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select'
      '"col$reportetmp".ID_SOLICITUD as solicitud,'
      
        '"gen$persona".NOMBRE || '#39' '#39' || "gen$persona".PRIMER_APELLIDO ||'#39 +
        ' '#39'|| "gen$persona".SEGUNDO_APELLIDO as nombre,'
      '"col$estadosolicitud".DESCRIPCION_ESTADO as estado,'
      '"col$reportetmp".VALOR_APROBADO as valor'
      'from "col$reportetmp"'
      
        'inner join "gen$persona" on ("col$reportetmp".ID_IDENTIFICACION ' +
        '= "gen$persona".ID_IDENTIFICACION and'
      '"col$reportetmp".ID_PERSONA = "gen$persona".ID_PERSONA)'
      
        'inner join "col$estadosolicitud" on ("col$reportetmp".ESTADO = "' +
        'col$estadosolicitud".ID_ESTADO)')
    Left = 160
    Top = 40
  end
end
