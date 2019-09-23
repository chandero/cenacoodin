unit UnitArqueoDevolucion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, StdCtrls, JvEdit, JvTypedEdit, Buttons, ExtCtrls;

type 
    TDenominacion = Record
    IdDenominacion:Integer;
    vDenominacion:Currency;
    Denominacion: TLabel;
    Cantidad:TJvIntegerEdit;
    Total:TStaticText;
    Existencia:Integer;
end;

type PLista = ^ALista;
     ALista = Record
      IdDenominacion:Integer;
      vDenominacion:Currency;
      Cantidad:Integer;
      Existencia:Integer;
end;

type
  TfrmArqueoDevolucion = class(TForm)
    Panel1: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SBDenominacion: TScrollBox;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdMonedas: TJvCurrencyEdit;
    EdTotalBilletes: TStaticText;
    IBOtros: TIBSQL;
    IBSelect: TIBSQL;
    IBUpdate: TIBSQL;
    IBInsert: TIBSQL;
    procedure FormShow(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdMonedasChange(Sender: TObject);
    procedure EdMonedasEnter(Sender: TObject);
  private
    { Private declarations }
    LDenominacion:array of TDenominacion;
    MiLista:TList;
    MiValor:Currency;
    MiMonedas:Currency;
    procedure ValorDenominacion(Sender: TObject);
  public
    { Public declarations }
    property ListaDevolucion:TList read MiLista Write MiLista;
    property ValorDevolucion:Currency read MiValor Write MiValor;
    property MonedasDevolucion:Currency read MiMonedas Write MiMonedas;
  published
    procedure CantidadEnter(Sender: TObject);
  end;

var
  frmArqueoDevolucion: TfrmArqueoDevolucion;
  Total:Currency;
  ARecord:PLista;


implementation

uses UnitdmGeneral, unitGlobales;

{$R *.dfm}

procedure TfrmArqueoDevolucion.FormShow(Sender: TObject);
var I:Integer;
    ARecord:TDenominacion;
    PRecord:PLista;
begin
        if dmGeneral.IBTransaction1.InTransaction then
        begin
          dmGeneral.IBTransaction1.Commit;
          dmGeneral.IBTransaction1.StartTransaction;
        end;

        ValorDevolucion := 0;

        with IBOtros do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$denominaciones" where ACTIVO <> 0 and MONEDAS = 0 order by VALOR ASC');
          try
            ExecQuery;
            while not Eof do
            begin
               I := Length(LDenominacion)+1;
               SetLength(LDenominacion,I);
               ARecord.IdDenominacion := FieldByName('ID_DENOMINACION').AsInteger;
               ARecord.vDenominacion := FieldByName('VALOR').AsCurrency;
               ARecord.Denominacion := TLabel.Create(Self);
               ARecord.Denominacion.Name := 'LbDenomCap'+IntToStr(I);
               ARecord.Denominacion.Caption := Trim(FormatCurr('#,0',FieldByName('VALOR').AsCurrency));
               ARecord.Denominacion.Parent := SBDenominacion;
               ARecord.Denominacion.Left := 5;
               ARecord.Denominacion.Top := 1 + (20 * (I - 1));
               ARecord.Denominacion.Alignment := taRightJustify;
               ARecord.Denominacion.Width := 60;
               ARecord.Denominacion.Font.Style := [fsBold];
               ARecord.Cantidad := TJvIntegerEdit.Create(Self);
               ARecord.Cantidad.Name := 'EdCantidadCap'+IntToStr(I);
               ARecord.Cantidad.OnExit := ValorDenominacion;
               ARecord.Cantidad.OnEnter := CantidadEnter;
               ARecord.Cantidad.Value := 0;
               ARecord.Cantidad.Tag := I-1;
               ARecord.Cantidad.Alignment := taRightJustify;
               ARecord.Cantidad.Parent:= SBDenominacion;
               ARecord.Cantidad.Left := 85;
               ARecord.Cantidad.Top := 1 + (20*(I-1));
               ARecord.Cantidad.Width := 90;
               ARecord.Cantidad.Visible := True;
               ARecord.Cantidad.Font.Style := [fsBold];
               ARecord.Total := TStaticText.Create(self);
               ARecord.Total.Name := 'EdTotalCap'+IntToStr(I);
               ARecord.Total.Caption := '';
               ARecord.Total.Parent := SBDenominacion;
               ARecord.Total.Left := 200;
               ARecord.Total.Top := 1+(20*(I-1));
               ARecord.Total.AutoSize := False;
               ARecord.Total.Width := 126;
               ARecord.Total.Height := 19;
               ARecord.Total.Alignment :=  taRightJustify;
               ARecord.Total.Color := clCaptionText;
               ARecord.Total.BevelInner := bvLowered;
               ARecord.Total.BevelKind := bkSoft;
               ARecord.Total.BevelOuter := bvLowered;
               ARecord.Total.Font.Style := [fsBold];
               LDenominacion[I-1] := ARecord;
               Next;
            end;
          except
          end;
        end;

        if ListaDevolucion.Count > 0 then
        for I := 0 to ListaDevolucion.Count - 1 do
        begin
                PRecord := ListaDevolucion.Items[I];
                LDenominacion[I].Cantidad.Value := PRecord^.Cantidad;
                LDenominacion[I].Existencia := PRecord^.Existencia;
                LDenominacion[I].Total.Caption := FormatCurr('#,0.00',LDenominacion[I].vDenominacion * PRecord^.Cantidad);
                ValorDevolucion := ValorDevolucion + LDenominacion[I].vDenominacion * PRecord^.Cantidad;
        end;
        Total := Total + MonedasDevolucion;
        EdTotalBilletes.Caption := FormatCurr('$#,0.00',ValorDevolucion);
        EdMonedas.Value := MonedasDevolucion;
        LDenominacion[0].Cantidad.SetFocus;
end;

procedure TfrmArqueoDevolucion.ValorDenominacion(Sender: TObject);
var Valor:Currency;
    Pos:Integer;
    I:Integer;
begin
       Pos := TJvIntegerEdit(Sender).Tag;
       Valor := LDenominacion[Pos].vDenominacion * TJvIntegerEdit(Sender).Value;
       if LDenominacion[Pos].Existencia < TJvIntegerEdit(Sender).Value then
       begin
        MessageDlg('Esta caja no tiene esa cantidad de billetes de ' + LDenominacion[Pos].Denominacion.Caption ,mtInformation,[mbok],0);
        TJvIntegerEdit(Sender).Value := LDenominacion[Pos].Existencia;
       end;

       LDenominacion[Pos].Total.Caption := FormatCurr('#,0.00',Valor);
       ValorDevolucion := 0;
       for I := 0 to Length(LDenominacion) - 1 do
       begin
           Valor := LDenominacion[I].vDenominacion * LDenominacion[I].Cantidad.Value;
           ValorDevolucion := ValorDevolucion + Valor;
       end;
       ValorDevolucion := ValorDevolucion + EdMonedas.Value;
       EdTotalBilletes.Caption := FormatCurr('$#,0.00',ValorDevolucion);
end;


procedure TfrmArqueoDevolucion.CmdAceptarClick(Sender: TObject);
var I:Integer;
    ARecord:PLista;
begin
          ListaDevolucion.Clear;
          for I := 0 to Length(LDenominacion) - 1 do
          begin
                New(ARecord);
                ARecord^.IdDenominacion := LDenominacion[I].IdDenominacion;
                ARecord^.vDenominacion  := LDenominacion[I].vDenominacion;
                ARecord^.Cantidad       := LDenominacion[I].Cantidad.Value;
                ListaDevolucion.Add(ARecord);
          end;
          MonedasDevolucion := EdMonedas.Value;
end;

procedure TfrmArqueoDevolucion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmArqueoDevolucion.EdMonedasChange(Sender: TObject);
var I:Integer;
    Valor:Currency;
begin
       ValorDevolucion := 0;
       for I := 0 to Length(LDenominacion) - 1 do
       begin
           Valor := LDenominacion[I].vDenominacion * LDenominacion[I].Cantidad.Value;
           ValorDevolucion := ValorDevolucion + Valor;
       end;
       ValorDevolucion := ValorDevolucion + EdMonedas.Value;
       EdTotalBilletes.Caption := FormatCurr('$#,0.00',ValorDevolucion);
end;

procedure TfrmArqueoDevolucion.CantidadEnter(Sender: TObject);
begin
      TJvIntegerEdit(Sender).SelectAll;
end;

procedure TfrmArqueoDevolucion.EdMonedasEnter(Sender: TObject);
begin
        EdMonedas.SelectAll;
end;

end.
