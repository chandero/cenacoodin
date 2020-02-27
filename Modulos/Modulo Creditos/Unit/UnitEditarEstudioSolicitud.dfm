object frmEditarEstudioSolicitud: TfrmEditarEstudioSolicitud
  Left = 307
  Top = 244
  Width = 721
  Height = 395
  Caption = 'Editar Entrevista Solicitud de Cr'#233'dito'
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
    Left = 8
    Top = 11
    Width = 43
    Height = 13
    Caption = 'Solicitud:'
  end
  object Label2: TLabel
    Left = 288
    Top = 11
    Width = 44
    Height = 13
    Caption = 'Asociado'
  end
  object btnBuscar: TBitBtn
    Left = 200
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 0
    OnClick = btnBuscarClick
  end
  object DBObservacion: TDBGrid
    Left = 8
    Top = 48
    Width = 641
    Height = 137
    DataSource = DSobservacion
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_OBSERVACION'
        ReadOnly = True
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Width = 502
        Visible = True
      end>
  end
  object edSolicitud: TMaskEdit
    Left = 56
    Top = 7
    Width = 137
    Height = 21
    EditMask = '9999999999;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '          '
  end
  object edMemo: TDBMemo
    Left = 8
    Top = 192
    Width = 641
    Height = 121
    DataField = 'OBSERVACION'
    DataSource = DSobservacion
    ReadOnly = True
    TabOrder = 3
    WantReturns = False
  end
  object btnActualizar: TButton
    Left = 88
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Actualizar'
    Enabled = False
    TabOrder = 4
    OnClick = btnActualizarClick
  end
  object btnCerrar: TButton
    Left = 576
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 5
    OnClick = btnCerrarClick
  end
  object edAsociado: TEdit
    Left = 336
    Top = 8
    Width = 313
    Height = 21
    TabOrder = 6
  end
  object btnEditar: TBitBtn
    Left = 8
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 7
    OnClick = btnEditarClick
  end
  object IBTransaction1: TIBTransaction
    Left = 336
    Top = 8
  end
  object IBQobservacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 368
    Top = 8
    object IBQobservacionID_SOLICITUD: TStringField
      FieldName = 'ID_SOLICITUD'
      Size = 10
    end
    object IBQobservacionID_OBSERVACION: TIntegerField
      FieldName = 'ID_OBSERVACION'
    end
    object IBQobservacionOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      OnGetText = IBQobservacionOBSERVACIONGetText
      BlobType = ftMemo
      Size = 500
    end
  end
  object DSobservacion: TDataSource
    DataSet = CDSobservacion
    Left = 336
    Top = 40
  end
  object IBQpersona: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 400
    Top = 8
  end
  object CDSobservacion: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 8
    Data = {
      850000009619E0BD01000000180000000300000000000300000085000C49445F
      534F4C4943495455440100490000000100055749445448020002000A000E4944
      5F4F42534552564143494F4E04000100000000000B4F42534552564143494F4E
      04004B0000000200075355425459504502004900050054657874000557494454
      4802000200F4010000}
    object CDSobservacionID_SOLICITUD: TStringField
      FieldName = 'ID_SOLICITUD'
      Size = 10
    end
    object CDSobservacionID_OBSERVACION: TIntegerField
      FieldName = 'ID_OBSERVACION'
    end
    object CDSobservacionOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      OnGetText = CDSobservacionOBSERVACIONGetText
      BlobType = ftMemo
      Size = 500
    end
  end
  object IBTransaction2: TIBTransaction
    Left = 480
    Top = 8
  end
  object IBQactualizar: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 520
    Top = 8
  end
end
