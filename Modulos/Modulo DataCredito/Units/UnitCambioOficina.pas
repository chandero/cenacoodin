unit UnitCambioOficina;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBSQL, StrUtils, DBClient;

type
  TfrmCambioOficina = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdProcesar: TBitBtn;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    Bar: TProgressBar;
    CmdGenerar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    EdFecha1: TDateTimePicker;
    CDObligaciones: TClientDataSet;
    Label2: TLabel;
    EdFecha2: TDateTimePicker;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CDObligacionesAGENCIA: TSmallintField;
    CDObligacionesCOLOCACION: TStringField;
    CDObligacionesTIPOID: TSmallintField;
    CDObligacionesIDPERSONA: TStringField;
    IB1: TIBSQL;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGenerarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure SegundoPaso;
    procedure PrimerPAso;
    { Private declarations }
  public
    { Public declarations }
  end;


type RegistroD = Record
    NumeroA:string; // * 18
    Identificacion:string; // 11
    TipoIdent:string; // * 1
    NumeroN:string; // * 18
end;

type RegistroC = Record
    NumeroA:string; // * 20
    OficinaA:string; // 6
    NumeroN:string; // * 20
    OficinaN:string; // 6
end;

var
  frmCambioOficina: TfrmCambioOficina;
  PlanoData:TStringList;
  PlanoCifin:TStringList;
  LineaC:string;
  LineaD:string;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobalesCol,UnitDmcolocacion, UnitMuestroArchivoCifin, UnitGlobales;

procedure TfrmCambioOficina.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;


procedure TfrmCambioOficina.SegundoPaso;
var cadena:string;
    LineaD:registroD;
    LineaC:RegistroC;
    ColocacionNew:string;
    ConverColocacion:Int64;
