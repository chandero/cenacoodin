object frmMuestroArchivo: TfrmMuestroArchivo
  Left = 155
  Top = 171
  Width = 544
  Height = 375
  Caption = 'Archivo Datacr'#233'dito'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 536
    Height = 341
    Align = alClient
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Archivos de Texto|*.txt'
    Left = 6
    Top = 16
  end
end
