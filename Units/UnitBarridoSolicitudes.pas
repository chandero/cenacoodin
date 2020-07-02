unit UnitBarridoSolicitudes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Grids, DBGrids, DBClient, DateUtils;

type
  TFrmBarridoSolicitudes = class(TForm)
    Label1: TLabel;
    Fecha: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    r: TPanel;
    GroupBox1: TGroupBox;
    DataSource1: TDataSource;
    CDsolicitud: TClientDataSet;
    DBGrid1: TDBGrid;
    CDsolicitudid_solicitud: TStringField;
    CDsolicitudasociado: TStringField;
    CDsolicitudid_estado: TIntegerField;
    CDsolicitudid_estado_p: TIntegerField;
    CDsolicituddes_estado: TStringField;
    CDsolicituddes_estado_p: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBarridoSolicitudes: TFrmBarridoSolicitudes;

implementation

uses UnitDmSolicitud, UnitPantallaProgreso, UnitGlobales;

{$R *.dfm}

procedure TFrmBarridoSolicitudes.FormCreate(Sender: TObject);
begin
        Fecha.Caption := DateToStr(Date);
        DmSolicitud := TDmSolicitud.Create(self);
end;

procedure TFrmBarridoSolicitudes.BitBtn1Click(Sender: TObject);
var    estado,estado_p,vigencia :Integer;
       des_estado,des_estado_p :string;
       dias_vigencia :Integer;
begin
{        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$estadosolicitud".ID_ESTADO,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"col$estadosolicitud".ESTADO_PROXIMO,');
          SQL.Add('"col$estadosolicitud".VIGENCIA');
          SQL.Add('FROM');
          SQL.Add('"col$estadosolicitud"');
          SQL.Add('WHERE');
          SQL.Add('("col$estadosolicitud".VIGENCIA <> 0)');
          Open;
          frmProgreso := TfrmProgreso.Create(self);
          frmProgreso.Titulo := 'Barrido de Solicitudes';
          frmProgreso.Min := 0;
          frmProgreso.Max := RecordCount;
          frmProgreso.InfoLabel := 'Registros Encontrados : 0';
          frmProgreso.Ejecutar;
          Application.ProcessMessages;
          while not Eof do
          begin
            frmProgreso.InfoLabel := 'Registros Encontrados : ' + IntToStr(RecNo);
            Application.ProcessMessages;
            estado := FieldByName('ID_ESTADO').AsInteger;
            estado_p := FieldByName('ESTADO_PROXIMO').AsInteger;
            des_estado := FieldByName('DESCRIPCION_ESTADO').AsString;
            vigencia := FieldByName('VIGENCIA').AsInteger;
            with DmSolicitud.Ibsolicitud2 do
            begin
               Close;
               if Transaction.InTransaction then
                  Transaction.Commit;
               Transaction.StartTransaction;
               SQL.Clear;
               SQL.Add('select DESCRIPCION_ESTADO');
               SQL.Add('FROM');
               SQL.Add('"col$estadosolicitud"');
               SQL.Add('where ID_ESTADO = :ID_ESTADO');
               ParamByName('ID_ESTADO').AsInteger := estado_p;
               Open;
               des_estado_p := FieldByName('DESCRIPCION_ESTADO').AsString;
               Close;
            end; }
            with DmSolicitud.IBSolicitud1 do
            begin
              Close;
              if Transaction.InTransaction then
                 Transaction.Commit;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('"col$solicitud".ID_SOLICITUD,');
              SQL.Add('"gen$persona".NOMBRE,');
              SQL.Add('"gen$persona".PRIMER_APELLIDO,');
              SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
              SQL.Add('"col$solicitud".FECHA_RECEPCION,');
              SQL.Add('"col$solicitud".FECHA_CONCEPTO,');
              SQL.Add('"col$solicitud".FECHA_ANALISIS');
              SQL.Add('FROM');
              SQL.Add('"col$solicitud"');
              SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
              SQL.Add('WHERE');
              SQL.Add('("col$solicitud".ESTADO = 4)');
//              ParamByName('ESTADO').AsInteger := estado;
              Open;
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Barrido de Solicitudes';
              frmProgreso.Min := 0;
              frmProgreso.Max := RecordCount;
              frmProgreso.InfoLabel := 'Registros Encontrados : 0';
              frmProgreso.Ejecutar;
              Application.ProcessMessages;
              while not Eof do
              begin
                frmProgreso.Position := RecNo;
                frmProgreso.InfoLabel := 'Registros Encontrados : ' + INTTOSTR(RecNo);
                dias_vigencia := DaysBetween(fFechaActual,FieldByName('FECHA_CONCEPTO').AsDateTime);
                if dias_vigencia >= 90 then
                begin
                  CDsolicitud.Append;
                  CDsolicitud.FieldValues['id_solicitud'] := FieldByName('ID_SOLICITUD').AsString;
                  CDsolicitud.FieldValues['asociado'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString;
                  CDsolicitud.FieldValues['id_estado'] := estado;
                  CDsolicitud.FieldValues['id_estado_p'] := estado_p;
                  CDsolicitud.FieldValues['des_estado'] := des_estado;
                  CDsolicitud.FieldValues['des_estado_p'] := des_estado_p;
                  CDsolicitud.Post;
                  Next;
                end;
              Next;
              end;
            end;
          frmProgreso.Cerrar;
end;

end.
