unit UnitCambioNumeracionCifin;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBSQL, StrUtils, DBClient;

type
  TfrmCambioNumeracionCifin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdProcesar: TBitBtn;
    EdFechaCorte: TDateTimePicker;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox2: TGroupBox;
    Bar: TProgressBar;
    CmdGenerar: TBitBtn;
    CmdEnviar: TBitBtn;
    CmdVer: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBSNoCredito: TIBSQL;
    IBSClientes: TIBSQL;
    IBSCodeudores: TIBSQL;
    IBSCuotas: TIBSQL;
    IBQuery2: TIBQuery;
    Ed1: TEdit;
    OpenDialog1: TOpenDialog;
    DataAnterior: TClientDataSet;
    DataAnteriorCOLOCACION: TStringField;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGenerarClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
  private
    procedure PrimerPaso;
    procedure SegundoPaso;
    procedure TercerPaso;
    { Private declarations }
  public
    { Public declarations }
  end;


type Registro1 = Record
    TRegistro:string; // * 1 N
    TProducto:string; // * 2 N
    TEntidad:string; // * 4 N
    CEntidad:string; // * 10 N
    IdenCifin:string; // * 18 A
    TOblig:string; // * 8 N
    FCorte:string; // * 8 Fecha
end;

type Registro = Record
    TRegistro:string; // * 1 N
    Numero:string; // * 20 A
    CodSucVie:string; // 6 A
    NNumero:string; // * 20 A
    CodSucNue:string; // * 6 N
end;

var
  frmCambioNumeracionCifin: TfrmCambioNumeracionCifin;
  PlanoReporte:TStringList;
  PlanoEncabezado:TStringList;
  SumaRegistros:Integer;
  LineaF, LineaE:string;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobalesCol,UnitDmcolocacion, UnitMuestroArchivoCifin, UnitGlobales;

procedure TfrmCambioNumeracionCifin.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCambioNumeracionCifin.PrimerPaso;
var cadena:string;
    LineaE:Registro1;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Encabezado del Archivo
      LineaE.TRegistro := '1';
      LineaE.TProducto := '21';
      LineaE.TEntidad := '0201';
      LineaE.CEntidad := '0000003264';
      LineaE.IdenCifin := '162519            ';
      LineaE.TOblig := StringReplace(Format('%8d',[Sumaregistros + 2]),' ','0',[rfReplaceAll]);
      LineaE.FCorte := Format('%.4d',[YearOf(EdFechaCorte.Date)]) + Format('%.2d',[monthOf(EdFechaCorte.Date)]) + Format('%.2d',[dayOf(EdFechaCorte.Date)]);

      PlanoEncabezado.Add(LineaE.TRegistro + LineaE.TProducto + LineaE.TEntidad+
                          LineaE.CEntidad + LineaE.IdenCifin + LineaE.TOblig + LineaE.FCorte);

      CheckBox1.Checked := True;
end;

procedure TfrmCambioNumeracionCifin.SegundoPaso;
var cadena:string;
    LineaC:registro;
    ColocacionAnt:string;
    ColocacionNew:string;
    ColocacionFiltro:string;
    NoCod:Integer;
    Fecha:TDate;
    i1,i2,i,j: Integer;
    Entero: Integer;
    S1,S2 :TStringList;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        S1 := TStringList.Create;
        S1.LoadFromFile('C:\Cifin\CIFINANTERIOR.TXT');

        S2 := TStringList.Create;
        SumaRegistros := 0;
        for i := 0 to S1.Count - 1 do
        begin
          S2.Text := StringReplace(S1[i], #9, #13, [rfReplaceAll]);
          ColocacionAnt := StringReplace(Format('%-14s',[S2.Strings[0]]),' ' ,'0',[rfReplaceAll]) + '      ';
          ColocacionFiltro := '01' + StringReplace(Format('%-16s',[S2.Strings[0]]),' ' ,'0',[rfReplaceAll]);
          with IBSClientes do begin
           Close;
           SQL.Clear;
           SQL.Add('select first 1 ID_NUEVO from "col$cambioclaves"');
           SQL.Add('where ID_ANTERIOR =:"ID_ANTERIOR"');
           ParamByName('ID_ANTERIOR').AsString := ColocacionFiltro;
           ExecQuery;
           ColocacionNew := FieldByName('ID_NUEVO').AsString;
           Close;
          end;

          LineaC.TRegistro := '4';
          LineaC.Numero := ColocacionAnt;
          LineaC.CodSucVie := '1     ';
          LineaC.NNumero := '00' + ColocacionNew;
          LineaC.CodSucNue := '1     ';

          PlanoReporte.Add(LineaC.TRegistro + LineaC.Numero +
                           LineaC.CodSucVie + LineaC.NNumero + LineaC.CodSucNue);
          SumaRegistros := SumaRegistros + 1;
        end;
        CheckBox2.Checked := True;
        S1.Free;
        S2.Free;
end;

procedure TfrmCambioNumeracionCifin.TercerPaso;
var cadena:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Identificador
      cadena := '9';
      LineaF := cadena;
// Numero de Regitros
      cadena := StringReplace(Format('%8d',[SumaRegistros + 2]),' ','0',[rfReplaceAll]);
      LineaF := LineaF + cadena;

//      PlanoReporte.Add(LineaF);
      CheckBox3.Checked := True;
end;

procedure TfrmCambioNumeracionCifin.CmdProcesarClick(Sender: TObject);
begin
        CmdProcesar.Enabled := False;
        primerpaso;
        segundopaso;
        tercerpaso;
        CmdGenerar.Enabled := True;
end;

procedure TfrmCambioNumeracionCifin.FormShow(Sender: TObject);
begin
        PlanoReporte := TStringList.Create;
        PlanoEncabezado := TStringList.Create;
        PlanoReporte.Clear;
        PlanoEncabezado.Clear;
        dmGeneral.IBDatabase1.Open;
        dmGeneral.IBTransaction1.Active := True;
        dmColocacion.IBDSagencias.Active := True;
end;

procedure TfrmCambioNumeracionCifin.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmCambioNumeracionCifin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmCambioNumeracionCifin.CmdGenerarClick(Sender: TObject);
begin
        PlanoReporte.Add(LineaF);
        PlanoEncabezado.AddStrings(PlanoReporte);
        PlanoEncabezado.SaveToFile('c:/Cifin/CifinCambioNumeracion.TXT');
        CmdVer.Enabled := True;
end;

procedure TfrmCambioNumeracionCifin.CmdVerClick(Sender: TObject);
var frmMuestroArchivoCifin : TfrmMuestroArchivoCifin;
begin
        frmMuestroArchivoCifin := TfrmMuestroArchivoCifin.Create(Self);
        frmMuestroArchivoCifin.ShowModal;
end;

end.
