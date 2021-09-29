unit UnitTarjetaSinMovimiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  FR_DSet, FR_DBSet, FR_Class, JvComponent, JvProgressDlg, Buttons,
  DBClient, Grids, DBGrids;

type
  TfrmTarjetaSinMovimiento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtFecha1: TDateTimePicker;
    dtFecha2: TDateTimePicker;
    IBQuery1: TIBQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    JvProgres: TJvProgressDlg;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    BitBtn2: TBitBtn;
    cdTarjeta: TClientDataSet;                  
    cdTarjetaASOCIADO: TStringField;
    cdTarjetaTARJETA: TStringField;
    cdTarjetaCUENTA: TIntegerField;
    cdTarjetaTIPO: TIntegerField;
    cdTarjetaDG: TIntegerField;
    cdTarjetaFECHAA: TDateField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarjetaSinMovimiento: TfrmTarjetaSinMovimiento;

implementation
uses UnitGlobales, unitMain;

{$R *.dfm}

procedure TfrmTarjetaSinMovimiento.Button2Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmTarjetaSinMovimiento.Button1Click(Sender: TObject);
begin
          frReport1.LoadFromFile(frmMain.ruta1+'\Reporte\RepTarjetaSinMovimiento.frf');
          frReport1.Dictionary.Variables['agencia'] := Agencia;
          frReport1.Dictionary.Variables['fecha1'] := QuotedStr(DateToStr(dtFecha1.DateTime));
          frReport1.Dictionary.Variables['fecha2'] := QuotedStr(DateToStr(dtFecha2.DateTime));
          frReport1.Dictionary.Variables['empleado'] := QuotedStr(DBAlias);
          frReport1.ShowReport;
          BitBtn2.Enabled := False;
          
end;

procedure TfrmTarjetaSinMovimiento.FormCreate(Sender: TObject);
begin
        dtFecha1.DateTime := fFechaActual;
        dtFecha2.DateTime := fFechaActual;        
end;

procedure TfrmTarjetaSinMovimiento.BitBtn1Click(Sender: TObject);
begin
        Panel1.Enabled := False;
        with IBQuery1 do
        begin
          JvProgres.Show;
          Close;
          SQL.Clear;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Add('select * from PRD_MOVTARJETA(:FECHA1,:FECHA2,:AGENCIA)');
          ParamByName('FECHA1').AsDateTime := dtFecha1.DateTime;
          ParamByName('FECHA2').AsDateTime := dtFecha2.DateTime;
          ParamByName('AGENCIA').AsInteger := Agencia;
          Open;
          Last;
          First;
          JvProgres.Maximum := RecordCount;
          while not Eof do
          begin
             cdTarjeta.Append;
             cdTarjeta.FieldValues['ASOCIADO'] := FieldByName('ASOCIADO').AsString;
             cdTarjeta.FieldValues['TARJETA'] := FieldByName('TARJETA').AsString;
             cdTarjeta.FieldValues['CUENTA'] := FieldByName('CUENTA').AsInteger;
             cdTarjeta.FieldValues['TIPO'] := FieldByName('TIPO').AsInteger;
             cdTarjeta.FieldValues['DG'] := FieldByName('DG').AsInteger;
             cdTarjeta.FieldValues['FECHAA'] := FieldByName('FECHAA').AsDateTime;
             cdTarjeta.Post;
            JvProgres.Value := RecNo;
            Next;
          end;
          Application.ProcessMessages;
          JvProgres.Close;
          Button1.Enabled := True;
        end;
end;

procedure TfrmTarjetaSinMovimiento.BitBtn2Click(Sender: TObject);
begin
        if MessageDlg('Esta Seguro(a) de Aplicar la transacción?',mtWarning,[mbyes,mbno],0) = 0 then
           Exit;
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          cdTarjeta.First;
          while not cdTarjeta.Eof do
          begin
            SQL.Clear;
            SQL.Add('update "cap$tarjetacuenta" set ESTADO = 3,FECHA_CANCELADA = :FECHA where ID_TARJETA = :ID_TARJETA');
            ParamByName('ID_TARJETA').AsString := cdTarjeta.FieldByName('TARJETA').AsString;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ExecSQL;
            SQL.Clear;
            SQL.Clear;
            SQL.Add('update "cap$tarjetasdebito" set ID_ESTADO = 3');
            SQL.Add('where ID_TARJETA = :ID_TARJETA');
            ParamByName('ID_TARJETA').AsString := cdTarjeta.FieldByName('TARJETA').AsString;
            ExecSQL;
            cdTarjeta.Next;
          end;
          Transaction.Commit;
          frReport1.LoadFromFile(frmMain.ruta1+'\Reporte\RepTarjetaSinMovimiento.frf');
          frReport1.Dictionary.Variables['agencia'] := Agencia;
          frReport1.Dictionary.Variables['fecha1'] := QuotedStr(DateToStr(dtFecha1.DateTime));
          frReport1.Dictionary.Variables['fecha2'] := QuotedStr(DateToStr(dtFecha2.DateTime));
          frReport1.Dictionary.Variables['empleado'] := QuotedStr(DBAlias);
          FrReport1.PrepareReport;
          frreport1.SavePreparedReport('c:\'+ DBAlias + FormatDateTime('yyyymmddhhmmss',Now) + '.frp');
        end;
end;

end.
