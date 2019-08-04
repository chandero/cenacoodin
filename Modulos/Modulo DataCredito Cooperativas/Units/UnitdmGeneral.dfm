object dmGeneral: TdmGeneral
  OldCreateOrder = False
  Left = 670
  Top = 122
  Height = 148
  Width = 203
  object IBDatabase1: TIBDatabase
    DatabaseName = '192.168.200.141:/var/db/fbird/database.fdb'
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
    Left = 88
    Top = 6
  end
  object IBSQL1: TIBSQL
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 150
    Top = 32
  end
end
