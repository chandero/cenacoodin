object frmMain: TfrmMain
  Left = 300
  Top = 154
  Width = 461
  Height = 231
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
        OnClick = GeneracinPlanodePersonas1Click
      end
      object GeneracinPlanoAportes1: TMenuItem
        Caption = 'Generaci'#243'n Plano Aportes'
        OnClick = GeneracinPlanoAportes1Click
      end
      object GeneracinPlanoCaptaciones1: TMenuItem
        Caption = 'Generaci'#243'n Plano Captaciones'
        OnClick = GeneracinPlanoCaptaciones1Click
      end
      object GeneracinPlanoCDAT1: TMenuItem
        Caption = 'Generaci'#243'n Plano CDAT'
        OnClick = GeneracinPlanoCDAT1Click
      end
      object ProyeccionCancelacinCdats1: TMenuItem
        Caption = 'Proyeccion Cancelaci'#243'n Cdats'
        OnClick = ProyeccionCancelacinCdats1Click
      end
      object GeneracinPlanoColocaciones1: TMenuItem
        Caption = 'Generaci'#243'n Plano Colocaciones'
        OnClick = GeneracinPlanoColocaciones1Click
      end
      object ProyeccinRecuperacinCartera1: TMenuItem
        Caption = 'Proyecci'#243'n Recuperaci'#243'n Cartera'
        OnClick = ProyeccinRecuperacinCartera1Click
      end
    end
    object Salir1: TMenuItem
      Caption = 'Salir'
      OnClick = Salir1Click
    end
  end
end
