unit UnitReversionAbonoCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, IBCustomDataSet,
  IBQuery;

type
  TfrmReversionAbonoCartera = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    GroupBox1: TGroupBox;
    Label31: TLabel;
    EdAgencia: TDBLookupComboBox;
    Label4: TLabel;
    EdNumeroColocacion: TMaskEdit;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure EdAgenciaExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmReversionAbonoCartera: TfrmReversionAbonoCartera;
  IdAgencia:Integer;
  IdColocacion:String;
  IdComprobante:Integer;
  CuotaReversar:Integer;
  FechaCapitalAnt:TDate;
  FechaInteresAnt:TDate;
  CuotaAnterior:Integer;
  AbonoCapital:Currency;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitdmColocacion, Unitglobales, UnitGlobalesCol;

procedure TfrmReversionAbonoCartera.EdNumeroColocacionExit(
  Sender: TObject);
begin
        IdColocacion := trim(EdNumeroColocacion.Text);
//**Seleccion de Datos Necesarios
        With IBQuery1 do
         begin
           Sql.Clear;
           sql.Add('Select ');
           sql.Add('"col$extracto"."CUOTA_EXTRACTO",');
           sql.Add('"col$extracto"."ABONO_CAPITAL",');
           sql.Add('"col$extracto"."INTERES_PAGO_HASTA",');
           sql.Add('"col$extracto"."CAPITAL_PAGO_HASTA",');
           sql.Add('"col$extracto"."ID_CBTE_COLOCACION"');
           sql.Add('from "col$extracto"');
           sql.Add('where ');
           sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
           sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION"');
           sql.Add('order by "col$extracto".FECHA_EXTRACTO');
           ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
           ParamByName('ID_COLOCACION').AsString := IdColocacion;
           Open;
           While not IBQuery1.Eof do
            begin
              Last;
              CuotaReversar := FieldByName('CUOTA_EXTRACTO').AsInteger;
              AbonoCapital := FieldByName('ABONO_CAPITAL').AsCurrency;
              IdComprobante := FieldByName('ID_CBTE_COLOCACION').AsInteger;
              IBQuery1.MoveBy(-1);
              CuotaAnterior := FieldByName('CUOTA_EXTRACTO').AsInteger;
              if not IBQuery1.Bof then
               begin
                 FechaCapitalAnt := FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;
                 FechaInteresAnt := FieldByName('INTERES_PAGO_HASTA').AsDateTime;
               end
              else
               begin
                 sql.Clear;
                 sql.Add('Select ');
                 sql.Add('"col$colocacion".FECHA_CAPITAL,');
                 sql.Add('"col$colocacion".FECHA_INTERES,');
                 sql.Add('"col$colocacion".AMORTIZA_CAPITAL,');
                 sql.Add('"col$colocacion".AMORTIZA_INTERES');
                 sql.Add('from "col$colocacion"');
                 sql.Add('Where ');
                 sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
                 sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
                 ParamByName('ID_AGENCIA').AsInteger := IDAgencia;
                 ParamByName('ID_COLOCACION').AsString := IdColocacion;
                 Open;
                 FechaCapitalAnt := CalculoFecha(FieldByName('FECHA_CAPITAL').AsDateTime,-FieldByName('AMORTIZA_CAPITAL').AsInteger);
                 FechaInteresAnt := CalculoFecha(FieldByName('FECHA_INTERES').AsDateTime,-FieldByName('AMORTIZA_INTERES').AsInteger);
                 Close;
               end;
              Close;
            end;
         end;
end;

procedure TfrmReversionAbonoCartera.EdAgenciaExit(Sender: TObject);
begin
        IdAgencia := EdAgencia.KeyValue;
end;

procedure TfrmReversionAbonoCartera.CmdAceptarClick(Sender: TObject);
begin
    if MessageDlg('Seguro de Reversar el Abono?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
       With IBQuery1 do
        Try
          sql.Clear;
          sql.Add('delete from "col$extracto"');
          sql.Add('where ');
          sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
          sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
          sql.Add('"col$extracto".ID_CBTE_COLOCACION =:"ID_CBTE_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
          ParamByName('ID_COLOCACION').AsString := IdColocacion;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := IdComprobante;
          Open;

          sql.Clear;
          sql.Add('delete from "col$extractodet"');
          sql.Add('where ');
          sql.Add('"col$extractodet".ID_AGENCIA =:"ID_AGENCIA" and');
          sql.Add('"col$extractodet".ID_COLOCACION =:"ID_COLOCACION" and');
          sql.Add('"col$extractodet".ID_CBTE_COLOCACION =:"ID_CBTE_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
          ParamByName('ID_COLOCACION').AsString := IdColocacion;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := IdComprobante;
          Open;

          sql.Clear;
          sql.Add('update "col$tablaliquidacion" set');
          sql.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
          sql.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
          sql.Add(' where ');
          sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
          sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
          ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
          ParamByName('ID_COLOCACION').AsString := IdColocacion;
          ParamByName('CUOTA_NUMERO').AsInteger := CuotaReversar;
          ParamByName('PAGADA').AsInteger := 0;
          ParamByName('FECHA_PAGADA').Clear;
          Open;

          sql.Clear;
          sql.Add('update "col$colocacion" set ');
          sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" - :"ABONOS_CAPITAL",');
          sql.Add('"col$colocacion"."FECHA_CAPITAL" =:"FECHA_CAPITAL",');
          sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
          sql.Add(' where ');
          sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
          ParamByName('ID_COLOCACION').AsString := IdColocacion;
          ParamByName('ABONOS_CAPITAL').AsCurrency := AbonoCapital;
          ParamByName('FECHA_CAPITAL').AsDate := FechaCapitalAnt;
          ParamByName('FECHA_INTERES').AsDate := FechaInteresAnt;
          Open;
          Close;
        except
          Transaction.Rollback;
          MessageDlg('Error al Reversar Abono',mtInformation,[mbOK],0);
          Exit;
        end;
       dmGeneral.IBTransaction1.Commit;
       MessageDlg('Abono Reversado',mtInformation,[mbOK],0);
       Inicializar;
       CmdAceptar.Enabled := False;
       CmdCerrar.SetFocus;
     end
    else
     begin
       dmGeneral.IBTransaction1.Rollback;
       MessageDlg('Abono NO Reversado',mtInformation,[mbOK],0);
       Inicializar;
       CmdAceptar.Enabled := False;
       CmdCerrar.SetFocus;
     end;
end;

procedure TfrmReversionAbonoCartera.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmReversionAbonoCartera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmReversionAbonoCartera.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;

        EdAgencia.KeyValue := Agencia;
        dmColocacion.IBDSagencias.Open;
        dmColocacion.IBDSagencias.Last;
        dmColocacion.IBDSagencias.First;
end;

procedure TfrmReversionAbonoCartera.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmReversionAbonoCartera.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmReversionAbonoCartera.Inicializar;
begin
        IdAgencia:=Agencia;
        IdColocacion:='';
        IdComprobante:=0;
        CuotaReversar:=0;
        AbonoCapital:=0;
        FechaCapitalAnt:=Date;
        FechaInteresAnt:=Date;

        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;

        EdAgencia.KeyValue := Agencia;
        EdNumeroColocacion.Text := IdColocacion;
        dmColocacion.IBDSagencias.Open;
        dmColocacion.IBDSagencias.Last;
        dmColocacion.IBDSagencias.First;
end;

end.
