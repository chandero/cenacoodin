unit UnitDocumentoEquivalente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, DBClient, JvEdit, JvFloatEdit,
  JvTypedEdit, Mask, DBCtrls, ExtCtrls, Math, pr_Common, pr_Classes,
  IBDatabase, IBCustomDataSet, IBQuery, UnitDmGeneral, IBSQL, ComCtrls;

type
  TfrmDocumentoEquivalente = class(TForm)
    Label1: TLabel;
    edNumero: TEdit;
    Label2: TLabel;
    edNombre: TEdit;
    edDocumento: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edDireccion: TEdit;
    Label5: TLabel;
    edCiudad: TEdit;
    Label6: TLabel;
    edTelefono: TEdit;
    DSdata: TDataSource;
    DBGdata: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edSubtotal: TJvCurrencyEdit;
    edRetencion: TJvCurrencyEdit;
    edTasaRetencion: TJvFloatEdit;
    edTasaIva: TJvFloatEdit;
    Label11: TLabel;
    edIva: TJvCurrencyEdit;
    Label12: TLabel;
    chkImpuesto: TCheckBox;
    chkRegimenSimplificado: TCheckBox;
    chkNoObligado: TCheckBox;
    Label13: TLabel;
    edTotal: TJvCurrencyEdit;
    DBNdata: TDBNavigator;
    btnGenerar: TButton;
    Label14: TLabel;
    Label15: TLabel;
    IBTransaction1: TIBTransaction;
    edTipoDocumento: TDBLookupComboBox;
    IBQdocumento: TIBQuery;
    IBQequivalente: TIBQuery;
    btnCerrar: TButton;
    DStiposidentificacion: TDataSource;
    IBSQL1: TIBSQL;
    IBQtipodocumento: TIBQuery;
    edFecha: TDateTimePicker;
    Label16: TLabel;
    btnImprimir: TButton;
    btnNuevo: TButton;
    IBQagencia: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBSQL2: TIBSQL;
    IBTransaction3: TIBTransaction;
    CDSdata: TClientDataSet;
    CDSdataITEM: TIntegerField;
    CDSdataCODIGO: TStringField;
    CDSdataDESCRIPCION: TStringField;
    CDSdataVALOR: TCurrencyField;
    IBQdian: TIBQuery;
    prReport1: TprReport;
    procedure FormShow(Sender: TObject);
    procedure CDSdataAfterPost(DataSet: TDataSet);
    procedure edSubtotalChange(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
    procedure edTasaRetencionChange(Sender: TObject);
    procedure edTasaIvaChange(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure edDocumentoExit(Sender: TObject);
  private
    { Private declarations }
    procedure ActualizarSaldos;
  public
    { Public declarations }
  end;

var
  frmDocumentoEquivalente: TfrmDocumentoEquivalente;
  dmGeneral: TdmGeneral;
  
implementation

{$R *.dfm}

Uses UnitCreaciondePersona, unitGlobales;

procedure TfrmDocumentoEquivalente.FormShow(Sender: TObject);
begin
        CDSdata.EmptyDataSet;
        CDSdata.Open;
end;

procedure TfrmDocumentoEquivalente.CDSdataAfterPost(DataSet: TDataSet);
begin
        edSubtotal.Value := CDSdata.Aggregates[0].Value;
end;

procedure TfrmDocumentoEquivalente.edSubtotalChange(Sender: TObject);
begin
        ActualizarSaldos;
end;

procedure TfrmDocumentoEquivalente.ActualizarSaldos;
begin
        edRetencion.Value :=  RoundTo(edSubtotal.Value * edTasaRetencion.Value / 100, 0);
        edIva.Value := RoundTo(edSubtotal.Value * edTasaIva.Value / 100, 0);
        edTotal.Value := edSubtotal.Value - edRetencion.Value + edIva.Value;
        if (edTotal.Value > 0) then btnGenerar.Enabled := True;
end;

procedure TfrmDocumentoEquivalente.btnGenerarClick(Sender: TObject);
var
  id, csc, item: Integer;
begin
        if (MessageDlg('Seguro de Generar el Documento Equivalente?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
        then
        begin
                // obtener documento
                csc := ObtenerGenConsecutivo(IBSQL1, 9);
                id := ObtenerConsecutivoEquivalente(IBSQL1);
                edNumero.Text := IntToStr(csc);
                IBQdocumento.SQL.Clear;
                IBQdocumento.SQL.Add('INSERT INTO DOCUEQUIVALENTE (ID, NUMERO, ID_IDENTIFICACION, ID_PERSONA, FECHA, TASA_RETENCION, TASA_IVA, NO_RESPONSABLE_IVA, RESPONSABLE_SIMPLIFICADO, NO_OBLIGADO_FACTURAR)');
                IBQdocumento.SQL.Add('VALUES (:ID, :NUMERO, :ID_IDENTIFICACION, :ID_PERSONA, :FECHA, :TASA_RETENCION, :TASA_IVA, :NO_RESPONSABLE_IVA, :RESPONSABLE_SIMPLIFICADO, :NO_OBLIGADO_FACTURAR)');
                IBQdocumento.ParamByName('ID').AsInteger := id;
                IBQdocumento.ParamByName('NUMERO').AsInteger := csc;
                IBQdocumento.ParamByName('ID_IDENTIFICACION').AsInteger := edTipoDocumento.KeyValue;
                IBQdocumento.ParamByName('ID_PERSONA').AsString := edDocumento.Text;
                IBQdocumento.ParamByName('FECHA').AsDate := edFecha.Date;
                IBQdocumento.ParamByName('TASA_RETENCION').AsFloat := edTasaRetencion.Value;
                IBQdocumento.ParamByName('TASA_IVA').AsFloat := edTasaIva.Value;
                IBQdocumento.ParamByName('NO_RESPONSABLE_IVA').AsInteger := BooleanoToInt(chkImpuesto.Checked);
                IBQdocumento.ParamByName('RESPONSABLE_SIMPLIFICADO').AsInteger := BooleanoToInt(chkRegimenSimplificado.Checked);
                IBQdocumento.ParamByName('NO_OBLIGADO_FACTURAR').AsInteger := BooleanoToInt(chkNoObligado.Checked);                                
                IBQdocumento.ExecSQL;

                CDSdata.First;
                item := 0;
                IBQequivalente.SQL.Clear;
                IBQequivalente.SQL.Add('INSERT INTO DOCUEQUIVALENTE_ITEM (ID, CSC, CODIGO, DESCRIPCION, VALOR) VALUES (:ID, :CSC, :CODIGO, :DESCRIPCION, :VALOR)');
                while not CDSdata.Eof do
                begin
                  item := item + 1;
                  if (CDSdataValor.Value <> 0) then
                  begin
                    IBQequivalente.ParamByName('ID').AsInteger := id;
                    IBQequivalente.ParamByName('CODIGO').AsString := CDSdataCODIGO.Value;
                    IBQequivalente.ParamByName('DESCRIPCION').AsString := CDSdataDESCRIPCION.Value;
                    IBQequivalente.ParamByName('VALOR').AsCurrency := CDSdataVALOR.Value;
                    IBQequivalente.ParamByName('CSC').AsInteger := item;
                    IBQequivalente.ExecSQL;
                  end;
                  CDSdata.Next;
                end;
                IBTransaction1.Commit;
                ShowMessage('Documento Generado');
                btnImprimir.Enabled := True;
                btnNuevo.Enabled := True;
                btnGenerar.Enabled := False;
                btnImprimirClick(Sender);
        end;
end;

procedure TfrmDocumentoEquivalente.edTasaRetencionChange(Sender: TObject);
begin
        ActualizarSaldos;
end;

procedure TfrmDocumentoEquivalente.edTasaIvaChange(Sender: TObject);
begin
        ActualizarSaldos;
end;

procedure TfrmDocumentoEquivalente.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmDocumentoEquivalente.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction2.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction3.DefaultDatabase := dmGeneral.IBDatabase1;
        IBQtipodocumento.Database := dmGeneral.IBDatabase1;
        IBQtipodocumento.Transaction := IBTransaction1;

        IBQdocumento.Database := dmGeneral.IBDatabase1;
        IBQdocumento.Transaction := IBTransaction1;
        IBQequivalente.Database := dmGeneral.IBDatabase1;
        IBQequivalente.Transaction := IBTransaction1;
        IBQagencia.Database := dmGeneral.IBDatabase1;
        IBQagencia.Transaction := IBTransaction2;
        IBQdian.Database := dmGeneral.IBDatabase1;
        IBQdian.Transaction := IBTransaction2;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL1.Transaction := IBTransaction2;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBSQL2.Transaction := IBTransaction3;

        btnNuevoClick(self);

end;

procedure TfrmDocumentoEquivalente.btnImprimirClick(Sender: TObject);
begin
        IBQagencia.Close;
        IBQagencia.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBQagencia.Open;
        IBQdian.Close;
        IBQdian.SQL.Clear;
        IBQdian.SQL.Add('SELECT * FROM DIAN$RESOLUCION WHERE :NUMERO BETWEEN INICIAL AND FINAL');
        IBQdian.ParamByName('NUMERO').AsInteger := StrToInt(edNumero.Text);
        IBQdian.Open;
        prReport1.LoadTemplateFromFile('.\ReportesCon\DocumentoEquivalente.prt', false);
        prReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
        prReport1.Variables.ByName['NIT'].AsString := Nit;
        prReport1.Variables.ByName['NUMERO'].AsInteger := StrToInt(edNumero.Text);
        prReport1.Variables.ByName['DIRECCION_EMPRESA'].AsString := IBQagencia.FieldByName('DIRECCION_AGENCIA').AsString + ' ' + IBQagencia.FieldByName('DESCRIPCION_AGENCIA').AsString;
        prReport1.Variables.ByName['TELEFONO_EMPRESA'].AsString := IBQagencia.FieldByName('TELEFONO_AGENCIA').AsString;
        prReport1.Variables.ByName['RESOLUCION_DIAN'].AsString := IBQdian.FieldByName('RESOLUCION').AsString;
        prReport1.Variables.ByName['FECHA_RESOLUCION'].AsString := IBQdian.FieldByName('FECHA').AsString;
        prReport1.Variables.ByName['PREFIJO'].AsString := IBQdian.FieldByName('PREFIJO').AsString;
        prReport1.Variables.ByName['PLINI'].AsInteger := IBQdian.FieldByName('INICIAL').AsInteger;
        prReport1.Variables.ByName['PLFIN'].AsInteger := IBQdian.FieldByName('FINAL').AsInteger;
        prReport1.Variables.ByName['FECHA'].AsString := FormatDateTime('yyyy/mm/dd', edFecha.DateTime);
        prReport1.Variables.ByName['DOCUMENTO'].AsString := edDocumento.Text;
        prReport1.Variables.ByName['NOMBRE'].AsString := edNombre.Text;
        prReport1.Variables.ByName['DIRECCION'].AsString := edDireccion.Text;
        prReport1.Variables.ByName['CIUDAD'].AsString := edCiudad.Text;
        prReport1.Variables.ByName['TELEFONO'].AsString := edTelefono.Text;
        prReport1.Variables.ByName['SUBTOTAL'].AsDouble := edSubtotal.Value;
        prReport1.Variables.ByName['TASA_RETEFUENTE'].AsDouble := edTasaRetencion.Value;
        prReport1.Variables.ByName['RETEFUENTE'].AsDouble := edRetencion.Value;
        prReport1.Variables.ByName['TASA_IVA'].AsDouble := edTasaIva.Value;
        prReport1.Variables.ByName['RETEIVA'].AsDouble := edIva.Value;
        prReport1.Variables.ByName['TOTAL'].AsDouble := edTotal.Value;

        CDSdata.First;

        if prReport1.PrepareReport then
          prReport1.PreviewPreparedReport(true);
end;

procedure TfrmDocumentoEquivalente.btnNuevoClick(Sender: TObject);
begin
        if IBTransaction1.InTransaction then
          IBTransaction1.Commit;
        IBTransaction1.StartTransaction;
        if IBTransaction2.InTransaction then
          IBTransaction2.Commit;
        IBTransaction2.StartTransaction;
        if IBTransaction3.InTransaction then
          IBTransaction3.Commit;
        IBTransaction3.StartTransaction;
        CDSdata.EmptyDataSet;
        CDSdata.Open;
        edNumero.Text := '';
        edFecha.Date := fFechaActual;
        edTipoDocumento.KeyValue := 0;
        edDocumento.Text := '';
        edNombre.Text := '';
        edDireccion.Text := '';
        edCiudad.Text := '';
        edTelefono.Text := '';
        edSubtotal.Value := 0;
        edTasaRetencion.Value := 0;
        edTasaIva.Value := 0;
        chkImpuesto.Checked := True;
        chkRegimenSimplificado.Checked := True;
        chkNoObligado.Checked := True;
        btnImprimir.Enabled := False;
        btnGenerar.Enabled := False;
        IBQtipodocumento.Open;
        IBQtipodocumento.Last;        
end;

procedure TfrmDocumentoEquivalente.edDocumentoExit(Sender: TObject);
var
 frmPersona:TfrmCreacionPersona;
begin
            with IBSQL2 do
              begin
               if Transaction.InTransaction then
                 Transaction.Commit;
               Transaction.StartTransaction;
               Close;
               SQL.Clear;
               SQL.Add('select * from "gen$persona" where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
               ParamByName('ID_IDENTIFICACION').AsInteger := edTipoDocumento.KeyValue;
               ParamByName('ID_PERSONA').AsString := edDocumento.Text;
               try
                ExecQuery;
                if RecordCount > 0 then begin
                   Label3.Visible := True;
                   edNombre.Text := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                     FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                     FieldByName('NOMBRE').AsString;
                   Close;
                   SQL.Clear;
                   SQL.Add('SELECT FIRST 1 * FROM "gen$direccion" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA AND ID_DIRECCION = :ID_DIRECCION');
                   ParamByName('ID_IDENTIFICACION').AsInteger := edTipoDocumento.KeyValue;
                   ParamByName('ID_PERSONA').AsString := edDocumento.Text;
                   ParamByName('ID_DIRECCION').AsInteger := 1;
                   ExecQuery;
                   if RecordCount > 0 then
                   begin
                      edDireccion.Text := FieldByName('DIRECCION ').AsString;
                      edCiudad.Text := FieldByName('MUNICIPIO').AsString;
                      edTelefono.Text := FieldByName('TELEFONO1').AsString;
                   end;

                end
                else
                  if MessageDlg('El Documento no Existe!, Desea Agregarlo',mtConfirmation,[mbyes,mbno],0) = mryes then
                  begin
                    frmPersona := TfrmCreacionPersona.Create(Self);
                    frmPersona.ShowModal;
                    edDocumentoExit(Sender);
                  end
                  else
                   ShowMessage('Recuerde que la Persona debe estar registrada en la base de datos');
               except
                  Transaction.Rollback;
                  raise;
               end;
              end;


end;

end.
