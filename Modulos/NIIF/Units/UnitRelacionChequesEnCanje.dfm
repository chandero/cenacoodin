object frmRelacionChequesEnCanje: TfrmRelacionChequesEnCanje
  Left = 184
  Top = 257
  BorderStyle = bsDialog
  Caption = 'Relaci'#243'n de Cheques en Canje'
  ClientHeight = 173
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 524
    Height = 141
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Alignment = taCenter
        Title.Caption = 'BANCO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_CHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'CHEQUE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PLAZA'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_ENTRADA'
        Title.Alignment = taCenter
        Title.Caption = 'FECHA C.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_CHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 141
    Width = 524
    Height = 32
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object btnCerrar: TBitBtn
      Left = 447
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
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
  object IBTransaction1: TIBTransaction
    AllowAutoStart = False
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    AutoStopAction = saRollback
    Left = 288
    Top = 32
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT "gen$bancos".DESCRIPCION,'
      '       "cap$canje".NUMERO_CHEQUE,'
      '       "cap$canje".PLAZA,'
      '       "cap$canje".FECHA_ENTRADA,'
      '       "cap$canje".VALOR_CHEQUE'
      'FROM'
      '       "cap$canje"'
      
        'INNER JOIN "gen$bancos" on ("cap$canje".ID_BANCO = "gen$bancos".' +
        'ID_BANCO)'
      'WHERE'
      '       "cap$canje".ID_AGENCIA = :ID_AGENCIA and'
      '       "cap$canje".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and'
      '       "cap$canje".NUMERO_CUENTA = :NUMERO_CUENTA and'
      '       "cap$canje".DIGITO_CUENTA = :DIGITO_CUENTA and'
      '       "cap$canje".LIBERADO = 0 and'
      '       "cap$canje".DEVUELTO = 0')
    Left = 208
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TIPO_CAPTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIGITO_CUENTA'
        ParamType = ptUnknown
      end>
    object IBQuery1DESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = '"gen$bancos"."DESCRIPCION"'
      Size = 255
    end
    object IBQuery1NUMERO_CHEQUE: TIntegerField
      FieldName = 'NUMERO_CHEQUE'
      Origin = '"cap$canje"."NUMERO_CHEQUE"'
      Required = True
    end
    object IBQuery1PLAZA: TIBStringField
      FieldName = 'PLAZA'
      Origin = '"cap$canje"."PLAZA"'
      FixedChar = True
      Size = 1
    end
    object IBQuery1FECHA_ENTRADA: TDateField
      FieldName = 'FECHA_ENTRADA'
      Origin = '"cap$canje"."FECHA_ENTRADA"'
    end
    object IBQuery1VALOR_CHEQUE: TIBBCDField
      FieldName = 'VALOR_CHEQUE'
      Origin = '"cap$canje"."VALOR_CHEQUE"'
      currency = True
      Precision = 18
      Size = 3
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 176
    Top = 40
  end
end
