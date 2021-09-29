object dmGeneral: TdmGeneral
  OldCreateOrder = False
  Left = 790
  Top = 353
  Height = 194
  Width = 171
  object IBDatabase1: TIBDatabase
    DatabaseName = '192.168.200.254:/dbase3/respaldo/database.fdb'
    Params.Strings = (
      'lc_ctype=ISO8859_1'
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    AllowStreamedConnected = False
    Left = 24
    Top = 14
  end
  object IBTransaction1: TIBTransaction
    AllowAutoStart = False
    DefaultDatabase = IBDatabase1
    DefaultAction = TARollback
    AutoStopAction = saRollback
    Left = 104
    Top = 14
  end
  object IBSQL1: TIBSQL
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 14
    Top = 112
  end
end
