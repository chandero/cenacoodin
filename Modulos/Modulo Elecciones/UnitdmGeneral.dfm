object DM: TDM
  OldCreateOrder = False
  Left = 374
  Top = 348
  Height = 90
  Width = 211
  object IBDatabase1: TIBDatabase
    DatabaseName = '192.168.200.141:/var/db/fbird/database.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    Left = 18
    Top = 10
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 92
    Top = 6
  end
end
