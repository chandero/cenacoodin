unit UnitRetencion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBClient, Grids, DBGrids, DateUtils, 
  IBCustomDataSet, IBQuery, DBCtrls, StrUtils,Math,DataSetToExcel, ComCtrls,
  JvEdit, JvFloatEdit, JvTypedEdit;

type
  TFrmRetenciones = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    CBMesIni: TComboBox;
    CBMesFin: TComboBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    CD: TClientDataSet;
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
    CDRETENCION: TStringField;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    IBQuery2: TIBQuery;
    GroupBox4: TGroupBox;
    Button2: TButton;
    IBQuery1: TIBQuery;
    save: TSaveDialog;
    GroupBox5: TGroupBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    cbCodigo: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    EdTasa: TJvFloatEdit;
    Label4: TLabel;
    EdPeriodo: TJvYearEdit;
    CDCONCEPTO: TStringField;
    CDPAIS: TStringField;
    CDPAGOABONOCUENTADEDUCIBLE: TStringField;
    CDPAGOABONOCUENTANODEDUCIBLE: TStringField;
    CDIVAMAYORVALORDEDUCIBLE: TStringField;
    CDIVAMAYORVALORNODEDUCIBLE: TStringField;
    CDRETENCIONASUMIDA: TStringField;
    CDRETENCIONIVA: TStringField;
    CDRETENCIONIVAASUMIDA: TStringField;
    CDRETENCIONIVANODOMICILIADO: TStringField;
    CDRETENCIONCREE: TStringField;
    CDRETENCIONASUMIDACREE: TStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   _dFecha1 :TDate;
   _dFecha2 :TDate;
   ExcelFile:TDataSetToExcel;
    { Private declarations }
  public
  published
    procedure Extracto;
    procedure CausacionCdat;
    procedure CausacionCon;
    procedure Auxiliar;
    procedure Consolidar;
    procedure CausacionAnt;
    procedure CausacionConAnt;
    { Public declarations }
  end;

var
  FrmRetenciones: TFrmRetenciones;
  Tasa: String;
  TasaValor: String;
  
implementation

uses UnitProgreso,UnitGlobales;

{$R *.dfm}

procedure TFrmRetenciones.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmRetenciones.BitBtn1Click(Sender: TObject);
begin

        Tasa := FloatToStr(EdTasa.Value);
        TasaValor :=  FloatToStr(EdTasa.Value / 100);
        cbCodigo.Items.Clear;
        cbCodigo.Items.Add('TODOS');
        CD.Open;
        CD.EmptyDataSet;
        CD.CancelUpdates;
        _dFecha1 := EncodeDate(EdPeriodo.Value,StrToInt(CBMesIni.Text),1);
        if CBMesFin.Text = '12' then
           _dFecha2 := EncodeDate(_iAno,12,31)
        else
           _dFecha2 := EncodeDate(EdPeriodo.Value,StrToInt(CBMesFin.Text) + 1,1) - 1;
        DateTimePicker1.DateTime := _dFecha2;
        Application.ProcessMessages;
        //ShowMessage(DateToStr(_dFecha1) + ' ' + DateToStr(_dFecha2));
        with IBQuery2 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('CON$PUC.CODIGO');
          SQL.Add('FROM');
          SQL.Add('CON$PUC');
          SQL.Add('WHERE');
          SQL.Add('CON$PUC.INFORME = ''01''');
          Open;
          while not Eof do
          begin
            cbCodigo.Items.Add(FieldByName('CODIGO').AsString);
            Next;
          end;
          cbCodigo.ItemIndex := 0;
          Close;
          SQL.Clear;
          SQL.Add('select distinct MES from "dian$movretefuente"');
          Open;
          if RecordCount > 0 then
            if MessageDlg('Existen Datos del mes "' + FieldByName('MES').AsString + '" en la Tabla, Desea eliminarlos',mtInformation,[mbYes,Mbno],0) = mrNo then
            begin
              Consolidar;
              Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('delete from "dian$movretefuente"');
            ExecSQL;
            Transaction.Commit;
            Transaction.StartTransaction;
            Self.Caption := 'Procesando Datos de Extracto, por favor espere';
            Application.ProcessMessages;

            frmProgresoServer := TfrmProgresoServer.Create(self);
            frmProgresoServer.Ejecutar;
            frmProgresoServer.Info.Caption := 'Extractos...';
            Application.ProcessMessages;
            Extracto;
            frmProgresoServer.Info.Caption := 'Descuento Causación Contractual...';
            Application.ProcessMessages;
            //CausacionConAnt;
            frmProgresoServer.Info.Caption := 'Descuento Causación Contractual...';
            Application.ProcessMessages;
            CausacionAnt;
            frmProgresoServer.Info.Caption := 'Auxiliar...';
            Application.ProcessMessages;
            Auxiliar;
            frmProgresoServer.Info.Caption := 'Causación CDAT...';
            Application.ProcessMessages;
            CausacionCdat;
            frmProgresoServer.Info.Caption := 'Causación Cont...';
            Application.ProcessMessages;
            CausacionCon;
            frmProgresoServer.Info.Caption := 'Consolidando...';
            Application.ProcessMessages;
            Close;
            SQL.Clear;
            SQL.Add('update "dian$movretefuente" set MES = :MES');
            ParamByName('MES').AsInteger := StrToInt(CBMesFin.Text);
            ExecSQL;
            Transaction.Commit;
            Transaction.StartTransaction;
            Consolidar;
            frmProgresoServer.Close;
            FreeAndNil(frmProgresoServer);
            ShowMessage('Proceso Termino');
        end;
