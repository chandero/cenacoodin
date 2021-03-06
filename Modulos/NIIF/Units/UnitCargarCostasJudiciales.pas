unit UnitCargarCostasJudiciales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, XStringGrid, IBSQL, Buttons, CEButton,
  JvStringGrid, pr_Common, pr_TxClasses, DB, IBCustomDataSet,
  IBQuery, pr_Classes, DBCtrls, UnitDmGeneral;

type
  TfrmCargarCostasJudiciales = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    EdCuenta: TEdit;
    IBSQL1: TIBSQL;
    CmdCerrar: TBitBtn;
    Label1: TLabel;
    EdNombre: TStaticText;
    CmdAplicar: TBitBtn;
    CmdComprobante: TBitBtn;
    Label2: TLabel;
    EdTotalCostas: TStaticText;
    GridCostas: TJvStringGrid;
    IBSQL2: TIBSQL;
    IBPagar: TIBSQL;
    Label3: TLabel;
    EdComprobante: TStaticText;
    IBAuxiliar: TIBQuery;
    IBSQL3: TIBSQL;
    ReporteC: TprTxReport;
    IBAuxiliar1: TIBQuery;
    IBQuery1: TIBQuery;
    prReport1: TprReport;
    ChSucursal: TCheckBox;
    EdAgencia: TDBLookupComboBox;
    DSAgencia: TDataSource;
    IBAgencia: TIBQuery;
    procedure EdCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure EdCuentaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdInsertarClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCostasGetCellAlignment(Sender: TJvStringGrid; AColumn,
      ARow: Integer; State: TGridDrawState; var CellAlignment: TAlignment);
    procedure GridCostasExitCell(Sender: TJvStringGrid; AColumn,
      ARow: Integer; const EditText: String);
    procedure GridCostasSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CmdComprobanteClick(Sender: TObject);
    procedure ReporteCInitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure ReporteCPrintComplete(Sender: TObject);
    procedure ChSucursalClick(Sender: TObject);
    procedure ChSucursalExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure Inicializar;
    { Public declarations }
  end;

type PCostas=^TCostas;
     TCostas=Record
      Colocacion:string;
      Descripcion:string;
      Valor:Currency;
end;

type
  PList = ^AList;
  AList = record
    codigo   : string;
    debito   : currency;
    credito  : currency;
    nocuenta : integer;
    nocredito: string;
    tipoide  : integer;
    idpersona: string;
    monto    : currency;
    tasa     : single;
    estado   : string;
  end;


var
  frmCargarCostasJudiciales: TfrmCargarCostasJudiciales;
  dmGeneral : TdmGeneral;
  Total : Currency;
  Lista:TList;
  Comprobante:Integer;
  Dg:Integer;
  vImpreso:Boolean;
  vTipoDoc:Integer;
  vNumeroDoc:string;
implementation

{$R *.dfm}

uses UnitGlobales, unitvistapreliminar,UnitTipoImpresion,UnitDmColocacion;

