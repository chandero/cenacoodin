object FrmCierreMes: TFrmCierreMes
  Left = 569
  Top = 236
  Width = 520
  Height = 325
  Caption = 'Procesos Autom'#225'ticos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 41
    Width = 191
    Height = 13
    Caption = 'Hora Ejecuci'#243'n Liquidaci'#243'n de Intereses'
  end
  object Label2: TLabel
    Left = 8
    Top = 68
    Width = 178
    Height = 13
    Caption = 'Hora Ejecuci'#243'n Causaci'#243'n de Cartera'
  end
  object Label3: TLabel
    Left = 8
    Top = 97
    Width = 105
    Height = 13
    Caption = 'N'#250'mero Notas a Crear'
  end
  object Label4: TLabel
    Left = 8
    Top = 6
    Width = 176
    Height = 26
    Caption = 'Hora Ejecuci'#243'n Liquidaci'#243'n Prorroga Cdat y Descuento Contractual'
    WordWrap = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 252
    Width = 512
    Height = 19
    Panels = <
      item
        Text = 'En Espera'
        Width = 380
      end
      item
        Alignment = taRightJustify
        Text = '17:12:12'
        Width = 100
      end
      item
        Alignment = taRightJustify
        Width = 2
      end>
    SimplePanel = False
  end
  object edHoraLiquidacion: TMaskEdit
    Left = 208
    Top = 40
    Width = 57
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = '22:00:00'
  end
  object btnHoraLiquidacion: TToggleButton
    Left = 269
    Top = 40
    Width = 25
    Height = 23
    Caption = 'E'
    TabOrder = 3
    OnClick = btnHoraLiquidacionClick
    GroupIndex = 0
  end
  object edHoraCausacion: TMaskEdit
    Left = 208
    Top = 68
    Width = 57
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Text = '23:00:00'
  end
  object btnHoraCausacion: TToggleButton
    Left = 269
    Top = 68
    Width = 25
    Height = 23
    Caption = 'E'
    TabOrder = 5
    OnClick = btnHoraCausacionClick
    GroupIndex = 0
  end
  object edNotas: TJvIntegerEdit
    Left = 120
    Top = 94
    Width = 41
    Height = 21
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 6
    Value = 35
    MaxValue = 0
    MinValue = 0
    HasMaxValue = False
    HasMinValue = False
    ClipBoardCommands = [caCopy]
  end
  object btnNotas: TToggleButton
    Left = 165
    Top = 94
    Width = 25
    Height = 23
    Caption = 'E'
    TabOrder = 7
    OnClick = btnNotasClick
    GroupIndex = 0
  end
  object edHoraDescuentoContractual: TMaskEdit
    Left = 208
    Top = 11
    Width = 57
    Height = 21
    ReadOnly = True
    TabOrder = 0
    Text = '01:00:00'
  end
  object btnHoraDescuentoContractual: TToggleButton
    Left = 269
    Top = 11
    Width = 25
    Height = 23
    Caption = 'E'
    TabOrder = 1
    OnClick = btnHoraDescuentoContractualClick
    GroupIndex = 0
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 96
    object Manuales1: TMenuItem
      Caption = 'Manuales'
      object LiquidacindeIntersdeCaptacin1: TMenuItem
        Caption = 'Liquidaci'#243'n de Inter'#233's de Captaci'#243'n'
        OnClick = LiquidacindeIntersdeCaptacin1Click
      end
      object CausacinyProvisindeCartera1: TMenuItem
        Caption = 'Causaci'#243'n y Provisi'#243'n de Cartera'
        OnClick = CausacinyProvisindeCartera1Click
      end
      object CausacinCdatAuto1: TMenuItem
        Caption = 'Causaci'#243'n Cdat Auto'
        Visible = False
        OnClick = CausacinCdatAuto1Click
      end
      object CausacinContractualAuto1: TMenuItem
        Caption = 'Causaci'#243'n Contractual Auto'
        Visible = False
        OnClick = CausacinContractualAuto1Click
      end
      object CausacinContractual1: TMenuItem
        Caption = 'Causaci'#243'n Contractual'
        OnClick = CausacinContractual1Click
      end
      object CausacionCdat1: TMenuItem
        Caption = 'Causacion Cdat'
        OnClick = CausacionCdat1Click
      end
    end
    object mnuAuto: TMenuItem
      Caption = 'Test Autom'#225'tico'
      object LiquidacionCdatAuto1: TMenuItem
        Caption = 'Liquidacion Cdat Auto'
        OnClick = LiquidacionCdatAuto1Click
      end
      object LiquidacionCaptacionAuto1: TMenuItem
        Caption = 'Liquidacion Captacion Auto'
        OnClick = LiquidacionCaptacionAuto1Click
      end
      object DescuentoContractual1: TMenuItem
        Caption = 'Descuento Contractual Auto'
        OnClick = DescuentoContractual1Click
      end
    end
    object mnuCausacionAuto: TMenuItem
      Caption = 'Causaci'#243'n Autom'#225'tico'
      Visible = False
      OnClick = mnuCausacionAutoClick
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 232
  end
  object IBQnotas: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 24
    Top = 120
  end
  object TimerVerificacionProductos: TTimer
    Interval = 300000
    OnTimer = TimerVerificacionProductosTimer
    Left = 40
    Top = 232
  end
  object IBQproducto: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTverificacion
    SQL.Strings = (
      
        'SELECT * FROM (SELECT mt.ID_AGENCIA, mt.ID_TIPO_CAPTACION, mt.NU' +
        'MERO_CUENTA, mt.DIGITO_CUENTA FROM "cap$maestrotitular" mt'
      'INNER JOIN "cap$maestro" m ON '
      '                              m.ID_AGENCIA = mt.ID_AGENCIA and'
      
        '                              m.ID_TIPO_CAPTACION = mt.ID_TIPO_C' +
        'APTACION and'
      
        '                              m.NUMERO_CUENTA = mt.NUMERO_CUENTA' +
        ' and'
      '                              m.DIGITO_CUENTA = mt.DIGITO_CUENTA'
      'WHERE mt.ID_IDENTIFICACION = :ID_IDENTIFICACION and '
      '      mt.ID_PERSONA = :ID_PERSONA and '
      '      mt.NUMERO_TITULAR = 1 and'
      '      m.ID_ESTADO = 1'
      'UNION ALL'
      
        'SELECT c.ID_AGENCIA, 7 as ID_TIPO_CAPTACION, c.ID_COLOCACION as ' +
        'NUMERO_CUENTA, 0 as DIGITO_CUENTA FROM "col$colocacion" c'
      'WHERE c.ID_IDENTIFICACION = :ID_IDENTIFICACION and'
      '      c.ID_PERSONA = :ID_PERSONA and'
      '      c.ID_ESTADO_COLOCACION IN (0,1,2,3)      '
      ') o      '
      'ORDER BY o.ID_TIPO_CAPTACION ASC')
    Left = 56
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end>
  end
  object IBQejecutar: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTverificacion
    Left = 88
    Top = 168
  end
  object IBTverificacion: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 24
    Top = 200
  end
  object CDSproducto: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'ID_TIPO_CAPTACION'
        DataType = ftInteger
      end
      item
        Name = 'DIGITO_CUENTA'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_CUENTA'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID_AGENCIA;ID_TIPO_CAPTACION;NUMERO_CUENTA;DIGITO_CUENTA'
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 168
    Data = {
      950000009619E0BD01000000180000000400000000000300000095000A49445F
      4147454E43494104000100000000001149445F5449504F5F434150544143494F
      4E04000100000000000D44494749544F5F4355454E544104000100000000000D
      4E554D45524F5F4355454E544101004900000001000557494454480200020014
      0001000D44454641554C545F4F524445520200820000000000}
    object CDSproductoID_AGENCIA: TIntegerField
      FieldName = 'ID_AGENCIA'
    end
    object CDSproductoID_TIPO_CAPTACION: TIntegerField
      FieldName = 'ID_TIPO_CAPTACION'
    end
    object CDSproductoDIGITO_CUENTA: TIntegerField
      FieldName = 'DIGITO_CUENTA'
    end
    object CDSproductoNUMERO_CUENTA: TStringField
      FieldName = 'NUMERO_CUENTA'
    end
  end
  object CDSpersona: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 136
    Data = {
      530000009619E0BD01000000180000000200000000000300000053001149445F
      4944454E54494649434143494F4E04000100000000000A49445F504552534F4E
      4101004900000001000557494454480200020014000000}
    object CDSpersonaID_IDENTIFICACION: TIntegerField
      FieldName = 'ID_IDENTIFICACION'
    end
    object CDSpersonaID_PERSONA: TStringField
      FieldName = 'ID_PERSONA'
    end
  end
  object IBQpersona: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTverificacion
    SQL.Strings = (
      
        'SELECT DISTINCT mt.ID_IDENTIFICACION, mt.ID_PERSONA FROM VIRTUAL' +
        '_CUENTA vc'
      
        'INNER JOIN "cap$maestrotitular" mt ON mt.ID_AGENCIA = vc.VICU_ID' +
        '_AGENCIA and mt.ID_TIPO_CAPTACION = vc.VICU_TIPO_CUENTA and mt.N' +
        'UMERO_CUENTA = vc.VICU_NUMERO_CUENTA and mt.DIGITO_CUENTA = vc.V' +
        'ICU_DIGITO_CUENTA and mt.NUMERO_TITULAR = 1'
      'WHERE vc.VICU_ESTADO = 0')
    Left = 24
    Top = 168
  end
  object IBQGuardar: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTverificacion
    Left = 88
    Top = 200
  end
  object IBTnotas: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 56
    Top = 120
  end
end
