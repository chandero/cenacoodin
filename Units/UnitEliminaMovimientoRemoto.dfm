object FrmEliminaMovimientoRemoto: TFrmEliminaMovimientoRemoto
  Left = 152
  Top = 46
  Width = 633
  Height = 425
  AutoSize = True
  Caption = 'Eliminar Movimiento Remoto'
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
    Width = 521
    Height = 56
    Caption = 'Informaci'#243'n oficina y tipo de Movimiento'
    TabOrder = 0
    object Label7: TLabel
      Left = 3
      Top = 14
      Width = 105
      Height = 13
      Caption = 'Of. Origen Movimiento'
    end
    object Label8: TLabel
      Left = 136
      Top = 15
      Width = 127
      Height = 13
      Caption = 'Of. Destino del Movimiento'
    end
    object Label9: TLabel
      Left = 272
      Top = 16
      Width = 93
      Height = 13
      Caption = 'Tipo de Movimiento'
    end
    object Label10: TLabel
      Left = 406
      Top = 15
      Width = 54
      Height = 13
      Caption = 'Fecha Mov'
    end
    object DbOficina: TDBLookupComboBox
      Left = 3
      Top = 29
      Width = 132
      Height = 21
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = dSAgencia
      TabOrder = 0
      OnKeyPress = DbOficinaKeyPress
    end
    object DtFecha: TDateTimePicker
      Left = 408
      Top = 27
      Width = 81
      Height = 21
      CalAlignment = dtaLeft
      Date = 40449.3350087616
      Time = 40449.3350087616
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      TabStop = False
    end
    object cbTipoMovimiento: TComboBox
      Left = 272
      Top = 28
      Width = 134
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'CONSIGNACION'
      OnKeyPress = DbOficinaKeyPress
      Items.Strings = (
        'CONSIGNACION'
        'RETIRO')
    end
    object DbOficinaDest: TDBLookupComboBox
      Left = 137
      Top = 29
      Width = 132
      Height = 21
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = dSAgencia
      TabOrder = 1
      OnKeyPress = DbOficinaKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 53
    Width = 521
    Height = 91
    Caption = 'Informaci'#243'n de la Operaci'#243'n'
    TabOrder = 1
    object Label1: TLabel
      Left = 3
      Top = 16
      Width = 72
      Height = 13
      Caption = 'Tipo Captaci'#243'n'
    end
    object Label2: TLabel
      Left = 4
      Top = 52
      Width = 54
      Height = 13
      Caption = 'No. Cuenta'
    end
    object Label3: TLabel
      Left = 147
      Top = 52
      Width = 14
      Height = 13
      Caption = 'Dg'
    end
    object Label4: TLabel
      Left = 297
      Top = 17
      Width = 112
      Height = 13
      Caption = 'Valor de la Transacci'#243'n'
    end
    object Label5: TLabel
      Left = 163
      Top = 52
      Width = 112
      Height = 13
      Caption = 'Documento Movimiento'
    end
    object Label6: TLabel
      Left = 317
      Top = 52
      Width = 21
      Height = 13
      Caption = 'Caja'
    end
    object Label11: TLabel
      Left = 450
      Top = 17
      Width = 61
      Height = 13
      Caption = 'Caja Remota'
    end
    object DbTipo: TDBLookupComboBox
      Left = 3
      Top = 29
      Width = 293
      Height = 21
      KeyField = 'ID_TIPO_CAPTACION'
      ListField = 'DESCRIPCION'
      ListSource = DsTipo
      TabOrder = 0
      OnKeyPress = DbOficinaKeyPress
    end
    object JvDg: TJvIntegerEdit
      Left = 145
      Top = 65
      Width = 18
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 2
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object JvValor: TJvxCurrencyEdit
      Left = 297
      Top = 29
      Width = 154
      Height = 21
      FormatOnEditing = True
      TabOrder = 1
      OnKeyPress = DbOficinaKeyPress
    end
    object EdDocumento: TEdit
      Left = 163
      Top = 65
      Width = 154
      Height = 21
      TabOrder = 4
      OnExit = EdDocumentoExit
      OnKeyPress = DbOficinaKeyPress
    end
    object EdCaja: TEdit
      Left = 318
      Top = 64
      Width = 43
      Height = 21
      TabOrder = 5
      OnKeyPress = DbOficinaKeyPress
    end
    object Button1: TButton
      Left = 364
      Top = 63
      Width = 149
      Height = 24
      Caption = '...'
      TabOrder = 6
      OnClick = Button1Click
      OnKeyPress = DbOficinaKeyPress
    end
    object EdCuenta: TEdit
      Left = 4
      Top = 64
      Width = 140
      Height = 21
      TabOrder = 3
      OnExit = EdCuentaExit
      OnKeyPress = DbOficinaKeyPress
    end
    object EdCajaRem: TEdit
      Left = 450
      Top = 29
      Width = 65
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 7
      Text = '25'
      OnKeyPress = DbOficinaKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 142
    Width = 625
    Height = 75
    Caption = 'Movimiento del Extracto'
    TabOrder = 2
    object DbExtracto: TDBGrid
      Left = 2
      Top = 12
      Width = 615
      Height = 57
      DataSource = DsExtracto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
    Top = 214
    Width = 625
    Height = 90
    Caption = 'Movimiento de la Caja Origen'
    TabOrder = 3
    object DbCaja: TDBGrid
      Left = 2
      Top = 12
      Width = 615
      Height = 74
      DataSource = DsCaja
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Panel1: TPanel
    Left = 520
    Top = 4
    Width = 105
    Height = 133
    TabOrder = 4
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
  object Memo1: TMemo
    Left = 104
    Top = 259
    Width = 457
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
    Visible = False
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 301
    Width = 625
    Height = 90
    Caption = 'Movimiento de la Caja Destino'
    TabOrder = 6
    object DbRemoto: TDBGrid
      Left = 2
      Top = 12
      Width = 615
      Height = 74
      DataSource = DsCajaRemota
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object CdCaja: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 232
  end
  object IbTipoCaptacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "cap$tipocaptacion".ID_TIPO_CAPTACION,'
      '  "cap$tipocaptacion".DESCRIPCION'
      'FROM'
      '  "cap$tipocaptacion"'
      'WHERE'
      '  "cap$tipocaptacion".ID_TIPO_CAPTACION <> 6')
    Left = 672
    Top = 264
  end
  object DsCaja: TDataSource
    DataSet = CdCaja
    Left = 760
    Top = 240
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
  object IdTCPClient1: TIdTCPClient
    OnWork = IdTCPClient1Work
    OnWorkBegin = IdTCPClient1WorkBegin
    OnWorkEnd = IdTCPClient1WorkEnd
    Port = 0
    Left = 672
    Top = 136
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
  object DsTipo: TDataSource
    DataSet = IbTipoCaptacion
    Left = 776
    Top = 80
  end
  object DsExtracto: TDataSource
    Left = 696
    Top = 216
  end
  object DsCajaRemota: TDataSource
    Left = 800
    Top = 248
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