procedure TfrmCargarCostasJudiciales.EdCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmCargarCostasJudiciales.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCargarCostasJudiciales.EdCuentaExit(Sender: TObject);
begin
        if EdCuenta.Text = '' then Exit;

        EdCuenta.Text := Format('%.7d',[strtoint(EdCuenta.Text)]);
        Dg := StrToInt(DigitoControl(1,EdCuenta.Text));
        with IBSQL1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select "gen$persona".ID_IDENTIFICACION, "gen$persona".ID_PERSONA,"gen$persona".NOMBRE, "gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO from "cap$maestrotitular"');
           SQL.Add('left join "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
           sql.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('where "cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
           SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and ');
           SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCuenta.Text);
           ParamByName('DIGITO_CUENTA').AsInteger := Dg;
           try
            ExecQuery;
            if RecordCount > 0 then
              EdNombre.Caption := FieldByName('NOMBRE').AsString +  ' ' +
                                  FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                  FieldByName('SEGUNDO_APELLIDO').AsString;
              vTipoDoc := FieldByName('ID_IDENTIFICACION').AsInteger;
              vNumeroDoc := FieldByName('ID_PERSONA').AsString;
            Transaction.Commit;
           except
            Transaction.Rollback;
            raise;
           end;
        end;

end;

procedure TfrmCargarCostasJudiciales.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCargarCostasJudiciales.CmdInsertarClick(Sender: TObject);
begin
        GridCostas.RowCount := GridCostas.RowCount + 1;
end;

procedure TfrmCargarCostasJudiciales.CmdAplicarClick(Sender: TObject);
var i:Integer;
    AR:PCostas;
    AC:PList;
    LAux:TList;
    Clasificacion,Garantia:Integer;
    Evaluacion:string;
    Estado:Integer;
    Castigado:Currency;
    CodigoAhorros:string;
    CodigoSuc:string;
    CodigoDeudoras:string;
    CodigoDeudorasC:string;
begin
        if ChSucursal.Checked = False then
          if EdCuenta.Text = '' then
           begin
             MessageDlg('Debe digitar el n�mero de cuenta de ahorros',mtError,[mbcancel],0);
             Exit;
           end;

// Corregir Tabla

            if Lista.Count = 1 then begin
              MessageDlg('No hay datos para aplicar',mtError,[mbcancel],0);
              Exit;
            end;

            if MessageDlg('Seguro de Aplicar los datos',mtConfirmation,[mbyes,mbno],0) <> mryes then
               Exit;

            CmdAplicar.Enabled := False;
            Application.ProcessMessages;

            Total := 0;
            for i := 0 to lista.Count - 1 do begin
             AR := Lista.Items[i];
             if (AR <> nil) then Total := Total + AR^.Valor;
            end;
            EdTotalCostas.Caption := FormatCurr('#,#0',Total);

            Comprobante := ObtenerConsecutivo(IBSQL1,1);
            EdComprobante.Caption := Format('%.6d',[Comprobante]);
            LAux := TList.Create;
            if IBSQL1.Transaction.InTransaction then
               IBSQL1.Transaction.Rollback;
            IBSQL1.Transaction.StartTransaction;

            with IBSQL3 do begin
              Close;
              SQL.Clear;
              SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION = 2');
              ExecQuery;
              CodigoAhorros := FieldByName('CODIGO_CONTABLE').AsString;

              Close;
              SQL.Clear;
              SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 26');
              ExecQuery;
              CodigoDeudoras := FieldByName('CODIGO').AsString;

              Close;
              SQL.Clear;
              SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 26');
              ExecQuery;
              CodigoDeudorasC := FieldByName('CODIGO').AsString;

              if ChSucursal.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = :CODIGO');
                case EdAgencia.KeyValue of
                  1 : ParamByName('CODIGO').AsInteger := 16;
                  2 : ParamByName('CODIGO').AsInteger := 59;
                  3 : ParamByName('CODIGO').AsInteger := 60;
                  4 : ParamByName('CODIGO').AsInteger := 61
                end;
                ExecQuery;
                CodigoSuc := FieldByName('CODIGO').AsString;
                Close;
              end;
            end;

            Castigado := 0;
            for i := 0 to Lista.Count - 1 do begin
              AR := Lista.Items[i];
              if (AR <> nil) and (AR^.Valor > 0 ) then
                 with IBSQL1 do begin
                  New(AC);
                  Close;
                  SQL.Clear;
                  SQL.Add('insert into "col$costas" values (');
                  SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:FECHA,');
                  SQL.Add(':ID_CBTE_COLOCACION,:VALOR_COSTAS,');
                  SQL.Add(':VALOR_HONORARIOS,:VALOR_OTROS,:DESCRIPCION)');
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_COLOCACION').AsString := AR^.Colocacion;
                  ParamByName('FECHA').AsDate := Date;
                  ParamByName('ID_CBTE_COLOCACION').AsInteger := Comprobante;
                  ParamByName('VALOR_COSTAS').AsCurrency := AR^.Valor;
                  ParamByName('VALOR_HONORARIOS').AsCurrency := 0;
                  ParamByName('VALOR_OTROS').AsCurrency := 0;
                  ParamByName('DESCRIPCION').AsString := AR^.Descripcion;
                  try
                   ExecQuery;
                   with IBSQL2 do begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select ID_CLASIFICACION,ID_GARANTIA,ID_EVALUACION, ID_ESTADO_COLOCACION from "col$colocacion" where');
                    SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_COLOCACION').AsString := AR^.Colocacion;
                    try
                     ExecQuery;
                     Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
                     Garantia := FieldByName('ID_GARANTIA').AsInteger;
                     Evaluacion := FieldByName('ID_EVALUACION').AsString;
                     Estado     := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
                     Close;
                    except
                     IBSQL1.Transaction.Rollback;
                     raise;
                     Exit;
                    end; // Try
                   end; //with IBSQL2
                   with IBSQL2 do begin
                     Close;
                     SQL.Clear;
                     SQL.Add('select COD_COSTAS, COD_COSTAS_CAS from "col$codigospuc" where');
                     SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and');
                     SQL.Add('ID_GARANTIA = :ID_GARANTIA and');
                     SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
                     ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
                     ParamByName('ID_GARANTIA').AsInteger := Garantia;
                     ParamByName('ID_CATEGORIA').AsString := Evaluacion;
                     try
                      ExecQuery;
                      if Estado = 3 then
                       begin
                        AC^.codigo := FieldByName('COD_COSTAS_CAS').AsString;
                        Castigado := Castigado + AR^.Valor;
                       end
                      else
                        AC^.codigo := FieldByName('COD_COSTAS').AsString;
                     except
                      IBSQL1.Transaction.Rollback;
                      raise;
                      Exit;
                     end; //try
                   end; //with
                   AC^.debito := AR^.Valor;
                   AC^.credito := 0;
                   AC^.nocuenta := 0;
                   AC^.nocredito := '';
                   AC^.tipoide := 0;
                   AC^.idpersona := '';
                   AC^.monto := 0;
                   AC^.tasa := 0;
                   AC^.estado := 'O';
                   LAux.Add(AC);
                  except
                   IBSQL1.Transaction.Rollback;
                   raise;
                   Exit;
                  end; // try
                 end;// with ibsql1
                end; // for
// Consignar en Depositos
              if ChSucursal.Checked = False then begin
                IBPagar.Close;
                IBPagar.SQL.Clear;
                IBPagar.SQL.Add('insert into "cap$extracto" values(');
                IBPagar.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
                IBPagar.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
                IBPagar.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
                IBPagar.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
                IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
                IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCuenta.Text);
                IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(2,EdCuenta.Text));
                IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := Date;
                IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
                IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Costas Judiciales Pagadas en La Fecha';
                IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := Total;
                IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                try
                  IBPagar.ExecQuery;
                except
                  IBPagar.Transaction.Rollback;
                  raise;
                  Exit;
                end;
              end;
