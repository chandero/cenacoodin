object frmSumatorias: TfrmSumatorias
  Left = 198
  Top = 99
  BorderStyle = bsDialog
  Caption = 'Sumatoria de Productos'
  ClientHeight = 379
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GBSumCap: TGroupBox
    Left = 0
    Top = 27
    Width = 494
    Height = 156
    Align = alTop
    Caption = 'Sumatoria de Captaciones'
    TabOrder = 0
    object GridCaptaciones: TXStringGrid
      Left = 2
      Top = 15
      Width = 490
      Height = 139
      Align = alClient
      ColCount = 3
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 7
      TabOrder = 0
      FixedLineColor = clBlack
      Columns = <
        item
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Style = [fsBold]
          HeaderAlignment = taCenter
          Caption = 'DESCRIPCION'
          Width = 250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        item
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Style = [fsBold]
          HeaderAlignment = taCenter
          Caption = 'CANTIDAD'
          Width = 69
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Alignment = taRightJustify
        end
        item
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Style = [fsBold]
          HeaderAlignment = taCenter
          Caption = 'SALDO FECHA CORTE'
          Width = 146
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Alignment = taRightJustify
        end>
      MultiLine = False
      ImmediateEditMode = False
      ColWidths = (
        250
        69
        146)
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 348
    Width = 494
    Height = 31
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object BtnAceptar: TBitBtn
      Left = 348
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000008C00000094
        0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
        210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
        420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
        94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
        04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
        0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
        170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
        13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
        1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
        1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
        1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 210
    Width = 494
    Height = 114
    Align = alBottom
    Caption = 'Sumatoria de Colocaciones a la Fecha'
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 490
      Height = 97
      Align = alClient
      DataSource = DataSource2
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
          Width = 270
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'CANTIDAD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO'
          Title.Alignment = taCenter
          Title.Caption = 'SUMATORIA ACTUAL'
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 183
    Width = 494
    Height = 24
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 180
      Top = 4
      Width = 86
      Height = 13
      Caption = 'Total Captaciones'
    end
    object EdSumaCaptacion: TStaticText
      Left = 272
      Top = 0
      Width = 147
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 324
    Width = 494
    Height = 24
    Align = alBottom
    TabOrder = 4
    object Label2: TLabel
      Left = 178
      Top = 4
      Width = 91
      Height = 13
      Caption = 'Total Colocaciones'
    end
    object EdSumaColocacion: TStaticText
      Left = 272
      Top = 0
      Width = 147
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 494
    Height = 27
    Align = alTop
    TabOrder = 5
    object Label3: TLabel
      Left = 8
      Top = 4
      Width = 73
      Height = 13
      Caption = 'Fecha de Corte'
    end
    object EdFecha: TDateTimePicker
      Left = 86
      Top = 2
      Width = 93
      Height = 21
      CalAlignment = dtaLeft
      Date = 37999.4722045486
      Time = 37999.4722045486
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object CmdActualizar: TBitBtn
      Left = 184
      Top = 2
      Width = 81
      Height = 21
      Caption = '&Actualizar'
      TabOrder = 1
      OnClick = CmdActualizarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B0000000100000001000000840000088C
        0800108C080018941000219410001894180029941800219C2100299C210029A5
        2900E78C31005AA53900B56B4A006BAD4A0073AD4A008C6B5200946B5200E79C
        5200A5635A00A56B5A00BD7B5A0084B55A00FFB55A0063BD6300A5636B00A573
        6B00BD846B00C6846B00D6946B00A5B56B0073BD6B00DE9C7300CEB5730094BD
        73009CBD7300ADBD730073C673007BC6730084C6730094C673009CC67300E7AD
        7B00DEBD7B00EFBD7B009CC67B00EFC67B00EFBD84009CC68400EFC68400F7C6
        840084CE8400EFC68C00F7CE8C00B5AD9400ADB59400EFC69400A5CE9400C6CE
        9400D6CE9400E7CE9400F7CE9400BDCE9C00EFCE9C00BDD69C00EFCEA500ADD6
        A500BDD6A500F7D6A500A5DEA500EFD6AD00F7D6AD00B5DEAD00DECEB500F7D6
        B500F7DEB500F7DEBD00DEC6C600FFEFC600FFEFCE00E7E7D600F7EFD600FFEF
        DE00DEF7DE00E7F7DE00FFEFE700E7F7E700FFF7E700F7F7EF00FFF7EF00FFF7
        F700F7FFF700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C18181818
        1818181818181818185C5C5C184D393A3E3B302E2B2E2E30185C5C5C184E2208
        0D04040B202B2B30185C5C5C12513D0200000000062A2B30185C5C5C12563D03
        0003230E000E2E30185C5C5C19584201000015401D0D3330185C5C5C195D4F38
        2F212245402C3733185C5C5C1A5D4454502F212122403E3C185C5C5C1A5D2441
        5426000001454043185C5C5C1C5D32002541050002494640185C5C5C1C5D5709
        00000000024E4835185C5C5C1F5D5D521707071E08101313185C5C5C1F5D5D5D
        5D52525B360F110A0C5C5C5C295D5D5D5D5D5D5D4C1316145C5C5C5C29575757
        575757574C131A5C5C5C5C5C291C1C1C1C1C1C1C1C135C5C5C5C}
    end
  end
  object DataSource2: TDataSource
    DataSet = IBQuery2
    Left = 388
    Top = 192
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'SELECT "col$colocacion".ID_ESTADO_COLOCACION,"col$estado".DESCRI' +
        'PCION_ESTADO_COLOCACION AS DESCRIPCION, COUNT(*) AS TOTAL, SUM("' +
        'col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPIT' +
        'AL) AS SALDO from "col$colocacion"'
      
        'INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACIO' +
        'N = "col$estado".ID_ESTADO_COLOCACION)'
      
        'WHERE ("col$estado".ES_NOVISADO = 0 and "col$estado".ES_ANULADO ' +
        '= 0 and "col$estado".ES_CANCELADO = 0 and "col$estado".ES_SALDAD' +
        'O = 0 )'
      
        'GROUP BY "col$colocacion".ID_ESTADO_COLOCACION, "col$estado".DES' +
        'CRIPCION_ESTADO_COLOCACION')
    Left = 388
    Top = 220
    object IBQuery2ID_ESTADO_COLOCACION: TSmallintField
      FieldName = 'ID_ESTADO_COLOCACION'
      Required = True
    end
    object IBQuery2DESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 100
    end
    object IBQuery2SALDO: TIBBCDField
      FieldName = 'SALDO'
      DisplayFormat = '#,#0.00'
      currency = True
      Precision = 18
      Size = 3
    end
    object IBQuery2TOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      
        'SELECT "cap$maestrosaldoinicial".ID_TIPO_CAPTACION,"cap$tipocapt' +
        'acion".DESCRIPCION, SUM("cap$maestrosaldoinicial".SALDO_INICIAL)' +
        ' AS INICIAL FROM "cap$maestrosaldoinicial"'
      
        'INNER JOIN "cap$tipocaptacion" ON ("cap$tipocaptacion".ID_TIPO_C' +
        'APTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION)'
      
        'WHERE ANO = :ANO GROUP BY "cap$maestrosaldoinicial".ID_TIPO_CAPT' +
        'ACION,"cap$tipocaptacion".DESCRIPCION')
    Transaction = dmGeneral.IBTransaction1
    Left = 388
    Top = 74
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      
        'SELECT SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CR' +
        'EDITO) AS MOVIMIENTO FROM "cap$extracto" WHERE "cap$extracto".ID' +
        '_TIPO_CAPTACION = :ID_TIPO_CAPTACION and "cap$extracto".FECHA_MO' +
        'VIMIENTO BETWEEN :FECHA1 and :FECHA2')
    Transaction = dmGeneral.IBTransaction1
    Left = 388
    Top = 102
  end
  object IBSQL3: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'select count(*) as TOTAL from "cap$maestro"'
      
        'inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$' +
        'tiposestado".ID_ESTADO)'
      
        ' where "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ' +
        '"cap$tiposestado".SE_SUMA <> 0')
    Transaction = dmGeneral.IBTransaction1
    Left = 388
    Top = 132
  end
  object IBSQL4: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      
        'select SUM("cap$maestro".VALOR_INICIAL) as TOTAL from "cap$maest' +
        'ro"'
      
        'inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$' +
        'tiposestado".ID_ESTADO)'
      
        ' where "cap$maestro".ID_TIPO_CAPTACION = 6 and "cap$tiposestado"' +
        '.SE_SUMA <> 0')
    Transaction = dmGeneral.IBTransaction1
    Left = 416
    Top = 76
  end
end
