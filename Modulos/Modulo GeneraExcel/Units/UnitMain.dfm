object frmMain: TfrmMain
  Left = 667
  Top = 252
  Width = 420
  Height = 196
  Caption = 'Generaci'#243'n de Planos y Reportes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 18
    Top = 108
    object Procesos1: TMenuItem
      Caption = 'Procesos'
      object GeneracinPlanodePersonas1: TMenuItem
        Caption = 'Generaci'#243'n Plano de Personas'
        Visible = False
        OnClick = GeneracinPlanodePersonas1Click
      end
      object GeneracinFormatoAportesF211: TMenuItem
        Caption = 'Generaci'#243'n Formato Aportes F21'
        Visible = False
        OnClick = GeneracinFormatoAportesF211Click
      end
      object GeneracinPlanoAportes1: TMenuItem
        Caption = 'Generaci'#243'n Plano Aportes'
        Visible = False
        OnClick = GeneracinPlanoAportes1Click
      end
      object GeneracinPlanoCaptaciones1: TMenuItem
        Caption = 'Generaci'#243'n Plano Captaciones'
        Visible = False
        OnClick = GeneracinPlanoCaptaciones1Click
      end
      object GeneracinPlanoColocaciones1: TMenuItem
        Caption = 'Generaci'#243'n Plano Colocaciones'
        Visible = False
        OnClick = GeneracinPlanoColocaciones1Click
      end
      object BalanceGeneral1: TMenuItem
        Caption = 'Generar Balance General'
        Visible = False
        OnClick = BalanceGeneral1Click
      end
      object GeneracinPlanoCDAT1: TMenuItem
        Caption = 'Generaci'#243'n Plano CDAT'
        Visible = False
        OnClick = GeneracinPlanoCDAT1Click
      end
      object ProyeccionCancelacinCdats1: TMenuItem
        Caption = 'Proyecci'#243'n Cancelaci'#243'n Cdats'
        Visible = False
        OnClick = ProyeccionCancelacinCdats1Click
      end
      object ProyeccinRecuperacinCartera1: TMenuItem
        Caption = 'Proyecci'#243'n Recuperaci'#243'n Cartera'
        Visible = False
        OnClick = ProyeccinRecuperacinCartera1Click
      end
      object Productos1: TMenuItem
        Caption = 'Productos'
        Visible = False
        OnClick = Productos1Click
      end
      object NiveldeIngresos1: TMenuItem
        Caption = 'Nivel de Ingresos'
        Visible = False
        OnClick = NiveldeIngresos1Click
      end
      object GeneracinPlanoPosicinNetaPrivilegiados1: TMenuItem
        Caption = 'Generaci'#243'n Plano Posici'#243'n Neta Privilegiados'
        Visible = False
      end
      object GenerarExcelTransaccionesCaja1: TMenuItem
        Caption = 'Generar Excel Transacciones Caja'
        OnClick = GenerarExcelTransaccionesCaja1Click
      end
    end
    object Salir1: TMenuItem
      Caption = 'Salir'
      OnClick = Salir1Click
    end
  end
end
