unit UnitImagenesPersona;

interface

uses
  Windows, Messages, SysUtils, Clipbrd, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dbcgrids, DB, IBCustomDataSet, IBQuery, DBCtrls, ExtCtrls,
  StdCtrls, Buttons, UnitGlobales;

type
  TfrmImagenesPersona = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    DBImage1: TDBImage;
    DBImage2: TDBImage;
    DBImage3: TDBImage;
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure DBImage1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBImage3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBImage2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FCaptacion:TCaptacion;
  public
    property Captacion:TCaptacion read FCaptacion Write FCaptacion;
    { Public declarations }
  end;

var
  frmImagenesPersona: TfrmImagenesPersona;

implementation


uses UnitdmGeneral,UnitImagenAmpliada;

{$R *.dfm}


procedure TfrmImagenesPersona.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmImagenesPersona.FormShow(Sender: TObject);
begin
        with IBQuery1 do begin
          Close;
          ParamByName('ID_AGENCIA').AsInteger := FCaptacion.IdAgencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := FCaptacion.IdCaptacion;
          ParamByName('NUMERO_CUENTA').AsInteger := FCaptacion.IdNumeroCuenta;
          ParamByName('DIGITO_CUENTA').AsInteger := FCaptacion.IdDigitoCuenta;
          try
           Open;
           if RecordCount < 1 then begin
            MessageDlg('No Existen Imagenes',mtError,[mbcancel],0);
            CmdCerrar.Click;
           end;
          except
            MessageDlg('Error al Buscar Imagenes',mtError,[mbcancel],0);
            CmdCerrar.Click;
          end;
        end;
        Self.Caption := 'Imagenes Titulares Captación:'+
                        Format('%.1d%.2d-%.7d-%.1d',[FCaptacion.IdCaptacion,FCaptacion.IdAgencia,
                                                     FCaptacion.IdNumeroCuenta,FCaptacion.IdDigitoCuenta]);
end;

procedure TfrmImagenesPersona.DBImage1DblClick(Sender: TObject);
var frmImagenAmpliada:TfrmImagenAmpliada;
begin
         frmImagenAmpliada := TfrmImagenAmpliada.Create(Self);
         frmImagenAmpliada.Imagen := DBImage1.Picture.Bitmap;
         frmImagenAmpliada.ShowModal;
end;

procedure TfrmImagenesPersona.DBImage1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;

end;

procedure TfrmImagenesPersona.DBImage3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;

end;

procedure TfrmImagenesPersona.DBImage2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;

end;

end.
