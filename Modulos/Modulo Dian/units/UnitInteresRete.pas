unit UnitInteresRete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBSQL, StdCtrls, Buttons, DBClient,DataSetToExcel, StrUtils;

type
  TFrmInteresRete = class(TForm)
    BitBtn1: TBitBtn;
    IBSQL1: TIBSQL;
    IBQuery1: TIBQuery;
    CdSaldo: TClientDataSet;
    CdSaldoCONCEPTO: TStringField;
    CdSaldoTIPO_DOC: TIntegerField;
    CdSaldoNUMERO: TStringField;
    CdSaldoDV: TStringField;
    CdSaldoP_APELLIDO: TStringField;
    CdSaldoS_APELLIDO: TStringField;
    CdSaldoP_NOMBRE: TStringField;
    CdSaldoS_NOMBRE: TStringField;
    CdSaldoRAZON: TStringField;
    CdSaldoDIRECCION: TStringField;
    CdSaldoDPTO: TStringField;
    CdSaldoMCP: TStringField;
    CdSaldoSALDO: TStringField;
    IBSQL3: TIBSQL;
    save: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInteresRete: TFrmInteresRete;

implementation

uses UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmInteresRete.BitBtn1Click(Sender: TObject);
VAR  Id:string;
  Dg:string;
  Tp:string;
  Nm:string;
  Dr:string;
  Mn:string;
  Dpto :string;
  vValor :Currency;
  ExcelFile:TDataSetToExcel;
  vCodMunicipio :string;
begin
        CdSaldo.CancelUpdates;
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT distinct');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"gen$persona".ID_IDENTIFICACION,');
          SQL.Add('"gen$direccion".DIRECCION || '' '' || "gen$direccion".BARRIO AS DIRECCION,');
          SQL.Add('"gen$direccion".MUNICIPIO AS MUNICIPIO,"gen$direccion".COD_MUNICIPIO');
          SQL.Add('FROM');
          SQL.Add('"dian$interesespagos1"');
          SQL.Add('INNER JOIN "gen$persona" ON ("dian$interesespagos1".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("dian$interesespagos1".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('LEFT OUTER JOIN "gen$direccion" ON ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION)');
          SQL.Add('AND ("gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA)');
          SQL.Add('WHERE');
          SQL.Add('"gen$direccion".ID_DIRECCION = 1');
//          SQL.Add('where "gen$persona".ID_IDENTIFICACION = 4 AND "gen$persona".RETEFUENTE = 0');
          Open;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Max := RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.InfoLabel := 'Creando Reporte de Salida';
          frmProgreso.Ejecutar;
          while not Eof do
          begin
               vCodMunicipio := FieldByName('COD_MUNICIPIO').AsString;
              frmProgreso.Position := RecNo;
              Application.ProcessMessages;
              with IBSQL3 do
              begin
                try
                  Close;
                  SQL.Clear;
                  SQL.Add('select sum(VALOR) as VALOR from "dian$interesespagos1" where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
                  ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                  ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                  ExecQuery;
                  vValor := FieldByName('VALOR').AsCurrency;
                except
                ShowMessage(IBQuery1.FieldByName('ID_PERSONA').AsString);
                end;
              end;
              if vValor > 0 then // INICIO FIN VALIDA SALDO
              begin
               CdSaldo.Append;
               CdSaldo.FieldValues['CONCEPTO'] := '2206';
               if FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
               begin
                 Id := LeftStr(FieldByName('ID_PERSONA').AsString,Length(FieldByName('ID_PERSONA').AsString)-1);
                 Dg := RightStr(FieldByName('ID_PERSONA').AsString,1);
               end
               else
               begin
                 Id := FieldByName('ID_PERSONA').AsString;
                 Dg := '';
               end;
               case FieldByName('ID_IDENTIFICACION').AsInteger of
                 1: tp := '11';
                 2: Tp := '12';
                 3: Tp := '13';
                 4: Tp := '31';
                 6: Tp := '22';
                 9: Tp := '00';
               end;
               CdSaldo.FieldValues['TIPO_DOC'] := Tp;
               CdSaldo.FieldValues['NUMERO'] := Id;
               CdSaldo.FieldValues['DV'] := Dg;
               if Tp <> '31' then
               begin
                 CdSaldo.FieldValues['P_APELLIDO'] := FieldByName('PRIMER_APELLIDO').AsString;
                 CdSaldo.FieldValues['S_APELLIDO'] := FieldByName('SEGUNDO_APELLIDO').AsString;
                 CdSaldo.FieldValues['P_NOMBRE'] := FieldByName('NOMBRE').AsString;
                 CdSaldo.FieldValues['S_NOMBRE'] := '';
               end
               else
               begin
                 CdSaldo.FieldValues['P_APELLIDO'] := '';
                 CdSaldo.FieldValues['S_APELLIDO'] := '';
                 CdSaldo.FieldValues['P_NOMBRE'] := '';
                 CdSaldo.FieldValues['S_NOMBRE'] := '';
               end;
               if Tp = '31' then
                 CdSaldo.FieldValues['RAZON'] := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString)
               else
                 CdSaldo.FieldValues['RAZON'] := '';
               CdSaldo.FieldValues['DIRECCION'] := FieldByName('DIRECCION').AsString;
               {with IBSQL3 do
               begin
                 Close;
                 SQL.Clear;
                 SQL.Add('select DPTO,MUN from "dian$con_personas" where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
                 ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                 ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                 ExecQuery;
                 Mn := FormatCurr('000',FieldByName('MUN').AsInteger);
                 Dpto := FormatCurr('00',FieldByName('DPTO').AsInteger);
               end;}
               try
                if StrLen(PChar(vCodMunicipio)) = 4 then
                  vCodMunicipio := '0' +  vCodMunicipio;
                Dpto := FormatCurr('00',StrToInt(LeftStr(vCodMunicipio,2)));
                Mn := FormatCurr('000',StrToInt(RightStr(vCodMunicipio,3)));
               except
               begin
                Mn := '00';
                Dpto := '000';
               end;
               end;
               CdSaldo.FieldValues['DPTO'] := Mn;
               CdSaldo.FieldValues['MCP'] := Dpto;

               CdSaldo.FieldValues['SALDO'] := vValor;
               CdSaldo.Post;
               end; // FIN DEL VALIDA SALDO
               Next;
             end;// fin del primner while
             frmProgreso.Cerrar;
        end; // fin del ibquery1
                if Save.Execute then
        begin
          CdSaldo.First;
          ExcelFile := TDataSetToExcel.Create(CdSaldo,Save.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;

end;

end.
