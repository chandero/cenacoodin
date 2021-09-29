unit UnitActa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB, DBClient,
  FR_DSet, FR_DBSet, FR_Class,NLetra, IBCustomDataSet, IBQuery, IBSQL, Mask, UnitDmGeneral;

type
  TFrmActa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EDacta: TEdit;
    Label2: TLabel;
    EDlugar: TEdit;
    Label3: TLabel;
    Edfecha: TEdit;
    CDorden: TClientDataSet;
    CDordennumero: TIntegerField;
    CDordentitulo: TStringField;
    CDordendescripcion: TBlobField;
    DSorden: TDataSource;
    Panel3: TPanel;
    Btelimina: TBitBtn;
    Btagrega: TBitBtn;
    Btmodificar: TBitBtn;
    GroupBox1: TGroupBox;
    DBente: TDBGrid;
    Panel2: TPanel;
    Btreporte: TBitBtn;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    frDBDataSet3: TfrDBDataSet;
    Label4: TLabel;
    EDpresidente: TEdit;
    Label5: TLabel;
    EDcargo: TEdit;
    BTregistra: TBitBtn;
    CDordentipo: TBooleanField;
    CDorden1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    CDorden2: TClientDataSet;
    CDorden1numero: TIntegerField;
    CDorden1titulo: TStringField;
    CDorden1descripcion: TBlobField;
    CDorden2numero: TIntegerField;
    CDorden2titulo: TStringField;
    CDorden2descripcion: TBlobField;
    NLetra1: TNLetra;
    CDsolicitud: TClientDataSet;
    CDsolicitudcuenta: TStringField;
    CDsolicitudnombres: TStringField;
    CDsolicitudvalor: TCurrencyField;
    CDsolicitudgarantia: TStringField;
    CDsolicitudplazo: TIntegerField;
    CDsolicituddecision: TStringField;
    CDestado: TClientDataSet;
    CDestadodescripcion: TStringField;
    CDestadototal: TIntegerField;
    frDBDataSet4: TfrDBDataSet;
    frDBDataSet5: TfrDBDataSet;
    frDBDataSet6: TfrDBDataSet;
    CDanexo: TClientDataSet;
    CDanexoanexo: TBlobField;
    frDBDataSet7: TfrDBDataSet;
    frDBDataSet8: TfrDBDataSet;
    IBQuery1: TIBQuery;
    BitBtn1: TBitBtn;
    CDparticipantes: TClientDataSet;
    CDparticipantesnombre: TStringField;
    CDparticipantescargo: TStringField;
    CDinvitados: TClientDataSet;
    CDinvitadosnombre: TStringField;
    CDinvitadoscargo: TStringField;
    IBQuery2: TIBQuery;
    IBSQL1: TIBSQL;
    EDhora: TMaskEdit;
    Label6: TLabel;
    CDsolicitudestado: TIntegerField;
    CDsolicitudid_garantia: TIntegerField;
    BTborra: TBitBtn;
    Btparcial: TBitBtn;
    procedure EDactaKeyPress(Sender: TObject; var Key: Char);
    procedure EDlugarKeyPress(Sender: TObject; var Key: Char);
    procedure EDpresidenteKeyPress(Sender: TObject; var Key: Char);
    procedure EDcargoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BtagregaClick(Sender: TObject);
    procedure BtreporteClick(Sender: TObject);
    procedure BTregistraClick(Sender: TObject);
    procedure EDcargoExit(Sender: TObject);
    procedure BtmodificarClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BteliminaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EDactaExit(Sender: TObject);
    procedure EDhoraKeyPress(Sender: TObject; var Key: Char);
    procedure EdfechaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTborraClick(Sender: TObject);
    procedure BtparcialClick(Sender: TObject);
  private
  a:Integer;
  Valida_Orden: Boolean;
  aplazada :Currency;
  negada :Currency;
  aprobada :Currency;
  aprobado :Currency;
  ratificada :Currency;
  anuladas :Currency;
  total_r : Currency;
  valor_ratificado :Currency;
  total_admisible :Currency;
  total_noadmisible :Currency;
  valor_admisible :Currency;
  valor_noadmisible :Currency;
  numero_solicitudes: integer;
  hora_sesion: ttime;

    procedure imprimir_reporte(cadena: string);
    procedure limpiar;
    function observacion(tipo: integer; solicitud: string): string;
    { Private declarations }
  public
    anexo_acta: string;
  published

    { Public declarations }
  end;

