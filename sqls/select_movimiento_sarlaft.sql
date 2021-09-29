SELECT
			gp1.ID_PERSONA AS DOCUMENTO, 
			TRIM(TRIM(gp1.PRIMER_APELLIDO) || ' ' || TRIM(gp1.SEGUNDO_APELLIDO) || ' ' || TRIM(gp1.NOMBRE)) AS ASOCIADO, 
			ctc1.CODIGO_CONTABLE  AS CUENTA, 
			1 AS COMPROBANTE ,
			'NOTA CONTABLE'  AS NOMBRE_COMPROBANTE, 
			cpe1.DOCUMENTO_MOVIMIENTO AS NUMERO,
			cpe1.FECHA_MOVIMIENTO AS FECHA,
			'NOTA CONTABLE' AS DOCUMENTO_REFERENCIA,
			ctc1.DESCRIPCION AS PRODUCTO,
			IIF(cpe1.ID_TIPO_MOVIMIENTO IN (1,2,34,39,40,51), 
				'EFECTIVO', 
				IIF(cpe1.ID_TIPO_MOVIMIENTO IN (3,13,30,49,52),
					'CHEQUE', 
					IIF( cpe1.ID_TIPO_MOVIMIENTO IN(21,26,28),
						'TARJETA DEBITO' ,
						'OTRO' ))) AS CANAL,
			cpe1.DESCRIPCION_MOVIMIENTO AS DETALLE,
			cpe1.VALOR_CREDITO AS DEBITO,
			cpe1.VALOR_DEBITO AS CREDITO,
			ABS(cpe1.VALOR_CREDITO - cpe1.VALOR_DEBITO) AS TOTAL_TRANSACCION,
			'COODIN' AS USUARIO,
			'' AS MENSAJE,
			'01' AS CENTRO_COSTO,
			gm1.NOMBRE AS CIUDAD_NACIMIENTO,
			gm1.DPTO AS DEPARTAMENTO_NACIMIENTO,
			gm1.COD_MUNICIPIO AS CODIGO_MUNICIPIO,
			(SELECT CAPTACIONES FROM SALDOS_PERSONA(gp1.ID_IDENTIFICACION, gp1.ID_PERSONA, :ANHO, :FECHA_INICIAL, :FECHA_FINAL, :FECHA_CORTE))  AS AHORRO,
			0 AS OTRO_AHORRO,
  		    (SELECT APORTES FROM SALDOS_PERSONA(gp1.ID_IDENTIFICACION, gp1.ID_PERSONA, :ANHO, :FECHA_INICIAL, :FECHA_FINAL, :FECHA_CORTE))  AS APORTES,
  		    (SELECT COLOCACIONES FROM SALDOS_PERSONA(gp1.ID_IDENTIFICACION, gp1.ID_PERSONA, :ANHO, :FECHA_INICIAL, :FECHA_FINAL, :FECHA_CORTE))  AS SALDO_CARTERA,
			gd1.MUNICIPIO  AS CIUDAD_RESIDENCIA,
			gm2.DPTO AS DEPARTAMENTO,
			'' AS CENTRO_COSTO_A,
			'' AS NOMBRE_CENTRO_COSTO_A,
			gp1.EMPRESA_LABORA AS COMPANIA,
			0 AS CUOTA_AFILIACION,
			gp1.FECHA_REGISTRO AS FECHA_INGRESO,
			'' AS ANTIGUEDAD_EMPLEADO,
			gp1.INGRESOS_A_PRINCIPAL AS SALARIO,
			'N' AS SALARIO_INTEGRAL,
			gp1.EDUCACION AS APRENDIZAJE,
			gp1.INGRESOS_OTROS AS OTRO_INGRESO,
			gp1.EGRESOS_DEUDAS  AS ENDEUDAMIENTO,
			'' AS X_NOMINA,
			gp1.SEXO AS GENERO,
			gpa1.ID_ESTRATO AS ESTRATO,
			gpa1.ID_ESTUDIO AS ESCOLARIDAD,
			gpa1.CABEZAFAMILIA AS MUJER_CABEZA_FAMILIA,
			IIF(gemp1.DOCUMENTO = gp1.ID_PERSONA, 'S', 'N') AS EMPLEADO,
			gpa1.ID_OCUPACION AS OCUPACION,
			1 AS JORNADA_LABORAL,
			gpa1.ID_TIPOCONTRATO AS TIPO_CONTRATO,
			gp1.ID_TIPO_ESTADO_CIVIL AS ESTADO_CIVIL,
			gp1.ID_TIPO_RELACION AS SOCIO,
			IIF(gpvg1.ID_AGENCIA > 0, 'S', 'N') AS DIRECTIVO,
			gd2.MUNICIPIO  AS CIUDAD_LABORA,
			gp1.CARGO_ACTUAL AS OCUPACION_PROFESIONAL,
			gp1.ID_CIIU AS CIIU,
			0 AS OTROS_DESCUENTOS,
			(gp1.EGRESOS_ALIMENTACION + gp1.EGRESOS_ALQUILER + gp1.EGRESOS_DEUDAS + gp1.EGRESOS_OTROS + gp1.EGRESOS_SERVICIOS + gp1.EGRESOS_TRANSPORTE + gp1.OTROS_EGRESOS_CONYUGE) AS EGRESOS,
			gp1.TOTAL_PASIVOS  AS PASIVOS,
			gp1.TOTAL_ACTIVOS AS ACTIVOS,
			gpa1.ID_TIPOVIVIENDA AS TIPO_VIVIENDA,
			gpa1.PERSONAS_A_CARGO AS PERSONAS_A_CARGO,
			'EFECTIVO' AS FORMA_INGRESO,
			gpa2.ES_PEPS AS PEP,
			gp1.DECLARACION AS DECLARACION_ORIGEN_FONDOS,
			gp1.FECHA_ACTUALIZACION AS FECHA_ACTUALIZACION,
			DATEDIFF(YEAR, gp1.FECHA_NACIMIENTO, date :FECHA_CORTE) AS EDAD
