object frmSaldarCaptacion: TfrmSaldarCaptacion
  Left = 575
  Top = 77
  Width = 549
  Height = 560
  Caption = 'Saldar Captaciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupCaptacion: TGroupBox
    Left = 0
    Top = 33
    Width = 541
    Height = 463
    Align = alClient
    Caption = 'Informaci'#243'n de la Captaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    object PageControl: TPageControl
      Left = 2
      Top = 15
      Width = 537
      Height = 446
      ActivePage = TabContractual
      Align = alClient
      TabOrder = 0
      TabStop = False
      object TabAportacion: TTabSheet
        Caption = 'Aportaci'#243'n'
        TabVisible = False
        object Label49: TLabel
          Left = 0
          Top = 0
          Width = 125
          Height = 13
          Caption = 'Tipo de Identificaci'#243'n'
        end
        object Label50: TLabel
          Left = 168
          Top = 0
          Width = 143
          Height = 13
          Caption = 'N'#250'mero de Identificaci'#243'n'
        end
        object Label42: TLabel
          Left = 38
          Top = 44
          Width = 85
          Height = 13
          Caption = 'Primer Apellido'
        end
        object Label43: TLabel
          Left = 38
          Top = 70
          Width = 100
          Height = 13
          Caption = 'Segundo Apellido'
        end
        object Label44: TLabel
          Left = 38
          Top = 94
          Width = 50
          Height = 13
          Caption = 'Nombres'
        end
        object Label6: TLabel
          Left = 398
          Top = 22
          Width = 80
          Height = 13
          Caption = 'Estado Actual'
        end
        object DBLCBTiposIdentificacionApo: TDBLookupComboBox
          Left = 0
          Top = 12
          Width = 165
          Height = 21
          Color = clWhite
          Enabled = False
          KeyField = 'ID_IDENTIFICACION'
          ListField = 'DESCRIPCION_IDENTIFICACION'
          ListSource = DSTiposIdentificacion1
          TabOrder = 1
        end
        object EdIdentificacionApo: TMemo
          Left = 168
          Top = 12
          Width = 165
          Height = 21
          Alignment = taRightJustify
          Color = clWhite
          Enabled = False
          TabOrder = 2
          WantReturns = False
          WordWrap = False
        end
        object GroupBox5: TGroupBox
          Left = 2
          Top = 124
          Width = 329
          Height = 53
          Caption = 'Datos de la Aportaci'#243'n'
          TabOrder = 0
          object Label2: TLabel
            Left = 8
            Top = 28
            Width = 48
            Height = 13
            Caption = 'N'#250'mero '
          end
          object Label21: TLabel
            Left = 174
            Top = 10
            Width = 106
            Height = 13
            Caption = 'Fecha de Apertura'
          end
          object EdDigitoAportacion: TStaticText
            Left = 132
            Top = 26
            Width = 25
            Height = 21
            Alignment = taRightJustify
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 1
          end
          object EdFechaAperApo: TDateTimePicker
            Left = 180
            Top = 26
            Width = 99
            Height = 21
            CalAlignment = dtaLeft
            Date = 37811.6503228704
            Time = 37811.6503228704
            Color = clWhite
            DateFormat = dfShort
            DateMode = dmComboBox
            Enabled = False
            Kind = dtkDate
            ParseInput = False
            TabOrder = 2
          end
          object EdNumeroAportacion: TJvEdit
            Left = 56
            Top = 26
            Width = 73
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
            Color = clWhite
            MaxLength = 7
            PasswordChar = #0
            ReadOnly = False
            TabOrder = 0
            OnExit = EdNumeroAportacionExit
            OnKeyPress = EdNumeroAportacionKeyPress
          end
        end
        object EdPrimerApellidoApo: TStaticText
          Left = 146
          Top = 40
          Width = 187
          Height = 21
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 3
        end
        object EdSegundoApellidoApo: TStaticText
          Left = 146
          Top = 64
          Width = 187
          Height = 21
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 4
        end
        object EdNombreApo: TStaticText
          Left = 146
          Top = 88
          Width = 187
          Height = 21
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 5
        end
        object EdEstadoApo: TStaticText
          Left = 366
          Top = 40
          Width = 133
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          TabOrder = 6
        end
      end
      object TabAlaVista: TTabSheet
        Caption = 'TabAlaVista'
        ImageIndex = 1
        TabVisible = False
        object Label3: TLabel
          Left = 2
          Top = 364
          Width = 80
          Height = 13
          Caption = 'Estado Actual'
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 517
          Height = 89
          Caption = 'Titulares'
          TabOrder = 0
          TabStop = True
          object Label7: TLabel
            Left = 246
            Top = 16
            Width = 85
            Height = 13
            Caption = 'Primer Apellido'
          end
          object Label8: TLabel
            Left = 246
            Top = 42
            Width = 100
            Height = 13
            Caption = 'Segundo Apellido'
          end
          object Label9: TLabel
            Left = 248
            Top = 66
            Width = 50
            Height = 13
            Caption = 'Nombres'
          end
          object EdPrimerApellidoTitAho: TStaticText
            Left = 350
            Top = 14
            Width = 160
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 0
          end
          object EdSegundoApellidoTitAho: TStaticText
            Left = 350
            Top = 38
            Width = 160
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 1
          end
          object EdNombresTitAho: TStaticText
            Left = 350
            Top = 62
            Width = 160
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 2
          end
          object GridTitulares: TXStringGrid
            Left = 4
            Top = 12
            Width = 239
            Height = 73
            TabStop = False
            Color = clWhite
            ColCount = 4
            DefaultRowHeight = 15
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
            TabOrder = 3
            OnClick = GridTitularesClick
            FixedLineColor = clBlack
            Columns = <
              item
                HeaderFont.Charset = ANSI_CHARSET
                HeaderFont.Color = clBlack
                HeaderFont.Height = -11
                HeaderFont.Name = 'Arial'
                HeaderFont.Style = [fsBold]
                HeaderAlignment = taCenter
                Caption = 'CSC'
                Color = clWhite
                Width = 28
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                Alignment = taCenter
                EditorInheritsCellProps = False
              end
              item
                HeaderFont.Charset = ANSI_CHARSET
                HeaderFont.Color = clBlack
                HeaderFont.Height = -11
                HeaderFont.Name = 'Arial'
                HeaderFont.Style = [fsBold]
                HeaderAlignment = taCenter
                Caption = 'TIPO ID'
                Color = clWhite
                Width = 40
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                Alignment = taCenter
                EditorInheritsCellProps = False
              end
              item
                HeaderFont.Charset = ANSI_CHARSET
                HeaderFont.Color = clBlack
                HeaderFont.Height = -11
                HeaderFont.Name = 'Arial'
                HeaderFont.Style = [fsBold]
                HeaderAlignment = taCenter
                Caption = 'NUMERO ID'
                Color = clWhite
                Width = 100
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                Alignment = taRightJustify
                EditorInheritsCellProps = False
              end
              item
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clBlack
                HeaderFont.Height = -11
                HeaderFont.Name = 'MS Sans Serif'
                HeaderFont.Style = [fsBold]
                Caption = 'TIPO T'
                Color = clWhite
                Width = 44
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Alignment = taCenter
                EditorInheritsCellProps = False
              end>
            MultiLine = False
            ImmediateEditMode = False
            ColWidths = (
              28
              40
              100
              44)
          end
        end
        object GroupBox6: TGroupBox
          Left = 160
          Top = 306
          Width = 353
          Height = 53
          Caption = 'Datos de la Captaci'#243'n'
          TabOrder = 2
          TabStop = True
          object Label12: TLabel
            Left = 8
            Top = 20
            Width = 48
            Height = 13
            Caption = 'N'#250'mero '
          end
          object Label20: TLabel
            Left = 210
            Top = 10
            Width = 106
            Height = 13
            Caption = 'Fecha de Apertura'
          end
          object EdDigitoAho: TStaticText
            Left = 132
            Top = 18
            Width = 25
            Height = 21
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = sbsSunken
            Caption = '8'
            Color = clWhite
            ParentColor = False
            TabOrder = 2
          end
          object EdFechaAperturaAho: TDateTimePicker
            Left = 216
            Top = 26
            Width = 99
            Height = 21
            CalAlignment = dtaLeft
            Date = 37811.6503228704
            Time = 37811.6503228704
            Color = clWhite
            DateFormat = dfShort
            DateMode = dmComboBox
            Enabled = False
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
          end
          object EdNumeroAho: TJvEdit
            Left = 54
            Top = 18
            Width = 77
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
            Color = clWhite
            MaxLength = 7
            PasswordChar = #0
            ReadOnly = False
            TabOrder = 0
            OnExit = EdNumeroAhoExit
            OnKeyPress = EdNumeroAhoKeyPress
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 306
          Width = 159
          Height = 53
          Enabled = False
          TabOrder = 1
          object Label51: TLabel
            Left = 16
            Top = 12
            Width = 37
            Height = 13
            Caption = 'Firmas'
          end
          object Label52: TLabel
            Left = 60
            Top = 12
            Width = 35
            Height = 13
            Caption = 'Sellos'
          end
          object Label53: TLabel
            Left = 102
            Top = 12
            Width = 38
            Height = 13
            Caption = 'Protec'
          end
          object EdFirmasAho: TLMDSpinEdit
            Left = 16
            Top = 24
            Width = 41
            Height = 21
            Color = clWhite
            TabOrder = 0
          end
          object EdSellosAho: TLMDSpinEdit
            Left = 58
            Top = 24
            Width = 41
            Height = 21
            Color = clWhite
            TabOrder = 1
          end
          object EdProtecAho: TLMDSpinEdit
            Left = 100
            Top = 24
            Width = 41
            Height = 21
            Color = clWhite
            TabOrder = 2
          end
        end
        object EdEstadoAho: TStaticText
          Left = 86
          Top = 362
          Width = 133
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          TabOrder = 3
        end
      end
      object TabContractual: TTabSheet
        Caption = 'TabContractual'
        ImageIndex = 2
        TabVisible = False
        object Label4: TLabel
          Left = 208
          Top = 184
          Width = 80
          Height = 13
          Caption = 'Estado Actual'
        end
        object Label55: TLabel
          Left = 33
          Top = 238
          Width = 73
          Height = 13
          Caption = 'Saldo Actual'
        end
        object Label56: TLabel
          Left = 164
          Top = 238
          Width = 71
          Height = 13
          Caption = 'Bonificaci'#243'n'
        end
        object Label57: TLabel
          Left = 296
          Top = 238
          Width = 78
          Height = 13
          Caption = 'Total a Pagar'
        end
        object Label58: TLabel
          Left = 368
          Top = 184
          Width = 74
          Height = 13
          Caption = 'Plan a Pagar'
        end
        object Label59: TLabel
          Left = 33
          Top = 278
          Width = 50
          Height = 13
          Caption = 'Causado'
        end
        object Label60: TLabel
          Left = 180
          Top = 278
          Width = 34
          Height = 13
          Caption = 'Gasto'
        end
        object Label61: TLabel
          Left = 281
          Top = 278
          Width = 101
          Height = 13
          Caption = 'Reverso Causado'
        end
        object Label62: TLabel
          Left = 444
          Top = 278
          Width = 27
          Height = 13
          Caption = 'GMF'
        end
        object GroupBox11: TGroupBox
          Left = 0
          Top = 0
          Width = 529
          Height = 87
          Align = alTop
          Caption = 'Informaci'#243'n del Titular'
          Enabled = False
          TabOrder = 0
          object Label34: TLabel
            Left = 6
            Top = 14
            Width = 125
            Height = 13
            Caption = 'Tipo de Identificaci'#243'n'
          end
          object Label35: TLabel
            Left = 6
            Top = 50
            Width = 143
            Height = 13
            Caption = 'N'#250'mero de Identificaci'#243'n'
          end
          object Label31: TLabel
            Left = 214
            Top = 16
            Width = 85
            Height = 13
            Caption = 'Primer Apellido'
          end
          object Label32: TLabel
            Left = 214
            Top = 42
            Width = 100
            Height = 13
            Caption = 'Segundo Apellido'
          end
          object Label33: TLabel
            Left = 216
            Top = 66
            Width = 50
            Height = 13
            Caption = 'Nombres'
          end
          object DBLCBTiposIdentificacionCont: TDBLookupComboBox
            Left = 6
            Top = 26
            Width = 165
            Height = 21
            Color = clWhite
            KeyField = 'ID_IDENTIFICACION'
            ListField = 'DESCRIPCION_IDENTIFICACION'
            ListSource = DSTiposIdentificacion3
            TabOrder = 0
          end
          object EdNumeroIdentificacionCont: TMemo
            Left = 6
            Top = 62
            Width = 165
            Height = 21
            Alignment = taRightJustify
            Color = clWhite
            TabOrder = 1
            WantReturns = False
            WordWrap = False
          end
          object EdPrimerApellidoCont: TStaticText
            Left = 322
            Top = 12
            Width = 187
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 2
          end
          object EdSegundoApellidoCont: TStaticText
            Left = 322
            Top = 36
            Width = 187
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 3
          end
          object EdNombresCont: TStaticText
            Left = 322
            Top = 60
            Width = 187
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 4
          end
        end
        object GroupBox12: TGroupBox
          Left = 0
          Top = 88
          Width = 529
          Height = 91
          Caption = 'Informaci'#243'n de la Captaci'#243'n'
          Enabled = False
          TabOrder = 1
          object Label36: TLabel
            Left = 8
            Top = 18
            Width = 26
            Height = 13
            Caption = 'Plan'
          end
          object Label37: TLabel
            Left = 160
            Top = 18
            Width = 67
            Height = 13
            Caption = 'Valor Cuota'
          end
          object Label38: TLabel
            Left = 8
            Top = 44
            Width = 88
            Height = 13
            Caption = 'Fecha Apertura'
          end
          object Label39: TLabel
            Left = 204
            Top = 44
            Width = 109
            Height = 13
            Caption = 'Fecha Vencimiento'
          end
          object Label40: TLabel
            Left = 8
            Top = 66
            Width = 85
            Height = 13
            Caption = 'Pr'#243'ximo Abono'
          end
          object DBLCBPlanContractual: TDBLookupComboBox
            Left = 36
            Top = 14
            Width = 121
            Height = 21
            Color = clWhite
            KeyField = 'ID_PLAN'
            ListField = 'DESCRIPCION'
            ListSource = DSPlanContractual
            TabOrder = 0
          end
          object EdValorContractual: TJvCurrencyEdit
            Left = 228
            Top = 14
            Width = 129
            Height = 21
            AutoSize = False
            Alignment = taRightJustify
            Color = clWhite
            ReadOnly = False
            TabOrder = 1
            HasMaxValue = False
            HasMinValue = False
          end
          object EdFechaAperturaContractual: TDateTimePicker
            Left = 98
            Top = 42
            Width = 101
            Height = 21
            CalAlignment = dtaLeft
            Date = 37811.7142401273
            Time = 37811.7142401273
            Color = clWhite
            DateFormat = dfShort
            DateMode = dmComboBox
            Enabled = False
            Kind = dtkDate
            ParseInput = False
            TabOrder = 2
          end
          object EdFechaVencimientoContractual: TStaticText
            Left = 316
            Top = 42
            Width = 101
            Height = 21
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 3
          end
          object EdProximoAbonoContractual: TStaticText
            Left = 98
            Top = 64
            Width = 101
            Height = 21
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 4
          end
        end
        object GroupBox13: TGroupBox
          Left = 0
          Top = 179
          Width = 173
          Height = 53
          Caption = 'Datos de la Captaci'#243'n'
          TabOrder = 2
          object Label41: TLabel
            Left = 6
            Top = 20
            Width = 48
            Height = 13
            Caption = 'N'#250'mero '
          end
          object EdDigitoContractual: TStaticText
            Left = 132
            Top = 18
            Width = 25
            Height = 21
            Alignment = taRightJustify
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 0
          end
          object EdNumeroContractual: TJvEdit
            Left = 52
            Top = 18
            Width = 77
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
            Color = clWhite
            MaxLength = 7
            PasswordChar = #0
            ReadOnly = False
            TabOrder = 1
            OnExit = EdNumeroContractualExit
            OnKeyPress = EdNumeroContractualKeyPress
          end
        end
        object EdEstadoContractual: TStaticText
          Left = 180
          Top = 198
          Width = 133
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          TabOrder = 3
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 364
          Width = 529
          Height = 67
          Caption = 'Captaci'#243'n a la cu'#225'l se abonaran los valores'
          TabOrder = 4
          object Label11: TLabel
            Left = 4
            Top = 18
            Width = 105
            Height = 13
            Caption = 'Tipo de Captaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label48: TLabel
            Left = 350
            Top = 20
            Width = 44
            Height = 13
            Caption = 'N'#250'mero'
          end
          object Label54: TLabel
            Left = 6
            Top = 42
            Width = 44
            Height = 13
            Caption = 'Nombre'
          end
          object DBLCBTiposCaptacionCon: TDBLookupComboBox
            Left = 110
            Top = 16
            Width = 235
            Height = 21
            Color = clWhite
            KeyField = 'ID_TIPO_CAPTACION'
            ListField = 'DESCRIPCION'
            ListSource = DSTiposCaptacionF
            TabOrder = 0
          end
          object EdCuentaCon: TJvEdit
            Left = 394
            Top = 16
            Width = 81
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
            Color = clWhite
            MaxLength = 7
            PasswordChar = #0
            ReadOnly = False
            TabOrder = 1
            OnExit = EdCuentaConExit
            OnKeyPress = EdCuentaConKeyPress
          end
          object EdDigitoCon: TStaticText
            Left = 478
            Top = 16
            Width = 21
            Height = 21
            Alignment = taCenter
            AutoSize = False
            BevelInner = bvLowered
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 2
          end
          object EdNombreCon: TStaticText
            Left = 110
            Top = 40
            Width = 389
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 3
          end
        end
        object EdSaldoCon: TJvCurrencyEdit
          Left = 4
          Top = 254
          Width = 129
          Height = 21
          AutoSize = False
          Alignment = taRightJustify
          Color = clWhite
          ReadOnly = False
          TabOrder = 5
          HasMaxValue = False
          HasMinValue = False
        end
        object EdBonificacionCon: TJvCurrencyEdit
          Left = 135
          Top = 254
          Width = 129
          Height = 21
          AutoSize = False
          Alignment = taRightJustify
          Color = clWhite
          ReadOnly = False
          TabOrder = 6
          HasMaxValue = False
          HasMinValue = False
        end
        object EdTotalAPagarCon: TJvCurrencyEdit
          Left = 267
          Top = 254
          Width = 129
          Height = 21
          AutoSize = False
          Alignment = taRightJustify
          Color = clWhite
          ReadOnly = False
          TabOrder = 7
          HasMaxValue = False
          HasMinValue = False
        end
        object DBLCBPlanAPagar: TDBLookupComboBox
          Left = 328
          Top = 198
          Width = 177
          Height = 21
          Color = clWhite
          DataSource = DSPlanAPagar
          KeyField = 'ID_PLAN'
          ListField = 'DESCRIPCION'
          ListSource = DSPlanContractual
          TabOrder = 8
        end
        object edCausado: TJvCurrencyEdit
          Left = 4
          Top = 294
          Width = 129
          Height = 21
          AutoSize = False
          Alignment = taRightJustify
          Color = clWhite
          ReadOnly = False
          TabOrder = 9
          HasMaxValue = False
          HasMinValue = False
        end
        object edGasto: TJvCurrencyEdit
          Left = 135
          Top = 294
          Width = 129
          Height = 21
          AutoSize = False
          Alignment = taRightJustify
          Color = clWhite
          ReadOnly = False
          TabOrder = 10
          HasMaxValue = False
          HasMinValue = False
        end
        object edReversoCausado: TJvCurrencyEdit
          Left = 268
          Top = 294
          Width = 129
          Height = 21
          AutoSize = False
          Alignment = taRightJustify
          Color = clWhite
          ReadOnly = False
          TabOrder = 11
          HasMaxValue = False
          HasMinValue = False
        end
        object edGMF: TJvCurrencyEdit
          Left = 399
          Top = 294
          Width = 129
          Height = 21
          AutoSize = False
          Alignment = taRightJustify
          Color = clWhite
          ReadOnly = False
          TabOrder = 12
          HasMaxValue = False
          HasMinValue = False
        end
      end
      object TabCertificado: TTabSheet
        Caption = 'TabCertificado'
        ImageIndex = 3
        TabVisible = False
        object Label29: TLabel
          Left = 10
          Top = 374
          Width = 48
          Height = 13
          Caption = 'N'#250'mero '
        end
        object Label10: TLabel
          Left = 162
          Top = 376
          Width = 80
          Height = 13
          Caption = 'Estado Actual'
        end
        object GroupBox7: TGroupBox
          Left = 0
          Top = 0
          Width = 529
          Height = 105
          Align = alTop
          Caption = 'Informaci'#243'n del Titular'
          Enabled = False
          TabOrder = 1
          object Label13: TLabel
            Left = 8
            Top = 16
            Width = 125
            Height = 13
            Caption = 'Tipo de Identificaci'#243'n'
          end
          object Label14: TLabel
            Left = 8
            Top = 56
            Width = 143
            Height = 13
            Caption = 'N'#250'mero de Identificaci'#243'n'
          end
          object Label45: TLabel
            Left = 214
            Top = 16
            Width = 85
            Height = 13
            Caption = 'Primer Apellido'
          end
          object Label46: TLabel
            Left = 214
            Top = 42
            Width = 100
            Height = 13
            Caption = 'Segundo Apellido'
          end
          object Label47: TLabel
            Left = 216
            Top = 66
            Width = 50
            Height = 13
            Caption = 'Nombres'
          end
          object DBLCBTiposIdentificacionCer: TDBLookupComboBox
            Left = 6
            Top = 30
            Width = 165
            Height = 21
            Color = clWhite
            KeyField = 'ID_IDENTIFICACION'
            ListField = 'DESCRIPCION_IDENTIFICACION'
            ListSource = DSTiposIdentificacion4
            TabOrder = 0
          end
          object EdNumeroIdentificacionCer: TMemo
            Left = 6
            Top = 74
            Width = 165
            Height = 21
            Alignment = taRightJustify
            Color = clWhite
            TabOrder = 1
            WantReturns = False
            WordWrap = False
          end
          object EdPrimerApellidoCer: TStaticText
            Left = 322
            Top = 12
            Width = 187
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 2
          end
          object EdSegundoApellidoCer: TStaticText
            Left = 322
            Top = 36
            Width = 187
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 3
          end
          object EdNombresCer: TStaticText
            Left = 322
            Top = 60
            Width = 187
            Height = 21
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 4
          end
        end
        object GroupBox8: TGroupBox
          Left = 0
          Top = 105
          Width = 524
          Height = 222
          Caption = 'Informaci'#243'n del Titulo'
          Enabled = False
          TabOrder = 2
          object Label15: TLabel
            Left = 58
            Top = 12
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label16: TLabel
            Left = 166
            Top = 12
            Width = 76
            Height = 13
            Caption = 'Tipo de Tasa'
          end
          object Label17: TLabel
            Left = 426
            Top = 12
            Width = 80
            Height = 13
            Caption = 'Tasa Efectiva'
          end
          object Label18: TLabel
            Left = 260
            Top = 12
            Width = 66
            Height = 13
            Caption = 'Int.Variable'
          end
          object Label19: TLabel
            Left = 338
            Top = 12
            Width = 73
            Height = 13
            Caption = 'Puntos Adic.'
          end
          object Label22: TLabel
            Left = 4
            Top = 54
            Width = 73
            Height = 13
            Caption = 'Amortizaci'#243'n'
          end
          object Label23: TLabel
            Left = 100
            Top = 54
            Width = 59
            Height = 13
            Caption = 'Modalidad'
          end
          object Label27: TLabel
            Left = 270
            Top = 54
            Width = 88
            Height = 13
            Caption = 'Fecha Apertura'
          end
          object Label28: TLabel
            Left = 206
            Top = 54
            Width = 32
            Height = 13
            Caption = 'Plazo'
          end
          object Label30: TLabel
            Left = 374
            Top = 52
            Width = 109
            Height = 13
            Caption = 'Fecha Vencimiento'
          end
          object EdValorCer: TJvCurrencyEdit
            Left = 4
            Top = 28
            Width = 149
            Height = 21
            Alignment = taRightJustify
            Color = clWhite
            ReadOnly = False
            TabOrder = 0
            HasMaxValue = False
            HasMinValue = False
          end
          object ComboTipoTasa: TComboBox
            Left = 160
            Top = 28
            Width = 89
            Height = 21
            Style = csDropDownList
            CharCase = ecUpperCase
            Color = clWhite
            DropDownCount = 2
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            Text = 'FIJA'
            Items.Strings = (
              'FIJA'
              'VARIABLE')
          end
          object EdTasaEfectivaCer: TJvFloatEdit2
            Left = 424
            Top = 28
            Width = 83
            Height = 21
            Alignment = taRightJustify
            Color = clWhite
            ReadOnly = False
            TabOrder = 4
            MaxDecimals = 2
            HasMaxValue = False
            HasMinValue = False
          end
          object DBLCBTasasVariables: TDBLookupComboBox
            Left = 252
            Top = 28
            Width = 79
            Height = 21
            Color = clWhite
            KeyField = 'ID_INTERES'
            ListField = 'DESCRIPCION_TASA'
            ListSource = DSIntVariable
            TabOrder = 2
          end
          object EdPuntosCer: TJvFloatEdit2
            Left = 336
            Top = 28
            Width = 83
            Height = 21
            Alignment = taRightJustify
            Color = clWhite
            ReadOnly = False
            TabOrder = 3
            MaxDecimals = 2
            HasMaxValue = False
            HasMinValue = False
          end
          object EdAmortizaCer: TJvIntegerEdit
            Left = 4
            Top = 68
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Color = clWhite
            MaxLength = 3
            ReadOnly = False
            TabOrder = 5
            Value = 15
            MaxValue = 360
            MinValue = 15
            HasMaxValue = False
            HasMinValue = False
          end
          object ComboModalidadCer: TComboBox
            Left = 80
            Top = 68
            Width = 103
            Height = 21
            Style = csDropDownList
            Color = clWhite
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 6
            Text = 'VENCIDA'
            Items.Strings = (
              'VENCIDA'
              'ANTICIPADA')
          end
          object GroupBox9: TGroupBox
            Left = 2
            Top = 94
            Width = 509
            Height = 67
            Caption = 'Captaci'#243'n a la vista en donde se abonan los intereses'
            Enabled = False
            TabOrder = 9
            object Label24: TLabel
              Left = 4
              Top = 18
              Width = 105
              Height = 13
              Caption = 'Tipo de Captaci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 350
              Top = 20
              Width = 44
              Height = 13
              Caption = 'N'#250'mero'
            end
            object Label26: TLabel
              Left = 6
              Top = 42
              Width = 44
              Height = 13
              Caption = 'Nombre'
            end
            object DBLCBTipoCaptacionCer: TDBLookupComboBox
              Left = 110
              Top = 16
              Width = 235
              Height = 21
              Color = clWhite
              KeyField = 'ID_TIPO_CAPTACION'
              ListField = 'DESCRIPCION'
              ListSource = DSTiposCaptacionCer
              TabOrder = 0
            end
            object EdNumeroCapCer: TJvEdit
              Left = 394
              Top = 16
              Width = 81
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
              Color = clWhite
              MaxLength = 7
              PasswordChar = #0
              ReadOnly = False
              TabOrder = 1
            end
            object EdDigitoCapCer: TStaticText
              Left = 478
              Top = 16
              Width = 21
              Height = 21
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvLowered
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Color = clWhite
              ParentColor = False
              TabOrder = 2
            end
            object EdNombreCapCer: TStaticText
              Left = 110
              Top = 40
              Width = 389
              Height = 21
              AutoSize = False
              BorderStyle = sbsSunken
              Color = clWhite
              ParentColor = False
              TabOrder = 3
            end
          end
          object EdFechaAperturaCer: TDateTimePicker
            Left = 264
            Top = 68
            Width = 101
            Height = 21
            CalAlignment = dtaLeft
            Date = 37811.6786440278
            Time = 37811.6786440278
            Color = clWhite
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 8
          end
          object EdPlazoCer: TJvIntegerEdit
            Left = 186
            Top = 68
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Color = clWhite
            MaxLength = 3
            ReadOnly = False
            TabOrder = 7
            Value = 15
            MaxValue = 360
            MinValue = 15
            HasMaxValue = False
            HasMinValue = False
          end
          object EdFechaVencimientoCer: TStaticText
            Left = 370
            Top = 68
            Width = 113
            Height = 21
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSunken
            Color = clWhite
            ParentColor = False
            TabOrder = 10
          end
          object GroupBox14: TGroupBox
            Left = 2
            Top = 160
            Width = 517
            Height = 57
            Caption = 'Beneficiarios'
            TabOrder = 11
            TabStop = True
            object GridBeneficiariosCer: TXStringGrid
              Left = 2
              Top = 15
              Width = 513
              Height = 84
              Hint = 'Use las flechas para desplazarse entre celdas'
              Align = alTop
              Color = clWhite
              Ctl3D = True
              DefaultRowHeight = 17
              FixedCols = 0
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing]
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              FixedLineColor = clBlack
              Columns = <
                item
                  HeaderFont.Charset = ANSI_CHARSET
                  HeaderFont.Color = clBlack
                  HeaderFont.Height = -11
                  HeaderFont.Name = 'Arial'
                  HeaderFont.Style = [fsBold]
                  HeaderAlignment = taCenter
                  Caption = 'PRIMER APELLIDO'
                  Color = clWhite
                  Width = 115
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  EditorInheritsCellProps = False
                end
                item
                  HeaderFont.Charset = ANSI_CHARSET
                  HeaderFont.Color = clBlack
                  HeaderFont.Height = -11
                  HeaderFont.Name = 'Arial'
                  HeaderFont.Style = [fsBold]
                  HeaderAlignment = taCenter
                  Caption = 'SEGUNDO APELLIDO'
                  Color = clWhite
                  Width = 115
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  EditorInheritsCellProps = False
                end
                item
                  HeaderFont.Charset = ANSI_CHARSET
                  HeaderFont.Color = clBlack
                  HeaderFont.Height = -11
                  HeaderFont.Name = 'Arial'
                  HeaderFont.Style = [fsBold]
                  HeaderAlignment = taCenter
                  Caption = 'NOMBRES'
                  Color = clWhite
                  Width = 110
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  EditorInheritsCellProps = False
                end
                item
                  HeaderFont.Charset = DEFAULT_CHARSET
                  HeaderFont.Color = clBlack
                  HeaderFont.Height = -11
                  HeaderFont.Name = 'MS Sans Serif'
                  HeaderFont.Style = [fsBold]
                  Caption = 'PARENTESCO'
                  Color = clWhite
                  Width = 88
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  EditorInheritsCellProps = False
                end
                item
                  HeaderFont.Charset = DEFAULT_CHARSET
                  HeaderFont.Color = clBlack
                  HeaderFont.Height = -11
                  HeaderFont.Name = 'MS Sans Serif'
                  HeaderFont.Style = [fsBold]
                  HeaderAlignment = taCenter
                  Caption = '%'
                  Color = clWhite
                  Width = 60
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  Alignment = taRightJustify
                  EditorInheritsCellProps = False
                end>
              MultiLine = False
              ImmediateEditMode = True
              ColWidths = (
                115
                115
                110
                88
                60)
            end
          end
        end
        object EdNumeroCer: TJvEdit
          Left = 56
          Top = 372
          Width = 75
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
          Color = clWhite
          MaxLength = 7
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 0
          OnExit = EdNumeroCerExit
          OnKeyPress = EdNumeroCerKeyPress
        end
        object EdDigitoCer: TStaticText
          Left = 134
          Top = 372
          Width = 25
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkSoft
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 3
        end
        object EdEstadoCer: TStaticText
          Left = 246
          Top = 372
          Width = 133
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          TabOrder = 4
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 328
          Width = 403
          Height = 39
          Caption = 'Gravamen Movimiento Financiero'
          TabOrder = 5
          object Label5: TLabel
            Left = 84
            Top = 18
            Width = 156
            Height = 13
            Caption = 'Saldo Sobre el Cual Aplica:'
          end
          object ChkGMFCer: TCheckBox
            Left = 10
            Top = 16
            Width = 63
            Height = 17
            Caption = 'Aplica'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object ValorGMFCer: TJvCurrencyEdit
            Left = 244
            Top = 12
            Width = 153
            Height = 21
            Alignment = taRightJustify
            Color = clWhite
            ReadOnly = False
            TabOrder = 1
            HasMaxValue = False
            HasMinValue = False
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 33
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 8
      Width = 125
      Height = 13
      Caption = 'TIPO DE CAPTACION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLCBTiposCaptacion: TDBLookupComboBox
      Left = 136
      Top = 6
      Width = 291
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'ID_TIPO_CAPTACION'
      ListField = 'DESCRIPCION'
      ListSource = DSTiposCaptacion
      ParentFont = False
      TabOrder = 0
      OnEnter = DBLCBTiposCaptacionEnter
    end
    object CmdContinuar: TBitBtn
      Left = 436
      Top = 4
      Width = 75
      Height = 25
      Caption = 'C&ontinuar'
      TabOrder = 1
      OnClick = CmdContinuarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000420B0000420B0000000100000001000000730800087B
        080008841000088C100008A51800108C2100109C210018AD290031C64A0042D6
        6B0052D67B005AE78C0018A5C60018ADD60021ADD60029ADD60031B5DE0052BD
        E7004AC6E7004AC6EF009CDEEF00ADDEEF006BDEF70073DEF700A5EFF700FF00
        FF0084EFFF008CEFFF0094EFFF008CF7FF0094F7FF00A5F7FF0094FFFF009CFF
        FF00ADFFFF00C6FFFF00D6FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00191919191919
        19191919191919191919190F100E191919191919191919191919190F141A120E
        0C0C0C19191919191919190F11212017171717120E0C19191919190F11221D1B
        1B1B171717130E191919190F0F151E1E1B1B1B1B171713191919190F170F211D
        1D1D1B1B1B17170C1919190F1E0F1518181F1B1B1B17000C1919190F21170F0C
        0C0C151D1A000B000C19190F211E171717160F15000A09080019190F211E1E1E
        1E17170F0C0508060C19190F23202124241B1C17170207021919190E14232314
        0D0C0C0C0C03041919191919100F0C0C19191919030402191919191919191919
        1900010303011919191919191919191919191919191919191919}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 496
    Width = 541
    Height = 30
    Align = alBottom
    Color = clOlive
    TabOrder = 2
    object CmdOtra: TBitBtn
      Left = 294
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Otra'
      TabOrder = 1
      OnClick = CmdOtraClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000420B0000420B00000001000000010000CE630000FFD6
        AD00FFE7C600FFEFDE00FFEFE700FFF7EF0042B5F7008CD6F700B5DEF700FF00
        FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
        090909090909090909090900000000000000000000000000000009000B0B0505
        0303030402020101010009000B0B0B050505030303020202010009000B0B0B0B
        0505050303040201010009000B0B0B0B0B0B050503030302010009000B0B0B0B
        0B0B0B0505030402010009000B0B0B0B0B0B0B0B050A0A0A010009000B0B0B0B
        0B0B0B0B0B0A060A010009000B0B0B0B0B0B0B0A0A0A060A0A0A09000B0B0B0B
        0B0B0B0A07080808070A09000B0B0B0B0B0B0B0A0A0A080A0A0A090000000000
        00000000000A080A000009090000000000000000000A0A0A0009090909090909
        0909090909090909090909090909090909090909090909090909}
    end
    object CmdSaldar: TBitBtn
      Left = 373
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Saldar'
      Enabled = False
      TabOrder = 0
      OnClick = CmdSaldarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000008C00000094
        0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
        210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
        420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
        94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
        04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
        0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
        170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
        13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
        1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
        1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
        1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
    end
    object CmdCerrar: TBitBtn
      Left = 451
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 2
      OnClick = CmdCerrarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000006400004242
        42008C6363009A666600B9666600BB686800B0717200C3686900C66A6B00C76A
        6D00CF6C6E00D2686900D16D6E00CC6E7100C0797A00D2707200D4707100D572
        7300D0727500D3747600D9757600D8767700E37D7E000080000000960000DC7F
        8000FF00FF00D7868700DA888800D8888A00DA888A00DF898A00E6808100E085
        8500E9818200EE868700E3888900E78C8D00F0878800F18B8C00F28B8C00F18D
        8E00F48C8D00F48E8F00EB8F9000EC969700E49A9800F3919200F7909100F791
        9200F2939400F9909200F9949500FA949500F9969700F0999A00FC999A00FF9D
        9E00F7B58400F5A7A500FACCAA00FBD6BB00FADCDC00FFFFFF00000000000000
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
        00000000000000000000000000000000000000000000000000001A1A1A1A1A1A
        1A02011A1A1A1A1A1A1A1A1A1A1A02030405011A1A1A1A1A1A1A1A1A0203080B
        0B07010303030303031A1A1A030C0C0C0A09010E1F323B3B031A1A1A030C0C10
        0F0D01181818183B031A1A1A03111114151201181818183B031A1A1A03161616
        201301181717173B031A1A1A0326222D3E1D01171700003B031A1A1A03262337
        3F1E013C3A3A3A3B031A1A1A03272B282A19013C3D3D3D3B031A1A1A03273031
        2921013C3D3D3D3B031A1A1A032734352F24013C3D3D3D3B031A1A1A03273338
        3625013C3D3D3D3B031A1A1A03032E33392C013C3D3D3D3B031A1A1A1A1A0306
        1B1C010303030303031A1A1A1A1A1A1A0303011A1A1A1A1A1A1A}
    end
    object CmdInforme: TBitBtn
      Left = 12
      Top = 5
      Width = 105
      Height = 25
      Caption = 'Generar Informe'
      Enabled = False
      TabOrder = 3
      OnClick = CmdInformeClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000181818002118
        21001821210031313100393939004242420052525200636363006B6B6B007373
        7300848484008C8C8C00948C8C00949494009C949400F7AD94009C9C9C00CE9C
        9C00F7AD9C00FFAD9C00FFB59C009C9CA500A5A5A500ADA5A500C6A5A500A5AD
        A500FFBDA500A5D6A500ADADAD00B5ADAD00FFC6AD00B5B5B500FFC6B500BDBD
        BD00C6BDBD00BDC6BD00E7C6BD00EFCEBD00FFCEBD00BDBDC600C6C6C600CEC6
        C600E7CEC600CECECE00D6CECE00DED6CE00FFDECE00D6D6D600FFE7D600D6DE
        DE00DEDEDE00EFE7DE00E7E7E700EFE7E700FFE7E700EFEFEF00F7EFEF00F7EF
        F700F7F7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003B3B3B3B3B3B
        103B3B3B0A0A0B3B3B3B3B3B3B3B10102C0D04060E282F0A3B3B3B3B10103A3C
        2F1005010103070A0B3B0C10373C3528100B0D0A07040201093B10343421161D
        22160D0C0D0E0B080A3B0D1C161C282F373732281C100C0D0B3B0C1C282B2832
        2B19212B2F2F281F0D3B3B102B2B32281F1B231817161F22163B3B3B10211C1C
        343837332F2B1F0D3B3B3B3B3B102F2B10212F2F2F281C3B3B3B3B3B3B3B362E
        24242A2D2B0D3B3B3B3B3B3B3B3B112E261E1A133B3B3B3B3B3B3B3B3B3B112E
        261E1A0F3B3B3B3B3B3B3B3B3B3B112E261E1A123B3B3B3B3B3B3B3B3B11302E
        261E1A123B3B3B3B3B3B3B3B3B1111111112123B3B3B3B3B3B3B}
    end
    object cmdFormaPago: TBitBtn
      Left = 125
      Top = 5
      Width = 112
      Height = 25
      Caption = 'Forma de Pago'
      Enabled = False
      TabOrder = 4
      OnClick = cmdFormaPagoClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF4A49494A49494A49494A49494A49494A49494A49494A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A49498E8F8FADABABB9B1AD51
        6481516481B9B1ACABA8A8949393474848FF00FFFF00FFFF00FFFF00FFFF00FF
        464646BEBABAC8C7C7C5C0BD6B7B9A00689B00689B6B7B9ADDD9D6BDBCBCB3AF
        AF474848FF00FFFF00FFFF00FF797A7A979595C0C0C0DDDAD86B7B9A00ACE800
        AFE200AFE2009FDB6B7B9ADCDAD9A9A6A69695954A4949FF00FFFF00FF797A7A
        ADAAAABDBBBBFCFFFF6B7B9A6B7B9A00689B00689B00AFE26D7E9DE9E5E1BEBD
        BDAEABAB4A4949FF00FFFF00FF797A7AA9A7A7C9C9C9EAEAE9D3E0EA6B7B9A00
        AFE200AFE200A1D9D4D6E1E8EAE9BCBBBBABA8A84A4949FF00FFFF00FF797A7A
        B1AEAEBBBABAF6F5F36B7B9A00AFE200A6D900689B6B7B9A6B7B9AEBE7E4AFAD
        ADADACAC4A4949FF00FFFF00FFFF00FF797A7AADA9A9DBD9D7C3C5D26B7B9A00
        AADD00AFE200ACE86B7B9ACECDCCACA9A94A4949FF00FFFF00FFFF00FFFF00FF
        797A7AAFAEAEC5C3C3E8E5E16B7B9A00689B00689B6B7B9ADBD8D5AAA5A5B2B1
        B14A4949FF00FFFF00FFFF00FFFF00FFFF00FF797A7A979494A6A2A2CFC7C34C
        5C794C5D79C8C1BCBBB7B79493934A4949FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF797A7A797A7A6A6A6A716E6B726F6B6A6A6A4747474A4949FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF79797969
        67676969697D7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF8C8989CCCFD09195968F8D8DFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9A9AD6D4D3F3
        FDFFCBD2D5C8C4C47B7C7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF202020A5A5A5333333929090969494353535A8A8A8222222FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object DSTiposCaptacion: TDataSource
    AutoEdit = False
    DataSet = dmCaptacion.IBTiposCaptacion
    Left = 462
    Top = 24
  end
  object DSIntVariable: TDataSource
    DataSet = dmCaptacion.IBTasasVariables
    Left = 472
    Top = 52
  end
  object DSTiposCaptacionCer: TDataSource
    DataSet = dmCaptacion.IBTiposCaptacionCer
    Left = 490
    Top = 22
  end
  object DSPlanContractual: TDataSource
    DataSet = dmCaptacion.IBPlanContractual
    Left = 498
    Top = 54
  end
  object DSTiposIdentificacion1: TDataSource
    DataSet = dmCaptacion.IBTiposIdentificacion
    Left = 448
    Top = 50
  end
  object DSTiposIdentificacion2: TDataSource
    DataSet = dmCaptacion.IBTiposIdentificacion
    Left = 432
    Top = 30
  end
  object DSTiposIdentificacion3: TDataSource
    DataSet = dmCaptacion.IBTiposIdentificacion
    Left = 460
    Top = 80
  end
  object DSTiposIdentificacion4: TDataSource
    DataSet = dmCaptacion.IBTiposIdentificacion
    Left = 416
    Top = 52
  end
  object DSTiposIdentificacion5: TDataSource
    DataSet = dmCaptacion.IBTiposIdentificacion
    Left = 462
    Top = 112
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 418
    Top = 86
  end
  object IBDComprobante: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    DeleteSQL.Strings = (
      'delete from CON$COMPROBANTE'
      'where'
      '  CON$COMPROBANTE."ID_COMPROBANTE" = :"OLD_ID_COMPROBANTE" and'
      '  CON$COMPROBANTE."ID_AGENCIA" = :"OLD_ID_AGENCIA"')
    InsertSQL.Strings = (
      'insert into CON$COMPROBANTE'
      
        '  (CON$COMPROBANTE."ID_COMPROBANTE", CON$COMPROBANTE."ID_AGENCIA' +
        '", '
      
        '   CON$COMPROBANTE."TIPO_COMPROBANTE", CON$COMPROBANTE."FECHADIA' +
        '", '
      
        '   CON$COMPROBANTE."DESCRIPCION", CON$COMPROBANTE."TOTAL_DEBITO"' +
        ', '
      'CON$COMPROBANTE."TOTAL_CREDITO", '
      '   CON$COMPROBANTE."ESTADO", CON$COMPROBANTE."IMPRESO", '
      'CON$COMPROBANTE."ANULACION", '
      '   CON$COMPROBANTE."ID_EMPLEADO")'
      'values'
      '  (:"ID_COMPROBANTE", :"ID_AGENCIA", :"TIPO_COMPROBANTE", '
      ':"FECHADIA", '
      
        '   :"DESCRIPCION", :"TOTAL_DEBITO", :"TOTAL_CREDITO", :"ESTADO",' +
        ' '
      ':"IMPRESO", '
      '   :"ANULACION", :"ID_EMPLEADO")')
    RefreshSQL.Strings = (
      'Select '
      '  CON$COMPROBANTE."ID_COMPROBANTE",'
      '  CON$COMPROBANTE."ID_AGENCIA",'
      '  CON$COMPROBANTE."TIPO_COMPROBANTE",'
      '  CON$COMPROBANTE."FECHADIA",'
      '  CON$COMPROBANTE."DESCRIPCION",'
      '  CON$COMPROBANTE."TOTAL_DEBITO",'
      '  CON$COMPROBANTE."TOTAL_CREDITO",'
      '  CON$COMPROBANTE."ESTADO",'
      '  CON$COMPROBANTE."IMPRESO",'
      '  CON$COMPROBANTE."ANULACION",'
      '  CON$COMPROBANTE."ID_EMPLEADO"'
      'from CON$COMPROBANTE '
      'where'
      '  CON$COMPROBANTE."ID_COMPROBANTE" = :"ID_COMPROBANTE" and'
      '  CON$COMPROBANTE."ID_AGENCIA" = :"ID_AGENCIA"')
    SelectSQL.Strings = (
      'select * from CON$COMPROBANTE')
    ModifySQL.Strings = (
      'update CON$COMPROBANTE'
      'set'
      '  CON$COMPROBANTE."ID_COMPROBANTE" = :"ID_COMPROBANTE",'
      '  CON$COMPROBANTE."ID_AGENCIA" = :"ID_AGENCIA",'
      '  CON$COMPROBANTE."TIPO_COMPROBANTE" = :"TIPO_COMPROBANTE",'
      '  CON$COMPROBANTE."FECHADIA" = :"FECHADIA",'
      '  CON$COMPROBANTE."DESCRIPCION" = :"DESCRIPCION",'
      '  CON$COMPROBANTE."TOTAL_DEBITO" = :"TOTAL_DEBITO",'
      '  CON$COMPROBANTE."TOTAL_CREDITO" = :"TOTAL_CREDITO",'
      '  CON$COMPROBANTE."ESTADO" = :"ESTADO",'
      '  CON$COMPROBANTE."IMPRESO" = :"IMPRESO",'
      '  CON$COMPROBANTE."ANULACION" = :"ANULACION",'
      '  CON$COMPROBANTE."ID_EMPLEADO" = :"ID_EMPLEADO"'
      'where'
      '  CON$COMPROBANTE."ID_COMPROBANTE" = :"OLD_ID_COMPROBANTE" and'
      '  CON$COMPROBANTE."ID_AGENCIA" = :"OLD_ID_AGENCIA"')
    Left = 418
    Top = 114
  end
  object IBDAuxiliar: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    DeleteSQL.Strings = (
      'delete from CON$AUXILIAR'
      'where'
      '  CON$AUXILIAR."ID_COMPROBANTE" = :"OLD_ID_COMPROBANTE" and'
      '  CON$AUXILIAR."ID_AGENCIA" = :"OLD_ID_AGENCIA" and'
      '  CON$AUXILIAR."FECHA" = :"OLD_FECHA" and'
      '  CON$AUXILIAR."CODIGO" = :"OLD_CODIGO"')
    InsertSQL.Strings = (
      'insert into CON$AUXILIAR'
      '  (CON$AUXILIAR."ID_COMPROBANTE", CON$AUXILIAR."ID_AGENCIA", '
      'CON$AUXILIAR."FECHA", '
      
        '   CON$AUXILIAR."CODIGO", CON$AUXILIAR."DEBITO", "con$auxiliar".' +
        '"CREDITO", '
      '   CON$AUXILIAR."ID_CUENTA", CON$AUXILIAR."ID_COLOCACION", '
      'CON$AUXILIAR."ID_IDENTIFICACION", '
      '   CON$AUXILIAR."ID_PERSONA", CON$AUXILIAR."MONTO_RETENCION", '
      'CON$AUXILIAR."TASA_RETENCION", '
      '   CON$AUXILIAR."ESTADOAUX", CON$AUXILIAR."TIPO_COMPROBANTE")'
      'values'
      
        '  (:"ID_COMPROBANTE", :"ID_AGENCIA", :"FECHA", :"CODIGO", :"DEBI' +
        'TO", '
      ':"CREDITO", '
      
        '   :"ID_CUENTA", :"ID_COLOCACION", :"ID_IDENTIFICACION", :"ID_PE' +
        'RSONA", '
      
        '   :"MONTO_RETENCION", :"TASA_RETENCION", :"ESTADOAUX",:"TIPO_CO' +
        'MPROBANTE")')
    RefreshSQL.Strings = (
      'Select '
      '  CON$AUXILIAR."ID_COMPROBANTE",'
      '  CON$AUXILIAR."ID_AGENCIA",'
      '  CON$AUXILIAR."FECHA",'
      '  CON$AUXILIAR."CODIGO",'
      '  CON$AUXILIAR."DEBITO",'
      '  CON$AUXILIAR."CREDITO",'
      '  CON$AUXILIAR."ID_CUENTA",'
      '  CON$AUXILIAR."ID_COLOCACION",'
      '  CON$AUXILIAR."ID_IDENTIFICACION",'
      '  CON$AUXILIAR."ID_PERSONA",'
      '  CON$AUXILIAR."MONTO_RETENCION",'
      '  CON$AUXILIAR."TASA_RETENCION",'
      '  CON$AUXILIAR."ESTADOAUX"'
      'from CON$AUXILIAR '
      'where'
      
        '  CON$AUXILIAR."ID_COMPROBANTE" = :"ID_COMPROBANTE" and CON$AUXI' +
        'LIAR.TIPO_COMPROBANTE = :TIPO_COMPROBANTE and '
      '  CON$AUXILIAR."ID_AGENCIA" = :"ID_AGENCIA" and'
      '  CON$AUXILIAR."FECHA" = :"FECHA" and'
      '  CON$AUXILIAR."CODIGO" = :"CODIGO"')
    SelectSQL.Strings = (
      'select * from CON$AUXILIAR')
    ModifySQL.Strings = (
      'update CON$AUXILIAR'
      'set'
      '  CON$AUXILIAR."ID_COMPROBANTE" = :"ID_COMPROBANTE",'
      '  CON$AUXILIAR."ID_AGENCIA" = :"ID_AGENCIA",'
      '  CON$AUXILIAR."FECHA" = :"FECHA",'
      '  CON$AUXILIAR."CODIGO" = :"CODIGO",'
      '  CON$AUXILIAR."DEBITO" = :"DEBITO",'
      '  CON$AUXILIAR."CREDITO" = :"CREDITO",'
      '  CON$AUXILIAR."ID_CUENTA" = :"ID_CUENTA",'
      '  CON$AUXILIAR."ID_COLOCACION" = :"ID_COLOCACION",'
      '  CON$AUXILIAR."ID_IDENTIFICACION" = :"ID_IDENTIFICACION",'
      '  CON$AUXILIAR."ID_PERSONA" = :"ID_PERSONA",'
      '  CON$AUXILIAR."MONTO_RETENCION" = :"MONTO_RETENCION",'
      '  CON$AUXILIAR."TASA_RETENCION" = :"TASA_RETENCION",'
      '  CON$AUXILIAR."ESTADOAUX" = :"ESTADOAUX"'
      'where'
      
        '  CON$AUXILIAR."ID_COMPROBANTE" = :"OLD_ID_COMPROBANTE" and CON$' +
        'AUXILIAR.TIPO_COMPROBNATE = :"OLD_TIPO_COMPROBANTE and '
      '  CON$AUXILIAR."ID_AGENCIA" = :"OLD_ID_AGENCIA" and'
      '  CON$AUXILIAR."FECHA" = :"OLD_FECHA" and'
      '  CON$AUXILIAR."CODIGO" = :"OLD_CODIGO"')
    Left = 488
    Top = 134
  end
  object IBAuxiliar: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select'
      '         CON$AUXILIAR.ID_COMPROBANTE,'
      '         "gen$agencia".DESCRIPCION_AGENCIA,'
      '         CON$TIPOCOMPROBANTE.DESCRIPCION AS TIPO,'
      '         CON$COMPROBANTE.FECHADIA,'
      '         CON$COMPROBANTE.DESCRIPCION,'
      '         "gen$empleado".PRIMER_APELLIDO,'
      '         "gen$empleado".SEGUNDO_APELLIDO,'
      '         "gen$empleado".NOMBRE,'
      '         CON$AUXILIAR.CODIGO,'
      '         CON$PUC.NOMBRE AS CUENTA,'
      '         CON$AUXILIAR.DEBITO,'
      '         CON$AUXILIAR.CREDITO'
      '         from'
      'CON$COMPROBANTE'
      
        'INNER JOIN CON$AUXILIAR ON (CON$COMPROBANTE.ID_COMPROBANTE = CON' +
        '$AUXILIAR.ID_COMPROBANTE and CON$COMPROBANTE.TIPO_COMPROBANTE = ' +
        'CON$AUXILIAR.TIPO_COMPROBANTE)'
      
        'INNER JOIN CON$TIPOCOMPROBANTE ON (CON$COMPROBANTE.TIPO_COMPROBA' +
        'NTE  = CON$TIPOCOMPROBANTE.ID ) '
      
        'INNER JOIN "gen$agencia" ON (CON$AUXILIAR.ID_AGENCIA = "gen$agen' +
        'cia".ID_AGENCIA)'
      'LEFT JOIN CON$PUC ON (CON$AUXILIAR.CODIGO = CON$PUC.CODIGO)'
      
        'INNER JOIN "gen$empleado" ON (CON$COMPROBANTE.ID_EMPLEADO = "gen' +
        '$empleado".ID_EMPLEADO) '
      'where (CON$COMPROBANTE.ID_AGENCIA = :"ID_AGENCIA" ) and'
      '           (CON$COMPROBANTE.ID_COMPROBANTE = :"ID_COMPROBANTE" )')
    Left = 456
    Top = 150
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_COMPROBANTE'
        ParamType = ptUnknown
      end>
    object IBAuxiliarID_COMPROBANTE: TIntegerField
      FieldName = 'ID_COMPROBANTE'
      Origin = 'CON$AUXILIAR.ID_COMPROBANTE'
    end
    object IBAuxiliarDESCRIPCION_AGENCIA: TIBStringField
      FieldName = 'DESCRIPCION_AGENCIA'
      Origin = 'gen$agencia.DESCRIPCION_AGENCIA'
      Required = True
      Size = 50
    end
    object IBAuxiliarTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'con$tipocomprobante.DESCRIPCION'
      Size = 100
    end
    object IBAuxiliarFECHADIA: TDateField
      FieldName = 'FECHADIA'
      Origin = 'con$comprobante.FECHADIA'
      Required = True
    end
    object IBAuxiliarDESCRIPCION: TMemoField
      FieldName = 'DESCRIPCION'
      Origin = 'con$comprobante.DESCRIPCION'
      BlobType = ftMemo
      Size = 8
    end
    object IBAuxiliarPRIMER_APELLIDO: TIBStringField
      FieldName = 'PRIMER_APELLIDO'
      Origin = 'gen$empleado.PRIMER_APELLIDO'
      Size = 30
    end
    object IBAuxiliarSEGUNDO_APELLIDO: TIBStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Origin = 'gen$empleado.SEGUNDO_APELLIDO'
      Size = 30
    end
    object IBAuxiliarNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'gen$empleado.NOMBRE'
      Size = 30
    end
    object IBAuxiliarCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'CON$AUXILIAR.CODIGO'
      FixedChar = True
      Size = 18
    end
    object IBAuxiliarCUENTA: TIBStringField
      FieldName = 'CUENTA'
      Origin = 'CON$PUC.NOMBRE'
      Size = 100
    end
    object IBAuxiliarDEBITO: TIBBCDField
      FieldName = 'DEBITO'
      Origin = 'CON$AUXILIAR.DEBITO'
      Required = True
      Precision = 18
      Size = 3
    end
    object IBAuxiliarCREDITO: TIBBCDField
      FieldName = 'CREDITO'
      Origin = 'CON$AUXILIAR.CREDITO'
      Required = True
      Precision = 18
      Size = 3
    end
  end
  object ReporteC: TprTxReport
    ShowProgress = True
    FromPage = 1
    ToPage = 1
    Title = 'COMPROBANTE CONTABLE'
    ExportFromPage = 0
    ExportToPage = 0
    Values = <
      item
        Name = 'TotalDebito'
        AggFunction = prafSum
        Formula = 'IBAuxiliar.DEBITO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBAuxiliar'
      end
      item
        Name = 'TotalCredito'
        AggFunction = prafSum
        Formula = 'IBAuxiliar.CREDITO'
        ResetOn = rvtReport
        CalcOn = cvtDataSetNext
        DataSetName = 'IBAuxiliar'
      end>
    Variables = <
      item
        Name = 'EMPRESA'
        ValueType = 'prvvtString'
        Value = 'CREDISERVIR LTDA'
      end
      item
        Name = 'NIT'
        ValueType = 'prvvtString'
        Value = '890.505.336-6'
      end
      item
        Name = 'ALIAS'
        ValueType = 'prvvtString'
        Value = 'ALEXANDER CRUZ'
      end>
    PrinterName = '\\DEPARTAS02\Epson LX-300'
    ESCModelName = 'Epson printers'
    WrapAfterColumn = 0
    EjectPageAfterPrint = False
    LinesOnPage = 0
    FromLine = 0
    ToLine = 0
    ExportFromLine = 0
    ExportToLine = 0
    Left = 426
    Top = 146
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 3'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 1'
      'ProcessorType: 586'
      ''
      'Compiler version: Delphi6'
      'PReport version: 1.9.4')
    object prTxPage1: TprTxPage
      PageType = tptPage
      LineNum = 60
      ColNum = 140
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 7
        UseVerticalBands = False
        DetailBand = ReporteC.prTxHDetailBand2
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = True
        LinkToDetail = True
        object prTxMemoObj52: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CODIGO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 5
          dRec.Right = 17
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj53: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CUENTA CONTABLE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 5
          dRec.Right = 65
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj54: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DEBITO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 95
          dRec.Top = 5
          dRec.Right = 113
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj55: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CREDITO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 114
          dRec.Top = 5
          dRec.Right = 132
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj62: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 6
          dRec.Right = 132
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[EMPRESA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 17
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NIT:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 0
          dRec.Right = 23
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[NIT]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 24
          dRec.Top = 0
          dRec.Right = 42
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Comprobante No.:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 43
          dRec.Top = 0
          dRec.Right = 59
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<000000>IBAuxiliar.ID_COMPROBANTE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 59
          dRec.Top = 0
          dRec.Right = 66
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 7
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>IBAuxiliar.FECHADIA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 8
          dRec.Top = 1
          dRec.Right = 18
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.CODIGO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 7
          dRec.Right = 17
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 7
          dRec.Right = 48
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AGENCIA:[IBAuxiliar.DESCRIPCION_AGENCIA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 19
          dRec.Top = 1
          dRec.Right = 43
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No. Cta/Credito')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 66
          dRec.Top = 5
          dRec.Right = 81
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 65
          dRec.Top = 5
          dRec.Right = 66
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 17
          dRec.Top = 5
          dRec.Right = 18
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Ident.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 82
          dRec.Top = 5
          dRec.Right = 94
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 94
          dRec.Top = 5
          dRec.Right = 95
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 5
          dRec.Right = 114
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 81
          dRec.Top = 5
          dRec.Right = 82
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 82
          dRec.Top = 7
          dRec.Right = 94
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 17
          dRec.Top = 5
          dRec.Right = 18
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 4
          dRec.Right = 132
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tipo de Comprobante:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 67
          dRec.Top = 0
          dRec.Right = 87
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj34: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.TIPO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 87
          dRec.Top = 0
          dRec.Right = 132
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Descripci'#243'n:[IBAuxiliar.DESCRIPCION]'
                '')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = True
              CanResizeY = True
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = True
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 132
          dRec.Bottom = 4
          dRec.WidthAsVerticalBand = True
          dRec.HeightAsHorizontalBand = True
          Visible = False
        end
      end
      object prTxHDetailBand2: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBAuxiliar'
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand1'
          'prTxHDetailFooterBand1')
        object prTxMemoObj65: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 94
          dRec.Top = 0
          dRec.Right = 95
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj66: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 113
          dRec.Top = 0
          dRec.Right = 114
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj69: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 17
          dRec.Top = 0
          dRec.Right = 18
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBAuxiliar.CREDITO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 114
          dRec.Top = 0
          dRec.Right = 132
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,#0.00>IBAuxiliar.DEBITO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 95
          dRec.Top = 0
          dRec.Right = 113
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 18
          dRec.Top = 0
          dRec.Right = 65
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBAuxiliar.CODIGO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 17
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 65
          dRec.Top = 0
          dRec.Right = 66
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 66
          dRec.Top = 0
          dRec.Right = 81
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '|')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 81
          dRec.Top = 0
          dRec.Right = 82
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand1: TprTxHDetailFooterBand
        Height = 4
        UseVerticalBands = False
        DetailBand = ReporteC.prTxHDetailBand2
        ColCount = 1
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = True
        object prTxMemoObj60: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 0
          dRec.Right = 132
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj61: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SUMAS IGUALES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 74
          dRec.Top = 1
          dRec.Right = 94
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj63: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>TotalDebito]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold)
            end>
          dRec.Left = 95
          dRec.Top = 1
          dRec.Right = 113
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj64: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0.00>TotalCredito]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold)
            end>
          dRec.Left = 114
          dRec.Top = 1
          dRec.Right = 132
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj70: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '---')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 2
          dRec.Right = 132
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                ':')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 94
          dRec.Top = 1
          dRec.Right = 95
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'ELABORO:[IBAuxiliar.PRIMER_APELLIDO+" "+IBAuxiliar.SEGUNDO_APELL' +
                  'IDO+" "+IBAuxiliar.NOMBRE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 3
          dRec.Right = 74
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha de Impresi'#243'n :')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 1
          dRec.Top = 1
          dRec.Right = 21
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<yyyy/MM/dd>StartDateTime]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 21
          dRec.Top = 1
          dRec.Right = 31
          dRec.Bottom = 2
          Visible = False
        end
      end
    end
  end
  object DSTiposCaptacionF: TDataSource
    AutoEdit = False
    DataSet = dmCaptacion.IBTiposCaptacionF
    Left = 494
    Top = 80
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 472
    Top = 192
  end
  object DSPlanAPagar: TDataSource
    DataSet = IBQplanContractual
    Left = 440
    Top = 264
  end
  object IBQplanContractual: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM "cap$tiposplancontractual"')
    Left = 472
    Top = 264
  end
end
