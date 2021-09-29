object FrmCorregirColocacion: TFrmCorregirColocacion
  Left = 489
  Top = 280
  Width = 554
  Height = 257
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Corregir Colocaciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gRColocacion: TGroupBox
    Left = 1
    Top = 0
    Width = 459
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 14
      Width = 53
      Height = 13
      Caption = 'Colocaci'#243'n'
    end
    object EdColocacion: TEdit
      Left = 61
      Top = 12
      Width = 97
      Height = 21
      MaxLength = 11
      TabOrder = 0
      OnKeyPress = EdColocacionKeyPress
    end
    object JvNombre: TJvStaticText
      Left = 186
      Top = 12
      Width = 267
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 1
      WordWrap = False
    end
    object BtBuscar: TButton
      Left = 160
      Top = 12
      Width = 24
      Height = 21
      Caption = '...'
      TabOrder = 2
      OnClick = BtBuscarClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 38
    Width = 460
    Height = 83
    Caption = 'Informaci'#243'n Actual'
    TabOrder = 1
    object Label2: TLabel
      Left = 10
      Top = 23
      Width = 44
      Height = 13
      Caption = 'F. Capital'
    end
    object Label3: TLabel
      Left = 146
      Top = 23
      Width = 41
      Height = 13
      Caption = 'F.Interes'
    end
    object Label4: TLabel
      Left = 284
      Top = 23
      Width = 78
      Height = 13
      Caption = 'Cuotas Pagadas'
    end
    object Label9: TLabel
      Left = 10
      Top = 51
      Width = 27
      Height = 13
      Caption = 'Saldo'
    end
    object Label10: TLabel
      Left = 146
      Top = 51
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label11: TLabel
      Left = 285
      Top = 51
      Width = 55
      Height = 13
      Caption = 'Valor Cuota'
    end
    object JvCapital: TJvStaticText
      Left = 57
      Top = 20
      Width = 87
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 0
      WordWrap = False
    end
    object JvInteres: TJvStaticText
      Left = 195
      Top = 20
      Width = 87
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 1
      WordWrap = False
    end
    object JvPagada: TJvStaticText
      Left = 366
      Top = 20
      Width = 87
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 2
      WordWrap = False
    end
    object Jvsaldo: TJvStaticText
      Left = 57
      Top = 48
      Width = 87
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 3
      WordWrap = False
    end
    object JvEstado: TJvStaticText
      Left = 195
      Top = 48
      Width = 87
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 4
      WordWrap = False
    end
    object JvCuota: TJvStaticText
      Left = 366
      Top = 48
      Width = 87
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      TabOrder = 5
      WordWrap = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 127
    Width = 460
    Height = 49
    Caption = 'Actualizar Informaci'#243'n de Fechas '
    TabOrder = 2
    object Label5: TLabel
      Left = 10
      Top = 23
      Width = 44
      Height = 13
      Caption = 'F. Capital'
    end
    object Label6: TLabel
      Left = 247
      Top = 23
      Width = 41
      Height = 13
      Caption = 'F.Interes'
    end
    object dtFechaK: TDateTimePicker
      Left = 57
      Top = 19
      Width = 130
      Height = 21
      CalAlignment = dtaLeft
      Date = 39904.6609180324
      Time = 39904.6609180324
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtFechaI: TDateTimePicker
      Left = 293
      Top = 20
      Width = 130
      Height = 21
      CalAlignment = dtaLeft
      Date = 39904.66094875
      Time = 39904.66094875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 1
    Top = 174
    Width = 232
    Height = 49
    Caption = 'Marcar Tabla de Liquidaci'#243'n'
    TabOrder = 3
    object Label7: TLabel
      Left = 43
      Top = 23
      Width = 68
      Height = 13
      Caption = 'Cuota N'#250'mero'
    end
    object JvNumeroM: TJvIntegerEdit
      Left = 114
      Top = 21
      Width = 36
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 0
      OnEnter = JvNumeroMEnter
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
  end
  object GroupBox5: TGroupBox
    Left = 231
    Top = 174
    Width = 229
    Height = 49
    Caption = 'Desmarcar Tabla de Liquidaci'#243'n'
    TabOrder = 4
    object Label8: TLabel
      Left = 36
      Top = 23
      Width = 68
      Height = 13
      Caption = 'Cuota N'#250'mero'
    end
    object JvNumeroD: TJvIntegerEdit
      Left = 107
      Top = 21
      Width = 36
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 0
      OnEnter = JvNumeroDEnter
      Value = 0
      MaxValue = 0
      MinValue = 0
      HasMaxValue = False
      HasMinValue = False
    end
  end
  object Panel1: TPanel
    Left = 459
    Top = 0
    Width = 87
    Height = 221
    TabOrder = 5
    object BitAplicar: TBitBtn
      Left = 5
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Aplicar'
      TabOrder = 0
      OnClick = BitAplicarClick
    end
    object BitCancelar: TBitBtn
      Left = 5
      Top = 35
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitCancelarClick
    end
    object BitBtn3: TBitBtn
      Left = 5
      Top = 64
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object IBConsulta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 488
    Top = 120
  end
end
