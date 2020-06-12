object frmInformeCDATLiquidadoUnaFecha: TfrmInformeCDATLiquidadoUnaFecha
  Left = 551
  Top = 188
  Width = 343
  Height = 109
  Caption = 'Informe CDAT Liquidado Una Fecha'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 107
    Height = 13
    Caption = 'Fecha del Liquidaci'#243'n:'
  end
  object edFecha: TDateTimePicker
    Left = 136
    Top = 12
    Width = 89
    Height = 21
    CalAlignment = dtaLeft
    Date = 43991.7031709259
    Time = 43991.7031709259
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Excel'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object IBQuery1: TIBQuery
    SQL.Strings = (
      
        'SELECT ce.ID_AGENCIA, ce.ID_TIPO_CAPTACION, ce.NUMERO_CUENTA, ce' +
        '.DIGITO_CUENTA, t.ID_PERSONA, (p.NOMBRE || '#39' '#39' || p.PRIMER_APELL' +
        'IDO || '#39' '#39' || p.NOMBRE) AS NOMBRE, ce.VALOR_DEBITO AS PAGADO, m.' +
        'ID_TIPO_CAPTACION_ABONO, m.NUMERO_CUENTA_ABONO FROM "cap$extract' +
        'o" ce'
      
        'INNER JOIN "cap$maestro" m ON m.ID_AGENCIA  = ce.ID_AGENCIA AND ' +
        'm.ID_TIPO_CAPTACION  = ce.ID_TIPO_CAPTACION  AND m.NUMERO_CUENTA' +
        '  = ce.NUMERO_CUENTA  AND m.DIGITO_CUENTA  = ce.DIGITO_CUENTA '
      
        'INNER JOIN "cap$maestrotitular" t ON t.ID_AGENCIA  = m.ID_AGENCI' +
        'A AND t.ID_TIPO_CAPTACION  = m.ID_TIPO_CAPTACION  AND t.NUMERO_C' +
        'UENTA  = m.NUMERO_CUENTA  AND t.DIGITO_CUENTA  = m.DIGITO_CUENTA' +
        ' AND t.NUMERO_TITULAR = 1'
      
        'INNER JOIN "gen$persona" p ON p.ID_IDENTIFICACION = t.ID_IDENTIF' +
        'ICACION AND p.ID_PERSONA = t.ID_PERSONA'
      
        'WHERE ce.ID_TIPO_CAPTACION  = 6 AND ce.ID_TIPO_MOVIMIENTO = 15 A' +
        'ND ce.FECHA_MOVIMIENTO = :FECHA_MOVIMIENTO AND ce.VALOR_DEBITO >' +
        ' 0')
    Left = 8
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_MOVIMIENTO'
        ParamType = ptUnknown
      end>
  end
  object SD1: TSaveDialog
    DefaultExt = 'xls'
    Left = 216
    Top = 40
  end
end
