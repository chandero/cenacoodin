object FrmInformacionSolAgencia: TFrmInformacionSolAgencia
  Left = 267
  Top = 203
  Width = 1088
  Height = 497
  Caption = 'Informaci'#243'n Adicional Solicitud de Cr'#233'ditos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 2
    Top = 0
    Width = 463
    Height = 105
    Caption = 'Codeudores'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 6
      Top = 14
      Width = 451
      Height = 86
      DataSource = dsCodeudor
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'IDIDENTIFICACION'
          Title.Caption = 'Id'
          Width = 21
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDPERSONA'
          Title.Caption = 'N'#250'mero'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRES'
          Title.Caption = 'Codeudor'
          Width = 305
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 102
    Width = 462
    Height = 105
    Caption = 'Garantia Real'
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 5
      Top = 15
      Width = 452
      Height = 84
      DataSource = dsGarantia
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'IDIDENTIFICACION'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDPERSONA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'MATRICULA'
          Title.Caption = 'Matricula'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 336
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 4
    Top = 207
    Width = 461
    Height = 41
    TabOrder = 2
    object Button1: TButton
      Left = 182
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object cdCodeudor: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDIDENTIFICACION'
        DataType = ftInteger
      end
      item
        Name = 'IDPERSONA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOMBRES'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'IDSOLICITUD'
        DataType = ftString
        Size = 12
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 536
    Top = 40
    Data = {
      8D0000009619E0BD0100000018000000040000000000030000008D0010494449
      44454E54494649434143494F4E0400010000000000094944504552534F4E4101
      00490000000100055749445448020002000F00074E4F4D425245530100490000
      00010005574944544802000200FA000B4944534F4C4943495455440100490000
      000100055749445448020002000C000000}
    object cdCodeudorIDIDENTIFICACION: TIntegerField
      DisplayWidth = 7
      FieldName = 'IDIDENTIFICACION'
    end
    object cdCodeudorIDPERSONA: TStringField
      DisplayWidth = 18
      FieldName = 'IDPERSONA'
      Size = 15
    end
    object cdCodeudorNOMBRES: TStringField
      DisplayWidth = 300
      FieldName = 'NOMBRES'
      Size = 250
    end
    object cdCodeudorIDSOLICITUD: TStringField
      FieldName = 'IDSOLICITUD'
      Size = 12
    end
  end
  object dsCodeudor: TDataSource
    DataSet = cdCodeudor
    Left = 592
    Top = 48
  end
  object cdGarantia: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDIDENTIFICACION'
        DataType = ftInteger
      end
      item
        Name = 'IDPERSONA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'IDSOLICITUD'
        DataType = ftString
        Size = 12
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 536
    Top = 96
    Data = {
      AF0000009619E0BD010000001800000005000000000003000000AF0010494449
      44454E54494649434143494F4E0400010000000000094944504552534F4E4101
      00490000000100055749445448020002000F00094D4154524943554C41010049
      00000001000557494454480200020014000B4445534352495043494F4E020049
      000000010005574944544802000200FF000B4944534F4C494349545544010049
      0000000100055749445448020002000C000000}
    object cdGarantiaIDIDENTIFICACION: TIntegerField
      FieldName = 'IDIDENTIFICACION'
    end
    object cdGarantiaIDPERSONA: TStringField
      FieldName = 'IDPERSONA'
      Size = 15
    end
    object cdGarantiaMATRICULA: TStringField
      FieldName = 'MATRICULA'
    end
    object cdGarantiaDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 255
    end
    object cdGarantiaIDSOLICITUD: TStringField
      FieldName = 'IDSOLICITUD'
      Size = 12
    end
  end
  object dsGarantia: TDataSource
    DataSet = cdGarantia
    Left = 584
    Top = 96
  end
end