// Fin Consignaci�n en Depositos

              New(AC);
              if ChSucursal.Checked = False then
                AC^.codigo := CodigoAhorros
              else AC^.codigo := CodigoSuc;
              AC^.debito := 0;
              AC^.credito := Total;
              if ChSucursal.Checked = False then
                AC^.nocuenta := StrToInt(EdCuenta.Text)
              else AC^.nocuenta := 0;
              AC^.nocredito := '';
              AC^.tipoide := 0;
              AC^.idpersona := '';
              AC^.monto := 0;
              AC^.tasa := 0;
              AC^.estado := 'O';
              LAux.Add(AC);
// Grabar Nota Contable
            with IBSQL1 do begin
              Close;
              SQL.Clear;
              SQL.Add('insert into "con$comprobante" values (');
              SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:TIPO_COMPROBANTE,');
              SQL.Add(':FECHADIA,:DESCRIPCION,:TOTAL_DEBITO,:TOTAL_CREDITO,');
              SQL.Add(':ESTADO,:IMPRESO,:ANULACION,:ID_EMPLEADO)');
              ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
              ParamByName('FECHADIA').AsDateTime := Date;
              if ChSucursal.Checked = False then
                ParamByName('DESCRIPCION').AsString := 'Pago Costas Judiciales a ' + EdNombre.Caption +
                                                     ' Cuenta No. ' + EdCuenta.Text
              else
                ParamByName('DESCRIPCION').AsString := 'Pago Costas Judiciales en la fecha';
              ParamByName('TOTAL_DEBITO').AsCurrency := Total;
              ParamByName('TOTAL_CREDITO').AsCurrency := Total;
              ParamByName('ESTADO').AsString := 'O';
              ParamByName('IMPRESO').AsInteger := 1;
              ParamByName('ANULACION').AsString := '';
              ParamByName('ID_EMPLEADO').AsString := DBAlias;
              try
               ExecQuery;
              except
               IBSQL1.Transaction.Rollback;
               raise;
               Exit;
              end;
            end;

              with IBSQL1 do begin
                SQL.Clear;
                SQL.Add('insert into "con$auxiliar" values (');
                SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:FECHA,:CODIGO,');
                SQL.Add(':DEBITO,:CREDITO,:ID_CUENTA,:ID_COLOCACION,:ID_IDENTIFICACION,');
                SQL.Add(':ID_PERSONA,:MONTO_RETENCION,:TASA_RETENCION,:ESTADOAUX)');
               for i := 0 to LAux.Count - 1 do begin
                Close;
                AC := LAux.Items[i];
                ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA').AsDateTime := Date;
                ParamByName('CODIGO').AsString := AC^.codigo;
                ParamByName('DEBITO').AsCurrency := AC^.debito;
                ParamByName('CREDITO').AsCurrency := AC^.credito;
                if AC^.codigo = CodigoAhorros then begin
                  ParamByName('ID_CUENTA').AsInteger := StrToInt(EdCuenta.Text);
                  ParamByName('ID_IDENTIFICACION').AsInteger := vTipoDoc;
                  ParamByName('ID_PERSONA').AsString := vNumeroDoc;
                end
                else begin
                  ParamByName('ID_CUENTA').AsInteger := AC^.nocuenta;
                  ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                  ParamByName('ID_PERSONA').AsString := '';
                end;
                ParamByName('ID_COLOCACION').AsString := '';
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').AsFloat := 0;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecQuery;
                except
                 Transaction.Rollback;
                 raise;
                 Exit;
                end;//try
               end;// for

               if Castigado > 0 then begin
                ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA').AsDateTime := Date;
                ParamByName('CODIGO').AsString := CodigoDeudoras;
                ParamByName('DEBITO').AsCurrency := Castigado;
                ParamByName('CREDITO').AsCurrency := 0;
                ParamByName('ID_CUENTA').Clear;
                ParamByName('ID_COLOCACION').Clear;
                ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                ParamByName('ID_PERSONA').Clear;
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').Clear;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecQuery;
                except
                 Transaction.Rollback;
                 raise;
                 Exit;
                end;//try


                ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA').AsDateTime := Date;
                ParamByName('CODIGO').AsString := CodigoDeudorasC;
                ParamByName('DEBITO').AsCurrency := 0;
                ParamByName('CREDITO').AsCurrency := Castigado;
                ParamByName('ID_CUENTA').Clear;
                ParamByName('ID_COLOCACION').Clear;
                ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                ParamByName('ID_PERSONA').Clear;
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').Clear;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecQuery;
                except
                 Transaction.Rollback;
                 raise;
                 Exit;
                end;//try
               end;
              end;// with
              IBSQL1.Transaction.Commit;
              CmdComprobante.Enabled := True;
