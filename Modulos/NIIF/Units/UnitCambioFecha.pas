unit UnitCambioFecha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TFrmCambiarFecha = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    fecha1: TDateTimePicker;
    Panel2: TPanel;
    Label2: TLabel;
    fecha2: TDateTimePicker;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCambiarFecha: TFrmCambiarFecha;

implementation
uses UnitGlobales, UnitDmLog;

{$R *.dfm}

procedure TFrmCambiarFecha.FormCreate(Sender: TObject);
begin
        fecha1.Date := vFechaEnte;
        fecha2.Date := fFechaActual;
end;

procedure TFrmCambiarFecha.BitBtn1Click(Sender: TObject);
var     vHora :TDateTime;
        vFecha :TDate;
begin
        vHora := Time;
        vFecha := fFechaActual;
        if MessageDlg('Esta Seguro de Cambiar la Fecha de Estudio de Solicitudes',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        vFechaEnte := fecha2.Date;
        if vFechaEnte <> fecha1.Date then
        begin
          try
            with DmLog.IBQuery1 do
            begin
              Close;
              if Transaction.InTransaction then
                Close;
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                SQL.Clear;
                //REGISTRO ANTERIOR
                SQL.Add('insert into "ent$fechaente" values (:TIPO,:ID_MODULO,:F_ACTUALIZACION,:H_ACTUALIZACION,:ID_EMPLEADO,:FECHA_ENTE)');
                ParamByName('TIPO').AsString := 'OLD';
                ParamByName('ID_MODULO').AsString := '11';
                ParamByName('F_ACTUALIZACION').AsDate := vFecha;
                ParamByName('H_ACTUALIZACION').AsTime := vHora;
                ParamByName('ID_EMPLEADO').AsString := DBAlias;
                ParamByName('FECHA_ENTE').AsDate := fecha1.Date;
                ExecSQL;
                Transaction.CommitRetaining;
                //NUEVO REGISTRO
                ParamByName('TIPO').AsString := 'NEW';
                ParamByName('ID_MODULO').AsString := '11';
                ParamByName('F_ACTUALIZACION').AsDate := vFecha;
                ParamByName('H_ACTUALIZACION').AsTime := vHora;
                ParamByName('ID_EMPLEADO').AsString := DBAlias;
                ParamByName('FECHA_ENTE').AsDate := fecha2.Date;
                ExecSQL;
                Transaction.Commit;
              end;
          except
          end;

        end;
        MessageDlg('La Fecha fue Actualizada con Exito',mtInformation,[mbok],0);
        BitBtn1.Enabled := False;
end;

procedure TFrmCambiarFecha.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

end.
