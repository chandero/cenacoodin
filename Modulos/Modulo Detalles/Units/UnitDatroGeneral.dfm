object FrmDatoGeneral: TFrmDatoGeneral
  Left = 234
  Top = 162
  Width = 289
  Height = 254
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Reporte General'
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
    Left = 0
    Top = 0
    Width = 281
    Height = 63
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 13
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label2: TLabel
      Left = 6
      Top = 38
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object DbTipo: TDBLookupComboBox
      Left = 40
      Top = 10
      Width = 228
      Height = 21
      KeyField = 'ID_TIPO'
      ListField = 'DESCRIPCION'
      ListSource = DataSource1
      TabOrder = 0
    end
    object DtFecha: TDateTimePicker
      Left = 40
      Top = 38
      Width = 125
      Height = 21
      CalAlignment = dtaLeft
      Date = 39920.375138588
      Time = 39920.375138588
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object ChTotal: TCheckBox
      Left = 163
      Top = 40
      Width = 102
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Total Entregados '
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 64
    Width = 281
    Height = 41
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 29
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Ejecutar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 173
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Nuevo'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 104
    Width = 281
    Height = 57
    Caption = 'Total Entregados'
    TabOrder = 2
    object lbGeneral: TLabel
      Left = 8
      Top = 17
      Width = 265
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 158
    Width = 281
    Height = 62
    Caption = 'Entregados Por'
    TabOrder = 3
    object lbUsuario: TLabel
      Left = 8
      Top = 17
      Width = 265
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM "gen$tipodetalle"')
    Left = 328
    Top = 48
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 360
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 312
    Top = 88
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 304
    Top = 184
  end
end
