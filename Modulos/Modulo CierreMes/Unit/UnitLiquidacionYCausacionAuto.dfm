object frmLiquidacionYCausacionAuto: TfrmLiquidacionYCausacionAuto
  Left = 477
  Top = 281
  Width = 550
  Height = 181
  Caption = 'Liquidaci'#243'n Autom'#225'tica de Intereses'
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
    Width = 55
    Height = 13
    Caption = 'Liquidando:'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 95
    Height = 13
    Caption = 'Estado del Proceso:'
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
  object progreso: TProgressBar
    Left = 8
    Top = 80
    Width = 529
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 2
  end
  object CmdCerrar: TBitBtn
    Left = 464
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 3
    OnClick = CmdCerrarClick
  end
  object IBTotalCaptaciones: TIBStoredProc
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    StoredProcName = 'P_CAP_0001'
    Left = 16
    Top = 104
    object IBTotalCaptacionesTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Origin = '"P_CAP_0001"."TOTAL"'
    end
  end
  object CDStemp: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
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
        Name = 'DIGITO_CUENTA '
        DataType = ftInteger
      end
      item
        Name = 'ID_IDENTIFICACION'
        DataType = ftInteger
      end
      item
        Name = 'ID_PERSONA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'SALDO_ACTUAL'
        DataType = ftCurrency
      end
      item
        Name = 'SALDO_LIQUIDACION'
        DataType = ftCurrency
      end
      item
        Name = 'INTERES'
        DataType = ftCurrency
      end
      item
        Name = 'RETENCION'
        DataType = ftCurrency
      end
      item
        Name = 'ID_TIPO_CAPTACION_ABONO'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_CUENTA_ABONO'
        DataType = ftInteger
      end
      item
        Name = 'TASA_LIQUIDACION'
        DataType = ftFloat
      end
      item
        Name = 'DIAS'
        DataType = ftInteger
      end
      item
        Name = 'CAUSADO'
        DataType = ftCurrency
      end
      item
        Name = 'RETEINTERES'
        DataType = ftCurrency
      end
      item
        Name = 'RETECAUSADO'
        DataType = ftCurrency
      end
      item
        Name = 'NETO'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 144
    Top = 8
    Data = {
      600200009619E0BD01000000180000001300000000000300000060020A49445F
      4147454E43494104000100000000001149445F5449504F5F434150544143494F
      4E04000100000000000D4E554D45524F5F4355454E544104000100000000000E
      44494749544F5F4355454E54412004000100000000001149445F4944454E5449
      4649434143494F4E04000100000000000A49445F504552534F4E410100490000
      000100055749445448020002003200064E4F4D42524501004900000001000557
      4944544802000200C8000C53414C444F5F41435455414C080004000000010007
      535542545950450200490006004D6F6E6579001153414C444F5F4C4951554944
      4143494F4E080004000000010007535542545950450200490006004D6F6E6579
      0007494E5445524553080004000000010007535542545950450200490006004D
      6F6E65790009524554454E43494F4E0800040000000100075355425459504502
      00490006004D6F6E6579001749445F5449504F5F434150544143494F4E5F4142
      4F4E4F0400010000000000134E554D45524F5F4355454E54415F41424F4E4F04
      0001000000000010544153415F4C49515549444143494F4E0800040000000000
      04444941530400010000000000074341555341444F0800040000000100075355
      42545950450200490006004D6F6E6579000B52455445494E5445524553080004
      000000010007535542545950450200490006004D6F6E6579000B524554454341
      555341444F080004000000010007535542545950450200490006004D6F6E6579
      00044E45544F080004000000010007535542545950450200490006004D6F6E65
      79000000}
    object CDStempID_AGENCIA: TIntegerField
      FieldName = 'ID_AGENCIA'
    end
    object CDStempID_TIPO_CAPTACION: TIntegerField
      FieldName = 'ID_TIPO_CAPTACION'
    end
    object CDStempNUMERO_CUENTA: TIntegerField
      FieldName = 'NUMERO_CUENTA'
    end
    object CDStempDIGITO_CUENTA: TIntegerField
      FieldName = 'DIGITO_CUENTA '
    end
    object CDStempID_IDENTIFICACION: TIntegerField
      FieldName = 'ID_IDENTIFICACION'
    end
    object CDStempID_PERSONA: TStringField
      FieldName = 'ID_PERSONA'
      Size = 50
    end
    object CDStempNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 200
    end
    object CDStempSALDO_ACTUAL: TCurrencyField
      FieldName = 'SALDO_ACTUAL'
    end
    object CDStempSALDO_LIQUIDACION: TCurrencyField
      FieldName = 'SALDO_LIQUIDACION'
    end
    object CDStempINTERES: TCurrencyField
      FieldName = 'INTERES'
    end
    object CDStempRETENCION: TCurrencyField
      FieldName = 'RETENCION'
    end
    object CDStempID_TIPO_CAPTACION_ABONO: TIntegerField
      FieldName = 'ID_TIPO_CAPTACION_ABONO'
    end
    object CDStempNUMERO_CUENTA_ABONO: TIntegerField
      FieldName = 'NUMERO_CUENTA_ABONO'
    end
    object CDStempTASA_LIQUIDACION: TFloatField
      FieldName = 'TASA_LIQUIDACION'
    end
    object CDStempDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object CDStempCAUSADO: TCurrencyField
      FieldName = 'CAUSADO'
    end
    object CDStempRETEINTERES: TCurrencyField
      FieldName = 'RETEINTERES'
    end
    object CDStempRETECAUSADO: TCurrencyField
      FieldName = 'RETECAUSADO'
    end
    object CDStempNETO: TCurrencyField
      FieldName = 'NETO'
    end
    object CDStempTOTALINTERES: TAggregateField
      FieldName = 'TOTALINTERES'
      Active = True
      Expression = 'SUM(INTERES)'
    end
    object CDStempTOTALRETENCION: TAggregateField
      FieldName = 'TOTALRETENCION'
      Active = True
      Expression = 'SUM(RETENCION)'
    end
    object CDStempTOTALCAUSADO: TAggregateField
      FieldName = 'TOTALCAUSADO'
      Active = True
      Expression = 'SUM(CAUSADO)'
    end
    object CDStempTOTALRETEINTERES: TAggregateField
      FieldName = 'TOTALRETEINTERES'
      Active = True
      Expression = 'SUM(RETEINTERES)'
    end
    object CDStempTOTALRETECAUSADO: TAggregateField
      FieldName = 'TOTALRETECAUSADO'
      Active = True
      Expression = 'SUM(RETECAUSADO)'
    end
  end
end
