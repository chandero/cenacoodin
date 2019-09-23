object dmGeneral: TdmGeneral
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 477
  Top = 248
  Height = 281
  Width = 273
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'lc_ctype=ISO8859_1'
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    TraceFlags = [tfStmt]
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
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 72
    Top = 112
  end
  object DSagencia: TDataSource
    DataSet = IBDSAgencias
    Left = 84
    Top = 198
  end
  object IBDSAgencias: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from "gen$agencia"')
    Left = 176
    Top = 160
  end
end
