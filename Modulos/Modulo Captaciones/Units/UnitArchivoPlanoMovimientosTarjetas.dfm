object frmArchivoPlanoMovimeintosTarjetas: TfrmArchivoPlanoMovimeintosTarjetas
  Left = 479
  Top = 321
  Width = 426
  Height = 112
  Caption = 'Archivo Plano Movimientos Tarjetas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 417
    Height = 49
    Caption = 'Periodo'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object Label2: TLabel
      Left = 160
      Top = 19
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 64
      Top = 16
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 43745.40179875
      Time = 43745.40179875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 208
      Top = 16
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 43745.40179875
      Time = 43745.40179875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object btnProcesar: TBitBtn
      Left = 320
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Procesar'
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 51
    Width = 418
    Height = 27
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object btnCerrar: TBitBtn
      Left = 322
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
    end
  end
  object IBQmovs: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT * FROM RECIBIR r'
      'WHERE r.FECHA BETWEEN :FECHA_INICIAL AND :FECHA_FINAL')
    Left = 56
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FINAL'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 96
    Top = 40
  end
end
