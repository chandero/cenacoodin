object Dmpuc: TDmpuc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 384
  Top = 183
  Height = 312
  Width = 222
  object DataSourcesaldos: TDataSource
    DataSet = IBDataSetSaldos
    Left = 31
    Top = 6
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 22
    Top = 62
  end
  object IBDataSet1: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    DeleteSQL.Strings = (
      'delete from CON$PUC'
      'where'
      '  CON$PUC."CODIGO" = :"OLD_CODIGO" and'
      '  CON$PUC."ID_AGENCIA" = :"OLD_ID_AGENCIA"')
    InsertSQL.Strings = (
      'insert into CON$PUC'
      '  (CON$PUC."CODIGO", CON$PUC."ID_AGENCIA", CON$PUC."CLAVE", '
      'CON$PUC."NOMBRE", '
      '   CON$PUC."TIPO", CON$PUC."CODIGOMAYOR", CON$PUC."MOVIMIENTO", '
      'CON$PUC."ESBANCO", '
      '   CON$PUC."INFORME", CON$PUC."NIVEL", CON$PUC."NATURALEZA", '
      'CON$PUC."CENTROCOSTO", '
      '   CON$PUC."SALDOINICIAL")'
      'values'
      '  (:"CODIGO", :"ID_AGENCIA", :"CLAVE", :"NOMBRE", :"TIPO", '
      ':"CODIGOMAYOR", '
      
        '   :"MOVIMIENTO", :"ESBANCO", :"INFORME", :"NIVEL", :"NATURALEZA' +
        '", '
      ':"CENTROCOSTO", '
      '   :"SALDOINICIAL")')
    RefreshSQL.Strings = (
      'Select '
      '  CON$PUC."CODIGO",'
      '  CON$PUC."ID_AGENCIA",'
      '  CON$PUC."CLAVE",'
      '  CON$PUC."NOMBRE",'
      '  CON$PUC."TIPO",'
      '  CON$PUC."CODIGOMAYOR",'
      '  CON$PUC."MOVIMIENTO",'
      '  CON$PUC."ESBANCO",'
      '  CON$PUC."INFORME",'
      '  CON$PUC."NIVEL",'
      '  CON$PUC."NATURALEZA",'
      '  CON$PUC."CENTROCOSTO",'
      '  CON$PUC."SALDOINICIAL"'
      'from CON$PUC'
      'where'
      '  CON$PUC."CODIGO" = :"CODIGO" and'
      '  CON$PUC."ID_AGENCIA" = :"ID_AGENCIA"')
    SelectSQL.Strings = (
      'select * from CON$PUC order by CON$PUC."CODIGO"')
    ModifySQL.Strings = (
      'update CON$PUC'
      'set'
      '  CON$PUC."CODIGO" = :"CODIGO",'
      '  CON$PUC."ID_AGENCIA" = :"ID_AGENCIA",'
      '  CON$PUC."CLAVE" = :"CLAVE",'
      '  CON$PUC."NOMBRE" = :"NOMBRE",'
      '  CON$PUC."TIPO" = :"TIPO",'
      '  CON$PUC."CODIGOMAYOR" = :"CODIGOMAYOR",'
      '  CON$PUC."MOVIMIENTO" = :"MOVIMIENTO",'
      '  CON$PUC."ESBANCO" = :"ESBANCO",'
      '  CON$PUC."INFORME" = :"INFORME",'
      '  CON$PUC."NIVEL" = :"NIVEL",'
      '  CON$PUC."NATURALEZA" = :"NATURALEZA",'
      '  CON$PUC."CENTROCOSTO" = :"CENTROCOSTO",'
      '  CON$PUC."SALDOINICIAL" = :"SALDOINICIAL"'
      'where'
      '  CON$PUC."CODIGO" = :"OLD_CODIGO" and'
      '  CON$PUC."ID_AGENCIA" = :"OLD_ID_AGENCIA"')
    GeneratorField.Field = 'codigo'
    Left = 124
    Top = 62
  end
  object DataSourceInformes: TDataSource
    DataSet = IBDataSetinformes
    Left = 24
    Top = 125
  end
  object IBDataSetinformes: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    RefreshSQL.Strings = (
      'Select '
      '  "con$informes"."ID",'
      '  "con$informes"."DESCRIPCION",'
      '  "con$informes"."PIDOID",'
      '  "con$informes"."PIDOMONTO",'
      '  "con$informes"."PIDOTASA",'
      '  "con$informes"."PIDOTIPOID"'
      'from "con$informes" '
      'where'
      '  "con$informes"."ID" = :"ID"')
    SelectSQL.Strings = (
      'select * from "con$informes"')
    Left = 128
    Top = 125
  end
  object DataSourcecentros: TDataSource
    DataSet = IBDataSetcentros
    Left = 24
    Top = 192
  end
  object IBDataSetcentros: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    RefreshSQL.Strings = (
      'Select '
      '  "con$centrocosto"."ID",'
      '  "con$centrocosto"."DESCRIPCION"'
      'from "con$centrocosto" '
      'where'
      '  "con$centrocosto"."ID" = :"ID"')
    SelectSQL.Strings = (
      'select * from "con$centrocosto"')
    ModifySQL.Strings = (
      '')
    Left = 128
    Top = 192
  end
  object IBDataSetSaldos: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from CON$SALDOSCUENTA where '
      'CON$SALDOSCUENTA."CODIGO" = :"CODIGO" and'
      'CON$SALDOSCUENTA."ID_AGENCIA" =:"ID_AGENCIA" '
      'order by CON$SALDOSCUENTA."MES"')
    Left = 106
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
end
