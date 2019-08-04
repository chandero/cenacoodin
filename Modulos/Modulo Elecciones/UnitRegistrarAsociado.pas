unit UnitRegistrarAsociado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, IBSQL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdTime, IBDatabase, DB,
  DBCtrls, IBCustomDataSet, IBQuery;

type
  TfrmRegistrarAsociado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdCuenta: TEdit;
    Label2: TLabel;
    EdIdentificacion: TStaticText;
    Panel2: TPanel;
    CmdRegistrar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label3: TLabel;
    EdApellidos: TStaticText;
    EdNombres: TStaticText;
    Label4: TLabel;
    EdFecha: TStaticText;
    Timer1: TTimer;
    IBSQL2: TIBSQL;
    IBT1: TIBTransaction;
    Panel3: TPanel;
    DBImage1: TDBImage;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    CmdOtro: TBitBtn;
    procedure EdCuentaExit(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdRegistrarClick(Sender: TObject);
    procedure EdCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CmdOtroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistrarAsociado: TfrmRegistrarAsociado;
  FechaActual:TDate;
  HoraActual:TDateTime;
implementation

{$R *.dfm}

uses unitdmgeneral,unitglobales;

procedure TfrmRegistrarAsociado.EdCuentaExit(Sender: TObject);
begin
        if EdCuenta.Text = '' then Exit;

        with IBQuery1 do begin
        if Transaction.InTransaction then
           Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('  "gen$habilesinhabilesn".ID_IDENTIFICACION,');
          SQL.Add('  "gen$habilesinhabilesn".ID_PERSONA,');
          SQL.Add('  "gen$habilesinhabilesn".HABIL,');
          SQL.Add('  "gen$habilesinhabilesn".EDUCACION,');
          SQL.Add('  "gen$habilesinhabilesn".APORTES,');
          SQL.Add('  "gen$habilesinhabilesn".DEUDAS,');
          SQL.Add('  "gen$habilesinhabilesn".JURIDICO,');
          SQL.Add('  "gen$habilesinhabilesn".HABILITADA,');
          SQL.Add('  "gen$habilesinhabilesn".YA_VOTO,');
          SQL.Add('  "gen$habilesinhabilesn".FECHA_VOTO,');
          SQL.Add('  "gen$habilesinhabilesn".HORA_VOTO,');
          SQL.Add('  "gen$habilesinhabilesn".VALIDACION,');
          SQL.Add('  "gen$habilesinhabilesn".NUMERO_CUENTA,');
          SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
          SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('  "gen$persona".NOMBRE,');
          SQL.Add('  "gen$persona".FOTO');
          SQL.Add('FROM');
          SQL.Add(' "gen$habilesinhabilesn"');
          SQL.Add(' INNER JOIN "gen$persona" ON ("gen$habilesinhabilesn".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('  AND ("gen$habilesinhabilesn".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add(' WHERE NUMERO_CUENTA = :NUMERO_CUENTA');
          ParamByName('NUMERO_CUENTA').AsString := EdCuenta.Text;
          try
           Open;
           if RecordCount > 0 then
           begin
               EdCuenta.Text  := Format('%.5d',[FieldByName('NUMERO_CUENTA').AsInteger]);
               EdIdentificacion.Caption := FieldByName('ID_PERSONA').AsString;
               EdApellidos.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
               EdNombres.Caption := FieldByName('NOMBRE').AsString;

            if FieldByName('YA_VOTO').AsInteger = 1 then
             begin
               MessageDlg('Asociado ya deposito su voto',mtError,[mbcancel],0);
               CmdRegistrar.Enabled := False;
               Transaction.Commit;
             end
            else
             begin
              if FieldByName('HABIL').AsInteger = 0 then
              begin
               MessageDlg('Asociado no es hábil para votar',mtError,[mbcancel],0);
               CmdRegistrar.Enabled := False;
               Transaction.Commit;
              end
              else
              begin
//               Transaction.Commit;
               CmdRegistrar.Enabled := True;
              end;
             end
            end
           else
             begin
               MessageDlg('Asociado no Figura',mtError,[mbcancel],0);
               Transaction.Commit;
               CmdRegistrar.Enabled := False;
             end;
          except
             MessageDlg('Error al Buscar Asociado',mtError,[mbcancel],0);
             Exit;
          end;
        end;

end;

procedure TfrmRegistrarAsociado.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmRegistrarAsociado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        entertabs(Key,Self);
end;

procedure TfrmRegistrarAsociado.CmdRegistrarClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Registrar este Asociado',mtConfirmation,[mbyes,mbNo],0) <> mrYES then
          begin
            EdIdentificacion.Caption := '';
            EdCuenta.Text := '';
            EdApellidos.Caption := '';
            EdNombres.Caption := '';
            CmdRegistrar.Enabled := False;
            Exit;
          end;

        with IBSQL2 do begin
        if Transaction.InTransaction then
           Transaction.Rollback;

          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('Update "gen$habilesinhabilesn" Set YA_VOTO = 1, FECHA_VOTO = :FECHA, HORA_VOTO = :HORA, VALIDACION = :VALIDACION Where');
          SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA');
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCuenta.Text);
          ParamByName('FECHA').AsDate := FechaActual;
          ParamByName('HORA').AsTime := HoraActual;
          ParamByName('VALIDACION').AsString := dbalias;
          try
           ExecQuery;
           Transaction.Commit;
           MessageDlg('Asociado Registrado con exito!',mtInformation,[mbok],0);
          except
           MessageDlg('Error al Actualizar Registro',mtError,[mbcancel],0);
           Transaction.Rollback;
          end;
        end;

        IBQuery1.Transaction.Commit;

        EdIdentificacion.Caption := '';
        EdCuenta.Text := '';
        EdApellidos.Caption := '';
        EdNombres.Caption := '';

end;

procedure TfrmRegistrarAsociado.EdCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if not (Key in ['0'..'9',#13,#8]) then
          Key := #0;
end;

procedure TfrmRegistrarAsociado.Timer1Timer(Sender: TObject);
var Fecha:TDateTime;
begin

        with IBSQL2 do begin
        if Transaction.InTransaction then
          Transaction.Rollback;
        Transaction.StartTransaction;
        SQL.Clear;
        SQL.Add('select FECHA from SP_FECHA_ACTUAL');
        try
         ExecQuery;
         FechaActual := FieldByName('FECHA').AsDate;
         Close;
        except
         Transaction.Rollback;
         raise;
         Exit;
        end;

        SQL.Clear;
        SQL.Add('select HORA from SP_HORA_ACTUAL');
        try
         ExecQuery;
         HoraActual := FieldByName('HORA').AsTime;
         Close;
        except
         Transaction.Rollback;
         raise;
         Exit;
        end;
        end;
        EdFecha.Caption := DateToStr(FechaActual)+' '+TimeToStr(HoraActual);

end;

procedure TfrmRegistrarAsociado.FormShow(Sender: TObject);
begin
        Timer1Timer(Sender);
end;

procedure TfrmRegistrarAsociado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        if IBT1.InTransaction then
           IBT1.Commit;
        if IBTransaction1.InTransaction then
           IBTransaction1.Commit;
end;

procedure TfrmRegistrarAsociado.CmdOtroClick(Sender: TObject);
begin
        if IBQuery1.Transaction.InTransaction then
          IBQuery1.Transaction.Commit;

        EdIdentificacion.Caption := '';
        EdCuenta.Text := '';
        EdApellidos.Caption := '';
        EdNombres.Caption := '';

        CmdRegistrar.Enabled := False;
        EdCuenta.SetFocus;

end;

end.