var
  FrmActa: TFrmActa;
  dmGeneral: TdmGeneral;
  const Numero_Orden: array[1..19] of string = ('PRIMERO','SEGUNDO','TERCERO','CUARTO','QUINTO','SEXTO','SEPTIMO','OCTAVO','NOVENO','DECIMO','DECIMO PRIMERO','DECIMO SEGUNDO','DECIMO TERCERO','DECIMO CUARTO','DECIMO QUINTO','DECIMO SEXTO','DECIMO SEPTIMO','DECIMO OCTAVO','DECIMO NOVENO');
implementation

uses UnitImpresion,UnitGlobales, UnitDatosActa, unitMain,
  UnitAdicionCreditos;

{$R *.dfm}

procedure TFrmActa.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.Clear;
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmActa.EDactaKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActa.EDlugarKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActa.EDpresidenteKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActa.EDcargoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActa.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        FrmDatosActa := TFrmDatosActa.Create(Self);
        EDacta.Text := frmMain.n_acta;
        Edfecha.Text := DateToStr(vFechaEnte);
        Valida_Orden := True;
end;

procedure TFrmActa.BtagregaClick(Sender: TObject);
begin
        with FrmDatosActa do
        begin
          MOrden.Text := '';
          EDdescripcion.Text := '';
          JVnumero.Value := CDorden.RecordCount + 1;
          tipo := True;
          ShowModal;
        end;
end;

procedure TFrmActa.BtreporteClick(Sender: TObject);
begin
        CDorden1.CancelUpdates;
        CDorden2.CancelUpdates;
        numero_solicitudes := CDsolicitud.RecordCount;
        valor_admisible := 0;
        valor_noadmisible := 0;
        with CDsolicitud do
        begin
           First;
           while not Eof do
           begin
             if FieldValues['estado'] = 4 then
             begin
               aprobada := aprobada + 1;
               aprobado := aprobado + FieldByName('valor').AsCurrency;
               if FieldByName('id_garantia').AsInteger = 1 then
               begin
                  total_admisible := total_admisible + 1;
                  valor_admisible := valor_admisible + FieldByName('valor').AsCurrency;
               end
               else if FieldByName('id_garantia').AsInteger = 2 then
               begin
                  total_noadmisible := total_noadmisible + 1;
                  valor_noadmisible := valor_noadmisible + FieldByName('valor').AsCurrency;
               end;
            end// valida estado
             else if FieldValues['estado'] = 7 then
               negada := negada + 1
             else if FieldValues['estado'] = 9 then
               aplazada := aplazada + 1
             else if FieldValues['estado'] = 15 then
               anuladas := anuladas + 1
             else if FieldValues['estado']  = 16 then
             begin
               ratificada := ratificada + 1;
               valor_ratificado := valor_ratificado + FieldByName('valor').AsCurrency;
             end;
             Next;
            end;
           end;
            //////
        with CDorden do
        begin
          First;
          while not Eof do
          begin
            if CDordentipo.Value then
            begin
               CDorden2.Append;
               CDorden2.FieldValues['numero'] := CDordennumero.Value;
               CDorden2.FieldValues['titulo'] := numero_orden[CDordennumero.Value] + ': ' + CDordentitulo.Value;
               CDorden2.FieldValues['descripcion'] := CDordendescripcion.Value;
               CDorden2.Post;
            end
            else
            begin
               CDorden1.Append;
               CDorden1.FieldValues['numero'] := CDordennumero.Value;
               CDorden1.FieldValues['titulo'] := numero_orden[CDordennumero.Value] + ': ' + CDordentitulo.Value;
               CDorden1.FieldValues['descripcion'] := CDordendescripcion.Value;
               CDorden1.Post;
            end;
             Next;
          end;
        end;
        CDorden1.IndexFieldNames := 'numero';
        CDorden2.IndexFieldNames := 'numero';

        imprimir_reporte(frmMain.wpath + 'reporte\repacta.frf');
end;

