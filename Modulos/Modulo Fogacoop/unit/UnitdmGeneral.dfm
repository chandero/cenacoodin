object dmGeneral: TdmGeneral
  OldCreateOrder = False
  Left = 289
  Top = 162
  Height = 150
  Width = 215
  object IBDatabase1: TIBDatabase
    DatabaseName = '192.168.200.254:/dbase/01102008/database.fdb'
    Params.Strings = (
      'lc_ctype=ISO8859_1'
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    AllowStreamedConnected = False
    Left = 28
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    DefaultAction = TARollback
    AutoStopAction = saRollback
    Left = 104
    Top = 14
  end
  object IBSQL1: TIBSQL
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 72
    Top = 64
  end
end
