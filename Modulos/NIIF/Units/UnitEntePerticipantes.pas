unit UnitEntePerticipantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, UnitMain, StdCtrls, Buttons,
  IBCustomDataSet, IBQuery, DBCtrls, IBDatabase, JvStaticText, UnitDmGeneral;

type
  TFrmEnteParticipantes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Nombre: TEdit;
    Cargo: TEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel4: TPanel;
    Label4: TLabel;
    DataSource2: TDataSource;
    DBente: TDBLookupComboBox;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    Label5: TLabel;
    fecha: TJvStaticText;
    Label6: TLabel;
    EDacta: TEdit;
    Invitado: TCheckBox;
    IBQuery2: TIBQuery;
    procedure NombreKeyPress(Sender: TObject; var Key: Char);
    procedure CargoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBenteExit(Sender: TObject);
    procedure DBenteEnter(Sender: TObject);
    procedure DBenteKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure InvitadoKeyPress(Sender: TObject; var Key: Char);
    procedure EDactaExit(Sender: TObject);
    procedure EDactaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEnteParticipantes: TFrmEnteParticipantes;
  dmGeneral: TdmGeneral;

implementation
uses UnitGlobales, UnitDmSolicitud;

{$R *.dfm}

procedure TFrmEnteParticipantes.NombreKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmEnteParticipantes.CargoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmEnteParticipantes.BitBtn1Click(Sender: TObject);
begin
        if (Nombre.Text <> '') and (Cargo.Text <> '') then
        begin
         frmMain.CDparticipantes.Append;
         frmMain.CDparticipantes.FieldValues['nombre'] := Nombre.Text;
         frmMain.CDparticipantes.FieldValues['cargo'] := Cargo.Text;
         frmMain.CDparticipantes.Post;
         if Invitado.Checked then
         begin
           frmMain.CDinvitados.Append;
           frmMain.CDinvitados.FieldValues['Nombre'] := Nombre.Text;
           frmMain.CDinvitados.FieldValues['Cargo'] := Cargo.Text;
           frmMain.CDinvitados.Post;
         end;
         Nombre.Text := '';
         Cargo.Text := '';
         Nombre.SetFocus;
         Invitado.Checked := False;
        end;
end;

procedure TFrmEnteParticipantes.BitBtn2Click(Sender: TObject);
begin
        try
          Invitado.Checked := False;
          frmMain.CDparticipantes.Delete;
          Nombre.SetFocus;
        except
          MessageDlg('No Existen Participantes por Eliminar',mtInformation,[mbok],0);
        end;
          if (DBente.KeyValue = 0 ) or (DBente.KeyValue = 1) then
          begin
            Empleado;
            Nombre.Text := Nombres + ' ' + Apellidos;
            Nombre.ReadOnly := True;
            Cargo.SetFocus;
          end
end;

