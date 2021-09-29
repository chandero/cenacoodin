object frmHistoricoCreditos: TfrmHistoricoCreditos
  Left = 456
  Top = 266
  Width = 317
  Height = 136
  Caption = 'Hist'#243'rico de Cr'#233'ditos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
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
    Width = 309
    Height = 57
    Align = alTop
    Caption = 'Rango a Evaluar'
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 23
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object Label2: TLabel
      Left = 141
      Top = 24
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object edFechaInicial: TDateTimePicker
      Left = 44
      Top = 21
      Width = 85
      Height = 20
      CalAlignment = dtaLeft
      Date = 44320.4572863889
      Time = 44320.4572863889
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object edFechaFinal: TDateTimePicker
      Left = 180
      Top = 22
      Width = 85
      Height = 20
      CalAlignment = dtaLeft
      Date = 44320.4572863889
      Time = 44320.4572863889
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 309
    Height = 37
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object btnCerrar: TBitBtn
      Left = 230
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
    end
    object btnExcel: TBitBtn
      Left = 6
      Top = 9
      Width = 75
      Height = 25
      Caption = 'A Excel'
      TabOrder = 1
      OnClick = btnExcelClick
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 88
    Top = 40
  end
  object IBQuery1: TIBQuery
    SQL.Strings = (
      'SELECT '
      'cc1.ID_COLOCACION,'
      'cs1.FECHA_RECEPCION,'
      'cc1.FECHA_DESEMBOLSO,'
      'cs1.VALOR_SOLICITADO,'
      'cs1.VALOR_APROBADO,'
      'cc1.VALOR_CUOTA,'
      'cc1.AMORTIZA_CAPITAL,'
      'cc1.AMORTIZA_INTERES,'
      'cc1.ID_CLASIFICACION,'
      'cc1.ID_GARANTIA,'
      'cs1.INGRESOS AS INGRESOS_SOLICITUD,'
      'cs1.DEDUCCIONES AS DEDUCCIONES_SOLICITUD,'
      'cs1.DISPONIBLE AS DISPONIBLE_SOLICITUD,'
      'cc1.PLAZO_COLOCACION,'
      'cs1.DESTINO,'
      'cs1.GARANTIA,'
      'cs1.DESCRIPCION_GARANTIA,'
      'cs1.FECHA_ANALISIS,'
      'cs1.FECHA_CONCEPTO,'
      'cs1.INVERSION,'
      'cc1.ID_LINEA,'
      'cs1.NUMERO_ACTA,'
      'cs1.NUMERO_CODEUDORES,'
      'cs1.OBSERVACION,'
      'cc1.VALOR_DESEMBOLSO - cc1.ABONOS_CAPITAL AS SALDO_ACTUAL,'
      'cc1.ID_ESTADO_COLOCACION,'
      'gp1.ID_IDENTIFICACION, '
      'gp1.ID_PERSONA, '
      'gp1.LUGAR_EXPEDICION, '
      'gp1.FECHA_EXPEDICION, '
      'gp1.NOMBRE, '
      'gp1.PRIMER_APELLIDO, '
      'gp1.SEGUNDO_APELLIDO,'
      'gp1.ID_TIPO_PERSONA, '
      'gp1.SEXO, '
      'gp1.FECHA_NACIMIENTO, '
      'gp1.LUGAR_NACIMIENTO, '
      'gp1.PROVINCIA_NACIMIENTO, '
      'gp1.DEPTO_NACIMIENTO, '
      'gp1.PAIS_NACIMIENTO, '
      'gp1.ID_TIPO_ESTADO_CIVIL, '
      'gp1.ID_CONYUGE, '
      'gp1.ID_IDENTIFICACION_CONYUGE, '
      'gp1.NOMBRE_CONYUGE, '
      'gp1.PRIMER_APELLIDO_CONYUGE, '
      'gp1.SEGUNDO_APELLIDO_CONYUGE, '
      'gp1.ID_APODERADO, '
      'gp1.ID_IDENTIFICACION_APODERADO, '
      'gp1.NOMBRE_APODERADO, '
      'gp1.PRIMER_APELLIDO_APODERADO, '
      'gp1.SEGUNDO_APELLIDO_APODERADO, '
      'gp1.PROFESION, '
      'gp1.ID_ESTADO, '
      'gp1.ID_TIPO_RELACION, '
      'gp1.ID_CIIU,'
      'gtciiu1.DESCRIPCION_CIIU,'
      'gp1.EMPRESA_LABORA, '
      'gp1.FECHA_INGRESO_EMPRESA, '
      'gp1.CARGO_ACTUAL, '
      'gp1.DECLARACION, '
      'gp1.INGRESOS_A_PRINCIPAL, '
      'gp1.INGRESOS_OTROS, '
      'gp1.INGRESOS_CONYUGE, '
      'gp1.INGRESOS_CONYUGE_OTROS, '
      'gp1.DESC_INGR_OTROS, gp1.EGRESOS_ALQUILER, '
      'gp1.EGRESOS_SERVICIOS, '
      'gp1.EGRESOS_TRANSPORTE, '
      'gp1.EGRESOS_ALIMENTACION, '
      'gp1.EGRESOS_DEUDAS, '
      'gp1.EGRESOS_OTROS, '
      'gp1.DESC_EGRE_OTROS, '
      'gp1.EGRESOS_CONYUGE, '
      'gp1.OTROS_EGRESOS_CONYUGE, '
      'gp1.TOTAL_ACTIVOS, '
      'gp1.TOTAL_PASIVOS, '
      'gp1.EDUCACION, '
      'gp1.RETEFUENTE, '
      'gp1.ACTA, '
      'gp1.FECHA_REGISTRO, '
      'gp1.ESCRITURA_CONSTITUCION, '
      'gp1.DURACION_SOCIEDAD, '
      'gp1.CAPITAL_SOCIAL, '
      'gp1.MATRICULA_MERCANTIL, '
      'gp1.EMAIL, '
      'gp1.FECHA_ACTUALIZACION,'
      'gpa1.NUMERO_HIJOS, '
      'gpa1.ID_OCUPACION, '
      'gto1.DESCRIPCION AS OCUPACION,'
      'gpa1.ID_TIPOCONTRATO, '
      'gpa1.DESCRIPCION_CONTRATO, '
      'gpa1.ID_SECTOR, '
      'gtsc1.DESCRIPCION AS SECTOR,'
      'gpa1.VENTA_ANUAL, '
      'gpa1.FECHA_ULTIMO_BALANCE, '
      'gpa1.NUMERO_EMPLEADOS, '
      'gpa1.DECLARA_RENTA, '
      'gpa1.PERSONAS_A_CARGO, '
      'gpa1.ID_ESTRATO, '
      'get1.DESCRIPCION,'
      'gpa1.CABEZAFAMILIA, '
      'gpa1.ID_ESTUDIO, '
      'gpa1.ID_TIPOVIVIENDA,'
      'gtv1.DESCRIPCION_TIPO,'
      'gpa2.ES_EMPLEADO, '
      'gpa2.ES_PEPS, '
      'gpa2.PERTENECE_A, '
      'gpa2.ES_FAMILIAR_DE, '
      'gpa2.PRIMER_APELLIDO AS PRIMER_APELLIDO_PEP, '
      'gpa2.SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO_PEP, '
      'gpa2.NOMBRE AS NOMBRE_PEP, '
      'gpa2.ID_PARENTESCO AS PARENTESCO_PEP,'
      'gpt1.DESCRIPCION_PARENTESCO,'
      'gpa2.EMAIL AS EMAIL_PEP, '
      'gpa2.INGRESOS_PENSION AS INGRESOS_PENSION_PEP, '
      'gpa2.ID_PEPS'
      'FROM "col$colocacion" cc1'
      
        'LEFT JOIN "col$desembolsoparcial" cdp1 ON cdp1.ID_COLOCACION = c' +
        'c1.ID_COLOCACION'
      
        'LEFT JOIN "col$solicitud" cs1 ON cs1.ID_SOLICITUD  = cdp1.ID_SOL' +
        'ICITUD'
      
        'LEFT JOIN "gen$persona" gp1 ON gp1.ID_IDENTIFICACION = cc1.ID_ID' +
        'ENTIFICACION AND gp1.ID_PERSONA = cc1.ID_PERSONA'
      
        'LEFT JOIN "gen$persadicional" gpa1 ON gpa1.ID_IDENTIFICACION = c' +
        'c1.ID_IDENTIFICACION AND gpa1.ID_PERSONA = cc1.ID_PERSONA'
      
        'LEFT JOIN "gen$persadicional2" gpa2 ON gpa2.ID_IDENTIFICACION = ' +
        'cc1.ID_IDENTIFICACION AND gpa2.ID_PERSONA = cc1.ID_PERSONA'
      
        'LEFT JOIN "gen$tiposparentesco" gpt1 ON gpt1.ID_PARENTESCO = gpa' +
        '2.ID_PARENTESCO '
      
        'LEFT JOIN "gen$estrato" get1 ON get1.ID_ESTRATO = gpa1.ID_ESTRAT' +
        'O'
      
        'LEFT JOIN "gen$tipovivienda" gtv1 ON gtv1.ID_TIPOVIVIENDA = gpa1' +
        '.ID_TIPOVIVIENDA'
      
        'LEFT JOIN "gen$tiposocupacion" gto1 ON gto1.ID_OCUPACION = gpa1.' +
        'ID_OCUPACION'
      
        'LEFT JOIN "gen$tipossectorcomercial" gtsc1 ON gtsc1.ID_SECTOR = ' +
        'gpa1.ID_SECTOR'
      
        'LEFT JOIN "gen$tiposciiu" gtciiu1 ON gtciiu1.ID_CIIU = gp1.ID_CI' +
        'IU '
      
        'WHERE cc1.ID_ESTADO_COLOCACION IN (0,1,2,7) AND cc1.FECHA_DESEMB' +
        'OLSO BETWEEN :FECHA_INICIAL AND :FECHA_FINAL'
      'ORDER BY cc1.ID_COLOCACION')
    Left = 56
    Top = 40
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
  object SD1: TSaveDialog
    Left = 144
    Top = 56
  end
  object CDSdata: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPdata'
    Left = 184
    Top = 40
  end
  object DPdata: TDataSetProvider
    DataSet = IBQuery1
    Constraints = True
    Left = 136
    Top = 8
  end
end
