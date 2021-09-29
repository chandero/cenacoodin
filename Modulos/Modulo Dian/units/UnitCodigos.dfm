object FrmCodigo: TFrmCodigo
  Left = 396
  Top = 212
  Width = 293
  Height = 115
  Caption = 'FrmCodigo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bar3: TJvSpecialProgress
    Left = 2
    Top = 43
    Width = 271
    Height = 22
    BorderStyle = bsSingle
    Color = clBtnHighlight
    EndColor = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Solid = True
    Step = 1
    TextCentered = True
    TextOption = toPercent
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 8
    Width = 129
    Height = 25
    Caption = '&Ejecutar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 8
    Top = 8
  end
  object CD: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CONCEPTO'
        DataType = ftString
        Size = 4
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
        Name = 'MUNICIPIO'
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
        Name = 'MONTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RETENCION'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 248
    Top = 24
    Data = {
      CE0100009619E0BD010000001800000010000000000003000000CE0106434F44
      49474F010049000000010005574944544802000200120008434F4E434550544F
      0100490000000100055749445448020002000400025450010049000000010005
      5749445448020002000200024E4D010049000000010005574944544802000200
      0F0002445601004900000001000557494454480200020002000A505F4150454C
      4C49444F01004900000001000557494454480200020064000A535F4150454C4C
      49444F010049000000010005574944544802000200640008505F4E4F4D425245
      010049000000010005574944544802000200640008535F4E4F4D425245010049
      00000001000557494454480200020064000552415A4F4E020049000000010005
      574944544802000200FF0009444952454343494F4E0200490000000100055749
      44544802000200FF00094D554E49434950494F02004900000001000557494454
      4802000200FF00044450544F0100490000000100055749445448020002000300
      034D43500100490000000100055749445448020002000300054D4F4E544F0100
      49000000010005574944544802000200140009524554454E43494F4E01004900
      000001000557494454480200020032000000}
    object CDCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 18
    end
    object CDCONCEPTO: TStringField
      FieldName = 'CONCEPTO'
      Size = 4
    end
    object CDTP: TStringField
      FieldName = 'TP'
      Size = 2
    end
    object CDNM: TStringField
      FieldName = 'NM'
      Size = 15
    end
    object CDDV: TStringField
      FieldName = 'DV'
      Size = 2
    end
    object CDP_APELLIDO: TStringField
      FieldName = 'P_APELLIDO'
      Size = 100
    end
    object CDS_APELLIDO: TStringField
      FieldName = 'S_APELLIDO'
      Size = 100
    end
    object CDP_NOMBRE: TStringField
      FieldName = 'P_NOMBRE'
      Size = 100
    end
    object CDS_NOMBRE: TStringField
      FieldName = 'S_NOMBRE'
      Size = 100
    end
    object CDRAZON: TStringField
      FieldName = 'RAZON'
      Size = 255
    end
    object CDDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Size = 255
    end
    object CDMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 255
    end
    object CDDPTO: TStringField
      FieldName = 'DPTO'
      Size = 3
    end
    object CDMCP: TStringField
      FieldName = 'MCP'
      Size = 3
    end
    object CDMONTO: TStringField
      FieldName = 'MONTO'
    end
    object CDRETENCION: TStringField
      FieldName = 'RETENCION'
      Size = 50
    end
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 8
    Top = 40
  end
  object save: TSaveDialog
    Left = 80
    Top = 40
  end
  object IBQuery3: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  DIAN$DIRECCION.MCP,'
      '  DIAN$DIRECCION.DPTO,'
      '  DIAN$DIRECCION.DIRECCION'
      'FROM'
      '  DIAN$DIRECCION'
      'WHERE'
      '  DIAN$DIRECCION.ID_IDENTIFICACION = :ID AND '
      '  DIAN$DIRECCION.ID_PERSONA = :IDPER')
    Left = 224
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPER'
        ParamType = ptUnknown
      end>
  end
end
