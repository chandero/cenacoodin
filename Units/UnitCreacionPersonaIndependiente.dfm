object frmCreacionPersonaIndependiente: TfrmCreacionPersonaIndependiente
  Left = 352
  Top = 281
  BorderStyle = bsToolWindow
  Caption = 'Informaci'#243'n INDEPENDIENTE'
  ClientHeight = 142
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 68
    Width = 104
    Height = 13
    Caption = 'Fecha '#218'ltimo Balance'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 74
    Height = 13
    Caption = 'Ventas Anuales'
  end
  object Label4: TLabel
    Left = 8
    Top = 120
    Width = 107
    Height = 13
    Caption = 'N'#250'mero de Empleados'
  end
  object Label5: TLabel
    Left = 8
    Top = 40
    Width = 90
    Height = 13
    Caption = 'Descripci'#243'n Sector'
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 280
    Top = 64
    Width = 28
    Height = 28
  end
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 87
    Height = 13
    Caption = 'Sector Econ'#243'mico'
  end
  object edVentasAnuales: TJvCurrencyEdit
    Left = 120
    Top = 92
    Width = 121
    Height = 21
    Alignment = taRightJustify
    ReadOnly = False
    TabOrder = 2
    OnExit = edVentasAnualesExit
    Value = 1
    HasMaxValue = False
    HasMinValue = False
  end
  object edNumeroEmpleados: TJvIntegerEdit
    Left = 120
    Top = 116
    Width = 121
    Height = 21
    Alignment = taRightJustify
    ReadOnly = False
    TabOrder = 3
    OnExit = edNumeroEmpleadosExit
    Value = 0
    MaxValue = 0
    MinValue = 0
    HasMaxValue = False
    HasMinValue = False
  end
  object edDescripcion: TEdit
    Left = 119
    Top = 40
    Width = 215
    Height = 21
    TabOrder = 0
    OnExit = edDescripcionExit
  end
  object btnAceptar: TBitBtn
    Left = 248
    Top = 112
    Width = 89
    Height = 25
    Caption = '&Continuar'
    TabOrder = 4
    Kind = bkOK
  end
  object edFechaBalance: TDateTimePicker
    Left = 120
    Top = 66
    Width = 97
    Height = 21
    CalAlignment = dtaLeft
    Date = 39722.7432674421
    Time = 39722.7432674421
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    OnExit = DateTimePicker1Exit
  end
  object cbSector: TDBLookupComboBox
    Left = 119
    Top = 11
    Width = 217
    Height = 21
    DropDownWidth = 300
    KeyField = 'ID_SECTOR'
    ListField = 'DESCRIPCION'
    ListSource = dsSector
    TabOrder = 5
    OnClick = cbSectorClick
    OnExit = cbSectorExit
  end
  object IBTransaction1: TIBTransaction
    AllowAutoStart = False
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 272
    Top = 16
  end
  object qSector: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$tipossectorcomercial"')
    Left = 72
    Top = 16
  end
  object dsSector: TDataSource
    DataSet = qSector
    Left = 104
    Top = 16
  end
end
