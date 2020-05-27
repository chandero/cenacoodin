object frmCausacionCdatAuto: TfrmCausacionCdatAuto
  Left = 509
  Top = 295
  Width = 495
  Height = 119
  Caption = 'Causaci'#243'n Cdat Auto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object progreso: TProgressBar
    Left = 16
    Top = 32
    Width = 457
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object edCaptacion: TEdit
    Left = 16
    Top = 7
    Width = 457
    Height = 21
    ReadOnly = True
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
  object IBComprobante: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select '
      'CON$AUXILIAR.ID_COMPROBANTE,'
      '"gen$agencia".DESCRIPCION_AGENCIA,'
      'CON$TIPOCOMPROBANTE.DESCRIPCION AS TIPO,'
      'CON$COMPROBANTE.FECHADIA,'
      'CON$COMPROBANTE.DESCRIPCION,'
      '"gen$empleado".PRIMER_APELLIDO,'
      '"gen$empleado".SEGUNDO_APELLIDO,'
      '"gen$empleado".NOMBRE,'
      'CON$AUXILIAR.CODIGO,'
      'CON$PUC.NOMBRE AS CUENTA,'
      'CON$AUXILIAR.DEBITO,'
      'CON$AUXILIAR.CREDITO'
      'from '
      'CON$COMPROBANTE '
      
        'INNER JOIN CON$AUXILIAR ON (CON$COMPROBANTE.ID_COMPROBANTE = CON' +
        '$AUXILIAR.ID_COMPROBANTE)'
      'LEFT JOIN CON$PUC ON (CON$AUXILIAR.CODIGO = CON$PUC.CODIGO)'
      
        'INNER JOIN CON$TIPOCOMPROBANTE ON (CON$COMPROBANTE.TIPO_COMPROBA' +
        'NTE = CON$TIPOCOMPROBANTE.ID) '
      
        'INNER JOIN "gen$agencia" ON (CON$AUXILIAR.ID_AGENCIA = "gen$agen' +
        'cia".ID_AGENCIA)'
      
        'INNER JOIN "gen$empleado" ON (CON$COMPROBANTE.ID_EMPLEADO = "gen' +
        '$empleado".ID_EMPLEADO)'
      'where '
      '(CON$COMPROBANTE.ID_AGENCIA = :"ID_AGENCIA") and '
      '(CON$COMPROBANTE.ID_COMPROBANTE = :"ID_COMPROBANTE")')
    Left = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COMPROBANTE'
        ParamType = ptUnknown
      end>
    object IBComprobanteID_COMPROBANTE: TIntegerField
      FieldName = 'ID_COMPROBANTE'
      Origin = 'CON$AUXILIAR."ID_COMPROBANTE"'
    end
    object IBComprobanteDESCRIPCION_AGENCIA: TIBStringField
      FieldName = 'DESCRIPCION_AGENCIA'
      Origin = '"gen$agencia"."DESCRIPCION_AGENCIA"'
      Required = True
      Size = 50
    end
    object IBComprobanteTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'CON$TIPOCOMPROBANTE."DESCRIPCION"'
      Size = 100
    end
    object IBComprobanteFECHADIA: TDateField
      FieldName = 'FECHADIA'
      Origin = 'CON$COMPROBANTE."FECHADIA"'
      Required = True
    end
    object IBComprobanteDESCRIPCION: TMemoField
      FieldName = 'DESCRIPCION'
      Origin = 'CON$COMPROBANTE."DESCRIPCION"'
      BlobType = ftMemo
      Size = 8
    end
    object IBComprobantePRIMER_APELLIDO: TIBStringField
      FieldName = 'PRIMER_APELLIDO'
      Origin = '"gen$empleado"."PRIMER_APELLIDO"'
      Size = 30
    end
    object IBComprobanteSEGUNDO_APELLIDO: TIBStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Origin = '"gen$empleado"."SEGUNDO_APELLIDO"'
      Size = 30
    end
    object IBComprobanteNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = '"gen$empleado"."NOMBRE"'
      Size = 30
    end
    object IBComprobanteCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'CON$AUXILIAR."CODIGO"'
      FixedChar = True
      Size = 18
    end
    object IBComprobanteCUENTA: TIBStringField
      FieldName = 'CUENTA'
      Origin = 'CON$PUC."NOMBRE"'
      Size = 100
    end
    object IBComprobanteDEBITO: TIBBCDField
      FieldName = 'DEBITO'
      Origin = 'CON$AUXILIAR."DEBITO"'
      Precision = 18
      Size = 3
    end
    object IBComprobanteCREDITO: TIBBCDField
      FieldName = 'CREDITO'
      Origin = 'CON$AUXILIAR."CREDITO"'
      Precision = 18
      Size = 3
    end
  end
end
