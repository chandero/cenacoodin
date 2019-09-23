object frmCreacionPersona: TfrmCreacionPersona
  Left = 286
  Top = 97
  Width = 670
  Height = 572
  Caption = 'Creaci'#243'n de Persona'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 277
    Width = 662
    Height = 228
    Align = alBottom
    TabOrder = 1
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 660
      Height = 226
      ActivePage = InfoConyuge
      Align = alClient
      Images = Images
      TabIndex = 0
      TabOrder = 0
      OnDrawTab = PageControlDrawTab
      object InfoConyuge: TTabSheet
        Caption = '1. Informaci'#243'n del Conyuge'
        OnExit = InfoConyugeExit
        OnShow = InfoConyugeShow
        object GroupBox2: TGroupBox
          Left = 2
          Top = 0
          Width = 343
          Height = 187
          Caption = 'Informaci'#243'n Personal'
          TabOrder = 0
          object Label10: TLabel
            Left = 6
            Top = 16
            Width = 102
            Height = 13
            Caption = 'Tipo de Identificaci'#243'n'
          end
          object Label11: TLabel
            Left = 178
            Top = 14
            Width = 118
            Height = 13
            Caption = 'N'#250'mero de Identificaci'#243'n'
          end
          object CBtipoidentificacionconyuge: TDBLookupComboBox
            Left = 6
            Top = 30
            Width = 165
            Height = 21
            KeyField = 'ID_IDENTIFICACION'
            ListField = 'DESCRIPCION_IDENTIFICACION'
            ListSource = dmPersona.DStiposidentificacionconyuge
            TabOrder = 0
            OnEnter = CBtipoidentificacionconyugeEnter
            OnExit = CBtipoidentificacionconyugeExit
          end
          object EdNumeroIdentificacionConyuge: TMemo
            Left = 174
            Top = 30
            Width = 165
            Height = 21
            Alignment = taRightJustify
            TabOrder = 1
            WantReturns = False
            WordWrap = False
            OnEnter = EdNumeroIdentificacionConyugeEnter
            OnExit = EdNumeroIdentificacionConyugeExit
            OnKeyPress = EdIdentificacionKeyPress
          end
          object EdPrimerApellidoConyuge: TLabeledEdit
            Left = 92
            Top = 54
            Width = 193
            Height = 21
            CharCase = ecUpperCase
            EditLabel.Width = 69
            EditLabel.Height = 13
            EditLabel.Caption = 'Primer Apellido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 17
            ParentFont = False
            TabOrder = 2
            OnEnter = EdPrimerApellidoConyugeEnter
            OnExit = EdPrimerApellidoConyugeExit
          end
          object EdSegundoApellidoConyuge: TLabeledEdit
            Left = 92
            Top = 74
            Width = 193
            Height = 21
            CharCase = ecUpperCase
            EditLabel.Width = 83
            EditLabel.Height = 13
            EditLabel.Caption = 'Segundo Apellido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentFont = False
            TabOrder = 3
            OnEnter = EdSegundoApellidoConyugeEnter
            OnExit = EdSegundoApellidoConyugeExit
          end
          object EdNombreConyuge: TLabeledEdit
            Left = 92
            Top = 94
            Width = 193
            Height = 21
            CharCase = ecUpperCase
            EditLabel.Width = 42
            EditLabel.Height = 13
            EditLabel.Caption = 'Nombres'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            LabelPosition = lpLeft
            LabelSpacing = 43
            ParentFont = False
            TabOrder = 4
            OnEnter = EdNombreConyugeEnter
            OnExit = EdNombreConyugeExit
          end
        end
        object GroupBox3: TGroupBox
          Left = 346
          Top = 0
          Width = 285
          Height = 187
          Caption = 'Informaci'#243'n Financiera'
          TabOrder = 1
          object Label12: TLabel
            Left = 6
            Top = 22
            Width = 130
            Height = 13
            Caption = 'Ingresos Actividad Principal'
          end
          object Label13: TLabel
            Left = 6
            Top = 42
            Width = 68
            Height = 13
            Caption = 'Otros Ingresos'
          end
          object Label15: TLabel
            Left = 6
            Top = 70
            Width = 119
            Height = 13
            Caption = 'Total Egresos Principales'
          end
          object Label16: TLabel
            Left = 8
            Top = 92
            Width = 66
            Height = 13
            Caption = 'Otros Egresos'
          end
          object EdIngresosConyuge: TMemo
            Left = 142
            Top = 18
            Width = 139
            Height = 21
            Alignment = taRightJustify
            TabOrder = 0
            WantReturns = False
            WordWrap = False
            OnEnter = EdIngresosConyugeEnter
            OnExit = EdIngresosConyugeExit
            OnKeyPress = EdIngresosConyugeKeyPress
          end
          object EdEgresosConyuge: TMemo
            Left = 142
            Top = 66
            Width = 139
            Height = 21
            Alignment = taRightJustify
            TabOrder = 2
            WantReturns = False
            WordWrap = False
            OnEnter = EdEgresosConyugeEnter
            OnExit = EdEgresosConyugeExit
            OnKeyPress = EdEgresosConyugeKeyPress
          end
          object EdOtrosIngresosConyuge: TMemo
            Left = 142
            Top = 42
            Width = 139
            Height = 21
            Alignment = taRightJustify
            TabOrder = 1
            WantReturns = False
            WordWrap = False
            OnEnter = EdOtrosIngresosConyugeEnter
            OnExit = EdOtrosIngresosConyugeExit
            OnKeyPress = EdOtrosIngresosConyugeKeyPress
          end
          object EdOtrosEgresosConyuge: TMemo
            Left = 142
            Top = 90
            Width = 139
            Height = 21
            Alignment = taRightJustify
            TabOrder = 3
            WantReturns = False
            WordWrap = False
            OnEnter = EdOtrosEgresosConyugeEnter
            OnExit = EdOtrosEgresosConyugeExit
            OnKeyPress = EdOtrosEgresosConyugeKeyPress
          end
        end
      end
      object InfoLaboral: TTabSheet
        Caption = '2. Informaci'#243'n Laboral'
        ImageIndex = 1
        OnShow = InfoLaboralShow
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 257
          Height = 197
          Caption = 'Descripci'#243'n de la Actividad'
          TabOrder = 0
          object scbActividad: TScrollBox
            Left = 6
            Top = 13
            Width = 246
            Height = 177
            HorzScrollBar.ButtonSize = 1
            HorzScrollBar.Style = ssFlat
            VertScrollBar.Position = 93
            VertScrollBar.Style = ssFlat
            BorderStyle = bsNone
            TabOrder = 0
            object Label17: TLabel
              Left = 5
              Top = 79
              Width = 83
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha de Ingreso'
            end
            object Label36: TLabel
              Left = 6
              Top = 182
              Width = 62
              Height = 13
              Caption = 'Total Activos'
            end
            object Label37: TLabel
              Left = 6
              Top = 202
              Width = 64
              Height = 13
              Caption = 'Total Pasivos'
            end
            object Label43: TLabel
              Left = 2
              Top = -88
              Width = 52
              Height = 13
              Caption = 'Ocupaci'#243'n'
            end
            object Label71: TLabel
              Left = 2
              Top = -45
              Width = 79
              Height = 13
              Caption = 'Tipo de Contrato'
            end
            object Label72: TLabel
              Left = 4
              Top = -12
              Width = 39
              Height = 13
              Caption = 'Descrip.'
            end
            object Label73: TLabel
              Left = 4
              Top = -26
              Width = 40
              Height = 13
              Caption = 'Contrato'
            end
            object Label47: TLabel
              Left = 4
              Top = 96
              Width = 17
              Height = 13
              Caption = 'Ciiu'
            end
            object EdProfesion: TLabeledEdit
              Left = 46
              Top = 4
              Width = 183
              Height = 21
              CharCase = ecUpperCase
              EditLabel.Width = 77
              EditLabel.Height = 13
              EditLabel.Caption = 'Descrip. Ocupa.'
              EditLabel.Layout = tlCenter
              EditLabel.WordWrap = True
              LabelPosition = lpLeft
              LabelSpacing = 3
              TabOrder = 5
              OnEnter = EdProfesionEnter
              OnExit = EdProfesionExit
            end
            object EdEmpresa: TLabeledEdit
              Left = 46
              Top = 28
              Width = 183
              Height = 21
              CharCase = ecUpperCase
              EditLabel.Width = 41
              EditLabel.Height = 13
              EditLabel.Caption = 'Empresa'
              LabelPosition = lpLeft
              LabelSpacing = 3
              TabOrder = 6
              OnEnter = EdEmpresaEnter
              OnExit = EdEmpresaExit
            end
            object EdCargo: TLabeledEdit
              Left = 46
              Top = 52
              Width = 183
              Height = 21
              CharCase = ecUpperCase
              EditLabel.Width = 28
              EditLabel.Height = 13
              EditLabel.Caption = 'Cargo'
              LabelPosition = lpLeft
              LabelSpacing = 3
              TabOrder = 7
              OnEnter = EdCargoEnter
              OnExit = EdCargoExit
            end
            object EdFechaIngreso: TDateTimePicker
              Left = 92
              Top = 75
              Width = 93
              Height = 21
              CalAlignment = dtaLeft
              Date = 0.583911585701571
              Format = 'yyyy/MM/dd'
              Time = 0.583911585701571
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 8
              OnEnter = EdFechaIngresoEnter
              OnExit = EdFechaIngresoExit
            end
            object EdRetefuente: TCheckBox
              Left = 4
              Top = 155
              Width = 169
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Aplica Retenci'#243'n en la Fuente'
              Checked = True
              State = cbChecked
              TabOrder = 10
              OnEnter = EdRetefuenteEnter
              OnExit = EdRetefuenteExit
            end
            object EdTotalActivos: TMemo
              Left = 73
              Top = 178
              Width = 139
              Height = 21
              Alignment = taRightJustify
              TabOrder = 11
              WantReturns = False
              WordWrap = False
              OnEnter = EdTotalActivosEnter
              OnExit = EdTotalActivosExit
              OnKeyPress = EdEgresosArriendoKeyPress
            end
            object EdTotalPasivos: TMemo
              Left = 73
              Top = 202
              Width = 139
              Height = 21
              Alignment = taRightJustify
              TabOrder = 12
              WantReturns = False
              WordWrap = False
              OnEnter = EdTotalPasivosEnter
              OnExit = EdTotalPasivosExit
              OnKeyPress = EdEgresosArriendoKeyPress
            end
            object cbOcupacion: TDBLookupComboBox
              Left = 58
              Top = -91
              Width = 127
              Height = 21
              KeyField = 'ID_OCUPACION'
              ListField = 'DESCRIPCION'
              ListSource = dsOcupacion
              TabOrder = 0
              OnKeyPress = cbOcupacionKeyPress
            end
            object cbTipoContrato: TDBLookupComboBox
              Left = 84
              Top = -47
              Width = 141
              Height = 21
              KeyField = 'ID_CONTRATO'
              ListField = 'DESCRIPCION'
              ListSource = dsTipoContrato
              TabOrder = 3
              OnKeyPress = cbTipoContratoKeyPress
            end
            object edDescripcionContrato: TEdit
              Left = 48
              Top = -20
              Width = 175
              Height = 21
              Enabled = False
              TabOrder = 4
              OnKeyPress = edDescripcionContratoKeyPress
            end
            object btnIndependiente: TBitBtn
              Left = 186
              Top = -91
              Width = 39
              Height = 18
              Hint = 
                'Haga Click aqu'#237' para adicionar informaci'#243'n de Asociados con Ocup' +
                'aci'#243'n INDEPENDIENTE'
              Caption = 'Otros.'
              TabOrder = 1
              OnClick = btnIndependienteClick
            end
            object edDeclaraRenta: TCheckBox
              Left = 4
              Top = 131
              Width = 169
              Height = 24
              Alignment = taLeftJustify
              Caption = 'Declara Renta'
              TabOrder = 9
              OnEnter = EdRetefuenteEnter
              OnExit = EdRetefuenteExit
            end
            object edMadreCabeza: TCheckBox
              Left = 1
              Top = -73
              Width = 169
              Height = 24
              Alignment = taLeftJustify
              Caption = 'Madre Cabeza de Familia'
              TabOrder = 2
              OnEnter = EdRetefuenteEnter
              OnExit = EdRetefuenteExit
            end
            object CBciiu: TDBLookupComboBox
              Left = 4
              Top = 112
              Width = 197
              Height = 21
              DropDownWidth = 640
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'ID_CIIU'
              ListField = 'DESCRIPCION_CIIU'
              ListSource = dmPersona.DStiposciiu
              ParentFont = False
              TabOrder = 13
              OnEnter = CBciiuEnter
              OnExit = CBciiuExit
            end
            object btnCiiu: TBitBtn
              Left = 202
              Top = 112
              Width = 23
              Height = 21
              Caption = '...'
              TabOrder = 14
              TabStop = False
              OnClick = btnCiiuClick
            end
          end
        end
        object GroupBox5: TGroupBox
          Left = 262
          Top = 0
          Width = 389
          Height = 197
          Caption = 'Ingresos / Egresos'
          TabOrder = 1
          object ScrollBox1: TScrollBox
            Left = 2
            Top = 15
            Width = 385
            Height = 180
            Align = alClient
            TabOrder = 0
            object GroupBox7: TGroupBox
              Left = 0
              Top = 6
              Width = 381
              Height = 89
              Caption = 'Ingresos'
              TabOrder = 0
              object Label19: TLabel
                Left = 8
                Top = 42
                Width = 47
                Height = 13
                Caption = ' Actividad'
              end
              object Label18: TLabel
                Left = 8
                Top = 14
                Width = 110
                Height = 13
                Caption = 'Declaraci'#243'n de Fondos'
              end
              object Label20: TLabel
                Left = 200
                Top = 40
                Width = 25
                Height = 13
                Caption = 'Otros'
              end
              object Label14: TLabel
                Left = 10
                Top = 68
                Width = 127
                Height = 13
                Caption = 'Descripci'#243'n Otros Ingresos'
              end
              object EdDeclaracion: TEdit
                Left = 118
                Top = 12
                Width = 261
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 0
                OnEnter = EdDeclaracionEnter
                OnExit = EdDeclaracionExit
              end
              object Edingresos: TMemo
                Left = 58
                Top = 36
                Width = 139
                Height = 21
                Alignment = taRightJustify
                TabOrder = 1
                WantReturns = False
                WordWrap = False
                OnEnter = EdingresosEnter
                OnExit = EdingresosExit
                OnKeyPress = EdingresosKeyPress
              end
              object EdOtrosIngresos: TMemo
                Left = 240
                Top = 38
                Width = 139
                Height = 21
                Alignment = taRightJustify
                TabOrder = 2
                WantReturns = False
                WordWrap = False
                OnEnter = EdOtrosIngresosEnter
                OnExit = EdOtrosIngresosExit
                OnKeyPress = EdOtrosIngresosKeyPress
              end
              object EdDescripcionIngresos: TMemo
                Left = 150
                Top = 62
                Width = 227
                Height = 23
                TabOrder = 3
                WantReturns = False
                WordWrap = False
                OnEnter = EdDescripcionIngresosEnter
                OnExit = EdDescripcionIngresosExit
              end
            end
            object GroupBox6: TGroupBox
              Left = 0
              Top = 102
              Width = 381
              Height = 109
              Caption = 'Egresos'
              TabOrder = 1
              object Label21: TLabel
                Left = 4
                Top = 16
                Width = 39
                Height = 13
                Caption = 'Arriendo'
              end
              object Label22: TLabel
                Left = 4
                Top = 38
                Width = 43
                Height = 13
                Caption = 'Servicios'
              end
              object Label23: TLabel
                Left = 192
                Top = 16
                Width = 42
                Height = 13
                Caption = 'Transpor'
              end
              object Label24: TLabel
                Left = 192
                Top = 38
                Width = 45
                Height = 13
                Caption = 'Alimentos'
              end
              object Label25: TLabel
                Left = 4
                Top = 60
                Width = 37
                Height = 13
                Caption = 'Deudas'
              end
              object Label26: TLabel
                Left = 192
                Top = 60
                Width = 25
                Height = 13
                Caption = 'Otros'
              end
              object Label5: TLabel
                Left = 4
                Top = 84
                Width = 125
                Height = 13
                Caption = 'Descripci'#243'n Otros Egresos'
              end
              object EdEgresosArriendo: TMemo
                Left = 50
                Top = 14
                Width = 139
                Height = 21
                Alignment = taRightJustify
                TabOrder = 0
                WantReturns = False
                WordWrap = False
                OnEnter = EdEgresosArriendoEnter
                OnExit = EdEgresosArriendoExit
                OnKeyPress = EdEgresosArriendoKeyPress
              end
              object EdEgresosServicios: TMemo
                Left = 50
                Top = 36
                Width = 139
                Height = 21
                Alignment = taRightJustify
                TabOrder = 2
                WantReturns = False
                WordWrap = False
                OnEnter = EdEgresosServiciosEnter
                OnExit = EdEgresosServiciosExit
                OnKeyPress = EdEgresosServiciosKeyPress
              end
              object EdEgresosTransporte: TMemo
                Left = 238
                Top = 14
                Width = 139
                Height = 21
                Alignment = taRightJustify
                TabOrder = 1
                WantReturns = False
                WordWrap = False
                OnEnter = EdEgresosTransporteEnter
                OnExit = EdEgresosTransporteExit
                OnKeyPress = EdEgresosTransporteKeyPress
              end
              object EdEgresosAlimentos: TMemo
                Left = 238
                Top = 36
                Width = 139
                Height = 21
                Alignment = taRightJustify
                TabOrder = 3
                WantReturns = False
                WordWrap = False
                OnEnter = EdEgresosAlimentosEnter
                OnExit = EdEgresosAlimentosExit
                OnKeyPress = EdEgresosAlimentosKeyPress
              end
              object EdEgresosDeudas: TMemo
                Left = 50
                Top = 58
                Width = 139
                Height = 21
                Alignment = taRightJustify
                TabOrder = 4
                WantReturns = False
                WordWrap = False
                OnEnter = EdEgresosDeudasEnter
                OnExit = EdEgresosDeudasExit
                OnKeyPress = EdEgresosDeudasKeyPress
              end
              object EdEgresosOtros: TMemo
                Left = 238
                Top = 58
                Width = 139
                Height = 21
                Alignment = taRightJustify
                TabOrder = 5
                WantReturns = False
                WordWrap = False
                OnEnter = EdEgresosOtrosEnter
                OnExit = EdEgresosOtrosExit
                OnKeyPress = EdEgresosOtrosKeyPress
              end
              object EdDescripcionEgresos: TMemo
                Left = 150
                Top = 80
                Width = 227
                Height = 23
                TabOrder = 6
                WantReturns = False
                WordWrap = False
                OnEnter = EdDescripcionEgresosEnter
                OnExit = EdDescripcionEgresosExit
              end
            end
          end
        end
      end
      object InfoDirecciones: TTabSheet
        Caption = '3. Direcciones de Ubicaci'#243'n'
        ImageIndex = 2
        OnShow = InfoDireccionesShow
        object Label27: TLabel
          Left = 2
          Top = 82
          Width = 84
          Height = 13
          Caption = 'Tipo de Direcci'#243'n'
        end
        object Label28: TLabel
          Left = 302
          Top = 84
          Width = 45
          Height = 13
          Caption = 'Direcci'#243'n'
        end
        object Label29: TLabel
          Left = 48
          Top = 122
          Width = 27
          Height = 13
          Caption = 'Barrio'
        end
        object Label30: TLabel
          Left = 160
          Top = 122
          Width = 45
          Height = 13
          Caption = 'Municipio'
        end
        object Label31: TLabel
          Left = 412
          Top = 122
          Width = 47
          Height = 13
          Caption = 'Tel'#233'fonos'
        end
        object GridDireccion: TStringGrid
          Left = 0
          Top = 2
          Width = 535
          Height = 79
          ColCount = 8
          DefaultRowHeight = 21
          FixedCols = 0
          RowCount = 2
          FixedRows = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          TabOrder = 0
          OnSelectCell = GridDireccionSelectCell
          ColWidths = (
            64
            64
            64
            64
            64
            64
            64
            64)
        end
        object Panel3: TPanel
          Left = 536
          Top = 0
          Width = 97
          Height = 117
          Color = clOlive
          TabOrder = 1
          object CmdModificarDIR: TBitBtn
            Left = 8
            Top = 4
            Width = 81
            Height = 25
            Caption = '&Modificar'
            TabOrder = 0
            OnClick = CmdModificarDIRClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
              055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
              005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
              B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
              305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
              305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
              30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
              3055577777555557F7F555000555555999555577755555577755}
            NumGlyphs = 2
          end
          object CmdAgregarDIR: TBitBtn
            Left = 8
            Top = 32
            Width = 81
            Height = 25
            Caption = '&Agregar'
            TabOrder = 1
            OnClick = CmdAgregarDIRClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
          end
          object CmdEliminarDIR: TBitBtn
            Left = 8
            Top = 60
            Width = 81
            Height = 25
            Cancel = True
            Caption = '&Eliminar'
            Enabled = False
            TabOrder = 2
            OnClick = CmdEliminarDIRClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
          end
          object CmdLimpiarDIR: TBitBtn
            Left = 8
            Top = 88
            Width = 81
            Height = 25
            Caption = '&Limpiar'
            TabOrder = 3
            OnClick = CmdLimpiarDIRClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
          end
        end
        object CBtipodireccion: TDBLookupComboBox
          Left = 0
          Top = 98
          Width = 145
          Height = 21
          KeyField = 'ID_DIRECCION'
          ListField = 'DESCRIPCION_DIRECCION'
          ListSource = dmPersona.DStipodireccion
          TabOrder = 2
          OnEnter = CBtipodireccionEnter
        end
        object EdDireccion: TEdit
          Left = 148
          Top = 98
          Width = 387
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object EdBarrio: TEdit
          Left = 0
          Top = 138
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object EdTelefono1: TMemo
          Left = 248
          Top = 138
          Width = 93
          Height = 21
          Alignment = taRightJustify
          TabOrder = 6
          WantReturns = False
          WordWrap = False
          OnKeyPress = EdTelefono1KeyPress
        end
        object EdTelefono2: TMemo
          Left = 342
          Top = 138
          Width = 93
          Height = 21
          Alignment = taRightJustify
          TabOrder = 7
          WantReturns = False
          WordWrap = False
          OnKeyPress = EdTelefono2KeyPress
        end
        object EdTelefono3: TMemo
          Left = 436
          Top = 138
          Width = 93
          Height = 21
          Alignment = taRightJustify
          TabOrder = 8
          WantReturns = False
          WordWrap = False
          OnKeyPress = EdTelefono3KeyPress
        end
        object EdTelefono4: TMemo
          Left = 530
          Top = 138
          Width = 93
          Height = 21
          Alignment = taRightJustify
          TabOrder = 9
          WantReturns = False
          WordWrap = False
          OnExit = EdTelefono4Exit
          OnKeyPress = EdTelefono4KeyPress
        end
        object CBMunicipio: TDBLookupComboBox
          Left = 124
          Top = 138
          Width = 123
          Height = 21
          DropDownWidth = 200
          KeyField = 'COD_MUNICIPIO'
          ListField = 'MUNICIPIO'
          ListSource = dmPersona.DSMunicipio
          TabOrder = 5
          OnEnter = CBMunicipioEnter
        end
      end
      object InfoReferencias: TTabSheet
        Caption = '4. Informaci'#243'n Referencias'
        ImageIndex = 3
        OnShow = InfoReferenciasShow
        object GridReferencia: TStringGrid
          Left = 0
          Top = 2
          Width = 535
          Height = 79
          ColCount = 6
          DefaultRowHeight = 21
          FixedCols = 0
          FixedRows = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          TabOrder = 0
          OnSelectCell = GridReferenciaSelectCell
          ColWidths = (
            64
            64
            64
            64
            64
            64)
        end
        object PageControl2: TPageControl
          Left = 0
          Top = 85
          Width = 641
          Height = 121
          ActivePage = TabRC
          Style = tsFlatButtons
          TabIndex = 1
          TabOrder = 2
          OnChange = PageControl2Change
          object TabRP: TTabSheet
            Caption = 'Personales'
            object Label67: TLabel
              Left = 16
              Top = 2
              Width = 91
              Height = 13
              Caption = 'Tipo de Referencia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label68: TLabel
              Left = 36
              Top = 38
              Width = 54
              Height = 13
              Caption = 'Parentesco'
            end
            object Label69: TLabel
              Left = 284
              Top = 39
              Width = 45
              Height = 13
              Caption = 'Direcci'#243'n'
            end
            object Label70: TLabel
              Left = 543
              Top = 38
              Width = 47
              Height = 13
              Caption = 'Tel'#233'fonos'
            end
            object CBtiporeferencia: TDBLookupComboBox
              Left = 4
              Top = 16
              Width = 143
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'ID_REFERENCIA'
              ListField = 'DESCRIPCION_REFERENCIA'
              ListSource = dmPersona.DStiporeferencia
              ParentFont = False
              TabOrder = 0
              OnClick = CBtiporeferenciaClick
            end
            object CBparentesco: TDBLookupComboBox
              Left = 4
              Top = 53
              Width = 143
              Height = 21
              KeyField = 'ID_PARENTESCO'
              ListField = 'DESCRIPCION_PARENTESCO'
              ListSource = dmPersona.DSparentesco
              TabOrder = 4
              OnEnter = CBparentescoEnter
            end
            object EdDireccionRef: TEdit
              Left = 150
              Top = 52
              Width = 333
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 5
            end
            object EdTelefonoRef: TMemo
              Left = 490
              Top = 52
              Width = 142
              Height = 21
              Alignment = taRightJustify
              MaxLength = 100
              TabOrder = 6
              WantReturns = False
              WordWrap = False
              OnExit = EdTelefonoRefExit
              OnKeyPress = EdTelefonoRefKeyPress
            end
            object EdPrimerApellidoRef: TLabeledEdit
              Left = 150
              Top = 15
              Width = 168
              Height = 24
              CharCase = ecUpperCase
              EditLabel.Width = 69
              EditLabel.Height = 13
              EditLabel.Caption = 'Primer Apellido'
              EditLabel.Font.Charset = DEFAULT_CHARSET
              EditLabel.Font.Color = clBlack
              EditLabel.Font.Height = -11
              EditLabel.Font.Name = 'MS Sans Serif'
              EditLabel.Font.Style = []
              EditLabel.ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              LabelPosition = lpAbove
              LabelSpacing = 3
              ParentFont = False
              TabOrder = 1
            end
            object EdSegundoApellidoRef: TLabeledEdit
              Left = 322
              Top = 15
              Width = 164
              Height = 24
              CharCase = ecUpperCase
              EditLabel.Width = 83
              EditLabel.Height = 13
              EditLabel.Caption = 'Segundo Apellido'
              EditLabel.Font.Charset = DEFAULT_CHARSET
              EditLabel.Font.Color = clBlack
              EditLabel.Font.Height = -11
              EditLabel.Font.Name = 'MS Sans Serif'
              EditLabel.Font.Style = []
              EditLabel.ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              LabelPosition = lpAbove
              LabelSpacing = 3
              ParentFont = False
              TabOrder = 2
            end
            object EdNombreRef: TLabeledEdit
              Left = 490
              Top = 15
              Width = 135
              Height = 24
              CharCase = ecUpperCase
              EditLabel.Width = 37
              EditLabel.Height = 13
              EditLabel.Caption = 'Nombre'
              EditLabel.Font.Charset = DEFAULT_CHARSET
              EditLabel.Font.Color = clBlack
              EditLabel.Font.Height = -11
              EditLabel.Font.Name = 'MS Sans Serif'
              EditLabel.Font.Style = []
              EditLabel.ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              LabelPosition = lpAbove
              LabelSpacing = 3
              ParentFont = False
              TabOrder = 3
            end
          end
          object TabRC: TTabSheet
            Caption = 'Comerciales'
            ImageIndex = 1
            object Label32: TLabel
              Left = 26
              Top = 2
              Width = 91
              Height = 13
              Caption = 'Tipo de Referencia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label33: TLabel
              Left = 122
              Top = 38
              Width = 45
              Height = 13
              Caption = 'Direcci'#243'n'
            end
            object Label35: TLabel
              Left = 477
              Top = 38
              Width = 47
              Height = 13
              Caption = 'Tel'#233'fonos'
            end
            object cbTipoReferenciaC: TDBLookupComboBox
              Left = 4
              Top = 16
              Width = 143
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'ID_REFERENCIA'
              ListField = 'DESCRIPCION_REFERENCIA'
              ListSource = dmPersona.DStiporeferencia
              ParentFont = False
              TabOrder = 0
              OnClick = cbTipoReferenciaCClick
            end
            object EdRazonSocialRefC: TLabeledEdit
              Left = 154
              Top = 15
              Width = 471
              Height = 24
              CharCase = ecUpperCase
              EditLabel.Width = 63
              EditLabel.Height = 13
              EditLabel.Caption = 'Raz'#243'n Social'
              EditLabel.Font.Charset = DEFAULT_CHARSET
              EditLabel.Font.Color = clBlack
              EditLabel.Font.Height = -11
              EditLabel.Font.Name = 'MS Sans Serif'
              EditLabel.Font.Style = []
              EditLabel.ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              LabelPosition = lpAbove
              LabelSpacing = 3
              ParentFont = False
              TabOrder = 1
            end
            object EdDireccionRefC: TEdit
              Left = 4
              Top = 52
              Width = 333
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object EdTelefonosRefC: TMemo
              Left = 376
              Top = 52
              Width = 245
              Height = 21
              Alignment = taRightJustify
              MaxLength = 100
              TabOrder = 3
              WantReturns = False
              WordWrap = False
              OnExit = EdTelefonoRefExit
              OnKeyPress = EdTelefonoRefKeyPress
            end
          end
        end
        object Panel5: TPanel
          Left = 534
          Top = 0
          Width = 97
          Height = 117
          Color = clOlive
          TabOrder = 1
          object CmdModificarREF: TBitBtn
            Left = 8
            Top = 4
            Width = 81
            Height = 25
            Caption = '&Modificar'
            TabOrder = 0
            OnClick = CmdModificarREFClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
              055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
              005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
              B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
              305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
              305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
              30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
              3055577777555557F7F555000555555999555577755555577755}
            NumGlyphs = 2
          end
          object CmdAgregarREF: TBitBtn
            Left = 8
            Top = 32
            Width = 81
            Height = 25
            Caption = '&Agregar'
            TabOrder = 1
            OnClick = CmdAgregarREFClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
          end
          object CmdEliminarREF: TBitBtn
            Left = 8
            Top = 60
            Width = 81
            Height = 25
            Cancel = True
            Caption = '&Eliminar'
            Enabled = False
            TabOrder = 2
            OnClick = CmdEliminarREFClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
          end
          object CmdLimpiarREF: TBitBtn
            Left = 8
            Top = 88
            Width = 81
            Height = 25
            Caption = '&Limpiar'
            TabOrder = 3
            OnClick = CmdLimpiarREFClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
          end
        end
      end
      object InfoBeneficiario: TTabSheet
        Caption = '5. Informaci'#243'n Beneficiarios'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = False
        OnShow = InfoBeneficiarioShow
        object Label55: TLabel
          Left = 4
          Top = 150
          Width = 54
          Height = 13
          Caption = 'Parentesco'
        end
        object Label56: TLabel
          Left = 143
          Top = 150
          Width = 69
          Height = 13
          Caption = 'Primer Apellido'
        end
        object Label57: TLabel
          Left = 256
          Top = 150
          Width = 83
          Height = 13
          Caption = 'Segundo Apellido'
        end
        object Label58: TLabel
          Left = 367
          Top = 150
          Width = 42
          Height = 13
          Caption = 'Nombres'
        end
        object Label59: TLabel
          Left = 534
          Top = 150
          Width = 8
          Height = 13
          Caption = '%'
        end
        object Label66: TLabel
          Left = 559
          Top = 150
          Width = 84
          Height = 13
          Caption = 'Auxilio por Muerte'
        end
        object DBbeneficiario: TDBGrid
          Left = 3
          Top = 4
          Width = 526
          Height = 133
          Hint = 'Para Modificar o Eliminar Haga Clic Sobre la Celda'
          TabStop = False
          DataSource = DSbeneficiario
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBbeneficiarioCellClick
          OnColExit = DBbeneficiarioColExit
          OnDrawColumnCell = DBbeneficiarioDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'parentesco'
              Title.Caption = 'Parentesco'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'id_agencia'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'id_persona'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'id_identificacion'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'primer_apellido'
              Title.Caption = 'Primer Apellido'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'segundo_apellido'
              Title.Caption = 'Segundo Apellido'
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nombre'
              Title.Caption = 'Nombres'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'id_parentesco'
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'porcentaje'
              Title.Alignment = taCenter
              Title.Caption = '%'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'auxilio'
              Title.Caption = 'Aux'
              Width = 27
              Visible = True
            end>
        end
        object Panel9: TPanel
          Left = 532
          Top = 6
          Width = 111
          Height = 131
          Color = clOlive
          TabOrder = 6
          object BTmodifica: TBitBtn
            Left = 12
            Top = 6
            Width = 90
            Height = 25
            Caption = '&Modificar'
            Enabled = False
            TabOrder = 1
            OnClick = BTmodificaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
              055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
              005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
              B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
              305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
              305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
              30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
              3055577777555557F7F555000555555999555577755555577755}
            NumGlyphs = 2
          end
          object BTagrega: TBitBtn
            Left = 12
            Top = 38
            Width = 90
            Height = 25
            Caption = '&Agregar'
            TabOrder = 0
            OnClick = BTagregaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
          end
          object BTelimina: TBitBtn
            Left = 12
            Top = 70
            Width = 90
            Height = 25
            Caption = '&Eliminar'
            Enabled = False
            TabOrder = 3
            OnClick = BTeliminaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
          end
          object BTlimpia: TBitBtn
            Left = 12
            Top = 102
            Width = 90
            Height = 25
            Caption = '&Limpiar'
            TabOrder = 2
            OnClick = BTlimpiaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
          end
        end
        object CBparentesco_bene: TDBLookupComboBox
          Left = 5
          Top = 163
          Width = 138
          Height = 21
          KeyField = 'ID_PARENTESCO'
          ListField = 'DESCRIPCION_PARENTESCO'
          ListSource = dmPersona.DSparentesco
          TabOrder = 0
        end
        object EDpapellido_bene: TEdit
          Left = 143
          Top = 163
          Width = 112
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object EDsapellido_bene: TEdit
          Left = 256
          Top = 163
          Width = 110
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object EDnombre_bene: TEdit
          Left = 366
          Top = 163
          Width = 160
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object JVporcentaje: TJvFloatEdit
          Left = 527
          Top = 163
          Width = 27
          Height = 21
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
          TabOrder = 4
          OnExit = JVporcentajeExit
        end
        object ChAux: TCheckBox
          Left = 599
          Top = 165
          Width = 17
          Height = 17
          Color = clBtnFace
          ParentColor = False
          TabOrder = 7
          OnClick = ChAuxClick
          OnEnter = ChAuxEnter
          OnExit = ChAuxExit
        end
      end
      object InfoHijo: TTabSheet
        Caption = '6. Informaci'#243'n Hijos'
        ImageIndex = 8
        OnShow = InfoHijoShow
        object Label62: TLabel
          Left = 16
          Top = 151
          Width = 37
          Height = 13
          Caption = 'Nombre'
        end
        object Label63: TLabel
          Left = 370
          Top = 153
          Width = 83
          Height = 13
          Caption = 'Segundo Apellido'
        end
        object Label64: TLabel
          Left = 205
          Top = 153
          Width = 69
          Height = 13
          Caption = 'Primer Apellido'
        end
        object Label65: TLabel
          Left = 537
          Top = 152
          Width = 101
          Height = 13
          Caption = 'Fecha de Nacimineto'
        end
        object Label74: TLabel
          Left = 5
          Top = 8
          Width = 78
          Height = 13
          Caption = 'N'#250'mero de Hijos'
        end
        object Label75: TLabel
          Left = 309
          Top = 8
          Width = 84
          Height = 13
          Caption = 'Personas a Cargo'
        end
        object Panel10: TPanel
          Left = 531
          Top = 2
          Width = 111
          Height = 131
          Color = clOlive
          TabOrder = 7
          object BTmodificahijo: TBitBtn
            Left = 12
            Top = 6
            Width = 90
            Height = 25
            Caption = '&Modificar'
            Enabled = False
            TabOrder = 1
            OnClick = BTmodificahijoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
              055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
              005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
              B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
              305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
              305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
              30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
              3055577777555557F7F555000555555999555577755555577755}
            NumGlyphs = 2
          end
          object BTagregahijo: TBitBtn
            Left = 12
            Top = 38
            Width = 90
            Height = 25
            Caption = '&Agregar'
            TabOrder = 0
            OnClick = BTagregahijoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
          end
          object BTeliminaHijo: TBitBtn
            Left = 12
            Top = 70
            Width = 90
            Height = 25
            Caption = '&Eliminar'
            Enabled = False
            TabOrder = 3
            OnClick = BTeliminaHijoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
          end
          object BtlimpiaHijo: TBitBtn
            Left = 12
            Top = 102
            Width = 90
            Height = 25
            Caption = '&Limpiar'
            TabOrder = 2
            OnClick = BtlimpiaHijoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
          end
        end
        object DbHijo: TDBGrid
          Left = 3
          Top = 39
          Width = 526
          Height = 111
          TabStop = False
          DataSource = DShijo
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DbHijoCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'nombre'
              Title.Caption = 'Nombre'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'primer_apellido'
              Title.Caption = 'Primer Apellido'
              Width = 138
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'segundo_apellido'
              Title.Caption = 'Segundo Apellido'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fecha_nacimiento'
              Title.Caption = 'Fecha Nac.'
              Visible = True
            end>
        end
        object EdNombreHijo: TEdit
          Left = 16
          Top = 168
          Width = 183
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object EdPapellidoHijo: TEdit
          Left = 205
          Top = 168
          Width = 161
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object EdSapellidoHijo: TEdit
          Left = 370
          Top = 168
          Width = 158
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 5
        end
        object EDfechaHijo: TDateTimePicker
          Left = 537
          Top = 168
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 38498.7107794329
          Time = 38498.7107794329
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 6
        end
        object edNumeroHijos: TJvIntegerEdit
          Left = 89
          Top = 5
          Width = 121
          Height = 21
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 0
          Value = 0
          MaxValue = 0
          MinValue = 0
          HasMaxValue = False
          HasMinValue = False
        end
        object edPersonasACargo: TJvIntegerEdit
          Left = 401
          Top = 5
          Width = 121
          Height = 21
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 1
          Value = 0
          MaxValue = 0
          MinValue = 0
          HasMaxValue = False
          HasMinValue = False
        end
      end
      object InfoApoderado: TTabSheet
        Caption = '7. Informaci'#243'n del Apoderado'
        ImageIndex = 4
        OnShow = InfoApoderadoShow
        object GroupBox9: TGroupBox
          Left = 4
          Top = 8
          Width = 621
          Height = 169
          Caption = 'Informaci'#243'n Personal'
          TabOrder = 0
          object Label38: TLabel
            Left = 8
            Top = 15
            Width = 102
            Height = 13
            Caption = 'Tipo de Identificaci'#243'n'
          end
          object Label39: TLabel
            Left = 202
            Top = 14
            Width = 118
            Height = 13
            Caption = 'N'#250'mero de Identificaci'#243'n'
          end
          object CBTipoIdentificacionApoderado: TDBLookupComboBox
            Left = 8
            Top = 34
            Width = 177
            Height = 21
            KeyField = 'ID_IDENTIFICACION'
            ListField = 'DESCRIPCION_IDENTIFICACION'
            ListSource = dmPersona.DStiposidentificacion
            TabOrder = 0
            OnEnter = CBTipoIdentificacionApoderadoEnter
            OnExit = CBTipoIdentificacionApoderadoExit
          end
          object EdNumeroIdentificacionApoderado: TMemo
            Left = 200
            Top = 34
            Width = 138
            Height = 21
            Lines.Strings = (
              'EdNumeroIdentificacionApo'
              'derado')
            TabOrder = 1
            OnEnter = EdNumeroIdentificacionApoderadoEnter
            OnExit = EdNumeroIdentificacionApoderadoExit
          end
          object EdPrimerApellidoApoderado: TLabeledEdit
            Left = 93
            Top = 60
            Width = 245
            Height = 21
            CharCase = ecUpperCase
            EditLabel.Width = 84
            EditLabel.Height = 13
            EditLabel.Caption = 'Primer Apellido     '
            LabelPosition = lpLeft
            LabelSpacing = 3
            TabOrder = 2
            OnEnter = EdPrimerApellidoApoderadoEnter
            OnExit = EdPrimerApellidoApoderadoExit
          end
          object EdSegundoApellidoApoderado: TLabeledEdit
            Left = 93
            Top = 82
            Width = 245
            Height = 21
            CharCase = ecUpperCase
            EditLabel.Width = 83
            EditLabel.Height = 13
            EditLabel.Caption = 'Segundo Apellido'
            LabelPosition = lpLeft
            LabelSpacing = 3
            TabOrder = 3
            OnEnter = EdSegundoApellidoApoderadoEnter
            OnExit = EdSegundoApellidoApoderadoExit
          end
          object EdNombreApoderado: TLabeledEdit
            Left = 93
            Top = 104
            Width = 244
            Height = 21
            CharCase = ecUpperCase
            EditLabel.Width = 81
            EditLabel.Height = 13
            EditLabel.Caption = 'Nombres             '
            LabelPosition = lpLeft
            LabelSpacing = 3
            TabOrder = 4
            OnEnter = EdNombreApoderadoEnter
            OnExit = EdNombreApoderadoExit
          end
        end
      end
      object InfoImagenes: TTabSheet
        Caption = '8. Imagenes'
        ImageIndex = 5
        OnShow = InfoImagenesShow
        object CmdFirma: TBitBtn
          Left = 334
          Top = 160
          Width = 95
          Height = 25
          Caption = 'Tomar Firma'
          Enabled = False
          TabOrder = 0
          OnClick = CmdFirmaClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000320B0000320B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            2D2D2D58534EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF58534E373C3E516061FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF54777B428CDE18556F8A5B52FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF54777B29799A8D787FD477198A
            5B52FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF7C7078F9C086F8B266D477198A5B52FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF85787CFBCA95F9C086F8
            B266D477198A5B52FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFAD7B73FBD3A9F9C086F8B266D477198A5B52FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAD7B73FB
            D3A9F9C086F8B266D477198A5B52FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFAD7B73FBD3A9F9C086F8B266D477198A5B
            52FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFAD7B73FBCA95B98585299CEF4ABDFF0A62A0FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAD7B73299CEF4ABDFF299C
            EF021EAA00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF4ABDFF299CEF0936C91029D60316AC0018C6FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0018C66D8A
            FD106BFF0018C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF0018C60018C6FF00FFFF00FF}
        end
        object Panel7: TPanel
          Left = 310
          Top = 10
          Width = 322
          Height = 144
          TabOrder = 1
          object ImgFirmaC: TImage
            Left = 1
            Top = 1
            Width = 320
            Height = 142
            Align = alClient
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 10
          Width = 283
          Height = 145
          TabOrder = 2
          object ImgFotoC: TImage
            Left = 4
            Top = 4
            Width = 135
            Height = 135
            Hint = 'Fotografia del Asociado'
            ParentShowHint = False
            ShowHint = True
            Stretch = True
          end
          object ImgHuellaC: TImage
            Left = 170
            Top = 4
            Width = 100
            Height = 135
            AutoSize = True
            Proportional = True
            Stretch = True
          end
        end
        object CmdTomarFoto: TBitBtn
          Left = 30
          Top = 160
          Width = 89
          Height = 25
          Caption = 'Tomar Foto'
          Enabled = False
          TabOrder = 3
          OnClick = CmdTomarFotoClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000F30E0000F30E00000001000000010000102118001021
            21001821210018292100212929002131290029422900314A2900293931003139
            310029423100294A3100314A3100394A31003152310039523100425231004A52
            3100425A3100394A39003952390052523900395A3900425A39004A5A3900525A
            39005263390039424200394A420042524200315A4200425A42004A6342005263
            42005A634200636342005A6B4200636B420039524A0042524A00395A4A004A5A
            4A0039634A004A634A004A6B4A00526B4A00636B4A005A734A0063734A00525A
            52004A6352004A6B5200527352005A7352006373520052635A004A6B5A005A73
            5A0063735A006B7B5A00737B5A00737B63006B846300738463007B846300637B
            6B006B7B6B006B846B0073846B006B8473007B8C7B0084947B00848C84008494
            84008C9484007B948C00849C8C008C9C8C00949C940084A59400949C9C008CA5
            9C0094A59C0094AD9C009CAD9C0094ADA5009CADA5009CB5AD00A5B5AD00A5BD
            AD00ADBDB500ADBDBD00B5C6BD00CECEBD00BDCEC600C6D6C600CED6C600D6D6
            C600C6CECE00CECECE00C6D6CE00D6DED600E7E7D600DEE7DE00EFEFDE00DEE7
            E700E7EFE700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6B6B6B6B6B
            6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B361D050505
            05051D1B1B050505056B402211111011100F2941321B0C141406442319111110
            0D495A37585C1B140F06442518181010475E370104641B0C0F06442E1A181818
            4769621C505A1B0F0F06442E1818181714655A57575B1B0E0F06443621181717
            2B034E5252030A0E0F0644362109091716030002000131606606443C1F03094D
            490501090500486066063D3F2D2D2D2D20171D1414143934343A6B4444444444
            4444262726264444446B6B6B6B6B6B6B6B6B066A6A066B6B6B6B6B6B6B6B6B6B
            6B6B060606066B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B}
        end
        object CmdTomarHuella: TBitBtn
          Left = 166
          Top = 160
          Width = 89
          Height = 25
          Caption = 'Tomar Huella'
          Enabled = False
          TabOrder = 4
          OnClick = CmdTomarHuellaClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000130B0000130B00000001000000010000108410002173
            180031942900299C2900319C310031A53100399C390039AD39005A5242001873
            4A0052A54A008C5A5A009C6B630063BD630063C6630063CE63006BC66B006BCE
            6B00A57B7300B584730073CE7300B58C8C0063849C00F7D6A500FFD6A5003984
            AD004A8CAD004A94B500217BBD006BA5BD004A94C6006BA5C600F7E7C600FFE7
            C600F7E7CE00FFE7CE006BADD600EFE7D600F7E7D600FFE7D6009CC6DE00FFEF
            DE00298CE70073BDE7008CBDE700FFEFE700FFF7EF00F7FFEF00399CF70063AD
            F700FFF7F700FF00FF00399CFF0042A5FF004AADFF004AB5FF0052B5FF0052BD
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
            33333333333333333333330B0B0B0B0B0B0B0B0B0B0B0B0B0B33152E2E2D2D2D
            2626262617171717170B1503000507070201082D22202017170B152E0311102F
            0E0F052D2D292620170B152E03140A3A1014042E2D2D2622170B152E3A09191C
            0D062E2222222222260C152E3A3434342A32251818181818250C152E16353535
            302832322E2E2E2D260C152E1F373839361F3232322E2E2E2D12152E161E2431
            1F3A3A22222222222D12152E16242C2B16251818181818182512152E3A1D1B1A
            3A3A3A3A3A3232323213152E2E2E2E2E2E2E2E2E2E2E2E2E2E13331515151515
            1515151515151515153333333333333333333333333333333333}
        end
        object CmdReintentar: TBitBtn
          Left = 534
          Top = 160
          Width = 95
          Height = 25
          Caption = 'Reintentar'
          Enabled = False
          TabOrder = 5
          OnClick = CmdReintentarClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            080000000000000100000E0F00000E0F00000001000000010000FF00FF00B584
            8400B5948C00C6A59C00D6BDB500E7C6B500E7CECE0000000000000000000000
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
            0000000000000000000000020101010101010200000000000000000106060606
            0606010100000000000000010606060606060103010000000000000204040404
            0404010303010000000000000205050505050501030301000000000000020505
            0505050501030301000000000000020505050505050103030100000000000002
            0505050505050103010000000000000002050505050505010100000000000000
            0002050505050505010000000000000000000201010101010200000000000000
            0000000000000000000000000000000000000000000000000000}
        end
      end
      object TTabSheet
        ImageIndex = 6
      end
    end
    object DBAux: TDBCheckBox
      Left = 504
      Top = 88
      Width = 97
      Height = 17
      DataField = 'auxilio'
      DataSource = DSaux
      TabOrder = 1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Visible = False
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 505
    Width = 662
    Height = 33
    Align = alBottom
    Color = clOlive
    TabOrder = 2
    object CmdCerrar: TBitBtn
      Left = 564
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
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
    object CmdNuevo: TBitBtn
      Left = 408
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Nuevo'
      TabOrder = 0
      OnClick = CmdNuevoClick
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
    object CmdInforme: TBitBtn
      Left = 2
      Top = 5
      Width = 105
      Height = 25
      Caption = 'Generar &Informe'
      TabOrder = 2
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
    object EdMensaje: TStaticText
      Left = 118
      Top = 6
      Width = 171
      Height = 19
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      ParentColor = False
      TabOrder = 3
    end
    object CmdGrabar: TBitBtn
      Left = 486
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Grabar'
      TabOrder = 4
      OnClick = CmdGrabarClick
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
  end
  object PageControl1: TPageControl
    Left = 2
    Top = 0
    Width = 656
    Height = 277
    ActivePage = InfoNatural
    TabIndex = 0
    TabOrder = 0
    object InfoNatural: TTabSheet
      Caption = 'Persona Natural'
      object Panel6: TPanel
        Left = 2
        Top = 4
        Width = 646
        Height = 245
        TabOrder = 0
        object Label40: TLabel
          Left = 6
          Top = 95
          Width = 78
          Height = 13
          Caption = 'Tipo de Persona'
        end
        object Label41: TLabel
          Left = 166
          Top = 95
          Width = 35
          Height = 13
          Caption = 'Genero'
        end
        object Label42: TLabel
          Left = 316
          Top = 95
          Width = 55
          Height = 13
          Caption = 'Estado Civil'
        end
        object Label44: TLabel
          Left = 464
          Top = 95
          Width = 86
          Height = 13
          Caption = 'Fecha Nacimiento'
        end
        object Label45: TLabel
          Left = 3
          Top = 169
          Width = 94
          Height = 13
          Caption = 'Tipo de Vinculaci'#243'n'
        end
        object Label46: TLabel
          Left = 315
          Top = 169
          Width = 75
          Height = 13
          Caption = 'Fecha Afiliaci'#243'n'
        end
        object Label48: TLabel
          Left = 556
          Top = 84
          Width = 51
          Height = 13
          Caption = 'Educaci'#243'n'
        end
        object Label60: TLabel
          Left = 134
          Top = 168
          Width = 87
          Height = 13
          Caption = 'Correo Electronico'
        end
        object Label76: TLabel
          Left = 556
          Top = 96
          Width = 57
          Height = 13
          Caption = 'Cooperativa'
        end
        object Label77: TLabel
          Left = 8
          Top = 208
          Width = 97
          Height = 13
          Caption = 'Nivel de Escolaridad'
        end
        object Label78: TLabel
          Left = 212
          Top = 209
          Width = 119
          Height = 13
          Caption = 'Estrato Socio Econ'#243'mico'
        end
        object Label79: TLabel
          Left = 363
          Top = 209
          Width = 80
          Height = 13
          Caption = 'Tipo de Vivienda'
        end
        object GroupBox8: TGroupBox
          Left = 0
          Top = 0
          Width = 343
          Height = 91
          Caption = 'Informaci'#243'n de la Identificaci'#243'n'
          TabOrder = 0
          object Label49: TLabel
            Left = 6
            Top = 16
            Width = 102
            Height = 13
            Caption = 'Tipo de Identificaci'#243'n'
          end
          object Label50: TLabel
            Left = 174
            Top = 14
            Width = 118
            Height = 13
            Caption = 'N'#250'mero de Identificaci'#243'n'
          end
          object Label52: TLabel
            Left = 7
            Top = 51
            Width = 82
            Height = 13
            Caption = 'Lugar Expedici'#243'n'
          end
          object Label53: TLabel
            Left = 183
            Top = 72
            Width = 86
            Height = 13
            Caption = 'Fecha Nacimiento'
          end
          object Label54: TLabel
            Left = 175
            Top = 51
            Width = 85
            Height = 13
            Caption = 'Fecha Expedici'#243'n'
          end
          object CBTiposIdentificacion: TDBLookupComboBox
            Left = 6
            Top = 28
            Width = 165
            Height = 21
            KeyField = 'ID_IDENTIFICACION'
            ListField = 'DESCRIPCION_IDENTIFICACION'
            ListSource = dmPersona.DStiposidentificacion
            TabOrder = 0
            OnEnter = CBtiposidentificacionEnter
            OnExit = CBtiposidentificacionExit
          end
          object EdIdentificacion: TMemo
            Left = 174
            Top = 27
            Width = 165
            Height = 21
            Alignment = taRightJustify
            TabOrder = 1
            WantReturns = False
            WordWrap = False
            OnEnter = EdIdentificacionEnter
            OnExit = EdIdentificacionExit
            OnKeyPress = EdIdentificacionKeyPress
          end
          object EdFechaExpedicion: TDateTimePicker
            Left = 176
            Top = 64
            Width = 163
            Height = 21
            CalAlignment = dtaLeft
            Date = 0.583911585701571
            Format = 'yyyy/MM/dd'
            Time = 0.583911585701571
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 3
            OnEnter = EdFechaExpedicionEnter
            OnExit = EdFechaExpedicionExit
          end
          object EdLugarExpedicion: TEdit
            Left = 8
            Top = 63
            Width = 160
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
            OnEnter = EdLugarExpedicionEnter
            OnExit = EdLugarExpedicionExit
          end
        end
        object EdPrimerApellido: TLabeledEdit
          Left = 442
          Top = 4
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 69
          EditLabel.Height = 13
          EditLabel.Caption = 'Primer Apellido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentFont = False
          TabOrder = 1
          OnEnter = EdPrimerApellidoEnter
          OnExit = EdPrimerApellidoExit
        end
        object EdSegundoApellido: TLabeledEdit
          Left = 442
          Top = 32
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 83
          EditLabel.Height = 13
          EditLabel.Caption = 'Segundo Apellido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentFont = False
          TabOrder = 2
          OnEnter = EdSegundoApellidoEnter
          OnExit = EdSegundoApellidoExit
        end
        object EdNombres: TLabeledEdit
          Left = 442
          Top = 61
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = 'Nombres'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentFont = False
          TabOrder = 3
          OnEnter = EdNombresEnter
          OnExit = EdNombresExit
        end
        object CBTipoPersona: TDBLookupComboBox
          Left = 4
          Top = 109
          Width = 155
          Height = 21
          DropDownWidth = 200
          KeyField = 'ID_TIPO_PERSONA'
          ListField = 'DESCRIPCION_PERSONA'
          ListSource = dmPersona.DStipopersona
          TabOrder = 4
          OnEnter = CBtipopersonaEnter
          OnExit = CBtipopersonaExit
        end
        object CBEstadoCivil: TDBLookupComboBox
          Left = 314
          Top = 109
          Width = 145
          Height = 21
          KeyField = 'ID_TIPO_ESTADO_CIVIL'
          ListField = 'DESCRIPCION_ESTADO_CIVIL'
          ListSource = dmPersona.DSestadocivil
          TabOrder = 6
          OnEnter = CBestadocivilEnter
          OnExit = CBestadocivilExit
          OnKeyPress = CBestadocivilKeyPress
        end
        object EdFechaNacimiento: TDateTimePicker
          Left = 464
          Top = 109
          Width = 93
          Height = 21
          CalAlignment = dtaLeft
          Date = 0.583911585701571
          Format = 'yyyy/MM/dd'
          Time = 0.583911585701571
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 7
          OnEnter = EdFechaNacimientoEnter
          OnExit = EdFechaNacimientoExit
        end
        object EdLugarNacimiento: TLabeledEdit
          Left = 4
          Top = 147
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 98
          EditLabel.Height = 13
          EditLabel.Caption = 'Lugar de Nacimiento'
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 9
          OnEnter = EdLugarNacimientoEnter
          OnExit = EdLugarNacimientoExit
        end
        object EdProvinciaNacimiento: TLabeledEdit
          Left = 164
          Top = 147
          Width = 143
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 139
          EditLabel.Height = 13
          EditLabel.Caption = 'Provincia/Vereda Nacimiento'
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 10
          OnEnter = EdProvinciaNacimientoEnter
          OnExit = EdProvinciaNacimientoExit
        end
        object EdDepartamentoNacimiento: TLabeledEdit
          Left = 314
          Top = 147
          Width = 181
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 123
          EditLabel.Height = 13
          EditLabel.Caption = 'Departamento Nacimiento'
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 11
          OnEnter = EdDepartamentoNacimientoEnter
          OnExit = EdDepartamentoNacimientoExit
        end
        object EdPaisNacimiento: TLabeledEdit
          Left = 502
          Top = 147
          Width = 133
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 22
          EditLabel.Height = 13
          EditLabel.Caption = 'Pa'#237's'
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 12
          OnEnter = EdPaisNacimientoEnter
          OnExit = EdPaisNacimientoExit
        end
        object CBTiposRelacion: TDBLookupComboBox
          Left = 6
          Top = 183
          Width = 127
          Height = 21
          KeyField = 'ID_TIPO_RELACION'
          ListField = 'DESCRIPCION_RELACION'
          ListSource = dmPersona.DStiposrelacion
          TabOrder = 13
          OnEnter = CBtiposrelacionEnter
          OnExit = CBtiposrelacionExit
        end
        object EdFechaAfiliacion: TDateTimePicker
          Left = 313
          Top = 183
          Width = 99
          Height = 21
          CalAlignment = dtaLeft
          Date = 37678.5904104051
          Time = 37678.5904104051
          DateFormat = dfShort
          DateMode = dmComboBox
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Kind = dtkDate
          ParseInput = False
          ParentFont = False
          TabOrder = 15
          TabStop = False
          OnExit = EdFechaAfiliacionExit
        end
        object EdEstudio: TCheckBox
          Left = 579
          Top = 111
          Width = 15
          Height = 17
          Color = clBtnFace
          ParentColor = False
          TabOrder = 8
          OnClick = EdEstudioClick
          OnEnter = EdEstudioEnter
          OnExit = EdEstudioExit
        end
        object EdEmail: TEdit
          Left = 134
          Top = 183
          Width = 178
          Height = 21
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          OnExit = EdEmailExit
        end
        object CBEscolaridad: TDBLookupComboBox
          Left = 3
          Top = 222
          Width = 197
          Height = 21
          DropDownWidth = 197
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'ID_NIVEL'
          ListField = 'DESCRIPCION_NIVEL'
          ListSource = dmPersona.DSnivelestudio
          ParentFont = False
          TabOrder = 16
          OnExit = CBEscolaridadExit
          OnKeyPress = CBEscolaridadKeyPress
        end
        object CBEstrato: TDBLookupComboBox
          Left = 211
          Top = 222
          Width = 142
          Height = 21
          DropDownWidth = 142
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'ID_ESTRATO'
          ListField = 'DESCRIPCION'
          ListSource = dmPersona.DSestrato
          ParentFont = False
          TabOrder = 17
          OnExit = CBEstratoExit
          OnKeyPress = CBEstratoKeyPress
        end
        object CBTipoVivienda: TDBLookupComboBox
          Left = 362
          Top = 222
          Width = 142
          Height = 21
          DropDownWidth = 142
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'ID_TIPOVIVIENDA'
          ListField = 'DESCRIPCION_TIPO'
          ListSource = dmPersona.DSvivienda
          ParentFont = False
          TabOrder = 18
          OnExit = CBTipoViviendaExit
          OnKeyPress = CBTipoViviendaKeyPress
        end
        object CBSexo: TComboBox
          Left = 164
          Top = 109
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 5
          Text = 'FEMENINO'
          OnEnter = CBsexoEnter
          OnExit = CBsexoExit
          Items.Strings = (
            'FEMENINO'
            'MASCULINO'
            'NINGUNO')
        end
      end
    end
    object InfoJuridica: TTabSheet
      Caption = 'Persona Jur'#237'dica'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 8
        Top = 6
        Width = 649
        Height = 213
        TabOrder = 0
        object Label3: TLabel
          Left = 6
          Top = 134
          Width = 78
          Height = 13
          Caption = 'Tipo de Persona'
        end
        object Label8: TLabel
          Left = 166
          Top = 133
          Width = 96
          Height = 13
          Caption = 'Numero de Escritura'
        end
        object Label51: TLabel
          Left = 306
          Top = 133
          Width = 64
          Height = 13
          Caption = 'Capital Social'
        end
        object Label4: TLabel
          Left = 7
          Top = 171
          Width = 91
          Height = 13
          Caption = 'Fecha Constituci'#243'n'
        end
        object Label9: TLabel
          Left = 116
          Top = 171
          Width = 79
          Height = 13
          Caption = 'Duraci'#243'n  (A'#241'os)'
        end
        object Label34: TLabel
          Left = 267
          Top = 172
          Width = 91
          Height = 13
          Caption = 'Matr'#237'cula Mercantil'
        end
        object Label6: TLabel
          Left = 419
          Top = 172
          Width = 81
          Height = 13
          Caption = 'Tipo de Afiliaci'#243'n'
        end
        object Label7: TLabel
          Left = 530
          Top = 172
          Width = 75
          Height = 13
          Caption = 'Fecha Afiliaci'#243'n'
        end
        object GroupBox1: TGroupBox
          Left = 5
          Top = 2
          Width = 343
          Height = 63
          Caption = 'Informaci'#243'n de la Identificaci'#243'n'
          TabOrder = 0
          object Label1: TLabel
            Left = 6
            Top = 16
            Width = 102
            Height = 13
            Caption = 'Tipo de Identificaci'#243'n'
          end
          object Label2: TLabel
            Left = 178
            Top = 14
            Width = 118
            Height = 13
            Caption = 'N'#250'mero de Identificaci'#243'n'
          end
          object CBTipoIdentificacionJur: TDBLookupComboBox
            Left = 6
            Top = 30
            Width = 165
            Height = 21
            KeyField = 'ID_IDENTIFICACION'
            ListField = 'DESCRIPCION_IDENTIFICACION'
            ListSource = dmPersona.DStiposidentificacion
            TabOrder = 0
            OnEnter = CBTipoIdentificacionJurEnter
            OnExit = CBTipoIdentificacionJurExit
          end
          object EdNumeroIdentificacionJur: TMemo
            Left = 174
            Top = 30
            Width = 165
            Height = 21
            Alignment = taRightJustify
            TabOrder = 1
            WantReturns = False
            WordWrap = False
            OnEnter = EdNumeroIdentificacionJurEnter
            OnExit = EdNumeroIdentificacionJurExit
            OnKeyPress = EdIdentificacionKeyPress
          end
        end
        object EdRazonSocial: TLabeledEdit
          Left = 90
          Top = 71
          Width = 553
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 81
          EditLabel.Height = 13
          EditLabel.Caption = 'Raz'#243'n Social      '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentFont = False
          TabOrder = 2
          OnEnter = EdRazonSocialEnter
          OnExit = EdRazonSocialExit
        end
        object EdLugarNacimientoJur: TLabeledEdit
          Left = 6
          Top = 111
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 103
          EditLabel.Height = 13
          EditLabel.Caption = 'Lugar de Constituci'#243'n'
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 3
          OnEnter = EdLugarNacimientoJurEnter
          OnExit = EdLugarNacimientoJurExit
        end
        object EdProvinciaNacimientoJur: TLabeledEdit
          Left = 166
          Top = 111
          Width = 143
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 144
          EditLabel.Height = 13
          EditLabel.Caption = 'Provincia/Vereda Constituci'#243'n'
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 4
          OnEnter = EdProvinciaNacimientoJurEnter
          OnExit = EdProvinciaNacimientoJurExit
        end
        object EdDepartamentoNacimientoJur: TLabeledEdit
          Left = 316
          Top = 111
          Width = 181
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 128
          EditLabel.Height = 13
          EditLabel.Caption = 'Departamento Constituci'#243'n'
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 5
          OnEnter = EdDepartamentoNacimientoJurEnter
          OnExit = EdDepartamentoNacimientoJurExit
        end
        object EdPaisNacimientoJur: TLabeledEdit
          Left = 504
          Top = 111
          Width = 133
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 22
          EditLabel.Height = 13
          EditLabel.Caption = 'Pa'#237's'
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 6
          OnEnter = EdPaisNacimientoJurEnter
          OnExit = EdPaisNacimientoJurExit
        end
        object CBTipoPersonaJur: TDBLookupComboBox
          Left = 6
          Top = 148
          Width = 152
          Height = 21
          KeyField = 'ID_TIPO_PERSONA'
          ListField = 'DESCRIPCION_PERSONA'
          ListSource = dmPersona.DStipopersona
          TabOrder = 7
          OnEnter = CBTipoPersonaJurEnter
          OnExit = CBTipoPersonaJurExit
        end
        object EdNumeroEscritura: TEdit
          Left = 166
          Top = 147
          Width = 132
          Height = 21
          TabOrder = 8
          OnEnter = EdNumeroEscrituraEnter
          OnExit = EdNumeroEscrituraExit
          OnKeyPress = EdNumeroEscrituraKeyPress
        end
        object EdCapitalSocial: TEdit
          Left = 306
          Top = 147
          Width = 134
          Height = 21
          TabOrder = 9
          OnEnter = EdCapitalSocialEnter
          OnExit = EdCapitalSocialExit
          OnKeyPress = EdCapitalSocialKeyPress
        end
        object EdFechaNacimientoJur: TDateTimePicker
          Left = 6
          Top = 185
          Width = 102
          Height = 21
          CalAlignment = dtaLeft
          Date = 37777.5839115857
          Format = 'yyyy/MM/dd'
          Time = 37777.5839115857
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 10
          OnExit = EdFechaNacimientoJurExit
        end
        object EdDuracionSociedad: TEdit
          Left = 117
          Top = 185
          Width = 137
          Height = 21
          TabOrder = 11
          OnEnter = EdDuracionSociedadEnter
          OnExit = EdDuracionSociedadExit
          OnKeyPress = EdDuracionSociedadKeyPress
        end
        object EdMatriculaMercantil: TEdit
          Left = 266
          Top = 185
          Width = 145
          Height = 21
          TabOrder = 12
          OnEnter = EdMatriculaMercantilEnter
          OnExit = EdMatriculaMercantilExit
        end
        object CBTiposRelacionJur: TDBLookupComboBox
          Left = 419
          Top = 185
          Width = 106
          Height = 21
          KeyField = 'ID_TIPO_RELACION'
          ListField = 'DESCRIPCION_RELACION'
          ListSource = dmPersona.DStiposrelacion
          TabOrder = 13
          OnEnter = CBTiposRelacionJurEnter
          OnExit = CBTiposRelacionJurExit
        end
        object EdFechaAfiliacionJur: TDateTimePicker
          Left = 532
          Top = 185
          Width = 99
          Height = 21
          CalAlignment = dtaLeft
          Date = 37678.5904104051
          Time = 37678.5904104051
          DateFormat = dfShort
          DateMode = dmComboBox
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Kind = dtkDate
          ParseInput = False
          ParentFont = False
          TabOrder = 14
          TabStop = False
          OnExit = EdFechaAfiliacionJurExit
        end
        object GroupBox10: TGroupBox
          Left = 346
          Top = 2
          Width = 297
          Height = 63
          Caption = 'Informaci'#243'n Correo Electronico'
          TabOrder = 1
          object Label61: TLabel
            Left = 6
            Top = 16
            Width = 32
            Height = 13
            Caption = 'E- Mail'
          end
          object EdMailJur: TEdit
            Left = 5
            Top = 29
            Width = 284
            Height = 21
            TabOrder = 0
            OnExit = EdMailJurExit
          end
        end
      end
    end
  end
  object IBDS1: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'Select '
      '  "gen$persona"."ID_IDENTIFICACION",'
      '  "gen$persona"."ID_PERSONA",'
      '  "gen$persona"."LUGAR_EXPEDICION",'
      '  "gen$persona"."FECHA_EXPEDICION",'
      '  "gen$persona"."NOMBRE",'
      '  "gen$persona"."PRIMER_APELLIDO",'
      '  "gen$persona"."SEGUNDO_APELLIDO",'
      '  "gen$persona"."ID_TIPO_PERSONA",'
      '  "gen$persona"."SEXO",'
      '  "gen$persona"."FECHA_NACIMIENTO",'
      '  "gen$persona"."LUGAR_NACIMIENTO",'
      '  "gen$persona"."PROVINCIA_NACIMIENTO",'
      '  "gen$persona"."DEPTO_NACIMIENTO",'
      '  "gen$persona"."PAIS_NACIMIENTO",'
      '  "gen$persona"."ID_TIPO_ESTADO_CIVIL",'
      '  "gen$persona"."ID_CONYUGE",'
      '  "gen$persona"."ID_IDENTIFICACION_CONYUGE",'
      '  "gen$persona"."NOMBRE_CONYUGE",'
      '  "gen$persona"."PRIMER_APELLIDO_CONYUGE",'
      '  "gen$persona"."SEGUNDO_APELLIDO_CONYUGE",'
      '  "gen$persona"."ID_APODERADO",'
      '  "gen$persona"."ID_IDENTIFICACION_APODERADO",'
      '  "gen$persona"."NOMBRE_APODERADO",'
      '  "gen$persona"."PRIMER_APELLIDO_APODERADO",'
      '  "gen$persona"."SEGUNDO_APELLIDO_APODERADO",'
      '  "gen$persona"."PROFESION",'
      '  "gen$persona"."ID_ESTADO",'
      '  "gen$persona"."ID_TIPO_RELACION",'
      '  "gen$persona"."ID_CIIU",'
      '  "gen$persona"."EMPRESA_LABORA",'
      '  "gen$persona"."FECHA_INGRESO_EMPRESA",'
      '  "gen$persona"."CARGO_ACTUAL",'
      '  "gen$persona"."DECLARACION",'
      '  "gen$persona"."INGRESOS_A_PRINCIPAL",'
      '  "gen$persona"."INGRESOS_OTROS",'
      '  "gen$persona"."INGRESOS_CONYUGE",'
      '  "gen$persona"."INGRESOS_CONYUGE_OTROS",'
      '  "gen$persona"."DESC_INGR_OTROS",'
      '  "gen$persona"."EGRESOS_ALQUILER",'
      '  "gen$persona"."EGRESOS_SERVICIOS",'
      '  "gen$persona"."EGRESOS_TRANSPORTE",'
      '  "gen$persona"."EGRESOS_ALIMENTACION",'
      '  "gen$persona"."EGRESOS_DEUDAS",'
      '  "gen$persona"."EGRESOS_OTROS",'
      '  "gen$persona"."DESC_EGRE_OTROS",'
      '  "gen$persona"."EGRESOS_CONYUGE",'
      '  "gen$persona"."OTROS_EGRESOS_CONYUGE",'
      '  "gen$persona"."TOTAL_ACTIVOS",'
      '  "gen$persona"."TOTAL_PASIVOS",'
      '  "gen$persona"."EDUCACION",'
      '  "gen$persona"."RETEFUENTE",'
      '  "gen$persona"."ACTA",'
      '  "gen$persona"."FECHA_REGISTRO",'
      '  "gen$persona"."FOTO",'
      '  "gen$persona"."FIRMA",'
      '  "gen$persona"."ESCRITURA_CONSTITUCION",'
      '  "gen$persona"."DURACION_SOCIEDAD",'
      '  "gen$persona"."CAPITAL_SOCIAL",'
      '  "gen$persona"."MATRICULA_MERCANTIL",'
      '  "gen$persona"."FOTO_HUELLA",'
      '  "gen$persona"."DATOS_HUELLA"'
      'from "gen$persona" '
      'where'
      '  "gen$persona"."ID_IDENTIFICACION" = :"ID_IDENTIFICACION" and'
      '  "gen$persona"."ID_PERSONA" = :"ID_PERSONA"')
    SelectSQL.Strings = (
      
        'select ID_IDENTIFICACION,ID_PERSONA,DATOS_HUELLA, FOTO_HUELLA  f' +
        'rom "gen$persona" where ID_IDENTIFICACION = :ID_IDENTIFICACION a' +
        'nd ID_PERSONA = :ID_PERSONA')
    Left = 256
    Top = 372
    object IBDS1ID_IDENTIFICACION: TSmallintField
      FieldName = 'ID_IDENTIFICACION'
      Origin = '"gen$persona"."ID_IDENTIFICACION"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDS1ID_PERSONA: TIBStringField
      FieldName = 'ID_PERSONA'
      Origin = '"gen$persona"."ID_PERSONA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object IBDS1DATOS_HUELLA: TBlobField
      FieldName = 'DATOS_HUELLA'
      Origin = '"gen$persona"."DATOS_HUELLA"'
      Size = 8
    end
  end
  object Images: TImageList
    Left = 628
    Top = 168
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      00009C3139008C29310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A539
      4200B53942009C3139007B295A00292984002929840029296300393163000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD31
      4200B5394200A53139007B315A00292994002929940029218C00292984000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD42
      4A00BD424A00AD3142007B31630031299400292994002929940029218C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A736300EF6B
      7B00EF737B00C64252008C396B0031299C0031299C0029299400292994000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A6B5A00F752
      6300EF526300EF5A7300945ACE00635AF700635AF700524ADE004A42CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000426B5200FFC6
      BD00F7948C00A54284004231C6003939CE004239CE004242D6004242D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000427B4A007BF7
      6B006BE75A004A42A50029217B001818520018186B0039398400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A944A00ADFF
      9C0084F773008C4A84003131A500181852001010420000000000000000003931
      630039315A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063C67B0063DE
      520052BD42006339B500ADA5FF006B63FF00524ADE00000000004A4ACE00635A
      DE0031299C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6BA500ADB5F70094C6
      E700527394007B42AD009C94FF005252EF004242CE00000000005252C600ADA5
      FF003931B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484BD00ADADFF00428C
      5200316331005A635A007B7B84006B6B84007373840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484C600B5B5F70052B5
      4200429C3900315A29006B6363007B424A00734A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084AD7B00E7FF
      D600ADFF9C00427B3100BD424A00EF738400C6424A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008CC6840094FF
      7B0094FF7B00528C4A00A5525A00F794A500BD424A0000000000000000000000
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
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      520052525200525252005252520000000000FFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FEFFF4F8FCFFD5E3F3FFC0D5ECFFBCD3ECFFBCD3ECFFC2D7EDFFDBE7F4FFF4F8
      FCFFFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF00FFF7EF00FFEF
      E700FFEFE700FFEFE700F7E7D600F7E7D600F7E7D600F7E7D600F7D6A500F7D6
      A500F7D6A500F7D6A500F7D6A5008C5A5A000000000052525200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF005252520000000000FFFFFFFFFFFFFFFFF8FAFDFFD1E1
      F1FF9FC0E1FF9CBEE1FFA2C2E4FFA3C3E5FFA0C1E3FF99BCE0FF9BBEE1FFACC9
      E7FFD6E4F3FFFBFCFDFFFFFFFFFFFFFFFFFFB5735200B5735200C6421800C642
      2100CE4A2900C64A29009C4A29008C5242000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00299C29001084100031A5
      310039AD390039AD390031942900217318005A524200FFEFE700F7E7CE00F7E7
      C600F7E7C600F7D6A500F7D6A5008C5A5A00000000005A5A5A00F7F7F7009C5A
      2900A5633900B5732900B5732900B5732900B5732900A5633900A56339009C5A
      29009C5A2900F7F7F7005A5A5A0000000000FFFFFFFFF2F6FAFFB9D0E5FF9DBE
      DBFF5796C1FF5394C1FF85AFD0FFA9C4DDFF9EBDD8FF4D90BEFF609FC8FFA2C0
      DBFFABC6E0FFBED3E7FFF5F8FBFFFFFFFFFFC6421800C6421800E75A3900F763
      4A00FF6B5A00EF634A00E75A3900EF5A42008C4A290063735A00397339003173
      3100297B290029732900316B31005A735A00B58C8C00FFF7EF00299C29006BCE
      6B006BC66B00F7FFEF0063C6630063CE630031A53100FFEFE700FFEFE700FFEF
      DE00F7E7D600F7E7C600F7D6A5008C5A5A000000000063636300F7F7F700BD7B
      4A00B5732900BD7B4A00BD7B4A00BD7B4A00BD7B4A00B5732900A56339009C5A
      2900DE9C7300F7F7F7006363630000000000FAFBFCFFC9D6E1FFB4C7D5FFA9C1
      D2FF6BA6CAFF5DA2CBFF78A9C7FFB5C8D2FFB1C6D1FF5497C1FF68A9CFFF9FBD
      CFFFB4C7D4FFB3C7D5FFD1DDE6FFFFFFFFFFCE4A2100CE4A2100FF735A00FF7B
      6300DE6B4200EFB58400DE7B4A00F7735A00E75A39007B8C390084BD730063AD
      5A0063C6630052C6520031B5310018941800B58C8C00FFF7EF00299C290073CE
      730052A54A00FFFFFF006BC66B0073CE7300319C3100FFF7EF00FFEFE700FFEF
      E700F7E7D600F7E7CE00F7D6A5008C5A5A0000000000636B6B00EFEFEF00F7E7
      D600E7A57300E7944A0094736B005A6B7300AD7B5A00BD7B4A00B5732900DE9C
      7300EFEFEF00EFEFEF00636B6B0000000000EAEEEDFFC2CCCAFFC1CBC9FFC0CB
      C8FF8CB4C8FF62A6CEFF74AAC7FFC2CBC6FFC1CAC5FF689FBFFF68A9CFFF98B9
      C6FFC2CBC8FFC1CBC9FFC5CECCFFEDF0EFFF00000000D6846300FF7B6300FF8C
      6B00DE8C5A00FFD69C00DE8C5A00EF7B5A00E75A39007BA55200C6DEB500D6E7
      C60073D6730063CE630042B54200188C1800B58C8C00FFF7EF00FFFFFF001873
      4A003984AD00217BBD0063BD6300399C3900FFF7EF00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00F7E7D6009C6B6300000000006B737300EFEFEF00FFFF
      FF00FFF7F700BDADA5006B848C004A6B9C006B6B8C00B5946B00E7CEB500FFF7
      F700FFFFFF00EFEFEF006B73730000000000EBEBE3FFCFCFBAFFCFCFBAFFCFCF
      BAFF9DB7BAFF65A7CDFF5D9DC1FFABBCB8FFBDC5B9FF81ABBCFF6BADD2FF95B8
      C2FFCFCFBAFFCFCFBAFFCFCFBAFFEDEDE6FF0000000000000000A56342008C31
      18002121730021217B00A5524A00C65A310073B55A0084DE8400FFF7E700FFF7
      E7007BAD630063BD6300398C390000000000B58C8C00FFF7EF00FFFFFF00399C
      FF00399CFF00399CFF00298CE700FFF7F700EFE7D600FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500EFE7D6009C6B6300005A000073737300E7E7E700FFFF
      FF00D6DEDE006B6B8C004A6B9C007B94C6007B94C6008CB5C600FFFFFF00FFFF
      FF00FFFFFF00E7E7E7007373730000000000EBE4D0FFDFD1ACFFDFD1ACFFDFD2
      ABFFC3C4AAFF6DAACBFF569CC7FF438AB8FF85ACB7FF9BB3B1FF71B1D4FF92B9
      C4FFD8CFADFFDFD1ACFFDFD1ACFFF2EDDFFF0000000000000000181818000808
      080010319400103194001018730063525A004AA54A0063BD630094ADB5004A8C
      B5006394A500318439000000000000000000B58C8C00FFF7EF0063849C0042A5
      FF0042A5FF0042A5FF00399CF7009CC6DE00FFF7F700FFF7F700FFF7EF00FFF7
      EF00FFF7EF00FFEFE700F7E7D6009C6B630000730800005A0000E7E7E700F7F7
      F700ADB5CE007B94C6007B94C6008CB5C6007B94C6007B94C600E7E7E700FFFF
      FF00FFFFFF00E7E7E7007B7B7B0000000000ECE0C7FFDEC89CFFDEC89CFFDEC8
      9CFFD8C59CFF6EA7C6FF66A9D0FF70B1D4FF87B4C5FFA8B0A1FF80B8D5FF8FBB
      CBFFD1C49FFFDEC89CFFDEC89CFFF2EAD9FF000000001010100008101800184A
      A500185ABD00185ABD001852BD0010318C0000000000000000003194F7003194
      F7003194F7002994EF000000000000000000B58C8C00FFF7EF006BA5C6004AB5
      FF0052B5FF0052BDFF004AADFF006BA5C600FFF7F700FFF7F700FFF7F700FFF7
      EF00FFF7EF00FFF7EF00FFEFE700A57B73000073080000730800005A0000FFFF
      FF00CECEDE00739CAD00949C9C00ADCEE700ADB5CE00293184006B6B8C00FFFF
      FF00FFFFFF00E7E7E7009C84840000000000EEE2CDFFD9BB8BFFD9BB8BFFD9BB
      8BFFDABB8BFF72A1B8FF61A6CEFFA0BCBCFFCDC4A3FFB9AF91FF87B8CEFF8EC1
      D8FFC8B893FFD9BB8BFFD9BB8BFFF1E6D4FF000000001818180010213100185A
      BD00216BCE00216BCE002163CE00104AAD0000000000529CCE0039A5FF0039A5
      FF00399CFF00399CFF00426B7B0000000000B58C8C00FFF7EF0063849C004A94
      C6006BADD60063ADF7006BA5C600FFFFFF00FFFFFF00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00FFEFE700A57B730008841000008C0800008C0800FFFF
      FF00E7E7E700ADCEE700ADB5CE007B94C600394A940000007B00394A9400FFFF
      FF00FFFFFF00DEDEDE008C8C8C0000000000F1E4D2FFD5B17EFFD5AF7CFFD5AF
      7CFFD6B07DFF84A1A8FF62A7CFFF6291A9FF8F9B94FF859797FF7CB0CAFF9BD0
      E7FFC7B18BFFD5AF7CFFD7B383FFF2E8D8FF000000003131310029292900215A
      A5003194F7003194F700298CF700216BCE000000000042A5E7004AB5FF0052B5
      FF004AB5FF004AADFF00298CCE0000000000B58C8C00FFF7EF0063849C006BAD
      D6008CBDE70073BDE70063849C00EFE7D600FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500EFE7D600A57B7300008C0800008C0800DEDEDE00FFFF
      FF00ADB5CE003139BD003139BD000008A5000008A5000008A5007B94C600FFFF
      FF00FFFFFF00DEDEDE008C8C8C0000000000FAF6F0FFDBB88DFFD1A46CFFD1A4
      6CFFD2A66EFFA7A48EFF67AAD1FF569CC7FF4D94C0FF589CC5FF85C0DDFFABD9
      E8FFCAAC7EFFD1A46CFFE1C49FFFFFFFFFFF00000000313131004A4A4A001829
      4200216BCE00297BE7003194F700216BC600000000004AA5E70052BDFF005ABD
      FF0052BDFF0052B5FF003194DE0000000000B58C8C00FFF7EF00FFFFFF006BA5
      BD004A94B5004A8CAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700B5847300008C08008C8C8C00DEDEDE00FFFF
      FF00CEDEEF003139BD000008A5000008A5000008A5003139BD00EFEFEF00FFFF
      FF00FFFFFF00DEDEDE008C8C8C0000000000FFFFFFFFF7EFE6FFD4A974FFCE9B
      5FFFCE9C5EFFB8A077FF75A8BDFF528EB1FF4884AAFF4C87ABFF70A5BFFFB0BF
      B4FFCCA068FFD6AC79FFF8F1E8FFFFFFFFFF00000000000000005A5A5A006B6B
      6B00A5A5A50084848400313131004A4A4A0000000000529CC6003994C6004A9C
      CE003194CE00298CCE00106B9C0000000000B58C8C00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00B5847300000000008C8C8C00DEDEDE00FFFF
      FF00FFFFFF00ADB5CE003139BD000010E7003139BD00ADB5CE00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00AD8C8C0000000000FFFFFFFFFFFFFFFFF7EFE5FFDFBE
      97FFCD9A5CFFCC995AFFBD9B6AFFAD946EFFAA916CFFAA916CFFB4996FFFCA9F
      66FFE2C49FFFF8F2EAFFFFFFFFFFFFFFFFFF0000000000000000424242007373
      73008C8C8C0084848400393939000000000000000000000000005AA5D6006BB5
      DE00ADD6EF0073B5D6004284A5000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00000000000000000094949400DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE009494940000000000FFFFFFFFFFFFFFFFFFFFFFFFFDFB
      F9FFF3E8DAFFE1C19CFFDAB486FFD9B384FFD9B384FFDAB385FFE3C7A5FFF4E9
      DCFFFDFCFAFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000009CC6DE008CBD
      D60084B5D6008CB5CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      940094949400949494009494940000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFDFBFFFDFCFAFFFDFCFAFFFEFDFBFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000292929005A524A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000AD7B6B00AD7B6B00AD7B6B00AD7B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400A5A5A500424242000000000000000000000000000000
      00005A524A004242420052636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A008C8C8C00ADADAD00BDB5AD005263840052638400BDB5AD00ADADAD009494
      9400424A4A00000000000000000000000000000000000000000000000000AD7B
      6B00DEA57B00EFC69400E7C6A500DEB58C00AD7B6B00AD7B6B00AD7B6B00AD7B
      6B00000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400ADADAD005A5A5A00C6C6C600000000000000000010841000189C
      18006BC66B0052737B00427BAD0018526B008C5A5200299C29005A524200736B
      5A0000000000000000000000000000000000000000000000000042424200BDBD
      BD00CEC6C600C6C6BD006B7B9C00006B9C00006B9C006B7B9C00DEDED600BDBD
      BD00B5ADAD00424A4A0000000000000000000000000000000000AD7B6B00DEB5
      8C00EFB57B00EFC69C00EFD6B500EFCEA500C69C73007B4A4A008C525200AD7B
      6B00AD7B6B00AD7B6B0000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400BDBDBD006B6B6B00C6C6C60084848400000000000000000021A5210031AD
      31006BC66B0052737B0042739400947B7300C67331008C5A5200299C29004A42
      290000000000000000000000000000000000000000007B7B7B0094949400C6C6
      C600DEDEDE006B7B9C0000ADEF0000ADE70000ADE700009CDE006B7B9C00DEDE
      DE00ADA5A500949494004A4A4A000000000000000000AD7B6B00E7BD9400EFC6
      8C00EFB57B00EFC6A500F7E7CE00F7D6AD00C69C84007B4A4A007B4A4A00CEA5
      7B00EFBD8C00D6A58400AD7B6B00000000000000000000000000C6ADA500FFEF
      E700AD6B5A00AD6B5A00AD6B5A009C9C9C009C9C9C009C9C9C009C9C9C00AD6B
      5A006B6B6B00181818006B6B6B00524A4A000000000000000000299C29004ABD
      4A006BCE6B006BC66B007B737B00F7BD8400F7AD5A00C67339008C5A5200299C
      290000000000000000000000000000000000000000007B7B7B00ADADAD00BDBD
      BD00FFFFFF006B7B9C006B7B9C00006B9C00006B9C0000ADE7006B7B9C00EFE7
      E700BDBDBD00ADADAD004A4A4A0000000000AD7B6B00F7CE9C00F7D69400EFC6
      8C00EFB57B00F7CEAD00FFEFDE00FFE7C600CEA58C007B4A4A007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B00000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00BDBDBD004A4A4A00524A4A004A4A4A0052525200A5A5
      A500393939006B6B6B00BDBDBD00000000000000000000000000000000004ABD
      4A0073CE730052A54A00AD7B7300FFD6AD00FFC68C00EFA55A00C67339008C5A
      520000000000000000000000000000000000000000007B7B7B00ADA5A500CECE
      CE00EFEFEF00D6E7EF006B7B9C0000ADE70000ADE70000A5DE00D6D6E700EFEF
      EF00BDBDBD00ADADAD004A4A4A0000000000AD7B6B00F7D69C00F7D69400F7C6
      8C00F7B57300F7CEAD00FFF7EF00FFEFDE00CEAD9C00734242007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B00000000000000000000000000CEB5AD00FFFF
      F700AD6B5A0094949C0042393900AD6B5A00AD6B5A00AD6B5A00AD6B5A004239
      39006B6B6B00DEDED600B5848400000000000000000000000000000000000000
      000018734A003984AD00217BBD00AD7B7300FFD6AD00FFC68C00F7AD5A00C673
      31008C5A5200000000000000000000000000000000007B7B7B00B5ADAD00BDBD
      BD00F7F7F7006B7B9C0000ADE70000A5DE00006B9C006B7B9C006B7B9C00EFE7
      E700ADADAD00ADADAD004A4A4A0000000000AD7B6B00F7D69C00FFD69400E7BD
      9400B5A59400F7CEAD00FFFFF700FFF7EF00DEC6B50094635A0084524A00CEA5
      8400EFBD8C00DEB58400AD7B6B00000000000000000000000000D6B5AD00FFFF
      FF00A5A59C0042393900B5847300AD6B5A00AD6B5A00AD6B5A00AD6B5A00B584
      730042393900C6C6C600B5848400000000000000000000000000000000000000
      0000187BC600218CE700298CE700218CE700AD7B7300FFD6AD00FFC68C00EFA5
      5A00B56B39008C5A5200000000000000000000000000000000007B7B7B00ADAD
      AD00DEDED600C6C6D6006B7B9C0000ADDE0000ADE70000ADEF006B7B9C00CECE
      CE00ADADAD004A4A4A000000000000000000AD7B6B00FFD69400D6CEA50052A5
      E7002184F70084ADDE00FFFFEF00FFF7EF00FFF7E700F7E7CE00E7C6A500E7C6
      9C00E7BD9400DEB58400AD7B6B00000000000000000000000000D6BDB500A5A5
      9C006B6B6B00C6B59400FFE7D600EFC6AD00F7D6AD00F7D6AD00E7C69C00F7E7
      CE009C8C730042393900B584840000000000000000000000000000000000297B
      AD00399CFF00399CFF00399CFF00399CFF00298CE700AD7B7300FFD6AD009C94
      A50031ADF7000010AD0000009C000000000000000000000000007B7B7B00ADAD
      AD00C6C6C600EFE7E7006B7B9C00006B9C00006B9C006B7B9C00DEDED600ADA5
      A500B5B5B5004A4A4A000000000000000000AD7B6B009CC6C60042B5FF0031AD
      FF00319CFF001884FF0084BDF700FFFFEF00FFF7EF00FFEFDE00F7E7CE00EFD6
      B500EFC69C00DEB58C00A57B7B00000000000000000000000000D6BDB500A5A5
      9C006B6B6B00D6BDA500AD6B5A00AD6B5A00AD6B5A00AD6B5A00AD6B5A00AD6B
      5A00AD9C8C0042393900B5848400000000000000000000000000000000002184
      C60042A5FF0042A5FF0042A5FF0042A5FF00399CF700315A6B00AD7B73004A9C
      EF001029D6001029D6000010AD0000009C000000000000000000000000007B7B
      7B0094949400A5A5A500CEC6C6004A5A7B004A5A7B00CEC6BD00BDB5B5009494
      94004A4A4A00000000000000000000000000429CF70042A5FF0042ADFF0042B5
      FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFF7EF00FFEFDE00FFE7
      C600DEC6B500948C94009C7B8400000000000000000000000000DEBDB500A5A5
      9C006B6B6B00C6BDA500B5847300B5847300AD6B5A00AD6B5A00AD6B5A00AD6B
      5A00A5947B0042393900B58484000000000000000000000000006BA5C60042A5
      F7004AB5FF0052B5FF0052BDFF0052B5FF004AADFF0039739400000000000018
      C6006B8CFF00106BFF001029D600000000000000000000000000000000000000
      00007B7B7B007B7B7B006B6B6B00736B6B00736B6B006B6B6B00424242004A4A
      4A000000000000000000000000000000000000000000429CFF0042A5FF0042AD
      FF0042B5FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFFFEF00D6D6
      D600737BAD007B73940000000000000000000000000000000000DEC6B500FFFF
      FF00A5A59C006B6B6B00FFD6AD00FFE7D600F7FFFF00FFFFF700FFDED600FFD6
      B50042393900A5A5A500B58484000000000000000000000000005294BD0042A5
      EF005ABDFF005ABDFF0052B5F7004AB5EF0052B5F70039738C00000000000000
      00000018C6000018C60000000000000000000000000000000000000000000000
      000000000000000000007B7B7B006B6363006B6B6B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000429CF70042A5
      FF0042ADFF0042ADFF0039A5FF002994FF001884FF0094C6FF00B5CEE7004A6B
      BD00526BA5000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00A5A59C006B6B6B00F7D6AD00AD6B5A00AD6B5A00EFD6A5004239
      3900BDBDBD00B58C8400B584840000000000000000000000000063849C002173
      A5004A94C6006BADD60063ADF7004A9CE700216BA50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C00CECED600949494008C8C8C00000000000000
      00000000000000000000000000000000000000000000000000000000000042A5
      FF0042ADFF0042B5FF0042ADFF00319CFF002994FF001884FF00316BE7003163
      C600000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00AD6B5A00AD6B5A00A5A59C006B6B6B006B6B6B006B6B6B006B6B6B00A5A5
      9C00EFB57300EFA54A00C6846B00000000000000000000000000000000002173
      A5006BADD6008CBDE70073BDE7005AADDE00316B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00D6D6D600F7FFFF00CED6D600CEC6C6007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042A5FF0042ADFF0042B5FF0039ADFF003994F7001831B5003952DE000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A5A59C00A5A59C00A5A59C00A5A59C00C694
      7B00FFC67300CE94730000000000000000000000000000000000000000000000
      00006BA5BD004A94B5004A8CAD0063849C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021212100A5A5A50031313100949494009494940031313100ADADAD002121
      2100000000000000000000000000000000000000000000000000000000000000
      00000000000042A5FF0042ADFF00000000000000000018109400394ADE000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018189C00394ADE000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F3FF000000000000E01F000000000000
      E01F000000000000E01F000000000000C01F000000000000C01F000000000000
      C01F000000000000C03F000000000000C067000000000000C047000000000000
      8047000000000000807F000000000000807F000000000000C07F000000000000
      C07F000000000000FFFF000000000000FFFFFFFF0000FFFF800180010000FFFF
      00008001000000FF000080010000000000008001000000000000800100008000
      000080010000C001000000010000C00300000001000080C30000000100008081
      00000001000080810000000100008081000000010000C081000080010000C1C1
      800180010000FFC3FFFF80010000FFFFF3FFF00FF0FFC000F1FFE007E00FC000
      C00FC003C003C000C00F80018001C000C00F80010001C001E00F80010001C001
      F00780010001C001F003C0030001C001E001C0030001C001E000E0070001C001
      C021F00F8003C001C033FC3FC007C001C07FFC3FE00FC001E07FF81FF01FC003
      F0FFF00FF99FC007FFFFFFFFFF9FC00F00000000000000000000000000000000
      000000000000}
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 284
    Top = 284
  end
  object DSbeneficiario: TDataSource
    DataSet = CDbeneficiario
    Left = 280
    Top = 352
  end
  object CDbeneficiario: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_agencia'
        DataType = ftInteger
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftInteger
      end
      item
        Name = 'primer_apellido'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'segundo_apellido'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'id_parentesco'
        DataType = ftInteger
      end
      item
        Name = 'porcentaje'
        DataType = ftCurrency
      end
      item
        Name = 'parentesco'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'auxilio'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 232
    Top = 424
    Data = {
      360100009619E0BD01000000180000000A00000000000300000036010A69645F
      6167656E63696104000100000000000A69645F706572736F6E61010049000000
      0100055749445448020002000F001169645F6964656E74696669636163696F6E
      04000100000000000F7072696D65725F6170656C6C69646F0100490000000100
      055749445448020002001E0010736567756E646F5F6170656C6C69646F010049
      0000000100055749445448020002001E00066E6F6D6272650100490000000100
      0557494454480200020032000D69645F706172656E746573636F040001000000
      00000A706F7263656E74616A6508000400000001000753554254595045020049
      0006004D6F6E6579000A706172656E746573636F010049000000010005574944
      5448020002001E0007617578696C696F02000300000000000000}
    object CDbeneficiarioid_agencia: TIntegerField
      FieldName = 'id_agencia'
    end
    object CDbeneficiarioid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDbeneficiarioid_identificacion: TIntegerField
      FieldName = 'id_identificacion'
    end
    object CDbeneficiarioprimer_apellido: TStringField
      FieldName = 'primer_apellido'
      Size = 30
    end
    object CDbeneficiariosegundo_apellido: TStringField
      FieldName = 'segundo_apellido'
      Size = 30
    end
    object CDbeneficiarionombre: TStringField
      FieldName = 'nombre'
      Size = 50
    end
    object CDbeneficiarioid_parentesco: TIntegerField
      FieldName = 'id_parentesco'
    end
    object CDbeneficiarioporcentaje: TCurrencyField
      FieldName = 'porcentaje'
      Currency = False
    end
    object CDbeneficiarioparentesco: TStringField
      FieldName = 'parentesco'
      Size = 30
    end
    object CDbeneficiarioauxilio: TBooleanField
      FieldName = 'auxilio'
    end
  end
  object CDhijo: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 320
    Data = {
      970000009619E0BD0100000018000000040000000000030000009700066E6F6D
      627265020049000000010005574944544802000200FF000F7072696D65725F61
      70656C6C69646F01004900000001000557494454480200020032001073656775
      6E646F5F6170656C6C69646F0100490000000100055749445448020002003200
      1066656368615F6E6163696D69656E746F04000600000000000000}
    object CDhijonombre: TStringField
      FieldName = 'nombre'
      Size = 255
    end
    object CDhijoprimer_apellido: TStringField
      FieldName = 'primer_apellido'
      Size = 50
    end
    object CDhijosegundo_apellido: TStringField
      FieldName = 'segundo_apellido'
      Size = 50
    end
    object CDhijofecha_nacimiento: TDateField
      FieldName = 'fecha_nacimiento'
    end
  end
  object DShijo: TDataSource
    DataSet = CDhijo
    Left = 224
    Top = 296
  end
  object DSaux: TDataSource
    DataSet = CDbeneficiario
    Left = 248
    Top = 256
  end
  object dsOcupacion: TDataSource
    DataSet = qOcupacion
    Left = 136
    Top = 280
  end
  object qOcupacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    AfterScroll = qOcupacionAfterScroll
    SQL.Strings = (
      'select * from "gen$tiposocupacion"')
    Left = 184
    Top = 296
  end
  object dsTipoContrato: TDataSource
    DataSet = qTipoContrato
    Left = 104
    Top = 288
  end
  object qTipoContrato: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    AfterScroll = qTipoContratoAfterScroll
    SQL.Strings = (
      'select * from "gen$tiposcontrato"')
    Left = 152
    Top = 288
  end
  object FormularioJ: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 368
    Top = 384
    ReportForm = {19000000}
  end
  object FormularioN: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 340
    Top = 384
    ReportForm = {
      19000000A157000019FFFFFFFF11004850204C617365724A6574207031353035
      00FFFFFFFFFF050000006F080000E40D00004800000000000000000000000000
      000000FFFF00000000FFFF000000000000000000000000030400466F726D000F
      000080DC000000780000007C0100002C010000040000000200DA0000000B0050
      6167654865616465723100020100000000100000000B0300005F000000300002
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200470100000D004D617374657248656164657231000201000000009300
      00000B030000180000007000040001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200BF0100000B004D6173746572446174
      613100020100000000AA0000000B0300007C0000003000050001000000000000
      000000FFFFFF1F000000000D0066724942546974756C61726573000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      010000000000000200370200000B004D61737465724461746132000201000000
      00610100000B030000900000003000050001000000000000000000FFFFFF1F00
      0000000D0066724942546974756C6172657300000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00B10200000B004D6173746572446174613300020100000000270200000B0300
      00200000003000050001000000000000000000FFFFFF1F000000000F00667249
      425265666572656E6369617300000000000000FFFF0000000000020000000100
      00000000000001000000C8000000140000000100000000000002001F0300000E
      005265706F727453756D6D6172793100020100000000870300000B030000E400
      00003800010001000000000000000000FFFFFF1F000000000000000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      0100000000000002008C0300000D004D61737465724865616465723200020100
      000000030200000B030000140000007000040001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200F90300000D004D617374
      65724865616465723300020100000000380100000B0300001400000030000400
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      000200660400000D004D61737465724865616465723400020100000000580200
      000B030000140000003000040001000000000000000000FFFFFF1F0000000000
      00000000000000000000000000000002000000010000000000000001000000C8
      00000014000000010000000000000200E10400000B004D617374657244617461
      3400020100000000800200000B03000014000000380005000100000000000000
      0000FFFFFF1F0000000010006672444242656E65666963696172696F00000000
      0000000000000000000002000000010000000000000001000000C80000001400
      00000100000000000002004E0500000D004D6173746572486561646572350002
      0100000000A40200000B030000140000003000040001000000000000000000FF
      FFFF1F0000000000000000000000000000000000000000020000000100000000
      00000001000000C800000014000000010000000000000200C40500000B004D61
      73746572446174613500020100000000CC0200000B0300001400000038000500
      01000000000000000000FFFFFF1F000000000B0066724442617578696C696F00
      0000000000000000000000000002000000010000000000000001000000C80000
      0014000000010000000000000200310600000D004D6173746572486561646572
      3600020100000000F40200000B03000014000000300004000100000000000000
      0000FFFFFF1F00000000000000000000000000FFFF0000000000020000000100
      00000000000001000000C800000014000000010000000000000200A90600000B
      004D61737465724461746136000201000000001C0300000B0300002800000030
      00050001000000000000000000FFFFFF1F000000000D00667244424164696369
      6F6E616C00000000000000FFFF00000000000200000001000000000000000100
      0000C8000000140000000100000000000000005607000005004D656D6F310002
      00330100001500000074010000210000000300000001000000000000000000FF
      FFFF1F2E02000000000001002F00464F524D554C4152494F2044452041504552
      5455524120592041435455414C495A4143494F4E204445204441544F53000000
      00FFFF00000000000200000001000000000500417269616C000C000000020000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      F007000005004D656D6F32000200AC0200001600000044000000140000000300
      000001000000000000000000FFFFFF1F2E02000000000001001C00486F6A6120
      5B50414745235D206465205B544F54414C50414745535D00000000FFFF000000
      00000200000001000000000500417269616C00080000000200000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000800800000500
      4D656D6F350002004D0000004300000066000000100000000300000001000000
      000000000000FFFFFF1F2E0200000000000100120046656368612056696E6375
      6C616369F36E3A00000000FFFF00000000000200000001000000000500417269
      616C0008000000000000000000090000000100020000000000FFFFFF00000000
      020000000000000000001709000005004D656D6F36000200B400000043000000
      5C000000100000000300000001000000000000000000FFFFFF1F2C0004020A00
      797979792F6D6D2F64640001000F005B464543484141504552545552415D0000
      0000FFFF00000000000200000001000000000500417269616C00080000000200
      00000000080000000100020000000000FFFFFF00000000020000000000000000
      009C09000005004D656D6F370002007A01000043000000280000001000000003
      00000001000000000000000000FFFFFF1F2E0200000000000100070043697564
      61643A00000000FFFF00000000000200000001000000000500417269616C0008
      000000000000000000080000000100020000000000FFFFFF0000000002000000
      0000000000002C0A000005004D656D6F38000200B90200002D00000030000000
      100000000300000001000000000000000000FFFFFF1F2C0004020A0079797979
      2F6D6D2F64640001000800496D707265736F3A00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000008000000010002
      0000000000FFFFFF0000000002000000000000000000BA0A000005004D656D6F
      39000200B20200003E0000003C00000010000000030000000100000000000000
      0000FFFFFF1F2C0004020A00797979792F6D6D2F646400010006005B44415445
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000020000000100020000000000FFFFFF00000000020000000000
      00000000410B000006004D656D6F3130000200A4010000430000006700000010
      0000000300000001000000000000000000FFFFFF1F2C00000000000001000800
      5B4349554441445D00000000FFFF000000000002000000010000000005004172
      69616C0009000000020000000000080000000100020000000000FFFFFF000000
      0002000000000000000000D80B000006004D656D6F31310002004C0000005400
      0000A8000000140000000300000001000000000000000000FFFFFF1F2E020000
      00000001001800492E20434F4E444943494F4E4553204445204D414E454A4F00
      000000FFFF00000000000200000001000000000500417269616C000800000003
      0000000000080000000100020000000000FFFFFF000000000200000000000000
      00006B0C000006004D656D6F323100020060000000AC0000006C000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010014004E6F
      6D627265732079204170656C6C69646F733A00000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000000000001000200
      00000000FFFFFF0000000002000000000000000000460D000006004D656D6F32
      32000200D1000000AC000000D601000010000000010000000100000000000000
      0000FFFFFF1F2E02000000000001005C005B5452494D284942546974756C6172
      65732E4E4F4D4252452B272027202B4942546974756C617265732E5052494D45
      525F4150454C4C49444F2B2720272B4942546974756C617265732E534547554E
      444F5F4150454C4C49444F295D00000000FFFF00000000000200000001000000
      000500417269616C000A000000020000000000000000000100020000000000FF
      FFFF0000000002000000000000000000D80D000006004D656D6F323300020060
      000000BA00000059000000100000000300000001000000000000000000FFFFFF
      1F2E020000000000010013004964656E7469666963616369F36E204E6F2E3A00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000980E000006004D656D6F3234000200BB000000BA00000060000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010041005B49
      42546974756C617265732E22494E494349414C5F4944454E5449464943414349
      4F4E225D2D5B4942546974756C617265732E2249445F504552534F4E41225D00
      000000FFFF00000000000200000001000000000500417269616C000800000002
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000240F000006004D656D6F32350002001C010000BA00000044000000100000
      000300000001000000000000000000FFFFFF1F2E02000000000001000D004578
      70656469646F20656E3A2000000000FFFF000000000002000000010000000005
      00417269616C0008000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000C30F000006004D656D6F3236000200620100
      00BA00000075000000100000000300000001000000000000000000FFFFFF1F2E
      020000000000010020005B4942546974756C617265732E224C554741525F4558
      5045444943494F4E225D00000000FFFF00000000000200000001000000000500
      417269616C0008000000020000000000000000000100020000000000FFFFFF00
      000000020000000000000000004C10000006004D656D6F3237000200D9010000
      BA0000003C000000100000000300000001000000000000000000FFFFFF1F2E02
      000000000001000A004665636861204578703A00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000000000000010002
      0000000000FFFFFF0000000002000000000000000000F510000006004D656D6F
      323800020016020000BA00000060000000100000000300000001000000000000
      000000FFFFFF1F2C0004020A00797979792F6D6D2F646400010020005B494254
      6974756C617265732E2246454348415F45585045444943494F4E225D00000000
      FFFF00000000000200000001000000000500417269616C000800000002000000
      0000000000000100020000000000FFFFFF000000000200000000000000000079
      11000006004D656D6F323900020077020000BA00000020000000100000000300
      000001000000000000000000FFFFFF1F2E020000000000010005005365786F3A
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      0000005C12000006004D656D6F333000020096020000BA000000610000001000
      00000300000001000000000000000000FFFFFF1F2E020000000000010064005B
      4946285B4942546974756C617265732E225345584F225D203D20274D272C2027
      4D415343554C494E4F272C204946285B4942546974756C617265732E22534558
      4F225D203D202746272C202746454D454E494E4F272C20274E494E47554E4F27
      29295D00000000FFFF00000000000200000001000000000500417269616C0008
      000000020000000000000000000100020000000000FFFFFF0000000002000000
      000000000000EF12000006004D656D6F333100020060000000C90000006C0000
      00100000000300000001000000000000000000FFFFFF1F2E0200000000000100
      14004665636861206465204E6163696D69656E746F3A00000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000000000000
      0100020000000000FFFFFF00000000020000000000000000009813000006004D
      656D6F3332000200CB000000C900000050000000100000000300000001000000
      000000000000FFFFFF1F2C0004020A00797979792F6D6D2F646400010020005B
      4942546974756C617265732E2246454348415F4E4143494D49454E544F225D00
      000000FFFF00000000000200000001000000000500417269616C000800000002
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00002B14000006004D656D6F33330002001B010000C90000006C000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010014004C75
      676172206465204E6163696D69656E746F3A00000000FFFF0000000000020000
      0001000000000500417269616C00080000000000000000000000000001000200
      00000000FFFFFF0000000002000000000000000000B714000006004D656D6F33
      3400020058020000C90000004000000010000000030000000100000000000000
      0000FFFFFF1F2E02000000000001000D0045737461646F20436976696C3A0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      005E15000006004D656D6F333500020098020000C90000006000000010000000
      0300000001000000000000000000FFFFFF1F2E020000000000010028005B4942
      546974756C617265732E224445534352495043494F4E5F45535441444F5F4349
      56494C225D00000000FFFF00000000000200000001000000000500417269616C
      0008000000020000000000000000000100020000000000FFFFFF000000000200
      0000000000000000FD15000006004D656D6F333600020088010000C9000000CE
      000000100000000300000001000000000000000000FFFFFF1F2E020000000000
      010020005B4942546974756C617265732E224C554741525F4E4143494D49454E
      544F225D00000000FFFF00000000000200000001000000000500417269616C00
      08000000020000000000000000000100020000000000FFFFFF00000000020000
      000000000000009116000006004D656D6F333700020060000000D80000006C00
      0000100000000300000001000000000000000000FFFFFF1F2E02000000000001
      00150044697265636369F36E205265736964656E6369613A00000000FFFF0000
      0000000200000001000000000500417269616C00080000000000000000000000
      00000100020000000000FFFFFF00000000020000000000000000003A17000006
      004D656D6F3338000200CC000000D80000001001000010000000030000000100
      0000000000000000FFFFFF1F2E02000000000001002A005B4942446972526573
      2E22444952454343494F4E225D205B49424469725265732E2242415252494F22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000000000000100020000000000FFFFFF00000000020000000000
      00000000C317000006004D656D6F3339000200DC010000D80000003400000010
      0000000300000001000000000000000000FFFFFF1F2E02000000000001000A00
      4D756E69636970696F3A00000000FFFF00000000000200000001000000000500
      417269616C0008000000000000000000000000000100020000000000FFFFFF00
      000000020000000000000000005818000006004D656D6F343000020010020000
      D800000064000000100000000300000001000000000000000000FFFFFF1F2E02
      0000000000010016005B49424469725265732E224D554E49434950494F225D00
      000000FFFF00000000000200000001000000000500417269616C000800000002
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000E018000006004D656D6F343100020073020000D800000034000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010009005465
      6CE9666F6E6F3A00000000FFFF00000000000200000001000000000500417269
      616C0008000000000000000000000000000100020000000000FFFFFF00000000
      020000000000000000007519000006004D656D6F3432000200A8020000D80000
      0050000000100000000300000001000000000000000000FFFFFF1F2E02000000
      0000010016005B49424469725265732E2254454C45464F4E4F31225D00000000
      FFFF00000000000200000001000000000500417269616C000800000002000000
      0000000000000100020000000000FFFFFF00000000020000000000000000000E
      1A000006004D656D6F343300020060000000E70000008B000000100000000300
      000001000000000000000000FFFFFF1F2E02000000000001001A004469726563
      6369F36E20436F72726573706F6E64656E6369613A00000000FFFF0000000000
      0200000001000000000500417269616C00080000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000B71A000006004D65
      6D6F3434000200ED000000E7000000EE00000010000000030000000100000000
      0000000000FFFFFF1F2E02000000000001002A005B4942446972436F722E2244
      4952454343494F4E225D205B4942446972436F722E2242415252494F225D0000
      0000FFFF00000000000200000001000000000500417269616C00080000000200
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      00401B000006004D656D6F3435000200DC010000E70000003400000010000000
      0300000001000000000000000000FFFFFF1F2E02000000000001000A004D756E
      69636970696F3A00000000FFFF00000000000200000001000000000500417269
      616C0008000000000000000000000000000100020000000000FFFFFF00000000
      02000000000000000000D51B000006004D656D6F343600020010020000E70000
      0064000000100000000300000001000000000000000000FFFFFF1F2E02000000
      0000010016005B4942446972436F722E224D554E49434950494F225D00000000
      FFFF00000000000200000001000000000500417269616C000800000002000000
      0000000000000100020000000000FFFFFF00000000020000000000000000005D
      1C000006004D656D6F343700020073020000E700000034000000100000000300
      000001000000000000000000FFFFFF1F2E0200000000000100090054656CE966
      6F6E6F3A00000000FFFF00000000000200000001000000000500417269616C00
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      00000000000000F21C000006004D656D6F3438000200A8020000E70000005000
      0000100000000300000001000000000000000000FFFFFF1F2E02000000000001
      0016005B4942446972436F722E2254454C45464F4E4F31225D00000000FFFF00
      000000000200000001000000000500417269616C000800000002000000000000
      0000000100020000000000FFFFFF0000000002000000000000000000851D0000
      06004D656D6F343900020060000000F60000006C000000100000000300000001
      000000000000000000FFFFFF1F2E020000000000010014004163746976696461
      642045636F6EF36D6963613A00000000FFFF0000000000020000000100000000
      0500417269616C0008000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000000001D1E000006004D656D6F3530000200CC00
      0000F600000010010000100000000300000001000000000000000000FFFFFF1F
      2E020000000000010019005B4942546974756C617265732E2250524F46455349
      4F4E225D00000000FFFF00000000000200000001000000000500417269616C00
      08000000020000000000000000000100020000000000FFFFFF00000000020000
      00000000000000A81E000006004D656D6F3531000200DC010000F60000004000
      0000100000000300000001000000000000000000FFFFFF1F2E02000000000001
      000C00446573637269706369F36E3A00000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000000000001000200000000
      00FFFFFF0000000002000000000000000000431F000006004D656D6F35320002
      001A020000F6000000DC000000100000000300000001000000000000000000FF
      FFFF1F2E02000000000001001C005B4942546974756C617265732E2243415247
      4F5F41435455414C225D00000000FFFF00000000000200000001000000000500
      417269616C0008000000020000000000000000000100020000000000FFFFFF00
      00000002000000000000000000D71F000006004D656D6F353300020060000000
      0401000074000000100000000300000001000000000000000000FFFFFF1F2E02
      000000000001001500456D707265736120646F6E6465206C61626F72613A0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      007420000006004D656D6F3534000200D4000000040100008500000010000000
      0300000001000000000000000000FFFFFF1F2E02000000000001001E005B4942
      546974756C617265732E22454D50524553415F4C41424F5241225D00000000FF
      FF00000000000200000001000000000500417269616C00080000000200000000
      00000000000100020000000000FFFFFF0000000002000000000000000000FD20
      000006004D656D6F35350002005A010000040100003400000010000000030000
      0001000000000000000000FFFFFF1F2E02000000000001000A00446972656363
      69F36E3A00000000FFFF00000000000200000001000000000500417269616C00
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000009221000006004D656D6F35360002008D010000040100007800
      0000100000000300000001000000000000000000FFFFFF1F2E02000000000001
      0016005B4942446972456D702E22444952454343494F4E225D00000000FFFF00
      000000000200000001000000000500417269616C000800000002000000000000
      0000000100020000000000FFFFFF00000000020000000000000000001B220000
      06004D656D6F3537000200060200000401000034000000100000000300000001
      000000000000000000FFFFFF1F2E02000000000001000A004D756E6963697069
      6F3A00000000FFFF00000000000200000001000000000500417269616C000800
      0000000000000000000000000100020000000000FFFFFF000000000200000000
      0000000000B022000006004D656D6F3538000200390200000401000050000000
      100000000300000001000000000000000000FFFFFF1F2E020000000000010016
      005B4942446972456D702E224D554E49434950494F225D00000000FFFF000000
      00000200000001000000000500417269616C0008000000020000000000000000
      000100020000000000FFFFFF0000000002000000000000000000382300000600
      4D656D6F35390002008A02000004010000310000001000000003000000010000
      00000000000000FFFFFF1F2E0200000000000100090054656CE9666F6E6F3A00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000CD23000006004D656D6F3630000200BC020000040100003C000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010016005B49
      42446972456D702E2254454C45464F4E4F31225D00000000FFFF000000000002
      00000001000000000500417269616C0008000000020000000000000000000100
      020000000000FFFFFF00000000020000000000000000006824000006004D656D
      6F36310002006000000012010000980000001000000003000000010000000000
      00000000FFFFFF1F2E02000000000001001C004E6F6D62726573207920417065
      6C6C69646F7320436F6E797567653A00000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000000000001000200000000
      00FFFFFF00000000020000000000000000006725000006004D656D6F36320002
      00F80000001201000000020000100000000300000001000000000000000000FF
      FFFF1F2E020000000000010080005B7472696D285B4942546974756C61726573
      2E224E4F4D4252455F434F4E59554745225D2B2720272B5B4942546974756C61
      7265732E225052494D45525F4150454C4C49444F5F434F4E59554745225D2B27
      20272B205B4942546974756C617265732E22534547554E444F5F4150454C4C49
      444F5F434F4E59554745225D295D00000000FFFF000000000002000000010000
      00000500417269616C0009000000020000000000000000000100020000000000
      FFFFFF00000000020000000000000000000126000006004D656D6F3635000200
      6100000072010000980200001D0000000B00000001000000000000000000FFFF
      FF1F2E02000000000001001B005B4942546974756C617265732E224445434C41
      524143494F4E225D00000000FFFF000000000002000000010000000005004172
      69616C0008000000020000000000000000000100020000000000FFFFFF000000
      0002000000000000000000AC26000006004D656D6F3636000200AA0000009001
      000060000000100000000300000001000000000000000000FFFFFF1F2E020401
      08002420232C232E303000010024005B4942546974756C617265732E22494E47
      5245534F535F415F5052494E434950414C225D00000000FFFF00000000000200
      000001000000000500417269616C000800000002000000000001000000010002
      0000000000FFFFFF00000000020000000000000000003827000006004D656D6F
      3637000200610000009001000048000000100000000300000001000000000000
      000000FFFFFF1F2E02000000000001000D00496E677265736F73204D65733A00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000C627000006004D656D6F36380002000A0100009001000050000000100000
      000300000001000000000000000000FFFFFF1F2E02000000000001000F00496E
      677265736F73204F74726F733A00000000FFFF00000000000200000001000000
      000500417269616C0008000000000000000000000000000100020000000000FF
      FFFF00000000020000000000000000006B28000006004D656D6F36390002005C
      0100009001000060000000100000000300000001000000000000000000FFFFFF
      1F2E02040108002420232C232E30300001001E005B4942546974756C61726573
      2E22494E475245534F535F4F54524F53225D00000000FFFF0000000000020000
      0001000000000500417269616C00080000000200000000000100000001000200
      00000000FFFFFF0000000002000000000000000000F628000006004D656D6F37
      30000200BC010000900100004000000010000000030000000100000000000000
      0000FFFFFF1F2E02000000000001000C00446573637269706369F36E3A000000
      00FFFF00000000000200000001000000000500417269616C0008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      9429000006004D656D6F3731000200FC01000090010000FD0000001000000003
      00000001000000000000000000FFFFFF1F2E02000000000001001F005B494254
      6974756C617265732E22444553435F494E47525F4F54524F53225D00000000FF
      FF00000000000200000001000000000500417269616C00080000000200000000
      00000000000100020000000000FFFFFF0000000002000000000000000000242A
      000006004D656D6F373200020061000000A00100006000000010000000030000
      0001000000000000000000FFFFFF1F2E02000000000001001100496E67726573
      6F7320436F6E797567653A00000000FFFF000000000002000000010000000005
      00417269616C0008000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000CB2A000006004D656D6F3733000200C00000
      00A001000060000000100000000300000001000000000000000000FFFFFF1F2E
      02040108002420232C232E303000010020005B4942546974756C617265732E22
      494E475245534F535F434F4E59554745225D00000000FFFF0000000000020000
      0001000000000500417269616C00080000000200000000000100000001000200
      00000000FFFFFF0000000002000000000000000000612B000006004D656D6F37
      3400020020010000A00100008000000010000000030000000100000000000000
      0000FFFFFF1F2E02000000000001001700496E677265736F73204F74726F7320
      436F6E797567653A00000000FFFF000000000002000000010000000005004172
      69616C0008000000000000000000000000000100020000000000FFFFFF000000
      00020000000000000000000E2C000006004D656D6F3735000200A0010000A001
      000060000000100000000300000001000000000000000000FFFFFF1F2E020401
      08002420232C232E303000010026005B4942546974756C617265732E22494E47
      5245534F535F434F4E595547455F4F54524F53225D00000000FFFF0000000000
      0200000001000000000500417269616C00080000000200000000000100000001
      00020000000000FFFFFF00000000020000000000000000009E2C000006004D65
      6D6F373600020060000000B00100006000000010000000030000000100000000
      0000000000FFFFFF1F2E0200000000000100110045677265736F732041727269
      656E646F3A00000000FFFF00000000000200000001000000000500417269616C
      0008000000000000000000000000000100020000000000FFFFFF000000000200
      0000000000000000452D000006004D656D6F3737000200C0000000B001000060
      000000100000000300000001000000000000000000FFFFFF1F2E020401080024
      20232C232E303000010020005B4942546974756C617265732E2245475245534F
      535F414C5155494C4552225D00000000FFFF0000000000020000000100000000
      0500417269616C0008000000020000000000010000000100020000000000FFFF
      FF0000000002000000000000000000D92D000006004D656D6F37380002002001
      0000B001000070000000100000000300000001000000000000000000FFFFFF1F
      2E0200000000000100150045677265736F7320416C696D656E74616369F36E3A
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      000000842E000006004D656D6F3739000200A1010000B0010000600000001000
      00000300000001000000000000000000FFFFFF1F2E02040108002420232C232E
      303000010024005B4942546974756C617265732E2245475245534F535F414C49
      4D454E544143494F4E225D00000000FFFF000000000002000000010000000005
      00417269616C0008000000020000000000010000000100020000000000FFFFFF
      0000000002000000000000000000162F000006004D656D6F3830000200010200
      00B00100006A000000100000000300000001000000000000000000FFFFFF1F2E
      0200000000000100130045677265736F73205472616E73706F7274653A000000
      00FFFF00000000000200000001000000000500417269616C0008000000000000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      BF2F000006004D656D6F383100020069020000B0010000600000001000000003
      00000001000000000000000000FFFFFF1F2E02040108002420232C232E303000
      010022005B4942546974756C617265732E2245475245534F535F5452414E5350
      4F525445225D00000000FFFF0000000000020000000100000000050041726961
      6C0008000000020000000000010000000100020000000000FFFFFF0000000002
      0000000000000000005030000006004D656D6F383200020060000000C0010000
      60000000100000000300000001000000000000000000FFFFFF1F2E0200000000
      000100120045677265736F7320536572766963696F733A00000000FFFF000000
      00000200000001000000000500417269616C0008000000000000000000000000
      000100020000000000FFFFFF0000000002000000000000000000F83000000600
      4D656D6F3833000200C0000000C0010000600000001000000003000000010000
      00000000000000FFFFFF1F2E02040108002420232C232E303000010021005B49
      42546974756C617265732E2245475245534F535F534552564943494F53225D00
      000000FFFF00000000000200000001000000000500417269616C000800000002
      0000000000010000000100020000000000FFFFFF000000000200000000000000
      00008531000006004D656D6F383400020020010000C001000070000000100000
      000300000001000000000000000000FFFFFF1F2E02000000000001000E004567
      7265736F73204F74726F733A00000000FFFF0000000000020000000100000000
      0500417269616C0008000000000000000000000000000100020000000000FFFF
      FF00000000020000000000000000002932000006004D656D6F3835000200A001
      0000C001000060000000100000000300000001000000000000000000FFFFFF1F
      2E02040108002420232C232E30300001001D005B4942546974756C617265732E
      2245475245534F535F4F54524F53225D00000000FFFF00000000000200000001
      000000000500417269616C000800000002000000000001000000010002000000
      0000FFFFFF0000000002000000000000000000B832000006004D656D6F383600
      020060000000D001000060000000100000000300000001000000000000000000
      FFFFFF1F2E0200000000000100100045677265736F7320436F6E797567653A00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00005E33000006004D656D6F3837000200C0000000D001000060000000100000
      000300000001000000000000000000FFFFFF1F2E02040108002420232C232E30
      300001001F005B4942546974756C617265732E2245475245534F535F434F4E59
      554745225D00000000FFFF00000000000200000001000000000500417269616C
      0008000000020000000000010000000100020000000000FFFFFF000000000200
      0000000000000000F333000006004D656D6F383800020021010000D00100007C
      000000100000000300000001000000000000000000FFFFFF1F2E020000000000
      0100160045677265736F73204F74726F7320436F6E797567653A00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      000000000100020000000000FFFFFF00000000020000000000000000009F3400
      0006004D656D6F3839000200A0010000D0010000600000001000000003000000
      01000000000000000000FFFFFF1F2E02040108002420232C232E303000010025
      005B4942546974756C617265732E224F54524F535F45475245534F535F434F4E
      59554745225D00000000FFFF0000000000020000000100000000050041726961
      6C0008000000020000000000010000000100020000000000FFFFFF0000000002
      0000000000000000002C35000006004D656D6F393000020060000000E0010000
      60000000100000000300000001000000000000000000FFFFFF1F2E0200000000
      0001000E00546F74616C2041637469766F733A00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000000000000010002
      0000000000FFFFFF0000000002000000000000000000D035000006004D656D6F
      3931000200C0000000E001000060000000100000000300000001000000000000
      000000FFFFFF1F2E02040108002420232C232E30300001001D005B4942546974
      756C617265732E22544F54414C5F41435449564F53225D00000000FFFF000000
      00000200000001000000000500417269616C0008000000020000000000010000
      000100020000000000FFFFFF00000000020000000000000000005D3600000600
      4D656D6F393200020020010000E0010000600000001000000003000000010000
      00000000000000FFFFFF1F2E02000000000001000E00546F74616C2050617369
      766F733A00000000FFFF00000000000200000001000000000500417269616C00
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000000137000006004D656D6F393300020080010000E00100008000
      0000100000000300000001000000000000000000FFFFFF1F2E02040108002420
      232C232E30300001001D005B4942546974756C617265732E22544F54414C5F50
      415349564F53225D00000000FFFF000000000002000000010000000005004172
      69616C0008000000020000000000010000000100020000000000FFFFFF000000
      00020000000000000000001038000006004D656D6F39350002005C0000002902
      0000E8000000100000000300000001000000000000000000FFFFFF1F2E020000
      000000010090005B5B5452494D285B49425265666572656E636961732E224E4F
      4D4252455F5245464552454E434941225D2B2720272B5B49425265666572656E
      636961732E225052494D45525F4150454C4C49444F5F5245464552454E434941
      225D2B2720272B5B49425265666572656E636961732E22534547554E444F5F41
      50454C4C49444F5F5245464552454E434941225D295D5D00000000FFFF000000
      00000200000001000000000500417269616C0008000000020000000000000000
      000100020000000000FFFFFF0000000002000000000000000000A23800000600
      4D656D6F39360002004601000029020000640000001000000003000000010000
      00000000000000FFFFFF1F2E020000000000010013005469706F206465205265
      666572656E6369613A00000000FFFF0000000000020000000100000000050041
      7269616C0008000000000000000000000000000100020000000000FFFFFF0000
      0000020000000000000000004939000006004D656D6F3937000200AC01000029
      0200007A000000100000000300000001000000000000000000FFFFFF1F2E0200
      00000000010028005B49425265666572656E636961732E224445534352495043
      494F4E5F5245464552454E434941225D00000000FFFF00000000000200000001
      000000000500417269616C000800000002000000000000000000010002000000
      0000FFFFFF0000000002000000000000000000D339000006004D656D6F393800
      0200280200002902000040000000100000000300000001000000000000000000
      FFFFFF1F2E02000000000001000B00506172656E746573636F3A00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      000000000100020000000000FFFFFF00000000020000000000000000007A3A00
      0006004D656D6F393900020068020000290200008C0000001000000003000000
      01000000000000000000FFFFFF1F2E020000000000010028005B494252656665
      72656E636961732E224445534352495043494F4E5F504152454E544553434F22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000000000000100020000000000FFFFFF00000000020000000000
      00000000043B000007004D656D6F3130300002005C0000003602000038000000
      100000000300000001000000000000000000FFFFFF1F2E02000000000001000A
      0044697265636369F36E3A00000000FFFF000000000002000000010000000005
      00417269616C0008000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000AA3B000007004D656D6F3130310002009400
      00003602000093010000100000000300000001000000000000000000FFFFFF1F
      2E020000000000010026005B49425265666572656E636961732E224449524543
      43494F4E5F5245464552454E434941225D00000000FFFF000000000002000000
      01000000000500417269616C0008000000020000000000000000000100020000
      000000FFFFFF00000000020000000000000000004F3C000007004D656D6F3130
      3200020068020000360200008C00000010000000030000000100000000000000
      0000FFFFFF1F2E020000000000010025005B49425265666572656E636961732E
      2254454C45464F4E4F5F5245464552454E434941225D00000000FFFF00000000
      000200000001000000000500417269616C000800000002000000000000000000
      0100020000000000FFFFFF0000000002000000000000000000D83C000007004D
      656D6F3130330002002802000036020000400000001000000003000000010000
      00000000000000FFFFFF1F2E0200000000000100090054656CE9666F6E6F3A00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      0000B23E000007004D656D6F313034000200480000008F030000B20200002800
      00000300000001000000000000000000FFFFFF1F2E02000000000001005A0144
      65636C61726F28616D6F73292071756520636F6E6F63656D6F73207920616365
      7074616D6F73206C617320636F6E646963696F6E6573206465206D616E656A6F
      2064652065737461206D6F64616C696461642064652061686F72726F2E204175
      746F72697A616D6F732061205B454D50524553415D20706172613A2061292052
      65706F72746172206F20636F6E73756C746172206375616C717569657220696E
      666F726D616369F36E2072656C6163696F6E61646120636F6E206D6973286E75
      657374726173292061637469766964616465732066696E616E63696572617320
      656E206C61732063656E7472616C65732064652072696573676F2E2062292051
      756520656E206361736F206465206D75657274652C20656C2076616C6F722064
      65206C6F732061706F7274657320736F6369616C65732073656120656E747265
      6761646F2061206D69732062656E65666963696172696F732E00000000FFFF00
      000000000200000001000000000500417269616C000800000000000000000000
      0000000100020000000000FFFFFF0000000002000000000000000400013F0000
      05004C696E653200020048000000BB030000B202000000000000010008000200
      0000000000000000FFFFFF002E020000000000000000000000FFFF0000000000
      0200000001000000000000863F000007004D656D6F313035000200980000002F
      04000060000000100000000300000001000000000000000000FFFFFF1F2E0200
      00000000010005004669726D6100000000FFFF00000000000200000001000000
      000500417269616C0008000000000000000000020000000100020000000000FF
      FFFF0000000002000000000000000400D53F000005004C696E65330002004C00
      00002F040000F4000000000000000100080002000000000000000000FFFFFF00
      2E020000000000000000000000FFFF000000000002000000010000000000005A
      40000007004D656D6F313036000200F00100002F040000600000001000000003
      00000001000000000000000000FFFFFF1F2E020000000000010005004669726D
      6100000000FFFF00000000000200000001000000000500417269616C00080000
      00000000000000020000000100020000000000FFFFFF00000000020000000000
      00000400A940000005004C696E6534000200A40100002F040000F40000000000
      00000100080002000000000000000000FFFFFF002E0200000000000000000000
      00FFFF00000000000200000001000000000A0C00546672536861706556696577
      00001A410000060053686170653100020041010000BF030000600000006C0000
      000100000002000000000000000000FFFFFF1F2E02000000000001000F004855
      454C4C412044414354494C415200000000FFFF00000000000200000001000000
      00010A0C0054667253686170655669657700008B410000060053686170653200
      020099020000BF030000600000006C0000000100000002000000000000000000
      FFFFFF1F2E02000000000001000F004855454C4C412044414354494C41520000
      0000FFFF00000000000200000001000000000100001642000007004D656D6F31
      3037000200680000005F040000680000000C0000000300000001000000000000
      000000FFFFFF1F2E02000000000001000B0046756E63696F6E6172696F000000
      00FFFF00000000000200000001000000000500417269616C0007000000000000
      000000020000000100020000000000FFFFFF0000000002000000000000000000
      A342000007004D656D6F3130380002004800000053040000AC0000000C000000
      0300000001000000000000000000FFFFFF1F2E02000000000001000D005B4655
      4E43494F4E4152494F5D00000000FFFF00000000000200000001000000000500
      417269616C0007000000000000000000030000000100020000000000FFFFFF00
      000000020000000000000000003543000006004D656D6F323000020060000000
      93000000A4000000140000000300000001000000000000000000FFFFFF1F2E02
      000000000001001300494E464F524D4143494F4E2047454E4552414C00000000
      FFFF00000000000200000001000000000500417269616C000800000003000000
      0000020000000100020000000000FFFFFF0000000002000000000000000000C4
      43000006004D656D6F39340002004C0000000302000068000000140000000300
      000001000000000000000000FFFFFF1F2E020000000000010010004949492E20
      5245464552454E4349415300000000FFFF000000000002000000010000000005
      00417269616C0008000000030000000000000000000100020000000000FFFFFF
      00000000020000000000000004001344000005004C696E653100020048000000
      8D030000B2020000000000000100080002000000000000000000FFFFFF002E02
      0000000000000000000000FFFF00000000000200000001000000000000A24400
      0007004D656D6F31303900020048010000C00300005400000010000000030000
      0001000000000000000000FFFFFF1F2E02000000000001000F004855454C4C41
      2044414354494C415200000000FFFF0000000000020000000100000000050041
      7269616C0006000000000000000000020000000100020000000000FFFFFF0000
      0000020000000000000000003145000007004D656D6F313130000200A0020000
      C003000054000000100000000300000001000000000000000000FFFFFF1F2E02
      000000000001000F004855454C4C412044414354494C415200000000FFFF0000
      0000000200000001000000000500417269616C00060000000000000000000200
      00000100020000000000FFFFFF0000000002000000000000000000CA45000006
      004D656D6F36330002004800000038010000AC00000014000000030000000100
      0000000000000000FFFFFF1F2E02000000000001001A0049492E20494E464F52
      4D4143494F4E2046494E414E434945524100000000FFFF000000000002000000
      01000000000500417269616C0008000000030000000000000000000100020000
      000000FFFFFF00000000020000000000000000009846000006004D656D6F3634
      00020061000000610100009C0100001000000003000000010000000000000000
      00FFFFFF1F2E02000000000001004F004465636C61726F28616D6F7329207175
      65206C6F7320666F6E646F73206D616E656A61646F7320656E2065737461206D
      6F64616C696461642064652061686F72726F2070726F7669656E656E20646500
      000000FFFF00000000000200000001000000000500417269616C000800000000
      0000000000000000000100020000000000FFFFFF000000000200000000000000
      00002947000007004D656D6F31313100020049000000590200006C0000001200
      00000300000001000000000000000000FFFFFF1F2E0200000000000100110049
      562E2042454E45464943494152494F5300000000FFFF00000000000200000001
      000000000500417269616C000800000003000000000000000000010002000000
      0000FFFFFF00000000020000000000000000000948000007004D656D6F313132
      0002006500000082020000E80000001000000003000000010000000000000000
      00FFFFFF1F2E020000000000010060005B494262656E65666963696172696F2E
      224E4F4D425245225D205B494262656E65666963696172696F2E225052494D45
      525F4150454C4C49444F225D205B494262656E65666963696172696F2E225345
      47554E444F5F4150454C4C49444F225D00000000FFFF00000000000200000001
      000000000500417269616C000800000002000000000000000000010002000000
      0000FFFFFF00000000020000000000000000009448000007004D656D6F313133
      0002004E01000082020000400000001000000003000000010000000000000000
      00FFFFFF1F2E02000000000001000B00506172656E746573636F3A00000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      00000000000100020000000000FFFFFF00000000020000000000000000003D49
      000007004D656D6F31313400020090010000820200008C000000100000000300
      000001000000000000000000FFFFFF1F2E020000000000010029005B49426265
      6E65666963696172696F2E224445534352495043494F4E5F504152454E544553
      434F225D00000000FFFF00000000000200000001000000000500417269616C00
      08000000020000000000000000000100020000000000FFFFFF00000000020000
      00000000000000DB49000007004D656D6F313135000200310200008202000030
      000000100000000300000001000000000000000000FFFFFF1F2E020000000000
      01001E005B494262656E65666963696172696F2E22504F5243454E54414A4522
      5D2500000000FFFF00000000000200000001000000000500417269616C000800
      0000020000000000000000000100020000000000FFFFFF000000000200000000
      00000000007D4A000007004D656D6F31313700020049000000A5020000F80000
      00120000000300000001000000000000000000FFFFFF1F2E0200000000000100
      2200562E2042454E45464943494152494F20415558494C494F20504F52204D55
      4552544500000000FFFF00000000000200000001000000000500417269616C00
      08000000030000000000000000000100020000000000FFFFFF00000000020000
      000000000000004E4B000007004D656D6F31313800020060000000CE020000E8
      000000100000000300000001000000000000000000FFFFFF1F2E020000000000
      010051005B4942417578696C696F2E224E4F4D425245225D205B494241757869
      6C696F2E225052494D45525F4150454C4C49444F225D205B4942417578696C69
      6F2E22534547554E444F5F4150454C4C49444F225D00000000FFFF0000000000
      0200000001000000000500417269616C00080000000200000000000000000001
      00020000000000FFFFFF0000000002000000000000000000D94B000007004D65
      6D6F31313900020049010000CE02000040000000100000000300000001000000
      000000000000FFFFFF1F2E02000000000001000B00506172656E746573636F3A
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      0000007D4C000007004D656D6F3132300002008B010000CE0200008C00000010
      0000000300000001000000000000000000FFFFFF1F2E02000000000001002400
      5B4942417578696C696F2E224445534352495043494F4E5F504152454E544553
      434F225D00000000FFFF00000000000200000001000000000500417269616C00
      08000000020000000000000000000100020000000000FFFFFF00000000020000
      00000000000000064D000007004D656D6F313136000200AB020000AD00000038
      000000100000000300000001000000000000000000FFFFFF1F2E020000000000
      0100090045647563616369F36E00000000FFFF00000000000200000001000000
      000500417269616C0008000000000000000000000000000100020000000000FF
      FFFF0000000002000000000000000A0F00546672436865636B426F7856696577
      0000884D00000600436865636B31000200E7020000AE0000000C0000000C0000
      0001000F0002000000000000000000FFFFFF1F2E020000000000010019005B49
      42546974756C617265732E22454455434143494F4E225D00000000FFFF000000
      000002000000010000000001000000000000114E000007004D656D6F31323100
      02004A00000015000000DB000000180000000300000001000000000000000000
      FFFFFF1F2E020000000000010009005B454D50524553415D00000000FFFF0000
      0000000200000001000000000500417269616C000E0000000200000000000200
      00000100020000000000FFFFFF00000000020000000000000000009A4E000007
      004D656D6F3132320002004A0000002C000000DB000000100000000300000001
      000000000000000000FFFFFF1F2E020000000000010009004E69743A5B4E4954
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      000000000000000A0000000100020000000000FFFFFF00000000020000000000
      00000000464F000007004D656D6F3132330002004C000000F402000030010000
      120000000300000001000000000000000000FFFFFF1F2E02000000000001002C
      0056492E20494E464F524D4143494F4E20504552534F4E414C2059204C41424F
      52414C2041444943494F4E414C00000000FFFF00000000000200000001000000
      000500417269616C0008000000030000000000000000000100020000000000FF
      FFFF0000000002000000000000000000D74F000007004D656D6F313234000200
      4C0000001C03000060000000100000000300000001000000000000000000FFFF
      FF1F2E02000000000001001100506572736F6E6173206120436172676F3A0000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      00000000000000000100020000000000FFFFFF00000000020000000000000000
      007A50000007004D656D6F313235000200B00000001C0300001C000000100000
      000300000001000000000000000000FFFFFF1F2E020000000000010023005B49
      425141646963696F6E616C65732E22504552534F4E41535F415F434152474F22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000000000000100020000000000FFFFFF00000000020000000000
      000000000D51000007004D656D6F313236000200D00000001C03000068000000
      100000000300000001000000000000000000FFFFFF1F2E020000000000010013
      004F637570616369F36E205072696E636970616C00000000FFFF000000000002
      00000001000000000500417269616C0008000000000000000000000000000100
      020000000000FFFFFF0000000002000000000000000000A951000007004D656D
      6F3132370002003C0100001C0300007C00000010000000030000000100000000
      0000000000FFFFFF1F2E02000000000001001C005B49425141646963696F6E61
      6C65732E224F4355504143494F4E225D00000000FFFF00000000000200000001
      000000000500417269616C000800000002000000000000000000010002000000
      0000FFFFFF00000000020000000000000000002E52000007004D656D6F313330
      000200BA0100001C0300001C0000001000000003000000010000000000000000
      00FFFFFF1F2E02000000000001000500434949553A00000000FFFF0000000000
      0200000001000000000500417269616C00080000000000000000000000000001
      00020000000000FFFFFF0000000002000000000000000000D152000007004D65
      6D6F313331000200D90100001C03000020010000100000000300000001000000
      000000000000FFFFFF1F2E020000000000010023005B49425141646963696F6E
      616C65732E224445534352495043494F4E5F43494955225D00000000FFFF0000
      0000000200000001000000000500417269616C00080000000200000000000000
      00000100020000000000FFFFFF00000000020000000000000000005F53000007
      004D656D6F3133320002004C0000002C03000048000000100000000300000001
      000000000000000000FFFFFF1F2E02000000000001000E005469706F20436F6E
      747261746F3A00000000FFFF0000000000020000000100000000050041726961
      6C0008000000000000000000000000000100020000000000FFFFFF0000000002
      000000000000000000FA53000007004D656D6F313333000200980000002C0300
      0094000000100000000300000001000000000000000000FFFFFF1F2E02000000
      000001001B005B49425141646963696F6E616C65732E22434F4E545241544F22
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      00020000000000000000000100020000000000FFFFFF00000000020000000000
      000000009C54000007004D656D6F313334000200400100002C030000B4000000
      100000000300000001000000000000000000FFFFFF1F2E020000000000010022
      00536563746F7220456D70726573617269616C20496E646570656E6469656E74
      65733A00000000FFFF00000000000200000001000000000500417269616C0008
      000000000000000000000000000100020000000000FFFFFF0000000002000000
      0000000000003555000007004D656D6F313335000200F40100002C030000A400
      0000100000000300000001000000000000000000FFFFFF1F2E02000000000001
      0019005B49425141646963696F6E616C65732E22534543544F52225D00000000
      FFFF00000000000200000001000000000500417269616C000800000002000000
      0000000000000100020000000000FFFFFF0000000002000000000000000000C3
      55000007004D656D6F3133360002009C0200002C0300004C0000001000000003
      00000001000000000000000000FFFFFF1F2E02000000000001000E004465636C
      6172612052656E74613A00000000FFFF00000000000200000001000000000500
      417269616C0008000000000000000000000000000100020000000000FFFFFF00
      00000002000000000000000A0F00546672436865636B426F785669657700004C
      5600000600436865636B32000200E80200002C03000010000000100000000100
      0F0002000000000000000000FFFFFF1F2E020000000000010020005B49425141
      646963696F6E616C65732E224445434C4152415F52454E5441225D00000000FF
      FF00000000000200000001000000000100000000FEFEFF0B0000000A00204765
      6E6572616C65730000000006004355454E5441000F00273230312D3030323633
      30352D3827000D0046454348414150455254555241000A00323030342F30312F
      3031000600434955444144000D00274255434152414D414E474127000A005449
      504F4355454E5441000C0027496E646976696475616C270006004649524D4153
      0001003100060053454C4C4F5300010031000E0050524F544543544F47524146
      4F5300010031000700454D5052455341000000000B0046554E43494F4E415249
      4F0000000003004E4954000F00273030302E3030302E3030302D302700000000
      0000000000FC00002F00464F524D554C4152494F204445204150455254555241
      20592041435455414C495A4143494F4E204445204441544F530E00414C455841
      4E444552204352555A01003101003101003001003000004D00E54F558615AAE2
      40372205240F32E440}
  end
  object IBTitulares: TIBQuery
    SQL.Strings = (
      
        'select * from "gen$persona" where ID_IDENTIFICACION = :ID_IDENTI' +
        'FICACION and ID_PERSONA')
    Left = 528
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end>
  end
  object cdsEstadoCivil: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ESCI_ID'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESCI_DESCRIPCION'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 376
    Top = 88
    Data = {
      5B0000009619E0BD0100000018000000020000000000030000005B0007455343
      495F4944010049000000010005574944544802000200010010455343495F4445
      534352495043494F4E010049000000010005574944544802000200C8000000}
  end
  object reportPersonas: TprTxReport
    Values = <>
    Variables = <>
    Left = 600
    Top = 456
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 2'
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
      ColNum = 280
      object prTxHDetailHeaderBand1: TprTxHDetailHeaderBand
        Height = 2
        UseVerticalBands = False
        DetailBand = reportPersonas.prTxHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TIPO DOCUMENTO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
              TxFontStyleEx = tfsNormal
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 20
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DOCUMENTO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvCenter
              DefaultFont = False
              WordWrap = False
              TxFontStyleEx = tfsNormal
            end>
          dRec.Left = 21
          dRec.Top = 0
          dRec.Right = 33
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NOMBRE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontStyleEx = tfsNormal
            end>
          dRec.Left = 34
          dRec.Top = 0
          dRec.Right = 64
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'PRIMER APELLIDO')
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
          dRec.Right = 85
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SEGUNDO APELLIDO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 86
          dRec.Top = 0
          dRec.Right = 106
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DIRECCION')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 107
          dRec.Top = 0
          dRec.Right = 160
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'BARRIO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 161
          dRec.Top = 0
          dRec.Right = 183
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TELEFONO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 184
          dRec.Top = 0
          dRec.Right = 199
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'MUNICIPIO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 200
          dRec.Top = 0
          dRec.Right = 220
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DPTO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 221
          dRec.Top = 0
          dRec.Right = 245
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'EMAIL')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 246
          dRec.Top = 0
          dRec.Right = 280
          dRec.Bottom = 1
          Visible = False
        end
        object prTxHLineObj1: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 280
          dRec.Bottom = 2
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'IBQReporte'
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prTxHDetailHeaderBand1'
          'prTxHDetailFooterBand1')
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.DESCRIPCION_IDENTIFICACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 20
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.ID_PERSONA]')
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
          dRec.Top = 0
          dRec.Right = 33
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.NOMBRE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 34
          dRec.Top = 0
          dRec.Right = 64
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.PRIMER_APELLIDO]')
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
          dRec.Right = 85
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.SEGUNDO_APELLIDO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 86
          dRec.Top = 0
          dRec.Right = 106
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.DIRECCION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 107
          dRec.Top = 0
          dRec.Right = 160
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.BARRIO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 161
          dRec.Top = 0
          dRec.Right = 183
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.TELEFONO1]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 184
          dRec.Top = 0
          dRec.Right = 199
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.NOMBRE1]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 200
          dRec.Top = 0
          dRec.Right = 220
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.DPTO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 221
          dRec.Top = 0
          dRec.Right = 245
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[IBQReporte.EMAIL]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 246
          dRec.Top = 0
          dRec.Right = 280
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj1: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 20
          dRec.Top = 0
          dRec.Right = 21
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj2: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 33
          dRec.Top = 0
          dRec.Right = 34
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj3: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 64
          dRec.Top = 0
          dRec.Right = 65
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj4: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 85
          dRec.Top = 0
          dRec.Right = 86
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj5: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 106
          dRec.Top = 0
          dRec.Right = 107
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj6: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 160
          dRec.Top = 0
          dRec.Right = 161
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj7: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 183
          dRec.Top = 0
          dRec.Right = 184
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj8: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 199
          dRec.Top = 0
          dRec.Right = 200
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj9: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 220
          dRec.Top = 0
          dRec.Right = 221
          dRec.Bottom = 1
          Visible = False
        end
        object prTxVLineObj10: TprTxVLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 245
          dRec.Top = 0
          dRec.Right = 246
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHDetailFooterBand1: TprTxHDetailFooterBand
        Height = 1
        UseVerticalBands = False
        DetailBand = reportPersonas.prTxHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        LinkToDetail = False
      end
    end
  end
  object IBQReporte: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  t.DESCRIPCION_IDENTIFICACION,'
      '  p.ID_PERSONA,'
      '  p.NOMBRE,'
      '  p.PRIMER_APELLIDO,'
      '  p.SEGUNDO_APELLIDO,'
      '  p.EMAIL,'
      '  d.DIRECCION,'
      '  d.BARRIO,'
      '  d.TELEFONO1,'
      '  m.DPTO,'
      '  m.NOMBRE'
      'FROM'
      ' "gen$persona" p'
      
        ' INNER JOIN "gen$tiposidentificacion" t ON (p.ID_IDENTIFICACION=' +
        't.ID_IDENTIFICACION)'
      
        ' LEFT JOIN "gen$direccion" d ON (p.ID_IDENTIFICACION=d.ID_IDENTI' +
        'FICACION)'
      '  AND (p.ID_PERSONA=d.ID_PERSONA) AND (d.ID_DIRECCION = 1)'
      
        'LEFT JOIN "gen$municipios" m ON (d.COD_MUNICIPIO=m.COD_MUNICIPIO' +
        ')')
    Left = 536
    Top = 456
  end
end
