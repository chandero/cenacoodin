unit UnitAdministracionProductosVirtuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Buttons, JvEdit, JvTypedEdit,
  Grids, DBGrids, DB, IBCustomDataSet, IBQuery, UnitDmGeneral, UnitDmPersona, UnitGlobales,
  FR_Class, StrUtils, DateUtils, IBDatabase, ToggleButton;

type
  TfrmAdministracionProductosVirtuales = class(TForm)
    GroupBox1: TGroupBox;
    Label49: TLabel;
    CBTiposIdentificacion: TDBLookupComboBox;
    Label50: TLabel;
    EdIdentificacion: TMemo;
    EdPrimerApellido: TLabeledEdit;
    EdSegundoApellido: TLabeledEdit;
    EdNombres: TLabeledEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    btnGrabar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label1: TLabel;
    edTarjetaDebito: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox4: TGroupBox;
    DBGCuentas: TDBGrid;
    DSCuentas: TDataSource;
    IBQCuentas: TIBQuery;
    IBQCanal: TIBQuery;
    IBQTarjeta: TIBQuery;
    chkATM: TCheckBox;
    Label20: TLabel;
    Label21: TLabel;
    edNopeATM: TJvIntegerEdit;
    edTopeATM: TJvCurrencyEdit;
    chkPOS: TCheckBox;
    edNopePOS: TJvIntegerEdit;
    edTopePOS: TJvCurrencyEdit;
    chkIVR: TCheckBox;
    edNopeIVR: TJvIntegerEdit;
    edTopeIVR: TJvCurrencyEdit;
    chkWEB: TCheckBox;
    edNopeWEB: TJvIntegerEdit;
    edTopeWEB: TJvCurrencyEdit;
    chkMOV: TCheckBox;
    edNopeMOV: TJvIntegerEdit;
    edTopeMOV: TJvCurrencyEdit;
    chkOFI: TCheckBox;
    edNopeOFI: TJvIntegerEdit;
    edTopeOFI: TJvCurrencyEdit;
    chkCNB: TCheckBox;
    edNopeCNB: TJvIntegerEdit;
    edTopeCNB: TJvCurrencyEdit;
    IBQGuardar: TIBQuery;
    btnBuscar: TBitBtn;
    IBQGuardarVICU_ID: TIntegerField;
    IBQCaptacion: TIBQuery;
    IBQTipoIdentificacion: TIBQuery;
    DSTipoIdentificacion: TDataSource;
    IBQCuentaCanal: TIBQuery;
    btnMarcar: TBitBtn;
    frReport1: TfrReport;
    IBQvCuenta: TIBQuery;
    btnNuevo: TBitBtn;
    btnFormato: TBitBtn;
    frFormatoSolicitudTD: TfrReport;
    IBQDireccion: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBTransaction2: TIBTransaction;
    btnReasignar: TToggleButton;
    Label22: TLabel;
    procedure CmdCerrarClick(Sender: TObject);
    procedure EdIdentificacionExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBQCuentasAfterScroll(DataSet: TDataSet);
    procedure btnGrabarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnReasignarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnFormatoClick(Sender: TObject);
    procedure CBTiposIdentificacionExit(Sender: TObject);
  private
    { Private declarations }
    procedure Ubicar;
    procedure Reubicar;
  public
    { Public declarations }
  end;

var
  frmAdministracionProductosVirtuales: TfrmAdministracionProductosVirtuales;
  vTipoIdentificacion : Integer;
  vIdentificacion: String;
  dmPersona: TdmPersona;
  _vIdAgencia :Integer;
  _vTipo      :Integer;
  _vNumero    :Integer;
  _vDigito    :Integer;
  _vModificar : Boolean;
  _Tarjeta : TTarjetaDebito;

  _Atm: Boolean;
  _Pos: Boolean;
  _Ivr: Boolean;
  _Web: Boolean;
  _Mov: Boolean;
  _Ofi: Boolean;
  _Cnb: Boolean;

  _eAtm: Boolean;
  _ePos: Boolean;
  _eIvr: Boolean;
  _eWeb: Boolean;
  _eMov: Boolean;
  _eOfi: Boolean;
  _eCnb: Boolean;




  _vita_id: Integer;
  _vVicu_id: Integer;

  _id_identificacion : Integer;
  _id_persona: String;
  _numero_cuenta: Integer;

implementation

{$R *.dfm}

uses UnitBuscarPersona, unitMain;

procedure TfrmAdministracionProductosVirtuales.CmdCerrarClick(Sender: TObject);
begin
     if (IBQGuardar.Transaction.InTransaction) then
     begin
         IBQGuardar.Transaction.Commit;
     end;
     Close;
end;

procedure TfrmAdministracionProductosVirtuales.EdIdentificacionExit(Sender: TObject);
begin
        _id_persona := EdIdentificacion.Text;
        vIdentificacion := EdIdentificacion.Text;
        Ubicar;
end;

