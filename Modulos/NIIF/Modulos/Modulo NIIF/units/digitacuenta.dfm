object digita: Tdigita
  Left = 240
  Top = 161
  Width = 519
  Height = 272
  Caption = 'Movimientos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 511
    Height = 204
    Align = alClient
    TabOrder = 0
    object Label4: TLabel
      Left = 19
      Top = 58
      Width = 33
      Height = 13
      Caption = 'Credito'
    end
    object Label1: TLabel
      Left = 17
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label5: TLabel
      Left = 256
      Top = 5
      Width = 48
      Height = 16
      Caption = 'Label5'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object Label3: TLabel
      Left = 18
      Top = 34
      Width = 31
      Height = 13
      Caption = 'Debito'
    end
    object Label6: TLabel
      Left = 263
      Top = 57
      Width = 54
      Height = 13
      Caption = 'No. Cuenta'
      Transparent = True
      Visible = False
    end
    object nomcta: TLabel
      Left = 325
      Top = 96
      Width = 3
      Height = 13
      Visible = False
    end
    object Label7: TLabel
      Left = 257
      Top = 56
      Width = 73
      Height = 13
      Caption = 'N'#250'mero Cr'#233'dito'
      Visible = False
    end
    object Label8: TLabel
      Left = 258
      Top = 80
      Width = 3
      Height = 13
      Color = clScrollBar
      ParentColor = False
      Visible = False
    end
    object Label9: TLabel
      Left = 259
      Top = 95
      Width = 3
      Height = 13
      Color = clScrollBar
      ParentColor = False
      Visible = False
    end
    object Label2: TLabel
      Left = 259
      Top = 80
      Width = 3
      Height = 13
      Color = clScrollBar
      ParentColor = False
      Visible = False
    end
    object Label15: TLabel
      Left = 259
      Top = 32
      Width = 39
      Height = 13
      Caption = 'Agencia'
      Visible = False
    end
    object Label10: TLabel
      Left = 352
      Top = 79
      Width = 3
      Height = 13
      Color = clMoneyGreen
      ParentColor = False
      Visible = False
    end
    object LblDisponible: TLabel
      Left = 18
      Top = 122
      Width = 79
      Height = 13
      Caption = 'Saldo Disponible'
      Visible = False
    end
    object LblCanje: TLabel
      Left = 18
      Top = 92
      Width = 63
      Height = 26
      Caption = 'Canje +    Saldo Minimo'
      Visible = False
      WordWrap = True
    end
    object LblSaldo: TLabel
      Left = 18
      Top = 78
      Width = 27
      Height = 13
      Caption = 'Saldo'
      Visible = False
    end
    object CmdPUC: TSpeedButton
      Left = 234
      Top = 6
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = CmdPUCClick
    end
    object editcodigo: TMaskEdit
      Left = 89
      Top = 6
      Width = 145
      Height = 21
      AutoSelect = False
      CharCase = ecUpperCase
      EditMask = '!9-9-99-99-99-99-99-99-99-99;0;0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 27
      ParentFont = False
      TabOrder = 0
      OnEnter = editcodigoEnter
      OnExit = editcodigoExit
      OnKeyPress = editcodigoKeyPress
    end
    object Editnocuenta: TEdit
      Left = 345
      Top = 52
      Width = 100
      Height = 21
      TabOrder = 3
      Visible = False
      OnEnter = EditnocuentaEnter
      OnExit = EditnocuentaExit
      OnKeyPress = EditnocuentaKeyPress
    end
    object Editnocredito: TEdit
      Left = 346
      Top = 52
      Width = 99
      Height = 21
      TabOrder = 2
      Visible = False
      OnEnter = EditnocreditoEnter
      OnExit = EditnocreditoExit
      OnKeyPress = EditnocreditoKeyPress
    end
    object EdAgencia: TDBLookupComboBox
      Left = 348
      Top = 28
      Width = 143
      Height = 21
      KeyField = 'ID_AGENCIA'
      ListField = 'DESCRIPCION_AGENCIA'
      ListSource = DmComprobante.Dsagencia
      TabOrder = 1
      Visible = False
      OnEnter = EdAgenciaEnter
      OnKeyPress = EdAgenciaKeyPress
    end
    object GrupoInforme: TGroupBox
      Left = 17
      Top = 139
      Width = 473
      Height = 63
      Caption = 'Datos para Informes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
      object Label11: TLabel
        Left = 12
        Top = 17
        Width = 87
        Height = 13
        Caption = 'Tipo Identificacion'
        Visible = False
      end
      object Label13: TLabel
        Left = 12
        Top = 36
        Width = 30
        Height = 13
        Caption = 'Monto'
        Visible = False
      end
      object Label12: TLabel
        Left = 293
        Top = 17
        Width = 13
        Height = 13
        Caption = 'Nit'
        Visible = False
      end
      object Label14: TLabel
        Left = 293
        Top = 36
        Width = 24
        Height = 13
        Caption = 'Tasa'
        Visible = False
      end
      object Edtipoid: TDBLookupComboBox
        Left = 112
        Top = 11
        Width = 136
        Height = 21
        KeyField = 'ID_IDENTIFICACION'
        ListField = 'DESCRIPCION_IDENTIFICACION'
        ListSource = DSTiposIdentificacion
        TabOrder = 0
        Visible = False
        OnEnter = EdtipoidEnter
        OnExit = EdtipoidExit
        OnKeyPress = EdtipoidKeyPress
      end
      object EdMonto: TMemo
        Left = 112
        Top = 35
        Width = 137
        Height = 20
        Alignment = taRightJustify
        Lines.Strings = (
          'Edit2')
        TabOrder = 2
        Visible = False
        WantReturns = False
        WordWrap = False
        OnEnter = EdMontoEnter
        OnKeyPress = EdMontoKeyPress
      end
      object EdNit: TMemo
        Left = 328
        Top = 11
        Width = 137
        Height = 20
        Alignment = taRightJustify
        Lines.Strings = (
          'Edit1')
        TabOrder = 1
        Visible = False
        WantReturns = False
        WordWrap = False
        OnEnter = EdNitEnter
        OnExit = EdNitExit
        OnKeyPress = EdNitKeyPress
      end
      object EdTasa: TMemo
        Left = 329
        Top = 35
        Width = 137
        Height = 20
        Alignment = taRightJustify
        Lines.Strings = (
          'Edit3')
        TabOrder = 3
        Visible = False
        WantReturns = False
        WordWrap = False
        OnEnter = EdTasaEnter
        OnKeyPress = EdTasaKeyPress
      end
    end
    object EdDisponible: TStaticText
      Left = 102
      Top = 120
      Width = 133
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      ParentColor = False
      TabOrder = 5
      Visible = False
    end
    object EdCanje: TStaticText
      Left = 102
      Top = 98
      Width = 133
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      ParentColor = False
      TabOrder = 6
      Visible = False
    end
    object EdSaldo: TStaticText
      Left = 102
      Top = 76
      Width = 133
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clCaptionText
      ParentColor = False
      TabOrder = 7
      Visible = False
    end
    object EdDebito: TJvCurrencyEdit
      Left = 102
      Top = 32
      Width = 133
      Height = 21
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 8
      OnChange = EdDebitoChange
      OnEnter = EdDebitoEnter
      OnExit = EdDebitoExit
      HasMaxValue = False
      HasMinValue = False
    end
    object EdCredito: TJvCurrencyEdit
      Left = 102
      Top = 54
      Width = 133
      Height = 21
      AutoSize = False
      Alignment = taRightJustify
      ReadOnly = False
      TabOrder = 9
      OnEnter = EdCreditoEnter
      OnExit = EdCreditoExit
      HasMaxValue = False
      HasMinValue = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 204
    Width = 511
    Height = 34
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object BtnAgregar: TBitBtn
      Left = 341
      Top = 6
      Width = 81
      Height = 24
      Hint = 'Click Aqu'#237' para Guardar los Datos de la nueva Cuenta'
      Caption = '&Agregar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = BtnAgregarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000D30E0000D30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        108410189C1831A53139AD3939AD39107B103194292173185A5242736B5AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF21A52131AD314ABD4A52C652399C398C
        BD7B52BD5242BD422173184A4229FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        299C294ABD4A6BCE6B6BC66BF7FFEFF7FFEF63C66363CE6331A5314A6B39FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4ABD4A73CE7352A54AFFFFFFFF
        FFFF6BC66B73CE73319C31FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF18734A3984AD217BBD428CAD63BD63399C39FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF187BC6218CE7298CE721
        8CE7296B52FF00FFFF00FFFF00FF218429218429FF00FFFF00FFFF00FFFF00FF
        FF00FF297BAD399CFF399CFF399CFF399CFF298CE7395252FF00FFFF00FF94DE
        8C218429FF00FFFF00FFFF00FFFF00FFFF00FF2184C642A5FF42A5FF42A5FF42
        A5FF399CF7315A6B21842921842900EE0000C000218429218429FF00FFFF00FF
        6BA5C642A5F74AB5FF52B5FF52BDFF52B5FF4AADFF39739421842900EE0040FF
        4000EE0000C000218429FF00FFFF00FF5294BD42A5EF5ABDFF5ABDFF52B5F74A
        B5EF52B5F739738C21842921842900EE0000C000218429218429FF00FFFF00FF
        63849C2173A54A94C66BADD663ADF74A9CE7216BA5FF00FFFF00FFFF00FF00C0
        00218429FF00FFFF00FFFF00FFFF00FFFF00FF2173A56BADD68CBDE773BDE75A
        ADDE316B7BFF00FFFF00FFFF00FF218429218429FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6BA5BD4A94B54A8CAD63849CFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object Btncerrar: TBitBtn
      Left = 428
      Top = 5
      Width = 80
      Height = 24
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BtncerrarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B000000010000000100000031DE000031
        E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
        0404040404040404000004000004040404040404040404000004040000000404
        0404040404040000040404000000000404040404040000040404040402000000
        0404040400000404040404040404000000040000000404040404040404040400
        0101010004040404040404040404040401010204040404040404040404040400
        0201020304040404040404040404030201040403030404040404040404050203
        0404040405030404040404040303050404040404040303040404040303030404
        0404040404040403040403030304040404040404040404040404030304040404
        0404040404040404040404040404040404040404040404040404}
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 468
    Top = 16
  end
  object IBQTiposIdentificacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 12
    Top = 196
  end
  object DSTiposIdentificacion: TDataSource
    DataSet = IBQTiposIdentificacion
    Left = 40
    Top = 196
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTDigita
    Left = 68
    Top = 198
  end
  object IBTDigita: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Left = 96
    Top = 200
  end
end