procedure TFrmActa.BTregistraClick(Sender: TObject);
var    total,valor_solicitud :Currency;
begin
      if MessageDlg('Esta Seguro de Realizar el Registro Definitivo?',mtInformation,[mbyes,mbno],0) = mryes then
      begin
       try
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('delete from "ent$acta" where NUMERO_ACTA = :NUMERO_ACTA');
          ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
          Open;
          SQL.Clear;
          SQL.Add('delete from "ent$registroacta" where NUMERO_ACTA = :NUMERO_ACTA');
          ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
          Open;
          SQL.Clear;
          SQL.Add('insert into "ent$acta" values (:NUMERO_ACTA,:PRESIDENTE_SESION,:CARGO,:FECHA,:HORA,:VALOR_REAL,:VALOR_PERSONAL,:LUGAR,1)');
          ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
          ParamByName('PRESIDENTE_SESION').AsString := EDpresidente.Text;
          ParamByName('CARGO').AsString := EDcargo.Text;
          ParamByName('FECHA').AsDateTime := StrToDate(Edfecha.Text);
          ParamByName('HORA').AsTime := StrToTime(EDhora.Text);
          ParamByName('VALOR_REAL').AsCurrency := valor_admisible;
          ParamByName('VALOR_PERSONAL').AsCurrency := valor_noadmisible;
          ParamByName('LUGAR').AsString := EDlugar.Text;
          ExecSQL;
          if CDanexo.RecordCount > 0 then
          begin
            SQL.Clear;
            SQL.Add('insert into "ent$registroacta" values (:NUMERO_ACTA,:ID_ENTRADA,:DESCRIPCION,:TITULO)');
            ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
            ParamByName('ID_ENTRADA').AsInteger := -1;
            ParamByName('DESCRIPCION').AsString := CDanexoanexo.Value;
            ParamByName('TITULO').AsString := '';
            ExecSQL;
          end;
          SQL.Clear;
          SQL.Add('insert into "ent$registroacta" values (:NUMERO_ACTA,:ID_ENTRADA,:DESCRIPCION,:TITULO)');
          CDorden.First;
          while not CDorden.Eof do
          begin
            ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
            ParamByName('ID_ENTRADA').AsInteger := CDordennumero.Value;
            ParamByName('DESCRIPCION').AsString := CDordendescripcion.Value;
            ParamByName('TITULO').AsString := CDordentitulo.Value;
            ExecSQL;
            CDorden.Next;
          end;
         Transaction.Commit;
        end;
        except
          IBQuery1.Transaction.Rollback;
        end;
        Btreporte.Click;
        limpiar;
      end;
end;

procedure TFrmActa.EDcargoExit(Sender: TObject);
var    numero,n_invitados :integer;
       letras_a,descripcion,definicion :string;
begin
      if Valida_Orden then
      begin
       numero := CDparticipantes.RecordCount;
       NLetra1.Numero := numero;
       if CDinvitados.RecordCount > 1 then
          definicion := 'Los Señores '
       else
          definicion := 'El señor ';
       with CDinvitados do
       begin
          n_invitados := RecordCount;
          First;
          while not Eof do
          begin
            if RecNo = 1 then
               definicion := definicion + FieldByName('nombre').AsString
            else
            begin
               if RecNo <> n_invitados then
                  definicion := definicion + ', ' + FieldByName('nombre').AsString
               else
                  definicion := definicion + ' y ' + FieldByName('nombre').AsString;
            end;
            Next;
          end;
       end;
        with CDorden do
        begin
           descripcion := 'Con la Participación de ' + NLetra1.Letras + '(' + inttostr(numero) + ') miembros principales se comprobo quórun para deliberar y tomar desiciones validas';
           Append;
           FieldValues['numero'] := 1;
           FieldValues['titulo'] := 'COMPROBACIÓN DEL QUÓRUM.';
           FieldValues['descripcion'] := descripcion;
           FieldValues['tipo'] := False;
           Post;
           descripcion := 'Por Acuerdo entre los miembros fue elegido como presidente al señor ' + EDpresidente.Text + ' ' + EDcargo.Text ;
           Append;
           FieldValues['numero'] := 2;
           FieldValues['titulo'] := 'NOMBRAMIENTO DEL PRESIDENTE.';
           FieldValues['descripcion'] := descripcion;
           FieldValues['tipo'] := False;
           Post;
           descripcion := 'El orden del día fue puesto a consideración por parte del señor ' + EDpresidente.Text + ' ' + EDcargo.Text;
           descripcion := descripcion + ' siendo este aprobado por Unanimidad.';
           Append;
           FieldValues['numero'] := 3;
           FieldValues['titulo'] := 'APROBACIÓN DEL ORDEN DEL DIA.';
           FieldValues['descripcion'] := descripcion;
           FieldValues['tipo'] := False;
           Post;
           descripcion := definicion + ', Analista(s) de Créditos, presentan los siguientes Créditos con garantia personal y real. Dando las explicaciones y aclaraciones ';
           descripcion := descripcion + 'a cada una de las solicitudes presentadas teniendo en cuenta la garantia, capacidad de pago, endeudamiento, la inversión del solicitante, las cuales se relacionan a continuación.';
           Append;
           FieldValues['numero'] := 4;
           FieldValues['titulo'] := 'LECTURA Y APROBACIÓN DE SOLICITUDES DE CREDITO.';
           FieldValues['descripcion'] := descripcion;
           FieldValues['tipo'] := False;
           Post;
        end;
        Valida_Orden := False;
       end;
