object frmMantenimientoTasaCdat: TfrmMantenimientoTasaCdat
  Left = 262
  Top = 167
  BorderStyle = bsDialog
  Caption = 'Mantenimiento de Tasas para CDAT'#180'S'
  ClientHeight = 320
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
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
    object ControlTipoTasa: TPageControl
      Left = 8
      Top = 6
      Width = 409
      Height = 315
      ActivePage = InfoFijas
      TabIndex = 0
      TabOrder = 0
      object InfoFijas: TTabSheet
        Caption = 'Tasas Fijas'
        ImageIndex = 1
        object Panel4: TPanel
          Left = -3
          Top = 2
          Width = 404
          Height = 287
          TabOrder = 0
          object Label4: TLabel
            Left = 16
            Top = 185
            Width = 60
            Height = 13
            Caption = 'Fecha Inicial'
          end
          object Label5: TLabel
            Left = 112
            Top = 185
            Width = 55
            Height = 13
            Caption = 'Fecha Final'
          end
          object Label6: TLabel
            Left = 56
            Top = 235
            Width = 138
            Height = 13
            Caption = 'Valor de Tasa Efectiva Anual'
          end
          object Label7: TLabel
            Left = 224
            Top = 185
            Width = 59
            Height = 13
            Caption = 'Clasificaci'#243'n'
          end
          object Label8: TLabel
            Left = 336
            Top = 185
            Width = 25
            Height = 13
            Caption = 'Edad'
          end
          object GridFijas: TDBGrid
            Left = 2
            Top = 9
            Width = 383
            Height = 173
            DataSource = DSFijas
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
                FieldName = 'ID_TASA'
                Title.Alignment = taCenter
                Title.Caption = 'ID'
                Width = 38
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_CLASIFICACION'
                Title.Alignment = taCenter
                Title.Caption = 'CLASIF.'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_EDAD'
                Title.Alignment = taCenter
                Title.Caption = 'EDAD'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_INICIAL'
                Title.Alignment = taCenter
                Title.Caption = 'FECHA INICIAL'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_FINAL'
                Title.Alignment = taCenter
                Title.Caption = 'FECHA FINAL'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TASA_EFECTIVA'
                Title.Alignment = taCenter
                Title.Caption = 'VALOR'
                Width = 55
                Visible = True
              end>
          end
          object EdFechaInicialFija: TDateTimePicker
            Left = 16
            Top = 201
            Width = 89
            Height = 19
            CalAlignment = dtaLeft
            Date = 38283.4172659838
            Time = 38283.4172659838
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
            OnEnter = EdFechaInicialFijaEnter
            OnExit = EdFechaInicialFijaExit
          end
          object EdFechaFinalFija: TDateTimePicker
            Left = 112
            Top = 201
            Width = 97
            Height = 19
            CalAlignment = dtaLeft
            Date = 38283.4173710532
            Time = 38283.4173710532
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 2
            OnEnter = EdFechaFinalFijaEnter
            OnExit = EdFechaFinalFijaExit
          end
          object EdTasaFija: TEdit
            Left = 222
            Top = 227
            Width = 65
            Height = 21
            Color = clMoneyGreen
            TabOrder = 5
            OnEnter = EdTasaFijaEnter
            OnExit = EdTasaFijaExit
            OnKeyPress = EdTasaFijaKeyPress
          end
          object CBclasificacion: TDBLookupComboBox
            Left = 219
            Top = 200
            Width = 110
            Height = 21
            KeyField = 'ID_CLASIFICACION'
            ListField = 'DESCRIPCION_CLASIFICACION'
            ListSource = dmColocacion.DSclasificacion
            TabOrder = 3
            OnExit = CBclasificacionExit
          end
          object CBEdad: TComboBox
            Left = 336
            Top = 200
            Width = 49
            Height = 21
            ItemHeight = 13
            TabOrder = 4
            Text = 'CBEdad'
            Items.Strings = (
              'A'
              'B'
              'C'
              'D'
              'E')
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 414
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
      Caption = '&Actualizar'
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
  object IBDtf: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 344
    Top = 152
  end
  object IBOrdinaria: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 368
    Top = 152
  end
  object IBConsultar: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 392
    Top = 152
  end
  object DSDtf: TDataSource
    DataSet = DsetDtf
    Left = 185
  end
  object DSFijas: TDataSource
    DataSet = DsetFija
    Left = 266
    Top = 65532
  end
  object DsetFija: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select *  from "col$tasaclasificacion" order by ID_TASA DESC')
    Left = 240
    Top = 65532
    object DsetFijaID_TASA: TIntegerField
      FieldName = 'ID_TASA'
      Origin = '"col$tasaclasificacion"."ID_TASA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DsetFijaID_CLASIFICACION: TIntegerField
      FieldName = 'ID_CLASIFICACION'
      Origin = '"col$tasaclasificacion"."ID_CLASIFICACION"'
    end
    object DsetFijaID_EDAD: TIBStringField
      FieldName = 'ID_EDAD'
      Origin = '"col$tasaclasificacion"."ID_EDAD"'
      Size = 1
    end
    object DsetFijaFECHA_INICIAL: TDateField
      FieldName = 'FECHA_INICIAL'
      Origin = '"col$tasaclasificacion"."FECHA_INICIAL"'
    end
    object DsetFijaFECHA_FINAL: TDateField
      FieldName = 'FECHA_FINAL'
      Origin = '"col$tasaclasificacion"."FECHA_FINAL"'
    end
    object DsetFijaVALOR_TASA_EFECTIVA: TFloatField
      FieldName = 'VALOR_TASA_EFECTIVA'
      Origin = '"col$tasaclasificacion"."VALOR_TASA_EFECTIVA"'
    end
  end
  object DsetDtf: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select *  from "col$tasadtf" order by ID_TASA_DTF DESC')
    Left = 160
  end
end
