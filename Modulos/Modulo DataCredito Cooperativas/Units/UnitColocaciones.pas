unit UnitConsolidarData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient,sdXmlDocuments, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, JvPanel, JvLabel, DBClient,
  FR_DSet, FR_DBSet, FR_Class,DataSetToExcel, IBSQL, DateUtils;
type
  Deuda = record
    Valor:Currency;
    Dias:Integer;
  end;
type
  TfrmConsolidadData = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DTfecha: TDateTimePicker;
    BTimportar: TBitBtn;
    BTelimina: TBitBtn;
    IdTCPClient1: TIdTCPClient;
    SQLQuery1: TIBQuery;
    SQLQuery2: TIBQuery;
    BitBtn1: TBitBtn;
    CDcreditos: TClientDataSet;
    CDcreditosNo: TIntegerField;
    CDcreditosnombre: TStringField;
    CDcreditossaldo: TCurrencyField;
    CDcreditosvalor: TCurrencyField;
    CDcreditosagencia: TIntegerField;
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
    SDdialogo: TSaveDialog;
    RP: TReplaceDialog;
    CDmayorcre: TClientDataSet;
    CDmayorcreid_colocacion: TStringField;
    CDmayorcreid_persona: TStringField;
    CDmayorcreid_identificacion: TSmallintField;
    CDmayorcredias: TIntegerField;
    CDmayorcreid_clasificacion: TSmallintField;
    CDmayorcrevalor: TCurrencyField;
    CDmayorcredeuda: TCurrencyField;
    CDmayorcreid_agencia: TSmallintField;
    CDmayorcrenombre: TStringField;
    CDmayorcremaxdias: TAggregateField;
    CDmayorcresumdeuda: TAggregateField;
    CDmayorcresumvalor: TAggregateField;
    IBSQL1: TIBSQL;
    CDconsolidado: TClientDataSet;
    CDconsolidadonombre: TStringField;
    CDconsolidadodeuda: TCurrencyField;
    CDconsolidadovalor: TCurrencyField;
    CDconsolidadodias: TIntegerField;
    CDconsolidadoid_persona: TStringField;
    CDconsolidadoid_agencia: TSmallintField;
    CDtotal: TClientDataSet;
    CDtotalnombre: TStringField;
    CDtotaldeuda: TCurrencyField;
    CDtotalvalor: TCurrencyField;
    CDtotaldias: TIntegerField;
    CDtotalid_persona: TStringField;
    CDtotalid_agencia: TIntegerField;
    procedure BTimportarClick(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure BTeliminaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BTrepCreditosClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormCreate(Sender: TObject);
    procedure BTvencidosClick(Sender: TObject);
    procedure BTExelCreditosClick(Sender: TObject);
    procedure BTExelVencidosClick(Sender: TObject);
  private
    XmlPet,XmlRes: TsdXmlDocument;
    Nodo,Nodo1:TXmlNode;
    Size:Integer;
    AStream:TMemoryStream;
    sentencia :string;
    procedure ExtraerRemoto(puerto: integer; Hostr,Desc_Agencia: string);
    procedure ExtraerLocal;
    function ObtenerDeuda(tipo: Integer; FechaCorte, FechaInteres: TDate;
      IBSQL1: TIBSQL; Amortiza: Integer): Deuda;
    function valida_col(id_persona: string; id_identificacion:Integer): boolean;
    procedure llena_saldos(id_persona: string; id_identificacion: Integer);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsolidadData: TfrmConsolidadData;

implementation

uses UnitPantallaProgreso, UnitGlobalesCol, UnitGlobales;

{$R *.dfm}

procedure TfrmConsolidadData.BTimportarClick(Sender: TObject);
begin
        with SQLQuery1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select distinct FECHA_CORTE from "col$causaciones_mensual"');
           Open;
           if RecordCount <> 0 then
           begin
             MessageDlg('Existen Datos En la Tabla, Debe Eliminarlos Primero',mtInformation,[mbok],0);
             Exit;
           end;
        end;
        sentencia := 'SELECT ' +
        '"col$causaciones".ID_AGENCIA, ' + #13 +
        '"col$causaciones".ID_COLOCACION, ' + #13 +
        '"col$causaciones".FECHA_CORTE, ' + #13 +
        '"col$causaciones".ID_CLASIFICACION, ' + #13 +
        '"col$causaciones".ID_IDENTIFICACION, ' + #13 +
        '"col$causaciones".ID_PERSONA, ' + #13 +
        '"col$causaciones".VALOR, ' + #13 +
        '"col$causaciones".DEUDA, ' + #13 +
        '"col$causaciones".ID_TIPO_CUOTA, ' + #13 +
        '"col$causaciones".FECHA_CAPITAL, ' + #13 +
        '"col$causaciones".FECHA_INTERES, ' + #13 +
        '"col$causaciones".AMORTIZA_CAPITAL, ' + #13 +
        '"gen$persona".NOMBRE, ' + #13 +
        '"gen$persona".PRIMER_APELLIDO, ' + #13 +
        '"gen$persona".SEGUNDO_APELLIDO ' + #13 +
        'FROM ' + #13 +
        '"col$causaciones" ' + #13 +
        'INNER JOIN "gen$persona" ON ("col$causaciones".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$causaciones".ID_PERSONA = "gen$persona".ID_PERSONA) ' + #13 +
        'WHERE' + #13 +
        '("col$causaciones".FECHA_CORTE = ' + '''' +DateToStr(DTfecha.Date)+ '''' + ')';
        ExtraerLocal;
        ExtraerRemoto(3052,'192.168.201.2','ABREGO');
        ExtraerRemoto(3052,'192.168.202.2','CONVENCION');
