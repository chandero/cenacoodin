unit UnitChequesenCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, XStringGrid, JvComponent,
  JvxCtrls, CheckLst, JvCheckListBox, ComCtrls, IBSQL, DB, IBCustomDataSet,
  IBQuery, DBGrids, pr_Common, pr_TxClasses;

type
  TfrmChequesenCaja = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Caja: TLabel;
    EdCaja: TStaticText;
    Usuario: TLabel;
    EdUsuario: TStaticText;
    CmdEnviar: TBitBtn;
    CmdCerrar: TBitBtn;
    ChkEnviarTodo: TCheckBox;
    IBSQL1: TIBSQL;
    ChkListaCheques: TJvxCheckListBox;
    Panel4: TPanel;
    Label1: TLabel;
    EdTotalCheques: TStaticText;
    HeaderControl1: THeaderControl;
    IBQuery1: TIBQuery;
    IBQuery1ID_CAJA: TSmallintField;
    IBQuery1ID_BANCO: TSmallintField;
    IBQuery1NUMERO_CHEQUE: TIntegerField;
    IBQuery1FECHA: TDateField;
    IBQuery1PLAZA: TIBStringField;
    IBQuery1VALOR: TIBBCDField;
    IBQuery1ID_AGENCIA: TSmallintField;
    IBQuery1ID_TIPO_CUENTA: TSmallintField;
    IBQuery1NUMERO_CUENTA: TIntegerField;
    IBQuery1DIGITO_CUENTA: TIntegerField;
    IBQuery1DOCUMENTO: TIBStringField;
    IBQuery1ENVIADO: TSmallintField;
    IBQuery1FECHA_ENVIO: TDateField;
    Reporte: TprTxReport;
    IBSQL2: TIBSQL;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChkEnviarTodoClick(Sender: TObject);
    procedure ChkListaChequesStateChange(Sender: TObject; Index: Integer);
    procedure CmdEnviarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidarCaja:Boolean;
  end;

var
  frmChequesenCaja: TfrmChequesenCaja;

implementation

uses UnitdmGeneral,unitGlobales,unitVistaPreliminar;

{$R *.dfm}

