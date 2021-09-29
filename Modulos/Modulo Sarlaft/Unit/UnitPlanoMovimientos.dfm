object frmPlanoMovimientos: TfrmPlanoMovimientos
  Left = 384
  Top = 194
  Width = 345
  Height = 138
  Caption = 'Plano de Movimientos SARLAFT'
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
  object Label3: TLabel
    Left = 4
    Top = 67
    Width = 39
    Height = 13
    Caption = 'Estado: '
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 6
      Width = 76
      Height = 13
      Caption = 'A'#241'o de Proceso'
    end
    object Label2: TLabel
      Left = 4
      Top = 30
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    object edAnho: TComboBox
      Left = 83
      Top = 3
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Seleccione el A'#241'o')
    end
    object edPeriodo: TComboBox
      Left = 83
      Top = 26
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Seleccione el Periodo'
      Items.Strings = (
        'Seleccione el Periodo'
        'Enero'
        'Febrero'
        'Marzo'
        'Abril'
        'Mayo'
        'Junio'
        'Julio'
        'Agosto'
        'Septiembre'
        'Octubre'
        'Noviembre'
        'Diciembre')
    end
    object btnExportar: TBitBtn
      Left = 238
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 2
      OnClick = btnExportarClick
    end
    object btnCerrar: TBitBtn
      Left = 238
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 3
      OnClick = btnCerrarClick
    end
  end
  object edEstado: TEdit
    Left = 56
    Top = 64
    Width = 257
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object IBQuery1: TIBQuery
    SQL.Strings = (
      
        'SELECT gp1.ID_PERSONA AS DOCUMENTO, TRIM(TRIM(gp1.PRIMER_APELLID' +
        'O) || '#39' '#39' || TRIM(gp1.SEGUNDO_APELLIDO) || '#39' '#39' || TRIM(gp1.NOMBR' +
        'E)) AS ASOCIADO, ctc1.CODIGO_CONTABLE AS CUENTA, 1 AS COMPROBANT' +
        'E , '#39'NOTA CONTABLE'#39' AS NOMBRE_COMPROBANTE, cpe1.DOCUMENTO_MOVIMI' +
        'ENTO AS NUMERO, cpe1.FECHA_MOVIMIENTO AS FECHA, '#39'NOTA CONTABLE'#39' ' +
        'AS DOCUMENTO_REFERENCIA, ctc1.DESCRIPCION AS PRODUCTO, IIF(cpe1.' +
        'ID_TIPO_MOVIMIENTO IN (1,2,34,39,40,51), '#39'EFECTIVO'#39', IIF(cpe1.ID' +
        '_TIPO_MOVIMIENTO IN (3,13,30,49,52), '#39'CHEQUE'#39', IIF( cpe1.ID_TIPO' +
        '_MOVIMIENTO IN(21,26,28), '#39'TARJETA DEBITO'#39' , '#39'OTRO'#39' ))) AS CANAL' +
        ', cpe1.DESCRIPCION_MOVIMIENTO AS DETALLE, cpe1.VALOR_CREDITO AS ' +
        'DEBITO, cpe1.VALOR_DEBITO AS CREDITO, ABS(cpe1.VALOR_CREDITO - c' +
        'pe1.VALOR_DEBITO) AS TOTAL_TRANSACCION, '#39'COODIN'#39' AS USUARIO, '#39#39' ' +
        'AS MENSAJE, '#39'01'#39' AS CENTRO_COSTO, gm1.NOMBRE AS CIUDAD_NACIMIENT' +
        'O, gm1.DPTO AS DEPARTAMENTO_NACIMIENTO, gm1.COD_MUNICIPIO AS COD' +
        'IGO_MUNICIPIO, (SELECT CAPTACIONES FROM SALDOS_PERSONA(gp1.ID_ID' +
        'ENTIFICACION, gp1.ID_PERSONA, :ANHO, :FECHA_INICIAL, :FECHA_FINA' +
        'L, :FECHA_CORTE)) AS AHORRO, 0 AS OTRO_AHORRO, (SELECT APORTES F' +
        'ROM SALDOS_PERSONA(gp1.ID_IDENTIFICACION, gp1.ID_PERSONA, :ANHO,' +
        ' :FECHA_INICIAL, :FECHA_FINAL, :FECHA_CORTE)) AS APORTES, (SELEC' +
        'T COLOCACIONES FROM SALDOS_PERSONA(gp1.ID_IDENTIFICACION, gp1.ID' +
        '_PERSONA, :ANHO, :FECHA_INICIAL, :FECHA_FINAL, :FECHA_CORTE)) AS' +
        ' SALDO_CARTERA, gd1.MUNICIPIO AS CIUDAD_RESIDENCIA, gm2.DPTO AS ' +
        'DEPARTAMENTO, '#39#39' AS CENTRO_COSTO_A, '#39#39' AS NOMBRE_CENTRO_COSTO_A,' +
        ' gp1.EMPRESA_LABORA AS COMPANIA, 0 AS CUOTA_AFILIACION, gp1.FECH' +
        'A_REGISTRO AS FECHA_INGRESO, '#39#39' AS ANTIGUEDAD_EMPLEADO, gp1.INGR' +
        'ESOS_A_PRINCIPAL AS SALARIO, '#39'N'#39' AS SALARIO_INTEGRAL, gp1.EDUCAC' +
        'ION AS APRENDIZAJE, gp1.INGRESOS_OTROS AS OTRO_INGRESO, gp1.EGRE' +
        'SOS_DEUDAS AS ENDEUDAMIENTO, '#39#39' AS X_NOMINA, gp1.SEXO AS GENERO,' +
        ' gpa1.ID_ESTRATO AS ESTRATO, gpa1.ID_ESTUDIO AS ESCOLARIDAD, gpa' +
        '1.CABEZAFAMILIA AS MUJER_CABEZA_FAMILIA, IIF(gemp1.DOCUMENTO = g' +
        'p1.ID_PERSONA, '#39'S'#39', '#39'N'#39') AS EMPLEADO, gpa1.ID_OCUPACION AS OCUPA' +
        'CION, 1 AS JORNADA_LABORAL, gpa1.ID_TIPOCONTRATO AS TIPO_CONTRAT' +
        'O, gp1.ID_TIPO_ESTADO_CIVIL AS ESTADO_CIVIL, gp1.ID_TIPO_RELACIO' +
        'N AS SOCIO, IIF(gpvg1.ID_AGENCIA > 0, '#39'S'#39', '#39'N'#39') AS DIRECTIVO, gd' +
        '2.MUNICIPIO AS CIUDAD_LABORA, gp1.CARGO_ACTUAL AS OCUPACION_PROF' +
        'ESIONAL, gp1.ID_CIIU AS CIIU, 0 AS OTROS_DESCUENTOS, (gp1.EGRESO' +
        'S_ALIMENTACION + gp1.EGRESOS_ALQUILER + gp1.EGRESOS_DEUDAS + gp1' +
        '.EGRESOS_OTROS + gp1.EGRESOS_SERVICIOS + gp1.EGRESOS_TRANSPORTE ' +
        '+ gp1.OTROS_EGRESOS_CONYUGE) AS EGRESOS, gp1.TOTAL_PASIVOS AS PA' +
        'SIVOS, gp1.TOTAL_ACTIVOS AS ACTIVOS, gpa1.ID_TIPOVIVIENDA AS TIP' +
        'O_VIVIENDA, gpa1.PERSONAS_A_CARGO AS PERSONAS_A_CARGO, '#39'EFECTIVO' +
        #39' AS FORMA_INGRESO, gpa2.ES_PEPS AS PEP, gp1.DECLARACION AS DECL' +
        'ARA_ORIGEN_FONDOS, gp1.FECHA_ACTUALIZACION AS FECHA_ACTUALIZACIO' +
        'N, DATEDIFF(YEAR, gp1.FECHA_NACIMIENTO, date :FECHA_CORTE) AS ED' +
        'AD FROM "cap$extracto" cpe1 INNER JOIN "cap$maestrotitular" cmt1' +
        ' ON cmt1.ID_AGENCIA = cpe1.ID_AGENCIA AND cmt1.ID_TIPO_CAPTACION' +
        ' = cpe1.ID_TIPO_CAPTACION AND cmt1.NUMERO_CUENTA = cpe1.NUMERO_C' +
        'UENTA AND cmt1.DIGITO_CUENTA = cpe1.DIGITO_CUENTA INNER JOIN "ge' +
        'n$persona" gp1 ON gp1.ID_IDENTIFICACION = cmt1.ID_IDENTIFICACION' +
        ' AND gp1.ID_PERSONA = cmt1.ID_PERSONA LEFT JOIN "gen$persadicion' +
        'al" gpa1 ON gpa1.ID_IDENTIFICACION = gp1.ID_IDENTIFICACION AND g' +
        'pa1.ID_PERSONA = gp1.ID_PERSONA LEFT JOIN "gen$persadicional2" g' +
        'pa2 ON gpa2.ID_IDENTIFICACION = gp1.ID_IDENTIFICACION AND gpa2.I' +
        'D_PERSONA = gp1.ID_PERSONA LEFT JOIN "gen$direccion" gd1 ON gd1.' +
        'ID_IDENTIFICACION = gp1.ID_IDENTIFICACION AND gd1.ID_PERSONA = g' +
        'p1.ID_PERSONA AND gd1.ID_DIRECCION = 1 LEFT JOIN "gen$direccion"' +
        ' gd2 ON gd2.ID_IDENTIFICACION = gp1.ID_IDENTIFICACION AND gd2.ID' +
        '_PERSONA = gp1.ID_PERSONA AND gd1.ID_DIRECCION = 2 INNER JOIN "c' +
        'ap$tipocaptacion" ctc1 ON ctc1.ID_TIPO_CAPTACION = cpe1.ID_TIPO_' +
        'CAPTACION LEFT JOIN "gen$municipios" gm1 ON gm1.DPTO = gp1.DEPTO' +
        '_NACIMIENTO AND gm1.NOMBRE = gp1.LUGAR_NACIMIENTO LEFT JOIN "gen' +
        '$municipios" gm2 ON gm2.COD_MUNICIPIO = gd1.COD_MUNICIPIO LEFT J' +
        'OIN "gen$empleado" gemp1 ON gemp1.DOCUMENTO = gp1.ID_PERSONA LEF' +
        'T JOIN "gen$privilegiados" gpvg1 ON gpvg1.ID_IDENTIFICACION_PRIV' +
        ' = gp1.ID_IDENTIFICACION AND gpvg1.ID_PERSONA_PRIV = gp1.ID_PERS' +
        'ONA WHERE cpe1.FECHA_MOVIMIENTO BETWEEN :FECHA_INICIAL AND :FECH' +
        'A_FINAL AND cpe1.ID_TIPO_MOVIMIENTO IN (1,2,20,21,22,23,24,25,26' +
        ',27,28,29,30,31,32,33,34,35,36,37,38,39,40,49,50,51,52,53,54,55)' +
        ' UNION ALL SELECT gp1.ID_PERSONA AS DOCUMENTO, TRIM(TRIM(gp1.PRI' +
        'MER_APELLIDO) || '#39' '#39' || TRIM(gp1.SEGUNDO_APELLIDO) || '#39' '#39' || TRI' +
        'M(gp1.NOMBRE)) AS ASOCIADO, ccp1.COD_CAPITAL_CP AS CUENTA, 1 AS ' +
        'COMPROBANTE , '#39'NOTA CONTABLE'#39' AS NOMBRE_COMPROBANTE, cpe1.ID_CBT' +
        'E_COLOCACION AS NUMERO, cpe1.FECHA_EXTRACTO AS FECHA, '#39'NOTA CONT' +
        'ABLE'#39' AS DOCUMENTO_REFERENCIA, '#39'CARTERA'#39' AS PRODUCTO, '#39'OTRO'#39' AS ' +
        'CANAL, '#39'ABONO DE CARTERA'#39' AS DETALLE, 0 AS DEBITO, cpe1.ABONO_CA' +
        'PITAL AS CREDITO, ABS(cpe1.ABONO_CAPITAL) AS TOTAL_TRANSACCION, ' +
        #39'COODIN'#39' AS USUARIO, '#39#39' AS MENSAJE, '#39'01'#39' AS CENTRO_COSTO, gm1.NO' +
        'MBRE AS CIUDAD_NACIMIENTO, gm1.DPTO AS DEPARTAMENTO_NACIMIENTO, ' +
        'gm1.COD_MUNICIPIO AS CODIGO_MUNICIPIO, (SELECT CAPTACIONES FROM ' +
        'SALDOS_PERSONA(gp1.ID_IDENTIFICACION, gp1.ID_PERSONA, :ANHO, :FE' +
        'CHA_INICIAL, :FECHA_FINAL, :FECHA_CORTE)) AS AHORRO, 0 AS OTRO_A' +
        'HORRO, (SELECT APORTES FROM SALDOS_PERSONA(gp1.ID_IDENTIFICACION' +
        ', gp1.ID_PERSONA, :ANHO, :FECHA_INICIAL, :FECHA_FINAL, :FECHA_CO' +
        'RTE)) AS APORTES, (SELECT COLOCACIONES FROM SALDOS_PERSONA(gp1.I' +
        'D_IDENTIFICACION, gp1.ID_PERSONA, :ANHO, :FECHA_INICIAL, :FECHA_' +
        'FINAL, :FECHA_CORTE)) AS SALDO_CARTERA, gd1.MUNICIPIO AS CIUDAD_' +
        'RESIDENCIA, gm2.DPTO AS DEPARTAMENTO, '#39#39' AS CENTRO_COSTO_A, '#39#39' A' +
        'S NOMBRE_CENTRO_COSTO_A, gp1.EMPRESA_LABORA AS COMPANIA, 0 AS CU' +
        'OTA_AFILIACION, gp1.FECHA_REGISTRO AS FECHA_INGRESO, '#39#39' AS ANTIG' +
        'UEDAD_EMPLEADO, gp1.INGRESOS_A_PRINCIPAL AS SALARIO, '#39'N'#39' AS SALA' +
        'RIO_INTEGRAL, gp1.EDUCACION AS APRENDIZAJE, gp1.INGRESOS_OTROS A' +
        'S OTRO_INGRESO, gp1.EGRESOS_DEUDAS AS ENDEUDAMIENTO, '#39#39' AS X_NOM' +
        'INA, gp1.SEXO AS GENERO, gpa1.ID_ESTRATO AS ESTRATO, gpa1.ID_EST' +
        'UDIO AS ESCOLARIDAD, gpa1.CABEZAFAMILIA AS MUJER_CABEZA_FAMILIA,' +
        ' IIF(gemp1.DOCUMENTO = gp1.ID_PERSONA, '#39'S'#39', '#39'N'#39') AS EMPLEADO, gp' +
        'a1.ID_OCUPACION AS OCUPACION, 1 AS JORNADA_LABORAL, gpa1.ID_TIPO' +
        'CONTRATO AS TIPO_CONTRATO, gp1.ID_TIPO_ESTADO_CIVIL AS ESTADO_CI' +
        'VIL, gp1.ID_TIPO_RELACION AS SOCIO, IIF(gpvg1.ID_AGENCIA > 0, '#39'S' +
        #39', '#39'N'#39') AS DIRECTIVO, gd2.MUNICIPIO AS CIUDAD_LABORA, gp1.CARGO_' +
        'ACTUAL AS OCUPACION_PROFESIONAL, gp1.ID_CIIU AS CIIU, 0 AS OTROS' +
        '_DESCUENTOS, (gp1.EGRESOS_ALIMENTACION + gp1.EGRESOS_ALQUILER + ' +
        'gp1.EGRESOS_DEUDAS + gp1.EGRESOS_OTROS + gp1.EGRESOS_SERVICIOS +' +
        ' gp1.EGRESOS_TRANSPORTE + gp1.OTROS_EGRESOS_CONYUGE) AS EGRESOS,' +
        ' gp1.TOTAL_PASIVOS AS PASIVOS, gp1.TOTAL_ACTIVOS AS ACTIVOS, gpa' +
        '1.ID_TIPOVIVIENDA AS TIPO_VIVIENDA, gpa1.PERSONAS_A_CARGO AS PER' +
        'SONAS_A_CARGO, '#39'EFECTIVO'#39' AS FORMA_INGRESO, gpa2.ES_PEPS AS PEP,' +
        ' gp1.DECLARACION AS DECLARA_ORIGEN_FONDOS, gp1.FECHA_ACTUALIZACI' +
        'ON AS FECHA_ACTUALIZACION, DATEDIFF(YEAR, gp1.FECHA_NACIMIENTO, ' +
        'date :FECHA_CORTE) AS EDAD FROM "col$extracto" cpe1 INNER JOIN "' +
        'col$colocacion" cc1 ON cc1.ID_COLOCACION = cpe1.ID_COLOCACION IN' +
        'NER JOIN "col$codigospuc" ccp1 ON ccp1.ID_CLASIFICACION = cc1.ID' +
        '_CLASIFICACION AND ccp1.ID_GARANTIA = ccp1.ID_GARANTIA AND ccp1.' +
        'ID_CATEGORIA = '#39'A'#39' INNER JOIN "gen$persona" gp1 ON gp1.ID_IDENTI' +
        'FICACION = cc1.ID_IDENTIFICACION AND gp1.ID_PERSONA = cc1.ID_PER' +
        'SONA LEFT JOIN "gen$persadicional" gpa1 ON gpa1.ID_IDENTIFICACIO' +
        'N = gp1.ID_IDENTIFICACION AND gpa1.ID_PERSONA = gp1.ID_PERSONA L' +
        'EFT JOIN "gen$persadicional2" gpa2 ON gpa2.ID_IDENTIFICACION = g' +
        'p1.ID_IDENTIFICACION AND gpa2.ID_PERSONA = gp1.ID_PERSONA LEFT J' +
        'OIN "gen$direccion" gd1 ON gd1.ID_IDENTIFICACION = gp1.ID_IDENTI' +
        'FICACION AND gd1.ID_PERSONA = gp1.ID_PERSONA AND gd1.ID_DIRECCIO' +
        'N = 1 LEFT JOIN "gen$direccion" gd2 ON gd2.ID_IDENTIFICACION = g' +
        'p1.ID_IDENTIFICACION AND gd2.ID_PERSONA = gp1.ID_PERSONA AND gd1' +
        '.ID_DIRECCION = 2 LEFT JOIN "gen$municipios" gm1 ON gm1.DPTO = g' +
        'p1.DEPTO_NACIMIENTO AND gm1.NOMBRE = gp1.LUGAR_NACIMIENTO LEFT J' +
        'OIN "gen$municipios" gm2 ON gm2.COD_MUNICIPIO = gd1.COD_MUNICIPI' +
        'O LEFT JOIN "gen$empleado" gemp1 ON gemp1.DOCUMENTO = gp1.ID_PER' +
        'SONA LEFT JOIN "gen$privilegiados" gpvg1 ON gpvg1.ID_IDENTIFICAC' +
        'ION_PRIV = gp1.ID_IDENTIFICACION AND gpvg1.ID_PERSONA_PRIV = gp1' +
        '.ID_PERSONA WHERE cpe1.FECHA_EXTRACTO BETWEEN :FECHA_INICIAL AND' +
        ' :FECHA_FINAL UNION ALL SELECT gp1.ID_PERSONA AS DOCUMENTO, TRIM' +
        '(TRIM(gp1.PRIMER_APELLIDO) || '#39' '#39' || TRIM(gp1.SEGUNDO_APELLIDO) ' +
        '|| '#39' '#39' || TRIM(gp1.NOMBRE)) AS ASOCIADO, ccp1.COD_CAPITAL_CP AS ' +
        'CUENTA, 1 AS COMPROBANTE , '#39'NOTA CONTABLE'#39' AS NOMBRE_COMPROBANTE' +
        ', cc1.NOTA_CONTABLE AS NUMERO, cc1.FECHA_DESEMBOLSO AS FECHA, '#39'N' +
        'OTA CONTABLE'#39' AS DOCUMENTO_REFERENCIA, '#39'CARTERA'#39' AS PRODUCTO, '#39'O' +
        'TRO'#39' AS CANAL, '#39'DESEMBOLSO DE CREDITO'#39' AS DETALLE, cc1.VALOR_DES' +
        'EMBOLSO AS DEBITO, 0 AS CREDITO, ABS(cc1.VALOR_DESEMBOLSO) AS TO' +
        'TAL_TRANSACCION, '#39'COODIN'#39' AS USUARIO, '#39#39' AS MENSAJE, '#39'01'#39' AS CEN' +
        'TRO_COSTO, gm1.NOMBRE AS CIUDAD_NACIMIENTO, gm1.DPTO AS DEPARTAM' +
        'ENTO_NACIMIENTO, gm1.COD_MUNICIPIO AS CODIGO_MUNICIPIO, (SELECT ' +
        'CAPTACIONES FROM SALDOS_PERSONA(gp1.ID_IDENTIFICACION, gp1.ID_PE' +
        'RSONA, :ANHO, :FECHA_INICIAL, :FECHA_FINAL, :FECHA_CORTE)) AS AH' +
        'ORRO, 0 AS OTRO_AHORRO, (SELECT APORTES FROM SALDOS_PERSONA(gp1.' +
        'ID_IDENTIFICACION, gp1.ID_PERSONA, :ANHO, :FECHA_INICIAL, :FECHA' +
        '_FINAL, :FECHA_CORTE)) AS APORTES, (SELECT COLOCACIONES FROM SAL' +
        'DOS_PERSONA(gp1.ID_IDENTIFICACION, gp1.ID_PERSONA, :ANHO, :FECHA' +
        '_INICIAL, :FECHA_FINAL, :FECHA_CORTE)) AS SALDO_CARTERA, gd1.MUN' +
        'ICIPIO AS CIUDAD_RESIDENCIA, gm2.DPTO AS DEPARTAMENTO, '#39#39' AS CEN' +
        'TRO_COSTO_A, '#39#39' AS NOMBRE_CENTRO_COSTO_A, gp1.EMPRESA_LABORA AS ' +
        'COMPANIA, 0 AS CUOTA_AFILIACION, gp1.FECHA_REGISTRO AS FECHA_ING' +
        'RESO, '#39#39' AS ANTIGUEDAD_EMPLEADO, gp1.INGRESOS_A_PRINCIPAL AS SAL' +
        'ARIO, '#39'N'#39' AS SALARIO_INTEGRAL, gp1.EDUCACION AS APRENDIZAJE, gp1' +
        '.INGRESOS_OTROS AS OTRO_INGRESO, gp1.EGRESOS_DEUDAS AS ENDEUDAMI' +
        'ENTO, '#39#39' AS X_NOMINA, gp1.SEXO AS GENERO, gpa1.ID_ESTRATO AS EST' +
        'RATO, gpa1.ID_ESTUDIO AS ESCOLARIDAD, gpa1.CABEZAFAMILIA AS MUJE' +
        'R_CABEZA_FAMILIA, IIF(gemp1.DOCUMENTO = gp1.ID_PERSONA, '#39'S'#39', '#39'N'#39 +
        ') AS EMPLEADO, gpa1.ID_OCUPACION AS OCUPACION, 1 AS JORNADA_LABO' +
        'RAL, gpa1.ID_TIPOCONTRATO AS TIPO_CONTRATO, gp1.ID_TIPO_ESTADO_C' +
        'IVIL AS ESTADO_CIVIL, gp1.ID_TIPO_RELACION AS SOCIO, IIF(gpvg1.I' +
        'D_AGENCIA > 0, '#39'S'#39', '#39'N'#39') AS DIRECTIVO, gd2.MUNICIPIO AS CIUDAD_L' +
        'ABORA, gp1.CARGO_ACTUAL AS OCUPACION_PROFESIONAL, gp1.ID_CIIU AS' +
        ' CIIU, 0 AS OTROS_DESCUENTOS, (gp1.EGRESOS_ALIMENTACION + gp1.EG' +
        'RESOS_ALQUILER + gp1.EGRESOS_DEUDAS + gp1.EGRESOS_OTROS + gp1.EG' +
        'RESOS_SERVICIOS + gp1.EGRESOS_TRANSPORTE + gp1.OTROS_EGRESOS_CON' +
        'YUGE) AS EGRESOS, gp1.TOTAL_PASIVOS AS PASIVOS, gp1.TOTAL_ACTIVO' +
        'S AS ACTIVOS, gpa1.ID_TIPOVIVIENDA AS TIPO_VIVIENDA, gpa1.PERSON' +
        'AS_A_CARGO AS PERSONAS_A_CARGO, '#39'EFECTIVO'#39' AS FORMA_INGRESO, gpa' +
        '2.ES_PEPS AS PEP, gp1.DECLARACION AS DECLARA_ORIGEN_FONDOS, gp1.' +
        'FECHA_ACTUALIZACION AS FECHA_ACTUALIZACION, DATEDIFF(YEAR, gp1.F' +
        'ECHA_NACIMIENTO, date :FECHA_CORTE) AS EDAD FROM "col$colocacion' +
        '" cc1 INNER JOIN "col$codigospuc" ccp1 ON ccp1.ID_CLASIFICACION ' +
        '= cc1.ID_CLASIFICACION AND ccp1.ID_GARANTIA = ccp1.ID_GARANTIA A' +
        'ND ccp1.ID_CATEGORIA = '#39'A'#39' INNER JOIN "gen$persona" gp1 ON gp1.I' +
        'D_IDENTIFICACION = cc1.ID_IDENTIFICACION AND gp1.ID_PERSONA = cc' +
        '1.ID_PERSONA LEFT JOIN "gen$persadicional" gpa1 ON gpa1.ID_IDENT' +
        'IFICACION = gp1.ID_IDENTIFICACION AND gpa1.ID_PERSONA = gp1.ID_P' +
        'ERSONA LEFT JOIN "gen$persadicional2" gpa2 ON gpa2.ID_IDENTIFICA' +
        'CION = gp1.ID_IDENTIFICACION AND gpa2.ID_PERSONA = gp1.ID_PERSON' +
        'A LEFT JOIN "gen$direccion" gd1 ON gd1.ID_IDENTIFICACION = gp1.I' +
        'D_IDENTIFICACION AND gd1.ID_PERSONA = gp1.ID_PERSONA AND gd1.ID_' +
        'DIRECCION = 1 LEFT JOIN "gen$direccion" gd2 ON gd2.ID_IDENTIFICA' +
        'CION = gp1.ID_IDENTIFICACION AND gd2.ID_PERSONA = gp1.ID_PERSONA' +
        ' AND gd1.ID_DIRECCION = 2 LEFT JOIN "gen$municipios" gm1 ON gm1.' +
        'DPTO = gp1.DEPTO_NACIMIENTO AND gm1.NOMBRE = gp1.LUGAR_NACIMIENT' +
        'O LEFT JOIN "gen$municipios" gm2 ON gm2.COD_MUNICIPIO = gd1.COD_' +
        'MUNICIPIO LEFT JOIN "gen$empleado" gemp1 ON gemp1.DOCUMENTO = gp' +
        '1.ID_PERSONA LEFT JOIN "gen$privilegiados" gpvg1 ON gpvg1.ID_IDE' +
        'NTIFICACION_PRIV = gp1.ID_IDENTIFICACION AND gpvg1.ID_PERSONA_PR' +
        'IV = gp1.ID_PERSONA WHERE cc1.FECHA_DESEMBOLSO BETWEEN :FECHA_IN' +
        'ICIAL AND :FECHA_FINAL AND cc1.ID_ESTADO_COLOCACION IN (0,1,2,7)')
    Left = 232
    Top = 36
    ParamData = <
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
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
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
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
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
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
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
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
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
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
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
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
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
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
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
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
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
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
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
  object SD1: TSaveDialog
    Left = 296
    Top = 40
  end
end