begin
        CDObligaciones.Open;
        CDObligaciones.Last;
        Bar.Min := 0;
        Bar.Max := CDObligaciones.RecordCount;
        Bar.Position := 0;
        CDObligaciones.First;
        while not CDObligaciones.Eof do begin
          Bar.Position := CDObligaciones.RecNo;
          Application.ProcessMessages;

          //Inicio Datacredito
          ColocacionNew := IntToStr(Agencia) + CDObligaciones.FieldByName('COLOCACION').AsString;
          ConverColocacion := StrToInt64(ColocacionNew);
          ColocacionNew := Format('%.18d',[ConverColocacion]);       //'000000000000000000';
          ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);

          LineaD.NumeroA := ColocacionNew;
          case CDObligaciones.FieldByName('TIPOID').AsInteger of
            3 : LineaD.TipoIdent := '1';
            4 : LineaD.TipoIdent := '2';
            6 : LineaD.TipoIdent := '3';
            7 : LineaD.TipoIdent := '4';
            9 : LineaD.TipoIdent := '5';
            0 : LineaD.TipoIdent := '1';
          end;
          LineaD.Identificacion := StringReplace(Format('%11s',[trim(CDObligaciones.FieldByName('IDPERSONA').AsString)]),' ','0',[rfReplaceAll]);

          ColocacionNew := IntToStr(CDObligaciones.FieldByName('AGENCIA').AsInteger) + CDObligaciones.FieldByName('COLOCACION').AsString;
          ConverColocacion := StrToInt64(ColocacionNew);
          ColocacionNew := Format('%.18d',[ConverColocacion]);       //'000000000000000000';
          ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);

          LineaD.NumeroN := ColocacionNew;

          PlanoData.Add(LineaD.NumeroA + LineaD.Identificacion +
                        LineaD.TipoIdent + LineaD.NumeroN);

          IB1.Close;
          IB1.SQL.Clear;
          IB1.SQL.Add('SELECT "col$colgarantias".ID_COLOCACION, "col$colgarantias".ID_IDENTIFICACION,');
          IB1.SQL.Add('"col$colgarantias".ID_PERSONA, "col$colgarantias".CSC_GARANTIA');
          IB1.SQL.Add('FROM "col$colgarantias" WHERE "col$colgarantias".ID_COLOCACION = :ID_COLOCACION');
          IB1.ParamByName('ID_COLOCACION').AsString := CDObligaciones.FieldByName('COLOCACION').AsString;
          IB1.ExecQuery;

          while not IB1.Eof do begin
           ColocacionNew := IntToStr(Agencia) + IB1.FieldByName('ID_COLOCACION').AsString;
           ConverColocacion := StrToInt64(ColocacionNew);
           ColocacionNew := ColocacionNew + 'C' + IntToStr(IB1.FieldByName('CSC_GARANTIA').AsInteger);
           ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);

           LineaD.NumeroA := ColocacionNew;
           case IB1.FieldByName('ID_IDENTIFICACION').AsInteger of
             3 : LineaD.TipoIdent := '1';
             4 : LineaD.TipoIdent := '2';
             6 : LineaD.TipoIdent := '3';
             7 : LineaD.TipoIdent := '4';
             9 : LineaD.TipoIdent := '5';
             0 : LineaD.TipoIdent := '1';
           end;
           LineaD.Identificacion := StringReplace(Format('%11s',[trim(IB1.FieldByName('ID_PERSONA').AsString)]),' ','0',[rfReplaceAll]);

           ColocacionNew := IntToStr(CDObligaciones.FieldByName('AGENCIA').AsInteger) + CDObligaciones.FieldByName('COLOCACION').AsString;
           ConverColocacion := StrToInt64(ColocacionNew);
           ColocacionNew := ColocacionNew + 'C' + IntToStr(IB1.FieldByName('CSC_GARANTIA').AsInteger);
           ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);

           LineaD.NumeroN := ColocacionNew;

           PlanoData.Add(LineaD.NumeroA + LineaD.Identificacion +
                         LineaD.TipoIdent + LineaD.NumeroN);


           IB1.Next;
          end;
          IB1.Close;
          //Fin Datacredito

          //Inicio Cifin
          ColocacionNew := IntToStr(Agencia) + CDObligaciones.FieldByName('COLOCACION').AsString;
          ConverColocacion := StrToInt64(ColocacionNew);
          ColocacionNew := Format('%.20d',[ConverColocacion]);       //'000000000000000000';
          ColocacionNew := stringreplace(Format('%20s',[colocacionnew]),' ','0',[rfReplaceAll]);

          LineaC.NumeroA := ColocacionNew;
          LineaC.OficinaA := '00000' + IntToStr(Agencia);

          ColocacionNew := IntToStr(CDObligaciones.FieldByName('AGENCIA').AsInteger) + CDObligaciones.FieldByName('COLOCACION').AsString;
          ConverColocacion := StrToInt64(ColocacionNew);
          ColocacionNew := Format('%.20d',[ConverColocacion]);       //'000000000000000000';
          ColocacionNew := stringreplace(Format('%20s',[colocacionnew]),' ','0',[rfReplaceAll]);

          LineaC.NumeroN := ColocacionNew;
          LineaC.OficinaN := '00000' + IntToStr(CDObligaciones.FieldByName('AGENCIA').AsInteger);

          PlanoCifin.Add(LineaC.NumeroA + LineaC.OficinaA +
                        LineaC.NumeroN + LineaC.OficinaN);

          IB1.Close;
          IB1.SQL.Clear;
          IB1.SQL.Add('SELECT "col$colgarantias".ID_COLOCACION, "col$colgarantias".ID_IDENTIFICACION,');
          IB1.SQL.Add('"col$colgarantias".ID_PERSONA, "col$colgarantias".CSC_GARANTIA');
          IB1.SQL.Add('FROM "col$colgarantias" WHERE "col$colgarantias".ID_COLOCACION = :ID_COLOCACION');
          IB1.ParamByName('ID_COLOCACION').AsString := CDObligaciones.FieldByName('COLOCACION').AsString;
          IB1.ExecQuery;

          while not IB1.Eof do begin
           ColocacionNew := IntToStr(Agencia) + IB1.FieldByName('ID_COLOCACION').AsString;
           ConverColocacion := StrToInt64(ColocacionNew);
           ColocacionNew := ColocacionNew + 'C' + IntToStr(IB1.FieldByName('CSC_GARANTIA').AsInteger);
           ColocacionNew := StringReplace(Format('%20s',[colocacionnew]),' ','0',[rfReplaceAll]);

           LineaC.NumeroA := ColocacionNew;
           LineaC.OficinaA := '00000' + IntToStr(Agencia);

           ColocacionNew := IntToStr(CDObligaciones.FieldByName('AGENCIA').AsInteger) + CDObligaciones.FieldByName('COLOCACION').AsString;
           ConverColocacion := StrToInt64(ColocacionNew);
           ColocacionNew := ColocacionNew + 'C' + IntToStr(IB1.FieldByName('CSC_GARANTIA').AsInteger);
           ColocacionNew := stringreplace(Format('%20s',[colocacionnew]),' ','0',[rfReplaceAll]);

           LineaC.NumeroN := ColocacionNew;
           LineaC.OficinaN := '00000' + IntToStr(CDObligaciones.FieldByName('AGENCIA').AsInteger);

           PlanoCifin.Add(LineaC.NumeroA + LineaC.OficinaA +
                         LineaC.NumeroN + LineaC.OficinaN);


           IB1.Next;
          end;
          IB1.Close;
          //Fin Cifin

         CDObligaciones.Next;
        end;


        CheckBox2.Checked := True;
        Application.ProcessMessages;
