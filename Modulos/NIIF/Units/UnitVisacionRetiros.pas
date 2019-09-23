unit UnitVisacionRetiros;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dbcgrids, JvComponent, JvTransparentForm, JvTrayIcon, StdCtrls,
  DBCtrls, ExtCtrls, ImgList, Buttons, IBSQL, IBDatabase, DB,
  IBCustomDataSet, IBQuery, IBEvents, MSNPopUp;

type
  TfrmVisacionRetiros = class(TForm)
    frmTray: TJvTrayIcon;
    GroupBox1: TGroupBox;
    EdCaja: TStaticText;
    EdCajero: TStaticText;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    EdCuenta: TStaticText;
    Label2: TLabel;
    Label3: TLabel;
    EdValor: TStaticText;
    Label4: TLabel;
    EdTalon: TStaticText;
    Label5: TLabel;
    EdDesde: TStaticText;
    Label6: TLabel;
    Label7: TLabel;
    EdHasta: TStaticText;
    EdFirma: TImage;
    EdFoto: TImage;
    ImageList1: TImageList;
    Panel1: TPanel;
    btnAnterior: TBitBtn;
    btnSiguiente: TBitBtn;
    btnVisar: TBitBtn;
    btnNegar: TBitBtn;
    DSTitulares: TDataSource;
    IBQTitulares: TIBQuery;
    IBTDatos: TIBTransaction;
    IBTCiclo: TIBTransaction;
    IBQCiclo: TIBQuery;
    IBSActualiza: TIBSQL;
    IBQDatos: TIBQuery;
    IBEvents1: TIBEvents;
    EdTitulares: TDBComboBox;
    Label9: TLabel;
    Label10: TLabel;
    EdSaldoActual: TStaticText;
    EdSaldoDisponible: TStaticText;
    MSNPopUp1: TMSNPopUp;
    IBConsulta: TIBQuery;
    IBOtros: TIBQuery;
    Label8: TLabel;
    Image1: TImage;
    IBSQL1: TIBSQL;
    Panel2: TPanel;
    EdRangoOk: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frmTrayDblClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DSTitularesDataChange(Sender: TObject; Field: TField);
    procedure FormHide(Sender: TObject);
    procedure IBEvents1EventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure MSNPopUp1Click(Sender: TObject);
    procedure MSNPopUp1URLClick(Sender: TObject; URL: String);
    procedure btnNegarClick(Sender: TObject);
    procedure btnVisarClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    procedure Recargar;
    procedure MostrarDatos;
    function ValidarLibreta: Boolean;
    procedure ValidarDatos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisacionRetiros: TfrmVisacionRetiros;
  NoHay:Boolean;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, unitMain;

procedure TfrmVisacionRetiros.FormShow(Sender: TObject);
begin
   Recargar;
   MostrarDatos;
end;

