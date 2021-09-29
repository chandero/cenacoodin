object dmCaptacion: TdmCaptacion
  OldCreateOrder = False
  Left = 474
  Top = 136
  Height = 294
  Width = 495
  object IBTiposCaptacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "cap$tipocaptacion"')
    Left = 334
    Top = 80
  end
  object IBTiposIdentificacion: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 120
    Top = 4
  end
  object IBConsulta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 32
    Top = 54
  end
  object IBTiposParentesco: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "gen$tiposparentesco"')
    Left = 108
    Top = 54
  end
  object IBTasasVariables: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "col$tasasvariables"')
    Left = 212
    Top = 6
  end
  object IBTiposCaptacionCer: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select "cap$tipocaptacion".ID_TIPO_CAPTACION,"cap$tipocaptacion"' +
        '.DESCRIPCION from "cap$tipocaptacion" left join "cap$tiposforma"' +
        ' on ( "cap$tipocaptacion" .ID_FORMA = "cap$tiposforma".ID_FORMA)' +
        ' where "cap$tiposforma".AHORRO <> 0')
    Left = 212
    Top = 54
  end
  object IBPlanContractual: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select * from "cap$tiposplancontractual" where ACTIVO = 1 order ' +
        'by PLAZO ASC')
    Left = 36
    Top = 102
  end
  object IBGrabar: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 116
    Top = 104
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 168
    Top = 102
  end
  object IBTiposTitular: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "cap$tipostitulares"')
    Left = 220
    Top = 102
  end
  object IBTiposCaptacionCon: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'select "cap$tipocaptacion".ID_TIPO_CAPTACION,"cap$tipocaptacion"' +
        '.DESCRIPCION from "cap$tipocaptacion" left join "cap$tiposforma"' +
        ' on ( "cap$tipocaptacion" .ID_FORMA = "cap$tiposforma".ID_FORMA)' +
        ' where "cap$tiposforma".AHORRO <> 0')
    Left = 314
    Top = 32
  end
  object IBTiposCaptacionF: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'select * from "cap$tipocaptacion" '
      
        'inner join "cap$tiposforma" on ("cap$tipocaptacion".ID_FORMA = "' +
        'cap$tiposforma".ID_FORMA)'
      'where'
      '"cap$tiposforma".AHORRO <> 0')
    Left = 334
    Top = 152
  end
end