end;

procedure TfrmCargarCostasJudiciales.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmCargarCostasJudiciales.Inicializar;
var AR:PCostas;
begin
        Total := 0;
        GridCostas.RowCount := 2;
        GridCostas.FixedCols := 0;
        GridCostas.FixedRows := 1;
        GridCostas.ColWidths[0] := 75;
        GridCostas.ColWidths[1] := 250;
        GridCostas.ColWidths[2] := 303;
        GridCostas.ColWidths[3] := 70;
        GridCostas.Cells[0,0] := 'COLOCACION';
        GridCostas.Cells[1,0] := 'ASOCIADO';
        GridCostas.Cells[2,0] := 'DESCRIPCION';
        GridCostas.Cells[3,0] := 'VALOR';
        GridCostas.Row := 1;
        GridCostas.Col := 0;
        Lista.Clear;
        New(AR);
        AR^.Colocacion := '';
        AR^.Descripcion := '';
        AR^.Valor := 0;
        Lista.Add(AR);
end;

procedure TfrmCargarCostasJudiciales.GridCostasGetCellAlignment(
  Sender: TJvStringGrid; AColumn, ARow: Integer; State: TGridDrawState;
  var CellAlignment: TAlignment);
begin
        if ARow = 0 then
           CellAlignment := taCenter;
        if ARow > 0 then
        if AColumn < 3 then
           CellAlignment := taLeftJustify
        else
           CellAlignment := taRightJustify;