end;

procedure TFrmRetenciones.Extracto;
begin
        //ShowMessage('1');
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert INTO "dian$movretefuente"');
          SQL.Add('SELECT');
          SQL.Add(QuotedStr('RETENCION') + ' AS EXTRACTO,');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          SQL.Add('5028, ');
          SQL.Add( Tasa + ' AS TASA,');
          SQL.Add('0 as MONTO,');
          SQL.Add('0 AS DEVOLUCION,');
          SQL.Add('SUM("cap$extracto".VALOR_CREDITO) AS RETENCION,');
          SQL.Add('0');
          SQL.Add('FROM');
          SQL.Add('"cap$extracto"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("cap$extracto".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
          SQL.Add('AND ("cap$extracto".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION)');
          SQL.Add('AND ("cap$extracto".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$extracto".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$extracto".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$extracto".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
          SQL.Add('AND ("cap$extracto".ID_AGENCIA = "cap$maestro".ID_AGENCIA)');
          SQL.Add('AND ("cap$extracto".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION)');
          SQL.Add('WHERE');
          SQL.Add('"cap$extracto".ID_TIPO_CAPTACION IN (2,4) AND');
          SQL.Add('"cap$extracto".ID_TIPO_MOVIMIENTO IN (8,16) AND');
          SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 AND :FECHA2 AND');
          SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1 AND');
          SQL.Add('"cap$maestro".ID_ESTADO <> 15');
          SQL.Add('GROUP BY');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA');
          try
            ParamByName('FECHA1').AsDateTime := _dFecha1;
            ParamByName('FECHA2').AsDateTime := _dFecha2;
            ExecSQL;
          except
          on E: Exception do
          begin
            ShowMessage(E.Message);
          end;
          end;

          Close;
          SQL.Clear;
          SQL.Add('insert INTO "dian$movretefuente"');
          SQL.Add('SELECT');
          SQL.Add(QuotedStr('INTERES') + ' AS EXTRACTO,');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          SQL.Add('5006, ');
          SQL.Add( Tasa + ' AS TASA,');
          SQL.Add('0,');
          SQL.Add('0 AS DEVOLUCION,');
          SQL.Add('SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CREDITO) AS RETENCION,');
          SQL.Add('0');
          SQL.Add('FROM');
          SQL.Add('"cap$extracto"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("cap$extracto".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
          SQL.Add('AND ("cap$extracto".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION)');
          SQL.Add('AND ("cap$extracto".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$extracto".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$extracto".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$extracto".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
          SQL.Add('AND ("cap$extracto".ID_AGENCIA = "cap$maestro".ID_AGENCIA)');
          SQL.Add('AND ("cap$extracto".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION)');
          SQL.Add('WHERE');
          SQL.Add('"cap$extracto".ID_TIPO_CAPTACION IN (2,4) AND');
          SQL.Add('"cap$extracto".ID_TIPO_MOVIMIENTO IN (7,15) AND');
          SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 AND :FECHA2 AND');
          SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1 AND');
          SQL.Add('"cap$maestro".ID_ESTADO <> 15');
          SQL.Add('GROUP BY');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA');
          try
            ParamByName('FECHA1').AsDateTime := _dFecha1;
            ParamByName('FECHA2').AsDateTime := _dFecha2;
            ExecSQL;
          except
          on E: Exception do
          begin
            ShowMessage(E.Message);
          end;
          end;


          Transaction.Commit;
          Transaction.StartTransaction;
        end;
end;

procedure TFrmRetenciones.CausacionCdat;
begin
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO "dian$movretefuente"');
       {   SQL.Add('select');
          SQL.Add(QuotedStr('CAUSACION CDAT') + ',');
          SQL.Add('"cap$causacioncdat".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncdat".ID_PERSONA,');
          SQL.Add('244535000000000000 AS CODIGO,');
          SQL.Add('7 AS TASA,');
          SQL.Add('"cap$causacioncdat".CAUSACION_TOTAL AS MONTO,');
          SQL.Add('0 as DEVOLUCION,');
          SQL.Add('"cap$causacioncdat".RETEFUENTE_TOTAL AS RETENCION,');
          SQL.Add('0');
          SQL.Add('from');
          SQL.Add('"cap$causacioncdat"');
          SQL.Add('where');
          SQL.Add('"cap$causacioncdat".ANO = :ANO AND');
          SQL.Add('"cap$causacioncdat".MES = :MES AND');
          SQL.Add('"cap$causacioncdat".RETEFUENTE_TOTAL > 0');}

          SQL.Add('SELECT');
          SQL.Add(QuotedStr('CAUSACION CDAT') + ',');
          SQL.Add('"cap$causacioncdat".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncdat".ID_PERSONA,');
          SQL.Add('5028 AS CODIGO,');
          SQL.Add( Tasa + ' AS TASA,');
          SQL.Add('"cap$causacioncdat".CAUSACION_TOTAL AS MONTO,');
          SQL.Add('0 AS DEVOLUCION,');
          SQL.Add('"cap$causacioncdat".RETEFUENTE_TOTAL AS RETENCION,');
          SQL.Add('0 AS RETENCION');
          SQL.Add('FROM');
          SQL.Add('"cap$causacioncdat"');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$causacioncdat".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION)');
          SQL.Add('AND ("cap$causacioncdat".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$causacioncdat".ID_AGENCIA = "cap$maestro".ID_AGENCIA)');
          SQL.Add('WHERE');
          SQL.Add('"cap$causacioncdat".ANO = :ANO AND');
          SQL.Add('"cap$causacioncdat".MES = :MES AND');
          SQL.Add('"cap$causacioncdat".RETEFUENTE_TOTAL > 0');
          SQL.Add('AND   "cap$maestro".ID_ESTADO <> 15');
          ParamByName('ANO').AsInteger := EdPeriodo.Value;
          ParamByName('MES').AsInteger := StrToInt(CBMesFin.Text);
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
        end;

end;

procedure TFrmRetenciones.CausacionCon;
begin
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO "dian$movretefuente"');
          SQL.Add('select');
          SQL.Add(QuotedStr('CAUSACION CONT') + ',');
          SQL.Add('"cap$causacioncon".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncon".ID_PERSONA,');
          SQL.Add('5028 AS CODIGO,');
          SQL.Add( Tasa + ' AS TASA,');
          SQL.Add('sum("cap$causacioncon".CAUSACION_MENSUAL) AS MONTO,');
          SQL.Add('0 as DEVOLUCION,');
          SQL.Add('sum("cap$causacioncon".RETEFUENTE_MENSUAL) AS RETENCION,');
          SQL.Add('0');
          SQL.Add('from');
          SQL.Add('"cap$causacioncon"');
          SQL.Add('where');
          SQL.Add('"cap$causacioncon".ANO = :ANO');
          SQL.Add('GROUP BY "cap$causacioncon".ID_IDENTIFICACION,"cap$causacioncon".ID_PERSONA');
          SQL.Add('HAVING SUM("cap$causacioncon".RETEFUENTE_MENSUAL) > 0');
          ParamByName('ANO').AsInteger := EdPeriodo.Value;
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
        end;



end;

procedure TFrmRetenciones.Auxiliar;
begin
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$movretefuente"');
          SQL.Add('select');
          SQL.Add('CON$AUXILIAR.ID_COMPROBANTE,');
          SQL.Add('CON$AUXILIAR.ID_IDENTIFICACION,');
          SQL.Add('CON$AUXILIAR.ID_PERSONA,');
          SQL.Add('5028,');
          SQL.Add('CON$AUXILIAR.TASA_RETENCION,');
          SQL.Add('CASE WHEN CON$AUXILIAR.DEBITO > 0 THEN (CON$AUXILIAR.MONTO_RETENCION * -1) ELSE CON$AUXILIAR.MONTO_RETENCION END AS MONTO,');
          SQL.Add('(CON$AUXILIAR.DEBITO * -1) as DEBITO,');
          SQL.Add('CON$AUXILIAR.CREDITO,');
          SQL.Add('0 as MES');
          SQL.Add('from CON$AUXILIAR');
          SQL.Add('inner join CON$PUC on (CON$AUXILIAR.CODIGO = CON$PUC.CODIGO)');
          SQL.Add('where CON$PUC.INFORME = ' + QuotedStr('01') + ' and CON$AUXILIAR.ESTADOAUX = :ESTADO');
          SQL.Add('and CON$AUXILIAR.ID_PERSONA IS NOT NULL');
          SQL.Add('AND CON$AUXILIAR.ID_PERSONA <> :NIT and CON$AUXILIAR.ID_IDENTIFICACION <> 0');
          SQL.Add('AND CON$AUXILIAR.FECHA <= :FECHA');
          ParamByName('FECHA').AsDate := _dFecha2;
          ParamByName('ESTADO').AsString := 'C';
          ParamByName('NIT').AsString := _Nit;
          //ParamByName('ESPACIO').AsInteger = 0;
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
        end;
end;

procedure TFrmRetenciones.Consolidar;
var
        Tp,Id,Dg,Mn :string;
        vCodMunicipio :string;
        Dpto,Mnc :string;
        _sNombre :string;
begin
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('ID_IDENTIFICACION,');
          SQL.Add('ID_PERSONA,');
          SQL.Add('CODIGO,');
          SQL.Add('TASA,');
          SQL.Add('SUM(MONTO) AS MONTO,');
          SQL.Add('sum(CREDITO + DEBITO) AS RETENCION');
          SQL.Add('FROM "dian$movretefuente"');
          //SQL.Add('WHERE ID_PERSONA <> :ID');
          //SQL.Add('ORDER BY ID_IDENTIFICACION, ID_PERSONA, CODIGO, TASA');
          SQL.Add('GROUP BY');
          SQL.Add('ID_IDENTIFICACION,');
          SQL.Add('ID_PERSONA,');
          SQL.Add('CODIGO,');
          SQL.Add('TASA');
          SQL.Add('HAVING SUM(MONTO) <> 0 OR sum(CREDITO + DEBITO) <> 0');
          Open;
          Last;
          First;
          while not Eof do
          begin
            CD.Append;
            CDCONCEPTO.Value := FieldByName('CODIGO').AsString;
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
            frmProgresoServer.Info.Caption := FieldByName('ID_PERSONA').AsString;
            Application.ProcessMessages;
           {
            if (FieldByName('ID_PERSONA').AsString = '37328843') then
            begin
                Sleep(1000);
            end;
            }
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
             CD.FieldValues['PAGOABONOCUENTADEDUCIBLE'] := SimpleRoundTo(FieldByName('MONTO').AsCurrency,0);
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
end;

procedure TFrmRetenciones.BitBtn2Click(Sender: TObject);
begin
        save.FileName := 'Retenciones';
        if Save.Execute then
        begin
          CD.First;
          ExcelFile := TDataSetToExcel.Create(CD,Save.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
        ShowMessage('Archivo guardado en: ' + save.FileName);

end;

procedure TFrmRetenciones.Button2Click(Sender: TObject);
begin
        if cbCodigo.ItemIndex = 0 then
           CD.Filtered := False
        else
        begin
          CD.Filtered := False;
          CD.Filter := 'CODIGO = ' + QuotedStr(cbCodigo.Text);
          CD.Filtered := True;
        end;
end;

procedure TFrmRetenciones.BitBtn4Click(Sender: TObject);
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          if cbCodigo.ItemIndex = 0 then
            SQL.Add('select * from "dian$movretefuente"')
          else
          begin
            SQL.Add('select * from "dian$movretefuente" where CODIGO = :CODIGO');
            ParamByName('CODIGO').AsString := cbCodigo.Text;
          end;
          Open;
          Last;
          First;
        end;
        save.FileName := 'TotalRetenciones';
        if Save.Execute then
        begin
          ExcelFile := TDataSetToExcel.Create(IBQuery1,Save.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
        ShowMessage('Archivo guardado en: ' + save.FileName);

end;

procedure TFrmRetenciones.CausacionAnt;
begin
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO "dian$movretefuente"');
          SQL.Add('select');
          SQL.Add(QuotedStr('DESC.CAUS.CDAT') + ',');
          SQL.Add('"cap$causacioncdat".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncdat".ID_PERSONA,');
          SQL.Add('244535000000000000 AS CODIGO,');
          SQL.Add( Tasa + ' AS TASA,');
          SQL.Add('-"cap$causacioncdat".CAUSACION_TOTAL AS MONTO,');
          SQL.Add('-"cap$causacioncdat".RETEFUENTE_TOTAL AS RETENCION,');
          SQL.Add('0 as DEVOLUCION,');
          SQL.Add('0');
          SQL.Add('from');
          SQL.Add('"cap$causacioncdat"');
          SQL.Add('where');
          SQL.Add('"cap$causacioncdat".ANO = :ANO AND');
          SQL.Add('"cap$causacioncdat".MES = :MES AND');
          SQL.Add('"cap$causacioncdat".RETEFUENTE_TOTAL > 0');
          ParamByName('ANO').AsInteger := EdPeriodo.Value - 1;
          ParamByName('MES').AsInteger := 12;
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
        end;

end;

procedure TFrmRetenciones.CausacionConAnt;
begin
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO "dian$movretefuente"');
          SQL.Add('select');
          SQL.Add(QuotedStr('DESC.CAUS.CONT') + ',');
          SQL.Add('"cap$causacioncon".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncon".ID_PERSONA,');
          SQL.Add('244535000000000000 AS CODIGO,');
          SQL.Add( Tasa + ' AS TASA,');
          SQL.Add('-"cap$causacioncon".CAUSACION_ACUMULADA AS MONTO,');
          SQL.Add('-"cap$causacioncon".RETEFUENTE_ACUMULADA AS RETENCION,');
          SQL.Add('0 as DEVOLUCION,');
          SQL.Add('0');
          SQL.Add('from');
          SQL.Add('"cap$causacioncon"');
          SQL.Add('where');
          SQL.Add('"cap$causacioncon".ANO = :ANO AND');
          SQL.Add('"cap$causacioncon".MES = :MES AND');
          SQL.Add('"cap$causacioncon".RETEFUENTE_ACUMULADA > 0');
          ParamByName('ANO').AsInteger := EdPeriodo.Value - 1;
          ParamByName('MES').AsInteger := 12;
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
        end;

end;

procedure TFrmRetenciones.FormCreate(Sender: TObject);
begin
        EdPeriodo.Value := YearOf(fFechaActual);
end;

end.
