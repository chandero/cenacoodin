object FrmActualizaSolicitudOf: TFrmActualizaSolicitudOf
  Left = 497
  Top = 271
  Width = 595
  Height = 391
  Caption = 'Actualizar Solicitud'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 391
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
      OnKeyPress = DbOficinaKeyPress
    end
  end
  object Panel1: TPanel
    Left = 391
    Top = 5
    Width = 105
    Height = 196
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Actualizar'
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 46
    Width = 392
    Height = 57
    Caption = 'Datos Solicitud'
    TabOrder = 1
    object Label1: TLabel
      Left = 135
      Top = 14
      Width = 44
      Height = 13
      Caption = 'Asociado'
    end
    object Label4: TLabel
      Left = 4
      Top = 14
      Width = 40
      Height = 13
      Caption = 'Solicitud'
    end
    object EdAsociado: TEdit
      Left = 136
      Top = 28
      Width = 252
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 2
      OnKeyPress = DbOficinaKeyPress
    end
    object EdSolicitud: TEdit
      Left = 4
      Top = 28
      Width = 101
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = DbOficinaKeyPress
    end
    object Button1: TButton
      Left = 106
      Top = 28
      Width = 28
      Height = 23
      Caption = '...'
      TabOrder = 1
      OnClick = Button1Click
      OnKeyPress = DbOficinaKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 99
    Width = 391
    Height = 57
    Caption = 'Datos Actuales'
    Enabled = False
    TabOrder = 3
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 60
      Height = 13
      Caption = 'Amortizaci'#243'n'
    end
    object Label3: TLabel
      Left = 112
      Top = 16
      Width = 60
      Height = 13
      Caption = 'Pago Interes'
    end
    object Label5: TLabel
      Left = 207
      Top = 16
      Width = 85
      Height = 13
      Caption = 'Respaldo'
    end
    object dbResant: TDBLookupComboBox
      Left = 207
      Top = 29
      Width = 174
      Height = 21
      KeyField = 'ID_RESPALDO'
      ListField = 'DESCRIPCION_RESPALDO'
      ListSource = DsEstado
      TabOrder = 0
    end
    object jvAmorAnt: TJvIntegerEdit
      Left = 24
      Top = 28
      Width = 88
      Height = 21
      Alignment = taCenter
      ReadOnly = False
      TabOrder = 1
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object jvIntAnt: TJvIntegerEdit
      Left = 113
      Top = 28
      Width = 88
      Height = 21
      Alignment = taCenter
      ReadOnly = False
      TabOrder = 2
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
  end
  object grDatos: TGroupBox
    Left = 0
    Top = 152
    Width = 391
    Height = 57
    Caption = 'Nuevos Datos'
    Enabled = False
    TabOrder = 4
    object Label6: TLabel
      Left = 24
      Top = 15
      Width = 60
      Height = 13
      Caption = 'Amortizaci'#243'n'
    end
    object Label7: TLabel
      Left = 112
      Top = 15
      Width = 60
      Height = 13
      Caption = 'Pago Interes'
    end
    object Label8: TLabel
      Left = 207
      Top = 15
      Width = 45
      Height = 13
      Caption = 'Respaldo'
    end
    object dbResAct: TDBLookupComboBox
      Left = 207
      Top = 28
      Width = 174
      Height = 21
      KeyField = 'ID_RESPALDO'
      ListField = 'DESCRIPCION_RESPALDO'
      ListSource = DsEstado
      TabOrder = 0
    end
    object jvAmorAct: TJvIntegerEdit
      Left = 24
      Top = 28
      Width = 88
      Height = 21
      Alignment = taCenter
      ReadOnly = False
      TabOrder = 1
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object jvIntAct: TJvIntegerEdit
      Left = 113
      Top = 28
      Width = 88
      Height = 21
      Alignment = taCenter
      ReadOnly = False
      TabOrder = 2
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
  end
  object dSAgencia: TDataSource
    DataSet = IBAgencia
    Left = 704
    Top = 64
  end
  object IBAgencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select ID_AGENCIA,DESCRIPCION_AGENCIA from "gen$agencia" where I' +
        'D_AGENCIA <> 0')
    Left = 736
    Top = 64
  end
  object IdTCPClient1: TIdTCPClient
    Port = 0
    Left = 672
    Top = 136
  end
  object IdTCPClient2: TIdTCPClient
    OnWork = IdTCPClient2Work
    OnWorkBegin = IdTCPClient2WorkBegin
    OnWorkEnd = IdTCPClient2WorkEnd
    Port = 0
    Left = 128
    Top = 24
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
    Left = 768
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
  object DsEstado: TDataSource
    DataSet = iBEstado
    Left = 384
    Top = 224
  end
  object iBEstado: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "col$respaldo"')
    Left = 416
    Top = 216
  end
  object IBEstadoActual: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "col$estadosolicitud".ID_ESTADO,'
      '  "col$estadosolicitud".DESCRIPCION_ESTADO'
      'FROM'
      '  "col$estadosolicitud"')
    Left = 416
    Top = 288
  end
  object DsActual: TDataSource
    DataSet = IBEstadoActual
    Left = 384
    Top = 288
  end
  object _cdLog: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 48
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
