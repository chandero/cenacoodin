unit UnitAsignacionAbogado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, DB, IBDatabase, IBCustomDataSet,
  IBQuery, IBSQL, Buttons, UnitDmGeneral;

type
  TfrmAsignacionAbogado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdColocacion: TEdit;
    Label2: TLabel;
    EdAsociado: TStaticText;
    Label3: TLabel;
    EdEstado: TStaticText;
    DBLCBAbogado: TDBLookupComboBox;
    Label4: TLabel;
    IBSQL1: TIBSQL;
    IBQAbogados: TIBQuery;
    IBTransaction1: TIBTransaction;
    DSAbogados: TDataSource;
    cmdActualizar: TBitBtn;
    cmdCerrar: TBitBtn;
    IBQAbogadosPRIMER_APELLIDO: TIBStringField;
    IBQAbogadosSEGUNDO_APELLIDO: TIBStringField;
    IBQAbogadosNOMBRE: TIBStringField;
    IBQAbogadosID_IDENTIFICACION: TSmallintField;
    IBQAbogadosID_PERSONA: TIBStringField;
    IBQAbogadosID_ABOGADO: TSmallintField;
    IBSQL2: TIBSQL;
    cmdBuscar: TBitBtn;
    procedure IBQAbogadosNOMBRECOMPLETOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cmdCerrarClick(Sender: TObject);
    procedure EdColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EdColocacionExit(Sender: TObject);
    procedure IBQAbogadosNOMBREGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cmdActualizarClick(Sender: TObject);
    procedure cmdBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAsignacionAbogado: TfrmAsignacionAbogado;
  dmGeneral: TdmGeneral;
  vmodificar:Boolean;
implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmAsignacionAbogado.IBQAbogadosNOMBRECOMPLETOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Trim(IBQAbogadosNOMBRE.AsString + ' ' + IBQAbogadosPRIMER_APELLIDO.AsString + ' ' + IBQAbogadosSEGUNDO_APELLIDO.AsString);
end;

procedure TfrmAsignacionAbogado.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmAsignacionAbogado.EdColocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmAsignacionAbogado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmAsignacionAbogado.Inicializar;
begin
        with IBQAbogados do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
        end;
end;

procedure TfrmAsignacionAbogado.FormShow(Sender: TObject);
begin
        inicializar;
end;

