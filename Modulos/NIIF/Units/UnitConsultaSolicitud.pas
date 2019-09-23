unit UnitConsultaSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery,
  IBDatabase, ComCtrls, Buttons, FR_Class, FR_DSet, FR_DBSet, DBClient;

type
  TFrmConsultaSolicitud = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBempleado: TDBLookupComboBox;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    Fecha1: TDateTimePicker;
    Fecha2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Ctotal: TCheckBox;
    Bejecutar: TBitBtn;
    Bcerrar: TBitBtn;
    IBparcial: TIBQuery;
    IBtotal: TIBQuery;
    IBTransaction2: TIBTransaction;
    frDBDataSet2: TfrDBDataSet;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    BitBtn1: TBitBtn;
    IBQuery1NOMBRE_COMPLETO: TIBStringField;
    IBQuery1ID_EMPLEADO: TIBStringField;
    Rfundacion: TRadioButton;
    Rcreditos: TRadioButton;
    RGeneral: TRadioButton;
    IBtotalFundacion: TIBQuery;
    frDBDataSet3: TfrDBDataSet;
    frDBDataSet4: TfrDBDataSet;
    IBfundacionParcial: TIBQuery;
    IBgeneral: TIBQuery;
    IBTransaction3: TIBTransaction;
    frDBDataSet5: TfrDBDataSet;
    CDestados: TClientDataSet;
    CDestadosid_estado: TIntegerField;
    CDestadosestado: TStringField;
    CDestadosnumero: TIntegerField;
    frDBDataSet6: TfrDBDataSet;
    IBanalisis: TIBQuery;
    frDBDataSet7: TfrDBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BejecutarClick(Sender: TObject);
    procedure BcerrarClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBempleadoKeyPress(Sender: TObject; var Key: Char);
    procedure Fecha1KeyPress(Sender: TObject; var Key: Char);
    procedure Fecha2KeyPress(Sender: TObject; var Key: Char);
    procedure RfundacionClick(Sender: TObject);
    procedure RcreditosClick(Sender: TObject);
    procedure RGeneralClick(Sender: TObject);
  private
  Definicion :string;
    { Private declarations }
  public
      opcion_consulta: Integer;
  published
    procedure imprimir_reporte(cadena: string);

    { Public declarations }
  end;

var
  FrmConsultaSolicitud: TFrmConsultaSolicitud;

implementation

uses UnitImpresion, unitMain, UnitGlobales, UnitDmSolicitud;

{$R *.dfm}

procedure TFrmConsultaSolicitud.FormCreate(Sender: TObject);
begin
        IBQuery1.Open;
        IBQuery1.Last;
        Fecha1.DateTime := Date;
        Fecha2.DateTime := Date;
        DmSolicitud := TDmSolicitud.Create(SELF);
end;

