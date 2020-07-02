object FrmInformeEnte: TFrmInformeEnte
  Left = 443
  Top = 265
  Width = 635
  Height = 144
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
    Width = 585
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
      Left = 446
      Top = 13
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label3: TLabel
      Left = 300
      Top = 13
      Width = 22
      Height = 13
      Caption = 'Acta'
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
    object JvFecha: TDateTimePicker
      Left = 480
      Top = 10
      Width = 98
      Height = 21
      CalAlignment = dtaLeft
      Date = 44005.3949740741
      Time = 44005.3949740741
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object edActa: TEdit
      Left = 327
      Top = 11
      Width = 112
      Height = 21
      TabOrder = 2
      OnExit = edActaExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 585
    Height = 38
    Color = clOlive
    TabOrder = 1
    object btnInforme: TBitBtn
      Left = 451
      Top = 7
      Width = 126
      Height = 25
      Caption = '&Generar Informe'
      Enabled = False
      TabOrder = 0
      OnClick = btnInformeClick
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
    Left = 32
    Top = 8
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
    Left = 8
    Top = 40
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDinforme
    Left = 40
    Top = 72
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'SELECT cr.ID_AGENCIA, cr.ID_SOLICITUD, gp.NOMBRE || '#39' '#39' || gp.PR' +
        'IMER_APELLIDO || '#39' '#39' || gp.SEGUNDO_APELLIDO AS NOMBRE, cr.ESTADO' +
        ', cr.FECHA, '
      
        'cr.ID_ENTE_APROBADOR, cs.VALOR_SOLICITADO, cs.VALOR_APROBADO, cs' +
        '.GARANTIA, ce.DESCRIPCION_ESTADO FROM "col$registrosesion" cr'
      
        'INNER JOIN "col$solicitud" cs ON cs.ID_SOLICITUD = cr.ID_SOLICIT' +
        'UD'
      'INNER JOIN "col$estadosolicitud" ce ON ce.ID_ESTADO = cr.ESTADO'
      
        'INNER JOIN "gen$persona" gp ON gp.ID_IDENTIFICACION = cs.ID_IDEN' +
        'TIFICACION AND gp.ID_PERSONA = cs.ID_PERSONA'
      'WHERE cr.ACTA = :ACTA')
    Left = 72
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ACTA'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 104
    Top = 40
  end
  object CDinforme: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_oficina'
        DataType = ftInteger
      end
      item
        Name = 'solicitud'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'solicitado'
        DataType = ftCurrency
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'garantia'
        DataType = ftInteger
      end
      item
        Name = 'radicado'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'des_estado'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 40
    Data = {
      170100009619E0BD01000000180000000900000000000300000017010A69645F
      6F666963696E61040001000000000009736F6C69636974756401004900000001
      00055749445448020002000A00066E6F6D627265020049000000010005574944
      544802000200FF000665737461646F0100490000000100055749445448020002
      0032000A736F6C6963697461646F080004000000010007535542545950450200
      490006004D6F6E6579000576616C6F7208000400000001000753554254595045
      0200490006004D6F6E65790008676172616E7469610400010000000000087261
      64696361646F01004900000001000557494454480200020014000A6465735F65
      737461646F010049000000010005574944544802000200C8000000}
    object CDinformeid_oficina: TIntegerField
      FieldName = 'id_oficina'
    end
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
    object CDinformesolicitado: TCurrencyField
      FieldName = 'solicitado'
    end
    object CDinformevalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDinformegarantia: TIntegerField
      FieldName = 'garantia'
    end
    object CDinformeradicado: TStringField
      FieldName = 'radicado'
    end
    object CDinformedes_estado: TStringField
      FieldName = 'des_estado'
      Size = 200
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
    Left = 72
    Top = 72
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = CDparticipantes
    Left = 104
    Top = 72
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
      'SELECT * FROM "ent$acta" a WHERE a.NUMERO_ACTA = :ACTA')
    Left = 136
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ACTA'
        ParamType = ptUnknown
      end>
  end
  object CDinvitados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 48
    Data = {
      4F0000009619E0BD0100000018000000020000000000030000004F00066E6F6D
      627265020049000000010005574944544802000200FF0005636172676F010049
      00000001000557494454480200020032000000}
    object CDinvitadosnombre: TStringField
      FieldName = 'nombre'
      Size = 255
    end
    object CDinvitadoscargo: TStringField
      FieldName = 'cargo'
      Size = 50
    end
  end
  object CDparticipantes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 48
    Data = {
      4F0000009619E0BD0100000018000000020000000000030000004F00066E6F6D
      627265010049000000010005574944544802000200640005636172676F010049
      00000001000557494454480200020064000000}
    object CDparticipantesnombre: TStringField
      FieldName = 'nombre'
      Size = 100
    end
    object CDparticipantescargo: TStringField
      FieldName = 'cargo'
      Size = 100
    end
  end
end
