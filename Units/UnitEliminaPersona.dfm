object FrmEliminaDocumento: TFrmEliminaDocumento
  Left = 358
  Top = 383
  Width = 497
  Height = 163
  AutoSize = True
  Caption = 'Eliminar Documento'
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
  object GroupBox2: TGroupBox
    Left = 8
    Top = 0
    Width = 376
    Height = 49
    Caption = 'Oficina'
    TabOrder = 0
    object DbOficina: TDBLookupComboBox
      Left = 3
      Top = 17
      Width = 244
      Height = 21
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = dSAgencia
      TabOrder = 0
      OnKeyPress = DbOficinaKeyPress
    end
    object DtFecha: TDateTimePicker
      Left = 249
      Top = 17
      Width = 122
      Height = 21
      CalAlignment = dtaLeft
      Date = 40449.3350087616
      Time = 40449.3350087616
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 47
    Width = 383
    Height = 81
    Caption = 'Datos del Documento'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 87
      Height = 13
      Caption = 'Tipo Identificaci'#243'n'
    end
    object Label2: TLabel
      Left = 208
      Top = 16
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object DbIdentificacion: TDBLookupComboBox
      Left = 10
      Top = 31
      Width = 198
      Height = 21
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = dsIdentificacion
      TabOrder = 0
      OnKeyPress = DbOficinaKeyPress
    end
    object edNumero: TEdit
      Left = 208
      Top = 31
      Width = 148
      Height = 21
      TabOrder = 1
      OnKeyPress = DbOficinaKeyPress
    end
    object EdAsociado: TEdit
      Left = 10
      Top = 56
      Width = 347
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 2
    end
    object Button1: TButton
      Left = 360
      Top = 32
      Width = 19
      Height = 23
      Caption = '...'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object Panel1: TPanel
    Left = 384
    Top = 5
    Width = 105
    Height = 124
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Eliminar'
      Enabled = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 42
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 78
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object IBAgencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select ID_AGENCIA,DESCRIPCION_AGENCIA from "gen$agencia" where I' +
        'D_AGENCIA <> 0')
    Left = 520
    Top = 64
  end
  object IBDocumento: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select ID_IDENTIFICACION,DESCRIPCION_IDENTIFICACION from "gen$ti' +
        'posidentificacion"')
    Left = 520
    Top = 40
  end
  object dSAgencia: TDataSource
    DataSet = IBAgencia
    Left = 704
    Top = 64
  end
  object dsIdentificacion: TDataSource
    DataSet = IBDocumento
    Left = 712
    Top = 112
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  "gen$servidor"'
      'WHERE'
      '  "gen$servidor".ID_AGENCIA = :ID_AGENCIA AND '
      '  "gen$servidor".ID_SERVICIO = 1')
    Left = 648
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
  object IdTCPClient1: TIdTCPClient
    OnWork = IdTCPClient1Work
    OnWorkBegin = IdTCPClient1WorkBegin
    OnWorkEnd = IdTCPClient1WorkEnd
    Port = 0
    Left = 72
    Top = 40
  end
  object _cdLog: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 16
    Data = {
      7C0000009619E0BD0100000018000000040000000000030000007C000A494445
      4D504C4541444F0100490000000100055749445448020002000F000846454348
      414449410800080000000000045449504F0400010000000000094F5045524143
      494F4E04004B0000000100075355425459504502004900050054657874000000}
    object _cdLogIDEMPLEADO: TStringField
      FieldName = 'IDEMPLEADO'
      Size = 15
    end
    object _cdLogFECHADIA: TDateTimeField
      FieldName = 'FECHADIA'
    end
    object _cdLogTIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object _cdLogOPERACION: TMemoField
      FieldName = 'OPERACION'
      BlobType = ftMemo
    end
  end
end
