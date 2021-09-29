unit UnitConsultaCajas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvEdit, JvTypedEdit, Buttons, ComCtrls, DB,
  DBClient, Grids, DBGrids, IBCustomDataSet, IBQuery;

type
  TFrmConsultaCajas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Jv: TJvIntegerEdit;
    DFecha1: TDateTimePicker;
    DFecha2: TDateTimePicker;
    Panel2: TPanel;
    Ejecutar: TBitBtn;
    CdTabla: TClientDataSet;
    Panel3: TPanel;
    CdTablaORIGEN: TIntegerField;
    CdTablaDESCRIPCION: TStringField;
    CdTablaCANTIDAD: TIntegerField;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    JvTotal: TJvIntegerEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    EdNombre: TEdit;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure EjecutarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaCajas: TFrmConsultaCajas;

implementation
uses UnitGlobales;
{$R *.dfm}

procedure TFrmConsultaCajas.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmConsultaCajas.EjecutarClick(Sender: TObject);
var _iContador :Integer;
    _tT1 :TDate;
    _tTT1 :TTime;
begin
        LongTimeFormat  := 'hh:mm:ss';
//        _tT1 := dfecha1.Date;
//        _tTT1 := StrToTime('20:59:59');
//        ShowMessage(DateToStr(_tT1) + ' ' + TimeToStr(_tTT1));
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
            Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"gen$empleado".NOMBRE,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO');
          SQL.Add('FROM');
          SQL.Add('"caj$cajas"');
          SQL.Add('INNER JOIN "gen$empleado" ON ("caj$cajas".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
          SQL.Add('WHERE');
          SQL.Add('"caj$cajas".ID_CAJA = :IDCAJA');
          ParamByName('IDCAJA').AsInteger := Jv.Value;
          Open;
          if RecordCount = 0 then
          begin
            ShowMessage('Empleado no Encontrado');
            Exit;
          end;
          EdNombre.Text := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Close;
          SQL.Clear;
          SQL.Add('select * from PRD$MOVIMIENTOCAJA(:IDCAJA,:FECHA1,:FECHA2)');
          ParamByName('IDCAJA').AsInteger := Jv.Value;
          ParamByName('FECHA1').AsDateTime := DFecha1.DateTime;// + StrToTime('01:00:00');
          ParamByName('FECHA2').AsDateTime := DFecha2.DateTime;// + StrToTime('22:59:59');
          Open;
          _iContador := 0;
          while not Eof do
          begin
            _iContador := FieldByName('CANTIDAD').AsInteger + _iContador;
            CdTabla.Append;
            CdTabla.FieldValues['ORIGEN'] := FieldByName('ORIGEN').AsInteger;
            CdTabla.FieldValues['DESCRIPCION'] := FieldByName('DESCRIPCION').AsString;
            CdTabla.FieldValues['CANTIDAD'] := FieldByName('CANTIDAD').AsInteger;
            CdTabla.Post;
            Next;
          end;
        end;
        JvTotal.Value := _iContador;
        Ejecutar.Enabled := False;
end;

procedure TFrmConsultaCajas.FormCreate(Sender: TObject);
begin
        DFecha1.Date := FFechaActual;
        DFecha2.Date := FFechaActual;        
end;

procedure TFrmConsultaCajas.BitBtn2Click(Sender: TObject);
begin
        CdTabla.CancelUpdates;
        EdNombre.Text := '';
        JvTotal.Value := 0;
        Ejecutar.Enabled := True;
        Jv.SetFocus;
end;

end.
