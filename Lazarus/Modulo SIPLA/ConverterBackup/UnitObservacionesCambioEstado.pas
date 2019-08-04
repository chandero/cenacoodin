unit UnitObservacionesCambioEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, DBCtrls, ExtCtrls, Grids, DBGrids, DB,
  IBCustomDataSet, IBQuery, IBDatabase, JvStringGrid, Buttons, IBSQL;

type
  TfrmObservacionesCambioEstado = class(TForm)
    Panel1: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    EdDigitoCap: TStaticText;
    Label26: TLabel;
    EdNombreCap: TStaticText;
    Panel2: TPanel;
    IBTObsEstado: TIBTransaction;
    Grid: TJvStringGrid;
    CmdCerrar: TBitBtn;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    EdTipo: TStaticText;
    EdNumeroCap: TStaticText;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FAg:Integer;
    FTp:Integer;
    FCta:Integer;
    FDgt:Integer;
    { Private declarations }
  public
    property Tipo:Integer read FTp Write FTp;
    property AgenciaA:Integer read FAg Write FAg;
    property Cuenta:Integer read FCta Write FCta;
    property Digito:Integer read FDgt Write FDgt;
    { Public declarations }
  end;

var
  frmObservacionesCambioEstado: TfrmObservacionesCambioEstado;

implementation

{$R *.dfm}

uses unitDmGeneral;

procedure TfrmObservacionesCambioEstado.CmdCerrarClick(Sender: TObject);
begin
        if ibtobsestado.intransaction then
           IBTObsEstado.Commit;
        Close;
end;

procedure TfrmObservacionesCambioEstado.FormShow(Sender: TObject);
var i:Integer;
begin
        if IBTObsEstado.InTransaction then
           IBTObsEstado.Commit;
        IBTObsEstado.StartTransaction;
        with Grid do begin
          Cells[0,0] := 'FECHA';
          Cells[1,0] := 'ANTERIOR';
          Cells[2,0] := 'ACTUAL';
          Cells[3,0] := 'OBSERVACION';
          Grid.ColWidths[3] := 280;
        end;


        EdNumeroCap.Caption := Format('%.7d',[fcta]);
        EdDigitoCap.Caption := IntToStr(FDgt);

        with IBSQL1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select');
           SQL.Add('DESCRIPCION from "cap$tipocaptacion" where ID_TIPO_CAPTACION = :ID');
           ParamByName('ID').AsInteger := FTp;
           ExecQuery;
           if RecordCount > 0 then
              EdTipo.Caption := FieldByName('DESCRIPCION').AsString;
        end;

        with IBSQL1 do begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$persona".NOMBRE');
           SQL.Add('FROM');
           SQL.Add('"cap$maestro"');
           SQL.Add('INNER JOIN "cap$maestrotitular" ON ');
           SQL.Add(' ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
           SQL.Add('AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION)');
           SQL.Add('AND ("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA)');
           SQL.Add('AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
           SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
           SQL.Add('AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('where "cap$maestro".ID_AGENCIA =:ID_AGENCIA and');
           SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA');
           SQL.Add('and "cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
           ParamByName('ID_AGENCIA').AsInteger := FAg;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := FTp;
           ParamByName('NUMERO_CUENTA').AsInteger := FCta;
           ParamByName('DIGITO_CUENTA').AsInteger := FDgt;
           try
            ExecQuery;
            if RecordCount > 0 then
             begin
              EdNombreCap.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                     FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                     FieldByName('NOMBRE').AsString;
             end;
           except
            raise;
            Exit;
           end;
        end;

        with IBSQL1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "cap$obsestado" where ID_AGENCIA =:ID_AGENCIA and');
           SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and NUMERO_CUENTA = :NUMERO_CUENTA');
           SQL.Add('and DIGITO_CUENTA = :DIGITO_CUENTA');
           SQL.Add('ORDER BY FECHA DESC');
           ParamByName('ID_AGENCIA').AsInteger := FAg;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := FTp;
           ParamByName('NUMERO_CUENTA').AsInteger := FCta;
           ParamByName('DIGITO_CUENTA').AsInteger := FDgt;
           try
            ExecQuery;
            if RecordCount < 1 then
             begin
              MessageDlg('No exiten observaciones para esta cuenta',mtinformation,[mbok],0);
             end;
           except
             raise;
             Exit;
           end;
           i := 1;
           while not Eof do begin
              if i > 1 then
                 Grid.RowCount := i + 1;
              Grid.Cells[0,i] := FieldByName('FECHA').AsString;
              Grid.Cells[3,i] := FieldByName('OBSERVACION').AsString;
              IBSQL2.Close;
              IBSQL2.SQL.Clear;
              IBSQL2.SQL.Add('select DESCRIPCION from "cap$tiposestado" where ID_ESTADO = :ID_ESTADO');
              IBSQL2.ParamByName('ID_ESTADO').AsInteger := FieldByName('ID_ESTADO_ANTERIOR').AsInteger;
              IBSQL2.ExecQuery;
              if IBSQL2.RecordCount > 0 then
                 Grid.Cells[1,i] := IBSQL2.FieldByName('DESCRIPCION').AsString;
              IBSQL2.Close;
              IBSQL2.ParamByName('ID_ESTADO').AsInteger := FieldByName('ID_ESTADO_ACTUAL').AsInteger;
              IBSQL2.ExecQuery;
              if IBSQL2.RecordCount > 0 then
                 Grid.Cells[2,i] := IBSQL2.FieldByName('DESCRIPCION').AsString;
              i := i + 1;
              Next;
           end;
        end;

end;

end.
