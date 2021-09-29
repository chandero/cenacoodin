object frmEvaluacionCartera: TfrmEvaluacionCartera
  Left = 314
  Top = 132
  Width = 344
  Height = 152
  Caption = 'Evaluaci'#243'n de Cartera'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 76
    Height = 13
    Caption = 'A'#241'o de Proceso'
  end
  object Label2: TLabel
    Left = 16
    Top = 35
    Width = 93
    Height = 13
    Caption = 'Periodo de Proceso'
  end
  object lblColocacion: TLabel
    Left = 8
    Top = 72
    Width = 53
    Height = 13
    Caption = 'Colocaci'#243'n'
  end
  object txtAnho: TMaskEdit
    Left = 120
    Top = 6
    Width = 49
    Height = 21
    AutoSize = False
    EditMask = '!9999;0;_'
    MaxLength = 4
    TabOrder = 0
  end
  object cbPeriodo: TComboBox
    Left = 120
    Top = 32
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 1
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
  object pbar: TProgressBar
    Left = 8
    Top = 96
    Width = 321
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 2
  end
  object btnProcesar: TBitBtn
    Left = 256
    Top = 5
    Width = 75
    Height = 25
    Caption = '&Procesar'
    TabOrder = 3
    OnClick = btnProcesarClick
  end
  object btnCerrar: TBitBtn
    Left = 256
    Top = 32
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 4
    OnClick = btnCerrarClick
  end
  object txtColocacion: TEdit
    Left = 72
    Top = 67
    Width = 169
    Height = 21
    AutoSize = False
    Enabled = False
    TabOrder = 5
  end
  object dbHandler: TIBDatabase
    LoginPrompt = False
    Left = 168
  end
  object trHandler: TIBTransaction
    Left = 200
  end
  object qrConsulta: TIBQuery
    Database = dbHandler
    Transaction = trHandler
    Left = 72
    Top = 8
  end
  object qrEvaluacion: TIBQuery
    Database = dbHandler
    Transaction = trHandler
    Left = 48
    Top = 8
  end
end
