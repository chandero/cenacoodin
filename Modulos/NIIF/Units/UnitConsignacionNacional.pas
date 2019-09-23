unit UnitConsignacionNacional;

interface

uses
  Windows, Messages, SysUtils, StrUtils,Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, JvStringGrid, DB, IBCustomDataSet, IBQuery,
  DBCtrls, StdCtrls, JvEdit, JvTypedEdit, Buttons, XStringGrid, CECheckList,
  IBSQL, IBDatabase, Math, pr_Common, pr_TxClasses, ComCtrls, JvComponent,
  JvSimpleXml, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, sdXmlDocuments;

type
  TfrmConsignacionNacional = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SGCons: TJvStringGrid;
    IBQBancos: TIBQuery;
    IBQTipoAhorro: TIBQuery;
    DBLCBBancos: TDBLookupComboBox;
    DSBancos: TDataSource;
    DSTipoAhorro: TDataSource;
    DBLCBTipoAhorro: TDBLookupComboBox;
    chkCredito: TCheckBox;
    cmdCerrar: TBitBtn;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    DBLCBAgencia: TDBLookupComboBox;
    IBQAgencia: TIBQuery;
    DSAgencia: TDataSource;
    cmdProcesar: TBitBtn;
    cmdReporte: TBitBtn;
    Label1: TLabel;
    EdTotalConsignaciones: TStaticText;
    IBComprobante: TIBQuery;
    CBNotas: TComboBox;
    Label2: TLabel;
    IBAuxiliar: TIBQuery;
    IBAuxiliar1: TIBQuery;
    reporte: TprTxReport;
    EdFecha: TDateTimePicker;
    IdTCPClient1: TIdTCPClient;
    ADoc: TJvSimpleXml;
    statusBar: TStatusBar;
    ProgressBar1: TProgressBar;
    procedure SGConsGetCellAlignment(Sender: TJvStringGrid; AColumn,
      ARow: Integer; State: TGridDrawState; var CellAlignment: TAlignment);
    procedure SGConsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SGConsExitCell(Sender: TJvStringGrid; AColumn, ARow: Integer;
      const EditText: String);
    procedure DBLCBBancosExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBBancosEnter(Sender: TObject);
    procedure DBLCBTipoAhorroEnter(Sender: TObject);
    procedure cmdCerrarClick(Sender: TObject);
    procedure chkCreditoExit(Sender: TObject);
    procedure SGConsClick(Sender: TObject);
    procedure DBLCBAgenciaExit(Sender: TObject);
    procedure DBLCBAgenciaEnter(Sender: TObject);
    procedure DBLCBTipoAhorroExit(Sender: TObject);
    procedure SGConsGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure chkCreditoClick(Sender: TObject);
    procedure SGConsKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmdProcesarClick(Sender: TObject);
    procedure cmdReporteClick(Sender: TObject);
    procedure reporteInitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure EdFechaExit(Sender: TObject);
    procedure statusBarDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
    procedure Inicializar;
    procedure AdicionarBanco(ARow:Integer);
    procedure AdicionarTipoAhorro(ARow:Integer);
    procedure AdicionarCredito(ARow:Integer);
    procedure AdicionarAgencia(ARow: integer);
    procedure AdicionarFecha(ARow: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

type
  PTablaConNal=^TablaConNal;
  TablaConNal=record
     IdBanco    :Integer;
     DeBanco    :string;
     IdTipo     :Integer;
     DeTipo     :string;
     IdAgencia  :Integer;
     DeAgencia  :string;
     Cuenta     :Integer;
     IdIdent    :Integer;
     IdPerso    :string;
     IdDest     :Integer;
     DeDest     :string;
     Valor      :Currency;
     Comis      :Currency;
     ComisBanco :Currency;
     ComisLocal :Currency;
     Comprobante:Integer;
     Fecha      :TDate;
  end;

var
  frmConsignacionNacional: TfrmConsignacionNacional;
  CscBanco:Integer;
  Lista:TList;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmConsignacionNacional.Inicializar;
var AR:PTablaConNal;
begin
        SGCons.ColCount := 9;
        SGCons.RowCount := 2;


        SGCons.Cells[0,0] := 'Banco';
        SGCons.Cells[1,0] := 'Tipo';
        SGCons.Cells[2,0] := 'Agencia';
        SGCons.Cells[3,0] := 'Cuenta';
        SGCons.Cells[4,0] := 'Nombre';
        SGCons.Cells[5,0] := 'Es Ahorro';
        SGCons.Cells[6,0] := 'Valor';
        SGCons.Cells[7,0] := 'C Banco';
        SGCons.Cells[8,0] := 'Fecha';

        SGCons.ColWidths[0] := 100;
        SGCons.ColWidths[1] := 100;
        SGCons.ColWidths[2] := 80;
        SGCons.ColWidths[3] := 50;
        SGCons.ColWidths[4] := 190;
        SGCons.ColWidths[5] := 50;
        SGCons.ColWidths[6] := 70;
        SGCons.ColWidths[7] := 60;
        SGCons.ColWidths[8] := 60;


        AdicionarBanco(1);
        AdicionarTipoAhorro(1);
        AdicionarAgencia(1);
        AdicionarCredito(1);
        AdicionarFecha(1);

        try
         (SGCons.Objects[0,1] as TDBLookupComboBox).SetFocus;
        finally
        end;


        with IBQBancos do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
        end;

        IBQBancos.Open;
        IBQBancos.Last;
        IBQTipoAhorro.Open;
        IBQTipoAhorro.Last;
        IBQAgencia.Open;
        IBQAgencia.Last;

        Lista.Clear;
        New(AR);
        AR^.IdBanco := -1;
        AR^.DeBanco := '';
        AR^.IdTipo := -1;
        AR^.DeTipo := '';
        AR^.IdAgencia := 0;
        AR^.DeAgencia := '';
        AR^.Cuenta := 0;
        AR^.IdIdent := 0;
        AR^.IdPerso := '';
        AR^.IdDest := -1;
        AR^.DeDest := '';
        AR^.Valor  := 0;
        AR^.Comis  := 0;
        Lista.Add(AR);

end;

procedure TfrmConsignacionNacional.SGConsGetCellAlignment(
  Sender: TJvStringGrid; AColumn, ARow: Integer; State: TGridDrawState;
  var CellAlignment: TAlignment);
begin
        if ARow = 0 then
           CellAlignment := taCenter;
        if ARow > 0 then
        if AColumn < 5 then
           CellAlignment := taLeftJustify
        else
           CellAlignment := taRightJustify;

end;

procedure TfrmConsignacionNacional.SGConsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
begin
        if ((ACol = 0) or (ACol = 1) or (ACol = 2) or (ACol = 4) or (ACol = 5)) then begin
          CanSelect := False;
          Exit;
        end;
{        if (ACol = 0) and (ARow > 0) then
        begin
                R := SGCons.CellRect(ACol,ARow);
                R.Left := R.Left + SGCons.Left;
                R.Right := R.Right + SGCons.Left;
                R.Top := R.Top + SGCons.Top;
                R.Bottom := R.Bottom + SGCons.Top;
                DBLCBBancos.Left := R.Left+1;
                DBLCBBancos.Top := R.Top + 1;
                DBLCBBancos.Width := (R.Right + 1) - R.Left;
                DBLCBBancos.Height := (R.Bottom + 1) - R.Top;
                DBLCBBancos.Visible := True;
                DBLCBBancos.SetFocus;

        end;
        if (ACol = 1) and (ARow > 0) then
        begin
                R := SGCons.CellRect(ACol,ARow);
                R.Left := R.Left + SGCons.Left;
                R.Right := R.Right + SGCons.Left;
                R.Top := R.Top + SGCons.Top;
                R.Bottom := R.Bottom + SGCons.Top;
                DBLCBTipoAhorro.Left := R.Left+1;
                DBLCBTipoAhorro.Top := R.Top + 1;
                DBLCBTipoAhorro.Width := (R.Right + 1) - R.Left;
                DBLCBTipoAhorro.Height := (R.Bottom + 1) - R.Top;
                DBLCBTipoAhorro.Visible := True;
                DBLCBTipoAhorro.SetFocus;
        end;

        if (ACol = 4) and (ARow > 0) then
        begin
                R := SGCons.CellRect(ACol,ARow);
                R.Left := R.Left + SGCons.Left;
                R.Right := R.Right + SGCons.Left;
                R.Top := R.Top + SGCons.Top;
                R.Bottom := R.Bottom + SGCons.Top;
                CBDestino.Left := R.Left+1;
                CBDestino.Top := R.Top + 1;
                CBDestino.Width := (R.Right + 1) - R.Left;
                CBDestino.Height := (R.Bottom + 1) - R.Top;
                CBDestino.Visible := True;
                CBDestino.SetFocus;
        end;

        if (ACol = 2) and (ARow > 0) then
        begin
                R := SGCons.CellRect(ACol,ARow);
                R.Left := R.Left + SGCons.Left;
                R.Right := R.Right + SGCons.Left;
                R.Top := R.Top + SGCons.Top;
                R.Bottom := R.Bottom + SGCons.Top;
                EdCuenta.Left := R.Left+1;
                EdCuenta.Top := R.Top + 1;
                EdCuenta.Width := (R.Right + 1) - R.Left;
                EdCuenta.Height := (R.Bottom + 1) - R.Top;
                EdCuenta.Visible := True;
                EdCuenta.SetFocus;
        end;

        if ((ACol = 5) or (ACol = 6)) and (ARow > 0) then
        begin
                R := SGCons.CellRect(ACol,ARow);
                R.Left := R.Left + SGCons.Left;
                R.Right := R.Right + SGCons.Left;
                R.Top := R.Top + SGCons.Top;
                R.Bottom := R.Bottom + SGCons.Top;
                EdValor.Left := R.Left+1;
                EdValor.Top := R.Top + 1;
                EdValor.Width := (R.Right + 1) - R.Left;
                EdValor.Height := (R.Bottom + 1) - R.Top;
                EdValor.Visible := True;
                EdValor.SetFocus;
        end;
}
        CanSelect := True;
end;

procedure TfrmConsignacionNacional.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmConsignacionNacional.AdicionarBanco(ARow:Integer);
var NuevoDblcb:TDBLookupComboBox;
    R :TRect;
begin
        NuevoDblcb := TDBLookupComboBox.Create(Application);
        NuevoDblcb.Width := 0;
        NuevoDblcb.Tag := ARow;
        NuevoDblcb.OnExit := DBLCBBancos.OnExit;
        NuevoDblcb.OnEnter := DBLCBBancos.OnEnter;
        NuevoDblcb.ListSource := DBLCBBancos.ListSource;
        NuevoDblcb.ListField := DBLCBBancos.ListField;
        NuevoDblcb.KeyField := DBLCBBancos.KeyField;
        NuevoDblcb.Parent := SGCons;
        NuevoDblcb.TabStop := False;
        NuevoDblcb.DropDownWidth := 120;
        SGCons.Objects[0,ARow] := NuevoDblcb;
        R := SGCons.CellRect(0,ARow);
        NuevoDblcb.Left := SGCons.Left + R.Left;// + 1;
        NuevoDblcb.Top := SGCons.Top + R.Top;// + 1;
        NuevoDblcb.Width := R.Right - (R.Left + 0);
        NuevoDblcb.Height := R.Bottom  - (R.Top + 0);
        NuevoDblcb.Visible := True;
end;


procedure TfrmConsignacionNacional.FormCreate(Sender: TObject);
var
  ProgressBarStyle: integer;

begin
  Lista := TList.Create;
  //enable status bar 2nd Panel custom drawing
  StatusBar.Panels[1].Style := psOwnerDraw;

  //place the progress bar into the status bar
  ProgressBar1.Parent := StatusBar;

  //remove progress bar border
  ProgressBarStyle := GetWindowLong(ProgressBar1.Handle,
                                    GWL_EXSTYLE);
  ProgressBarStyle := ProgressBarStyle
                      - WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar1.Handle,
                GWL_EXSTYLE,
                ProgressBarStyle);