end;

procedure TFrmActa.BtmodificarClick(Sender: TObject);
begin
        with FrmDatosActa do
        begin
           MOrden.Text := CDordendescripcion.Value;
           JVnumero.Value := CDordennumero.Value;
           EDdescripcion.Text := CDordentitulo.Value;
           if CDordennumero.Value >= 5 then
              tipo := False
           else
              tipo := True;
           ShowModal;
        end;
end;

procedure TFrmActa.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'lugar' then
           ParValue := EDlugar.Text;
        if ParName = 'acta' then
           ParValue := EDacta.Text;
        if ParName = 'hora' then
           ParValue := EDhora.Text; //FormatDateTime('hh:mm AM/PM',hora_sesion);
        if ParName = 'fecha' then
           ParValue := StrToDate(Edfecha.Text);
        if ParName = 'vreal' then
           ParValue := valor_admisible;
        if ParName = 'vpersonal' then
           ParValue := valor_noadmisible;
        if ParName = 'contador' then
        begin
           NLetra1.Numero := numero_solicitudes;
           ParValue := NLetra1.Letras + '(' + IntToStr(numero_solicitudes) + ')';
        end;
end;

procedure TFrmActa.BteliminaClick(Sender: TObject);
begin
        with FrmDatosActa do
        begin
          MOrden.Text := '';
          EDdescripcion.Text := '';
          JVnumero.Value := -1;
          MOrden.Text := CDanexo.FieldByName('anexo').AsString;
          tipo := True;
          ShowModal;
        end;

end;

procedure TFrmActa.BitBtn1Click(Sender: TObject);
begin
        FrmAdicionCreditos := TFrmAdicionCreditos.Create(self);
        FrmAdicionCreditos.ShowModal;
        FrmAdicionCreditos.Free;
end;

procedure TFrmActa.limpiar;
begin
        Btagrega.Enabled := False;
        Btelimina.Enabled := False;
        BitBtn1.Enabled := False;
        Btmodificar.Enabled := False;
        EDpresidente.ReadOnly :=True;
        EDcargo.ReadOnly := True;
        EDlugar.ReadOnly := True;
        BTregistra.Enabled := False;
        BTborra.Enabled := False;
        Btparcial.Enabled := False;
end;

procedure TFrmActa.EDactaExit(Sender: TObject);
var     estado,cuenta :string;
        id_estado :Integer;
        valida_acta :Boolean;
        nombres_sol :string;
        des_garantia :string;
        id_garantia :Integer;
        id_persona_sol :string;
        id_identificacion_sol :Integer;
        valor_aprobado :Currency;
        plazo_aprobado :Currency;
        concepto_negacion :string;
        valida_concepto :Boolean;
