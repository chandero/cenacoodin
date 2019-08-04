object FrmEliminaAbonoCaja: TFrmEliminaAbonoCaja
  Left = 429
  Top = 166
  Width = 465
  Height = 346
  AutoSize = True
  Caption = 'Eliminar Abono por Caja'
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
    Caption = 'Informaci'#243'n Oficina y Fecha Abono'
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
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 351
    Top = 3
    Width = 105
    Height = 135
    TabOrder = 1
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 353
    Height = 98
    Caption = 'Informaci'#243'n Colocaci'#243'n'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Colocaci'#243'n'
    end
    object Label2: TLabel
      Left = 149
      Top = 16
      Width = 63
      Height = 13
      Caption = 'Comprobante'
    end
    object Label3: TLabel
      Left = 273
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Cuota Tabla'
    end
    object Label4: TLabel
      Left = 8
      Top = 56
      Width = 65
      Height = 13
      Caption = 'Fecha Capital'
    end
    object Label5: TLabel
      Left = 128
      Top = 56
      Width = 65
      Height = 13
      Caption = 'Fecha Interes'
    end
    object Label6: TLabel
      Left = 238
      Top = 56
      Width = 21
      Height = 13
      Caption = 'Caja'
    end
    object EdColocacion: TEdit
      Left = 9
      Top = 30
      Width = 136
      Height = 21
      TabOrder = 0
      OnKeyPress = DbOficinaKeyPress
    end
    object EdComprobante: TEdit
      Left = 149
      Top = 30
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = DbOficinaKeyPress
    end
    object EdCuota: TEdit
      Left = 273
      Top = 30
      Width = 63
      Height = 21
      TabOrder = 2
      OnKeyPress = DbOficinaKeyPress
    end
    object dtFechaK: TDateTimePicker
      Left = 9
      Top = 69
      Width = 110
      Height = 21
      CalAlignment = dtaLeft
      Date = 40449.3350087616
      Time = 40449.3350087616
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      OnKeyPress = DbOficinaKeyPress
    end
    object DtFechaI: TDateTimePicker
      Left = 122
      Top = 69
      Width = 113
      Height = 21
      CalAlignment = dtaLeft
      Date = 40449.3350087616
      Time = 40449.3350087616
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
      OnKeyPress = DbOficinaKeyPress
    end
    object Button1: TButton
      Left = 295
      Top = 68
      Width = 41
      Height = 21
      Caption = '...'
      TabOrder = 6
      OnClick = Button1Click
      OnKeyPress = DbOficinaKeyPress
    end
    object edCaja: TEdit
      Left = 237
      Top = 69
      Width = 52
      Height = 21
      TabOrder = 5
      OnKeyPress = DbOficinaKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 136
    Width = 457
    Height = 86
    Caption = 'Informaci'#243'n Extracto Colocaci'#243'n'
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 5
      Top = 16
      Width = 446
      Height = 64
      DataSource = dsExtracto
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 222
    Width = 457
    Height = 90
    Caption = 'Informaci'#243'n Movimiento Caja'
    TabOrder = 4
    object DBGrid2: TDBGrid
      Left = 5
      Top = 14
      Width = 446
      Height = 68
      DataSource = dsCaja
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object _cdLog: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 184
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
  object IBAgencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select ID_AGENCIA,DESCRIPCION_AGENCIA from "gen$agencia" where I' +
        'D_AGENCIA <> 0')
    Left = 592
    Top = 248
  end
  object dSAgencia: TDataSource
    DataSet = IBAgencia
    Left = 672
    Top = 184
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
    Port = 0
    Left = 672
    Top = 136
  end
  object dsExtracto: TDataSource
    Left = 536
    Top = 120
  end
  object dsCaja: TDataSource
    Left = 536
    Top = 256
  end
  object CdCaja: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 232
  end
end
