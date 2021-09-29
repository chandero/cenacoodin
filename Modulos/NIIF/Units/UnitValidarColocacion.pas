unit UnitValidarColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,unitGlobales;

type
  TfrmValidarColocacion = class(TForm)
    CmdValidar: TBitBtn;
    CmdCerrar: TBitBtn;
    EdColocacion: TStaticText;
    EdDocumento: TStaticText;
    EdTotal: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure CmdValidarClick(Sender: TObject);
  private
    { Private declarations }
    CValidar:TValidarCol;
  public
    { Public declarations }
    property Validar:TValidarCol read CValidar Write CValidar;
  end;

var
  frmValidarColocacion: TfrmValidarColocacion;

implementation

{$R *.dfm}

procedure TfrmValidarColocacion.FormShow(Sender: TObject);
var s:string;
begin

        EdColocacion.Caption := Validar.Colocacion;
        EdDocumento.Caption := Format('%.7d',[Validar.Documento]);
        EdTotal.Caption := FormatCurr('$#,0.00',Validar.Efectivo);

        s := #27+'c0'+#0;
        SendControlCode(s);
        s := '     '+Empresa+' Nit:'+Nit+#13+#10 +
             '     '+'Fecha:'+FormatDateTime('yy/MM/dd',Validar.Fecha)+' Caja:'+Format('%.2d',[Validar.Caja])+' Cuenta:'+Format('%.8d',[Validar.Cuenta])+#13+#10+
             '     '+'Col:'+Validar.Colocacion+' Doc:'+Format('%.8d',[Validar.Documento])+'Int Pag:'+FormatDateTime('yy/MM/dd',Validar.FechaInt)+#13+#10+
             '     '+'Nombre:'+Validar.Nombre+#13+#10;
        SendControlCode(s);
        s:=  '     '+'Lin:'+Validar.Clasificacion+' Gar:'+Validar.Garantia+' Est: '+Validar.Estado+#13+#10+
             '     '+'Cap:'+Format('%18.2m',[Validar.Capital])+' Saldo:'+Format('%18.2m',[Validar.NuevoSaldo])+#13+#10+
             '     '+'Int:'+Format('%18.2m',[Validar.Interes])+' Devol:'+Format('%18.2m',[Validar.Devuelto])+#13+#10+
             '     '+'Otr:'+Format('%18.2m',[Validar.Otras])  +' Caja :'+Format('%18.2m',[Validar.Efectivo])+#13;
        SendControlCode(s);

        CmdValidar.Click;
//      CmdValidar.Click;

end;

procedure TfrmValidarColocacion.CmdValidarClick(Sender: TObject);
var s:string;
begin
        s := #27+'c0'+#8;
        SendControlCode(s);
        s := '     '+Empresa+' Nit:'+Nit+#13+#10+
             '     '+'Fecha:'+FormatDateTime('yy/MM/dd',Validar.Fecha)+' Caja:'+Format('%.2d',[Validar.Caja])+' Cuenta:'+Format('%.8d',[Validar.Cuenta])+#13+#10+
             '     '+'Col:'+Validar.Colocacion+' Doc:'+Format('%.7d',[Validar.Documento])+' Int Pag:'+FormatDateTime('yy/MM/dd',Validar.FechaInt)+#13+#10+
             '     '+'Nombre:'+Validar.Nombre+#13+#10;
        SendControlCode(s);
        s := '     '+'Lin:'+Validar.Clasificacion+' Gar:'+Validar.Garantia+' Est: '+Validar.Estado+#13+#10+
             '     '+'Cap:'+Format('%18.2m',[Validar.Capital])+' Saldo:'+Format('%18.2m',[Validar.NuevoSaldo])+#13+#10+
             '     '+'Int:'+Format('%18.2m',[Validar.Interes])+' Devol:'+Format('%18.2m',[Validar.Devuelto])+#13+#10+
             '     '+'Otr:'+Format('%18.2m',[Validar.Otras])  +' Caja :'+Format('%18.2m',[Validar.Efectivo])+#13+#10;
        SendControlCode(s);
        s:=  #27+'q';
        SendControlCode(s);
end;

end.
