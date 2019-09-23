object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 167
  Height = 384
  TabOrder = 0
  OnEnter = FrameEnter
  object ExtraPanel: TPanel
    Left = 16
    Top = 145
    Width = 139
    Height = 36
    TabOrder = 0
    object Button_Percent: TButton
      Tag = 37
      Left = 5
      Top = 5
      Width = 30
      Height = 25
      Caption = '%'
      TabOrder = 0
    end
    object Button_C: TButton
      Tag = 12
      Left = 72
      Top = 5
      Width = 30
      Height = 25
      Caption = 'C'
      TabOrder = 1
    end
    object Button_Opt: TButton
      Tag = 9
      Left = 105
      Top = 5
      Width = 30
      Height = 25
      Caption = 'Opt'
      TabOrder = 2
    end
    object Button_Print: TBitBtn
      Tag = 7
      Left = 40
      Top = 5
      Width = 30
      Height = 25
      TabOrder = 3
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object MemoryPanel: TPanel
    Left = 16
    Top = 183
    Width = 138
    Height = 36
    TabOrder = 1
    object Button_MC: TButton
      Tag = 2
      Left = 5
      Top = 5
      Width = 30
      Height = 25
      Caption = 'MC'
      TabOrder = 0
    end
    object Button_MR: TButton
      Tag = 3
      Left = 38
      Top = 5
      Width = 30
      Height = 25
      Caption = 'MR'
      DragCursor = crDefault
      TabOrder = 1
    end
    object Button_MPlus: TButton
      Tag = 4
      Left = 72
      Top = 5
      Width = 30
      Height = 25
      Caption = 'M +'
      TabOrder = 2
    end
    object Button_MMinus: TButton
      Tag = 5
      Left = 105
      Top = 5
      Width = 30
      Height = 25
      Caption = 'M -'
      TabOrder = 3
    end
  end
  object OperatorPanel: TPanel
    Left = 114
    Top = 219
    Width = 40
    Height = 126
    TabOrder = 2
    object Button_Div: TButton
      Tag = 47
      Left = 8
      Top = 5
      Width = 25
      Height = 25
      Caption = '/'
      TabOrder = 0
    end
    object Button_Times: TButton
      Tag = 42
      Left = 8
      Top = 35
      Width = 25
      Height = 25
      Caption = '*'
      TabOrder = 1
    end
    object Button_Minus: TButton
      Tag = 45
      Left = 8
      Top = 65
      Width = 25
      Height = 25
      Caption = '-'
      TabOrder = 2
    end
    object Button_Plus: TButton
      Tag = 43
      Left = 8
      Top = 95
      Width = 25
      Height = 25
      Caption = '+'
      TabOrder = 3
    end
  end
  object NumericPanel: TPanel
    Left = 16
    Top = 219
    Width = 98
    Height = 126
    TabOrder = 3
    object Button_7: TButton
      Tag = 55
      Left = 5
      Top = 5
      Width = 25
      Height = 25
      Caption = '7'
      TabOrder = 0
    end
    object Button_8: TButton
      Tag = 56
      Left = 36
      Top = 5
      Width = 25
      Height = 25
      Caption = '8'
      TabOrder = 1
    end
    object Button_9: TButton
      Tag = 57
      Left = 67
      Top = 5
      Width = 25
      Height = 25
      Caption = '9'
      TabOrder = 2
    end
    object Button_4: TButton
      Tag = 52
      Left = 5
      Top = 35
      Width = 25
      Height = 25
      Caption = '4'
      TabOrder = 3
    end
    object Button_5: TButton
      Tag = 53
      Left = 36
      Top = 35
      Width = 25
      Height = 25
      Caption = '5'
      TabOrder = 4
    end
    object Button_6: TButton
      Tag = 54
      Left = 67
      Top = 35
      Width = 25
      Height = 25
      Caption = '6'
      TabOrder = 5
    end
    object Button_1: TButton
      Tag = 49
      Left = 5
      Top = 65
      Width = 25
      Height = 25
      Caption = '1'
      TabOrder = 6
    end
    object Button_2: TButton
      Tag = 50
      Left = 36
      Top = 65
      Width = 25
      Height = 25
      Caption = '2'
      TabOrder = 7
    end
    object Button_3: TButton
      Tag = 51
      Left = 67
      Top = 65
      Width = 25
      Height = 25
      Caption = '3'
      TabOrder = 8
    end
    object Button_0: TButton
      Tag = 48
      Left = 5
      Top = 95
      Width = 25
      Height = 25
      Caption = '0'
      TabOrder = 9
    end
    object Button_Dec: TButton
      Tag = 46
      Left = 36
      Top = 95
      Width = 25
      Height = 25
      Caption = '.'
      TabOrder = 10
    end
    object Button_Total: TButton
      Tag = 61
      Left = 67
      Top = 95
      Width = 25
      Height = 25
      Caption = '='
      TabOrder = 11
    end
  end
  object ClosePanel: TPanel
    Left = 16
    Top = 346
    Width = 138
    Height = 36
    TabOrder = 4
    object Button_Quit: TButton
      Tag = 27
      Left = 5
      Top = 5
      Width = 63
      Height = 25
      Caption = 'Salir'
      TabOrder = 0
    end
    object Button_Use: TButton
      Tag = 1
      Left = 71
      Top = 5
      Width = 63
      Height = 25
      Caption = 'Usar'
      TabOrder = 1
    end
  end
  object ScreenTicket: TMemo
    Left = 10
    Top = 3
    Width = 153
    Height = 107
    Alignment = taRightJustify
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 5
    WordWrap = False
  end
  object DisplayPanel: TPanel
    Left = 9
    Top = 110
    Width = 153
    Height = 35
    TabOrder = 6
    object Display: TPanel
      Left = 4
      Top = 2
      Width = 145
      Height = 28
      Alignment = taRightJustify
      BevelOuter = bvLowered
      BevelWidth = 2
      Color = clWhite
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 111
      Top = 10
      Width = 21
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object UpDown1: TUpDown
      Left = 132
      Top = 10
      Width = 16
      Height = 21
      Associate = Edit1
      Min = 0
      Max = 7
      Position = 0
      TabOrder = 2
      Wrap = False
    end
  end
end