FROM "cap$extracto" cpe1 
INNER JOIN "cap$maestrotitular" cmt1 ON cmt1.ID_AGENCIA = cpe1.ID_AGENCIA AND cmt1.ID_TIPO_CAPTACION = cpe1.ID_TIPO_CAPTACION AND cmt1.NUMERO_CUENTA = cpe1.NUMERO_CUENTA  AND cmt1.DIGITO_CUENTA  = cpe1.DIGITO_CUENTA 
INNER JOIN  "gen$persona" gp1 ON gp1.ID_IDENTIFICACION = cmt1.ID_IDENTIFICACION AND gp1.ID_PERSONA = cmt1.ID_PERSONA
LEFT JOIN "gen$persadicional" gpa1 ON gpa1.ID_IDENTIFICACION = gp1.ID_IDENTIFICACION AND gpa1.ID_PERSONA = gp1.ID_PERSONA
LEFT JOIN "gen$persadicional2" gpa2 ON gpa2.ID_IDENTIFICACION = gp1.ID_IDENTIFICACION AND gpa2.ID_PERSONA = gp1.ID_PERSONA
LEFT JOIN "gen$direccion" gd1 ON gd1.ID_IDENTIFICACION = gp1.ID_IDENTIFICACION AND gd1.ID_PERSONA = gp1.ID_PERSONA AND gd1.ID_DIRECCION = 1
LEFT JOIN "gen$direccion" gd2 ON gd2.ID_IDENTIFICACION = gp1.ID_IDENTIFICACION AND gd2.ID_PERSONA = gp1.ID_PERSONA AND gd1.ID_DIRECCION = 2
INNER JOIN "cap$tipocaptacion" ctc1 ON ctc1.ID_TIPO_CAPTACION = cpe1.ID_TIPO_CAPTACION
LEFT JOIN "gen$municipios" gm1 ON gm1.DPTO = gp1.DEPTO_NACIMIENTO AND gm1.NOMBRE = gp1.LUGAR_NACIMIENTO
LEFT JOIN "gen$municipios" gm2 ON gm2.COD_MUNICIPIO = gd1.COD_MUNICIPIO 
LEFT JOIN "gen$empleado" gemp1 ON gemp1.DOCUMENTO = gp1.ID_PERSONA
LEFT JOIN "gen$privilegiados" gpvg1 ON gpvg1.ID_IDENTIFICACION_PRIV = gp1.ID_IDENTIFICACION AND gpvg1.ID_PERSONA_PRIV = gp1.ID_PERSONA
WHERE cpe1.FECHA_MOVIMIENTO BETWEEN :FECHA_INICIAL AND :FECHA_FINAL AND cpe1.ID_TIPO_MOVIMIENTO  IN (1,2,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,49,50,51,52,53,54,55) 