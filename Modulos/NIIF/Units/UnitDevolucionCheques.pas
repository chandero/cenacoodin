unit UnitDevolucionCheques;

interface

uses
  Windows, Messages, SysUtils, StrUtils,Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, JvStringGrid, DB, IBCustomDataSet, IBQuery,
  DBCtrls, StdCtrls, JvEdit, JvTypedEdit, Buttons, XStringGrid, CECheckList,
  IBSQL, IBDatabase, Math, pr_Common, pr_TxClasses, ComCtrls, JvComponent,
  JvSimpleXml, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, sdXmlDocuments,DateUtils;

type
  TfrmDevolucionCheques = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SGCheques: TJvStringGrid;
    IBQBancos: TIBQuery;
    IBQTipoAhorro: TIBQuery;
    DBLCBBancos: TDBLookupComboBox;
    DSBancos: TDataSource;
    DSTipoAhorro: TDataSource;
    DBLCBTipoAhorro: TDBLookupComboBox;
    cmdCerrar: TBitBtn;
    IBSQL1: TIBSQL;
    Transaction1: TIBTransaction;
    cmdProcesar: TBitBtn;
    cmdReporte: TBitBtn;
    Label1: TLabel;
    EdTotalConsignaciones: TStaticText;
    CBNotas: TComboBox;
    Label2: TLabel;
    IBAuxiliar: TIBQuery;
    IBAuxiliar1: TIBQuery;
    reporte: TprTxReport;
    statusBar: TStatusBar;
    IBComprobante: TIBQuery;
    IBSQL2: TIBSQL;
    DBLCBContable: TDBLookupComboBox;
    IBQContable: TIBQuery;
    DSContable: TDataSource;
    procedure SGChequesGetCellAlignment(Sender: TJvStringGrid; AColumn,
      ARow: Integer; State: TGridDrawState; var CellAlignment: TAlignment);
    procedure SGChequesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SGChequesExitCell(Sender: TJvStringGrid; AColumn, ARow: Integer;
      const EditText: String);
    procedure DBLCBBancosExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBBancosEnter(Sender: TObject);
    procedure DBLCBTipoAhorroEnter(Sender: TObject);
    procedure cmdCerrarClick(Sender: TObject);
    procedure SGChequesClick(Sender: TObject);
    procedure DBLCBTipoAhorroExit(Sender: TObject);
    procedure SGChequesGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure SGChequesKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmdProcesarClick(Sender: TObject);
    procedure cmdReporteClick(Sender: TObject);
    procedure reporteInitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure DBLCBContableEnter(Sender: TObject);
    procedure DBLCBContableExit(Sender: TObject);
  private
    procedure Inicializar;
    procedure AdicionarBanco(ARow:Integer);
    procedure AdicionarBancoContable(ARow:Integer);
    procedure AdicionarTipoAhorro(ARow:Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

type
  PTablaCheque=^TablaCheque;
  TablaCheque=record
     IdBanco    :Integer;
     DeBanco    :string;
     IdTipo     :Integer;
     DeTipo     :string;
     Cuenta     :Integer;
     IdIdent    :Integer;
     IdPerso    :string;
     Cheque     :string;
     Valor      :Currency;
     Comprobante:Integer;
     BContable  :integer;
  end;

var
  frmDevolucionCheques: TfrmDevolucionCheques;
  CscBanco:Integer;
  Lista:TList;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmDevolucionCheques.Inicializar;
var AR:PTablaCheque;
begin
        SGCheques.ColCount := 7;
        SGCheques.RowCount := 2;


        SGCheques.Cells[0,0] := 'Banco Emisor';
        SGCheques.Cells[1,0] := 'Tipo';
        SGCheques.Cells[2,0] := 'Cuenta';
        SGCheques.Cells[3,0] := 'Nombre';
        SGCheques.Cells[4,0] := 'Cheque';
        SGCheques.Cells[5,0] := 'Valor';
        SGCheques.Cells[6,0] := 'Bco a Contabilizar';

        SGCheques.ColWidths[0] := 100;
        SGCheques.ColWidths[1] := 100;
        SGCheques.ColWidths[2] := 80;
        SGCheques.ColWidths[3] := 190;
        SGCheques.ColWidths[4] := 60;
        SGCheques.ColWidths[5] := 80;
        SGCheques.ColWidths[6] := 180;

        AdicionarBanco(1);
        AdicionarBancoContable(1);
        AdicionarTipoAhorro(1);

        try
         (SGCheques.Objects[0,1] as TDBLookupComboBox).SetFocus;
        finally
        end;


        with IBQBancos do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
        end;

        IBQBancos.Open;
        IBQBancos.Last;
        IBQContable.Open;
        IBQContable.Last;
        IBQTipoAhorro.Open;
        IBQTipoAhorro.Last;

        Lista.Clear;
        New(AR);
        AR^.IdBanco := -1;
        AR^.DeBanco := '';
        AR^.IdTipo := -1;
        AR^.DeTipo := '';
        AR^.Cuenta := 0;
        AR^.IdIdent := 0;
        AR^.IdPerso := '';
        AR^.Cheque := '';
        AR^.Valor  := 0;
        AR^.BContable := -1;
        Lista.Add(AR);

end;

procedure TfrmDevolucionCheques.SGChequesGetCellAlignment(
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

procedure TfrmDevolucionCheques.SGChequesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var R:TRect;
begin
        if ((ACol = 0) or (ACol = 1) or (ACol = 6)) then begin
          CanSelect := False;
          Exit;
        end;

        CanSelect := True;
end;

procedure TfrmDevolucionCheques.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmDevolucionCheques.AdicionarBanco(ARow:Integer);
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
        NuevoDblcb.Parent := SGCheques;
        NuevoDblcb.TabStop := False;
        NuevoDblcb.DropDownWidth := 120;
        SGCheques.Objects[0,ARow] := NuevoDblcb;
        R := SGCheques.CellRect(0,ARow);
        NuevoDblcb.Left := SGCheques.Left + R.Left;// + 1;
        NuevoDblcb.Top := SGCheques.Top + R.Top;// + 1;
        NuevoDblcb.Width := R.Right - (R.Left + 0);
        NuevoDblcb.Height := R.Bottom  - (R.Top + 0);
        NuevoDblcb.Visible := True;
end;

procedure TfrmDevolucionCheques.AdicionarBancoContable(ARow:Integer);
var NuevoDblcb:TDBLookupComboBox;
    R :TRect;
begin
        NuevoDblcb := TDBLookupComboBox.Create(Application);
        NuevoDblcb.Width := 0;
        NuevoDblcb.Tag := ARow;
        NuevoDblcb.OnExit := DBLCBContable.OnExit;
        NuevoDblcb.OnEnter := DBLCBContable.OnEnter;
        NuevoDblcb.ListSource := DBLCBContable.ListSource;
        NuevoDblcb.ListField := DBLCBContable.ListField;
        NuevoDblcb.KeyField := DBLCBContable.KeyField;
        NuevoDblcb.Parent := SGCheques;
        NuevoDblcb.TabStop := False;
        NuevoDblcb.DropDownWidth := 160;
        SGCheques.Objects[6,ARow] := NuevoDblcb;
        R := SGCheques.CellRect(6,ARow);
        NuevoDblcb.Left := SGCheques.Left + R.Left;// + 1;
        NuevoDblcb.Top := SGCheques.Top + R.Top;// + 1;
        NuevoDblcb.Width := R.Right - (R.Left + 0);
        NuevoDblcb.Height := R.Bottom  - (R.Top + 0);
        NuevoDblcb.Visible := True;
end;


procedure TfrmDevolucionCheques.FormCreate(Sender: TObject);
var
  ProgressBarStyle: integer;

begin
  Lista := TList.Create;
end;

procedure TfrmDevolucionCheques.SGChequesExitCell(Sender: TJvStringGrid;
  AColumn, ARow: Integer; const EditText: String);
var AR:PTablaCheque;
    Text:string;
    Tipo:Integer;
    Cuenta:string;
    Digito:Integer;
    Veces:Integer;
    i,inic:Integer;
    Cadena:string;
    Total :Integer;
    Campos:Integer;
begin
       if (AColumn = 2) then begin
            AR := Lista.Items[ARow - 1];
             Text := EditText;
             if Text = '' then Text := '0';
             with IBSQL1 do begin
                if Transaction.InTransaction then
                  Transaction.Rollback;
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
                ParamByName('ID_TIPO_CAPTACION').AsInteger := (SGCheques.Objects[1,ARow] as TDBLookupComboBox).KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(Text);
                Tipo := (SGCheques.Objects[1,ARow] as TDBLookupComboBox).KeyValue;
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
                       SGCheques.Cells[AColumn,ARow] := '';
                       Exit;
                    end
                    else
                    begin
                       SGCheques.Cells[AColumn,ARow] := Format('%.7d',[StrtoInt(Text)]);
                       SGCheques.Cells[3,ARow] := Trim(FieldByName('NOMBRE').AsString + ' '+
                                                    FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                    FieldByName('SEGUNDO_APELLIDO').AsString);
                       AR^.IdIdent := FieldByName('ID_IDENTIFICACION').AsInteger;
                       AR^.IdPerso := FieldByName('ID_PERSONA').AsString;
                       AR^.Cuenta := StrToInt(Cuenta);
                       SGCheques.Row := ARow;
                       SGCheques.Col := 4;
                    end;
                  end
                  else
                  begin
                       Transaction.Commit;
                       MessageDlg('Esta Cuenta No Existe!',mtError,[mbcancel],0);
                       SGCheques.Cells[AColumn,ARow] := '';
                       Exit;
                  end;
                except
                  Transaction.Rollback;
                  raise;
                  Exit;
                end;
//               Transaction.Commit;
             end;
        end;

        if (AColumn = 4) then begin
          Text := EditText;
          if Text = '' then Text := '0';
          SGCheques.Cells[AColumn,ARow] := Text;
          AR := Lista.Items[ARow-1];
          AR^.Cheque := EditText;

          //Verificar Existencia de Cheque
          if IBSQL2.Transaction.InTransaction then
            IBSQL2.Transaction.Rollback;
          IBSQL2.Transaction.StartTransaction;
          IBSQL2.Close;
          IBSQL2.SQL.Clear;
          IBSQL2.SQL.Add('SELECT NUMERO_CHEQUE, VALOR from "tes$cheques" WHERE ID_BANCO = :BANCO AND NUMERO_CHEQUE = :CHEQUE');
          IBSQL2.SQL.Add('AND ID_AGENCIA = :AG AND ID_TIPO_CAPTACION = :TP AND NUMERO_CUENTA = :CTA AND DIGITO_CUENTA = :DGT');
          IBSQL2.ParamByName('BANCO').AsInteger := AR^.IdBanco;
          IBSQL2.ParamByName('CHEQUE').AsInteger := StrToInt(AR^.Cheque);
          IBSQL2.ParamByName('AG').AsInteger := Agencia;
          IBSQL2.ParamByName('TP').AsInteger := AR^.IdTipo;
          IBSQL2.ParamByName('CTA').AsInteger := AR^.Cuenta;
          IBSQL2.ParamByName('DGT').AsInteger := StrToInt(DigitoControl(AR^.IdTipo,Format('%.7d',[AR^.Cuenta])));
          try
            IBSQL2.ExecQuery;
            if IBSQL2.RecordCount <= 0 then begin
             MessageDlg('El Cheque no está Registrado',mtError,[mbcancel],0);
             SGCheques.Cells[AColumn,ARow]:= '';
             AR^.Cheque := '';
             //Exit;
            end
            else
            begin
             SGCheques.Cells[5,ARow] := FormatCurr('$#,0.00',(IBSQL2.FieldByName('VALOR').AsCurrency));
             AR := Lista.Items[ARow-1];
             AR^.Valor := IBSQL2.FieldByName('VALOR').AsCurrency;
             SGCheques.Col := 6;
             (SGCheques.Objects[6,SGCheques.Row] as TDBLookupComboBox).SetFocus;
            end;
          except
            raise;
          end;
        end;


        if (AColumn = 5) then begin
          Text := EditText;
          if Text = '' then Text := '0';
          SGCheques.Cells[AColumn,ARow] := FormatCurr('$#,0.00',StrToCurr(Text));
          AR := Lista.Items[ARow-1];
          AR^.Valor := StrToCurr(EditText);
          SGCheques.Col := 6;
          (SGCheques.Objects[6,SGCheques.Row] as TDBLookupComboBox).SetFocus;
        end;

        if (AColumn = 6) and (ARow = (SGCheques.RowCount - 1)) then begin
           AR := Lista.Items[ARow-1];
           EdTotalConsignaciones.Caption := IntToStr(Lista.Count);
           SGCheques.RowCount := SGCheques.RowCount + 1;
           Application.ProcessMessages;
           New(AR);
           AR^.IdBanco := -1;
           AR^.DeBanco := '';
           AR^.IdTipo := -1;
           AR^.DeTipo := '';
           AR^.IdIdent := 0;
           AR^.IdPerso := '';
           AR^.Cheque := '';
           AR^.Cuenta := 0;
           AR^.Valor  := 0;
           AR^.BContable := -1;
           Lista.Add(AR);
           SGCheques.Col := 0;
           adicionarbanco(SGCheques.RowCount - 1);
           adicionartipoahorro(SGCheques.RowCount - 1);
           adicionarbancocontable(SGCheques.RowCount -1);
           cmdProcesar.Enabled := True;
        end;

//        if (AColumn = 6) then
//           (SGCheques.Objects[0,SGCheques.Row+1] as TDBLookupComboBox).SetFocus;
end;

procedure TfrmDevolucionCheques.DBLCBBancosExit(Sender: TObject);
var AR:PTablaCheque;
    Veces:Integer;
begin
        if (Sender as TDBLookupComboBox).Text = '' then Exit;

        try
         AR := Lista.Items[(Sender as TDBLookupComboBox).Tag-1];
         AR^.IdBanco := (Sender as TDBLookupComboBox).KeyValue;
         AR^.DeBanco := (Sender as TDBLookupComboBox).Text;
         (SGCheques.Objects[1,(Sender as TDBLookupComboBox).Tag] as TDBLookupComboBox).SetFocus;

//         SGCheques.Row := (Sender as TDBLookupComboBox).Tag;
//         (SGCheques.Objects[1,SGCheques.Row] as TDBLookupComboBox).SetFocus;
        finally
        end;
end;

procedure TfrmDevolucionCheques.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmDevolucionCheques.DBLCBBancosEnter(Sender: TObject);
begin
        (Sender as TDBLookupComboBox).DropDown;
end;

procedure TfrmDevolucionCheques.DBLCBTipoAhorroEnter(Sender: TObject);
begin
        (Sender as TDBLookupComboBox).DropDown;
end;

procedure TfrmDevolucionCheques.AdicionarTipoAhorro(ARow:Integer);
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
        NuevoDblcb.Parent := SGCheques;
        NuevoDblcb.TabStop := False;
        NuevoDblcb.DropDownWidth := 120;
        SGCheques.Objects[1,ARow] := NuevoDblcb;
        R := SGCheques.CellRect(1,ARow);
        NuevoDblcb.Left := SGCheques.Left + R.Left;// + 1;
        NuevoDblcb.Top := SGCheques.Top + R.Top;// + 1;
        NuevoDblcb.Width := R.Right - (R.Left + 0);
        NuevoDblcb.Height := R.Bottom  - (R.Top + 0); 
        NuevoDblcb.Visible := True;
end;


procedure TfrmDevolucionCheques.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmDevolucionCheques.SGChequesClick(Sender: TObject);
begin
        SGCheques.SetFocus;
end;

procedure TfrmDevolucionCheques.DBLCBTipoAhorroExit(Sender: TObject);
var AR:PTablaCheque;
begin
        if (Sender as TDBLookupComboBox).Text = '' then Exit;
        try
         AR := Lista.Items[(Sender as TDBLookupComboBox).Tag-1];
         AR^.IdTipo := (Sender as TDBLookupComboBox).KeyValue;
         AR^.DeTipo := (Sender as TDBLookupComboBox).Text;
         SGCheques.Row := (Sender as TDBLookupComboBox).Tag;
         SGCheques.Col := 2;
        except
        end;

end;

procedure TfrmDevolucionCheques.SGChequesGetEditText(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
var AR:PTablaCheque;
begin
        if (ACol = 4) then begin
           AR := Lista.Items[ARow-1];
           Value := AR^.Cheque;
        end;

        if (ACol = 5) then begin
           AR := Lista.Items[ARow-1];
           if AR^.Valor > 0 then
             Value := FloatToStr(AR^.Valor);
        end;

end;


procedure TfrmDevolucionCheques.SGChequesKeyPress(Sender: TObject;
  var Key: Char);
begin
        if (SGCheques.Col = 2) or (SGCheques.Col = 4) then
           NumericoSinPunto(Sender,Key);
        if (SGCheques.Col = 5) then
           Numerico(Sender,Key);
end;

procedure TfrmDevolucionCheques.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var i:Integer;
    AR:PTablaCheque;
begin
        for i :=0 to Lista.Count - 1 do begin
          AR := Lista.Items[i];
          Dispose(AR);
        end;
        Lista.Free;
end;

procedure TfrmDevolucionCheques.cmdProcesarClick(Sender: TObject);
var i,Digito:Integer;
    AR:PTablaCheque;
    Consecutivo:Integer;
    TotalComprobante,SaldoAhorros:Currency;
    Descripcion:string;
    CodBanco,Banco,CodAhorro,CodCxC:string;
begin
         if MessageDlg('Seguro de Realizar el Proceso?',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
           Exit;
        end;

        cmdProcesar.Enabled := False;
        Application.ProcessMessages;


        Banco := '';
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
                SQL.Add('select CODIGO, DESCRIPCION from "gen$bancosconnal" where ID_BANCO = :ID_BANCO');
                ParamByName('ID_BANCO').AsInteger := AR^.BContable;
                try
                  Open;
                  CodBanco := FieldByName('CODIGO').AsString;
                  Banco := FieldByName('DESCRIPCION').AsString;
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
                SQL.Add('select * from "cap$tipocaptacion" where ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
                ParamByName('ID_TIPO_CAPTACION').AsInteger := AR^.IdTipo;
                try
                  Open;
                  CodAhorro := FieldByName('CODIGO_CONTABLE').AsString;
                except
                  Transaction.Rollback;
                  raise;
                  Continue;
                end;
             end;

// Codigo Cuentas por Cobrar
             with IBComprobante do begin
                Close;
                SQL.Clear;
                SQL.Add('SELECT CODIGO_CONTABLE FROM "cap$contable" WHERE ID_CAPTACION = 1 AND ID_CONTABLE =1');
                try
                  Open;
                  CodCxC := FieldByName('CODIGO_CONTABLE').AsString;
                except
                  Transaction.Rollback;
                  raise;
                  Continue;
                end;
             end;


             SaldoAhorros := 0;
             TotalComprobante := AR^.Valor;             
             Consecutivo := ObtenerConsecutivo(IBSQL1);
             with IBComprobante do begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "con$comprobante" values(');
                SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:TIPO_COMPROBANTE,');
                SQL.Add(':FECHA_DIA,:DESCRIPCION,:TOTAL_DEBITO,:TOTAL_CREDITO,');
                SQL.Add(':ESTADO,:IMPRESO,:ANULACION,:ID_EMPLEADO)');
                ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('TIPO_COMPROBANTE').AsString := '1';
                ParamByName('FECHA_DIA').AsDate := fFechaActual;
                ParamByName('DESCRIPCION').AsString := 'Devolución' + Banco + 'de Cheque No.' + ' ' + AR^.Cheque +  ' ' + AR^.DeBanco + ' ' + AR^.DeTipo +  ' ' + 'No.' + ' ' + IntToStr(AR^.Cuenta);               //Format(Descripcion,[AR^.DeBanco,AR^.IdTipo,AR^.IdAgencia,AR^.Cuenta])+ ', Fecha:' + DateToStr(AR^.Fecha);
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
                ParamByName('DEBITO').AsCurrency := 0;
                ParamByName('CREDITO').AsCurrency := AR^.Valor;
                ParamByName('ID_CUENTA').AsString := '0';
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

                // Verificacion de Saldo Cuenta de Ahorros
                if IBSQL2.Transaction.InTransaction then
                  IBSQL2.Transaction.Commit;
                IBSQL2.Transaction.StartTransaction;
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('select SALDO_DISPONIBLE from SALDO_DISPONIBLE_JUD (:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := Agencia;
                IBSQL2.ParamByName('TP').AsInteger := AR^.IdTipo;
                IBSQL2.ParamByName('CTA').AsInteger := AR^.Cuenta;
                IBSQL2.ParamByName('DGT').AsInteger := StrToInt(DigitoControl(AR^.IdTipo,Format('%.7d',[AR^.Cuenta])));
                IBSQL2.ParamByName('ANO').AsString := LeftStr(DateToStr(fFechaActual),4);
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDateTime := fFechaActual + StrToTime('23:59:59');
                try
                  IBSQL2.ExecQuery;
                  SaldoAhorros :=  IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency
                except
                  raise;
                end;

                if (SaldoAhorros < AR^.Valor) then begin
                  ParamByName('CODIGO').AsString := CodCxC;
                  ParamByName('DEBITO').AsCurrency := AR^.Valor;
                  ParamByName('CREDITO').AsCurrency := 0;
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

                  //Insertar Doble Movimiento en Extracto
                  Close;
                  SQL.Clear;
                  SQL.Add('insert into "cap$extracto" values(');
                  SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
                  SQL.Add(':FECHA_MOVIMIENTO,:HORA_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO_MOVIMIENTO,');
                  SQL.Add(':DESCRIPCION_MOVIMIENTO,:VALOR_DEBITO,:VALOR_CREDITO)');
                  if (AR^.Valor > 0) then
                   begin
                     ParamByName('ID_AGENCIA').AsInteger            := Agencia;
                     ParamByName('ID_TIPO_CAPTACION').AsInteger     := AR^.IdTipo;
                     ParamByName('NUMERO_CUENTA').AsInteger         := AR^.Cuenta;
                     ParamByName('DIGITO_CUENTA').AsInteger         := StrToInt(DigitoControl(AR^.IdTipo,Format('%.7d',[AR^.Cuenta])));
                     ParamByName('FECHA_MOVIMIENTO').AsDate         := fFechaActual;
                     ParamByName('HORA_MOVIMIENTO').AsTime          := fHoraActual;
                     ParamByName('ID_TIPO_MOVIMIENTO').AsInteger    := 31;
                     ParamByName('DOCUMENTO_MOVIMIENTO').AsString   := Format('%.8d',[Consecutivo]);
                     ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Devolución de Cheque No.' + ' ' + AR^.Cheque + ' ' + AR^.DeBanco;
                     ParamByName('VALOR_DEBITO').AsCurrency         := 0;
                     ParamByName('VALOR_CREDITO').AsCurrency        := AR^.Valor;
                     try
                       ExecSQL;
                     except
                       Transaction.Rollback;
                       raise;
                       Continue;
                     end;
                   end;

                  Close;
                  SQL.Clear;
                  SQL.Add('insert into "cap$extracto" values(');
                  SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
                  SQL.Add(':FECHA_MOVIMIENTO,:HORA_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO_MOVIMIENTO,');
                  SQL.Add(':DESCRIPCION_MOVIMIENTO,:VALOR_DEBITO,:VALOR_CREDITO)');
                  if (AR^.Valor > 0) then
                   begin
                     ParamByName('ID_AGENCIA').AsInteger            := Agencia;
                     ParamByName('ID_TIPO_CAPTACION').AsInteger     := AR^.IdTipo;
                     ParamByName('NUMERO_CUENTA').AsInteger         := AR^.Cuenta;
                     ParamByName('DIGITO_CUENTA').AsInteger         := StrToInt(DigitoControl(AR^.IdTipo,Format('%.7d',[AR^.Cuenta])));
                     ParamByName('FECHA_MOVIMIENTO').AsDate         := fFechaActual;
                     ParamByName('HORA_MOVIMIENTO').AsTime          := fHoraActual;
                     ParamByName('ID_TIPO_MOVIMIENTO').AsInteger    := 32;
                     ParamByName('DOCUMENTO_MOVIMIENTO').AsString   := Format('%.8d',[Consecutivo]);
                     ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Ctas por Cobrar Dev.Cheque No.' + ' ' + AR^.Cheque + ' ' + AR^.DeBanco;
                     ParamByName('VALOR_DEBITO').AsCurrency         := AR^.Valor;
                     ParamByName('VALOR_CREDITO').AsCurrency        := 0;
                     try
                       ExecSQL;
                     except
                       Transaction.Rollback;
                       raise;
                       Continue;
                     end;
                   end;

                end;

                // Datos Ahorro Credito
                if ((AR^.Valor > 0) and (SaldoAhorros > AR^.Valor)) then begin
                  ParamByName('CODIGO').AsString := CodAhorro;
                  ParamByName('DEBITO').AsCurrency := AR^.Valor;
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

                // Insertar Movimientos en el Extracto
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$extracto" values(');
                SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
                SQL.Add(':FECHA_MOVIMIENTO,:HORA_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO_MOVIMIENTO,');
                SQL.Add(':DESCRIPCION_MOVIMIENTO,:VALOR_DEBITO,:VALOR_CREDITO)');
                if ((AR^.Valor > 0) and (SaldoAhorros > AR^.Valor)) then
                 begin
                   ParamByName('ID_AGENCIA').AsInteger            := Agencia;
                   ParamByName('ID_TIPO_CAPTACION').AsInteger     := AR^.IdTipo;
                   ParamByName('NUMERO_CUENTA').AsInteger         := AR^.Cuenta;
                   ParamByName('DIGITO_CUENTA').AsInteger         := StrToInt(DigitoControl(AR^.IdTipo,Format('%.7d',[AR^.Cuenta])));
                   ParamByName('FECHA_MOVIMIENTO').AsDate         := fFechaActual;
                   ParamByName('HORA_MOVIMIENTO').AsTime          := fHoraActual;
                   ParamByName('ID_TIPO_MOVIMIENTO').AsInteger    := 31;
                   ParamByName('DOCUMENTO_MOVIMIENTO').AsString   := Format('%.8d',[Consecutivo]);
                   ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Devolución de Cheque No.' + ' ' + AR^.Cheque + ' ' + AR^.DeBanco;
                   //LeftStr(Format(Descripcion,[AR^.DeBanco,AR^.IdTipo,AR^.IdAgencia,AR^.Cuenta]),50);
                   ParamByName('VALOR_DEBITO').AsCurrency         := 0;
                   ParamByName('VALOR_CREDITO').AsCurrency        := AR^.Valor;
                   try
                     ExecSQL;
                   except
                     Transaction.Rollback;
                     raise;
                     Continue;
                   end;
                 end;

                //Marcar Cheque como Devuelto
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('UPDATE "tes$cheques" SET DEVUELTO = 1 WHERE ID_BANCO = :BANCO AND NUMERO_CHEQUE = :CHEQUE');
                IBSQL2.SQL.Add('AND ID_AGENCIA = :AG AND ID_TIPO_CAPTACION = :TP AND NUMERO_CUENTA = :CTA AND DIGITO_CUENTA = :DGT AND VALOR = :VALOR');
                IBSQL2.ParamByName('BANCO').AsInteger := AR^.IdBanco;
                IBSQL2.ParamByName('CHEQUE').AsInteger := StrToInt(AR^.Cheque);
                IBSQL2.ParamByName('AG').AsInteger := Agencia;
                IBSQL2.ParamByName('TP').AsInteger := AR^.IdTipo;
                IBSQL2.ParamByName('CTA').AsInteger := AR^.Cuenta;
                IBSQL2.ParamByName('DGT').AsInteger := StrToInt(DigitoControl(AR^.IdTipo,Format('%.7d',[AR^.Cuenta])));
                IBSQL2.ParamByName('VALOR').AsCurrency := AR^.Valor;
                try
                  IBSQL2.ExecQuery;
                  if RecordCount < 0 then
                    MessageDlg('Error Marcando Cheque',mtError,[mbcancel],0);
                except
                  raise;
                end;

             IBSQL2.Transaction.Commit;
             IBComprobante.Transaction.Commit;
             CBNotas.Items.Add(Format('%.8d',[Consecutivo]));
          end; //fin de with
//          end;
         end; // del if
        end; // del for

        if CBNotas.Items.Count > 0 then begin
           cmdReporte.Enabled := True;
           cmdReporte.Click;
        end;
end;

procedure TfrmDevolucionCheques.cmdReporteClick(Sender: TObject);
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

procedure TfrmDevolucionCheques.reporteInitDetailBandDataSet(
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

procedure TfrmDevolucionCheques.DBLCBContableEnter(Sender: TObject);
begin
        (Sender as TDBLookupComboBox).DropDown;
end;

procedure TfrmDevolucionCheques.DBLCBContableExit(Sender: TObject);
var AR:PTablaCheque;
 ARow :Integer;
begin
        if (Sender as TDBLookupComboBox).Text = '' then Exit;

        try
         AR := Lista.Items[(Sender as TDBLookupComboBox).Tag-1];
         AR^.BContable := (Sender as TDBLookupComboBox).KeyValue;
        finally
        end;

        ARow := (Sender as TDBLookupComboBox).Tag;

        if (ARow = (SGCheques.RowCount - 1)) then begin
           AR := Lista.Items[ARow-1];
           EdTotalConsignaciones.Caption := IntToStr(Lista.Count);
           SGCheques.RowCount := SGCheques.RowCount + 1;
           Application.ProcessMessages;
           New(AR);
           AR^.IdBanco := -1;
           AR^.DeBanco := '';
           AR^.IdTipo := -1;
           AR^.DeTipo := '';
           AR^.IdIdent := 0;
           AR^.IdPerso := '';
           AR^.Cheque := '';
           AR^.Cuenta := 0;
           AR^.Valor  := 0;
           AR^.BContable := -1;
           Lista.Add(AR);
           SGCheques.Col := 0;
           adicionarbanco(SGCheques.RowCount - 1);
           adicionartipoahorro(SGCheques.RowCount - 1);
           adicionarbancocontable(SGCheques.RowCount -1);
           cmdProcesar.Enabled := True;
        end;

        (SGCheques.Objects[0,SGCheques.Row+1] as TDBLookupComboBox).SetFocus;

end;

end.
