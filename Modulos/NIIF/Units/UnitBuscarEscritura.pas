unit UnitBuscarEscritura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, IBSQL;

type
  TfrmBusquedadeEscritura = class(TForm)
    Panel4: TPanel;
    CmdNuevo: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery: TIBQuery;
    DataSource: TDataSource;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    GridColocacion: TDBGrid;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    EdEscritura: TEdit;
    CmdBuscarCuenta: TBitBtn;
    IBSQL1: TIBSQL;
    EdMatricula: TEdit;
    Label31: TLabel;
    EdAgencia: TDBLookupComboBox;
    RadioFiltro: TRadioGroup;
    IBQueryID_AGENCIA: TSmallintField;
    IBQueryID_COLOCACION: TIBStringField;
    IBQueryVALOR_DESEMBOLSO: TIBBCDField;
    IBQuerySALDO: TIBBCDField;
    IBQueryVALOR_CUOTA: TIBBCDField;
    IBQueryFECHA_CAPITAL: TDateField;
    IBQueryFECHA_INTERES: TDateField;
    IBQueryID_ESTADO_COLOCACION: TSmallintField;
    IBQueryDESCRIPCION_ESTADO_COLOCACION: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridColocacionDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure CmdBuscarCuentaClick(Sender: TObject);
    procedure EdEscrituraExit(Sender: TObject);
    procedure EdEscrituraKeyPress(Sender: TObject; var Key: Char);
    procedure EdMatriculaExit(Sender: TObject);
    procedure RadioFiltroClick(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBusquedadeEscritura: TfrmBusquedadeEscritura;
  vColocacion :String;
  Colores :array[1..15] of TColor;
  vEscritura:string;
  vMatricula:string;
implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales, UnitGlobalesCol, UnitBuscarPersona,
     UnitdmColocacion;

procedure TfrmBusquedadeEscritura.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmBusquedadeEscritura.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmBusquedadeEscritura.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmBusquedadeEscritura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmcolocacion.Free;
        Action := caFree;
end;

procedure TfrmBusquedadeEscritura.GridColocacionDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
        with IBQuery do
        begin
         if  (FieldByName('ID_ESTADO_COLOCACION').AsInteger >= 3) then
//             (FieldByName('ID_ESTADO_COLOCACION').AsInteger =4) or
//             (FieldByName('ID_ESTADO_COLOCACION').AsInteger = 5) or
//             (FieldByName('ID_ESTADO_COLOCACION').AsInteger = 6) or
//             (FieldByName('ID_ESTADO_COLOCACION').AsInteger = 7) then
             GridColocacion.Canvas.Brush.Color := Colores[FieldByName('ID_ESTADO_COLOCACION').AsInteger+1];
        end;
        GridColocacion.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TfrmBusquedadeEscritura.FormCreate(Sender: TObject);
begin
        Colores[9] := clYellow;
        Colores[8] := clYellow;
        Colores[7] := clYellow;
        Colores[6] := clBlue;
        Colores[5] := clFuchsia;
        Colores[4] := clAqua;
        Colores[3] := clLtGray;
        Colores[2] := clDkGray;
        Colores[1] := clWhite;

        dmColocacion := TdmColocacion.Create(Self);

end;

procedure TfrmBusquedadeEscritura.CmdBuscarCuentaClick(Sender: TObject);
var Dg:Integer;
begin
        if (EdEscritura.Text = '') and (EdMatricula.Text = '') then Exit;

        with IBQuery do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$colgarantiasreal".ID_AGENCIA,');
          SQL.Add('"col$colgarantiasreal".ID_COLOCACION,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL as SALDO,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
          SQL.Add('from');
          SQL.Add('"col$colgarantiasreal"');
          SQL.Add('inner join "col$colocacion" on ("col$colgarantiasreal".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$colgarantiasreal".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
          SQL.Add('inner join "col$estado" on ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('where');
          SQL.Add('"col$colgarantiasreal".ID_AGENCIA = :ID_AGENCIA and');
          if RadioFiltro.ItemIndex = 0 then
            SQL.Add('"col$colgarantiasreal".NUMERO_ESCRITURA = :NUMERO_ESCRITURA');
          if RadioFiltro.ItemIndex = 1 then
            SQL.Add('"col$colgarantiasreal".MATRICULA_INMOBILIARIA = :MATRICULA_INMOBILIARIA');
          ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
          if RadioFiltro.ItemIndex = 0 then
            ParamByName('NUMERO_ESCRITURA').AsString := vEscritura;
          if RadioFiltro.ItemIndex = 1 then
            ParamByName('MATRICULA_INMOBILIARIA').AsString := vMatricula;

           Open;

           IBQueryVALOR_DESEMBOLSO.DisplayFormat := ',#0';
           IBQuerySALDO.DisplayFormat := ',#0';
           IBQueryVALOR_CUOTA.DisplayFormat := ',#0';
           IBQueryFECHA_CAPITAL.DisplayFormat := 'yyyy/mm/dd';
           IBQueryFECHA_INTERES.DisplayFormat := 'yyyy/mm/dd';

           if IBQuery.RecordCount < 1 then
            begin
              MessageDlg('No se encontraron Registros',mtError,[mbOK],0);
              CmdNuevo.Click;
            end;
        end;
        Screen.Cursor := crDefault;
end;

procedure TfrmBusquedadeEscritura.EdEscrituraExit(Sender: TObject);
begin
        vEscritura := Trim(EdEscritura.Text);
        CmdBuscarCuenta.SetFocus;
end;

procedure TfrmBusquedadeEscritura.EdEscrituraKeyPress(Sender: TObject;
  var Key: Char);
begin
//        NumericoSinPunto(Sender,Key);
end;

procedure TfrmBusquedadeEscritura.EdMatriculaExit(Sender: TObject);
begin
        vMatricula := Trim(EdMatricula.Text);
        CmdBuscarCuenta.SetFocus;
end;

procedure TfrmBusquedadeEscritura.Inicializar;
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;

        DmGeneral.IBTransaction1.StartTransaction;

        dmColocacion.IBDSagencias.Open;
        dmColocacion.IBDSagencias.Last;
        dmColocacion.IBDSagencias.First;

        EdAgencia.KeyValue := Agencia;
        
        EdEscritura.Text := '';
        EdMatricula.Text := '';
        vEscritura := '';
        vMatricula := '';
        RadioFiltro.ItemIndex := -1;
        RadioFiltro.SetFocus;
        EdEscritura.Visible := False;
        EdEscritura.Enabled := False;
        EdMatricula.Visible := False;
        EdMatricula.Enabled := False;
end;

procedure TfrmBusquedadeEscritura.RadioFiltroClick(Sender: TObject);
begin
        if RadioFiltro.ItemIndex = 0 then
         begin
           EdEscritura.Visible := True;
           EdEscritura.Enabled := True;
         end;
        if RadioFiltro.ItemIndex = 1 then
         begin
           EdMatricula.Visible := True;
           EdMatricula.Enabled := True;
         end;
         
        EdAgencia.SetFocus;
end;

procedure TfrmBusquedadeEscritura.CmdNuevoClick(Sender: TObject);
begin
        inicializar;
end;

end.