end;

procedure TfrmCargarCostasJudiciales.GridCostasExitCell(
  Sender: TJvStringGrid; AColumn, ARow: Integer; const EditText: String);
var AR:PCostas;
    i:Integer;
begin
        if (AColumn = 0) and (Trim(EditText) <> '') then
          with IBSQL1 do begin
              if Transaction.InTransaction then
                 Transaction.Rollback;
              Transaction.StartTransaction;
              Close;
              SQL.Clear;
              SQL.Add('select "gen$persona".NOMBRE, "gen$persona".PRIMER_APELLIDO,');
              SQL.Add('"gen$persona".SEGUNDO_APELLIDO from "col$colocacion"');
              SQL.Add('left join "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
              SQL.Add('"col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
              SQL.Add('where "col$colocacion".ID_AGENCIA = :ID_AGENCIA and "col$colocacion".ID_COLOCACION = :ID_COLOCACION');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_COLOCACION').AsString := EditText;
              try
               ExecQuery;
               if RecordCount > 0 then
                  begin
                    GridCostas.Cells[1,ARow] := FieldByName('NOMBRE').AsString + ' ' +
                                               FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                               FieldByName('SEGUNDO_APELLIDO').AsString;
                    GridCostas.Col := 2;
                  end
               else
                  MessageDlg('Colocaci�n No Existe',mtError,[mbok],0);
               Transaction.Commit;
              except
                Transaction.Rollback;
                raise;
              end;
          end;
         if AColumn = 2 then GridCostas.Col := 3;
         if AColumn = 3 then begin
            AR := Lista.Items[ARow - 1];
            AR^.Colocacion := GridCostas.Cells[0,ARow];
            AR^.Descripcion := UpperCase(GridCostas.Cells[2,ARow]);
            AR^.Valor := StrToCurr(GridCostas.Cells[3,ARow]);
            Lista.Items[ARow - 1] := AR;
            GridCostas.Cells[AColumn,ARow] := FormatCurr('#,#0',StrToCurr(EditText));
            GridCostas.Col := 0;
            Total := 0;
            for i := 0 to lista.Count - 1 do begin
             AR := Lista.Items[i];
             if (AR <> nil) then Total := Total + AR^.Valor;
            end;
            EdTotalCostas.Caption := FormatCurr('#,#0',Total);
            if (GridCostas.RowCount - 1) = ARow then
            begin
                GridCostas.RowCount := GridCostas.RowCount + 1;
                New(AR);
                AR^.Colocacion := '';
                AR^.Descripcion := '';
                AR^.Valor := 0;
                Lista.Add(AR);
            end;
            GridCostas.Row := GridCostas.Row + 1;
         end;
end;

procedure TfrmCargarCostasJudiciales.GridCostasSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
        if ACol = 1 then CanSelect := False;
end;

procedure TfrmCargarCostasJudiciales.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBSQL3.Database := dmGeneral.IBDatabase1;
        IBPagar.Database := dmGeneral.IBDatabase1;
        IBAuxiliar.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBAuxiliar1.Database := dmGeneral.IBDatabase1;
        IBAgencia.Database := dmGeneral.IBDatabase1;

        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBSQL2.Transaction := dmGeneral.IBTransaction1;
        IBSQL3.Transaction := dmGeneral.IBTransaction1;
        IBPagar.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar1.Transaction := dmGeneral.IBTransaction1;
        IBAgencia.Transaction := dmGeneral.IBTransaction1;


        Lista := TList.Create;
       
end;

procedure TfrmCargarCostasJudiciales.CmdComprobanteClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
begin
        with IBAuxiliar do begin
         if  Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Empleado;
        
         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(EdComprobante.Caption);
         try
          Open;
          frmTipoImpresion := TfrmTipoImpresion.Create(Self);
          if frmTipoImpresion.ShowModal = mrOk then
          begin
             case frmTipoImpresion.TipoImpresion of
             0: begin
                 ReporteC.Variables.ByName['EMPRESA'].AsString := Empresa;
                 ReporteC.Variables.ByName['NIT'].AsString := Nit;
                 if ReporteC.PrepareReport then
                 ReporteC.PreviewPreparedReport(True);
                end;
             1: begin
                 prReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
                 prReport1.Variables.ByName['NIT'].AsString := Nit;
                 prReport1.Variables.ByName['FechaHoy'].AsDateTime := fFechaActual;
                 if PrReport1.PrepareReport then
                 prReport1.PreviewPreparedReport(True);
                end;
             end;
          end;
         except
          MessageDlg('Error al generar el reporte',mtError,[mbcancel],0);
         end;
        end;
{        if ReporteC.PrepareReport then
         begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := ReporteC;
           frmVistaPreliminar.ShowModal;
         end;
         IBAuxiliar.Transaction.Commit;
        end;

{        with IBAuxiliar do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
        end;
        if ReporteC.PrepareReport then
         begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := ReporteC;
           frmVistaPreliminar.ShowModal;
         end;
         IBAuxiliar.Transaction.Commit;      }
end;

procedure TfrmCargarCostasJudiciales.ReporteCInitDetailBandDataSet(
  Sender: TObject; DetailBand: TprBand; DataSet: TObject;
  const DataSetName: String);
begin
        if DataSetName = 'IBAuxiliar1' then begin
          with IBAuxiliar1 do begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := IBAuxiliar.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := IBAuxiliar.FieldByName('ID_PERSONA').AsString;
            try
             Open;
            except
             raise;
            end;
          end;
        end;
end;

procedure TfrmCargarCostasJudiciales.ReporteCPrintComplete(
  Sender: TObject);
begin
      vImpreso := true;
      with IBQuery1 do
       begin
         Close;
         sql.Clear;
         sql.Add('update "con$comprobante" set ');
         sql.Add('"con$comprobante"."IMPRESO" = :"IMPRESO"');
         sql.Add(' where ');
         sql.Add('"con$comprobante"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         sql.Add('"con$comprobante"."ID_AGENCIA" = :"ID_AGENCIA"');

         ParamByName('ID_COMPROBANTE').AsString:= IntToStr(Comprobante);
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('IMPRESO').AsInteger  := ord(vimpreso);
         ExecSQL;
         Transaction.Commit;
       end;
end;

procedure TfrmCargarCostasJudiciales.ChSucursalClick(Sender: TObject);
begin
        if ChSucursal.Checked = True then begin
          EdAgencia.Enabled := True;
          if IBAgencia.Transaction.InTransaction then
            IBAgencia.Transaction.Rollback;
          IBAgencia.Transaction.StartTransaction;
          IBAgencia.Active := True;
          EdAgencia.KeyValue := Agencia;
          EdCuenta.Enabled := False;
          EdAgencia.SetFocus;
        end
        else begin
          EdAgencia.Enabled := False;
          EdCuenta.Enabled := True;
          EdCuenta.SetFocus;
        end;
end;

procedure TfrmCargarCostasJudiciales.ChSucursalExit(Sender: TObject);
begin
        if ChSucursal.Checked = True then begin
          EdAgencia.Enabled := True;
          if IBAgencia.Transaction.InTransaction then
            IBAgencia.Transaction.Rollback;
          IBAgencia.Transaction.StartTransaction;
          IBAgencia.Active := True;
          EdAgencia.KeyValue := Agencia;
          EdCuenta.Enabled := False;
          EdAgencia.SetFocus;
        end
        else begin
          EdAgencia.Enabled := False;
          EdCuenta.Enabled := True;
          EdCuenta.SetFocus;
        end;
end;

procedure TfrmCargarCostasJudiciales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := caFree;
end;

end.

