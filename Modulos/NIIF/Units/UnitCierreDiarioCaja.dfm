object frmCierreDiarioCaja: TfrmCierreDiarioCaja
  Left = 191
  Top = 252
  Width = 398
  Height = 159
  Caption = 'Caja - Cierre del D'#237'a'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 293
    Height = 125
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 38
      Width = 40
      Height = 13
      Caption = 'Fecha '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Caja: TLabel
      Left = 4
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Caja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 68
      Width = 44
      Height = 13
      Caption = 'Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 4
      Top = 94
      Width = 38
      Height = 13
      Caption = 'Nueva'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 4
      Top = 106
      Width = 40
      Height = 13
      Caption = 'Fecha '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdFecha: TDateTimePicker
      Left = 52
      Top = 34
      Width = 108
      Height = 21
      CalAlignment = dtaLeft
      Date = 37896.7333220602
      Time = 37896.7333220602
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 1
      TabStop = False
    end
    object EdCaja: TStaticText
      Left = 52
      Top = 8
      Width = 21
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      Caption = '00'
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object EdUsuario: TStaticText
      Left = 52
      Top = 66
      Width = 239
      Height = 19
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BorderStyle = sbsSunken
      Caption = 'Usuario Caja'
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object EdNuevaFecha: TDateTimePicker
      Left = 52
      Top = 96
      Width = 108
      Height = 21
      CalAlignment = dtaLeft
      Date = 37896.7333220602
      Time = 37896.7333220602
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 293
    Top = 0
    Width = 97
    Height = 125
    Align = alRight
    Color = clOlive
    TabOrder = 1
    object CmdCierre: TBitBtn
      Left = 6
      Top = 6
      Width = 85
      Height = 25
      Caption = 'Cerrar Dia'
      TabOrder = 0
      OnClick = CmdCierreClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000420B0000420B00000000000000000000FF00FFFF00FF
        000000FF00FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00
        FF000000FF00FFFF00FFFF00FF000000FF00FF000000FF00FFFF00FF000000FF
        00FF000000FF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00FF000000
        FF00FF000000FF00FFFF00FF000000FF00FF000000FF00FF000000FF00FFFF00
        FF000000FF00FFFF00FFFF00FF000000FF00FF000000FF00FF000000000000FF
        00FF000000FF00FF000000FF00FF000000000000FF00FFFF00FFFF00FFFF00FF
        000000FF00FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00
        FF000000FF00FFFF00FFFF00FF8080808D5E5D8D5E5D8D5E5D8D5E5D8D5E5D8D
        5E5D8D5E5D8D5E5D8D5E5DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080
        FFFAEBF9F1E2F9F0DFF7EEDCF7EEDBF7EDDAF8EFDBF2E5D18E5F5EFF00FFFF00
        FFC00000FF00FFFF00FFFF00FF808080F9F1E4F5E2CDF5E0CAF4DFC9F3DEC5F2
        DDC3F2E2CDEBDBC98E5F5EFF00FFFF0000FF0000C00000FF00FFFF00FF808080
        FCF5EAFCD8B5FCD8B4FCD8B3FBD7B3FBD7B2FADAB8EBDECE926462FF0000FF00
        00FF0000FF0000C00000FF00FF808080FEFBF5FDD2A7FDD2A7FDD2A7FDD2A7FD
        D2A7FDD2A7F0E5DAA57A75FF00FFFF0000FF0000C00000FF00FFFF00FF808080
        FFFDFBFDEAD8FCE7D4FBE6D3FAE6D1FDE9D3FDF4E6E8E0D9C00000C00000FF00
        00FF0000C00000FF00FFFF00FF808080FFFFFFFDD2A7FDD2A7FDD2A7FDD2A7EB
        DFDBFF0000FF0000FF0000FF0000FF0000FF0000C00000FF00FFFF00FF808080
        FFFFFFFCE7D4FCE7D4FCE7D4FCE7D4B48E88B48E88B48E88B48E88FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4
        8E88EBB56FC68C78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080
        808080808080808080808080808080808080808080FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object CmdCerrar: TBitBtn
      Left = 6
      Top = 32
      Width = 85
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = CmdCerrarClick
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
  object IBQuery: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'insert into "caj$arqueos" values (:ID_AGENCIA,:ID_CAJA,:FECHA_MO' +
        'V,:ID_DENOMINACION,:CANTIDAD_DENOMINACION,:VALOR_DENOMINACION)')
    Left = 54
    Top = 58
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CAJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_MOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_DENOMINACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANTIDAD_DENOMINACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_DENOMINACION'
        ParamType = ptUnknown
      end>
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 80
    Top = 58
  end
  object IBsql1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 108
    Top = 58
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      
        'select SUM(VALOR)  AS SUMA from "caj$cheques" where ID_CAJA = :I' +
        'D_CAJA and ENVIADO =  0')
    Transaction = dmGeneral.IBTransaction1
    Left = 192
    Top = 90
  end
end
