object frmMain: TfrmMain
  Left = 375
  Top = 232
  Width = 959
  Height = 465
  Caption = 'Procesos Servicios Virtuales'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnConectar: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = btnConectarClick
  end
  object edzconnected: TEdit
    Left = 24
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object IBDatabase1: TIBDatabase
    Left = 8
    Top = 368
  end
  object IBTransaction1: TIBTransaction
    Left = 40
    Top = 368
  end
  object zcoreConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI10.1;Integrated Security="";Persist Security Inf' +
      'o=False;User ID=coodinzcore;Initial Catalog=synlight;Data Source' +
      '=TRABAJO;Initial File Name="";Server SPN=""'
    DefaultDatabase = 'synlight'
    Mode = cmReadWrite
    Provider = 'SQLNCLI10.1'
    Left = 88
    Top = 368
  end
  object ADOQuery1: TADOQuery
    Connection = zcoreConnection
    Parameters = <>
    Left = 120
    Top = 368
  end
end
