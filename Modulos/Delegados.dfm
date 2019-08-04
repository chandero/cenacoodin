object Form1: TForm1
  Left = 210
  Top = 114
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 264
    Top = 208
    Width = 89
    Height = 33
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object prReport1: TprReport
    Values = <>
    Variables = <>
    PrinterName = 'hp LaserJet 1300 PCL 6'
    OnUnknownVariable = prReport1UnknownVariable
    PreviewParams.Options = []
    PreviewParams.ShowToolbars = [prptPreviewCommon]
    Left = 96
    Top = 8
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 2'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 2'
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
      lMargin = 4
      rMargin = 4
      tMargin = 5.5
      bMargin = 4
      PageScaleInfo.PaperSize = 1
      PageScaleInfo.PageWidth = 2159
      PageScaleInfo.PageHeight = 2794
      PageScaleInfo.FitObjects = False
      object prHDetailBand1: TprHDetailBand
        Height = 204
        UseVerticalBands = False
        DataSetName = 'DATA'
        ColCount = 3
        ColDirection = prcdTopBottomLeftRight
        object prMemoObj1: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'COOPERATIVA DE AHORRO Y CREDITO'
                'CREDISERVIR LTDA'
                'Oca'#241'a N. de S.'
                ''
                ''
                '_______________________________'
                'SECRETARIO'
                ''
                '')
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
              vAlign = prvTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
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
          dRec.Left = 18
          dRec.Top = 67
          dRec.Right = 249
          dRec.Bottom = 181
          Visible = False
        end
        object prMemoObj2: TprMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'DELEGADO  [:<000>DATA.NO]')
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
              Font.Color = clBlack
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Rotate90 = False
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              WordWrap = False
              FontSize = 14
            end>
          dRec.Left = 18
          dRec.Top = 20
          dRec.Right = 249
          dRec.Bottom = 56
          Visible = False
        end
      end
    end
  end
  object DATA: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 88
    Data = {
      250000009619E0BD0100000018000000010000000000030000002500024E4F04
      000100000000000000}
    object DATANO: TIntegerField
      FieldName = 'NO'
    end
  end
  object DataSource1: TDataSource
    DataSet = DATA
    Left = 240
    Top = 48
  end
end
