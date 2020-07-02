object FrmConsultaTarjeta: TFrmConsultaTarjeta
  Left = 402
  Top = 176
  Width = 577
  Height = 411
  AutoSize = True
  Caption = 'Consulta Tarjeta/Imagen Asociados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 472
    Height = 52
    Caption = 'Datos Asociados'
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 12
      Width = 79
      Height = 13
      Caption = 'Tipo Documento'
    end
    object Label2: TLabel
      Left = 196
      Top = 12
      Width = 95
      Height = 13
      Caption = 'N'#250'mero Documento'
    end
    object BitBtn1: TBitBtn
      Left = 359
      Top = 24
      Width = 104
      Height = 25
      Caption = '&Buscar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object dbTipo: TDBLookupComboBox
      Left = 9
      Top = 26
      Width = 183
      Height = 21
      KeyField = 'ID_IDENTIFICACION'
      ListField = 'DESCRIPCION_IDENTIFICACION'
      ListSource = DataSource1
      TabOrder = 2
      OnKeyPress = dbTipoKeyPress
    end
    object EdNumeroIdentificacion: TMemo
      Left = 195
      Top = 26
      Width = 153
      Height = 22
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnKeyPress = EdNumeroIdentificacionKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 49
    Width = 472
    Height = 103
    Caption = 'Tarjetas Activas y sus Cuentas Asociadas'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 9
      Top = 16
      Width = 456
      Height = 83
      DataSource = DataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TARJETA'
          Title.Caption = 'Tarjeta'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ASOCIADO'
          Title.Caption = 'Asociado'
          Width = 243
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUENTA'
          Title.Caption = 'Cuenta'
          Width = 61
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 149
    Width = 472
    Height = 153
    Caption = 'Imagenes Asociadas'
    TabOrder = 2
    object ImgFotoC: TImage
      Left = 7
      Top = 13
      Width = 135
      Height = 135
      Hint = 'Fotografia del Asociado'
      ParentShowHint = False
      ShowHint = True
      Stretch = True
    end
    object ImFirma: TImage
      Left = 146
      Top = 13
      Width = 320
      Height = 135
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 299
    Width = 471
    Height = 78
    Caption = 'Estado de la Conexi'#243'n'
    TabOrder = 3
    object mConexion: TMemo
      Left = 5
      Top = 14
      Width = 460
      Height = 60
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 472
    Top = 5
    Width = 97
    Height = 370
    TabOrder = 4
    object BitBtn2: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Nuevo'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
  object IbTipo: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$tiposidentificacion".ID_IDENTIFICACION,'
      '  "gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION'
      'FROM'
      '  "gen$tiposidentificacion"')
    Left = 712
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = IbTipo
    Left = 672
    Top = 16
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$agencia".DESCRIPCION_AGENCIA,'
      '  "gen$servidor".ID_HOST,'
      '  "gen$servidor".ID_PUERTO'
      'FROM'
      '  "gen$agencia"'
      
        '  INNER JOIN "gen$servidor" ON ("gen$agencia".ID_AGENCIA = "gen$' +
        'servidor".ID_AGENCIA)'
      'WHERE'
      '  "gen$agencia".ACTIVA = 1 AND '
      '  "gen$servidor".ID_SERVICIO = 1 AND '
      '  "gen$agencia".ID_AGENCIA > 0')
    Left = 696
    Top = 16
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 616
    Top = 320
  end
  object CdData: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 232
    Data = {
      6E0000009619E0BD0100000018000000030000000000030000006E0007544152
      4A45544101004900000001000557494454480200020012000841534F43494144
      4F0200490000000100055749445448020002002C01064355454E544101004900
      000001000557494454480200020014000000}
    object CdDataTARJETA: TStringField
      FieldName = 'TARJETA'
      Size = 18
    end
    object CdDataASOCIADO: TStringField
      FieldName = 'ASOCIADO'
      Size = 300
    end
    object CdDataCUENTA: TStringField
      FieldName = 'CUENTA'
    end
  end
  object DataSource2: TDataSource
    DataSet = CdData
    Left = 624
    Top = 248
  end
end
