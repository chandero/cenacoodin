unit UnitRecuperaCredivida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Grids, DBGrids, DB,
  DBClient, IBCustomDataSet, IBQuery, FR_Class, IBSQL, DateUtils;

type
  TFrmRecuperaCredivida = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DtFecha: TDateTimePicker;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    CdCredivida: TClientDataSet;
    DsCredivida: TDataSource;
    IBQuery1: TIBQuery;
    CdCredividapoliza: TStringField;
    CdCredividaid_persona: TStringField;
    CdCredividaid_identificacion: TSmallintField;
    CdCredividanombres: TStringField;
    CdCredividadb: TStringField;
    frReport1: TfrReport;
    CdCredividaexpedicion: TStringField;
    CdCredividanacimiento: TStringField;
    CdCredividafechan: TDateField;
    CdCredividaempresa: TStringField;
    CdCredividacargo: TStringField;
    CdCredividadireccion: TStringField;
    CdCredividatelefono: TStringField;
    IBSQL1: TIBSQL;
    CdCredividamunicipio: TStringField;
    CDbeneficiarios: TClientDataSet;
    CDbeneficiariosnombre: TStringField;
    CDbeneficiariosporciento: TCurrencyField;
    CDbeneficiariosparentesco: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure frReport1PrintReport;
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormCreate(Sender: TObject);
  private
        vPoliza,vTotal :Currency;
        vAgencia :string;
    { Private declarations }
  public
  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  FrmRecuperaCredivida: TFrmRecuperaCredivida;

implementation

uses UnitImpresion, unitMain, UnitGlobales, UnitDmSolicitud;

{$R *.dfm}

procedure TFrmRecuperaCredivida.BitBtn1Click(Sender: TObject);
var     vI :Integer;
        vP :string;
