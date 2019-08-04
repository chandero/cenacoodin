unit UnitIntPagadoF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, IBCustomDataSet, IBQuery, StrUtils,DataSetToExcel,
  JvEdit, JvTypedEdit;

type
  TFrmConInteresPago = class(TForm)
    Button1: TButton;
    Int: TClientDataSet;
    IntCONCEPTO: TStringField;
    IntT_DOC: TStringField;
    IntNUMERO: TStringField;
    IntDV: TStringField;
    IntP_APELLIDO: TStringField;
    IntS_APELLIDO: TStringField;
    IntNOMBRE: TStringField;
    IntS_NOMBRE: TStringField;
    IntRZ: TStringField;
    IntDIRECCION: TStringField;
    IntDPTO: TStringField;
    IntMNCP: TStringField;
    IntPAGO: TStringField;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    save: TSaveDialog;
    IBQuery3: TIBQuery;
    Label1: TLabel;
    txtMonto: TJvCurrencyEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConInteresPago: TFrmConInteresPago;

implementation

uses unitMain;

{$R *.dfm}

procedure TFrmConInteresPago.Button1Click(Sender: TObject);
var     Id,Tp,Dg :string;
        ExcelFile:TDataSetToExcel;
        _sNombre :string;
        Mn:string;
        Dpto :string;
        vCodMunicipio :string;
        _cValorAnterior :Currency;
        _cValorActual :Currency;
begin

                Int.CancelUpdates;
              if IBQuery1.Transaction.InTransaction then
                 IBQuery1.Transaction.Commit;
              IBQuery1.Transaction.StartTransaction;
              IBQuery1.Open;
              while not IBQuery1.Eof do
              begin
                _cValorActual := 0;
                _cValorActual := IBQuery1.FieldByName('VALOR').AsCurrency;
                if (_cValorActual) >= txtMonto.Value then
                begin
                  Int.Append;
                  Int.FieldValues['CONCEPTO'] := '5006';
                  case IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger of
                     1: tp := '11';
                     2: Tp := '12';
                     3: Tp := '13';
                     4: Tp := '31';
                     6: Tp := '22';
                     9: Tp := '11';
                  end;
                  with IBQuery2 do
                  begin
                    SQL.Clear;
                    SQL.Add('select');
                    SQL.Add('"gen$persona".ID_IDENTIFICACION,');
                    SQL.Add('"gen$persona".ID_PERSONA,');
                    SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE,');
                    SQL.Add('"gen$direccion".DIRECCION || '' '' || "gen$direccion".BARRIO AS DIRECCION,');
                    SQL.Add('"gen$direccion".MUNICIPIO,"gen$direccion".COD_MUNICIPIO');
                    SQL.Add('from');
                    SQL.Add('"gen$persona"');
                    SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and');
                    SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA');
                    SQL.Add('and "gen$direccion".ID_DIRECCION = 1)');
                    SQL.Add('where "gen$persona".ID_PERSONA = :ID_PERSONA and "gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION');
                    ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByname('ID_PERSONA').AsString;
                    ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByname('ID_IDENTIFICACION').AsInteger;
                    Open;
                    vCodMunicipio := FieldByName('COD_MUNICIPIO').AsString;
                    if Tp = '31' then
                    begin
                      Id := LeftStr(FieldByName('ID_PERSONA').AsString,Length(FieldByName('ID_PERSONA').AsString)-1);
                      Dg := RightStr(FieldByName('ID_PERSONA').AsString,1);
                    end
                    else
                    begin
                      Id := FieldByName('ID_PERSONA').AsString;
                      Dg := '';
                    end;
                    if Tp <> '31' then
                    begin
                      Int.FieldValues['P_APELLIDO'] := FieldByName('PRIMER_APELLIDO').AsString;
                      Int.FieldValues['S_APELLIDO'] := FieldByName('SEGUNDO_APELLIDO').AsString;
                      Int.FieldValues['NOMBRE'] := LeftStr(FieldByName('NOMBRE').AsString,Pos(' ', FieldByName('NOMBRE').AsString)-1);
                      Int.FieldValues['S_NOMBRE'] := RightStr(FieldByName('NOMBRE').AsString,Length(FieldByName('NOMBRE').AsString) - Pos(' ', FieldByName('NOMBRE').AsString));
                    end
                    else
                      Int.FieldValues['RZ'] := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString);
                    Int.FieldValues['T_DOC'] := Tp;
                    Int.FieldValues['NUMERO'] := Id;
                    Int.FieldValues['DV'] := Dg;
                    Int.FieldValues['DIRECCION'] := FieldByName('DIRECCION').AsString;
                 try
                 if StrLen(PChar(vCodMunicipio)) = 4 then
                    vCodMunicipio := '0' +  vCodMunicipio;
                 Dpto := FormatCurr('00',StrToInt(LeftStr(vCodMunicipio,2)));
                 Mn := FormatCurr('000',StrToInt(RightStr(vCodMunicipio,3)));
                 except
                 begin
                   Mn := '0';
                   Dpto := '0';
                 end;
                 end;
                   Int.FieldValues['DPTO'] := Dpto;
                   Int.FieldValues['MNCP'] := Mn;
                   Int.FieldValues['PAGO'] := IBQuery1.FieldByName('VALOR').AsCurrency;
                   Int.Post;
                   end;  // fin del wioth ibquery2
                 end;
                IBQuery1.Next;
              end; // fin del while
        save.FileName := LowerCase(frmMain.DescAgencia);
        if Save.Execute then
        begin
          int.First;
          ExcelFile := TDataSetToExcel.Create(Int,Save.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;

        
end;

end.