begin
        CDanexo.CancelUpdates;
        CDorden.CancelUpdates;
        concepto_negacion := '';
        CDsolicitud.CancelUpdates;
        valida_acta := True;
        valida_concepto := True;
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "ent$acta" where NUMERO_ACTA = :NUMERO');
          ParamByName('NUMERO').AsString := EDacta.Text;
          Open;
          if RecordCount <> 0 then
          begin
            valida_concepto := false;
            if Abs(FieldByName('REGISTRADO').AsInteger) = 0 then
               valida_acta := true
            else
               valida_acta := False;
            if MessageDlg('El Acta ya Fue Registrada desea Continuar',mtInformation,[mbyes,mbno],0) = mrno then
            begin
               EDacta.SetFocus;
               Exit;
            end;
               EDacta.ReadOnly := False;
               EDpresidente.Text := FieldByName('PRESIDENTE_SESION').AsString;
               EDlugar.Text := FieldByName('LUGAR').AsString;
               Edfecha.Text := FormatDateTime('yyyy/mm/dd',FieldByName('FECHA').AsDateTime);
               EDcargo.Text := FieldByName('CARGO').AsString;
               valor_admisible := FieldByName('VALOR_REAL').AsCurrency;
               valor_noadmisible := FieldByName('VALOR_PERSONAL').AsCurrency;
               EDhora.Text := FormatDateTime('hh:mm AM/PM',FieldByName('HORA').AsDateTime);
               SQL.Clear;
               SQL.Add('select * from "ent$registroacta" where NUMERO_ACTA = :NUMERO');
               ParamByName('NUMERO').AsString := EDacta.Text;
               Open;
               while not Eof do // WHILE 1
               begin
                 if FieldByName('ID_ENTRADA').AsInteger = -1 then
                 begin
                   CDanexo.Append;
                   CDanexo.FieldValues['anexo'] := FieldByName('DESCRIPCION').AsString;
                   CDanexo.Post;
                 end
                 else
                 begin
                  CDorden.Append;
                  CDorden.FieldValues['numero'] := FieldByName('ID_ENTRADA').AsInteger;
                  CDorden.FieldValues['titulo'] := FieldByName('TITULO').AsString;
                  CDorden.FieldValues['descripcion'] := FieldByName('DESCRIPCION').AsString;
                  if  (FieldByName('ID_ENTRADA').AsInteger > 0) and (FieldByName('ID_ENTRADA').AsInteger < 5) then
                     CDorden.FieldValues['tipo'] := False
                  else
                     CDorden.FieldValues['tipo'] := True;
                  CDorden.Post;
                 end;
                 Next;
               end;// FIN DEL WHILE 1
           end;
            SQL.Clear;
            SQL.Add('select * from "ent$asistente" where NUMERO_ACTA = :NUMERO');
            ParamByName('NUMERO').AsString := EDacta.Text;
            Open;
            CDinvitados.CancelUpdates;
            CDparticipantes.CancelUpdates;
            while not Eof do// while 3
            begin
              if Abs(FieldByName('ES_INVITADO').AsInteger) = 0 then
              begin
                CDparticipantes.Append;
                CDparticipantes.FieldValues['nombre'] := FieldByName('NOMBRE').AsString;
                CDparticipantes.FieldValues['cargo'] :=  FieldByName('CARGO').AsString;
                CDparticipantes.post;
              end
              else
              begin
                CDinvitados.Append;
                CDinvitados.FieldValues['nombre'] := FieldByName('NOMBRE').AsString;
                CDinvitados.FieldValues['cargo'] :=  FieldByName('CARGO').AsString;
                CDinvitados.Post;
              end;
              Next;
             end;// fin while
          //end;
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
            SQL.Add('"col$registrosesion".ESTADO,');
            SQL.Add('"col$registrosesion".ID_SOLICITUD');
            SQL.Add('FROM');
            SQL.Add('"col$registrosesion"');
            SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$registrosesion".ESTADO = "col$estadosolicitud".ID_ESTADO)');
            SQL.Add('WHERE');
            SQL.Add('("col$registrosesion".ACTA = :N_ACTA) AND ("col$registrosesion".ID_ENTE_APROBADOR = 2) AND ("col$registrosesion".ID_AGENCIA = 1)');
            ParamByName('N_ACTA').AsString := EDacta.Text;
            Open;