procedure TfrmVisacionRetiros.MostrarDatos;
begin
       with IBQCiclo do
       begin
        EdCaja.Caption := FieldByName('DESCRIPCION').AsString;
        EdCajero.Caption := FieldByName('CAJERO').AsString;
        EdCuenta.Caption := FieldByName('ID_TIPO_CAPTACION').AsString+Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+'-'+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' + FieldByName('DIGITO_CUENTA').AsString;
        EdValor.Caption := FormatCurr('$#,#0.00',FieldByName('VALOR_RETIRO').AsCurrency);
        EdTalon.Caption := FieldByName('NUMERO_TALON').AsString;
        EdDesde.Caption := Format('%.7d',[FieldByName('NUMERO_INICIAL').AsInteger]);
        EdHasta.Caption := Format('%.7d',[FieldByName('NUMERO_FINAL').AsInteger]);
       end;

       with IBQTitulares do
       begin
        if Transaction.InTransaction then
          Transaction.Rollback;
        Transaction.StartTransaction;
        Close;
        SQL.Clear;
        SQL.Add('SELECT ');
        SQL.Add('FOTO,FIRMA,("gen$persona".ID_IDENTIFICACION || ''-''|| "gen$persona".ID_PERSONA || ''-'' ||"gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO || '' '' || "gen$persona".NOMBRE) AS NOMBRE');
        SQL.Add('FROM');
        SQL.Add(' "cap$maestrotitular"');
        SQL.Add(' INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
        SQL.Add('  AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
        SQL.Add('WHERE');
        SQL.Add('  ("cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA) AND ');
        SQL.Add('  ("cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND ');
        SQL.Add('  ("cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
        SQL.Add('  ("cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA)');
        SQL.Add('ORDER BY');
        SQL.Add('  "cap$maestrotitular".NUMERO_TITULAR');
        ParamByName('ID_AGENCIA').AsInteger := IBQCiclo.FieldByName('ID_AGENCIA').AsInteger;
        ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQCiclo.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        ParamByName('NUMERO_CUENTA').AsInteger := IBQCiclo.FieldByName('NUMERO_CUENTA').AsInteger;
        ParamByName('DIGITO_CUENTA').AsInteger := IBQCiclo.FieldByName('DIGITO_CUENTA').AsInteger;
        try
         Open;
        except
         Transaction.Rollback;
         raise;
         Exit;
        end;
       end;

       with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from SALDOS_VIGENTES(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
         ParamByName('AG').AsInteger := IBQCiclo.FieldByName('ID_AGENCIA').AsInteger;
         ParamByName('TP').AsInteger := IBQCiclo.FieldByName('ID_TIPO_CAPTACION').AsInteger;
         ParamByName('CTA').AsInteger := IBQCiclo.FieldByName('NUMERO_CUENTA').AsInteger;
         ParamByName('DGT').AsInteger := IBQCiclo.FieldByName('DIGITO_CUENTA').AsInteger;
         ParamByName('ANO').AsInteger := YearOf(fFechaActual);
         ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
         ParamByName('FECHA2').AsDate := fFechaActual;
         try
          ExecQuery;
          EdSaldoActual.Caption := FormatCurr('$#,0.00',FieldByName('SALDO_ACTUAL').AsCurrency);
          EdSaldoDisponible.Caption := FormatCurr('$#,0.00',FieldByName('SALDO_DISPONIBLE').AsCurrency);
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
       end;

       if ValidarLibreta then
       begin
          EdRangoOk.Checked := True;
          btnVisar.Enabled := True;
       end
       else
       begin
          EdRangoOk.Checked := False;
          btnVisar.Enabled := False;
       end;


end;

procedure TfrmVisacionRetiros.Recargar;
begin
     with IBQCiclo do
     begin
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('SELECT ');
         sql.Add('  "tes$vretiros".ID_CAJA,');
         SQL.Add('  "tes$vretiros".ID_AGENCIA,');
         SQL.Add('  "tes$vretiros".ID_TIPO_CAPTACION,');
         SQL.Add('  "tes$vretiros".NUMERO_CUENTA,');
         SQL.Add('  "caj$cajas".DESCRIPCION,');
         SQL.Add('  "gen$empleado".PRIMER_APELLIDO || '' '' || "gen$empleado".SEGUNDO_APELLIDO || '' '' || "gen$empleado".NOMBRE AS CAJERO,');
         SQL.Add('  "tes$vretiros".DIGITO_CUENTA,');
         SQL.Add('  "tes$vretiros".NUMERO_TALON,');
         SQL.Add('  "tes$vretiros".VALOR_RETIRO,');
         SQL.Add('  "cap$libretas".NUMERO_INICIAL,');
         SQL.Add('  "cap$libretas".NUMERO_FINAL');
         SQL.Add('FROM');
         SQL.Add(' "tes$vretiros"');
         SQL.Add(' INNER JOIN "caj$cajas" ON ("tes$vretiros".ID_CAJA="caj$cajas".ID_CAJA)');
         SQL.Add(' INNER JOIN "gen$empleado" ON ("caj$cajas".ID_EMPLEADO="gen$empleado".ID_EMPLEADO)');
         SQL.Add(' INNER JOIN "cap$libretas" ON ("tes$vretiros".ID_AGENCIA="cap$libretas".ID_AGENCIA)');
         SQL.Add('   AND ("tes$vretiros".ID_TIPO_CAPTACION="cap$libretas".ID_TIPO_CAPTACION)');
         SQL.Add('   AND ("tes$vretiros".NUMERO_CUENTA="cap$libretas".NUMERO_CUENTA)');
         SQL.Add('   AND ("tes$vretiros".DIGITO_CUENTA="cap$libretas".DIGITO_CUENTA)');
         SQL.Add('WHERE');
         SQL.Add('  ("tes$vretiros".VISADO = 0) AND ');
         SQL.Add('  ("tes$vretiros".NEGADO = 0) AND ');
         SQL.Add('  ("tes$vretiros".ANULADO = 0) AND ');
         SQL.Add('  ("tes$vretiros".FECHA_INGRESO = :FECHA)');
         ParamByName('FECHA').AsDate := fFechaActual;
         try
          NoHay := False;
          Open;
          Last;
          First;
          if RecordCount < 1 then
          begin
             NoHay := True;
{             if Self.Visible then
                Self.Hide;
             MSNPopUp1.Title := 'Visación';
             MSNPopUp1.Text := 'NO HAY requerimiento para visación de retiro';
             MSNPopUp1.TimeOut := 10;
             MSNPopUp1.ShowPopUp;
}
             btnAnterior.Enabled := False;
             btnSiguiente.Enabled := False;
             btnNegar.Enabled := False;
             btnVisar.Enabled := False;
          end
          else
          if RecordCount = 1 then
          begin
             btnAnterior.Enabled := False;
             btnSiguiente.Enabled := False;
             btnNegar.Enabled := True;
             btnVisar.Enabled := True;
          end
          else
          begin
             btnAnterior.Enabled := True;
             btnSiguiente.Enabled := True;
             btnNegar.Enabled := True;
             btnVisar.Enabled := True;
          end;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
     end;
end;

procedure TfrmVisacionRetiros.btnSiguienteClick(Sender: TObject);
begin
        IBQCiclo.Next;
        MostrarDatos;
end;

procedure TfrmVisacionRetiros.btnAnteriorClick(Sender: TObject);
begin
        IBQCiclo.Prior;
        MostrarDatos;
end;

procedure TfrmVisacionRetiros.FormCreate(Sender: TObject);
begin
        frmTray.Active := True;
        Self.Hide;
        Recargar;
        if not NoHay then
        begin
             MSNPopUp1.Title := 'Visación';
             MSNPopUp1.Text := 'Hay requerimiento para visación de retiro';
             MSNPopUp1.TimeOut := 10;
             MSNPopUp1.ShowPopUp;
             frmTray.Animated := True;
        end;
end;

procedure TfrmVisacionRetiros.frmTrayDblClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        ValidarDatos;
end;

procedure TfrmVisacionRetiros.DSTitularesDataChange(Sender: TObject;
  Field: TField);
var
  AStream:TStream;
begin
        AStream := TMemoryStream.Create;
        TBlobField(IBQTitulares.FieldByName('FOTO')).SaveToStream(AStream);
        AStream.Seek(0,soFromBeginning);
        EdFoto.Picture.Bitmap.LoadFromStream(AStream);
        AStream.Free;

        AStream := TMemoryStream.Create;
        TBlobField(IBQTitulares.FieldByName('FIRMA')).SaveToStream(AStream);
        AStream.Seek(0,soFromBeginning);
        EdFirma.Picture.Bitmap.LoadFromStream(AStream);
        AStream.Free;
end;

procedure TfrmVisacionRetiros.FormHide(Sender: TObject);
begin
        EdFoto.Picture.Bitmap.FreeImage;
        EdFirma.Picture.Bitmap.FreeImage;
        EdCaja.Caption := '';
        EdCajero.Caption := '';
        if not NoHay then
          frmTray.Animated := True
        else
          frmTray.Animated := False;
end;

procedure TfrmVisacionRetiros.IBEvents1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
begin
        if EventName = 'por_visar' then
        begin
          MSNPopUp1.Title := 'Visación';
          MSNPopUp1.Text := 'Hay un nuevo requerimiento para visación de retiro';
          MSNPopUp1.TimeOut := 10;
          MSNPopUp1.ShowPopUp;
          NoHay := False;
          if not Self.Visible then
             frmTray.Animated := True;
        end;
end;

procedure TfrmVisacionRetiros.MSNPopUp1Click(Sender: TObject);
begin
        ValidarDatos;
end;

procedure TfrmVisacionRetiros.MSNPopUp1URLClick(Sender: TObject;
  URL: String);
begin
        ValidarDatos;
end;

function TfrmVisacionRetiros.ValidarLibreta: Boolean;
var usado:Boolean;
    LibGeneral:Boolean;
begin
        Result := True;
        usado := False;
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select * from "cap$libretas" where ');
             SQL.Add('(ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
             SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
             SQL.Add(':LIBRETA BETWEEN NUMERO_INICIAL and NUMERO_FINAL )');
             ParamByName('ID_AGENCIA').AsInteger := IBQCiclo.FieldByName('ID_AGENCIA').AsInteger;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQCiclo.FieldByName('ID_TIPO_CAPTACION').AsInteger;
             ParamByName('NUMERO_CUENTA').AsInteger := IBQCiclo.FieldByName('NUMERO_CUENTA').AsInteger;
             ParamByName('DIGITO_CUENTA').AsInteger := IBQCiclo.FieldByName('DIGITO_CUENTA').AsInteger;
             ParamByName('LIBRETA').AsInteger := IBQCiclo.FieldByName('NUMERO_TALON').AsInteger;
             try
              Open;
              if RecordCount < 1 then
              begin
                 Result := False;
                 Exit;
              end;
             except
              Result :=False;
              MessageDlg('Error al Validar Rango',mtError,[mbcancel],0);
              Exit;
             end;

             while not Eof do
             begin
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('select * from "cap$libretasusada" where ');
              IBOtros.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
              IBOtros.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
              IBOtros.SQL.Add('NUMERO_TALON = :LIBRETA');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := IBQCiclo.FieldByName('ID_AGENCIA').AsInteger;
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQCiclo.FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := IBQCiclo.FieldByName('NUMERO_CUENTA').AsInteger;
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := IBQCiclo.FieldByName('DIGITO_CUENTA').AsInteger;
              IBOtros.ParamByName('LIBRETA').AsInteger := IBQCiclo.FieldByName('NUMERO_TALON').AsInteger;
              try
                IBOtros.Open;
                if IBOtros.RecordCount > 0 then
                begin
                   usado := True;
                   if FieldByName('NUMERO_CUENTA').AsInteger = 0 then
                     LibGeneral := true
                   else
                     LibGeneral := False;
                end
                else
                begin
                   usado := False;
                   if FieldByName('NUMERO_CUENTA').AsInteger = 0 then
                     LibGeneral := true
                   else
                     LibGeneral := False;
                end
              except
                MessageDlg('Error consultando talon',mtError,[mbcancel],0);
              end;
              Next;
             end;
        end;

        if usado and LibGeneral then usado := False;

        if usado then
           Result := False;


end;

procedure TfrmVisacionRetiros.btnNegarClick(Sender: TObject);
begin
        if MessageDlg('Seguro de negar la visación?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
          with IBQDatos do begin
            Close;
            SQL.Clear;
            SQL.Add('update "tes$vretiros" SET NEGADO = :NEGADO, VISADOR = :VISADOR,');
            SQL.Add('FECHA_VISADO = :FECHA_VISADO, HORA_VISADO = :HORA_VISADO');
            SQL.Add('where');
            SQL.Add('ID_CAJA = :ID_CAJA and ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
            SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and NUMERO_TALON = :NUMERO_TALON');
            ParamByName('NEGADO').AsInteger := 1;
            ParamByName('VISADOR').AsString := DBAlias;
            ParamByName('FECHA_VISADO').AsDate := fFechaActual;
            ParamByName('HORA_VISADO').AsTime := fHoraActual;
            ParamByName('ID_CAJA').AsInteger := IBQCiclo.FieldByName('ID_CAJA').AsInteger;
            ParamByName('ID_AGENCIA').AsInteger := IBQCiclo.FieldByName('ID_AGENCIA').AsInteger;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQCiclo.FieldByName('ID_TIPO_CAPTACION').AsInteger;
            ParamByName('NUMERO_CUENTA').AsInteger := IBQCiclo.FieldByName('NUMERO_CUENTA').AsInteger;
            ParamByName('DIGITO_CUENTA').AsInteger := IBQCiclo.FieldByName('DIGITO_CUENTA').AsInteger;
            ParamByName('NUMERO_TALON').AsInteger := IBQCiclo.FieldByName('NUMERO_TALON').AsInteger;
            try
             ExecSQL;
             Transaction.Commit;
            except
             Transaction.Rollback;
             raise;
            end;
            ValidarDatos;
          end;
        end;
end;

procedure TfrmVisacionRetiros.btnVisarClick(Sender: TObject);
begin
        if MessageDlg('Seguro de visar el retiro?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
          with IBQDatos do begin
            Close;
            SQL.Clear;
            SQL.Add('update "tes$vretiros" SET VISADO = :VISADO, VISADOR = :VISADOR,');
            SQL.Add('FECHA_VISADO = :FECHA_VISADO, HORA_VISADO = :HORA_VISADO');
            SQL.Add('where');
            SQL.Add('ID_CAJA = :ID_CAJA and ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
            SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and NUMERO_TALON = :NUMERO_TALON');
            ParamByName('VISADO').AsInteger := 1;
            ParamByName('VISADOR').AsString := DBAlias;
            ParamByName('FECHA_VISADO').AsDate := fFechaActual;
            ParamByName('HORA_VISADO').AsTime := fHoraActual;
            ParamByName('ID_CAJA').AsInteger := IBQCiclo.FieldByName('ID_CAJA').AsInteger;
            ParamByName('ID_AGENCIA').AsInteger := IBQCiclo.FieldByName('ID_AGENCIA').AsInteger;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQCiclo.FieldByName('ID_TIPO_CAPTACION').AsInteger;
            ParamByName('NUMERO_CUENTA').AsInteger := IBQCiclo.FieldByName('NUMERO_CUENTA').AsInteger;
            ParamByName('DIGITO_CUENTA').AsInteger := IBQCiclo.FieldByName('DIGITO_CUENTA').AsInteger;
            ParamByName('NUMERO_TALON').AsInteger := IBQCiclo.FieldByName('NUMERO_TALON').AsInteger;
            try
             ExecSQL;
             Transaction.Commit;
            except
             Transaction.Rollback;
             raise;
            end;
            ValidarDatos;
          end;
        end;

end;

procedure TfrmVisacionRetiros.ValidarDatos;
begin
        Recargar;
        if (not NoHay) then
          if (not frmMain.EnPasabordo) then
          begin
           Self.Visible := True;
           MostrarDatos;
          end
          else
          begin
           MSNPopUp1.Title := 'Visación';
           MSNPopUp1.Text := 'Por favor digite primero su contraseña';
           MSNPopUp1.TimeOut := 10;
           MSNPopUp1.ShowPopUp;
          end
        else
        begin
           Self.Visible := False;
           MSNPopUp1.Title := 'Visación';
           MSNPopUp1.Text := 'NO HAY requerimiento para visación de retiro';
           MSNPopUp1.TimeOut := 10;
           MSNPopUp1.ShowPopUp;
           frmTray.Animated := False;;
           frmTray.IconIndex := 0;
        end;
end;

procedure TfrmVisacionRetiros.Image1Click(Sender: TObject);
begin
        Self.Visible := False;
end;

end.
