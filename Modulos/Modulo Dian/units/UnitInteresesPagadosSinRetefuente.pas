unit UnitInteresesPagadosSinRetefuente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient,
  IBCustomDataSet, IBQuery, UnitDmGeneral, DataSetToExcel, StrUtils, Math;

type
  TfrmInteresesPagadosSinRetefuente = class(TForm)
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    DBGrid1: TDBGrid;
    DS1: TDataSource;
    CD: TClientDataSet;
    CDCONCEPTO: TStringField;
    CDTP: TStringField;
    CDNM: TStringField;
    CDDV: TStringField;
    CDP_APELLIDO: TStringField;
    CDS_APELLIDO: TStringField;
    CDP_NOMBRE: TStringField;
    CDS_NOMBRE: TStringField;
    CDRAZON: TStringField;
    CDDIRECCION: TStringField;
    CDDPTO: TStringField;
    CDMCP: TStringField;
    CDPAIS: TStringField;
    CDPAGOABONOCUENTADEDUCIBLE: TStringField;
    CDPAGOABONOCUENTANODEDUCIBLE: TStringField;
    CDIVAMAYORVALORDEDUCIBLE: TStringField;
    CDIVAMAYORVALORNODEDUCIBLE: TStringField;
    CDRETENCION: TStringField;
    CDRETENCIONASUMIDA: TStringField;
    CDRETENCIONIVA: TStringField;
    CDRETENCIONIVAASUMIDA: TStringField;
    CDRETENCIONIVANODOMICILIADO: TStringField;
    CDRETENCIONCREE: TStringField;
    CDRETENCIONASUMIDACREE: TStringField;
    IBQuery2: TIBQuery;
    IBQuery1: TIBQuery;
    save: TSaveDialog;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInteresesPagadosSinRetefuente: TfrmInteresesPagadosSinRetefuente;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmInteresesPagadosSinRetefuente.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInteresesPagadosSinRetefuente.btnProcesarClick(Sender: TObject);
var
        Tp,Id,Dg,Mn :string;
        vCodMunicipio :string;
        Dpto,Mnc :string;
        _sNombre :string;
        _dFecha1 :TDate;
        _dFecha2 :TDate;
        ExcelFile:TDataSetToExcel;