//          if RecordCount = 0 then
//            MessageDlg('No se Encontraron Solicitudes Asociadas a este Numero de Acta',mtInformation,[mbok],0);
          while not Eof do
          begin
            estado := FieldByName('DESCRIPCION_ESTADO').AsString;
            id_estado := FieldByName('ESTADO').AsInteger;
            IBQuery2.SQL.Clear;
            IBQuery2.SQL.Add('SELECT');
            IBQuery2.SQL.Add('"gen$persona".NOMBRE,');
            IBQuery2.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
            IBQuery2.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
            IBQuery2.SQL.Add('"col$solicitud".ID_PERSONA,');
            IBQuery2.SQL.Add('"col$solicitud".ID_IDENTIFICACION,');
            IBQuery2.SQL.Add('"col$solicitud".PLAZO_APROBADO,');
            IBQuery2.SQL.Add('"col$solicitud".GARANTIA,');
            IBQuery2.SQL.Add('"col$solicitud".VALOR_APROBADO,');
            IBQuery2.SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
            IBQuery2.SQL.Add('"col$solicitud".ID_SOLICITUD');
            IBQuery2.SQL.Add('FROM');
            IBQuery2.SQL.Add('"gen$persona"');
            IBQuery2.SQL.Add('INNER JOIN "col$solicitud" ON ("gen$persona".ID_IDENTIFICACION = "col$solicitud".ID_IDENTIFICACION) AND ("gen$persona".ID_PERSONA = "col$solicitud".ID_PERSONA)');
            IBQuery2.SQL.Add('INNER JOIN "col$garantia" ON ("col$solicitud".GARANTIA = "col$garantia".ID_GARANTIA)');
            IBQuery2.SQL.Add('WHERE');
            IBQuery2.SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)');
            IBQuery2.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
            IBQuery2.Open;
            nombres_sol := IBQuery2.FieldByName('NOMBRE').AsString + ' ' + IBQuery2.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString;
            des_garantia := IBQuery2.FieldByName('DESCRIPCION_GARANTIA').AsString;
            id_garantia := IBQuery2.FieldByName('GARANTIA').AsInteger;
            id_persona_sol := IBQuery2.FieldByName('ID_PERSONA').AsString;
            id_identificacion_sol := IBQuery2.FieldByName('ID_IDENTIFICACION').AsInteger;
            valor_aprobado := IBQuery2.FieldByName('VALOR_APROBADO').AsCurrency;
            plazo_aprobado := IBQuery2.FieldByName('PLAZO_APROBADO').AsInteger;
            IBQuery2.SQL.Clear;
            IBQuery2.SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
            IBQuery2.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
            IBQuery2.ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_sol;
            IBQuery2.ParamByName('ID_PERSONA').AsString := id_persona_sol;
            IBQuery2.Open;
            cuenta := '20' + IntToStr(Agencia) + '-' + Format('%.6d',[ibquery2.FieldByName('NUMERO_CUENTA').AsInteger]);
            CDsolicitud.Append;
            CDsolicitud.FieldValues['cuenta'] := cuenta;
            CDsolicitud.FieldValues['nombres'] := nombres_sol;
            CDsolicitud.FieldValues['valor'] := valor_aprobado;
            CDsolicitud.FieldValues['garantia'] := des_garantia;
            CDsolicitud.FieldValues['plazo'] := plazo_aprobado;
            CDsolicitud.FieldValues['decision'] := estado;
            CDsolicitud.FieldValues['estado'] := id_estado;
            CDsolicitud.FieldValues['id_garantia'] := id_garantia;
            CDsolicitud.post;
            if valida_concepto then
            begin
              if id_estado = 7 then
                 concepto_negacion := concepto_negacion + 'La Solicitud del (de la) Señor(a) ' + nombres_sol + ' por valor de : ' +  FormatCurr('##,##.00',valor_aprobado) + ' fue Negado por el siguiente motivo: ' + observacion(6,FieldByName('ID_SOLICITUD').AsString) + #13
                 else if id_estado = 15 then
                    concepto_negacion := concepto_negacion + 'La Solicitud del (de la) Señor(a) ' + nombres_sol + ' por valor de : ' + FormatCurr('##,##.00',valor_aprobado) + ' fue Anulada por el siguiente motivo: ' + observacion(16,FieldByName('ID_SOLICITUD').AsString) + #13
                    else if id_estado = 9 then
                       concepto_negacion := concepto_negacion + 'La Solicitud del (de la) Señor(a) ' + nombres_sol + ' por valor de : ' +  FormatCurr('##,##.00',valor_aprobado) + ' fue Aplazada por el siguiente motivo: ' + observacion(15,FieldByName('ID_SOLICITUD').AsString) + #13
                       else if id_estado = 16 then
                          concepto_negacion := concepto_negacion + 'La Solicitud del (de la) Señor(a) ' + nombres_sol + ' por valor de : ' +  FormatCurr('##,##.00',valor_aprobado) + ' fue Ratificada por el siguiente motivo: ' + observacion(17,FieldByName('ID_SOLICITUD').AsString) + #13
                          else if id_estado = 8 then
                             concepto_negacion := concepto_negacion + 'La Solicitud del (de la) Señor(a) ' + nombres_sol + ' por valor de : ' +  FormatCurr('##,##.00',valor_aprobado) + ' fue pasada al Consejo de Admon por el siguiente motivo: ' + observacion(18,FieldByName('ID_SOLICITUD').AsString) + #13

            end;
            Next;
          end;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$registrosesion".ID_SOLICITUD,');
          SQL.Add('"col$registrosesion".ESTADO,');
          SQL.Add('"col$registrosesion".PLAZO,');
          SQL.Add('"col$registrosesion".ACTA,');
          SQL.Add('"col$registrosesion".FECHA,');
          SQL.Add('"col$registrosesion".CUENTA,');
          SQL.Add('"col$registrosesion".ID_AGENCIA,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$registrosesion"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$registrosesion".ESTADO = "col$estadosolicitud".ID_ESTADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$registrosesion".ACTA = :N_ACTA) AND');
          SQL.Add('("col$registrosesion".ID_AGENCIA <> 1) AND');
          SQL.Add('("col$registrosesion".ID_ENTE_APROBADOR = 2)');
          ParamByName('N_ACTA').AsString := EDacta.Text;
          Open;
          while not Eof do
          begin
            estado := FieldByName('DESCRIPCION_ESTADO').AsString;
            id_estado := FieldByName('ESTADO').AsInteger;
            cuenta := FieldByName('CUENTA').AsString;
            IBQuery2.Close;
            IBQuery2.SQL.Clear;
            IBQuery2.SQL.Add('SELECT');
            IBQuery2.SQL.Add('"col$registroagencia".ASOCIADO,');
            IBQuery2.SQL.Add('"col$registroagencia".VALOR_SOLICITUD,');
            IBQuery2.SQL.Add('"col$registroagencia".GARANTIA,');
            IBQuery2.SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
            IBQuery2.SQL.Add('"col$registroagencia".CONCEPTO');
            IBQuery2.SQL.Add('FROM');
            IBQuery2.SQL.Add('"col$registroagencia"');
            IBQuery2.SQL.Add('LEFT OUTER JOIN "col$garantia" ON ("col$registroagencia".GARANTIA = "col$garantia".ID_GARANTIA)');
            IBQuery2.SQL.Add('WHERE');
            IBQuery2.SQL.Add('("col$registroagencia".ID_SOLICITUD = :ID_SOLICITUD) AND');
            IBQuery2.SQL.Add('("col$registroagencia".TIPO = ''E'') AND ("col$registroagencia".FECHA_ANALISIS = :FECHA)');
            IBQuery2.SQL.Add('AND ("col$registroagencia".ID_AGENCIA = :ID_AGENCIA)');
            IBQuery2.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
            IBQuery2.ParamByName('FECHA').AsDate := FieldByName('FECHA').AsDateTime;
            IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
            IBQuery2.Open;
            //IBQuery2.Last;
            CDsolicitud.Append;
            CDsolicitud.FieldValues['cuenta'] := cuenta;
            CDsolicitud.FieldValues['nombres'] := IBQuery2.FieldByName('ASOCIADO').AsString;
            CDsolicitud.FieldValues['valor'] := IBQuery2.FieldByName('VALOR_SOLICITUD').AsCurrency;
            CDsolicitud.FieldValues['garantia'] := IBQuery2.FieldByName('DESCRIPCION_GARANTIA').AsString;
            CDsolicitud.FieldValues['plazo'] := FieldByName('PLAZO').AsInteger;
            CDsolicitud.FieldValues['decision'] := estado;
            CDsolicitud.FieldValues['estado'] := id_estado;
            CDsolicitud.FieldValues['id_garantia'] := IBQuery2.FieldByName('GARANTIA').AsInteger;
            CDsolicitud.post;
            if valida_concepto then
            begin
            if id_estado = 7 then
               concepto_negacion := concepto_negacion + 'La Solicitud del (de la) Señor(a) ' + IBQuery2.FieldByName('ASOCIADO').AsString + ' por valor de : ' +  FormatCurr('##,##.00',IBQuery2.FieldByName('VALOR_SOLICITUD').AsCurrency) +
               ' fue Negado por el siguiente motivo: ' + IBQuery2.FieldByName('CONCEPTO').AsString + #13
               else if id_estado = 15 then
                 concepto_negacion := concepto_negacion + 'La Solicitud del (de la) Señor(a) ' + IBQuery2.FieldByName('ASOCIADO').AsString + ' por valor de : ' +  FormatCurr('##,##.00',IBQuery2.FieldByName('VALOR_SOLICITUD').AsCurrency) +
                 ' fue Anulada por el siguiente motivo: ' + IBQuery2.FieldByName('CONCEPTO').AsString + #13
                 else if id_estado = 9 then
                   concepto_negacion := concepto_negacion + 'La Solicitud del (de la) Señor(a) ' + IBQuery2.FieldByName('ASOCIADO').AsString + ' por valor de : ' +  FormatCurr('##,##.00',IBQuery2.FieldByName('VALOR_SOLICITUD').AsCurrency) +
                  ' fue Aplazada por el siguiente motivo: ' + IBQuery2.FieldByName('CONCEPTO').AsString + #13
                     else if id_estado = 16 then
                        concepto_negacion := concepto_negacion + 'La Solicitud del (de la) Señor(a) ' + IBQuery2.FieldByName('ASOCIADO').AsString + ' por valor de : ' +  FormatCurr('##,##.00',IBQuery2.FieldByName('VALOR_SOLICITUD').AsCurrency) +
                       ' fue Ratificada por el siguiente motivo: ' + IBQuery2.FieldByName('CONCEPTO').AsString + #13
                        else if id_estado = 8 then
                           concepto_negacion := concepto_negacion + 'La Solicitud del (de la) Señor(a) ' + IBQuery2.FieldByName('ASOCIADO').AsString + ' por valor de : ' +  FormatCurr('##,##.00',IBQuery2.FieldByName('VALOR_SOLICITUD').AsCurrency) +
                          ' fue pasada al Consejo de Admon por el siguiente motivo: ' + IBQuery2.FieldByName('CONCEPTO').AsString + #13

            end;
            Next;
          end;
        end;
        if valida_concepto then
        begin
          CDanexo.Append;
          CDanexo.FieldValues['anexo'] := concepto_negacion;
          CDanexo.Post;
        end;
        if valida_acta = False then
        begin
           limpiar;
           Panel1.Enabled := False;
           Btreporte.Click;
        end;
