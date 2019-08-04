unit UnitPantallaProgreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, JvSpecialProgress;

type
  TfrmProgreso = class(TForm)
    Info: TLabel;
    Barra: TJvSpecialProgress;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure setposicion(Value:Integer);
    procedure setminimo(Value:Integer);
    procedure setmaximo(Value:Integer);
    procedure setinfo(Value:string);
    procedure setTitulo(Value:string);
  public
    { Public declarations }
    property Position:Integer Write setposicion;
    property Min:Integer Write setMinimo;
    property Max:Integer Write setMaximo;
    property InfoLabel:string Write setInfo;
    property Titulo:string Write SetTitulo;
    procedure Ejecutar;
    procedure Cerrar;
  end;

var
  frmProgreso: TfrmProgreso;
  MinValor:Integer;
  MaxValor:Integer;
  Porcentaje:Integer;

implementation

{$R *.dfm}

procedure TfrmProgreso.setminimo(Value:Integer);
begin
        Barra.Minimum := Value;
end;

procedure TfrmProgreso.setmaximo(Value:Integer);
begin
        Barra.Maximum := Value;
end;

procedure Tfrmprogreso.setposicion(Value:Integer);
var Valor:Integer;
begin
        Porcentaje := Value;
        Barra.Position := Porcentaje;
        try
         if Porcentaje > 0 then
            Porcentaje := (Porcentaje * 100 ) div Barra.Maximum;
        finally
          Barra.Caption := FormatFloat('#0%',Porcentaje);
        end;
end;

procedure Tfrmprogreso.setinfo(Value:string);
begin
        Info.Caption := Value;
end;

procedure Tfrmprogreso.setTitulo(Value:string);
begin
        Self.Caption := Value;
end;

procedure Tfrmprogreso.Ejecutar;
begin
        Self.Show;
end;

procedure Tfrmprogreso.Cerrar;
begin
        Close;
end;

procedure TfrmProgreso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action := caFree;
end;

end.
