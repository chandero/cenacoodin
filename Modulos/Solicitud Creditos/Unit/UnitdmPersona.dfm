object dmPersona: TdmPersona
  OldCreateOrder = False
  Left = 235
  Top = 162
  Height = 302
  Width = 468
  object IBQuery: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$persona"')
    Left = 8
    Top = 18
  end
  object DStiposrelacion: TDataSource
    AutoEdit = False
    DataSet = IBDStiposrelacion
    Left = 272
    Top = 4
  end
  object DStiposciiu: TDataSource
    AutoEdit = False
    DataSet = IBDStiposciiu
    Left = 344
    Top = 4
  end
  object DStiposidentificacion: TDataSource
    AutoEdit = False
    DataSet = IBDStiposidentificacion
    Left = 72
    Top = 42
  end
  object DStipopersona: TDataSource
    DataSet = IBDStipopersona
    Left = 206
    Top = 2
  end
  object DSestadocivil: TDataSource
    AutoEdit = False
    DataSet = IBDSestadocivil
    Left = 326
    Top = 56
  end
  object DStiposidentificacionconyuge: TDataSource
    AutoEdit = False
    DataSet = IBDStiposidentificacionconyuge
    Left = 124
    Top = 4
  end
  object DStipodireccion: TDataSource
    DataSet = IBDStipodireccion
    Left = 154
    Top = 56
  end
  object DStiporeferencia: TDataSource
    DataSet = IBDStiporeferencia
    Left = 242
    Top = 56
  end
  object DSparentesco: TDataSource
    AutoEdit = False
    DataSet = IBDSparentesco
    Left = 66
    Top = 6
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    Left = 6
    Top = 142
  end
  object IBTPersonas: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 40
    Top = 192
  end
  object IBDStiposidentificacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 46
    Top = 142
  end
  object IBDStiposrelacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tiposrelacion"')
    Left = 46
    Top = 100
  end
  object IBDStiposciiu: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tiposciiu"')
    Left = 4
    Top = 100
  end
  object IBDStipopersona: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tipospersona"')
    Left = 86
    Top = 98
  end
  object IBDSestadocivil: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tiposestadocivil"')
    Left = 230
    Top = 138
  end
  object IBDStiposidentificacionconyuge: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 190
    Top = 130
  end
  object IBDStipodireccion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposdireccion"')
    Left = 130
    Top = 140
  end
  object IBDStiporeferencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposreferencia"')
    Left = 90
    Top = 140
  end
  object IBDSparentesco: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposparentesco"')
    Left = 126
    Top = 100
  end
end
