object dmPersona: TdmPersona
  OldCreateOrder = False
  Left = 2
  Top = 1
  Height = 448
  Width = 638
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
    Left = 64
    Top = 58
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
    Left = 18
    Top = 186
  end
  object IBTPersonas: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    DefaultAction = TARollback
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saRollback
    Left = 20
    Top = 258
  end
  object IBDStiposidentificacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 190
    Top = 110
  end
  object IBDStiposrelacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tiposrelacion"')
    Left = 94
    Top = 116
  end
  object IBDStiposciiu: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tiposciiu"')
    Left = 20
    Top = 124
  end
  object IBDStipopersona: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tipospersona"')
    Left = 190
    Top = 158
  end
  object IBDSestadocivil: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tiposestadocivil"')
    Left = 192
    Top = 212
  end
  object IBDStiposidentificacionconyuge: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    ForcedRefresh = True
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 306
    Top = 154
  end
  object IBDStipodireccion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    SQL.Strings = (
      'select * from "gen$tiposdireccion"')
    Left = 102
    Top = 226
  end
  object IBDStiporeferencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    SQL.Strings = (
      'select * from "gen$tiposreferencia"')
    Left = 98
    Top = 172
  end
  object IBDSparentesco: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    SQL.Strings = (
      'select * from "gen$tiposparentesco"')
    Left = 296
    Top = 108
  end
  object DSMunicipio: TDataSource
    DataSet = IBMunicipio
    Left = 272
    Top = 216
  end
  object IBMunicipio: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    SQL.Strings = (
      
        'select COD_MUNICIPIO, NOMBRE, (NOMBRE || '#39' '#39' || DPTO) AS MUNICIP' +
        'IO  from "gen$municipios" ORDER BY COD_MUNICIPIO')
    Left = 376
    Top = 112
  end
  object IBDSnivelestudio: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    SQL.Strings = (
      'SELECT * FROM "gen$nivelestudio"'
      'ORDER BY "gen$nivelestudio".ID_NIVEL')
    Left = 104
    Top = 272
  end
  object IBDSestrato: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    SQL.Strings = (
      'SELECT * FROM "gen$estrato"'
      'ORDER BY "gen$estrato".ID_ESTRATO')
    Left = 184
    Top = 272
  end
  object DSnivelestudio: TDataSource
    DataSet = IBDSnivelestudio
    Left = 248
    Top = 272
  end
  object DSestrato: TDataSource
    DataSet = IBDSestrato
    Left = 312
    Top = 272
  end
  object DSvivienda: TDataSource
    DataSet = IBDSvivienda
    Left = 368
    Top = 224
  end
  object IBDSvivienda: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTPersonas
    SQL.Strings = (
      'SELECT * FROM "gen$tipovivienda"'
      'ORDER BY ID_TIPOVIVIENDA')
    Left = 376
    Top = 272
  end
end
