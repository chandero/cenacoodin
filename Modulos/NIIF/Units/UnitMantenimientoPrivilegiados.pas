unit UnitMantenimientoPrivilegiados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, IBCustomDataSet, DB, IBQuery, ExtCtrls,
  StdCtrls, Buttons, DBCtrls, IBSQL, DBClient, Menus, IBTable, UnitDmGeneral;

type
  TMiNav = class(TDBNavigator);
  TfrmMantenimientoPrivilegiados = class(TForm)

    GroupBox1: TGroupBox;
    Panel4: TPanel;
    CmdCerrar: TBitBtn;
    IBSQL1: TIBSQL;
    Parientes: TIBTable;
    ParientesID_IDENTIFICACION_PRIV: TSmallintField;
    ParientesID_PERSONA_PRIV: TIBStringField;
    ParientesID_IDENTIFICACION_PAR: TSmallintField;
    ParientesID_PERSONA_PARIENTE: TIBStringField;
    ParientesID_PARENTESCO: TIntegerField;
    ParientesID_AGENCIA: TSmallintField;
    ParientesNOMBRES: TStringField;
    DSParientes: TDataSource;
    DSParentesco: TDataSource;
    IBParentesco: TIBQuery;
    GroupBox2: TGroupBox;
    GridParientes: TDBGrid;
    ComboTipoId: TDBLookupComboBox;
    ComboParentesco: TDBLookupComboBox;
    ComboAgencia: TDBLookupComboBox;
    DSPrivilegiados: TDataSource;
    Privilegiados: TIBTable;
    GridPrivilegiados: TDBGrid;
    PrivilegiadosID_IDENTIFICACION_PRIV: TSmallintField;
    PrivilegiadosID_PERSONA_PRIV: TIBStringField;
    PrivilegiadosID_AGENCIA: TSmallintField;
    ComboTipoIdPriv: TDBLookupComboBox;
    IBSQL2: TIBSQL;
    PrivilegiadosNOMBRES_PRIV: TStringField;
    ComboAgenciaPriv: TDBLookupComboBox;
    DBNavigator2: TDBNavigator;
    DBNavigator1: TDBNavigator;
    IBDataParientes: TIBDataSet;
    BtnAplicar: TBitBtn;
    procedure CmdNuevoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Eliminar1Click(Sender: TObject);
    procedure Agregar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ParientesNOMBRESGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ParientesID_PARENTESCOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ParientesID_IDENTIFICACION_PARGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ParientesID_AGENCIAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure GridParientesColExit(Sender: TObject);
    procedure ParientesBeforeEdit(DataSet: TDataSet);
    procedure ComboTipoIdKeyPress(Sender: TObject; var Key: Char);
    procedure GridPrivilegiadosColEnter(Sender: TObject);
    procedure GridPrivilegiadosColExit(Sender: TObject);
    procedure GridPrivilegiadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PrivilegiadosAfterScroll(DataSet: TDataSet);
    procedure PrivilegiadosNOMBRES_PRIVGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure PrivilegiadosID_IDENTIFICACION_PRIVGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure PrivilegiadosID_AGENCIAGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure GridPrivilegiadosCellClick(Column: TColumn);
    procedure GridPrivilegiadosColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure GridParientesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BtnAplicarClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
  private
    procedure Inicializar;
    procedure BuscarParientes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMantenimientoPrivilegiados: TfrmMantenimientoPrivilegiados;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}
{$R Dibujos.res}

uses Unit_DmComprobante, UnitGlobales;

procedure TfrmMantenimientoPrivilegiados.BuscarParientes;
begin
    if Privilegiados.FieldByName('ID_PERSONA_PRIV').AsString <> '' then begin
        with Parientes do begin
         Filter := 'ID_IDENTIFICACION_PRIV = '+ Privilegiados.FieldByName('ID_IDENTIFICACION_PRIV').AsString + ' and '+
                   'ID_PERSONA_PRIV = ' + Privilegiados.FieldByName('ID_PERSONA_PRIV').AsString;
         Filtered := True;
         try
           Open;
         except
           MessageDlg('Error al Buscar Privilegiados',mtError,[mbcancel],0);
         end;
        end;
        GridParientes.Refresh;
    end;
