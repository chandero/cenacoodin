unit UnitControlCarneJuvenil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvStaticText, JvEdit, Buttons, DBCtrls,
  ComCtrls, JvComCtrls, JvLabel, JvBlinkingLabel, JvGroupBox, JvTypedEdit,
  IBDatabase, DB, IBCustomDataSet, Grids, DBGrids, IBQuery, DBClient, IBSQL, DateUtils,JclSysUtils,
  Menus;

type
  TFrmControlCarneJuvenil = class(TForm)
    JvGroupBox1: TJvGroupBox;
    JvBlinkingLabel1: TJvBlinkingLabel;
    PageBuscar: TJvPageControl;
    Tab1: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    CBtiposid: TDBLookupComboBox;
    EdNumeroIdentificacion: TMemo;
    CmdActualizar1: TBitBtn;
    Tab2: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    EdCaptacion: TJvEdit;
    CBTiposCaptacion: TDBLookupComboBox;
    CmdActualizar2: TBitBtn;
    EdNombre: TJvStaticText;
    DSTiposCaptacion: TDataSource;
    DSTiposId: TDataSource;
    IBDSTiposId: TIBDataSet;
    GroupBox2: TGroupBox;
    IBQuery1: TIBQuery;
    BitBtn2: TBitBtn;
    IBSQL2: TIBSQL;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    E1: TMenuItem;
    IBDSTiposCaptacion: TIBDataSet;
    DBGrid1: TDBGrid;
    CdTabla: TClientDataSet;
    IBTControlCobro: TIBTransaction;
    CdTablaTP: TIntegerField;
    CdTablaNM: TIntegerField;
    CdTablaDG: TIntegerField;
    CdTablaNOMBRE: TStringField;
    DsTabla: TDataSource;
    CdTablaFECHA: TStringField;
    CdTablaENTREGADO: TStringField;
    procedure JvBlinkingLabel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdCaptacionExit(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure EdNumeroIdentificacionKeyPress(Sender: TObject;
      var Key: Char);
    procedure CBtiposidKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtLimpiarClick(Sender: TObject);
    procedure CmdActualizar2Click(Sender: TObject);
    procedure CBTiposCaptacionKeyPress(Sender: TObject; var Key: Char);
    procedure EdCaptacionKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure CmdActualizar1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
   vId :Integer;
   vIdPersona :string;
   vCuentaAhorros :Integer;
   vDgAhorros :Integer;
   vNumero :Integer;
   Activar :Boolean;
    procedure Inicio;
    function BuscarAhorros: Currency;
    class procedure PintarCheckBoxes(oGrid: TObject; Rect: TRect;
      Column: TColumn);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControlCarneJuvenil: TFrmControlCarneJuvenil;
type
  TCustomDBGridCracker = class(TCustomDBGrid);
implementation

uses UnitBuscarPersona, UnitGlobales, UnitConsultaExtractoCaptacion,
  UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmControlCarneJuvenil.Inicio;
begin
         if IBTControlCobro.InTransaction  then
           IBTControlCobro.Rollback;
         IBTControlCobro.StartTransaction;
          PageBuscar.Enabled := True;
        IBDSTiposId.Open;
        IBDSTiposCaptacion.Open;
        PageBuscar.ActivePage := Tab1;

         CBtiposid.KeyValue := -1;
         EdNombre.Caption := '';
         EdNumeroIdentificacion.Text := '';
         CBTiposCaptacion.KeyValue := -1;
         EdCaptacion.Text := '';

end;

procedure TFrmControlCarneJuvenil.JvBlinkingLabel1Click(Sender: TObject);
begin
                frmBuscarPersona := TfrmBuscarPersona.Create(self);
                if frmBuscarPersona.ShowModal = mrOk then
                begin
                   EdNumeroIdentificacion.Text := frmBuscarPersona.id_persona;
                   CBtiposid.KeyValue := frmBuscarPersona.id_identificacion;
                   vId := frmBuscarPersona.id_identificacion;
                   vIdPersona := frmBuscarPersona.id_persona;
                   PageBuscar.ActivePage := Tab1;
                   CmdActualizar1.Click;
                end;
                frmBuscarPersona.Free;
end;

procedure TFrmControlCarneJuvenil.FormCreate(Sender: TObject);
begin
        inicio
end;


procedure TFrmControlCarneJuvenil.EdCaptacionExit(Sender: TObject);
begin
        vId :=  0;
end;

procedure TFrmControlCarneJuvenil.EdNumeroIdentificacionExit(
  Sender: TObject);
begin
        vId :=  CBtiposid.KeyValue;
        vIdPersona := EdNumeroIdentificacion.Text;
end;

procedure TFrmControlCarneJuvenil.EdNumeroIdentificacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TFrmControlCarneJuvenil.CBtiposidKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,Self)
end;

