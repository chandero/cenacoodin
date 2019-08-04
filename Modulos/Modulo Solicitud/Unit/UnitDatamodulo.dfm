object DataGeneral: TDataGeneral
  OldCreateOrder = False
  Left = 316
  Top = 192
  Height = 85
  Width = 226
  object IBDatabase1: TIBDatabase
    DatabaseName = '192.168.1.7:/var/db/fbird/database.fdb'
    Params.Strings = (
      'lc_ctype=ISO8859_1'
      'password=masterkey'
      'user_name=sysdba')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    AllowStreamedConnected = False
    Left = 11
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    DefaultAction = TACommitRetaining
    Left = 67
    Top = 1
  end
  object IBDatabase2: TIBDatabase
    Left = 152
    Top = 16
  end
end
