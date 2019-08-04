object frmCambioPersona: TfrmCambioPersona
  Left = 278
  Top = 179
  Width = 358
  Height = 189
  Caption = 'Cambio de Persona'
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
    Left = 16
    Top = 48
    Width = 33
    Height = 13
    Caption = 'Cedula'
  end
  object Label2: TLabel
    Left = 80
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object BtnAceptar: TButton
    Left = 248
    Top = 16
    Width = 81
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 0
    OnClick = BtnAceptarClick
  end
  object Ed1: TEdit
    Left = 16
    Top = 16
    Width = 217
    Height = 21
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 304
    Top = 48
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 160
    Top = 104
  end
end
