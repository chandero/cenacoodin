unit UnitAdministracionProductosVirtuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Buttons, JvEdit, JvTypedEdit,
  Grids, DBGrids, DB, IBCustomDataSet, IBQuery, UnitDmGeneral, UnitDmPersona, UnitGlobales;

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
    btnReasignar: TBitBtn;
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
    procedure CmdCerrarClick(Sender: TObject);
    procedure EdIdentificacionExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBQCuentasAfterScroll(DataSet: TDataSet);
    procedure btnGrabarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnReasignarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
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

  _Reasignar: Boolean;
  _vita_id: Integer;
  _vVicu_id: Integer;

implementation

{$R *.dfm}

uses IBDatabase, UnitBuscarPersona;

procedure TfrmAdministracionProductosVirtuales.CmdCerrarClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmAdministracionProductosVirtuales.EdIdentificacionExit(Sender: TObject);
begin
        vIdentificacion := EdIdentificacion.Text;
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

            end;
        end;

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
       _Reasignar := False;
end;

procedure TfrmAdministracionProductosVirtuales.IBQCuentasAfterScroll(
  DataSet: TDataSet);
begin
        // Buscar información conectada
        _vIdAgencia := DataSet.FieldByName('ID_AGENCIA').AsInteger;
        _vTipo      := DataSet.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        _vNumero    := DataSet.FieldByName('NUMERO_CUENTA').AsInteger;
        _vDigito    := DataSet.FieldByName('DIGITO_CUENTA').AsInteger;
        IBQCanal.Close;
        IBQCanal.ParamByName('ID_AGENCIA').AsInteger := DataSet.FieldByName('ID_AGENCIA').AsInteger;
        IBQCanal.ParamByName('ID_TIPO_CAPTACION').AsInteger := DataSet.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        IBQCanal.ParamByName('NUMERO_CUENTA').AsInteger := DataSet.FieldByName('NUMERO_CUENTA').AsInteger;
        IBQCanal.ParamByName('DIGITO_CUENTA').AsInteger := DataSet.FieldByName('DIGITO_CUENTA').AsInteger;
        IBQCanal.Open;

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


        if (IBQTarjeta.RecordCount > 0) then
        begin
          edTarjetaDebito.Text := IBQTarjeta.FieldByName('VITA_TARJETA').AsString;
          _vita_id := IBQTarjeta.FieldByName('VITA_ID').AsInteger;
          btnReasignar.Enabled := True;
          _Atm := True;
        end
        else
        begin
          edTarjetaDebito.Text := '';
          btnReasignar.Enabled := False;
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



        while not IBQCanal.Eof do
        begin
          _vModificar := True;
          btnGrabar.Caption := 'Actualizar';
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 1) then
          begin
              chkATM.Checked := True;
              edNopeATM.Value := IBQCanal.FieldByName('VICC_NOPE').AsInteger;
              edTopeATM.Value := IBQCanal.FieldByName('VICC_MONTO').AsCurrency;
              _Atm := True;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 2) then
          begin
              chkPOS.Checked := True;
              edNopePOS.Value := IBQCanal.FieldByName('VICC_NOPE').AsInteger;
              edTopePOS.Value := IBQCanal.FieldByName('VICC_MONTO').AsCurrency;
              _Pos := True;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 3) then
          begin
              chkIVR.Checked := True;
              edNopeIVR.Value := IBQCanal.FieldByName('VICC_NOPE').AsInteger;
              edTopeIVR.Value := IBQCanal.FieldByName('VICC_MONTO').AsCurrency;
              _Ivr := True;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 4) then
          begin
              chkWEB.Checked := True;
              edNopeWEB.Value := IBQCanal.FieldByName('VICC_NOPE').AsInteger;
              edTopeWEB.Value := IBQCanal.FieldByName('VICC_MONTO').AsCurrency;
              _Web := True;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 5) then
          begin
              chkMOV.Checked := True;
              edNopeMOV.Value := IBQCanal.FieldByName('VICC_NOPE').AsInteger;
              edTopeMOV.Value := IBQCanal.FieldByName('VICC_MONTO').AsCurrency;
              _Mov := True;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 6) then
          begin
              chkOFI.Checked := True;
              edNopeOFI.Value := IBQCanal.FieldByName('VICC_NOPE').AsInteger;
              edTopeOFI.Value := IBQCanal.FieldByName('VICC_MONTO').AsCurrency;
              _Ofi := True;
          end;
          if (IBQCanal.FieldByName('VICA_ID').AsInteger = 7) then
          begin
              chkCNB.Checked := True;
              edNopeCNB.Value := IBQCanal.FieldByName('VICC_NOPE').AsInteger;
              edTopeCNB.Value := IBQCanal.FieldByName('VICC_MONTO').AsCurrency;
              _Cnb := True;
          end;
          IBQCanal.Next;
        end;
        

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
                   IBQGuardar.SQL.Clear;
                   IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                   IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                   IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                   IBQGuardar.ParamByName('VICA_ID').AsInteger := 1;
                   IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeATM.Value;
                   IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeATM.Value;
                   IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                   IBQGuardar.ExecSQL;
                   IBQGuardar.Close;

                   _Tarjeta := TarjetaDebito;
                   edTarjetaDebito.Text := _Tarjeta.Tarjeta;

                   IBQGuardar.SQL.Clear;
                   IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_TARJETA_CUENTA (VICU_ID, VITA_ID, VITC_ESTADO, VITC_ESLEIDO) VALUES (');
                   IBQGuardar.SQL.Add(':VICU_ID, :VITA_ID, :VITC_ESTADO)');
                   IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                   IBQGuardar.ParamByName('VITA_ID').AsInteger := _Tarjeta.Id;
                   IBQGuardar.ParamByName('VITC_ESTADO').AsInteger := 0;
                   IBQGuardar.ParamByName('VITC_ESLEIDO').AsInteger := 0;
                   IBQGuardar.ExecSQL;
                   IBQGuardar.Close;
              end
              else
              begin
                   IBQGuardar.SQL.Clear;
                   IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                   IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                   IBQGuardar.ParamByName('VICA_ID').AsInteger := 1;
                   IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeATM.Value;
                   IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeATM.Value;
                   IBQGuardar.ExecSQL;
                   IBQGuardar.Close;

                   if (_Reasignar = True) then
                   begin
                     IBQGuardar.SQL.Clear;
                     IBQGuardar.SQL.Add('UPDATE VIRTUAL_TARJETA_CUENTA SET VITC_ESTADO = :VITC_ESTADO, VITC_ESLEIDO = :VITC_ESLEIDO WHERE VITA_ID = :VITA_ID');
                     IBQGuardar.ParamByName('VITC_ESTADO').AsInteger := 9;
                     IBQGuardar.ParamByName('VITC_ESLEIDO').AsInteger := 0;
                     IBQGuardar.ParamByName('VITA_ID').AsInteger := _vita_id;
                     IBQGuardar.ExecSQL;
                     IBQGuardar.Close;

                     _Tarjeta := TarjetaDebito;
                     edTarjetaDebito.Text := _Tarjeta.Tarjeta;

                     IBQGuardar.SQL.Clear;
                     IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_TARJETA_CUENTA (VICU_ID, VITA_ID, VITC_ESTADO, VITC_ESLEIDO) VALUES (');
                     IBQGuardar.SQL.Add(':VICU_ID, :VITA_ID, :VITC_ESTADO, :VITC_ESLEIDO)');
                     IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                     IBQGuardar.ParamByName('VITA_ID').AsInteger := _Tarjeta.Id;
                     IBQGuardar.ParamByName('VITC_ESTADO').AsInteger := 0;
                     IBQGuardar.ParamByName('VITC_ESLEIDO').AsInteger := 0;
                     IBQGuardar.ExecSQL;
                     IBQGuardar.Close;
                   end;
              end;
             end;

             if (chkATM.Checked = False) then
             begin
                if (_Atm = True) then
                begin
                     IBQGuardar.SQL.Clear;
                     IBQGuardar.SQL.Add('UPDATE VIRTUAL_TARJETA_CUENTA SET VITC_ESTADO = :VITC_ESTADO, VITC_ESTADO = :VITC_ESTADO WHERE VITA_ID = :VITA_ID');
                     IBQGuardar.ParamByName('VITC_ESTADO').AsInteger := 9;
                     IBQGuardar.ParamByName('VITC_ESLEIDO').AsInteger := 0;
                     IBQGuardar.ParamByName('VITA_ID').AsInteger := _vita_id;
                     IBQGuardar.ExecSQL;
                     IBQGuardar.Close;
                end;
             end;
             // POS
             if (chkPOS.Checked) then
             begin
               if (_Pos = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopePOS.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopePOS.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID and VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopePOS.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopePOS.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkPOS.Checked = False) then
             begin
               if (_Pos = True) then
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
               if (_Ivr = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 3;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 3;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkIVR.Checked = False) then
             begin
               if (_Ivr = True) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_ESTADO := VICC_ESTADO, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
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
               if (_Web = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 4;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 4;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkWEB.Checked = False) then
             begin
               if ( _Web = True ) then
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
               if (_Mov = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 5;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 5;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkMOV.Checked = False) then
             begin
               if (_Mov = True) then
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
               if (_Ofi = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 6;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 6;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkOfi.Checked = False) then
             begin
               if (_Ofi = True) then
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
               if (_Cnb = False) then
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 7;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end
               else
               begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_MONTO = :VICC_MONTO, VICC_NOPE = :VICC_NOPE, VICC_ESLEIDO = :VICC_ESLEIDO WHERE VICU_ID = :VICU_ID AND VICA_ID = :VICA_ID');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vVicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 7;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
               end;
             end;

             if (chkCnb.Checked = False) then
             begin
               if (_Cnb = True) then
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
           btnGrabar.Enabled := False;
           ShowMessage('Proceso de Actualización de Cuenta Finalizado con exito!!!');
        end
        else
        begin
           if (chkATM.Checked or chkPOS.Checked or chkIVR.Checked or chkWEB.Checked or chkMOV.Checked or chkOFI.Checked or chkCNB.Checked) then
           begin
             // Registrar Cuenta
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
                   IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                   IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                   IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                   IBQGuardar.ParamByName('VICA_ID').AsInteger := 1;
                   IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeATM.Value;
                   IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeATM.Value;
                   IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                   IBQGuardar.ExecSQL;
                   IBQGuardar.Close;

                   _Tarjeta := TarjetaDebito;
                   edTarjetaDebito.Text := _Tarjeta.Tarjeta;

                   IBQGuardar.SQL.Clear;
                   IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_TARJETA_CUENTA (VICU_ID, VITA_ID, VITC_ESTADO, VITC_ESLEIDO) VALUES (');
                   IBQGuardar.SQL.Add(':VICU_ID, :VITA_ID, :VITC_ESTADO, :VITC_ESLEIDO)');
                   IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                   IBQGuardar.ParamByName('VITA_ID').AsInteger := _Tarjeta.Id;
                   IBQGuardar.ParamByName('VITC_ESTADO').AsInteger := 0;
                   IBQGuardar.ParamByName('VITC_ESLEIDO').AsInteger := 0;
                   IBQGuardar.ExecSQL;
                   IBQGuardar.Close;

             end;

             // POS
             if (chkPOS.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopePOS.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopePOS.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;

             // IVR
             if (chkIVR.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeIVR.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;

             // WEB
             if (chkWEB.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeWEB.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;

             // MOV
             if (chkMOV.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeMOV.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeMOV.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;

             // OFI
             if (chkOFI.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeOFI.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeOFI.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;

             // CNB
             if (chkCNB.Checked) then
             begin
                 IBQGuardar.SQL.Clear;
                 IBQGuardar.SQL.Add('INSERT INTO VIRTUAL_CUENTA_CANAL (VICU_ID, VICA_ID, VICC_MONTO, VICC_NOPE, VICC_ESLEIDO) VALUES (');
                 IBQGuardar.SQL.Add(':VICU_ID, :VICA_ID, :VICC_MONTO, :VICC_NOPE, :VICC_ESLEIDO)');
                 IBQGuardar.ParamByName('VICU_ID').AsInteger := _vicu_id;
                 IBQGuardar.ParamByName('VICA_ID').AsInteger := 2;
                 IBQGuardar.ParamByName('VICC_MONTO').AsCurrency := edTopeCNB.Value;
                 IBQGuardar.ParamByName('VICC_NOPE').AsInteger := edNopeCNB.Value;
                 IBQGuardar.ParamByName('VICC_ESLEIDO').AsInteger := 0;                 
                 IBQGuardar.ExecSQL;
                 IBQGuardar.Close;
             end;
           end;
           IBQGuardar.Transaction.Commit;
           btnGrabar.Enabled := False;
           ShowMessage('Proceso de Registro de Nueva Cuenta Finalizado con exito!!!');
        end;
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
        _Reasignar := True;
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

end.
