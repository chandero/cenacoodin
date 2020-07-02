object FrmMantenimientoLineas: TFrmMantenimientoLineas
  Left = 352
  Top = 73
  Width = 489
  Height = 478
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Mantenimiento de Lineas'
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
    Width = 481
    Height = 378
    Caption = 'Lineas'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 14
      Width = 471
      Height = 359
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIPCION_LINEA'
          Title.Caption = 'DESCRIPCION'
          Width = 166
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TASA'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PUNTOS_ADICIONALES'
          Title.Caption = 'PUNTOS'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESESTADO'
          Title.Caption = 'ESTADO'
          Width = 81
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 380
    Width = 369
    Height = 64
    TabOrder = 1
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label2: TLabel
      Left = 5
      Top = 39
      Width = 24
      Height = 13
      Caption = 'Tasa'
    end
    object Label3: TLabel
      Left = 112
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Puntos'
    end
    object Label4: TLabel
      Left = 227
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object edDescripcion: TEdit
      Left = 63
      Top = 6
      Width = 298
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object JvTasa: TJvFloatEdit
      Left = 34
      Top = 37
      Width = 73
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
      TabOrder = 1
      OnKeyPress = JvTasaKeyPress
    end
    object JvPuntos: TJvFloatEdit
      Left = 149
      Top = 36
      Width = 73
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
      OnKeyPress = JvTasaKeyPress
    end
    object cbEstado: TComboBox
      Left = 264
      Top = 37
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 3
      Text = 'ACTIVO'
      OnKeyPress = JvTasaKeyPress
      Items.Strings = (
        'INACTIVO'
        'ACTIVO')
    end
  end
  object Panel2: TPanel
    Left = 369
    Top = 379
    Width = 112
    Height = 65
    TabOrder = 2
    object bActualizar: TButton
      Left = 16
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      Enabled = False
      TabOrder = 0
      OnClick = bActualizarClick
    end
    object bCerrar: TButton
      Left = 17
      Top = 36
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = bCerrarClick
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 211
    Width = 281
    Height = 12
    TabOrder = 3
    Visible = False
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    AfterScroll = IBQuery1AfterScroll
    SQL.Strings = (
      'SELECT'
      '  "col$lineas".ID_LINEA,'
      '  "col$lineas".DESCRIPCION_LINEA,'
      '  "col$lineas".TASA,'
      '  "col$lineas".PUNTOS_ADICIONALES,'
      '  "col$lineas".ESTADO,'
      
        '  CASE WHEN "col$lineas".ESTADO = 1 THEN '#39'ACTIVO'#39' ELSE '#39'INACTIVO' +
        #39' END AS DESESTADO'
      'FROM'
      '  "col$lineas"')
    Left = 48
    Top = 88
    object IBQuery1ID_LINEA: TSmallintField
      FieldName = 'ID_LINEA'
      Origin = '"col$lineas"."ID_LINEA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQuery1DESCRIPCION_LINEA: TIBStringField
      FieldName = 'DESCRIPCION_LINEA'
      Origin = '"col$lineas"."DESCRIPCION_LINEA"'
      Size = 50
    end
    object IBQuery1TASA: TFloatField
      FieldName = 'TASA'
      Origin = '"col$lineas"."TASA"'
    end
    object IBQuery1PUNTOS_ADICIONALES: TFloatField
      FieldName = 'PUNTOS_ADICIONALES'
      Origin = '"col$lineas"."PUNTOS_ADICIONALES"'
    end
    object IBQuery1ESTADO: TSmallintField
      FieldName = 'ESTADO'
      Origin = '"col$lineas"."ESTADO"'
    end
    object IBQuery1DESESTADO: TIBStringField
      FieldName = 'DESESTADO'
      ProviderFlags = []
      FixedChar = True
      Size = 8
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 48
    Top = 152
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'UPDATE'
      '  "col$lineas"'
      'SET'
      '  TASA = :TASA,'
      '  PUNTOS_ADICIONALES = :PUNTOS_ADICIONALES,'
      '  ESTADO = :ESTADO'
      'WHERE'
      '  "col$lineas".ID_LINEA = :ID_LINEA')
    Left = 48
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PUNTOS_ADICIONALES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_LINEA'
        ParamType = ptUnknown
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 80
    object Logdecambios1: TMenuItem
      Caption = 'Log de cambios'
      OnClick = Logdecambios1Click
    end
  end
end
