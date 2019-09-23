object frmConsultaGarantias: TfrmConsultaGarantias
  Left = 307
  Top = 175
  Width = 545
  Height = 226
  Caption = 'Garant'#237'as de Colocaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ControlGarantias: TPageControl
    Left = 0
    Top = 0
    Width = 537
    Height = 162
    ActivePage = InfoNoAdmisibles
    Images = ImageList1
    TabIndex = 1
    TabOrder = 0
    object InfoAdmisible: TTabSheet
      Caption = 'Admisibles'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 522
        Height = 127
        TabOrder = 0
        object DBGridReal: TDBGrid
          Left = 6
          Top = 6
          Width = 510
          Height = 115
          DataSource = DSReal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'NUMERO_ESCRITURA'
              ReadOnly = True
              Title.Caption = 'No. de ESCRITURA'
              Title.Color = clActiveBorder
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ESCRITURA'
              ReadOnly = True
              Title.Caption = 'FECHA ESCRITURA'
              Title.Color = clActiveBorder
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_NOTARIA'
              ReadOnly = True
              Title.Caption = 'NOMBRE NOTARIA'
              Title.Color = clActiveBorder
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIUDAD_ESCRITURA'
              ReadOnly = True
              Title.Caption = 'CIUDAD ESCRITURA'
              Title.Color = clActiveBorder
              Width = 126
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATRICULA_INMOBILIARIA'
              ReadOnly = True
              Title.Caption = 'MATRICULA INMOBILIARIA'
              Title.Color = clActiveBorder
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REGISTRO'
              ReadOnly = True
              Title.Caption = 'FECHA REGISTRO'
              Title.Color = clActiveBorder
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AVALUO'
              ReadOnly = True
              Title.Color = clActiveBorder
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_AVALUO'
              ReadOnly = True
              Title.Caption = 'FECHA AVALUO'
              Title.Color = clActiveBorder
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTAS_DE_ORDEN'
              ReadOnly = True
              Title.Caption = 'CUENTAS DE ORDEN'
              Title.Color = clActiveBorder
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POLIZA_INCENDIO'
              Title.Caption = 'POLIZA INCENDIO'
              Title.Color = clActiveBorder
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_ASEGURADO'
              ReadOnly = True
              Title.Caption = 'VALOR ASEGURADO'
              Title.Color = clActiveBorder
              Width = 100
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'FECHA_INICIAL_POLIZA'
              Title.Caption = 'FECHA INICIAL POLIZA'
              Title.Color = clActiveBorder
              Width = 99
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'FECHA_FINAL_POLIZA'
              Title.Color = clActiveBorder
              Visible = True
            end>
        end
      end
    end
    object InfoNoAdmisibles: TTabSheet
      Caption = 'No Admisibles'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 522
        Height = 127
        TabOrder = 0
        object DBGridPersonal: TDBGrid
          Left = 6
          Top = 6
          Width = 510
          Height = 115
          DataSource = DSPersonal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDblClick = DBGridPersonalDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_PERSONA'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'IDENTIFICACION'
              Title.Color = clActiveBorder
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRIMER_APELLIDO'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'PRIMER APELLIDO'
              Title.Color = clActiveBorder
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEGUNDO_APELLIDO'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'SEGUNDO APELLIDO'
              Title.Color = clActiveBorder
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'NOMBRES'
              Title.Color = clActiveBorder
              Width = 140
              Visible = True
            end>
        end
      end
    end
    object InfoPignoraciones: TTabSheet
      Caption = 'Pignoraciones'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 2
        Top = 2
        Width = 522
        Height = 127
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 6
          Top = 6
          Width = 510
          Height = 115
          DataSource = DSPersonal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDblClick = DBGridPersonalDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_PERSONA'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'IDENTIFICACION'
              Title.Color = clActiveBorder
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRIMER_APELLIDO'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'PRIMER APELLIDO'
              Title.Color = clActiveBorder
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEGUNDO_APELLIDO'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'SEGUNDO APELLIDO'
              Title.Color = clActiveBorder
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'NOMBRES'
              Title.Color = clActiveBorder
              Width = 140
              Visible = True
            end>
        end
        object PageControl1: TPageControl
          Left = -15
          Top = -35
          Width = 537
          Height = 162
          ActivePage = TabSheet3
          Images = ImageList1
          TabIndex = 2
          TabOrder = 1
          object TabSheet1: TTabSheet
            Caption = 'Admisibles'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            object Panel5: TPanel
              Left = 2
              Top = 2
              Width = 522
              Height = 127
              TabOrder = 0
              object DBGrid2: TDBGrid
                Left = 6
                Top = 6
                Width = 510
                Height = 115
                DataSource = DSPignoracion
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NUMERO_ESCRITURA'
                    ReadOnly = True
                    Title.Caption = 'No. de ESCRITURA'
                    Title.Color = clActiveBorder
                    Width = 123
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_ESCRITURA'
                    ReadOnly = True
                    Title.Caption = 'FECHA ESCRITURA'
                    Title.Color = clActiveBorder
                    Width = 122
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_NOTARIA'
                    ReadOnly = True
                    Title.Caption = 'NOMBRE NOTARIA'
                    Title.Color = clActiveBorder
                    Width = 108
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CIUDAD_ESCRITURA'
                    ReadOnly = True
                    Title.Caption = 'CIUDAD ESCRITURA'
                    Title.Color = clActiveBorder
                    Width = 126
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MATRICULA_INMOBILIARIA'
                    ReadOnly = True
                    Title.Caption = 'MATRICULA INMOBILIARIA'
                    Title.Color = clActiveBorder
                    Width = 128
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_REGISTRO'
                    ReadOnly = True
                    Title.Caption = 'FECHA REGISTRO'
                    Title.Color = clActiveBorder
                    Width = 85
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AVALUO'
                    ReadOnly = True
                    Title.Color = clActiveBorder
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_AVALUO'
                    ReadOnly = True
                    Title.Caption = 'FECHA AVALUO'
                    Title.Color = clActiveBorder
                    Width = 81
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CUENTAS_DE_ORDEN'
                    ReadOnly = True
                    Title.Caption = 'CUENTAS DE ORDEN'
                    Title.Color = clActiveBorder
                    Width = 124
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'POLIZA_INCENDIO'
                    Title.Caption = 'POLIZA INCENDIO'
                    Title.Color = clActiveBorder
                    Width = 92
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_ASEGURADO'
                    ReadOnly = True
                    Title.Caption = 'VALOR ASEGURADO'
                    Title.Color = clActiveBorder
                    Width = 100
                    Visible = True
                  end
                  item
                    ButtonStyle = cbsEllipsis
                    Expanded = False
                    FieldName = 'FECHA_INICIAL_POLIZA'
                    Title.Caption = 'FECHA INICIAL POLIZA'
                    Title.Color = clActiveBorder
                    Width = 99
                    Visible = True
                  end
                  item
                    ButtonStyle = cbsEllipsis
                    Expanded = False
                    FieldName = 'FECHA_FINAL_POLIZA'
                    Title.Color = clActiveBorder
                    Visible = True
                  end>
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'No Admisibles'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImageIndex = 1
            ParentFont = False
            object Panel6: TPanel
              Left = 2
              Top = 2
              Width = 522
              Height = 127
              TabOrder = 0
              object DBGrid3: TDBGrid
                Left = 6
                Top = 6
                Width = 510
                Height = 115
                DataSource = DSPersonal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                PopupMenu = PopupMenu1
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                OnDblClick = DBGridPersonalDblClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_PERSONA'
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = 'IDENTIFICACION'
                    Title.Color = clActiveBorder
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRIMER_APELLIDO'
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = 'PRIMER APELLIDO'
                    Title.Color = clActiveBorder
                    Width = 130
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SEGUNDO_APELLIDO'
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = 'SEGUNDO APELLIDO'
                    Title.Color = clActiveBorder
                    Width = 130
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE'
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = 'NOMBRES'
                    Title.Color = clActiveBorder
                    Width = 140
                    Visible = True
                  end>
              end
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Pignoraciones'
            ImageIndex = 2
            object Panel7: TPanel
              Left = 2
              Top = 2
              Width = 522
              Height = 127
              TabOrder = 0
              object DBGridPignoracion: TDBGrid
                Left = 6
                Top = 6
                Width = 510
                Height = 115
                DataSource = DSPignoracion
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                PopupMenu = PopupMenu1
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                OnDblClick = DBGridPersonalDblClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NUMERO_ESCRITURA'
                    Title.Caption = 'PLACA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_ESCRITURA'
                    Title.Caption = 'FECHA RADICACION'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_AVALUO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'CUENTAS_DE_ORDEN'
                    Title.Caption = 'CUENTAS DE ORDEN'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'POLIZA_INCENDIO'
                    Title.Caption = 'POLIZA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_INICIAL_POLIZA'
                    Title.Caption = 'FECHA INICIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_FINAL_POLIZA'
                    Title.Caption = 'FECHA FINAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MATRICULA'
                    Title.Caption = 'No. LICENCIA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_MATRICULA'
                    Title.Caption = 'FECHA LICENCIA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COLOR_VEHICULO'
                    Title.Caption = 'COLOR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LINEA_VEHICULO'
                    Title.Caption = 'LINEA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MARCA_VEHICULO'
                    Title.Caption = 'MARCA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MODELO_VEHICULO'
                    Title.Caption = 'MODELO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_VEHICULO'
                    Title.Caption = 'TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_SERVICIO'
                    Title.Caption = 'TIPO SERVICIO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_ASEGURADO'
                    Title.Caption = 'VALOR  ASEGURADO'
                    Visible = True
                  end>
              end
            end
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 162
    Width = 537
    Height = 30
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object CmdCerrar: TBitBtn
      Left = 226
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
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
  object DSReal: TDataSource
    DataSet = IBDSReal
    Left = 236
    Top = 88
  end
  object DSPersonal: TDataSource
    DataSet = IBDSPersonal
    Left = 232
    Top = 112
  end
  object ImageList1: TImageList
    Left = 120
    Top = 96
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD7B6B00AD7B6B00AD7B6B00AD7B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      6B00DEA57B00EFC69400E7C6A500DEB58C00AD7B6B00AD7B6B00AD7B6B00AD7B
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B6B00DEB5
      8C00EFB57B00EFC69C00EFD6B500EFCEA500C69C73007B4A4A008C525200AD7B
      6B00AD7B6B00AD7B6B000000000000000000B5735200B5735200C6421800C642
      2100CE4A2900C64A29009C4A29008C5242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B6B00E7BD9400EFC6
      8C00EFB57B00EFC6A500F7E7CE00F7D6AD00C69C84007B4A4A007B4A4A00CEA5
      7B00EFBD8C00D6A58400AD7B6B0000000000C6421800C6421800E75A3900F763
      4A00FF6B5A00EF634A00E75A3900EF5A42008C4A290063735A00397339003173
      3100297B290029732900316B31005A735A000000000000000000C0C0C000C0C0
      C00000000000000000000000000000000000C0C0C00000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD7B6B00F7CE9C00F7D69400EFC6
      8C00EFB57B00F7CEAD00FFEFDE00FFE7C600CEA58C007B4A4A007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B0000000000CE4A2100CE4A2100FF735A00FF7B
      6300DE6B4200EFB58400DE7B4A00F7735A00E75A39007B8C390084BD730063AD
      5A0063C6630052C6520031B531001894180000FF000000FF0000000000000000
      000000800000008000000080000000FF00000000000000FF0000008000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD7B6B00F7D69C00F7D69400F7C6
      8C00F7B57300F7CEAD00FFF7EF00FFEFDE00CEAD9C00734242007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B000000000000000000D6846300FF7B6300FF8C
      6B00DE8C5A00FFD69C00DE8C5A00EF7B5A00E75A39007BA55200C6DEB500D6E7
      C60073D6730063CE630042B54200188C18000000000000000000000000000000
      0000008000000080000000800000008000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD7B6B00F7D69C00FFD69400E7BD
      9400B5A59400F7CEAD00FFFFF700FFF7EF00DEC6B50094635A0084524A00CEA5
      8400EFBD8C00DEB58400AD7B6B00000000000000000000000000A56342008C31
      18002121730021217B00A5524A00C65A310073B55A0084DE8400FFF7E700FFF7
      E7007BAD630063BD6300398C3900000000000000000000000000008000000080
      0000FFFF000080808000FFFF0000FFFF0000FFFF00000000000000FF000000FF
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD7B6B00FFD69400D6CEA50052A5
      E7002184F70084ADDE00FFFFEF00FFF7EF00FFF7E700F7E7CE00E7C6A500E7C6
      9C00E7BD9400DEB58400AD7B6B00000000000000000000000000181818000808
      080010319400103194001018730063525A004AA54A0063BD630094ADB5004A8C
      B5006394A5003184390000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF0000000000000000000000000000C0C0
      C000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD7B6B009CC6C60042B5FF0031AD
      FF00319CFF001884FF0084BDF700FFFFEF00FFF7EF00FFEFDE00F7E7CE00EFD6
      B500EFC69C00DEB58C00A57B7B0000000000000000001010100008101800184A
      A500185ABD00185ABD001852BD0010318C0000000000000000003194F7003194
      F7003194F7002994EF0000000000000000000000000000000000000000000000
      FF000000FF0000000000000000000000800000008000000080000000FF000000
      00000000FF000000800000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000429CF70042A5FF0042ADFF0042B5
      FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFF7EF00FFEFDE00FFE7
      C600DEC6B500948C94009C7B840000000000000000001818180010213100185A
      BD00216BCE00216BCE002163CE00104AAD0000000000529CCE0039A5FF0039A5
      FF00399CFF00399CFF00426B7B00000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000429CFF0042A5FF0042AD
      FF0042B5FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFFFEF00D6D6
      D600737BAD007B7394000000000000000000000000003131310029292900215A
      A5003194F7003194F700298CF700216BCE000000000042A5E7004AB5FF0052B5
      FF004AB5FF004AADFF00298CCE00000000000000000000000000000000000000
      0000000000000000800000008000FFFF000080808000FFFF0000FFFF0000FFFF
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000429CF70042A5
      FF0042ADFF0042ADFF0039A5FF002994FF001884FF0094C6FF00B5CEE7004A6B
      BD00526BA50000000000000000000000000000000000313131004A4A4A001829
      4200216BCE00297BE7003194F700216BC600000000004AA5E70052BDFF005ABD
      FF0052BDFF0052B5FF003194DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042A5
      FF0042ADFF0042B5FF0042ADFF00319CFF002994FF001884FF00316BE7003163
      C6000000000000000000000000000000000000000000000000005A5A5A006B6B
      6B00A5A5A50084848400313131004A4A4A0000000000529CC6003994C6004A9C
      CE003194CE00298CCE00106B9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042A5FF0042ADFF0042B5FF0039ADFF003994F7001831B5003952DE000000
      0000000000000000000000000000000000000000000000000000424242007373
      73008C8C8C0084848400393939000000000000000000000000005AA5D6006BB5
      DE00ADD6EF0073B5D6004284A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042A5FF0042ADFF00000000000000000018109400394ADE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009CC6DE008CBD
      D60084B5D6008CB5CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018189C00394ADE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F0FFFFFFFFFF0000E00FFFFFFFFF0000
      C00300FFC01F000080010000000F000000010000000700000001800000070000
      0001C001C00300000001C003E0010000000180C3E000000000018081E0000000
      80038081F8000000C0078081FE0F0000E00FC081FFFF0000F01FC1C1FFFF0000
      F99FFFC3FFFF0000FF9FFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object IBDSReal: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "col$datogarantia".NUMERO_ESCRITURA,'
      '  "col$datogarantia".FECHA_ESCRITURA,'
      '  "col$datogarantia".NOMBRE_NOTARIA,'
      '  "col$datogarantia".CIUDAD_ESCRITURA,'
      '  "col$datogarantia".AVALUO,'
      '  "col$datogarantia".FECHA_AVALUO,'
      '  "col$datogarantia".CUENTAS_DE_ORDEN,'
      '  "col$datogarantia".POLIZA_INCENDIO,'
      '  "col$datogarantia".VALOR_ASEGURADO,'
      '  "col$datogarantia".FECHA_INICIAL_POLIZA,'
      '  "col$datogarantia".FECHA_FINAL_POLIZA,'
      '  "col$datogarantia".MATRICULA,'
      '  "col$datogarantia".FECHA_MATRICULA'
      'FROM'
      '  "col$datogarantia"'
      
        '  INNER JOIN "col$garantiacol" ON ("col$datogarantia".ID_AGENCIA' +
        ' = "col$garantiacol".ID_AGENCIA)'
      
        '  AND ("col$datogarantia".MATRICULA = "col$garantiacol".MATRICUL' +
        'A)'
      'WHERE'
      '  "col$garantiacol".ID_AGENCIA = :ID_AGENCIA AND '
      '  "col$garantiacol".ID_COLOCACION = :ID_COLOCACION AND'
      '  "col$datogarantia".MODELO_VEHICULO = 0'
      '')
    Left = 206
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COLOCACION'
        ParamType = ptUnknown
      end>
  end
  object IBDSPersonal: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select "gen$persona".PRIMER_APELLIDO,'
      '"gen$persona".SEGUNDO_APELLIDO,'
      '"gen$persona".NOMBRE,'
      '"col$colgarantias".ID_COLOCACION,'
      '"col$colgarantias".ID_IDENTIFICACION,'
      '"col$colgarantias".ID_PERSONA'
      'FROM "col$colgarantias"'
      'inner join "gen$persona" on'
      
        '("col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA) and (' +
        '"col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFI' +
        'CACION)'
      
        'where ID_COLOCACION = :"ID_COLOCACION" and ID_AGENCIA = :"ID_AGE' +
        'NCIA"')
    Left = 204
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_COLOCACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
    object IBDSPersonalPRIMER_APELLIDO: TIBStringField
      FieldName = 'PRIMER_APELLIDO'
      Origin = '"gen$persona"."PRIMER_APELLIDO"'
      Size = 30
    end
    object IBDSPersonalSEGUNDO_APELLIDO: TIBStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Origin = '"gen$persona"."SEGUNDO_APELLIDO"'
      Size = 30
    end
    object IBDSPersonalNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = '"gen$persona"."NOMBRE"'
      Size = 255
    end
    object IBDSPersonalID_COLOCACION: TIBStringField
      FieldName = 'ID_COLOCACION'
      Origin = '"col$colgarantias"."ID_COLOCACION"'
      Required = True
      FixedChar = True
      Size = 11
    end
    object IBDSPersonalID_IDENTIFICACION: TSmallintField
      FieldName = 'ID_IDENTIFICACION'
      Origin = '"col$colgarantias"."ID_IDENTIFICACION"'
      Required = True
    end
    object IBDSPersonalID_PERSONA: TIBStringField
      FieldName = 'ID_PERSONA'
      Origin = '"col$colgarantias"."ID_PERSONA"'
      Required = True
      FixedChar = True
      Size = 15
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 512
    Top = 8
    object CartaCobro1: TMenuItem
      Caption = 'Carta Cobro'
      OnClick = CartaCobro1Click
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 432
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Left = 400
  end
  object frCompositeReport1: TfrCompositeReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    DoublePassReport = False
    Left = 360
    Top = 65528
    ReportForm = {19000000}
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 304
    Top = 65520
    ReportForm = {19000000}
  end
  object IBcarta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    Left = 56
    Top = 72
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 32
    Top = 72
  end
  object DSPignoracion: TDataSource
    DataSet = IBDSPignoracion
    Left = 236
    Top = 64
  end
  object IBDSPignoracion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "col$datogarantia".NUMERO_ESCRITURA,'
      '  "col$datogarantia".FECHA_ESCRITURA,'
      '  "col$datogarantia".FECHA_AVALUO,'
      '  "col$datogarantia".CUENTAS_DE_ORDEN,'
      '  "col$datogarantia".POLIZA_INCENDIO,'
      '  "col$datogarantia".FECHA_INICIAL_POLIZA,'
      '  "col$datogarantia".FECHA_FINAL_POLIZA,'
      '  "col$datogarantia".MATRICULA,'
      '  "col$datogarantia".FECHA_MATRICULA,'
      '  "col$datogarantia".COLOR_VEHICULO,'
      '  "col$datogarantia".LINEA_VEHICULO,'
      '  "col$datogarantia".MARCA_VEHICULO,'
      '  "col$datogarantia".MODELO_VEHICULO,'
      '  "col$datogarantia".TIPO_VEHICULO,'
      '  "col$datogarantia".TIPO_SERVICIO,'
      '  "col$datogarantia".VALOR_ASEGURADO'
      'FROM'
      '  "col$datogarantia"'
      
        '  INNER JOIN "col$garantiacol" ON ("col$datogarantia".ID_AGENCIA' +
        ' = "col$garantiacol".ID_AGENCIA)'
      
        '  AND ("col$datogarantia".MATRICULA = "col$garantiacol".MATRICUL' +
        'A)'
      'WHERE'
      '  "col$garantiacol".ID_AGENCIA = :ID_AGENCIA AND'
      '  "col$garantiacol".ID_COLOCACION = :ID_COLOCACION AND'
      '  "col$datogarantia".MODELO_VEHICULO > 0')
    Left = 206
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COLOCACION'
        ParamType = ptUnknown
      end>
  end
end
