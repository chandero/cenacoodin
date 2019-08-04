unit UnitRecuperacionsaldos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Dateutils, Buttons, IBSQL,
  ComCtrls;

type
  Tfrmrecuperacionsaldos = class(TForm)
    btnaceptar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBSactualizar: TIBSQL;
    IBQuery3: TIBQuery;
    BarraProgreso: TProgressBar;
    btnsalir: TBitBtn;
    procedure btnaceptarClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrecuperacionsaldos: Tfrmrecuperacionsaldos;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure Tfrmrecuperacionsaldos.btnaceptarClick(Sender: TObject);
var
codigo       : string;
agencia      : integer;
debito       : currency;
credito      : currency;
fechadia     : TDate;
mes          : integer;
mescierre    : string;
begin
  btnaceptar.Enabled := False;
  btnsalir.Enabled := False;
  btnsalir.Visible := True;


 with IBQuery1 do begin
   if Transaction.InTransaction then
      Transaction.Rollback;
   Transaction.StartTransaction;
   Close;
   SQL.Clear;
   SQL.Add('select count(*) AS TOTAL from CON$PUC');
   SQL.Add('where ');
   SQL.Add('CON$PUC.MOVIMIENTO <> 0');
   try
    Open;
     BarraProgreso.Max := FieldByName('TOTAL').AsInteger;
   except
     Transaction.Rollback;
     raise;
     Exit;
   end;
 end;



  with ibquery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('select ');
      sql.Add('CON$PUC.CODIGO,');
      sql.Add('CON$PUC.ID_AGENCIA,');
      sql.Add('CON$PUC.SALDOINICIAL');
      sql.Add('from CON$PUC');
      sql.Add('where ');
      sql.Add('CON$PUC.MOVIMIENTO <> 0');
      SQL.Add('order by CON$PUC.CODIGO');
      open;
      try
        while not Eof do
         begin
           Application.ProcessMessages;
           codigo := fieldbyname('CODIGO').AsString;
           agencia := fieldbyname('ID_AGENCIA').AsInteger;
              IBQuery2.Close;
              IBQuery2.sql.Clear;
              IBQuery2.sql.Add('update CON$SALDOSCUENTA set ');
              IBQuery2.sql.Add('CON$SALDOSCUENTA."DEBITO" =:"DEBITO",');
              IBQuery2.sql.Add('CON$SALDOSCUENTA."CREDITO" =:"CREDITO"');
              IBQuery2.sql.Add('where ');
              IBQuery2.sql.Add('CON$SALDOSCUENTA.ID_AGENCIA =:"ID_AGENCIA" and');
              IBQuery2.sql.Add('CON$SALDOSCUENTA.CODIGO =:"CODIGO"');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := agencia;
              IBQuery2.ParamByName('CODIGO').AsString := codigo;
              IBQuery2.ParamByName('DEBITO').AsCurrency := 0;
              IBQuery2.ParamByName('CREDITO').AsCurrency := 0;
              try
                IBQuery2.ExecSQL;
              except
                 IBQuery2.Transaction.Rollback;
                 raise;
                 Exit;
              end;
           with ibquery3 do
            begin
              IBQuery3.sql.Clear;
              IBQuery3.sql.Add('select ');
              IBQuery3.sql.Add('CON$AUXILIAR.ID_COMPROBANTE,');
              IBQuery3.sql.Add('CON$AUXILIAR.ID_AGENCIA,');
              IBQuery3.sql.Add('CON$AUXILIAR.FECHA,');
              IBQuery3.sql.Add('CON$AUXILIAR.CODIGO,');
              IBQuery3.sql.Add('CON$AUXILIAR.DEBITO,');
              IBQuery3.sql.Add('CON$AUXILIAR.CREDITO,');
              IBQuery3.sql.Add('CON$AUXILIAR.ESTADOAUX');
              IBQuery3.sql.Add('from CON$AUXILIAR');
              IBQuery3.sql.Add('where ');
              IBQuery3.sql.Add('CON$AUXILIAR.CODIGO =:"CODIGO" and');
              IBQuery3.SQL.Add('CON$AUXILIAR.ID_AGENCIA =:"ID_AGENCIA" and');
              IBQuery3.sql.Add('CON$AUXILIAR.ESTADOAUX =:"ESTADOAUX"');
              IBQuery3.ParamByName('CODIGO').AsString := codigo;
              IBQuery3.ParamByName('ID_AGENCIA').AsInteger := agencia;
              IBQuery3.ParamByname('ESTADOAUX').AsString := 'C';
              IBQuery3.open;
              while not ibquery3.Eof do
                begin
                 Application.ProcessMessages;
                 debito      := FieldbyName('DEBITO').AsCurrency;
                 credito     := FieldbyName('CREDITO').AsCurrency;
                 fechadia    := Fieldbyname('FECHA').AsDateTime;
                 mes := monthof(fechadia);
                 mescierre := formatcurr('00',mes);
                 with  IBSactualizar do
                  begin
                    sql.Clear;
                    sql.Add('update CON$SALDOSCUENTA set');
                    sql.Add('CON$SALDOSCUENTA."DEBITO" =CON$SALDOSCUENTA."DEBITO" + :"DEBITO",');
                    sql.Add('CON$SALDOSCUENTA."CREDITO" =CON$SALDOSCUENTA."CREDITO" + :"CREDITO"');
                    sql.Add('where ');
                    sql.Add('CON$SALDOSCUENTA.ID_AGENCIA =:"ID_AGENCIA" and');
                    sql.Add('CON$SALDOSCUENTA.CODIGO =:"CODIGO" and');
                    sql.Add('CON$SALDOSCUENTA.MES =:"MES"');
                    ParamByname('ID_AGENCIA').AsInteger := agencia;
                    ParamByname('CODIGO').AsString := codigo;
                    ParamByname('MES').AsInteger := mes;
                    ParamByname('DEBITO').AsCurrency := debito;
                    ParamByname('CREDITO').AsCurrency := credito;
                    try
                      ExecQuery;
                      if RowsAffected < 1 then
                       begin
                         Close;
                         SQL.Clear;
                         SQL.Add('insert into CON$SALDOSCUENTA values(:ID_AGENCIA,:CODIGO,:MES,:DEBITO,:CREDITO)');
                         ParamByName('ID_AGENCIA').AsInteger := Agencia;
                         ParamByName('CODIGO').AsString := codigo;
                         ParamByName('MES').AsInteger := StrToInt(mescierre);
                         ParamByName('DEBITO').AsCurrency := debito;
                         ParamByName('CREDITO').AsCurrency := credito;
                         try
                          ExecQuery;
                         except
                          raise;
                         end;
                        end;
                       close;
                      except
                       raise;
                      end;
                  end;
                 next;
               end;
            end; // fin query3
           next;
           BarraProgreso.Position := IBQuery1.RecNo +1;
         end; // fin while query1
         IBQuery1.Transaction.Commit;
         if ReCalculoSaldosGenerales then
         begin
//           IBQuery1.Transaction.Commit;
           MessageDlg('Proceso Culminado con Exito',mtInformation,[mbok],0);
         end
         else
           MessageDlg('Error Recalculando Saldos...',mtError,[mbok],0);
      finally
       btnaceptar.Enabled := False;
       Btnsalir.Enabled  := True;
      end;
    end; //fin query1
end;

procedure Tfrmrecuperacionsaldos.btnsalirClick(Sender: TObject);
begin
        self.Close;
end;

end.




