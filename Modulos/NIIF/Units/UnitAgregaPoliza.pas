unit UnitAgregaPoliza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, Grids, DBGrids,
  IBCustomDataSet, IBQuery;

type
  TFrmAgregaPoliza = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdPoliza: TEdit;
    dFecha1: TDateTimePicker;
    dFecha2: TDateTimePicker;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
  published
    procedure CargaPoliza;
    { Public declarations }
  end;

var
  FrmAgregaPoliza: TFrmAgregaPoliza;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TFrmAgregaPoliza.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmAgregaPoliza.FormCreate(Sender: TObject);
begin
        CargaPoliza;
end;

procedure TFrmAgregaPoliza.BitBtn1Click(Sender: TObject);
begin
        if MessageDlg('Esta seguro de realizar la operación',mtInformation,[mbYes,mbOk],0) = Mrno then
           Exit;
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO');
          SQL.Add('"cap$polizajuvenil"(');
          SQL.Add('POLIZA,');
          SQL.Add('FECHA_INICIAL,');
          SQL.Add('FECHA_FINAL,');
          SQL.Add('ID_USUARIO,');
          SQL.Add('FECHAPOLIZA)');
          SQL.Add('VALUES(');
          SQL.Add(':POLIZA,');
          SQL.Add(':FECHA_INICIAL,');
          SQL.Add(':FECHA_FINAL,');
          SQL.Add(':ID_USUARIO,');
          SQL.Add(':FECHAPOLIZA)');
          ParamByName('POLIZA').AsString := EdPoliza.Text;
          ParamByName('FECHA_INICIAL').AsDate := dFecha1.Date;
          ParamByName('FECHA_FINAL').AsDate := dFecha2.Date;
          ParamByName('ID_USUARIO').AsString := DBAlias;
          ParamByName('FECHAPOLIZA').AsDate := fFechaActual;
          ExecSQL;
          CargaPoliza;
          EdPoliza.Text := '';
          EdPoliza.SetFocus;
        end;
end;

procedure TFrmAgregaPoliza.CargaPoliza;
begin
        if IBQuery1.Transaction.InTransaction then
           IBQuery1.Transaction.Commit;
        IBQuery1.Transaction.StartTransaction;
        IBQuery1.Close;
        IBQuery1.Open;
end;

end.
