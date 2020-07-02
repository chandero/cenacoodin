object FrmSaldosCaja: TFrmSaldosCaja
  Left = 331
  Top = 174
  Width = 239
  Height = 162
  BorderIcons = [biSystemMenu]
  Caption = 'Saldos en Caja y Bancos'
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
  object Panel1: TPanel
    Left = 1
    Top = 32
    Width = 229
    Height = 49
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 18
      Width = 47
      Height = 13
      Caption = 'Agencia'
    end
    object DBagencia: TDBLookupComboBox
      Left = 55
      Top = 16
      Width = 111
      Height = 21
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = DSagencia
      TabOrder = 0
    end
    object CBtotal: TCheckBox
      Left = 168
      Top = 17
      Width = 56
      Height = 17
      Alignment = taLeftJustify
      Caption = '&Todas'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 230
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 36
      Top = 4
      Width = 154
      Height = 25
      Caption = '&Ejecutar Consulta'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E000000010000000100004A7BB500296B
        C600527BC600186BD600528CD6003194D600397BE7005284E700107BEF00317B
        EF001084EF0029ADEF0039ADEF0010B5EF0008BDEF000073F7001873F7002973
        F7000884F7000894F70018A5F70000CEF70018DEF70063DEF700FF00FF000073
        FF00007BFF000084FF00008CFF000094FF00009CFF0000A5FF0010A5FF0039A5
        FF0052A5FF005AA5FF0000ADFF0029ADFF0031ADFF0000B5FF006BB5FF0084B5
        FF0000BDFF0008BDFF0010BDFF0000C6FF0008C6FF006BC6FF0000CEFF0018CE
        FF0000D6FF0008D6FF0010D6FF0021D6FF0031D6FF0000DEFF0018DEFF0029DE
        FF0042DEFF0000E7FF0010E7FF0018E7FF0039E7FF0000EFFF0018EFFF0039EF
        FF004AEFFF0000F7FF0008F7FF0029F7FF0031F7FF0042F7FF004AF7FF005AF7
        FF0000FFFF0008FFFF0018FFFF0021FFFF0031FFFF0039FFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
        1818181818181818181818181802181818181818181818181818181818090201
        18181818181818181818181818061A0F02181818181818181818181818181E1C
        1C0218181818181818181818181818271C1D0202181818181818181818181818
        272E1E1E02181818181818181818181818272B241E0218181818181818180202
        022D4B462C240202181818181818252D3F43434A42311F02181818181818212D
        3F433F374A4A412E021818181818182E3E42474C4A4A4B4D0218181818181818
        1836444A43322702181818181818181818181836433F241F0218181818181818
        1818181818363A34230218181818181818181818181818362202}
    end
  end
  object Panel4: TPanel
    Left = 1
    Top = 0
    Width = 229
    Height = 32
    TabOrder = 2
    object Rcajas: TRadioButton
      Left = 29
      Top = 9
      Width = 63
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Cajas'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = RcajasClick
    end
    object Rbancos: TRadioButton
      Left = 113
      Top = 9
      Width = 75
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Bancos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = RbancosClick
    end
  end
  object Panel3: TPanel
    Left = 1
    Top = 81
    Width = 229
    Height = 44
    TabOrder = 3
    Visible = False
    object Label2: TLabel
      Left = 7
      Top = 15
      Width = 107
      Height = 13
      Caption = 'Fecha de Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DtFecha: TDateTimePicker
      Left = 119
      Top = 11
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 38828.6025191667
      Time = 38828.6025191667
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object IBagencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$agencia"')
    Left = 352
    Top = 40
  end
  object DSagencia: TDataSource
    DataSet = IBagencia
    Left = 272
    Top = 16
  end
  object IBsaldos: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT * FROM P_SALDO_REMOTO_1(:FECHAINICIAL,:FECHAFINAL,:FECHA)')
    Left = 248
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHAFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 360
    Top = 64
  end
  object CDsaldos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 8
    Data = {
      950000009619E0BD01000000180000000500000000000300000095000A69645F
      6167656E6369610400010000000000076167656E636961010049000000010005
      5749445448020002001E0008656D706C6561646F020049000000010005574944
      544802000200FF000463616A6104000100000000000573616C646F0800040000
      00010007535542545950450200490006004D6F6E6579000000}
    object CDsaldosid_agencia: TIntegerField
      FieldName = 'id_agencia'
    end
    object CDsaldosagencia: TStringField
      FieldName = 'agencia'
      Size = 30
    end
    object CDsaldosempleado: TStringField
      FieldName = 'empleado'
      Size = 255
    end
    object CDsaldoscaja: TIntegerField
      FieldName = 'caja'
    end
    object CDsaldossaldo: TCurrencyField
      FieldName = 'saldo'
    end
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDsaldos
    Left = 408
    Top = 40
  end
  object IdTCPClient1: TIdTCPClient
    OnWork = IdTCPClient1Work
    OnWorkBegin = IdTCPClient1WorkBegin
    Port = 0
    Left = 184
    Top = 56
  end
  object CdCheques: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'id_agencia'
    Params = <>
    Left = 376
    Top = 8
    Data = {
      7A0000009619E0BD0100000018000000040000000000030000007A000A69645F
      6167656E6369610200010000000000076167656E636961010049000000010005
      57494454480200020064000576616C6F72080004000000010007535542545950
      450200490006004D6F6E657900066E756D65726F04000100000000000000}
    object CdChequesid_agencia: TSmallintField
      FieldName = 'id_agencia'
    end
    object CdChequesagencia: TStringField
      FieldName = 'agencia'
      Size = 100
    end
    object CdChequesvalor: TCurrencyField
      FieldName = 'valor'
    end
    object CdChequesnumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = CdCheques
    Left = 288
    Top = 128
  end
  object DSSaldos: TDataSource
    DataSet = CDsaldos
    Left = 280
    Top = 96
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 328
    Top = 64
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 378
    Top = 40
  end
  object CDbancos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'NOMBRECOD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'SALDOINICIAL'
        DataType = ftCurrency
      end
      item
        Name = 'ID_COMPROBANTE'
        DataType = ftInteger
      end
      item
        Name = 'DEBITO'
        DataType = ftCurrency
      end
      item
        Name = 'CREDITO'
        DataType = ftCurrency
      end
      item
        Name = 'ID_PERSONA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftBlob
        Size = 80
      end
      item
        Name = 'AGENCIA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'PRIMER_APELLIDO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'SEGUNDO_APELLIDO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'SALDOAUXILIAR'
        DataType = ftCurrency
      end
      item
        Name = 'ID_AGENCIA'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 352
    Top = 8
    Data = {
      EB0100009619E0BD01000000180000000E000000000003000000EB0106434F44
      49474F0100490000000100055749445448020002001200094E4F4D425245434F
      44020049000000010005574944544802000200FF000C53414C444F494E494349
      414C080004000000010007535542545950450200490006004D6F6E6579000E49
      445F434F4D50524F42414E544504000100000000000644454249544F08000400
      0000010007535542545950450200490006004D6F6E657900074352454449544F
      080004000000010007535542545950450200490006004D6F6E6579000A49445F
      504552534F4E410100490000000100055749445448020002000F000B44455343
      52495043494F4E04004B0000000200075355425459504502004900070042696E
      61727900055749445448020002005000074147454E4349410100490000000100
      055749445448020002003200064E4F4D42524501004900000001000557494454
      480200020050000F5052494D45525F4150454C4C49444F010049000000010005
      574944544802000200500010534547554E444F5F4150454C4C49444F01004900
      000001000557494454480200020050000D53414C444F415558494C4941520800
      04000000010007535542545950450200490006004D6F6E6579000A49445F4147
      454E43494104000100000000000000}
    object CDbancosCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 18
    end
    object CDbancosNOMBRECOD: TStringField
      FieldName = 'NOMBRECOD'
      Size = 255
    end
    object CDbancosSALDOINICIAL: TCurrencyField
      FieldName = 'SALDOINICIAL'
    end
    object CDbancosID_COMPROBANTE: TIntegerField
      FieldName = 'ID_COMPROBANTE'
    end
    object CDbancosDEBITO: TCurrencyField
      FieldName = 'DEBITO'
    end
    object CDbancosCREDITO: TCurrencyField
      FieldName = 'CREDITO'
    end
    object CDbancosID_PERSONA: TStringField
      FieldName = 'ID_PERSONA'
      Size = 15
    end
    object CDbancosDESCRIPCION: TBlobField
      FieldName = 'DESCRIPCION'
      Size = 80
    end
    object CDbancosAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 50
    end
    object CDbancosNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object CDbancosPRIMER_APELLIDO: TStringField
      FieldName = 'PRIMER_APELLIDO'
      Size = 80
    end
    object CDbancosSEGUNDO_APELLIDO: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Size = 80
    end
    object CDbancosSALDOAUXILIAR: TCurrencyField
      FieldName = 'SALDOAUXILIAR'
    end
    object CDbancosID_AGENCIA: TIntegerField
      FieldName = 'ID_AGENCIA'
    end
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = CDbancos
    Left = 440
    Top = 40
  end
  object CdConBancos: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID_AGENCIA'
    Params = <>
    Data = {
      A50000009619E0BD010000001800000005000000000003000000A5000A49445F
      4147454E43494104000100000000000B4445534352495043494F4E0100490000
      00010005574944544802000200640006434F4449474F01004900000001000557
      494454480200020012000553414C444F08000400000001000753554254595045
      0200490006004D6F6E657900064E4F4D42524502004900000001000557494454
      4802000200FF000000}
    object CdConBancosID_AGENCIA: TIntegerField
      FieldName = 'ID_AGENCIA'
    end
    object CdConBancosDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object CdConBancosCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 18
    end
    object CdConBancosSALDO: TCurrencyField
      FieldName = 'SALDO'
    end
    object CdConBancosNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 255
    end
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginPage = frReport1BeginPage
    OnGetValue = frReport1GetValue
    Left = 128
    Top = 8
    ReportForm = {19000000}
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = CdConBancos
    Top = 24
  end
end
