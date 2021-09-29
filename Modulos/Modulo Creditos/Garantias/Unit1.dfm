object Form1: TForm1
  Left = 386
  Top = 223
  Width = 478
  Height = 146
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 24
    Height = 13
    Caption = 'Base'
  end
  object Edit1: TEdit
    Left = 37
    Top = 3
    Width = 252
    Height = 21
    TabOrder = 0
    Text = '192.168.200.254:/dbase3/pruebas/database.fdb'
  end
  object Button1: TButton
    Left = 292
    Top = 1
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Aplicar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 296
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Desconectar'
    TabOrder = 3
    OnClick = Button3Click
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 224
    Top = 80
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 72
    Top = 56
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 120
    Top = 72
  end
end
