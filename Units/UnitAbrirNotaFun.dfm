object FrmAbrirNotaFun: TFrmAbrirNotaFun
  Left = 317
  Top = 262
  Width = 464
  Height = 194
  AutoSize = True
  Caption = 'Abrir Nota Contable Fundaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 352
    Height = 59
    Caption = 'Informaci'#243'n Nota Contable'
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 16
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label2: TLabel
      Left = 135
      Top = 16
      Width = 101
      Height = 13
      Caption = 'Fecha Nota Contable'
    end
    object EdNota: TEdit
      Left = 4
      Top = 31
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object dtFechaCom: TDateTimePicker
      Left = 134
      Top = 30
      Width = 135
      Height = 21
      CalAlignment = dtaLeft
      Date = 40449.3350087616
      Time = 40449.3350087616
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object Button1: TButton
      Left = 270
      Top = 30
      Width = 28
      Height = 20
      Caption = '...'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Panel1: TPanel
    Left = 351
    Top = 4
    Width = 105
    Height = 155
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Abrir Nota'
      Enabled = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 42
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 78
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 55
    Width = 353
    Height = 105
    Caption = 'Descripci'#243'n Nota Contable'
    TabOrder = 2
    object mDescripcion: TMemo
      Left = 2
      Top = 13
      Width = 343
      Height = 87
      TabOrder = 0
    end
  end
  object IBDatabase1: TIBDatabase
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 136
    Top = 208
  end
  object IBTransaction1: TIBTransaction
    Left = 176
    Top = 216
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 280
    Top = 192
  end
end
