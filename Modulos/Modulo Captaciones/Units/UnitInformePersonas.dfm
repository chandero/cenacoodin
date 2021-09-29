object frmInformePersonas: TfrmInformePersonas
  Left = 864
  Top = 153
  Width = 564
  Height = 418
  Caption = 'Informe de Personas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Filtro: TGroupBox
    Left = 0
    Top = 0
    Width = 553
    Height = 41
    Caption = 'Filtro'
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Personas'
    end
    object cmbPersona: TComboBox
      Left = 90
      Top = 13
      Width = 183
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Asociados'
        'Ahorrador Juvenil')
    end
    object btnProcesar: TButton
      Left = 296
      Top = 12
      Width = 75
      Height = 23
      Caption = 'Procesar'
      TabOrder = 1
    end
  end
end
