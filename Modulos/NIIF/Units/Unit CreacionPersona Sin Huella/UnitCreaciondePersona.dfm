object frmCreacionPersona: TfrmCreacionPersona
  Left = 90
  Top = 20
  Width = 665
  Height = 543
  Caption = 'Creaci'#243'n de Persona'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 248
    Width = 657
    Height = 228
    Align = alBottom
    TabOrder = 1
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 655
      Height = 226
      ActivePage = InfoImagenes
      Align = alClient
      Images = Images
      TabIndex = 5
      TabOrder = 0
      object InfoConyuge: TTabSheet
        Caption = '1. Informaci'#243'n del Conyuge'
        OnEnter = InfoConyugeEnter
        OnExit = InfoConyugeExit
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
        OnEnter = InfoLaboralEnter
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 241
          Height = 187
          Caption = 'Profesi'#243'n u Oficio'
          TabOrder = 0
          object Label17: TLabel
            Left = 5
            Top = 98
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha de Ingreso'
          end
          object Label36: TLabel
            Left = 6
            Top = 140
            Width = 62
            Height = 13
            Caption = 'Total Activos'
          end
          object Label37: TLabel
            Left = 6
            Top = 162
            Width = 64
            Height = 13
            Caption = 'Total Pasivos'
          end
          object EdProfesion: TLabeledEdit
            Left = 52
            Top = 22
            Width = 183
            Height = 21
            CharCase = ecUpperCase
            EditLabel.Width = 44
            EditLabel.Height = 13
            EditLabel.Caption = 'Profesi'#243'n'
            LabelPosition = lpLeft
            LabelSpacing = 3
            TabOrder = 0
            OnEnter = EdProfesionEnter
            OnExit = EdProfesionExit
          end
          object EdEmpresa: TLabeledEdit
            Left = 52
            Top = 46
            Width = 183
            Height = 21
            CharCase = ecUpperCase
            EditLabel.Width = 41
            EditLabel.Height = 13
            EditLabel.Caption = 'Empresa'
            LabelPosition = lpLeft
            LabelSpacing = 3
            TabOrder = 1
            OnEnter = EdEmpresaEnter
            OnExit = EdEmpresaExit
          end
          object EdCargo: TLabeledEdit
            Left = 52
            Top = 70
            Width = 183
            Height = 21
            CharCase = ecUpperCase
            EditLabel.Width = 28
            EditLabel.Height = 13
            EditLabel.Caption = 'Cargo'
            LabelPosition = lpLeft
            LabelSpacing = 3
            TabOrder = 2
            OnEnter = EdCargoEnter
            OnExit = EdCargoExit
          end
          object EdRetefuente: TCheckBox
            Left = 4
            Top = 118
            Width = 169
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Aplica Retenci'#243'n en la Fuente'
            Checked = True
            State = cbChecked
            TabOrder = 4
            OnEnter = EdRetefuenteEnter
            OnExit = EdRetefuenteExit
          end
          object EdTotalActivos: TMemo
            Left = 94
            Top = 138
            Width = 139
            Height = 21
            Alignment = taRightJustify
            TabOrder = 5
            WantReturns = False
            WordWrap = False
            OnEnter = EdTotalActivosEnter
            OnExit = EdTotalActivosExit
            OnKeyPress = EdEgresosArriendoKeyPress
          end
          object EdTotalPasivos: TMemo
            Left = 94
            Top = 160
            Width = 139
            Height = 21
            Alignment = taRightJustify
            TabOrder = 6
            WantReturns = False
            WordWrap = False
            OnEnter = EdTotalPasivosEnter
            OnExit = EdTotalPasivosExit
            OnKeyPress = EdEgresosArriendoKeyPress
          end
          object EdFechaIngreso: TDateTimePicker
            Left = 92
            Top = 94
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
            TabOrder = 3
            OnEnter = EdFechaIngresoEnter
            OnExit = EdFechaIngresoExit
          end
        end
        object GroupBox5: TGroupBox
          Left = 242
          Top = 0
          Width = 389
          Height = 187
          Caption = 'Ingresos / Egresos'
          TabOrder = 1
          object GroupBox6: TGroupBox
            Left = 6
            Top = 102
            Width = 381
            Height = 84
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
          end
          object GroupBox7: TGroupBox
            Left = 6
            Top = 14
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
            object EdDescripcionIngresosConyuge: TMemo
              Left = 150
              Top = 62
              Width = 227
              Height = 23
              TabOrder = 3
              WantReturns = False
              WordWrap = False
              OnEnter = EdDescripcionIngresosConyugeEnter
              OnExit = EdDescripcionIngresosConyugeExit
            end
          end
        end
      end
      object InfoDirecciones: TTabSheet
        Caption = '3. Direcciones de Ubicaci'#243'n'
        ImageIndex = 2
        OnEnter = InfoDireccionesEnter
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
        object EdMunicipio: TEdit
          Left = 124
          Top = 138
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 5
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
      end
      object InfoReferencias: TTabSheet
        Caption = '4. Informaci'#243'n Referencias'
        ImageIndex = 3
        OnEnter = InfoReferenciasEnter
        object Label43: TLabel
          Left = 16
          Top = 84
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
        object Label32: TLabel
          Left = 284
          Top = 124
          Width = 45
          Height = 13
          Caption = 'Direcci'#243'n'
        end
        object Label33: TLabel
          Left = 534
          Top = 124
          Width = 42
          Height = 13
          Caption = 'Tel'#233'fono'
        end
        object Label35: TLabel
          Left = 36
          Top = 124
          Width = 54
          Height = 13
          Caption = 'Parentesco'
        end
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
          TabOrder = 7
          OnSelectCell = GridReferenciaSelectCell
          ColWidths = (
            64
            64
            64
            64
            64
            64)
        end
        object Panel5: TPanel
          Left = 534
          Top = 0
          Width = 97
          Height = 117
          Color = clOlive
          TabOrder = 8
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
        object CBtiporeferencia: TDBLookupComboBox
          Left = 4
          Top = 100
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
        end
        object EdPrimerApellidoRef: TLabeledEdit
          Left = 150
          Top = 100
          Width = 119
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
          Left = 272
          Top = 100
          Width = 119
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
          Left = 394
          Top = 100
          Width = 139
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
        object EdDireccionRef: TEdit
          Left = 150
          Top = 138
          Width = 333
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 5
        end
        object EdTelefonoRef: TMemo
          Left = 490
          Top = 138
          Width = 131
          Height = 21
          Alignment = taRightJustify
          TabOrder = 6
          WantReturns = False
          WordWrap = False
          OnExit = EdTelefonoRefExit
          OnKeyPress = EdTelefonoRefKeyPress
        end
        object CBparentesco: TDBLookupComboBox
          Left = 4
          Top = 138
          Width = 143
          Height = 21
          KeyField = 'ID_PARENTESCO'
          ListField = 'DESCRIPCION_PARENTESCO'
          ListSource = dmPersona.DSparentesco
          TabOrder = 4
          OnEnter = CBparentescoEnter
        end
      end
      object InfoApoderado: TTabSheet
        Caption = '5. Informaci'#243'n del Apoderado'
        ImageIndex = 4
        OnEnter = InfoApoderadoEnter
        OnExit = InfoApoderadoExit
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
        Caption = '6. Imagenes'
        ImageIndex = 5
        OnEnter = InfoImagenesEnter
        OnExit = InfoImagenesExit
        object CmdFirma: TBitBtn
          Left = 334
          Top = 160
          Width = 95
          Height = 25
          Caption = 'Tomar Firma'
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
          object GIIEPad1: TGIIEPad
            Left = 0
            Top = 0
            Width = 32
            Height = 32
            OnPadData = GIIEPad1PadData
            ControlData = {00000100A70100008D01000000000000}
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 10
          Width = 283
          Height = 145
          TabOrder = 2
          object ImgFotoC: TImage
            Left = 2
            Top = 4
            Width = 135
            Height = 135
            Stretch = True
          end
          object ImgHuellaC: TImage
            Left = 140
            Top = 4
            Width = 135
            Height = 135
            Stretch = True
          end
        end
        object CmdTomarFoto: TBitBtn
          Left = 30
          Top = 160
          Width = 89
          Height = 25
          Caption = 'Tomar Foto'
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
          Left = 160
          Top = 160
          Width = 89
          Height = 25
          Caption = 'Tomar Huella'
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
  end
  object Panel4: TPanel
    Left = 0
    Top = 476
    Width = 657
    Height = 33
    Align = alBottom
    Color = clOlive
    TabOrder = 2
    object CmdGrabar: TBitBtn
      Left = 486
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Grabar'
      TabOrder = 0
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
      TabOrder = 2
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
      Enabled = False
      TabOrder = 3
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
      Width = 277
      Height = 19
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clWhite
      ParentColor = False
      TabOrder = 4
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 657
    Height = 247
    ActivePage = InfoNatural
    TabIndex = 0
    TabOrder = 0
    object InfoNatural: TTabSheet
      Caption = 'Persona Natural'
      object Panel6: TPanel
        Left = 2
        Top = 4
        Width = 646
        Height = 213
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
          Width = 24
          Height = 13
          Caption = 'Sexo'
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
          Left = 386
          Top = 169
          Width = 81
          Height = 13
          Caption = 'Tipo de Afiliaci'#243'n'
        end
        object Label46: TLabel
          Left = 536
          Top = 169
          Width = 75
          Height = 13
          Caption = 'Fecha Afiliaci'#243'n'
        end
        object Label47: TLabel
          Left = 4
          Top = 169
          Width = 17
          Height = 13
          Caption = 'Ciiu'
        end
        object Label48: TLabel
          Left = 566
          Top = 95
          Width = 51
          Height = 13
          Caption = 'Educaci'#243'n'
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
            Top = 52
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
            Top = 52
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
            Top = 65
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
            Top = 64
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
          KeyField = 'ID_TIPO_PERSONA'
          ListField = 'DESCRIPCION_PERSONA'
          ListSource = dmPersona.DStipopersona
          TabOrder = 4
          OnEnter = CBtipopersonaEnter
          OnExit = CBtipopersonaExit
        end
        object CBSexo: TDBComboBox
          Left = 164
          Top = 109
          Width = 145
          Height = 21
          AutoDropDown = True
          CharCase = ecUpperCase
          ItemHeight = 13
          Items.Strings = (
            'FEMENINO'
            'MASCULINO'
            'NINGUNO')
          TabOrder = 5
          OnEnter = CBsexoEnter
          OnExit = CBsexoExit
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
          Left = 384
          Top = 183
          Width = 145
          Height = 21
          KeyField = 'ID_TIPO_RELACION'
          ListField = 'DESCRIPCION_RELACION'
          ListSource = dmPersona.DStiposrelacion
          TabOrder = 14
          OnEnter = CBtiposrelacionEnter
          OnExit = CBtiposrelacionExit
        end
        object EdFechaAfiliacion: TDateTimePicker
          Left = 534
          Top = 183
          Width = 102
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
          TabOrder = 15
          TabStop = False
          OnExit = EdFechaAfiliacionExit
        end
        object CBciiu: TDBLookupComboBox
          Left = 4
          Top = 183
          Width = 375
          Height = 21
          KeyField = 'ID_CIIU'
          ListField = 'DESCRIPCION_CIIU'
          ListSource = dmPersona.DStiposciiu
          TabOrder = 13
          OnEnter = CBciiuEnter
          OnExit = CBciiuExit
        end
        object EdEstudio: TCheckBox
          Left = 584
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
      end
    end
    object InfoJuridica: TTabSheet
      Caption = 'Persona Jur'#237'dica'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
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
        object Label5: TLabel
          Left = 168
          Top = 135
          Width = 17
          Height = 13
          Caption = 'Ciiu'
        end
        object Label8: TLabel
          Left = 365
          Top = 133
          Width = 96
          Height = 13
          Caption = 'Numero de Escritura'
        end
        object Label51: TLabel
          Left = 505
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
          TabOrder = 1
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
          TabOrder = 2
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
          TabOrder = 3
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
          TabOrder = 4
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
          TabOrder = 5
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
          TabOrder = 6
          OnEnter = CBTipoPersonaJurEnter
          OnExit = CBTipoPersonaJurExit
        end
        object CBciiuJur: TDBLookupComboBox
          Left = 168
          Top = 147
          Width = 190
          Height = 21
          KeyField = 'ID_CIIU'
          ListField = 'DESCRIPCION_CIIU'
          ListSource = dmPersona.DStiposciiu
          TabOrder = 7
          OnEnter = CBciiuJurEnter
          OnExit = CBciiuJurExit
        end
        object EdNumeroEscritura: TEdit
          Left = 365
          Top = 147
          Width = 132
          Height = 21
          TabOrder = 8
          OnEnter = EdNumeroEscrituraEnter
          OnExit = EdNumeroEscrituraExit
          OnKeyPress = EdNumeroEscrituraKeyPress
        end
        object EdCapitalSocial: TEdit
          Left = 505
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
      end
    end
  end
  object Images: TImageList
    Left = 620
    Top = 232
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000080000000800000FFFFFF000080
      0000FFFFFF00FFFFFF0000800000FFFFFF00FFFFFF0000800000FFFFFF000080
      0000FFFFFF00FFFFFF0000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF00FFF7EF00FFEF
      E700FFEFE700FFEFE700F7E7D600F7E7D600F7E7D600F7E7D600F7D6A500F7D6
      A500F7D6A500F7D6A500F7D6A5008C5A5A000000000052525200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0052525200000000000080000000800000FFFFFF000080
      0000FFFFFF00FFFFFF0000800000FFFFFF00FFFFFF0000800000FFFFFF000080
      0000FFFFFF00FFFFFF0000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00299C29001084100031A5
      310039AD390039AD390031942900217318005A524200FFEFE700F7E7CE00F7E7
      C600F7E7C600F7D6A500F7D6A5008C5A5A00000000005A5A5A00F7F7F7009C5A
      2900A5633900B5732900B5732900B5732900B5732900A5633900A56339009C5A
      29009C5A2900F7F7F7005A5A5A00000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF00299C29006BCE
      6B006BC66B00F7FFEF0063C6630063CE630031A53100FFEFE700FFEFE700FFEF
      DE00F7E7D600F7E7C600F7D6A5008C5A5A000000000063636300F7F7F700BD7B
      4A00B5732900BD7B4A00BD7B4A00BD7B4A00BD7B4A00B5732900A56339009C5A
      2900DE9C7300F7F7F7006363630000000000FFFFFF00FFFFFF00FFFFFF000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      000000800000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF00299C290073CE
      730052A54A00FFFFFF006BC66B0073CE7300319C3100FFF7EF00FFEFE700FFEF
      E700F7E7D600F7E7CE00F7D6A5008C5A5A0000000000636B6B00EFEFEF00F7E7
      D600E7A57300E7944A0094736B005A6B7300AD7B5A00BD7B4A00B5732900DE9C
      7300EFEFEF00EFEFEF00636B6B0000000000FFFFFF00FFFFFF00FFFFFF000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      000000800000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF00FFFFFF001873
      4A003984AD00217BBD0063BD6300399C3900FFF7EF00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00F7E7D6009C6B6300000000006B737300EFEFEF00FFFF
      FF00FFF7F700BDADA5006B848C004A6B9C006B6B8C00B5946B00E7CEB500FFF7
      F700FFFFFF00EFEFEF006B73730000000000FFFFFF00FFFFFF00FFFFFF000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      000000800000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF00FFFFFF00399C
      FF00399CFF00399CFF00298CE700FFF7F700EFE7D600FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500EFE7D6009C6B6300005A000073737300E7E7E700FFFF
      FF00D6DEDE006B6B8C004A6B9C007B94C6007B94C6008CB5C600FFFFFF00FFFF
      FF00FFFFFF00E7E7E7007373730000000000FFFFFF00FFFFFF00FFFFFF000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      000000800000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF0063849C0042A5
      FF0042A5FF0042A5FF00399CF7009CC6DE00FFF7F700FFF7F700FFF7EF00FFF7
      EF00FFF7EF00FFEFE700F7E7D6009C6B630000730800005A0000E7E7E700F7F7
      F700ADB5CE007B94C6007B94C6008CB5C6007B94C6007B94C600E7E7E700FFFF
      FF00FFFFFF00E7E7E7007B7B7B00000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF006BA5C6004AB5
      FF0052B5FF0052BDFF004AADFF006BA5C600FFF7F700FFF7F700FFF7F700FFF7
      EF00FFF7EF00FFF7EF00FFEFE700A57B73000073080000730800005A0000FFFF
      FF00CECEDE00739CAD00949C9C00ADCEE700ADB5CE00293184006B6B8C00FFFF
      FF00FFFFFF00E7E7E7009C848400000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF0063849C004A94
      C6006BADD60063ADF7006BA5C600FFFFFF00FFFFFF00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00FFEFE700A57B730008841000008C0800008C0800FFFF
      FF00E7E7E700ADCEE700ADB5CE007B94C600394A940000007B00394A9400FFFF
      FF00FFFFFF00DEDEDE008C8C8C0000000000FFFFFF0000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000800000008000000080
      0000008000000080000000800000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF0063849C006BAD
      D6008CBDE70073BDE70063849C00EFE7D600FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500EFE7D600A57B7300008C0800008C0800DEDEDE00FFFF
      FF00ADB5CE003139BD003139BD000008A5000008A5000008A5007B94C600FFFF
      FF00FFFFFF00DEDEDE008C8C8C0000000000FFFFFF00FFFFFF00008000000080
      00000080000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF00FFFFFF006BA5
      BD004A94B5004A8CAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700B5847300008C08008C8C8C00DEDEDE00FFFF
      FF00CEDEEF003139BD000008A5000008A5000008A5003139BD00EFEFEF00FFFF
      FF00FFFFFF00DEDEDE008C8C8C0000000000FFFFFF00FFFFFF00FFFFFF000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
      000000800000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00B5847300000000008C8C8C00DEDEDE00FFFF
      FF00FFFFFF00ADB5CE003139BD000010E7003139BD00ADB5CE00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00AD8C8C0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00000000000000000094949400DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0094949400000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      9400949494009494940094949400000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002D2D2D0058534E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4949004A4949004A4949004A4949004A4949004A4949004A4949004A49
      4900000000000000000000000000000000000000000000000000000000000000
      0000AD7B6B00AD7B6B00AD7B6B00AD7B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400A5A5A500424242000000000000000000000000000000
      000058534E004544420051606100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A49
      49008E8F8F00ADABAB00B9B1AD005164810051648100B9B1AC00ABA8A8009493
      930047484800000000000000000000000000000000000000000000000000AD7B
      6B00DEA57B00EFC69400E7C6A500DEB58C00AD7B6B00AD7B6B00AD7B6B00AD7B
      6B00000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400ADADAD005A5A5A00C6C6C600000000000000000010841000189C
      18006BC66B0054777B00477AA90018556F008A5B5200299C29005A524200736B
      5A0000000000000000000000000000000000000000000000000046464600BEBA
      BA00C8C7C700C5C0BD006B7B9A0000689B0000689B006B7B9A00DDD9D600BDBC
      BC00B3AFAF004748480000000000000000000000000000000000AD7B6B00DEB5
      8C00EFB57B00EFC69C00EFD6B500EFCEA500C69C73007B4A4A008C525200AD7B
      6B00AD7B6B00AD7B6B0000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400BDBDBD006B6B6B00C6C6C60084848400000000000000000021A5210031AD
      31006BC66B0054777B0041749600947E7500C17135008A5B5200299C29004A42
      29000000000000000000000000000000000000000000797A7A0097959500C0C0
      C000DDDAD8006B7B9A0000ACE80000AFE20000AFE200009FDB006B7B9A00DCDA
      D900A9A6A600969595004A4949000000000000000000AD7B6B00E7BD9400EFC6
      8C00EFB57B00EFC6A500F7E7CE00F7D6AD00C69C84007B4A4A007B4A4A00CEA5
      7B00EFBD8C00D6A58400AD7B6B00000000000000000000000000C6ADA500FFEF
      E700AD6B5A00AD6B5A00AD6B5A009C9C9C009C9C9C009C9C9C009C9C9C00AD6B
      5A006B6B6B00181818006B6B6B00524A4A000000000000000000299C29004ABD
      4A006BCE6B006BC66B007C707800F1BC8600F0A85C00C07638008A5B5200299C
      29000000000000000000000000000000000000000000797A7A00ADAAAA00BDBB
      BB00FCFFFF006B7B9A006B7B9A0000689B0000689B0000AFE2006D7E9D00E9E5
      E100BEBDBD00AEABAB004A49490000000000AD7B6B00F7CE9C00F7D69400EFC6
      8C00EFB57B00F7CEAD00FFEFDE00FFE7C600CEA58C007B4A4A007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B00000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00BDBDBD004A4A4A00524A4A004A4A4A0052525200A5A5
      A500393939006B6B6B00BDBDBD00000000000000000000000000000000004ABD
      4A0073CE730052A54A00AD7B7300FBD3A900F9C48D00EFA65A00C07638008A5B
      52000000000000000000000000000000000000000000797A7A00A9A7A700C9C9
      C900EAEAE900D3E0EA006B7B9A0000AFE20000AFE20000A1D900D4D6E100E8EA
      E900BCBBBB00ABA8A8004A49490000000000AD7B6B00F7D69C00F7D69400F7C6
      8C00F7B57300F7CEAD00FFF7EF00FFEFDE00CEAD9C00734242007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B00000000000000000000000000CEB5AD00FFFF
      F700AD6B5A0094949C0042393900AD6B5A00AD6B5A00AD6B5A00AD6B5A004239
      39006B6B6B00DEDED600B5848400000000000000000000000000000000000000
      000018734A003984AD00217BBD00AD7B7300FBD3A900F9C48D00F0A85C00C171
      35008A5B520000000000000000000000000000000000797A7A00B1AEAE00BBBA
      BA00F6F5F3006B7B9A0000AFE20000A6D90000689B006B7B9A006B7B9A00EBE7
      E400AFADAD00ADACAC004A49490000000000AD7B6B00F7D69C00FFD69400E7BD
      9400B5A59400F7CEAD00FFFFF700FFF7EF00DEC6B50094635A0084524A00CEA5
      8400EFBD8C00DEB58400AD7B6B00000000000000000000000000D6B5AD00FFFF
      FF00A5A59C0042393900B5847300AD6B5A00AD6B5A00AD6B5A00AD6B5A00B584
      730042393900C6C6C600B5848400000000000000000000000000000000000000
      0000187BC600218CE700298CE700218CE700AD7B7300FBD3A900F8C28C00EDA7
      5F00B56D3E008A5B520000000000000000000000000000000000797A7A00ADA9
      A900DBD9D700C3C5D2006B7B9A0000AADD0000AFE20000ACE8006B7B9A00CECD
      CC00ACA9A9004A4949000000000000000000AD7B6B00FFD69400D6CEA50052A5
      E7002184F70084ADDE00FFFFEF00FFF7EF00FFF7E700F7E7CE00E7C6A500E7C6
      9C00E7BD9400DEB58400AD7B6B00000000000000000000000000D6BDB500A5A5
      9C006B6B6B00C6B59400FFE7D600EFC6AD00F7D6AD00F7D6AD00E7C69C00F7E7
      CE009C8C730042393900B584840000000000000000000000000000000000297B
      AD00399CFF00399CFF00399CFF00399CFF00298CE700AD7B7300FBD3A9009891
      A20035A8F5000316AC0000009A00000000000000000000000000797A7A00AFAE
      AE00C5C3C300E8E5E1006B7B9A0000689B0000689B006B7B9A00DBD8D500AAA5
      A500B2B1B1004A4949000000000000000000AD7B6B009CC6C60042B5FF0031AD
      FF00319CFF001884FF0084BDF700FFFFEF00FFF7EF00FFEFDE00F7E7CE00EFD6
      B500EFC69C00DEB58C00A57B7B00000000000000000000000000D6BDB500A5A5
      9C006B6B6B00D6BDA500AD6B5A00AD6B5A00AD6B5A00AD6B5A00AD6B5A00AD6B
      5A00AD9C8C0042393900B5848400000000000000000000000000000000002184
      C60042A5FF0042A5FF0042A5FF0042A5FF00399CF700315A6B00AD7B73004A9E
      ED001029D6001029D6000316AC0000009A00000000000000000000000000797A
      7A0097949400A6A2A200CFC7C3004C5C79004C5D7900C8C1BC00BBB7B7009493
      93004A494900000000000000000000000000429CF70042A5FF0042ADFF0042B5
      FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFF7EF00FFEFDE00FFE7
      C600DEC6B500948C94009C7B8400000000000000000000000000DEBDB500A5A5
      9C006B6B6B00C6BDA500B5847300B5847300AD6B5A00AD6B5A00AD6B5A00AD6B
      5A00A5947B0042393900B58484000000000000000000000000006BA5C60042A5
      F7004AB5FF0052B5FF0052BDFF0052B5FF004AADFF0039739400000000000018
      C6006D8AFD00106BFF001029D600000000000000000000000000000000000000
      0000797A7A00797A7A006A6A6A00716E6B00726F6B006A6A6A00474747004A49
      49000000000000000000000000000000000000000000429CFF0042A5FF0042AD
      FF0042B5FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFFFEF00D6D6
      D600737BAD007B73940000000000000000000000000000000000DEC6B500FFFF
      FF00A5A59C006B6B6B00FFD6AD00FFE7D600F7FFFF00FFFFF700FFDED600FFD6
      B50042393900A5A5A500B58484000000000000000000000000005294BD0042A5
      EF005ABDFF005ABDFF0052B5F7004AB5EF0052B5F70039738C00000000000000
      00000018C6000018C60000000000000000000000000000000000000000000000
      000000000000000000007979790069676700696969007D7C7C00000000000000
      0000000000000000000000000000000000000000000000000000429CF70042A5
      FF0042ADFF0042ADFF0039A5FF002994FF001884FF0094C6FF00B5CEE7004A6B
      BD00526BA5000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00A5A59C006B6B6B00F7D6AD00AD6B5A00AD6B5A00EFD6A5004239
      3900BDBDBD00B58C8400B584840000000000000000000000000063849C002173
      A5004A94C6006BADD60063ADF7004A9CE700216BA50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C898900CCCFD000919596008F8D8D00000000000000
      00000000000000000000000000000000000000000000000000000000000042A5
      FF0042ADFF0042B5FF0042ADFF00319CFF002994FF001884FF00316BE7003163
      C600000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00AD6B5A00AD6B5A00A5A59C006B6B6B006B6B6B006B6B6B006B6B6B00A5A5
      9C00EFB57300EFA54A00C6846B00000000000000000000000000000000002173
      A5006BADD6008CBDE70073BDE7005AADDE00316B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009B9A9A00D6D4D300F3FDFF00CBD2D500C8C4C4007B7C7C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042A5FF0042ADFF0042B5FF0039ADFF003994F7001831B5003952DE000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A5A59C00A5A59C00A5A59C00A5A59C00C694
      7B00FFC67300CE94730000000000000000000000000000000000000000000000
      00006BA5BD004A94B5004A8CAD0063849C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000020202000A5A5A50033333300929090009694940035353500A8A8A8002222
      2200000000000000000000000000000000000000000000000000000000000000
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000008001800100000000
      0000800100000000000080010000000000008001000000000000800100000000
      0000800100000000000000010000000000000001000000000000000100000000
      0000000100000000000000010000000000000001000000000000800100000000
      8001800100000000FFFF800100000000F3FFF00FF0FFC000F1FFE007E00FC000
      C00FC003C003C000C00F80018001C000C00F80010001C001E00F80010001C001
      F00780010001C001F003C0030001C001E001C0030001C001E000E0070001C001
      C021F00F8003C001C033FC3FC007C001C07FFC3FE00FC001E07FF81FF01FC003
      F0FFF00FF99FC007FFFFFFFFFF9FC00F00000000000000000000000000000000
      000000000000}
  end
  object IBDS1: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    DeleteSQL.Strings = (
      'delete from "gen$persona"'
      'where'
      
        '  "gen$persona"."ID_IDENTIFICACION" = :"OLD_ID_IDENTIFICACION" a' +
        'nd'
      '  "gen$persona"."ID_PERSONA" = :"OLD_ID_PERSONA"')
    InsertSQL.Strings = (
      'insert into "gen$persona"'
      '  ("gen$persona"."DATOS_HUELLA")'
      'values'
      '  (:"DATOS_HUELLA")')
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
      
        'select ID_IDENTIFICACION,ID_PERSONA,DATOS_HUELLA from "gen$perso' +
        'na" where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA ' +
        '= :ID_PERSONA')
    ModifySQL.Strings = (
      'update "gen$persona"'
      'set'
      '  "gen$persona"."DATOS_HUELLA" = :"DATOS_HUELLA"'
      'where'
      
        '  "gen$persona"."ID_IDENTIFICACION" = :"OLD_ID_IDENTIFICACION" a' +
        'nd'
      '  "gen$persona"."ID_PERSONA" = :"OLD_ID_PERSONA"')
    Left = 288
    Top = 428
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
end
