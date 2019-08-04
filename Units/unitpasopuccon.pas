unit unitpasopuccon;

interface

uses
  SysUtils, Types, Classes, DateUtils, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QComCtrls, IBSQL, DB, IBDatabase, QButtons, QMask;

type
  TfrmImportarPuc = class(TForm)
    Label1: TLabel;
    Ed1: TEdit;
    BtnExaminar: TButton;
    Label2: TLabel;
    Ed2: TMaskEdit;
    BitBtn1: TBitBtn;
    IBTransaction1: TIBTransaction;
    Dataset: TIBSQL;
    OpenDialog1: TOpenDialog;
    Bar1: TProgressBar;
    Bar: TProgressBar;
    IBDatabase1: TIBDatabase;
    Label3: TLabel;
    EdAgencia: TEdit;
    Label4: TLabel;
    EdMes: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnExaminarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type Personas = record
    CODIGO : String;
    ID_AGENCIA: Integer;
    CLAVE: string;
    NOMBRE: string;
    TIPO: string;
    CODIGOMAYOR: String;
    MOVIMIENTO: Integer;
    ESBANCO:Integer;
    INFORME:String;
    NIVEL:Integer;
    NATURALEZA:string;
    CENTROCOSTO:string;
    SALDOINICIAL:Currency;
end;

var
  frmImportarPuc: TfrmImportarPuc;
  F:TextFile;
  S1:TStringList;
implementation

{$R *.xfm}

procedure TfrmImportarPuc.BitBtn1Click(Sender: TObject);
var
     i,j: Integer;
     Entero: Integer;
     cadena : string;
     codigo : string[18];
     codigomayor : String[18];
     Informe : string;
     S2 :TStringList;
 begin
        Entero := 0;
        j := 0;
        S2 := TStringList.Create;
        Bar.Min := 0;
        Bar.Max := StrToInt(Trim(Ed2.Text));
        Bar.Position := 0;
        Bar1.Position := 0;
        for i := 0 to S1.Count - 1 do
        begin
           Application.ProcessMessages;
           Bar.Position := Bar.Position + 1;
           S2.Text := StringReplace(S1[i], #9, #13, [rfReplaceAll]);
           with DataSet do
           begin
              try
                codigo := '000000000000000000';
               //Insert(LeftStr(Codigo,Longitud),Cadena,1)
                Insert(S2.Strings[0],Codigo,0);
                ParamByName('CODIGO').AsString := codigo;
                Bar1.Position := 5;
                ParamByName('ID_AGENCIA').AsInteger := StrToInt(EdAgencia.Text);
                ParamByName('MES').AsInteger := StrToInt(EdMes.Text);
                Bar1.Position := 10;
                cadena := formatcurr('00000',StrToInt(S2.Strings[1]));
//                ParamByName('CLAVE').AsString := cadena;
                Bar1.Position := 15;
                ParamByName('NOMBRE').AsString := S2.Strings[2];
                Bar1.Position := 20;
                ParamByName('TIPO').AsString := '00';
                Bar1.Position := 25;
                codigomayor := '000000000000000000';
                Insert(S2.Strings[3],Codigomayor,0);
                ParamByName('CODIGOMAYOR').AsString := Codigomayor;
                Bar1.Position := 30;
                if S2.Strings[4] = 'S' then Entero := 1 else
                if S2.Strings[4] = 'N' then Entero := 0;
                ParamByName('MOVIMIENTO').AsInteger := Entero;
                Bar1.Position := 35;
                ParamByName('ESBANCO').AsInteger := 0;
                Bar1.Position := 40;
                if S2.Strings[5] = 'N' then Informe := '00' else
                if S2.Strings[5] = 'R' then Informe := '01' else
                if S2.Strings[5] = 'I' then Informe := '02' else
                if S2.Strings[5] = 'P' then Informe := '03' else
                                            Informe := '00';
                ParamByName('INFORME').AsString := Informe;
                Bar1.Position := 50;
                ParamByName('NIVEL').AsInteger := StrToInt(S2.Strings[6]);
                Bar1.Position := 60;
                ParamByName('NATURALEZA').AsString := 'D';
                Bar1.Position := 70;
                ParamByName('CENTROCOSTO').AsString := S2.Strings[7];
                Bar1.Position := 80;
                ParamByName('SALDOACTUAL').AsCurrency := StrToCurr(S2.Strings[8]);;
                Bar1.Position := 90;
                if (Codigo >= '210000000000000000') and
                   (codigo <= '212515000000000000') and
                   (entero = 1) then
                   ParamByName('ESCAPTACION').AsInteger := 1
                else
                   ParamByName('ESCAPTACION').AsInteger := 0;
                Bar1.Position := 100;
                if (Codigo >= '140000000000000000') and
                   (codigo <= '149800000000000000') and
                   (entero = 1) then
                   ParamByName('ESCOLOCACION').AsInteger := 1
                else
                   ParamByName('ESCOLOCACION').AsInteger := 0;
                j := j + 1;
                ExecQuery;
                if j = 100 then
                begin
                        DataSet.Transaction.CommitRetaining;
                        j := 0;
                end;
               except
                Messagedlg('Error en Codigo:'+ Codigo,mterror,[mbok],0);
                raise;
               end;
           end;
        end;
        DataSet.Close;
        S1.Free;
        S2.Free;
end;

procedure TfrmImportarPuc.BtnExaminarClick(Sender: TObject);
begin
        OpenDialog1.DefaultExt := '.txt';
        OpenDialog1.InitialDir := 'C:\planos';
        OpenDialog1.Title := 'Seleccione el Archivo a Importar';
        OpenDialog1.Filter := 'Archivos Texto (*.txt)|*.TXT';
        OpenDialog1.Options := [ofFileMustExist];
        if OpenDialog1.Execute then
        begin
           Ed1.Text := OpenDialog1.FileName;
           S1 := TStringList.Create;
           S1.LoadFromFile(Ed1.Text);
           Ed2.Text := IntToStr(S1.Count);
        end;
end;

procedure TfrmImportarPuc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Action := CaFree;
end;

procedure TfrmImportarPuc.FormShow(Sender: TObject);
begin
        try
        IBDatabase1.Open;
        if IBDatabase1.Connected then
           MessageDlg('Conexión Exitosa',mtError,[mbOk],0);
        except
           MessageDlg('Conexión Fallida',mtError,[mbOk],0);
        end;
        Dataset.Transaction.Active := True;
        EdMes.Text  := IntToStr(monthof(Date) - 1);
end;

end.
