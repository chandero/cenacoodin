object frmActualizarSaldoCuentaServiciosVirtuales: TfrmActualizarSaldoCuentaServiciosVirtuales
  Left = 404
  Top = 227
  Width = 945
  Height = 283
  Caption = 'Actualizar Saldo de Cuenta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox4: TGroupBox
    Left = 5
    Top = 8
    Width = 924
    Height = 201
    Caption = 'Cuentas con Servicios'
    TabOrder = 0
    object DBGCuentas: TDBGrid
      Left = 8
      Top = 16
      Width = 905
      Height = 177
      DataSource = DSCuentas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'VICU_ID'
          Title.Caption = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Caption = 'ASOCIADO'
          Width = 237
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VICU_TIPO_CUENTA'
          Title.Caption = 'TIPO_CUENTA'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VICU_NUMERO_CUENTA'
          Title.Caption = 'NUMERO_CUENTA'
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VICU_DIGITO_CUENTA'
          Title.Caption = 'DIGITO_CUENTA'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VICU_ESTADO'
          Title.Caption = 'ESTADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VICU_FECHA_REGISTRO'
          Title.Caption = 'FECHA_REGISTRO'
          Width = 138
          Visible = True
        end>
    end
  end
  object edBuscar: TEdit
    Left = 8
    Top = 216
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyUp = edBuscarKeyUp
  end
  object btnActualizarUno: TButton
    Left = 152
    Top = 216
    Width = 105
    Height = 25
    Caption = 'Actualizar Selecci'#243'n'
    TabOrder = 2
    OnClick = btnActualizarUnoClick
  end
  object btnActualizarTodos: TButton
    Left = 272
    Top = 216
    Width = 105
    Height = 25
    Caption = 'Actualizar Todas'
    TabOrder = 3
    OnClick = btnActualizarTodosClick
  end
  object CmdCerrar: TBitBtn
    Left = 619
    Top = 214
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 4
    OnClick = CmdCerrarClick
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      08000000000000010000220B0000220B00000001000000010000006400004242
      42008C6363009A666600B9666600BB686800B0717200C3686900C66A6B00C76A
      6D00CF6C6E00D2686900D16D6E00CC6E7100C0797A00D2707200D4707100D572
      7300D0727500D3747600D9757600D8767700E37D7E000080000000960000DC7F
      8000FF00FF00D7868700DA888800D8888A00DA888A00DF898A00E6808100E085
      8500E9818200EE868700E3888900E78C8D00F0878800F18B8C00F28B8C00F18D
      8E00F48C8D00F48E8F00EB8F9000EC969700E49A9800F3919200F7909100F791
      9200F2939400F9909200F9949500FA949500F9969700F0999A00FC999A00FF9D
      9E00F7B58400F5A7A500FACCAA00FBD6BB00FADCDC00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001A1A1A1A1A1A
      1A02011A1A1A1A1A1A1A1A1A1A1A02030405011A1A1A1A1A1A1A1A1A0203080B
      0B07010303030303031A1A1A030C0C0C0A09010E1F323B3B031A1A1A030C0C10
      0F0D01181818183B031A1A1A03111114151201181818183B031A1A1A03161616
      201301181717173B031A1A1A0326222D3E1D01171700003B031A1A1A03262337
      3F1E013C3A3A3A3B031A1A1A03272B282A19013C3D3D3D3B031A1A1A03273031
      2921013C3D3D3D3B031A1A1A032734352F24013C3D3D3D3B031A1A1A03273338
      3625013C3D3D3D3B031A1A1A03032E33392C013C3D3D3D3B031A1A1A1A1A0306
      1B1C010303030303031A1A1A1A1A1A1A0303011A1A1A1A1A1A1A}
  end
  object IBQvCuenta: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      
        'SELECT vc.*, p.NOMBRE || '#39' '#39' || p.PRIMER_APELLIDO || '#39' '#39' || p.SE' +
        'GUNDO_APELLIDO AS NOMBRE FROM VIRTUAL_CUENTA vc'
      
        'INNER JOIN "cap$maestrotitular" mt ON mt.ID_AGENCIA = vc.VICU_ID' +
        '_AGENCIA and mt.ID_TIPO_CAPTACION = vc.VICU_TIPO_CUENTA and mt.N' +
        'UMERO_CUENTA = vc.VICU_NUMERO_CUENTA and mt.DIGITO_CUENTA = vc.V' +
        'ICU_DIGITO_CUENTA'
      
        'INNER JOIN "gen$persona" p ON p.ID_IDENTIFICACION = mt.ID_IDENTI' +
        'FICACION and p.ID_PERSONA = mt.ID_PERSONA and mt.NUMERO_TITULAR ' +
        '= 1'
      'WHERE vc.VICU_ESTADO <> 9')
    Left = 368
    Top = 72
  end
  object DSCuentas: TDataSource
    DataSet = IBQvCuenta
    Left = 168
    Top = 96
  end
  object IBQupdate: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = IBTransaction1
    Left = 224
    Top = 144
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = dmGeneral.IBDatabase1
    Left = 168
    Top = 144
  end
end
