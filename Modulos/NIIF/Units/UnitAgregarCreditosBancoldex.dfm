object frmAgregarCreditosBancoldex: TfrmAgregarCreditosBancoldex
  Left = 262
  Top = 167
  BorderStyle = bsDialog
  Caption = 'Agregar Desembolsos Bancoldex'
  ClientHeight = 320
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 321
    TabOrder = 0
    object ControlCreditos: TPageControl
      Left = 8
      Top = 6
      Width = 409
      Height = 315
      ActivePage = InfoCreditos
      TabIndex = 0
      TabOrder = 0
      object InfoCreditos: TTabSheet
        Caption = 'Cr'#233'ditos Bancoldex'
        ImageIndex = 1
        object Panel4: TPanel
          Left = 1
          Top = 4
          Width = 404
          Height = 281
          TabOrder = 0
          object Label4: TLabel
            Left = 8
            Top = 185
            Width = 26
            Height = 13
            Caption = 'Linea'
          end
          object Label5: TLabel
            Left = 128
            Top = 185
            Width = 70
            Height = 13
            Caption = 'No. Obligaci'#243'n'
          end
          object Label1: TLabel
            Left = 247
            Top = 185
            Width = 71
            Height = 13
            Caption = 'V. Desembolso'
          end
          object Label8: TLabel
            Left = 247
            Top = 228
            Width = 36
            Height = 13
            Caption = 'Margen'
          end
          object Label7: TLabel
            Left = 8
            Top = 228
            Width = 47
            Height = 13
            Caption = 'Tasa E.A.'
          end
          object Label6: TLabel
            Left = 128
            Top = 228
            Width = 90
            Height = 13
            Caption = 'Puntos Adicionales'
          end
          object GridFijas: TDBGrid
            Left = 4
            Top = 9
            Width = 392
            Height = 173
            DataSource = DSCreditos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_LINEA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'LINEA'
                Width = 32
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_OBLIGACION'
                Title.Caption = 'OBLIGACION'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TASA_EA'
                Title.Caption = 'TASA'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEN'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PUNTOS_ADIC'
                Title.Caption = 'PUNTOS'
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_DESEMBOLSO'
                Title.Caption = 'DESEMBOLSO'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SALDO'
                Width = 80
                Visible = True
              end>
          end
          object EdLinea: TEdit
            Left = 8
            Top = 200
            Width = 81
            Height = 21
            MaxLength = 4
            TabOrder = 1
            OnEnter = EdLineaEnter
            OnExit = EdLineaExit
            OnKeyPress = EdLineaKeyPress
          end
          object EdObligacion: TEdit
            Left = 128
            Top = 200
            Width = 97
            Height = 21
            MaxLength = 15
            TabOrder = 2
            OnEnter = EdObligacionEnter
            OnExit = EdObligacionExit
            OnKeyPress = EdObligacionKeyPress
          end
          object EdMargen: TEdit
            Left = 247
            Top = 244
            Width = 81
            Height = 21
            TabOrder = 6
            OnEnter = EdMargenEnter
            OnExit = EdMargenExit
            OnKeyPress = EdMargenKeyPress
          end
          object EdPuntos: TEdit
            Left = 128
            Top = 244
            Width = 81
            Height = 21
            TabOrder = 5
            OnEnter = EdPuntosEnter
            OnExit = EdPuntosExit
            OnKeyPress = EdPuntosKeyPress
          end
          object EdDesembolso: TJvCurrencyEdit
            Left = 248
            Top = 200
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clMoneyGreen
            ReadOnly = False
            TabOrder = 3
            OnEnter = EdDesembolsoEnter
            OnExit = EdDesembolsoExit
            OnKeyPress = EdDesembolsoKeyPress
            Value = 1
            HasMaxValue = False
            HasMinValue = False
            DisabledColor = clWhite
          end
          object EdTasa: TEdit
            Left = 8
            Top = 244
            Width = 81
            Height = 21
            TabOrder = 4
            OnEnter = EdTasaEnter
            OnExit = EdTasaExit
            OnKeyPress = EdTasaKeyPress
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 415
    Top = 0
    Width = 104
    Height = 320
    Align = alRight
    Color = clOlive
    TabOrder = 1
    object CmdCerrar: TBitBtn
      Left = 8
      Top = 30
      Width = 93
      Height = 25
      Caption = '&Cerrar'
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
    object CmdActualizar: TBitBtn
      Left = 8
      Top = 4
      Width = 93
      Height = 25
      Caption = '&Agregar'
      TabOrder = 0
      OnClick = CmdActualizarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF4A49494A49494A49494A49494A49494A49494A49494A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A49498E8F8FADABABB9B1AD51
        6481516481B9B1ACABA8A8949393474848FF00FFFF00FFFF00FFFF00FFFF00FF
        464646BEBABAC8C7C7C5C0BD6B7B9A00689B00689B6B7B9ADDD9D6BDBCBCB3AF
        AF474848FF00FFFF00FFFF00FF797A7A979595C0C0C0DDDAD86B7B9A00ACE800
        AFE200AFE2009FDB6B7B9ADCDAD9A9A6A69695954A4949FF00FFFF00FF797A7A
        ADAAAABDBBBBFCFFFF6B7B9A6B7B9A00689B00689B00AFE26D7E9DE9E5E1BEBD
        BDAEABAB4A4949FF00FFFF00FF797A7AA9A7A7C9C9C9EAEAE9D3E0EA6B7B9A00
        AFE200AFE200A1D9D4D6E1E8EAE9BCBBBBABA8A84A4949FF00FFFF00FF797A7A
        B1AEAEBBBABAF6F5F36B7B9A00AFE200A6D900689B6B7B9A6B7B9AEBE7E4AFAD
        ADADACAC4A4949FF00FFFF00FFFF00FF797A7AADA9A9DBD9D7C3C5D26B7B9A00
        AADD00AFE200ACE86B7B9ACECDCCACA9A94A4949FF00FFFF00FFFF00FFFF00FF
        797A7AAFAEAEC5C3C3E8E5E16B7B9A00689B00689B6B7B9ADBD8D5AAA5A5B2B1
        B14A4949FF00FFFF00FFFF00FFFF00FFFF00FF797A7A979494A6A2A2CFC7C34C
        5C794C5D79C8C1BCBBB7B79493934A4949FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF797A7A797A7A6A6A6A716E6B726F6B6A6A6A4747474A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF79797969
        67676969697D7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF8C8989CCCFD09195968F8D8DFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9A9AD6D4D3F3
        FDFFCBD2D5C8C4C47B7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF202020A5A5A5333333929090969494353535A8A8A8222222FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object IBCredito: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 344
    Top = 152
  end
  object IBConsultar: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 392
    Top = 152
  end
  object DSCreditos: TDataSource
    DataSet = DsetCreditos
    Left = 266
    Top = 65532
  end
  object DsetCreditos: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select *  from "col$creditosbancoldex" order by ID_LINEA DESC')
    Left = 240
    Top = 65532
    object DsetCreditosID_LINEA: TSmallintField
      FieldName = 'ID_LINEA'
      Origin = '"col$creditosbancoldex"."ID_LINEA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DsetCreditosLINEA: TIBStringField
      FieldName = 'LINEA'
      Origin = '"col$creditosbancoldex"."LINEA"'
      FixedChar = True
      Size = 4
    end
    object DsetCreditosID_OBLIGACION: TIBStringField
      FieldName = 'ID_OBLIGACION'
      Origin = '"col$creditosbancoldex"."ID_OBLIGACION"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 15
    end
    object DsetCreditosTASA_EA: TFloatField
      FieldName = 'TASA_EA'
      Origin = '"col$creditosbancoldex"."TASA_EA"'
      DisplayFormat = '#,0.00'
    end
    object DsetCreditosMARGEN: TFloatField
      FieldName = 'MARGEN'
      Origin = '"col$creditosbancoldex"."MARGEN"'
      DisplayFormat = '#,0.00'
    end
    object DsetCreditosPUNTOS_ADIC: TFloatField
      FieldName = 'PUNTOS_ADIC'
      Origin = '"col$creditosbancoldex"."PUNTOS_ADIC"'
      DisplayFormat = '#,0.00'
    end
    object DsetCreditosVALOR_DESEMBOLSO: TIBBCDField
      FieldName = 'VALOR_DESEMBOLSO'
      Origin = '"col$creditosbancoldex"."VALOR_DESEMBOLSO"'
      DisplayFormat = '#,0'
      EditFormat = '#0.00'
      Precision = 18
      Size = 3
    end
    object DsetCreditosSALDO: TIBBCDField
      FieldName = 'SALDO'
      Origin = '"col$creditosbancoldex"."SALDO"'
      DisplayFormat = '#,0'
      Precision = 18
      Size = 3
    end
  end
end
