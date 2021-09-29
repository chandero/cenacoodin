object frmTarjetaSinMovimiento: TfrmTarjetaSinMovimiento
  Left = 292
  Top = 222
  Width = 588
  Height = 311
  Caption = 'Reporte de Tarjetas sin Movimiento'
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
    Width = 384
    Height = 36
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 11
      Width = 74
      Height = 13
      Caption = 'Fecha Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 185
      Top = 11
      Width = 67
      Height = 13
      Caption = 'Fecha Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtFecha1: TDateTimePicker
      Left = 81
      Top = 8
      Width = 102
      Height = 21
      CalAlignment = dtaLeft
      Date = 40788.6524379861
      Time = 40788.6524379861
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtFecha2: TDateTimePicker
      Left = 256
      Top = 8
      Width = 102
      Height = 21
      CalAlignment = dtaLeft
      Date = 40788.6524379861
      Time = 40788.6524379861
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 384
    Top = 0
    Width = 97
    Height = 161
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 10
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Consultar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object Button1: TButton
      Left = 10
      Top = 31
      Width = 75
      Height = 25
      Caption = '&Reporte'
      Enabled = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 10
      Top = 88
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 2
      OnClick = Button2Click
    end
    object BitBtn2: TBitBtn
      Left = 10
      Top = 59
      Width = 75
      Height = 25
      Caption = '&Aplicar'
      Enabled = False
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 35
    Width = 382
    Height = 125
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ASOCIADO'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TARJETA'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAA'
        Width = 54
        Visible = True
      end>
  end
  object Button3: TButton
    Left = 168
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      '')
    Left = 392
    Top = 184
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 472
    Top = 200
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = cdTarjeta
    Left = 424
    Top = 184
  end
  object JvProgres: TJvProgressDlg
    Text = 'Espere un Momento....'
    StayOnTop = False
    Left = 480
    Top = 176
  end
  object cdTarjeta: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 56
    Data = {
      890000009619E0BD01000000180000000600000000000300000089000841534F
      434941444F020049000000010005574944544802000200FF00075441524A4554
      410100490000000100055749445448020002001300064355454E544104000100
      00000000045449504F0400010000000000024447040001000000000006464543
      48414104000600000000000000}
    object cdTarjetaASOCIADO: TStringField
      FieldName = 'ASOCIADO'
      Size = 255
    end
    object cdTarjetaTARJETA: TStringField
      FieldName = 'TARJETA'
      Size = 19
    end
    object cdTarjetaCUENTA: TIntegerField
      FieldName = 'CUENTA'
    end
    object cdTarjetaTIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object cdTarjetaDG: TIntegerField
      FieldName = 'DG'
    end
    object cdTarjetaFECHAA: TDateField
      FieldName = 'FECHAA'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdTarjeta
    Left = 512
    Top = 120
  end
end
