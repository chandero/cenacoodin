object FrmInformacion: TFrmInformacion
  Left = 222
  Top = 99
  Width = 637
  Height = 516
  BorderIcons = [biSystemMenu]
  Caption = 'Formulario de Solicitudes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Pagina: TPageControl
    Left = -1
    Top = 3
    Width = 630
    Height = 445
    ActivePage = TSolicitante
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Images = ImageList1
    ParentFont = False
    Style = tsFlatButtons
    TabIndex = 0
    TabOrder = 0
    object TSolicitante: TTabSheet
      Caption = '&Informacion &Solicitante'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 1
        Width = 275
        Height = 93
        Caption = 'Datos Identificacion'
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 20
          Width = 76
          Height = 13
          Caption = 'T. Identificacion'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 5
          Top = 44
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object JvLabel1: TJvLabel
          Left = 5
          Top = 68
          Width = 59
          Height = 13
          Caption = 'Expedida en'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object DBidentificacion: TDBLookupComboBox
          Left = 102
          Top = 18
          Width = 164
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'ID_IDENTIFICACION'
          ListField = 'DESCRIPCION_IDENTIFICACION'
          ListSource = DSidentificacion
          ParentFont = False
          TabOrder = 0
          OnEnter = DBidentificacionEnter
        end
        object JvDocumento: TJvEdit
          Left = 102
          Top = 42
          Width = 164
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 1
          OnExit = JvDocumentoExit
        end
        object JvOrigen: TJvEdit
          Left = 102
          Top = 66
          Width = 164
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 2
        end
      end
      object GroupBox2: TGroupBox
        Left = 273
        Top = 1
        Width = 350
        Height = 93
        Caption = 'Datos Personales'
        TabOrder = 1
        object Label3: TLabel
          Left = 5
          Top = 20
          Width = 42
          Height = 13
          Caption = 'Nombres'
        end
        object Label4: TLabel
          Left = 3
          Top = 44
          Width = 55
          Height = 13
          Caption = '1er Apellido'
        end
        object Label5: TLabel
          Left = 173
          Top = 44
          Width = 58
          Height = 13
          Caption = '2do Apellido'
        end
        object Label6: TLabel
          Left = 3
          Top = 68
          Width = 55
          Height = 13
          Caption = 'Estado Civil'
        end
        object Label7: TLabel
          Left = 175
          Top = 69
          Width = 54
          Height = 13
          Caption = 'N. Estudios'
        end
        object EDnombre: TEdit
          Left = 63
          Top = 18
          Width = 277
          Height = 21
          TabOrder = 0
        end
        object EDapellido2: TEdit
          Left = 236
          Top = 42
          Width = 105
          Height = 21
          TabOrder = 2
        end
        object DBestadocivil: TDBLookupComboBox
          Left = 64
          Top = 66
          Width = 105
          Height = 21
          KeyField = 'ID_TIPO_ESTADO_CIVIL'
          ListField = 'DESCRIPCION_ESTADO_CIVIL'
          ListSource = DSestadocivil
          TabOrder = 3
        end
        object EDapellido1: TEdit
          Left = 64
          Top = 42
          Width = 105
          Height = 21
          TabOrder = 1
        end
        object DBnivelestudio: TDBLookupComboBox
          Left = 236
          Top = 66
          Width = 104
          Height = 21
          KeyField = 'ID_NIVEL'
          ListField = 'DESCRIPCION_NIVEL'
          ListSource = DSnivelestudio
          TabOrder = 4
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 91
        Width = 547
        Height = 71
        Caption = 'Datos Residencia'
        TabOrder = 2
        object Label8: TLabel
          Left = 5
          Top = 19
          Width = 33
          Height = 13
          Caption = 'Ciudad'
        end
        object Label9: TLabel
          Left = 166
          Top = 19
          Width = 27
          Height = 13
          Caption = 'Barrio'
        end
        object Label10: TLabel
          Left = 364
          Top = 19
          Width = 47
          Height = 13
          Caption = 'Telefonos'
        end
        object Label11: TLabel
          Left = 7
          Top = 43
          Width = 45
          Height = 13
          Caption = 'Direcci'#243'n'
        end
        object Label12: TLabel
          Left = 217
          Top = 43
          Width = 65
          Height = 13
          Caption = 'Tipo Vivienda'
        end
        object Label13: TLabel
          Left = 408
          Top = 43
          Width = 95
          Height = 13
          Caption = 'Permanencia (A'#241'os)'
        end
        object EDciudad: TEdit
          Left = 41
          Top = 17
          Width = 118
          Height = 21
          TabOrder = 0
        end
        object EDbarrio: TEdit
          Left = 197
          Top = 17
          Width = 165
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object EDtelefono1: TEdit
          Left = 416
          Top = 17
          Width = 64
          Height = 21
          TabOrder = 2
        end
        object EDdireccion: TEdit
          Left = 58
          Top = 41
          Width = 157
          Height = 21
          TabOrder = 4
        end
        object DBtipovivienda: TDBLookupComboBox
          Left = 287
          Top = 41
          Width = 120
          Height = 21
          KeyField = 'ID_TIPOVIVIENDA'
          ListField = 'DESCRIPCION_TIPO'
          ListSource = DStipovivienda
          TabOrder = 5
        end
        object JVpermanencia: TJvIntegerEdit
          Left = 509
          Top = 41
          Width = 31
          Height = 21
          Alignment = taRightJustify
          ReadOnly = False
          TabOrder = 6
          Value = 0
          MaxValue = 0
          MinValue = 0
          HasMaxValue = False
          HasMinValue = False
        end
        object EDtelefono2: TEdit
          Left = 479
          Top = 17
          Width = 64
          Height = 21
          TabOrder = 3
        end
      end
      object Pagina1: TPageControl
        Left = 0
        Top = 161
        Width = 670
        Height = 252
        ActivePage = Crediticio
        Images = ImageList1
        TabIndex = 1
        TabOrder = 3
        object Economico: TTabSheet
          Caption = '1.  Informaci'#243'n &Laboral'
          ImageIndex = 7
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 257
            Height = 219
            Caption = 'Profesi'#243'n u Oficio'
            TabOrder = 0
            object Label14: TLabel
              Left = 8
              Top = 16
              Width = 52
              Height = 13
              Caption = 'Ocupaci'#243'n'
            end
            object Label15: TLabel
              Left = 8
              Top = 38
              Width = 44
              Height = 13
              Caption = 'Profesi'#243'n'
            end
            object Label16: TLabel
              Left = 8
              Top = 60
              Width = 41
              Height = 13
              Caption = 'Empresa'
            end
            object Label17: TLabel
              Left = 8
              Top = 82
              Width = 28
              Height = 13
              Caption = 'Cargo'
            end
            object Label18: TLabel
              Left = 8
              Top = 104
              Width = 39
              Height = 13
              Caption = 'Direcion'
            end
            object Label19: TLabel
              Left = 8
              Top = 148
              Width = 42
              Height = 13
              Caption = 'Telefono'
            end
            object Label20: TLabel
              Left = 8
              Top = 170
              Width = 17
              Height = 13
              Caption = 'Fax'
            end
            object Label21: TLabel
              Left = 8
              Top = 195
              Width = 83
              Height = 13
              Caption = 'Fecha de Ingreso'
            end
            object Label97: TLabel
              Left = 8
              Top = 127
              Width = 33
              Height = 13
              Caption = 'Ciudad'
            end
            object Cocupacion: TComboBox
              Left = 64
              Top = 14
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              ItemHeight = 13
              MaxLength = 103
              TabOrder = 0
              Items.Strings = (
                'EMPLEADO'
                'ESTUDIANTE'
                'INDEPENDIENTE'
                'PENSIONADO O JUBILADO'
                'AMA DE CASA'
                'AGRICULTOR')
            end
            object EDprofesion: TEdit
              Left = 64
              Top = 36
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object EDempresa: TEdit
              Left = 64
              Top = 58
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object EDcargo: TEdit
              Left = 64
              Top = 80
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 3
            end
            object EDdireccionemp: TEdit
              Left = 64
              Top = 102
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 4
            end
            object EDtelefonoemp: TEdit
              Left = 64
              Top = 146
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 6
            end
            object EDfax: TEdit
              Left = 64
              Top = 168
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 7
            end
            object TDfechaingreso: TDateTimePicker
              Left = 112
              Top = 193
              Width = 132
              Height = 21
              CalAlignment = dtaLeft
              Date = 0.383143622697389
              Time = 0.383143622697389
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 8
            end
            object EDciudademp: TEdit
              Left = 64
              Top = 124
              Width = 180
              Height = 21
              TabOrder = 5
            end
          end
          object GroupBox5: TGroupBox
            Left = 255
            Top = 0
            Width = 364
            Height = 65
            Caption = 'Ingresos Mensuales'
            TabOrder = 1
            object Label22: TLabel
              Left = 8
              Top = 16
              Width = 87
              Height = 13
              Caption = 'Actividad Principal'
            end
            object JvLabel2: TJvLabel
              Left = 222
              Top = 16
              Width = 25
              Height = 13
              Caption = 'Otros'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel3: TJvLabel
              Left = 8
              Top = 40
              Width = 93
              Height = 13
              Caption = 'Des. Otros Ingresos'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JVingresos: TJvCurrencyEdit
              Left = 104
              Top = 14
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 0
              OnEnter = JVingresosEnter
              OnExit = JVingresosExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVotrosingresos: TJvCurrencyEdit
              Left = 254
              Top = 14
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 1
              OnEnter = JVotrosingresosEnter
              OnExit = JVotrosingresosExit
              HasMaxValue = False
              HasMinValue = False
            end
            object EDdescripcioningresos: TJvEdit
              Left = 104
              Top = 38
              Width = 249
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
              CharCase = ecUpperCase
              PasswordChar = #0
              ReadOnly = False
              TabOrder = 2
              OnEnter = EDdescripcioningresosEnter
            end
          end
          object JvGroupBox1: TJvGroupBox
            Left = 255
            Top = 62
            Width = 364
            Height = 114
            Caption = 'Egresos Mensuales'
            TabOrder = 2
            object JvLabel4: TJvLabel
              Left = 10
              Top = 17
              Width = 39
              Height = 13
              Caption = 'Arriendo'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel5: TJvLabel
              Left = 10
              Top = 41
              Width = 43
              Height = 13
              Caption = 'Servicios'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel6: TJvLabel
              Left = 10
              Top = 65
              Width = 37
              Height = 13
              Caption = 'Deudas'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel7: TJvLabel
              Left = 192
              Top = 17
              Width = 51
              Height = 13
              Caption = 'Transporte'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel8: TJvLabel
              Left = 192
              Top = 41
              Width = 45
              Height = 13
              Caption = 'Alimentos'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel9: TJvLabel
              Left = 192
              Top = 65
              Width = 25
              Height = 13
              Caption = 'Otros'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel12: TJvLabel
              Left = 8
              Top = 91
              Width = 91
              Height = 13
              Caption = 'Des. Otros Egresos'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JVarriendo: TJvCurrencyEdit
              Left = 63
              Top = 15
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 0
              OnEnter = JVarriendoEnter
              OnExit = JVarriendoExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVservicios: TJvCurrencyEdit
              Left = 63
              Top = 39
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 1
              OnEnter = JVserviciosEnter
              OnExit = JVserviciosExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVdeudas: TJvCurrencyEdit
              Left = 63
              Top = 63
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 2
              OnEnter = JVdeudasEnter
              OnExit = JVdeudasExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVtransporte: TJvCurrencyEdit
              Left = 255
              Top = 15
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 3
              OnEnter = JVtransporteEnter
              OnExit = JVtransporteExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JValimentos: TJvCurrencyEdit
              Left = 255
              Top = 39
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 4
              OnEnter = JValimentosEnter
              OnExit = JValimentosExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVotrosegresos: TJvCurrencyEdit
              Left = 255
              Top = 63
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 5
              OnEnter = JVotrosegresosEnter
              OnExit = JVotrosegresosExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVdescripcionegresos: TJvEdit
              Left = 104
              Top = 88
              Width = 249
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
              CharCase = ecUpperCase
              PasswordChar = #0
              ReadOnly = False
              TabOrder = 6
              OnEnter = JVdescripcionegresosEnter
              OnExit = JVdescripcionegresosExit
            end
          end
          object JvGroupBox2: TJvGroupBox
            Left = 255
            Top = 173
            Width = 364
            Height = 46
            Caption = 'Total Ingresos y Egresos Mensuales'
            TabOrder = 3
            object JvLabel10: TJvLabel
              Left = 10
              Top = 23
              Width = 49
              Height = 13
              Caption = 'Ingresos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel11: TJvLabel
              Left = 191
              Top = 23
              Width = 46
              Height = 13
              Caption = 'Egresos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JVtotalIngresos: TJvCurrencyEdit
              Left = 63
              Top = 21
              Width = 100
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              HasMaxValue = False
              HasMinValue = False
              ClipBoardCommands = [caCopy]
            end
            object JVTotalEgresos: TJvCurrencyEdit
              Left = 254
              Top = 21
              Width = 100
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              HasMaxValue = False
              HasMinValue = False
              ClipBoardCommands = [caCopy]
            end
          end
        end
        object Crediticio: TTabSheet
          Caption = '2.  I&nformacion Crediticia'
          ImageIndex = 6
          DesignSize = (
            662
            223)
          object label23: TLabel
            Left = 7
            Top = 148
            Width = 36
            Height = 13
            Caption = 'Entidad'
          end
          object Label24: TLabel
            Left = 7
            Top = 171
            Width = 54
            Height = 13
            Caption = 'Valor Inicial'
          end
          object Label25: TLabel
            Left = 210
            Top = 174
            Width = 27
            Height = 13
            Caption = 'Saldo'
          end
          object Label26: TLabel
            Left = 7
            Top = 195
            Width = 71
            Height = 13
            Caption = 'Cuota Mensual'
          end
          object Label27: TLabel
            Left = 210
            Top = 196
            Width = 58
            Height = 13
            Caption = 'Vencimiento'
          end
          object DBcretditicia: TDBGrid
            Left = 6
            Top = 4
            Width = 601
            Height = 129
            Hint = 
              'Para que el Credito sea Descontado Haga Doble Clic Sobre la Celd' +
              'a'
            TabStop = False
            DataSource = DSinfcrediticia
            ParentShowHint = False
            PopupMenu = PopupMenu5
            ReadOnly = True
            ShowHint = True
            TabOrder = 5
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBcretditiciaCellClick
            OnColExit = DBcretditiciaColExit
            OnDrawColumnCell = DBcretditiciaDrawColumnCell
            OnDblClick = DBcretditiciaDblClick
            OnKeyPress = DBcretditiciaKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'id_colocacion'
                Title.Alignment = taCenter
                Title.Caption = 'COLOCACION'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor_inicial'
                Title.Alignment = taRightJustify
                Title.Caption = 'VALOR INI'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'saldo'
                Title.Alignment = taRightJustify
                Title.Caption = 'SALDO'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cuota_mensual'
                Title.Alignment = taRightJustify
                Title.Caption = 'CUOTA'
                Width = 90
                Visible = True
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
                FieldName = 'fecha_capital'
                Title.Caption = 'FECHA K'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'fecha_interes'
                Title.Caption = 'FECHA I'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'desc_estado'
                Title.Caption = 'ESTADO'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'entidad'
                Title.Caption = 'ENTIDAD'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vencimiento'
                Title.Caption = 'FECHA VENC'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'estado'
                Visible = False
              end
              item
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'es_descuento'
                Title.Caption = 'Dto'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'criterio'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'tipo_c'
                Title.Caption = 'TIPO'
                Width = 20
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 416
            Top = 143
            Width = 199
            Height = 72
            Color = clOlive
            TabOrder = 6
            object BTagregar: TBitBtn
              Left = 8
              Top = 10
              Width = 90
              Height = 25
              Caption = '&Agregar'
              TabOrder = 0
              OnClick = BTagregarClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000030F0000030F000000010000000100000094000000C6
                0000319C42004A524A00429C4A0052525200527352005A5A5A00635A5A005AAD
                5A005AB55A004ABD5A005A63630063636300636B63006384630063636B006B63
                6B006B6B6B006B946B00736B7300737373007394730073737B007B737B007B7B
                7B008C847B00738C7B006B9C7B007B9C7B0084CE7B0073D67B007B8484008484
                84007B9484007B9C840073AD84008C848C008C8C8C0094948C008CA58C009494
                940084A594009C949C009C9C9C00A5A5A500ADADAD00B5B5AD00B5B5B500BDB5
                B500BDBDBD00C6BDBD00CEC6BD00C6C6C600D6D6D600FF00FF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373737373737
                3737373737373737373737373737373737373737373737373737373737122C0D
                12212E32322D262937373737370D321212262E3536322D2E3737373737073212
                12212E3536322D2E37373737370D2E0D0712152A00242C263737373737072D0D
                0D212E011F002626373737373708331211212E011F002D2E37373737370C3212
                060F1D011F001D233737373737083010040000010B0000000237373737082D0E
                091E1E1E1F0101010937373737083312061B28011F00161D3737373737082F12
                0D202C011F002C2D373737373707290D071215011F0026263737373737032921
                27292922131C26193737373737371A1814171515151921373737}
            end
            object BTmodificar: TBitBtn
              Left = 8
              Top = 40
              Width = 90
              Height = 25
              Caption = '&Modificar'
              Enabled = False
              TabOrder = 1
              OnClick = BTmodificarClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000F30E0000F30E000000010000000100002D2D2D001855
                6F0042424200454442004A4A4A0052424A004A524A0058534E0063635A00635A
                6B005160610054777B00636363006B6363006B736B00736B7300737373007373
                7B007B737B007C7078007B7B7B00B56D3E00C1713500C07638008A5B5200947E
                7500AD7B73008C847B00EFA65A00EDA75F00F0A85C0000009A000316AC004174
                9600477AA9000018C6001029D600106BFF00FF00FF0035A8F5004A9EED006D8A
                FD00848484008C848C008C8C8C00949494009C9C9C009CA594009891A200A5A5
                A500ADADAD00ADADB500B5B5B500BDBDBD00F1BC8600F8C28C00F9C48D00FBD3
                A900C6C6C600D6D6D600DEDEDE00E7DED6000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000262626262626
                26262626262626262626262626262626262626262626262626262626262A2E10
                0C10323435312A2A2626262626043C2A0C1431353B3A322E2626262626020007
                0C1031343B3A322E26262626260407030A1431343B3A312D262626262604310B
                2201183435312A2A2626262626023B0B211916183B3A322E2626262626023B2B
                13361E17183A322E2626262626023C2B1A39381C1718322E2626262626053110
                0C1A39381E1618142626262626053D2B0D101A39371D15182626262626053D2B
                080E2E1A393027201F26262626053110090E2D321A282424201F26262606332C
                2F313131322329252426262626261B120F111010101423232626}
            end
            object BTlimpiar: TBitBtn
              Left = 104
              Top = 10
              Width = 90
              Height = 25
              Caption = 'Lim&piar'
              TabOrder = 2
              OnClick = BTlimpiarClick
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
            object BTeliminar: TBitBtn
              Left = 104
              Top = 40
              Width = 90
              Height = 25
              Caption = '&Eliminar'
              TabOrder = 3
              OnClick = BTeliminarClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000E30E0000E30E00000001000000010000424242004A42
                4A0052424A004A4A4A004A524A00525252005A6352005A5A5A005A635A006363
                5A006B635A00525263005A5263005A5A6300635A63005A636300636363006B63
                63006B6B6300635A6B0063636B006B6B6B006B736B00636B7300736B73006B73
                73007373730084737300737B730073737B007B737B0084737B007B7B7B008C84
                7B00848484008C848C00848C8C008C8C8C008C948C00949494009CA594009C9C
                9C000021A500A5A5A500ADADAD00ADADB500B5B5B500BDBDBD006B84C600C6C6
                C600CECECE00D6D6D600E7DED600DEDEDE000029E700526BF700638CF7009494
                F700FF00FF009CB5FF009CBDFF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003A3A3A3A3A3A
                3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A22291A
                101A2C2E2F2B22223A3A3A3A3A03352210202B2F33312C293A3A3A3A3A003322
                101A2B2E33312C293A3A3A3A3A03352210202B2E33312B273A3A3A3A3A032B1A
                071A2B2E2F2B22223A3A3A3A3A003322101A2B2E33312C293A3A3A3A3A003323
                14302A2A2A2A2A2A2A3A3A3A3A003523102A363636363636362A3A3A3A022B1A
                10302A2A2A2A2A2A2A3A3A3A3A023423111A2B2C32312B273A3A3A3A3A023423
                0916292C322F2B273A3A3A3A3A022B1A1316272C322F2B253A3A3A3A3A042D25
                282B2B2B2C2B25203A3A3A3A3A3A211E181D1A1A1A20223A3A3A}
            end
          end
          object EDentidad: TEdit
            Left = 86
            Top = 146
            Width = 323
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object Jvvalorinicial: TJvCurrencyEdit
            Left = 86
            Top = 169
            Width = 121
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 1
            OnEnter = JvvalorinicialEnter
            HasMaxValue = False
            HasMinValue = False
          end
          object JVcuota: TJvCurrencyEdit
            Left = 86
            Top = 192
            Width = 121
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 3
            OnEnter = JVcuotaEnter
            HasMaxValue = False
            HasMinValue = False
          end
          object DTvencimiento: TDateTimePicker
            Left = 272
            Top = 195
            Width = 138
            Height = 21
            CalAlignment = dtaLeft
            Date = 0.475770208300673
            Time = 0.475770208300673
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 4
          end
          object JVsaldo: TJvCurrencyEdit
            Left = 272
            Top = 169
            Width = 138
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 2
            OnEnter = JVsaldoEnter
            HasMaxValue = False
            HasMinValue = False
          end
          object DBCheckBox1: TDBCheckBox
            Left = -48
            Top = -64
            Width = 10
            Height = 17
            Anchors = [akRight]
            DataField = 'es_descuento'
            DataSource = DSinfcrediticia
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object Bienes: TTabSheet
          Caption = '3.  &Bienes Raices'
          ImageIndex = 5
          object Label28: TLabel
            Left = 352
            Top = 156
            Width = 31
            Height = 13
            Caption = 'Desc. '
          end
          object Label30: TLabel
            Left = 0
            Top = 156
            Width = 45
            Height = 13
            Caption = 'Direcci'#243'n'
          end
          object Label31: TLabel
            Left = 3
            Top = 134
            Width = 33
            Height = 13
            Caption = 'Ciudad'
          end
          object Label32: TLabel
            Left = 187
            Top = 156
            Width = 24
            Height = 13
            Caption = 'Valor'
          end
          object JvLabel13: TJvLabel
            Left = 74
            Top = 179
            Width = 49
            Height = 13
            Caption = 'A favor de'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object Label91: TLabel
            Left = 187
            Top = 109
            Width = 41
            Height = 13
            Caption = 'Escritura'
          end
          object Label92: TLabel
            Left = 354
            Top = 109
            Width = 34
            Height = 13
            Caption = 'Notaria'
          end
          object Label93: TLabel
            Left = 0
            Top = 109
            Width = 43
            Height = 13
            Caption = 'Matricula'
          end
          object Label94: TLabel
            Left = 187
            Top = 132
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          object Label95: TLabel
            Left = 354
            Top = 132
            Width = 27
            Height = 13
            Caption = 'Barrio'
          end
          object Panel2: TPanel
            Left = 506
            Top = 106
            Width = 105
            Height = 114
            Color = clOlive
            TabOrder = 12
            object BTagregaB: TBitBtn
              Left = 8
              Top = 11
              Width = 90
              Height = 25
              Caption = '&Agregar'
              TabOrder = 0
              OnClick = BTagregaBClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000030F0000030F000000010000000100000094000000C6
                0000319C42004A524A00429C4A0052525200527352005A5A5A00635A5A005AAD
                5A005AB55A004ABD5A005A63630063636300636B63006384630063636B006B63
                6B006B6B6B006B946B00736B7300737373007394730073737B007B737B007B7B
                7B008C847B00738C7B006B9C7B007B9C7B0084CE7B0073D67B007B8484008484
                84007B9484007B9C840073AD84008C848C008C8C8C0094948C008CA58C009494
                940084A594009C949C009C9C9C00A5A5A500ADADAD00B5B5AD00B5B5B500BDB5
                B500BDBDBD00C6BDBD00CEC6BD00C6C6C600D6D6D600FF00FF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373737373737
                3737373737373737373737373737373737373737373737373737373737122C0D
                12212E32322D262937373737370D321212262E3536322D2E3737373737073212
                12212E3536322D2E37373737370D2E0D0712152A00242C263737373737072D0D
                0D212E011F002626373737373708331211212E011F002D2E37373737370C3212
                060F1D011F001D233737373737083010040000010B0000000237373737082D0E
                091E1E1E1F0101010937373737083312061B28011F00161D3737373737082F12
                0D202C011F002C2D373737373707290D071215011F0026263737373737032921
                27292922131C26193737373737371A1814171515151921373737}
            end
            object BTlimpiaB: TBitBtn
              Left = 8
              Top = 35
              Width = 90
              Height = 25
              Caption = 'Lim&piar'
              TabOrder = 1
              OnClick = BTlimpiaBClick
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
            object BTmodificaB: TBitBtn
              Left = 8
              Top = 59
              Width = 90
              Height = 25
              Caption = '&Modificar'
              Enabled = False
              TabOrder = 2
              OnClick = BTmodificaBClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000F30E0000F30E000000010000000100002D2D2D001855
                6F0042424200454442004A4A4A0052424A004A524A0058534E0063635A00635A
                6B005160610054777B00636363006B6363006B736B00736B7300737373007373
                7B007B737B007C7078007B7B7B00B56D3E00C1713500C07638008A5B5200947E
                7500AD7B73008C847B00EFA65A00EDA75F00F0A85C0000009A000316AC004174
                9600477AA9000018C6001029D600106BFF00FF00FF0035A8F5004A9EED006D8A
                FD00848484008C848C008C8C8C00949494009C9C9C009CA594009891A200A5A5
                A500ADADAD00ADADB500B5B5B500BDBDBD00F1BC8600F8C28C00F9C48D00FBD3
                A900C6C6C600D6D6D600DEDEDE00E7DED6000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000262626262626
                26262626262626262626262626262626262626262626262626262626262A2E10
                0C10323435312A2A2626262626043C2A0C1431353B3A322E2626262626020007
                0C1031343B3A322E26262626260407030A1431343B3A312D262626262604310B
                2201183435312A2A2626262626023B0B211916183B3A322E2626262626023B2B
                13361E17183A322E2626262626023C2B1A39381C1718322E2626262626053110
                0C1A39381E1618142626262626053D2B0D101A39371D15182626262626053D2B
                080E2E1A393027201F26262626053110090E2D321A282424201F26262606332C
                2F313131322329252426262626261B120F111010101423232626}
            end
            object BTeliminaB: TBitBtn
              Left = 8
              Top = 83
              Width = 90
              Height = 25
              Caption = '&Eliminar'
              TabOrder = 3
              OnClick = BTeliminaBClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000E30E0000E30E00000001000000010000424242004A42
                4A0052424A004A4A4A004A524A00525252005A6352005A5A5A005A635A006363
                5A006B635A00525263005A5263005A5A6300635A63005A636300636363006B63
                63006B6B6300635A6B0063636B006B6B6B006B736B00636B7300736B73006B73
                73007373730084737300737B730073737B007B737B0084737B007B7B7B008C84
                7B00848484008C848C00848C8C008C8C8C008C948C00949494009CA594009C9C
                9C000021A500A5A5A500ADADAD00ADADB500B5B5B500BDBDBD006B84C600C6C6
                C600CECECE00D6D6D600E7DED600DEDEDE000029E700526BF700638CF7009494
                F700FF00FF009CB5FF009CBDFF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003A3A3A3A3A3A
                3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A22291A
                101A2C2E2F2B22223A3A3A3A3A03352210202B2F33312C293A3A3A3A3A003322
                101A2B2E33312C293A3A3A3A3A03352210202B2E33312B273A3A3A3A3A032B1A
                071A2B2E2F2B22223A3A3A3A3A003322101A2B2E33312C293A3A3A3A3A003323
                14302A2A2A2A2A2A2A3A3A3A3A003523102A363636363636362A3A3A3A022B1A
                10302A2A2A2A2A2A2A3A3A3A3A023423111A2B2C32312B273A3A3A3A3A023423
                0916292C322F2B273A3A3A3A3A022B1A1316272C322F2B253A3A3A3A3A042D25
                282B2B2B2C2B25203A3A3A3A3A3A211E181D1A1A1A20223A3A3A}
            end
          end
          object DBbienes: TDBGrid
            Left = 8
            Top = 8
            Width = 601
            Height = 93
            TabStop = False
            DataSource = DSbienes
            ReadOnly = True
            TabOrder = 13
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBbienesCellClick
            Columns = <
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
                FieldName = 'descripcion_bien'
                Title.Caption = 'Descripci'#243'n'
                Width = 159
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'barrio'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'direccion'
                Title.Caption = 'Direccion'
                Width = 147
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ciudad'
                Title.Caption = 'Ciudad'
                Width = 132
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor_comercial'
                Title.Caption = 'Valor'
                Width = 125
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'eshipoteca'
                Title.Caption = 'Hipotecada'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'afavorde'
                Visible = False
              end>
          end
          object EDdescripcionbien: TEdit
            Left = 391
            Top = 154
            Width = 108
            Height = 21
            Hint = 'Descripcion del bien'
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
          end
          object EDbarriobien: TEdit
            Left = 391
            Top = 130
            Width = 109
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 5
          end
          object EDdireccionbien: TEdit
            Left = 57
            Top = 154
            Width = 128
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 6
          end
          object EDciudadbien: TEdit
            Left = 57
            Top = 129
            Width = 130
            Height = 21
            Hint = 'Ciudad de la Escritura'
            CharCase = ecUpperCase
            TabOrder = 3
          end
          object JVvalorbien: TJvCurrencyEdit
            Left = 231
            Top = 154
            Width = 122
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 7
            OnEnter = JVvalorbienEnter
            HasMaxValue = False
            HasMinValue = False
          end
          object JVhipoteca: TJvCheckBox
            Left = -1
            Top = 179
            Width = 71
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Hipoteca'
            TabOrder = 9
            AutoSize = False
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object EDafavorde: TJvEdit
            Left = 128
            Top = 177
            Width = 372
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
            CharCase = ecUpperCase
            PasswordChar = #0
            ReadOnly = False
            TabOrder = 10
          end
          object EDescriturad: TEdit
            Left = 231
            Top = 107
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object EDnotariad: TEdit
            Left = 391
            Top = 107
            Width = 110
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
          object EDmatriculad: TEdit
            Left = 57
            Top = 107
            Width = 129
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object DTfechad: TDateTimePicker
            Left = 231
            Top = 130
            Width = 121
            Height = 21
            Hint = 'Fecha de la Escritura'
            CalAlignment = dtaLeft
            Date = 38262.3667297801
            Time = 38262.3667297801
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object Rinformaciond: TRadioButton
            Left = 1
            Top = 203
            Width = 105
            Height = 17
            Alignment = taLeftJustify
            Caption = '&Informacion'
            TabOrder = 11
            TabStop = True
            Visible = False
          end
          object Rpersonald: TRadioButton
            Left = 53
            Top = 203
            Width = 119
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Garantia &Personal'
            Checked = True
            TabOrder = 14
            TabStop = True
          end
          object Rreald: TRadioButton
            Left = 322
            Top = 203
            Width = 113
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Garantia &Real'
            TabOrder = 15
          end
        end
        object Maquinaria: TTabSheet
          Caption = '4.  &Vehiculos'
          ImageIndex = 3
          object Label33: TLabel
            Left = 7
            Top = 149
            Width = 56
            Height = 13
            Caption = 'Descripcion'
          end
          object Label34: TLabel
            Left = 7
            Top = 173
            Width = 30
            Height = 13
            Caption = 'Marca'
          end
          object Label35: TLabel
            Left = 200
            Top = 173
            Width = 81
            Height = 13
            Caption = 'Numero de placa'
          end
          object Label36: TLabel
            Left = 8
            Top = 197
            Width = 27
            Height = 13
            Caption = 'Valor '
          end
          object Label96: TLabel
            Left = 244
            Top = 149
            Width = 35
            Height = 13
            Caption = 'Modelo'
          end
          object DBmaquinaria: TDBGrid
            Left = 8
            Top = 8
            Width = 601
            Height = 129
            TabStop = False
            DataSource = DSmaquinaria
            ReadOnly = True
            TabOrder = 6
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBmaquinariaCellClick
            Columns = <
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
                FieldName = 'descripcion'
                Title.Caption = 'Descripcion'
                Width = 203
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'placa'
                Title.Caption = 'Placa'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'marca'
                Title.Caption = 'Marca'
                Width = 111
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Caption = 'Valor'
                Width = 105
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'pignorado'
                Title.Caption = 'Pignorado'
                Visible = False
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'estado'
                Title.Caption = 'Pignorado'
                Width = 56
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 415
            Top = 137
            Width = 199
            Height = 85
            Color = clOlive
            TabOrder = 7
            object BTagregarm: TBitBtn
              Left = 7
              Top = 12
              Width = 90
              Height = 25
              Caption = '&Agregar'
              TabOrder = 0
              OnClick = BTagregarmClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000030F0000030F000000010000000100000094000000C6
                0000319C42004A524A00429C4A0052525200527352005A5A5A00635A5A005AAD
                5A005AB55A004ABD5A005A63630063636300636B63006384630063636B006B63
                6B006B6B6B006B946B00736B7300737373007394730073737B007B737B007B7B
                7B008C847B00738C7B006B9C7B007B9C7B0084CE7B0073D67B007B8484008484
                84007B9484007B9C840073AD84008C848C008C8C8C0094948C008CA58C009494
                940084A594009C949C009C9C9C00A5A5A500ADADAD00B5B5AD00B5B5B500BDB5
                B500BDBDBD00C6BDBD00CEC6BD00C6C6C600D6D6D600FF00FF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373737373737
                3737373737373737373737373737373737373737373737373737373737122C0D
                12212E32322D262937373737370D321212262E3536322D2E3737373737073212
                12212E3536322D2E37373737370D2E0D0712152A00242C263737373737072D0D
                0D212E011F002626373737373708331211212E011F002D2E37373737370C3212
                060F1D011F001D233737373737083010040000010B0000000237373737082D0E
                091E1E1E1F0101010937373737083312061B28011F00161D3737373737082F12
                0D202C011F002C2D373737373707290D071215011F0026263737373737032921
                27292922131C26193737373737371A1814171515151921373737}
            end
            object BTlimpiarm: TBitBtn
              Left = 103
              Top = 12
              Width = 90
              Height = 25
              Caption = '&Lim&piar'
              TabOrder = 1
              OnClick = BTlimpiarmClick
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
            object BTmodificarm: TBitBtn
              Left = 7
              Top = 48
              Width = 90
              Height = 25
              Caption = '&Modificar'
              Enabled = False
              TabOrder = 2
              OnClick = BTmodificarmClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000F30E0000F30E000000010000000100002D2D2D001855
                6F0042424200454442004A4A4A0052424A004A524A0058534E0063635A00635A
                6B005160610054777B00636363006B6363006B736B00736B7300737373007373
                7B007B737B007C7078007B7B7B00B56D3E00C1713500C07638008A5B5200947E
                7500AD7B73008C847B00EFA65A00EDA75F00F0A85C0000009A000316AC004174
                9600477AA9000018C6001029D600106BFF00FF00FF0035A8F5004A9EED006D8A
                FD00848484008C848C008C8C8C00949494009C9C9C009CA594009891A200A5A5
                A500ADADAD00ADADB500B5B5B500BDBDBD00F1BC8600F8C28C00F9C48D00FBD3
                A900C6C6C600D6D6D600DEDEDE00E7DED6000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000262626262626
                26262626262626262626262626262626262626262626262626262626262A2E10
                0C10323435312A2A2626262626043C2A0C1431353B3A322E2626262626020007
                0C1031343B3A322E26262626260407030A1431343B3A312D262626262604310B
                2201183435312A2A2626262626023B0B211916183B3A322E2626262626023B2B
                13361E17183A322E2626262626023C2B1A39381C1718322E2626262626053110
                0C1A39381E1618142626262626053D2B0D101A39371D15182626262626053D2B
                080E2E1A393027201F26262626053110090E2D321A282424201F26262606332C
                2F313131322329252426262626261B120F111010101423232626}
            end
            object BTeliminarm: TBitBtn
              Left = 103
              Top = 48
              Width = 90
              Height = 25
              Caption = '&Eliminar'
              TabOrder = 3
              OnClick = BTeliminarmClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000E30E0000E30E00000001000000010000424242004A42
                4A0052424A004A4A4A004A524A00525252005A6352005A5A5A005A635A006363
                5A006B635A00525263005A5263005A5A6300635A63005A636300636363006B63
                63006B6B6300635A6B0063636B006B6B6B006B736B00636B7300736B73006B73
                73007373730084737300737B730073737B007B737B0084737B007B7B7B008C84
                7B00848484008C848C00848C8C008C8C8C008C948C00949494009CA594009C9C
                9C000021A500A5A5A500ADADAD00ADADB500B5B5B500BDBDBD006B84C600C6C6
                C600CECECE00D6D6D600E7DED600DEDEDE000029E700526BF700638CF7009494
                F700FF00FF009CB5FF009CBDFF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003A3A3A3A3A3A
                3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A22291A
                101A2C2E2F2B22223A3A3A3A3A03352210202B2F33312C293A3A3A3A3A003322
                101A2B2E33312C293A3A3A3A3A03352210202B2E33312B273A3A3A3A3A032B1A
                071A2B2E2F2B22223A3A3A3A3A003322101A2B2E33312C293A3A3A3A3A003323
                14302A2A2A2A2A2A2A3A3A3A3A003523102A363636363636362A3A3A3A022B1A
                10302A2A2A2A2A2A2A3A3A3A3A023423111A2B2C32312B273A3A3A3A3A023423
                0916292C322F2B273A3A3A3A3A022B1A1316272C322F2B253A3A3A3A3A042D25
                282B2B2B2C2B25203A3A3A3A3A3A211E181D1A1A1A20223A3A3A}
            end
          end
          object EDdescripcionm: TEdit
            Left = 73
            Top = 147
            Width = 168
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object CHpignorado: TCheckBox
            Left = 199
            Top = 197
            Width = 101
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Pignorado'
            TabOrder = 5
            OnClick = CHpignoradoClick
          end
          object EDmarca: TEdit
            Left = 73
            Top = 171
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
          object JVvalorm: TJvCurrencyEdit
            Left = 73
            Top = 195
            Width = 121
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 4
            OnEnter = JVvalormEnter
            HasMaxValue = False
            HasMinValue = False
          end
          object EDplaca: TEdit
            Left = 288
            Top = 171
            Width = 115
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 3
          end
          object EDmodelodeudor: TEdit
            Left = 288
            Top = 147
            Width = 115
            Height = 21
            TabOrder = 1
          end
        end
        object TabSheet1: TTabSheet
          Caption = '5.  Datos Credito'
          ImageIndex = 4
          OnExit = TabSheet1Exit
          object JvGroupBox3: TJvGroupBox
            Left = 5
            Top = 0
            Width = 609
            Height = 49
            Caption = 'Informacion General'
            Enabled = False
            TabOrder = 3
            object Label37: TLabel
              Left = 8
              Top = 21
              Width = 54
              Height = 13
              Caption = 'Cuenta No:'
            end
            object JvStaticText2: TJvStaticText
              Left = 149
              Top = 21
              Width = 70
              Height = 17
              TextMargins.X = 0
              TextMargins.Y = 0
              Caption = 'Radicado No:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlTop
              ParentFont = False
              TabOrder = 0
              WordWrap = False
            end
            object JvRadicado: TJvStaticText
              Left = 217
              Top = 21
              Width = 81
              Height = 17
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BorderStyle = sbsSunken
              Color = clCaptionText
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
              Layout = tlTop
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              WordWrap = False
            end
            object JVnumerocuenta: TJvStaticText
              Left = 64
              Top = 21
              Width = 81
              Height = 17
              TextMargins.X = 0
              TextMargins.Y = 0
              AutoSize = False
              BorderStyle = sbsSunken
              Color = clBtnHighlight
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
              Layout = tlTop
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              WordWrap = False
            end
            object JvStaticText4: TJvStaticText
              Left = 388
              Top = 21
              Width = 104
              Height = 17
              TextMargins.X = 0
              TextMargins.Y = 0
              Caption = 'Fecha de Recepci'#243'n'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              Layout = tlTop
              TabOrder = 3
              WordWrap = False
            end
            object DTfechaRep: TDateTimePicker
              Left = 492
              Top = 19
              Width = 109
              Height = 21
              CalAlignment = dtaLeft
              Date = 38225.7433864931
              Time = 38225.7433864931
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
              TabOrder = 4
              TabStop = False
            end
            object CHeducacion: TCheckBox
              Left = 307
              Top = 21
              Width = 70
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Educaci'#243'n'
              TabOrder = 5
            end
          end
          object GroupBox6: TGroupBox
            Left = 5
            Top = 42
            Width = 270
            Height = 147
            Caption = 'Valor Solicitado Amortizaciones'
            TabOrder = 0
            object Label38: TLabel
              Left = 8
              Top = 19
              Width = 73
              Height = 13
              Caption = 'Valor Solicitado'
            end
            object Label39: TLabel
              Left = 7
              Top = 45
              Width = 52
              Height = 13
              Caption = 'Tipo Cuota'
            end
            object Label40: TLabel
              Left = 8
              Top = 71
              Width = 60
              Height = 13
              Caption = 'Amortizaci'#243'n'
            end
            object Label41: TLabel
              Left = 145
              Top = 71
              Width = 60
              Height = 13
              Caption = 'Pago Interes'
            end
            object Label44: TLabel
              Left = 8
              Top = 119
              Width = 57
              Height = 13
              Caption = 'Codeudores'
            end
            object Label81: TLabel
              Left = 119
              Top = 119
              Width = 26
              Height = 13
              Caption = 'Plazo'
            end
            object Label84: TLabel
              Left = 238
              Top = 119
              Width = 21
              Height = 13
              Caption = 'Dias'
            end
            object Label85: TLabel
              Left = 8
              Top = 94
              Width = 45
              Height = 13
              Caption = 'Respaldo'
            end
            object JVvalorprestamo: TJvCurrencyEdit
              Left = 88
              Top = 17
              Width = 172
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 0
              OnEnter = JVvalorprestamoEnter
              OnExit = JVvalorprestamoExit
              HasMaxValue = False
              HasMinValue = False
            end
            object DBtipocuota: TDBLookupComboBox
              Left = 88
              Top = 43
              Width = 174
              Height = 21
              KeyField = 'ID_TIPOS_CUOTA'
              ListField = 'DESCRIPCION_TIPO_CUOTA'
              ListSource = DStipocuota
              TabOrder = 1
              OnEnter = DBtipocuotaEnter
              OnExit = DBtipocuotaExit
            end
            object JVcodeudores: TJvIntegerEdit
              Left = 88
              Top = 117
              Width = 26
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 5
              Value = 0
              MaxValue = 0
              MinValue = 0
              HasMaxValue = False
              HasMinValue = False
            end
            object JVplazo: TJvIntegerEdit
              Left = 149
              Top = 117
              Width = 85
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 6
              OnExit = JVplazoExit
              Value = 0
              MaxValue = 0
              MinValue = 0
              HasMaxValue = False
              HasMinValue = False
            end
            object DBrespaldo: TDBLookupComboBox
              Left = 88
              Top = 92
              Width = 174
              Height = 21
              KeyField = 'ID_RESPALDO'
              ListField = 'DESCRIPCION_RESPALDO'
              ListSource = DSrespaldo
              TabOrder = 4
              OnEnter = DBrespaldoEnter
            end
            object JVamortizacion: TJvIntegerEdit
              Left = 88
              Top = 69
              Width = 49
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 2
              OnExit = JVamortizacionExit
              Value = 0
              MaxValue = 0
              MinValue = 0
              HasMaxValue = False
              HasMinValue = False
            end
            object JVpagointeres: TJvIntegerEdit
              Left = 208
              Top = 68
              Width = 51
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 3
              Value = 0
              MaxValue = 0
              MinValue = 0
              HasMaxValue = False
              HasMinValue = False
            end
          end
          object GroupBox7: TGroupBox
            Left = 273
            Top = 43
            Width = 341
            Height = 101
            Caption = 'Linea y Garantia'
            TabOrder = 1
            object Label42: TLabel
              Left = 8
              Top = 41
              Width = 40
              Height = 13
              Caption = 'Garantia'
            end
            object Label43: TLabel
              Left = 9
              Top = 60
              Width = 56
              Height = 13
              Caption = 'Descripci'#243'n'
            end
            object Label86: TLabel
              Left = 8
              Top = 18
              Width = 26
              Height = 13
              Caption = 'Linea'
            end
            object DBgarantia: TDBLookupComboBox
              Left = 56
              Top = 40
              Width = 278
              Height = 21
              KeyField = 'ID_GARANTIA'
              ListField = 'DESCRIPCION_GARANTIA'
              ListSource = DSgarantia
              TabOrder = 1
              OnEnter = DBgarantiaEnter
            end
            object EDdescripciongar: TEdit
              Left = 9
              Top = 76
              Width = 326
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
              OnKeyPress = EDdescripciongarKeyPress
            end
            object DBlineas: TDBLookupComboBox
              Left = 56
              Top = 16
              Width = 278
              Height = 21
              KeyField = 'ID_LINEA'
              ListField = 'DESCRIPCION_LINEA'
              ListSource = DSlinea
              TabOrder = 0
              OnEnter = DBlineasEnter
              OnExit = DBlineasExit
            end
          end
          object GroupBox8: TGroupBox
            Left = 273
            Top = 143
            Width = 341
            Height = 46
            Caption = 'Destino del Prestamo'
            TabOrder = 2
            object EDdetino: TEdit
              Left = 9
              Top = 16
              Width = 326
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 0
            end
          end
          object BitBtn5: TBitBtn
            Left = 276
            Top = 191
            Width = 165
            Height = 31
            Caption = '&Documentos Exigidos'
            TabOrder = 4
            OnClick = BitBtn5Click
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000220B0000220B00000001000000010000A57B7300E7AD
              73009C948C00C6AD8C00BD9C9400949C9C00BDA59C00849CA500C6ADA500D6BD
              B500FFDEB500CEC6BD00D6C6BD00E7C6BD00F7DEBD00FFDEBD00DECEC600F7DE
              C600FFDEC600A5C6CE00ADC6CE00B5C6CE00FFE7CE00B5D6D600E7DED600F7E7
              D600FFE7D600FFEFD600299CDE0084C6DE00EFE7DE00F7E7DE00F7EFDE00FFEF
              DE008CCEE700B5D6E700F7E7E700E7EFE700F7EFE700FFEFE700FFF7E7008CD6
              EF00FFEFEF00FFF7EF0084D6F7008CDEF70094DEF700F7F7F700FFF7F700FFFF
              F700FF00FF00A5E7FF0084EFFF0094EFFF00A5EFFF00ADEFFF00B5EFFF00BDEF
              FF00C6EFFF00CEEFFF008CF7FF0094F7FF00A5F7FF00ADF7FF00B5F7FF00BDF7
              FF00CEF7FF00D6F7FF00DEF7FF00CEFFFF00DEFFFF00E7FFFF00EFFFFF00F7FF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003232321C1C00
              0000000000000000003232321C292C0B21262020202020200032321C33353C0B
              19191111110E11190032321C3335340B1F160E0E0E0E11190032321C3736350B
              241911110E0E11190032321C3837360B262016161611191E0032321C39413F0B
              2B160F0E0E0A11260032321C3A42410B302B26262020261E0032321C3B44420B
              304A4A302F1E09080032321C3B47440B304A4A4A4A1001033232321C4349470B
              272B2B2A2B0D031C3232321C444A490B0B0B0B0B0B0B1D1C3232321C442F1413
              1313131317462C1C3232321C441006000000000004252E1C323232321C230518
              1919190B07221C3232323232321C1C02020202021C1C32323232}
          end
          object BitBtn7: TBitBtn
            Left = 447
            Top = 191
            Width = 165
            Height = 31
            Caption = '&Oservaciones'
            TabOrder = 5
            OnClick = BitBtn7Click
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000B10B0000B10B00000001000000010000E77B2100C684
              7300B5848400C6A59C00C6ADA500FFD6A500D6B5AD00D6BDB500E7C6B500FFDE
              B500FFEFD600FFF7DE00FFFFEF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000D0102020202
              0202020202020202020D030C0C0C0C0B0B0B0B0A0A0A09090502030E0E0E0E0E
              0C0A0A0A0A0A0A0A0902040E0E0E0E0E0E000000000000000A02040E0A0A0A0A
              0A0A0A0A0A0A0A0A0A02060E0000000000000000000000000A02060E0E0E0E0E
              0E0A0A0A0A0A0A0A0A02070E0E0E0E0E0E000000000000000B02070E0A0A0A0A
              0A0A0A0A0A0A0A0A0B02070E0000000000000000000000000B02080E0E0E0E0E
              0E0A0A0A0A0A0A0A0C02080E0E0E0E0E0E000000000000000C02080E0A0A0A0A
              0A0A0A0A0A0A0A0A0C02080E0000000000000000000000000C02080E0E0E0E0E
              0E0E0E0E0E0E0E0E0C010D08080808080807070606040403030D}
          end
          object BitBtn8: TBitBtn
            Left = 4
            Top = 192
            Width = 134
            Height = 31
            Caption = '&Actualizar Datos'
            TabOrder = 6
            OnClick = BitBtn8Click
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
          object BitBtn9: TBitBtn
            Left = 140
            Top = 192
            Width = 133
            Height = 31
            Caption = 'Imprimir Formulario'
            TabOrder = 7
            OnClick = BitBtn9Click
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888F8800000000000888808888888880808800000000000008080888888BBB88
              0008088888877788080800000000000008800888888888808080800000000008
              0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
              088888880FFFFFFFF08888888000000000888888888888888888}
          end
        end
      end
      object GroupBox15: TGroupBox
        Left = 545
        Top = 91
        Width = 78
        Height = 71
        Caption = 'Seguros'
        TabOrder = 4
        object Svida: TCheckBox
          Left = 56
          Top = 16
          Width = 15
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Vida'
          TabOrder = 0
          OnClick = SvidaClick
        end
        object Sexequial: TCheckBox
          Left = 2
          Top = 40
          Width = 70
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Excequial'
          TabOrder = 1
        end
        object Briesgo: TButton
          Left = 3
          Top = 18
          Width = 51
          Height = 14
          BiDiMode = bdRightToLeft
          Caption = 'Vida'
          ParentBiDiMode = False
          TabOrder = 2
          OnClick = BriesgoClick
        end
      end
    end
    object Tcodeudor: TTabSheet
      Caption = 'Informacion &Codeudores'
      Enabled = False
      ImageIndex = 1
      object GroupBox9: TGroupBox
        Left = 4
        Top = 0
        Width = 509
        Height = 141
        Caption = 'Conyugue y Codeudores'
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 5
          Top = 13
          Width = 498
          Height = 124
          TabStop = False
          DataSource = DScodeudor
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'id_persona'
              Title.Caption = 'Identificacion'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'id_identificacion'
              Title.Caption = 'Identificaci'#243'n'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'nombres'
              Title.Caption = 'Nombres y Apellidos'
              Width = 282
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'definicion'
              Title.Caption = 'Definici'#243'n'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'es_conyugue'
              Visible = False
            end>
        end
      end
      object Panel4: TPanel
        Left = 512
        Top = 6
        Width = 112
        Height = 102
        Color = clOlive
        TabOrder = 1
        object BTagregarc: TBitBtn
          Left = 9
          Top = 2
          Width = 93
          Height = 25
          Caption = '&Agregar'
          TabOrder = 0
          TabStop = False
          OnClick = BTagregarcClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000030F0000030F000000010000000100000094000000C6
            0000319C42004A524A00429C4A0052525200527352005A5A5A00635A5A005AAD
            5A005AB55A004ABD5A005A63630063636300636B63006384630063636B006B63
            6B006B6B6B006B946B00736B7300737373007394730073737B007B737B007B7B
            7B008C847B00738C7B006B9C7B007B9C7B0084CE7B0073D67B007B8484008484
            84007B9484007B9C840073AD84008C848C008C8C8C0094948C008CA58C009494
            940084A594009C949C009C9C9C00A5A5A500ADADAD00B5B5AD00B5B5B500BDB5
            B500BDBDBD00C6BDBD00CEC6BD00C6C6C600D6D6D600FF00FF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373737373737
            3737373737373737373737373737373737373737373737373737373737122C0D
            12212E32322D262937373737370D321212262E3536322D2E3737373737073212
            12212E3536322D2E37373737370D2E0D0712152A00242C263737373737072D0D
            0D212E011F002626373737373708331211212E011F002D2E37373737370C3212
            060F1D011F001D233737373737083010040000010B0000000237373737082D0E
            091E1E1E1F0101010937373737083312061B28011F00161D3737373737082F12
            0D202C011F002C2D373737373707290D071215011F0026263737373737032921
            27292922131C26193737373737371A1814171515151921373737}
        end
        object BTeliminarc: TBitBtn
          Left = 9
          Top = 27
          Width = 93
          Height = 25
          Caption = '&Eliminar'
          TabOrder = 1
          TabStop = False
          OnClick = BTeliminarcClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000E30E0000E30E00000001000000010000424242004A42
            4A0052424A004A4A4A004A524A00525252005A6352005A5A5A005A635A006363
            5A006B635A00525263005A5263005A5A6300635A63005A636300636363006B63
            63006B6B6300635A6B0063636B006B6B6B006B736B00636B7300736B73006B73
            73007373730084737300737B730073737B007B737B0084737B007B7B7B008C84
            7B00848484008C848C00848C8C008C8C8C008C948C00949494009CA594009C9C
            9C000021A500A5A5A500ADADAD00ADADB500B5B5B500BDBDBD006B84C600C6C6
            C600CECECE00D6D6D600E7DED600DEDEDE000029E700526BF700638CF7009494
            F700FF00FF009CB5FF009CBDFF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003A3A3A3A3A3A
            3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A22291A
            101A2C2E2F2B22223A3A3A3A3A03352210202B2F33312C293A3A3A3A3A003322
            101A2B2E33312C293A3A3A3A3A03352210202B2E33312B273A3A3A3A3A032B1A
            071A2B2E2F2B22223A3A3A3A3A003322101A2B2E33312C293A3A3A3A3A003323
            14302A2A2A2A2A2A2A3A3A3A3A003523102A363636363636362A3A3A3A022B1A
            10302A2A2A2A2A2A2A3A3A3A3A023423111A2B2C32312B273A3A3A3A3A023423
            0916292C322F2B273A3A3A3A3A022B1A1316272C322F2B253A3A3A3A3A042D25
            282B2B2B2C2B25203A3A3A3A3A3A211E181D1A1A1A20223A3A3A}
        end
        object limpiar: TBitBtn
          Left = 9
          Top = 52
          Width = 93
          Height = 25
          Caption = 'Limpiar'
          TabOrder = 2
          TabStop = False
          OnClick = limpiarClick
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
        object modificar: TBitBtn
          Left = 9
          Top = 77
          Width = 93
          Height = 25
          Caption = '&Modificar'
          Enabled = False
          TabOrder = 3
          OnClick = modificarClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000F30E0000F30E000000010000000100002D2D2D001855
            6F0042424200454442004A4A4A0052424A004A524A0058534E0063635A00635A
            6B005160610054777B00636363006B6363006B736B00736B7300737373007373
            7B007B737B007C7078007B7B7B00B56D3E00C1713500C07638008A5B5200947E
            7500AD7B73008C847B00EFA65A00EDA75F00F0A85C0000009A000316AC004174
            9600477AA9000018C6001029D600106BFF00FF00FF0035A8F5004A9EED006D8A
            FD00848484008C848C008C8C8C00949494009C9C9C009CA594009891A200A5A5
            A500ADADAD00ADADB500B5B5B500BDBDBD00F1BC8600F8C28C00F9C48D00FBD3
            A900C6C6C600D6D6D600DEDEDE00E7DED6000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000262626262626
            26262626262626262626262626262626262626262626262626262626262A2E10
            0C10323435312A2A2626262626043C2A0C1431353B3A322E2626262626020007
            0C1031343B3A322E26262626260407030A1431343B3A312D262626262604310B
            2201183435312A2A2626262626023B0B211916183B3A322E2626262626023B2B
            13361E17183A322E2626262626023C2B1A39381C1718322E2626262626053110
            0C1A39381E1618142626262626053D2B0D101A39371D15182626262626053D2B
            080E2E1A393027201F26262626053110090E2D321A282424201F26262606332C
            2F313131322329252426262626261B120F111010101423232626}
        end
      end
      object Panel5: TPanel
        Left = 512
        Top = 109
        Width = 112
        Height = 32
        TabOrder = 2
        object Cesconyugue: TCheckBox
          Left = -1
          Top = 1
          Width = 110
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          Caption = 'Es Con&yuge'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = CesconyugueClick
        end
        object Cescodeudor: TCheckBox
          Left = -1
          Top = 16
          Width = 110
          Height = 16
          TabStop = False
          Alignment = taLeftJustify
          Caption = 'Es Con-Code&ud'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = CescodeudorClick
        end
      end
      object JvGroupBox4: TJvGroupBox
        Left = 4
        Top = 138
        Width = 381
        Height = 60
        Caption = 'Datos Identificacion'
        TabOrder = 3
        object Label45: TLabel
          Left = 4
          Top = 16
          Width = 76
          Height = 13
          Caption = 'T. Identificacion'
        end
        object Label46: TLabel
          Left = 248
          Top = 16
          Width = 37
          Height = 13
          Caption = 'Numero'
        end
        object JvLabel17: TJvLabel
          Left = 8
          Top = 38
          Width = 60
          Height = 13
          Caption = 'Expedida En'
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvLabel20: TJvLabel
          Left = 247
          Top = 38
          Width = 34
          Height = 13
          Caption = 'Cuenta'
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object DBidentificacioncod: TDBLookupComboBox
          Left = 85
          Top = 14
          Width = 162
          Height = 21
          KeyField = 'ID_IDENTIFICACION'
          ListField = 'DESCRIPCION_IDENTIFICACION'
          ListSource = DSidentificacion
          TabOrder = 0
          OnEnter = DBidentificacioncodEnter
        end
        object JVidentificacionCod: TJvEdit
          Left = 290
          Top = 14
          Width = 86
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
          TabOrder = 1
          OnExit = JVidentificacionCodExit
        end
        object JVorigencod: TJvEdit
          Left = 85
          Top = 36
          Width = 157
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
          TabOrder = 2
        end
        object JVcuentac: TJvStaticText
          Left = 290
          Top = 36
          Width = 86
          Height = 21
          TextMargins.X = 0
          TextMargins.Y = 0
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clCaptionText
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          Layout = tlTop
          ParentColor = False
          TabOrder = 3
          WordWrap = False
        end
      end
      object JvGroupBox5: TJvGroupBox
        Left = 384
        Top = 138
        Width = 241
        Height = 60
        Caption = 'Datos Personales'
        TabOrder = 4
        object JvLabel14: TJvLabel
          Left = 4
          Top = 16
          Width = 42
          Height = 13
          Caption = 'Nombres'
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvLabel21: TJvLabel
          Left = 4
          Top = 38
          Width = 40
          Height = 13
          Caption = 'Apelidos'
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clBlack
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JVnombrecod: TJvEdit
          Left = 50
          Top = 14
          Width = 183
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
          CharCase = ecUpperCase
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 0
        end
        object JVapellido2cod: TJvEdit
          Left = 143
          Top = 36
          Width = 90
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
          CharCase = ecUpperCase
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 2
        end
        object JVapellido1cod: TJvEdit
          Left = 50
          Top = 36
          Width = 92
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
          CharCase = ecUpperCase
          PasswordChar = #0
          ReadOnly = False
          TabOrder = 1
        end
      end
      object Paginac: TPageControl
        Left = 4
        Top = 197
        Width = 619
        Height = 217
        ActivePage = Tcodeudores
        Images = ImageList1
        TabIndex = 2
        TabOrder = 5
        object Tdireccion: TTabSheet
          Caption = '1. Informacion &General'
          ImageIndex = 8
          object GroupBox10: TGroupBox
            Left = 8
            Top = 3
            Width = 585
            Height = 185
            Caption = 'Datos Residencia'
            TabOrder = 0
            object Label47: TLabel
              Left = 5
              Top = 34
              Width = 33
              Height = 13
              Caption = 'Ciudad'
            end
            object Label48: TLabel
              Left = 291
              Top = 34
              Width = 27
              Height = 13
              Caption = 'Barrio'
            end
            object Label49: TLabel
              Left = 191
              Top = 90
              Width = 51
              Height = 13
              Caption = 'Telefono 2'
            end
            object Label50: TLabel
              Left = 5
              Top = 62
              Width = 45
              Height = 13
              Caption = 'Direcci'#243'n'
            end
            object Label51: TLabel
              Left = 5
              Top = 90
              Width = 51
              Height = 13
              Caption = 'Telefono 1'
            end
            object JvLabel19: TJvLabel
              Left = 191
              Top = 119
              Width = 62
              Height = 13
              Caption = 'Nivel Estudio'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel18: TJvLabel
              Left = 383
              Top = 119
              Width = 55
              Height = 13
              Caption = 'Estado Civil'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object Label52: TLabel
              Left = 5
              Top = 119
              Width = 62
              Height = 13
              Caption = 'Permanencia'
            end
            object JvLabel15: TJvLabel
              Left = 383
              Top = 90
              Width = 65
              Height = 13
              Caption = 'Tipo Vivienda'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object EDciudadcod: TEdit
              Left = 76
              Top = 32
              Width = 202
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 0
            end
            object EDbarriocod: TEdit
              Left = 324
              Top = 32
              Width = 250
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object EDdireccioncod: TEdit
              Left = 76
              Top = 60
              Width = 498
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object EDtelefono1cod: TEdit
              Left = 76
              Top = 88
              Width = 109
              Height = 21
              TabOrder = 3
            end
            object EDtelefono2cod: TEdit
              Left = 256
              Top = 88
              Width = 123
              Height = 21
              TabOrder = 4
            end
            object DBestudiocod: TDBLookupComboBox
              Left = 256
              Top = 117
              Width = 123
              Height = 21
              KeyField = 'ID_NIVEL'
              ListField = 'DESCRIPCION_NIVEL'
              ListSource = DSnivelestudio
              TabOrder = 7
            end
            object DBcivilcod: TDBLookupComboBox
              Left = 458
              Top = 117
              Width = 119
              Height = 21
              KeyField = 'ID_TIPO_ESTADO_CIVIL'
              ListField = 'DESCRIPCION_ESTADO_CIVIL'
              ListSource = DSestadocivil
              TabOrder = 8
              OnExit = DBcivilcodExit
            end
            object JVpermanenciacod: TJvIntegerEdit
              Left = 76
              Top = 117
              Width = 108
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 6
              Value = 0
              MaxValue = 0
              MinValue = 0
              HasMaxValue = False
              HasMinValue = False
            end
            object DBtipoviviendacod: TDBLookupComboBox
              Left = 458
              Top = 88
              Width = 119
              Height = 21
              KeyField = 'ID_TIPOVIVIENDA'
              ListField = 'DESCRIPCION_TIPO'
              ListSource = DStipovivienda
              TabOrder = 5
            end
            object BitBtn6: TBitBtn
              Left = 125
              Top = 148
              Width = 337
              Height = 31
              Caption = '&Documentos Exigidos'
              TabOrder = 9
              OnClick = BitBtn6Click
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDD337777777
                777DDD3888FFFFFFFF7DD38888FF88888F7DD38888FF88888F7DD38888FF8888
                8F7DD38888FFFFF8FF7DD3FF88FF88888F7DD3FFF8FFFFFFFF7DD3FFF8FFFFFF
                887DD3FFF8FFFFF888DDD3FFF8FFFFF883DDD3FFF888888883DDD3FF8888888F
                83DDD3F88777778F83DDDD3878FFF8783DDDDDD337777733DDDD}
            end
          end
        end
        object Tlaboral: TTabSheet
          Caption = '2. Informaci'#243'n &Laboral'
          ImageIndex = 7
          object JvLabel30: TJvLabel
            Left = 261
            Top = 169
            Width = 65
            Height = 13
            Caption = 'T. Ingresos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object JvLabel31: TJvLabel
            Left = 435
            Top = 169
            Width = 62
            Height = 13
            Caption = 'T. Egresos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object GroupBox11: TGroupBox
            Left = 2
            Top = -2
            Width = 255
            Height = 192
            Caption = 'Profesi'#243'n u Oficio'
            TabOrder = 0
            object Label53: TLabel
              Left = 8
              Top = 15
              Width = 52
              Height = 13
              Caption = 'Ocupaci'#243'n'
            end
            object Label54: TLabel
              Left = 8
              Top = 38
              Width = 44
              Height = 13
              Caption = 'Profesi'#243'n'
            end
            object Label55: TLabel
              Left = 8
              Top = 59
              Width = 41
              Height = 13
              Caption = 'Empresa'
            end
            object Label56: TLabel
              Left = 8
              Top = 81
              Width = 28
              Height = 13
              Caption = 'Cargo'
            end
            object Label57: TLabel
              Left = 8
              Top = 104
              Width = 45
              Height = 13
              Caption = 'Direcci'#243'n'
            end
            object Label58: TLabel
              Left = 8
              Top = 126
              Width = 42
              Height = 13
              Caption = 'Telefono'
            end
            object Label59: TLabel
              Left = 141
              Top = 129
              Width = 17
              Height = 13
              Caption = 'Fax'
            end
            object Label60: TLabel
              Left = 8
              Top = 173
              Width = 68
              Height = 13
              Caption = 'Fecha Ingreso'
            end
            object Label98: TLabel
              Left = 10
              Top = 150
              Width = 33
              Height = 13
              Caption = 'Ciudad'
            end
            object Cocupacioncod: TComboBox
              Left = 64
              Top = 13
              Width = 180
              Height = 21
              ItemHeight = 13
              MaxLength = 103
              TabOrder = 0
              Items.Strings = (
                'EMPLEADO'
                'ESTUDIANTE'
                'INDEPENDIENTE'
                'PENSIONADO O JUBILADO'
                'AMA DE CASA'
                'AGRICULTOR')
            end
            object EDprofesioncod: TEdit
              Left = 64
              Top = 36
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object Edempresacod: TEdit
              Left = 64
              Top = 57
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object EDcargocod: TEdit
              Left = 64
              Top = 80
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 3
            end
            object EDdireccionempresa: TEdit
              Left = 64
              Top = 103
              Width = 180
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 4
            end
            object EDtelefonocod: TEdit
              Left = 64
              Top = 125
              Width = 75
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 5
            end
            object Edfaxcod: TEdit
              Left = 162
              Top = 126
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 6
            end
            object TDfechacod: TDateTimePicker
              Left = 80
              Top = 171
              Width = 165
              Height = 21
              CalAlignment = dtaLeft
              Date = 38226.65204625
              Time = 38226.65204625
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 8
            end
            object EDcodciudad: TEdit
              Left = 64
              Top = 149
              Width = 178
              Height = 21
              TabOrder = 7
            end
          end
          object GroupBox12: TGroupBox
            Left = 255
            Top = -2
            Width = 354
            Height = 61
            Caption = 'Ingresos Mensuales'
            TabOrder = 1
            object Label61: TLabel
              Left = 10
              Top = 16
              Width = 87
              Height = 13
              Caption = 'Actividad Principal'
            end
            object JvLabel16: TJvLabel
              Left = 211
              Top = 17
              Width = 25
              Height = 13
              Caption = 'Otros'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel22: TJvLabel
              Left = 8
              Top = 39
              Width = 93
              Height = 13
              Caption = 'Des. Otros Ingresos'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JVactividadcod: TJvCurrencyEdit
              Left = 106
              Top = 14
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 0
              OnEnter = JVactividadcodEnter
              OnExit = JVactividadcodExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVotroscod: TJvCurrencyEdit
              Left = 244
              Top = 15
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 1
              OnEnter = JVotroscodEnter
              OnExit = JVotroscodExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVdescripcioning: TJvEdit
              Left = 105
              Top = 37
              Width = 241
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
              TabOrder = 2
              OnEnter = JVdescripcioningEnter
            end
          end
          object JvGroupBox6: TJvGroupBox
            Left = 255
            Top = 57
            Width = 354
            Height = 108
            Caption = 'Egreos Mensuales'
            TabOrder = 2
            object JvLabel23: TJvLabel
              Left = 10
              Top = 17
              Width = 39
              Height = 13
              Caption = 'Arriendo'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel24: TJvLabel
              Left = 10
              Top = 39
              Width = 43
              Height = 13
              Caption = 'Servicios'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel25: TJvLabel
              Left = 10
              Top = 61
              Width = 37
              Height = 13
              Caption = 'Deudas'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel26: TJvLabel
              Left = 8
              Top = 85
              Width = 91
              Height = 13
              Caption = 'Des. Otros Egresos'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel27: TJvLabel
              Left = 175
              Top = 61
              Width = 25
              Height = 13
              Caption = 'Otros'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel28: TJvLabel
              Left = 175
              Top = 39
              Width = 45
              Height = 13
              Caption = 'Alimentos'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object JvLabel29: TJvLabel
              Left = 175
              Top = 17
              Width = 51
              Height = 13
              Caption = 'Transporte'
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clBlack
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
            end
            object jvarriendocod: TJvCurrencyEdit
              Left = 59
              Top = 15
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 0
              OnEnter = jvarriendocodEnter
              OnExit = jvarriendocodExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVtransportecod: TJvCurrencyEdit
              Left = 233
              Top = 15
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 3
              OnEnter = JVtransportecodEnter
              OnExit = JVtransportecodExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVservicioscod: TJvCurrencyEdit
              Left = 59
              Top = 37
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 1
              OnEnter = JVservicioscodEnter
              OnExit = JVservicioscodExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JValimentoscod: TJvCurrencyEdit
              Left = 233
              Top = 37
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 4
              OnEnter = JValimentoscodEnter
              OnExit = JValimentoscodExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVdeudascod: TJvCurrencyEdit
              Left = 59
              Top = 59
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 2
              OnEnter = JVdeudascodEnter
              OnExit = JVdeudascodExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVegresoscod: TJvCurrencyEdit
              Left = 233
              Top = 59
              Width = 100
              Height = 21
              Alignment = taRightJustify
              ReadOnly = False
              TabOrder = 5
              OnEnter = JVegresoscodEnter
              OnExit = JVegresoscodExit
              HasMaxValue = False
              HasMinValue = False
            end
            object JVdescripcioncod: TJvEdit
              Left = 105
              Top = 83
              Width = 241
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
              TabOrder = 6
              OnEnter = JVdescripcioncodEnter
              OnExit = JVdescripcioncodExit
            end
          end
          object JVtotalingresocod: TJvCurrencyEdit
            Left = 332
            Top = 167
            Width = 103
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = False
            TabOrder = 3
            HasMaxValue = False
            HasMinValue = False
          end
          object JVtotalegresocod: TJvCurrencyEdit
            Left = 500
            Top = 167
            Width = 104
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = False
            TabOrder = 4
            HasMaxValue = False
            HasMinValue = False
          end
        end
        object Tcodeudores: TTabSheet
          Caption = '3. Inf. C&rediticia'
          ImageIndex = 6
          object Label62: TLabel
            Left = 7
            Top = 118
            Width = 36
            Height = 13
            Caption = 'Entidad'
          end
          object Label63: TLabel
            Left = 7
            Top = 142
            Width = 54
            Height = 13
            Caption = 'Valor Inicial'
          end
          object Label64: TLabel
            Left = 210
            Top = 142
            Width = 27
            Height = 13
            Caption = 'Saldo'
          end
          object Label65: TLabel
            Left = 7
            Top = 166
            Width = 71
            Height = 13
            Caption = 'Cuota Mensual'
          end
          object Label66: TLabel
            Left = 210
            Top = 166
            Width = 58
            Height = 13
            Caption = 'Vencimiento'
          end
          object DBGrid2: TDBGrid
            Left = 4
            Top = 2
            Width = 601
            Height = 106
            DataSource = DTcrediticiacod
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGrid2CellClick
            OnColExit = DBGrid2ColExit
            OnDrawColumnCell = DBGrid2DrawColumnCell
            OnDblClick = DBGrid2DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'id_colocacion'
                Title.Caption = 'COLOCACION'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor_inicial'
                Title.Caption = 'VALOR I'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'saldo'
                Title.Caption = 'SALDO'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cuota_mensual'
                Title.Caption = 'CUOTA MENSUAL'
                Width = 90
                Visible = True
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
                FieldName = 'fecha_capital'
                Title.Caption = 'FECHA K'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'fecha_interes'
                Title.Caption = 'FECHA I'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'desc_estado'
                Title.Caption = 'ESTADO'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'entidad'
                Title.Caption = 'ENTIDAD'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vencimiento'
                Title.Caption = 'FECHA VENC.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'criterio'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'estado'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'es_descuento'
                Title.Caption = 'Dto'
                Width = 20
                Visible = True
              end>
          end
          object Panel6: TPanel
            Left = 411
            Top = 110
            Width = 199
            Height = 72
            Color = clOlive
            TabOrder = 0
            object BTagregarcod: TBitBtn
              Left = 7
              Top = 10
              Width = 90
              Height = 25
              Caption = '&Agregar'
              TabOrder = 0
              OnClick = BTagregarcodClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000030F0000030F000000010000000100000094000000C6
                0000319C42004A524A00429C4A0052525200527352005A5A5A00635A5A005AAD
                5A005AB55A004ABD5A005A63630063636300636B63006384630063636B006B63
                6B006B6B6B006B946B00736B7300737373007394730073737B007B737B007B7B
                7B008C847B00738C7B006B9C7B007B9C7B0084CE7B0073D67B007B8484008484
                84007B9484007B9C840073AD84008C848C008C8C8C0094948C008CA58C009494
                940084A594009C949C009C9C9C00A5A5A500ADADAD00B5B5AD00B5B5B500BDB5
                B500BDBDBD00C6BDBD00CEC6BD00C6C6C600D6D6D600FF00FF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373737373737
                3737373737373737373737373737373737373737373737373737373737122C0D
                12212E32322D262937373737370D321212262E3536322D2E3737373737073212
                12212E3536322D2E37373737370D2E0D0712152A00242C263737373737072D0D
                0D212E011F002626373737373708331211212E011F002D2E37373737370C3212
                060F1D011F001D233737373737083010040000010B0000000237373737082D0E
                091E1E1E1F0101010937373737083312061B28011F00161D3737373737082F12
                0D202C011F002C2D373737373707290D071215011F0026263737373737032921
                27292922131C26193737373737371A1814171515151921373737}
            end
            object BTlimpiarcod: TBitBtn
              Left = 105
              Top = 10
              Width = 90
              Height = 25
              Caption = '&Limpiar'
              TabOrder = 1
              OnClick = BTlimpiarcodClick
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
            object BTmodificarcod: TBitBtn
              Left = 7
              Top = 40
              Width = 90
              Height = 25
              Caption = '&Modificar'
              Enabled = False
              TabOrder = 2
              OnClick = BTmodificarcodClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000F30E0000F30E000000010000000100002D2D2D001855
                6F0042424200454442004A4A4A0052424A004A524A0058534E0063635A00635A
                6B005160610054777B00636363006B6363006B736B00736B7300737373007373
                7B007B737B007C7078007B7B7B00B56D3E00C1713500C07638008A5B5200947E
                7500AD7B73008C847B00EFA65A00EDA75F00F0A85C0000009A000316AC004174
                9600477AA9000018C6001029D600106BFF00FF00FF0035A8F5004A9EED006D8A
                FD00848484008C848C008C8C8C00949494009C9C9C009CA594009891A200A5A5
                A500ADADAD00ADADB500B5B5B500BDBDBD00F1BC8600F8C28C00F9C48D00FBD3
                A900C6C6C600D6D6D600DEDEDE00E7DED6000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000262626262626
                26262626262626262626262626262626262626262626262626262626262A2E10
                0C10323435312A2A2626262626043C2A0C1431353B3A322E2626262626020007
                0C1031343B3A322E26262626260407030A1431343B3A312D262626262604310B
                2201183435312A2A2626262626023B0B211916183B3A322E2626262626023B2B
                13361E17183A322E2626262626023C2B1A39381C1718322E2626262626053110
                0C1A39381E1618142626262626053D2B0D101A39371D15182626262626053D2B
                080E2E1A393027201F26262626053110090E2D321A282424201F26262606332C
                2F313131322329252426262626261B120F111010101423232626}
            end
            object BTeliminarcod: TBitBtn
              Left = 105
              Top = 40
              Width = 90
              Height = 25
              Caption = 'Eli&minar'
              TabOrder = 3
              OnClick = BTeliminarcodClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000E30E0000E30E00000001000000010000424242004A42
                4A0052424A004A4A4A004A524A00525252005A6352005A5A5A005A635A006363
                5A006B635A00525263005A5263005A5A6300635A63005A636300636363006B63
                63006B6B6300635A6B0063636B006B6B6B006B736B00636B7300736B73006B73
                73007373730084737300737B730073737B007B737B0084737B007B7B7B008C84
                7B00848484008C848C00848C8C008C8C8C008C948C00949494009CA594009C9C
                9C000021A500A5A5A500ADADAD00ADADB500B5B5B500BDBDBD006B84C600C6C6
                C600CECECE00D6D6D600E7DED600DEDEDE000029E700526BF700638CF7009494
                F700FF00FF009CB5FF009CBDFF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003A3A3A3A3A3A
                3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A22291A
                101A2C2E2F2B22223A3A3A3A3A03352210202B2F33312C293A3A3A3A3A003322
                101A2B2E33312C293A3A3A3A3A03352210202B2E33312B273A3A3A3A3A032B1A
                071A2B2E2F2B22223A3A3A3A3A003322101A2B2E33312C293A3A3A3A3A003323
                14302A2A2A2A2A2A2A3A3A3A3A003523102A363636363636362A3A3A3A022B1A
                10302A2A2A2A2A2A2A3A3A3A3A023423111A2B2C32312B273A3A3A3A3A023423
                0916292C322F2B273A3A3A3A3A022B1A1316272C322F2B253A3A3A3A3A042D25
                282B2B2B2C2B25203A3A3A3A3A3A211E181D1A1A1A20223A3A3A}
            end
          end
          object EDentidadcod: TEdit
            Left = 86
            Top = 116
            Width = 314
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
          object JVvalorinicialcod: TJvCurrencyEdit
            Left = 86
            Top = 140
            Width = 121
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 3
            OnEnter = JVvalorinicialcodEnter
            HasMaxValue = False
            HasMinValue = False
          end
          object JVsaldocod: TJvCurrencyEdit
            Left = 283
            Top = 140
            Width = 121
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 4
            OnEnter = JVsaldocodEnter
            HasMaxValue = False
            HasMinValue = False
          end
          object JVmensualcod: TJvCurrencyEdit
            Left = 86
            Top = 164
            Width = 121
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 5
            HasMaxValue = False
            HasMinValue = False
          end
          object DTfechacod: TDateTimePicker
            Left = 283
            Top = 164
            Width = 121
            Height = 21
            CalAlignment = dtaLeft
            Date = 0.747950659701019
            Time = 0.747950659701019
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 6
            OnExit = DTfechacodExit
          end
          object DBCheckBox2: TDBCheckBox
            Left = -48
            Top = -64
            Width = 10
            Height = 17
            DataField = 'es_descuento'
            DataSource = DTcrediticiacod
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object TabSheet4: TTabSheet
          Caption = '4. &Bienes Raices'
          ImageIndex = 5
          object Label67: TLabel
            Left = 366
            Top = 132
            Width = 28
            Height = 13
            Hint = 'Descripci'#243'n de l Bien'
            Caption = 'Desc.'
            ParentShowHint = False
            ShowHint = True
          end
          object Label68: TLabel
            Left = 366
            Top = 108
            Width = 27
            Height = 13
            Caption = 'Barrio'
          end
          object Label69: TLabel
            Left = 1
            Top = 130
            Width = 45
            Height = 13
            Caption = 'Direcci'#243'n'
          end
          object Label70: TLabel
            Left = 2
            Top = 107
            Width = 33
            Height = 13
            Caption = 'Ciudad'
          end
          object Label71: TLabel
            Left = 183
            Top = 130
            Width = 24
            Height = 13
            Caption = 'Valor'
          end
          object JvLabel32: TJvLabel
            Left = 88
            Top = 149
            Width = 49
            Height = 13
            Caption = 'A favor de'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clBlack
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object Label87: TLabel
            Left = 181
            Top = 87
            Width = 41
            Height = 13
            Caption = 'Escritura'
          end
          object Label88: TLabel
            Left = 180
            Top = 108
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          object Label89: TLabel
            Left = 0
            Top = 87
            Width = 43
            Height = 13
            Caption = 'Matricula'
          end
          object Label90: TLabel
            Left = 366
            Top = 89
            Width = 34
            Height = 13
            Caption = 'Notaria'
          end
          object Chipotecacod: TCheckBox
            Left = 1
            Top = 149
            Width = 70
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Hipoteca'
            TabOrder = 9
          end
          object DBGrid3: TDBGrid
            Left = 4
            Top = 6
            Width = 601
            Height = 77
            TabStop = False
            DataSource = DSbienescod
            ReadOnly = True
            TabOrder = 14
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGrid3CellClick
            Columns = <
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
                FieldName = 'descripcion_bien'
                Title.Caption = 'Descripcion'
                Width = 159
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'barrio'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'direccion'
                Title.Caption = 'Direccion'
                Width = 147
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ciudad'
                Title.Caption = 'Ciudad'
                Width = 132
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor_comercial'
                Title.Caption = 'Valor'
                Width = 125
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'eshipteca'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'afavorde'
                Visible = False
              end>
          end
          object EDdescripcionbiencod: TEdit
            Left = 405
            Top = 127
            Width = 104
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 8
          end
          object EDbarriobiencod: TEdit
            Left = 405
            Top = 106
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 5
          end
          object EDdireccionbiencod: TEdit
            Left = 58
            Top = 127
            Width = 120
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 6
          end
          object EDciudadbiencod: TEdit
            Left = 58
            Top = 106
            Width = 121
            Height = 21
            Hint = 'Ciudad de la Escritura'
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object EDafavordecod: TEdit
            Left = 144
            Top = 148
            Width = 364
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 10
          end
          object JVvalorbiencod: TJvCurrencyEdit
            Left = 237
            Top = 127
            Width = 125
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 7
            OnEnter = JVvalorbiencodEnter
            HasMaxValue = False
            HasMinValue = False
          end
          object Panel7: TPanel
            Left = 512
            Top = 83
            Width = 95
            Height = 103
            Color = clOlive
            TabOrder = 13
            object BTagregarcodb: TBitBtn
              Left = 3
              Top = 3
              Width = 90
              Height = 25
              Caption = '&Agregar'
              TabOrder = 0
              OnClick = BTagregarcodbClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000030F0000030F000000010000000100000094000000C6
                0000319C42004A524A00429C4A0052525200527352005A5A5A00635A5A005AAD
                5A005AB55A004ABD5A005A63630063636300636B63006384630063636B006B63
                6B006B6B6B006B946B00736B7300737373007394730073737B007B737B007B7B
                7B008C847B00738C7B006B9C7B007B9C7B0084CE7B0073D67B007B8484008484
                84007B9484007B9C840073AD84008C848C008C8C8C0094948C008CA58C009494
                940084A594009C949C009C9C9C00A5A5A500ADADAD00B5B5AD00B5B5B500BDB5
                B500BDBDBD00C6BDBD00CEC6BD00C6C6C600D6D6D600FF00FF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373737373737
                3737373737373737373737373737373737373737373737373737373737122C0D
                12212E32322D262937373737370D321212262E3536322D2E3737373737073212
                12212E3536322D2E37373737370D2E0D0712152A00242C263737373737072D0D
                0D212E011F002626373737373708331211212E011F002D2E37373737370C3212
                060F1D011F001D233737373737083010040000010B0000000237373737082D0E
                091E1E1E1F0101010937373737083312061B28011F00161D3737373737082F12
                0D202C011F002C2D373737373707290D071215011F0026263737373737032921
                27292922131C26193737373737371A1814171515151921373737}
            end
            object BTlimpiarcodb: TBitBtn
              Left = 3
              Top = 53
              Width = 90
              Height = 25
              Caption = '&Limpiar'
              TabOrder = 1
              OnClick = BTlimpiarcodbClick
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
            object BTmodificarcodb: TBitBtn
              Left = 3
              Top = 28
              Width = 90
              Height = 25
              Caption = '&Modificar'
              Enabled = False
              TabOrder = 2
              OnClick = BTmodificarcodbClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000F30E0000F30E000000010000000100002D2D2D001855
                6F0042424200454442004A4A4A0052424A004A524A0058534E0063635A00635A
                6B005160610054777B00636363006B6363006B736B00736B7300737373007373
                7B007B737B007C7078007B7B7B00B56D3E00C1713500C07638008A5B5200947E
                7500AD7B73008C847B00EFA65A00EDA75F00F0A85C0000009A000316AC004174
                9600477AA9000018C6001029D600106BFF00FF00FF0035A8F5004A9EED006D8A
                FD00848484008C848C008C8C8C00949494009C9C9C009CA594009891A200A5A5
                A500ADADAD00ADADB500B5B5B500BDBDBD00F1BC8600F8C28C00F9C48D00FBD3
                A900C6C6C600D6D6D600DEDEDE00E7DED6000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000262626262626
                26262626262626262626262626262626262626262626262626262626262A2E10
                0C10323435312A2A2626262626043C2A0C1431353B3A322E2626262626020007
                0C1031343B3A322E26262626260407030A1431343B3A312D262626262604310B
                2201183435312A2A2626262626023B0B211916183B3A322E2626262626023B2B
                13361E17183A322E2626262626023C2B1A39381C1718322E2626262626053110
                0C1A39381E1618142626262626053D2B0D101A39371D15182626262626053D2B
                080E2E1A393027201F26262626053110090E2D321A282424201F26262606332C
                2F313131322329252426262626261B120F111010101423232626}
            end
            object BTeliminarcodb: TBitBtn
              Left = 3
              Top = 78
              Width = 90
              Height = 25
              Caption = '&Eliminar'
              TabOrder = 3
              OnClick = BTeliminarcodbClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000E30E0000E30E00000001000000010000424242004A42
                4A0052424A004A4A4A004A524A00525252005A6352005A5A5A005A635A006363
                5A006B635A00525263005A5263005A5A6300635A63005A636300636363006B63
                63006B6B6300635A6B0063636B006B6B6B006B736B00636B7300736B73006B73
                73007373730084737300737B730073737B007B737B0084737B007B7B7B008C84
                7B00848484008C848C00848C8C008C8C8C008C948C00949494009CA594009C9C
                9C000021A500A5A5A500ADADAD00ADADB500B5B5B500BDBDBD006B84C600C6C6
                C600CECECE00D6D6D600E7DED600DEDEDE000029E700526BF700638CF7009494
                F700FF00FF009CB5FF009CBDFF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003A3A3A3A3A3A
                3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A22291A
                101A2C2E2F2B22223A3A3A3A3A03352210202B2F33312C293A3A3A3A3A003322
                101A2B2E33312C293A3A3A3A3A03352210202B2E33312B273A3A3A3A3A032B1A
                071A2B2E2F2B22223A3A3A3A3A003322101A2B2E33312C293A3A3A3A3A003323
                14302A2A2A2A2A2A2A3A3A3A3A003523102A363636363636362A3A3A3A022B1A
                10302A2A2A2A2A2A2A3A3A3A3A023423111A2B2C32312B273A3A3A3A3A023423
                0916292C322F2B273A3A3A3A3A022B1A1316272C322F2B253A3A3A3A3A042D25
                282B2B2B2C2B25203A3A3A3A3A3A211E181D1A1A1A20223A3A3A}
            end
          end
          object EDescritura: TEdit
            Left = 237
            Top = 85
            Width = 125
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object DTfecha: TDateTimePicker
            Left = 237
            Top = 106
            Width = 125
            Height = 19
            Hint = 'Fecha de la Escritura'
            CalAlignment = dtaLeft
            Date = 38262.339744456
            Time = 38262.339744456
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object EDmatricula: TEdit
            Left = 58
            Top = 85
            Width = 120
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object EDnotaria: TEdit
            Left = 405
            Top = 85
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
          object Rinformacion: TRadioButton
            Left = 4
            Top = 169
            Width = 113
            Height = 17
            Alignment = taLeftJustify
            Caption = '&Informaci'#243'n'
            TabOrder = 11
            TabStop = True
            Visible = False
          end
          object Rpersonal: TRadioButton
            Left = 69
            Top = 169
            Width = 135
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Garantia &Personal'
            Checked = True
            TabOrder = 12
            TabStop = True
          end
          object Rreal: TRadioButton
            Left = 329
            Top = 169
            Width = 130
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Garantia &Real'
            TabOrder = 15
          end
        end
        object TabSheet5: TTabSheet
          Caption = '5. &Vehiculos    '
          ImageIndex = 3
          object Label72: TLabel
            Left = 7
            Top = 112
            Width = 56
            Height = 13
            Caption = 'Descripcion'
          end
          object Label73: TLabel
            Left = 7
            Top = 136
            Width = 30
            Height = 13
            Caption = 'Marca'
          end
          object Label74: TLabel
            Left = 8
            Top = 160
            Width = 27
            Height = 13
            Caption = 'Valor '
          end
          object Label75: TLabel
            Left = 195
            Top = 136
            Width = 81
            Height = 13
            Caption = 'Numero de placa'
          end
          object Label29: TLabel
            Left = 232
            Top = 112
            Width = 35
            Height = 13
            Caption = 'Modelo'
          end
          object DBGrid4: TDBGrid
            Left = 0
            Top = 0
            Width = 691
            Height = 106
            TabStop = False
            DataSource = DSmaquinariacod
            ReadOnly = True
            TabOrder = 6
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGrid4CellClick
            Columns = <
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
                FieldName = 'descripcion'
                Title.Caption = 'Descripcion'
                Width = 203
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'placa'
                Title.Caption = 'Placa'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'marca'
                Title.Caption = 'Marca'
                Width = 111
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Caption = 'Valor'
                Width = 105
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'estado'
                Title.Caption = 'Pignorado'
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pignorado'
                Visible = False
              end>
          end
          object EDdescripcioncodv: TEdit
            Left = 69
            Top = 110
            Width = 156
            Height = 21
            TabOrder = 0
          end
          object EDmarcacodv: TEdit
            Left = 69
            Top = 134
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object EDplacacodv: TEdit
            Left = 283
            Top = 134
            Width = 121
            Height = 21
            TabOrder = 3
          end
          object Chpigcoradocod: TCheckBox
            Left = 195
            Top = 160
            Width = 102
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Pignorado'
            TabOrder = 5
            OnClick = ChpigcoradocodClick
          end
          object JVvalorcodv: TJvCurrencyEdit
            Left = 69
            Top = 158
            Width = 121
            Height = 21
            Alignment = taRightJustify
            ReadOnly = False
            TabOrder = 4
            OnEnter = JVvalorcodvEnter
            HasMaxValue = False
            HasMinValue = False
          end
          object Panel8: TPanel
            Left = 411
            Top = 110
            Width = 199
            Height = 72
            Color = clOlive
            TabOrder = 7
            object BTagregarcodv: TBitBtn
              Left = 8
              Top = 8
              Width = 91
              Height = 25
              Caption = '&Agregar'
              TabOrder = 0
              OnClick = BTagregarcodvClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000030F0000030F000000010000000100000094000000C6
                0000319C42004A524A00429C4A0052525200527352005A5A5A00635A5A005AAD
                5A005AB55A004ABD5A005A63630063636300636B63006384630063636B006B63
                6B006B6B6B006B946B00736B7300737373007394730073737B007B737B007B7B
                7B008C847B00738C7B006B9C7B007B9C7B0084CE7B0073D67B007B8484008484
                84007B9484007B9C840073AD84008C848C008C8C8C0094948C008CA58C009494
                940084A594009C949C009C9C9C00A5A5A500ADADAD00B5B5AD00B5B5B500BDB5
                B500BDBDBD00C6BDBD00CEC6BD00C6C6C600D6D6D600FF00FF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373737373737
                3737373737373737373737373737373737373737373737373737373737122C0D
                12212E32322D262937373737370D321212262E3536322D2E3737373737073212
                12212E3536322D2E37373737370D2E0D0712152A00242C263737373737072D0D
                0D212E011F002626373737373708331211212E011F002D2E37373737370C3212
                060F1D011F001D233737373737083010040000010B0000000237373737082D0E
                091E1E1E1F0101010937373737083312061B28011F00161D3737373737082F12
                0D202C011F002C2D373737373707290D071215011F0026263737373737032921
                27292922131C26193737373737371A1814171515151921373737}
            end
            object BTlimpiarcodv: TBitBtn
              Left = 104
              Top = 8
              Width = 91
              Height = 25
              Caption = '&Limpiar'
              TabOrder = 1
              OnClick = BTlimpiarcodvClick
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
            object BTmodificarcodv: TBitBtn
              Left = 8
              Top = 42
              Width = 91
              Height = 25
              Caption = '&modificar'
              TabOrder = 2
              OnClick = BTmodificarcodvClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000F30E0000F30E000000010000000100002D2D2D001855
                6F0042424200454442004A4A4A0052424A004A524A0058534E0063635A00635A
                6B005160610054777B00636363006B6363006B736B00736B7300737373007373
                7B007B737B007C7078007B7B7B00B56D3E00C1713500C07638008A5B5200947E
                7500AD7B73008C847B00EFA65A00EDA75F00F0A85C0000009A000316AC004174
                9600477AA9000018C6001029D600106BFF00FF00FF0035A8F5004A9EED006D8A
                FD00848484008C848C008C8C8C00949494009C9C9C009CA594009891A200A5A5
                A500ADADAD00ADADB500B5B5B500BDBDBD00F1BC8600F8C28C00F9C48D00FBD3
                A900C6C6C600D6D6D600DEDEDE00E7DED6000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000262626262626
                26262626262626262626262626262626262626262626262626262626262A2E10
                0C10323435312A2A2626262626043C2A0C1431353B3A322E2626262626020007
                0C1031343B3A322E26262626260407030A1431343B3A312D262626262604310B
                2201183435312A2A2626262626023B0B211916183B3A322E2626262626023B2B
                13361E17183A322E2626262626023C2B1A39381C1718322E2626262626053110
                0C1A39381E1618142626262626053D2B0D101A39371D15182626262626053D2B
                080E2E1A393027201F26262626053110090E2D321A282424201F26262606332C
                2F313131322329252426262626261B120F111010101423232626}
            end
            object BTeliminarcodv: TBitBtn
              Left = 104
              Top = 42
              Width = 91
              Height = 25
              Caption = '&Eliminar'
              TabOrder = 3
              OnClick = BTeliminarcodvClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000E30E0000E30E00000001000000010000424242004A42
                4A0052424A004A4A4A004A524A00525252005A6352005A5A5A005A635A006363
                5A006B635A00525263005A5263005A5A6300635A63005A636300636363006B63
                63006B6B6300635A6B0063636B006B6B6B006B736B00636B7300736B73006B73
                73007373730084737300737B730073737B007B737B0084737B007B7B7B008C84
                7B00848484008C848C00848C8C008C8C8C008C948C00949494009CA594009C9C
                9C000021A500A5A5A500ADADAD00ADADB500B5B5B500BDBDBD006B84C600C6C6
                C600CECECE00D6D6D600E7DED600DEDEDE000029E700526BF700638CF7009494
                F700FF00FF009CB5FF009CBDFF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003A3A3A3A3A3A
                3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A22291A
                101A2C2E2F2B22223A3A3A3A3A03352210202B2F33312C293A3A3A3A3A003322
                101A2B2E33312C293A3A3A3A3A03352210202B2E33312B273A3A3A3A3A032B1A
                071A2B2E2F2B22223A3A3A3A3A003322101A2B2E33312C293A3A3A3A3A003323
                14302A2A2A2A2A2A2A3A3A3A3A003523102A363636363636362A3A3A3A022B1A
                10302A2A2A2A2A2A2A3A3A3A3A023423111A2B2C32312B273A3A3A3A3A023423
                0916292C322F2B273A3A3A3A3A022B1A1316272C322F2B253A3A3A3A3A042D25
                282B2B2B2C2B25203A3A3A3A3A3A211E181D1A1A1A20223A3A3A}
            end
          end
          object EDmodelo: TEdit
            Left = 283
            Top = 110
            Width = 121
            Height = 21
            TabOrder = 1
          end
        end
      end
    end
    object Treferencias: TTabSheet
      Caption = '&Referencias'
      Enabled = False
      ImageIndex = 2
      object GroupBox13: TGroupBox
        Left = 2
        Top = -1
        Width = 621
        Height = 116
        Caption = 'Concepto Entrevista Y Observaciones Anteriores'
        TabOrder = 0
        object EDobservacion: TMemo
          Left = 5
          Top = 77
          Width = 609
          Height = 35
          PopupMenu = PopupMenu4
          ScrollBars = ssVertical
          TabOrder = 0
          OnEnter = EDobservacionEnter
          OnExit = EDobservacionExit
        end
        object Mobanterior: TMemo
          Left = 5
          Top = 14
          Width = 609
          Height = 54
          TabStop = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object GroupBox14: TGroupBox
        Left = 2
        Top = 115
        Width = 621
        Height = 294
        Caption = 'Referencias'
        TabOrder = 1
        object Label76: TLabel
          Left = 5
          Top = 228
          Width = 91
          Height = 13
          Caption = 'Tipo de Referencia'
        end
        object Label78: TLabel
          Left = 5
          Top = 193
          Width = 69
          Height = 13
          Caption = 'Primer Apellido'
        end
        object Label82: TLabel
          Left = 149
          Top = 193
          Width = 83
          Height = 13
          Caption = 'Segundo Apellido'
        end
        object Label83: TLabel
          Left = 288
          Top = 193
          Width = 42
          Height = 13
          Caption = 'Nombres'
        end
        object Label77: TLabel
          Left = 149
          Top = 228
          Width = 54
          Height = 13
          Caption = 'Parentesco'
        end
        object Label79: TLabel
          Left = 288
          Top = 228
          Width = 42
          Height = 13
          Caption = 'Telefono'
        end
        object Label80: TLabel
          Left = 5
          Top = 269
          Width = 45
          Height = 13
          Caption = 'Direccion'
        end
        object DBGrid5: TDBGrid
          Left = 3
          Top = 13
          Width = 606
          Height = 177
          TabStop = False
          DataSource = DSfamiliar
          TabOrder = 7
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid5CellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'tipo_id_referencia'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'id_persona'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'nombre'
              Title.Caption = 'Nombre'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'apellido1'
              Title.Caption = 'Primer Apellido'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'apellido2'
              Title.Caption = 'Segundo Apellido'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'direccion'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'telefono'
              Title.Caption = 'Telefonos'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo_referencia'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'descripcion_re'
              Title.Caption = 'Referencia'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'id_entrada'
              Visible = False
            end>
        end
        object DBreferencia: TDBLookupComboBox
          Left = 5
          Top = 243
          Width = 133
          Height = 21
          KeyField = 'ID_REFERENCIA'
          ListField = 'DESCRIPCION_REFERENCIA'
          ListSource = DSreferencia
          TabOrder = 3
        end
        object EDrefapellido1: TEdit
          Left = 5
          Top = 207
          Width = 133
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object EDrefapellido2: TEdit
          Left = 149
          Top = 207
          Width = 133
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object EDrefnombre: TEdit
          Left = 288
          Top = 207
          Width = 148
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object Panel9: TPanel
          Left = 440
          Top = 197
          Width = 175
          Height = 89
          Color = clOlive
          TabOrder = 8
          object BitBtn1: TBitBtn
            Left = 8
            Top = 34
            Width = 75
            Height = 25
            Caption = '&Agregar'
            TabOrder = 0
            OnClick = BitBtn1Click
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000030F0000030F000000010000000100000094000000C6
              0000319C42004A524A00429C4A0052525200527352005A5A5A00635A5A005AAD
              5A005AB55A004ABD5A005A63630063636300636B63006384630063636B006B63
              6B006B6B6B006B946B00736B7300737373007394730073737B007B737B007B7B
              7B008C847B00738C7B006B9C7B007B9C7B0084CE7B0073D67B007B8484008484
              84007B9484007B9C840073AD84008C848C008C8C8C0094948C008CA58C009494
              940084A594009C949C009C9C9C00A5A5A500ADADAD00B5B5AD00B5B5B500BDB5
              B500BDBDBD00C6BDBD00CEC6BD00C6C6C600D6D6D600FF00FF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373737373737
              3737373737373737373737373737373737373737373737373737373737122C0D
              12212E32322D262937373737370D321212262E3536322D2E3737373737073212
              12212E3536322D2E37373737370D2E0D0712152A00242C263737373737072D0D
              0D212E011F002626373737373708331211212E011F002D2E37373737370C3212
              060F1D011F001D233737373737083010040000010B0000000237373737082D0E
              091E1E1E1F0101010937373737083312061B28011F00161D3737373737082F12
              0D202C011F002C2D373737373707290D071215011F0026263737373737032921
              27292922131C26193737373737371A1814171515151921373737}
          end
          object BitBtn2: TBitBtn
            Left = 91
            Top = 34
            Width = 75
            Height = 25
            Caption = '&Limpiar'
            TabOrder = 1
            OnClick = BitBtn2Click
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
          object BitBtn3: TBitBtn
            Left = 8
            Top = 61
            Width = 75
            Height = 25
            Caption = '&Modificar'
            Enabled = False
            TabOrder = 2
            OnClick = BitBtn3Click
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000F30E0000F30E000000010000000100002D2D2D001855
              6F0042424200454442004A4A4A0052424A004A524A0058534E0063635A00635A
              6B005160610054777B00636363006B6363006B736B00736B7300737373007373
              7B007B737B007C7078007B7B7B00B56D3E00C1713500C07638008A5B5200947E
              7500AD7B73008C847B00EFA65A00EDA75F00F0A85C0000009A000316AC004174
              9600477AA9000018C6001029D600106BFF00FF00FF0035A8F5004A9EED006D8A
              FD00848484008C848C008C8C8C00949494009C9C9C009CA594009891A200A5A5
              A500ADADAD00ADADB500B5B5B500BDBDBD00F1BC8600F8C28C00F9C48D00FBD3
              A900C6C6C600D6D6D600DEDEDE00E7DED6000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000262626262626
              26262626262626262626262626262626262626262626262626262626262A2E10
              0C10323435312A2A2626262626043C2A0C1431353B3A322E2626262626020007
              0C1031343B3A322E26262626260407030A1431343B3A312D262626262604310B
              2201183435312A2A2626262626023B0B211916183B3A322E2626262626023B2B
              13361E17183A322E2626262626023C2B1A39381C1718322E2626262626053110
              0C1A39381E1618142626262626053D2B0D101A39371D15182626262626053D2B
              080E2E1A393027201F26262626053110090E2D321A282424201F26262606332C
              2F313131322329252426262626261B120F111010101423232626}
          end
          object BitBtn4: TBitBtn
            Left = 92
            Top = 61
            Width = 75
            Height = 25
            Caption = '&Eliminar'
            TabOrder = 3
            OnClick = BitBtn4Click
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E00000001000000010000424242004A42
              4A0052424A004A4A4A004A524A00525252005A6352005A5A5A005A635A006363
              5A006B635A00525263005A5263005A5A6300635A63005A636300636363006B63
              63006B6B6300635A6B0063636B006B6B6B006B736B00636B7300736B73006B73
              73007373730084737300737B730073737B007B737B0084737B007B7B7B008C84
              7B00848484008C848C00848C8C008C8C8C008C948C00949494009CA594009C9C
              9C000021A500A5A5A500ADADAD00ADADB500B5B5B500BDBDBD006B84C600C6C6
              C600CECECE00D6D6D600E7DED600DEDEDE000029E700526BF700638CF7009494
              F700FF00FF009CB5FF009CBDFF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003A3A3A3A3A3A
              3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A22291A
              101A2C2E2F2B22223A3A3A3A3A03352210202B2F33312C293A3A3A3A3A003322
              101A2B2E33312C293A3A3A3A3A03352210202B2E33312B273A3A3A3A3A032B1A
              071A2B2E2F2B22223A3A3A3A3A003322101A2B2E33312C293A3A3A3A3A003323
              14302A2A2A2A2A2A2A3A3A3A3A003523102A363636363636362A3A3A3A022B1A
              10302A2A2A2A2A2A2A3A3A3A3A023423111A2B2C32312B273A3A3A3A3A023423
              0916292C322F2B273A3A3A3A3A022B1A1316272C322F2B253A3A3A3A3A042D25
              282B2B2B2C2B25203A3A3A3A3A3A211E181D1A1A1A20223A3A3A}
          end
          object BTreferencia: TBitBtn
            Left = 8
            Top = 7
            Width = 158
            Height = 25
            Caption = '&Ver Referencias'
            TabOrder = 4
            OnClick = BTreferenciaClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
              73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
              8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
              9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
              A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
              AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
              BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
              D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
              E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
              F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
              424242424242424242422B39180B42424242424242424242424243443C180B42
              4242424242424242424242444438180B42424242424242424242424244433918
              0A424242424242424242424242444335004201101A114242424242424242453D
              05072F343434291942424242424242221A2D34343437403E0442424242424206
              231C303437404146284242424242421B210F30373A414140310D42424242421F
              20032434373A3A37321342424242421D25030F2D37373737311042424242420D
              2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
              4227312D21252314424242424242424242420E141B1B42424242}
          end
        end
        object DBparentesco: TDBLookupComboBox
          Left = 149
          Top = 243
          Width = 133
          Height = 21
          DropDownRows = 4
          KeyField = 'ID_PARENTESCO'
          ListField = 'DESCRIPCION_PARENTESCO'
          ListSource = DSparentesco
          TabOrder = 4
        end
        object EDreftelefono: TEdit
          Left = 288
          Top = 243
          Width = 148
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 5
        end
        object EDrefdireccion: TEdit
          Left = 56
          Top = 267
          Width = 379
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 6
        end
      end
    end
  end
  object JvStaticText1: TJvStaticText
    Left = 431
    Top = 7
    Width = 44
    Height = 17
    TextMargins.X = 0
    TextMargins.Y = 0
    Caption = 'Oficina'
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
    Layout = tlTop
    ParentFont = False
    TabOrder = 1
    WordWrap = False
  end
  object DBoficina: TDBLookupComboBox
    Left = 477
    Top = 5
    Width = 145
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    KeyField = 'ID_AGENCIA'
    ListField = 'DESCRIPCION_AGENCIA'
    ListSource = DSoficina
    ParentFont = False
    TabOrder = 2
    TabStop = False
  end
  object Panel10: TPanel
    Left = 5
    Top = 444
    Width = 620
    Height = 38
    Color = clOlive
    TabOrder = 3
    object Scerrar: TSpeedButton
      Left = 512
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Cerrar'
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
      OnClick = ScerrarClick
    end
    object BTnuevo: TBitBtn
      Left = 10
      Top = 8
      Width = 119
      Height = 25
      Caption = '&Nueva Solicitud'
      TabOrder = 0
      TabStop = False
      OnClick = BTnuevoClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000EFA54A00C684
        6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00CE9C7B00B584
        8400B58C8400CE9C8400B5948C00C6A59400EFCE9400F7CE9400C6A59C00EFCE
        9C00F7CE9C00F7D69C00C6ADA500CEADA500F7D6A500CEB5AD00D6B5AD00C6BD
        AD00F7D6AD00F7DEAD00D6BDB500DEBDB500DEC6B500E7C6B500EFC6B500EFCE
        B500F7D6B500F7DEB500FFDEB500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7
        C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
        DE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373709090909
        09090909090909090937373710302926231A16110E0E0E130937373710302C28
        26221611110E0E110937373714322E2C2826221A11110E110937373714332E2C
        292823221A11110E093737371736322E2E2C2826221A11110937373718383432
        2E2C2928261A1616093737371C383534312E2C292826221A093737371C383835
        34322E2C28262323093737371D3838383532312E2C282822093737371E383838
        3835323131302719093737371F383838383834342E0D0C0A093737371F383838
        383838362A0204000137373725383838383838382B070503373737371F353434
        343434342A070B37373737371F212121211F1F211C0637373737}
    end
    object BTregistra: TBitBtn
      Left = 135
      Top = 8
      Width = 119
      Height = 25
      Caption = '&Registrar Solicitud'
      Enabled = False
      TabOrder = 1
      TabStop = False
      OnClick = BTregistraClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000942929009431
        31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
        4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
        5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
        73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
        8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
        A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
        BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
        CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
        E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
        33343433332505050B4848191516111B27384647452D0002131048191515111A
        05184046492E0102121048191515111C03032F42493200011210481915151120
        0601243A493200011210481915151221231D1F27322C04041310481915151515
        1515151313151515160F48190D111E282B292B2828292B26150C481909384544
        4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
        3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
        4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
        4343434343434630130F4848092D3A363636363636363A2A0748}
    end
    object BTreporte: TBitBtn
      Left = 260
      Top = 8
      Width = 119
      Height = 25
      Caption = 'Re&porte Solicitud'
      Enabled = False
      TabOrder = 2
      TabStop = False
      OnClick = BTreporteClick
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
    object BTcancela: TBitBtn
      Left = 385
      Top = 8
      Width = 119
      Height = 25
      Caption = 'Reporte Asociado'
      Enabled = False
      TabOrder = 3
      TabStop = False
      OnClick = BTcancelaClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000107B10001084
        100021731800189C180018A51800315A210021A521004A42290039632900396B
        2900298C290031942900299C2900319C290029AD2900425A310042633100426B
        3100318C3100398C3100319C3100399C310031A5310031AD310031B531004A6B
        39004284390039943900399C390039AD390039B539005A524200526342005273
        42004A8C42004A9C42004AA5420042BD4200636B4A0018734A00528C4A0052A5
        4A004ABD4A0039525200296B5200637B520052B5520052BD520052C65200736B
        5A005AC65A007B736300428463006B84630063A5630063BD630063C6630063CE
        6300315A6B0073B56B006BC66B006BCE6B00426B730073AD730073CE730073D6
        7300316B7B0094B57B0084BD7B008CBD7B007BCE7B007BD67B00296B8400316B
        8400948C840084B5840039738C009CB58C008CBD8C0039739400216B9C005A84
        9C0063849C00216BA5002173A5002173AD00297BAD003984AD00428CAD004A8C
        AD00107BB500217BB500428CB5004A94B500217BBD004294BD005294BD00529C
        BD006BA5BD00D6E7BD00187BC6002184C6002984C600298CC600318CC600428C
        C6003994C6004294C6004A94C60063A5C6006BA5C600BDC6C600BDCEC6002184
        CE00218CCE00298CCE00398CCE002994CE00E7DECE00D6E7CE006BADD6006BB5
        D6003194DE005AADDE0063ADDE00218CE700298CE700319CE7004A9CE70073BD
        E7008CBDE7008CC6E7009CCEE7002994EF0042A5EF004AB5EF007BBDEF008CC6
        EF00F7FFEF002994F700319CF700399CF70042A5F70063ADF70052B5F700FF00
        FF003194FF00319CFF00399CFF0039A5FF0042A5FF0042ADFF004AADFF004AB5
        FF0052B5FF0052BDFF005ABDFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00919191919191
        919191919191919191919191919191919191919191919191919191910103161D
        1D000B021F3191919191919106172A301C452F2502079191919191910C2A3D3C
        8A8A38391619919191919191912A40299D9D3C40149191919191919191912757
        5E58371C91919191919191919191647D7E7D2C91919191919191919191569494
        94947E2B91919191919191919165969696968D3A91919191919191916E8E999A
        9B9A984F919191919191919160869C9C9087904C919191919191919152546C78
        8F805391919191919191919191547882817B429191919191919191919191625D
        5952919191919191919191919191919191919191919191919191}
    end
  end
  object ImageList1: TImageList
    Left = 632
    Top = 304
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
      00000000000000000000000000000000000000000000000000009C6B63009C6B
      63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B
      63009C6B63009C6B6300A56B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C736B00FFE7
      C600F7DEB500F7D6AD00F7D69C00F7CE9400EFC68400EFC68400EFC68400EFC6
      8400EFC68400EFC684009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C736B00F7E7
      C600F7DEBD00F7D6AD00EFCEA500EFCE9C00EFC69400EFC68400EFBD7B00EFBD
      7B00EFBD7B00EFBD7B009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C736B00F7E7
      D600FFEFCE00F7DEBD00FFDEB500F7D6AD00EFCE9C00EFC69400EFC68400EFBD
      7B00EFBD7B00EFBD7B009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5737300FFF7
      DE00948C8C00948C8C00948C8C00948C8C00E7C69C00EFCE9C00EFC69400EFC6
      8400EFBD7B00EFBD7B009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A57B7300FFFF
      F700313129006B7394001029A50021213900D6B58C00F7D6AD00EFCE9C00EFC6
      9400EFC68400EFBD7B009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD847B00FFFF
      F70031313900637BE7007B94FF0010219C00DEC69C00FFDEB500EFCEA500EFCE
      9C00EFC69400EFC684009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58C7B00FFFF
      FF0042424200524A4A005A524A00182994006373D600C6B59C00F7D6B500EFCE
      A500EFCE9C00EFC694009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD8C7B00FFFF
      FF00FFFFFF00F7EFE700F7E7D600F7E7D600637BE700425AE700E7CEBD00F7D6
      AD00EFCEA500EFCE9C009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6947B00FFFF
      FF00948C8C00948C8C00948C8C00948C8C00EFE7CE00C6BDDE00EFD6C600F7D6
      B500F7D6AD00E7C69C0094736B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE9C8400FFFF
      FF0031312900A5A5A5005263AD0029314200D6CEBD00FFF7DE00FFEFCE00F7E7
      C600DECEAD00B5A58C00846B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE9C8400FFFF
      FF0042424A007B94FF00426BFF0018297B00E7DEC600FFF7E700E7CEBD00A56B
      6B00A56B6B00A56B6B00A56B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6A58400FFFF
      FF0029292900636B84008C8C9C000821A500BDC6F700FFFFF700D6B5AD00A56B
      6B00E79C4A00E78C3100A56B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6A58400FFFF
      FF00ADB5B50094949400949494008C9CC6004263FF009CB5FF00D6B5BD00A56B
      6B00F7AD5A00A56B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6A58400F7EF
      E700FFFFF700FFFFF700FFFFF700FFF7EF00CECEEF005A73EF00B5A5B500A56B
      6B00A56B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6946B00D69C
      7B00D69C7B00D69C7B00CE947300C68C7300C68C7300C68C7300AD736B00A56B
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD7B6B00AD7B6B00AD7B6B00AD7B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4949004A4949004A4949004A4949004A4949004A4949004A4949004A49
      4900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000084840000848400008484008484
      840000000000000000000000000000000000000000000000000000000000AD7B
      6B00DEA57B00EFC69400E7C6A500DEB58C00AD7B6B00AD7B6B00AD7B6B00AD7B
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A49
      49008E8F8F00ADABAB00B9B1AD005164810051648100B9B1AC00ABA8A8009493
      9300474848000000000000000000000000000000000000000000848484000084
      840000848400008484008484840000848400C6FFFF0084FFFF0084FFFF000084
      8400000000000000000000000000000000000000000000000000AD7B6B00DEB5
      8C00EFB57B00EFC69C00EFD6B500EFCEA500C69C73007B4A4A008C525200AD7B
      6B00AD7B6B00AD7B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000046464600BEBA
      BA00C8C7C700C5C0BD006B7B9A0000689B0000689B006B7B9A00DDD9D600BDBC
      BC00B3AFAF00474848000000000000000000000000000000000000848400C6FF
      FF0084FFFF0084FFFF0000848400848484000084840000848400008484008484
      84000084840084848400000000000000000000000000AD7B6B00E7BD9400EFC6
      8C00EFB57B00EFC6A500F7E7CE00F7D6AD00C69C84007B4A4A007B4A4A00CEA5
      7B00EFBD8C00D6A58400AD7B6B00000000000000000000000000A16A6A00A16A
      6A00A16A6A00A16A6A00A16A6A00A16A6A00A16A6A00A16A6A00A16A6A00A16A
      6A00A16A6A00A16A6A00A16A6A000000000000000000797A7A0097959500C0C0
      C000DDDAD8006B7B9A0000ACE80000AFE20000AFE200009FDB006B7B9A00DCDA
      D900A9A6A600969595004A494900000000000000000000000000848484000084
      8400008484000084840084848400000000000000000000848400C6C6C600C6C6
      C600C6C6C600008484000000000000000000AD7B6B00F7CE9C00F7D69400EFC6
      8C00EFB57B00F7CEAD00FFEFDE00FFE7C600CEA58C007B4A4A007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B00000000000000000098586A00FFF4F400F7EF
      E7002D2D2D0058534E00F7D6AD00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DE
      BD00F7DEBD00F7D6AD00F7D6AD00A16A6A0000000000797A7A00ADAAAA00BDBB
      BB00FCFFFF006B7B9A006B7B9A0000689B0000689B0000AFE2006D7E9D00E9E5
      E100BEBDBD00AEABAB004A494900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000084840000C6C60000C6
      C60000C6C600008484000000000000000000AD7B6B00F7D69C00F7D69400F7C6
      8C00F7B57300F7CEAD00FFF7EF00FFEFDE00CEAD9C00734242007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B00000000000000000098586A00FFF7EF00FFF4
      F40058534E004544420051606100F7D6AD00F7E7CE00F7E7CE00F7E7CE00F7DE
      BD00F7DEBD00F7DEBD00F7D6AD00A16A6A0000000000797A7A00A9A7A700C9C9
      C900EAEAE900D3E0EA006B7B9A0000AFE20000AFE20000A1D900D4D6E100E8EA
      E900BCBBBB00ABA8A8004A4949000000000000000000005A0000005A0000005A
      0000005A0000005A0000005A0000005A0000005A000000848400C6C6C600C6C6
      C600C6C6C60000848400005A0000005A0000AD7B6B00F7D69C00FFD69400E7BD
      9400B5A59400F7CEAD00FFFFF700FFF7EF00DEC6B50094635A0084524A00CEA5
      8400EFBD8C00DEB58400AD7B6B00000000000000000098606A00FFF7EF00FFF7
      EF00F7EFE70054777B00477AA90018556F008A5B5200F7D6AD00F7E7CE00F7E7
      CE00F7E7CE00F7DEBD00F7DEBD00A16A6A0000000000797A7A00B1AEAE00BBBA
      BA00F6F5F3006B7B9A0000AFE20000A6D90000689B006B7B9A006B7B9A00EBE7
      E400AFADAD00ADACAC004A4949000000000000000000005A0000008400000084
      000000C6000000C6000000C6000000C6000000C600000084840000C6C60000C6
      C60000C6C6000084840000840000005A0000AD7B6B00FFD69400D6CEA50052A5
      E7002184F70084ADDE00FFFFEF00FFF7EF00FFF7E700F7E7CE00E7C6A500E7C6
      9C00E7BD9400DEB58400AD7B6B00000000000000000098606A00FFFFFF00A1A1
      A100A1A1A10054777B0041749600947E7500C17135008A5B52006E6E6E008484
      84008484840084848400F7DEBD00A16A6A000000000000000000797A7A00ADA9
      A900DBD9D700C3C5D2006B7B9A0000AADD0000AFE20000ACE8006B7B9A00CECD
      CC00ACA9A9004A494900000000000000000000000000005A00000084000000C6
      000084FF840084FF840084FF8400424242004242420000848400FFFFFF0084FF
      FF0084FFFF000084840000840000005A0000AD7B6B009CC6C60042B5FF0031AD
      FF00319CFF001884FF0084BDF700FFFFEF00FFF7EF00FFEFDE00F7E7CE00EFD6
      B500EFC69C00DEB58C00A57B7B000000000000000000B6737300FFFFFF00FFFF
      FF00FFFFFF00FFF7EF007C707800F1BC8600F0A85C00C07638008A5B5200F7DE
      BD00F7EFE700F7E7CE00F7DEBD00A16A6A000000000000000000797A7A00AFAE
      AE00C5C3C300E8E5E1006B7B9A0000689B0000689B006B7B9A00DBD8D500AAA5
      A500B2B1B1004A494900000000000000000000000000005A000000C60000C6FF
      C600C6FFC60084FF840042424200C6C6C600C6C6C60000848400008484000084
      84000084840084FF840000C60000005A0000429CF70042A5FF0042ADFF0042B5
      FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFF7EF00FFEFDE00FFE7
      C600DEC6B500948C94009C7B84000000000000000000B6737300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00AD7B7300FBD3A900F9C48D00EFA65A00C07638008A5B
      5200F7DEBD00F7EFE700F7E7CE00A16A6A00000000000000000000000000797A
      7A0097949400A6A2A200CFC7C3004C5C79004C5D7900C8C1BC00BBB7B7009493
      93004A49490000000000000000000000000000000000005A000000C60000C6FF
      C600C6FFC600C6FFC60042424200C6FFFF00C6C6C600C6C6C6004242420084FF
      840084FF840084FF840000C60000005A000000000000429CFF0042A5FF0042AD
      FF0042B5FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFFFEF00D6D6
      D600737BAD007B739400000000000000000000000000C07B7300FFFFFF00A1A1
      A100A1A1A100A1A1A100A1A1A100AD7B7300FBD3A900F9C48D00F0A85C00C171
      35008A5B520084848400F7EFE700A16A6A000000000000000000000000000000
      0000797A7A00797A7A006A6A6A00716E6B00726F6B006A6A6A00474747004A49
      49000000000000000000000000000000000000000000005A00000084000000C6
      0000C6FFC600C6FFC600C6FFC60042424200424242004242420084FF840084FF
      840084FF840000C6000000840000005A00000000000000000000429CF70042A5
      FF0042ADFF0042ADFF0039A5FF002994FF001884FF0094C6FF00B5CEE7004A6B
      BD00526BA50000000000000000000000000000000000C07B7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD7B7300FBD3A900F8C28C00EDA7
      5F00B56D3E008A5B5200F7DEBD00A16A6A000000000000000000000000000000
      000000000000000000007979790069676700696969007D7C7C00000000000000
      00000000000000000000000000000000000000000000005A0000008400000084
      000000C60000C6FFC600C6FFC600C6FFC600C6FFC60084FF840084FF840084FF
      840000C600000084000000840000005A000000000000000000000000000042A5
      FF0042ADFF0042B5FF0042ADFF00319CFF002994FF001884FF00316BE7003163
      C6000000000000000000000000000000000000000000CA847B00FFA13800FFA1
      3800FFA13800FFA13800FFA13800FFA13800FFA13800AD7B7300FBD3A9009891
      A20035A8F5000316AC0000009A00000000000000000000000000000000000000
      000000000000000000008C898900CCCFD000919596008F8D8D00000000000000
      00000000000000000000000000000000000000000000005A0000005A0000005A
      0000005A0000005A0000005A0000005A0000005A0000005A0000005A0000005A
      0000005A0000005A0000005A0000005A00000000000000000000000000000000
      000042A5FF0042ADFF0042B5FF0039ADFF003994F7001831B5003952DE000000
      00000000000000000000000000000000000000000000D48F7B00FFA13800FFA1
      3800FFA13800FFA13800A16A6A00000000000000000000000000AD7B73004A9E
      ED001029D6001029D6000316AC0000009A000000000000000000000000000000
      0000000000009B9A9A00D6D4D300F3FDFF00CBD2D500C8C4C4007B7C7C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042A5FF0042ADFF00000000000000000018109400394ADE000000
      0000000000000000000000000000000000000000000000000000D48F7B00D48F
      7B00D48F7B00D48F7B0000000000000000000000000000000000000000000018
      C6006D8AFD00106BFF001029D600000000000000000000000000000000000000
      000020202000A5A5A50033333300929090009694940035353500A8A8A8002222
      2200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018189C00394ADE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000018C6000018C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002D2D2D0058534E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636B00525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      FF001010FF001010FF001010FF001010FF001010FF001010FF001010FF001010
      FF001010FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000058534E004544420051606100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063636B0094949400A5A5A5003131310000000000000000000000
      000000000000000000000000000000000000000000000000E2000000FF000000
      FF000000A1000000B3000000B3000000AE000000E3000000AE000000B3000000
      AE000000D1000000FF000000FF0000000000000000000000000010841000189C
      180031A5310039AD390039AD3900107B100031942900217318005A524200736B
      5A0000000000000000000000000000000000000000000000000010841000189C
      18006BC66B0054777B00477AA90018556F008A5B5200299C29005A524200736B
      5A00000000000000000000000000000000000000000000000000000000000000
      000063636B0094949400D6D6D600DEDEDE00ADADAD0052525200000000000000
      000000000000000000000000000000000000000000005352FF007B7BDB000000
      FF000000BF0000006D000000740000006D000000C80000006D00000074000000
      66000000FF000000FF005352FF0000000000000000000000000021A5210031AD
      31004ABD4A0052C65200399C39008CBD7B0052BD520042BD4200217318004A42
      290000000000000000000000000000000000000000000000000021A5210031AD
      31006BC66B0054777B0041749600947E7500C17135008A5B5200299C29004A42
      2900000000000000000000000000000000000000000000000000000000006363
      6B0094949400D6D6D600D6D6D600DEDEDE00DEDEDE00ADADAD00313131000000
      000000000000000000000000000000000000000000000000FF009699FF00AFB2
      CC006060FF006666FF006666FF006262FF00A1A1FF006262FF006666FF006262
      FF009598FF00AFB2CC000807FF00000000000000000000000000299C29004ABD
      4A006BCE6B006BC66B00F7FFEF00F7FFEF0063C6630063CE630031A531004A6B
      3900000000000000000000000000000000000000000000000000299C29004ABD
      4A006BCE6B006BC66B007C707800F1BC8600F0A85C00C07638008A5B5200299C
      2900000000000000000000000000000000000000000000000000636363008484
      8400D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00E7E7DE00ADADAD005252
      520000000000000000000000000000000000000000005352FF00C0C8BF002C2B
      FF004040FF003E3EFF003E3EFF004141FF004040FF004343FF003C3CFF004040
      FF003535FF006A6DFF005352FF00000000000000000000000000000000004ABD
      4A0073CE730052A54A00FFFFFF00FFFFFF006BC66B0073CE7300319C31000000
      0000000000000000000000000000000000000000000000000000000000004ABD
      4A0073CE730052A54A00AD7B7300FBD3A900F9C48D00EFA65A00C07638008A5B
      5200000000000000000000000000000000000000000063636B007B7B7B00ADAD
      AD00BDBDBD00BDBDBD00CECECE00D6D6D600DEDEDE00DEDEDE00E7E7E700ADAD
      AD0031313100000000000000000000000000000000005352FF005554FF002121
      FF002626FF003636FF003232FF001717FF000000FF000303FF004B4BFF002424
      FF002323FF004C4BFF006C6EFF00000000000000000000000000000000000000
      000018734A003984AD00217BBD00428CAD0063BD6300399C3900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000018734A003984AD00217BBD00AD7B7300FBD3A900F9C48D00F0A85C00C171
      35008A5B52000000000000000000000000007B7B7B0063636B00A5A5AD00A5A5
      AD00B5ADBD00BDBDBD00C6C6C600BDBDBD00949494007B7B7B005A525200D6D6
      D600BDBDBD00525252000000000000000000000000001E1EFF003434FF000000
      FF000000B700171758005454FF000000FF000000FF000000FF004444FF000000
      00000000FF004F4FFF000F0FFF00000000000000000000000000000000000000
      0000187BC600218CE700298CE700218CE700296B520000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000187BC600218CE700298CE700218CE700AD7B7300FBD3A900F8C28C00EDA7
      5F00B56D3E008A5B5200000000000000000084848C0052526300293163002931
      520042426B0063637B00BDC6C600CECECE00B5B5B500949CA5009C9CA500DEDE
      DE00EFEFEF00B5B5B5004A424A0000000000000000001E1EFF001313FF000000
      FF000000D10001017A0000006B00000066000000690000006E00000074000000
      7E000000FF001B1BFF001E1EFF0000000000000000000000000000000000297B
      AD00399CFF00399CFF00399CFF00399CFF00298CE70039525200000000000000
      000000000000000000000000000000000000000000000000000000000000297B
      AD00399CFF00399CFF00399CFF00399CFF00298CE700AD7B7300FBD3A9009891
      A20035A8F5000316AC0000009A000000000094949C0073849C007394CE007B9C
      CE006B8CC600526BAD002931840021316300526B9C003973A500EFEFEF00EFEF
      EF00EFEFEF00F7F7F700A5A5A50052525200000000000606CF004242FF000808
      2F003232120069695B00ADAA9C00E7E8D800CCCABA00949585004C4C3C004D4D
      3D00222200000000D2000606CF00000000000000000000000000000000002184
      C60042A5FF0042A5FF0042A5FF0042A5FF00399CF700315A6B00000000000000
      0000000000000000000000000000000000000000000000000000000000002184
      C60042A5FF0042A5FF0042A5FF0042A5FF00399CF700315A6B00AD7B73004A9E
      ED001029D6001029D6000316AC0000009A0094949C008494AD008CADDE008CAD
      DE0094B5E7008CA5D6006384C6005A73BD006B7BBD0018217300EFEFEF00EFEF
      EF00EFEFEF00F7F7F700EFEFEF00A5A5A50000000000000000001919FF001E1E
      0000595A5A00B3B0B000E6E7E700C1BFBF00A8A2A200C2C2C200FAFAFA004545
      45004D4D3F0007077E00000000000000000000000000000000006BA5C60042A5
      F7004AB5FF0052B5FF0052BDFF0052B5FF004AADFF0039739400000000000000
      00000000000000000000000000000000000000000000000000006BA5C60042A5
      F7004AB5FF0052B5FF0052BDFF0052B5FF004AADFF0039739400000000000018
      C6006D8AFD00106BFF001029D60000000000000000000000000084A5DE00738C
      BD00182173001018420052B5DE004294C6006384C6008CA5D600EFEFEF00EFEF
      EF00EFEFEF00F7F7F700DEE7DE00A5A5A50000000000000000001A1ADA001B1B
      00008D8D8D003736360056575700565555004F4D4D0047474700585858004848
      48004F4F420019198B00000000000000000000000000000000005294BD0042A5
      EF005ABDFF005ABDFF0052B5F7004AB5EF0052B5F70039738C00000000000000
      00000000000000000000000000000000000000000000000000005294BD0042A5
      EF005ABDFF005ABDFF0052B5F7004AB5EF0052B5F70039738C00000000000000
      00000018C6000018C60000000000000000000000000000000000ADC6E7007BA5
      D6001821520021426B004A8CC600314A8C0084A5D600A5BDDE00EFEFEF00EFEF
      EF00F7F7F700F7F7F700A5A5A50000000000000000000606CF002424FF001010
      350000000000B2B0A300B9B5AB0021220D0000000000B1AF9F00B9B5AB002222
      0D00080800002121AF000606CF0000000000000000000000000063849C002173
      A5004A94C6006BADD60063ADF7004A9CE700216BA50000000000000000000000
      000000000000000000000000000000000000000000000000000063849C002173
      A5004A94C6006BADD60063ADF7004A9CE700216BA50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B73
      840052B5DE0052A5CE008CADDE00A5BDDE00DEDEDE00DEDEDE00EFEFEF00EFEF
      EF00DEDEDE009C9C9C000000000000000000000000000000F900ADADFF000000
      FF0029294F001F1E9600454492000000C2000000C4002322B20045448E000000
      D50000000F000000F9000000F900000000000000000000000000000000002173
      A5006BADD6008CBDE70073BDE7005AADDE00316B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002173
      A5006BADD6008CBDE70073BDE7005AADDE00316B7B0000000000000000000000
      00000000000000000000000000000000000000000000000000006B7384002139
      630052A5CE00849CBD00A5BDDE00A5BDDE008C8C8C0094949400EFEFEF00EFEF
      EF009C9C9C00000000000000000000000000000000000000F9008282FF003636
      FF002222370000007D000000780000007500000075000000760000007E001111
      22000000CD007E7EFF000000F900000000000000000000000000000000000000
      00006BA5BD004A94B5004A8CAD0063849C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BA5BD004A94B5004A8CAD0063849C000000000000000000000000000000
      000000000000000000000000000000000000000000006B73840021219C0052A5
      CE000000000000000000949494008C8C8C00F7F7F700E7E7DE00949494009494
      94000000000000000000000000000000000000000000000000000000F9002D2D
      FF003838FF004B4B9E002424AA002727AA002727AA002727AA002323A4005454
      EA005151FF000000F90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDB5EF001818AD000000
      0000000000000000000000000000949494009494940094949400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C001000000000000C001000000000000
      C001000000000000C001000000000000C001000000000000C001000000000000
      C001000000000000C001000000000000C001000000000000C001000000000000
      C001000000000000C001000000000000C001000000000000C003000000000000
      C007000000000000C00F000000000000FFFFF0FFFFFFF00FFE0FE00FFFFFE007
      C00FC003FFFFC003C0038001C0018001C183000180008001FF83000180008001
      8000000180008001800000018000C003800000018000C003800000018000E007
      800080038000F00F8000C0078000FC3F8000E00F8001FC3F8000F01F81C0F81F
      FFFFF99FC3E1F00FFFFFFF9FFFF3FFFFFFFFF3FFFCFFE007FFFFF1FFF87F8001
      C00FC00FF03F8001C00FC00FE01F8001C00FC00FC00F8001E01FE00F80078001
      F03FF00700038001F07FF00300018001E03FE00100008001E03FE0000000C003
      C03FC021C000C003C03FC033C0018001C07FC07FE0038001E07FE07FC0078001
      F0FFF0FF8C0FC003FFFFFFFF9E1FFFFF00000000000000000000000000000000
      000000000000}
  end
  object IBestadocivil: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$tiposestadocivil".ID_TIPO_ESTADO_CIVIL,'
      '  "gen$tiposestadocivil".DESCRIPCION_ESTADO_CIVIL'
      'FROM'
      '  "gen$tiposestadocivil"')
    Left = 40
    Top = 536
  end
  object DSestadocivil: TDataSource
    DataSet = IBestadocivil
    Left = 200
    Top = 584
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 632
    Top = 184
  end
  object DSidentificacion: TDataSource
    DataSet = IBidentiifcacion
    Left = 408
    Top = 584
  end
  object IBidentiifcacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$tiposidentificacion".ID_IDENTIFICACION,'
      '  "gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION'
      'FROM'
      '  "gen$tiposidentificacion"')
    Left = 8
    Top = 536
  end
  object IBnivelestudio: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$nivelestudio".ID_NIVEL,'
      '  "gen$nivelestudio".DESCRIPCION_NIVEL'
      'FROM'
      '  "gen$nivelestudio"')
    Left = 72
    Top = 536
  end
  object DSnivelestudio: TDataSource
    DataSet = IBnivelestudio
    Left = 168
    Top = 584
  end
  object IBtipovivienda: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  "gen$tipovivienda".ID_TIPOVIVIENDA,'
      '  "gen$tipovivienda".DESCRIPCION_TIPO'
      'FROM'
      '  "gen$tipovivienda"')
    Left = 104
    Top = 536
  end
  object DStipovivienda: TDataSource
    DataSet = IBtipovivienda
    Left = 136
    Top = 584
  end
  object CDinfCrediticia: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'entidad'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'valor_inicial'
        DataType = ftCurrency
      end
      item
        Name = 'saldo'
        DataType = ftCurrency
      end
      item
        Name = 'cuota_mensual'
        DataType = ftCurrency
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'id_colocacion'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'fecha_capital'
        DataType = ftDate
      end
      item
        Name = 'fecha_interes'
        DataType = ftDate
      end
      item
        Name = 'es_descuento'
        DataType = ftBoolean
      end
      item
        Name = 'criterio'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'vencimiento'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'estado'
        DataType = ftInteger
      end
      item
        Name = 'desc_estado'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'tipo_c'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 240
    Top = 632
    Data = {
      CF0100009619E0BD01000000180000000F000000000003000000CF0107656E74
      6964616401004900000001000557494454480200020032000D76616C6F725F69
      6E696369616C080004000000010007535542545950450200490006004D6F6E65
      79000573616C646F080004000000010007535542545950450200490006004D6F
      6E6579000D63756F74615F6D656E7375616C0800040000000100075355425459
      50450200490006004D6F6E6579000A69645F706572736F6E6101004900000001
      00055749445448020002000F001169645F6964656E74696669636163696F6E02
      000100000000000D69645F636F6C6F636163696F6E0100490000000100055749
      445448020002000B000D66656368615F6361706974616C04000600000000000D
      66656368615F696E746572657304000600000000000C65735F6465736375656E
      746F020003000000000008637269746572696F01004900000001000557494454
      480200020002000B76656E63696D69656E746F01004900000001000557494454
      48020002000A000665737461646F04000100000000000B646573635F65737461
      646F0100490000000100055749445448020002001400067469706F5F63010049
      00000001000557494454480200020014000000}
    object CDinfCrediticiaentidad: TStringField
      FieldName = 'entidad'
      Size = 50
    end
    object CDinfCrediticiavalor_inicial: TCurrencyField
      FieldName = 'valor_inicial'
    end
    object CDinfCrediticiasaldo: TCurrencyField
      FieldName = 'saldo'
    end
    object CDinfCrediticiacuota_mensual: TCurrencyField
      FieldName = 'cuota_mensual'
    end
    object CDinfCrediticiaid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDinfCrediticiaid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDinfCrediticiaid_colocacion: TStringField
      FieldName = 'id_colocacion'
      Size = 11
    end
    object CDinfCrediticiafecha_capital: TDateField
      FieldName = 'fecha_capital'
    end
    object CDinfCrediticiafecha_interes: TDateField
      FieldName = 'fecha_interes'
    end
    object CDinfCrediticiaes_descuento: TBooleanField
      FieldName = 'es_descuento'
    end
    object CDinfCrediticiacriterio: TStringField
      FieldName = 'criterio'
      Size = 2
    end
    object CDinfCrediticiavencimiento: TStringField
      FieldName = 'vencimiento'
      Size = 10
    end
    object CDinfCrediticiaestado: TIntegerField
      FieldName = 'estado'
    end
    object CDinfCrediticiadesc_estado: TStringField
      FieldName = 'desc_estado'
    end
    object CDinfCrediticiatipo_c: TStringField
      FieldName = 'tipo_c'
    end
  end
  object DSinfcrediticia: TDataSource
    DataSet = CDinfCrediticia
    Left = 224
    Top = 584
  end
  object DSbienes: TDataSource
    DataSet = CDbienes
    Left = 288
    Top = 584
  end
  object CDbienes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'descripcion_bien'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'barrio'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ciudad'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'valor_comercial'
        DataType = ftCurrency
      end
      item
        Name = 'eshipoteca'
        DataType = ftSmallint
      end
      item
        Name = 'afavorde'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'escritura'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'notaria'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'matricula'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'fecha'
        DataType = ftDate
      end
      item
        Name = 'es_informacion'
        DataType = ftBoolean
      end
      item
        Name = 'es_garantiareal'
        DataType = ftBoolean
      end
      item
        Name = 'es_garantiapersonal'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 672
    Top = 632
    Data = {
      D90100009619E0BD010000001800000010000000000003000000D9010A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E0200010000000000106465736372697063696F
      6E5F6269656E0100490000000100055749445448020002006400066261727269
      6F010049000000010005574944544802000200320009646972656363696F6E01
      0049000000010005574944544802000200320006636975646164010049000000
      01000557494454480200020032000F76616C6F725F636F6D65726369616C0800
      04000000010007535542545950450200490006004D6F6E6579000A6573686970
      6F74656361020001000000000008616661766F72646501004900000001000557
      4944544802000200320009657363726974757261010049000000010005574944
      5448020002003200076E6F746172696101004900000001000557494454480200
      02009600096D6174726963756C61010049000000010005574944544802000200
      320005666563686104000600000000000E65735F696E666F726D6163696F6E02
      000300000000000F65735F676172616E7469617265616C020003000000000013
      65735F676172616E746961706572736F6E616C02000300000000000000}
    object CDbienesid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDbienesid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDbienesdescripcion_bien: TStringField
      FieldName = 'descripcion_bien'
      Size = 100
    end
    object CDbienesbarrio: TStringField
      FieldName = 'barrio'
      Size = 50
    end
    object CDbienesdireccion: TStringField
      FieldName = 'direccion'
      Size = 50
    end
    object CDbienesciudad: TStringField
      FieldName = 'ciudad'
      Size = 50
    end
    object CDbienesvalor_comercial: TCurrencyField
      FieldName = 'valor_comercial'
    end
    object CDbieneseshipoteca: TSmallintField
      FieldName = 'eshipoteca'
    end
    object CDbienesafavorde: TStringField
      FieldName = 'afavorde'
      Size = 50
    end
    object CDbienesescritura: TStringField
      FieldName = 'escritura'
      Size = 50
    end
    object CDbienesnotaria: TStringField
      FieldName = 'notaria'
      Size = 150
    end
    object CDbienesmatricula: TStringField
      FieldName = 'matricula'
      Size = 50
    end
    object CDbienesfecha: TDateField
      FieldName = 'fecha'
    end
    object CDbieneses_informacion: TBooleanField
      FieldName = 'es_informacion'
    end
    object CDbieneses_garantiareal: TBooleanField
      FieldName = 'es_garantiareal'
    end
    object CDbieneses_garantiapersonal: TBooleanField
      FieldName = 'es_garantiapersonal'
    end
  end
  object DSmaquinaria: TDataSource
    DataSet = CDmaquinaria
    Left = 256
    Top = 584
  end
  object CDmaquinaria: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
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
        Name = 'descripcion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'pignorado'
        DataType = ftSmallint
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'marca'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'placa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'modelo'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 504
    Top = 632
    Data = {
      110100009619E0BD01000000180000000900000000000300000011010A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E04000100000000000B6465736372697063696F
      6E0100490000000100055749445448020002003200097069676E6F7261646F02
      000100000000000576616C6F7208000400000001000753554254595045020049
      0006004D6F6E657900056D617263610100490000000100055749445448020002
      00320005706C6163610100490000000100055749445448020002001400066573
      7461646F0100490000000100055749445448020002000200066D6F64656C6F01
      004900000001000557494454480200020064000000}
    object CDmaquinariaid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDmaquinariaid_identificacion: TIntegerField
      FieldName = 'id_identificacion'
    end
    object CDmaquinariadescripcion: TStringField
      FieldName = 'descripcion'
      Size = 50
    end
    object CDmaquinariapignorado: TSmallintField
      FieldName = 'pignorado'
    end
    object CDmaquinariavalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDmaquinariamarca: TStringField
      FieldName = 'marca'
      Size = 50
    end
    object CDmaquinariaplaca: TStringField
      FieldName = 'placa'
    end
    object CDmaquinariaestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object CDmaquinariamodelo: TStringField
      FieldName = 'modelo'
      Size = 100
    end
  end
  object IBoficina: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$agencia"')
    Left = 200
    Top = 536
  end
  object DSoficina: TDataSource
    DataSet = IBoficina
    Left = 8
    Top = 584
  end
  object DStipocuota: TDataSource
    DataSet = IBtipocuota
    Left = 40
    Top = 584
  end
  object DSgarantia: TDataSource
    DataSet = IBgarantia
    Left = 72
    Top = 584
  end
  object IBgarantia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "col$garantia"')
    Left = 136
    Top = 536
  end
  object IBtipocuota: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "col$tiposcuota"')
    Left = 168
    Top = 536
  end
  object DSamortiza: TDataSource
    Left = 104
    Top = 584
  end
  object DScodeudor: TDataSource
    DataSet = CDcodeudor
    Left = 320
    Top = 584
  end
  object CDcodeudor: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nombres'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'es_conyugue'
        DataType = ftBoolean
      end
      item
        Name = 'definicion'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'id_entrada'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'id_entrada'
    Params = <>
    StoreDefs = True
    Left = 432
    Top = 632
    Data = {
      B50000009619E0BD010000001800000006000000000003000000B500076E6F6D
      6272657301004900000001000557494454480200020064000A69645F70657273
      6F6E610100490000000100055749445448020002000F001169645F6964656E74
      696669636163696F6E02000100000000000B65735F636F6E7975677565020003
      00000000000A646566696E6963696F6E01004900000001000557494454480200
      02001E000A69645F656E747261646102000100000000000000}
    object CDcodeudornombres: TStringField
      FieldName = 'nombres'
      Size = 100
    end
    object CDcodeudorid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDcodeudorid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDcodeudores_conyugue: TBooleanField
      FieldName = 'es_conyugue'
    end
    object CDcodeudordefinicion: TStringField
      FieldName = 'definicion'
      Size = 30
    end
    object CDcodeudorid_entrada: TSmallintField
      FieldName = 'id_entrada'
    end
  end
  object DTcrediticiacod: TDataSource
    DataSet = CDcrediticiacod
    Left = 352
    Top = 582
  end
  object CDcrediticiacod: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'entidad'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'valor_inicial'
        DataType = ftCurrency
      end
      item
        Name = 'saldo'
        DataType = ftCurrency
      end
      item
        Name = 'cuota_mensual'
        DataType = ftCurrency
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'vencimiento'
        DataType = ftDate
      end
      item
        Name = 'id_colocacion'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'criterio'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'es_descuento'
        DataType = ftBoolean
      end
      item
        Name = 'fecha_capital'
        DataType = ftDate
      end
      item
        Name = 'fecha_interes'
        DataType = ftDate
      end
      item
        Name = 'estado'
        DataType = ftInteger
      end
      item
        Name = 'desc_estado'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'tipo_c'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 635
    Data = {
      C30100009619E0BD01000000180000000F000000000003000000C30107656E74
      6964616401004900000001000557494454480200020064000D76616C6F725F69
      6E696369616C080004000000010007535542545950450200490006004D6F6E65
      79000573616C646F080004000000010007535542545950450200490006004D6F
      6E6579000D63756F74615F6D656E7375616C0800040000000100075355425459
      50450200490006004D6F6E6579000A69645F706572736F6E6101004900000001
      00055749445448020002000F001169645F6964656E74696669636163696F6E02
      000100000000000B76656E63696D69656E746F04000600000000000D69645F63
      6F6C6F636163696F6E0100490000000100055749445448020002000B00086372
      69746572696F01004900000001000557494454480200020002000C65735F6465
      736375656E746F02000300000000000D66656368615F6361706974616C040006
      00000000000D66656368615F696E746572657304000600000000000665737461
      646F04000100000000000B646573635F65737461646F01004900000001000557
      49445448020002001400067469706F5F63010049000000010005574944544802
      00020014000000}
    object CDcrediticiacodentidad: TStringField
      FieldName = 'entidad'
      Size = 100
    end
    object CDcrediticiacodvalor_inicial: TCurrencyField
      FieldName = 'valor_inicial'
    end
    object CDcrediticiacodsaldo: TCurrencyField
      FieldName = 'saldo'
    end
    object CDcrediticiacodcuota_mensual: TCurrencyField
      FieldName = 'cuota_mensual'
    end
    object CDcrediticiacodid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDcrediticiacodid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDcrediticiacodvencimiento: TDateField
      FieldName = 'vencimiento'
    end
    object CDcrediticiacodid_colocacion: TStringField
      FieldName = 'id_colocacion'
      Size = 11
    end
    object CDcrediticiacodcriterio: TStringField
      FieldName = 'criterio'
      Size = 2
    end
    object CDcrediticiacodes_descuento: TBooleanField
      FieldName = 'es_descuento'
    end
    object CDcrediticiacodfecha_capital: TDateField
      FieldName = 'fecha_capital'
    end
    object CDcrediticiacodfecha_interes: TDateField
      FieldName = 'fecha_interes'
    end
    object CDcrediticiacodestado: TIntegerField
      FieldName = 'estado'
    end
    object CDcrediticiacoddesc_estado: TStringField
      FieldName = 'desc_estado'
    end
    object CDcrediticiacodtipo_c: TStringField
      FieldName = 'tipo_c'
    end
  end
  object DSbienescod: TDataSource
    DataSet = CDbienescod
    Left = 456
    Top = 582
  end
  object CDbienescod: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'descripcion_bien'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'barrio'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ciudad'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'valor_comercial'
        DataType = ftCurrency
      end
      item
        Name = 'afavorde'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'eshipoteca'
        DataType = ftSmallint
      end
      item
        Name = 'escritura'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'notaria'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'matricula'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'fecha'
        DataType = ftDate
      end
      item
        Name = 'id_solicitud'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'es_informacion'
        DataType = ftBoolean
      end
      item
        Name = 'es_garantiareal'
        DataType = ftBoolean
      end
      item
        Name = 'es_garantiapersonal'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 192
    Top = 635
    Data = {
      FA0100009619E0BD010000001800000011000000000003000000FA010A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E0200010000000000106465736372697063696F
      6E5F6269656E0100490000000100055749445448020002009600066261727269
      6F010049000000010005574944544802000200320009646972656363696F6E01
      0049000000010005574944544802000200320006636975646164010049000000
      01000557494454480200020032000F76616C6F725F636F6D65726369616C0800
      04000000010007535542545950450200490006004D6F6E65790008616661766F
      72646501004900000001000557494454480200020046000A65736869706F7465
      6361020001000000000009657363726974757261010049000000010005574944
      5448020002003200076E6F746172696101004900000001000557494454480200
      02009600096D6174726963756C61010049000000010005574944544802000200
      320005666563686104000600000000000C69645F736F6C696369747564010049
      0000000100055749445448020002000A000E65735F696E666F726D6163696F6E
      02000300000000000F65735F676172616E7469617265616C0200030000000000
      1365735F676172616E746961706572736F6E616C02000300000000000000}
    object CDbienescodid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDbienescodid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDbienescoddescripcion_bien: TStringField
      FieldName = 'descripcion_bien'
      Size = 150
    end
    object CDbienescodbarrio: TStringField
      FieldName = 'barrio'
      Size = 50
    end
    object CDbienescoddireccion: TStringField
      FieldName = 'direccion'
      Size = 50
    end
    object CDbienescodciudad: TStringField
      FieldName = 'ciudad'
      Size = 50
    end
    object CDbienescodvalor_comercial: TCurrencyField
      FieldName = 'valor_comercial'
    end
    object CDbienescodafavorde: TStringField
      FieldName = 'afavorde'
      Size = 70
    end
    object CDbienescodeshipoteca: TSmallintField
      FieldName = 'eshipoteca'
    end
    object CDbienescodescritura: TStringField
      FieldName = 'escritura'
      Size = 50
    end
    object CDbienescodnotaria: TStringField
      FieldName = 'notaria'
      Size = 150
    end
    object CDbienescodmatricula: TStringField
      FieldName = 'matricula'
      Size = 50
    end
    object CDbienescodfecha: TDateField
      FieldName = 'fecha'
    end
    object CDbienescodid_solicitud: TStringField
      FieldName = 'id_solicitud'
      Size = 10
    end
    object CDbienescodes_informacion: TBooleanField
      FieldName = 'es_informacion'
    end
    object CDbienescodes_garantiareal: TBooleanField
      FieldName = 'es_garantiareal'
    end
    object CDbienescodes_garantiapersonal: TBooleanField
      FieldName = 'es_garantiapersonal'
    end
  end
  object DSmaquinariacod: TDataSource
    DataSet = CDmaquinariacod
    Left = 486
    Top = 582
  end
  object CDmaquinariacod: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'descripcion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'marca'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'placa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pignorado'
        DataType = ftSmallint
      end
      item
        Name = 'modelo'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 456
    Top = 635
    Data = {
      110100009619E0BD01000000180000000900000000000300000011010A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E02000100000000000B6465736372697063696F
      6E01004900000001000557494454480200020064000576616C6F720800040000
      00010007535542545950450200490006004D6F6E657900056D61726361010049
      00000001000557494454480200020032000665737461646F0100490000000100
      05574944544802000200020005706C6163610100490000000100055749445448
      020002001400097069676E6F7261646F0200010000000000066D6F64656C6F01
      004900000001000557494454480200020064000000}
    object CDmaquinariacodid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDmaquinariacodid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDmaquinariacoddescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
    object CDmaquinariacodvalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDmaquinariacodmarca: TStringField
      FieldName = 'marca'
      Size = 50
    end
    object CDmaquinariacodestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object CDmaquinariacodplaca: TStringField
      FieldName = 'placa'
    end
    object CDmaquinariacodpignorado: TSmallintField
      FieldName = 'pignorado'
    end
    object CDmaquinariacodmodelo: TStringField
      FieldName = 'modelo'
      Size = 100
    end
  end
  object CDFamiliar: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'tipo_id_referencia'
        DataType = ftSmallint
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'apellido1'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'apellido2'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'direccion'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'telefono'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'tipo_referencia'
        DataType = ftSmallint
      end
      item
        Name = 'descripcion_re'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'parentesco'
        DataType = ftSmallint
      end
      item
        Name = 'estado'
        DataType = ftBoolean
      end
      item
        Name = 'id_entrada'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'primaria'
        Fields = 'id_entrada'
        Options = [ixPrimary, ixUnique]
      end>
    Params = <>
    StoreDefs = True
    Left = 647
    Top = 629
    Data = {
      560100009619E0BD01000000180000000C000000000003000000560112746970
      6F5F69645F7265666572656E63696102000100000000000A69645F706572736F
      6E610100490000000100055749445448020002000F00066E6F6D627265010049
      0000000100055749445448020002006400096170656C6C69646F310100490000
      000100055749445448020002004600096170656C6C69646F3201004900000001
      0005574944544802000200460009646972656363696F6E010049000000010005
      57494454480200020046000874656C65666F6E6F010049000000010005574944
      5448020002001E000F7469706F5F7265666572656E6369610200010000000000
      0E6465736372697063696F6E5F72650100490000000100055749445448020002
      0032000A706172656E746573636F02000100000000000665737461646F020003
      00000000000A69645F656E747261646104000100000000000000}
    object CDFamiliartipo_id_referencia: TSmallintField
      FieldName = 'tipo_id_referencia'
    end
    object CDFamiliarid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDFamiliarnombre: TStringField
      FieldName = 'nombre'
      Size = 100
    end
    object CDFamiliarapellido1: TStringField
      FieldName = 'apellido1'
      Size = 70
    end
    object CDFamiliarapellido2: TStringField
      FieldName = 'apellido2'
      Size = 70
    end
    object CDFamiliardireccion: TStringField
      FieldName = 'direccion'
      Size = 70
    end
    object CDFamiliartelefono: TStringField
      FieldName = 'telefono'
      Size = 30
    end
    object CDFamiliartipo_referencia: TSmallintField
      FieldName = 'tipo_referencia'
    end
    object CDFamiliardescripcion_re: TStringField
      FieldName = 'descripcion_re'
      Size = 50
    end
    object CDFamiliarparentesco: TSmallintField
      FieldName = 'parentesco'
    end
    object CDFamiliarestado: TBooleanField
      FieldName = 'estado'
    end
    object CDFamiliarid_entrada: TIntegerField
      FieldName = 'id_entrada'
    end
  end
  object DSfamiliar: TDataSource
    DataSet = CDFamiliar
    Left = 512
    Top = 582
  end
  object DSreferencia: TDataSource
    DataSet = IBreferencia
    Left = 536
    Top = 584
  end
  object DSparentesco: TDataSource
    DataSet = IBparentesco
    Left = 568
    Top = 584
  end
  object IBreferencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposreferencia"')
    Left = 224
    Top = 536
  end
  object IBparentesco: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposparentesco"')
    Left = 248
    Top = 536
  end
  object CDcodeudorref: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 632
    Data = {
      4D0000009619E0BD0100000018000000020000000000030000004D000A69645F
      706572736F6E610100490000000100055749445448020002000F000B65735F63
      6F6E797567756502000100000000000000}
    object CDcodeudorrefid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDcodeudorrefes_conyugue: TSmallintField
      FieldName = 'es_conyugue'
    end
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 632
    Top = 256
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDinfCrediticia
    Left = 8
    Top = 488
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = CDmaquinaria
    Left = 40
    Top = 488
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = CDbienes
    Left = 72
    Top = 488
  end
  object CDinfconyugue: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'papellido'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'sapellido'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'cuenta'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'tipo_documento'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'numero_documento'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'fecha_nacimiento'
        DataType = ftDate
      end
      item
        Name = 'lugar_nacimiento'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'empresa'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ingresos'
        DataType = ftCurrency
      end
      item
        Name = 'lugar_exp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'telefono'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'fax'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'fecha_ingreso'
        DataType = ftDate
      end
      item
        Name = 'direccion_emp'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ocupacion'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 40
    Top = 632
    Data = {
      FC0100009619E0BD010000001800000010000000000003000000FC0109706170
      656C6C69646F010049000000010005574944544802000200320009736170656C
      6C69646F0100490000000100055749445448020002003200066E6F6D62726501
      00490000000100055749445448020002003200066375656E7461010049000000
      0100055749445448020002000F000E7469706F5F646F63756D656E746F010049
      0000000100055749445448020002001E00106E756D65726F5F646F63756D656E
      746F0100490000000100055749445448020002000F001066656368615F6E6163
      696D69656E746F0400060000000000106C756761725F6E6163696D69656E746F
      010049000000010005574944544802000200320007656D707265736101004900
      0000010005574944544802000200280008696E677265736F7308000400000001
      0007535542545950450200490006004D6F6E657900096C756761725F65787001
      004900000001000557494454480200020014000874656C65666F6E6F01004900
      00000100055749445448020002001E0003666178010049000000010005574944
      5448020002001E000D66656368615F696E677265736F04000600000000000D64
      6972656363696F6E5F656D700100490000000100055749445448020002009600
      096F6375706163696F6E01004900000001000557494454480200020032000000}
    object CDinfconyuguepapellido: TStringField
      FieldName = 'papellido'
      Size = 50
    end
    object CDinfconyuguesapellido: TStringField
      FieldName = 'sapellido'
      Size = 50
    end
    object CDinfconyuguenombre: TStringField
      FieldName = 'nombre'
      Size = 50
    end
    object CDinfconyuguecuenta: TStringField
      FieldName = 'cuenta'
      Size = 15
    end
    object CDinfconyuguetipo_documento: TStringField
      FieldName = 'tipo_documento'
      Size = 30
    end
    object CDinfconyuguenumero_documento: TStringField
      FieldName = 'numero_documento'
      Size = 15
    end
    object CDinfconyuguefecha_nacimiento: TDateField
      FieldName = 'fecha_nacimiento'
    end
    object CDinfconyuguelugar_nacimiento: TStringField
      FieldName = 'lugar_nacimiento'
      Size = 50
    end
    object CDinfconyugueempresa: TStringField
      FieldName = 'empresa'
      Size = 40
    end
    object CDinfconyugueingresos: TCurrencyField
      FieldName = 'ingresos'
    end
    object CDinfconyuguelugar_exp: TStringField
      FieldName = 'lugar_exp'
    end
    object CDinfconyuguetelefono: TStringField
      FieldName = 'telefono'
      Size = 30
    end
    object CDinfconyuguefax: TStringField
      FieldName = 'fax'
      Size = 30
    end
    object CDinfconyuguefecha_ingreso: TDateField
      FieldName = 'fecha_ingreso'
    end
    object CDinfconyuguedireccion_emp: TStringField
      FieldName = 'direccion_emp'
      Size = 150
    end
    object CDinfconyugueocupacion: TStringField
      FieldName = 'ocupacion'
      Size = 50
    end
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = CDinfconyugue
    Left = 104
    Top = 488
  end
  object frDBDataSet5: TfrDBDataSet
    DataSet = IBcreditoconyugue
    Left = 136
    Top = 488
  end
  object IBcreditoconyugue: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  "gen$infcrediticia"'
      'WHERE'
      '  ("gen$infcrediticia".ID_PERSONA = :ID_PERSONA) AND '
      
        '  ("gen$infcrediticia".ID_IDENTIFICACION = :ID_IDENTIFICACION) a' +
        'nd'
      '  ("gen$infcrediticia".ID_SOLICITUD = :ID_SOLICITUD)'
      '')
    Left = 448
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end>
  end
  object CDinfgeneral: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'apellido1'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'apellido2'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'estado_civil'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'lugar_exp'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'direccion_res'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'barrio'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ciudad'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'telefono'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'tipo_documento'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'numero'
        DataType = ftSmallint
      end
      item
        Name = 'permanencia'
        DataType = ftInteger
      end
      item
        Name = 'tipo_vivienda'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'nivel_estudio'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'es_codeudor'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 336
    Top = 632
    Data = {
      080200009619E0BD01000000180000001100000000000300000008021169645F
      6964656E74696669636163696F6E02000100000000000A69645F706572736F6E
      610100490000000100055749445448020002000F00066E6F6D62726501004900
      00000100055749445448020002003200096170656C6C69646F31010049000000
      0100055749445448020002003200096170656C6C69646F320100490000000100
      0557494454480200020032000C65737461646F5F636976696C01004900000001
      00055749445448020002001E00096C756761725F657870010049000000010005
      57494454480200020032000D646972656363696F6E5F72657301004900000001
      000557494454480200020046000662617272696F010049000000010005574944
      5448020002003200066369756461640100490000000100055749445448020002
      0032000874656C65666F6E6F0100490000000100055749445448020002001E00
      0E7469706F5F646F63756D656E746F0100490000000100055749445448020002
      003200066E756D65726F02000100000000000B7065726D616E656E6369610400
      0100000000000D7469706F5F76697669656E6461010049000000010005574944
      54480200020032000D6E6976656C5F6573747564696F01004900000001000557
      494454480200020032000B65735F636F646575646F7201004900000001000557
      494454480200020032000000}
    object CDinfgeneralid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDinfgeneralid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDinfgeneralnombre: TStringField
      FieldName = 'nombre'
      Size = 50
    end
    object CDinfgeneralapellido1: TStringField
      FieldName = 'apellido1'
      Size = 50
    end
    object CDinfgeneralapellido2: TStringField
      FieldName = 'apellido2'
      Size = 50
    end
    object CDinfgeneralestado_civil: TStringField
      FieldName = 'estado_civil'
      Size = 30
    end
    object CDinfgenerallugar_exp: TStringField
      FieldName = 'lugar_exp'
      Size = 50
    end
    object CDinfgeneraldireccion_res: TStringField
      FieldName = 'direccion_res'
      Size = 70
    end
    object CDinfgeneralbarrio: TStringField
      FieldName = 'barrio'
      Size = 50
    end
    object CDinfgeneralciudad: TStringField
      FieldName = 'ciudad'
      Size = 50
    end
    object CDinfgeneraltelefono: TStringField
      FieldName = 'telefono'
      Size = 30
    end
    object CDinfgeneraltipo_documento: TStringField
      FieldName = 'tipo_documento'
      Size = 50
    end
    object CDinfgeneralnumero: TSmallintField
      FieldName = 'numero'
    end
    object CDinfgeneralpermanencia: TIntegerField
      FieldName = 'permanencia'
    end
    object CDinfgeneraltipo_vivienda: TStringField
      FieldName = 'tipo_vivienda'
      Size = 50
    end
    object CDinfgeneralnivel_estudio: TStringField
      FieldName = 'nivel_estudio'
      Size = 50
    end
    object CDinfgenerales_codeudor: TStringField
      FieldName = 'es_codeudor'
      Size = 50
    end
  end
  object frDBDataSet6: TfrDBDataSet
    DataSet = CDinfgeneral
    Left = 168
    Top = 488
  end
  object CDeconomica: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'profesion'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'empresa'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'fecha_ingreso'
        DataType = ftDate
      end
      item
        Name = 'cargo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ingreso_p'
        DataType = ftCurrency
      end
      item
        Name = 'otros_ing'
        DataType = ftCurrency
      end
      item
        Name = 'desc_ingresos'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'eg_alquiler'
        DataType = ftCurrency
      end
      item
        Name = 'eg_servicios'
        DataType = ftCurrency
      end
      item
        Name = 'eg_transporte'
        DataType = ftCurrency
      end
      item
        Name = 'eg_alimentacion'
        DataType = ftCurrency
      end
      item
        Name = 'eg_deudas'
        DataType = ftCurrency
      end
      item
        Name = 'eg_otros'
        DataType = ftCurrency
      end
      item
        Name = 'desc_egresos'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'direccion_emp'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'telefono_emp'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'fax_emp'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'numero'
        DataType = ftSmallint
      end
      item
        Name = 'ciudad'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ocupacion'
        DataType = ftString
        Size = 105
      end>
    IndexDefs = <>
    IndexFieldNames = 'id_persona'
    MasterFields = 'id_persona'
    MasterSource = DSinfgeneral
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 584
    Top = 632
    Data = {
      E50200009619E0BD010000001800000016000000000003000000E5021169645F
      6964656E74696669636163696F6E02000100000000000A69645F706572736F6E
      610100490000000100055749445448020002000F000970726F666573696F6E01
      00490000000100055749445448020002001E0007656D70726573610100490000
      0001000557494454480200020032000D66656368615F696E677265736F040006
      000000000005636172676F0100490000000100055749445448020002001E0009
      696E677265736F5F70080004000000010007535542545950450200490006004D
      6F6E657900096F74726F735F696E670800040000000100075355425459504502
      00490006004D6F6E6579000D646573635F696E677265736F7301004900000001
      000557494454480200020046000B65675F616C7175696C657208000400000001
      0007535542545950450200490006004D6F6E6579000C65675F73657276696369
      6F73080004000000010007535542545950450200490006004D6F6E6579000D65
      675F7472616E73706F7274650800040000000100075355425459504502004900
      06004D6F6E6579000F65675F616C696D656E746163696F6E0800040000000100
      07535542545950450200490006004D6F6E6579000965675F6465756461730800
      04000000010007535542545950450200490006004D6F6E6579000865675F6F74
      726F73080004000000010007535542545950450200490006004D6F6E6579000C
      646573635F65677265736F730100490000000100055749445448020002004600
      0D646972656363696F6E5F656D70010049000000010005574944544802000200
      32000C74656C65666F6E6F5F656D700100490000000100055749445448020002
      001E00076661785F656D700100490000000100055749445448020002001E0006
      6E756D65726F0200010000000000066369756461640100490000000100055749
      445448020002006400096F6375706163696F6E01004900000001000557494454
      480200020069000000}
    object CDeconomicaid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDeconomicaid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDeconomicaprofesion: TStringField
      FieldName = 'profesion'
      Size = 30
    end
    object CDeconomicaempresa: TStringField
      FieldName = 'empresa'
      Size = 50
    end
    object CDeconomicafecha_ingreso: TDateField
      FieldName = 'fecha_ingreso'
    end
    object CDeconomicacargo: TStringField
      FieldName = 'cargo'
      Size = 30
    end
    object CDeconomicaingreso_p: TCurrencyField
      FieldName = 'ingreso_p'
    end
    object CDeconomicaotros_ing: TCurrencyField
      FieldName = 'otros_ing'
    end
    object CDeconomicadesc_ingresos: TStringField
      FieldName = 'desc_ingresos'
      Size = 70
    end
    object CDeconomicaeg_alquiler: TCurrencyField
      FieldName = 'eg_alquiler'
    end
    object CDeconomicaeg_servicios: TCurrencyField
      FieldName = 'eg_servicios'
    end
    object CDeconomicaeg_transporte: TCurrencyField
      FieldName = 'eg_transporte'
    end
    object CDeconomicaeg_alimentacion: TCurrencyField
      FieldName = 'eg_alimentacion'
    end
    object CDeconomicaeg_deudas: TCurrencyField
      FieldName = 'eg_deudas'
    end
    object CDeconomicaeg_otros: TCurrencyField
      FieldName = 'eg_otros'
    end
    object CDeconomicadesc_egresos: TStringField
      FieldName = 'desc_egresos'
      Size = 70
    end
    object CDeconomicadireccion_emp: TStringField
      FieldName = 'direccion_emp'
      Size = 50
    end
    object CDeconomicatelefono_emp: TStringField
      FieldName = 'telefono_emp'
      Size = 30
    end
    object CDeconomicafax_emp: TStringField
      FieldName = 'fax_emp'
      Size = 30
    end
    object CDeconomicanumero: TSmallintField
      FieldName = 'numero'
    end
    object CDeconomicaciudad: TStringField
      FieldName = 'ciudad'
      Size = 100
    end
    object CDeconomicaocupacion: TStringField
      FieldName = 'ocupacion'
      Size = 105
    end
  end
  object frDBDataSet7: TfrDBDataSet
    DataSet = CDeconomica
    Left = 200
    Top = 488
  end
  object frDBDataSet8: TfrDBDataSet
    DataSet = CDinfcreditos
    Left = 232
    Top = 488
  end
  object frDBDataSet9: TfrDBDataSet
    DataSet = CDinfbienes
    Left = 264
    Top = 488
  end
  object DSinfgeneral: TDataSource
    DataSet = CDinfgeneral
    Left = 382
    Top = 585
  end
  object CDinfbienes: TClientDataSet
    Active = True
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    FieldDefs = <
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'descripcion_bien'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'barrio'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'direccion'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'ciudad'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'valor_comercial'
        DataType = ftCurrency
      end
      item
        Name = 'afavorde'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'eshipoteca'
        DataType = ftSmallint
      end
      item
        Name = 'matricula'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'escritura'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'id_persona'
    MasterFields = 'id_persona'
    MasterSource = DSinfgeneral
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 616
    Top = 632
    Data = {
      7A0100009619E0BD01000000180000000B0000000000030000007A010A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E0200010000000000106465736372697063696F
      6E5F6269656E0100490000000100055749445448020002006400066261727269
      6F010049000000010005574944544802000200460009646972656363696F6E01
      0049000000010005574944544802000200460006636975646164010049000000
      01000557494454480200020032000F76616C6F725F636F6D65726369616C0800
      04000000010007535542545950450200490006004D6F6E65790008616661766F
      72646501004900000001000557494454480200020032000A65736869706F7465
      63610200010000000000096D6174726963756C61010049000000010005574944
      5448020002003200096573637269747572610100490000000100055749445448
      02000200320001000D44454641554C545F4F524445520200820000000000}
    object CDinfbienesid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDinfbienesid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDinfbienesdescripcion_bien: TStringField
      FieldName = 'descripcion_bien'
      Size = 100
    end
    object CDinfbienesbarrio: TStringField
      FieldName = 'barrio'
      Size = 70
    end
    object CDinfbienesdireccion: TStringField
      FieldName = 'direccion'
      Size = 70
    end
    object CDinfbienesciudad: TStringField
      FieldName = 'ciudad'
      Size = 50
    end
    object CDinfbienesvalor_comercial: TCurrencyField
      FieldName = 'valor_comercial'
    end
    object CDinfbienesafavorde: TStringField
      FieldName = 'afavorde'
      Size = 50
    end
    object CDinfbieneseshipoteca: TSmallintField
      FieldName = 'eshipoteca'
    end
    object CDinfbienesmatricula: TStringField
      FieldName = 'matricula'
      Size = 50
    end
    object CDinfbienesescritura: TStringField
      FieldName = 'escritura'
      Size = 50
    end
  end
  object CDinfcreditos: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'id_persona'
    MasterFields = 'id_persona'
    MasterSource = DSinfgeneral
    PacketRecords = 0
    Params = <>
    Left = 552
    Top = 632
    Data = {
      F90000009619E0BD010000001800000007000000000003000000F9000A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E02000100000000000573616C646F0800040000
      00010007535542545950450200490006004D6F6E65790007656E746964616401
      004900000001000557494454480200020046000D63756F74615F6D656E737561
      6C080004000000010007535542545950450200490006004D6F6E6579000B7665
      6E63696D69656E746F04000600000000000D76616C6F725F696E696369616C08
      0004000000010007535542545950450200490006004D6F6E6579000000}
    object CDinfcreditosid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDinfcreditosid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDinfcreditossaldo: TCurrencyField
      FieldName = 'saldo'
    end
    object CDinfcreditosentidad: TStringField
      FieldName = 'entidad'
      Size = 70
    end
    object CDinfcreditoscuota_mensual: TCurrencyField
      FieldName = 'cuota_mensual'
    end
    object CDinfcreditosvencimiento: TDateField
      FieldName = 'vencimiento'
    end
    object CDinfcreditosvalor_inicial: TCurrencyField
      FieldName = 'valor_inicial'
    end
  end
  object CDinfmaquinaria: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'descripcion'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'marca'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'placa'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'estado'
        DataType = ftSmallint
      end
      item
        Name = 'pignorado'
        DataType = ftSmallint
      end
      item
        Name = 'modelo'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    IndexFieldNames = 'id_persona'
    MasterFields = 'id_persona'
    MasterSource = DSinfgeneral
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 632
    Data = {
      050100009619E0BD01000000180000000900000000000300000005010A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E02000100000000000B6465736372697063696F
      6E01004900000001000557494454480200020046000576616C6F720800040000
      00010007535542545950450200490006004D6F6E657900056D61726361010049
      0000000100055749445448020002001E0005706C616361010049000000010005
      5749445448020002001E000665737461646F0200010000000000097069676E6F
      7261646F0200010000000000066D6F64656C6F01004900000001000557494454
      480200020064000000}
    object CDinfmaquinariaid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDinfmaquinariaid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDinfmaquinariadescripcion: TStringField
      FieldName = 'descripcion'
      Size = 70
    end
    object CDinfmaquinariavalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDinfmaquinariamarca: TStringField
      FieldName = 'marca'
      Size = 30
    end
    object CDinfmaquinariaplaca: TStringField
      FieldName = 'placa'
      Size = 30
    end
    object CDinfmaquinariaestado: TSmallintField
      FieldName = 'estado'
    end
    object CDinfmaquinariapignorado: TSmallintField
      FieldName = 'pignorado'
    end
    object CDinfmaquinariamodelo: TStringField
      FieldName = 'modelo'
      Size = 100
    end
  end
  object frDBDataSet10: TfrDBDataSet
    DataSet = CDinfmaquinaria
    Left = 296
    Top = 488
  end
  object CDinfreferencias: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 632
    Data = {
      060100009619E0BD0100000018000000080000000000030000000601066E6F6D
      6272650100490000000100055749445448020002004600096170656C6C69646F
      310100490000000100055749445448020002004600096170656C6C69646F3201
      004900000001000557494454480200020046000A706172656E746573636F0100
      4900000001000557494454480200020032000F7469706F5F7265666572656E63
      696101004900000001000557494454480200020046000874656C65666F6E6F01
      004900000001000557494454480200020032000D69645F7265666572656E6369
      6104000100000000000A69645F706572736F6E61010049000000010005574944
      5448020002000F000000}
    object CDinfreferenciasnombre: TStringField
      FieldName = 'nombre'
      Size = 70
    end
    object CDinfreferenciasapellido1: TStringField
      FieldName = 'apellido1'
      Size = 70
    end
    object CDinfreferenciasapellido2: TStringField
      FieldName = 'apellido2'
      Size = 70
    end
    object CDinfreferenciasparentesco: TStringField
      FieldName = 'parentesco'
      Size = 50
    end
    object CDinfreferenciastipo_referencia: TStringField
      FieldName = 'tipo_referencia'
      Size = 70
    end
    object CDinfreferenciastelefono: TStringField
      FieldName = 'telefono'
      Size = 50
    end
    object CDinfreferenciasid_referencia: TIntegerField
      FieldName = 'id_referencia'
    end
    object CDinfreferenciasid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
  end
  object IBinfreferencias: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      'SELECT '
      '  "gen$tiposparentesco".DESCRIPCION_PARENTESCO,'
      '  "gen$tiposreferencia".DESCRIPCION_REFERENCIA,'
      '  "col$referencias".NOMBRE_REFERENCIA,'
      '  "col$referencias".PRIMER_APELLIDO_REFERENCIA,'
      '  "col$referencias".SEGUNDO_APELLIDO_REFERENCIA,'
      '  "col$referencias".DIRECCION_REFERENCIA,'
      '  "col$referencias".TELEFONO_REFERENCIA,'
      '  "col$referenciasolicitud".ID_ENTRADA,'
      '  "gen$tiposparentesco".ID_PARENTESCO,'
      '  "col$referencias".TIPO_REFERENCIA'
      'FROM'
      '  "col$referencias"'
      
        '  INNER JOIN "col$referenciasolicitud" ON ("col$referencias".ID_' +
        'ENTRADA = "col$referenciasolicitud".ID_ENTRADA)'
      
        '  INNER JOIN "gen$tiposparentesco" ON ("col$referencias".PARENTE' +
        'SCO_REFERENCIA = "gen$tiposparentesco".ID_PARENTESCO)'
      
        '  INNER JOIN "gen$tiposreferencia" ON ("col$referencias".TIPO_RE' +
        'FERENCIA = "gen$tiposreferencia".ID_REFERENCIA)'
      'WHERE'
      
        '  ("col$referenciasolicitud".ID_SOLICITUD = :ID_SOLICITUD) ORDER' +
        ' BY   "gen$tiposreferencia".ID_REFERENCIA')
    Left = 320
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end>
  end
  object frDBDataSet11: TfrDBDataSet
    DataSet = IBinfreferencias
    Left = 328
    Top = 488
  end
  object CDfirmas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 632
    Data = {
      340000009619E0BD010000001800000001000000000003000000340005666972
      6D6101004900000001000557494454480200020014000000}
    object CDfirmasfirma: TStringField
      FieldName = 'firma'
    end
  end
  object frDBDataSet12: TfrDBDataSet
    DataSet = CDfirmas
    Left = 360
    Top = 488
  end
  object IBlinea: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "col$lineas"')
    Left = 272
    Top = 536
  end
  object IBrespaldo: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "col$respaldo"')
    Left = 296
    Top = 536
  end
  object DSrespaldo: TDataSource
    DataSet = IBrespaldo
    Left = 432
    Top = 584
  end
  object DSlinea: TDataSource
    DataSet = IBlinea
    Left = 592
    Top = 584
  end
  object CDrequisitos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_requisito'
        DataType = ftInteger
      end
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    IndexName = 'DEFAULT_ORDER'
    Params = <>
    StoreDefs = True
    Left = 168
    Top = 632
    Data = {
      680000009619E0BD01000000180000000300000000000300000068000C69645F
      72657175697369746F04000100000000000A69645F706572736F6E6101004900
      00000100055749445448020002000F001169645F6964656E7469666963616369
      6F6E02000100000000000000}
    object CDrequisitosid_requisito: TIntegerField
      FieldName = 'id_requisito'
    end
    object CDrequisitosid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDrequisitosid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "col$requisitos"')
    Left = 504
    Top = 536
  end
  object frDBDataSet13: TfrDBDataSet
    DataSet = IBQuery1
    Left = 424
    Top = 488
  end
  object frDBDataSet14: TfrDBDataSet
    DataSet = deu
    Left = 392
    Top = 488
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "col$requisitos"'
      'where ID_REQUISITO < 7')
    Left = 472
    Top = 536
  end
  object deu: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 632
    Data = {
      470000009619E0BD010000001800000002000000000003000000470006646575
      646F720100490000000100055749445448020002000A00097265717569736974
      6F02000100000000000000}
    object deudeudor: TStringField
      FieldName = 'deudor'
      Size = 10
    end
    object deurequisito: TSmallintField
      FieldName = 'requisito'
    end
  end
  object CDrequisitocod: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 632
    Data = {
      2F0000009619E0BD0100000018000000010000000000030000002F000C69645F
      72657175697369746F02000100000000000000}
    object CDrequisitocodid_requisito: TSmallintField
      FieldName = 'id_requisito'
    end
  end
  object CDrequisitogen: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 696
    Top = 632
    Data = {
      680000009619E0BD01000000180000000300000000000300000068000C69645F
      72657175697369746F02000100000000001169645F6964656E74696669636163
      696F6E02000100000000000A69645F706572736F6E6101004900000001000557
      49445448020002000F000000}
    object CDrequisitogenid_requisito: TSmallintField
      FieldName = 'id_requisito'
    end
    object CDrequisitogenid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDrequisitogenid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
  end
  object frReport2: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport2GetValue
    Left = 656
    Top = 256
    ReportForm = {19000000}
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 656
    Top = 144
  end
  object PopupMenu1: TPopupMenu
    Left = 632
    Top = 352
    object ListarCreditosdelaCooperativa1: TMenuItem
      Caption = '&Listar Creditos Vigentes'
      OnClick = ListarCreditosdelaCooperativa1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 632
    Top = 376
    object ListarCreditosVigentes1: TMenuItem
      Caption = '&Listar Creditos Vigentes'
      OnClick = ListarCreditosVigentes1Click
    end
  end
  object CDbienesgeneral: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_persona'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'id_identificacion'
        DataType = ftSmallint
      end
      item
        Name = 'descripcion_bien'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'barrio'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ciudad'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'valor_comercial'
        DataType = ftCurrency
      end
      item
        Name = 'eshipoteca'
        DataType = ftSmallint
      end
      item
        Name = 'afavorde'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'escritura'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'notaria'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'matricula'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'fecha'
        DataType = ftDate
      end
      item
        Name = 'es_informacion'
        DataType = ftBoolean
      end
      item
        Name = 'es_garantiareal'
        DataType = ftBoolean
      end
      item
        Name = 'es_garantiapersonal'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 304
    Top = 632
    Data = {
      D90100009619E0BD010000001800000010000000000003000000D9010A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E0200010000000000106465736372697063696F
      6E5F6269656E0100490000000100055749445448020002006400066261727269
      6F010049000000010005574944544802000200640009646972656363696F6E01
      0049000000010005574944544802000200320006636975646164010049000000
      01000557494454480200020064000F76616C6F725F636F6D65726369616C0800
      04000000010007535542545950450200490006004D6F6E6579000A6573686970
      6F74656361020001000000000008616661766F72646501004900000001000557
      4944544802000200640009657363726974757261010049000000010005574944
      5448020002006400076E6F746172696101004900000001000557494454480200
      02006400096D6174726963756C61010049000000010005574944544802000200
      320005666563686104000600000000000E65735F696E666F726D6163696F6E02
      000300000000000F65735F676172616E7469617265616C020003000000000013
      65735F676172616E746961706572736F6E616C02000300000000000000}
    object CDbienesgeneralid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDbienesgeneralid_identificacion: TSmallintField
      FieldName = 'id_identificacion'
    end
    object CDbienesgeneraldescripcion_bien: TStringField
      FieldName = 'descripcion_bien'
      Size = 100
    end
    object CDbienesgeneralbarrio: TStringField
      FieldName = 'barrio'
      Size = 100
    end
    object CDbienesgeneraldireccion: TStringField
      FieldName = 'direccion'
      Size = 50
    end
    object CDbienesgeneralciudad: TStringField
      FieldName = 'ciudad'
      Size = 100
    end
    object CDbienesgeneralvalor_comercial: TCurrencyField
      FieldName = 'valor_comercial'
    end
    object CDbienesgeneraleshipoteca: TSmallintField
      FieldName = 'eshipoteca'
    end
    object CDbienesgeneralafavorde: TStringField
      FieldName = 'afavorde'
      Size = 100
    end
    object CDbienesgeneralescritura: TStringField
      FieldName = 'escritura'
      Size = 100
    end
    object CDbienesgeneralnotaria: TStringField
      FieldName = 'notaria'
      Size = 100
    end
    object CDbienesgeneralmatricula: TStringField
      FieldName = 'matricula'
      Size = 50
    end
    object CDbienesgeneralfecha: TDateField
      FieldName = 'fecha'
    end
    object CDbienesgenerales_informacion: TBooleanField
      FieldName = 'es_informacion'
    end
    object CDbienesgenerales_garantiareal: TBooleanField
      FieldName = 'es_garantiareal'
    end
    object CDbienesgenerales_garantiapersonal: TBooleanField
      FieldName = 'es_garantiapersonal'
    end
  end
  object dd: TLMDMessageBoxDlg
    MessageAlignment.Alignment = agTopLeft
    MessageFont.Charset = DEFAULT_CHARSET
    MessageFont.Color = clBlack
    MessageFont.Height = -11
    MessageFont.Name = 'MS Sans Serif'
    MessageFont.Style = []
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clBlack
    CaptionFont.Height = -11
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = []
    ButtonFont.Charset = DEFAULT_CHARSET
    ButtonFont.Color = clBlack
    ButtonFont.Height = -11
    ButtonFont.Name = 'MS Sans Serif'
    ButtonFont.Style = []
    CustomGlyphListIndex = 0
    CustomGlyphImageIndex = 0
    Left = 656
    Top = 304
  end
  object PopupMenu3: TPopupMenu
    Left = 648
    Top = 416
    object CambiarNumero1: TMenuItem
      Caption = 'Cambiar Numero'
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 656
    Top = 352
    object VerObservacionesAnteriores1: TMenuItem
      Caption = 'Ver Observaciones Anteriores'
      OnClick = VerObservacionesAnteriores1Click
    end
  end
  object IBseguro: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction3
    SQL.Strings = (
      
        'select "col$solicitud"."S_VIDA","col$solicitud"."S_EXEQUIAL"  fr' +
        'om "col$solicitud"'
      'where "col$solicitud"."ID_SOLICITUD" = :ID_SOLICITUD')
    Left = 344
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction3: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 632
    Top = 216
  end
  object CDvalidaconyuge: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
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
        Name = 'es_conyuge'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 632
    Data = {
      660000009619E0BD01000000180000000300000000000300000066000A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E04000100000000000A65735F636F6E79756765
      04000100000000000000}
    object CDvalidaconyugeid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDvalidaconyugeid_identificacion: TIntegerField
      FieldName = 'id_identificacion'
    end
    object CDvalidaconyugees_conyuge: TIntegerField
      FieldName = 'es_conyuge'
    end
  end
  object IBequivida: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction4
    Left = 376
    Top = 536
  end
  object IBTransaction4: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 656
    Top = 184
  end
  object CDadicion: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 632
    Data = {
      530000009619E0BD01000000180000000200000000000300000053000A69645F
      706572736F6E610100490000000100055749445448020002000F001169645F69
      64656E74696669636163696F6E04000100000000000000}
    object CDadicionid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDadicionid_identificacion: TIntegerField
      FieldName = 'id_identificacion'
    end
  end
  object PopupMenu5: TPopupMenu
    Left = 656
    Top = 376
    object ConsultarCrdito1: TMenuItem
      Caption = 'Consultar Colocacion'
      OnClick = ConsultarCrdito1Click
    end
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction5
    Left = 632
    Top = 88
  end
  object IBTransaction5: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 632
    Top = 144
  end
  object IBQuery3: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction6
    Left = 400
    Top = 536
  end
  object IBQuery4: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction6
    Left = 424
    Top = 536
  end
  object IBTransaction6: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 656
    Top = 216
  end
  object CDfianzas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'colocacion'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'dias'
        DataType = ftInteger
      end
      item
        Name = 'nombre'
        DataType = ftString
        Size = 15
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
        Name = 'fecha_capital'
        DataType = ftDate
      end
      item
        Name = 'fecha_interes'
        DataType = ftDate
      end>
    IndexDefs = <>
    IndexFieldNames = 'id_persona'
    MasterFields = 'id_persona'
    MasterSource = DSinfgeneral
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 720
    Top = 632
    Data = {
      E80000009619E0BD010000001800000008000000000003000000E8000A636F6C
      6F636163696F6E0100490000000100055749445448020002000F000576616C6F
      72080004000000010007535542545950450200490006004D6F6E657900046469
      61730400010000000000066E6F6D627265010049000000010005574944544802
      0002000F000A69645F706572736F6E6101004900000001000557494454480200
      02000F001169645F6964656E74696669636163696F6E04000100000000000D66
      656368615F6361706974616C04000600000000000D66656368615F696E746572
      657304000600000000000000}
    object CDfianzascolocacion: TStringField
      FieldName = 'colocacion'
      Size = 15
    end
    object CDfianzasvalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDfianzasdias: TIntegerField
      FieldName = 'dias'
    end
    object CDfianzasnombre: TStringField
      FieldName = 'nombre'
      Size = 15
    end
    object CDfianzasid_persona: TStringField
      FieldName = 'id_persona'
      Size = 15
    end
    object CDfianzasid_identificacion: TIntegerField
      FieldName = 'id_identificacion'
    end
    object CDfianzasfecha_capital: TDateField
      FieldName = 'fecha_capital'
    end
    object CDfianzasfecha_interes: TDateField
      FieldName = 'fecha_interes'
    end
  end
  object frDBDataSet15: TfrDBDataSet
    DataSet = CDfianzas
    Left = 456
    Top = 488
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction6
    Left = 656
    Top = 88
  end
  object CDSocial: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 632
    Data = {
      5E0000009619E0BD0100000018000000020000000000030000005E000D69645F
      636F6C6F636163696F6E0100490000000100055749445448020002000F000573
      616C646F080004000000010007535542545950450200490006004D6F6E657900
      0000}
    object CDSocialid_colocacion: TStringField
      FieldName = 'id_colocacion'
      Size = 15
    end
    object CDSocialsaldo: TCurrencyField
      FieldName = 'saldo'
    end
  end
end