function TFrmControlCarneJuvenil.BuscarAhorros: Currency;
begin

end;

procedure TFrmControlCarneJuvenil.BitBtn2Click(Sender: TObject);
begin
        Close;
end;


procedure TFrmControlCarneJuvenil.BtLimpiarClick(Sender: TObject);
begin
        //mObservacion.SetFocus;
end;



procedure TFrmControlCarneJuvenil.CmdActualizar2Click(Sender: TObject);
begin
        with IBSQL2 do
        begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('select ID_PERSONA,ID_IDENTIFICACION from "cap$maestrotitular" where (');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
            SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" )');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := CBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCaptacion.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(CBTiposCaptacion.KeyValue,FormatCurr('0000000',StrToFloat(EdCaptacion.Text))));
            ExecQuery;
            if RecordCount > 0 then
            begin
              CBtiposid.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
              EdNumeroIdentificacion.Text  := FieldByName('ID_PERSONA').AsString;
              vId :=  CBtiposid.KeyValue;
              vIdPersona := EdNumeroIdentificacion.Text;
              CmdActualizar1.Click;
            end
            else
            begin
              MessageDlg('Persona no encontrada',mtError,[mbOk],0);
            end;
        end;

end;

procedure TFrmControlCarneJuvenil.CBTiposCaptacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TFrmControlCarneJuvenil.EdCaptacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TFrmControlCarneJuvenil.BitBtn3Click(Sender: TObject);
begin
        inicio
end;

