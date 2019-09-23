object frmProgresoServer: TfrmProgresoServer
  Left = 284
  Top = 231
  Cursor = crHourGlass
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Espere un Momento'
  ClientHeight = 55
  ClientWidth = 118
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Info: TJvLabel
    Left = 17
    Top = 17
    Width = 81
    Height = 16
    Caption = 'Cargando...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clBlack
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
end
