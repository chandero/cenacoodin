unit unitCierreDia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, Buttons, ComCtrls, ExtCtrls, IBQuery,
  IBSQL, Dateutils, pr_Common, pr_Parser, sdXmlDocuments,pr_TxClasses,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IBDatabase;

type
  Plerror   = ^Alist;
  Alist   = Record
    lagencia    : string;
    lcomprobante: string;
    lcuenta     : string;
    lcredito    : string;
    lnit        : string;
    lestado     : string;
    lcuadrado   : Boolean;
end;

type
      TTotales = Record
        totaldebito: Currency;
        totalcredito: Currency;
end;

type
  Tfrmcierredia = class(TForm)
    Panel1: TPanel;
    editfechacierre: TDateTimePicker;
    Label1: TLabel;
    Querycompcierre: TIBQuery;
    Queryauxcierre: TIBQuery;
    IBSQLcierre: TIBSQL;
    IBQRepnormal: TIBQuery;
    IBQRepanormal: TIBQuery;
    IBSQLcierre1: TIBSQL;
    IBQRepanormalID_AGENCIA: TSmallintField;
    IBQRepanormalID_COMPROBANTE: TIntegerField;
    IBQRepanormalERROR: TMemoField;
    IBQRepnormalID_AGENCIA: TSmallintField;
    IBQRepnormalID_COMPROBANTE: TIntegerField;
    IBQRepnormalFECHADIA: TDateField;
    IBQRepnormalTOTAL_DEBITO: TIBBCDField;
    IBQRepnormalTOTAL_CREDITO: TIBBCDField;
    IBQRepnormalESTADO: TIBStringField;
    IBVerificarcap: TIBSQL;
    Panel2: TPanel;
    BtnAceptar: TBitBtn;
    BtnReporte: TBitBtn;
    BtnSalir: TBitBtn;
    Reportcierre: TprTxReport;
    Repnormal: TprTxReport;
    Repanormal: TprTxReport;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBSQL3: TIBSQL;
    IBSQLIva: TIBSQL;
    IBSQLCodigo: TIBSQL;
    IBTransaction1: TIBTransaction;
    procedure BtnAceptarClick(Sender: TObject);
    procedure editfechacierreExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnReporteClick(Sender: TObject);
    procedure RepanormalUnknownObjFunction(Sender: TObject;
      Component: TComponent; const FuncName: String;
      const Parameters: TprVarsArray; ParametersCount: Integer;
      var Value: TprVarValue; var IsProcessed: Boolean);
    procedure editfechacierreEnter(Sender: TObject);
    procedure editfechacierreKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSalirClick(Sender: TObject);
  private
    function BuscaCodigo(vIdComprobante,vId: Integer;vPersona:string): integer;
    function ValidarTotales(idagencia,idcomp: integer): TTotales;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcierredia  : Tfrmcierredia;
  mes           : currency;
  vfechacierre  : TDate;
  fecha         : Tdate;
  id_comprobante: Integer;
  vcuadrado     : Boolean;
  vcodigo       : Boolean;
  vcuenta       : Boolean;
  vcredito      : Boolean;
  vpersona      : Boolean;
  codigo        : String;
  debito        : Currency;
  credito       : Currency;
  lerror        : Tlist;
  vcierreaux    : Boolean;
  vcierre       : Boolean;
  //variables validaciíón movimientos de caja con agencias
  vErrorAgencia : string;
  vEvaluaAgencia :Boolean;
  vCodigoIva :string;
  ADoc: TsdXmlDocument;
  RDoc: TsdXmlDocument;
  Nodo,Anode:TXmlNode;
  Astream :TMemoryStream;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitVistaPreliminar,
     UnitPantallaProgreso;

