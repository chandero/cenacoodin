object FrmConInteresPago: TFrmConInteresPago
  Left = 447
  Top = 140
  Width = 364
  Height = 142
  Caption = 'Consolidado Intereses Pagos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 119
    Height = 13
    Caption = 'Monto M'#237'nimo a Evaluar:'
  end
  object Button1: TButton
    Left = 256
    Top = 10
    Width = 75
    Height = 25
    Caption = '&Procesar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object txtMonto: TJvCurrencyEdit
    Left = 128
    Top = 13
    Width = 121
    Height = 21
    Alignment = taRightJustify
    ReadOnly = False
    TabOrder = 1
    Value = 1
    HasMaxValue = False
    HasMinValue = False
  end
  object Int: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 64
    Data = {
      790100009619E0BD01000000180000000D000000000003000000790108434F4E
      434550544F010049000000010005574944544802000200040005545F444F4301
      00490000000100055749445448020002000200064E554D45524F010049000000
      0100055749445448020002000F00024456010049000000010005574944544802
      00020002000A505F4150454C4C49444F01004900000001000557494454480200
      020064000A535F4150454C4C49444F0100490000000100055749445448020002
      006400064E4F4D425245020049000000010005574944544802000200FF000853
      5F4E4F4D425245020049000000010005574944544802000200FF0002525A0200
      49000000010005574944544802000200FF0009444952454343494F4E02004900
      0000010005574944544802000200FF00044450544F0100490000000100055749
      445448020002000300044D4E4350010049000000010005574944544802000200
      0300045041474F01004900000001000557494454480200020032000000}
    object IntCONCEPTO: TStringField
      FieldName = 'CONCEPTO'
      Size = 4
    end
    object IntT_DOC: TStringField
      FieldName = 'T_DOC'
      Size = 2
    end
    object IntNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object IntDV: TStringField
      FieldName = 'DV'
      Size = 2
    end
    object IntP_APELLIDO: TStringField
      FieldName = 'P_APELLIDO'
      Size = 100
    end
    object IntS_APELLIDO: TStringField
      FieldName = 'S_APELLIDO'
      Size = 100
    end
    object IntNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 255
    end
    object IntS_NOMBRE: TStringField
      FieldName = 'S_NOMBRE'
      Size = 255
    end
    object IntRZ: TStringField
      FieldName = 'RZ'
      Size = 255
    end
    object IntDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Size = 255
    end
    object IntDPTO: TStringField
      FieldName = 'DPTO'
      Size = 3
    end
    object IntMNCP: TStringField
      FieldName = 'MNCP'
      Size = 3
    end
    object IntPAGO: TStringField
      FieldName = 'PAGO'
      Size = 50
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "dian$interesespagos".ID_IDENTIFICACION,'
      '  "dian$interesespagos".ID_PERSONA,'
      '  sum("dian$interesespagos".VALOR) AS VALOR'
      'FROM'
      '  "dian$interesespagos"'
      'GROUP BY'
      '  "dian$interesespagos".ID_IDENTIFICACION,'
      '  "dian$interesespagos".ID_PERSONA'
      'HAVING'
      '  sum("dian$interesespagos".VALOR) >= :MONTO'
      '')
    Left = 40
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MONTO'
        ParamType = ptUnknown
      end>
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 168
    Top = 40
  end
  object save: TSaveDialog
    Left = 88
    Top = 48
  end
  object IBQuery3: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT'
      '  SUM("cap$causacioncdat".CAUSACION_MENSUAL) AS VALOR'
      'FROM'
      '  "cap$causacioncdat"'
      'WHERE'
      '  "cap$causacioncdat".ID_IDENTIFICACION = :ID_IDENTIFICACION AND'
      '  "cap$causacioncdat".ID_PERSONA = :ID_PERSONA AND'
      '  "cap$causacioncdat".MES = 12 AND'
      '  "cap$causacioncdat".ANO = 2007')
    Left = 288
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end>
  end
end
