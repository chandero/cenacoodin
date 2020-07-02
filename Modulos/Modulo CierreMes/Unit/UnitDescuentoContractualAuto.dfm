object frmDescuentoContractualAuto: TfrmDescuentoContractualAuto
  Left = 426
  Top = 78
  Width = 574
  Height = 468
  Caption = 'Descuento Contractual Autom'#225'tico'
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 57
    Height = 13
    Caption = 'Contractual:'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 95
    Height = 13
    Caption = 'Estado del Proceso:'
  end
  object Label3: TLabel
    Left = 8
    Top = 65
    Width = 154
    Height = 13
    Caption = 'Cantidad de Cuentas a Prorrogar'
  end
  object edCaptacion: TEdit
    Left = 96
    Top = 5
    Width = 441
    Height = 21
    TabOrder = 0
  end
  object edEstado: TEdit
    Left = 112
    Top = 38
    Width = 425
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object edCantidad: TJvIntegerEdit
    Left = 192
    Top = 63
    Width = 89
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
  object progreso: TProgressBar
    Left = 8
    Top = 88
    Width = 529
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 3
  end
  object progreso2: TProgressBar
    Left = 8
    Top = 112
    Width = 529
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 4
  end
  object gridContractual: TDBGrid
    Left = 8
    Top = 136
    Width = 553
    Height = 289
    DataSource = dsContractual
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object CDSContractual: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'ID_TIPO_CAPTACION'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_CUENTA'
        DataType = ftInteger
      end
      item
        Name = 'DIGITO_CUENTA'
        DataType = ftInteger
      end
      item
        Name = 'ID_IDENTIFICACION'
        DataType = ftInteger
      end
      item
        Name = 'ID_PERSONA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'DESCUENTO'
        DataType = ftCurrency
      end
      item
        Name = 'ID_TIPO_CAPTACION_D'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_CUENTA_D'
        DataType = ftInteger
      end
      item
        Name = 'DIGITO_CUENTA_D'
        DataType = ftInteger
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FECHA_DESCUENTO'
        DataType = ftDate
      end
      item
        Name = 'CUOTA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DIAS'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ESTADO'
    Params = <>
    StoreDefs = True
    Left = 290
    Top = 64
    Data = {
      A90100009619E0BD01000000180000000F000000000003000000A9010A49445F
      4147454E43494104000100000000001149445F5449504F5F434150544143494F
      4E04000100000000000D4E554D45524F5F4355454E544104000100000000000D
      44494749544F5F4355454E544104000100000000001149445F4944454E544946
      49434143494F4E04000100000000000A49445F504552534F4E41010049000000
      0100055749445448020002001400064E4F4D4252450100490000000100055749
      445448020002009600094445534355454E544F08000400000001000753554254
      5950450200490006004D6F6E6579001349445F5449504F5F434150544143494F
      4E5F4404000100000000000F4E554D45524F5F4355454E54415F440400010000
      0000000F44494749544F5F4355454E54415F4404000100000000000645535441
      444F01004900000001000557494454480200020001000F46454348415F444553
      4355454E544F04000600000000000543554F5441010049000000010005574944
      54480200020002000444494153040001000000000001000D44454641554C545F
      4F524445520200820000000000}
    object CDSContractualID_AGENCIA: TIntegerField
      FieldName = 'ID_AGENCIA'
    end
    object CDSContractualID_TIPO_CAPTACION: TIntegerField
      FieldName = 'ID_TIPO_CAPTACION'
    end
    object CDSContractualNUMERO_CUENTA: TIntegerField
      FieldName = 'NUMERO_CUENTA'
    end
    object CDSContractualDIGITO_CUENTA: TIntegerField
      FieldName = 'DIGITO_CUENTA'
    end
    object CDSContractualID_IDENTIFICACION: TIntegerField
      FieldName = 'ID_IDENTIFICACION'
    end
    object CDSContractualID_PERSONA: TStringField
      FieldName = 'ID_PERSONA'
    end
    object CDSContractualNOMBRE: TStringField
      DisplayWidth = 150
      FieldName = 'NOMBRE'
      Size = 150
    end
    object CDSContractualDESCUENTO: TCurrencyField
      FieldName = 'DESCUENTO'
    end
    object CDSContractualID_TIPO_CAPTACION_D: TIntegerField
      FieldName = 'ID_TIPO_CAPTACION_D'
    end
    object CDSContractualNUMERO_CUENTA_D: TIntegerField
      FieldName = 'NUMERO_CUENTA_D'
    end
    object CDSContractualDIGITO_CUENTA_D: TIntegerField
      FieldName = 'DIGITO_CUENTA_D'
    end
    object CDSContractualESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 1
    end
    object CDSContractualFECHA_DESCUENTO: TDateField
      FieldName = 'FECHA_DESCUENTO'
    end
    object CDSContractualCUOTA: TStringField
      FieldName = 'CUOTA'
      Size = 2
    end
    object CDSContractualDIAS: TIntegerField
      FieldName = 'DIAS'
    end
  end
  object CdSaldo: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'CUENTA'
        DataType = ftInteger
      end
      item
        Name = 'DIGITO'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 320
    Top = 64
    Data = {
      5A0000009619E0BD0100000018000000030000000000030000005A0006435545
      4E544104000100000000000644494749544F04000100000000000556414C4F52
      080004000000010007535542545950450200490006004D6F6E6579000000}
    object CdSaldoCUENTA: TIntegerField
      FieldName = 'CUENTA'
    end
    object CdSaldoDIGITO: TIntegerField
      FieldName = 'DIGITO'
    end
    object CdSaldoVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object CdSaldoTOTAL: TAggregateField
      FieldName = 'TOTAL'
      Active = True
      Expression = 'sum(VALOR)'
    end
  end
  object IBPagar: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 408
    Top = 64
  end
  object IbComprobante: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'insert into CON$COMPROBANTE'
      
        '  (CON$COMPROBANTE."ID_COMPROBANTE", CON$COMPROBANTE."ID_AGENCIA' +
        '", '
      
        '   CON$COMPROBANTE."TIPO_COMPROBANTE", CON$COMPROBANTE."FECHADIA' +
        '", '
      
        '   CON$COMPROBANTE."DESCRIPCION", CON$COMPROBANTE."TOTAL_DEBITO"' +
        ', '
      'CON$COMPROBANTE."TOTAL_CREDITO", '
      '   CON$COMPROBANTE."ESTADO", CON$COMPROBANTE."IMPRESO", '
      'CON$COMPROBANTE."ANULACION", '
      '   CON$COMPROBANTE."ID_EMPLEADO")'
      'values'
      '  (:"ID_COMPROBANTE", :"ID_AGENCIA", :"TIPO_COMPROBANTE", '
      ':"FECHADIA", '
      
        '   :"DESCRIPCION", :"TOTAL_DEBITO", :"TOTAL_CREDITO", :"ESTADO",' +
        ' '
      ':"IMPRESO", '
      '   :"ANULACION", :"ID_EMPLEADO")')
    Left = 448
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_COMPROBANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_COMPROBANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHADIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPCION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TOTAL_DEBITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TOTAL_CREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IMPRESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANULACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_EMPLEADO'
        ParamType = ptUnknown
      end>
  end
  object IbAux: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'insert into CON$AUXILIAR'
      '  (CON$AUXILIAR."ID_COMPROBANTE", CON$AUXILIAR."ID_AGENCIA", '
      'CON$AUXILIAR."FECHA", '
      
        '   CON$AUXILIAR."CODIGO", CON$AUXILIAR."DEBITO", "CON$AUXILIAR".' +
        '"CREDITO", '
      '   CON$AUXILIAR."ID_CUENTA", CON$AUXILIAR."ID_COLOCACION", '
      'CON$AUXILIAR."ID_IDENTIFICACION", '
      '   CON$AUXILIAR."ID_PERSONA", CON$AUXILIAR."MONTO_RETENCION", '
      'CON$AUXILIAR."TASA_RETENCION", '
      '   CON$AUXILIAR."ESTADOAUX", CON$AUXILIAR."TIPO_COMPROBANTE")'
      'values'
      
        '  (:"ID_COMPROBANTE", :"ID_AGENCIA", :"FECHA", :"CODIGO", :"DEBI' +
        'TO", '
      ':"CREDITO", '
      
        '   :"ID_CUENTA", :"ID_COLOCACION", :"ID_IDENTIFICACION", :"ID_PE' +
        'RSONA", '
      
        '   :"MONTO_RETENCION", :"TASA_RETENCION", :"ESTADOAUX", :"TIPO_C' +
        'OMPROBANTE")')
    Left = 472
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_COMPROBANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COLOCACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MONTO_RETENCION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TASA_RETENCION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADOAUX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_COMPROBANTE'
        ParamType = ptUnknown
      end>
  end
  object dsContractual: TDataSource
    DataSet = CDSContractual
    Left = 64
    Top = 176
  end
end
