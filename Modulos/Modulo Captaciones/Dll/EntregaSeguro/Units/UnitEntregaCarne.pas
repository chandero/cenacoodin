unit UnitEntregaCarne;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,SqlExpr, StdCtrls, Grids, DBGrids, DB, DBClient, ExtCtrls, ComCtrls,
  Buttons,StrUtils, RpRender, RpRenderCanvas, RpRenderPrinter, RpBase, RpSystem,
  RpDefine, RpRave, RpCon, RpConDS;

type
  TFrmEntregaCarne = class(TForm)
    DsCarne: TDataSource;
    CdCarne: TClientDataSet;
    CdCarneNOMBRES: TStringField;
    CdCarneFECHASEGURO: TDateField;
    CdCarneFECHAENTREGA: TDateField;
    CdCarneENTREGADO: TIntegerField;
    CdCarnePERSONA: TStringField;
    CdCarneEMPLEADO: TStringField;
    Button1: TButton;
    PageControl1: TPageControl;
    TabCarne: TTabSheet;
    TabReporte: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdNombre: TEdit;
    EdCuenta: TEdit;
    GroupBox2: TGroupBox;
    DBCarne: TDBGrid;
    Panel1: TPanel;
    BitBuscar: TBitBtn;
    BitAplicar: TBitBtn;
    BitCancelar: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    CdCarneCUENTA: TStringField;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox5: TGroupBox;
    DtFecha1: TDateTimePicker;
    DtFecha2: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    ChTodo: TCheckBox;
    Panel2: TPanel;
    BitEjecutar: TBitBtn;
    BitCancelar1: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    procedure DBCarneDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBCarneCellClick(Column: TColumn);
    procedure BitCancelarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBuscarClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitAplicarClick(Sender: TObject);
    procedure EdNombreChange(Sender: TObject);
    procedure EdCuentaChange(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitEjecutarClick(Sender: TObject);
    procedure TabCarneShow(Sender: TObject);
    procedure TabReporteShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure BitCancelar1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    _dDatabase:TSQLConnection;
    _sEmpleado :string;
    procedure PintarCheckBoxes(oGrid: TObject; Rect: TRect; Column: TColumn; posColuma: Integer);
    procedure ChequearCheckBoxes(Column: TColumn; posColuma: Integer);
    procedure ExtraeCarne(_iOpcion :Integer);
    { Private declarations }
  public
  Property Database :TSQLConnection write _dDatabase;
  property Empleado :string write _sEmpleado;
    { Public declarations }
  end;
var
  FrmEntregaCarne: TFrmEntregaCarne;
  //SQLConnection1 :TSQLConnection;

implementation
{$R *.dfm}
procedure TFrmEntregaCarne.BitAplicarClick(Sender: TObject);
var _iBQuery :TSQLQuery;
begin
  _iBQuery := TSQLQuery.Create(Self);
  _iBQuery.SQLConnection := _dDatabase;
  with _iBQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update "cap$entregacarne"');
    SQL.Add('set "cap$entregacarne".ENTREGADO = 1,');
    SQL.Add('"cap$entregacarne".ID_EMPLEADO = :EMPLEADO,');
    SQL.Add('"cap$entregacarne".PERSONA = :PERSONA,');
    SQL.Add('"cap$entregacarne".FECHA_ENTREGA = :FECHA_ENTREGA');
    SQL.Add('WHERE "cap$entregacarne".NUMERO_CUENTA = :CUENTA AND');
    SQL.Add('"cap$entregacarne".FECHA_SEGURO = :FECHA');
    ParamByName('EMPLEADO').AsString := _sEmpleado;
    ParamByName('FECHA_ENTREGA').AsDate := Date;
    CdCarne.First;
    CdCarne.Filtered := False;
    CdCarne.Filter := 'ENTREGADO = 1';
    CdCarne.Filtered := True;
    while Not Cdcarne.Eof do
    begin
      ParamByName('PERSONA').AsString := UpperCase(CdCarne.FieldByName('PERSONA').AsString);
      ParamByName('CUENTA').AsString := CdCarne.FieldByName('CUENTA').AsString;
      ParamByName('FECHA').AsDate := CdCarne.FieldByName('FECHASEGURO').AsDateTime;
      CdCarne.Next;
      ExecSql;
    end;
  end;
  ShowMessage('Registro Aplicado con Exito');
  BitAplicar.Enabled := False;
  BitCancelar.Click;
  DBCarne.Enabled := False;
end;

procedure TFrmEntregaCarne.BitCancelarClick(Sender: TObject);
begin
  CdCarne.CancelUpdates;
  BitBuscar.Enabled := True;
  BitAplicar.Enabled := True;
  DBCarne.Enabled := True;
  CdCarne.Filtered := False;
end;

procedure TFrmEntregaCarne.BitBtn3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmEntregaCarne.BitBtn4Click(Sender: TObject);
begin
  EdNombre.Text := '';
  EdCuenta.Text := '';
  CdCarne.Filtered := False;
  CdCarne.First;
end;

procedure TFrmEntregaCarne.BitCancelar1Click(Sender: TObject);
begin
  Cdcarne.CancelUpdates;
  BitEjecutar.Enabled := True;
  CdCarne.Filtered := False;
end;

procedure TFrmEntregaCarne.BitEjecutarClick(Sender: TObject);
begin
  if ChTodo.Checked then
    ExtraeCarne(1)
  else
    ExtraeCarne(2);
  BitEjecutar.Enabled := False;
end;

procedure TFrmEntregaCarne.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEntregaCarne.BitBtn9Click(Sender: TObject);
begin
  RvProject1.ProjectFile := 'd:\reporte1.rav';
  RvProject1.Execute;
end;

procedure TFrmEntregaCarne.BitBuscarClick(Sender: TObject);
begin
    ExtraeCarne(0);
    BitBuscar.Enabled := False;
end;

procedure TFrmEntregaCarne.DBCarneCellClick(Column: TColumn);
begin
  ChequearCheckBoxes(Column, 4);
end;

procedure TFrmEntregaCarne.DBCarneDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  PintarCheckBoxes(Sender,Rect,Column, 4);
end;

procedure TFrmEntregaCarne.EdCuentaChange(Sender: TObject);
var
 _sCadena:string;
begin
    _sCadena := ReplaceStr(EdCuenta.Text,' ','%');
    CdCarne.Filtered := False;
    CdCarne.Filter := 'CUENTA LIKE ' + '''' + '%' + _sCadena + '%' + '''';
    CdCarne.Filtered := True;


end;

procedure TFrmEntregaCarne.Edit1Change(Sender: TObject);
var
 _sCadena:string;
begin
    _sCadena := ReplaceStr(Edit1.Text,' ','%');
    CdCarne.Filtered := False;
       CdCarne.Filter := 'NOMBRES LIKE ' + '''' + '%' + _sCadena + '%' + '''';
    CdCarne.Filtered := True;


end;

procedure TFrmEntregaCarne.Edit2Change(Sender: TObject);
var
 _sCadena:string;
begin
    _sCadena := ReplaceStr(Edit2.Text,' ','%');
    CdCarne.Filtered := False;
    CdCarne.Filter := 'CUENTA LIKE ' + '''' + '%' + _sCadena + '%' + '''';
    CdCarne.Filtered := True;


end;

procedure TFrmEntregaCarne.EdNombreChange(Sender: TObject);
var
 _sCadena:string;
begin
    _sCadena := ReplaceStr(EdNombre.Text,' ','%');
    CdCarne.Filtered := False;
       CdCarne.Filter := 'NOMBRES LIKE ' + '''' + '%' + _sCadena + '%' + '''';
    CdCarne.Filtered := True;

end;

procedure TFrmEntregaCarne.ExtraeCarne(_iOpcion :Integer);
var _iBQuery :TSQLQuery;
begin
   CdCarne.CancelUpdates;
  _iBQuery := TSQLQuery.Create(Self);
  _iBQuery.SQLConnection := _dDatabase;
  with _iBQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select "cap$entregacarne".FECHA_SEGURO,');
    SQL.Add('"cap$entregacarne".FECHA_ENTREGA,');
    SQL.Add('"cap$entregacarne".PERSONA,');
    SQL.Add('"cap$entregacarne".ID_EMPLEADO,');
    SQL.Add('"gen$persona".NOMBRE,');
    SQL.Add('"gen$persona".PRIMER_APELLIDO,');
    SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
    SQL.Add('"cap$entregacarne".ID_TIPO_CAPTACION,');
    SQL.Add('"cap$entregacarne".NUMERO_CUENTA,');
    SQL.Add('"cap$entregacarne".DIGITO_CUENTA');
    SQL.Add('FROM');
    SQL.Add('"cap$maestrotitular"');
    SQL.Add('INNER JOIN "cap$entregacarne" ON ("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$entregacarne".ID_TIPO_CAPTACION)');
    SQL.Add('AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$entregacarne".NUMERO_CUENTA)');
    SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$entregacarne".DIGITO_CUENTA)');
    SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
    SQL.Add('AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
    SQL.Add('WHERE');
    SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2 AND ');
    SQL.Add('"cap$entregacarne".ENTREGADO = :OPCION');
    if _iOpcion = 2 then
    begin
       SQL.Add('AND "cap$entregacarne".FECHA_ENTREGA BETWEEN :FECHA1 AND :FECHA2');
       ParamByName('FECHA1').AsDate := DtFecha1.DateTime;
       ParamByName('FECHA2').AsDate := DtFecha2.DateTime;
       _iOpcion := 1;
    end;

    ParamByName('OPCION').AsInteger := _iOpcion;
    Open;
    while Not eof  do
    begin
      CdCarne.Append;
      CdCarne.FieldValues['CUENTA'] := FieldByName('NUMERO_CUENTA').AsString;
      CdCarne.FieldValues['NOMBRES'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' +FieldByName('SEGUNDO_APELLIDO').AsString;
      CdCarne.FieldValues['FECHASEGURO'] := FieldByName('FECHA_SEGURO').AsDateTime;
      CdCarne.FieldValues['ENTREGADO'] := False;
      if _iOpcion = 0 then
      begin
        CdCarne.FieldValues['FECHAENTREGA'] := Date;
        CdCarne.FieldValues['PERSONA'] := '';
      end
      else
      begin
        CdCarne.FieldValues['FECHAENTREGA'] := FieldByName('FECHA_ENTREGA').AsString;
        CdCarne.FieldValues['PERSONA'] := FieldByName('PERSONA').AsString;
        CdCarne.FieldByName('EMPLEADO').AsString := FieldByName('ID_EMPLEADO').AsString;
      end;
      CdCarne.Post;
      Next;
    end;
  end;
  CdCarne.IndexFieldNames := 'NOMBRES';
  CdCarne.First;
end;

procedure TFrmEntregaCarne.FormCreate(Sender: TObject);
begin
  DtFecha1.Date := Date;
  DtFecha2.Date := Date;
{  SQLConnection1 := TSQLConnection.Create(Nil);
  with SQLConnection1 do
  begin
      ConnectionName := 'IBConnection';
      DriverName := 'Interbase';
      GetDriverFunc := 'getSQLDriverINTERBASE';
      LibraryName := 'dbxint.dll';
      Params.add('DriverName=Interbase');
      Params.add('Database=192.168.200.254:/dbase3/pruebas/database.fdb');
      Params.add('RoleName=RoleName');
      Params.add('User_Name=SYSDBA');
      Params.add('Password=masterkey');
      Params.add('ServerCharSet=');
      Params.add('SQLDialect=3');
      Params.add('ErrorResourceFile=');
      Params.add('LocaleCode=0000');
      Params.add('BlobSize=-1');
      Params.add('CommitRetain=False');
      Params.add('WaitOnLocks=True');
      Params.add('Interbase TransIsolation=ReadCommited');
      Params.add('Trim Char=False');
      VendorLib := 'GDS32.DLL';
      LoginPrompt := false;
      Open;
  end;}

end;

procedure TFrmEntregaCarne.PintarCheckBoxes(oGrid: TObject; Rect: TRect; Column: TColumn; posColuma: Integer);
var
  MyRect  : TRect;
  _iCentroX, _iCentroY, _iradio : Integer;
begin
  if Column.Index = posColuma then
  begin
    with (oGrid as TDBGrid) do
    begin
      Canvas.FillRect(Rect); //para tapar la celda del dbgrid
      _iCentroX := ((Rect.Right  - Rect.Left) div 2) + Rect.Left;
      _iCentroY := ((Rect.Bottom - Rect.Top) div 2) + Rect.Top;
      //dibuja el rectangulo gris
      _iradio := 5;
      MyRect.Top    := _iCentroY - _iradio;
      MyRect.Bottom := _iCentroY + _iradio;
      MyRect.Left   := _iCentroX - _iradio;
      MyRect.Right  := _iCentroX + _iradio;

      Canvas.Pen.Color := clMedGray;
      Canvas.Pen.Width := 1;
      Canvas.Rectangle(MyRect);

      //pinta el chulito de chequeo
      if Column.Field.Value = 1 then
      begin
        Canvas.Pen.Color := clBlack;
        Canvas.MoveTo(MyRect.Left + 2, MyRect.Top + 4);
        Canvas.LineTo(MyRect.Left + 2, MyRect.Top + 7);
        Canvas.MoveTo(MyRect.Left + 3, MyRect.Top + 5);
        Canvas.LineTo(MyRect.Left + 3, MyRect.Top + 8);
        Canvas.MoveTo(MyRect.Left + 4, MyRect.Top + 6);
        Canvas.LineTo(MyRect.Left + 4, MyRect.Top + 9);
        Canvas.MoveTo(MyRect.Left + 5, MyRect.Top + 5);
        Canvas.LineTo(MyRect.Left + 5, MyRect.Top + 8);
        Canvas.MoveTo(MyRect.Left + 6, MyRect.Top + 4);
        Canvas.LineTo(MyRect.Left + 6, MyRect.Top + 7);
        Canvas.MoveTo(MyRect.Left + 7, MyRect.Top + 3);
        Canvas.LineTo(MyRect.Left + 7, MyRect.Top + 6);
        Canvas.MoveTo(MyRect.Left + 8, MyRect.Top + 2);
        Canvas.LineTo(MyRect.Left + 8, MyRect.Top + 5);
      end;
    end;
  end;
end;
procedure TFrmEntregaCarne.TabCarneShow(Sender: TObject);
begin
  BitCancelar.Click;
  BitCancelar1.Click;
end;

procedure TFrmEntregaCarne.TabReporteShow(Sender: TObject);
begin
  BitCancelar.Click;
  BitCancelar1.Click;
end;

procedure TFrmEntregaCarne.ChequearCheckBoxes(Column: TColumn; posColuma: Integer);
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet(Column.Grid.DataSource.DataSet);
  if Column.Index = posColuma then
  begin
    cds.Edit;
    if Column.Field.Value = 0 then //si esta deschequeado
    begin
      Column.Field.Value := 1;//chequeelo
    end
    else//sino
    begin
      Column.Field.Value := 0;//deschequeelo
    end;
  end;
end;
end.
