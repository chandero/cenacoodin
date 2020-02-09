object frmArchivoPlanoMovimientosTarjetas: TfrmArchivoPlanoMovimientosTarjetas
  Left = 479
  Top = 321
  Width = 436
  Height = 138
  Caption = 'Archivo Plano Movimientos Tarjetas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 417
    Height = 49
    Caption = 'Periodo'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object Label2: TLabel
      Left = 160
      Top = 19
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object edFechaInicial: TDateTimePicker
      Left = 64
      Top = 16
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 43745.40179875
      Time = 43745.40179875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object edFechaFinal: TDateTimePicker
      Left = 208
      Top = 16
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 43745.40179875
      Time = 43745.40179875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object btnProcesar: TBitBtn
      Left = 320
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Procesar'
      TabOrder = 2
      OnClick = btnProcesarClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 77
    Width = 428
    Height = 27
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object btnCerrar: TBitBtn
      Left = 322
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 6
      Width = 305
      Height = 17
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 48
    Width = 417
    Height = 25
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 5
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label4: TLabel
      Left = 160
      Top = 5
      Width = 51
      Height = 13
      Caption = 'Secuencia'
    end
    object edFecha: TEdit
      Left = 42
      Top = 1
      Width = 103
      Height = 20
      ReadOnly = True
      TabOrder = 0
    end
    object edSecuencia: TEdit
      Left = 226
      Top = 0
      Width = 103
      Height = 20
      ReadOnly = True
      TabOrder = 1
    end
  end
  object IBQmovs: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT * FROM RECIBIR r '
      'WHERE '
      'r.ESTADO = '#39'APROBADA'#39' AND '
      'r.CANAL IN ('#39'POS'#39','#39'ATM'#39','#39'OFI'#39') AND '
      'r.VALOR <> 0 AND '
      'UPPER(r.DESCRIPCION) NOT LIKE '#39'%SIN TARJETA%'#39' AND '
      
        'r.FECHA_REGISTRO BETWEEN :FECHA_INICIAL  AND :FECHA_FINAL AND r.' +
        'OPERACION = '#39'DEBITO'#39
      'ORDER BY r.FECHA_REGISTRO ASC')
    Left = 56
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FINAL'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 104
    Top = 16
  end
  object IBQpersona: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'SELECT * FROM "gen$persona" p WHERE p.ID_IDENTIFICACION = :ID_ID' +
        'ENTIFICACION AND p.ID_PERSONA = :ID_PERSONA')
    Left = 144
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end>
  end
  object IBQsaldo: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'SELECT SALDO_ACTUAL FROM SALDO_ACTUAL(:ID_AGENCIA,:ID_TIPO_CAPTA' +
        'CION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANHO,:FECHA_INICIAL,:FECHA_F' +
        'INAL)')
    Left = 192
    Top = 16
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
      end
      item
        DataType = ftUnknown
        Name = 'ANHO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FINAL'
        ParamType = ptUnknown
      end>
  end
  object IBQmaestro: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT mt.ID_IDENTIFICACION, mt.ID_PERSONA FROM'
      '"cap$maestrotitular" mt'
      
        'LEFT JOIN "gen$persona" p ON p.ID_IDENTIFICACION = mt.ID_IDENTIF' +
        'ICACION AND p.ID_PERSONA = mt.ID_PERSONA'
      
        'WHERE mt.ID_AGENCIA = :ID_AGENCIA AND mt.ID_TIPO_CAPTACION = :ID' +
        '_TIPO_CAPTACION AND mt.NUMERO_CUENTA = :NUMERO_CUENTA AND mt.DIG' +
        'ITO_CUENTA = :DIGITO_CUENTA'
      'AND mt.NUMERO_TITULAR = 1')
    Left = 232
    Top = 16
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
  end
  object IBQtarjeta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT FIRST 1 vt.VITA_TARJETA FROM VIRTUAL_TARJETA vt'
      
        'INNER JOIN VIRTUAL_TARJETA_CUENTA vtc ON vtc.VITA_ID = vt.VITA_I' +
        'D'
      'INNER JOIN VIRTUAL_CUENTA vc ON vc.VICU_ID = vtc.VICU_ID'
      'WHERE '
      '    vc.VICU_ID_AGENCIA = :ID_AGENCIA and '
      '    vc.VICU_TIPO_CUENTA = :ID_TIPO_CAPTACION and'
      '    vc.VICU_NUMERO_CUENTA = :NUMERO_CUENTA and'
      '    vc.VICU_DIGITO_CUENTA = :DIGITO_CUENTA'
      'ORDER BY vt.VITA_TARJETA DESC')
    Left = 272
    Top = 16
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
  end
  object SD1: TSaveDialog
    Filter = 'Archivo de Texto|*.txt'
    InitialDir = 'C:\'
    Left = 24
    Top = 8
  end
end
