unit UnitCdatSoliicutd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, DBClient, StdCtrls, Buttons,
  JvEdit, JvTypedEdit, IBSQL;

type
  TFrmCdatSolicitud = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Tas: TLabel;
    EDtasa: TEdit;
    Label2: TLabel;
    EDfecha: TEdit;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    BitBtn3: TBitBtn;
    JVnumero: TJvEdit;
    IBSQL1: TIBSQL;
    SpeedButton1: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure JVnumeroKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure JVnumeroExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  vNumero :Integer;
  vTasa :Currency;
  vFecha_Vencimiento :TDate;
    procedure limpiar;
    { Private declarations }
  public
  es_cdat :Boolean;
  vPlazo :Integer;
    { Public declarations }
  end;

var
  FrmCdatSolicitud: TFrmCdatSolicitud;

implementation
uses UnitGlobales, UnitInformacion;

{$R *.dfm}

procedure TFrmCdatSolicitud.BitBtn1Click(Sender: TObject);
begin
        if (es_cdat) and  (FrmInformacion.CDcdat.RecordCount >= 1) then
        begin
           MessageDlg('La Linea Cdat Solo permite el Registro de un Cdat',mtWarning,[mbok],0);
           Exit;
        end;

        with FrmInformacion.CDcdat do
        begin
          Filtered := False;
          Filter := 'numero = ' + IntToStr(vNumero);
          Filtered := True;
          //ShowMessage(FieldByName('numero').AsString);
          if RecordCount = 0 then
          begin
            Append;
            FieldValues['numero'] := vNumero;
            FieldValues['tasa'] := vTasa;
            FieldValues['fecha'] := vFecha_Vencimiento;
            Post;
          end;
          {begin
            CDcdat.Append;
            CDcdat.FieldValues['numero'] := vNumero;
            CDcdat.FieldValues['tasa'] := vTasa;
            CDcdat.FieldValues['fecha'] := vFecha_Vencimiento;
            CDcdat.Post;
          end;}

          Filtered := False;
        end;
        BitBtn1.Enabled := False;
        limpiar;
        JVnumero.SetFocus
end;

procedure TFrmCdatSolicitud.JVnumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
           NumericoSinPunto(Self,Key);
           if Key = #13 then
              jvnumeroexit(Self)
end;

procedure TFrmCdatSolicitud.BitBtn2Click(Sender: TObject);
begin
        try
          FrmInformacion.CDcdat.Delete;
        except
          MessageDlg('No Existen Datos Para Eliminar',mtInformation,[mbok],0);
        end;

end;

procedure TFrmCdatSolicitud.JVnumeroExit(Sender: TObject);
var     Vdias :Integer;
begin
        if JVnumero.Text <> '' then
        begin
          EDfecha.Text := '';
          EDtasa.Text := '';
          with IBSQL1 do
          begin
            if Transaction.InTransaction then
              Transaction.Commit;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"cap$maestro".ID_ESTADO,');
            SQL.Add('"cap$maestro".FECHA_VENCIMIENTO,');
            SQL.Add('"cap$tiposestado".DESCRIPCION,');
            SQL.Add('"cap$maestro".FECHA_VENCIMIENTO_PRORROGA,');
            SQL.Add('"cap$maestro".TASA_EFECTIVA');
            SQL.Add('FROM');
            SQL.Add('"cap$maestro"');
            SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO="cap$tiposestado".ID_ESTADO)');
            SQL.Add('WHERE');
            SQL.Add('("cap$maestro".ID_AGENCIA = :ID_AGENCIA) AND ');
            SQL.Add('("cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
            SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = 6)');
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(JVnumero.Text);
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ExecQuery;
            vTasa := FieldByName('TASA_EFECTIVA').AsCurrency;
            //ShowMessage(FieldByName('DESCRIPCION').AsString + ' ' + eddescripciongar.Text);
            if RecordCount = 0 then
            begin
               MessageDlg('Verifique el Número del CDAT no Existe',mtInformation,[mbok],0);
               JVnumero.SetFocus;
               Exit;
            end; // fin del valida la existencia del cdat
            if (FieldByName('ID_ESTADO').AsInteger in [1,6]) then
            else
            begin
               MessageDlg('El CDAT no Sirve Porque se Encuentra ' + fieldbyname('DESCRIPCION').AsString,mtInformation,[mbok],0);
               JVnumero.SetFocus;
               Exit;
            end;// fin del valida estado cdat
            if FieldByName('ID_ESTADO').AsInteger = 1 then
               vFecha_Vencimiento := FieldByName('FECHA_VENCIMIENTO').AsDate
              else if FieldByName('ID_ESTADO').AsInteger = 6 then
                 vFecha_Vencimiento := FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDate;
            EDfecha.Text := DateToStr(vFecha_Vencimiento);
            EDtasa.Text := CurrToStr(vTasa) + '%';
            Vdias := DiasEntre(fFechaActual,vFecha_Vencimiento);
            vNumero := StrToInt(JVnumero.Text);
            if (es_cdat) and (Vdias < vPlazo) then
            begin
               MessageDlg('El Vencimiento del CDAT es Menor al Vencimiento del Crédito' + #13 + ' Plazo Máximo Pemitido por el CDAT ' + IntToStr(Vdias) + ' Dias a Fecha Hoy',mtInformation,[mbok],0);
               JVnumero.SetFocus;
               Exit;
            end;// fin del valida vencimineto cdat
        end; //fin del with IBSQL1
        BitBtn1.Enabled := True;
        BitBtn1.SetFocus;
       end;
end;

procedure TFrmCdatSolicitud.limpiar;
begin
        JVnumero.Text := '';
        EDfecha.Text := '';
        EDtasa.Text := '';
end;

procedure TFrmCdatSolicitud.BitBtn3Click(Sender: TObject);
begin
        if FrmInformacion.CDcdat.RecordCount = 0 then
        begin
           if MessageDlg('No se ha Registrado Ningun Cdat... Desea Continuar?',mtWarning,[mbyes,mbno],0) = mrno then
              Close
           else
              JVnumero.SetFocus
        end;
        Close;
end;

procedure TFrmCdatSolicitud.SpeedButton1Click(Sender: TObject);
begin
        FrmInformacion.CDcdat.CancelUpdates;
        Close;
end;

procedure TFrmCdatSolicitud.FormCreate(Sender: TObject);
begin
        FrmInformacion.DScdtat.DataSet :=FrmInformacion.CDcdat;
        DBGrid1.DataSource := FrmInformacion.DScdtat;
end;

end.