end;

procedure TfrmMantenimientoPrivilegiados.CmdNuevoClick(Sender: TObject);
begin
        inicializar;
end;

procedure TfrmMantenimientoPrivilegiados.FormShow(Sender: TObject);
begin
        inicializar;
end;

procedure Tfrmmantenimientoprivilegiados.Inicializar;
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
         end;
        DmGeneral.IBTransaction1.StartTransaction;
        DmComprobante.IBQsetagencia.Open;
        DmComprobante.IBQsettipoid.Open;
        IBParentesco.Open;
        Privilegiados.Open;
        buscarparientes;
end;

procedure TfrmMantenimientoPrivilegiados.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmMantenimientoPrivilegiados.Eliminar1Click(Sender: TObject);
begin
        Parientes.Delete;
        GridParientes.Refresh;
end;

procedure TfrmMantenimientoPrivilegiados.Agregar1Click(Sender: TObject);
begin
        Parientes.Last;
end;

procedure TfrmMantenimientoPrivilegiados.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBParentesco.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBDataParientes.Database := dmGeneral.IBDatabase1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBParentesco.Transaction := dmGeneral.IBTransaction1;
        IBSQL2.Transaction := dmGeneral.IBTransaction1;
        IBDataParientes.Transaction := dmGeneral.IBTransaction1;



        DmComprobante := TDmComprobante.Create(self);
        with TMiNav(DBNavigator1) do begin
            Buttons[nbdelete].NumGlyphs := 1;
            Buttons[nbdelete].Glyph.LoadFromResourceName(HInstance,'BORRAR');
            Buttons[nbinsert].NumGlyphs := 1;
            Buttons[nbinsert].Glyph.LoadFromResourceName(HInstance,'INSERTAR');
            Buttons[nbedit].NumGlyphs := 1;
            Buttons[nbedit].Glyph.LoadFromResourceName(HInstance,'EDITAR');
            Buttons[nbpost].NumGlyphs := 1;
            Buttons[nbpost].Glyph.LoadFromResourceName(HInstance,'GRABAR');
            Buttons[nbcancel].NumGlyphs := 1;
            Buttons[nbcancel].Glyph.LoadFromResourceName(HInstance,'CANCELAR');
            Buttons[nbrefresh].NumGlyphs := 1;
            Buttons[nbrefresh].Glyph.LoadFromResourceName(HInstance,'ACTUALIZAR');
        end;

        with TMiNav(DBNavigator2) do begin
            Buttons[nbdelete].NumGlyphs := 1;
            Buttons[nbdelete].Glyph.LoadFromResourceName(HInstance,'BORRAR');
            Buttons[nbinsert].NumGlyphs := 1;
            Buttons[nbinsert].Glyph.LoadFromResourceName(HInstance,'INSERTAR');
            Buttons[nbedit].NumGlyphs := 1;
            Buttons[nbedit].Glyph.LoadFromResourceName(HInstance,'EDITAR');
            Buttons[nbpost].NumGlyphs := 1;
            Buttons[nbpost].Glyph.LoadFromResourceName(HInstance,'GRABAR');
            Buttons[nbcancel].NumGlyphs := 1;
            Buttons[nbcancel].Glyph.LoadFromResourceName(HInstance,'CANCELAR');
            Buttons[nbrefresh].NumGlyphs := 1;
            Buttons[nbrefresh].Glyph.LoadFromResourceName(HInstance,'ACTUALIZAR');
        end;
end;

procedure TfrmMantenimientoPrivilegiados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        DmComprobante.Free;
        Privilegiados.Close;
        Parientes.Close;
end;

procedure TfrmMantenimientoPrivilegiados.ParientesID_PARENTESCOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        with IBSQL1 do BEGIN
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_PARENTESCO from "gen$tiposparentesco"');
          SQL.Add('where ID_PARENTESCO =:ID_PARENTESCO');
          ParamByName('ID_PARENTESCO').AsInteger := Parientes.FieldByName('ID_PARENTESCO').AsInteger;
          ExecQuery;
          Text := Trim(FieldByName('DESCRIPCION_PARENTESCO').AsString);
          Close;
        end;
end;

