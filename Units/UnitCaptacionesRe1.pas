unit UnitCaptacionesRe1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, JvLabel, JvPanel, JvEdit,
  JvTypedEdit, DB, IBCustomDataSet, IBQuery,sdXmlDocuments, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, DateUtils, DBClient, FR_DSet, FR_DBSet,
  FR_Class, DataSetToExcel, IBDatabase, IBStoredProc;

type
  TFrmCaptacionesRe = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DTfecha: TDateTimePicker;
    BTimportar: TBitBtn;
    BTelimina: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    JVnumero: TJvIntegerEdit;
    JvPanel1: TJvPanel;
    BTGrafico: TBitBtn;
    BTExeL: TBitBtn;
    Label3: TLabel;
    CBtipo: TComboBox;
    IdTCPClient1: TIdTCPClient;
    SQLQuery2: TIBQuery;
    SQLQuery1: TIBQuery;
    CDcaptacion: TClientDataSet;
    CDcaptacionNo: TIntegerField;
    CDcaptacionid_persona: TStringField;
    CDcaptacionnombres: TStringField;
    CDcaptacionsaldo: TCurrencyField;
    CDcaptacionagencia: TIntegerField;
    frReport3: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    CDcaptacioncaptacion: TStringField;
    SDdialogo: TSaveDialog;
    Transaction: TIBTransaction;
    Database: TIBDatabase;
    IBData: TIBQuery;
    Memo1: TMemo;
    IBpro: TIBStoredProc;
    IBQuery1: TIBQuery;
    procedure BTGraficoClick(Sender: TObject);
    procedure CBtipoClick(Sender: TObject);
    procedure BTimportarClick(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure BTeliminaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frReport3GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BTExeLClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    sentencia: string;
    XmlPet,XmlRes: TsdXmlDocument;
    Nodo,Nodo1:TXmlNode;
    Size:Integer;
    AStream:TMemoryStream;
    DAgencia :string;
    descripcion: string;
    procedure ExtraerRemoto(puerto: integer; Hostr, Desc_Agencia: string);
    procedure ExtraerLocal;
    procedure Extraer(vIdAgencia: integer; vDesc, vRuta: string);
  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCaptacionesRe: TFrmCaptacionesRe;

implementation

uses UnitPantallaProgreso,UnitGlobales;

{$R *.dfm}

procedure TFrmCaptacionesRe.BTGraficoClick(Sender: TObject);
var    modalidad :string;
begin
        CDcaptacion.CancelUpdates;
        with SQLQuery1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select sum(SALDO_ACTUAL) AS SALDO,NOMBRES,ID_PERSONA,ID_IDENTIFICACION,AG from "cap$saldogeneral" where TIPO_CUENTA = :TIPO');
           SQL.Add('group by NOMBRES,ID_PERSONA,ID_IDENTIFICACION,AG');
           SQL.Add('order by sum(SALDO_ACTUAL) desc');
           case CBtipo.ItemIndex of
           0 : begin
                 modalidad := 'REPORTE DE MAYORES AHORRADORES CONSOLIDADO';
                 Close;
                 SQL.Clear;
                 SQL.Add('select sum(SALDO_ACTUAL) AS SALDO,NOMBRES,ID_PERSONA,ID_IDENTIFICACION,AG from "cap$saldogeneral" where TIPO_CUENTA > 1');
                 SQL.Add('group by NOMBRES,ID_PERSONA,ID_IDENTIFICACION,AG');
                 SQL.Add('order by sum(SALDO_ACTUAL) desc');
               end;
           1:  begin
                 modalidad := 'REPORTE DE MAYORES AHORRADORES EN APORTES SOCIALES';
                 ParamByName('TIPO').AsInteger := 1
               end;
           2 : begin
                 modalidad := 'REPORTE DE MAYORES AHORRADORES EN AHORRO RINDEDIARIO';
                 ParamByName('TIPO').AsInteger := 2
               end;
           3 : begin
                 modalidad := 'REPORTE DE MAYORES AHORRADORES EN AHORRO JUVENIL';
                 ParamByName('TIPO').AsInteger := 4
               end;
           4 : begin
                 modalidad := 'REPORTE DE MAYORES AHORRADORES EN AHORRO CONTRACTUAL';
                 ParamByName('TIPO').AsInteger := 5
               end;
           5 : begin
                 modalidad := 'REPORTE DE MAYORES AHORRADORES EN CDATs';
                 ParamByName('TIPO').AsInteger := 6
               end;
           end;
           Open;
           while not Eof do
           begin
             if CDcaptacion.RecordCount >= JVnumero.Value then
                Break;
             CDcaptacion.Append;
             CDcaptacion.FieldValues['No'] := CDcaptacion.RecordCount + 1;
             CDcaptacion.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
             CDcaptacion.FieldValues['nombres'] := FieldByName('NOMBRES').AsString;
             CDcaptacion.FieldValues['saldo'] := FieldByName('SALDO').AsCurrency;
             CDcaptacion.FieldValues['agencia'] := FieldByName('AG').AsInteger;
             CDcaptacion.FieldValues['captacion'] := CBtipo.Text;
             CDcaptacion.Post;
             Next;
           end;
        end;
        descripcion := modalidad + ' A CORTE DE ' + FormatDateTime('DD "de" MMMM "de" yyyy',DTfecha.DateTime);
        frReport3.ShowReport;
        BTExeL.Enabled := True;
end;

procedure TFrmCaptacionesRe.CBtipoClick(Sender: TObject);
begin
        BTExeL.Enabled := False;
        CDcaptacion.CancelUpdates;
end;

procedure TFrmCaptacionesRe.ExtraerRemoto(puerto: integer; Hostr,
  Desc_Agencia: string);
var     cadena :String;
        Astream1 :TMemoryStream;
        j,i :Integer;
        AList,AListCampos:TList;
begin
           DAgencia := Desc_Agencia;
           XmlPet := TsdXmlDocument.CreateName('query_info');
           XmlPet.XmlFormat := xfReadable;
           Nodo := XmlPet.Root.NodeNew('querys');
           Nodo1 := Nodo.NodeNew('query');
           Nodo1.WriteString('tipo','select');
           nodo1.WriteString('sentencia',sentencia);
           XmlPet.SaveToFile('c:\captacion.xml');
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
                //XmlRes.SaveToFile('c:\retorno12.xml');
                Disconnect;
                frmProgreso.Cerrar;
//**
//                XmlRes := TsdXmlDocument.Create;
//                XmlRes.LoadFromFile('c:\retorno12.xml');
//**
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
                    SQL.Add('insert into "cap$saldogeneral" values (:AG,:TIPO_CUENTA,:NUMERO,:DIGITO,:ID_PERSONA,:NOMBRES,:SALDO_ACTUAL,:ID_IDENTIFICACION,:FECHA,:FECHA_NACIMIENTO)');
                    ParamByName('AG').AsInteger := TXmlNode(AListCampos[0]).ValueAsInteger;
                    ParamByName('NUMERO').AsInteger := TXmlNode(AListCampos[1]).ValueAsInteger;
                    ParamByName('DIGITO').AsInteger := TXmlNode(AListCampos[2]).ValueAsInteger;
                    ParamByName('ID_PERSONA').AsString := TXmlNode(AListCampos[3]).ValueAsString;
                    ParamByName('NOMBRES').AsString := TXmlNode(AListCampos[6]).ValueAsString + ' ' + TXmlNode(AListCampos[4]).ValueAsString + ' ' + TXmlNode(AListCampos[5]).ValueAsString;
                    ParamByName('SALDO_ACTUAL').AsCurrency := TXmlNode(AListCampos[7]).ValueAsFloat;
                    ParamByName('TIPO_CUENTA').AsInteger := TXmlNode(AListCampos[8]).ValueAsInteger;
                    ParamByName('ID_IDENTIFICACION').AsInteger := TXmlNode(AListCampos[9]).ValueAsInteger;
                    ParamByName('FECHA').AsDate := DTfecha.Date;
                    ParamByName('FECHA_NACIMIENTO').AsDate := StrToDate(TXmlNode(AListCampos[10]).ValueAsString);
                    ExecSQL;
                  end;
                end;
                frmProgreso.Cerrar;
                SQLQuery1.Transaction.Commit;
                SQLQuery1.Transaction.StartTransaction;
             end;
           end;
end;

procedure TFrmCaptacionesRe.BTimportarClick(Sender: TObject);
var     Mensage :string;
begin
        with SQLQuery1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select distinct FECHA from "cap$saldogeneral"');
           Open;
           if RecordCount <> 0 then
           begin
             MessageDlg('Existen Datos En la Tabla, Debe Eliminarlos Primero',mtInformation,[mbok],0);
             Exit;
           end;
        Mensage := '';
//        sentencia := 'select * from SALDOS_CONSOLIDADOS('+ IntToStr(YearOf(DTfecha.Date)) + ',' + IntToStr(MonthOf(DTfecha.DateTime)) + ',' + '''' + FormatDateTime('yyyy/01/01',DTfecha.DateTime) + '''' + ',' + '''' + formatdatetime('yyyy/mm/dd',DTfecha.DateTime) + '''' );
        ShowMessage(sentencia);
        //Exit;
        SQL.Clear;
        SQL.Add('SELECT ');
        SQL.Add('  "gen$agencia".DESCRIPCION_AGENCIA,');
        SQL.Add('  "per$respaldo".RUTA,');
        SQL.Add('  "gen$agencia".ID_AGENCIA');
        SQL.Add('FROM');
        SQL.Add(' "gen$agencia"');
        SQL.Add(' INNER JOIN "per$respaldo" ON ("gen$agencia".ID_AGENCIA="per$respaldo".ID_AGENCIA)');
        Open;
        while not Eof do
        begin
          Extraer(FieldByName('ID_AGENCIA').AsInteger,FieldByName('DESCRIPCION_AGENCIA').AsString,FieldByName('RUTA').AsString);
          Next;
        end;
        end;
        {ExtraerLocal;
        try
          ExtraerRemoto(buscaservicio(2,1).vPuerto,buscaservicio(2,1).vHost,'ABREGO');
        except
          Mensage := 'ABREGO';
        end;
        try
          ExtraerRemoto(buscaservicio(3,1).vPuerto,buscaservicio(3,1).vHost,'CONVENCION');
        except
          Mensage := Mensage + ',' + 'CONVENCION';
        end;
        try
          ExtraerRemoto(buscaservicio(4,1).vPuerto,buscaservicio(4,1).vHost,'AGUACHICA');
        except
          Mensage := Mensage + ',' + 'AGUACHICA';
        end;}
        if Mensage <> '' then
           MessageDlg('No se Logro Comunicacion con: ' + Mensage,mtWarning,[mbok],0);


end;

procedure TFrmCaptacionesRe.IdTCPClient1Work(Sender: TObject;
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

procedure TFrmCaptacionesRe.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          if AWorkMode = wmRead then
          begin
            frmProgreso.Max := AWorkCountMax;
          end;
          frmProgreso.Titulo := 'Recibiendo de ' + DAgencia  +'... Tamaño: ' +  CurrToStr(AWorkCountMax/1000) + ' Kbs';
end;

procedure TFrmCaptacionesRe.ExtraerLocal;
begin
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Procesando Información... OCAÑA';
        SQLQuery1.Close;
        SQLQuery1.SQL.Clear;
        SQLQuery1.SQL.Add(sentencia);
        SQLQuery1.Open;
        SQLQuery1.Last;
        SQLQuery1.First;
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
            SQL.Add('insert into "cap$saldogeneral" values (:AG,:TIPO_CUENTA,:NUMERO,:DIGITO,:ID_PERSONA,:NOMBRES,:SALDO_ACTUAL,:ID_IDENTIFICACION,:FECHA,:FECHA_NACIMIENTO)');
            ParamByName('AG').AsInteger := SQLQuery1.FieldByName('AG').AsInteger;
            ParamByName('NUMERO').AsInteger := SQLQuery1.FieldByName('NUMERO').AsInteger;
            ParamByName('DIGITO').AsInteger := SQLQuery1.FieldByName('DIGITO').AsInteger;
            ParamByName('ID_PERSONA').AsString := SQLQuery1.FieldByName('ID_PERSONA').AsString;
            ParamByName('NOMBRES').AsString := SQLQuery1.FieldByName('NOMBRE').AsString + ' ' + SQLQuery1.FieldByName('PRIMER_APELLIDO').AsString + ' ' + SQLQuery1.FieldByName('SEGUNDO_APELLIDO').AsString;
            ParamByName('SALDO_ACTUAL').AsCurrency := SQLQuery1.FieldByName('SALDOACTUAL').AsCurrency;
            ParamByName('TIPO_CUENTA').AsInteger := SQLQuery1.FieldByName('TIPO_CUENTA').AsInteger;
            ParamByName('ID_IDENTIFICACION').AsInteger := SQLQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('FECHA').AsDate := DTfecha.Date;
            ParamByName('FECHA_NACIMIENTO').AsDate := SQLQuery1.FieldByName('FECHA_NACIMIENTO').AsDateTime;
            ExecSQL;

          end;
          SQLQuery1.Next;
        end;
        frmProgreso.Cerrar;
        SQLQuery2.Transaction.Commit;
        SQLQuery2.Transaction.StartTransaction;
end;

procedure TFrmCaptacionesRe.BTeliminaClick(Sender: TObject);
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
            SQL.Add('delete from "cap$saldogeneral"');
            ExecSQL;
            Transaction.Commit;
            Transaction.StartTransaction;
        end;
       end;

end;

procedure TFrmCaptacionesRe.FormCreate(Sender: TObject);
begin
        with SQLQuery1 do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select distinct FECHA from "cap$saldogeneral"');
           Open;
           if RecordCount <> 0 then
           begin
             if not (FieldByName('FECHA').IsNull) then
                DTfecha.Date := FieldByName('FECHA').AsDateTime
             else
                DTfecha.Date := Date;
           end
           else DTfecha.Date := Date;

        end;

end;

procedure TFrmCaptacionesRe.frReport3GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'descripcion' then
           ParValue := descripcion;
end;

procedure TFrmCaptacionesRe.BTExeLClick(Sender: TObject);
var
  ExcelFile:TDataSetToExcel;
begin
        CDcaptacion.Last;
        CDcaptacion.First;
        SDdialogo.Filter := 'Archivos Excel (*.xls)|*.XLS';
        if SDdialogo.Execute then
        begin
          ExcelFile := TDataSetToExcel.Create(CDcaptacion,SDdialogo.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

procedure TFrmCaptacionesRe.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmCaptacionesRe.Extraer(vIdAgencia: integer; vDesc,
  vRuta: string);
  var
  DBpath :string;
  i :Integer;
  vSaldo :Currency;
begin
   DBpath := vRuta + '0' + IntToStr(vIdAgencia) + FormatCurr('00',MonthOf(DTfecha.Date)) + FormatCurr('0000',YearOf(DTfecha.Date)) + '/';
   Database.DataBaseName := DBpath + 'database.fdb';
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   try
     Database.Connected := True;
   except
     raise;
   end;
   IBData.Close;
   if IBData.Transaction.InTransaction then
      IBData.Transaction.Commit;
     IBData.Transaction.StartTransaction;
     IBData.SQL.Clear;
     IBData.SQL.Add('SELECT "cap$maestro".ID_AGENCIA AS AG, "cap$maestro".ID_TIPO_CAPTACION AS TIPO_CUENTA, "cap$maestro".NUMERO_CUENTA AS NUMERO, "cap$maestro".DIGITO_CUENTA AS DIGITO,');
     IBData.SQL.Add('"cap$maestrotitular".ID_PERSONA,"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE,"gen$persona".FECHA_NACIMIENTO, "cap$maestro".VALOR_INICIAL,"cap$maestrotitular".ID_IDENTIFICACION');
     IBData.SQL.Add('FROM "cap$maestro"');
     IBData.SQL.Add('LEFT JOIN "cap$maestrotitular" ON (("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
     IBData.SQL.Add('AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA))');
     IBData.SQL.Add('LEFT JOIN "gen$persona" ON (("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA))');
     IBData.SQL.Add('WHERE "cap$maestrotitular".NUMERO_TITULAR = 1 AND "cap$maestro".id_estado IN (1,3,4,6,12,13,14)');
     IBData.SQL.Add('ORDER BY "cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA, "cap$maestro".DIGITO_CUENTA');
     IBData.Open;
     IBData.Last;
     IBData.First;
     frmProgreso := TfrmProgreso.Create(Self);
     frmProgreso.Max := IBData.RecordCount;
     frmProgreso.Titulo := 'Extrayendo Informacion de '  + vDesc + ' Tipo = 1';
     frmProgreso.Min := 0;
     frmProgreso.Ejecutar;
     frmProgreso.Position := 0;
     while not IBData.Eof do
     begin
       frmProgreso.Position := IBData.RecNo;
       frmProgreso.InfoLabel := 'Registro No : ' + IntToStr(IBData.RecNo);
       Application.ProcessMessages;
       vSaldo := 0;
       if IBData.FieldByName('TIPO_CUENTA').AsInteger < 6 then
       begin
         with IBpro do
         begin
             StoredProcName := 'SALDO_MES';
             Prepared := True;
             Params[1].AsInteger := IBData.FieldByName('AG').AsInteger;
             Params[2].AsInteger := IBData.FieldByName('TIPO_CUENTA').AsInteger;
             Params[3].AsInteger := IBData.FieldByName('NUMERO').AsInteger;
             Params[4].AsInteger := IBData.FieldByName('DIGITO').AsInteger;
             Params[5].AsDateTime := StrToDate('2007/08/01');//StrToDate(IntToStr(YearOf(fFechaActual)) + '/01/01') + StrToTime('00:59:59');
             Params[6].AsDateTime := StrToDate('2007/08/31');//StrToDate(IntToStr(YearOf(fFechaActual)) + '/12/31') + StrToTime('23:59:59');
             Params[7].AsInteger := 2007;
             Params[8].AsInteger := 8;
             ExecProc;
             vSaldo := Params[0].AsCurrency;
         end; // FIN DEL PROCEDIMIENTO
       end // fin del if
       else
       begin
         with IBQuery1 do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select VALOR_INICIAL from "cap$causacioncdat" WHERE ANO = :ANO and MES = :MES AND NUMERO_CUENTA = :NUMERO_CUENTA AND DIGITO_CUENTA = :DIGITO_CUENTA AND ID_TIPO_CAPTACION = :TIPO');
           ParamByName('NUMERO_CUENTA').AsInteger := IBData.FieldByName('NUMERO').AsInteger;;
           ParamByName('ANO').AsInteger := 2007;
           ParamByName('MES').AsInteger := 8;
           ParamByName('DIGITO_CUENTA').AsInteger := IBData.FieldByName('DIGITO').AsInteger;
           ParamByName('TIPO').AsInteger := 6;
           Open;
           vSaldo := FieldByName('VALOR_INICIAL').AsCurrency;
         end;
       end;
       with SQLQuery2 do
       begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "cap$saldogeneral" values (:AG,:TIPO_CUENTA,:NUMERO,:DIGITO,:ID_PERSONA,:NOMBRES,');
          SQL.Add(':SALDO_ACTUAL,:ID_IDENTIFICACION,:FECHA,:FECHA_NACIMIENTO)');
          ParamByName('AG').AsInteger := IBData.FieldByName('AG').AsInteger;
          ParamByName('TIPO_CUENTA').AsInteger := IBData.FieldByName('TIPO_CUENTA').AsInteger;
          ParamByName('NUMERO').AsInteger := IBData.FieldByName('NUMERO').AsInteger;
          ParamByName('DIGITO').AsInteger := IBData.FieldByName('DIGITO').AsInteger;
          ParamByName('ID_PERSONA').AsString := IBData.FieldByName('ID_PERSONA').AsString;
          ParamByName('NOMBRES').AsString := IBData.FieldByName('NOMBRE').AsString + ' ' + IBData.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBData.FieldByName('SEGUNDO_APELLIDO').AsString;
          ParamByName('SALDO_ACTUAL').AsCurrency := vSaldo;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBData.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('FECHA').AsDate := DTfecha.Date;
          ParamByName('FECHA_NACIMIENTO').AsDate := IBData.FieldByName('FECHA_NACIMIENTO').AsDateTime;
          try
            ExecSQL;
          except
            Memo1.Lines.Add(IBData.FieldByName('TIPO_CUENTA').AsString + ' ' + IBData.FieldByName('NUMERO').AsString);
          end; // FIN DEL TRY
       end; // FIN DEL SQLQUERY 2
      IBData.Next;
         end; // FIN DEL WHILE
     frmProgreso.Cerrar;
     IBData.Transaction.Commit;

   Database.Connected := False;
end;

end.