procedure TfrmAsignacionAbogado.EdColocacionExit(Sender: TObject);
var vabogado:Integer;
begin
        with IBSQL1 do begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('select "col$colocacion".ID_COLOCACION,"col$estado".DESCRIPCION_ESTADO_COLOCACION,"col$estado".ES_JURIDICO,"col$estado".ES_CASTIGADO,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "col$colocacion"');
           SQL.Add('inner join "col$estado" on ("col$estado".ID_ESTADO_COLOCACION = "col$colocacion".ID_ESTADO_COLOCACION)');
           SQL.Add('inner join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
           SQL.Add('"col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('where "col$colocacion".ID_AGENCIA = :ID_AGENCIA and "col$colocacion".ID_COLOCACION = :ID_COLOCACION');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Trim(EdColocacion.Text);
           try
            ExecQuery;
            if RecordCount > 0 then begin
               if (FieldByName('ES_CASTIGADO').AsInteger = 0) and
                  (FieldByName('ES_JURIDICO').AsInteger = 0 ) then begin
                  Transaction.Commit;
                  MessageDlg('Colocación no esta en cobro jurídico'+#13+
                             'no es necesario asignarle un abogado',mtInformation,[mbok],0);
                  Exit;
               end;
               EdAsociado.Caption := Trim(FieldByName('NOMBRE').AsString + ' ' +
                                          FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                          FieldByName('SEGUNDO_APELLIDO').AsString);
               EdEstado.Caption := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
               Transaction.Commit;
            end
            else
            begin
               Transaction.Commit;
               MessageDlg('Esa Colocación no Existe',mtInformation,[mbok],0);
               Exit;
            end;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;

        with IBSQL1 do begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('select "col$colocacionabogado".ID_ABOGADO,"col$colocacionabogado".ID_IDENTIFICACION,"col$colocacionabogado".ID_PERSONA from');
           SQL.Add('"col$colocacionabogado" where "col$colocacionabogado".ID_AGENCIA = :ID_AGENCIA and ');
           SQL.Add('"col$colocacionabogado".ID_COLOCACION = :ID_COLOCACION');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Trim(EdColocacion.Text);
           try
            ExecQuery;
            if RecordCount > 0 then begin
               vmodificar := True;
               vabogado := FieldByName('ID_ABOGADO').AsInteger;
            end
            else
               vmodificar := False;
            Transaction.Commit;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;
        IBQAbogados.Open;
        IBQAbogados.Last;
        if vmodificar then
          DBLCBAbogado.KeyValue := vabogado;
end;

procedure TfrmAsignacionAbogado.IBQAbogadosNOMBREGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        Text := Trim(IBQAbogadosNOMBRE.AsString + ' ' +
                IBQAbogadosPRIMER_APELLIDO.AsString + ' ' +
                IBQAbogadosSEGUNDO_APELLIDO.AsString);
end;

procedure TfrmAsignacionAbogado.cmdActualizarClick(Sender: TObject);
begin
        if trim(EdColocacion.Text) = '' then
        begin
           MessageDlg('Favor digitar la colocación',mtInformation,[mbok],0);
           Exit;
        end;

        if DBLCBAbogado.KeyValue < 0 then
        begin
           MessageDlg('Favor seleccionar un Abogado',mtInformation,[mbok],0);
           Exit;
        end;

        if MessageDlg('Seguro de Actualizar?',mtConfirmation,[mbyes,mbno],0) = mrno then Exit;

        with IBSQL1 do begin
          Close;
          if Transaction.InTransaction then Transaction.Commit;
          Transaction.StartTransaction;
          IBSQL2.Close;
          IBSQL2.SQL.Clear;
          IBSQL2.SQL.Add('select * from "gen$abogados" where ID_ABOGADO = :ID_ABOGADO');
          IBSQL2.ParamByName('ID_ABOGADO').AsInteger := DBLCBAbogado.KeyValue;
          try
           IBSQL2.ExecQuery;
          except
           Transaction.Rollback;
           raise;
           Exit;
          end;

          SQL.Clear;
          if vmodificar then begin
             SQL.Add('update "col$colocacionabogado" set');
             SQL.Add('ID_ABOGADO = :ID_ABOGADO,');
             SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION,');
             SQL.Add('ID_PERSONA = :ID_PERSONA');
             SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
          end
          else
          begin
             SQL.Add('insert into "col$colocacionabogado" (ID_AGENCIA,ID_COLOCACION,');
             SQL.Add('ID_ABOGADO,ID_IDENTIFICACION,ID_PERSONA) values (');
             SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:ID_ABOGADO,:ID_IDENTIFICACION,:ID_PERSONA)');
          end;

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := Trim(EdColocacion.Text);
          ParamByName('ID_ABOGADO').AsInteger := DBLCBAbogado.KeyValue;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString := IBSQL2.FieldByName('ID_PERSONA').AsString;

          try
           ExecQuery;
           Transaction.Commit;
           vmodificar := True;
           MessageDlg('Abogado Actualizado con Exito!',mtInformation,[mbok],0);
          except
           Transaction.Rollback;
           raise;
          end;
       end;
end;

procedure TfrmAsignacionAbogado.cmdBuscarClick(Sender: TObject);
begin
        EdColocacion.Text := '';
        EdEstado.Caption := '';
        EdAsociado.Caption := '';
        DBLCBAbogado.KeyValue := -1;
end;

procedure TfrmAsignacionAbogado.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBQAbogados.Database := dmGeneral.IBDatabase1;
        IBQAbogados.Transaction := dmGeneral.IBTransaction1;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
end;

procedure TfrmAsignacionAbogado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

end.