procedure TFrmControlCarneJuvenil.CmdActualizar1Click(Sender: TObject);
begin
        with IBSQL2 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select NOMBRE || '' '' || PRIMER_APELLIDO || '' '' || SEGUNDO_APELLIDO AS NOMBRE FROM "gen$persona"');
          SQL.Add('WHERE ID_PERSONA = :ID_PERSONA AND ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
          ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
          ExecQuery;
          EdNombre.Caption := FieldByName('NOMBRE').AsString;
          PageBuscar.Enabled := False;
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"cap$maestrotitular".ID_AGENCIA,');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,');
          SQL.Add('"cap$maestrotitular".DIGITO_CUENTA,');
          SQL.Add('"cap$maestrotitular".NUMERO_TITULAR,');
          SQL.Add('"cap$maestrotitular".TIPO_TITULAR');
          SQL.Add('FROM');
          SQL.Add('"cap$maestrotitular"');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA)');
          SQL.Add('AND ("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION)');
          SQL.Add('AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
          SQL.Add('WHERE');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION AND ');
          SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA AND ');
          SQL.Add('"cap$maestro".ID_ESTADO = 1 AND ');
          SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = 4');
          SQL.Add('ORDER BY');
          SQL.Add('"cap$maestrotitular".ID_AGENCIA,');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,');
          SQL.Add('"cap$maestrotitular".DIGITO_CUENTA');
          ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
          ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
          ExecQuery;
          while not Eof do
          begin
            CdTabla.Append;
            CdTabla.FieldValues['TP'] := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            CdTabla.FieldValues['NM'] := FieldByName('NUMERO_CUENTA').AsInteger;
            CdTabla.FieldValues['DG'] := FieldByName('DIGITO_CUENTA').AsInteger;
            IBQuery1.Close;
            IBQuery1.SQL.Add('SELECT ');
            IBQuery1.SQL.Add('NOMBRE || '' '' || PRIMER_APELLIDO || '' '' || SEGUNDO_APELLIDO AS NOMBRE,');
            IBQuery1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
            IBQuery1.SQL.Add('"cap$maestrotitular".ID_PERSONA');
            IBQuery1.SQL.Add('FROM');
            IBQuery1.SQL.Add('"cap$maestrotitular"');
            IBQuery1.SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
            IBQuery1.SQL.Add('AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
            IBQuery1.SQL.Add('WHERE');
            IBQuery1.SQL.Add('"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA AND ');
            IBQuery1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION AND ');
            IBQuery1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA AND ');
            IBQuery1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA AND ');
            IBQuery1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2');
            IBQuery1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBQuery1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBQuery1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
            IBQuery1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
            IBQuery1.Open;
            CdTabla.FieldValues['NOMBRE'] := IBQuery1.FieldByName('NOMBRE').AsString;
            CdTabla.FieldValues['FECHA'] := '';
            CdTabla.FieldValues['ENTREGADO'] := '';
            CdTabla.Post;
            Next;
          end;

        end;
end;

class procedure TFrmControlCarneJuvenil.PintarCheckBoxes(oGrid: TObject;
  Rect: TRect; Column: TColumn);
var
  MyRect  : TRect;
  oField  : TField;
  iPos    : Integer;
  iFactor : Integer;
  bValue  : Boolean;
begin
  with (oGrid as TDBGrid) do
  begin
    oField := Column.Field;

    bValue := oField.Value = '1';

    Canvas.FillRect(Rect);

    MyRect.Top    := ((Rect.Bottom - Rect.Top - 11 ) div 2) + Rect.Top;
    MyRect.Left   := ((Rect.Right  - Rect.Left - 11) div 2) + Rect.Left;
    MyRect.Bottom := MyRect.Top  + 10;
    MyRect.Right  := MyRect.Left + 10;

    Canvas.Pen.Color := clBlack;

    Canvas.Polyline([
    Point(MyRect.Left, MyRect.Top), Point(MyRect.Right, MyRect.Top),
    Point(MyRect.Right, MyRect.Bottom), Point(MyRect.Left, MyRect.Bottom),
    Point(MyRect.Left, MyRect.Top)]);

    iPos    := MyRect.Left;
    iFactor := 1;

    if bValue then
    begin
      Canvas.MoveTo(iPos + (iFactor*2), MyRect.Top + 4);
      Canvas.LineTo(iPos + (iFactor*2), MyRect.Top + 7);
      Canvas.MoveTo(iPos + (iFactor*3), MyRect.Top + 5);
      Canvas.LineTo(iPos + (iFactor*3), MyRect.Top + 8);
      Canvas.MoveTo(iPos + (iFactor*4), MyRect.Top + 6);
      Canvas.LineTo(iPos + (iFactor*4), MyRect.Top + 9);
      Canvas.MoveTo(iPos + (iFactor*5), MyRect.Top + 5);
      Canvas.LineTo(iPos + (iFactor*5), MyRect.Top + 8);
      Canvas.MoveTo(iPos + (iFactor*6), MyRect.Top + 4);
      Canvas.LineTo(iPos + (iFactor*6), MyRect.Top + 7);
      Canvas.MoveTo(iPos + (iFactor*7), MyRect.Top + 3);
      Canvas.LineTo(iPos + (iFactor*7), MyRect.Top + 6);
      Canvas.MoveTo(iPos + (iFactor*8), MyRect.Top + 2);
      Canvas.LineTo(iPos + (iFactor*8), MyRect.Top + 5);
    end;
  end;
end;

procedure TFrmControlCarneJuvenil.DBGrid1CellClick(Column: TColumn);
begin
  if Column.FieldName = 'ENTREGADO' then
  begin
    CdTabla.Edit;
    if Column.Field.Value = '0' then
    begin
      Column.Field.Value := '1';
    end
    else
    begin
      Column.Field.Value := '0';
    end;
  end;

end;

procedure TFrmControlCarneJuvenil.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'ENTREGADO' then //el campo tiene un '0' o '1'
  begin
    PintarCheckBoxes(Sender,Rect,Column);
  end;

end;

procedure TFrmControlCarneJuvenil.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then                                                 { if it's an enter key }
     if not (ActiveControl is TDBGrid) then begin       { if not on a TDBGrid }
       Key := #0;                                                        { eat enter key }
       Perform(WM_NEXTDLGCTL, 0, 0);                 { move to next control }
     end
     else if (ActiveControl is TDBGrid) then                { if it is a TDBGrid }

       with TDBGrid(ActiveControl) do
         if selectedindex < (fieldcount -1) then             { increment the field }
           selectedindex := selectedindex + 3
         else
           selectedindex := 0;
end;

end.


