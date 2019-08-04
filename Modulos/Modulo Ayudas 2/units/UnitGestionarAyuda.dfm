object FrmGestionarAyuda: TFrmGestionarAyuda
  Left = 261
  Top = 132
  Width = 490
  Height = 265
  AutoSize = True
  Caption = 'Gestionar Ayudas'
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
    Left = 1
    Top = 0
    Width = 417
    Height = 55
    Caption = 'Informaci'#243'n Ayudas'
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 30
      Height = 13
      Caption = 'Ayuda'
    end
    object Label2: TLabel
      Left = 188
      Top = 11
      Width = 57
      Height = 13
      Caption = 'Valor Fondo'
    end
    object Label3: TLabel
      Left = 263
      Top = 11
      Width = 64
      Height = 13
      Caption = 'Valor Copago'
    end
    object dbAyuda: TDBLookupComboBox
      Left = 9
      Top = 26
      Width = 179
      Height = 21
      KeyField = 'ID_AYUDA'
      ListField = 'DESCRIPCION'
      ListSource = DsAyudas
      TabOrder = 0
      OnEnter = dbAyudaEnter
      OnExit = dbAyudaExit
      OnKeyPress = dbAyudaKeyPress
    end
    object jvFondo: TJvCurrencyEdit
      Left = 188
      Top = 25
      Width = 74
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 1
      HasMaxValue = False
      HasMinValue = False
    end
    object jvCopago: TJvCurrencyEdit
      Left = 263
      Top = 25
      Width = 81
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 2
      HasMaxValue = False
      HasMinValue = False
    end
    object bitActualizar: TBitBtn
      Left = 349
      Top = 24
      Width = 61
      Height = 22
      Caption = '&Actualizar'
      Enabled = False
      TabOrder = 3
      OnClick = bitActualizarClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 51
    Width = 418
    Height = 180
    Caption = 'Informaci'#243'n M'#233'dicos Asignados'
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 139
      Width = 75
      Height = 13
      Caption = 'Agregar Medico'
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 406
      Height = 120
      DataSource = dsMedAyuda
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Caption = 'Medico/Instituci'#243'n'
          Width = 342
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_MEDICO'
          Visible = False
        end>
    end
    object dbMedico: TDBLookupComboBox
      Left = 8
      Top = 153
      Width = 346
      Height = 21
      KeyField = 'ID_MEDICO'
      ListField = 'NOMBRE'
      ListSource = dsMedico
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 356
      Top = 152
      Width = 52
      Height = 22
      Caption = 'A&gregar'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object Panel1: TPanel
    Left = 418
    Top = 4
    Width = 64
    Height = 227
    TabOrder = 2
    object BitBtn3: TBitBtn
      Left = 4
      Top = 10
      Width = 52
      Height = 22
      Caption = '&Salir'
      TabOrder = 0
      OnClick = BitBtn3Click
    end
  end
  object IbAyudas: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  *'
      'FROM'
      '  "fun$ayudas"')
    Left = 512
    Top = 8
  end
  object DsAyudas: TDataSource
    DataSet = IbAyudas
    Left = 544
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 472
    Top = 240
    object Eliminar1: TMenuItem
      Caption = 'Eliminar'
      OnClick = Eliminar1Click
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 576
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 512
    Top = 48
  end
  object IbMedico: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "fun$medicos".ID_MEDICO,'
      '  "fun$medicos".NOMBRE'
      'FROM'
      '  "fun$medicos"')
    Left = 512
    Top = 88
  end
  object dsMedico: TDataSource
    DataSet = IbMedico
    Left = 552
    Top = 84
  end
  object IBMedAyudas: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "fun$medicos".NOMBRE,'
      '  "fun$medayu".ID_MEDICO'
      'FROM'
      '  "fun$medicos"'
      
        '  INNER JOIN "fun$medayu" ON ("fun$medicos".ID_MEDICO = "fun$med' +
        'ayu".ID_MEDICO)'
      'WHERE'
      '  "fun$medayu".ID_AYUDA = :ID_AYUDA')
    Left = 512
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AYUDA'
        ParamType = ptUnknown
      end>
  end
  object dsMedAyuda: TDataSource
    DataSet = IBMedAyudas
    Left = 552
    Top = 152
  end
end
