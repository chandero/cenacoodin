object DmComprobante: TDmComprobante
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 267
  Top = 115
  Height = 427
  Width = 309
  object Dscomprobante: TDataSource
    DataSet = IBQsetcomprobante
    Left = 24
    Top = 8
  end
  object Dsauxiliar: TDataSource
    DataSet = IBQsetauxiliar
    Left = 15
    Top = 66
  end
  object Dsagencia: TDataSource
    AutoEdit = False
    DataSet = IBQsetagencia
    Left = 17
    Top = 128
  end
  object Dstipocomp: TDataSource
    DataSet = IBQsettipocomp
    Left = 24
    Top = 184
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 220
    Top = 12
  end
  object Dspersona: TDataSource
    DataSet = IBQsetpersona
    Left = 16
    Top = 240
  end
  object Dstipoid: TDataSource
    DataSet = IBQsettipoid
    Left = 16
    Top = 304
  end
  object IBQuery2: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 222
    Top = 66
  end
  object IBQuery3: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 230
    Top = 134
  end
  object IBVarios: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 232
    Top = 194
  end
  object IBQsetagencia: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$agencia"')
    Left = 150
    Top = 138
  end
  object IBQsettipocomp: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "con$tipocomprobante"')
    Left = 152
    Top = 192
  end
  object IBQsetpersona: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select ID_IDENTIFICACION, ID_PERSONA, PRIMER_APELLIDO, SEGUNDO_A' +
        'PELLIDO, NOMBRE from "gen$persona" where "gen$persona" ."ID_IDEN' +
        'TIFICACION" = :"ID_IDENTIFICACION" and  "gen$persona" ."ID_PERSO' +
        'NA" = :"ID_PERSONA"')
    Left = 154
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_IDENTIFICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end>
  end
  object IBQsettipoid: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 156
    Top = 300
  end
  object IBQsetauxiliar: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select * from "con$auxiliar" where "con$auxiliar"."ID_COMPROBANT' +
        'E" = '#39'00000000000'#39)
    Left = 148
    Top = 76
  end
  object IBQsetcomprobante: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select * from "con$comprobante" where "con$comprobante"."ID_COMP' +
        'ROBANTE" = '#39'00000000000'#39)
    Left = 148
    Top = 20
  end
  object IBDataSet1: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    DeleteSQL.Strings = (
      'delete from "gen$consecutivos"'
      'where'
      '  "gen$consecutivos"."ID_CONSECUTIVO" = :"OLD_ID_CONSECUTIVO"')
    InsertSQL.Strings = (
      'insert into "gen$consecutivos"'
      '  ("gen$consecutivos"."CONSECUTIVO")'
      'values'
      '  (:"CONSECUTIVO")')
    RefreshSQL.Strings = (
      'Select '
      '  "gen$consecutivos"."ID_CONSECUTIVO",'
      '  "gen$consecutivos"."CONSECUTIVO",'
      '  "gen$consecutivos"."DESCRIPCION"'
      'from "gen$consecutivos" '
      'where'
      '  "gen$consecutivos"."ID_CONSECUTIVO" = :"ID_CONSECUTIVO"')
    SelectSQL.Strings = (
      'select * from "gen$consecutivos" where ID_CONSECUTIVO = 1')
    ModifySQL.Strings = (
      'update "gen$consecutivos"'
      'set'
      '  "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO"'
      'where'
      '  "gen$consecutivos"."ID_CONSECUTIVO" = :"OLD_ID_CONSECUTIVO"')
    Left = 236
    Top = 250
  end
end
