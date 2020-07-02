object frmReversoNormalizar: TfrmReversoNormalizar
  Left = 240
  Top = 31
  Width = 1036
  Height = 669
  Caption = 'Reverso Normalizaci'#243'n de Colocaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 53
    Height = 13
    Caption = 'Colocaci'#243'n'
  end
  object Label6: TLabel
    Left = 8
    Top = 35
    Width = 93
    Height = 13
    Caption = 'D'#237'as Gracia Actual:'
  end
  object Label7: TLabel
    Left = 184
    Top = 35
    Width = 124
    Height = 13
    Caption = 'D'#237'as Gracia Al Normalizar:'
  end
  object edColocacion: TEdit
    Left = 68
    Top = 6
    Width = 133
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object edAsociado: TEdit
    Left = 209
    Top = 6
    Width = 400
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 57
    Width = 297
    Height = 57
    Caption = 'Fechas Actuales'
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Capital'
    end
    object Label3: TLabel
      Left = 146
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Inter'#233's'
    end
    object edFCapital: TDateTimePicker
      Left = 56
      Top = 16
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 44013.7269891667
      Time = 44013.7269891667
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object edFInteres: TDateTimePicker
      Left = 184
      Top = 16
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 44013.7269891667
      Time = 44013.7269891667
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 312
    Top = 57
    Width = 297
    Height = 57
    Caption = 'Fechas Al Normalizar'
    TabOrder = 3
    object Label4: TLabel
      Left = 16
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Capital'
    end
    object Label5: TLabel
      Left = 146
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Inter'#233's'
    end
    object edFNCapital: TDateTimePicker
      Left = 56
      Top = 16
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 44013.7269891667
      Time = 44013.7269891667
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object edFNInteres: TDateTimePicker
      Left = 184
      Top = 16
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 44013.7269891667
      Time = 44013.7269891667
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 117
    Width = 505
    Height = 465
    Caption = 'Plan de Pagos Actual'
    TabOrder = 4
    object DBGplan: TDBGrid
      Left = 2
      Top = 15
      Width = 501
      Height = 448
      Align = alClient
      DataSource = DSplan
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGplanDrawColumnCell
    end
  end
  object GroupBox4: TGroupBox
    Left = 520
    Top = 117
    Width = 505
    Height = 465
    Caption = 'Plan de Pagos Al Normalizar'
    TabOrder = 5
    object DBGNplan: TDBGrid
      Left = 2
      Top = 15
      Width = 501
      Height = 448
      Align = alClient
      DataSource = DSNplan
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGNplanDrawColumnCell
    end
  end
  object btnCerrar: TBitBtn
    Left = 949
    Top = 588
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 6
    OnClick = btnCerrarClick
  end
  object btnReverso: TBitBtn
    Left = 9
    Top = 588
    Width = 75
    Height = 25
    Caption = 'Reverso'
    TabOrder = 7
    OnClick = btnReversoClick
  end
  object edDiasPago: TEdit
    Left = 104
    Top = 32
    Width = 70
    Height = 21
    ReadOnly = True
    TabOrder = 8
  end
  object edPeriodoGracia: TEdit
    Left = 312
    Top = 32
    Width = 70
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object DSplan: TDataSource
    DataSet = CDSplan
    Left = 24
    Top = 208
  end
  object DSNplan: TDataSource
    DataSet = CDSNplan
    Left = 552
    Top = 232
  end
  object CDSplan: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 152
    Data = {
      AC0000009619E0BD010000001800000005000000000003000000AC000C43554F
      54415F4E554D45524F04000100000000000D46454348415F415F504147415204
      000600000000000F4341504954414C5F415F5041474152080004000000010007
      535542545950450200490006004D6F6E6579000F494E54455245535F415F5041
      474152080004000000010007535542545950450200490006004D6F6E65790006
      50414741444102000300000000000000}
    object CDSplanCUOTA_NUMERO: TIntegerField
      FieldName = 'CUOTA_NUMERO'
    end
    object CDSplanFECHA_A_PAGAR: TDateField
      FieldName = 'FECHA_A_PAGAR'
    end
    object CDSplanCAPITAL_A_PAGAR: TCurrencyField
      FieldName = 'CAPITAL_A_PAGAR'
    end
    object CDSplanINTERES_A_PAGAR: TCurrencyField
      FieldName = 'INTERES_A_PAGAR'
    end
    object CDSplanPAGADA: TBooleanField
      FieldName = 'PAGADA'
      OnGetText = CDSplanPAGADAGetText
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Left = 80
    Top = 184
  end
  object IBQplan: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'SELECT * FROM "col$tablaliquidacion" WHERE ID_COLOCACION = :ID_C' +
        'OLOCACION ORDER BY CUOTA_NUMERO ASC')
    Left = 80
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_COLOCACION'
        ParamType = ptUnknown
      end>
  end
  object IBQcolocacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'SELECT cc.DIAS_PAGO, cc.FECHA_CAPITAL, cc.FECHA_INTERES, gp.NOMB' +
        'RE || '#39' '#39' || gp.PRIMER_APELLIDO || '#39' '#39' || gp.SEGUNDO_APELLIDO AS' +
        ' ASOCIADO FROM "col$colocacion" cc '
      
        'LEFT JOIN "gen$persona" gp ON gp.ID_IDENTIFICACION = cc.ID_IDENT' +
        'IFICACION AND gp.ID_PERSONA = cc.ID_PERSONA '
      'WHERE cc.ID_COLOCACION  = :ID_COLOCACION')
    Left = 80
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_COLOCACION'
        ParamType = ptUnknown
      end>
  end
  object CDSNplan: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CUOTA_NUMERO'
        DataType = ftInteger
      end
      item
        Name = 'FECHA_A_PAGAR'
        DataType = ftDate
      end
      item
        Name = 'CAPITAL_A_PAGAR'
        DataType = ftCurrency
      end
      item
        Name = 'INTERES_A_PAGAR'
        DataType = ftCurrency
      end
      item
        Name = 'PAGADA'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 560
    Top = 192
    Data = {
      AC0000009619E0BD010000001800000005000000000003000000AC000C43554F
      54415F4E554D45524F04000100000000000D46454348415F415F504147415204
      000600000000000F4341504954414C5F415F5041474152080004000000010007
      535542545950450200490006004D6F6E6579000F494E54455245535F415F5041
      474152080004000000010007535542545950450200490006004D6F6E65790006
      50414741444102000300000000000000}
    object CDSNplanCUOTA_NUMERO: TIntegerField
      FieldName = 'CUOTA_NUMERO'
    end
    object CDSNplanFECHA_A_PAGAR: TDateField
      FieldName = 'FECHA_A_PAGAR'
    end
    object CDSNplanCAPITAL_A_PAGAR: TCurrencyField
      FieldName = 'CAPITAL_A_PAGAR'
    end
    object CDSNplanINTERES_A_PAGAR: TCurrencyField
      FieldName = 'INTERES_A_PAGAR'
    end
    object CDSNplanPAGADA: TBooleanField
      FieldName = 'PAGADA'
      OnGetText = CDSNplanPAGADAGetText
    end
  end
  object IBQnormalizar: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'UPDATE "col$tablaliquidacion" SET FECHA_A_PAGAR = :FECHA_A_PAGAR' +
        ' WHERE ID_COLOCACION = :ID_COLOCACION AND'
      'CUOTA_NUMERO = :CUOTA_NUMERO')
    Left = 584
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_A_PAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COLOCACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUOTA_NUMERO'
        ParamType = ptUnknown
      end>
  end
end