procedure TFrmConsultaSolicitud.BejecutarClick(Sender: TObject);
var    opcion1,opcion2 :Smallint;
begin
        if IBTransaction2.InTransaction then
           IBTransaction2.Commit;
        IBTransaction2.StartTransaction;
     if opcion_consulta = 1 then
     begin
       if Ctotal.Checked then
        begin
          IBtotal.Close;
          IBtotal.ParamByName('ID_EMPLEADO').AsString := DBempleado.KeyValue;
          IBtotal.Open;
          if IBtotal.RecordCount = 0 then
          begin
            MessageDlg('No se Encontraron Registros',mtInformation,[mbok],0);
            Exit;
          end;
          imprimir_reporte(frmMain.wpath +'reporte\repestadosoltotal_e.frf');
        end
        else
        begin
          IBparcial.Close;
          IBparcial.ParamByName('ID_EMPLEADO').AsString := DBempleado.KeyValue;
          IBparcial.ParamByName('FECHA_INI').AsDate := Fecha1.Date;
          IBparcial.ParamByName('FECHA_FIN').AsDate := Fecha2.Date;
          IBparcial.Open;
          if IBparcial.RecordCount = 0 then
          begin
            MessageDlg('No se Encontraron Registros',mtInformation,[mbok],0);
            Exit;
          end;
          imprimir_reporte(frmMain.wpath +'reporte\repestadosol_e.frf');
        end;
        end
        else if opcion_consulta = 2 then
        begin
           if Rfundacion.Checked then
           begin
              opcion1 := 1;opcion2 := 1;
           end
           else if Rcreditos.Checked then
           begin
              opcion1 := 0;opcion2 := 0;
           end
           else if RGeneral.Checked then
           begin
              opcion1 := 0;opcion2 := 1;
           end;
           if Ctotal.Checked then
           begin
              IBtotalFundacion.Close;
              IBtotalFundacion.ParamByName('FUNDACION1').AsInteger := opcion1;
              IBtotalFundacion.ParamByName('FUNDACION2').AsInteger := opcion2;
              IBtotalFundacion.Open;
              if IBtotalFundacion.RecordCount = 0 then
              begin
                MessageDlg('No se Encontraron Registros',mtInformation,[mbok],0);
                Exit;
              end;
              imprimir_reporte(frmMain.wpath +'reporte\repfundaciontotal.frf');
           end
           else
           begin
             IBfundacionParcial.Close;
             IBfundacionParcial.ParamByName('FECHA_INI').AsDate := Fecha1.Date;
             IBfundacionParcial.ParamByName('FECHA_FIN').AsDate := Fecha2.Date;
             IBfundacionParcial.ParamByName('FUNDACION1').AsInteger := opcion1;
             IBfundacionParcial.ParamByName('FUNDACION2').AsInteger := opcion2;
             IBfundacionParcial.Open;
             if IBfundacionParcial.RecordCount = 0 then
              begin
                MessageDlg('No se Encontraron Registros',mtInformation,[mbok],0);
                Exit;
              end;
              imprimir_reporte(frmMain.wpath +'reporte\repfundacionparcial.frf');
           end;
        end
        else if opcion_consulta = 3 then
        begin
          CDestados.CancelUpdates;
          if DmSolicitud.IBSQL2.Transaction.InTransaction then
             DmSolicitud.IBSQL2.Transaction.Commit;
          DmSolicitud.IBSQL2.Transaction.StartTransaction;
          with DmSolicitud.IBSQL1 do
          begin
            Close;
            if Transaction.InTransaction then
               Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$estadosolicitud".ID_ESTADO,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$estadosolicitud"');
          ExecQuery;
          while not Eof do
          begin
             with DmSolicitud.IBSQL2 do
             begin
               Close;
               SQL.Clear;
               SQL.Add('select count(ID_SOLICITUD) as NUMERO from "col$solicitud"');
               SQL.Add('where FECHA_RECEPCION between :FECHA1 and :FECHA2');
               SQL.Add('and ESTADO = :ESTADO');
               ParamByName('FECHA1').AsDate := Fecha1.DateTime;
               ParamByName('FECHA2').AsDate := Fecha2.DateTime;
               ParamByName('ESTADO').AsInteger := DmSolicitud.IBSQL1.FieldByName('ID_ESTADO').AsInteger;
               ExecQuery;
               if FieldByName('NUMERO').AsInteger <> 0 then
               begin
               CDestados.Append;
               CDestados.FieldValues['id_estado'] := DmSolicitud.IBSQL1.FieldByName('ID_ESTADO').AsInteger;
               CDestados.FieldValues['estado'] := DmSolicitud.IBSQL1.FieldByName('DESCRIPCION_ESTADO').AsString;
               CDestados.FieldValues['numero'] := FieldByName('NUMERO').AsInteger;
               CDestados.Post;
               end;
             end;
             Next;
          end;
          end;
          with IBgeneral do
          begin
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            ParamByName('fecha1').AsDate := Fecha1.DateTime;
            ParamByName('fecha2').AsDate := Fecha2.DateTime;
            Open;
            if RecordCount = 0 then
            begin
              MessageDlg('No se Encontraron Registros',mtInformation,[mbok],0);
              Exit;
            end;
          end;
            imprimir_reporte(frmMain.wpath +'reporte\repgeneral.frf');
        end
        else if opcion_consulta = 4 then
        begin
          CDestados.CancelUpdates;
          if DmSolicitud.IBSQL2.Transaction.InTransaction then
             DmSolicitud.IBSQL2.Transaction.Commit;
          DmSolicitud.IBSQL2.Transaction.StartTransaction;
          with DmSolicitud.IBSQL1 do
          begin
            Close;
            if Transaction.InTransaction then
               Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$estadosolicitud".ID_ESTADO,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$estadosolicitud"');
          ExecQuery;
          while not Eof do
          begin
             with DmSolicitud.IBSQL2 do
             begin
               Close;
               SQL.Clear;
               SQL.Add('select count(ID_SOLICITUD) as NUMERO from "col$solicitud"');
               SQL.Add('where FECHA_ANALISIS between :FECHA1 and :FECHA2');
               SQL.Add('and ESTADO = :ESTADO');
               ParamByName('FECHA1').AsDate := Fecha1.DateTime;
               ParamByName('FECHA2').AsDate := Fecha2.DateTime;
               ParamByName('ESTADO').AsInteger := DmSolicitud.IBSQL1.FieldByName('ID_ESTADO').AsInteger;
               ExecQuery;
               if FieldByName('NUMERO').AsInteger <> 0 then
               begin
               CDestados.Append;
               CDestados.FieldValues['id_estado'] := DmSolicitud.IBSQL1.FieldByName('ID_ESTADO').AsInteger;
               CDestados.FieldValues['estado'] := DmSolicitud.IBSQL1.FieldByName('DESCRIPCION_ESTADO').AsString;
               CDestados.FieldValues['numero'] := FieldByName('NUMERO').AsInteger;
               CDestados.Post;
               end;
             end;
             Next;
          end;
          end;
          with IBanalisis do
          begin
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            ParamByName('fecha1').AsDate := Fecha1.DateTime;
            ParamByName('fecha2').AsDate := Fecha2.DateTime;
            Open;
            if RecordCount = 0 then
            begin
              MessageDlg('No se Encontraron Registros',mtInformation,[mbok],0);
              Exit;
            end;

          end;
            imprimir_reporte(frmMain.wpath +'reporte\repanalisis.frf');
        end;
        Panel1.Enabled := False;
