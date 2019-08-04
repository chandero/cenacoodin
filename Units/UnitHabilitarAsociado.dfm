object FrmHabilitaAsociado: TFrmHabilitaAsociado
  Left = 129
  Top = 137
  Width = 543
  Height = 205
  AutoSize = True
  Caption = 'Habilitar Asociados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object panel: TPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 13
      Width = 89
      Height = 13
      Caption = 'N'#250'mero de Cuenta'
    end
    object JvLabel1: TJvLabel
      Left = 219
      Top = 14
      Width = 66
      Height = 13
      Caption = 'Estado Actual'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvCuenta: TJvEdit
      Left = 106
      Top = 11
      Width = 79
      Height = 21
      Alignment = taRightJustify
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clBlack
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      PasswordChar = #0
      ReadOnly = False
      TabOrder = 0
      OnKeyPress = JvCuentaKeyPress
    end
    object JvEstado: TJvStaticText
      Left = 289
      Top = 11
      Width = 135
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      WordWrap = False
    end
    object Button1: TButton
      Left = 188
      Top = 11
      Width = 27
      Height = 22
      Caption = '...'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 75
    Width = 421
    Height = 96
    TabOrder = 1
    object Label2: TLabel
      Left = 61
      Top = 7
      Width = 94
      Height = 13
      Caption = 'Tipo de Documento'
    end
    object Label3: TLabel
      Left = 261
      Top = 7
      Width = 110
      Height = 13
      Caption = 'N'#250'mero de Documento'
    end
    object Label4: TLabel
      Left = 162
      Top = 51
      Width = 90
      Height = 13
      Caption = 'Nombre y Apellidos'
    end
    object JvNumero: TJvStaticText
      Left = 215
      Top = 22
      Width = 202
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      WordWrap = False
    end
    object JvTipo: TJvStaticText
      Left = 4
      Top = 22
      Width = 209
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      WordWrap = False
    end
    object JvNombres: TJvStaticText
      Left = 4
      Top = 67
      Width = 413
      Height = 21
      TextMargins.X = 0
      TextMargins.Y = 0
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clBlack
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlCenter
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      WordWrap = False
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 41
    Width = 421
    Height = 34
    Enabled = False
    TabOrder = 2
    object chEducacion: TCheckBox
      Left = 48
      Top = 9
      Width = 78
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Educaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object chDeudas: TCheckBox
      Left = 183
      Top = 9
      Width = 66
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Deudas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object chAporte: TCheckBox
      Left = 324
      Top = 9
      Width = 63
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Aportes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 430
    Top = 0
    Width = 105
    Height = 171
    TabOrder = 3
    object Bthabilitar: TBitBtn
      Left = 11
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Habilitar'
      TabOrder = 0
      OnClick = BthabilitarClick
    end
    object BitBtn2: TBitBtn
      Left = 12
      Top = 36
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 13
      Top = 66
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$persona".ID_IDENTIFICACION,'
      '  "gen$persona".ID_PERSONA,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$habilesinhabilesn".HABIL,'
      '  "gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,'
      '  "gen$habilesinhabilesn".EDUCACION,'
      '  "gen$habilesinhabilesn".APORTES,'
      '  "gen$habilesinhabilesn".DEUDAS'
      'FROM'
      '  "cap$maestrotitular"'
      
        '  INNER JOIN "gen$habilesinhabilesn" ON ("cap$maestrotitular".NU' +
        'MERO_CUENTA = "gen$habilesinhabilesn".NUMERO_CUENTA)'
      
        '  INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFIC' +
        'ACION = "gen$persona".ID_IDENTIFICACION)'
      
        '  AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSON' +
        'A)'
      
        '  INNER JOIN "gen$tiposidentificacion" ON ("cap$maestrotitular".' +
        'ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)'
      'WHERE'
      '  "cap$maestrotitular".NUMERO_TITULAR = 1 AND '
      '  "cap$maestrotitular".ID_TIPO_CAPTACION = 1 AND '
      '  "gen$habilesinhabilesn".NUMERO_CUENTA = :NUMERO_CUENTA')
    Left = 608
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMERO_CUENTA'
        ParamType = ptUnknown
      end>
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'UPDATE "gen$habilesinhabilesn" SET HABIL = 1 WHERE NUMERO_CUENTA' +
        ' = :NUMERO_CUENTA')
    Left = 568
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMERO_CUENTA'
        ParamType = ptUnknown
      end>
  end
end
