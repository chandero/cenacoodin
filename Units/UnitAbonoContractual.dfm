object FrmAbonoContractual: TFrmAbonoContractual
  Left = 210
  Top = 200
  Width = 265
  Height = 115
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Informe Abonos Contractual'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 153
    Height = 81
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 34
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object dtFecha: TDateTimePicker
      Left = 46
      Top = 31
      Width = 99
      Height = 21
      CalAlignment = dtaLeft
      Date = 40158.3599198958
      Time = 40158.3599198958
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnKeyPress = dtFechaKeyPress
    end
  end
  object Panel2: TPanel
    Left = 153
    Top = 0
    Width = 104
    Height = 81
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 8
      Top = 9
      Width = 84
      Height = 25
      Caption = '&Ejecutar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 9
      Top = 45
      Width = 84
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT'
      
        '  '#39'50'#39' || "cap$extracto".ID_AGENCIA ||'#39'-'#39'|| "cap$extracto".NUMER' +
        'O_CUENTA AS FIELD_1,'
      '  "cap$extracto".DESCRIPCION_MOVIMIENTO,'
      '  "cap$extracto".VALOR_DEBITO,'
      '  "cap$extracto".VALOR_CREDITO,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO'
      'FROM'
      '  "cap$extracto"'
      
        '  INNER JOIN "cap$maestrotitular" ON ("cap$extracto".ID_AGENCIA ' +
        '= "cap$maestrotitular".ID_AGENCIA)'
      
        '  AND ("cap$extracto".ID_TIPO_CAPTACION = "cap$maestrotitular".I' +
        'D_TIPO_CAPTACION)'
      
        '  AND ("cap$extracto".NUMERO_CUENTA = "cap$maestrotitular".NUMER' +
        'O_CUENTA)'
      
        '  AND ("cap$extracto".DIGITO_CUENTA = "cap$maestrotitular".DIGIT' +
        'O_CUENTA)'
      
        '  INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFIC' +
        'ACION = "gen$persona".ID_IDENTIFICACION)'
      
        '  AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSON' +
        'A)'
      'WHERE'
      '  "cap$extracto".ID_TIPO_CAPTACION = 5 AND'
      '  "cap$extracto".FECHA_MOVIMIENTO = :FECHA AND'
      '  "cap$extracto".ID_AGENCIA = :ID_AGENCIA AND'
      '  "cap$maestrotitular".NUMERO_TITULAR = 1')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 80
    Top = 8
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = IBQuery1
    Left = 104
    Top = 32
  end
end
