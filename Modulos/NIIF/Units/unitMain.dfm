object frmMain: TfrmMain
  Left = 197
  Top = 142
  Width = 565
  Height = 366
  Caption = 'SISTEMA FINANCIERO COOPSERVIR LTDA'
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
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 26
    Top = 280
    object Mnu01: TMenuItem
      Caption = '&Generales'
      ImageIndex = 14
      ShortCut = 16464
      object Observaciones1: TMenuItem
        Caption = 'Observaciones'
        OnClick = Observaciones1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object CambiarContrasea1: TMenuItem
        Caption = 'Cambiar Contrase'#241'a'
        OnClick = CambiarContrasea1Click
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
        Caption = 'Salir de Coopservir'
        OnClick = SalirdePSI1Click
      end
    end
    object Modulos1: TMenuItem
      Caption = 'Modulos'
      object Personas1: TMenuItem
        Caption = 'Personas'
        object CreacindeNuevaPersona1: TMenuItem
          Caption = '&Mantenimiento de Persona'
          OnClick = CreacindeNuevaPersona1Click
        end
        object EliminacindePersona1: TMenuItem
          Caption = '&Eliminaci'#243'n de Persona'
        end
        object ListadoGeneraldePersonas1: TMenuItem
          Caption = 'Listado General de Personas'
        end
      end
      object Contabilidad1: TMenuItem
        Caption = 'Contabilidad'
        object MantenimientodePUC1: TMenuItem
          Caption = 'Mantenimiento de PUC'
          OnClick = MantenimientodePUC1Click
        end
        object DigitacindeComprobantes1: TMenuItem
          Caption = 'Digitaci'#243'n de Comprobantes'
          OnClick = DigitacindeComprobantes1Click
        end
        object RevalorizacindeAportes1: TMenuItem
          Caption = 'Revalorizaci'#243'n de Aportes'
          OnClick = RevalorizacindeAportes1Click
        end
      end
      object Colocaciones1: TMenuItem
        Caption = 'Colocaciones'
        object NuevaColocacin1: TMenuItem
          Caption = 'Nueva Colocaci'#243'n'
          OnClick = NuevaColocacin1Click
        end
        object RecuperarReporteColocacion1: TMenuItem
          Caption = 'Recuperar Reporte Colocaci'#243'n'
          OnClick = RecuperarReporteColocacion1Click
        end
        object ConfigurarImpresora2: TMenuItem
          Caption = 'Liquidaciones'
          object LiquidacindePrueba1: TMenuItem
            Caption = 'Liquidaci'#243'n de &Prueba'
            OnClick = LiquidacindePrueba1Click
          end
          object CalculodeCuotas1: TMenuItem
            Caption = 'Calculo de &Cuotas'
          end
          object LiquidacionJudicial: TMenuItem
            Caption = 'Liquidaci'#243'n Cartera Judicial'
            OnClick = LiquidacionJudicialClick
          end
        end
        object Informes1: TMenuItem
          Caption = 'Informes'
          object Mnu030401: TMenuItem
            Caption = '&Listado General'
            OnClick = Mnu030401Click
          end
          object Mnu030402: TMenuItem
            Caption = '&Agrupado Por  ...'
            OnClick = Mnu030402Click
          end
          object Pagar1: TMenuItem
            Caption = 'Pagar'#233
            OnClick = Pagar1Click
          end
        end
        object ControldeCobro1: TMenuItem
          Caption = 'Control de Cobro'
          OnClick = ControldeCobro1Click
        end
        object CostasJudiciales1: TMenuItem
          Caption = 'Costas Judiciales'
          OnClick = CostasJudiciales1Click
        end
        object ResumendeCartera1: TMenuItem
          Caption = 'Resumen de Cartera'
          OnClick = ResumendeCartera1Click
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
        object SaldarCaptacin1: TMenuItem
          Caption = 'Saldar Captaci'#243'n'
          OnClick = SaldarCaptacin1Click
        end
        object RangosdeLibreta1: TMenuItem
          Caption = 'Rangos de Libreta'
          OnClick = RangosdeLibreta1Click
        end
        object ConsultaExtracto1: TMenuItem
          Caption = 'Consulta Extracto'
          OnClick = ConsultaExtracto1Click
        end
        object LiquidacionInteresesCaptacion1: TMenuItem
          Caption = 'Liquidaci'#243'n de Intereses'
          OnClick = LiquidacionInteresesCaptacion1Click
        end
        object RecuperarTablaLiquidacin1: TMenuItem
          Caption = 'Recuperar Tabla Liquidaci'#243'n'
          OnClick = RecuperarTablaLiquidacin1Click
        end
        object ProrrogaCaptaciones: TMenuItem
          Caption = 'Prorroga de Captaciones'
          OnClick = ProrrogaCaptacionesClick
        end
        object ImprimirCaptacion1: TMenuItem
          Caption = 'Imprimir Captacion'
          OnClick = ImprimirCaptacion1Click
        end
      end
      object AportacionesSociales1: TMenuItem
        Caption = 'Cajas'
        object NuevaCaja1: TMenuItem
          Caption = 'Mantenimiento Cajas'
          OnClick = NuevaCaja1Click
        end
        object Operaciones1: TMenuItem
          Caption = 'Operaciones'
        end
        object Arqueos1: TMenuItem
          Caption = 'Arqueo'
          OnClick = Arqueos1Click
        end
        object CierredelDa1: TMenuItem
          Caption = 'Cierre del D'#237'a'
          OnClick = CierredelDa1Click
        end
        object ActualizarArqueo1: TMenuItem
          Caption = 'Actualizar Arqueo'
          OnClick = ActualizarArqueo1Click
        end
        object InformeDiario1: TMenuItem
          Caption = 'Informe Diario'
          OnClick = InformeDiario1Click
        end
        object ChequesenCaja1: TMenuItem
          Caption = 'Cheques en Caja'
          OnClick = ChequesenCaja1Click
        end
      end
      object Cartera1: TMenuItem
        Caption = 'Cartera'
        object MantenimientoAbogados1: TMenuItem
          Caption = 'Mantenimiento Abogados'
          OnClick = MantenimientoAbogados1Click
        end
        object AsignacinAbogado1: TMenuItem
          Caption = '&Asignaci'#243'n Abogado'
          OnClick = AsignacinAbogado1Click
        end
        object InformeAbogadosconCartera1: TMenuItem
          Caption = 'Informe Abogados con Cartera'
          OnClick = InformeAbogadosconCartera1Click
        end
      end
    end
    object InformesGerenciales1: TMenuItem
      Caption = '&Consultas Gerenciales'
      object ConsultadeGerencia1: TMenuItem
        Caption = 'Consulta de Gerencia'
        OnClick = ConsultadeGerencia1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Sumatorias1: TMenuItem
        Caption = 'Sumatorias'
        OnClick = Sumatorias1Click
      end
    end
    object ProcesosEspeciales1: TMenuItem
      Caption = 'Procesos Especiales'
      object CaptacionesParaFogacoop1: TMenuItem
        Caption = 'Captaciones Para Fogacoop'
        OnClick = CaptacionesParaFogacoop1Click
      end
      object ColocacionesparaFogacoop1: TMenuItem
        Caption = 'Colocaciones Para Fogacoop'
        OnClick = ColocacionesparaFogacoop1Click
      end
      object EstimadoCancelacionCdats1: TMenuItem
        Caption = 'Estimado Cancelacion Cdats'
        OnClick = EstimadoCancelacionCdats1Click
      end
      object ActualizarListaClinton1: TMenuItem
        Caption = 'Actualizar Lista Clinton'
        OnClick = ActualizarListaClinton1Click
      end
    end
  end
  object ImageList: TImageList
    Left = 56
    Top = 280
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
  object IdTime1: TIdTime
    Port = 37
    BaseDate = 2
    Left = 144
    Top = 280
  end
  object Timer2: TTimer
    Interval = 10000
    OnTimer = Timer2Timer
    Left = 172
    Top = 278
  end
end