function TfrmChequesenCaja.ValidarCaja:Boolean;
begin
         Result := False;
         if dmGeneral.IBTransaction1.InTransaction then
         begin
            dmGeneral.IBTransaction1.Commit;
         end;
         with IBsql1 do
         begin
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"caj$cajas".ID_CAJA,');
           SQL.Add('"caj$cajas".HORA_INICIO,');
           SQL.Add('"caj$cajas".HORA_FINAL,');
           SQL.Add('"caj$estados".PERMITE_MOVIMIENTO,');
           SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
           SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$empleado".NOMBRE');
           SQL.Add('FROM');
           SQL.Add('"caj$cajas"');
           SQL.Add('INNER JOIN "caj$estados" ON ("caj$cajas".ID_ESTADO_CAJA = "caj$estados".ID_ESTADO)');
           SQL.Add('INNER JOIN "gen$empleado" ON ("caj$cajas".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
           SQL.Add('where "caj$cajas".ID_EMPLEADO = :ID_EMPLEADO');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           try
            ExecQuery;
            if RecordCount > 0 then
            begin
               if FieldByName('PERMITE_MOVIMIENTO').AsInteger = 0 then
               begin
                  Result := False;
                  Exit;
               end;
               if ( FieldByName('HORA_INICIO').AsTime > Time ) or
                  ( FieldByName('HORA_FINAL').AsTime < Time ) then
               begin
                  Result := False;
                  Exit;
               end;
               EdCaja.Caption := IntToStr(FieldByName('ID_CAJA').AsInteger);
               EdUsuario.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                    FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                    FieldByName('NOMBRE').AsString;
            end
            else
            begin
              Result := False;
              Close;
              Exit;
            end;
           except
              Result := False;
              Exit;
           end;
         end;
         Result := True;

end;

procedure TfrmChequesenCaja.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmChequesenCaja.FormShow(Sender: TObject);
var Cadena:string;
    Total:Currency;
    EsCerrado:Boolean;
begin
        Total := 0;
        with IBSQL1 do begin
          if Transaction.InTransaction then
            Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM "caj$cierres" WHERE ID_CAJA = :ID_CAJA and FECHA = :FECHA');
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA').AsDate := Date;
          try
            ExecQuery;
            Transaction.CommitRetaining;
            EsCerrado := InttoBoolean(FieldByName('ESTADO').AsInteger);
          except
            MessageDlg('Error al Leer Cierres',mtError,[mbcancel],0);
            Transaction.Rollback;
            Exit;
          end;
        end;

        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('INSERT INTO "caj$tmpcheques" SELECT * FROM "caj$cheques" WHERE ID_CAJA = :ID_CAJA and ');
         SQL.Add('ENVIADO = 0');
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         try
          ExecQuery;
          if RowsAffected < 1 then begin
            MessageDlg('No Tiene Cheques en Caja',mtInformation,[mbok],0);
            Exit;
          end
          else
          begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT * FROM "caj$tmpcheques" WHERE ID_CAJA = :ID_CAJA');
           ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
           try
            ExecQuery;
            while not Eof do begin
             Cadena := '        '+
                       Format('%.3d',[FieldByName('ID_BANCO').AsInteger])+'               '+
                       Format('%.8d',[FieldByName('NUMERO_CHEQUE').AsInteger])+'      '+
                       Format('%18.2m',[FieldByName('VALOR').AsCurrency]);
             ChkListaCheques.Checked[ChkListaCheques.Items.Add(Cadena)] := true;
             Total := Total + FieldByName('VALOR').AsCurrency;
             Next;
            end;
            if not EsCerrado then
               CmdEnviar.Enabled := True
            else
                MessageDlg('No se pueden enviar los cheques'+#13+'El día ya esta cerrado',mtInformation,[mbok],0);
            EdTotalCheques.Caption := Format('%18.2m',[Total]);
           except
            MessageDlg('Error al Buscar Cheques',mtError,[mbcancel],0);
            Exit;
           end;
          end;
         except
          MessageDlg('Error al Buscar Cheques',mtError,[mbcancel],0);
          Exit;
         end;
        end;
end;

procedure TfrmChequesenCaja.ChkEnviarTodoClick(Sender: TObject);
var i:Integer;
begin
        for i := 0 to ChkListaCheques.Items.Count - 1 do begin
         ChkListaCheques.Checked[i] := ChkEnviarTodo.Checked;
        end;
end;

procedure TfrmChequesenCaja.ChkListaChequesStateChange(Sender: TObject;
  Index: Integer);
begin
        ChkListaCheques.Checked[Index] := True;
end;

procedure TfrmChequesenCaja.CmdEnviarClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE "caj$cheques" SET ENVIADO = 1,FECHA_ENVIO = :FECHA WHERE ID_CAJA = :ID_CAJA');
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA').AsDate := Date;
          try
            ExecQuery;
          except
            MessageDlg('No se pudo enviar los cheques',mtError,[mbcancel],0);
            Exit;
          end;
        end;
        with IBQuery1 do begin
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         try
          Open;
          Reporte.Variables.ByName['Empresa'].AsString := Empresa;
          Reporte.Variables.ByName['Caja'].AsInteger := StrToInt(EdCaja.Caption);
          Reporte.Variables.ByName['Agencia'].AsString := Ciudad;
          Reporte.Variables.ByName['Funcionario'].AsString := EdUsuario.Caption;
          if Reporte.PrepareReport then
           begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := Reporte;
           frmVistaPreliminar.ShowModal;
           end;
//             Reporte.PreviewPreparedReport(True);
          Close;
         except
          MessageDlg('Error al Listar Cheques',mtError,[mbcancel],0);
         end;
        end;

        with IBSQL1 do begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT * FROM "caj$tmpcheques" WHERE ID_CAJA = :ID_CAJA');
           ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
           try
            ExecQuery;
            while not Eof do begin
             IBSQL2.ParamByName('ID_BANCO').AsInteger := FieldByName('ID_BANCO').AsInteger;
             IBSQL2.ParamByName('NUMERO_CHEQUE').AsInteger := FieldByName('NUMERO_CHEQUE').AsInteger;
             IBSQL2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
             IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CUENTA').AsInteger;
             IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
             IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
             IBSQL2.ParamByName('VALOR').AsCurrency := FieldByName('VALOR').AsCurrency;
             IBSQL2.ParamByName('PLAZA').AsString := FieldByName('PLAZA').AsString;
             IBSQL2.ParamByName('FECHA_RECIBIDO').AsDate := Date;
             IBSQL2.ParamByName('FECHA_CONSIGNADO').Clear;
             IBSQL2.ParamByName('FECHA_PROCESADO').Clear;
             IBSQL2.ParamByName('CONSIGNADO').AsInteger := 0;
             if FieldByName('ID_TIPO_CUENTA').AsInteger = 6 then
               IBSQL2.ParamByName('LIBERADO').AsInteger := 1
             else
               IBSQL2.ParamByName('LIBERADO').AsInteger := 0;
             IBSQL2.ParamByName('DEVUELTO').AsInteger := 0;
             try
               IBSQL2.ExecQuery;
               if IBSQL2.RowsAffected < 1 then
                begin
                  MessageDlg('No Se Pudo Pasar Cheque Nro:'+IntToStr(Fieldbyname('NUMERO_CHEQUE').AsInteger),mtError,[mbcancel],0);
                end;
             except
                  MessageDlg('Error al Pasar Cheque Nro:'+IntToStr(Fieldbyname('NUMERO_CHEQUE').AsInteger),mtError,[mbcancel],0);
                  Transaction.Rollback;
                  Exit;
             end;
             Next;
            end;
           except
             MessageDlg('Error al seleccionar cheques para envio!',mtError,[mbcancel],0);
             Transaction.Rollback;
             Exit;
           end;
        end;

        IBSQL1.Transaction.Commit;
        CmdEnviar.Enabled := False;
        MessageDlg('Cheques enviados con exito!',mtInformation,[mbok],0);

end;

procedure TfrmChequesenCaja.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        with IBSQL1 do begin
         if Transaction.InTransaction = False then
            Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('DELETE FROM "caj$tmpcheques" WHERE ID_CAJA = :ID_CAJA');
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         try
          ExecQuery;
          Transaction.Commit;
         except
          MessageDlg('Error al Vaciar Temporal',mtError,[mbcancel],0);
          Transaction.Rollback;
         end;
        end;

        CanClose := True;

end;

end.