end;

procedure TfrmConsolidadData.ExtraerRemoto(puerto: integer; Hostr,Desc_Agencia: string);
var     cadena :String;
        Astream1 :TMemoryStream;
        j,i :Integer;
        AList,AListCampos:TList;
begin
           XmlPet := TsdXmlDocument.CreateName('query_info');
           XmlPet.XmlFormat := xfReadable;
           Nodo := XmlPet.Root.NodeNew('querys');
           Nodo1 := Nodo.NodeNew('query');
           Nodo1.WriteString('tipo','select');
           nodo1.WriteString('sentencia',sentencia);
           XmlPet.SaveToFile('c:\colocacion.xml');
          // AStream := TMemoryStream.Create;

           with IdTCPClient1 do
           begin
             Host := hostr;
             Port := puerto;
             Connect;
             if Connected then
             begin
                frmProgreso := TfrmProgreso.Create(self);
                frmProgreso.Titulo := 'Recibiendo Informacion...' + Desc_Agencia;
                frmProgreso.InfoLabel := 'Kbs Recibidos';
                frmProgreso.Min := 0;
                frmProgreso.Ejecutar;
                //Cadena := ReadLn();
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
                frmProgreso.Cerrar;
                AList := TList.Create;
                Nodo := XmlRes.Root.NodeByName('consulta000');
                Nodo.NodesByName('Registro',AList);
                frmProgreso := TfrmProgreso.Create(Self);
                frmProgreso.Titulo := 'Procesando Información...' + Desc_Agencia;
                frmProgreso.Max := AList.Count - 1;
                frmProgreso.Min := 0;
                frmProgreso.Ejecutar;
                for i := 0 to AList.Count -1 do
                begin
                  AListCampos := TList.Create;
                  TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                  with sqlquery1 do
                  begin
                    frmProgreso.Position := i;
                    frmProgreso.InfoLabel := 'Registro No : ' + IntToStr(i);
                    Application.ProcessMessages;
                    Close;
                    SQL.Clear;
                    SQL.Add('insert into "col$causaciones_mensual" values (:ID_AGENCIA,:ID_COLOCACION,:FECHA_CORTE,');
                    SQL.Add(':ID_CLASIFICACION,:ID_IDENTIFICACION,:ID_PERSONA,:VALOR,:DEUDA,:ID_TIPO_CUOTA,:FECHA_CAPITAL,');
                    SQL.Add(':FECHA_INTERES,:AMORTIZA_CAPITAL,:NOMBRE,:PRIMER_APELLIDO,:SEGUNDO_APELLIDO)');
                    ParamByName('ID_AGENCIA').AsInteger := TXmlNode(AListCampos[0]).ValueAsInteger;
                    ParamByName('ID_COLOCACION').AsString := TXmlNode(AListCampos[1]).ValueAsString;
                    ParamByName('FECHA_CORTE').AsDate := TXmlNode(AListCampos[2]).ValueAsDateTime;
                    ParamByName('ID_CLASIFICACION').AsInteger := TXmlNode(AListCampos[3]).ValueAsInteger;
                    ParamByName('ID_IDENTIFICACION').AsInteger := TXmlNode(AListCampos[4]).ValueAsInteger;
                    ParamByName('ID_PERSONA').AsString := TXmlNode(AListCampos[5]).ValueAsString;
                    ParamByName('VALOR').AsCurrency := TXmlNode(AListCampos[6]).ValueAsFloat;
                    ParamByName('DEUDA').AsCurrency := TXmlNode(AListCampos[7]).ValueAsFloat;
                    ParamByName('ID_TIPO_CUOTA').AsInteger := TXmlNode(AListCampos[8]).ValueAsInteger;
                    ParamByName('FECHA_CAPITAL').AsDate := TXmlNode(AListCampos[9]).ValueAsDateTime;
                    ParamByName('FECHA_INTERES').AsDate := TXmlNode(AListCampos[10]).ValueAsDateTime;
                    ParamByName('AMORTIZA_CAPITAL').AsInteger := TXmlNode(AListCampos[11]).ValueAsInteger;
                    ParamByName('NOMBRE').AsString := TXmlNode(AListCampos[12]).ValueAsString;
                    ParamByName('PRIMER_APELLIDO').AsString := TXmlNode(AListCampos[13]).ValueAsString;
                    ParamByName('SEGUNDO_APELLIDO').AsString := TXmlNode(AListCampos[14]).ValueAsString;
                    ExecSQL;
                  end;
                end;
                frmProgreso.Cerrar;
                SQLQuery1.Transaction.Commit;
                SQLQuery1.Transaction.StartTransaction;
             end;
           end;
