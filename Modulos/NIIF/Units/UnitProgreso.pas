unit UnitProgreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, JvSpecialProgress, ExtCtrls, JvComponent,
  JvClock, JvLabel, JvBlinkingLabel, JvScrollingLabel, JvWaitingProgress;

type
  TfrmProgresoServer = class(TForm)
    Info: TJvLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    a: integer;
    { Private declarations }
    procedure setposicion(Value:Integer);
    procedure setminimo(Value:Integer);
    procedure setmaximo(Value:Integer);
    procedure setinfo(Value:string);
    procedure setTitulo(Value:string);
  public
    { Public declarations }
    //property Position:Integer Write setposicion;
    //property Min:Integer Write setMinimo;
    //property Max:Integer Write setMaximo;
   // property InfoLabel:string Write setInfo;
    //property Titulo:string Write SetTitulo;
    procedure Ejecutar;
    procedure Cerrar;
  end;

var
  frmProgresoServer: TfrmProgresoServer;
  MinValor:Integer;
  MaxValor:Integer;
  Porcentaje:Integer;

implementation

{$R *.dfm}

procedure TfrmProgresoServer.setminimo(Value:Integer);
begin
//        Barra.Minimum := Value;
end;

procedure TfrmProgresoServer.setmaximo(Value:Integer);
begin
//        Barra.Maximum := Value;
end;

procedure TfrmProgresoServer.setposicion(Value:Integer);
var Valor:Integer;
begin
{        Porcentaje := Value;
        Barra.Position := Porcentaje;
        try
         if Porcentaje > 0 then
            Porcentaje := (Porcentaje * 100 ) div Barra.Maximum;
        finally
          Barra.Caption := FormatFloat('#0%',Porcentaje);
        end;1}
end;

procedure TfrmProgresoServer.setinfo(Value:string);
begin
        //Info.Caption := Value;
end;

procedure TfrmProgresoServer.setTitulo(Value:string);
begin
        Self.Caption := Value;
end;

procedure TfrmProgresoServer.Ejecutar;
begin
        Self.Show
end;

procedure TfrmProgresoServer.Cerrar;
begin
        Close;
end;

procedure TfrmProgresoServer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action := caFree;
end;

procedure TfrmProgresoServer.FormCreate(Sender: TObject);
begin
        Application.ProcessMessages
end;

procedure TfrmProgresoServer.Button1Click(Sender: TObject);
begin
        ShowMessage('did');
end;

end.