end;

procedure TFrmActa.EDhoraKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActa.EdfechaKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        CDsolicitud.CancelUpdates;
        CDORDEN1.CancelUpdates;
        CDorden2.CancelUpdates;
        CDparticipantes.CancelUpdates;
        CDinvitados.CancelUpdates;
end;

procedure TFrmActa.BTborraClick(Sender: TObject);

begin
        if CDorden.RecNo > 4 then
        begin
           if CDorden.RecNo = CDorden.RecordCount then
              CDorden.Delete;
        end;
end;

procedure TFrmActa.BtparcialClick(Sender: TObject);
begin
      if MessageDlg('Esta Seguro de Realizar el Registro Parcial?',mtInformation,[mbyes,mbno],0) = mryes then
      begin
       try
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('delete from "ent$acta" where NUMERO_ACTA = :NUMERO_ACTA');
          ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
          Open;
          SQL.Clear;
          SQL.Add('delete from "ent$registroacta" where NUMERO_ACTA = :NUMERO_ACTA');
          ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
          Open;
          SQL.Clear;
          SQL.Add('insert into "ent$acta" values (:NUMERO_ACTA,:PRESIDENTE_SESION,:CARGO,:FECHA,:HORA,:VALOR_REAL,:VALOR_PERSONAL,:LUGAR,0)');
          ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
          ParamByName('PRESIDENTE_SESION').AsString := EDpresidente.Text;
          ParamByName('CARGO').AsString := EDcargo.Text;
          ParamByName('FECHA').AsDateTime := StrToDate(Edfecha.Text);
          ParamByName('HORA').AsTime := StrToTime(EDhora.Text);
          ParamByName('VALOR_REAL').AsCurrency := valor_admisible;
          ParamByName('VALOR_PERSONAL').AsCurrency := valor_noadmisible;
          ParamByName('LUGAR').AsString := EDlugar.Text;
          ExecSQL;
          if CDanexo.RecordCount > 0 then
          begin
            SQL.Clear;
            SQL.Add('insert into "ent$registroacta" values (:NUMERO_ACTA,:ID_ENTRADA,:DESCRIPCION,:TITULO)');
            ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
            ParamByName('ID_ENTRADA').AsInteger := -1;
            ParamByName('DESCRIPCION').AsString := CDanexoanexo.Value;
            ParamByName('TITULO').AsString := '';
            ExecSQL;
          end;
          SQL.Clear;
          SQL.Add('insert into "ent$registroacta" values (:NUMERO_ACTA,:ID_ENTRADA,:DESCRIPCION,:TITULO)');
          CDorden.First;
          while not CDorden.Eof do
          begin
            ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
            ParamByName('ID_ENTRADA').AsInteger := CDordennumero.Value;
            ParamByName('DESCRIPCION').AsString := CDordendescripcion.Value;
            ParamByName('TITULO').AsString := CDordentitulo.Value;
            ExecSQL;
            CDorden.Next;
          end;
         Transaction.Commit;
        end;
        except
          IBQuery1.Transaction.Rollback;
        end;
        Btreporte.Click;
        limpiar;
      end;

end;

function TFrmActa.observacion(tipo: integer; solicitud: string): string;
begin
        with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT OBSERVACION FROM "col$observacion" WHERE (ID_OBSERVACION = :TIPO) AND (ID_SOLICITUD = :SOLICITUD)');
          ParamByName('SOLICITUD').AsString := solicitud;
          ParamByName('TIPO').AsInteger := tipo;
          ExecQuery;
          Result := LowerCase(FieldByName('OBSERVACION').AsString);
          Close;
        end;
end;
end.
