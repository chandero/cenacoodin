object frmGestionarMedico: TfrmGestionarMedico
  Left = 331
  Top = 204
  Width = 585
  Height = 405
  AutoSize = True
  Caption = 'Gestionar Medicos'
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
    Width = 577
    Height = 281
    Caption = 'Listado General de M'#233'dicos'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 3
      Top = 14
      Width = 567
      Height = 263
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_PERSONA'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_MEDICO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ID_IDENTIFICACION'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Width = 235
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECCION'
          Width = 209
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 275
    Width = 473
    Height = 96
    Caption = 'Actualizar o Ingresar M'#233'dico'
    TabOrder = 1
    object Label1: TLabel
      Left = 315
      Top = 12
      Width = 79
      Height = 13
      Caption = 'Tipo Documento'
    end
    object Label2: TLabel
      Left = 11
      Top = 12
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label3: TLabel
      Left = 157
      Top = 49
      Width = 45
      Height = 13
      Caption = 'Direcci'#243'n'
    end
    object Label4: TLabel
      Left = 11
      Top = 49
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object EdNombre: TEdit
      Left = 11
      Top = 26
      Width = 304
      Height = 21
      TabOrder = 0
    end
    object EdDireccion: TEdit
      Left = 158
      Top = 63
      Width = 308
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object DBLCBTipoDocumento: TDBLookupComboBox
      Left = 319
      Top = 26
      Width = 147
      Height = 21
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DSTiposDocumento
      TabOrder = 1
    end
    object EdNumero: TEdit
      Left = 11
      Top = 63
      Width = 145
      Height = 21
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 472
    Top = 280
    Width = 105
    Height = 90
    Caption = 'Panel1'
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 16
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Aplicar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 31
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 59
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object DataSource1: TDataSource
    DataSet = IbMedicos
    Left = 136
    Top = 120
  end
  object IbMedicos: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "fun$medicos".ID_PERSONA,'
      '  "fun$medicos".ID_MEDICO,'
      '  "fun$medicos".ID_IDENTIFICACION,'
      '  "fun$medicos".NOMBRE,'
      '  "fun$medicos".DIRECCION'
      'FROM'
      '  "fun$medicos"')
    Left = 352
    Top = 99
  end
  object IBQTiposDocumentos: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 66
    Top = 38
  end
  object DSTiposDocumento: TDataSource
    DataSet = IBQTiposDocumentos
    Left = 38
    Top = 38
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 264
    Top = 176
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 128
    Top = 40
  end
end
