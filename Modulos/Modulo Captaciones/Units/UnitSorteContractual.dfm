object frmSorteoContractual: TfrmSorteoContractual
  Left = 336
  Top = 128
  Width = 736
  Height = 475
  Caption = 'Sorteo Contractual'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 705
    Height = 41
    Caption = 'Informaci'#243'n '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    object edPeriodo: TComboBox
      Left = 52
      Top = 13
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'Seleccione el Periodo'
      OnChange = edPeriodoChange
      Items.Strings = (
        'Enero'
        'Febrero'
        'Marzo'
        'Abril'
        'Mayo'
        'Junio'
        'Julio'
        'Agosto'
        'Septiembre'
        'Octubre'
        'Noviembre'
        'Diciembre')
    end
    object btnSorteo: TBitBtn
      Left = 208
      Top = 11
      Width = 193
      Height = 25
      Caption = 'Procesar Contractuales V'#225'lidos'
      Enabled = False
      TabOrder = 1
      OnClick = btnSorteoClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F0000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
        FF4FFFFFFFFFFFFFC0C0FFFFFF44FFFFFFFFFFFFC0C0FFFFFF444FFFFFFFFFFF
        C0C0FFFFFF4444FFFFFFFFFFC0C0FFFFFF44444FFFFFFFFFC0C0FFFFFF444444
        FFFFFFFFC0C0FFFFFF4444444FFFFFFFC0C0FFFFFF444444FFFFFFFFC0C0FFFF
        FF44444FFFFFFFFFC0C0FFFFFF4444FFFFFFFFFFC0C0FFFFFF444FFFFFFFFFFF
        C0C0FFFFFF44FFFFFFFFFFFFC0C0FFFFFF4FFFFFFFFFFFFFC0C0FFFFFFFFFFFF
        FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
        FFFFFFFFFFFFFFFFC0C0}
    end
    object btnExportar: TBitBtn
      Left = 600
      Top = 11
      Width = 100
      Height = 25
      Caption = 'Exportar A Excel'
      Enabled = False
      TabOrder = 2
      OnClick = btnExportarClick
    end
    object btnDoSorteo: TBitBtn
      Left = 408
      Top = 11
      Width = 89
      Height = 25
      Caption = 'Realizar Sorteo'
      Enabled = False
      TabOrder = 3
      OnClick = btnDoSorteoClick
    end
  end
  object DBGasociado: TDBGrid
    Left = 0
    Top = 88
    Width = 705
    Height = 249
    DataSource = DSasociado
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CSC'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOCUMENTO'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ASOCIADO'
        Width = 405
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIA'
        Width = 41
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 344
    Width = 705
    Height = 41
    Caption = 'Ganador del Sorteo'
    TabOrder = 2
    object Label2: TLabel
      Left = 10
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Asociado'
    end
    object Label3: TLabel
      Left = 526
      Top = 15
      Width = 34
      Height = 13
      Caption = 'Cuenta'
    end
    object edAsociadoGanador: TEdit
      Left = 61
      Top = 13
      Width = 412
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object edCuentaGanador: TEdit
      Left = 571
      Top = 12
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 728
    Height = 33
    Align = alBottom
    Color = clBlue
    TabOrder = 3
    object btnCerrar: TBitBtn
      Left = 638
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
      Glyph.Data = {
        AA040000424DAA04000000000000360000002800000014000000130000000100
        18000000000074040000CE0E0000D80E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080
        000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF808080FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF00008000008000
        0080808080FFFFFFFFFFFFFFFFFF0000FF000080000080808080FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000800000800000800000
        80808080FFFFFF0000FF000080000080000080000080808080FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080000080000080000080
        808080000080000080000080000080000080808080FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF00008000008000008000008000
        0080000080000080000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000800000800000800000800000
        80000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000080000080000080000080000080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0000FF000080000080000080000080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0000FF000080000080000080000080000080808080FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF00
        0080000080000080808080000080000080000080808080FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000800000800000
        80808080FFFFFF0000FF000080000080000080808080FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080000080808080FFFFFF
        FFFFFFFFFFFF0000FF000080000080000080808080FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF0000FF000080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FF0000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 42
    Width = 705
    Height = 41
    Caption = 'Validando Asociado'
    TabOrder = 4
    object Label4: TLabel
      Left = 10
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Asociado'
    end
    object Label5: TLabel
      Left = 526
      Top = 15
      Width = 34
      Height = 13
      Caption = 'Cuenta'
    end
    object edAsociado: TEdit
      Left = 61
      Top = 13
      Width = 412
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object edCuenta: TEdit
      Left = 571
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object DSasociado: TDataSource
    DataSet = CDSasociado
    Left = 48
    Top = 112
  end
  object CDSasociado: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CSC'
        DataType = ftInteger
      end
      item
        Name = 'CUENTA'
        DataType = ftInteger
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ASOCIADO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DIA'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 80
    Top = 128
    Data = {
      7C0000009619E0BD0100000018000000050000000000030000007C0003435343
      0400010000000000064355454E5441040001000000000009444F43554D454E54
      4F01004900000001000557494454480200020032000841534F434941444F0100
      49000000010005574944544802000200C8000344494104000100000000000000}
    object CDSasociadoCSC: TIntegerField
      FieldName = 'CSC'
    end
    object CDSasociadoCUENTA: TIntegerField
      DisplayWidth = 10
      FieldName = 'CUENTA'
    end
    object CDSasociadoDOCUMENTO: TStringField
      DisplayWidth = 21
      FieldName = 'DOCUMENTO'
      Size = 50
    end
    object CDSasociadoASOCIADO: TStringField
      DisplayWidth = 240
      FieldName = 'ASOCIADO'
      Size = 200
    end
    object CDSasociadoDIA: TIntegerField
      DisplayWidth = 12
      FieldName = 'DIA'
    end
  end
  object IBQasociado: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 120
    Top = 88
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 152
    Top = 88
  end
  object IBQpersona: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 16
    Top = 208
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 48
    Top = 208
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 80
    Top = 208
  end
  object IBSQL4: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    Left = 48
    Top = 248
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 152
    Top = 136
  end
  object SD1: TSaveDialog
    Left = 16
    Top = 168
  end
end
