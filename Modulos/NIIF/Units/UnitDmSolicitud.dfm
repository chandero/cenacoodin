object DmSolicitud: TDmSolicitud
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 316
  Top = 259
  Height = 176
  Width = 395
  object IBSolicitud1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTsolicitud1
    Left = 8
    Top = 3
  end
  object IBsolicitud2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTsolicitud2
    Left = 48
    Top = 4
  end
  object IBsolicitud3: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTsolicitud3
    Left = 92
    Top = 5
  end
  object IBTsolicitud1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 7
    Top = 52
  end
  object IBTsolicitud2: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 47
    Top = 53
  end
  object IBTsolicitud3: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 92
    Top = 55
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 288
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 296
    Top = 56
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 320
  end
  object IBTSolicitud4: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Left = 136
    Top = 56
  end
  object IBSolicitud4: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTSolicitud4
    Left = 128
    Top = 8
  end
  object IBQDescuento: TIBQuery
    Transaction = IBTDescuento
    Left = 168
    Top = 8
  end
  object IBTDescuento: TIBTransaction
    Left = 168
    Top = 56
  end
end
