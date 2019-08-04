object FrmInteresRete: TFrmInteresRete
  Left = 190
  Top = 187
  Width = 355
  Height = 148
  Caption = 'FrmInteresRete'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 204
    Top = 58
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 138
    Top = 62
  end
  object CdSaldo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CONCEPTO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'TIPO_DOC'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DV'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'P_APELLIDO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'S_APELLIDO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'P_NOMBRE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'S_NOMBRE'
        DataType = ftString
        Size = 50
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
        Name = 'SALDO'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 8
    Data = {
      750100009619E0BD01000000180000000D000000000003000000750108434F4E
      434550544F0100490000000100055749445448020002000400085449504F5F44
      4F430400010000000000064E554D45524F010049000000010005574944544802
      0002000F0002445601004900000001000557494454480200020001000A505F41
      50454C4C49444F01004900000001000557494454480200020032000A535F4150
      454C4C49444F010049000000010005574944544802000200320008505F4E4F4D
      425245010049000000010005574944544802000200320008535F4E4F4D425245
      01004900000001000557494454480200020032000552415A4F4E020049000000
      010005574944544802000200FF0009444952454343494F4E0200490000000100
      05574944544802000200FF00044450544F010049000000010005574944544802
      0002000300034D43500100490000000100055749445448020002000300055341
      4C444F01004900000001000557494454480200020014000000}
    object CdSaldoCONCEPTO: TStringField
      FieldName = 'CONCEPTO'
      Size = 4
    end
    object CdSaldoTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
    end
    object CdSaldoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CdSaldoDV: TStringField
      FieldName = 'DV'
      Size = 1
    end
    object CdSaldoP_APELLIDO: TStringField
      FieldName = 'P_APELLIDO'
      Size = 50
    end
    object CdSaldoS_APELLIDO: TStringField
      FieldName = 'S_APELLIDO'
      Size = 50
    end
    object CdSaldoP_NOMBRE: TStringField
      FieldName = 'P_NOMBRE'
      Size = 50
    end
    object CdSaldoS_NOMBRE: TStringField
      FieldName = 'S_NOMBRE'
      Size = 50
    end
    object CdSaldoRAZON: TStringField
      FieldName = 'RAZON'
      Size = 255
    end
    object CdSaldoDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Size = 255
    end
    object CdSaldoDPTO: TStringField
      FieldName = 'DPTO'
      Size = 3
    end
    object CdSaldoMCP: TStringField
      FieldName = 'MCP'
      Size = 3
    end
    object CdSaldoSALDO: TStringField
      FieldName = 'SALDO'
    end
  end
  object IBSQL3: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 240
    Top = 64
  end
  object save: TSaveDialog
    Left = 80
    Top = 40
  end
end
