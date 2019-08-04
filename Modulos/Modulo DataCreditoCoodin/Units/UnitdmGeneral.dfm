object dmGeneral: TdmGeneral
  OldCreateOrder = False
  Left = 355
  Top = 234
  Height = 148
  Width = 203
  object IBDatabase1: TIBDatabase
    DatabaseName = '192.168.1.2:/var/db/Backup/coop200401.gdb'
    Params.Strings = (
      'lc_ctype=ISO8859_1'
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    AllowStreamedConnected = False
    Left = 24
    Top = 6
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    DefaultAction = TARollbackRetaining
    AutoStopAction = saRollbackRetaining
    Left = 64
    Top = 6
  end
  object IBSQL1: TIBSQL
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 150
    Top = 32
  end
end
