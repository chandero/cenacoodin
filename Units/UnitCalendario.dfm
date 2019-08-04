object frmCalendario: TfrmCalendario
  Left = 285
  Top = 192
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmCalendario'
  ClientHeight = 153
  ClientWidth = 198
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Calendario: TMonthCalendar
    Left = 0
    Top = 0
    Width = 198
    Height = 153
    Align = alClient
    CalColors.BackColor = clMedGray
    CalColors.TitleBackColor = clTeal
    CalColors.MonthBackColor = clGrayText
    Date = 37784.6528383565
    TabOrder = 0
    OnDblClick = CalendarioDblClick
  end
end
