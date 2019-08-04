object FrmAbrirNota: TFrmAbrirNota
  Left = 438
  Top = 275
  Width = 465
  Height = 241
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Abrir Nota Contable'
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
      OnKeyPress = DbOficinaKeyPress
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
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 46
    Width = 352
    Height = 59
    Caption = 'Informaci'#243'n Nota Contable'
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 16
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label2: TLabel
      Left = 135
      Top = 16
      Width = 101
      Height = 13
      Caption = 'Fecha Nota Contable'
    end
    object EdNota: TEdit
      Left = 4
      Top = 31
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = DbOficinaKeyPress
    end
    object dtFechaCom: TDateTimePicker
      Left = 134
      Top = 30
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
      OnKeyPress = DbOficinaKeyPress
    end
    object Button1: TButton
      Left = 270
      Top = 30
      Width = 28
      Height = 20
      Caption = '...'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 102
    Width = 457
    Height = 105
    Caption = 'Descripci'#243'n Nota Contable'
    TabOrder = 2
    object mDescripcion: TMemo
      Left = 2
      Top = 13
      Width = 447
      Height = 87
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 351
    Top = 3
    Width = 105
    Height = 105
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Abrir Nota'
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
  object dSAgencia: TDataSource
    DataSet = IBAgencia
    Left = 320
    Top = 48
  end
  object IBAgencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select ID_AGENCIA,DESCRIPCION_AGENCIA from "gen$agencia" where I' +
        'D_AGENCIA <> 0')
    Left = 288
    Top = 48
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
    Left = 576
    Top = 144
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
    Left = 672
    Top = 136
  end
  object _cdLog: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 104
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
