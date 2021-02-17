object frmDocumentoEquivalente: TfrmDocumentoEquivalente
  Left = 477
  Top = 192
  Width = 992
  Height = 574
  Caption = 'Documento Equivalente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 134
    Height = 13
    Caption = 'Documento Equivalente No.'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 52
    Height = 13
    Caption = 'Facturar A:'
  end
  object Label3: TLabel
    Left = 16
    Top = 72
    Width = 58
    Height = 13
    Caption = 'Documento:'
  end
  object Label4: TLabel
    Left = 16
    Top = 104
    Width = 48
    Height = 13
    Caption = 'Direcci'#243'n:'
  end
  object Label5: TLabel
    Left = 16
    Top = 136
    Width = 36
    Height = 13
    Caption = 'Ciudad:'
  end
  object Label6: TLabel
    Left = 16
    Top = 168
    Width = 45
    Height = 13
    Caption = 'Tel'#233'fono:'
  end
  object Label7: TLabel
    Left = 676
    Top = 344
    Width = 46
    Height = 13
    Caption = 'SubTotal:'
  end
  object Label8: TLabel
    Left = 676
    Top = 369
    Width = 140
    Height = 13
    Caption = 'Tasa de Impuesto Retenci'#243'n:'
  end
  object Label9: TLabel
    Left = 676
    Top = 393
    Width = 52
    Height = 13
    Caption = 'Retenci'#243'n:'
  end
  object Label10: TLabel
    Left = 676
    Top = 419
    Width = 65
    Height = 13
    Caption = 'Tasa ReteIva'
  end
  object Label11: TLabel
    Left = 678
    Top = 446
    Width = 58
    Height = 13
    Caption = 'Iva Asumido'
  end
  object Label12: TLabel
    Left = 16
    Top = 381
    Width = 70
    Height = 13
    Caption = 'Comentarios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 680
    Top = 469
    Width = 41
    Height = 13
    Caption = 'TOTAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 205
    Top = 73
    Width = 37
    Height = 13
    Caption = 'Nombre'
  end
  object Label15: TLabel
    Left = 80
    Top = 48
    Width = 94
    Height = 13
    Caption = 'Tipo de Documento'
  end
  object Label16: TLabel
    Left = 254
    Top = 17
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object edNumero: TEdit
    Left = 156
    Top = 13
    Width = 77
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 8
  end
  object edNombre: TEdit
    Left = 277
    Top = 71
    Width = 343
    Height = 21
    TabOrder = 3
  end
  object edDocumento: TEdit
    Left = 78
    Top = 70
    Width = 121
    Height = 21
    TabOrder = 2
    OnExit = edDocumentoExit
  end
  object edDireccion: TEdit
    Left = 72
    Top = 102
    Width = 547
    Height = 21
    TabOrder = 4
  end
  object edCiudad: TEdit
    Left = 72
    Top = 133
    Width = 441
    Height = 21
    TabOrder = 5
  end
  object edTelefono: TEdit
    Left = 72
    Top = 164
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object DBGdata: TDBGrid
    Left = 16
    Top = 192
    Width = 945
    Height = 145
    DataSource = DSdata
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ITEM'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 687
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Width = 108
        Visible = True
      end>
  end
  object edSubtotal: TJvCurrencyEdit
    Left = 819
    Top = 341
    Width = 121
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 9
    OnChange = edSubtotalChange
    HasMaxValue = False
    HasMinValue = False
    ClipBoardCommands = [caCopy]
  end
  object edRetencion: TJvCurrencyEdit
    Left = 819
    Top = 389
    Width = 121
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 11
    HasMaxValue = False
    HasMinValue = False
    ClipBoardCommands = [caCopy]
  end
  object edTasaRetencion: TJvFloatEdit
    Left = 819
    Top = 367
    Width = 121
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    GroupIndex = -1
    MaxPixel.Font.Charset = DEFAULT_CHARSET
    MaxPixel.Font.Color = clWindowText
    MaxPixel.Font.Height = -11
    MaxPixel.Font.Name = 'MS Sans Serif'
    MaxPixel.Font.Style = []
    Modified = False
    SelStart = 0
    SelLength = 0
    PasswordChar = #0
    ReadOnly = False
    TabOrder = 10
    OnChange = edTasaRetencionChange
  end
  object edTasaIva: TJvFloatEdit
    Left = 819
    Top = 415
    Width = 121
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    GroupIndex = -1
    MaxPixel.Font.Charset = DEFAULT_CHARSET
    MaxPixel.Font.Color = clWindowText
    MaxPixel.Font.Height = -11
    MaxPixel.Font.Name = 'MS Sans Serif'
    MaxPixel.Font.Style = []
    Modified = False
    SelStart = 0
    SelLength = 0
    PasswordChar = #0
    ReadOnly = False
    TabOrder = 12
    OnChange = edTasaIvaChange
  end
  object edIva: TJvCurrencyEdit
    Left = 819
    Top = 440
    Width = 121
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 13
    HasMaxValue = False
    HasMinValue = False
    ClipBoardCommands = [caCopy]
  end
  object chkImpuesto: TCheckBox
    Left = 16
    Top = 404
    Width = 457
    Height = 17
    Caption = 'No soy responsable del impuesto a las ventas'
    Checked = True
    State = cbChecked
    TabOrder = 15
  end
  object chkRegimenSimplificado: TCheckBox
    Left = 16
    Top = 428
    Width = 449
    Height = 17
    Caption = 'Soy responsable del Regimen Simplificado'
    Checked = True
    State = cbChecked
    TabOrder = 16
  end
  object chkNoObligado: TCheckBox
    Left = 16
    Top = 452
    Width = 457
    Height = 17
    Caption = 'No estoy obligado a facturar'
    Checked = True
    State = cbChecked
    TabOrder = 17
  end
  object edTotal: TJvCurrencyEdit
    Left = 784
    Top = 464
    Width = 156
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    ReadOnly = True
    TabOrder = 14
    HasMaxValue = False
    HasMinValue = False
    ClipBoardCommands = [caCopy]
  end
  object DBNdata: TDBNavigator
    Left = 16
    Top = 344
    Width = 228
    Height = 25
    DataSource = DSdata
    VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Flat = True
    TabOrder = 18
  end
  object btnGenerar: TButton
    Left = 680
    Top = 496
    Width = 99
    Height = 25
    Caption = 'Generar'
    Enabled = False
    TabOrder = 19
    OnClick = btnGenerarClick
  end
  object edTipoDocumento: TDBLookupComboBox
    Left = 184
    Top = 44
    Width = 265
    Height = 21
    KeyField = 'ID_IDENTIFICACION'
    ListField = 'DESCRIPCION_IDENTIFICACION'
    ListSource = DStiposidentificacion
    TabOrder = 1
  end
  object btnCerrar: TButton
    Left = 888
    Top = 496
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 21
    OnClick = btnCerrarClick
  end
  object edFecha: TDateTimePicker
    Left = 304
    Top = 12
    Width = 97
    Height = 21
    CalAlignment = dtaLeft
    Date = 44133.4590953241
    Time = 44133.4590953241
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object btnImprimir: TButton
    Left = 795
    Top = 496
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    Enabled = False
    TabOrder = 20
    OnClick = btnImprimirClick
  end
  object btnNuevo: TButton
    Left = 16
    Top = 496
    Width = 75
    Height = 25
    Caption = 'Nuevo'
    Enabled = False
    TabOrder = 22
    OnClick = btnNuevoClick
  end
  object DSdata: TDataSource
    DataSet = CDSdata
    Left = 136
    Top = 200
  end
  object prReport1: TprReport
    FromPage = 1
    ToPage = 1
    Values = <>
    Variables = <
      item
        Name = 'EMPRESA'
        ValueType = 'prvvtString'
        Value = 'COODIN LTDA'
      end
      item
        Name = 'NIT'
        ValueType = 'prvvtString'
        Value = '800.000.000-1'
      end
      item
        Name = 'NUMERO'
        ValueType = 'prvvtInteger'
        Value = 1840
      end
      item
        Name = 'DIRECCION_EMPRESA'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'TELEFONO_EMPRESA'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'FECHA'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'NOMBRE'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'DIRECCION'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'CIUDAD'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'TELEFONO'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'SUBTOTAL'
        ValueType = 'prvvtDouble'
        Value = 0
      end
      item
        Name = 'TASA_RETEFUENTE'
        ValueType = 'prvvtDouble'
        Value = 0
      end
      item
        Name = 'TASA_IVA'
        ValueType = 'prvvtDouble'
        Value = 0
      end
      item
        Name = 'RETEFUENTE'
        ValueType = 'prvvtDouble'
        Value = 0
      end
      item
        Name = 'RETEIVA'
        ValueType = 'prvvtDouble'
        Value = 0
      end
      item
        Name = 'TOTAL'
        ValueType = 'prvvtDouble'
        Value = 0
      end
      item
        Name = 'DOCUMENTO'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'RESOLUCION_DIAN'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'FECHA_RESOLUCION'
        ValueType = 'prvvtDateTime'
        Value = 44105d
      end
      item
        Name = 'PLINI'
        ValueType = 'prvvtInteger'
        Value = 0
      end
      item
        Name = 'PLFIN'
        ValueType = 'prvvtInteger'
        Value = 0
      end
      item
        Name = 'PREFIJO'
        ValueType = 'prvvtString'
        Value = ''
      end>
    PrinterName = 'HP LaserJet p1505'
    PreviewParams.Options = []
    PreviewParams.ShowToolbars = [prptPreviewCommon]
    Left = 608
    Top = 432
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
    LOGPIXELSX = 96
    LOGPIXELSY = 96
    object prPage1: TprPage
      Width = 2100
      Height = 2970
      PaperSize = 9
      Orientation = poPortrait
      lMargin = 10
      rMargin = 10
      tMargin = 10
      bMargin = 10
      object prHPageHeaderBand1: TprHPageHeaderBand
        Height = 182
        UseVerticalBands = False
        PrintOnFirstPage = True
        object prMemoObj1: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[EMPRESA]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 228
          dRec.Bottom = 24
          Visible = False
        end
        object prMemoObj2: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'DOCUMENTO SOPORTE EN ADQUISICIONES EFECTUADAS A NO OBLIGADOS A F' +
                  'ACTURAR')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 231
          dRec.Top = 1
          dRec.Right = 713
          dRec.Bottom = 24
          Visible = False
        end
        object prMemoObj3: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[NIT]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end>
          dRec.Left = 1
          dRec.Top = 23
          dRec.Right = 228
          dRec.Bottom = 37
          Visible = False
        end
        object prMemoObj4: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No. De Documento:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 499
          dRec.Top = 25
          dRec.Right = 621
          dRec.Bottom = 46
          Visible = False
        end
        object prMemoObj5: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[PREFIJO][:<0000>NUMERO]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 12
            end>
          dRec.Left = 624
          dRec.Top = 20
          dRec.Right = 714
          dRec.Bottom = 48
          Visible = False
        end
        object prMemoObj6: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Direcci'#243'n:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 1
          dRec.Top = 43
          dRec.Right = 64
          dRec.Bottom = 59
          Visible = False
        end
        object prMemoObj7: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[DIRECCION_EMPRESA]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 66
          dRec.Top = 43
          dRec.Right = 448
          dRec.Bottom = 59
          Visible = False
        end
        object prMemoObj8: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tel'#233'fono:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 1
          dRec.Top = 58
          dRec.Right = 64
          dRec.Bottom = 74
          Visible = False
        end
        object prMemoObj9: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[TELEFONO_EMPRESA]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 67
          dRec.Top = 58
          dRec.Right = 449
          dRec.Bottom = 74
          Visible = False
        end
        object prMemoObj10: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Fecha:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 339
          dRec.Top = 23
          dRec.Right = 388
          dRec.Bottom = 47
          Visible = False
        end
        object prMemoObj11: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[FECHA]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 390
          dRec.Top = 25
          dRec.Right = 483
          dRec.Bottom = 43
          Visible = False
        end
        object prMemoObj12: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FACTURAR A:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = 14215660
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 0
          dRec.Top = 102
          dRec.Right = 91
          dRec.Bottom = 122
          Visible = False
        end
        object prMemoObj13: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Nombre:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 1
          dRec.Top = 120
          dRec.Right = 68
          dRec.Bottom = 136
          Visible = False
        end
        object prMemoObj14: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Direcci'#243'n:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 1
          dRec.Top = 141
          dRec.Right = 68
          dRec.Bottom = 157
          Visible = False
        end
        object prMemoObj15: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Ciudad:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 1
          dRec.Top = 162
          dRec.Right = 68
          dRec.Bottom = 178
          Visible = False
        end
        object prMemoObj16: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tel'#233'fono:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 463
          dRec.Top = 162
          dRec.Right = 521
          dRec.Bottom = 178
          Visible = False
        end
        object prMemoObj17: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[NOMBRE]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 69
          dRec.Top = 120
          dRec.Right = 449
          dRec.Bottom = 136
          Visible = False
        end
        object prMemoObj18: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[DIRECCION]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 69
          dRec.Top = 139
          dRec.Right = 714
          dRec.Bottom = 155
          Visible = False
        end
        object prMemoObj19: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CIUDAD]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 69
          dRec.Top = 162
          dRec.Right = 449
          dRec.Bottom = 178
          Visible = False
        end
        object prMemoObj20: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[TELEFONO]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 522
          dRec.Top = 162
          dRec.Right = 713
          dRec.Bottom = 178
          Visible = False
        end
        object prMemoObj26: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'RESOLUCION DIAN')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 448
          dRec.Top = 48
          dRec.Right = 589
          dRec.Bottom = 69
          Visible = False
        end
        object prMemoObj27: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[RESOLUCION_DIAN]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 591
          dRec.Top = 48
          dRec.Right = 715
          dRec.Bottom = 69
          Visible = False
        end
        object prMemoObj28: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA RESOLUCION')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 447
          dRec.Top = 74
          dRec.Right = 589
          dRec.Bottom = 96
          Visible = False
        end
        object prMemoObj29: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[FECHA_RESOLUCION]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 591
          dRec.Top = 74
          dRec.Right = 715
          dRec.Bottom = 96
          Visible = False
        end
        object prMemoObj30: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[PREFIJO][:<0000>PLINI]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 582
          dRec.Top = 96
          dRec.Right = 633
          dRec.Bottom = 114
          Visible = False
        end
        object prMemoObj31: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[PREFIJO][:<0000>PLFIN]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 666
          dRec.Top = 96
          dRec.Right = 715
          dRec.Bottom = 114
          Visible = False
        end
        object prMemoObj32: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'AL')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 635
          dRec.Top = 96
          dRec.Right = 665
          dRec.Bottom = 114
          Visible = False
        end
        object prMemoObj37: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Doc:')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 465
          dRec.Top = 121
          dRec.Right = 499
          dRec.Bottom = 137
          Visible = False
        end
        object prMemoObj38: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[DOCUMENTO]')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 503
          dRec.Top = 121
          dRec.Right = 714
          dRec.Bottom = 137
          Visible = False
        end
      end
      object prHDetailBand1: TprHDetailBand
        Height = 16
        UseVerticalBands = False
        DataSetName = 'CDSdata'
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        Bands = (
          'prHDetailHeaderBand1')
        object prMemoObj23: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDSdata.DESCRIPCION]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 9
            end>
          dRec.Left = 137
          dRec.Top = 2
          dRec.Right = 528
          dRec.Bottom = 18
          Visible = False
        end
        object prMemoObj24: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>CDSdata.VALOR]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 9
            end>
          dRec.Left = 529
          dRec.Top = 2
          dRec.Right = 715
          dRec.Bottom = 18
          Visible = False
        end
        object prMemoObj34: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDSdata.CODIGO]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 9
            end>
          dRec.Left = 4
          dRec.Top = 2
          dRec.Right = 136
          dRec.Bottom = 18
          Visible = False
        end
      end
      object prHDetailHeaderBand1: TprHDetailHeaderBand
        Height = 18
        UseVerticalBands = False
        DetailBand = prReport1.prHDetailBand1
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        ReprintOnEachPage = False
        LinkToDetail = False
        object prMemoObj21: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DESCRIPCION')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = 14215660
              hAlign = prhCenter
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 9
            end>
          dRec.Left = 137
          dRec.Top = 1
          dRec.Right = 528
          dRec.Bottom = 18
          Visible = False
        end
        object prMemoObj22: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTAL')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = 14215660
              hAlign = prhCenter
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 9
            end>
          dRec.Left = 529
          dRec.Top = 1
          dRec.Right = 715
          dRec.Bottom = 18
          Visible = False
        end
        object prMemoObj33: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CODIGO')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = 14215660
              hAlign = prhCenter
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 9
            end>
          dRec.Left = 4
          dRec.Top = 1
          dRec.Right = 137
          dRec.Bottom = 18
          Visible = False
        end
      end
      object prHSummaryBand1: TprHSummaryBand
        Height = 204
        UseVerticalBands = False
        object prMemoObj48: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'COMENTARIOS')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = 14215660
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 3
          dRec.Top = 4
          dRec.Right = 343
          dRec.Bottom = 23
          Visible = False
        end
        object prMemoObj49: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SUBTOTAL')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 355
          dRec.Top = 4
          dRec.Right = 527
          dRec.Bottom = 25
          Visible = False
        end
        object prMemoObj50: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 528
          dRec.Top = 4
          dRec.Right = 543
          dRec.Bottom = 23
          Visible = False
        end
        object prMemoObj51: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>SUBTOTAL]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 543
          dRec.Top = 4
          dRec.Right = 715
          dRec.Bottom = 25
          Visible = False
        end
        object prMemoObj53: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No soy responsable del impuesto a las ventas')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 9
            end>
          dRec.Left = 45
          dRec.Top = 27
          dRec.Right = 341
          dRec.Bottom = 44
          Visible = False
        end
        object prMemoObj54: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '(X)')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end
            item
              Visible = True
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 7
          dRec.Top = 46
          dRec.Right = 41
          dRec.Bottom = 63
          Visible = False
        end
        object prMemoObj55: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Soy responsable del regime simplificado')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 9
            end>
          dRec.Left = 45
          dRec.Top = 46
          dRec.Right = 341
          dRec.Bottom = 63
          Visible = False
        end
        object prMemoObj56: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '(X)')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end
            item
              Visible = True
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 7
          dRec.Top = 66
          dRec.Right = 41
          dRec.Bottom = 83
          Visible = False
        end
        object prMemoObj57: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No estoy obligado a facturar')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 9
            end>
          dRec.Left = 45
          dRec.Top = 66
          dRec.Right = 341
          dRec.Bottom = 83
          Visible = False
        end
        object prMemoObj58: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tasa de Impuesto Retenci'#243'n')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 355
          dRec.Top = 22
          dRec.Right = 527
          dRec.Bottom = 43
          Visible = False
        end
        object prMemoObj59: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>TASA_RETEFUENTE]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 543
          dRec.Top = 22
          dRec.Right = 715
          dRec.Bottom = 43
          Visible = False
        end
        object prMemoObj60: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Retenci'#243'n')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 355
          dRec.Top = 42
          dRec.Right = 527
          dRec.Bottom = 63
          Visible = False
        end
        object prMemoObj61: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 528
          dRec.Top = 42
          dRec.Right = 543
          dRec.Bottom = 61
          Visible = False
        end
        object prMemoObj62: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>RETEFUENTE]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 543
          dRec.Top = 42
          dRec.Right = 715
          dRec.Bottom = 63
          Visible = False
        end
        object prMemoObj63: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tasa ReteIva')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 355
          dRec.Top = 62
          dRec.Right = 527
          dRec.Bottom = 83
          Visible = False
        end
        object prMemoObj64: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>TASA_IVA]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 543
          dRec.Top = 62
          dRec.Right = 715
          dRec.Bottom = 83
          Visible = False
        end
        object prMemoObj65: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Iva Asumido')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 355
          dRec.Top = 82
          dRec.Right = 527
          dRec.Bottom = 103
          Visible = False
        end
        object prMemoObj66: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 529
          dRec.Top = 82
          dRec.Right = 544
          dRec.Bottom = 101
          Visible = False
        end
        object prMemoObj67: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>RETEIVA]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 543
          dRec.Top = 82
          dRec.Right = 715
          dRec.Bottom = 103
          Visible = False
        end
        object prMemoObj68: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TOTAL')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 355
          dRec.Top = 102
          dRec.Right = 527
          dRec.Bottom = 123
          Visible = False
        end
        object prMemoObj69: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '$')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhCenter
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 528
          dRec.Top = 104
          dRec.Right = 543
          dRec.Bottom = 123
          Visible = False
        end
        object prMemoObj70: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0>TOTAL]')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 543
          dRec.Top = 102
          dRec.Right = 715
          dRec.Bottom = 123
          Visible = False
        end
        object prMemoObj25: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '(X)')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhRight
              vAlign = prvCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 8
            end
            item
              Visible = True
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 7
          dRec.Top = 27
          dRec.Right = 41
          dRec.Bottom = 44
          Visible = False
        end
        object prMemoObj35: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'firma')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 8
          dRec.Top = 155
          dRec.Right = 355
          dRec.Bottom = 177
          Visible = False
        end
        object prMemoObj36: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'C.C.')
              lBorder.Show = False
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = False
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = False
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = False
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 8
          dRec.Top = 181
          dRec.Right = 351
          dRec.Bottom = 200
          Visible = False
        end
        object prMemoObj39: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '%')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 528
          dRec.Top = 23
          dRec.Right = 543
          dRec.Bottom = 42
          Visible = False
        end
        object prMemoObj40: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '%')
              lBorder.Show = True
              lBorder.Style = psSolid
              lBorder.Color = clBlack
              lBorder.Width = 1
              rBorder.Show = True
              rBorder.Style = psSolid
              rBorder.Color = clBlack
              rBorder.Width = 1
              tBorder.Show = True
              tBorder.Style = psSolid
              tBorder.Color = clBlack
              tBorder.Width = 1
              bBorder.Show = True
              bBorder.Style = psSolid
              bBorder.Color = clBlack
              bBorder.Width = 1
              FillColor = clWhite
              hAlign = prhLeft
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 10
            end>
          dRec.Left = 528
          dRec.Top = 62
          dRec.Right = 543
          dRec.Bottom = 81
          Visible = False
        end
      end
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 499
    Top = 3
  end
  object IBQdocumento: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      '')
    Left = 648
    Top = 24
  end
  object IBQequivalente: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 704
    Top = 24
  end
  object DStiposidentificacion: TDataSource
    DataSet = IBQtipodocumento
    Left = 416
    Top = 8
  end
  object IBSQL1: TIBSQL
    Left = 531
    Top = 3
  end
  object IBQtipodocumento: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT * FROM "gen$tiposidentificacion"')
    Left = 448
    Top = 8
  end
  object IBQagencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT * FROM "gen$agencia" WHERE ID_AGENCIA = :ID_AGENCIA')
    Left = 676
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction2: TIBTransaction
    Left = 560
    Top = 1
  end
  object IBSQL2: TIBSQL
    Left = 768
    Top = 8
  end
  object IBTransaction3: TIBTransaction
    Left = 800
    Top = 8
  end
  object CDSdata: TClientDataSet
    Active = True
    Aggregates = <
      item
        Active = True
        AggregateName = 'SUBTOTAL'
        Expression = 'SUM(VALOR)'
        Visible = False
      end>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'ITEM'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = CDSdataAfterPost
    Left = 312
    Top = 216
    Data = {
      840000009619E0BD010000001800000004000000000003000000840004495445
      4D040001000000000006434F4449474F01004900000001000557494454480200
      020012000B4445534352495043494F4E02004900000001000557494454480200
      0200FF000556414C4F5208000400000001000753554254595045020049000600
      4D6F6E6579000000}
    object CDSdataITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object CDSdataCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 18
    end
    object CDSdataDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 255
    end
    object CDSdataVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
  end
  object IBQdian: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction2
    Left = 656
    Top = 104
  end
end
