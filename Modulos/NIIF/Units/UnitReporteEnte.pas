unit UnitReporteEnte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls,
  ExtCtrls, Buttons, FR_Class, DBClient, FR_DSet, FR_DBSet;

type
  TFrmReporteEnte = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    IBQuery1: TIBQuery;
    DBente: TDBLookupComboBox;
    BTreporte: TBitBtn;
    BTcerrar: TBitBtn;
    DataSource1: TDataSource;
    IBtotal: TIBQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    CDreporte: TClientDataSet;
    CDreportegarantia: TStringField;
    CDreportenombres: TStringField;
    CDreportevalor: TCurrencyField;
    CDreportesolicitud: TStringField;
    CDreporteestado: TStringField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    TDfecha: TDateTimePicker;
    ChTotal: TCheckBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DBhoraini: TDBLookupComboBox;
    DBhorafin: TDBLookupComboBox;
    IBhoraini: TIBQuery;
    IBhorafin: TIBQuery;
    DShora_ini: TDataSource;
    DShora_fin: TDataSource;
    CDreporteagencia: TStringField;
    CDestado: TClientDataSet;
    CDestadodescripcion: TStringField;
    CDestadototal: TIntegerField;
    frDBDataSet2: TfrDBDataSet;
    IBtotal_of: TIBQuery;
    IBtotal_h: TIBQuery;
    IBtotal_of_h: TIBQuery;
    frDBDataSet3: TfrDBDataSet;
    CDreporteempleado: TStringField;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    IBQuery4: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BTcerrarClick(Sender: TObject);
    procedure DBenteKeyPress(Sender: TObject; var Key: Char);
    procedure TDfechaKeyPress(Sender: TObject; var Key: Char);
    procedure Fecha2KeyPress(Sender: TObject; var Key: Char);
    procedure BTreporteClick(Sender: TObject);
    procedure TDfechaChange(Sender: TObject);
    procedure DBhorainiClick(Sender: TObject);
    procedure DBhorafinEnter(Sender: TObject);
    procedure ChTotalClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
       Vadmisible,Vnoadmisible :Currency;
       Vaprobada,Vaplazada,Vnegada :Integer;
       aprobado,ratificada,total_r,valor_ratificado,total_admisible :Currency;
       total_noadmisible,valor_admisible,valor_noadmisible :Currency;
    total: integer;
    acta: string;
    retorna_fecha: tdate;
    DesAgencia :string;

    procedure imprimir_reporte(cadena: string);
    procedure reporte_total;
    procedure reporte_parcial;
    function busca_emp(dbalias_e: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReporteEnte: TFrmReporteEnte;

implementation
uses UnitGlobales, UnitImpresion, UnitdmGeneral, unitMain;

{$R *.dfm}

procedure TFrmReporteEnte.FormCreate(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
        IBQuery1.Open;
        IBQuery1.Last;
        DBente.KeyValue := Id_EnteAprobador;
        TDfecha.Date := vFechaEnte;
end;

procedure TFrmReporteEnte.BTcerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmReporteEnte.DBenteKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmReporteEnte.TDfechaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmReporteEnte.Fecha2KeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmReporteEnte.BTreporteClick(Sender: TObject);
begin
        with IBQuery4 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA = :ID');
          ParamByName('ID').AsInteger := Agencia;
          Open;
          DesAgencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
        end;
        CDreporte.CancelUpdates;
        if ChTotal.Checked then
           reporte_total
        else
           reporte_parcial
end;

procedure TFrmReporteEnte.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.Clear;
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmReporteEnte.TDfechaChange(Sender: TObject);
begin
        with IBhoraini do
        begin
          Close;
          ParamByName('FECHA').AsDate := TDfecha.Date;
          ParamByName('ID_ENTE').AsInteger := DBente.KeyValue;
          Open;
          if RecordCount = 0 then
          begin
            IBhorafin.Close;
            IBhoraini.Close;
            Exit;
          end;
          Last;
        end;
end;

procedure TFrmReporteEnte.DBhorainiClick(Sender: TObject);
begin
        with IBhorafin do
        begin
          Close;
          ParamByName('HORA').AsTime := DBhoraini.KeyValue;
          Open;
          if RecordCount <> 0 then
             DBhorafin.KeyValue := FieldByName('HORA_FIN').AsDateTime;
          First;
        end;
end;

procedure TFrmReporteEnte.DBhorafinEnter(Sender: TObject);
begin
        DBhorafin.DropDown
end;

procedure TFrmReporteEnte.ChTotalClick(Sender: TObject);
begin
        if ChTotal.Checked then
        begin
          DBhoraini.Enabled := False;
          DBhorafin.Enabled := False;
        end
        else
        begin
          DBhoraini.Enabled := True;
          DBhorafin.Enabled := True;
        end;
end;

procedure TFrmReporteEnte.reporte_total;
var     aprobada,aplazada,negada,ratificada,anulada,vAgen :Integer;
        vSolicitud, vEstado, vAgencia, vCuenta :string;
begin
        
        aplazada := 0;
        negada := 0;
        aprobada := 0;
        aprobado := 0;
        ratificada := 0;
        total_r := 0;
        anulada := 0;
        valor_ratificado := 0;
        total_admisible := 0;
        total_noadmisible := 0;
        valor_admisible := 0;
        valor_noadmisible := 0;
        with IBtotal do
        begin
           Close;
           ParamByName('FECHA').AsDate := TDfecha.DateTime;
           ParamByName('ID_APROBADOR').AsInteger := DBente.KeyValue;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           Open;
           while not Eof do
           begin
             if FieldByName('ESTADO').AsInteger = 4 then
             begin
               aprobada := aprobada + 1;
               aprobado := aprobado + FieldByName('VALOR_APROBADO').AsCurrency;
               if FieldByName('GARANTIA').AsInteger = 1 then
               begin
                  total_admisible := total_admisible + 1;
                  valor_admisible := valor_admisible + FieldByName('VALOR_APROBADO').AsCurrency;
               end
               else if FieldByName('GARANTIA').AsInteger = 2 then
               begin
                  total_noadmisible := total_noadmisible + 1;
                  valor_noadmisible := valor_noadmisible + FieldByName('VALOR_APROBADO').AsCurrency;
               end;
             end
             else if FieldByName('ESTADO').AsInteger = 7 then
               negada := negada + 1
             else if FieldByName('ESTADO').AsInteger = 9 then
               aplazada := aplazada + 1
             else if FieldByName('ESTADO').AsInteger  = 16 then
             begin
               ratificada := ratificada + 1;
               valor_ratificado := valor_ratificado + FieldByName('VALOR_APROBADO').AsCurrency;
             end
             else if FieldByName('ESTADO').AsInteger = 15 then
                  anulada := anulada + 1;
                CDreporte.Append;
                CDreporte.FieldValues['garantia'] := FieldByName('DESCRIPCION_GARANTIA').AsString;
                CDreporte.FieldValues['nombres'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                //if FieldByName('ESTADO').AsInteger = 4 then
                   CDreporte.FieldValues['valor'] := FieldByName('VALOR_APROBADO').AsCurrency;
                //else
                  // CDreporte.FieldValues['valor'] := 0;
                CDreporte.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString;
                CDreporte.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO').AsString;
                CDreporte.FieldValues['agencia'] := DesAgencia;
                CDreporte.FieldValues['empleado'] := BUSCA_EMP(FieldByName('DBALIAS').AsString);
                CDreporte.Post;
                acta := FieldByName('ACTA').AsString;
                retorna_fecha := FieldByName('FECHA').AsDateTime;
             Next;
           end;
        end; // oficinia principal
        //Otras Oficinas
        if Agencia = 1 then
        begin
          with IBtotal_of do
          begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('"col$registrosesion".CUENTA,"col$registrosesion".ID_AGENCIA,');
             SQL.Add('"col$registrosesion".ID_SOLICITUD,');
             SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA, "col$registrosesion".ESTADO');
             SQL.Add('FROM');
             SQL.Add('"col$registrosesion"');
             SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$registrosesion".ESTADO="col$estadosolicitud".ID_ESTADO)');
             SQL.Add('INNER JOIN "gen$agencia" ON ("col$registrosesion".ID_AGENCIA="gen$agencia".ID_AGENCIA)');
             SQL.Add('WHERE');
             SQL.Add('("col$registrosesion".FECHA = :FECHA) AND ');
             SQL.Add('("col$registrosesion".ID_ENTE_APROBADOR = :ENTE) AND ');
             SQL.Add('("col$registrosesion".ID_AGENCIA <> 1) ');
             ParamByName('FECHA').AsDate := TDfecha.DateTime;
             ParamByName('ENTE').AsInteger := DBente.KeyValue;
             Open;
             while not Eof do
             begin
               vCuenta := FieldByName('CUENTA').AsString;
               vSolicitud := FieldByName('ID_SOLICITUD').AsString;
               vEstado := FieldByName('DESCRIPCION_ESTADO').AsString;
               vAgencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
               vAgen := FieldByName('ID_AGENCIA').AsInteger;
               IBQuery3.Close;
               IBQuery3.ParamByName('ID').AsInteger := vAgen;
               IBQuery3.ParamByName('ID_SOLICITUD').AsString := vSolicitud;
               IBQuery3.ParamByName('ENTE').AsInteger := DBente.KeyValue;
               IBQuery3.Open;
               if FieldByName('ESTADO').AsInteger = 4 then
               begin
                aprobada := aprobada + 1;
                aprobado := aprobado + IBQuery3.FieldByName('VALOR_SOLICITUD').AsCurrency;
               end
               else if FieldByName('ESTADO').AsInteger = 15 then
                  anulada := anulada + 1
               else if FieldByName('ESTADO').AsInteger = 7 then
                 negada := negada + 1
               else if FieldByName('ESTADO').AsInteger = 9 then
                  aplazada := aplazada + 1
               else if FieldByName('ESTADO').AsInteger  = 16 then
               begin
                 ratificada := ratificada + 1;
                 valor_ratificado := valor_ratificado + IBQuery3.FieldByName('VALOR_SOLICITUD').AsCurrency;
               end;
               if IBQuery3.FieldByName('GARANTIA').AsInteger = 1 then
               begin
                  total_admisible := total_admisible + 1;
                  valor_admisible := valor_admisible + IBQuery3.FieldByName('VALOR_SOLICITUD').AsCurrency;
               end
               else if IBQuery3.FieldByName('GARANTIA').AsInteger = 2 then
               begin
                  total_noadmisible := total_noadmisible + 1;
                  valor_noadmisible := valor_noadmisible + IBQuery3.FieldByName('VALOR_SOLICITUD').AsCurrency;
               end;
                  CDreporte.Append;
                  CDreporte.FieldValues['garantia'] := IBQuery3.FieldByName('DESCRIPCION_GARANTIA').AsString;
                  CDreporte.FieldValues['nombres'] := IBQuery3.FieldByName('ASOCIADO').AsString;
                  CDreporte.FieldValues['valor'] := IBQuery3.FieldByName('VALOR_SOLICITUD').AsCurrency;
                  CDreporte.FieldValues['solicitud'] := vSolicitud;
                  CDreporte.FieldValues['estado'] := vEstado;
                  CDreporte.FieldValues['agencia'] := vAgencia;
                  CDreporte.FieldValues['empleado'] := '';//BUSCA_EMP(FieldByName('DBALIAS').AsString);
                  CDreporte.Post;
               Next;
             end;
          end;
        // FIN OTRAS OFICINAS
        end;
        total := 0;
       // CDinforme.CancelUpdates;
        CDestado.CancelUpdates;
        if aprobada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'APROBADAS';
          CDestado.FieldValues['total'] := aprobada;
          CDestado.Post;
          total := total + aprobada;
        end;
        if ratificada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'RATIFICADAS';
          CDestado.FieldValues['total'] := ratificada;
          CDestado.Post;
          total_r := total_r + ratificada;
        end;
        if negada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'NEGADAS';
          CDestado.FieldValues['total'] := negada;
          CDestado.Post;
          total := total + negada;
        end;
        if aplazada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'APLAZADAS';
          CDestado.FieldValues['total'] := aplazada;
          CDestado.Post;
          total := total + aplazada;
        end;
        if anulada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'ANULADAS';
          CDestado.FieldValues['total'] := anulada;
          CDestado.Post;
        end;

        CDreporte.IndexFieldNames := 'empleado;agencia';
        frmMain.CDinforme.IndexFieldNames := 'id_oficina';
        if DBente.KeyValue = 3 then
           imprimir_reporte(frmMain.wpath+'reporte\reprecupera_inf_c.frf')
        else
           imprimir_reporte(frmMain.wpath+'reporte\reprecupera_inf.frf');

end;

procedure TFrmReporteEnte.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if not ChTotal.Checked then
           if ParName = 'sesion' then
              ParValue := 'Hora Inicio : ' + FormatDateTime('hh:mm',DBhoraini.KeyValue) + ' Hora de Cierre : ' + FormatDateTime('hh:mm',DBhorafin.KeyValue);
        if ParName = 'enteaprobador' then
           ParValue := DBente.Text;
        if ParName = 'fecha_concepto' then
           ParValue := retorna_fecha;
        if ParName = 'valor_a' then
           ParValue := aprobado;
        if ParName = 'valor_r' then
           ParValue := valor_ratificado;
        if ParName = 'total' then
           ParValue := total;
        if ParName = 'total_r' then
           ParValue := total_r;
        if ParName = 'acta' then
           ParValue := acta;
        if ParName = 'total_ad' then
           ParValue := total_admisible;
        if ParName = 'total_noad' then
           ParValue := total_noadmisible;
        if ParName = 'valor_ad' then
           ParValue := valor_admisible;
        if ParName = 'valor_noad' then
           ParValue := valor_noadmisible;
end;

procedure TFrmReporteEnte.reporte_parcial;
var     aprobada,aplazada,negada,ratificada :Integer;
begin
        aplazada := 0;
        negada := 0;
        aprobada := 0;
        aprobado := 0;
        ratificada := 0;
        total_r := 0;
        valor_ratificado := 0;
        total_admisible := 0;
        total_noadmisible := 0;
        valor_admisible := 0;
        valor_noadmisible := 0;
        with IBtotal_h do
        begin
         try
           Close;
           ParamByName('FECHA').AsDate := TDfecha.DateTime;
           ParamByName('ID_APROBADOR').AsInteger := DBente.KeyValue;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('HORA').AsTime := DBhoraini.KeyValue;
           Open;
         except
         begin
           MessageDlg('Error en el Tipo de Datos',mtError,[mbok],0);
           Exit;
         end;
         end;
           if RecordCount = 0 then
           begin
             MessageDlg('La Consulta no Arrojo Resultados',mtInformation,[mbok],0);
             Exit;
           end;
           while not Eof do
           begin
             if FieldByName('ESTADO').AsInteger = 4 then
             begin
               aprobada := aprobada + 1;
               aprobado := aprobado + FieldByName('VALOR_APROBADO').AsCurrency;
               if FieldByName('GARANTIA').AsInteger = 1 then
               begin
                  total_admisible := total_admisible + 1;
                  valor_admisible := valor_admisible + FieldByName('VALOR_APROBADO').AsCurrency;
               end
               else if FieldByName('GARANTIA').AsInteger = 2 then
               begin
                  total_noadmisible := total_noadmisible + 1;
                  valor_noadmisible := valor_noadmisible + FieldByName('VALOR_APROBADO').AsCurrency;
               end;
             end
             else if FieldByName('ESTADO').AsInteger = 7 then
               negada := negada + 1
             else if FieldByName('ESTADO').AsInteger = 9 then
               aplazada := aplazada + 1
             else if FieldByName('ESTADO').AsInteger  = 16 then
             begin
               ratificada := ratificada + 1;
               valor_ratificado := valor_ratificado + FieldByName('VALOR_APROBADO').AsCurrency;
             end;
                CDreporte.Append;
                CDreporte.FieldValues['garantia'] := FieldByName('DESCRIPCION_GARANTIA').AsString;
                CDreporte.FieldValues['nombres'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                if FieldByName('ESTADO').AsInteger = 4 then
                   CDreporte.FieldValues['valor'] := FieldByName('VALOR_APROBADO').AsCurrency
                else
                   CDreporte.FieldValues['valor'] := 0;
                CDreporte.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString;
                CDreporte.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO').AsString;
                CDreporte.FieldValues['agencia'] := Ciudad;
                CDreporte.Post;
                acta := FieldByName('ACTA').AsString;
                retorna_fecha := FieldByName('FECHA').AsDateTime;
             Next;
           end;
        end; // oficinia principal
        //OTRAS OFICINAS
        with IBtotal_of_h do
        begin
           Close;
           ParamByName('FECHA').AsDate := TDfecha.DateTime;
           ParamByName('ENTE').AsInteger := DBente.KeyValue;
           ParamByName('HORA').AsTime := DBhoraini.KeyValue;
           Open;
           while not Eof do
           begin
             IBQuery3.Close;
             IBQuery3.ParamByName('ID').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
             IBQuery3.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
             IBQuery3.ParamByName('ENTE').AsInteger := DBente.KeyValue;
             IBQuery3.Open;
             if FieldByName('ESTADO').AsInteger = 4 then
             begin
               aprobada := aprobada + 1;
               aprobado := aprobado + IBQuery3.FieldByName('VALOR_SOLICITUD').AsCurrency;
             end
             else if FieldByName('ESTADO').AsInteger = 7 then
               negada := negada + 1
             else if FieldByName('ESTADO').AsInteger = 9 then
               aplazada := aplazada + 1
             else if FieldByName('ESTADO').AsInteger  = 16 then
             begin
               ratificada := ratificada + 1;
               valor_ratificado := valor_ratificado + IBQuery3.FieldByName('VALOR_SOLICITUD').AsCurrency;
             end;
             if IBQuery3.FieldByName('GARANTIA').AsInteger = 1 then
             begin
                total_admisible := total_admisible + 1;
                valor_admisible := valor_admisible + IBQuery3.FieldByName('VALOR_SOLICITUD').AsCurrency;
             end
             else if IBQuery3.FieldByName('GARANTIA').AsInteger = 2 then
             begin
                total_noadmisible := total_noadmisible + 1;
                valor_noadmisible := valor_noadmisible + IBQuery3.FieldByName('VALOR_SOLICITUD').AsCurrency;
             end;
                CDreporte.Append;
                CDreporte.FieldValues['garantia'] := IBQuery3.FieldByName('DESCRIPCION_GARANTIA').AsString;
                CDreporte.FieldValues['nombres'] := IBQuery3.FieldByName('ASOCIADO').AsString;
                CDreporte.FieldValues['valor'] := IBQuery3.FieldByName('VALOR_SOLICITUD').AsCurrency;
                CDreporte.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString;
                CDreporte.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO').AsString;
                CDreporte.FieldValues['agencia'] := FieldByName('DESCRIPCION_AGENCIA').AsString;
                CDreporte.Post;
             Next;
           end;
        end;
        // FIN OTRAS OFICINAS
        total := 0;
       // CDinforme.CancelUpdates;
        CDestado.CancelUpdates;
        if aprobada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'APROBADAS';
          CDestado.FieldValues['total'] := aprobada;
          CDestado.Post;
          total := total + aprobada;
        end;
        if ratificada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'RATIFICADAS';
          CDestado.FieldValues['total'] := ratificada;
          CDestado.Post;
          total_r := total_r + ratificada;
        end;
        if negada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'NEGADAS';
          CDestado.FieldValues['total'] := negada;
          CDestado.Post;
          total := total + negada;
        end;
        if aplazada <> 0 then
        begin
          CDestado.Append;
          CDestado.FieldValues['descripcion'] := 'APLAZADAS';
          CDestado.FieldValues['total'] := aplazada;
          CDestado.Post;
          total := total + aplazada;
        end;
        frmMain.CDinforme.IndexFieldNames := 'id_oficina';
        if DBente.KeyValue = 3 then
           imprimir_reporte(frmMain.wpath+'reporte\reprecupera_inf_c.frf')
        else
           imprimir_reporte(frmMain.wpath+'reporte\reprecupera_inf.frf');
end;

function TFrmReporteEnte.busca_emp(dbalias_e: string): string;
begin
        with IBQuery2 do
        begin
          Close;
          ParamByName('ID_EMPLEADO').AsString := dbalias_e;
          Open;
          Result := FieldByName('NOMBRE').AsString;
        end;
end;

end.