begin
        if IBQuery2.Transaction.InTransaction then
        begin
            IBQuery2.Transaction.Commit;
        end;

        IBQuery2.Transaction.StartTransaction;

        _dFecha1 := EncodeDate(_iAno, 01, 01);
        _dFecha2 := EncodeDate(_iAno, 12, 31);


        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT f.ID_IDENTIFICACION, f.ID_PERSONA, SUM(f.INTERES) AS INTERES, SUM(f.RETENCION) AS RETENCION FROM');
          SQL.Add('	(');
          SQL.Add('	SELECT o.ID_IDENTIFICACION, o.ID_PERSONA, SUM(o.DEBITO) AS INTERES,  SUM(o.CREDITO) AS RETENCION FROM');
          SQL.Add('		(SELECT  gp1.ID_IDENTIFICACION, gp1.ID_PERSONA, ce1.FECHA_MOVIMIENTO, ce1.DOCUMENTO_MOVIMIENTO, SUM(ce1.VALOR_DEBITO) AS DEBITO, SUM(ce1.VALOR_CREDITO) AS CREDITO FROM "cap$extracto" ce1');
          SQL.Add('			INNER JOIN "cap$maestrotitular" cmt1 ON');
          SQL.Add('                   	cmt1.ID_AGENCIA = ce1.ID_AGENCIA AND');
          SQL.Add('					cmt1.ID_TIPO_CAPTACION = ce1.ID_TIPO_CAPTACION AND');
          SQL.Add('					cmt1.NUMERO_CUENTA = ce1.NUMERO_CUENTA AND');
          SQL.Add('					cmt1.DIGITO_CUENTA  = ce1.DIGITO_CUENTA  AND');
          SQL.Add('					cmt1.NUMERO_TITULAR  = 1');
          SQL.Add('			INNER JOIN "gen$persona" gp1 ON');
          SQL.Add('                                     gp1.ID_IDENTIFICACION = cmt1.ID_IDENTIFICACION AND');
          SQL.Add('                                     gp1.ID_PERSONA = cmt1.ID_PERSONA');
          SQL.Add('			WHERE ce1.ID_TIPO_CAPTACION IN (2,3,4) AND ce1.ID_TIPO_MOVIMIENTO IN (7,8,15,16) AND ce1.FECHA_MOVIMIENTO BETWEEN :FECHA_INICIAL AND :FECHA_FINAL');
          SQL.Add('			GROUP BY 1,2,3,4) AS o');
          SQL.Add('		WHERE o.CREDITO = 0');
          SQL.Add('		GROUP BY 1,2');
          SQL.Add('	UNION ALL');
          SQL.Add('		SELECT gp1.ID_IDENTIFICACION, gp1.ID_PERSONA, SUM(ccd1.CAUSACION_MENSUAL) AS INTERES, 0 AS RETENCION FROM "cap$causacioncdat" ccd1');
          SQL.Add('			INNER JOIN "cap$maestrotitular" cmt1 ON');
          SQL.Add('                   	cmt1.ID_AGENCIA = ccd1.ID_AGENCIA AND');
          SQL.Add('					cmt1.ID_TIPO_CAPTACION = ccd1.ID_TIPO_CAPTACION AND');
          SQL.Add('					cmt1.NUMERO_CUENTA = ccd1.NUMERO_CUENTA AND');
          SQL.Add('					cmt1.DIGITO_CUENTA  = ccd1.DIGITO_CUENTA  AND ');
          SQL.Add('					cmt1.NUMERO_TITULAR  = 1 ');
          SQL.Add('			INNER JOIN "gen$persona" gp1 ON');
          SQL.Add('                                     gp1.ID_IDENTIFICACION = cmt1.ID_IDENTIFICACION AND');
          SQL.Add('                                     gp1.ID_PERSONA = cmt1.ID_PERSONA');
          SQL.Add('			WHERE ccd1.ANO = :ANHO AND ccd1.MES = :MES AND ccd1.RETEFUENTE_MENSUAL = 0');
          SQL.Add('			GROUP BY 1,2');
          SQL.Add('	) AS f');
          SQL.Add('GROUP BY 1,2');
          ParamByName('FECHA_INICIAL').AsDate := _dFecha1;
          ParamByName('FECHA_FINAL').AsDate := _dFecha2;
          ParamByName('ANHO').AsInteger := _iAno;
          ParamByName('MES').AsInteger := 12;          
          Open;
          Last;
          First;
          while not Eof do
          begin
            CD.Append;
            CDCONCEPTO.Value := '';
            if FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
            begin
               Id := LeftStr(FieldByName('ID_PERSONA').AsString,Length(FieldByName('ID_PERSONA').AsString)-1);
               Dg := RightStr(FieldByName('ID_PERSONA').AsString,1);
            end
            else
            begin
               Id := FieldByName('ID_PERSONA').AsString;
               Dg := '';
            end; // FIN DEL VALIDA IDENTIFICACION
            Application.ProcessMessages;
            case FieldByName('ID_IDENTIFICACION').AsInteger of
             1: Tp := '11';
             2: Tp := '12';
             3: Tp := '13';
             4: Tp := '31';
             6: Tp := '22';
             9: Tp := '11';
             end;
             IBQuery1.Close;
             IBQuery1.SQL.Clear;
             IBQuery1.SQL.Add('SELECT distinct');
             IBQuery1.SQL.Add('"gen$persona".NOMBRE,');
             IBQuery1.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
             IBQuery1.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
             IBQuery1.SQL.Add('"gen$persona".ID_PERSONA,');
             IBQuery1.SQL.Add('"gen$persona".ID_IDENTIFICACION,');
             IBQuery1.SQL.Add('"gen$direccion".DIRECCION || '' '' || "gen$direccion".BARRIO AS DIRECCION,');
             IBQuery1.SQL.Add('"gen$direccion".MUNICIPIO AS MUNICIPIO,"gen$direccion".COD_MUNICIPIO');
             IBQuery1.SQL.Add('FROM');
             IBQuery1.SQL.Add('"gen$persona"');
             IBQuery1.SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and');
             IBQuery1.SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA and "gen$direccion".ID_DIRECCION = 1)');
             IBQuery1.SQL.Add('WHERE');
             IBQuery1.SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA) AND');
             IBQuery1.SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION)');
             IBQuery1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
             IBQuery1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
             IBQuery1.Open;
             vCodMunicipio := IBQuery1.FieldByName('COD_MUNICIPIO').AsString;
             if (vCodMunicipio = '') Then vCodMunicipio := '00000';
             Mn := IBQuery1.FieldByName('MUNICIPIO').AsString;
             CD.FieldValues['TP'] := Tp;
             CD.FieldValues['NM'] := Id;
             CD.FieldValues['DV'] := Dg;
             if Tp <> '31' then
             begin
               CD.FieldValues['P_APELLIDO'] := IBQuery1.FieldByName('PRIMER_APELLIDO').AsString;
               CD.FieldValues['S_APELLIDO'] := IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString;
               _sNombre := Trim(IBQuery1.FieldByName('NOMBRE').AsString);
               CD.FieldValues['P_NOMBRE'] := _sNombre;
               if Pos(' ', _sNombre) > 0 then
               begin
                 CD.FieldValues['P_NOMBRE'] := LeftStr(_sNombre,Pos(' ', _sNombre)-1);
                 CD.FieldValues['S_NOMBRE'] := RightStr(_sNombre,Length(_sNombre) - Pos(' ', _sNombre));
               end;
               CD.FieldValues['RAZON'] := '';
             end
             else
             begin
               CD.FieldValues['P_APELLIDO'] := '';
               CD.FieldValues['S_APELLIDO'] := '';
               CD.FieldValues['P_NOMBRE'] := '';
               CD.FieldValues['S_NOMBRE'] :='';
               CD.FieldValues['RAZON'] := Trim(IBQuery1.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + IBQuery1.FieldByName('NOMBRE').AsString)
             end;
             try
               if StrLen(PChar(vCodMunicipio)) = 4 then
                  vCodMunicipio := '0' +  vCodMunicipio;
               if (vCodMunicipio = '') then vCodMunicipio := '00000';
               Dpto := FormatCurr('00',StrToInt(LeftStr(vCodMunicipio,2)));
               Mnc := FormatCurr('000',StrToInt(RightStr(vCodMunicipio,3)));
             except
             begin
               Mnc := '00';
               Dpto := '000';
             end;
             end;
             CD.FieldValues['DIRECCION'] := IBQuery1.FieldByName('DIRECCION').AsString;
             CD.FieldValues['DPTO'] := Dpto;
             CD.FieldValues['MCP'] := Mnc;
             CD.FieldValues['PAIS'] := 169;
             //CD.FieldValues['MUNICIPIO'] := Mn;
             //CD.FieldValues['TASA'] := FieldByName('TASA').AsCurrency;
             //CD.FieldValues['MONTO'] := SimpleRoundTo(FieldByName('MONTO').AsCurrency,0);
             CD.FieldValues['PAGOABONOCUENTADEDUCIBLE'] := SimpleRoundTo(FieldByName('INTERES').AsCurrency,0);
             CD.FieldValues['PAGOABONOCUENTANODEDUCIBLE'] := 0;
             CD.FieldValues['IVAMAYORVALORDEDUCIBLE'] := 0;
             CD.FieldValues['IVAMAYORVALORNODEDUCIBLE'] := 0;
             CD.FieldValues['RETENCION'] := SimpleRoundTo(FieldByName('RETENCION').AsCurrency,0);
             CD.FieldValues['RETENCIONASUMIDA'] := 0;
             CD.FieldValues['RETENCIONIVA'] := 0;
             CD.FieldValues['RETENCIONIVAASUMIDA'] := 0;
             CD.FieldValues['RETENCIONIVANODOMICILIADO'] := 0;
             CD.FieldValues['RETENCIONCREE'] := 0;
             CD.FieldValues['RETENCIONASUMIDACREE'] := 0;
             CD.Post;
             Next;
          end;
          CD.First;
        end;
        save.FileName := 'InteresPagadoSinRetefuente';
        if Save.Execute then
        begin
          CD.First;
          ExcelFile := TDataSetToExcel.Create(CD,Save.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
        ShowMessage('Archivo guardado en: ' + save.FileName);
end;

end.
