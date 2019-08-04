unit UnitCodigos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, DBClient,StrUtils,DataSetToExcel,Math,
  JvSpecialProgress;

type
  TFrmCodigo = class(TForm)
    BitBtn1: TBitBtn;
    IBQuery1: TIBQuery;
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
    CDMONTO: TStringField;
    CDRETENCION: TStringField;
    IBQuery2: TIBQuery;
    CDCODIGO: TStringField;
    save: TSaveDialog;
    CDMUNICIPIO: TStringField;
    Bar3: TJvSpecialProgress;
    IBQuery3: TIBQuery;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCodigo: TFrmCodigo;

implementation

uses unitMain, UnitGlobales;

{$R *.dfm}

procedure TFrmCodigo.BitBtn1Click(Sender: TObject);
var     Tp,Id,Dg,Mn :string;
        ExcelFile:TDataSetToExcel;
        vCodMunicipio :string;
        Dpto,Mnc :string;
        _sNombre :string;
        _cRetencion,_cMonto :Currency;
begin
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT id_identificacion,id_persona,codigo,sum(monto) as MONTO,sum(retencion-DEVOLUCION) AS retencion FROM "dian$retefuente" WHERE ID_PERSONA <> :ID');
          ParamByName('ID').AsString := Nit;
          SQL.Add('group by id_identificacion,id_persona,codigo');
          Open;
          Last;
          Bar3.Maximum := RecordCount;
          First;
          while not Eof do
          begin
            Bar3.Position := RecNo;
            Application.ProcessMessages;
            CD.Append;
            CD.FieldValues['CODIGO'] := FieldByName('CODIGO').AsString;
            CD.FieldValues['CONCEPTO'] := '';
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
            case FieldByName('ID_IDENTIFICACION').AsInteger of
             1: Tp := '11';
             2: Tp := '12';
             3: Tp := '13';
             4: Tp := '31';
             6: Tp := '22';
             9: Tp := '11';
             end;
             IBQuery2.Close;
             IBQuery2.SQL.Clear;
             IBQuery2.SQL.Add('SELECT distinct');
             IBQuery2.SQL.Add('"gen$persona".NOMBRE,');
             IBQuery2.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
             IBQuery2.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
             IBQuery2.SQL.Add('"gen$persona".ID_PERSONA,');
             IBQuery2.SQL.Add('"gen$persona".ID_IDENTIFICACION,');
             IBQuery2.SQL.Add('"gen$direccion".DIRECCION || '' '' || "gen$direccion".BARRIO AS DIRECCION,');
             IBQuery2.SQL.Add('"gen$direccion".MUNICIPIO AS MUNICIPIO,"gen$direccion".COD_MUNICIPIO');
             IBQuery2.SQL.Add('FROM');
             IBQuery2.SQL.Add('"gen$persona"');
             IBQuery2.SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and');
             IBQuery2.SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA and "gen$direccion".ID_DIRECCION = 1)');
             IBQuery2.SQL.Add('WHERE');
             IBQuery2.SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA) AND');
             IBQuery2.SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION)');
             IBQuery2.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
             IBQuery2.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
             IBQuery2.Open;


             vCodMunicipio := IBQuery2.FieldByName('COD_MUNICIPIO').AsString;
             Mn := IBQuery2.FieldByName('MUNICIPIO').AsString;
             CD.FieldValues['TP'] := Tp;
             CD.FieldValues['NM'] := Id;
             CD.FieldValues['DV'] := Dg;
             if Tp <> '31' then
             begin
               CD.FieldValues['P_APELLIDO'] := IBQuery2.FieldByName('PRIMER_APELLIDO').AsString;
               CD.FieldValues['S_APELLIDO'] := IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString;
               _sNombre := Trim(IBQuery2.FieldByName('NOMBRE').AsString);
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
               CD.FieldValues['RAZON'] := Trim(IBQuery2.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + IBQuery2.FieldByName('NOMBRE').AsString)
             end;



             {IBQuery2.Close;
             IBQuery2.SQL.Clear;
             IBQuery2.SQL.Add('select DPTO,MUN from "dian$con_personas" where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
             IBQuery2.ParamByName('ID_PERSONA').AsString := Id;
             IBQuery2.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
             IBQuery2.Open;}
             try
               if StrLen(PChar(vCodMunicipio)) = 4 then
                  vCodMunicipio := '0' +  vCodMunicipio;
               Dpto := FormatCurr('00',StrToInt(LeftStr(vCodMunicipio,2)));
               Mnc := FormatCurr('000',StrToInt(RightStr(vCodMunicipio,3)));
             except
             begin
               Mnc := '00';
               Dpto := '000';
             end;
             end;
            { ibquery3.Close;
             Ibquery3.parambyname('IDPER').AsString := Id;
             Ibquery3.parambyname('ID').AsString := Tp;
             IBQUERY3.Open;
             CD.FieldValues['DIRECCION'] := IBQuery3.FieldByName('DIRECCION').AsString;
             CD.FieldValues['DPTO'] := IBQuery3.FieldByName('DPTO').AsString;
             CD.FieldValues['MCP'] := IBQuery3.FieldByName('MCP').AsString;}
             CD.FieldValues['DIRECCION'] := IBQuery2.FieldByName('DIRECCION').AsString;

             CD.FieldValues['DPTO'] := Dpto;
             CD.FieldValues['MCP'] := Mnc;

             CD.FieldValues['MUNICIPIO'] := Mn;
             CD.FieldValues['MONTO'] := SimpleRoundTo((FieldByName('retencion').AsCurrency/0.07),0);
             CD.FieldValues['RETENCION'] := SimpleRoundTo(FieldByName('retencion').AsCurrency,0);
             CD.Post;
             Next;
          end;
        save.FileName := LowerCase(frmMain.DescAgencia);
        if Save.Execute then
        begin
          CD.First;
          ExcelFile := TDataSetToExcel.Create(CD,Save.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;

      end;
end;

end.
