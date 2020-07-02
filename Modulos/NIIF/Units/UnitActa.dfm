object FrmActa: TFrmActa
  Left = 217
  Top = 203
  Width = 597
  Height = 265
  BorderIcons = [biSystemMenu]
  Caption = 'Imprimir Acta del Ente Aprobador'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 60
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 42
      Height = 13
      Caption = 'No. Acta'
    end
    object Label2: TLabel
      Left = 162
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Lugar'
    end
    object Label3: TLabel
      Left = 479
      Top = 10
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label4: TLabel
      Left = 93
      Top = 34
      Width = 50
      Height = 13
      Caption = 'Presidente'
    end
    object Label5: TLabel
      Left = 402
      Top = 34
      Width = 28
      Height = 13
      Caption = 'Cargo'
    end
    object Label6: TLabel
      Left = 5
      Top = 34
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object EDacta: TEdit
      Left = 58
      Top = 5
      Width = 100
      Height = 21
      TabOrder = 0
      OnExit = EDactaExit
      OnKeyPress = EDactaKeyPress
    end
    object EDlugar: TEdit
      Left = 193
      Top = 6
      Width = 281
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnKeyPress = EDlugarKeyPress
    end
    object Edfecha: TEdit
      Left = 513
      Top = 6
      Width = 66
      Height = 21
      TabOrder = 2
      OnKeyPress = EdfechaKeyPress
    end
    object EDpresidente: TEdit
      Left = 146
      Top = 32
      Width = 254
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnKeyPress = EDpresidenteKeyPress
    end
    object EDcargo: TEdit
      Left = 435
      Top = 32
      Width = 146
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
      OnExit = EDcargoExit
      OnKeyPress = EDcargoKeyPress
    end
    object EDhora: TMaskEdit
      Left = 31
      Top = 31
      Width = 56
      Height = 21
      EditMask = '!90:00> LL;1;_'
      MaxLength = 8
      TabOrder = 3
      Text = '  :     '
      OnKeyPress = EDhoraKeyPress
    end
  end
  object Panel3: TPanel
    Left = 495
    Top = 62
    Width = 94
    Height = 129
    Color = clOlive
    TabOrder = 1
    object Btelimina: TBitBtn
      Left = 6
      Top = 52
      Width = 83
      Height = 25
      Caption = 'A&nexos'
      TabOrder = 0
      OnClick = BteliminaClick
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
    object Btagrega: TBitBtn
      Left = 6
      Top = 2
      Width = 83
      Height = 25
      Caption = '&Agregar'
      TabOrder = 1
      OnClick = BtagregaClick
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
    object Btmodificar: TBitBtn
      Left = 6
      Top = 27
      Width = 83
      Height = 25
      Caption = '&Modificar'
      TabOrder = 2
      OnClick = BtmodificarClick
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
    object BitBtn1: TBitBtn
      Left = 6
      Top = 77
      Width = 83
      Height = 25
      Caption = '&Ver'
      TabOrder = 3
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
    object BTborra: TBitBtn
      Left = 6
      Top = 102
      Width = 83
      Height = 25
      Caption = '&Eliminar'
      TabOrder = 4
      OnClick = BTborraClick
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
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 59
    Width = 497
    Height = 132
    Caption = 'Orden del Dia'
    TabOrder = 2
    object DBente: TDBGrid
      Left = 4
      Top = 13
      Width = 486
      Height = 113
      DataSource = DSorden
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'numero'
          Title.Caption = 'No'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'titulo'
          Title.Caption = 'Titulo'
          Width = 407
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descripcion'
          Title.Caption = 'Descripci'#243'n'
          Visible = False
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 190
    Width = 589
    Height = 41
    TabOrder = 3
    object Btreporte: TBitBtn
      Left = 418
      Top = 8
      Width = 132
      Height = 25
      Caption = '&Imprimir Reporte'
      TabOrder = 0
      OnClick = BtreporteClick
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
    object BTregistra: TBitBtn
      Left = 48
      Top = 8
      Width = 132
      Height = 25
      Caption = '&Registrar'
      TabOrder = 1
      OnClick = BTregistraClick
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
    object Btparcial: TBitBtn
      Left = 240
      Top = 9
      Width = 121
      Height = 25
      Caption = 'Re&gistro Parcial'
      TabOrder = 2
      OnClick = BtparcialClick
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
  object CDorden: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'numero'
        DataType = ftInteger
      end
      item
        Name = 'titulo'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'descripcion'
        DataType = ftBlob
        Size = 1
      end
      item
        Name = 'tipo'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'numero'
    Params = <>
    StoreDefs = True
    Left = 344
    Top = 120
    Data = {
      860000009619E0BD0100000018000000040000000000030000008600066E756D
      65726F040001000000000006746974756C6F0200490000000100055749445448
      02000200FF000B6465736372697063696F6E04004B0000000200075355425459
      504502004900070042696E61727900055749445448020002000100047469706F
      02000300000000000000}
    object CDordennumero: TIntegerField
      FieldName = 'numero'
    end
    object CDordentitulo: TStringField
      FieldName = 'titulo'
      Size = 255
    end
    object CDordendescripcion: TBlobField
      FieldName = 'descripcion'
      Size = 1
    end
    object CDordentipo: TBooleanField
      FieldName = 'tipo'
    end
  end
  object DSorden: TDataSource
    DataSet = CDorden
    Left = 80
    Top = 88
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 16
    Top = 88
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDparticipantes
    Left = 152
    Top = 88
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = CDinvitados
    Left = 184
    Top = 88
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = CDsolicitud
    Left = 216
    Top = 88
  end
  object CDorden1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 120
    Data = {
      790000009619E0BD0100000018000000030000000000030000007900066E756D
      65726F040001000000000006746974756C6F0200490000000100055749445448
      02000200FF000B6465736372697063696F6E04004B0000000200075355425459
      504502004900070042696E617279000557494454480200020001000000}
    object CDorden1numero: TIntegerField
      FieldName = 'numero'
    end
    object CDorden1titulo: TStringField
      FieldName = 'titulo'
      Size = 255
    end
    object CDorden1descripcion: TBlobField
      FieldName = 'descripcion'
      Size = 1
    end
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 40
  end
  object CDorden2: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 120
    Data = {
      790000009619E0BD0100000018000000030000000000030000007900066E756D
      65726F040001000000000006746974756C6F0200490000000100055749445448
      02000200FF000B6465736372697063696F6E04004B0000000200075355425459
      504502004900070042696E617279000557494454480200020001000000}
    object CDorden2numero: TIntegerField
      FieldName = 'numero'
    end
    object CDorden2titulo: TStringField
      FieldName = 'titulo'
      Size = 255
    end
    object CDorden2descripcion: TBlobField
      FieldName = 'descripcion'
      Size = 1
    end
  end
  object NLetra1: TNLetra
    Numero = 0
    Letras = 'Cero'
    Left = 112
    Top = 88
  end
  object CDsolicitud: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cuenta'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'nombres'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'garantia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'plazo'
        DataType = ftInteger
      end
      item
        Name = 'decision'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'estado'
        DataType = ftInteger
      end
      item
        Name = 'id_garantia'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 120
    Data = {
      DE0000009619E0BD010000001800000008000000000003000000DE0006637565
      6E74610100490000000100055749445448020002000F00076E6F6D6272657302
      0049000000010005574944544802000200FF000576616C6F7208000400000001
      0007535542545950450200490006004D6F6E65790008676172616E7469610100
      49000000010005574944544802000200320005706C617A6F0400010000000000
      086465636973696F6E0100490000000100055749445448020002001400066573
      7461646F04000100000000000B69645F676172616E7469610400010000000000
      0000}
    object CDsolicitudcuenta: TStringField
      DisplayWidth = 9
      FieldName = 'cuenta'
      Size = 15
    end
    object CDsolicitudnombres: TStringField
      DisplayWidth = 306
      FieldName = 'nombres'
      Size = 255
    end
    object CDsolicitudvalor: TCurrencyField
      DisplayWidth = 12
      FieldName = 'valor'
    end
    object CDsolicitudgarantia: TStringField
      DisplayWidth = 60
      FieldName = 'garantia'
      Size = 50
    end
    object CDsolicitudplazo: TIntegerField
      DisplayWidth = 12
      FieldName = 'plazo'
    end
    object CDsolicituddecision: TStringField
      DisplayWidth = 24
      FieldName = 'decision'
    end
    object CDsolicitudestado: TIntegerField
      FieldName = 'estado'
    end
    object CDsolicitudid_garantia: TIntegerField
      FieldName = 'id_garantia'
    end
  end
  object CDestado: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'descripcion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'total'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 144
    Top = 40
    Data = {
      480000009619E0BD01000000180000000200000000000300000048000B646573
      6372697063696F6E010049000000010005574944544802000200140005746F74
      616C04000100000000000000}
    object CDestadodescripcion: TStringField
      FieldName = 'descripcion'
    end
    object CDestadototal: TIntegerField
      FieldName = 'total'
    end
  end
  object frDBDataSet4: TfrDBDataSet
    DataSet = CDorden1
    Left = 264
    Top = 88
  end
  object frDBDataSet5: TfrDBDataSet
    DataSet = CDorden2
    Left = 304
    Top = 88
  end
  object frDBDataSet6: TfrDBDataSet
    DataSet = CDorden
    Left = 344
    Top = 88
  end
  object CDanexo: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 120
    Data = {
      490000009619E0BD010000001800000001000000000003000000490005616E65
      786F04004B0000000200075355425459504502004900070042696E6172790005
      57494454480200020001000000}
    object CDanexoanexo: TBlobField
      FieldName = 'anexo'
      Size = 1
    end
  end
  object frDBDataSet7: TfrDBDataSet
    DataSet = CDanexo
    Left = 376
    Top = 88
  end
  object frDBDataSet8: TfrDBDataSet
    DataSet = CDparticipantes
    Left = 416
    Top = 88
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 8
    Top = 168
  end
  object CDparticipantes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 104
    Data = {
      4F0000009619E0BD0100000018000000020000000000030000004F00066E6F6D
      627265010049000000010005574944544802000200640005636172676F010049
      00000001000557494454480200020064000000}
    object CDparticipantesnombre: TStringField
      FieldName = 'nombre'
      Size = 100
    end
    object CDparticipantescargo: TStringField
      FieldName = 'cargo'
      Size = 100
    end
  end
  object CDinvitados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 104
    Data = {
      4F0000009619E0BD0100000018000000020000000000030000004F00066E6F6D
      627265020049000000010005574944544802000200FF0005636172676F010049
      00000001000557494454480200020032000000}
    object CDinvitadosnombre: TStringField
      FieldName = 'nombre'
      Size = 255
    end
    object CDinvitadoscargo: TStringField
      FieldName = 'cargo'
      Size = 50
    end
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 40
    Top = 168
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 96
    Top = 152
  end
end