procedure TfrmMantenimientoPrivilegiados.ParientesID_IDENTIFICACION_PARGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_IDENTIFICACION from "gen$tiposidentificacion"');
          SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_IDENTIFICACION').AsInteger := Parientes.FieldByName('ID_IDENTIFICACION_PAR').AsInteger;
          ExecQuery;
          Text := Trim(FieldByName('DESCRIPCION_IDENTIFICACION').AsString);
          Close;
        end;
end;

procedure TfrmMantenimientoPrivilegiados.ParientesID_AGENCIAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia"');
         SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
         ParamByName('ID_AGENCIA').AsInteger := Parientes.FieldByName('ID_AGENCIA').AsInteger;
         ExecQuery;
         Text := Trim(FieldByName('DESCRIPCION_AGENCIA').AsString);
         Close;
        end;
end;

procedure TfrmMantenimientoPrivilegiados.GridParientesColExit(
  Sender: TObject);
begin
        if GridParientes.SelectedField = ParientesID_IDENTIFICACION_PAR then
          ComboTipoId.Visible := False
        else if GridParientes.SelectedField = ParientesID_PARENTESCO then
          ComboParentesco.Visible := False
        else if GridParientes.SelectedField = ParientesID_AGENCIA then
          ComboAgencia.Visible := False;
end;

procedure TfrmMantenimientoPrivilegiados.ParientesBeforeEdit(
  DataSet: TDataSet);
begin
        GridParientes.Refresh;
end;

procedure TfrmMantenimientoPrivilegiados.ComboTipoIdKeyPress(
  Sender: TObject; var Key: Char);
begin
        if (Key = Chr(9)) then
        begin
           GridParientes.SetFocus;
           SendMessage(GridParientes.Handle,WM_CHAR,Word(Key),0);
        end;
end;

procedure TfrmMantenimientoPrivilegiados.GridPrivilegiadosColEnter(
  Sender: TObject);
begin
        buscarparientes;
end;

procedure TfrmMantenimientoPrivilegiados.GridPrivilegiadosColExit(
  Sender: TObject);
begin
        if GridPrivilegiados.SelectedField = PrivilegiadosID_IDENTIFICACION_PRIV then
          ComboTipoIdPriv.Visible := False
        else if GridPrivilegiados.SelectedField = PrivilegiadosID_AGENCIA then
          ComboAgenciaPriv.Visible := False;
end;

procedure TfrmMantenimientoPrivilegiados.GridPrivilegiadosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
        if (gdfocused in State) then begin
           if DataCol = 0 then begin
             SetWindowPos(ComboTipoIdPriv.Handle,0,
              GridPrivilegiados.Left+ Rect.Left + 1,
              GridPrivilegiados.Top + Rect.Top + 1,
              Rect.Right - Rect.Left,
              Rect.Bottom - Rect.Top,
              SWP_NOZORDER or SWP_SHOWWINDOW);
             ComboTipoIdPriv.Visible :=True;
           end;
           if DataCol = 3 then begin
             SetWindowPos(ComboAgenciaPriv.Handle,0,
              GridPrivilegiados.Left+ Rect.Left + 1,
              GridPrivilegiados.Top + Rect.Top + 1,
              Rect.Right - Rect.Left,
              Rect.Bottom - Rect.Top,
              SWP_NOZORDER or SWP_SHOWWINDOW);
             ComboAgenciaPriv.Visible :=True;
           end;
        end;
end;


procedure TfrmMantenimientoPrivilegiados.PrivilegiadosAfterScroll(
  DataSet: TDataSet);
begin
       if not Parientes.Active then Parientes.Open;
end;

procedure TfrmMantenimientoPrivilegiados.ParientesNOMBRESGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        with IBSQL1 do Begin
         Close;
         SQL.Clear;
         SQL.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE');
         SQL.Add('from "gen$persona" where ID_IDENTIFICACION =:ID_IDENTIFICACION and ID_PERSONA =:ID_PERSONA');
         ParamByName('ID_IDENTIFICACION').AsInteger := Parientes.FieldByName('ID_IDENTIFICACION_PAR').AsInteger;
         ParamByName('ID_PERSONA').AsString := Parientes.FieldByName('ID_PERSONA_PARIENTE').AsString;
         ExecQuery;
         Text := Trim(FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString);
        end;
end;