end;

procedure TfrmCambioOficina.CmdProcesarClick(Sender: TObject);
begin
        CmdProcesar.Enabled := False;
        primerpaso;
        segundopaso;
        CmdGenerar.Enabled := True;
end;

procedure TfrmCambioOficina.FormShow(Sender: TObject);
begin
        PlanoData := TStringList.Create;
        PlanoData.Clear;
        PlanoCifin := TStringList.Create;
        PlanoCifin.Clear;
        dmGeneral.IBDatabase1.Open;
        dmGeneral.IBTransaction1.Active := True;
        dmColocacion.IBDSagencias.Active := True;
        EdFecha1.Date := Date;
        EdFecha2.Date := Date;
end;

procedure TfrmCambioOficina.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmCambioOficina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmCambioOficina.CmdGenerarClick(Sender: TObject);
begin
        PlanoData.SaveToFile('c:/DataNovedades' + IntToStr(YearOf(EdFecha2.Date)) + IntToStr(MonthOf(EdFecha2.Date)) + '.TXT');
        PlanoCifin.SaveToFile('c:/CifinNovedades' + IntToStr(YearOf(EdFecha2.Date)) + IntToStr(MonthOf(EdFecha2.Date)) + '.TXT');
        CheckBox3.Checked := True;
end;

procedure TfrmCambioOficina.PrimerPaso;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        with IBQuery1 do begin
         SQL.Add('SELECT "col$colocacion".ID_COLOCACION, "col$colocacion".ID_IDENTIFICACION,');
         SQL.Add('"col$colocacion".ID_PERSONA, "tras$registro".ID_AGENCIA FROM  "col$colocacion"');
         SQL.Add('INNER JOIN "tras$registro" ON ("col$colocacion".ID_PERSONA="tras$registro".ID_PERSONA)');
         SQL.Add('AND ("col$colocacion".ID_IDENTIFICACION="tras$registro".ID_IDENTIFICACION)');
         SQL.Add('WHERE ("col$colocacion".ID_ESTADO_COLOCACION IN (10,11,12)) AND ("tras$registro".FECHA BETWEEN :FECHA1 AND :FECHA2)');
         ParamByName('FECHA1').AsDate := Edfecha1.Date;
         ParamByName('FECHA2').AsDate := Edfecha2.Date;
         Open;
         Bar.Min := 0;
         Bar.Max := IBQuery1.RecordCount;
         Bar.Position := 0;

         while not Eof do BEGIN
          Bar.Position := IBQuery1.RecNo;
          Application.ProcessMessages;
          CDObligaciones.Open;
          CDObligaciones.Insert;
          CDObligaciones.FieldByName('AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
          CDObligaciones.FieldByName('COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
          CDObligaciones.FieldByName('TIPOID').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
          CDObligaciones.FieldByName('IDPERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
          CDObligaciones.Post;
          CDObligaciones.Close;
          Next;
         end;
         Close;
        end;

        CheckBox1.Checked := True;
end;
procedure TfrmCambioOficina.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
