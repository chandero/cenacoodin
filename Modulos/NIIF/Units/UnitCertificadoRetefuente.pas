unit UnitCertificadoRetefuente;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pr_Common, pr_Classes, DB, IBCustomDataSet, IBQuery, StdCtrls,
  JvEdit, JvTypedEdit, Buttons, ComCtrls, pr_TxClasses, IBDatabase, IBSQL;

type
  TfrmCertificadoRetefuente = class(TForm)
    IBQuery1: TIBQuery;
    BtnGeneral: TBitBtn;
    Label1: TLabel;
    yEdit1: TJvYearEdit;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TDateTimePicker;
    prReport1: TprReport;
    prTxReport1: TprTxReport;
    BtnIndividual: TBitBtn;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    procedure BtnGeneralClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnIndividualClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCertificadoRetefuente: TfrmCertificadoRetefuente;
  NumeroDoc:string;
  Numero:Integer;

implementation

{$R *.dfm}

uses unitDmGeneral,UnitGlobales;

procedure TfrmCertificadoRetefuente.BtnGeneralClick(Sender: TObject);
begin
           IBDatabase1.Connected := False;
           IBDatabase1.DataBaseName := DBserver1 + ':' + DBpath1 + DBname1;
           IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
           IBDatabase1.Params.Values['User_Name'] := 'RETEFUENTE';
           IBDatabase1.Params.Values['PassWord'] := 'retefuente';
           IBDatabase1.Params.Values['sql_role_name'] := 'CAPTACIONES';
           try
             IBDatabase1.Connected := True;
           except
             raise;
           end;


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
            SQL.Add('where "dian$retefuente".CODIGO <> :CODIGO and "dian$retefuente".DEVOLUCION = 0');
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
         Variables.ByName['ANOG'].AsInteger := yEdit1.Value;
         Variables.ByName['FECHA'].AsDateTime := Edit3.Date;
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

procedure TfrmCertificadoRetefuente.FormCreate(Sender: TObject);
begin
        yEdit1.Value := YearOf(fFechaActual) - 1;
        Edit3.DateTime := fFechaHoraActual;
        Edit2.Text := '';
        Edit1.Text := '';
end;

procedure TfrmCertificadoRetefuente.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmCertificadoRetefuente.BtnIndividualClick(Sender: TObject);
begin
           IBDatabase1.DataBaseName := DBserver1 + ':' + DBpath1 + DBname1;
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
      //*
      with IBQuery1 do begin
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
            SQL.Add('where "dian$retefuente".CODIGO <> :CODIGO and "dian$retefuente".DEVOLUCION = 0 and "dian$retefuente".ID_PERSONA = :ID_PERSONA');
            SQL.Add('GROUP BY');
            SQL.Add('"con$retefuentecsc".CSC,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
            SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
            SQL.Add('"dian$retefuente".ID_PERSONA,');
            SQL.Add('"con$puc".NOMBRE, "dian$retefuente".TASAN');
//            SQL.Add('HAVING SUM(RETENCION) >= 100000');
            ParamByName('ID_PERSONA').AsString := Edit1.Text;
            SQL.Add('ORDER BY "dian$retefuente".ID_PERSONA ASC');
            ParamByName('CODIGO').AsString := '244535000000000000';
            Open;
        end;
      //*
{        with IBQuery1 do begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"con$retefuentecsc".CSC,');
            SQL.Add('("gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO || '' '' || "gen$persona".NOMBRE) AS NOMBRE,');
            SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
            SQL.Add('"dian$retefuente".ID_PERSONA,');
            SQL.Add('"con$puc".NOMBRE,');
            SQL.Add('SUM("dian$retefuente".MONTO) AS MONTO,');
            SQL.Add('AVG("dian$retefuente".TASAN) AS TASAN,');
            SQL.Add('SUM("dian$retefuente".RETENCION) AS RETENCION');
            SQL.Add('FROM');
            SQL.Add('"dian$retefuente"');
            SQL.Add('INNER JOIN "gen$persona" ON ("dian$retefuente".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND');
            SQL.Add('("dian$retefuente".ID_PERSONA = "gen$persona".ID_PERSONA)');
            SQL.Add('LEFT JOIN "con$puc" ON ("dian$retefuente".CODIGO = "con$puc".CODIGO)');
            SQL.Add('LEFT JOIN "gen$tiposidentificacion" ON ("dian$retefuente".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
            SQL.Add('LEFT JOIN "con$retefuentecsc" ON ("dian$retefuente".ID_PERSONA = "con$retefuentecsc".ID_PERSONA)');
            SQL.Add('WHERE "dian$retefuente".ID_PERSONA BETWEEN :ID_PERSONA1 and :ID_PERSONA2');
            SQL.Add('GROUP BY');
            SQL.Add('"con$retefuentecsc".CSC,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
            SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
            SQL.Add('"dian$retefuente".ID_PERSONA,');
            SQL.Add('"con$puc".NOMBRE');
            SQL.Add('HAVING SUM(RETENCION) >= 0');
            SQL.Add('ORDER BY "dian$retefuente".ID_PERSONA ASC');
            ParamByName('ID_PERSONA1').AsString := Edit1.Text;
            ParamByName('ID_PERSONA2').AsString := Edit1.Text;
            Open;
        end;}

        with prTxReport1 do begin
         Variables.ByName['EMPRESA'].AsString := Empresa;
         Variables.ByName['NIT'].AsString := Nit;
         Variables.ByName['ANOG'].AsInteger := yEdit1.Value;
         Variables.ByName['FECHA'].AsDateTime := Edit3.Date;
         Variables.ByName['CIUDAD'].AsString := Ciudad;
        end;

        try
         IBQuery1.Open;
         if IBQuery1.RecordCount > 0 then
           if prTxReport1.PrepareReport then
              prTxReport1.PreviewPreparedReport(True);
        except
          raise;
        end;
end;

procedure TfrmCertificadoRetefuente.Edit1Exit(Sender: TObject);
begin
        NumeroDoc := Trim(Edit1.Text);
end;

end.
