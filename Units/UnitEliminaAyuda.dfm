object FrmEliminaAyuda: TFrmEliminaAyuda
  Left = 265
  Top = 245
  Width = 464
  Height = 142
  AutoSize = True
  Caption = 'Eliminar Ayuda de Solidaridad'
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
    Left = 0
    Top = 0
    Width = 352
    Height = 49
    Caption = 'Informaci'#243'n Oficina y Fecha'
    TabOrder = 0
    object DbOficina: TDBLookupComboBox
      Left = 3
      Top = 17
      Width = 206
      Height = 21
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = dSAgencia
      TabOrder = 0
      OnKeyPress = edCuentaKeyPress
    end
    object DtFecha: TDateTimePicker
      Left = 210
      Top = 17
      Width = 135
      Height = 21
      CalAlignment = dtaLeft
      Date = 40449.3350087616
      Time = 40449.3350087616
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 47
    Width = 351
    Height = 61
    Caption = 'Informaci'#243'n de la Ayuda'
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 19
      Width = 74
      Height = 13
      Caption = 'N'#250'mero Cuenta'
    end
    object Label2: TLabel
      Left = 125
      Top = 19
      Width = 59
      Height = 13
      Caption = 'Consecutivo'
    end
    object Label3: TLabel
      Left = 240
      Top = 19
      Width = 63
      Height = 13
      Caption = 'Fecha Ayuda'
    end
    object edCuenta: TEdit
      Left = 8
      Top = 32
      Width = 106
      Height = 21
      TabOrder = 0
      OnKeyPress = edCuentaKeyPress
    end
    object edConsecutivo: TEdit
      Left = 124
      Top = 32
      Width = 100
      Height = 21
      TabOrder = 1
      OnKeyPress = edCuentaKeyPress
    end
    object dtFechaCom: TDateTimePicker
      Left = 238
      Top = 32
      Width = 102
      Height = 21
      CalAlignment = dtaLeft
      Date = 40449.3350087616
      Time = 40449.3350087616
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnKeyPress = edCuentaKeyPress
    end
  end
  object Panel1: TPanel
    Left = 351
    Top = 4
    Width = 105
    Height = 104
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 16
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Eliminar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 32
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 60
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
    Left = 552
    Top = 96
  end
  object dSAgencia: TDataSource
    DataSet = IBAgencia
    Left = 520
    Top = 96
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
    Left = 224
    Top = 136
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
    Left = 184
    Top = 136
  end
  object _cdLog: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 32
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
