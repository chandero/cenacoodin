object FrmRegistroIncapacitados: TFrmRegistroIncapacitados
  Left = 314
  Top = 228
  Width = 487
  Height = 385
  AutoSize = True
  Caption = 'Registro Incapacitados'
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 396
    Height = 73
    Caption = 'Informaci'#243'n Asociado'
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 20
      Width = 44
      Height = 13
      Caption = 'Tipo Doc'
    end
    object Label2: TLabel
      Left = 236
      Top = 22
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label3: TLabel
      Left = 8
      Top = 47
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object JvNumero: TJvEdit
      Left = 276
      Top = 18
      Width = 115
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
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 1
      OnExit = JvNumeroExit
      OnKeyPress = dbTiposKeyPress
    end
    object JvNombre: TJvEdit
      Left = 54
      Top = 46
      Width = 337
      Height = 21
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 2
    end
    object dbTipos: TDBLookupComboBox
      Left = 54
      Top = 18
      Width = 181
      Height = 21
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DataSource1
      TabOrder = 0
      OnKeyPress = dbTiposKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 70
    Width = 396
    Height = 59
    Caption = 'Informaci'#243'n Estado'
    Enabled = False
    TabOrder = 1
    object Label4: TLabel
      Left = 5
      Top = 25
      Width = 66
      Height = 13
      Caption = 'Estado Actual'
    end
    object Label5: TLabel
      Left = 202
      Top = 26
      Width = 68
      Height = 13
      Caption = 'Nuevo Estado'
    end
    object cbActual: TComboBox
      Left = 77
      Top = 24
      Width = 110
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'NO MARCADO'
      Items.Strings = (
        'NO MARCADO'
        'MARCADO')
    end
    object cbNuevo: TComboBox
      Left = 275
      Top = 24
      Width = 110
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'NO MARCADO'
      Items.Strings = (
        'NO MARCADO'
        'MARCADO')
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 125
    Width = 395
    Height = 82
    Caption = 'Observaci'#243'n'
    TabOrder = 2
    object mObservacion: TMemo
      Left = 3
      Top = 14
      Width = 388
      Height = 64
      TabOrder = 0
      OnExit = mObservacionExit
      OnKeyPress = dbTiposKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 200
    Width = 395
    Height = 151
    Caption = 'Log'
    Enabled = False
    TabOrder = 3
    object mLog: TMemo
      Left = 3
      Top = 14
      Width = 385
      Height = 131
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 395
    Top = 5
    Width = 84
    Height = 346
    TabOrder = 4
    object BitBtn1: TBitBtn
      Left = 5
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Aplicar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 5
      Top = 67
      Width = 75
      Height = 25
      Caption = 'C&errar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 6
      Top = 36
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object DataSource1: TDataSource
    DataSet = IBTipos
    Left = 504
    Top = 88
  end
  object IBTipos: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 560
    Top = 80
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$incapacitado".ESTADO,'
      '  "gen$incapacitado".LOG'
      'FROM'
      '  "gen$incapacitado"'
      'WHERE'
      '  "gen$incapacitado".ID_IDENTIFICACION = :IDIDENTIFICACION AND '
      '  "gen$incapacitado".ID_PERSONA = :IDPERSONA')
    Left = 624
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDIDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPERSONA'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 696
    Top = 136
  end
end
