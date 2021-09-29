object FrmSolicitudRemota: TFrmSolicitudRemota
  Left = 178
  Top = 181
  Width = 599
  Height = 469
  Caption = 'Consulta de Solicitudes Remotas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 233
      Top = 14
      Width = 152
      Height = 13
      Caption = 'Fecha y Hora de Consulta:'
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 105
      Height = 25
      BiDiMode = bdLeftToRight
      Caption = '&Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
    end
    object jvFecha: TJvStaticText
      Left = 386
      Top = 10
      Width = 187
      Height = 23
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
    object BitBtn2: TBitBtn
      Left = 119
      Top = 8
      Width = 105
      Height = 25
      Caption = '&Reporte'
      TabOrder = 2
      OnClick = BitBtn2Click
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 589
    Height = 392
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 586
      Height = 385
      DataSource = DataSource1
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_SOLICITUD'
          Title.Caption = 'Solicitud'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_EMPLEADO'
          Title.Caption = 'Empleado'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'Estado'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ANALISTA'
          Title.Caption = 'Fecha y Hora'
          Width = 133
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ASOCIADO'
          Title.Caption = 'Asociado'
          Width = 161
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLEADO'
          Visible = True
        end>
    end
  end
  object cDsol: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_SOLICITUD'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ID_EMPLEADO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FECHA_ANALISTA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ASOCIADO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'EMPLEADO'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID_EMPLEADO'
    Params = <>
    StoreDefs = True
    Left = 496
    Top = 48
    Data = {
      D30000009619E0BD010000001800000006000000000003000000D3000C49445F
      534F4C4943495455440100490000000100055749445448020002000F000B4944
      5F454D504C4541444F0100490000000100055749445448020002000F00064553
      5441444F01004900000001000557494454480200020014000E46454348415F41
      4E414C495354410100490000000100055749445448020002001E000841534F43
      4941444F010049000000010005574944544802000200C80008454D504C454144
      4F010049000000010005574944544802000200C8000000}
    object cDsolID_SOLICITUD: TStringField
      FieldName = 'ID_SOLICITUD'
      Size = 15
    end
    object cDsolID_EMPLEADO: TStringField
      FieldName = 'ID_EMPLEADO'
      Size = 15
    end
    object cDsolESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object cDsolFECHA_ANALISTA: TStringField
      FieldName = 'FECHA_ANALISTA'
      Size = 30
    end
    object cDsolASOCIADO: TStringField
      FieldName = 'ASOCIADO'
      Size = 200
    end
    object cDsolEMPLEADO: TStringField
      FieldName = 'EMPLEADO'
      Size = 200
    end
  end
  object DataSource1: TDataSource
    DataSet = cDsol
    Left = 528
    Top = 56
  end
  object IdTCPClient1: TIdTCPClient
    OnWorkEnd = IdTCPClient1WorkEnd
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 224
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      
        '  "gen$persona".NOMBRE || '#39' '#39' ||  "gen$persona".PRIMER_APELLIDO ' +
        '|| '#39' '#39' ||  "gen$persona".SEGUNDO_APELLIDO as ASOCIADO,'
      '  "col$estadosolicitud".DESCRIPCION_ESTADO,'
      '  "col$solicitud".ESTADO'
      'FROM'
      ' "col$solicitud"'
      
        ' INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA="gen$pe' +
        'rsona".ID_PERSONA)'
      
        '  AND ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTI' +
        'FICACION)'
      
        ' INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="co' +
        'l$estadosolicitud".ID_ESTADO)'
      'WHERE'
      '  ("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)')
    Left = 32
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 192
    Top = 136
    object Buscar1: TMenuItem
      Caption = 'Buscar'
      OnClick = Buscar1Click
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
      OnClick = Cancelar1Click
    end
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 280
    Top = 176
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = cDsol
    Left = 88
    Top = 120
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      
        '  "gen$empleado".NOMBRE || '#39' '#39' || "gen$empleado".SEGUNDO_APELLID' +
        'O || '#39' '#39' || "gen$empleado".PRIMER_APELLIDO AS EMPLEADO'
      'FROM'
      ' "gen$empleado"'
      'WHERE'
      '  ("gen$empleado".ID_EMPLEADO = :ID_EMPLEADO)')
    Left = 128
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_EMPLEADO'
        ParamType = ptUnknown
      end>
  end
end