procedure TfrmMantenimientoPrivilegiados.PrivilegiadosNOMBRES_PRIVGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        with IBSQL2 do Begin
         Close;
         SQL.Clear;
         SQL.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE');
         SQL.Add('from "gen$persona" where ID_IDENTIFICACION =:ID_IDENTIFICACION and ID_PERSONA =:ID_PERSONA');
         ParamByName('ID_IDENTIFICACION').AsInteger := Privilegiados.FieldByName('ID_IDENTIFICACION_PRIV').AsInteger;
         ParamByName('ID_PERSONA').AsString := Privilegiados.FieldByName('ID_PERSONA_PRIV').AsString;
         ExecQuery;
         Text := Trim(FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString);
        end;
end;

procedure TfrmMantenimientoPrivilegiados.PrivilegiadosID_IDENTIFICACION_PRIVGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        with IBSQL2 do begin
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_IDENTIFICACION from "gen$tiposidentificacion"');
          SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_IDENTIFICACION').AsInteger := Privilegiados.FieldByName('ID_IDENTIFICACION_PRIV').AsInteger;
          ExecQuery;
          Text := Trim(FieldByName('DESCRIPCION_IDENTIFICACION').AsString);
          Close;
        end;
end;

procedure TfrmMantenimientoPrivilegiados.PrivilegiadosID_AGENCIAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        with IBSQL2 do begin
         Close;
         SQL.Clear;
         SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia"');
         SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
         ParamByName('ID_AGENCIA').AsInteger := Privilegiados.FieldByName('ID_AGENCIA').AsInteger;
         ExecQuery;
         Text := Trim(FieldByName('DESCRIPCION_AGENCIA').AsString);
         Close;
        end;
end;

procedure TfrmMantenimientoPrivilegiados.GridPrivilegiadosCellClick(
  Column: TColumn);
begin
        buscarparientes;
end;

procedure TfrmMantenimientoPrivilegiados.GridPrivilegiadosColumnMoved(
  Sender: TObject; FromIndex, ToIndex: Integer);
begin
        buscarparientes;
end;

procedure TfrmMantenimientoPrivilegiados.GridParientesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
        if (gdselected in State) then begin
           if DataCol = 0 then begin
             SetWindowPos(ComboTipoId.Handle,0,
              GridParientes.Left+ Rect.Left + 1,
              GridParientes.Top + Rect.Top + 1,
              Rect.Right - Rect.Left,
              Rect.Bottom - Rect.Top,
              SWP_NOZORDER or SWP_SHOWWINDOW);
             ComboTipoId.Visible :=True;
           end;
           if DataCol = 3 then begin
             SetWindowPos(ComboParentesco.Handle,0,
              GridParientes.Left+ Rect.Left + 1,
              GridParientes.Top + Rect.Top + 1,
              Rect.Right - Rect.Left,
              Rect.Bottom - Rect.Top,
              SWP_NOZORDER or SWP_SHOWWINDOW);
             ComboParentesco.Visible :=True;
           end;
           if DataCol = 4 then begin
             SetWindowPos(ComboAgencia.Handle,0,
              GridParientes.Left+ Rect.Left + 1,
              GridParientes.Top + Rect.Top + 1,
              Rect.Right - Rect.Left,
              Rect.Bottom - Rect.Top,
              SWP_NOZORDER or SWP_SHOWWINDOW);
             ComboAgencia.Visible :=True;
           end;
        end;
end;

procedure TfrmMantenimientoPrivilegiados.BtnAplicarClick(Sender: TObject);
begin
        Parientes.ApplyUpdates;
        Parientes.Refresh;
        Privilegiados.ApplyUpdates;
        Privilegiados.Refresh;
end;

procedure TfrmMantenimientoPrivilegiados.DBNavigator1BeforeAction(
  Sender: TObject; Button: TNavigateBtn);
begin
      if Button = nbpost  then begin
        Parientes.FieldByName('ID_IDENTIFICACION_PRIV').AsInteger := Privilegiados.FieldByName('ID_IDENTIFICACION_PRIV').AsInteger;
        Parientes.FieldByName('ID_PERSONA_PRIV').AsString := Privilegiados.FieldByName('ID_PERSONA_PRIV').AsString;
      end;



end;

end.
