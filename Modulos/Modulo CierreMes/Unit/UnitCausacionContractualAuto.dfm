object frmCausacionContractualAuto: TfrmCausacionContractualAuto
  Left = 574
  Top = 226
  Width = 508
  Height = 196
  Caption = 'Causaci'#243'n Contractual Autom'#225'tica'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edCaptacion: TEdit
    Left = 16
    Top = 7
    Width = 457
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object progreso: TProgressBar
    Left = 16
    Top = 32
    Width = 457
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 1
  end
  object edEstado: TEdit
    Left = 16
    Top = 56
    Width = 209
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object CdComprobante: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 56
    Data = {
      1A0100009619E0BD0100000018000000090000000000030000001A010E69645F
      636F6D70726F62616E74650200010000000000076167656E6369610100490000
      000100055749445448020002001E00107469706F5F636F6D70726F62616E7465
      0100490000000100055749445448020002001E00056665636861040006000000
      000008656D706C6561646F010049000000010005574944544802000200960006
      636F6469676F0100490000000100055749445448020002001200066E6F6D6272
      6501004900000001000557494454480200020032000664656269746F08000400
      0000010007535542545950450200490006004D6F6E657900076372656469746F
      080004000000010007535542545950450200490006004D6F6E6579000000}
    object CdComprobanteid_comprobante: TSmallintField
      FieldName = 'id_comprobante'
    end
    object CdComprobanteagencia: TStringField
      FieldName = 'agencia'
      Size = 30
    end
    object CdComprobantetipo_comprobante: TStringField
      FieldName = 'tipo_comprobante'
      Size = 30
    end
    object CdComprobantefecha: TDateField
      FieldName = 'fecha'
    end
    object CdComprobanteempleado: TStringField
      FieldName = 'empleado'
      Size = 150
    end
    object CdComprobantecodigo: TStringField
      FieldName = 'codigo'
      Size = 18
    end
    object CdComprobantenombre: TStringField
      FieldName = 'nombre'
      Size = 50
    end
    object CdComprobantedebito: TCurrencyField
      FieldName = 'debito'
    end
    object CdComprobantecredito: TCurrencyField
      FieldName = 'credito'
    end
  end
  object CdContractual: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_agencia'
        DataType = ftSmallint
      end
      item
        Name = 'id_tipo_captacion'
        DataType = ftSmallint
      end
      item
        Name = 'numero_cuenta'
        DataType = ftInteger
      end
      item
        Name = 'digito_cuenta'
        DataType = ftSmallint
      end
      item
        Name = 'id_plan'
        DataType = ftSmallint
      end
      item
        Name = 'cuota'
        DataType = ftCurrency
      end
      item
        Name = 'plazo'
        DataType = ftSmallint
      end
      item
        Name = 'valor_inicial'
        DataType = ftCurrency
      end
      item
        Name = 'fecha_apertura'
        DataType = ftDate
      end
      item
        Name = 'fecha_vencimiento'
        DataType = ftDate
      end
      item
        Name = 'id_tipo_captacion_abono'
        DataType = ftSmallint
      end
      item
        Name = 'numero_cuenta_abono'
        DataType = ftInteger
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'primer_apellido'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'segundo_apellido'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'retefuente'
        DataType = ftSmallint
      end
      item
        Name = 'ano'
        DataType = ftSmallint
      end
      item
        Name = 'mes'
        DataType = ftSmallint
      end
      item
        Name = 'dias'
        DataType = ftSmallint
      end
      item
        Name = 'causacion_mensual'
        DataType = ftCurrency
      end
      item
        Name = 'causacion_acumulada'
        DataType = ftCurrency
      end
      item
        Name = 'retefuente_mensual'
        DataType = ftCurrency
      end
      item
        Name = 'retefuente_acumulada'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 256
    Top = 56
    Data = {
      DD0200009619E0BD010000001800000019000000000003000000DD020A69645F
      6167656E63696102000100000000001169645F7469706F5F636170746163696F
      6E02000100000000000D6E756D65726F5F6375656E746104000100000000000D
      64696769746F5F6375656E746102000100000000000769645F706C616E020001
      00000000000563756F7461080004000000010007535542545950450200490006
      004D6F6E65790005706C617A6F02000100000000000D76616C6F725F696E6963
      69616C080004000000010007535542545950450200490006004D6F6E6579000E
      66656368615F617065727475726104000600000000001166656368615F76656E
      63696D69656E746F04000600000000001769645F7469706F5F63617074616369
      6F6E5F61626F6E6F0200010000000000136E756D65726F5F6375656E74615F61
      626F6E6F04000100000000001169645F6964656E74696669636163696F6E0200
      0100000000000A69645F706572736F6E61010049000000010005574944544802
      0002000F000F7072696D65725F6170656C6C69646F0100490000000100055749
      445448020002001E0010736567756E646F5F6170656C6C69646F010049000000
      0100055749445448020002001E00066E6F6D6272650100490000000100055749
      445448020002005A000A726574656675656E7465020001000000000003616E6F
      0200010000000000036D65730200010000000000046469617302000100000000
      0011636175736163696F6E5F6D656E7375616C08000400000001000753554254
      5950450200490006004D6F6E65790013636175736163696F6E5F6163756D756C
      616461080004000000010007535542545950450200490006004D6F6E65790012
      726574656675656E74655F6D656E7375616C0800040000000100075355425459
      50450200490006004D6F6E65790014726574656675656E74655F6163756D756C
      616461080004000000010007535542545950450200490006004D6F6E65790000
      00}
    object CdContractualid_agencia: TSmallintField
      FieldName = 'id_agencia'
    end
    object CdContractualid_tipo_captacion: TSmallintField
      FieldName = 'id_tipo_captacion'
    end
    object CdContractualnumero_cuenta: TIntegerField
      FieldName = 'numero_cuenta'
    end
    object CdContractualdigito_cuenta: TSmallintField
      FieldName = 'digito_cuenta'
    end
    object CdContractualid_plan: TSmallintField
      FieldName = 'id_plan'
    end
    object CdContractualcuota: TCurrencyField
      FieldName = 'cuota'
    end
    object CdContractualplazo: TSmallintField
      FieldName = 'plazo'
    end
    object CdContractualvalor_inicial: TCurrencyField
      FieldName = 'valor_inicial'
    end
    object CdContractualfecha_apertura: TDateField
      FieldName = 'fecha_apertura'
    end
    object CdContractualfecha_vencimiento: TDateField
      FieldName = 'fecha_vencimiento'
    end
    object CdContractualid_tipo_captacion_abono: TSmallintField
      FieldName = 'id_tipo_captacion_abono'
    end
    object CdContractualnumero_cuenta_abono: TIntegerField
      FieldName = 'numero_cuenta_abono'
    end
    object CdContractualid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CdContractualid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CdContractualprimer_apellido: TStringField
      FieldName = 'primer_apellido'
      Size = 30
    end
    object CdContractualsegundo_apellido: TStringField
      FieldName = 'segundo_apellido'
      Size = 30
    end
    object CdContractualnombre: TStringField
      FieldName = 'nombre'
      Size = 90
    end
    object CdContractualretefuente: TSmallintField
      FieldName = 'retefuente'
    end
    object CdContractualano: TSmallintField
      FieldName = 'ano'
    end
    object CdContractualmes: TSmallintField
      FieldName = 'mes'
    end
    object CdContractualdias: TSmallintField
      FieldName = 'dias'
    end
    object z: TCurrencyField
      FieldName = 'causacion_mensual'
    end
    object CdContractualcausacion_acumulada: TCurrencyField
      FieldName = 'causacion_acumulada'
    end
    object CdContractualretefuente_mensual: TCurrencyField
      FieldName = 'retefuente_mensual'
    end
    object CdContractualretefuente_acumulada: TCurrencyField
      FieldName = 'retefuente_acumulada'
    end
    object CdContractualsum_causacion_mensual: TAggregateField
      FieldName = 'sum_causacion_mensual'
      Active = True
      Expression = 'sum(causacion_mensual)'
    end
    object CdContractualsum_causacion_acumulada: TAggregateField
      FieldName = 'sum_causacion_acumulada'
      Active = True
      Expression = 'sum(causacion_acumulada)'
    end
    object CdContractualsum_retefuente_mensual: TAggregateField
      FieldName = 'sum_retefuente_mensual'
      Active = True
      Expression = 'sum(retefuente_mensual)'
    end
    object CdContractualsum_retefuente_acumulada: TAggregateField
      FieldName = 'sum_retefuente_acumulada'
      Active = True
      Expression = 'sum(retefuente_acumulada)'
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 424
    Top = 56
  end
  object IBSComprobante: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 328
    Top = 56
  end
  object CdCodigos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 287
    Top = 56
    Data = {
      670000009619E0BD01000000180000000300000000000300000067000969645F
      636F6469676F020001000000000006636F6469676F0100490000000100055749
      4454480200020012000B6465736372697063696F6E0100490000000100055749
      4454480200020064000000}
    object CdCodigosid_codigo: TSmallintField
      FieldName = 'id_codigo'
    end
    object CdCodigoscodigo: TStringField
      FieldName = 'codigo'
      Size = 18
    end
    object CdCodigosdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object IBcontractual: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 360
    Top = 56
  end
  object IBAuxiliar: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 392
    Top = 56
  end
end
