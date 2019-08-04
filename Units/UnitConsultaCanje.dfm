object FrmConsultaCanje: TFrmConsultaCanje
  Left = 514
  Top = 239
  Width = 513
  Height = 371
  AutoSize = True
  Caption = 'Consulta de Canjes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 409
    Height = 337
    Caption = 'Cuentas en Canje'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 3
      Top = 14
      Width = 398
      Height = 315
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_TIPO_CAPTACION'
          Title.Caption = 'TP'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_CUENTA'
          Title.Caption = 'NUMERO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_CHEQUE'
          Title.Caption = 'CHEQUE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ENTRADA'
          Title.Caption = 'FECHA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_CHEQUE'
          Title.Caption = 'VALOR'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 408
    Top = 5
    Width = 97
    Height = 331
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Consultar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 9
      Top = 37
      Width = 75
      Height = 25
      Caption = 'C&errar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select NUMERO_CHEQUE,ID_TIPO_CAPTACION,NUMERO_CUENTA,FECHA_ENTRA' +
        'DA,VALOR_CHEQUE'
      'from "cap$canje"'
      'where LIBERADO = 0 and FECHA_ENTRADA > '#39'2010/01/01'#39)
    Left = 464
    Top = 136
    object IBQuery1NUMERO_CHEQUE: TIntegerField
      FieldName = 'NUMERO_CHEQUE'
      Origin = '"cap$canje"."NUMERO_CHEQUE"'
      Required = True
    end
    object IBQuery1ID_TIPO_CAPTACION: TSmallintField
      FieldName = 'ID_TIPO_CAPTACION'
      Origin = '"cap$canje"."ID_TIPO_CAPTACION"'
      Required = True
    end
    object IBQuery1NUMERO_CUENTA: TIntegerField
      FieldName = 'NUMERO_CUENTA'
      Origin = '"cap$canje"."NUMERO_CUENTA"'
      Required = True
    end
    object IBQuery1FECHA_ENTRADA: TDateField
      FieldName = 'FECHA_ENTRADA'
      Origin = '"cap$canje"."FECHA_ENTRADA"'
    end
    object IBQuery1VALOR_CHEQUE: TIBBCDField
      FieldName = 'VALOR_CHEQUE'
      Origin = '"cap$canje"."VALOR_CHEQUE"'
      DisplayFormat = '##,#'
      Precision = 18
      Size = 3
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 416
    Top = 120
  end
end
