unit UnitInformeTasasConsolidado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient,sdXmlDocuments, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, JvPanel, JvLabel, DBClient,
  FR_DSet, FR_DBSet, FR_Class,IBSQL, DateUtils, JvProgressBar,StrUtils,
  IBDatabase, Math;
type
  Deuda = record
    Valor:Currency;
    Dias:Integer;
  end;
type
  TfrmInformeTasasConsolidado = class(TForm)
    IdTCPClient1: TIdTCPClient;
    SQLQuery1: TIBQuery;
    SQLQuery2: TIBQuery;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    IBDataSet1: TIBDataSet;
    IBDataSet1ID_ESTADO_COLOCACION: TSmallintField;
    IBDataSet1DESCRIPCION_ESTADO_COLOCACION: TIBStringField;
    IBDataSet1ES_PREJURIDICO: TSmallintField;
    IBDataSet1ES_JURIDICO: TSmallintField;
    IBDataSet1ES_CASTIGADO: TSmallintField;
    IBDataSet1ES_NOVISADO: TSmallintField;
    IBDataSet1ES_ANULADO: TSmallintField;
    IBDataSet1ES_CANCELADO: TSmallintField;
    IBDataSet1ES_VIGENTE: TSmallintField;
    IBDataSet1ES_SALDADO: TSmallintField;
    IBDataSet1COLOR: TSmallintField;
    IBDataSet1ES_FALLECIDO: TSmallintField;
    IBDataSet1ES_INCAPACITADO: TSmallintField;
    IBSQL1: TIBSQL;
    Panel2: TPanel;
    CmdDatacredito: TBitBtn;
    CmdCerrar: TBitBtn;
    BTimportar: TBitBtn;
    BTelimina: TBitBtn;
    IBQuery1: TIBQuery;
    IBSClientes: TIBSQL;
    GroupBox3: TGroupBox;
    BarOcana: TJvProgressBar;
    BarAbrego: TJvProgressBar;
    BarConvencion: TJvProgressBar;
    GroupBox4: TGroupBox;
    ChOcana: TCheckBox;
    ChAbrego: TCheckBox;
    ChConvencion: TCheckBox;
    IBTransaction1: TIBTransaction;
    IBTransaction2: TIBTransaction;
    IBDatabase1: TIBDatabase;
    IBDatabase2: TIBDatabase;
    IBQTasas: TIBQuery;
    ReporteTasas: TfrReport;
    DBTasas: TfrDBDataSet;
    IBQTasasNUMERO: TLargeintField;
    IBQTasasVALOR: TIBBCDField;
    IBQTasasTASA: TFloatField;
    IBQTasasINTERES: TIBBCDField;
    IBTasas: TIBSQL;
    IBTasaDtf: TIBSQL;
    BarAguachica: TJvProgressBar;
    ChAguachica: TCheckBox;
    IBTasaG: TIBSQL;
    procedure BTimportarClick(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure BTeliminaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdDatacreditoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ReporteTasasGetValue(const ParName: String;
      var ParValue: Variant);
  private
    XmlPet,XmlRes: TsdXmlDocument;
    Nodo,Nodo1:TXmlNode;
    Size:Integer;
    AStream:TMemoryStream;
    sentencia :string;
    host_server: string;
    puerto_server: Integer;
    procedure ExtraerRemoto(puerto: integer; Hostr,Desc_Agencia: string);
    procedure ExtraerLocal;
    procedure ImprimirReporte(Cadena: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeTasasConsolidado: TfrmInformeTasasConsolidado;
  DAgencia:string;
  TasaMaxima:Double;
  TasaDtf:Double;
  TasaIpc:Double;
  totalCartera:Currency;
implementation

uses UnitPantallaProgreso, UnitGlobalesCol, UnitGlobales, UnitdmGeneral,UnitImpresion, UnitDmcolocacion;

{$R *.dfm}

procedure TfrmInformeTasasConsolidado.BTimportarClick(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
        with SQLQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_TASA_EFECTIVA from ');
          SQL.Add(' "col$tasafijas" where (:"FECHA" between FECHA_INICIAL and FECHA_FINAL)');
          ParamByName('FECHA').AsDate := fFechaActual;
          Open;
          if RecordCount = 0 then
           begin
             SQL.Clear;
             SQL.Add('select VALOR_TASA_EFECTIVA from ');
             SQL.Add('"col$tasafijas" order by FECHA_INICIAL ASC ');
             try
              Open;
              Last;
              TasaMaxima := FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
              Close;
             except
              Close;
              TasaMaxima := 99.999;
              Exit;
             end;
           end
          else
           begin
             TasaMaxima := FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
             Close;
           end;

          Close;
          SQL.Clear;
          SQL.Add('select VALOR_ACTUAL_TASA from ');
          SQL.Add(' "col$tasasvariables" where ID_INTERES = 2');
          Open;
          TasaIpc := FieldByName('VALOR_ACTUAL_TASA').AsFloat;

          Close;
          SQL.Clear;
          SQL.Add('select * from "col$informetasas"');
          Open;
          if RecordCount <> 0 then
          begin
            MessageDlg('Existen Datos En la Tabla, Debe Eliminarlos Primero',mtInformation,[mbok],0);
            Exit;
          end;
        end;
        sentencia := 'SELECT ("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) as SALDO,' +
                     '"col$colocacion".TASA_INTERES_CORRIENTE,' +
                     '"col$colocacion".PUNTOS_INTERES,' +
                     '"col$colocacion".AMORTIZA_CAPITAL,' +
                     '"col$colocacion".AMORTIZA_INTERES,' +
                     '"col$colocacion".ID_TIPO_CUOTA,' +
                     '"col$colocacion".ID_AGENCIA,' +
                     '"col$colocacion".ID_COLOCACION, ' +
                     '"col$colocacion".ID_CLASIFICACION, ' +
                     '"col$colocacion".FECHA_INTERES, ' +
                     '"col$colocacion".ID_INTERES ' +
                     'FROM "col$colocacion" WHERE "col$colocacion".ID_ESTADO_COLOCACION < 3';
//                     'FROM "col$colocacion" WHERE "col$colocacion".ID_COLOCACION = 20040001983';
        ExtraerLocal;
        ChOcana.Checked := True;
        ExtraerRemoto(BuscaServicio(2,1).vPuerto,BuscaServicio(2,1).vHost,'ABREGO');
        ChAbrego.Checked := True;
        ExtraerRemoto(BuscaServicio(3,1).vPuerto,BuscaServicio(3,1).vHost,'CONVENCION');
        ChConvencion.Checked := True;
        ExtraerRemoto(BuscaServicio(4,1).vPuerto,BuscaServicio(4,1).vHost,'AGUACHICA');
        ChAguachica.Checked := True;
        BTimportar.Enabled := False;
        dmColocacion.Free;
end;

procedure TfrmInformeTasasConsolidado.ExtraerRemoto(puerto: integer; Hostr,Desc_Agencia: string);
var     cadena :String;
        Astream1 :TMemoryStream;
        j,i :Integer;
        AList,AListCampos:TList;
        Amortizacion:Integer;
        TasaNominal:Double;
        TasaMax:Double;
        Interes:Currency;
begin
           XmlPet := TsdXmlDocument.CreateName('query_info');
           XmlPet.XmlFormat := xfReadable;
           Nodo := XmlPet.Root.NodeNew('querys');
           Nodo1 := Nodo.NodeNew('query');
           Nodo1.WriteString('tipo','select');
           nodo1.WriteString('sentencia',sentencia);
           XmlPet.SaveToFile('c:\colocacion.xml');
           DAgencia := Desc_Agencia;
            host_server := Hostr;
            puerto_server := puerto;

          // AStream := TMemoryStream.Create;

           with IdTCPClient1 do
           begin
             Host := host_server;
             Port := puerto_server;
             Connect;
             if Connected then
             begin
                Cadena := ReadLn();
                AStream := TMemoryStream.Create;
                XmlPet.SaveToStream(AStream);
                WriteInteger(AStream.Size);
                OpenWriteBuffer;
                WriteStream(AStream);
                CloseWriteBuffer;
                FreeAndNil(AStream);
                Size := ReadInteger;
                AStream := TMemoryStream.Create;
                ReadStream(AStream,Size,False);
                XmlRes := TsdXmlDocument.Create;
                XmlRes.LoadFromStream(AStream);
                Disconnect;
                AList := TList.Create;
                Nodo := XmlRes.Root.NodeByName('consulta000');
                Nodo.NodesByName('Registro',AList);
{                if Desc_Agencia = 'ABREGO' then begin
                  BarAbrego.Min := 0;
                  BarAbrego.Max := AList.Count-1;
                  BarAbrego.Position := 0;
                end else begin
                  BarConvencion.Min := 0;
                  BarConvencion.Max := AList.Count-1;
                  BarConvencion.Position := 0;
                end;}
                for i := 0 to AList.Count -1 do
                begin
                  AListCampos := TList.Create;
                  TXmlNode(AList[i]).NodesByName('campo',AListCampos);

                  with sqlquery1 do
                  begin
                    if TXmlNode(AListCampos[3]).ValueAsInteger < TXmlNode(AListCampos[4]).ValueAsInteger then
                      Amortizacion := TXmlNode(AListCampos[3]).ValueAsInteger
                    else Amortizacion := TXmlNode(AListCampos[4]).ValueAsInteger;

                    if TXmlNode(AListCampos[5]).ValueAsInteger = 1 then begin
                      TasaNominal := TasaNominalVencida(TXmlNode(AListCampos[1]).ValueAsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
//                      TasaMax := TasaNominalVencida(TasaMaxima,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                      TasaMax := TasaNominalVencida(BuscoTasaEfectivaMaxima(TXmlNode(AListCampos[9]).ValueAsDateTime,TXmlNode(AListCampos[8]).ValueAsInteger,'A'),Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                      if TXmlNode(AListCampos[8]).ValueAsInteger = 3 then begin
                        IBTasas.Close;
                        IBTasas.ParamByName('FECHA').AsDate := TXmlNode(AListCampos[9]).ValueAsDateTime;
                        IBTasas.ExecQuery;
                        if RecordCount > 0 then
                          TasaNominal := TasaNominalVencida(IBTasas.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat
                        else begin
                          IBTasaG.Close;
                          IBTasaG.ExecQuery;
                          TasaNominal := TasaNominalVencida(IBTasaG.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                        end;
                      end;
                      if TXmlNode(AListCampos[10]).ValueAsInteger = 1 then begin
                        IBTasaDtf.Close;
                        IBTasaDtf.ParamByName('FECHA').AsDate := TXmlNode(AListCampos[9]).ValueAsDateTime;
                        IBTasaDtf.ExecQuery;
                        if RecordCount > 0 then
                          TasaNominal := TasaNominalVencida(IBTasaDtf.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                      end else
                      if TXmlNode(AListCampos[10]).ValueAsInteger = 2 then
                        TasaNominal := TasaNominalVencida(TasaIpc,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                    end
                    else if TXmlNode(AListCampos[5]).ValueAsInteger = 2 then begin
                      TasaNominal := TasaNominalAnticipada(TXmlNode(AListCampos[1]).ValueAsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
//                      TasaMax := TasaNominalAnticipada(TasaMaxima,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                      TasaMax := TasaNominalAnticipada(BuscoTasaEfectivaMaxima(TXmlNode(AListCampos[9]).ValueAsDateTime,TXmlNode(AListCampos[8]).ValueAsInteger,'A'),Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                      if TXmlNode(AListCampos[8]).ValueAsInteger = 3 then begin
                        IBTasas.Close;
                        IBTasas.ParamByName('FECHA').AsDate := TXmlNode(AListCampos[9]).ValueAsDateTime;
                        IBTasas.ExecQuery;
                        if RecordCount > 0 then
                          TasaNominal := TasaNominalAnticipada(IBTasas.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat
                        else begin
                          IBTasaG.Close;
                          IBTasaG.ExecQuery;
                          TasaNominal := TasaNominalVencida(IBTasaG.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                        end;
                      end;
                      if TXmlNode(AListCampos[10]).ValueAsInteger = 1 then begin
                        IBTasaDtf.Close;
                        IBTasaDtf.ParamByName('FECHA').AsDate := TXmlNode(AListCampos[9]).ValueAsDateTime;
                        IBTasaDtf.ExecQuery;
                        if RecordCount > 0 then
                          TasaNominal := TasaNominalAnticipada(IBTasaDtf.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                      end
                      else
                      if TXmlNode(AListCampos[10]).ValueAsInteger = 2 then
                        TasaNominal := TasaNominalAnticipada(TasaIpc,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                    end
                    else if TXmlNode(AListCampos[5]).ValueAsInteger = 3 then begin
                      TasaNominal := TasaNominalVencida(TXmlNode(AListCampos[1]).ValueAsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
//                      TasaMax := TasaNominalVencida(TasaMaxima,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                      TasaMax := TasaNominalVencida(BuscoTasaEfectivaMaxima(TXmlNode(AListCampos[9]).ValueAsDateTime,TXmlNode(AListCampos[8]).ValueAsInteger,'A'),Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                      if TXmlNode(AListCampos[8]).ValueAsInteger = 3 then begin
                        IBTasas.Close;
                        IBTasas.ParamByName('FECHA').AsDate := TXmlNode(AListCampos[9]).ValueAsDateTime;
                        IBTasas.ExecQuery;
                        if RecordCount > 0 then
                          TasaNominal := TasaNominalVencida(IBTasas.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat
                        else begin
                          IBTasaG.Close;
                          IBTasaG.ExecQuery;
                          TasaNominal := TasaNominalVencida(IBTasaG.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                        end;
                      end;
                      if TXmlNode(AListCampos[10]).ValueAsInteger = 1 then begin
                        IBTasaDtf.Close;
                        IBTasaDtf.ParamByName('FECHA').AsDate := TXmlNode(AListCampos[9]).ValueAsDateTime;
                        IBTasaDtf.ExecQuery;
                        if RecordCount > 0 then
                          TasaNominal := TasaNominalVencida(IBTasaDtf.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                      end
                      else
                      if TXmlNode(AListCampos[10]).ValueAsInteger = 2 then
                        TasaNominal := TasaNominalVencida(TasaIpc,Amortizacion) + TXmlNode(AListCampos[2]).ValueAsFloat;
                    end;

                    if TasaNominal > TasaMax  then
                      TasaNominal := TasaMax;

                    Interes := SimpleRoundTo((TXmlNode(AListCampos[0]).ValueAsFloat * TasaNominal) / 100 ,0);

                    Close;
                    SQL.Clear;
                    SQL.Add('insert into "col$informetasas" values (:TASA,:NUMERO,:VALOR,:ID_AGENCIA,:ID_COLOCACION,:INTERESES)');
                    ParamByName('TASA').AsFloat := TasaNominal;
                    ParamByName('NUMERO').AsInteger := 1;
                    ParamByName('VALOR').AsCurrency := TXmlNode(AListCampos[0]).ValueAsFloat;
                    ParamByName('ID_AGENCIA').AsInteger := TXmlNode(AListCampos[6]).ValueAsInteger;
                    ParamByName('ID_COLOCACION').AsString := TXmlNode(AListCampos[7]).ValueAsString;
                    ParamByName('INTERESES').AsCurrency := Interes;
                    ExecSQL;
                  end;

            {    if Desc_Agencia = 'ABREGO' then
                  BarAbrego.Position := i
                else
                  BarConvencion.Position := i;}
                Application.ProcessMessages;

                end;
                SQLQuery1.Transaction.Commit;
                SQLQuery1.Transaction.StartTransaction;
             end;
           end;
end;

procedure TfrmInformeTasasConsolidado.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var       paquete :Currency;
begin
          if AWorkMode = wmRead then
          begin
//            paquete := AWorkCount/1000;
            if DAgencia = 'ABREGO' then
              BarAbrego.Position := AWorkCount
            else if DAgencia = 'CONVENCION' then
              BarConvencion.Position := AWorkCount
            else
              BarAguachica.Position := AWorkCount;
            Application.ProcessMessages;
          end;

end;

procedure TfrmInformeTasasConsolidado.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          if AWorkMode = wmRead then
          begin
            if DAgencia = 'ABREGO' then
              BarAbrego.Max := AWorkCountMax
            else if DAgencia = 'CONVENCION' then
              BarConvencion.Max := AWorkCountMax
            else
              BarAguachica.Max := AWorkCountMax;
          end;

end;

procedure TfrmInformeTasasConsolidado.BTeliminaClick(Sender: TObject);
begin
        if MessageDlg('Esta Seguro de Eliminar los Datos',mtInformation,[mbyes,mbno],0) = mryes then
        begin
          with SQLQuery1 do
          begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('delete from "col$informetasas"');
            ExecSQL;
            Transaction.Commit;
            Transaction.StartTransaction;
        end;
       end;
end;

procedure TfrmInformeTasasConsolidado.ExtraerLocal;
var
Amortizacion:Integer;
TasaNominal:Double;
TasaMax:Double;
Interes:Currency;
begin
        SQLQuery1.Close;
        SQLQuery1.SQL.Clear;
        SQLQuery1.SQL.Add(sentencia);
        SQLQuery1.Open;
        SQLQuery1.Last;
        SQLQuery1.First;
        BarOcana.Min := 0;
        BarOcana.Max := SQLQuery1.RecordCount;
        BarOcana.Position := 0;
        while not SQLQuery1.Eof do
        begin
          BarOcana.Position := SQLQuery1.RecNo;
          Application.ProcessMessages;
          with SQLQuery2 do
          begin
            if SQLQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger < SQLQuery1.FieldByName('AMORTIZA_INTERES').AsInteger THEN
              Amortizacion := SQLQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger
            else Amortizacion := SQLQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;

            if SQLQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger = 1 then begin
              TasaNominal := TasaNominalVencida(SQLQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
//              TasaMax := TasaNominalVencida(TasaMaxima,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
              TasaMax := TasaNominalVencida(BuscoTasaEfectivaMaxima(SQLQuery1.FieldByName('FECHA_INTERES').AsDateTime,SQLQuery1.FieldByName('ID_CLASIFICACION').AsInteger,'A'),Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
              if SQLQuery1.FieldByName('ID_CLASIFICACION').AsInteger = 3 then begin
                IBTasas.Close;
                IBTasas.ParamByName('FECHA').AsDate := SQLQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                IBTasas.ExecQuery;
                if IBTasas.RecordCount > 0 then
                  TasaNominal := TasaNominalVencida(IBTasas.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat
                else begin
                  IBTasaG.Close;
                  IBTasaG.ExecQuery;
                  TasaNominal := TasaNominalVencida(IBTasaG.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
                end;
              end;
              if SQLQuery1.FieldByName('ID_INTERES').AsInteger = 1 then begin
                IBTasaDtf.Close;
                IBTasaDtf.ParamByName('FECHA').AsDate := SQLQuery1.fieldbyname('FECHA_INTERES').AsDateTime;
                IBTasaDtf.ExecQuery;
                if IBTasaDtf.RecordCount > 0 then
                  TasaNominal := TasaNominalVencida(IBTasaDtf.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
              end else
              if SQLQuery1.FieldByName('ID_INTERES').AsInteger = 2 then
                TasaNominal := TasaNominalVencida(TasaIpc,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
            end
            else if SQLQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger = 2 then begin
              TasaNominal := TasaNominalAnticipada(SQLQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
//              TasaMax := TasaNominalAnticipada(TasaMaxima,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
              TasaMax := TasaNominalAnticipada(BuscoTasaEfectivaMaxima(SQLQuery1.FieldByName('FECHA_INTERES').AsDateTime,SQLQuery1.FieldByName('ID_CLASIFICACION').AsInteger,'A'),Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
              if SQLQuery1.FieldByName('ID_CLASIFICACION').AsInteger = 3 then begin
                IBTasas.Close;
                IBTasas.ParamByName('FECHA').AsDate := SQLQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                IBTasas.ExecQuery;
                if IBTasas.RecordCount > 0 then
                  TasaNominal := TasaNominalVencida(IBTasas.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat
                else begin
                  IBTasaG.Close;
                  IBTasaG.ExecQuery;
                  TasaNominal := TasaNominalVencida(IBTasaG.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
                end;
              end;
              if SQLQuery1.FieldByName('ID_INTERES').AsInteger = 1 then begin
                IBTasaDtf.Close;
                IBTasaDtf.ParamByName('FECHA').AsDate := SQLQuery1.fieldbyname('FECHA_INTERES').AsDateTime;
                IBTasaDtf.ExecQuery;
                if IBTasaDtf.RecordCount > 0 then
                  TasaNominal := TasaNominalAnticipada(IBTasaDtf.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
              end else
              if SQLQuery1.FieldByName('ID_INTERES').AsInteger = 2 then
                TasaNominal := TasaNominalAnticipada(TasaIpc,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
            end
            else if SQLQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger = 3 then begin
              TasaNominal := TasaNominalVencida(SQLQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
//              TasaMax := TasaNominalVencida(TasaMaxima,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
              TasaMax := TasaNominalVencida(BuscoTasaEfectivaMaxima(SQLQuery1.FieldByName('FECHA_INTERES').AsDateTime,SQLQuery1.FieldByName('ID_CLASIFICACION').AsInteger,'A'),Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
              if SQLQuery1.FieldByName('ID_CLASIFICACION').AsInteger = 3 then begin
                IBTasas.Close;
                IBTasas.ParamByName('FECHA').AsDate := SQLQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                IBTasas.ExecQuery;
                if IBTasas.RecordCount > 0 then
                  TasaNominal := TasaNominalVencida(IBTasas.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat
                else begin
                  IBTasaG.Close;
                  IBTasaG.ExecQuery;
                  TasaNominal := TasaNominalVencida(IBTasaG.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
                end;
              end;
              if SQLQuery1.FieldByName('ID_INTERES').AsInteger = 1 then begin
                IBTasaDtf.Close;
                IBTasaDtf.ParamByName('FECHA').AsDate := SQLQuery1.fieldbyname('FECHA_INTERES').AsDateTime;
                IBTasaDtf.ExecQuery;
                if IBTasaDtf.RecordCount > 0 then
                  TasaNominal := TasaNominalVencida(IBTasaDtf.FieldByName('VALOR_TASA_EFECTIVA').AsFloat,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
              end else
              if SQLQuery1.FieldByName('ID_INTERES').AsInteger = 2 then
                TasaNominal := TasaNominalVencida(TasaIpc,Amortizacion) + SQLQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
            end;

            if TasaNominal > TasaMax  then
              TasaNominal := TasaMax;

            Interes := SimpleRoundTo((SQLQuery1.FieldByName('SALDO').AsCurrency * TasaNominal / 100) ,0);

            Close;
            SQL.Clear;
            SQL.Add('insert into "col$informetasas" values (:TASA,:NUMERO,:VALOR,:ID_AGENCIA,:ID_COLOCACION,:INTERESES)');
            ParamByName('TASA').AsFloat := TasaNominal;
            ParamByName('NUMERO').AsInteger := 1;
            ParamByName('VALOR').AsCurrency := SQLQuery1.FieldByName('SALDO').AsCurrency;
            ParamByName('ID_AGENCIA').AsInteger := SQLQuery1.FieldByName('ID_AGENCIA').AsInteger;
            ParamByName('ID_COLOCACION').AsString := SQLQuery1.FieldByName('ID_COLOCACION').AsString;
            ParamByName('INTERESES').AsCurrency := Interes;
            ExecSQL;
          end;
          SQLQuery1.Next;
        end;
        SQLQuery2.Transaction.Commit;
        SQLQuery2.Transaction.StartTransaction;
end;

procedure TfrmInformeTasasConsolidado.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeTasasConsolidado.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeTasasConsolidado.CmdDatacreditoClick(Sender: TObject);
var
TasaMaxima: Double;
begin
        CmdDatacredito.Enabled := False;
//        TasaMaxima := BuscoTasaEfectivaMaxima(fFechaActual);

        with SQLQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select sum(VALOR) as TOTAL from "col$informetasas"');
          Open;
          totalCartera := FieldByName('TOTAL').AsCurrency;
          Close;
        end;
        
        if IBQTasas.Transaction.InTransaction then
          IBQTasas.Transaction.Rollback;
        IBQTasas.Transaction.StartTransaction;
        IBQTasas.Close;
        IBQTasas.Open;
        Empleado;
        ImprimirReporte(ExtractFilePath(Application.ExeName)+'\Reporte\frmReporteTasasConsolidado.frf');
end;

procedure TfrmInformeTasasConsolidado.FormCreate(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
end;

procedure TfrmInformeTasasConsolidado.ReporteTasasGetValue(
  const ParName: String; var ParValue: Variant);
begin
        if ParName = 'Empresa' then ParValue := Empresa;
        if ParName = 'Nit' then ParValue := Nit;
        if ParName = 'Empleado' then ParValue := Nombres + ' ' + Apellidos;
        if ParName = 'TotalCartera' then ParValue := totalcartera;
end;

procedure TfrmInformeTasasConsolidado.ImprimirReporte(Cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        ReporteTasas.LoadFromFile(cadena);
        ReporteTasas.Preview := FrmImpresion.frPreview1;
        ReporteTasas.ShowReport;
        FrmImpresion.ShowModal
end;

end.