begin
        CdCredivida.CancelUpdates;
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos"');
          SQL.Add('where ID_MINIMO = 9');
          Open;
          vPoliza := FieldByName('VALOR_MINIMO').AsCurrency;
          vTotal := FieldByName('VALOR_MINIMO').AsCurrency * 12;
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$agencia"');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          vAgencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$credivida".DBIMPRESO,');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          SQL.Add('"col$credivida".CONSECUTIVO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".LUGAR_EXPEDICION,');
          SQL.Add('"gen$persona".FECHA_NACIMIENTO,');
          SQL.Add('"gen$persona".LUGAR_NACIMIENTO,');
          SQL.Add('"gen$persona".EMPRESA_LABORA,');
          SQL.Add('"gen$persona".CARGO_ACTUAL');
          SQL.Add('FROM');
          SQL.Add('"col$credivida"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("col$credivida".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
          SQL.Add('AND ("col$credivida".DG_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('WHERE');
          SQL.Add('("col$credivida".APLICADO = 1) AND ');
          SQL.Add('("col$credivida".DESCONTADO = 1) AND ');
          SQL.Add('("col$credivida".FECHA_APLICADO = :FECHA)');
          ParamByName('FECHA').AsDate := DtFecha.Date;
          Open;
          while not Eof do
          begin
            CdCredivida.Append;
            vI := FieldByName('ID_IDENTIFICACION').AsInteger;
            vP := FieldByName('ID_PERSONA').AsString;
            CdCredivida.FieldValues['nombres'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            CdCredivida.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
            CdCredivida.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
            CdCredivida.FieldValues['poliza'] := FieldByName('CONSECUTIVO').AsString;
            CdCredivida.FieldValues['db'] := FieldByName('DBIMPRESO').AsString;
            CdCredivida.FieldValues['nacimiento'] := FieldByName('LUGAR_NACIMIENTO').AsString;
            CdCredivida.FieldValues['expedicion'] := FieldByName('LUGAR_EXPEDICION').AsString;
            CdCredivida.FieldValues['fechan'] := FieldByName('FECHA_NACIMIENTO').AsDateTime;
            CdCredivida.FieldValues['empresa'] := FieldByName('EMPRESA_LABORA').AsString;
            CdCredivida.FieldValues['cargo'] := FieldByName('CARGO_ACTUAL').AsString;
            with IBSQL1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('select * from "gen$direccion"');
              SQL.Add('where ID_PERSONA = :ID_PERSONA and');
              SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and');
              SQL.Add('ID_DIRECCION = 1');
              ParamByName('ID_PERSONA').AsString := vP;
              ParamByName('ID_IDENTIFICACION').AsInteger := vI;
              ExecQuery;
              CdCredivida.FieldValues['direccion'] := FieldByName('DIRECCION').AsString;
              CdCredivida.FieldValues['telefono'] := FieldByName('TELEFONO1').AsString;
              CdCredivida.FieldValues['municipio'] := FieldByName('MUNICIPIO').AsString;
            end;
             Next;
          end;

        end;
end;

procedure TFrmRecuperaCredivida.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmRecuperaCredivida.DBGrid1DblClick(Sender: TObject);
begin
        BuscaPoliza;
        CDbeneficiarios.CancelUpdates;
        if CDCREDIVIDADB.Value = '' then
        begin
           with IBQuery1 do
           begin
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM');
            SQL.Add(' "gen$beneficiario"');
            SQL.Add('WHERE');
            SQL.Add('("gen$beneficiario".ID_PERSONA = :ID_PERSONA) AND ');
            SQL.Add('("gen$beneficiario".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
            SQL.Add('("gen$beneficiario".AUXILIO = 0)');
            ParamByName('ID_PERSONA').AsString := CdCredividaid_persona.Value;
            ParamByName('ID_IDENTIFICACION').AsInteger := CdCredividaid_identificacion.Value;
            Open;
            while not Eof do
            begin
                CDbeneficiarios.Append;
                CDbeneficiarios.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                CDbeneficiarios.FieldValues['porciento'] := FieldByName('PORCENTAJE').AsCurrency;
                CDbeneficiarios.FieldValues['parentesco'] := FieldByName('ID_PARENTESCO').AsString;
                CDbeneficiarios.Post;
                Next;
            end;
          end;
           imprimir_reporte(frmMain.ruta1 + '\reporte\RepEquivida.frf');
        end
        else
          MessageDlg('El Certificado No. ' + CdCredividapoliza.Value + ' ya fue Impreso...',mtInformation,[mbok],0);
end;

procedure TFrmRecuperaCredivida.frReport1PrintReport;
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('update "col$credivida" set DBIMPRESO = :DB where CONSECUTIVO = :POLIZA');
          ParamByName('POLIZA').AsString := CdCredividapoliza.Value;
          ParamByName('DB').AsString := DBALIAS;
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
        end;
end;

procedure TFrmRecuperaCredivida.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'poliza' then
           ParValue := vPolizaCredivida;
        if ParName = 'descripcion' then
          ParValue := 'CERTIFICADO DE SEGURO';
          if ParName = 'nombre' then
             ParValue := CdCredividanombres.Value;
          if ParName = 'certificado' then
             ParValue := CdCredividapoliza.Value;
          if ParName = 'documento' then
             ParValue := CdCredividaid_persona.Value;
          if ParName = 'lugar_exp' then
             ParValue := CdCredividaexpedicion.Value;
          if ParName = 'nacimiento' then
             ParValue := CdCredividanacimiento.Value;
          if ParName = 'fecha_nacimiento' then
             ParValue := CdCredividafechan.Value;
          if ParName = 'empresa' then
             ParValue := CdCredividaempresa.Value;
          if ParName = 'cargo' then
             ParValue := CdCredividacargo.Value;
          if ParName = 'direccion' then
             ParValue := CdCredividadireccion.Value;
          if ParName = 'ciudad' then
             ParValue := CdCredividamunicipio.Value;
          if ParName = 'telefono' then
             ParValue := CdCredividatelefono.Value;
          if ParName = 'valor_poliza' then
             ParValue := vPoliza;
          if ParName = 'poliza_total' then
            ParValue := vTotal;
          if ParName = 'ciudad_exp' then
             ParValue := vAgencia;
          if ParName = 'mes' then
             ParValue := UpperCase(FormatDateTime('mmmm',DtFecha.DateTime));
          if ParName = 'vdia' then
             ParValue := DayOf(DtFecha.DateTime);
          if ParName = 'vano' then
             ParValue := YearOf(DtFecha.DateTime);


         with CDbeneficiarios do
          begin
            First;
            if RecordCount = 0 then
            begin
               if ParName = 'nom1' then
               ParValue := 'LOS DE LEY';
               if ParName = 'por1' then
                 ParValue := 100;
            end;
           while not Eof do
           begin
            //primero
            if RecNo = 1 then
            begin
               if ParName = 'nom1' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por1' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            //segundo
            if RecNo = 2 then
            begin
               if ParName = 'nom2' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por2' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            //tercero
            if RecNo = 3 then
            begin
               if ParName = 'nom3' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por3' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            //cuarto
            if RecNo = 4 then
            begin
               if ParName = 'nom4' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por4' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            Next;
            end;
          end;

end;

procedure TFrmRecuperaCredivida.FormCreate(Sender: TObject);
begin
        DtFecha.Date := fFechaActual;
end;

end.
