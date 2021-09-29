object FrmRecuperaEstudio: TFrmRecuperaEstudio
  Left = 288
  Top = 251
  Width = 534
  Height = 108
  BorderIcons = [biSystemMenu]
  Caption = 'Recuperar Informe Ente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 33
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 6
      Width = 80
      Height = 13
      Caption = 'N'#250'mero Solicitud'
    end
    object Label2: TLabel
      Left = 160
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Ente:'
    end
    object Msolicitud: TMaskEdit
      Left = 88
      Top = 4
      Width = 69
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '          '
    end
    object cbNombre: TComboBox
      Left = 187
      Top = 4
      Width = 246
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'GERENTE GENERAL'
      Items.Strings = (
        'GERENTE GENERAL'
        'GERENTE SUPLENTE 1'
        'GERENTE SUPLENTE 2')
    end
  end
  object Panel2: TPanel
    Left = 435
    Top = 0
    Width = 91
    Height = 33
    TabOrder = 1
    object Button1: TButton
      Left = 7
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Reporte'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 33
    Width = 526
    Height = 41
    TabOrder = 2
    object Button2: TButton
      Left = 318
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 147
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Otro'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object IBQuery4: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 272
    Top = 120
  end
  object CDestado: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'aprobado'
        DataType = ftSmallint
      end
      item
        Name = 'negado'
        DataType = ftSmallint
      end
      item
        Name = 'aplazado'
        DataType = ftSmallint
      end
      item
        Name = 'bancoldex'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 391
    Top = 112
    Data = {
      5D0000009619E0BD0100000018000000040000000000030000005D0008617072
      6F6261646F0200010000000000066E656761646F02000100000000000861706C
      617A61646F02000100000000000962616E636F6C646578020001000000000000
      00}
    object CDestadoaprobado: TSmallintField
      FieldName = 'aprobado'
    end
    object CDestadonegado: TSmallintField
      FieldName = 'negado'
    end
    object CDestadoaplazado: TSmallintField
      FieldName = 'aplazado'
    end
    object CDestadobancoldex: TSmallintField
      FieldName = 'bancoldex'
    end
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 200
    Top = 136
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = IBQuery1
    Left = 536
    Top = 128
  end
  object DataSource1: TDataSource
    Left = 752
    Top = 176
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'SELECT OBSERVACION FROM "col$observacion" WHERE ID_SOLICITUD = :' +
        'ID_SOLICITUD AND ID_OBSERVACION = :ID_OBSERVACION')
    Left = 168
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_OBSERVACION'
        ParamType = ptUnknown
      end>
  end
  object DataSource2: TDataSource
    DataSet = CDestado
    Left = 72
    Top = 168
  end
end
