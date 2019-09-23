unit UnitValidarCaptacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvxAnimate,UnitGlobales,Printers,MaskUtils,
  pr_Common, pr_TxClasses, pr_Classes, StrUtils;

type
  TfrmValidarCaptacion = class(TForm)
    CmdValidar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdSaldo: TBitBtn;
    EdCaptacion: TStaticText;
    EdDocumento: TStaticText;
    EdTotal: TStaticText;
    Reporte1: TprTxReport;
    prReport1: TprReport;
    procedure FormShow(Sender: TObject);
    procedure CmdValidarClick(Sender: TObject);
  private
    { Private declarations }
    FValidar:TValidarCap;
  public
    { Public declarations }
    property Validar:TValidarCap read FValidar Write FValidar;
  end;

var
  frmValidarCaptacion: TfrmValidarCaptacion;
  Pos:TPrinter;

implementation

{$R *.dfm}

procedure TfrmValidarCaptacion.FormShow(Sender: TObject);
var s:string;
begin
        EdCaptacion.Caption := Format('%d%.2d-%.8d',[Validar.Tipo,Validar.Agencia,Validar.Cuenta]);
        EdDocumento.Caption := Format('%.7d',[Validar.Documento]);
        EdTotal.Caption := FormatCurr('$#,0.00',Validar.Billetes + Validar.Monedas + Validar.Cheques);

        s := #27+'c0'+#0;
        SendControlCode(s);
        s := '     '+Empresa+' Nit:'+Nit+#13+#10+
             '     '+'Fecha:'+DateToStr(Validar.Fecha)+' Caja:'+Format('%.2d',[Validar.Caja])+' Origen:'+Format('%.3d',[Validar.Origen])+#13+#10+
             '     '+'Cap:'+Format('%d%.2d-%.8d',[Validar.Tipo,Validar.Agencia,Validar.Cuenta])+' Op:'+Format('%.3d',[Validar.Operacion])+' Doc:'+Format('%.8d',[Validar.Documento])+#13+#10 +
             '     '+'Nombre:'+LeftStr(Validar.Nombre,28)+#13+#10;
        SendControlCode(s);
        s := '     '+'Billetes:'+Format('%15.2m',[Validar.Billetes])+#13+#10+
             '     '+'Monedas :'+Format('%15.2m',[Validar.Monedas])+#13+#10+
             '     '+'Cheques :'+Format('%15.2m',[Validar.Cheques])+#13+#10+
             '     '+'Total   :'+Format('%15.2m',[Validar.Billetes+Validar.Monedas+Validar.Cheques])+#13+#10;
        SendControlCode(s);

{        s := '     '+Empresa+' Nit:'+Nit+#13+#10+
             '     '+'Fecha:'+DateToStr(Validar.Fecha)+' Caja:'+Format('%.2d',[Validar.Caja])+' Origen:'+Format('%.3d',[Validar.Origen])+#13+#10+
             '     '+'Cap:'+Format('%d%.2d-%.8d',[Validar.Tipo,Validar.Agencia,Validar.Cuenta])+' Op:'+Format('%.3d',[Validar.Operacion])+' Doc:'+Format('%.8d',[Validar.Documento])+#13+#10;
        SendControlCodeNew('EPSON TM-U675 No Cut',s);
        s := '     '+'Billetes:'+Format('%15.2m',[Validar.Billetes])+#13+#10+
             '     '+'Monedas :'+Format('%15.2m',[Validar.Monedas])+#13+#10+
             '     '+'Cheques :'+Format('%15.2m',[Validar.Cheques])+#13+#10+
             '     '+'Total   :'+Format('%15.2m',[Validar.Billetes+Validar.Monedas+Validar.Cheques])+#13+#10;
        SendControlCodeNew('EPSON TM-U675 No Cut',s);
}
        if Validar.Operacion = 1 then
        begin
           CmdValidar.Click;
           Exit;
        end;

        CmdValidar.Click;
        if (Validar.Origen <> 8) and
           (Validar.Origen <> 9) then
           CmdValidar.Click;

end;

procedure TfrmValidarCaptacion.CmdValidarClick(Sender: TObject);
var s:string;
begin
        s := #27+'c0'+#8;
        SendControlCode(s);
        s := '     '+Empresa+' Nit:'+Nit+#13+#10+
             '     '+'Fecha:'+DateToStr(Validar.Fecha)+' Caja:'+Format('%.2d',[Validar.Caja])+' Origen:'+Format('%.3d',[Validar.Origen])+#13+#10+
             '     '+'Cap:'+Format('%d%.2d-%.8d',[Validar.Tipo,Validar.Agencia,Validar.Cuenta])+' Op:'+Format('%.3d',[Validar.Operacion])+' Doc:'+Format('%.8d',[Validar.Documento])+#13+#10+
             '     '+'Nombre:'+LeftStr(Validar.Nombre,28)+#13+#10;
        SendControlCode(s);
        s := '     '+'Billetes:'+Format('%18.2m',[Validar.Billetes])+#13+#10+
             '     '+'Monedas :'+Format('%18.2m',[Validar.Monedas])+#13+#10+
             '     '+'Cheques :'+Format('%18.2m',[Validar.Cheques])+#13+#10+
             '     '+'Total   :'+Format('%18.2m',[Validar.Billetes+Validar.Monedas+Validar.Cheques])+#13+#10;
        SendControlCode(s);
        s:=  #27+'q';
        SendControlCode(s);

{        s := '     '+Empresa+' Nit:'+Nit+#13+#10+
             '     '+'Fecha:'+DateToStr(Validar.Fecha)+' Caja:'+Format('%.2d',[Validar.Caja])+' Origen:'+Format('%.3d',[Validar.Origen])+#13+#10+
             '     '+'Cap:'+Format('%d%.2d-%.8d',[Validar.Tipo,Validar.Agencia,Validar.Cuenta])+' Op:'+Format('%.3d',[Validar.Operacion])+' Doc:'+Format('%.8d',[Validar.Documento])+#13+#10;
        SendControlCodeNew('EPSON TM-U675(Validation)',s);
        s := '     '+'Billetes:'+Format('%18.2m',[Validar.Billetes])+#13+#10+
             '     '+'Monedas :'+Format('%18.2m',[Validar.Monedas])+#13+#10+
             '     '+'Cheques :'+Format('%18.2m',[Validar.Cheques])+#13+#10+
             '     '+'Total   :'+Format('%18.2m',[Validar.Billetes+Validar.Monedas+Validar.Cheques])+#13+#10;
        SendControlCodeNew('EPSON TM-U675(Validation)',s);
}
end;

end.
