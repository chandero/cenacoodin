object FrmAnalisisPago: TFrmAnalisisPago
  Left = 230
  Top = 171
  Width = 449
  Height = 186
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 119
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 10
      Width = 94
      Height = 13
      Caption = 'Ingresos Mensuales'
    end
    object JvLabel1: TJvLabel
      Left = 232
      Top = 10
      Width = 63
      Height = 13
      Caption = 'Deducciones'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvLabel2: TJvLabel
      Left = 5
      Top = 35
      Width = 49
      Height = 13
      Caption = 'Disponible'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvLabel3: TJvLabel
      Left = 232
      Top = 35
      Width = 70
      Height = 13
      Caption = 'Disp. de  Pago'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvLabel4: TJvLabel
      Left = 5
      Top = 61
      Width = 55
      Height = 13
      Caption = 'Valor Cuota'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvLabel5: TJvLabel
      Left = 91
      Top = 92
      Width = 111
      Height = 13
      Caption = 'Experinecia en Creditos'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JVinresos: TJvCurrencyEdit
      Left = 104
      Top = 8
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 0
      HasMaxValue = False
      HasMinValue = False
    end
    object JVdeduccion: TJvCurrencyEdit
      Left = 304
      Top = 8
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 1
      HasMaxValue = False
      HasMinValue = False
    end
    object JVdisponible: TJvCurrencyEdit
      Left = 104
      Top = 33
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 2
      HasMaxValue = False
      HasMinValue = False
    end
    object JVdisppago: TJvCurrencyEdit
      Left = 304
      Top = 33
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 3
      HasMaxValue = False
      HasMinValue = False
    end
    object JVcuota: TJvCurrencyEdit
      Left = 104
      Top = 59
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 4
      HasMaxValue = False
      HasMinValue = False
    end
    object JVsolvencia: TJvCheckBox
      Left = 232
      Top = 59
      Width = 129
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Solvencia Economica'
      TabOrder = 5
      AutoSize = False
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JVexperencia: TJvEdit
      Left = 211
      Top = 90
      Width = 121
      Height = 21
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 120
    Width = 441
    Height = 32
    Color = clOlive
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 172
      Top = 4
      Width = 87
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000006400004242
        42008C6363009A666600B9666600BB686800B0717200C3686900C66A6B00C76A
        6D00CF6C6E00D2686900D16D6E00CC6E7100C0797A00D2707200D4707100D572
        7300D0727500D3747600D9757600D8767700E37D7E000080000000960000DC7F
        8000FF00FF00D7868700DA888800D8888A00DA888A00DF898A00E6808100E085
        8500E9818200EE868700E3888900E78C8D00F0878800F18B8C00F28B8C00F18D
        8E00F48C8D00F48E8F00EB8F9000EC969700E49A9800F3919200F7909100F791
        9200F2939400F9909200F9949500FA949500F9969700F0999A00FC999A00FF9D
        9E00F7B58400F5A7A500FACCAA00FBD6BB00FADCDC00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001A1A1A1A1A1A
        1A02011A1A1A1A1A1A1A1A1A1A1A02030405011A1A1A1A1A1A1A1A1A0203080B
        0B07010303030303031A1A1A030C0C0C0A09010E1F323B3B031A1A1A030C0C10
        0F0D01181818183B031A1A1A03111114151201181818183B031A1A1A03161616
        201301181717173B031A1A1A0326222D3E1D01171700003B031A1A1A03262337
        3F1E013C3A3A3A3B031A1A1A03272B282A19013C3D3D3D3B031A1A1A03273031
        2921013C3D3D3D3B031A1A1A032734352F24013C3D3D3D3B031A1A1A03273338
        3625013C3D3D3D3B031A1A1A03032E33392C013C3D3D3D3B031A1A1A1A1A0306
        1B1C010303030303031A1A1A1A1A1A1A0303011A1A1A1A1A1A1A}
    end
  end
end
