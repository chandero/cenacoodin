object FrmDescaraAutomatica: TFrmDescaraAutomatica
  Left = 397
  Top = 174
  Width = 1036
  Height = 497
  Caption = 'Tarjeta D'#233'bito'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 4
    Top = 264
    Width = 59
    Height = 13
    Caption = 'Movimientos'
  end
  object Label4: TLabel
    Left = 4
    Top = 288
    Width = 44
    Height = 13
    Caption = 'Bloqueos'
  end
  object Label5: TLabel
    Left = 4
    Top = 313
    Width = 38
    Height = 13
    Caption = 'Tarjetas'
  end
  object Label6: TLabel
    Left = 4
    Top = 338
    Width = 56
    Height = 13
    Caption = 'Estadisticas'
  end
  object Label1: TLabel
    Left = 752
    Top = 232
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object lvHeaders: TListView
    Left = 0
    Top = 0
    Width = 646
    Height = 105
    Columns = <
      item
        Caption = 'Csc'
      end
      item
        Caption = 'Asunto'
        Width = 200
      end
      item
        Caption = 'De'
        Width = 150
      end
      item
        Caption = 'Fecha'
        Width = 80
      end
      item
        Caption = 'Byte(s)'
        Width = 60
      end
      item
        Caption = 'UIDL'
        Width = 150
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = lvHeadersDblClick
  end
  object lvMessageParts: TListView
    Left = 0
    Top = 102
    Width = 497
    Height = 63
    Columns = <
      item
        Caption = 'Fille Name'
        Width = 150
      end
      item
        Caption = 'Content Type'
        Width = 150
      end>
    MultiSelect = True
    ReadOnly = True
    TabOrder = 1
    ViewStyle = vsList
  end
  object btDescargArchivo: TButton
    Left = 320
    Top = 264
    Width = 137
    Height = 25
    Caption = 'DescargaArchivo'
    TabOrder = 2
    OnClick = btDescargArchivoClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 168
    Width = 649
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object EdMov: TEdit
    Left = 72
    Top = 260
    Width = 247
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object EdBlq: TEdit
    Left = 72
    Top = 284
    Width = 247
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object EdTar: TEdit
    Left = 72
    Top = 309
    Width = 247
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object EdEst: TEdit
    Left = 72
    Top = 334
    Width = 247
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object Memotxt: TMemo
    Left = 704
    Top = 64
    Width = 185
    Height = 41
    Lines.Strings = (
      'Memotxt')
    TabOrder = 8
  end
  object Button1: TButton
    Left = 344
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Descarga Manual'
    TabOrder = 9
  end
  object Msg: TIdMessage
    BccList = <>
    CharSet = 'ISO8859_1'
    CCList = <>
    Recipients = <>
    ReplyTo = <>
    Left = 108
    Top = 234
  end
  object POP: TIdPOP3
    ASCIIFilter = True
    Host = '192.168.200.2'
    Password = 'tdebitocreo6'
    UserId = 'tdebito@crediservir.com'
    Left = 64
    Top = 228
  end
  object IdTCPClient1: TIdTCPClient
    Port = 0
    Left = 24
    Top = 224
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Archivo Encriptado (*.pgp)|*.pgp'
    Left = 212
    Top = 42
  end
  object UnZip: TAbUnZipper
    ExtractOptions = [eoCreateDirs, eoRestorePath]
    OnArchiveItemProgress = UnZipArchiveItemProgress
    Left = 244
    Top = 58
  end
  object CdSentencia: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'SENTENCIA'
        DataType = ftString
        Size = 400
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 88
    Top = 184
    Data = {
      640000009619E0BD01000000180000000300000000000300000064000A49445F
      4147454E43494104000100000000000953454E54454E43494102004900000001
      00055749445448020002009001045449504F0100490000000100055749445448
      0200020006000000}
    object CdSentenciaID_AGENCIA: TIntegerField
      FieldName = 'ID_AGENCIA'
    end
    object CdSentenciaSENTENCIA: TStringField
      FieldName = 'SENTENCIA'
      Size = 400
    end
    object CdSentenciaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 6
    end
  end
  object IdTCPClient2: TIdTCPClient
    Port = 0
    Left = 72
    Top = 40
  end
end