end;

procedure TFrmConsultaSolicitud.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmConsultaSolicitud.BcerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmConsultaSolicitud.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        Empleado;
        if DBempleado.Visible then
        begin
        if ParName = 'empleado' then
           ParValue := DBempleado.Text;
        end
        else
        begin
        if ParName = 'empleado' then
           ParValue := Definicion;
        end;
        if Ctotal.Checked = False then
        begin
        if ParName = 'fecha_ini' then
           ParValue := Fecha1.Date;
        if ParName = 'fecha_fin' then
           ParValue := Fecha2.Date;
        end
        else
        begin
        if ParName = 'fecha_ini' then
           ParValue := StrToDate('2005/01/12');
        if ParName = 'fecha_fin' then
           ParValue := fFechaActual;
        end;
        if ParName = 'empleado1' then
           ParValue := Nombres + ' ' + Apellidos;
end;

procedure TFrmConsultaSolicitud.BitBtn1Click(Sender: TObject);
begin
        Panel1.Enabled := True;
        Fecha1.Date := Date;
        Fecha2.DateTime := Date;

end;

procedure TFrmConsultaSolicitud.DBempleadoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmConsultaSolicitud.Fecha1KeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmConsultaSolicitud.Fecha2KeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmConsultaSolicitud.RfundacionClick(Sender: TObject);
begin
        Definicion := 'Fundacion Crediservir';
end;

procedure TFrmConsultaSolicitud.RcreditosClick(Sender: TObject);
begin
        Definicion := 'Sección de Creditos';
end;

procedure TFrmConsultaSolicitud.RGeneralClick(Sender: TObject);
begin
        Definicion := 'Sección Créditos y Fundación'
end;

end.
