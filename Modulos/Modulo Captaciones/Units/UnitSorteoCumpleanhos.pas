unit UnitSorteoCumpleanhos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient, ExtCtrls, UnitDmGeneral,
  IBCustomDataSet, IBQuery, IBDatabase, IBSQL, DateUtils, DataSetToExcel;

type
  TfrmSorteoCumpleanhos = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edPeriodo: TComboBox;
    btnSorteo: TBitBtn;
    DBGasociado: TDBGrid;
    DSasociado: TDataSource;
    CDSasociado: TClientDataSet;
    CDSasociadoCUENTA: TIntegerField;
    CDSasociadoDOCUMENTO: TStringField;
    CDSasociadoASOCIADO: TStringField;
    CDSasociadoDIA: TIntegerField;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edCuentaGanador: TEdit;
    btnExportar: TBitBtn;
    Panel1: TPanel;
    btnCerrar: TBitBtn;
    IBQasociado: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBQpersona: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBSQL4: TIBSQL;
    IBTransaction2: TIBTransaction;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edCuenta: TEdit;
    edAsociadoGanador: TEdit;
    edAsociado: TEdit;
    btnDoSorteo: TBitBtn;
    CDSasociadoCSC: TIntegerField;
    SD1: TSaveDialog;
    procedure edPeriodoChange(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSorteoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnDoSorteoClick(Sender: TObject);
  private
    function ValidoParaSorteo(id_identificacion: Integer; id_persona: String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSorteoCumpleanhos: TfrmSorteoCumpleanhos;
  Hoy: TDateTime;
  Ano: String;
  Fecha1: TDateTime;
  Fecha2: TDateTime;
  SaldoMinimoApo: Currency;
  SaldoMinimoRin: Currency;
  SaldoMinimoJuv: Currency;

implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol, UnitDmColocacion;

procedure TfrmSorteoCumpleanhos.edPeriodoChange(Sender: TObject);
begin
        btnSorteo.Enabled := True;
end;

procedure TfrmSorteoCumpleanhos.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmSorteoCumpleanhos.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
        IBTransaction1.StartTransaction;
end;

procedure TfrmSorteoCumpleanhos.btnSorteoClick(Sender: TObject);
var
  CSC : Integer;
begin
        IBQasociado.Close;
        IBQasociado.SQL.Add('SELECT t.ID_TIPO_CAPTACION, t.NUMERO_CUENTA, e.DESCRIPCION, p.ID_IDENTIFICACION, p.ID_PERSONA, p.FECHA_NACIMIENTO, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO, p.NOMBRE FROM "gen$persona" p');
        IBQasociado.SQL.Add('INNER JOIN "cap$maestrotitular" t ON t.ID_IDENTIFICACION = p.ID_IDENTIFICACION and t.ID_PERSONA = p.ID_PERSONA ');
        IBQasociado.SQL.Add('INNER JOIN "cap$maestro" m ON t.ID_TIPO_CAPTACION = m.ID_TIPO_CAPTACION and t.ID_AGENCIA = m.ID_AGENCIA and t.NUMERO_CUENTA = m.NUMERO_CUENTA and t.DIGITO_CUENTA = m.DIGITO_CUENTA ');
        IBQasociado.SQL.Add('INNER JOIN "cap$tiposestado" e ON m.ID_ESTADO = e.ID_ESTADO ');
        IBQasociado.SQL.Add('WHERE EXTRACT(MONTH FROM p.FECHA_NACIMIENTO) = :MES and ');
        IBQasociado.SQL.Add('t.ID_TIPO_CAPTACION = 1 and ');
        IBQasociado.SQL.Add('e.SE_SUMA = 1');
        IBQasociado.ParamByName('MES').AsInteger := edPeriodo.ItemIndex + 1;
        IBQasociado.Open;
        CDSasociado.EmptyDataSet;
        CSC := 0;
        while not IBQasociado.Eof do
        begin
            Application.ProcessMessages;
            edAsociado.Text := IBQasociado.FieldByName('NOMBRE').AsString + ' ' + IBQasociado.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQAsociado.FieldByName('SEGUNDO_APELLIDO').AsString;
            edCuenta.Text := IntToStr(IBQasociado.FieldByName('NUMERO_CUENTA').AsInteger);
            if ValidoParaSorteo(IBQasociado.FieldByName('ID_IDENTIFICACION').AsInteger, IBQasociado.FieldByName('ID_PERSONA').AsString) then
            begin
             CSC := CSC + 1;
             CDSasociado.Insert;
             CDSasociadoCSC.Value := CSC;
             CDSasociadoCUENTA.Value := IBQasociado.FieldByName('NUMERO_CUENTA').AsInteger;
             CDSasociadoDOCUMENTO.Value := IBQasociado.FieldByName('ID_PERSONA').AsString;
             CDSasociadoASOCIADO.Value := IBQasociado.FieldByName('NOMBRE').AsString + ' ' + IBQasociado.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQAsociado.FieldByName('SEGUNDO_APELLIDO').AsString;
             CDSasociadoDIA.Value := DayOfTheMonth(IBQasociado.FieldByName('FECHA_NACIMIENTO').AsDateTime);
             CDSasociado.Post;
            end;
            IBQasociado.Next;
        end;
        if CDSasociado.RecordCount < 1 then
        begin
            ShowMessage('No hay asociados válidos para el sorteo');
            Exit;
        end
        else
        begin
            btnDoSorteo.Enabled := true;
            btnExportar.Enabled := true;
        end;
end;

function TfrmSorteoCumpleanhos.ValidoParaSorteo(id_identificacion: Integer; id_persona: String): Boolean;
var
Csc:Integer;
        Limpiomens   : Boolean;
        xEducacion   : Boolean;
        xAportesAct  : Boolean;
        xJuvenil     : Boolean;
        xApertura    : Boolean;
        xDeudas      : Boolean;
        xFianzas     : Boolean;
        xRindediario : Boolean;

        Ag, Tp, Nm, Dg: Integer;
        SaldoApoAct: Currency;
        SaldoRindediario: Currency;
        SaldoJuvenil: Currency;
begin
        Limpiomens   := False;
        xEducacion   := False;
        xAportesAct  := False;
        xJuvenil     := False;
        xApertura    := False;
        xDeudas      := False;
        xFianzas     := False;
        xRindediario := False;
        Csc := 0;

//        xAportesJ    := False;
  //      xRindediarioJ:= False;
    //    xJuvenilJ    := False;
      //  xDeudas      := True;
        //xAperturaJ   := False;

// Verificación de Asociado y Requisitos /// QUITAR FOTO
        with IBQPersona do begin
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,EDUCACION,FOTO from "gen$persona" where ID_IDENTIFICACION = :ID and');
          SQL.Add('ID_PERSONA = :PERSONA');
          ParamByName('ID').AsInteger := id_identificacion;
          ParamByName('PERSONA').AsString := id_persona;
          try
           Open;
           if RecordCount > 0 then begin
              //GroupBox1.Enabled := False;
              Application.ProcessMessages;
              if InttoBoolean(FieldByName('EDUCACION').AsInteger) then begin
                xEducacion := True;

              end
              else
              begin
                xEducacion := False;

              end;
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "cap$maestro".FECHA_APERTURA, "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and NUMERO_TITULAR = 1 and "cap$tiposestado".SE_SUMA <> 0 and "cap$maestro".ID_TIPO_CAPTACION = 1');
              IBSQL1.SQL.Add('order by "cap$maestrotitular".ID_AGENCIA ASC,"cap$maestrotitular".ID_TIPO_CAPTACION ASC,"cap$maestrotitular".NUMERO_CUENTA ASC,"cap$maestrotitular".DIGITO_CUENTA');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
              IBSQL1.ParamByName('ID_PERSONA').AsString := id_persona;
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                   Ag := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                   Tp := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                   Nm := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                   Dg := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                   //EdApertura.Caption := DateToStr(IBSQL1.FieldByName('FECHA_APERTURA').AsDate);
                   xApertura := True;
                   if IBSQL1.FieldByName('FECHA_APERTURA').AsDateTime > Hoy then
                     xApertura := False
                   else
                     xApertura := True;
                end
                else
                begin
                   Ag := 0;
                   Tp := 0;
                   Nm := 0;
                   Dg := 0;
                   SaldoApoAct := 0;
                   ShowMessage('La cuenta NO está Activa');
                   Limpiomens := True;

                   Exit;
               end;
              except
                Transaction.Rollback;
                raise;
              end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSQL1.ParamByName('AG').AsInteger := Ag;
              IBSQL1.ParamByName('TP').AsInteger := Tp;
              IBSQL1.ParamByName('NM').AsInteger := Nm;
              IBSQL1.ParamByName('DG').AsInteger := Dg;
              IBSQL1.ParamByName('ANO').AsString := Ano;
              IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
              IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                  SaldoApoAct := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                  if SaldoApoAct >= SaldoMinimoApo then
                    xAportesAct := True
                  else begin
                    xAportesAct := False;
                  end;
                end
                else
                begin
                  SaldoApoAct := 0;
                  xAportesAct := False;
                end;

              except
                Transaction.Rollback;
                raise;
              end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSQL1.ParamByName('AG').AsInteger := Ag;
              IBSQL1.ParamByName('TP').AsInteger := 2;
              IBSQL1.ParamByName('NM').AsInteger := Nm;
              IBSQL1.ParamByName('DG').AsInteger := StrToInt(DigitoControl(2,Format('%.7d',[Nm])));
              IBSQL1.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
              IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
              IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                  SaldoRindediario := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                  if SaldoRindediario >= SaldoMinimoRin then
                    xRindediario := True
                  else begin
                    xRindediario := False;
                  end;
                end
                else
                begin
                  SaldoRindediario := 0;
                  xRindediario := False;
                end;

              except
                Transaction.Rollback;
                raise;
              end;


              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
              IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
              IBSQL1.SQL.Add('and ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
              IBSQL1.ParamByName('ID_PERSONA').AsString := id_persona;
              try
               IBSQL1.ExecQuery;
               xDeudas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xDeudas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                Transaction.Rollback;
                raise;
              end;


              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colgarantias"');
              IBSQL1.SQL.Add('inner join "col$colocacion" ON ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA and');
              IBSQL1.SQL.Add('"col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
              IBSQL1.SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA and "col$colocacion".ID_ESTADO_COLOCACION < 4');
//              IBSQL1.SQL.Add('and "col$colocacion".ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
              IBSQL1.ParamByName('ID_PERSONA').AsString := id_persona;
              try
               IBSQL1.ExecQuery;
               xFianzas := True;
               if (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger in [2,3]) then
                  xFianzas := False;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xFianzas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                Transaction.Rollback;
                raise;
              end;


              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select * from "cap$maestrotitular"');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and "cap$maestrotitular".ID_TIPO_CAPTACION = 4 and "cap$tiposestado".SE_SUMA <> 0');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
              IBSQL1.ParamByName('ID_PERSONA').AsString := id_persona;
              try
               IBSQL1.ExecQuery;
               xJuvenil := True;
               if IBSQL1.RecordCount > 0 then
                while not IBSQL1.Eof do begin
                    IBSQL2.Close;
                    IBSQL2.SQL.Clear;
                    IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
                    IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                    IBSQL2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                    IBSQL2.ParamByName('NM').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
                    IBSQL2.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
                    IBSQL2.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
                    try
                      IBSQL2.ExecQuery;
                      if IBSQL2.RecordCount > 0 then
                      while not IBSQL2.Eof do begin
                         SaldoJuvenil := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                         if SaldoJuvenil < SaldoMinimoJuv then begin
                           xJuvenil := False;
                         end;
                         SaldoJuvenil := 0;
                         IBSQL2.Next;
                      end;

                    except
                      Transaction.Rollback;
                      raise;
                    end;
                 IBSQL1.Next;
                end;

               except
                Transaction.Rollback;
                raise;
              end;
// Fin verificación de Requisitos
// Verificar valores máximos, entregados y pendientes
{           if SaldoApoAnt < SaldoApoAct then
              SaldoValido := SaldoApoAnt
           else
              SaldoValido := SaldoApoAct;
}
//

// Fin Verificar Valores
           end
           else
           begin
              MessageDlg('Asociado no existe!',mtError,[mbcancel],0);
              Exit;
           end;
          except
           Transaction.Rollback;
           raise;
          end;
        end;

        if xEducacion  and
           xAportesAct and
           xJuvenil    and
           xApertura   and
           xDeudas     and
           xFianzas    and
           xRindediario then
        begin
          result := true;
        end
        else
        begin
          result := false;
        end;

end;

procedure TfrmSorteoCumpleanhos.FormShow(Sender: TObject);
begin
        Hoy := fFechaActual;
        Ano := IntToStr(YearOf(Hoy));
        TryEncodeDate(YearOf(Hoy),01,01,Fecha1);
        Fecha2 := Hoy;
        dmColocacion.IBSQL.Transaction.StartTransaction;
        with IBSQL4 do begin
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add(' SALDO_MINIMO');
          SQL.Add('FROM');
          SQL.Add(' "cap$tipocaptacion"');
          SQL.Add('WHERE');
          SQL.Add(' ID_TIPO_CAPTACION = :ID');
// Aportaciones sociales
          ParamByName('ID').AsInteger := 1;
          try
           ExecQuery;
           SaldoMinimoApo := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;

// Ahorro Rindediario
          Close;
          ParamByName('ID').AsInteger := 2;
          try
           ExecQuery;
           SaldoMinimoRin := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;
// Ahorro Juvenil
          Close;
          ParamByName('ID').AsInteger := 4;
          try
           ExecQuery;
           SaldoMinimoJuv := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;

          Transaction.Commit;
          Close;
        end;
        
end;

procedure TfrmSorteoCumpleanhos.btnExportarClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          if (SD1.Execute) then
          begin
           CDSasociado.First;
           ExcelFile := TDataSetToExcel.Create(CDSasociado,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

procedure TfrmSorteoCumpleanhos.btnDoSorteoClick(Sender: TObject);
var
  iteraccion: Integer;
  i: Integer;
  ganador: integer;
  cantidad: integer;
begin
        Randomize;
        cantidad := CDSasociado.RecordCount + 1;
        for i := 0 to 999 do
        begin
          ganador := Random(cantidad);
          cdsasociado.First;
          CDSasociado.MoveBy(ganador);
        end;
        edAsociadoGanador.Text := CDSasociado.FieldByName('ASOCIADO').AsString;
        edCuentaGanador.Text :=  CDSasociado.FieldByName('CUENTA').AsString;
end;

end.
