object DmLog: TDmLog
  OldCreateOrder = False
  Left = 299
  Top = 293
  Height = 150
  Width = 215
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 104
    Top = 72
  end
  object IBDatabase1: TIBDatabase
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 16
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Left = 96
    Top = 8
  end
end