procedure TfrmAdministracionProductosVirtuales.FormShow(Sender: TObject);
begin
       if ( dmGeneral.IBTransaction1.InTransaction ) then
       begin
           dmGeneral.IBTransaction1.Commit;
       end;
       dmGeneral.IBTransaction1.StartTransaction;
       IBQTipoIdentificacion.Close;
       IBQTipoIdentificacion.Open;
       IBQTipoIdentificacion.Last;
       _vModificar := False;
       btnReasignar.Checked := False;
end;

procedure TfrmAdministracionProductosVirtuales.IBQCuentasAfterScroll(
  DataSet: TDataSet);
var
  vccEstado : Integer;
begin
        // Buscar información conectada
        _vIdAgencia := DataSet.FieldByName('ID_AGENCIA').AsInteger;
        _vTipo      := DataSet.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        _vNumero    := DataSet.FieldByName('NUMERO_CUENTA').AsInteger;
        _vDigito    := DataSet.FieldByName('DIGITO_CUENTA').AsInteger;

        IBQvCuenta.Close;
        IBQvCuenta.ParamByName('ID_AGENCIA').AsInteger := DataSet.FieldByName('ID_AGENCIA').AsInteger;
        IBQvCuenta.ParamByName('ID_TIPO_CAPTACION').AsInteger := DataSet.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        IBQvCuenta.ParamByName('NUMERO_CUENTA').AsInteger := DataSet.FieldByName('NUMERO_CUENTA').AsInteger;
        IBQvCuenta.ParamByName('DIGITO_CUENTA').AsInteger := DataSet.FieldByName('DIGITO_CUENTA').AsInteger;
        IBQvCuenta.Open;

        if (IBQvCuenta.FieldByName('EXISTE').AsInteger > 0) then
           _vModificar := True
        else
           _vModificar := False;

        IBQCuentaCanal.Close;
        IBQCuentaCanal.ParamByName('ID_AGENCIA').AsInteger := DataSet.FieldByName('ID_AGENCIA').AsInteger;
        IBQCuentaCanal.ParamByName('ID_TIPO_CAPTACION').AsInteger := DataSet.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        IBQCuentaCanal.ParamByName('NUMERO_CUENTA').AsInteger := DataSet.FieldByName('NUMERO_CUENTA').AsInteger;
        IBQCuentaCanal.ParamByName('DIGITO_CUENTA').AsInteger := DataSet.FieldByName('DIGITO_CUENTA').AsInteger;
        IBQCuentaCanal.Open;

        IBQCaptacion.Close;
        IBQCaptacion.ParamByName('ID_AGENCIA').AsInteger := DataSet.FieldByName('ID_AGENCIA').AsInteger;
        IBQCaptacion.ParamByName('ID_TIPO_CAPTACION').AsInteger := DataSet.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        IBQCaptacion.ParamByName('NUMERO_CUENTA').AsInteger := DataSet.FieldByName('NUMERO_CUENTA').AsInteger;
        IBQCaptacion.ParamByName('DIGITO_CUENTA').AsInteger := DataSet.FieldByName('DIGITO_CUENTA').AsInteger;
        IBQCaptacion.Open;

        _vVicu_id := IBQCaptacion.FieldByName('VICU_ID').AsInteger;

        IBQTarjeta.Close;
        IBQTarjeta.ParamByName('ID_AGENCIA').AsInteger := DataSet.FieldByName('ID_AGENCIA').AsInteger;
        IBQTarjeta.ParamByName('ID_TIPO_CAPTACION').AsInteger := DataSet.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        IBQTarjeta.ParamByName('NUMERO_CUENTA').AsInteger := DataSet.FieldByName('NUMERO_CUENTA').AsInteger;
        IBQTarjeta.ParamByName('DIGITO_CUENTA').AsInteger := DataSet.FieldByName('DIGITO_CUENTA').AsInteger;
        IBQTarjeta.Open;

        _Atm := False;
        _Pos := False;
        _Ivr := False;
        _Web := False;
        _Mov := False;
        _Ofi := False;
        _Cnb := False;

        _eAtm := False;
        _ePos := False;
        _eIvr := False;
        _eWeb := False;
        _eMov := False;
        _eOfi := False;
        _eCnb := False;

        if (IBQTarjeta.RecordCount > 0) then
        begin
          edTarjetaDebito.Text := IBQTarjeta.FieldByName('VITA_TARJETA').AsString;
          _vita_id := IBQTarjeta.FieldByName('VITA_ID').AsInteger;
          btnReasignar.Enabled := True;
          btnMarcar.Enabled := True;
          btnFormato.Enabled := True;
          _Atm := True;
        end
        else
        begin
          edTarjetaDebito.Text := '';
          btnReasignar.Enabled := False;
          btnMarcar.Enabled := False;
          btnFormato.Enabled := False;
          _Atm := False;
        end;

        chkATM.Checked := False;
        edNopeATM.Value := 0;
        edTopeATM.Value := 0;
        chkPOS.Checked := False;
        edNopePOS.Value := 0;
        edTopePOS.Value := 0;
        chkIVR.Checked := False;
        edNopeIVR.Value := 0;
        edTopeIVR.Value := 0;
        chkWEB.Checked := False;
        edNopeWEB.Value := 0;
        edTopeWEB.Value := 0;
        chkMOV.Checked := False;
        edNopeMOV.Value := 0;
        edTopeMOV.Value := 0;
        chkOFI.Checked := False;
        edNopeOFI.Value := 0;
        edTopeOFI.Value := 0;
        chkCNB.Checked := False;
        edNopeCNB.Value := 0;
        edTopeCNB.Value := 0;

        IBQCuentaCanal.Last;
        IBQCuentaCanal.First;

      if (IBQCuentaCanal.RecordCount > 0) then
      begin
        while not IBQCuentaCanal.Eof do
        begin
          btnGrabar.Caption := 'Actualizar';
          btnGrabar.Enabled := True;
          vccEstado := IBQCuentaCanal.FieldByName('VICC_ESTADO').AsInteger;
          if (IBQCuentaCanal.FieldByName('VICA_ID').AsInteger = 1) then
          begin
            if (vccEstado = 0) then
              chkATM.Checked := True
            else
              chkATM.Checked := False;
            edNopeATM.Value := IBQCuentaCanal.FieldByName('VICC_NOPE').AsInteger;
            edTopeATM.Value := IBQCuentaCanal.FieldByName('VICC_MONTO').AsCurrency;
            _Atm := chkATM.Checked;
            _eAtm := True;
          end;
          if (IBQCuentaCanal.FieldByName('VICA_ID').AsInteger = 2) then
          begin
            if (vccEstado = 0) then
              chkPOS.Checked := True
            else
              chkPOS.Checked := False;
            edNopePOS.Value := IBQCuentaCanal.FieldByName('VICC_NOPE').AsInteger;
            edTopePOS.Value := IBQCuentaCanal.FieldByName('VICC_MONTO').AsCurrency;
            _Pos := chkPOS.Checked;
            _ePos := True;
          end;
          if (IBQCuentaCanal.FieldByName('VICA_ID').AsInteger = 3) then
          begin
            if (vccEstado = 0) then
              chkIVR.Checked := True
            else
              chkIVR.Checked := False;
            edNopeIVR.Value := IBQCuentaCanal.FieldByName('VICC_NOPE').AsInteger;
            edTopeIVR.Value := IBQCuentaCanal.FieldByName('VICC_MONTO').AsCurrency;
            _Ivr := True;
            _eIvr := True;
          end;
          if (IBQCuentaCanal.FieldByName('VICA_ID').AsInteger = 4) then
          begin
            if (vccEstado = 0) then
              chkWEB.Checked := True
            else
              chkWEB.Checked := False;
            edNopeWEB.Value := IBQCuentaCanal.FieldByName('VICC_NOPE').AsInteger;
            edTopeWEB.Value := IBQCuentaCanal.FieldByName('VICC_MONTO').AsCurrency;
            _Web := chkWEB.Checked;
            _eWeb := True;
          end;
          if (IBQCuentaCanal.FieldByName('VICA_ID').AsInteger = 5) then
          begin
            if (vccEstado = 0) then
              chkMOV.Checked := True
            else
              chkMOV.Checked := False;
            edNopeMOV.Value := IBQCuentaCanal.FieldByName('VICC_NOPE').AsInteger;
            edTopeMOV.Value := IBQCuentaCanal.FieldByName('VICC_MONTO').AsCurrency;
            _Mov := chkMOV.Checked;
            _eMov := True;
          end;
          if (IBQCuentaCanal.FieldByName('VICA_ID').AsInteger = 6) then
          begin
            if (vccEstado = 0) then
              chkOFI.Checked := True
            else
              chkOFI.Checked := False;
            edNopeOFI.Value := IBQCuentaCanal.FieldByName('VICC_NOPE').AsInteger;
            edTopeOFI.Value := IBQCuentaCanal.FieldByName('VICC_MONTO').AsCurrency;
            _Ofi := chkOFI.Checked;
            _eOfi := True;
          end;
          if (IBQCuentaCanal.FieldByName('VICA_ID').AsInteger = 7) then
          begin
            if (vccEstado = 0) then
              chkCNB.Checked := True
            else
              chkCNB.Checked := False;
            edNopeCNB.Value := IBQCuentaCanal.FieldByName('VICC_NOPE').AsInteger;
            edTopeCNB.Value := IBQCuentaCanal.FieldByName('VICC_MONTO').AsCurrency;
            _Cnb := chkCNB.Checked;
            _eCnb := True;
          end;
          IBQCuentaCanal.Next;
        end;
      end
      else
      begin
          btnGrabar.Caption := 'Grabar';
          btnGrabar.Enabled := True;
          IBQCanal.Open;
          while not IBQCanal.Eof do
          begin
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 1) then
          begin
              chkATM.Checked := True;
              edNopeATM.Value := IBQCanal.FieldByName('VICA_NOPE').AsInteger;
              edTopeATM.Value := IBQCanal.FieldByName('VICA_MONTO').AsCurrency;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 2) then
          begin
              chkPOS.Checked := True;
              edNopePOS.Value := IBQCanal.FieldByName('VICA_NOPE').AsInteger;
              edTopePOS.Value := IBQCanal.FieldByName('VICA_MONTO').AsCurrency;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 3) then
          begin
              chkIVR.Checked := True;
              edNopeIVR.Value := IBQCanal.FieldByName('VICA_NOPE').AsInteger;
              edTopeIVR.Value := IBQCanal.FieldByName('VICA_MONTO').AsCurrency;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 4) then
          begin
              chkWEB.Checked := True;
              edNopeWEB.Value := IBQCanal.FieldByName('VICA_NOPE').AsInteger;
              edTopeWEB.Value := IBQCanal.FieldByName('VICA_MONTO').AsCurrency;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 5) then
          begin
              chkMOV.Checked := True;
              edNopeMOV.Value := IBQCanal.FieldByName('VICA_NOPE').AsInteger;
              edTopeMOV.Value := IBQCanal.FieldByName('VICA_MONTO').AsCurrency;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 6) then
          begin
              chkOFI.Checked := True;
              edNopeOFI.Value := IBQCanal.FieldByName('VICA_NOPE').AsInteger;
              edTopeOFI.Value := IBQCanal.FieldByName('VICA_MONTO').AsCurrency;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 7) then
          begin
              chkCNB.Checked := True;
              edNopeCNB.Value := IBQCanal.FieldByName('VICA_NOPE').AsInteger;
              edTopeCNB.Value := IBQCanal.FieldByName('VICA_MONTO').AsCurrency;
          end;
              IBQCanal.Next;
          end;
          IBQCanal.Close;
      end;
      chkATM.Checked := True;


