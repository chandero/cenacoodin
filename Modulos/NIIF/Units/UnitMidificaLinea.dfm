object FrmModificaLinea: TFrmModificaLinea
  Left = 166
  Top = 159
  Width = 433
  Height = 283
  AutoSize = True
  Caption = 'Modificar Linea de Cr'#233'dito'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TabLineas: TPageControl
    Left = 0
    Top = 0
    Width = 425
    Height = 57
    ActivePage = TabModifica
    TabIndex = 0
    TabOrder = 0
    object TabModifica: TTabSheet
      Caption = '&Modificar Linea de Cr'#233'dito'
      OnShow = TabModificaShow
      object Label2: TLabel
        Left = 4
        Top = 8
        Width = 26
        Height = 13
        Caption = 'Linea'
      end
      object DBlinea: TDBLookupComboBox
        Left = 36
        Top = 5
        Width = 317
        Height = 21
        KeyField = 'ID_LINEA'
        ListField = 'DESCRIPCION_LINEA'
        ListSource = DSlinea
        TabOrder = 0
      end
    end
    object TabCrea: TTabSheet
      Caption = '&Crear lineas de Cr'#233'ditos'
      ImageIndex = 1
      object Label1: TLabel
        Left = 0
        Top = 8
        Width = 56
        Height = 13
        Caption = 'Descripci'#243'n'
      end
      object EDdescripcion: TEdit
        Left = 60
        Top = 5
        Width = 277
        Height = 21
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 56
    Width = 425
    Height = 193
    TabOrder = 1
  end
  object IBlinea: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "col$lineas".ID_LINEA,'
      '  "col$lineas".DESCRIPCION_LINEA'
      'FROM'
      ' "col$lineas"')
    Left = 360
    Top = 65528
  end
  object DSlinea: TDataSource
    DataSet = IBlinea
    Left = 392
  end
end
