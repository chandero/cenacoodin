object frmMain: TfrmMain
  Left = 271
  Top = 143
  Width = 640
  Height = 393
  Caption = 'Modulo Captaciones - '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF002222
    22222222222222F2FF2FF2F2FF2222F2FF2FF2F2FF222222222222222222FFF2
    2FFFFFF22FFFFFF22FFFFFF22FFFFFF22FFFFFF22FFFFFF22FFFFFF22FFF2222
    2222222222222222222222222222F222222FF222222FFF2222FFFF2222FFFFF2
    2FFFFFF22FFFFFFFFFFFFFFFFFFF222222222222222222222222222222220000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  Menu = MainMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 632
    Height = 39
    ButtonHeight = 36
    ButtonWidth = 55
    Caption = 'ToolBar1'
    Flat = True
    Images = ImageList
    ShowCaptions = True
    TabOrder = 0
    object BtnManPersona: TToolButton
      Left = 0
      Top = 0
      Hint = 'Mantenimiento de Personas'
      Caption = 'Personas'
      ImageIndex = 0
      OnClick = BtnManPersonaClick
    end
    object ToolButton1: TToolButton
      Left = 55
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object BtnCreacionCaptacion: TToolButton
      Left = 63
      Top = 0
      Caption = 'Captaci'#243'n'
      ImageIndex = 1
      OnClick = BtnCreacionCaptacionClick
    end
    object ToolButton4: TToolButton
      Left = 118
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object BtnRangos: TToolButton
      Left = 126
      Top = 0
      Caption = 'Rangos'
      ImageIndex = 4
      OnClick = BtnRangosClick
    end
    object ToolButton6: TToolButton
      Left = 181
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object BtnImprimirCaptacion: TToolButton
      Left = 189
      Top = 0
      Hint = 'Imprimir Captaci'#243'n'
      Caption = 'Imprimir'
      ImageIndex = 3
      OnClick = BtnImprimirCaptacionClick
    end
    object ToolButton2: TToolButton
      Left = 244
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object BtnExtracto: TToolButton
      Left = 252
      Top = 0
      Hint = 'Impresi'#243'n de Extracto de Cuenta'
      Caption = 'Extracto'
      ImageIndex = 2
      OnClick = BtnExtractoClick
    end
    object ToolButton3: TToolButton
      Left = 307
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BtnConsultaPersona: TToolButton
      Left = 315
      Top = 0
      Hint = 'Consultar Persona'
      Caption = 'Consultar'
      ImageIndex = 5
      OnClick = BtnConsultaPersonaClick
    end
    object ToolButton5: TToolButton
      Left = 370
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object BtnSalir: TToolButton
      Left = 378
      Top = 0
      Hint = 'Salir de Captaciones'
      Caption = 'Salir'
      ImageIndex = 6
      OnClick = BtnSalirClick
    end
  end
  object MainMenu: TMainMenu
    Left = 26
    Top = 278
    object Mnu01: TMenuItem
      Caption = '&Generales'
      ImageIndex = 14
      ShortCut = 16464
      object ConsultarListado1: TMenuItem
        Caption = 'Consultar Listado'
        OnClick = ConsultarListado1Click
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object CambiarContrasena1: TMenuItem
        Caption = 'Cambiar Contrasena'
        OnClick = CambiarContrasena1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ConfigurarImpresora1: TMenuItem
        Caption = '&Configurar Impresora'
        OnClick = ConfigurarImpresora1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object SalirdePSI1: TMenuItem
        Caption = 'Salir'
        OnClick = SalirdePSI1Click
      end
    end
    object Personas1: TMenuItem
      Caption = 'Personas'
      object CreacindeNuevaPersona1: TMenuItem
        Caption = '&Mantenimiento de Persona'
        OnClick = CreacindeNuevaPersona1Click
      end
      object ClonarPersona1: TMenuItem
        Caption = 'Clonar Persona'
        OnClick = ClonarPersona1Click
      end
      object ActualizarFechasdeVerificacindeDatos1: TMenuItem
        Caption = 'Actualizar Fechas de Verificaci'#243'n de Datos'
      end
      object RetirodeAsociado1: TMenuItem
        Caption = '&Retiro de Asociado'
        OnClick = RetirodeAsociado1Click
      end
      object ListadoGeneraldePersonas1: TMenuItem
        Caption = 'Listado General de Personas'
        Visible = False
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object ActualizarActayEducacin1: TMenuItem
        Caption = 'Actualizar Acta de Asociaci'#243'n'
        OnClick = ActualizarActayEducacin1Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object ActivacindeImagenes1: TMenuItem
        Tag = 1020205
        Caption = '&Activaci'#243'n de Imagenes'
        OnClick = ActivacindeImagenes1Click
      end
    end
    object Captaciones1: TMenuItem
      Caption = 'Captaciones'
      object CrearCaptacin1: TMenuItem
        Caption = 'Crear Captaci'#243'n'
        OnClick = CrearCaptacin1Click
      end
      object ModificarCaptacin1: TMenuItem
        Caption = 'Modificar Captaci'#243'n'
        OnClick = ModificarCaptacin1Click
      end
      object ConsultarCaptacin1: TMenuItem
        Caption = 'Consultar Captaci'#243'n'
        OnClick = ConsultarCaptacin1Click
      end
      object SaldarCaptacin1: TMenuItem
        Caption = 'Saldar Captaci'#243'n'
        OnClick = SaldarCaptacin1Click
      end
      object RangosdeLibreta1: TMenuItem
        Caption = 'Rangos de Libreta'
        OnClick = RangosdeLibreta1Click
      end
      object ExencinGMF1: TMenuItem
        Caption = 'Exenci'#243'n GMF'
        OnClick = ExencinGMF1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object EstadosCaptacin1: TMenuItem
        Tag = 1020306
        Caption = 'Estado Captaci'#243'n'
        OnClick = EstadosCaptacin1Click
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object AsignarTarjetaDbito1: TMenuItem
        Caption = 'Tarjeta D'#233'bito'
        object AdministracinTarjeta1: TMenuItem
          Caption = 'Administraci'#243'n Tarjeta D'#233'bito'
          OnClick = AdministracinTarjeta1Click
        end
        object SolicitarNuevasTarjetas1: TMenuItem
          Tag = 102030702
          Caption = 'Solicitar Nuevas Tarjetas'
          Visible = False
          OnClick = SolicitarNuevasTarjetas1Click
        end
        object Barrido1: TMenuItem
          Caption = 'Barrido'
          Visible = False
          OnClick = Barrido1Click
        end
        object ConfigurarImpresora2: TMenuItem
          Action = Configurar_Impresora
        end
        object ReporteTarjetassinMovimiento1: TMenuItem
          Caption = 'Barrido Tarjetas sin Movimiento'
          Visible = False
          OnClick = ReporteTarjetassinMovimiento1Click
        end
        object MarcarTarjeta1: TMenuItem
          Caption = 'Marcar Tarjeta'
          Visible = False
        end
        object ActualizarSaldoCuenta1: TMenuItem
          Caption = 'Actualizar Saldo Cuenta'
          OnClick = ActualizarSaldoCuenta1Click
        end
        object CancelarServiciosVirtuales1: TMenuItem
          Caption = 'Cancelar Servicios Virtuales'
          OnClick = CancelarServiciosVirtuales1Click
        end
        object ArchivoPlanoMovimientos1: TMenuItem
          Caption = 'Archivo Plano Movimientos'
          OnClick = ArchivoPlanoMovimientos1Click
        end
      end
    end
    object Gestiones1: TMenuItem
      Caption = 'Gestiones'
      object RequerimientoSistemas1: TMenuItem
        Caption = 'Requerimiento Sistemas'
        OnClick = RequerimientoSistemas1Click
      end
    end
    object ProcesosEspeciales1: TMenuItem
      Caption = 'Procesos Especiales'
      object LiquidacionInteresesCaptacion1: TMenuItem
        Caption = 'Liquidaci'#243'n de Intereses'
        OnClick = LiquidacionInteresesCaptacion1Click
      end
      object ProrrogaCaptaciones: TMenuItem
        Caption = 'Prorroga de Captaciones'
        OnClick = ProrrogaCaptacionesClick
      end
      object RecuperarTablaLiquidacin1: TMenuItem
        Caption = 'Recuperar Tabla Liquidaci'#243'n'
        OnClick = RecuperarTablaLiquidacin1Click
      end
      object DescuentoContractual1: TMenuItem
        Caption = 'Descuento Contractual'
        OnClick = DescuentoContractual1Click
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object ValidarHuella1: TMenuItem
        Caption = 'Validar Huella'
        OnClick = ValidarHuella1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object ComprobanteContable: TMenuItem
        Caption = 'Comprobantes Contables'
        OnClick = ComprobanteContableClick
      end
      object ConsignacinNacional1: TMenuItem
        Caption = 'Consignaci'#243'n Nacional'
        OnClick = ConsignacinNacional1Click
      end
      object ComprobanteConciliacin1: TMenuItem
        Caption = 'Comprobante Conciliaci'#243'n Servicios Virtuales'
        OnClick = ComprobanteConciliacin1Click
      end
      object ConciliacinBancariaServiciosVirtuales1: TMenuItem
        Caption = 'Conciliaci'#243'n Bancaria Servicios Virtuales'
        OnClick = ConciliacinBancariaServiciosVirtuales1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object ControldeCobro1: TMenuItem
        Caption = 'Control de Cobro'
        OnClick = ControldeCobro1Click
      end
      object ControlContractuales1: TMenuItem
        Caption = 'Control Contractuales'
        OnClick = ControlContractuales1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object InactivacindeCuentas1: TMenuItem
        Tag = 1020406
        Caption = 'Inactivaci'#243'n de Cuentas'
        OnClick = InactivacindeCuentas1Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object SeguroCredivida1: TMenuItem
        Caption = 'Seguro Credivida'
        OnClick = SeguroCredivida1Click
      end
      object N25: TMenuItem
        Caption = '-'
      end
      object SeguroJuvenil2: TMenuItem
        Caption = 'Seguro Juvenil'
        object BarridoSeguroJuvenil1: TMenuItem
          Caption = 'Barrido Seguro Juvenil'
          OnClick = BarridoSeguroJuvenil1Click
        end
        object ImprimirSeguro1: TMenuItem
          Caption = 'Imprimir Seguro'
          OnClick = ImprimirSeguro1Click
        end
        object AgregarPoliza1: TMenuItem
          Caption = 'Agregar Poliza'
          OnClick = AgregarPoliza1Click
        end
        object ConsultaSeguroJuvenil1: TMenuItem
          Caption = 'Consulta Seguro Juvenil'
          OnClick = ConsultaSeguroJuvenil1Click
        end
      end
      object EntregaSeguroJuvenil1: TMenuItem
        Caption = 'Entrega Seguro Juvenil'
        OnClick = EntregaSeguroJuvenil1Click
      end
      object N26: TMenuItem
        Caption = '-'
      end
      object RenovacionCredivida1: TMenuItem
        Caption = 'Renovacion Credivida'
        OnClick = RenovacionCredivida1Click
      end
      object BarridoCredividas1: TMenuItem
        Tag = 1020411
        Caption = 'Barrido Credividas'
        OnClick = BarridoCredividas1Click
      end
      object RecuperarCredividas1: TMenuItem
        Caption = 'Recuperar Credividas'
        OnClick = RecuperarCredividas1Click
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object raslados1: TMenuItem
        Caption = 'Traslados'
        object EnviarPeticin1: TMenuItem
          Caption = 'Enviar Petici'#243'n'
          OnClick = EnviarPeticin1Click
        end
        object AnalizarPeticin1: TMenuItem
          Caption = 'Analizar Petici'#243'n'
          OnClick = AnalizarPeticin1Click
        end
        object RealizarTraslado1: TMenuItem
          Caption = 'Realizar Traslado'
          OnClick = RealizarTraslado1Click
        end
        object ReporteTraslado1: TMenuItem
          Caption = 'Reporte Traslado'
          OnClick = ReporteTraslado1Click
        end
      end
      object N24: TMenuItem
        Caption = '-'
      end
      object CarneAhorroJuvenil1: TMenuItem
        Caption = 'Carne Ahorro Juvenil'
        Visible = False
        OnClick = CarneAhorroJuvenil1Click
      end
      object MarcarIncapacitado1: TMenuItem
        Caption = 'Marcar Incapacitado'
        OnClick = MarcarIncapacitado1Click
      end
      object SorteoCumpleaos1: TMenuItem
        Caption = 'Sorteo Cumplea'#241'os'
        OnClick = SorteoCumpleaos1Click
      end
      object SorteoContractual1: TMenuItem
        Caption = 'Sorteo Contractual'
        OnClick = SorteoContractual1Click
      end
    end
    object Informes1: TMenuItem
      Caption = 'Informes'
      object ImprimirCaptacion1: TMenuItem
        Caption = 'Imprimir Captacion'
        OnClick = ImprimirCaptacion1Click
      end
      object ConsultaExtracto1: TMenuItem
        Caption = 'Consulta Extracto'
        OnClick = ConsultaExtracto1Click
      end
      object ConsultaExtractosAosAnteriores1: TMenuItem
        Caption = 'Consulta Extractos A'#241'os Anteriores'
        OnClick = ConsultaExtractosAosAnteriores1Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object arjetaDbito1: TMenuItem
        Caption = 'Tarjeta D'#233'bito'
        object Entregadas1: TMenuItem
          Caption = 'Entregadas'
          OnClick = Entregadas1Click
        end
        object Canceladas1: TMenuItem
          Caption = 'Canceladas'
          OnClick = Canceladas1Click
        end
        object Bloqueadas1: TMenuItem
          Caption = 'Bloqueadas'
          Visible = False
          OnClick = Bloqueadas1Click
        end
        object N16: TMenuItem
          Caption = '-'
        end
        object CuentasconTarjeta1: TMenuItem
          Caption = 'Tarjetas con Estado'
          Visible = False
          OnClick = CuentasconTarjeta1Click
        end
        object N17: TMenuItem
          Caption = '-'
        end
        object MovimientosdelDa1: TMenuItem
          Tag = 102050305
          Caption = 'Movimientos del D'#237'a'
          Visible = False
          OnClick = MovimientosdelDa1Click
        end
        object Mnu050306: TMenuItem
          Caption = 'Saldos de Cuentas'
          Visible = False
          OnClick = Mnu050306Click
        end
        object N23: TMenuItem
          Caption = '-'
        end
        object ReportedePlsticos1: TMenuItem
          Tag = 102050307
          Caption = 'Reporte de Pl'#225'sticos'
          Visible = False
          OnClick = ReportedePlsticos1Click
        end
        object ReportedeTarjetassinMovimiento1: TMenuItem
          Caption = 'Reporte de Tarjetas sin Movimiento'
          Visible = False
          OnClick = ReportedeTarjetassinMovimiento1Click
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object ListadoGeneraldeCaptaciones1: TMenuItem
        Caption = 'Listado General de Captaciones'
        OnClick = ListadoGeneraldeCaptaciones1Click
      end
      object CaptacionesporFechadeApertura1: TMenuItem
        Caption = 'Captaciones por Fecha de Apertura'
        OnClick = CaptacionesporFechadeApertura1Click
      end
      object asaPromedioCaptaciones1: TMenuItem
        Caption = 'Tasa Promedio Captaciones'
        OnClick = asaPromedioCaptaciones1Click
      end
      object RangosdeCaptacin1: TMenuItem
        Caption = 'Rangos de Captaci'#243'n'
        OnClick = RangosdeCaptacin1Click
      end
      object ListadosConsolidados1: TMenuItem
        Tag = 1020508
        Caption = 'Listados Consolidados'
        OnClick = ListadosConsolidados1Click
      end
      object PlanillaResumen1: TMenuItem
        Tag = 1080517
        Caption = 'Sumatoria Consolidada'
        OnClick = PlanillaResumen1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object CuentasporEstado1: TMenuItem
        Caption = 'Informe de Cuentas por Estado'
        OnClick = CuentasporEstado1Click
      end
      object InformedeCaptacionesSaldadasyoCanceladas1: TMenuItem
        Caption = 'Informe de Captaciones Saldadas y/o &Canceladas'
        OnClick = InformedeCaptacionesSaldadasyoCanceladas1Click
      end
      object InformedePersonasconErrorenFechadeNacimiento1: TMenuItem
        Caption = 'Informe de Personas con Error en Fecha de Nacimiento'
        OnClick = InformedePersonasconErrorenFechadeNacimiento1Click
      end
      object InformedeCuentasconSaldoNegativo1: TMenuItem
        Caption = 'Informe de Cuentas con Saldo Negativo'
        OnClick = InformedeCuentasconSaldoNegativo1Click
      end
      object InformeAbonosAhorroContractual1: TMenuItem
        Caption = 'Informe Abonos Ahorro Contractual'
        OnClick = InformeAbonosAhorroContractual1Click
      end
      object InformedeAsociadosconDatosActualizadosenunRango1: TMenuItem
        Caption = 'Informe de Asociados con Datos Actualizados en un Rango'
        OnClick = InformedeAsociadosconDatosActualizadosenunRango1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object CertificadodeReteFuente1: TMenuItem
        Tag = 1020511
        Caption = 'Certificado de ReteFuente'
        OnClick = CertificadodeReteFuente1Click
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object InformeAsociadossinDerechoaDetalle1: TMenuItem
        Caption = 'Informe Asociados sin Derecho a Detalle'
        OnClick = InformeAsociadossinDerechoaDetalle1Click
      end
      object Mayores: TMenuItem
        Caption = 'Mayores 14 A'#241'os'
        OnClick = MayoresClick
      end
      object SaldoRangoEdad1: TMenuItem
        Caption = 'Saldo Rango Edad'
        OnClick = SaldoRangoEdad1Click
      end
      object Juveniles1: TMenuItem
        Caption = 'Juveniles'
        object DeJuvenilaAsociadoProyeccin1: TMenuItem
          Caption = 'De Juvenil a Asociado Proyecci'#243'n'
          OnClick = DeJuvenilaAsociadoProyeccin1Click
        end
      end
    end
    object InformesGerenciales1: TMenuItem
      Caption = '&Consultas'
      object ConsultadeGerencia1: TMenuItem
        Caption = 'Consulta de Gerencia'
        OnClick = ConsultadeGerencia1Click
      end
      object ConsultaSolicitud1: TMenuItem
        Caption = 'Consulta Solicitud'
        Visible = False
        OnClick = ConsultaSolicitud1Click
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object ContractualDescontado1: TMenuItem
        Caption = 'Contractual Descontado'
        OnClick = ContractualDescontado1Click
      end
      object CdatLiquidado1: TMenuItem
        Caption = 'Cdat Liquidado'
        OnClick = CdatLiquidado1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Observaciones1: TMenuItem
        Caption = '&Observaciones'
        OnClick = Observaciones1Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object Sumatorias1: TMenuItem
        Caption = 'Sumatorias'
        OnClick = Sumatorias1Click
      end
    end
    object ProcesosBalance1: TMenuItem
      Caption = 'Procesos Balance'
      object CausacionCDAT1: TMenuItem
        Caption = 'Causacion CDAT'
        OnClick = CausacionCDAT1Click
      end
      object CausacinContractual1: TMenuItem
        Caption = 'Causaci'#243'n Contractual'
        OnClick = CausacinContractual1Click
      end
      object InformeAportesyAhorros1: TMenuItem
        Caption = 'Informe Aportes y Ahorros'
        OnClick = InformeAportesyAhorros1Click
      end
    end
    object Utilidades1: TMenuItem
      Caption = 'Utilidades'
      object CalcularTasa1: TMenuItem
        Caption = 'Calcular Tasa'
        OnClick = CalcularTasa1Click
      end
      object L1: TMenuItem
        Caption = 'Proyecci'#243'n de Pagos CDATS'
        OnClick = L1Click
      end
      object InformacindeCrditos1: TMenuItem
        Caption = 'Informaci'#243'n de Cr'#233'ditos'
        OnClick = InformacindeCrditos1Click
      end
      object PromediodeCaptacion1: TMenuItem
        Caption = 'Promedio de Captaci'#243'n'
        OnClick = PromediodeCaptacion1Click
      end
      object Prueba1: TMenuItem
        Caption = 'Prueba'
        Visible = False
        OnClick = Prueba1Click
      end
      object ConsultaProductosAgencias1: TMenuItem
        Caption = 'Consulta Productos Agencia'
        OnClick = ConsultaProductosAgencias1Click
      end
      object ReimprimirCDAT1: TMenuItem
        Caption = 'Reimprimir CDAT'
        OnClick = ReimprimirCDAT1Click
      end
    end
    object Excel1: TMenuItem
      Caption = 'Excel'
      object ArchivoTransacciones1: TMenuItem
        Caption = 'Archivo Transacciones'
        OnClick = ArchivoTransacciones1Click
      end
      object ArchivoInformacinFinanciera1: TMenuItem
        Caption = 'Archivo Informaci'#243'n Financiera'
        OnClick = ArchivoInformacinFinanciera1Click
      end
    end
  end
  object ImageList: TImageList
    Left = 56
    Top = 280
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      000000000000000000000000000000000000F7F7F700DEDEDE00DEDEDE00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C6363004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000008C8C8C0063636B007B636300ADAD
      AD00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C6363009C636300BD636300BD6B6B004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400000000000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400C6C6C600000000000000000000000000637B84004273C6008C7BA5007B63
      6300ADADAD00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C6363009C63
      6300C66B6B00D66B6B00D66B6B00C66B6B00424242009C6363009C6363009C63
      63009C6363009C6363009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000084840000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484
      84008484840000000000000000000000000052B5FF004AADFF004273C6008C7B
      A5007B636300ADADAD00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C636300D66B
      6B00D66B6B00D66B6B00CE6B6B00C66B6B0042424200C67B7B00DE8C8C00F794
      9400F7A5A500F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00848484000000000000000000000000000000000052B5FF004AADFF004273
      C6008C7BA5007B636300ADADAD00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C636300D66B
      6B00D66B6B00D6737300D6737300CE6B73004242420000940000009400000094
      000000940000F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000084840000C6C6
      C600C6C6C60084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000052B5FF004AAD
      FF004273C6008C7BA500846B6B00EFEFEF00F7F7F700DEDEDE00D6D6D600D6D6
      D600EFEFEF00FFFFFF00000000000000000000000000000000009C636300D673
      7300D6737300DE737300DE737300D67373004242420000940000009400000094
      000000940000F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000000000000FFFF
      FF00FFFFFF000000000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000000000000052B5
      FF004AADFF004273C6006B6B6B00737373008C6B6B009C636300C6949400A57B
      7B00635A5A00A5A5A500FFFFFF000000000000000000000000009C636300E77B
      7B00E77B7B00E77B7B00E7848400D67373004242420000940000008400000084
      000000840000F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000084840000C6C6
      C600C6C6C600C6C6C600FFFF0000FF00000084848400C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      000052B5FF00BDBDBD00847B7B00DEAD9400FFEFBD00FFFFD600FFFFD600FFFF
      DE00F7EFCE00846363009C9C9C00FFFFFF0000000000000000009C636300F784
      8C00EF848400EF949400FFDEDE00DE8C8C004242420000840000008400000063
      000000630000F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFF0000FF000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000D6D6D600E7B59400FFFFD600FFF7BD00FFFFD600FFFFE700FFFF
      EF00FFFFFF00FFF7E70063525200D6D6D60000000000000000009C636300F784
      8C00EF848400F79C9C00FFFFFF00DE8C8C0042424200FFCEAD00F7B58400F7B5
      8400F7B58400F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000084840000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF0000FF00000084848400C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000C69C9C00FFEFBD00FFE7AD00FFF7C600FFFFDE00FFFFEF00FFFF
      FF00FFFFFF00FFFFDE00B59484009494940000000000000000009C636300F78C
      8C00F78C8C00F78C8C00F78C8C00DE7B840042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF0000FF000000C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00D6AD9C00FFFFCE00FFDEAD00FFF7C600FFFFD600FFFFE700FFFF
      EF00FFFFEF00FFFFDE00EFE7BD006B6B6B0000000000000000009C636300F78C
      8C00F7949400F7949400F78C8C00E784840042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000084840000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF0000FF00
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000E7BDA500FFFFC600FFD6A500FFEFB500FFFFCE00FFFFDE00FFFF
      DE00FFFFDE00FFFFD600FFF7C6007B7B7B0000000000000000009C636300F78C
      8C00FF949400FF949400F7949400E78C8C0042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      0000FF0000008484840000000000000000000000000000000000000000000000
      000000000000CEA59C00FFFFD600FFE7BD00FFDEAD00FFF7BD00FFFFC600FFFF
      CE00FFFFCE00FFFFCE00DEB59400B5B5B50000000000000000009C636300F78C
      8C00FF949400FF9C9C00FF949400E78C8C0042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400008484000084840000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600FFFF0000FF00000084848400000000000000000000000000000000000000
      000000000000E7D6D600FFF7C600FFFFFF00FFFFEF00FFDEAD00FFE7AD00FFE7
      B500FFE7B500FFEFBD009C6B6B00EFEFEF0000000000000000009C6363009C63
      6300E79C9C00FF949400FF9C9C00EF8C940042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFF0000FF000000000000000000000000000000000000000000
      00000000000000000000BD8C8C00FFFFFF00FFFFEF00FFFFD600FFDEAD00FFF7
      C600FFE7BD00C68C8400DEDEDE00000000000000000000000000000000000000
      00009C636300B5737300D6848400DE8C8C00424242009C6363009C6363009C63
      63009C6363009C6363009C636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000C6A5A500DEBD9C00FFEFB500FFE7AD00EFC6
      A500B5848400EFEFEF0000000000000000000000000000000000000000000000
      000000000000000000009C6363009C6363004242420000000000000000000000
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
      000000000000C6C6C6008484840000000000000000000000000000FFFF0000FF
      FF0000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000FF000000000000000000000000000000F7F7F700BDBDBD00A5A5A500A5A5
      A500A5A5A500ADADAD00CECECE00EFEFEF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      000000000000C6C6C600C6C6C60084848400000000000000000000FFFF0000FF
      FF00C6C6C600C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600FF00000000000000FFFFFF00FFFF
      FF0084848400000000000000000000000000BD522900D64A2100EF5A3900FF63
      5200FF635200D64A2100A539180063524A009C9C9C00949494007B7B7B007373
      7300737373007B7B7B00BDBDBD00FFFFFF00000000000000000084840000C6C6
      C600C6C6C600000000000000000000000000848484000000000000FFFF0000FF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008484
      840000000000000000000000000000000000C6421000EF5A4200FF735A00FF7B
      6300CE5A2900D6845200FF6B5A00EF5A420042B542002994290052C652004ABD
      4A0039B5390021AD21005A635A00F7F7F7000000000084840000C6C6C600C6C6
      C600C6C6C60084840000C6C6C600848400000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FF000000FFFFFF00FF00
      0000FF000000FF000000FF000000FF0000000000000000000000FFFFFF00C6C6
      C600C6C6C600C6C6C6000000000000000000D6947B00FF6B5A00FF846B00EF84
      5A00FFDEA500FFDEA500FF846B00FF63520063CE6300BDDEAD00429C42006BCE
      6B0052C6520039B539006B7B6B00FFFFFF000000000000000000848400008484
      0000C6C6C600C6C6C600C6C6C600C6C6C6008484000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C600000000000000000000000000CE633900FF8C6B00EF9C
      7B00BD8C8400FFBD9400FF8C7300BD4A180084DE8400FFFFFF00FFFFFF0063C6
      63006BCE6B00299C2900DEDEDE000000000000000000FFFF0000000000008484
      000084840000C6C6C60000FF000000FF00008484000084840000000000008484
      840000000000C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000EFEFEF004A4A4A00000000000821
      7B001029940000107B00635A5A00319C310094E79400DED6BD00428CAD009CB5
      A50042A54200D6D6D600000000000000000000000000FFFF0000848400000000
      00008484000084840000848400008484000084840000C6C6C600848400000000
      000084848400C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF000000FFFFFF00FF00
      0000FF000000FF000000FF000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000101010001010100008296B00184A
      AD00184AB500184AAD0008186B00BDBDBD0094B5C6002994F7002994F7002994
      EF00105A8C00A5A5A500FFFFFF00000000000000000000000000FFFF000000FF
      000000000000848400008484000084840000C6C6C600C6C6C600C6C6C6008484
      0000000000008484840000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00000000000000000018181800212121002163C600216B
      CE00216BD6002163CE0010429C00A5A5A500298CDE0039A5FF0039A5FF0039A5
      FF00319CFF005A636300EFEFEF0000000000000000000000000000000000FFFF
      000000FF0000000000008484000084840000C6C6C600C6C6C600C6C6C60000FF
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000029292900313131002163B500298C
      F7003194FF00298CF7001863C600A5A5A50042ADFF004AB5FF004AB5FF004AAD
      FF0042ADFF00185A8400DEDEDE00000000000000000000000000000000000000
      0000FFFF000000FF0000000000008484000084840000C6C6C600C6C6C6008484
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FF000000FFFFFF00FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000001818180042424200292929001042
      9C00216BDE003194F700105AA500D6D6D60052B5FF0052BDFF0052BDFF0052BD
      FF004AB5FF00187BBD00D6D6D600000000000000000000000000C6C6C6000000
      000000000000FFFF000000FF0000000000008484000000FF0000848400000000
      0000FFFF00008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000DEDEDE0052525200636363009C9C
      9C00737373002929290039394200FFFFFF001884BD00298CBD00318CBD001884
      CE002184CE0010638C00EFEFEF000000000000000000C6C6C600C6C6C600C6C6
      C6000000000000000000FFFF000000FF00000000000084840000000000008484
      0000FFFF00008484840000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      00000000000000000000000000000000000000000000BDBDBD00636363009494
      94006B6B6B0029292900F7F7F700000000007BADCE0063ADDE0084C6E7009CCE
      E7003994C600B5B5BD00FFFFFF00000000000000000000000000C6C6C6000000
      0000000000000000000000000000FFFF000000FF00000000000084840000FFFF
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BADCE005AA5C600398C
      BD00C6D6DE00FFFFFF0000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000FFFF000084840000FFFF00008484
      8400000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000000000000FFFF0000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000009FFF0FFFFE7F0000000107FFF07F0000
      000103FFC0010000000101FFC0010000000180FFC00100000001C003C0010000
      0001E001C00100000001F000C00100000001F800C00100000001F800C0010000
      0001F000C00100000001F800C00100000001F800C00100000001F800C0010000
      0001FC01F0010000FFF8FE03FC7F0000FFFFF7FFC003FFFFFFFFE1C18003FE03
      007FC08080030007000080408003000700000039800300030000801F80030003
      800180098003000100038001800300010001C003800300030001E00380030001
      0001F00780030001000188038003000300018C038003001F81018E078007001F
      FF83F30F800F003FFFFFF39F801F007F00000000000000000000000000000000
      000000000000}
  end
  object PrinterSetupDialog: TPrinterSetupDialog
    Left = 86
    Top = 280
  end
  object ActionList: TActionList
    Left = 116
    Top = 280
    object Configurar_Impresora: TAction
      Category = 'Generales'
      Caption = 'Configurar Impresora'
      OnExecute = Configurar_ImpresoraExecute
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 600000
    OnTimer = Timer1Timer
    Left = 176
    Top = 280
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 600000
    OnTimer = Timer2Timer
    Left = 224
    Top = 280
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 64
    Top = 232
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    Params.Strings = (
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=192.168.200.254:/dbase3/pruebas/database.fdb'
      'DriverName=Interbase'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=1'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'GDS32.DLL'
    Left = 576
    Top = 280
  end
end
