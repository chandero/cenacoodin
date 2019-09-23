object frmPlantilla: TfrmPlantilla
  Left = 258
  Top = 205
  BorderStyle = bsDialog
  Caption = 'Relaci'#243'n de Plantillas'
  ClientHeight = 389
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 8
    Width = 101
    Height = 13
    Caption = 'Maestro Plantillas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 168
    Width = 96
    Height = 13
    Caption = 'Detalle Plantillas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 232
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Buscar'
  end
  object grMaestro: TDBGrid
    Left = 8
    Top = 32
    Width = 561
    Height = 89
    DataSource = dsMaestro
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PLAN_ID'
        Title.Caption = 'CODIGO'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLAN_DESCRIPCION'
        Title.Caption = 'DESCRIPCION'
        Width = 470
        Visible = True
      end>
  end
  object grDetalle: TDBGrid
    Left = 8
    Top = 184
    Width = 561
    Height = 171
    DataSource = dsDetalle
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PLDE_CODIGO'
        Title.Caption = 'CODIGO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLDE_DEBITO'
        Title.Caption = 'DEBITO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLDE_CREDITO'
        Title.Caption = 'CREDITO'
        Width = 80
        Visible = True
      end>
  end
  object EditPlantilla: TEdit
    Left = 272
    Top = 3
    Width = 297
    Height = 21
    TabOrder = 2
    OnChange = EditPlantillaChange
  end
  object dbnav2: TDBNavigator
    Left = 8
    Top = 360
    Width = 225
    Height = 25
    DataSource = dsDetalle
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    Flat = True
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 3
  end
  object dbnav1: TDBNavigator
    Left = 8
    Top = 128
    Width = 225
    Height = 25
    DataSource = dsMaestro
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    Flat = True
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 572
    Top = 0
    Width = 85
    Height = 389
    Align = alRight
    Alignment = taRightJustify
    Color = clSkyBlue
    TabOrder = 5
    object BitBtn1: TBitBtn
      Left = 8
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 8
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object BitBtn3: TBitBtn
    Left = 248
    Top = 128
    Width = 113
    Height = 25
    Cancel = True
    Caption = 'Eliminar Plantilla'
    TabOrder = 6
    OnClick = BitBtn3Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object dsMaestro: TDataSource
    DataSet = IBQmaestro
    Left = 200
    Top = 152
  end
  object dsDetalle: TDataSource
    DataSet = IBQDetalle
    Left = 296
    Top = 312
  end
  object IBQDetalle: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    DataSource = dsMaestro
    SQL.Strings = (
      
        'select PLDE_CODIGO, NOMBRE, PLDE_CREDITO, PLDE_DEBITO, PLDE_TIPO' +
        'ID, PLDE_IDPERSONA, PLDE_DESCRIPCION, PLDE_MONTO, PLDE_TASA from' +
        ' CON$PLANTILLADETALLE'
      
        'INNER JOIN CON$PUC ON (CON$PUC.CODIGO = CON$PLANTILLADETALLE.PLD' +
        'E_CODIGO)'
      ' where PLAN_ID = :PLAN_ID'
      ' order by PLDE_ORDEN')
    Left = 328
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLAN_ID'
        ParamType = ptInput
      end>
  end
  object IBQmaestro: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from CON$PLANTILLA')
    Left = 232
    Top = 152
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 264
    Top = 152
  end
end