end;

procedure TfrmConsolidadData.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var       paquete :Currency;
begin
          if AWorkMode = wmRead then
          begin
            frmProgreso.Position := AWorkCount;
            paquete := AWorkCount/1000;
            frmProgreso.InfoLabel := 'Kbs Recibidos : ' + CurrToStr(paquete);
            Application.ProcessMessages;
          end;

end;

procedure TfrmConsolidadData.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          if AWorkMode = wmRead then
          begin
            frmProgreso.Max := AWorkCountMax;
          end;
          frmProgreso.Titulo := 'Recibiendo Información... Tamaño: ' +  CurrToStr(AWorkCountMax/1000) + ' Kbs';

end;

procedure TfrmConsolidadData.BTeliminaClick(Sender: TObject);
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
            SQL.Add('delete from "col$causaciones_mensual"');
            ExecSQL;
            Transaction.Commit;
            Transaction.StartTransaction;
        end;
       end;  
end;

procedure TfrmConsolidadData.ExtraerLocal;
begin
        SQLQuery1.Close;
        SQLQuery1.SQL.Clear;
        SQLQuery1.SQL.Add(sentencia);
        SQLQuery1.Open;
        SQLQuery1.Last;
        SQLQuery1.First;
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Procesando Información... OCAÑA';
        frmProgreso.Max := SQLQuery1.RecordCount;
        frmProgreso.Min := 0;
        frmProgreso.Ejecutar;
        while not SQLQuery1.Eof do
        begin
          frmProgreso.Position := SQLQuery1.RecNo;
          frmProgreso.InfoLabel := 'Registro No : ' + IntToStr(SQLQuery1.RecNo);
          Application.ProcessMessages;
          with SQLQuery2 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "col$causaciones_mensual" values (:ID_AGENCIA,:ID_COLOCACION,:FECHA_CORTE,');
            SQL.Add(':ID_CLASIFICACION,:ID_IDENTIFICACION,:ID_PERSONA,:VALOR,:DEUDA,:ID_TIPO_CUOTA,:FECHA_CAPITAL,');
            SQL.Add(':FECHA_INTERES,:AMORTIZA_CAPITAL,:NOMBRE,:PRIMER_APELLIDO,:SEGUNDO_APELLIDO)');
            ParamByName('ID_AGENCIA').AsInteger := SQLQuery1.FieldByName('ID_AGENCIA').AsInteger;
            ParamByName('ID_COLOCACION').AsString := SQLQuery1.FieldByName('ID_COLOCACION').AsString;
            ParamByName('FECHA_CORTE').AsDate := SQLQuery1.FieldByName('FECHA_CORTE').AsDateTime;
            ParamByName('ID_CLASIFICACION').AsInteger := SQLQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
            ParamByName('ID_IDENTIFICACION').AsInteger := SQLQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := SQLQuery1.FieldByName('ID_PERSONA').AsString;
            ParamByName('VALOR').AsCurrency := SQLQuery1.FieldByName('VALOR').AsCurrency;
            ParamByName('DEUDA').AsCurrency := SQLQuery1.FieldByName('DEUDA').AsCurrency;
            ParamByName('ID_TIPO_CUOTA').AsInteger := SQLQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger;
            ParamByName('FECHA_CAPITAL').AsDate := SQLQuery1.FieldByName('FECHA_CAPITAL').AsDateTime;
            ParamByName('FECHA_INTERES').AsDate := SQLQuery1.FieldByName('FECHA_INTERES').AsDateTime;
            ParamByName('AMORTIZA_CAPITAL').AsInteger := SQLQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger;
            ParamByName('NOMBRE').AsString := SQLQuery1.FieldByName('NOMBRE').AsString;
            ParamByName('PRIMER_APELLIDO').AsString := SQLQuery1.FieldByName('PRIMER_APELLIDO').AsString;
            ParamByName('SEGUNDO_APELLIDO').AsString := SQLQuery1.FieldByName('SEGUNDO_APELLIDO').AsString;
            ExecSQL;
          end;
          SQLQuery1.Next;
        end;
        frmProgreso.Cerrar;
        SQLQuery2.Transaction.Commit;
        SQLQuery2.Transaction.StartTransaction;
end;

procedure TfrmConsolidadData.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidadData.BTrepCreditosClick(Sender: TObject);
begin
        with SQLQuery2 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"col$causaciones_mensual".ID_AGENCIA,');
           SQL.Add('"col$causaciones_mensual".ID_PERSONA,');
           SQL.Add('"col$causaciones_mensual".PRIMER_APELLIDO,');
           SQL.Add('"col$causaciones_mensual".SEGUNDO_APELLIDO,');
           SQL.Add('SUM("col$causaciones_mensual".DEUDA) AS DEUDA,');
           SQL.Add('"col$causaciones_mensual".NOMBRE,');
           SQL.Add('SUM("col$causaciones_mensual".VALOR) AS VALOR');
           SQL.Add('FROM');
           SQL.Add('"col$causaciones_mensual"');
           SQL.Add('GROUP BY');
           SQL.Add('"col$causaciones_mensual".ID_AGENCIA,');
           SQL.Add('"col$causaciones_mensual".ID_PERSONA,');
           SQL.Add('"col$causaciones_mensual".PRIMER_APELLIDO,');
           SQL.Add('"col$causaciones_mensual".SEGUNDO_APELLIDO,');
           SQL.Add('"col$causaciones_mensual".NOMBRE');
           SQL.Add('ORDER BY  SUM("col$causaciones_mensual".DEUDA) DESC');
           Open;
           Last;
           First;
           frmprogreso := TfrmProgreso.Create(self);
           frmProgreso.Max := RecordCount;
           frmProgreso.Titulo := 'Listado de Creditos';
           frmProgreso.Min := 0;
           frmProgreso.Ejecutar;
           while not Eof do
           begin
             frmProgreso.Position := RecNo;
             Application.ProcessMessages;
             if CDcreditos.RecordCount >= JVnumero.Value then
             begin
               Break;
               frmProgreso.Cerrar;
             end;
            CDcreditos.Append;
            CDcreditos.FieldValues['No'] := CDcreditos.RecordCount + 1;
            CDcreditos.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            CDcreditos.FieldValues['saldo'] := FieldByName('DEUDA').AsCurrency;
            CDcreditos.FieldValues['valor'] := FieldByName('VALOR').AsCurrency;
            CDcreditos.FieldValues['agencia'] := FieldByName('ID_AGENCIA').AsInteger;
            CDcreditos.Post;
            Next;
          end;
          frmProgreso.Cerrar;
        end;
        frDBDataSet1.DataSet := CDcreditos;
        frReport1.ShowReport;
        BTExelCreditos.Enabled := True;
        


end;

procedure TfrmConsolidadData.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'fecha' then
           ParValue := DTfecha.DateTime;
end;

procedure TfrmConsolidadData.FormCreate(Sender: TObject);
begin
        with SQLQuery1 do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select distinct FECHA_CORTE from "col$causaciones_mensual"');
           Open;
           if RecordCount <> 0 then
           begin
             DTfecha.Date := FieldByName('FECHA_CORTE').AsDateTime;
           end;

        end;
end;

procedure TfrmConsolidadData.BTvencidosClick(Sender: TObject);
begin
     if CDtotal.RecordCount = 0 then
     begin
      with SQLQuery1 do
      begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('ID_AGENCIA,');
         SQL.Add('ID_COLOCACION,');
         SQL.Add('ID_CLASIFICACION,');
         SQL.Add('ID_IDENTIFICACION,');
         SQL.Add('FECHA_INTERES,');
         SQL.Add('ID_PERSONA,');
         SQL.Add('VALOR,');
         SQL.Add('DEUDA,');
         SQL.Add('ID_TIPO_CUOTA,');
         SQL.Add('AMORTIZA_CAPITAL,');
         SQL.Add('NOMBRE,');
         SQL.Add('PRIMER_APELLIDO,');
         SQL.Add('SEGUNDO_APELLIDO');
         SQL.Add('FROM');
         SQL.Add('"col$causaciones_mensual"');
         Open;
         Last;
         First;
         frmProgreso := TfrmProgreso.Create(self);
         frmProgreso.Titulo := 'Leyendo Tabla Causaciones TEMPORAL...' + IntToStr(RecordCount);
         frmProgreso.Max := RecordCount;
         frmProgreso.Min := 0;
         frmProgreso.Ejecutar;
         while not Eof do
         begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Colocacion No : ' + FieldByName('ID_COLOCACION').AsString;
            Application.ProcessMessages;
            CDmayorcre.Append;
            CDmayorcre.FieldValues['id_colocacion'] := FieldByName('ID_COLOCACION').AsString;
            CDmayorcre.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
            CDmayorcre.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
            CDmayorcre.FieldValues['dias'] := obtenerdeuda(FIELDBYNAME('ID_TIPO_CUOTA').AsInteger,DTfecha.Date,FieldByName('FECHA_INTERES').AsDateTime,IBSQL1,FieldByName('AMORTIZA_CAPITAL').AsInteger).Dias;
            CDmayorcre.FieldValues['id_clasificacion'] := fieldbyname('ID_CLASIFICACION').AsInteger;
            CDmayorcre.FieldValues['valor'] := FieldByName('VALOR').AsCurrency;
            CDmayorcre.FieldValues['deuda'] := FieldByName('DEUDA').AsCurrency;
            CDmayorcre.FieldValues['id_agencia'] := FieldByName('ID_AGENCIA').AsInteger;
            CDmayorcre.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            CDmayorcre.Post;
            Next;
           //ObtenerDeudaFecha(1,'pp',fecha_corte,IBSQL2).
         end;
      end;
      frmProgreso.Cerrar;
      with SQLQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select distinct ID_PERSONA,ID_IDENTIFICACION from "col$causaciones_mensual"');
        Open;
        Last;
        First;
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Procesando Tabla Temporal...' + IntToStr(RecordCount);
        frmProgreso.Max := RecordCount;
        frmProgreso.Min := 0;
        frmProgreso.Ejecutar;
        while not Eof do
        begin
          frmProgreso.Position := RecNo;
          frmProgreso.InfoLabel := 'Registro No : ' + IntToStr(RecNo);
          Application.ProcessMessages;
//          if RecNo = 500 then
//             Break;
          if valida_col(FieldByName('ID_PERSONA').AsString,FieldByName('ID_IDENTIFICACION').AsInteger) then
             llena_saldos(FieldByName('ID_PERSONA').AsString,FieldByName('ID_IDENTIFICACION').AsInteger);
          Next;
        end;
      end;
      frmProgreso.Cerrar;
      with CDconsolidado do
      begin
        Filtered := True;
//        IndexFieldNames := 'deuda';
        while not Eof do
        begin
          if CDtotal.RecordCount >= JVnumero.Value then
            Break;
          CDtotal.Append;
          CDtotal.FieldValues['nombre'] := FieldByName('nombre').AsString;
          CDtotal.FieldValues['deuda'] :=  FieldByName('deuda').AsCurrency;
          CDtotal.FieldValues['valor'] := FieldByName('valor').AsCurrency;
          CDtotal.FieldValues['dias'] := FieldByName('dias').AsInteger;
          CDtotal.FieldValues['id_persona'] := FieldByName('id_persona').AsString;
          CDtotal.FieldValues['id_agencia'] := FieldByName('id_agencia').AsInteger;
          CDtotal.Post;
          Next;
        end;
      end;
     end; 
        frDBDataSet1.DataSet := CDtotal;
        frReport2.ShowReport;
      BTExelVencidos.Enabled := True;
end;

procedure TfrmConsolidadData.BTExelCreditosClick(Sender: TObject);
var
  ExcelFile:TDataSetToExcel;
begin
        CDcreditos.Last;
        CDcreditos.First;
        SDdialogo.Filter := 'Archivos Excel (*.xls)|*.XLS';
        if SDdialogo.Execute then
        begin
          ExcelFile := TDataSetToExcel.Create(CDcreditos,SDdialogo.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;

end;

function TfrmConsolidadData.ObtenerDeuda(tipo: Integer; FechaCorte,
  FechaInteres: TDate; IBSQL1: TIBSQL; Amortiza: Integer): Deuda;
var
dias :Integer;
fecha,FechaHoy,fecha1 :TDate;
begin
           FechaHoy := FechaCorte;
           Fecha := FechaInteres;// cambio por fecha de interes debido a la causacion mensual
           if (tipo <> 2) then
              Fecha := CalculoFecha(Fecha,Amortiza);
              Fecha1 := IncDay(Fecha);
              Dias := DiasEntre(Fecha1,FechaHoy);
             Result.Dias := dias;
end;

function TfrmConsolidadData.valida_col(id_persona: string; id_identificacion:Integer): boolean;
var    dias :Integer;
        es_moroso :Boolean;
begin
        es_moroso := False;
        with CDmayorcre do
        begin
          Filtered := False;
          Filter := 'id_identificacion = ' + IntToStr(id_identificacion) + ' and id_persona = ' + id_persona;
          Filtered := True;
          while not Eof do
          begin
            dias := FieldByName('dias').AsInteger;
            if ((FieldByName('id_clasificacion').AsInteger = 3) and (dias > 61)) or ((FieldByName('id_clasificacion').AsInteger <> 3) and (dias > 31)) then
            begin
              es_moroso := True;
              Break;
            end;
            Next;
          end;
        end;
        Result := es_moroso;
end;

procedure TfrmConsolidadData.llena_saldos(id_persona: string;
  id_identificacion: Integer);
begin
        with CDmayorcre do
        begin
          Filtered := False;
          Filter := 'id_identificacion = ' + IntToStr(id_identificacion) + ' and id_persona = ' + id_persona;
          Filtered := True;
          AggregatesActive := True;
          CDconsolidado.Append;
//          ShowMessage(FieldByName('sumdeuda').AsString);
          CDconsolidado.FieldValues['nombre'] := CDmayorcrenombre.Value;
          CDconsolidado.FieldValues['deuda'] :=  CDmayorcresumdeuda.Value;
          CDconsolidado.FieldValues['valor'] := CDmayorcresumvalor.Value;
          CDconsolidado.FieldValues['dias'] := CDmayorcremaxdias.Value;
          CDconsolidado.FieldValues['id_persona'] := id_persona;
          CDconsolidado.FieldValues['id_agencia'] := CDmayorcreid_agencia.Value;
          CDconsolidado.Post;
        end;
end;

procedure TfrmConsolidadData.BTExelVencidosClick(Sender: TObject);
var
  ExcelFile:TDataSetToExcel;
begin
        CDtotal.Last;
        CDtotal.First;
        SDdialogo.Filter := 'Archivos Excel (*.xls)|*.XLS';
        if SDdialogo.Execute then
        begin
          ExcelFile := TDataSetToExcel.Create(CDtotal,SDdialogo.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

end.
