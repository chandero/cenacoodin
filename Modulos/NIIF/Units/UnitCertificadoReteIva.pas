unit UnitCertificadoReteIva;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pr_Common, pr_Classes, DB, IBCustomDataSet, IBQuery, StdCtrls,
  JvEdit, JvTypedEdit, Buttons, ComCtrls, pr_TxClasses, IBDatabase, IBSQL,
  ExtCtrls;

type
  TfrmCertificadoReteIva = class(TForm)
    IBQuery1: TIBQuery;
    Label1: TLabel;
    EdAno: TJvYearEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    EdFechaCer: TDateTimePicker;
    prReport1: TprReport;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    prTxReport1: TprTxReport;
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    Panel1: TPanel;
    BtnIndividual: TBitBtn;
    BitBtn2: TBitBtn;
    EdFechaI: TDateTimePicker;
    Label5: TLabel;
    EdFechaF: TDateTimePicker;
    Label6: TLabel;
    procedure BtnGeneralClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnIndividualClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdAnoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaIKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaFKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaCerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCertificadoReteIva: TfrmCertificadoReteIva;
  NumeroDoc:string;
  Numero:Integer;

implementation

{$R *.dfm}

uses unitDmGeneral,UnitGlobales;

procedure TfrmCertificadoReteIva.BtnGeneralClick(Sender: TObject);
begin
        with IBQuery1 do begin
            if Transaction.InTransaction then
              Transaction.Rollback;
            Transaction.StartTransaction;

            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"con$retefuentecsc".CSC,');
            SQL.Add('("gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO || '' '' || "gen$persona".NOMBRE) AS NOMBRE,');
            SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
            SQL.Add('"dian$retefuente".ID_PERSONA,');
            SQL.Add('"con$puc".NOMBRE,');
            SQL.Add('SUM("dian$retefuente".MONTO) AS MONTO,');
            SQL.Add('"dian$retefuente".TASAN,');
            SQL.Add('SUM("dian$retefuente".RETENCION) AS RETENCION');
            SQL.Add('FROM');
            SQL.Add('"dian$retefuente"');
            SQL.Add('INNER JOIN "gen$persona" ON ("dian$retefuente".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND');
            SQL.Add('("dian$retefuente".ID_PERSONA = "gen$persona".ID_PERSONA)');
            SQL.Add('LEFT JOIN "con$puc" ON ("dian$retefuente".CODIGO = "con$puc".CODIGO)');
            SQL.Add('LEFT JOIN "gen$tiposidentificacion" ON ("dian$retefuente".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
            SQL.Add('LEFT JOIN "con$retefuentecsc" ON ("dian$retefuente".ID_PERSONA = "con$retefuentecsc".ID_PERSONA)');
            SQL.Add('where "dian$retefuente".CODIGO <> :CODIGO');
            SQL.Add('GROUP BY');
            SQL.Add('"con$retefuentecsc".CSC,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
            SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
            SQL.Add('"dian$retefuente".ID_PERSONA,');
            SQL.Add('"con$puc".NOMBRE, "dian$retefuente".TASAN');
//            SQL.Add('HAVING SUM(RETENCION) >= 100000');
            SQL.Add('ORDER BY "dian$retefuente".ID_PERSONA ASC');
            ParamByName('CODIGO').AsString := '244535000000000000';
            Open;

            while not Eof do begin
             IBSQL1.Close;
             IBSQL1.SQL.Clear;
             IBSQL1.SQL.Add('select * from "con$retefuentecsc" where ID_PERSONA = :ID_PERSONA');
             IBSQL1.ParamByName('ID_PERSONA').AsString := IBQuery1.fieldbyname('ID_PERSONA').AsString;
             try
              IBSQL1.ExecQuery;
              if IBSQL1.RecordCount <1 then
               begin
                 Numero := ObtenerConsecutivoReteFuente(Self.IBDatabase1);
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('insert into "con$retefuentecsc" values (:ID_PERSONA,:CSC)');
                 IBSQL2.ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                 IBSQL2.ParamByName('CSC').AsInteger := Numero;
                 try
                  IBSQL2.ExecQuery;
                 except
                  raise;
                 end;
               end;
             except
              raise;
             end;
             Next;
            end; // fin de while
            Close;
            Transaction.Commit;
            Transaction.StartTransaction;
        end;

        with prTxReport1 do begin
         Variables.ByName['EMPRESA'].AsString := Empresa;
         Variables.ByName['NIT'].AsString := Nit;
//         Variables.ByName['NUMERO'].AsInteger := StrToInt(Edit2.Text);
         Variables.ByName['ANOG'].AsInteger := EdAno.Value;
         Variables.ByName['FECHA'].AsDateTime := EdFechaCer.Date;
         Variables.ByName['CIUDAD'].AsString := Ciudad;
        end;
//        IBQuery1.Close;
//        IBQuery1.ParamByName('ID_PERSONA1').AsString := Edit1.Text;
//        IBQuery1.ParamByName('ID_PERSONA2').AsString := Edit1.Text;
        try
         IBQuery1.Open;
         if IBQuery1.RecordCount > 0 then
           if prTxReport1.PrepareReport then
              prTxReport1.PreviewPreparedReport(True);
        except
          raise;
        end;
end;

procedure TfrmCertificadoReteIva.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmCertificadoReteIva.BtnIndividualClick(Sender: TObject);
begin
           IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
           IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
           IBDatabase1.Params.Values['User_Name'] := 'RETEFUENTE';
           IBDatabase1.Params.Values['PassWord'] := 'retefuente';
           IBDatabase1.Params.Values['sql_role_name'] := 'CAPTACIONES';
           try
             IBDatabase1.Connected := True;
           except
             raise;
           end;


        with IBSQL1 do begin
         if Transaction.InTransaction then
           Transaction.Rollback;
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('select * from "con$retefuentecsc" where ID_PERSONA = :ID_PERSONA');
         ParamByName('ID_PERSONA').AsString := NumeroDoc;
         try
          ExecQuery;
          if RecordCount <1 then
           begin
             Numero := ObtenerConsecutivoReteFuente(Self.IBDatabase1);
             IBSQL2.Close;
             IBSQL2.SQL.Clear;
             IBSQL2.SQL.Add('insert into "con$retefuentecsc" values (:ID_PERSONA,:CSC)');
             IBSQL2.ParamByName('ID_PERSONA').AsString := NumeroDoc;
             IBSQL2.ParamByName('CSC').AsInteger := Numero;
             try
              IBSQL2.ExecQuery;
             except
              raise;
             end;
           end
          else
           Numero := FieldByName('CSC').AsInteger;
         except
          raise;
         end;
         Transaction.Commit;
         IBDatabase1.Close;
        end; // end with

        with IBQuery1 do begin
            if Transaction.InTransaction then
              Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('select');
            SQL.Add('"con$retefuentecsc".CSC,');
            SQL.Add('("gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO || '' '' || "gen$persona".NOMBRE) AS NOMBRE,');
            SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
            SQL.Add('"con$auxiliar".ID_IDENTIFICACION,"con$auxiliar".ID_PERSONA,');
            SQL.Add('sum("con$auxiliar".MONTO_RETENCION) as MONTO,');
            SQL.Add('sum("con$auxiliar".TASA_RETENCION) / count("con$auxiliar".CODIGO) as TASA,');
            SQL.Add('sum("con$auxiliar".CREDITO - "con$auxiliar".DEBITO) as RETENCION,');
            SQL.Add('"con$puc".NOMBRE');
            SQL.Add('from "con$auxiliar"');
            SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
            SQL.Add('LEFT JOIN "gen$tiposidentificacion" ON ("con$auxiliar".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
            SQL.Add('LEFT JOIN "con$retefuentecsc" ON ("con$auxiliar".ID_PERSONA = "con$retefuentecsc".ID_PERSONA)');
            SQL.Add('LEFT JOIN "gen$persona" ON ("con$auxiliar".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and"con$auxiliar".ID_PERSONA = "gen$persona".ID_PERSONA)');
            SQL.Add('WHERE "con$auxiliar".CODIGO = :CODIGO AND "con$auxiliar".FECHA between :FECHA1  and :FECHA2');
            SQL.Add('AND "con$auxiliar".ID_PERSONA = :ID_PERSONA');
            SQL.Add('GROUP BY');
            SQL.Add('"con$retefuentecsc".CSC,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
            SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
            SQL.Add('"con$auxiliar".ID_IDENTIFICACION,"con$auxiliar".ID_PERSONA,');
            SQL.Add('"con$puc".NOMBRE, "con$auxiliar".TASA_RETENCION');
            ParamByName('ID_PERSONA').AsString := Edit1.Text;
            ParamByName('CODIGO').AsString := '244710000000000000';
            ParamByName('FECHA1').AsDate := EdFechaI.Date;
            ParamByName('FECHA2').AsDate := EdFechaF.Date;

        end;

        with prTxReport1 do begin
         Variables.ByName['EMPRESA'].AsString := Empresa;
         Variables.ByName['NIT'].AsString := Nit;
         Variables.ByName['ANOG'].AsInteger := EdAno.Value;
         Variables.ByName['FECHA'].AsDateTime := EdFechaCer.Date;
         Variables.ByName['CIUDAD'].AsString := Ciudad;
         Variables.ByName['BIMESTRE'].AsString := 'DEL' + ' ' + DateToStr(EdFechaI.Date) + ' ' + 'AL' + ' ' + DateToStr(EdFechaF.Date);
        end;

        try
         IBQuery1.Open;
         if IBQuery1.RecordCount > 0 then  begin
           if prTxReport1.PrepareReport then
              prTxReport1.PreviewPreparedReport(True);
         end
         else MessageDlg('Documento no posee Retencion para el Periodo Estipulado',mtError,[mbOk],0);
        except
          raise;
        end;
end;

procedure TfrmCertificadoReteIva.Edit1Exit(Sender: TObject);
begin
        NumeroDoc := Trim(Edit1.Text);
end;

procedure TfrmCertificadoReteIva.FormShow(Sender: TObject);
var FechaActual : TDate;
begin
        FechaActual := fFechaActual;
        EdFechaI.Date := FechaActual;
        EdFechaF.Date := FechaActual;
        EdFechaCer.Date := FechaActual;
        EdAno.Value := YearOf(FechaActual);
end;

procedure TfrmCertificadoReteIva.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCertificadoReteIva.EdAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCertificadoReteIva.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCertificadoReteIva.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCertificadoReteIva.EdFechaIKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCertificadoReteIva.EdFechaFKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCertificadoReteIva.EdFechaCerKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