procedure Tfrmcierredia.BtnAceptarClick(Sender: TObject);
var
frmProgreso:TfrmProgreso;
i,j             : integer;
total_debito    : currency;
total_credito   : currency;
estado          : string;
estadoaux       : string;
id              : integer;
cuenta          : string;
colocacion      : string;
identificacion  : string;
mescierre       : string;
TipoCaptacion   : Integer;
DigitoC         : String;
vValidaAgencia  :Smallint;
Tcomp           : TTotales;
begin
   if IBTransaction1.InTransaction then
      IBTransaction1.Rollback;
   IBTransaction1.StartTransaction;
   vcierre := True;
   try
   with querycompcierre do
    begin
      SQL.Clear;
      SQL.Add('select CODIGO from CAJ$CODIGOSPUC where ID_CODIGO = 1');
      Open;
      vCodigoIva := FieldByName('CODIGO').AsString;
      sql.Clear;
      sql.Add('Select ');
      sql.Add('CON$COMPROBANTE.ID_COMPROBANTE,');
      sql.Add('CON$COMPROBANTE.ID_AGENCIA,');
      sql.Add('CON$COMPROBANTE.FECHADIA,');
      sql.Add('CON$COMPROBANTE.TOTAL_DEBITO,');
      sql.Add('CON$COMPROBANTE.TOTAL_CREDITO,');
      sql.Add('CON$COMPROBANTE.ESTADO');
      sql.Add('from CON$COMPROBANTE');
      sql.Add('where CON$COMPROBANTE."FECHADIA" =:"FECHADIA" and CON$COMPROBANTE.ESTADO = :ESTADO and');
      SQL.Add('(CON$COMPROBANTE.TOTAL_DEBITO > 0 and CON$COMPROBANTE.TOTAL_CREDITO > 0)');
      ParamByName('FECHADIA').AsDate := vfechacierre;
      ParamByName('ESTADO').AsString := 'O';
      open;
      Querycompcierre.Last;
      Querycompcierre.First;

      if querycompcierre.RecordCount = 0 then
       begin
         MessageDlg('No exiten comprobantes de fecha' + #10 + #13 + datetostr(vfechacierre) + #13 + #10 + 'Para Cerrar',mterror,[mbok],0);
         exit;
       end;
       frmProgreso := TfrmProgreso.Create(Self);
       frmProgreso.Min := 0;
       frmProgreso.Max := querycompcierre.RecordCount;
       frmProgreso.Titulo := 'Procesando Cierre del Día';
       frmProgreso.Position := 0;
       frmProgreso.Ejecutar;
        While not QueryCompcierre.Eof do
         begin
           id_comprobante := FieldByName('ID_COMPROBANTE').AsInteger;
           frmProgreso.InfoLabel := 'Verificando Comprobante No.:'+Format('%.7d',[id_comprobante]);
           frmProgreso.Position := Querycompcierre.RecNo;
           Application.ProcessMessages;
           agencia := FieldByName('ID_AGENCIA').AsInteger;
           estado := FieldByName('ESTADO').AsString;
           // Validar Totales del Comprobante
           frmProgreso.InfoLabel := 'Verificando Comprobante No.:'+Format('%.7d',[id_comprobante])+ ' - Comprobando Saldos';
           Tcomp := validartotales(agencia,id_comprobante);
           // Totales Validados
           total_debito := Tcomp.totaldebito;
           total_credito:= Tcomp.totalcredito;
           vcuadrado := true;
           vcodigo := True;
           vcuenta := true;
           vcredito := true;
           vpersona := true;
           if estado = 'O' then
            begin
              frmProgreso.InfoLabel := 'Verificando Comprobante No.:'+Format('%.7d',[id_comprobante]) + ' - Reportando Descuadre';
              if total_debito <> total_credito then
                 with IBSQLcierre do
                   begin
                     sql.Clear;
                     sql.Add('insert into CON$ERRORCIERRECOMP (');
                     sql.Add('CON$ERRORCIERRECOMP."ID_AGENCIA",');
                     sql.Add('CON$ERRORCIERRECOMP."ID_COMPROBANTE",');
                     sql.Add('CON$ERRORCIERRECOMP."ERROR")');
                     sql.Add(' values(');
                     sql.Add(':"ID_AGENCIA",:"ID_COMPROBANTE",:"ERROR")');
                     ParamByName('ID_AGENCIA').AsInteger := agencia;
                     ParamByName('ID_COMPROBANTE').AsInteger := id_comprobante;
                     ParamByName('ERROR').AsString := 'El Comprobante no está Cuadrado';
                     ExecQuery;
                     vcuadrado := false;
                     close;
                   end;

               with Queryauxcierre do
                begin
                  sql.Clear;
                  sql.Add('Select ');
                  sql.Add('CON$AUXILIAR.CODIGO,');
                  sql.Add('CON$AUXILIAR.DEBITO,');
                  sql.Add('CON$AUXILIAR.CREDITO,');
                  sql.Add('CON$AUXILIAR.ID_CUENTA,');
                  sql.Add('CON$AUXILIAR.ID_COLOCACION,');
                  sql.Add('CON$AUXILIAR.ID_IDENTIFICACION,');
                  sql.Add('CON$AUXILIAR.ID_PERSONA,');
                  sql.Add('CON$AUXILIAR.ESTADOAUX');
                  sql.Add('FROM CON$AUXILIAR');
                  sql.Add(' where CON$AUXILIAR.ID_COMPROBANTE =:"ID_COMPROBANTE" and CON$AUXILIAR.TIPO_COMPROBANTE = :TIPO_COMPROBANTE');
                  sql.Add('CON$AUXILIAR.ID_AGENCIA =:"ID_AGENCIA"');
                  parambyname('ID_COMPROBANTE').AsInteger := id_comprobante;
                  paramByname('TIPO_COMPROBANTE').AsInteger := 1;
                  parambyname('ID_AGENCIA').AsInteger:= agencia;
                  Open;
                  Queryauxcierre.Last;
                  Queryauxcierre.First;
                  While not queryauxcierre.Eof do
                   begin
                     mes := MonthOf(vfechacierre);
                     mescierre := formatcurr('00',mes);
                     codigo := FieldByName('CODIGO').AsString;
                     debito := FieldByName('DEBITO').AsCurrency;
                     credito := FieldByName('CREDITO').AsCurrency;
                     cuenta := trim(FieldByName('ID_CUENTA').AsString);
                     colocacion := trim(FieldByName('ID_COLOCACION').AsString);
                     id := FieldByName('ID_IDENTIFICACION').AsInteger;
                     identificacion := trim(FieldByName('ID_PERSONA').AsString);
                     estadoaux := FieldByName('ESTADOAUX').AsString;
// Verificar Cuenta
                     frmProgreso.InfoLabel := 'Verificando Comprobante No.:'+Format('%.7d',[id_comprobante])+' - Validando Codigo';
                       IBSQLcierre.Close;
                       IBSQLcierre.SQL.Clear;
                       IBSQLcierre.SQL.Add('select * from CON$PUC where ID_AGENCIA = :ID_AGENCIA and CODIGO = :CODIGO');
                       IBSQLcierre.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                       IBSQLcierre.ParamByName('CODIGO').AsString := codigo;
                       try
                        IBSQLcierre.ExecQuery;
                        if IBSQLcierre.RecordCount < 1 then
                         with IBSQLcierre1 do
                          begin
                           Close;
                           sql.Clear;
                           sql.Add('insert into CON$ERRORCIERRECOMP (');
                           sql.Add('CON$ERRORCIERRECOMP."ID_AGENCIA",');
                           sql.Add('CON$ERRORCIERRECOMP."ID_COMPROBANTE",');
                           sql.Add('CON$ERRORCIERRECOMP."ERROR")');
                           sql.Add(' values(');
                           sql.Add(':"ID_AGENCIA",:"ID_COMPROBANTE",:"ERROR")');
                           ParamByName('ID_AGENCIA').AsInteger := agencia;
                           ParamByName('ID_COMPROBANTE').AsInteger := id_comprobante;
                           ParamByName('ERROR').AsString := 'La Cuenta' + ' ' + codigo + ' ' + 'No Existe';
                           ExecQuery;
                           vcodigo := false;
                           Close;
                          end;
                       except
                         raise;
                       end;
// Fin verificar cuenta
                     IBSQLcierre.Close;
                     if estadoaux = 'O' then
                      begin
                        if (cuenta <> '') and (cuenta <> '0') then
                        begin
                           with IBSQLcierre do
                            begin
                              Sql.Clear;
                              Sql.Add('Select');
                              Sql.Add('"cap$tipocaptacion".ID_TIPO_CAPTACION');
                              Sql.Add('from "cap$tipocaptacion"');
                              Sql.Add('where "cap$tipocaptacion".CODIGO_CONTABLE =:"CODIGO_CONTABLE"');
                              ParamByName('CODIGO_CONTABLE').AsString := Codigo;
                              ExecQuery;
                              if RecordCount > 0 then begin
                               TipoCaptacion := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                               DigitoC := DigitoControl(TipoCaptacion,formatcurr('0000000',StrToCurr(cuenta)));
                               IBSQLcierre.Close;
                               Sql.Clear;
                               Sql.Add('select');
                               Sql.Add('"cap$maestrotitular".NUMERO_CUENTA');
                               Sql.Add('from "cap$maestrotitular"');
                               Sql.Add('where');
                               Sql.Add('"cap$maestrotitular".ID_AGENCIA =:"ID_AGENCIA" and');
                               Sql.Add('"cap$maestrotitular".ID_TIPO_CAPTACION =:"ID_TIPO_CAPTACION" and');
                               Sql.Add('"cap$maestrotitular".NUMERO_CUENTA =:"NUMERO_CUENTA" and');
                               Sql.Add('"cap$maestrotitular".DIGITO_CUENTA =:"DIGITO_CUENTA"');
                               ParamByName('ID_AGENCIA').AsInteger := Agencia;
                               ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                               ParamByName('NUMERO_CUENTA').AsString := cuenta;
                               ParamByName('DIGITO_CUENTA').AsString := DigitoC;
                               ExecQuery;
                               if not (IBSQLcierre.RecordCount > 0) then
                                 with IBSQLcierre1 do
                                  begin
                                    sql.Clear;
                                    sql.Add('insert into CON$ERRORCIERRECOMP (');
                                    sql.Add('CON$ERRORCIERRECOMP."ID_AGENCIA",');
                                    sql.Add('CON$ERRORCIERRECOMP."ID_COMPROBANTE",');
                                    sql.Add('CON$ERRORCIERRECOMP."ERROR")');
                                    sql.Add(' values(');
                                    sql.Add(':"ID_AGENCIA",:"ID_COMPROBANTE",:"ERROR")');
                                    ParamByName('ID_AGENCIA').AsInteger := agencia;
                                    ParamByName('ID_COMPROBANTE').AsInteger := id_comprobante;
                                    ParamByName('ERROR').AsString := 'La Captación' + ' ' + cuenta + ' ' + 'No Existe';
                                    ExecQuery;
                                    vcuenta := false;
                                    Close;
                                  end;
                               end;
                              IBSQLcierre.Close;
                            end;
                         end;

                        with IBSQLcierre do
                         begin
                           Close;
                           sql.Clear;
                           sql.Add('select ID_COLOCACION from "col$colocacion"');
                           sql.Add('where "col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
                           sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
                           ParamByName('ID_AGENCIA').AsInteger := Agencia;
                           ParamByName('ID_COLOCACION').AsString:= colocacion;
                           ExecQuery;
                           frmProgreso.InfoLabel := 'Verificando Comprobante No.:'+Format('%.7d',[id_comprobante]) + ' - Validando Colocacion';
                           if colocacion <> '' then
                            begin
                              if not (RecordCount > 0) then
                                 with IBSQLcierre1 do
                                  begin
                                    sql.Clear;
                                    sql.Add('insert into CON$ERRORCIERRECOMP (');
                                    sql.Add('CON$ERRORCIERRECOMP."ID_AGENCIA",');
                                    sql.Add('CON$ERRORCIERRECOMP."ID_COMPROBANTE",');
                                    sql.Add('CON$ERRORCIERRECOMP."ERROR")');
                                    sql.Add(' values(');
                                    sql.Add(':"ID_AGENCIA",:"ID_COMPROBANTE",:"ERROR")');
                                    ParamByName('ID_AGENCIA').AsInteger := agencia;
                                    ParamByName('ID_COMPROBANTE').AsInteger := id_comprobante;
                                    ParamByName('ERROR').AsString := 'El Crédito' + ' ' + colocacion + ' ' + 'No Existe';
                                    ExecQuery;
                                    vcredito := false;
                                    Close;
                                  end;
                            end;
                           close;
                         end;
                         frmProgreso.InfoLabel := 'Verificando Comprobante No.:'+Format('%.7d',[id_comprobante]) + ' - Validando Documento';
                        with IBSQLcierre do
                         begin
                           vEvaluaAgencia := False;
                           sql.Clear;
                           sql.Add('select ID_IDENTIFICACION, ID_PERSONA from "gen$persona"');
                           sql.Add('where "gen$persona".ID_IDENTIFICACION =:"ID_IDENTIFICACION" and');
                           sql.Add('"gen$persona".ID_PERSONA =:"ID_PERSONA"');
                           ParamByName('ID_IDENTIFICACION').AsInteger:= id;
                           ParamByName('ID_PERSONA').AsString:= identificacion;
                           ExecQuery;
                           if (id <> 0) and (identificacion <> '') then
                            begin
                              if not (RecordCount > 0) then
                              begin
                                vValidaAgencia := 0;
                                vErrorAgencia := '';
                                if vCodigoIva = codigo then
                                begin
                                  frmProgreso.InfoLabel := 'Verificando Documentos en las Agencias en Nota: ' + IntToStr(id_comprobante);
                                  Application.ProcessMessages;
                                  vValidaAgencia := buscacodigo(id_comprobante,id,identificacion);
                                end;
                               if vValidaAgencia = 0 then
                                 with IBSQLcierre1 do
                                   begin
                                     sql.Clear;
                                     sql.Add('insert into CON$ERRORCIERRECOMP (');
                                     sql.Add('CON$ERRORCIERRECOMP."ID_AGENCIA",');
                                     sql.Add('CON$ERRORCIERRECOMP."ID_COMPROBANTE",');
                                     sql.Add('CON$ERRORCIERRECOMP."ERROR")');
                                     sql.Add(' values(');
                                     sql.Add(':"ID_AGENCIA",:"ID_COMPROBANTE",:"ERROR")');
                                     ParamByName('ID_AGENCIA').AsInteger := agencia;
                                     ParamByName('ID_COMPROBANTE').AsInteger  := id_comprobante;
                                     if vErrorAgencia <> '' then
                                       ParamByName('ERROR').AsString := 'Nit/cc ' + identificacion + ' ' + ' Error Ag.' + vErrorAgencia
                                     else
                                       ParamByName('ERROR').AsString := 'El NIT/CC' + ' ' + identificacion + ' ' + 'No Existe';
                                     ExecQuery;
                                     vpersona := false;
                                     Close;
                                   end;
                                 end;
                            end;
                           close;
                         end;

                        if vcuadrado and vcodigo and vcuenta and vcredito and vpersona then
                         begin
                           with IBSQLcierre do
                             begin
                               sql.Clear;
                               sql.Add('update CON$SALDOSCUENTA set ');
                               sql.Add('CON$SALDOSCUENTA."DEBITO" =CON$SALDOSCUENTA."DEBITO" + :"DEBITO",');
                               sql.Add('CON$SALDOSCUENTA."CREDITO" =CON$SALDOSCUENTA."CREDITO" + :"CREDITO"');
                               sql.Add(' where ');
                               sql.Add('CON$SALDOSCUENTA."ID_AGENCIA" =:"ID_AGENCIA" and');
                               sql.Add('CON$SALDOSCUENTA."CODIGO" =:"CODIGO" and');
                               sql.Add('CON$SALDOSCUENTA."MES" =:"MES"');
                               ParamByName('ID_AGENCIA').AsInteger := agencia;
                               ParamByName('CODIGO').AsString := codigo;
                               ParamByName('MES').AsString := mescierre;
                               ParamByName('DEBITO').AsCurrency := debito;
                               ParamByName('CREDITO').AsCurrency := credito;
                               ExecQuery;
                               if RowsAffected < 1 then begin
                                 Close;
                                 SQL.Clear;
                                 SQL.Add('insert into CON$SALDOSCUENTA values (:ID_AGENCIA,:CODIGO,:MES,:DEBITO,:CREDITO)');
                                 ParamByName('ID_AGENCIA').AsInteger := agencia;
                                 ParamByName('CODIGO').AsString := codigo;
                                 ParamByName('MES').AsString := mescierre;
                                 ParamByName('DEBITO').AsCurrency := debito;
                                 ParamByName('CREDITO').AsCurrency := credito;
                                 ExecQuery;
                               end;
                               Close;
                             end;
                            with IBSQLcierre1 do
                             begin
                               sql.Clear;
                               sql.Add('update CON$AUXILIAR set ');
                               sql.Add('CON$AUXILIAR."ESTADOAUX" =:"ESTADOAUX"');
                               sql.Add(' where ');
                               sql.Add('CON$AUXILIAR."ID_AGENCIA" =:"ID_AGENCIA" and');
                               sql.Add('CON$AUXILIAR."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
                               ParamByName('ID_AGENCIA').AsInteger := agencia;
                               ParamByName('ID_COMPROBANTE').AsInteger := id_comprobante;
                               ParamByName('ESTADOAUX').AsString := 'C';
                               ExecQuery;
                               Close;
                             end;
                           vcierreaux := true;
                         end;  // fin de if cuenta,credito y persona

                      end; //fin de auxiliar abierto
                     vcodigo := True;
                     vcuadrado := true;
                     vcuenta := true;
                     vcredito := true;
                     vpersona := true;
                     next;
                   end;  // fin de while auxiliar
                  Close;
                end;  //fin with auxiliar

               if vcierreaux = True then
                   with IBSQLcierre do
                     begin
                       sql.Clear;
                       sql.Add('update CON$COMPROBANTE set ');
                       sql.Add('CON$COMPROBANTE."ESTADO" =:"ESTADO"');
                       sql.Add(' where ');
                       sql.Add('CON$COMPROBANTE."ID_AGENCIA" =:"ID_AGENCIA" and');
                       sql.Add('CON$COMPROBANTE."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
                       ParamByName('ID_AGENCIA').AsInteger := agencia;
                       ParamByName('ID_COMPROBANTE').AsInteger := id_comprobante;
                       ParamByName('ESTADO').AsString := 'C';
                       ExecQuery;
                       Close;
                     end;
            end //fin de comprobante abierto
         else if estado = 'C' then
            begin
              with IBSQLcierre do
               begin
                 sql.Clear;
                 sql.Add('insert into CON$ERRORCIERRECOMP (');
                 sql.Add('CON$ERRORCIERRECOMP."ID_AGENCIA",');
                 sql.Add('CON$ERRORCIERRECOMP."ID_COMPROBANTE",');
                 sql.Add('CON$ERRORCIERRECOMP."ERROR")');
                 sql.Add(' values(');
                 sql.Add(':"ID_AGENCIA",:"ID_COMPROBANTE",:"ERROR")');
                 ParamByName('ID_AGENCIA').AsInteger := agencia;
                 ParamByName('ID_COMPROBANTE').AsInteger  := id_comprobante;
                 ParamByName('ERROR').AsString := 'El Comprobante está Cerrado';
                 ExecQuery;
                 close;
               end;
            end
         else if estado = 'N' then
            begin
              with IBSQLcierre do
               begin
                 sql.Clear;
                 sql.Add('insert into CON$ERRORCIERRECOMP (');
                 sql.Add('CON$ERRORCIERRECOMP."ID_AGENCIA",');
                 sql.Add('CON$ERRORCIERRECOMP."ID_COMPROBANTE",');
                 sql.Add('CON$ERRORCIERRECOMP."ERROR")');
                 sql.Add(' values(');
                 sql.Add(':"ID_AGENCIA",:"ID_COMPROBANTE",:"ERROR")');
                 ParamByName('ID_AGENCIA').AsInteger := agencia;
                 ParamByName('ID_COMPROBANTE').AsInteger := id_comprobante;
                 ParamByName('ERROR').AsString := 'El Comprobante está Anulado';
                 ExecQuery;
                 close;
               end;
            end;
          next;
         end; //fin de While comprobante
      frmProgreso.Cerrar;
      with IBSQLcierre do
       begin
         sql.Clear;
         sql.Add('select * from CON$ERRORCIERRECOMP');
         ExecQuery;
         if IBSQLcierre.RecordCount > 0 then
          begin
            vcierre := false;
            MessageDlg('Error al Efectuar Cierre',mterror,[mbok],0);
            BtnReporteClick(sender);
            Close;
            Transaction.RollbackRetaining;
          end
          else
          begin
            close;
            Transaction.CommitRetaining;
            if ReCalculoSaldosGenerales then
               BtnReporteClick(Sender)
            else
               MessageDlg('Error al Efectuar Cierre',mterror,[mbok],0);
          end;
       end;

    end;  // fin de with comprobante
   Except
            MessageDlg('Error al Efectuar Cierre',mterror,[mbok],0);
            IBTransaction1.Rollback;
            raise;
   End;

   IBTransaction1.Commit;

end;

procedure Tfrmcierredia.editfechacierreExit(Sender: TObject);
begin
        fecha := editfechacierre.Date;
        vfechacierre := fecha;
end;

procedure Tfrmcierredia.FormShow(Sender: TObject);
begin
        lerror := Tlist.Create;
end;

procedure Tfrmcierredia.BtnReporteClick(Sender: TObject);
begin
        if vcierre = True then
         begin
           with IBQRepnormal do
            begin
              if Transaction.InTransaction then
                 Transaction.Rollback;
              Transaction.StartTransaction;
              sql.Clear;
              sql.Add('Select CON$COMPROBANTE.ID_AGENCIA,');
              sql.Add('CON$COMPROBANTE.ID_COMPROBANTE,');
              sql.Add('CON$COMPROBANTE.FECHADIA,');
              sql.Add('CON$COMPROBANTE.TOTAL_DEBITO,');
              sql.Add('CON$COMPROBANTE.TOTAL_CREDITO,');
              sql.Add('CON$COMPROBANTE.ESTADO');
              sql.Add('from CON$COMPROBANTE');
              sql.Add('where ');
              sql.Add('CON$COMPROBANTE."FECHADIA" =:"FECHADIA" and');
              sql.Add('CON$COMPROBANTE."ESTADO" =:"ESTADO"');
              ParamByName('FECHADIA').AsDate := vfechacierre;
              ParamByName('ESTADO').AsString := 'C';
              open;
            end;
            Repnormal.Variables.ByName['empresa'].AsString := empresa;
            if Repnormal.PrepareReport then
               Repnormal.PreviewPreparedReport(true);
            IBQrepnormal.Close;
         end;

        if vcierre = False then
         begin
           with IBQRepanormal do
            begin
              sql.Clear;
              sql.Add('Select CON$ERRORCIERRECOMP.ID_AGENCIA,');
              sql.Add('CON$ERRORCIERRECOMP.ID_COMPROBANTE,');
              sql.Add('CON$ERRORCIERRECOMP.ERROR');
              sql.Add('from CON$ERRORCIERRECOMP');
              open;
            end;
            Repanormal.Variables.ByName['empresa'].AsString := empresa;
            Repanormal.Variables.ByName['fechadia'].AsString := datetostr(vfechacierre);
            if Repanormal.PrepareReport then
               Repanormal.PreviewPreparedReport(true);
            IBQrepanormal.Close;
         end;

end;



procedure Tfrmcierredia.RepanormalUnknownObjFunction(Sender: TObject;
  Component: TComponent; const FuncName: String;
  const Parameters: TprVarsArray; ParametersCount: Integer;
  var Value: TprVarValue; var IsProcessed: Boolean);
var
  f : TField;
begin
 if (Component=IBQRepanormal) and
    (AnsiCompareText(FuncName,'IBQRepanormal.dato')=0) and
    (ParametersCount=1) then
  begin
    if _vAsString(Parameters[0]) = 'item' then
     begin
      f := IBQRepanormal.FindField('ID_CUENTA');
      if f <> nil then
       begin
         if trim(f.AsString) <> '' then
           value.vString := trim(f.AsString)
         else
         begin
           f := IBQRepanormal.FindField('ID_COLOCACION');
           if f <> nil then
              if trim(f.AsString) <> '' then
                value.vString := trim(f.AsString)
           else
           begin
             f := IBQRepanormal.FindField('ID_PERSONA');
             if f <> nil then
              if trim(f.AsString) <> '' then
                 value.vString := trim(f.AsString)
             else
             begin
             f := IBQRepanormal.FindField('ESTADO');
             if f <> nil then
              if trim(f.AsString) <> '' then
                 value.vString := trim(f.AsString)
               else
               begin
               f := IBQRepanormal.FindField('CUADRADO');
               if f <> nil then
                if trim(f.AsString) <> '' then
                   value.vString := trim(f.AsString)
                 else
                 if trim(f.AsString) = '' then
                    value.vString := '';
               end;
             end;
           end;
         end;
       IsProcessed := true;
       end;
     end;
  end;
end;

procedure Tfrmcierredia.editfechacierreEnter(Sender: TObject);
begin
        EditFechacierre.Date := Date;
end;

procedure Tfrmcierredia.editfechacierreKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure Tfrmcierredia.BtnSalirClick(Sender: TObject);
begin
        Close;

end;

function Tfrmcierredia.BuscaCodigo(vIdComprobante,vId: Integer;vPersona:string): integer;
var     vIdAgencia :Integer;
        vHost :string;
        vPuerto :Integer;
        vQuery :string;
        cadena :string;
        tamano :Integer;
        vDesc :string;
begin
        //vPuerto := 3052;
        vIdAgencia := 0;
        Result := 0;
        with IBSQLIva do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select ID_AGENCIA,CODIGO_CONTABLE,DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA <> :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          while not Eof do
          begin
            IBSQLCodigo.Close;
            IBSQLCodigo.ParamByName('CODIGO').AsString := FieldByName('CODIGO_CONTABLE').AsString;
            IBSQLCodigo.ParamByName('ID_COMPROBANTE').AsInteger := vIdComprobante;
            IBSQLCodigo.ExecQuery;
            if IBSQLCodigo.FieldByName('NUMERO').AsInteger <> 0 then
            begin
               vIdAgencia := FieldByName('ID_AGENCIA').AsInteger;
               vDesc := FieldByName('DESCRIPCION_AGENCIA').AsString;
               Break;
            end;
            Next;
          end;
        end;
{
        if vIdAgencia <> 0 then
        begin
          {case vIdAgencia of
            1 : vHost := host_ocana;
            2 : vHost := host_abrego;
            3 : vHost := host_convencion;
          end;}
   {       
        vHost := BuscaServicio(vIdAgencia,1).vHost;
        vPuerto := BuscaServicio(vIdAgencia,1).vPuerto;
        // inicio de la verificacion del documento en host remoto
        vQuery := 'select * from VERIFICAPERSONA(' + '''' + vPersona + '''' + ',' +  IntToStr(vId) + ')';
        //frmProgreso.InfoLabel := 'Verificando Documentos Agencia : ' + vDesc;
        //Application.ProcessMessages;
        ADoc := TsdXmlDocument.CreateName('query_info');
        ADoc.XmlFormat := xfReadable;
        ANode := ADoc.Root.NodeNew('querys');
        Nodo := ANode.NodeNew('query');
        Nodo.WriteString('tipo','select');
        Nodo.WriteString('sentencia',vQuery);
        ADoc.SaveToFile('c:\querycierre.xml');
        Astream := TMemoryStream.Create;
        ADoc.SaveToStream(Astream);
        with IdTCPClient1 do
        begin
           Host := vhost;
           Port := vpuerto;
           try
             Connect;
           except
           on e: Exception do
           begin
             vErrorAgencia := vDesc;
             Disconnect;
             Exit;
           end;
           end;
           if Connected then
           begin
             try
              Cadena := ReadLn();
              WriteInteger(AStream.Size);
              OpenWriteBuffer;
              WriteStream(AStream);
              CloseWriteBuffer;
              tamano := ReadInteger;
              Astream := TMemoryStream.Create;
              ReadStream(Astream,tamano,False);
              RDoc := TsdXmlDocument.Create;
              RDoc.LoadFromStream(AStream);
              RDoc.SaveToFile('c:\wum2.xml');
              Disconnect;
             except
             begin
               vErrorAgencia := vDesc;
               Disconnect;
               Exit;
             end;
             end;
           end;
           Nodo := RDoc.Root.NodeByName('consulta000');
           Anode := Nodo.NodeByName('Registro');
           if Anode.ReadInteger('campo') <> 0 then
              Result := 1;
         end;
        end;
        }
end;

function Tfrmcierredia.ValidarTotales(idagencia,idcomp: integer): TTotales;
var
  _queryAux:TIBSQL;
  _queryUpd:TIBSQL;
begin
  _queryAux := TIBSQL.Create(self);
  _queryUpd := TIBSQL.Create(self);

  _queryAux.Transaction := IBTransaction1;
  _queryAux.SQL.Clear;
  _queryAux.SQL.Add('select SUM(DEBITO) AS DEBITO, SUM(CREDITO) AS CREDITO from CON$AUXILIAR');
  _queryAux.SQL.Add('where');
  _queryAux.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_COMPROBANTE = :ID_COMPROBANTE');
  _queryAux.ParamByName('ID_AGENCIA').AsInteger := idagencia;
  _queryAux.ParamByName('ID_COMPROBANTE').AsInteger := idcomp;
  try
   _queryAux.ExecQuery;
   Result.totaldebito := _queryAux.FieldByName('DEBITO').AsCurrency;
   Result.totalcredito := _queryAux.FieldByName('CREDITO').AsCurrency;
   _queryAux.Close;
  except
    Result.totaldebito := 0;
    Result.totalcredito := 0;
    raise;
    Exit;
  end;

  _queryUpd.Transaction := IBTransaction1;
  _queryUpd.SQL.Clear;
  _queryUpd.SQL.Add('update CON$COMPROBANTE ');
  _queryUpd.SQL.Add('SET TOTAL_DEBITO = :TOTAL_DEBITO,');
  _queryUpd.SQL.Add('TOTAL_CREDITO = :TOTAL_CREDITO');
  _queryUpd.SQL.Add('where ID_AGENCIA = :ID_AGENCIA ');
  _queryUpd.SQL.Add('and ID_COMPROBANTE = :ID_COMPROBANTE');
  _queryUpd.ParamByName('TOTAL_DEBITO').AsCurrency := Result.totaldebito;
  _queryUpd.ParamByName('TOTAL_CREDITO').AsCurrency := Result.totalcredito;
  _queryUpd.ParamByName('ID_AGENCIA').AsInteger := idagencia;
  _queryUpd.ParamByName('ID_COMPROBANTE').AsInteger := idcomp;
  try
   _queryUpd.ExecQuery;
   _queryUpd.Close;
  except
    raise;
    Exit;
  end;


end;

end.