end;

procedure TfrmAdministracionProductosVirtuales.btnGrabarClick(
  Sender: TObject);
  var
    _vicu_id: Integer;
begin
        if (_vModificar) then
        begin
             // ATM
             if (chkATM.Checked) then
             begin
              if (_Atm = False) then
              begin
                  if (not _eAtm) then
                  begin
                   IBQGuardar.SQL.Clear;
                   IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                   IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                   IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                   IBQGuardar.ParamByName('VICA_ID').AsInteger := 1;
                   IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeATM.Value;
                   IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeATM.Value;
                   IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;
                   IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                   IBQGuardar.ExecSQL;
                   IBQGuardar.Close;
                  end;
                  
                   _Tarjeta := TarjetaDebito;
                   if (_Tarjeta.Id = 0) then
                   begin
                     ShowMessage('No se puede continuar con el proceso, por favor reingrese e intente nuevamente');
                     Exit;
                   end;
                   edTarjetaDebito.Text := _Tarjeta.Tarjeta;

                   IBQGuardar.SQL.Clear;
                   IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_TARJETA_CUENTA (VICU_ID, VITA_ID, VITC_FECHAREGISTRO, VITC_ESTADO, VITC_ESLEIDO) VALUES (');
                   IBQGuardar.SQL.Add(':VICU_ID, :VITA_ID, :VITC_FECHAREGISTRO, :VITC_ESTADO, :VITC_ESLEIDO)');
                   IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                   IBQGuardar.ParamByName('VITA_ID').AsInteger := _Tarjeta.Id;
                   IBQGuardar.ParamByName('VITC_FECHAREGISTRO').AsDate := fFechaActual;
                   IBQGuardar.ParamByName('VITC_ESTADO').AsInteger := 0;
                   IBQGuardar.ParamByName('VITC_ESLEIDO').AsInteger := 0;
                   IBQGuardar.ExecSQL;
                   IBQGuardar.Close;
              end
              else
              begin
                   IBQGuardar.SQL.Clear;
                   IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                   IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                   IBQGuardar.ParamByName('VICA_ID').AsInteger := 1;
                   IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;
                   IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeATM.Value;
                   IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeATM.Value;
                   IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                   IBQGuardar.ExecSQL;
                   IBQGuardar.Close;

                   if (btnReasignar.Checked) then
                   begin
                     IBQGuardar.SQL.Clear;
                     IBQGuardar.SQL.Add('UPDATE VIRTUAL_TARJETA_CUENTA SET VITC_ESTADO = :VITC_ESTADO, VITC_ESLEIDO = :VITC_ESLEIDO, VITC_FECHACANCELACION = :VITC_FECHACANCELACION WHERE VITA_ID = :VITA_ID');
                     IBQGuardar.ParamByName('VITC_ESTADO').AsInteger := 9;
                     IBQGuardar.ParamByName('VITC_ESLEIDO').AsInteger := 0;
                     IBQGuardar.ParamByName('VITC_FECHACANCELACION').AsDateTime := fFechaHoraActual;
                     IBQGuardar.ParamByName('VITA_ID').AsInteger := _vita_id;
                     IBQGuardar.ExecSQL;
                     IBQGuardar.Close;

                     _Tarjeta := TarjetaDebito;
                     if (_Tarjeta.Id = 0) then
                     begin
                       ShowMessage('No se puede continuar con el proceso, por favor reingrese e intente nuevamente');
                       Exit;
                     end;
                     edTarjetaDebito.Text := _Tarjeta.Tarjeta;

                     IBQGuardar.SQL.Clear;
                     IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_TARJETA_CUENTA (VICU_ID, VITA_ID, VITC_FECHAREGISTRO, VITC_ESTADO, VITC_ESLEIDO) VALUES (');
                     IBQGuardar.SQL.Add(':VICU_ID, :VITA_ID, :VITC_FECHAREGISTRO, :VITC_ESTADO, :VITC_ESLEIDO)');
                     IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                     IBQGuardar.ParamByName('VITA_ID').AsInteger := _Tarjeta.Id;
                     IBQGuardar.ParamByName('VITC_FECHAREGISTRO').AsDate := fFechaActual;
                     IBQGuardar.ParamByName('VITC_ESTADO').AsInteger := 0;
                     IBQGuardar.ParamByName('VITC_ESLEIDO').AsInteger := 0;
                     IBQGuardar.ExecSQL;
                     IBQGuardar.Close;
                   end;
              end;
             end;

             if (chkATM.Checked = False) then
             begin
                if (_eAtm = True) then
                begin
                     IBQGuardar.SQL.Clear;
                     IBQGuardar.SQL.Add('UPDATE VIRTUAL_TARJETA_CUENTA SET VITC_ESTADO = :VITC_ESTADO, VITC_ESLEIDO = :VITC_ESLEIDO, VITC_FECHACANCELACION = :VITC_FECHACANCELACION WHERE VITA_ID = :VITA_ID');
                     IBQGuardar.ParamByName('VITC_ESTADO').AsInteger := 9;
                     IBQGuardar.ParamByName('VITC_ESLEIDO').AsInteger := 0;
                     IBQGuardar.ParamByName('VITC_FECHACANCELACION').AsDateTime := fFechaHoraActual;                     
                     IBQGuardar.ParamByName('VITA_ID').AsInteger := _vita_id;
                     IBQGuardar.ExecSQL;
                     IBQGuardar.Close;
                end;
             end;
             // POS
             if (chkPOS.Checked) then
             begin
               if (_ePos = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopePOS.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopePOS.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID and VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopePOS.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopePOS.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                        
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkPOS.Checked = False) then
             begin
               if (_ePos = True) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID and VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 9;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             // IVR
             if (chkIVR.Checked) then
             begin
               if (_eIvr = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 3;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESTADO = :VICC_ESTADO,  VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 3;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkIVR.Checked = False) then
             begin
               if (_eIvr = True) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 3;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 9;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             // WEB
             if (chkWEB.Checked) then
             begin
               if (_eWeb = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 4;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 4;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkWEB.Checked = False) then
             begin
               if ( _eWeb = True ) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 4;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 9;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             // MOV
             if (chkMOV.Checked) then
             begin
               if (_eMov = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 5;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 5;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkMOV.Checked = False) then
             begin
               if (_eMov = True) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 5;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 9;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             // OFI
             if (chkOFI.Checked) then
             begin
               if (_eOfi = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 6;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 6;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkOfi.Checked = False) then
             begin
               if (_eOfi = True) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 6;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 9;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             // CNB
             if (chkCNB.Checked) then
             begin
               if (_eCnb = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 7;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 7;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkCnb.Checked = False) then
             begin
               if (_eCnb = True) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_ESTADO = :VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 7;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 9;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;
           IBQGuardar.Transaction.Commit;
           ShowMessage('Proceso de Actualización de Cuenta Finalizado con exito!!!');
        end
        else
        begin
           if (chkATM.Checked or chkPOS.Checked or chkIVR.Checked or chkWEB.Checked or chkMOV.Checked or chkOFI.Checked or chkCNB.Checked) then
           begin
             // Registrar Cuenta
             _Tarjeta := TarjetaDebito;
             if (_Tarjeta.Id = 0) then
             begin
                ShowMessage('No se puede continuar con el proceso, por favor reingrese e intente nuevamente');
                Exit;
             end;
             _vicu_id := ObtenerConsecutivoVirtual(50);
             IBQGuardar.SQL.Clear;
             IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA (VICU_ID, VICU_TIPO_CUENTA, VICU_NUMERO_CUENTA, VICU_DIGITO_CUENTA, VICU_ESTADO, VICU_FECHA_REGISTRO, VICU_ID_AGENCIA, VICU_ESLEIDO) VALUES (');
             IBQGuardar.SQL.Add(':VICU_ID, :VICU_TIPO_CUENTA, :VICU_NUMERO_CUENTA, :VICU_DIGITO_CUENTA, :VICU_ESTADO, :VICU_FECHA_REGISTRO, :VICU_ID_AGENCIA, :VICU_ESLEIDO)');
             IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
             IBQGuardar.ParamByName('VICU_TIPO_CUENTA').AsInteger := IBQCuentas.FieldByName('ID_TIPO_CAPTACION').AsInteger;
             IBQGuardar.ParamByName('VICU_NUMERO_CUENTA').AsInteger := IBQCuentas.FieldByName('NUMERO_CUENTA').AsInteger;
             IBQGuardar.ParamByName('VICU_DIGITO_CUENTA').AsInteger := IBQCuentas.FieldByName('DIGITO_CUENTA').AsInteger;
             IBQGuardar.ParamByName('VICU_ESTADO').AsInteger := 0;
             IBQGuardar.ParamByName('VICU_ESLEIDO').AsInteger := 0;
             IBQGuardar.ParamByName('VICU_FECHA_REGISTRO').AsDateTime := fFechaHoraActual;
             IBQGuardar.ParamByName('VICU_ID_AGENCIA').AsInteger := IBQCuentas.FieldByName('ID_AGENCIA').AsInteger;
             IBQGuardar.ExecSQL;
             IBQGuardar.Close;

             // ATM
             if (chkATM.Checked) then
             begin
                   IBQGuardar.SQL.Clear;
                   IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                   IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                   IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                   IBQGuardar.ParamByName('VICA_ID').AsInteger := 1;
                   IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeATM.Value;
                   IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeATM.Value;
                   IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                   
                   IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                   IBQGuardar.ExecSQL;
                   IBQGuardar.Close;

                   edTarjetaDebito.Text := _Tarjeta.Tarjeta;

                   IBQGuardar.SQL.Clear;
                   IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_TARJETA_CUENTA (VICU_ID, VITA_ID, VITC_FECHAREGISTRO, VITC_ESTADO, VITC_ESLEIDO) VALUES (');
                   IBQGuardar.SQL.Add(':VICU_ID, :VITA_ID, :VITC_FECHAREGISTRO, :VITC_ESTADO, :VITC_ESLEIDO)');
                   IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                   IBQGuardar.ParamByName('VITA_ID').AsInteger := _Tarjeta.Id;
                   IBQGuardar.ParamByName('VITC_FECHAREGISTRO').AsDate := fFechaActual;
                   IBQGuardar.ParamByName('VITC_ESTADO').AsInteger := 0;
                   IBQGuardar.ParamByName('VITC_ESLEIDO').AsInteger := 0;
                   IBQGuardar.ExecSQL;
                   IBQGuardar.Close;

             end;

             // POS
             if (chkPOS.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopePOS.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopePOS.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;

             // IVR
             if (chkIVR.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 3;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;

             // WEB
             if (chkWEB.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 4;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;

             // MOV
             if (chkMOV.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 5;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeMOV.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeMOV.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;

             // OFI
             if (chkOFI.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 6;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeOFI.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeOFI.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;

             // CNB
             if (chkCNB.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESTADO, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESTADO, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 7;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeCNB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeCNB.Value;
                 IBQGuardar.ParamByName('VICC_ESTADO').AsInteger := 0;                 
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;                 
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;
             IBQGuardar.Transaction.Commit;
             ShowMessage('Proceso de Registro de Nueva Cuenta Finalizado con exito!!!');

           end;
        end;
           btnMarcar.Enabled := True;
           btnFormato.Enabled := True;

           btnGrabar.Enabled := False;

           Reubicar;
end;

procedure TfrmAdministracionProductosVirtuales.btnBuscarClick(
  Sender: TObject);
var frmBuscarPersona:TfrmBuscarPersona;
begin
                frmBuscarPersona := TfrmBuscarPersona.Create(self);
                if frmBuscarPersona.ShowModal = mrOk then
                begin
                   CBTiposIdentificacion.KeyValue := frmBuscarPersona.id_identificacion;
                   EdIdentificacion.Text := frmBuscarPersona.id_persona;
                   EdIdentificacion.OnExit(Self);
                end;
                frmBuscarPersona.Free;
end;

procedure TfrmAdministracionProductosVirtuales.btnReasignarClick(
  Sender: TObject);
begin
// No hay evento
end;

procedure TfrmAdministracionProductosVirtuales.FormCreate(Sender: TObject);
begin
       if (not dmGeneral.IBDatabase1.Connected) then
       begin
           ShowMessage('Database Desconectada');
       end;
       dmPersona := TdmPersona.Create(self);
       dmPersona.IBDStiposidentificacion.Database := dmGeneral.IBDatabase1;
       dmPersona.IBDStiposidentificacion.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmAdministracionProductosVirtuales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        if (dmGeneral.IBTransaction1.InTransaction) then
        begin
          dmGeneral.IBTransaction1.Commit;
        end;
end;

procedure TfrmAdministracionProductosVirtuales.btnMarcarClick(
  Sender: TObject);
var
  _nombres, _texto, _nombreA, _nombreB, _nombreC, _nombreD: String;
  _cuenta: String;
  ListOfStrings : TStrings;
begin
        ListOfStrings := TStringList.Create;
        ListOfStrings.Delimiter := ' ';
        _nombres := EdNombres.Text + ' ' + EdPrimerApellido.Text + ' ' + EdSegundoApellido.Text;
        _nombres := TitleCase(_nombres);
        if (Length(_nombres) > 21) then
        begin

          ListOfStrings.DelimitedText := _nombres;
          if (ListOfStrings.Count > 3) then
          begin
             _nombreA := ListOfStrings.Strings[0];
             _nombreB := ListOfStrings.Strings[1];
             _nombreC := ListOfStrings.Strings[2];
             _nombreD := ListOfStrings.Strings[3];
             _nombres := ListOfStrings.Strings[0] + ' ' + ListOfStrings.Strings[1] + ' ' +  ListOfStrings.Strings[2] + ' ' + ListOfStrings.Strings[3];
             if (Length(_nombres) > 23) then
             begin
                 _nombres := _nombreA + ' ' + _nombreB + ' ' + _nombreC + ' ' + _nombreD[1] + '.';
                 if (Length(_nombres) > 24) then
                 begin
                    _nombres := _nombreA + ' ' + _nombreB[1] + '. ' + _nombreC + ' ' + _nombreD[1] + '.';
                    if (Length(_nombres) > 24) then
                    begin
                        _nombres := _nombreA + ' ' + _nombreB[1] + '. ' + _nombreC;
                        if (Length(_nombres) > 24) then
                        begin
                           _nombres := _nombreA +  ' ' + _nombreC;
                           if (Length(_nombres) > 24) then
                           begin
                               _nombres := _nombreA + ' ' + _nombreC[1];
                               if (Length(_nombres) > 24) then
                               begin
                                  _nombres := LeftStr(_nombreA, 24);
                               end;
                           end;
                        end;
                    end;
                 end;
             end;
          end
          else
          if (ListOfStrings.Count > 2) then
          begin
             _nombreA := ListOfStrings.Strings[0];
             _nombreB := ListOfStrings.Strings[1];
             _nombreC := ListOfStrings.Strings[2];
             _nombres := ListOfStrings.Strings[0] + ' ' + ListOfStrings.Strings[1] + ' ' +  ListOfStrings.Strings[2];
             if (Length(_nombres)  > 24) then
             begin
                 _nombres := _nombreA + ' ' + _nombreB + ' ' + _nombreC[1] + '.';
                 if (Length(_nombres) > 24) then
                 begin
                   _nombres := _nombreA + ' ' + _nombreB;
                   if (Length(_nombres) > 24) then
                   begin
                      _nombres := _nombreA +  ' ' + _nombreB[1] + '.';
                      if (Length(_nombres) > 24) then
                      begin
                        _nombres := _nombreA;
                        if (Length(_nombres) > 24) then
                        begin
                          _nombres := LeftStr(_nombreA, 24);
                        end;
                      end;
                   end;
                 end
             end;
          end
          else
          if (ListOfStrings.Count > 1) then
          begin
             _nombreA := ListOfStrings.Strings[0];
             _nombreB := ListOfStrings.Strings[1];
             _nombres := ListOfStrings.Strings[0] + ' ' + ListOfStrings.Strings[1];
             if (Length(_nombres) > 24) then
             begin
               _nombres := _nombreA + ' ' + _nombreB[1] + '.';
               if (Length(_nombres) > 24) then
               begin
                 _nombres := LeftStr(_nombreA, 24);
               end;
             end;
          end
          else
          begin
             _nombreA := _nombres;
          end;
        end;

        _cuenta := Format('%d%0.2d%0.6d%d' , [_vTipo, _vIdAgencia, _vNumero, _vDigito]);

        frReport1.LoadFromFile(frmMain.ruta1 + 'ReportesCap\MarcarPlasticoTD.frf');
        frReport1.Dictionary.Variables.Variable['NOMBRE'] := QuotedStr(_nombres + ' ' + _cuenta);
        if (frReport1.PrepareReport) then
           frReport1.ShowPreparedReport;
end;

procedure TfrmAdministracionProductosVirtuales.btnNuevoClick(
  Sender: TObject);
begin
     if (IBTransaction1.InTransaction) then
        IBQGuardar.Transaction.Commit;
     IBTransaction1.StartTransaction;
     IBQCuentas.Close;
     IBQDireccion.Close;
     IBQCanal.Close;
     IBQTarjeta.Close;
     IBQCaptacion.Close;
     IBQvCuenta.Close;
     IBQCuentaCanal.Close;
     IBQTipoIdentificacion.Close;
     IBQTipoIdentificacion.Open;
     IBQTipoIdentificacion.Last;
     CBTiposIdentificacion.KeyValue := -1;
     EdIdentificacion.Text := '';
     EdPrimerApellido.Text := '';
     EdSegundoApellido.Text := '';
     EdNombres.Text := '';
     edTarjetaDebito.Text := '';
     chkATM.Checked := False;
     chkPOS.Checked := False;
     chkIVR.Checked := False;
     chkWEB.Checked := False;
     chkMOV.Checked := False;
     chkOFI.Checked := False;
     chkCNB.Checked := False;
     edNopeATM.Value := 0;
     edNopePOS.Value := 0;
     edNopeIVR.Value := 0;
     edNopeWEB.Value := 0;
     edNopeMOV.Value := 0;
     edNopeOFI.Value := 0;
     edNopeCNB.Value := 0;
     edTopeATM.Value := 0;
     edTopePOS.Value := 0;
     edTopeIVR.Value := 0;
     edTopeWEB.Value := 0;
     edTopeMOV.Value := 0;
     edTopeOFI.Value := 0;
     edTopeCNB.Value := 0;
     CBTiposIdentificacion.SetFocus;
end;

procedure TfrmAdministracionProductosVirtuales.btnFormatoClick(
  Sender: TObject);
  var
    _direccion, _ciudad_asociado, _telefono: String;
begin

        _direccion := IBQDireccion.FieldByName('DIRECCION').AsString + ' ' + IBQDireccion.FieldByName('BARRIO').AsString;
        _ciudad_asociado := IBQDireccion.FieldByName('MUNICIPIO').AsString;
        _telefono := IBQDireccion.FieldByName('TELEFONO1').AsString;
        frFormatoSolicitudTD.LoadFromFile(frmMain.ruta1 + 'ReportesCap\FormatoSolicitudTarjetaDebito.frf');
        frFormatoSolicitudTD.Dictionary.Variables['OFICINA'] := QuotedStr(Ciudad);
        frFormatoSolicitudTD.Dictionary.Variables['CIUDAD'] := QuotedStr(Ciudad);
        frFormatoSolicitudTD.Dictionary.Variables['FECHA'] := QuotedStr(FormatDateTime('yyyy/MM/dd', fFechaActual));
        frFormatoSolicitudTD.Dictionary.Variables['ASOCIADO'] := QuotedStr(EdNombres.Text + ' ' + EdPrimerApellido.Text + ' ' + EdSegundoApellido.Text);
        frFormatoSolicitudTD.Dictionary.Variables['DOCUMENTO'] := QuotedStr(EdIdentificacion.Text);
        frFormatoSolicitudTD.Dictionary.Variables['CUENTA'] := QuotedStr(Format('%d%0.2d%0.6d%d' , [_vTipo, _vIdAgencia, _vNumero, _vDigito]));
        frFormatoSolicitudTD.Dictionary.Variables['TARJETA'] := QuotedStr(edTarjetaDebito.Text);
        frFormatoSolicitudTD.Dictionary.Variables['DIRECCION'] := QuotedStr(_direccion);
        frFormatoSolicitudTD.Dictionary.Variables['TELEFONO'] := QuotedStr(_telefono);
        frFormatoSolicitudTD.Dictionary.Variables['CIUDAD_ASOCIADO'] := QuotedStr(LeftStr(_ciudad_asociado, 20));
        frFormatoSolicitudTD.Dictionary.Variables['ATM'] := QuotedStr(FormatCurr('$#,##0', edTopeATM.Value));
        frFormatoSolicitudTD.Dictionary.Variables['POS'] := QuotedStr(FormatCurr('$#,##0', edTopePOS.Value));
        frFormatoSolicitudTD.Dictionary.Variables['WEB'] := QuotedStr(FormatCurr('$#,##0', edTopeWEB.Value));
        frFormatoSolicitudTD.Dictionary.Variables['OFI'] := QuotedStr(FormatCurr('$#,##0', edTopeOFI.Value));
        if (frFormatoSolicitudTD.PrepareReport) then
        begin
          frFormatoSolicitudTD.ShowPreparedReport;
        end;
end;

procedure TfrmAdministracionProductosVirtuales.Reubicar;
begin
       _vModificar := False;
       btnReasignar.Checked := False;
       _numero_cuenta := _vNumero;
       btnNuevo.Click;
       CBTiposIdentificacion.KeyValue := _id_identificacion;
       EdIdentificacion.Text := _id_persona;
       EdIdentificacion.OnExit(self);
       IBQCuentas.Locate('NUMERO_CUENTA', VarArrayOf([_numero_cuenta]),  [loCaseInsensitive]);
end;

procedure TfrmAdministracionProductosVirtuales.Ubicar;
begin
        _id_identificacion := CBTiposIdentificacion.KeyValue;
        _id_persona := EdIdentificacion.Text;
        with dmPersona.IBQuery do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$persona" where ');
            SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA"');
            ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
            Open;
            if RecordCount > 0 then
            begin
               EdPrimerApellido.Text  := FieldByName('PRIMER_APELLIDO').AsString;
               EdSegundoApellido.Text := FieldByName('SEGUNDO_APELLIDO').AsString;
               EdNombres.Text := FieldByName('NOMBRE').AsString;
               // Buscar Información de Productos Virtuales

               IBQCuentas.Close;
               IBQCuentas.ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
               IBQCuentas.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
               IBQCuentas.Open;

               IBQDireccion.Close;
               IBQDireccion.ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
               IBQDireccion.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
               IBQDireccion.Open;
            end;
        end;

end;

procedure TfrmAdministracionProductosVirtuales.CBTiposIdentificacionExit(
  Sender: TObject);
begin
        if (not VarIsNull(CBTiposIdentificacion.KeyValue)) then
        begin
                _id_identificacion := CBTiposIdentificacion.KeyValue;
        end;
end;

end.