end;

procedure TfrmConsignacionNacional.SGConsExitCell(Sender: TJvStringGrid;
  AColumn, ARow: Integer; const EditText: String);
var AR:PTablaConNal;
    Text:string;
    Tipo:Integer;
    Cuenta:string;
    Digito:Integer;
    Veces:Integer;
    Query,Retorno:TStringList;
    Root:TJvSimpleXmlElemClassic;
    ANode:TJvSimpleXmlElemClassic;
    Nodo:TJvSimpleXmlElemClassic;
    Host:string;
    Port:Integer;
    i,inic:Integer;
    Cadena:string;
    Size:Integer;
    AStream:TMemoryStream;
    RDoc :TsdXmlDocument;
//    RDoc:TJvSimpleXml;
    Total :Integer;
    ReNodo:TXmlNode;
    ReNodo1:TXmlNode;
    ReNodo2:TXmlNode;
    Campos:Integer;
begin
        if (AColumn = 3) then begin
            AR := Lista.Items[ARow - 1];
            if AR^.IdAgencia = Agencia then begin
             Text := EditText;
             if Text = '' then Text := '0';
             with IBSQL1 do begin
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select');
                SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                SQL.Add('"gen$persona".NOMBRE,');
                SQL.Add('"gen$persona".ID_IDENTIFICACION,');
                SQL.Add('"gen$persona".ID_PERSONA,');
                SQL.Add('"cap$tiposestado".SE_SUMA');
                SQL.Add('from "cap$maestro"');
                SQL.Add('inner join "cap$maestrotitular" on (');
                SQL.Add('"cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
                SQL.Add('inner join "gen$persona" on (');
                SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
                SQL.Add('inner join "cap$tiposestado" on (');
                SQL.Add('"cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                SQL.Add('where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := (SGCons.Objects[1,ARow] as TDBLookupComboBox).KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(Text);
                Tipo := (SGCons.Objects[1,ARow] as TDBLookupComboBox).KeyValue;
                Cuenta := Format('%.7d',[StrToInt(Text)]);
                Digito := StrToInt(DigitoControl(Tipo,Cuenta));
                ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                  ExecQuery;
                  if RecordCount > 0 then
                  begin
                    if FieldByName('SE_SUMA').AsInteger = 0 then
                    begin
                       Transaction.Commit;
                       MessageDlg('Esta Cuenta No Permite Movimiento!',mterror,[mbcancel],0);
                       SGCons.Cells[AColumn,ARow] := '';
                       Exit;
                    end
                    else
                    begin
                       SGCons.Cells[AColumn,ARow] := Format('%.7d',[StrtoInt(Text)]);
                       SGCons.Cells[4,ARow] := Trim(FieldByName('NOMBRE').AsString + ' '+
                                                    FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                    FieldByName('SEGUNDO_APELLIDO').AsString);
                       AR^.IdIdent := FieldByName('ID_IDENTIFICACION').AsInteger;
                       AR^.IdPerso := FieldByName('ID_PERSONA').AsString;
                       AR^.Cuenta := StrToInt(Cuenta);
                    end;
                  end
                  else
                  begin
                       Transaction.Commit;
                       MessageDlg('Esta Cuenta No Existe!',mtError,[mbcancel],0);
                       SGCons.Cells[AColumn,ARow] := '';
                       Exit;
                  end;
                except
                  Transaction.Rollback;
                  raise;
                  Exit;
                end;
               Transaction.Commit;
             end;
            end
            else
            begin
              if not IBSQL1.Transaction.InTransaction then
                     IBSQL1.Transaction.StartTransaction;
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select * from "gen$agencia" where "gen$agencia".ID_AGENCIA = :ID_AGENCIA and "gen$agencia".ACTIVA = 1');
              IBSQL1.ParamByName('ID_AGENCIA').AsInteger := AR^.IdAgencia;
              try
               IBSQL1.ExecQuery;
              except
               IBSQL1.Transaction.Rollback;
               raise;
               Exit;
              end;
              if IBSQL1.RecordCount > 0 then
              begin
               IBSQL1.Transaction.Commit;
               Text := EditText;
               Query := TStringList.Create;
               Query.Text := '';
               Query.Add('select');
               Query.Add('"gen$persona".PRIMER_APELLIDO,');
               Query.Add('"gen$persona".SEGUNDO_APELLIDO,');
               Query.Add('"gen$persona".NOMBRE,');
               Query.Add('"gen$persona".ID_IDENTIFICACION,');
               Query.Add('"gen$persona".ID_PERSONA,');
               Query.Add('"cap$tiposestado".SE_SUMA');
               Query.Add('from "cap$maestro"');
               Query.Add('inner join "cap$maestrotitular" on (');
               Query.Add('"cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
               Query.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
               Query.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
               Query.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
               Query.Add('inner join "gen$persona" on (');
               Query.Add('"cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
               Query.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
               Query.Add('inner join "cap$tiposestado" on (');
               Query.Add('"cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
               Query.Add('where');
               Query.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
               Query.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
               Query.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
               Query.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');

               Tipo := (SGCons.Objects[1,ARow] as TDBLookupComboBox).KeyValue;
               Cuenta := Format('%.7d',[StrToInt(Text)]);
               Digito := strtoint(DigitoControl(Tipo,Cuenta));

               Query.Text := StringReplace(Query.Text,':ID_AGENCIA',IntToStr(AR^.IdAgencia),[rfReplaceAll]);
               Query.Text := StringReplace(Query.Text,':ID_TIPO_CAPTACION',IntToStr(Tipo),[rfReplaceAll]);
               Query.Text := StringReplace(Query.Text,':NUMERO_CUENTA',Cuenta,[rfReplaceAll]);
               Query.Text := StringReplace(Query.Text,':DIGITO_CUENTA',IntToStr(Digito),[rfReplaceAll]);

               RDoc := TsdXmlDocument.Create;
               ADoc.Root.Clear;
               ADoc.Root.Name := 'query_info';
               ANode := ADoc.Root.Items.Add('querys');
               Nodo := ANode.Items.Add('query');
               Nodo.Items.Add('tipo','select');
               Nodo.Items.Add('sentencia',Query.Text);
//               ADoc.SaveToFile('C:\QueryConNal.xml');

               with IdTCPClient1 do
               begin
                 Host := IBSQL1.FieldByName('HOST').AsString;
                 Port := IBSQL1.FieldByName('PORT').AsInteger;
                 Application.ProcessMessages;
                 try
                  Connect;
                  if Connected then
                  begin
                     statusBar.Panels[0].Text := 'Recibiendo Informacion...';
                     Application.ProcessMessages;
                     Cadena := ReadLn();
                     AStream := TMemoryStream.Create;
                     ADoc.SaveToStream(AStream);
                     AStream.Seek(0,soFromEnd);
                     Size := AStream.Size;
                     WriteInteger(Size,True);
                     Application.ProcessMessages;
                     OpenWriteBuffer;
                     WriteStream(AStream);
                     Application.ProcessMessages;
                     CloseWriteBuffer;
                     FreeAndNil(AStream);
                     Application.ProcessMessages;
                     Size := ReadInteger(True);
                     Application.ProcessMessages;
                     AStream := TMemoryStream.Create;
                     ReadStream(AStream,Size,False);
                     Application.ProcessMessages;
                     RDoc.Root.Clear;
                     RDoc.LoadFromStream(AStream);
//                     RDoc.SaveToFile('C:\resConNal.xml');
                     Disconnect;
                  end // Connected IdTCPClient1
                 except
                     MessageDlg('No se pudo verificar oficina: '+ IBSQL1.Fieldbyname('DESCRIPCION_AGENCIA').AsString,
                           mtError,[mbOk],0);
                 end;
               end; // with IdTCPClient1
               // Leer Cantidad de Campos del Registro
               Campos := RDoc.Root.Nodes[0].ReadAttributeInteger('campos');
               if Campos > 0 then
               begin

                   if RDoc.Root.Nodes[0].Nodes[0].Nodes[5].ValueAsInteger = 0 then
                   begin
                       MessageDlg('Esta Cuenta No Permite Movimiento!',mterror,[mbcancel],0);
                       SGCons.Cells[AColumn,ARow] := '';
                       Exit;
                   end;

                   AR^.IdIdent := RDoc.Root.Nodes[0].Nodes[0].Nodes[3].ValueAsInteger;
                   AR^.IdPerso := RDoc.Root.Nodes[0].Nodes[0].Nodes[4].ValueAsString;
                   AR^.Cuenta := StrToInt(Cuenta);

                   SGCons.Cells[AColumn,ARow] := Format('%.7d',[StrtoInt(Text)]);
                   SGCons.Cells[4,ARow] := Trim(RDoc.Root.Nodes[0].Nodes[0].Nodes[2].ValueAsString + ' '+
                                                RDoc.Root.Nodes[0].Nodes[0].Nodes[0].ValueAsString + ' ' +
                                                RDoc.Root.Nodes[0].Nodes[0].Nodes[1].ValueAsString);


               end // if Campos > 0
               else
               begin
                  SGCons.Cells[AColumn,ARow] := Format('%.7d',[StrtoInt(Text)]);
                  SGCons.Cells[4,ARow] := 'OTRA AGENCIA';
                  Cuenta := Format('%.7d',[StrToInt(Text)]);
                  AR^.IdIdent := 0;
                  AR^.IdPerso := '';
                  AR^.Cuenta := StrToInt(Cuenta);
               end; // else Campos > 0
              end // RecordCount > 0
              else
              begin
               Text := EditText;
               SGCons.Cells[AColumn,ARow] := Format('%.7d',[StrtoInt(Text)]);
               SGCons.Cells[4,ARow] := 'OTRA AGENCIA';
               Cuenta := Format('%.7d',[StrToInt(Text)]);
               AR^.IdIdent := 0;
               AR^.IdPerso := '';
               AR^.Cuenta := StrToInt(Cuenta);
              end // del if RecordCount > 0
            end // if Agencia = idAgencia
        end;

        if (AColumn = 6) or (AColumn = 7) then begin
          Text := EditText;
          if Text = '' then Text := '0';
          SGCons.Cells[AColumn,ARow] := FormatCurr('$#,0.00',StrToCurr(Text));
        end;

        if AColumn = 3 then
           (SGCons.Objects[5,ARow] as TCheckBox).SetFocus;
        if AColumn = 6 then begin
           AR := Lista.Items[ARow-1];
           AR^.Valor := StrToCurr(EditText);
           SGCons.Col := 7;
           with IBSQL1 do begin
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('select * from "gen$minimos" where ID_MINIMO = 3');
             try
               ExecQuery;
               if RecordCount > 0 then
                  Veces := FieldByName('VALOR_MINIMO').AsInteger
               else
                  Veces := 1;
               Transaction.Commit;
             except
               Transaction.Rollback;
               raise;
               Exit;
             end;
           end;

           with IBSQL1 do begin
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('select * from "gen$bancosconnal" where ID_BANCO = :ID_BANCO');
             ParamByName('ID_BANCO').AsInteger := AR^.IdBanco;
             try
              ExecQuery;
//              AR^.ComisBanco := FieldByName('COMISION').AsCurrency;
              AR^.ComisLocal := SimpleRoundTo((AR^.Valor / 1000) * Veces,0);
              if AR^.ComisLocal < FieldByName('COMISIONLOCAL').AsCurrency then
                 AR^.ComisLocal := FieldByName('COMISIONLOCAL').AsCurrency;
//            AR^.Comis := AR^.ComisBanco;
//            SGCons.Cells[7,SGCons.RowCount - 1] := FormatCurr('$#,0.00',AR^.Comis);
             Transaction.Commit;
             except
              Transaction.Rollback;
              raise;
              Exit;
             end;
         end;

        end;

        if (AColumn = 7 ) then
         begin
           SGCons.Col := 8;
//           SGCons.Row := (Sender as TDBLookupComboBox).Tag;
          (SGCons.Objects[8,SGCons.Row] as TDateTimePicker).SetFocus;
         end;

        if (AColumn = 8) and (ARow = (SGCons.RowCount - 1)) then begin
           AR := Lista.Items[ARow-1];
           AR^.Comis := StrToCurr(EditText);
           EdTotalConsignaciones.Caption := IntToStr(Lista.Count);
           SGCons.RowCount := SGCons.RowCount + 1;
           Application.ProcessMessages;
           New(AR);
           AR^.IdBanco := -1;
           AR^.DeBanco := '';
           AR^.IdTipo := -1;
           AR^.DeTipo := '';
           AR^.IdAgencia := 0;
           AR^.DeAgencia := '';
           AR^.IdIdent := 0;
           AR^.IdPerso := '';
           AR^.Cuenta := 0;
           AR^.IdDest := -1;
           AR^.DeDest := '';
           AR^.Valor  := 0;
           AR^.Comis  := 0;
           Lista.Add(AR);
           SGCons.Col := 0;
           adicionarbanco(SGCons.RowCount - 1);
           adicionartipoahorro(SGCons.RowCount - 1);
           AdicionarAgencia(SGCons.RowCount - 1);
           adicionarcredito(SGCons.RowCount - 1);
           cmdProcesar.Enabled := True;
        end;
        if (AColumn = 8) then
           (SGCons.Objects[0,SGCons.Row+1] as TDBLookupComboBox).SetFocus;



end;

procedure TfrmConsignacionNacional.DBLCBBancosExit(Sender: TObject);
var AR:PTablaConNal;
    Veces:Integer;
begin
        if (Sender as TDBLookupComboBox).Text = '' then Exit;

        try
         AR := Lista.Items[(Sender as TDBLookupComboBox).Tag-1];
         AR^.IdBanco := (Sender as TDBLookupComboBox).KeyValue;
         AR^.DeBanco := (Sender as TDBLookupComboBox).Text;
         with IBSQL1 do begin
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from "gen$minimos" where ID_MINIMO = 3');
           try
             ExecQuery;
             if RecordCount > 0 then
                Veces := FieldByName('VALOR_MINIMO').AsInteger
             else
                Veces := 1;
             Transaction.Commit;
           except
             Transaction.Rollback;
             raise;
             Exit;
           end;
         end;
         with IBSQL1 do begin
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from "gen$bancosconnal" where ID_BANCO = :ID_BANCO');
           ParamByName('ID_BANCO').AsInteger := AR^.IdBanco;
           try
            ExecQuery;
            AR^.ComisBanco := FieldByName('COMISION').AsCurrency;
            AR^.ComisLocal := SimpleRoundTo((AR^.Valor / 1000) * Veces,0);
            if AR^.ComisLocal < FieldByName('COMISIONLOCAL').AsCurrency then
               AR^.ComisLocal := FieldByName('COMISIONLOCAL').AsCurrency;
//            AR^.Comis := AR^.ComisBanco;
//            SGCons.Cells[7,SGCons.RowCount - 1] := FormatCurr('$#,0.00',AR^.Comis);
           Transaction.Commit;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
         end;
         SGCons.Row := (Sender as TDBLookupComboBox).Tag;
         (SGCons.Objects[1,SGCons.Row] as TDBLookupComboBox).SetFocus;
        finally
        end;
end;

procedure TfrmConsignacionNacional.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmConsignacionNacional.DBLCBBancosEnter(Sender: TObject);
begin
        (Sender as TDBLookupComboBox).DropDown;
end;

procedure TfrmConsignacionNacional.DBLCBTipoAhorroEnter(Sender: TObject);
begin
        (Sender as TDBLookupComboBox).DropDown;
end;

procedure TfrmConsignacionNacional.AdicionarTipoAhorro(ARow:Integer);
var NuevoDblcb:TDBLookupComboBox;
    R :TRect;
begin
        NuevoDblcb := TDBLookupComboBox.Create(Application);
        NuevoDblcb.Width := 0;
        NuevoDblcb.Visible := False;
        NuevoDblcb.Tag := ARow;
        NuevoDblcb.OnExit := DBLCBTipoAhorro.OnExit;
        NuevoDblcb.OnEnter := DBLCBTipoAhorro.OnEnter;
        NuevoDblcb.ListSource := DBLCBTipoAhorro.ListSource;
        NuevoDblcb.ListField := DBLCBTipoAhorro.ListField;
        NuevoDblcb.KeyField := DBLCBTipoAhorro.KeyField;
        NuevoDblcb.Parent := SGCons;
        NuevoDblcb.TabStop := False;
        NuevoDblcb.DropDownWidth := 120;
        SGCons.Objects[1,ARow] := NuevoDblcb;
        R := SGCons.CellRect(1,ARow);
        NuevoDblcb.Left := SGCons.Left + R.Left;// + 1;
        NuevoDblcb.Top := SGCons.Top + R.Top;// + 1;
        NuevoDblcb.Width := R.Right - (R.Left + 0);
        NuevoDblcb.Height := R.Bottom  - (R.Top + 0); 
        NuevoDblcb.Visible := True;
end;

procedure TfrmConsignacionNacional.AdicionarCredito(ARow:Integer);
var NuevoDblcb:TCheckBox;
    R :TRect;
begin
        NuevoDblcb := TCheckBox.Create(Application);
        NuevoDblcb.Width := 0;
        NuevoDblcb.Visible := False;
        NuevoDblcb.Tag := ARow;
        NuevoDblcb.OnExit := chkCredito.OnExit;
        NuevoDblcb.OnClick := chkCredito.OnClick;
        NuevoDblcb.Parent := Self;
        NuevoDblcb.Color := clCaptionText;
        NuevoDblcb.Caption := 'Ahorr';
        NuevoDblcb.Parent := SGCons;
        NuevoDblcb.TabStop := False;
        SGCons.Objects[5,ARow] := NuevoDblcb;
        R := SGCons.CellRect(5,ARow);
        NuevoDblcb.Left := SGCons.Left + R.Left;// + 1;
        NuevoDblcb.Top := SGCons.Top + R.Top;// + 1;
        NuevoDblcb.Width := R.Right - (R.Left+0);
        NuevoDblcb.Height := R.Bottom - (R.Top+0);
        NuevoDblcb.Visible := True;
end;

procedure TfrmConsignacionNacional.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsignacionNacional.chkCreditoExit(Sender: TObject);
var AR:PTablaConNal;
begin
        AR := Lista.Items[SGCons.Row - 1];
        if (Sender as TCheckBox).Checked then begin
           AR^.IdDest := 1;
           AR^.DeDest := 'CONSIGNAR EN ' + AR^.DeTipo;
           AR^.Comis := AR^.ComisBanco; // + AR^.ComisLocal;
           SGCons.Cells[7,SGCons.Row] := FormatCurr('$#,0.00',AR^.Comis);
        end
        else
        begin
           AR^.IdDest := 0;
           AR^.DeDest := 'PAGO DE CREDITO';
           AR^.Comis := AR^.ComisBanco;
           SGCons.Cells[7,SGCons.Row] := FormatCurr('$#,0.00',AR^.Comis);
        end;
        SGCons.Col := 6;
        SGCons.Row := (Sender as TCheckBox).Tag;
        SGCons.SetFocus;
end;

procedure TfrmConsignacionNacional.SGConsClick(Sender: TObject);
begin
        SGCons.SetFocus;
end;

procedure TfrmConsignacionNacional.DBLCBAgenciaExit(Sender: TObject);
var AR:PTablaConNal;
begin
        if (Sender as TDBLookupComboBox).Text = '' then Exit;
        AR := Lista.Items[(Sender as TDBLookupComboBox).Tag-1];
        AR^.IdAgencia := (Sender as TDBLookupComboBox).KeyValue;
        AR^.DeAgencia := (Sender as TDBLookupComboBox).Text;
        SGCons.Col := 3;
        SGCons.Row := (Sender as TDBLookupComboBox).Tag;
        SGCons.SetFocus;
end;

procedure TfrmConsignacionNacional.DBLCBAgenciaEnter(Sender: TObject);
begin
        (Sender as TDBLookupComboBox).DropDown;
end;

procedure TfrmConsignacionNacional.DBLCBTipoAhorroExit(Sender: TObject);
var AR:PTablaConNal;
begin
        if (Sender as TDBLookupComboBox).Text = '' then Exit;
        try
         AR := Lista.Items[(Sender as TDBLookupComboBox).Tag-1];
         AR^.IdTipo := (Sender as TDBLookupComboBox).KeyValue;
         AR^.DeTipo := (Sender as TDBLookupComboBox).Text;
         SGCons.Row := (Sender as TDBLookupComboBox).Tag;
         (SGCons.Objects[2,SGCons.Row] as TDBLookupComboBox).SetFocus;
        except
        end;

end;

procedure TfrmConsignacionNacional.AdicionarAgencia(ARow: integer);
var NuevoDblcb:TDBLookupComboBox;
    R :TRect;
begin
        NuevoDblcb := TDBLookupComboBox.Create(Application);
        NuevoDblcb.Width := 0;
        NuevoDblcb.Tag := ARow;
        NuevoDblcb.OnExit := DBLCBAgencia.OnExit;
        NuevoDblcb.OnEnter := DBLCBAgencia.OnEnter;
        NuevoDblcb.ListSource := DBLCBAgencia.ListSource;
        NuevoDblcb.ListField := DBLCBAgencia.ListField;
        NuevoDblcb.KeyField := DBLCBAgencia.KeyField;
        NuevoDblcb.Parent := SGCons;
        NuevoDblcb.TabStop := False;
        NuevoDblcb.DropDownWidth := 100;
        SGCons.Objects[2,ARow] := NuevoDblcb;
        R := SGCons.CellRect(2,ARow);
        NuevoDblcb.Left := SGCons.Left + R.Left;// + 1;
        NuevoDblcb.Top := SGCons.Top + R.Top;// + 1;
        NuevoDblcb.Width := R.Right - (R.Left + 0);
        NuevoDblcb.Height := R.Bottom  - (R.Top + 0);
        NuevoDblcb.Visible := True;
end;

procedure TfrmConsignacionNacional.SGConsGetEditText(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
var AR:PTablaConNal;
begin
        if (ACol = 6) then begin
           AR := Lista.Items[ARow-1];
           Value := FloatToStr(AR^.Valor);
        end;

        if (ACol = 7) then begin
           AR := Lista.Items[ARow-1];
           Value := FloatToStr(AR^.Comis);
        end;

        if (ACol = 8) then begin
           AR := Lista.Items[ARow-1];
           EdFecha.Date := AR^.Fecha;
        end;

end;

procedure TfrmConsignacionNacional.chkCreditoClick(Sender: TObject);
var AR:PTablaConNal;
begin
        AR := Lista.Items[SGCons.Row - 1];
        if (Sender as TCheckBox).Checked then begin
           AR^.IdDest := 1;
           AR^.DeDest := 'CONSIGNAR EN ' + AR^.DeTipo;
           AR^.Comis := AR^.ComisBanco;// + AR^.ComisLocal;
           SGCons.Cells[7,SGCons.Row] := FormatCurr('$#,0.00',AR^.Comis);
        end
        else
        begin
           AR^.IdDest := 0;
           AR^.DeDest := 'PAGO DE CREDITO';
           AR^.Comis := AR^.ComisBanco;
           SGCons.Cells[7,SGCons.Row] := FormatCurr('$#,0.00',AR^.Comis);
        end;

end;

procedure TfrmConsignacionNacional.SGConsKeyPress(Sender: TObject;
  var Key: Char);
begin
        if SGCons.Col = 3 then
           NumericoSinPunto(Sender,Key);
        if (SGCons.Col = 6) or (SGCons.Col = 7) then
           Numerico(Sender,Key);
end;

procedure TfrmConsignacionNacional.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var i:Integer;
    AR:PTablaConNal;
begin
        for i :=0 to Lista.Count - 1 do begin
          AR := Lista.Items[i];
          Dispose(AR);
        end;
        Lista.Free;
end;

procedure TfrmConsignacionNacional.cmdProcesarClick(Sender: TObject);
var i,Digito:Integer;
    AR:PTablaConNal;
    Consecutivo:Integer;
    GMF:Currency;
    TComision:Currency;
    Comision:Currency;
    IvaComision:Currency;
    IGmf :Double;
    Iva  :Double;
    TotalComprobante:Currency;
    Descripcion:string;
    CodBanco,CodAhorro,CodGMFCre,CodGMFDeb,CodIva,CodComision:string;
begin
        if MessageDlg('Seguro de Realizar el Proceso?',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
           Exit;
        end;

        cmdProcesar.Enabled := False;
        Application.ProcessMessages;


        CBNotas.Enabled := True;
        for i:=0 to Lista.Count - 1 do begin
// Generar Comprobantes
          AR := Lista.Items[i];
          if AR^.Valor > 0 then begin
             if IBComprobante.Transaction.InTransaction then
                IBComprobante.Transaction.Commit;
             IBComprobante.Transaction.StartTransaction;
// Codigo del Banco
             with IBComprobante do begin
                Close;
                SQL.Clear;
                SQL.Add('select * from "gen$bancosconnal" where ID_BANCO = :ID_BANCO');
                ParamByName('ID_BANCO').AsInteger := AR^.IdBanco;
                try
                  Open;
                  CodBanco := FieldByName('CODIGO').AsString;
                except
                  Transaction.Rollback;
                  raise;
                  Continue;
                end;
             end;
// Codigo Ahorros
             with IBComprobante do begin
                Close;
                SQL.Clear;
                if AR^.IdAgencia = Agencia then begin
                  SQL.Add('select * from "cap$tipocaptacion" where ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
                  ParamByName('ID_TIPO_CAPTACION').AsInteger := AR^.IdTipo;
                end
                else
                begin
                  SQL.Add('select * from "gen$agencia" where ID_AGENCIA = :ID_AGENCIA');
                  ParamByName('ID_AGENCIA').AsInteger := AR^.IdAgencia;
                end;
                try
                  Open;
                  CodAhorro := FieldByName('CODIGO_CONTABLE').AsString;
                except
                  Transaction.Rollback;
                  raise;
                  Continue;
                end;
             end;
// Codigo GMF Credito
             CodGMFCre := '244205000000000000';
// Codigo IVA
             CodIva := '251005000000000000';
// Codigo Comision
             CodComision := '415060000000000000';
//             CodComision := '310505000000000000';
// Codigo Impuesto Asumido
             CodGMFDeb := '531520000000000000';

             with IBComprobante do begin
                Close;
                SQL.Clear;
                SQL.Add('select * from "gen$compdescripcion" where ID_COMPROBANTE = 1');
                try
                  Open;
                  Descripcion := FieldByName('COMPROBANTE').AsString;
                except
                  Transaction.Rollback;
                  raise;
                  Continue;
                end;
             end;

             with IBComprobante do begin
                Close;
                SQL.Clear;
                SQL.Add('select * from "gen$tiposinteres" where ID_INTERES = 2');
                try
                  Open;
                  IGmf := FieldByName('VALOR_INTERES').AsFloat;
                except
                  Transaction.Rollback;
                  raise;
                  Continue;
                end;
             end;

             with IBComprobante do begin
                Close;
                SQL.Clear;
                SQL.Add('select * from "gen$tiposinteres" where ID_INTERES = 1');
                try
                  Open;
                  Iva := FieldByName('VALOR_INTERES').AsFloat;
                except
                  Transaction.Rollback;
                  raise;
                  Continue;
                end;
             end;

             if AR^.IdDest = 1  then begin
                TComision := AR^.Comis + AR^.ComisLocal;
                GMF := SimpleRoundTo((((AR^.Comis + AR^.ComisLocal) * IGmf)/1000),0);
                Comision := SimpleRoundTo((AR^.ComisLocal / ((100+Iva)/100)),0);
                IvaComision := AR^.ComisLocal - Comision;
             end
             else
             if AR^.IdAgencia <> Agencia then begin
                if AR^.IdDest = 1 then
                   TComision := AR^.ComisLocal + AR^.Comis
                else
                begin
                   TComision := AR^.Comis;
                   AR^.ComisLocal := 0;
                end;
                Comision := SimpleRoundTo((AR^.ComisLocal / ((100+Iva)/100)),0);
                IvaComision := AR^.ComisLocal - Comision;
             end
             else
             begin
                TComision := AR^.Comis;
                GMF := SimpleRoundTo(((AR^.Comis * IGmf)/1000),0);
                Comision := 0;
                IvaComision := 0;
             end;

{             if AR^.IdAgencia <> Agencia then
             begin
                 GMF := 0;
                 Comision := 0;
                 IvaComision := 0;
              end;
}
             TotalComprobante := AR^.Valor + TComision + GMF;
             Consecutivo := ObtenerConsecutivo(IBSQL1,4);
             with IBComprobante do begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "con$comprobante" values(');
                SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:TIPO_COMPROBANTE,');
                SQL.Add(':FECHA_DIA,:DESCRIPCION,:TOTAL_DEBITO,:TOTAL_CREDITO,');
                SQL.Add(':ESTADO,:IMPRESO,:ANULACION,:ID_EMPLEADO)');
                ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                if AR^.IdAgencia = Agencia then
                   ParamByName('TIPO_COMPROBANTE').AsString := '1'
                else
                   ParamByName('TIPO_COMPROBANTE').AsString := '2';
                ParamByName('FECHA_DIA').AsDate := fFechaActual;
                ParamByName('DESCRIPCION').AsString := Format(Descripcion,[AR^.DeBanco,AR^.DeDest,AR^.IdTipo,AR^.IdAgencia,AR^.Cuenta])+ ', Fecha:' + DateToStr(AR^.Fecha);
                ParamByName('TOTAL_DEBITO').AsCurrency := TotalComprobante;
                ParamByName('TOTAL_CREDITO').AsCurrency := TotalComprobante;
                ParamByName('ESTADO').AsString := 'O';
                ParamByName('IMPRESO').AsInteger := 1;
                ParamByName('ANULACION').AsString := '';
                ParamByName('ID_EMPLEADO').AsString := DBAlias;
                try
                 ExecSQL;
                except
                 Transaction.Rollback;
                 raise;
                 Continue;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "con$auxiliar" values(');
                SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:FECHA,');
                SQL.Add(':CODIGO,:DEBITO,:CREDITO,:ID_CUENTA,');
                SQL.Add(':ID_COLOCACION,:ID_IDENTIFICACION,:ID_PERSONA,');
                SQL.Add(':MONTO_RETENCION,:TASA_RETENCION,:ESTADOAUX)');
                ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA').AsDate := fFechaActual;
// Datos Banco
                if AR^.Valor > 0 then begin
                ParamByName('CODIGO').AsString := CodBanco;
                ParamByName('DEBITO').AsCurrency := AR^.Valor;
                ParamByName('CREDITO').AsCurrency := 0;
                ParamByName('ID_CUENTA').AsString := '';
                ParamByName('ID_COLOCACION').AsString := '';
                ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                ParamByName('ID_PERSONA').AsString := '';
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').Clear;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecSQL;
                except
                 Transaction.Rollback;
                 raise;
                 Continue;
                end;
                end;
//
// Datos Ahorro Comision
                if TComision > 0 then begin
                ParamByName('CODIGO').AsString := CodAhorro;
                ParamByName('DEBITO').AsCurrency := TComision;
                ParamByName('CREDITO').AsCurrency := 0;
                ParamByName('ID_CUENTA').AsString := IntToStr(AR^.Cuenta);
                ParamByName('ID_COLOCACION').AsString := '';
                ParamByName('ID_IDENTIFICACION').AsInteger := AR^.IdIdent;
                ParamByName('ID_PERSONA').AsString := AR^.IdPerso;
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').Clear;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecSQL;
                except
                 Transaction.Rollback;
                 raise;
                 Continue;
                end;
                end;

//
// Datos Ahorro Credito
                if AR^.Valor > 0 then begin
                ParamByName('CODIGO').AsString := CodAhorro;
                ParamByName('DEBITO').AsCurrency := 0;
                ParamByName('CREDITO').AsCurrency := AR^.Valor;
                ParamByName('ID_CUENTA').AsString := IntToStr(AR^.Cuenta);
                ParamByName('ID_COLOCACION').AsString := '';
                ParamByName('ID_IDENTIFICACION').AsInteger := AR^.IdIdent;
                ParamByName('ID_PERSONA').AsString := AR^.IdPerso;
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').Clear;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecSQL;
                except
                 Transaction.Rollback;
                 raise;
                 Continue;
                end;
                end;
//
// Datos GMF Credito
                if ((GMF > 0) and (AR^.IdAgencia = Agencia)) then begin
                ParamByName('CODIGO').AsString := CodGMFCre;
                ParamByName('DEBITO').AsCurrency := 0;
                ParamByName('CREDITO').AsCurrency := GMF;
                ParamByName('ID_CUENTA').AsString := '';
                ParamByName('ID_COLOCACION').AsString := '';
                ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                ParamByName('ID_PERSONA').AsString := '';
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').Clear;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecSQL;
                except
                 Transaction.Rollback;
                 raise;
                 Continue;
                end;
                end;
//
// Datos Iva
                if IvaComision > 0 then begin
                ParamByName('CODIGO').AsString := CodIva;
                ParamByName('DEBITO').AsCurrency := 0;
                ParamByName('CREDITO').AsCurrency := IvaComision;
                ParamByName('ID_CUENTA').AsString := '';
                ParamByName('ID_COLOCACION').AsString := '';
                ParamByName('ID_IDENTIFICACION').AsInteger := AR^.IdIdent;
                ParamByName('ID_PERSONA').AsString := AR^.IdPerso;
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').Clear;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecSQL;
                except
                 Transaction.Rollback;
                 raise;
                 Continue;
                end;
                end;
//
// Datos Comision
                if Comision > 0 then begin
//                 if AR^.IdAgencia = Agencia then
                    ParamByName('CODIGO').AsString := CodComision;
//                 else
//                    ParamByName('CODIGO').AsString := CodAhorro;

                ParamByName('DEBITO').AsCurrency := 0;
                ParamByName('CREDITO').AsCurrency := Comision;
                ParamByName('ID_CUENTA').AsString := IntToStr(AR^.Cuenta);
                ParamByName('ID_COLOCACION').AsString := '';
                ParamByName('ID_IDENTIFICACION').AsInteger := AR^.IdIdent;
                ParamByName('ID_PERSONA').AsString := AR^.IdPerso;
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').Clear;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecSQL;
                except
                 Transaction.Rollback;
                 raise;
                 Continue;
                end;
                end;
// Datos Comision Banco
                if AR^.ComisBanco > 0 then begin
                ParamByName('CODIGO').AsString := CodBanco;
                ParamByName('DEBITO').AsCurrency := 0;
                ParamByName('CREDITO').AsCurrency := AR^.ComisBanco;
                ParamByName('ID_CUENTA').AsString := '';
                ParamByName('ID_COLOCACION').AsString := '';
                ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                ParamByName('ID_PERSONA').AsString := '';
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').Clear;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecSQL;
                except
                 Transaction.Rollback;
                 raise;
                 Continue;
                end;
                end;
//

//
// Datos GMF Debito
                if ((GMF > 0) and (AR^.IdAgencia = Agencia)) then begin
                ParamByName('CODIGO').AsString := CodGMFDeb;
                ParamByName('DEBITO').AsCurrency := GMF;
                ParamByName('CREDITO').AsCurrency := 0;
                ParamByName('ID_CUENTA').AsString := '';
                ParamByName('ID_COLOCACION').AsString := '';
                ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                ParamByName('ID_PERSONA').AsString := '';
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').Clear;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                 ExecSQL;
                except
                 Transaction.Rollback;
                 raise;
                 Continue;
                end;
                end;
//
// Insertar Movimientos en el Extracto
               if AR^.IdAgencia = Agencia then
               begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$extracto" values(');
                SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
                SQL.Add(':FECHA_MOVIMIENTO,:HORA_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO_MOVIMIENTO,');
                SQL.Add(':DESCRIPCION_MOVIMIENTO,:VALOR_DEBITO,:VALOR_CREDITO)');
                if AR^.Valor > 0 then
                begin
                  ParamByName('ID_AGENCIA').AsInteger            := AR^.IdAgencia;
                  ParamByName('ID_TIPO_CAPTACION').AsInteger     := AR^.IdTipo;
                  ParamByName('NUMERO_CUENTA').AsInteger         := AR^.Cuenta;
                  ParamByName('DIGITO_CUENTA').AsInteger         := StrToInt(DigitoControl(AR^.IdTipo,Format('%.7d',[AR^.Cuenta])));
                  ParamByName('FECHA_MOVIMIENTO').AsDate         := fFechaActual;
                  ParamByName('HORA_MOVIMIENTO').AsTime          := fHoraActual;
                  ParamByName('ID_TIPO_MOVIMIENTO').AsInteger    := 6;
                  ParamByName('DOCUMENTO_MOVIMIENTO').AsString   := Format('%.8d',[Consecutivo]);
                  ParamByName('DESCRIPCION_MOVIMIENTO').AsString := LeftStr(Format(Descripcion,[AR^.DeBanco,AR^.DeDest,AR^.IdTipo,AR^.IdAgencia,AR^.Cuenta]),50);
                  ParamByName('VALOR_DEBITO').AsCurrency         := AR^.Valor;
                  ParamByName('VALOR_CREDITO').AsCurrency        := 0;
                  try
                    ExecSQL;
                  except
                    Transaction.Rollback;
                    raise;
                    Continue;
                  end;
                end; // AR^.Valor
                if TComision > 0 then
                begin
                  ParamByName('ID_AGENCIA').AsInteger            := AR^.IdAgencia;
                  ParamByName('ID_TIPO_CAPTACION').AsInteger     := AR^.IdTipo;
                  ParamByName('NUMERO_CUENTA').AsInteger         := AR^.Cuenta;
                  ParamByName('DIGITO_CUENTA').AsInteger         := StrToInt(DigitoControl(AR^.IdTipo,Format('%.7d',[AR^.Cuenta])));
                  ParamByName('FECHA_MOVIMIENTO').AsDate         := fFechaActual;
                  ParamByName('HORA_MOVIMIENTO').AsTime          := fHoraActual;
                  ParamByName('ID_TIPO_MOVIMIENTO').AsInteger    := 6;
                  ParamByName('DOCUMENTO_MOVIMIENTO').AsString   := Format('%.8d',[Consecutivo]);
                  ParamByName('DESCRIPCION_MOVIMIENTO').AsString := LeftStr(Format(Descripcion,[AR^.DeBanco,AR^.DeDest,AR^.IdTipo,AR^.IdAgencia,AR^.Cuenta]),50);
                  ParamByName('VALOR_DEBITO').AsCurrency         := 0;
                  ParamByName('VALOR_CREDITO').AsCurrency        := TComision;
                  try
                    ExecSQL;
                  except
                    Transaction.Rollback;
                    raise;
                    Continue;
                  end;
                end; // AR^.Comis
{
                if Comision > 0 then begin
                  ParamByName('ID_AGENCIA').AsInteger            := AR^.IdAgencia;
                  ParamByName('ID_TIPO_CAPTACION').AsInteger     := 1;
                  ParamByName('NUMERO_CUENTA').AsInteger         := AR^.Cuenta;
                  ParamByName('DIGITO_CUENTA').AsInteger         := StrToInt(DigitoControl(1,Format('%.7d',[AR^.Cuenta])));
                  ParamByName('FECHA_MOVIMIENTO').AsDate         := fFechaActual;
                  ParamByName('HORA_MOVIMIENTO').AsTime          := fHoraActual;
                  ParamByName('ID_TIPO_MOVIMIENTO').AsInteger    := 6;
                  ParamByName('DOCUMENTO_MOVIMIENTO').AsString   := Format('%.8d',[Consecutivo]);
                  ParamByName('DESCRIPCION_MOVIMIENTO').AsString := LeftStr(Format(Descripcion,[AR^.DeBanco,AR^.DeDest,AR^.IdTipo,AR^.IdAgencia,AR^.Cuenta]),50);
                  ParamByName('VALOR_DEBITO').AsCurrency         := Comision;
                  ParamByName('VALOR_CREDITO').AsCurrency        := 0;
                  try
                    ExecSQL;
                  except
                    Transaction.Rollback;
                    raise;
                    Continue;
                  end;
                end;
}
                end; // AR^.IdAgencia

//
             end;  //del with
             IBComprobante.Transaction.Commit;
             CBNotas.Items.Add(Format('%.8d',[Consecutivo]));
         end; // del if
        end; // del for

        if CBNotas.Items.Count > 0 then begin
           cmdReporte.Enabled := True;
           cmdReporte.Click;
        end;
end;

procedure TfrmConsignacionNacional.cmdReporteClick(Sender: TObject);
var i:Integer;
begin
        if CBNotas.Items.Count < 1 then begin
           MessageDlg('No se generaron notas contables',mtInformation,[mbok],0);
           Exit;
        end;

        with IBAuxiliar do begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select');
          SQL.Add('"con$auxiliar".ID_COMPROBANTE,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
          SQL.Add('"con$tipocomprobante".DESCRIPCION AS TIPO,');
          SQL.Add('"con$comprobante".FECHADIA,');
          SQL.Add('"con$comprobante".DESCRIPCION,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$empleado".NOMBRE,');
          SQL.Add('"con$auxiliar".CODIGO,');
          SQL.Add('"con$puc".NOMBRE AS CUENTA,');
          SQL.Add('"con$auxiliar".ID_CUENTA,');
          SQL.Add('"con$auxiliar".ID_COLOCACION,');
          SQL.Add('"con$auxiliar".ID_IDENTIFICACION,');
          SQL.Add('"con$auxiliar".ID_PERSONA,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,');
          SQL.Add('"gen$persona".NOMBRE AS NOMBRE1,');
          SQL.Add('"con$auxiliar".DEBITO,');
          SQL.Add('"con$auxiliar".CREDITO');
          SQL.Add('from');
          SQL.Add('"con$comprobante"');
          SQL.Add('LEFT JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)');
          SQL.Add('LEFT JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE  = "con$tipocomprobante".ID )');
          SQL.Add('LEFT JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
          SQL.Add('LEFT JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
          SQL.Add('LEFT JOIN "gen$persona" ON ("con$auxiliar".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
          SQL.Add('"con$auxiliar".ID_PERSONA = "gen$persona".ID_PERSONA )');
          SQL.Add('where "con$comprobante".ID_AGENCIA = :ID_AGENCIA and (');
          for i:=0 to CBNotas.Items.Count - 1 do begin
             SQL.Add('("con$comprobante".ID_COMPROBANTE = '+CBNotas.Items[i]+')');
             if i < CBNotas.Items.Count -1 then
               SQL.Add(' or ');
          end;
          SQL.Add(') order by "con$auxiliar".ID_COMPROBANTE,"con$auxiliar".CODIGO');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
        end;
        reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
        reporte.Variables.ByName['NIT'].AsString := Nit;
        if reporte.PrepareReport then
           reporte.PreviewPreparedReport(True);

end;

procedure TfrmConsignacionNacional.reporteInitDetailBandDataSet(
  Sender: TObject; DetailBand: TprBand; DataSet: TObject;
  const DataSetName: String);
begin
        if DataSetName = 'IBAuxiliar1' then begin
          with IBAuxiliar1 do begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := IBAuxiliar.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := IBAuxiliar.FieldByName('ID_PERSONA').AsString;
            try
             Open;
            except
             raise;
            end;
          end;
        end;

end;

procedure TfrmConsignacionNacional.AdicionarFecha(ARow: integer);
var NuevoDblcb:TDateTimePicker;
    R :TRect;
begin
        NuevoDblcb := TDateTimePicker.Create(Application);
        NuevoDblcb.Width := 0;
        NuevoDblcb.Visible := False;
        NuevoDblcb.Tag := ARow;
        NuevoDblcb.OnExit := EdFecha.OnExit;
//        NuevoDblcb.OnClick := chkCredito.OnClick;
        NuevoDblcb.Parent := Self;
        NuevoDblcb.Color := clCaptionText;
        NuevoDblcb.Parent := SGCons;
        NuevoDblcb.TabStop := False;
        SGCons.Objects[8,ARow] := NuevoDblcb;
        R := SGCons.CellRect(8,ARow);
        NuevoDblcb.Left := SGCons.Left + R.Left;// + 1;
        NuevoDblcb.Top := SGCons.Top + R.Top;// + 1;
        NuevoDblcb.Width := R.Right - (R.Left+0);
        NuevoDblcb.Height := R.Bottom - (R.Top+0);
        NuevoDblcb.Visible := True;
end;

procedure TfrmConsignacionNacional.EdFechaExit(Sender: TObject);
var
 AR:PTablaConNal;
 ARow :Integer;
begin
        if (Sender as TDateTimePicker).Date = 0 then Exit;

        try
         AR := Lista.Items[(Sender as TDateTimePicker).Tag-1];
         AR^.Fecha := (Sender as TDateTimePicker).Date;
        except
         raise;
        end;

        ARow := (Sender as TDateTimePicker).Tag;

        if (ARow = (SGCons.RowCount - 1)) then begin
//           AR := Lista.Items[ARow-1];
//           AR^.Comis := StrToCurr(EditText);
           EdTotalConsignaciones.Caption := IntToStr(Lista.Count);
           SGCons.RowCount := SGCons.RowCount + 1;
           Application.ProcessMessages;
           New(AR);
           AR^.IdBanco := -1;
           AR^.DeBanco := '';
           AR^.IdTipo := -1;
           AR^.DeTipo := '';
           AR^.IdAgencia := 0;
           AR^.DeAgencia := '';
           AR^.IdIdent := 0;
           AR^.IdPerso := '';
           AR^.Cuenta := 0;
           AR^.IdDest := -1;
           AR^.DeDest := '';
           AR^.Valor  := 0;
           AR^.Comis  := 0;
           Lista.Add(AR);
           SGCons.Col := 0;
           AdicionarBanco(SGCons.RowCount - 1);
           AdicionarTipoAhorro(SGCons.RowCount - 1);
           AdicionarAgencia(SGCons.RowCount - 1);
           AdicionarCredito(SGCons.RowCount - 1);
           AdicionarFecha(SGCons.RowCount - 1);
           cmdProcesar.Enabled := True;
        end;

//        if (AColumn = 8) then
           (SGCons.Objects[0,SGCons.Row+1] as TDBLookupComboBox).SetFocus;


end;

procedure TfrmConsignacionNacional.statusBarDrawPanel(
  StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel = StatusBar.Panels[1] then
  with ProgressBar1 do begin
    Top := Rect.Top;
    Left := Rect.Left;
    Width := Rect.Right - Rect.Left - 15;
    Height := Rect.Bottom - Rect.Top;
  end;
end;

procedure TfrmConsignacionNacional.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
        ProgressBar1.Min := 0;
        ProgressBar1.Max := AWorkCountMax;
        Application.ProcessMessages;
end;

procedure TfrmConsignacionNacional.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
        ProgressBar1.Position := AWorkCount;
        Application.ProcessMessages;
end;

procedure TfrmConsignacionNacional.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        ProgressBar1.Position := 0;
        Application.ProcessMessages;        
end;

end.
