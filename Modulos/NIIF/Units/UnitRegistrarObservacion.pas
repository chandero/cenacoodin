unit UnitRegistrarObservacion;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvFormAnimation, StdCtrls, ComCtrls, JvEdit,
  JvTypedEdit, ExtCtrls, Buttons;

type
  TfrmRegistrarObservacion = class(TForm)
    frmAnimacion: TJvFormAnimation;
    Panel1: TPanel;
    cmdRetornar: TBitBtn;
    SBox1: TScrollBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmdRetornarClick(Sender: TObject);
  private
    FCadena:string;
    FLlave:Integer;
    FMemo:string;
    FValido:Boolean;
    { Private declarations }
  public
    { Public declarations }
    property Cadena:string read FCadena Write FCadena;
    property Llave:Integer read FLlave Write FLlave;
    property Memo:string read FMemo Write FMemo;
    property Valido:Boolean read FValido Write FValido;
  end;

type PComponente = ^TComponente;
     TComponente = record
     Etiqueta:string;
     Tipo:string;
     Et:TObject;
     Ed:TObject;
end;

var
  frmRegistrarObservacion: TfrmRegistrarObservacion;
  Lista:TList;
  
implementation

{$R *.dfm}

uses unitGlobales;

procedure TfrmRegistrarObservacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRegistrarObservacion.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
        Resize := False;
end;

procedure TfrmRegistrarObservacion.FormShow(Sender: TObject);
var
    i,X,XAnt:Integer;
    ARec:PComponente;
begin
        FMemo := '';
        
        if FLlave = 0 then begin
           New(ARec);
           ARec^.Etiqueta := 'Descripción:';
           ARec^.Tipo := '%M';
           Lista.Add(ARec);
        end
        else begin
         XAnt := 1;
         while Pos('%',FCadena) > 0 do begin
           New(ARec);
           X := Pos('%',FCadena);
           ARec^.Etiqueta := MidStr(FCadena,XAnt,(X-XAnt));
           ARec^.Tipo := MidStr(FCadena,X,2);
           FCadena[X] := #9;
           Lista.Add(ARec);
           XAnt := X+2;
         end;
        end;

        for i := 0 to Lista.Count - 1 do begin
          ARec := Lista.Items[i];

          ARec^.Et := TLabel.Create(Self);
          (ARec^.Et as TLabel).Parent := SBox1;
          (ARec^.Et as TLabel).Caption := ARec^.Etiqueta;
          (ARec^.Et as TLabel).Left := 1;
          (ARec^.Et as TLabel).Top := 2 + ( 24 * i);
          (ARec^.Et as TLabel).AutoSize := True;

          if ARec^.Tipo = '%c' then begin
             ARec^.Ed := TEdit.Create(Self);
             (ARec^.Ed as TEdit).Parent := SBox1;
             (ARec^.Ed as TEdit).Text := '';
             (ARec^.Ed as TEdit).Left := (ARec^.Et as TLabel).Left + (ARec^.Et as TLabel).Width + 2;
             (ARec^.Ed as TEdit).Top := 2 + ( 24 * i);
             (ARec^.Ed as TEdit).Width := 99;
          end;

          if ARec^.Tipo = '%f' then begin
             ARec^.Ed := TDateTimePicker.Create(Self);
             (ARec^.Ed as TDateTimePicker).Parent := SBox1;
             (ARec^.Ed as TDateTimePicker).Date := fFechaActual;
             (ARec^.Ed as TDateTimePicker).Left := (ARec^.Et as TLabel).Left + (ARec^.Et as TLabel).Width + 2;
             (ARec^.Ed as TDateTimePicker).Top := 2 + ( 24 * i);
             (ARec^.Ed as TDateTimePicker).Width := 99;
          end;

          if ARec^.Tipo = '%m' then begin
             ARec^.Ed := TJvCurrencyEdit.Create(Self);
             (ARec^.Ed as TJvCurrencyEdit).Parent := SBox1;
             (ARec^.Ed as TJvCurrencyEdit).Value := 0;
             (ARec^.Ed as TJvCurrencyEdit).Left := (ARec^.Et as TLabel).Left + (ARec^.Et as TLabel).Width + 2;
             (ARec^.Ed as TJvCurrencyEdit).Top := 2 + ( 24 * i);
             (ARec^.Ed as TJvCurrencyEdit).Width := 99;
          end;

          if ARec^.Tipo = '%e' then begin
             ARec^.Ed := TJvIntegerEdit.Create(Self);
             (ARec^.Ed as TJvIntegerEdit).Parent := SBox1;
             (ARec^.Ed as TJvIntegerEdit).Value := 0;
             (ARec^.Ed as TJvIntegerEdit).Left := (ARec^.Et as TLabel).Left + (ARec^.Et as TLabel).Width + 2;
             (ARec^.Ed as TJvIntegerEdit).Top := 2 + ( 24 * i);
             (ARec^.Ed as TJvIntegerEdit).Width := 99;
          end;

          if ARec^.Tipo = '%r' then begin
             ARec^.Ed := TRadioButton.Create(Self);
             (ARec^.Ed as TRadioButton).Parent := SBox1;
             (ARec^.Ed as TRadioButton).Left := (ARec^.Et as TLabel).Left + (ARec^.Et as TLabel).Width + 2;
             (ARec^.Ed as TRadioButton).Top := 2 + ( 24 * i);
             (ARec^.Ed as TRadioButton).Width := 99;
          end;

          if ARec^.Tipo = '%M' then begin
             ARec^.Ed := TMemo.Create(Self);
             (ARec^.Ed as TMemo).Parent := SBox1;
             (ARec^.Ed as TMemo).Align := alClient;
             (ARec^.Ed as TMemo).WantReturns := True;
             (ARec^.Ed as TMemo).WantTabs := False;
             (ARec^.Ed as TMemo).ScrollBars := ssBoth;
          end;

        end;

end;

procedure TfrmRegistrarObservacion.FormCreate(Sender: TObject);
begin
        Lista := TList.Create;
end;

procedure TfrmRegistrarObservacion.cmdRetornarClick(Sender: TObject);
var i:Integer;
    ARec:PComponente;
begin
        for i :=0 to Lista.Count - 1 do begin
           ARec := Lista.Items[i];
           FMemo := FMemo + ARec^.Etiqueta + ' ';
           if ARec^.Tipo = '%c' then
              FMemo := FMemo + Trim((ARec^.Ed as TEdit).Text) + ' ';
           if ARec^.Tipo = '%f' then
              FMemo := FMemo + Trim(DateToStr((ARec^.Ed as TDateTimePicker).Date)) + ' ';
           if ARec^.Tipo = '%m' then
              FMemo := FMemo + FormatCurr('$#,0.00',(ARec^.Ed as TJvCurrencyEdit).Value) + ' ';
           if ARec^.Tipo = '%e' then
              FMemo := FMemo + FormatCurr('#',(ARec^.Ed as TJvIntegerEdit).Value) + ' ';
           if ARec^.Tipo = '%r' then
              if (ARec^.Ed as TRadioButton).Checked then
                 FMemo := FMemo + 'X'
              ELSE
                 FMemo := FMemo + ' ';
           if ARec^.Tipo = '%M' then
              FMemo := FMemo + (ARec^.Ed as TMemo).Text;

        end;

        Self.Hide;
end;

end.