procedure TFrmEnteParticipantes.BitBtn3Click(Sender: TObject);
var    filtro :string;
begin
        if frmMain.CDparticipantes.RecordCount <> 0 then
        begin
           with frmMain do
           begin
             frmMain.hora_inicio := Time;
             frmMain.n_acta := EDacta.Text;
             CDinvitados.First;
             while not CDinvitados.Eof do
             begin
               filtro := CDinvitados.fieldbyname('nombre').AsString;
               CDparticipantes.Filtered := False;
               CDparticipantes.Filter := 'nombre = ''' + filtro + '''';
//               CDparticipantes.Params['filto'] := filtro;
               CDparticipantes.Filtered := True;
               if CDparticipantes.FieldByName('nombre').AsString <> '' then
                  CDparticipantes.Delete;
               CDinvitados.Next;
             end;
             CDparticipantes.Filtered := False;
           end;
           Close;

        end;
end;

procedure TFrmEnteParticipantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        if frmMain.CDparticipantes.RecordCount = 0 then
        begin
           MessageDlg('El Numero de Participante No puede ser Cero(0)',mtWarning,[mbok],0);
        end;

end;

procedure TFrmEnteParticipantes.FormCreate(Sender: TObject);
begin
        Fecha.Caption := FormatDateTime('yyyy/mm/dd',fFechaActual);
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Open;
        IBQuery1.Last;
        DmSolicitud := TDmSolicitud.Create(Self);
end;

procedure TFrmEnteParticipantes.DBenteExit(Sender: TObject);
begin
//        if Agencia <> 1 then
//           DBente.KeyValue := 0;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$enteaprobador".MONTO_MAXIMO');
          SQL.Add('FROM');
          SQL.Add('"col$enteaprobador"');
          SQL.Add('WHERE');
          SQL.Add('("col$enteaprobador".ID_ENTE_APROBADOR = :ID_ENTE)');
          try
          ParamByName('ID_ENTE').AsInteger := DBente.KeyValue;
          except
          begin
            MessageDlg('Debe Seleccionar Un Ente Aprodor',mtWarning,[mbok],0);
            DBente.SetFocus;
            Exit;
          end;
          end;
          ExecQuery;
          Monto_EnteAprobador := FieldByName('MONTO_MAXIMO').AsCurrency;
          Mensaje_EnteAprobador := DBente.Text;
          Id_EnteAprobador := DBente.KeyValue;
          if (DBente.KeyValue = 0 ) or (DBente.KeyValue = 1) then
          begin
            Empleado;
            Nombre.Text := Nombres + ' ' + Apellidos;
            EDacta.Text := FormatDateTime('yymmdd',fFechaActual);
            EDacta.ReadOnly := True;
            Nombre.ReadOnly := True;
            Invitado.Enabled := False;
            EDacta.TabStop := False;
            Cargo.SetFocus;
          end
          else
          begin
            Invitado.Enabled := True;
            EDacta.TabStop := True;
            Nombre.ReadOnly := False;
            EDacta.Text := '';
            EDacta.ReadOnly := False;
            EDacta.SetFocus;
          end;
          DBente.TabStop := False;
          Close;
          Transaction.Commit;
        end;
end;

procedure TFrmEnteParticipantes.DBenteEnter(Sender: TObject);
begin
        DBente.DropDown
end;

procedure TFrmEnteParticipantes.DBenteKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmEnteParticipantes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        if frmMain.CDparticipantes.RecordCount = 0 then
           CanClose := False
        else
           CanClose := True;
end;

procedure TFrmEnteParticipantes.InvitadoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmEnteParticipantes.EDactaExit(Sender: TObject);
begin
        EDacta.TabStop := False;
        frmMain.CDinvitados.CancelUpdates;
        frmMain.CDparticipantes.CancelUpdates;
        if (DBente.KeyValue = 0) or (DBente.KeyValue = 1) then
           Cargo.SetFocus
        else
        begin
           with IBQuery2 do
           begin
             Close;
             if Transaction.InTransaction then
                 Transaction.Rollback;
             Transaction.StartTransaction;
             SQL.Clear;
            SQL.Clear;
            SQL.Add('select * from "ent$asistente" where NUMERO_ACTA = :NUMERO');
            ParamByName('NUMERO').AsString := EDacta.Text;
            Open;
            while not Eof do// while 3
            begin
              if Abs(FieldByName('ES_INVITADO').AsInteger) = 1 then
              begin
                frmMain.CDinvitados.Append;
                frmMain.CDinvitados.FieldValues['nombre'] := FieldByName('NOMBRE').AsString;
                frmMain.CDinvitados.FieldValues['cargo'] :=  FieldByName('CARGO').AsString;
                frmMain.CDinvitados.Post;
              end;
                frmMain.CDparticipantes.Append;
                frmMain.CDparticipantes.FieldValues['nombre'] := FieldByName('NOMBRE').AsString;
                frmMain.CDparticipantes.FieldValues['cargo'] :=  FieldByName('CARGO').AsString;
                frmMain.CDparticipantes.post;
              Next;
             end;// fin while
           end;
           Nombre.SetFocus;
        end;
end;

procedure TFrmEnteParticipantes.EDactaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

end.
