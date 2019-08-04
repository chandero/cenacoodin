object frmEvaluacion: TfrmEvaluacion
  Left = 223
  Top = 125
  BorderStyle = bsDialog
  Caption = 'Evaluaci'#243'n de Cartera'
  ClientHeight = 388
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 33
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 98
      Height = 13
      Caption = 'Fecha de Causaci'#243'n'
    end
    object Label12: TLabel
      Left = 227
      Top = 9
      Width = 96
      Height = 13
      Caption = 'Fecha Comprobante'
    end
    object edFecha: TDateTimePicker
      Left = 119
      Top = 5
      Width = 98
      Height = 21
      CalAlignment = dtaLeft
      Date = 42019.7252789468
      Time = 42019.7252789468
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object btnHabilitar: TBitBtn
      Left = 488
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Habilitar'
      TabOrder = 1
      OnClick = btnHabilitarClick
    end
    object edFechaComprobante: TDateTimePicker
      Left = 338
      Top = 5
      Width = 98
      Height = 21
      CalAlignment = dtaLeft
      Date = 42019.7252789468
      Time = 42019.7252789468
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 804
    Height = 184
    Align = alTop
    Enabled = False
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Colocaci'#243'n'
    end
    object Label3: TLabel
      Left = 8
      Top = 35
      Width = 44
      Height = 13
      Caption = 'Asociado'
    end
    object Label4: TLabel
      Left = 8
      Top = 68
      Width = 27
      Height = 13
      Caption = 'Saldo'
    end
    object Label5: TLabel
      Left = 208
      Top = 67
      Width = 60
      Height = 13
      Caption = 'Prov. Capital'
    end
    object Label6: TLabel
      Left = 400
      Top = 67
      Width = 60
      Height = 13
      Caption = 'Prov. Inter'#233's'
    end
    object Label7: TLabel
      Left = 608
      Top = 67
      Width = 60
      Height = 13
      Caption = 'Prov. Costas'
    end
    object Label8: TLabel
      Left = 8
      Top = 96
      Width = 78
      Height = 13
      Caption = 'Categoria Actual'
    end
    object Label9: TLabel
      Left = 142
      Top = 97
      Width = 101
      Height = 13
      Caption = 'Categoria Evaluaci'#243'n'
    end
    object Label10: TLabel
      Left = 406
      Top = 97
      Width = 95
      Height = 13
      Caption = 'Nueva Prov. Capital'
    end
    object Label11: TLabel
      Left = 293
      Top = 97
      Width = 52
      Height = 13
      Caption = '% Aplicado'
    end
    object edColocacion: TEdit
      Left = 66
      Top = 5
      Width = 151
      Height = 21
      MaxLength = 11
      TabOrder = 0
    end
    object btnCargar: TBitBtn
      Left = 221
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Cargar Datos'
      TabOrder = 1
      OnClick = btnCargarClick
    end
    object edAsociado: TEdit
      Left = 66
      Top = 32
      Width = 735
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edSaldo: TJvCurrencyEdit
      Left = 64
      Top = 64
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 3
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object edProvCapital: TJvCurrencyEdit
      Left = 272
      Top = 64
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 4
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object edProvInteres: TJvCurrencyEdit
      Left = 464
      Top = 64
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 5
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object edProvCosta: TJvCurrencyEdit
      Left = 680
      Top = 64
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 6
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object edCategoria: TEdit
      Left = 94
      Top = 93
      Width = 35
      Height = 21
      ReadOnly = True
      TabOrder = 7
    end
    object edEvaluacion: TEdit
      Left = 248
      Top = 93
      Width = 35
      Height = 21
      TabOrder = 8
      OnChange = edEvaluacionChange
    end
    object edNuevaProvision: TJvCurrencyEdit
      Left = 526
      Top = 94
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 9
      HasMaxValue = False
      HasMinValue = False
    end
    object btnAgregar: TBitBtn
      Left = 656
      Top = 152
      Width = 75
      Height = 25
      Caption = '&Agregar'
      TabOrder = 10
      OnClick = btnAgregarClick
    end
    object edClasificacion: TEdit
      Left = 326
      Top = 4
      Width = 35
      Height = 21
      Enabled = False
      TabOrder = 11
    end
    object edGarantia: TEdit
      Left = 373
      Top = 4
      Width = 36
      Height = 21
      Enabled = False
      TabOrder = 12
    end
    object edPorc: TJvFloatEdit
      Left = 352
      Top = 93
      Width = 41
      Height = 21
      Alignment = taRightJustify
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      AutoSize = False
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 13
      OnChange = edPorcChange
    end
    object btnRetirar: TBitBtn
      Left = 744
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Retirar'
      TabOrder = 14
      OnClick = btnRetirarClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 217
    Width = 804
    Height = 136
    Align = alTop
    Enabled = False
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 802
      Height = 134
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA_CORTE'
          Title.Caption = 'CORTE'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_AGENCIA'
          Title.Caption = 'AGENCIA'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_COLOCACION'
          Title.Caption = 'COLOCACION'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO'
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CATEGORIA'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EVALUACION'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAPITAL_ANTERIOR'
          Title.Caption = 'ANTERIOR'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAPITAL_NUEVO'
          Title.Caption = 'NUEVO'
          Width = 100
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 354
    Width = 804
    Height = 34
    Align = alBottom
    TabOrder = 3
    object Label13: TLabel
      Left = 96
      Top = 11
      Width = 68
      Height = 13
      Caption = 'Nota Contable'
    end
    object btnAplicar: TBitBtn
      Left = 0
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Aplicar'
      Enabled = False
      TabOrder = 0
      OnClick = btnAplicarClick
    end
    object btnCerrar: TBitBtn
      Left = 747
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = btnCerrarClick
    end
    object edNota: TEdit
      Left = 172
      Top = 7
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 784
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 736
    Top = 32
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 680
    Top = 3
    object ClientDataSet1FECHA_CORTE: TDateField
      DisplayWidth = 22
      FieldName = 'FECHA_CORTE'
      Origin = '"col$evaluacion"."FECHA_CORTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSet1ID_AGENCIA: TIntegerField
      DisplayWidth = 18
      FieldName = 'ID_AGENCIA'
      Origin = '"col$evaluacion"."ID_AGENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSet1ID_COLOCACION: TStringField
      DisplayWidth = 29
      FieldName = 'ID_COLOCACION'
      Origin = '"col$evaluacion"."ID_COLOCACION"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 11
    end
    object ClientDataSet1CAPITAL_ANTERIOR: TBCDField
      DisplayWidth = 23
      FieldName = 'CAPITAL_ANTERIOR'
      Origin = '"col$evaluacion"."CAPITAL_ANTERIOR"'
      Precision = 18
      Size = 3
    end
    object ClientDataSet1CAPITAL_NUEVO: TBCDField
      DisplayWidth = 21
      FieldName = 'CAPITAL_NUEVO'
      Origin = '"col$evaluacion"."CAPITAL_NUEVO"'
      Precision = 18
      Size = 3
    end
    object ClientDataSet1CATEGORIA: TStringField
      DisplayWidth = 7
      FieldName = 'CATEGORIA'
      Origin = '"col$evaluacion"."CATEGORIA"'
      Size = 1
    end
    object ClientDataSet1EVALUACION: TStringField
      DisplayWidth = 5
      FieldName = 'EVALUACION'
      Origin = '"col$evaluacion"."EVALUACION"'
      Size = 1
    end
    object ClientDataSet1SALDO: TBCDField
      DisplayWidth = 21
      FieldName = 'SALDO'
      Origin = '"col$evaluacion"."SALDO"'
      Required = True
      Precision = 18
      Size = 3
    end
    object ClientDataSet1PORCENTAJE: TFloatField
      DisplayWidth = 14
      FieldName = 'PORCENTAJE'
      Origin = '"col$evaluacion"."PORCENTAJE"'
    end
    object ClientDataSet1CLASIFICACION: TIntegerField
      FieldName = 'CLASIFICACION'
      Origin = '"col$evaluacion"."CLASIFICACION"'
    end
    object ClientDataSet1GARANTIA: TIntegerField
      FieldName = 'GARANTIA'
      Origin = '"col$evaluacion"."GARANTIA"'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 648
    Top = 3
  end
  object IBQRangoProv: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'SELECT * FROM "col$porccausacion" p WHERE p.ID_CLASIFICACION = :' +
        'ID_CLASIFICACION and p.ID_GARANTIA = :ID_GARANTIA and p.ID_EDAD ' +
        '= :ID_EDAD')
    Left = 704
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CLASIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GARANTIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_EDAD'
        ParamType = ptUnknown
      end>
  end
  object IBQEvaluacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'SELECT * FROM "col$evaluacion" e WHERE e.FECHA_CORTE = :FECHA_CO' +
        'RTE')
    Left = 752
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
        ParamType = ptUnknown
      end>
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = IBQEvaluacion
    Constraints = True
    Left = 712
  end
  object IBSQL1: TIBSQL
    Left = 680
    Top = 32
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 760
    Top = 32
  end
end
