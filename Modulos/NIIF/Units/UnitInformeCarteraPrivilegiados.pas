unit UnitInformeCarteraPrivilegiados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, JvLabel, JvBlinkingLabel, DBClient,
  DBCtrls, IBSQL, UnitDmGeneral;

type
  TfrmInformeCarteraPrivilegiados = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    GroupBox5: TGroupBox;
    Todos: TRadioButton;
    Definido: TRadioButton;
    Label1: TLabel;
    IBQuery2: TClientDataSet;
    IBQuery2ID_AGENCIA: TIntegerField;
    IBQuery2ID_COLOCACION: TStringField;
    IBQuery2FECHA_CAPITAL: TDateField;
    IBQuery2FECHA_INTERES: TDateField;
    IBQuery2SALDO: TCurrencyField;
    IBQuery2ID_IDENTIFICACION: TIntegerField;
    DBLCBPrivilegiado: TDBLookupComboBox;
    DSPrivilegiado: TDataSource;
    IBPrivilegiado: TIBQuery;
    IBQuery2ID_PERSONA: TStringField;
    IBQuery2ID_IDENTIFICACION_PRIV: TIntegerField;
    IBQuery2ID_PERSONA_PRIV: TStringField;
    IBQuery2ASOCIADO: TStringField;
    IBQuery2PRIVILEGIADO: TStringField;
    IBQuery2ESTADO: TStringField;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBQuery2CLASIFICACION: TStringField;
    InformeDiario: TprTxReport;
    procedure CmdAceptarClick(Sender: TObject);
    procedure EdFechaInformeKeyPress(Sender: TObject; var Key: Char);
    procedure CmdAceptarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdEmpleadoExit(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DefinidoClick(Sender: TObject);
    procedure DBLCBPrivilegiadoExit(Sender: TObject);
    procedure GroupBox5Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Empleado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeCarteraPrivilegiados: TfrmInformeCarteraPrivilegiados;
  dmGeneral: TdmGeneral;
  FechaInforme : TDate;
  Usuario : string;
  AliasUsuario : string;

implementation

{$R *.dfm}

uses  UnitGlobales, UnitVistaPreliminar;

procedure TfrmInformeCarteraPrivilegiados.CmdAceptarClick(Sender: TObject);
var
frmVistaPreliminar:TfrmVistaPreliminar;
IDPrivilegiado : String;
begin
        CmdAceptar.Enabled := False;
        Empleado;
        If DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        IDPrivilegiado := '';
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT "gen$persona".NOMBRE, "gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$privilegiados".ID_IDENTIFICACION_PRIV, "gen$privilegiados".ID_PERSONA_PRIV');
          SQL.Add('FROM "gen$privilegiados" INNER JOIN "gen$persona" ON ("gen$privilegiados".ID_IDENTIFICACION_PRIV="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("gen$privilegiados".ID_PERSONA_PRIV="gen$persona".ID_PERSONA)');
          if Definido.Checked then begin
            SQL.Add('where "gen$privilegiados".ID_PERSONA_PRIV = :ID_PERSONA_PRIV');
            ParamByName('ID_PERSONA_PRIV').AsString := AliasUsuario;
          end;
          Open;

          while not Eof do begin
            IBSQL1.Close;
            IBSQL1.ParamByName('ID_IDENTIFICACION_PRIV').AsInteger := FieldByName('ID_IDENTIFICACION_PRIV').AsInteger;
            IBSQL1.ParamByName('ID_PERSONA_PRIV').AsString := FieldByName('ID_PERSONA_PRIV').AsString;
            IBSQL1.ExecQuery;

            while not IBSQL1.Eof do begin
              IBQuery2.Append;
              IBQuery2.FieldByName('ID_AGENCIA').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.FieldByName('ID_COLOCACION').AsString := IBSQL1.FieldByName('ID_COLOCACION').AsString;
              IBQuery2.FieldByName('ID_IDENTIFICACION_PRIV').AsInteger := FieldByName('ID_IDENTIFICACION_PRIV').AsInteger;
              IBQuery2.FieldByName('ID_PERSONA_PRIV').AsString := FieldByName('ID_PERSONA_PRIV').AsString;
              IBQuery2.FieldByName('PRIVILEGIADO').AsString := FieldByName('NOMBRE').AsString + ' ' +
                                                               FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                               FieldByName('SEGUNDO_APELLIDO').AsString;
              IBQuery2.FieldByName('ID_IDENTIFICACION').AsInteger := IBSQL1.FieldByName('ID_IDENTIFICACION').AsInteger;
              IBQuery2.FieldByName('ID_PERSONA').AsString := IBSQL1.FieldByName('ID_PERSONA').AsString;
              IBQuery2.FieldByName('ASOCIADO').AsString := IBSQL1.FieldByName('NOMBRE').AsString + ' ' +
                                                           IBSQL1.FieldByName('PRIMER_APELLIDO').AsString +  ' ' +
                                                           IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString;
              IBQuery2.FieldByName('SALDO').AsCurrency := IBSQL1.FieldByName('SALDO').AsCurrency;
              IBQuery2.FieldByName('FECHA_CAPITAL').AsDateTime := IBSQL1.FieldByName('FECHA_CAPITAL').AsDateTime;
              IBQuery2.FieldByName('FECHA_INTERES').AsDateTime := IBSQL1.FieldByName('FECHA_INTERES').AsDateTime ;
              IBQuery2.FieldByName('ESTADO').AsString := IBSQL1.FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
              IBQuery2.FieldByName('CLASIFICACION').AsString := IBSQL1.FieldByName('DESCRIPCION_CLASIFICACION').AsString;
              IBQuery2.Post;
              IBSQL1.Next;
            end;


            IBSQL2.Close;
            IBSQL2.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA_PRIV').AsString;
            IBSQL2.ExecQuery;
            while not IBSQL2.Eof do begin
                   try
                     IBQuery2.Append;
                     IBQuery2.FieldByName('ID_AGENCIA').AsInteger := IBSQL2.FieldByName('ID_AGENCIA').AsInteger;
                     IBQuery2.FieldByName('ID_COLOCACION').AsString := IBSQL2.FieldByName('ID_COLOCACION').AsString;
                     IBQuery2.FieldByName('ID_IDENTIFICACION_PRIV').AsInteger := FieldByName('ID_IDENTIFICACION_PRIV').AsInteger;
                     IBQuery2.FieldByName('ID_PERSONA_PRIV').AsString := FieldByName('ID_PERSONA_PRIV').AsString;
                     IBQuery2.FieldByName('PRIVILEGIADO').AsString := FieldByName('NOMBRE').AsString + ' ' +
                                                                      FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                                      FieldByName('SEGUNDO_APELLIDO').AsString;
                     IBQuery2.FieldByName('ID_IDENTIFICACION').AsInteger := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
                     IBQuery2.FieldByName('ID_PERSONA').AsString := IBSQL2.FieldByName('ID_PERSONA').AsString;
                     IBQuery2.FieldByName('ASOCIADO').AsString := IBSQL2.FieldByName('NOMBRE').AsString + ' ' +
                                                                  IBSQL2.FieldByName('PRIMER_APELLIDO').AsString +  ' ' +
                                                                  IBSQL2.FieldByName('SEGUNDO_APELLIDO').AsString;
                     IBQuery2.FieldByName('SALDO').AsCurrency := IBSQL2.FieldByName('SALDO').AsCurrency;
                     IBQuery2.FieldByName('FECHA_CAPITAL').AsDateTime := IBSQL2.FieldByName('FECHA_CAPITAL').AsDateTime;
                     IBQuery2.FieldByName('FECHA_INTERES').AsDateTime := IBSQL2.FieldByName('FECHA_INTERES').AsDateTime ;
                     IBQuery2.FieldByName('ESTADO').AsString := IBSQL2.FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                     IBQuery2.FieldByName('CLASIFICACION').AsString := IBSQL2.FieldByName('DESCRIPCION_CLASIFICACION').AsString;
                     IBQuery2.Post;
                   except
                     IBQuery2.Cancel;
                   end;
                   IBSQL2.Next;
                 end;
//               end;
             Next;
           end;
        end;


        InformeDiario.Variables.ByName['Empresa'].AsString := Empresa;
        InformeDiario.Variables.ByName['Nit'].AsString := Nit;
        InformeDiario.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
        if Todos.Checked then
           InformeDiario.Variables.ByName['usuario'].AsString := 'Todos'
        else
           InformeDiario.Variables.ByName['usuario'].AsString := Usuario;
        InformeDiario.Variables.ByName['Hoy'].AsDateTime := FechaInforme;

        If InformeDiario.PrepareReport then
         begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := InformeDiario;
           frmVistaPreliminar.ShowModal;
         end;
       ibquery2.EmptyDataSet;
       IBSQL2.Close;
end;

procedure TfrmInformeCarteraPrivilegiados.Empleado;
begin
        with IBQuery do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + '   ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
         end;
end;

procedure TfrmInformeCarteraPrivilegiados.EdFechaInformeKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCarteraPrivilegiados.CmdAceptarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCarteraPrivilegiados.CmdCerrarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCarteraPrivilegiados.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmInformeCarteraPrivilegiados.FormShow(Sender: TObject);
begin
        with IBPrivilegiado do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
        end;
end;

procedure TfrmInformeCarteraPrivilegiados.EdEmpleadoExit(Sender: TObject);
begin
        with  IBQuery do begin
         Close;
         SQL.Clear;
         SQL.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE');
         SQL.Add('from "gen$empleado" where ID_EMPLEADO = :"ID_EMPLEADO"');
         ParamByName('ID_EMPLEADO').AsString := AliasUsuario;
         Open;
         Usuario := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                    FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                    FieldByName('NOMBRE').AsString;
         Close;
        end;
end;

procedure TfrmInformeCarteraPrivilegiados.TodosClick(Sender: TObject);
begin
        if Todos.Checked then
         begin
           CmdAceptar.Enabled := True;
           Label1.Visible := False;
           IBPrivilegiado.Close;
           DBLCBPrivilegiado.Visible := False;
           Usuario := '';
           AliasUsuario := '';
//           definidoclick(Sender);
         end;      
end;

procedure TfrmInformeCarteraPrivilegiados.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCarteraPrivilegiados.DefinidoClick(Sender: TObject);
begin
      if Definido.Checked then
       begin
         CmdAceptar.Enabled := True;
         Label1.Visible := True;
         DBLCBPrivilegiado.Visible := True;
         IBPrivilegiado.Open;
//         DBLCBPrivilegiado.SetFocus;
//         todosclick(Sender);
       end;
end;

procedure TfrmInformeCarteraPrivilegiados.DBLCBPrivilegiadoExit(
  Sender: TObject);
begin
        if Definido.Checked = True then
          AliasUsuario := DBLCBPrivilegiado.KeyValue;
end;

procedure TfrmInformeCarteraPrivilegiados.GroupBox5Exit(Sender: TObject);
begin
        if (Todos.Checked = True) or (Definido.Checked = True) then
          CmdAceptar.Enabled := True;
end;

procedure TfrmInformeCarteraPrivilegiados.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBPrivilegiado.Database := dmGeneral.IBDatabase1;

        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBSQL2.Transaction := dmGeneral.IBTransaction1;
        IBPrivilegiado.Transaction := dmGeneral.IBTransaction1;


end;

procedure TfrmInformeCarteraPrivilegiados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

end.
