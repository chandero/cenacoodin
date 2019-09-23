unit UnitRetiroAsociado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, DB,
  IBDatabase, IBCustomDataSet, IBQuery, sdXmlDocuments, IBSQL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, Menus, StrUtils, DateUtils,
  FR_Shape, FR_DSet, FR_DBSet, FR_Class, pr_Common, pr_TxClasses;

type
  TfrmRetiroAsociado = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edTipoIdentificacion: TDBLookupComboBox;
    Label50: TLabel;
    EdIdentificacion: TMemo;
    Panel1: TPanel;
    btnOtro: TBitBtn;
    btnCerrar: TBitBtn;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    ImageTree: TImageList;
    btnRetiro: TBitBtn;
    btnFormato: TBitBtn;
    pnProgreso: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Panel3: TPanel;
    Label2: TLabel;
    edMotivoRetiro: TDBLookupComboBox;
    DSTiposId: TDataSource;
    IBQTiposId: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBQMotivoRetiro: TIBQuery;
    DSMotivoRetiro: TDataSource;
    pnMensajes: TGroupBox;
    edMensajes: TMemo;
    IBTransaction2: TIBTransaction;
    IBPersona: TIBQuery;
    edAsociado: TStaticText;
    Label4: TLabel;
    IBCaptaciones: TIBQuery;
    IBColocaciones: TIBQuery;
    IBFianzas: TIBQuery;
    IBObservaciones: TIBQuery;
    IBConsulta: TIBQuery;
    IBConsulta1: TIBQuery;
    IBConsulta2: TIBQuery;
    IBSQL1: TIBSQL;
    IdTCPClient1: TIdTCPClient;
    PMenu1: TPopupMenu;
    ExpandirTodo1: TMenuItem;
    ContraerTodo1: TMenuItem;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frShapeObject1: TfrShapeObject;
    IBQFianzas: TIBQuery;
    IBQFianzasID_COLOCACION: TIBStringField;
    IBQFianzasDEUDA: TIBBCDField;
    IBQFianzasFECHA_INTERES: TDateField;
    CheckBox3: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    edResultado: TRichEdit;
    Arbol: TTreeView;
    frReport2: TfrReport;
    procedure btnCerrarClick(Sender: TObject);
    procedure EdIdentificacionExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ExpandirTodo1Click(Sender: TObject);
    procedure ContraerTodo1Click(Sender: TObject);
    procedure btnOtroClick(Sender: TObject);
    procedure btnRetiroClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btnFormatoClick(Sender: TObject);
    procedure frReport2GetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
      Nodo : Array[0..10] of TTreeNode;
      NodoSe: Array[0..10] of TTreeNode;
      NodoOb: array[0..10] of TTreeNode;
      NodoSo: array[0..10] of TTreeNode;
      NodoOt: array[0..10] of TTreeNode;
    procedure Inicializar;
    procedure BuscarProductos;
    procedure AgregaCodeudor;
    procedure AgregarSolicitudes;
    procedure AgregarCaptaciones;
    procedure AgregarTarjetaDebito;
    procedure AgregarColocaciones;
    procedure AgregarFianzas;
    procedure AgregarObservaciones;
    procedure BuscaCredivida;

  public
    { Public declarations }
  end;

type
     TProductos = class
     private
     forma:Integer;
     nombre:string;
     tipo:Integer;
     numero:string;
     agencia:Integer;
     digito:Integer;
     estado:Integer;
     nivel:Integer;
     saldoact:Currency;
end;

type
     TServicios = class
     private
     forma:Integer;
     nombre:string;
     tipo:Integer;
     numero:string;
     agencia:Integer;
     digito:Integer;
     estado:Integer;
     nivel:Integer;
end;


var
  frmRetiroAsociado: TfrmRetiroAsociado;
  EnLectura:Boolean;
  arbolinfo:TProductos;
  arbolsinfo:TServicios;
  bactivo:Boolean; // si el asociado es activo para retiro o no
  bporsaldar:Boolean; // si las cuentas son para saldar o para cancelar
  // Cuentas
  vCuentaAportes :string;


  // Saldos Totales
  vTotalAportes :Currency;
  vTotalAhorros :Currency;
  vTotalJuvenil :Currency;
  vTotalDeuda :Currency;
  // Otras
  vFechaIngreso:TDate;
  //
   

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmRetiroAsociado.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmRetiroAsociado.EdIdentificacionExit(Sender: TObject);
begin

        GroupBox1.Enabled := False;
        Arbol.Items.Clear;
        Arbol.Enabled := False;
        Nodo[0] := Arbol.Items.Add(nil,'Productos');
        NodoSe[0] := Arbol.Items.Add(nil,'Servicios');
        NodoOb[0] := Arbol.Items.Add(nil,'Observaciones');
        NodoSo[0] := Arbol.Items.Add(nil,'Solicitudes');
        NodoOt[0] := Arbol.Items.Add(nil,'Otros');
        Nodo[0].ImageIndex := 6;
        NodoSe[0].ImageIndex := 7;
        NodoOb[0].ImageIndex := 8;
        NodoSo[0].ImageIndex := 9;
        NodoOt[0].ImageIndex := 10;
        vCuentaAportes := '';
        BuscarProductos;
        if vCuentaAportes <> '' then
                Arbol.FullExpand;


end;

procedure TfrmRetiroAsociado.FormCreate(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmRetiroAsociado.Inicializar;
begin
        if IBTransaction1.InTransaction then
           IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
        IBQTiposId.Close;
        IBQTiposId.SQL.Clear;
        IBQTiposId.SQL.Add('select');
        IBQTiposId.SQL.Add('ID_IDENTIFICACION,');
        IBQTiposId.SQL.Add('DESCRIPCION_IDENTIFICACION');
        IBQTiposId.SQL.Add('from "gen$tiposidentificacion" ORDER BY ID_IDENTIFICACION ASC');
        IBQTiposId.Open;
        IBQTiposId.Last;

        IBQMotivoRetiro.Close;
        IBQMotivoRetiro.SQL.Clear;
        IBQMotivoRetiro.SQL.Add('select * from "cap$tablamotivosretiro" order by ID_MOTIVO asc');
        IBQMotivoRetiro.Open;
        IBQMotivoRetiro.Last;
        GroupBox2.Visible := False;
        pnMensajes.Visible := False;
        edMensajes.Lines.Clear;
        Arbol.Enabled := False;
        Arbol.Items.Clear;
        GroupBox1.Enabled := True;
        btnRetiro.Enabled := False;
        btnFormato.Enabled := False;

        edTipoIdentificacion.KeyValue := -1;
        EdIdentificacion.Text := '';
        edAsociado.Caption := '';

        PageControl1.ActivePageIndex := 0;

        vTotalAportes := 0;
        vTotalAhorros := 0;
        vTotalJuvenil := 0;
        if Self.Visible then
                edTipoIdentificacion.SetFocus;

end;

procedure TfrmRetiroAsociado.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRetiroAsociado.BuscarProductos;
begin

        if IBTransaction2.InTransaction then
           IBTransaction2.Rollback;
        IBTransaction2.StartTransaction;

        with IBPersona do
        begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := edtipoidentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
            Open;
            if RecordCount < 1 then
            begin
               MessageDlg('Esa Persona no Existe!!',mtWarning,[mbOK],0);
               btnOtro.Click;
               Exit;
            end;
            edAsociado.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                FieldByName('NOMBRE').AsString;
        end;
        Application.ProcessMessages;
        EnLectura := True;
{
//Buscar Total Aportaciones
        vTotAportaciones := totalaportaciones(edTipoIdentificacion.KeyValue,edIdentificacion.Text);
//Buscar Total Captaciones
         vTotCaptaciones := totalcaptaciones(vididentificacion,vidpersona);
         EdTotalCaptaciones.Caption := FormatCurr('$#,#0.00',vTotCaptaciones);
//Buscar Captaciones
         vTotColocaciones := totalcolocaciones(vididentificacion,vidpersona);
         EdTotalColocaciones.Caption  := formatcurr('$#,#0',vTotColocaciones);
//Buscar Total Fianzas
         vTotFianzas := totalfianzas(vididentificacion,vidpersona);
         EdTotalFianzas.Caption  := formatcurr('$#,#0',vTotFianzas);
//
}
        EnLectura := False;
        bactivo := True;
        bporsaldar := True;
        with IBCaptaciones do
        begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := edTipoIdentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
            Open;
            if RecordCount > 0 then
            begin
               AgregarCaptaciones;
               AgregarTarjetaDebito;
            end;
        end;
        if vCuentaAportes = '' then
         begin
          edMensajes.Lines.Add('Esta Persona no es ASOCIADO...');
          bactivo := False
         end;
//Buscar Colocaciones
        Application.ProcessMessages;
        with IBColocaciones do
        begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := edtipoidentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
            Open;
            if RecordCount > 0 then
               AgregarColocaciones;
        end;
//Buscar Fianzas
        Application.ProcessMessages;
        with IBFianzas do
        begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := edtipoidentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
            Open;
            if RecordCount > 0 then
               AgregarFianzas;
        end;
//Buscar Observaciones
        Application.ProcessMessages;
        with IBObservaciones do
        begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := edtipoidentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
            Open;
            if RecordCount > 0 then
               AgregarObservaciones;
        end;
        agregarsolicitudes;
        AgregaCodeudor;//agrega solicitudes posible codeudor
        BuscaCredivida;
        GroupBox2.Visible := True;
        Arbol.Enabled := True;
        pnMensajes.Visible := True;
        if bactivo then
        begin
            edMensajes.Lines.Add('*** TODO LISTO PARA REALIZAR EL RETIRO ... ***');
            btnRetiro.Enabled := True;
            Panel3.Visible := True;
        end;

end;

procedure TfrmRetiroAsociado.AgregaCodeudor;
begin
        with IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$codeudor"');
          SQL.Add('INNER JOIN "col$solicitud" ON ("col$codeudor".ID_SOLICITUD="col$solicitud".ID_SOLICITUD)');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ESTADO IN (1,2,3,4,8,9,10,13,14)) AND');
          SQL.Add('("col$codeudor".ID_PERSONA = :ID_PERSONA) AND ');
          SQL.Add('("col$codeudor".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
          SQL.Add('("col$codeudor".ES_CONYUGUE = 0)');
          ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
          ParamByName('ID_IDENTIFICACION').AsString := edTipoIdentificacion.KeyValue;
          Open;
          //*
          if RecordCount > 0 then
          begin
            arbolinfo := TProductos.Create;
            arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
            arbolinfo.nombre := 'CODEUDOR';
            arbolinfo.tipo := 0;
            arbolinfo.numero := '';
            arbolinfo.agencia := Agencia;
            arbolinfo.digito := 0;
            arbolinfo.nivel := 2;
            NodoOt[1] := Arbol.Items.AddChildObject(NodoOT[0],arbolinfo.nombre,nil);//arbolinfo);
            NodoOt[1].ImageIndex := 1;
            arbolinfo := TProductos.Create;
            arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
            arbolinfo.nombre := 'SOLICITUDES';
            arbolinfo.tipo := 0;
            arbolinfo.numero := '';
            arbolinfo.agencia := Agencia;
            arbolinfo.digito := 0;
            arbolinfo.nivel := 2;
            NodoOt[2] := Arbol.Items.AddChildObject(NodoOT[1],arbolinfo.nombre,nil);//arbolinfo);
            NodoOt[2].ImageIndex := 1;

            while not Eof do
            begin
              arbolinfo := TProductos.Create;
              arbolinfo.forma := 11;
              arbolinfo.nombre := FieldByName('ID_SOLICITUD').AsString + ' ' + FieldByName('DESCRIPCION_ESTADO').AsString;
              arbolinfo.tipo := 0;
              Arbolinfo.numero := FieldByName('ID_SOLICITUD').AsString;
              arbolinfo.agencia := Agencia;
              arbolinfo.digito := 0;
              arbolinfo.nivel := 3;
              NodoOt[3] := Arbol.Items.AddChildObject(NodoOT[2],arbolinfo.nombre,arbolinfo);
              NodoOt[3].ImageIndex := 1;
              Next;
           end;
          end;
        end;

end;

procedure TfrmRetiroAsociado.AgregarSolicitudes;
begin
       with IBConsulta do
       begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('"col$solicitud".ID_SOLICITUD,');
             SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
             SQL.Add('FROM');
             SQL.Add('"col$solicitud"');
             SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
             SQL.Add('WHERE');
             SQL.Add('("col$solicitud".ID_PERSONA = :ID_PERSONA) AND ');
             SQL.Add('("col$solicitud".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
             SQL.Add('("col$solicitud".ESTADO IN (1,2,3,4,8,11,12,13,14,7,9))');
             ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
             ParamByName('ID_IDENTIFICACION').AsString := edTipoIdentificacion.KeyValue;
             Open;
             //ShowMessage(FieldByName('ID_SOLICITUD').AsString);
             //if RecordCount <> 0 then
             //begin
             while not Eof do
             begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 8;
                arbolinfo.nombre := FieldByName('ID_SOLICITUD').AsString + ' ' + FieldByName('DESCRIPCION_ESTADO').AsString;
                arbolinfo.tipo := 0;
                arbolinfo.numero := FieldByName('ID_SOLICITUD').AsString;
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                NodoSo[1] := Arbol.Items.AddChildObject(NodoSo[0],arbolinfo.nombre,arbolinfo);
                NodoSo[1].ImageIndex := 1;
                Next;
             end;
        end;


end;

procedure TfrmRetiroAsociado.AgregarCaptaciones;
var
   FechaActual:TDate;
begin
        FechaActual := fFechaActual;
// Cargar formas de captacion que tiene el asociado
        with IBConsulta do
        begin
           SQL.Clear;
           SQL.Add('select DISTINCT "cap$tiposforma".ID_FORMA,"cap$tiposforma".DESCRIPCION,"cap$tiposforma".APORTE,');
           SQL.Add('"cap$tiposforma".AHORRO,"cap$tiposforma".CERTIFICADO,"cap$tiposforma".PROGRAMADO ');
           SQL.Add('FROM "cap$maestrotitular" INNER JOIN "cap$tipocaptacion" ON ("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$tipocaptacion".ID_TIPO_CAPTACION) ');
           SQL.Add('INNER JOIN "cap$tiposforma" ON ("cap$tipocaptacion".ID_FORMA = "cap$tiposforma".ID_FORMA) ');
           SQL.Add('WHERE (ID_IDENTIFICACION = :"ID_IDENTIFICACION" AND ID_PERSONA = :"ID_PERSONA" AND "cap$maestrotitular".NUMERO_TITULAR = 1) ');
           ParamByName('ID_IDENTIFICACION').AsInteger := edTipoIdentificacion.KeyValue;
           ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
           Open;
           Last;
           First;
           if RecordCount > 0 then
           while not IBConsulta.Eof do
           begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
                arbolinfo.nombre := FieldByName('DESCRIPCION').AsString;
                arbolinfo.tipo := 0;
                arbolinfo.numero := '';
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                Nodo[1] := Arbol.Items.AddChildObject(Nodo[0],FieldByName('DESCRIPCION').AsString,arbolinfo);
                Nodo[1].ImageIndex := 1;
// Cargo Tipo Captaciones x cada forma
                   IBConsulta1.Close;
                   IBConsulta1.ParamByName('ID_IDENTIFICACION').AsInteger := edTipoIdentificacion.KeyValue;
                   IBConsulta1.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
                   IBConsulta1.ParamByName('ID_FORMA').AsInteger := IBConsulta.FieldByName('ID_FORMA').AsInteger;
                   IBConsulta1.Open;
                   IBConsulta1.Last;
                   IBConsulta1.First;
                   while not IBConsulta1.Eof do
                   begin
                        arbolinfo := TProductos.Create;
                        arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
                        arbolinfo.nombre := FieldByName('DESCRIPCION').AsString;
                        arbolinfo.tipo := 0;
                        arbolinfo.numero := '';
                        arbolinfo.agencia := Agencia;
                        arbolinfo.digito := 0;
                        arbolinfo.nivel := 2;
                        Nodo[2] := Arbol.Items.AddChildObject(Nodo[1],IBConsulta1.FieldByName('DESCRIPCION').AsString,arbolinfo);
                        Nodo[2].ImageIndex := 2;
// Cargar Cada captacion según su tipo y su forma;
                        IBConsulta2.Close;
                        IBConsulta2.ParamByName('ID_FORMA').AsInteger := FieldByName('ID_FORMA').AsInteger;
                        IBConsulta2.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBConsulta1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                        IBConsulta2.ParamByName('ID_IDENTIFICACION').AsInteger := edTipoIdentificacion.KeyValue;
                        IBConsulta2.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
                        IBConsulta2.Open;
                        IBConsulta2.Last;
                        IBConsulta2.First;
                        while not IBConsulta2.Eof do
                        begin
                               if IBConsulta2.FieldByName('SE_SUMA').AsInteger = 1 then begin
                                //Calcular Saldo Actual
                                IBSQL1.Close;
                                IBSQL1.SQL.Clear;
                                IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(');
                                IBSQL1.SQL.Add(':AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
                                IBSQL1.ParamByName('AG').AsInteger := IBConsulta2.FieldByName('ID_AGENCIA').AsInteger;
                                IBSQL1.ParamByName('TP').AsInteger := IBConsulta2.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                                IBSQL1.ParamByName('CTA').AsInteger := IBConsulta2.FieldByName('NUMERO_CUENTA').AsInteger;
                                IBSQL1.ParamByName('DG').AsInteger := IBConsulta2.FieldByName('DIGITO_CUENTA').AsInteger;
                                IBSQL1.ParamByName('ANO').AsString := inttostr(YearOf(FechaActual));
                                IBSQL1.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(FechaActual),01,01);
                                IBSQL1.ParamByName('FECHA2').AsDate := FechaActual;
                                IBSQL1.ExecQuery;
                                arbolinfo := TProductos.Create;
                                arbolinfo.forma := FieldByName('ID_FORMA').AsInteger;
                                arbolinfo.nombre := IBConsulta1.FieldByName('DESCRIPCION').AsString;
                                arbolinfo.tipo := IBConsulta1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                                arbolinfo.numero := Format('%.7d',[IBConsulta2.FieldByName('NUMERO_CUENTA').AsInteger]);
                                arbolinfo.agencia := IBConsulta2.FieldByName('ID_AGENCIA').AsInteger;
                                arbolinfo.digito := IBConsulta2.FieldByName('DIGITO_CUENTA').AsInteger;
                                arbolinfo.saldoact := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                                arbolinfo.nivel := 3;
                                Nodo[3] := Arbol.Items.AddChildObject(Nodo[2],FormatCurr('00',arbolinfo.agencia)+ '-' + arbolinfo.numero + '-' + FormatCurr('0',arbolinfo.digito)+' '+IBConsulta2.FieldByName('ESTADO').AsString + '  ' + FormatCurr('$#,#0.00',arbolinfo.saldoact),arbolinfo);
                                Nodo[3].ImageIndex := 3;

                                case IBConsulta2.FieldByName('ID_TIPO_CAPTACION').AsInteger of
                                1: begin
                                     vTotalAportes := vTotalAportes + IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                                     vFechaIngreso := IBConsulta2.FieldByName('FECHA_APERTURA').AsDateTime;
                                     vCuentaAportes := '1'+Format('%.2d-%.7d-%d',[IBConsulta2.FieldByName('ID_AGENCIA').AsInteger,
                                                                                  IBConsulta2.FieldByName('NUMERO_CUENTA').AsInteger,
                                                                                  IBConsulta2.FieldByName('DIGITO_CUENTA').AsInteger]);
                                     if (IBConsulta2.FieldByName('ID_ESTADO').AsInteger = 5) or
                                        (IBConsulta2.FieldByName('ID_ESTADO').AsInteger = 8) then
                                        begin
                                          edMensajes.Lines.Add('Ya se proceso la información para este Asociado...');
                                          bactivo := False;
                                        end;
                                   end;
                                2,5: vTotalAhorros := vTotalAhorros + IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                                6: vTotalAhorros := vTotalAhorros + IBConsulta2.FieldByName('VALOR_INICIAL').AsCurrency;
                                4: vTotalJuvenil := vTotalJuvenil + IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                                end;

                                if (IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency < 0) then
                                begin
                                    bactivo := False;
                                    edMensajes.Lines.Add('Cuenta:' + IntToStr(IBConsulta2.FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                                                         Format('%.2d',[IBConsulta2.FieldByName('ID_AGENCIA').AsInteger])+
                                                         '-' + Format('%.7d',[IBConsulta2.FieldByName('NUMERO_CUENTA').AsInteger]) +
                                                         '-' + IntToStr(IBConsulta2.FieldByName('DIGITO_CUENTA').AsInteger) +
                                                         ' Presenta Saldo Negativo: ' + FormatCurr('$#0.00',IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency));
                                end;

                                if ( (IBConsulta2.FieldByName('ID_TIPO_CAPTACION').AsInteger = 6) and
                                    (IBConsulta2.FieldByName('ID_ESTADO').AsInteger in [1,6]) ) then
                                begin
                                    bactivo := False;
                                    edMensajes.Lines.Add('Cuenta:' + IntToStr(IBConsulta2.FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                                                         Format('%.2d',[IBConsulta2.FieldByName('ID_AGENCIA').AsInteger])+
                                                         '-' + Format('%.7d',[IBConsulta2.FieldByName('NUMERO_CUENTA').AsInteger]) +
                                                         '-' + IntToStr(IBConsulta2.FieldByName('DIGITO_CUENTA').AsInteger) +
                                                         ' Debe ser saldada primero');
                                end;

                                if  ( (IBConsulta2.FieldByName('ID_TIPO_CAPTACION').AsInteger = 5) and
                                    (IBConsulta2.FieldByName('ID_ESTADO').AsInteger = 1) ) then
                                begin
                                    bactivo := False;
                                    edMensajes.Lines.Add('Cuenta:' + IntToStr(IBConsulta2.FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                                                         Format('%.2d',[IBConsulta2.FieldByName('ID_AGENCIA').AsInteger])+
                                                         '-' + Format('%.7d',[IBConsulta2.FieldByName('NUMERO_CUENTA').AsInteger]) +
                                                         '-' + IntToStr(IBConsulta2.FieldByName('DIGITO_CUENTA').AsInteger) +
                                                         ' Debe ser saldada primero');
                                end;

                               end;
                               IBConsulta2.Next;
                        end;
//fin Carga 2
                        IBConsulta1.Next;
                   end;
//fin Carga 1
                Next;
           end;
        end;
end;

procedure TfrmRetiroAsociado.AgregarColocaciones;
var Descripcion:string;
begin
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select ID_AGENCIA,ID_COLOCACION,"col$colocacion".ID_ESTADO_COLOCACION,DESCRIPCION_ESTADO_COLOCACION, (VALOR_DESEMBOLSO - ABONOS_CAPITAL) AS DEUDA from "col$colocacion" ');
             SQL.Add('LEFT JOIN "col$estado" ON "col$estado".ID_ESTADO_COLOCACION = "col$colocacion".ID_ESTADO_COLOCACION ');
             SQL.Add(' where ');
             SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA" and');
             SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION IN (0,1,2,3,6,7,8,9)');
             ParamByName('ID_IDENTIFICACION').AsInteger := edtipoidentificacion.KeyValue;
             ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
             Open;
             Last;
             First;
             if RecordCount > 0 then
             begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 0;
                arbolinfo.nombre := 'COLOCACIONES';
                arbolinfo.tipo := 0;
                arbolinfo.numero := '';
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                Nodo[1] := Arbol.Items.AddChildObject(Nodo[0],arbolinfo.nombre,arbolinfo);
                Nodo[1].ImageIndex := 1;
                while not Eof do
                begin
                        arbolinfo := TProductos.Create;
                        arbolinfo.forma := 5;
                        arbolinfo.nombre := 'COLOCACIONES';
                        arbolinfo.tipo := 0;
                        arbolinfo.numero := FieldByName('ID_COLOCACION').AsString;
                        arbolinfo.agencia := FieldByName('ID_AGENCIA').AsInteger;
                        Descripcion := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                        arbolinfo.estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
                        arbolinfo.digito := 0;
                        arbolinfo.nivel := 3;
                        arbolinfo.saldoact := FieldByName('DEUDA').AsCurrency;
                        Nodo[2] := Arbol.Items.AddChildObject(Nodo[1],FormatCurr('00',arbolinfo.agencia) + '-' + arbolinfo.numero + ' ' + Descripcion + ' ' + FormatCurr('$#,#0.00',arbolinfo.saldoact),arbolinfo);
                        Nodo[2].ImageIndex := 4;
                        vTotalDeuda := vTotalDeuda + FieldByName('DEUDA').AsCurrency;
                        if (FieldByName('DEUDA').AsCurrency > 0) and
                           (FieldByName('ID_ESTADO_COLOCACION').AsInteger in [0,1]) then
                        begin
                           bactivo := False;
                           edMensajes.Lines.Add('Colocación: '+ FieldByName('ID_COLOCACION').AsString + ' presenta saldo pendiente...');
                        end;

                        if FieldByName('ID_ESTADO_COLOCACION').AsInteger in [2,3,6] then
                        begin
                            bporsaldar := False;
                        end;
                        Next;
                end;
             end;
        end;
end;

procedure TfrmRetiroAsociado.AgregarFianzas;
var Descripcion:string;
begin
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select "col$colgarantias".ID_AGENCIA,"col$colgarantias".ID_COLOCACION from "col$colgarantias"');
             SQL.Add('inner join "col$colocacion" on ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
             SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and "col$colgarantias".ID_PERSONA = :"ID_PERSONA" and');
             SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION IN (0,1,2,3,6,7,8,9))');
             ParamByName('ID_PERSONA').Asstring := EdIdentificacion.Text;
             ParamByName('ID_IDENTIFICACION').AsInteger := edTipoIdentificacion.KeyValue;
             Open;
             Last;
             First;
             if RecordCount > 0 then
             begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 0;
                arbolinfo.nombre := 'FIANZAS';
                arbolinfo.tipo := 0;
                arbolinfo.numero := '';
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                Nodo[1] := Arbol.Items.AddChildObject(Nodo[0],arbolinfo.nombre,arbolinfo);
                Nodo[1].ImageIndex := 1;
                while not Eof do
                begin
                        arbolinfo := TProductos.Create;
                        arbolinfo.forma := 6;
                        arbolinfo.nombre := 'FIANZAS';
                        arbolinfo.tipo := 0;
                        arbolinfo.numero := FieldByName('ID_COLOCACION').AsString;
                        arbolinfo.agencia := FieldByName('ID_AGENCIA').AsInteger;
                        arbolinfo.digito := 0;
                        IBSQL1.Close;
                        IBSQL1.SQL.Clear;
                        IBSQL1.SQL.Add('select ID_AGENCIA,ID_COLOCACION,"col$colocacion".ID_ESTADO_COLOCACION,DESCRIPCION_ESTADO_COLOCACION from "col$colocacion" ');
                        IBSQL1.SQL.Add('LEFT JOIN "col$estado" ON "col$estado".ID_ESTADO_COLOCACION = "col$colocacion".ID_ESTADO_COLOCACION ');
                        IBSQL1.SQL.Add(' where ');
                        IBSQL1.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
                        IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                        IBSQL1.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                        IBSQL1.ExecQuery;
                        Descripcion := IBSQL1.FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                        IBSQL1.Close;
                        arbolinfo.nivel := 2;
                        Nodo[2] := Arbol.Items.AddChildObject(Nodo[1],FormatCurr('00',arbolinfo.agencia) + '-' + arbolinfo.numero + ' ' + Descripcion,arbolinfo);
                        Nodo[2].ImageIndex := 4;
                        Next;
                end;
             end;
        end;
end;

procedure TfrmRetiroAsociado.AgregarObservaciones;
begin
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select FECHA,OBSERVACION,ID_EMPLEADO from "gen$observaciones" where ');
             SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA"');
             ParamByName('ID_PERSONA').Asstring := EdIdentificacion.Text;
             ParamByName('ID_IDENTIFICACION').AsInteger := edTipoIdentificacion.KeyValue;
             Open;
             Last;
             First;
             if RecordCount > 0 then
             begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 7;
                arbolinfo.nombre := 'GENERALES';
                arbolinfo.tipo := 0;
                arbolinfo.numero := '';
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                NodoOb[0] := Arbol.Items.AddChildObject(NodoOb[0],arbolinfo.nombre,arbolinfo);
                NodoOb[0].ImageIndex := 1;
             end;
             Close;
        end;
end;

procedure TfrmRetiroAsociado.AgregarTarjetaDebito;
begin
        with IBConsulta do
        begin
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('"cap$tarjetacuenta".ID_TARJETA,');
           SQL.Add('"cap$tarjetacuenta".ID_ESTADO,');
           SQL.Add('"cap$tarjetaestado".DESCRIPCION,');
           SQL.Add('"cap$tarjetacuenta".ID_AGENCIA,');
           SQL.Add('"cap$tarjetacuenta".ID_TIPO_CAPTACION,');
           SQL.Add('"cap$tarjetacuenta".NUMERO_CUENTA,');
           SQL.Add('"cap$tarjetacuenta".DIGITO_CUENTA');
           SQL.Add('FROM');
           SQL.Add('"cap$tarjetacuenta"');
           SQL.Add('INNER JOIN "cap$tarjetaestado" ON ("cap$tarjetacuenta".ID_ESTADO="cap$tarjetaestado".ID_ESTADO)');
           SQL.Add(' INNER JOIN "cap$maestrotitular" ON ("cap$tarjetacuenta".ID_AGENCIA="cap$maestrotitular".ID_AGENCIA)');
           SQL.Add('  AND ("cap$tarjetacuenta".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
           SQL.Add('  AND ("cap$tarjetacuenta".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
           SQL.Add('  AND ("cap$tarjetacuenta".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
           SQL.Add('WHERE');
           SQL.Add('  ("cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
           SQL.Add('  ("cap$maestrotitular".ID_PERSONA = :ID_PERSONA) AND ');
           SQL.Add('  ("cap$maestrotitular".NUMERO_TITULAR = 1) AND ');
           SQL.Add('  ("cap$maestrotitular".TIPO_TITULAR = 1)');
           SQL.Add('ORDER BY');
           SQL.Add('  "cap$tarjetacuenta".ID_ESTADO');
           ParamByName('ID_IDENTIFICACION').AsInteger := edTipoIdentificacion.KeyValue;
           ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
           try
            Open;
            if RecordCount > 0 then
            begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
                arbolinfo.nombre := 'TARJETAS DEBITO';
                arbolinfo.tipo := 0;
                arbolinfo.numero := '';
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                NodoSe[1] := Arbol.Items.AddChildObject(NodoSe[0],arbolinfo.nombre,nil);//arbolinfo);
                NodoSe[1].ImageIndex := 11;
                while not Eof do begin
                 arbolinfo := TProductos.Create;
                 arbolinfo.forma := 10;
                 arbolinfo.nombre := FieldByName('ID_TARJETA').AsString + ' ' + FieldByName('DESCRIPCION').AsString;
                 arbolinfo.tipo := 0;
                 arbolinfo.numero := FieldByName('ID_TARJETA').AsString;
                 arbolinfo.agencia := Agencia;
                 arbolinfo.digito := 0;
                 arbolinfo.nivel := 3;
                 NodoSe[2] := Arbol.Items.AddChildObject(NodoSe[1],arbolinfo.nombre,arbolinfo);
                 NodoSe[2].ImageIndex := 11;
                 IBSQL1.Close;
                 IBSQL1.SQL.Clear;
                 IBSQL1.SQL.Add('select * from P_CAP_MOVTD(:AG,:TP,:CTA,:DGT)');
                 IBSQL1.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                 IBSQL1.ParamByName('TP').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBSQL1.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                 IBSQL1.ParamByName('DGT').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                 IBSQL1.ExecQuery;
                 if IBSQL1.FieldByName('MOVS').AsCurrency <> 0 then
                 begin
                     bactivo := False;
                     edMensajes.Lines.Add('Tarjeta Débito No.:' + FieldByName('ID_TARJETA').AsString +
                                          ' Tiene valores pendientes por descargar: ' +
                                          FormatCurr('$#0.00',IBSQL1.FieldByName('MOVS').AsCurrency));
                 end;
                 if FieldByName('ID_ESTADO').AsInteger in [1,2] then
                 begin
                     bactivo := False;
                     edMensajes.Lines.Add('Tarjeta Débito No.:' + FieldByName('ID_TARJETA').AsString +
                                          ' debe ser CANCELADA');
                 end;
                 Next;
                end;
            end;
           except
             Transaction.Rollback;
             raise;
             Exit;
           end;
        end;
end;

procedure TfrmRetiroAsociado.BuscaCredivida;
var     Astream :TStringStream;
        XmlDoc,Xmlres,RDoc :TsdXmlDocument;
        tamano :Integer;
        nodo1 :TXmlNode;
        i :Integer;
        sentencia :string;
begin
        XmlDoc := TsdXmlDocument.CreateName('equivida');
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        nodo1 := XmlDoc.Root.NodeNew('Tipo');
        nodo1.WriteInteger('Opcion',2);
        Nodo1 := XmlDoc.Root.NodeNew('registro');
        AStream := TStringStream.Create('');
        with Nodo1 do
        begin
          WriteString('cedula',EdIdentificacion.Text);
          WriteString('consecutivo','0');
        end;// fin nodo1
        XmlDoc.SaveToStream(Astream);
        with IdTCPClient1 do
        begin
          Host := host_equivida;
          Port := puerto_barrido;
          try
          Connect;
          except
          begin
            Disconnect;               
            Exit;
          end;// fin excetion
          end;//fin except
          if Connected then
          begin
            WriteInteger(AStream.Size);
            OpenWriteBuffer;
            WriteStream(AStream);
            CloseWriteBuffer;
            FreeAndNil(AStream);
            tamano := ReadInteger;
            AStream := TStringStream.Create('');
            ReadStream(AStream,tamano,False);
            RDoc := TsdXmlDocument.Create;
            RDoc.LoadFromStream(AStream);
          end;// fin connect
          Disconnect;
          if RDoc.Root.NodeCount > 0 then
          begin
            arbolinfo := TProductos.Create;
            arbolinfo.forma := 9;
            arbolinfo.nombre := 'CREDIVIDAS';
            arbolinfo.tipo := 0;
            arbolinfo.numero := '';
            arbolinfo.agencia := Agencia;
            arbolinfo.digito := 0;
            arbolinfo.nivel := 1;
            NodoSe[0] := Arbol.Items.AddChildObject(NodoSe[0],arbolinfo.nombre,arbolinfo);
            NodoSe[0].ImageIndex := 1;
            for i := 0 to RDoc.Root.NodeCount -1 do
            begin
                NodoSe[i+2] := Arbol.Items.AddChildObject(NodoSe[0],Rdoc.Root.Nodes[i].ValueAsString,arbolinfo);
                NodoSe[i+2].ImageIndex := 5;
              // := Rdoc.Root.Nodes[i].ValueAsString + #13 + respuesta;
            end;//fin for
        end; // fin de if
        end; // fin del coo
end;



procedure TfrmRetiroAsociado.ExpandirTodo1Click(Sender: TObject);
begin
        Arbol.FullExpand;
end;

procedure TfrmRetiroAsociado.ContraerTodo1Click(Sender: TObject);
begin
        Arbol.FullCollapse;
end;

procedure TfrmRetiroAsociado.btnOtroClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmRetiroAsociado.btnRetiroClick(Sender: TObject);
var i:Integer;
    arbolinfo:TProductos;
    id_agencia,id_tipo_captacion,numero_cuenta,digito_cuenta:Integer;
    id_colocacion:string;
    cadena:string;
begin
// Verificar Motivo del Retiro
        if edMotivoRetiro.KeyValue < 0 then
        begin
           MessageDlg('Seleccione el motivo del retiro',mtError,[mbOk],0);
           edMotivoRetiro.SetFocus;
           Exit;
        end;
// bloquear selección de motivo de retiro
        btnOtro.Enabled := False;
        edMotivoRetiro.Enabled := False;
        pnProgreso.Visible := True;
// Primera etapa del proyecto - marcar cuentas en estado por saldar
        for i := 0 to Arbol.Items.Count - 1 do
        begin
             if Arbol.Items.Item[i].Data <> nil then
             with TProductos(Arbol.Items.Item[i].Data) do
             if (nivel = 3) and (forma in [1,2,3]) then
              begin
                   id_agencia := agencia;
                   id_tipo_captacion := tipo;
                   numero_cuenta := StrToInt(numero);
                   digito_cuenta := digito;
                   IBSQL1.Close;
                   IBSQL1.SQL.Clear;
                   IBSQL1.SQL.Add('update "cap$maestro" set ID_ESTADO = 5, FECHA_SALDADA = :FECHA_SALDADA where');
                   IBSQL1.SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                   IBSQL1.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                   IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                   IBSQL1.SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
                   IBSQL1.ParamByName('FECHA_SALDADA').AsDate := fFechaActual;
                   IBSQL1.ParamByName('ID_AGENCIA').AsInteger := id_agencia;
                   IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := id_tipo_captacion;
                   IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := numero_cuenta;
                   IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := digito_cuenta;
                   IBSQL1.ExecQuery;
                   IBSQL1.Close;
                   cadena := Format('Cuenta: %d%.2d-%.7d-%d',[id_tipo_captacion,id_agencia,numero_cuenta,digito_cuenta])+
                             ', Saldo:'+
                             FormatCurr('$#,#0.00',saldoact);
                   if forma = 1 then CheckBox1.Checked := True;
                   if forma = 2 then CheckBox2.Checked := True;
                   if forma = 3 then CheckBox3.Checked := True;
                   edResultado.Lines.Add(cadena);
              end;
        end;
        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('insert into "cap$motivosretiro" values (');
        IBSQL1.SQL.Add(':ID_IDENTIFICACION,:ID_PERSONA,:ID_MOTIVO,:FECHA_RETIRO,:HORA_RETIRO,:ID_EMPLEADO,');
        IBSQL1.SQL.Add(':CUENTA_APORTES,:SALDO_APORTES,:SALDO_AHORROS,:SALDO_JUVENIL,:SALDO_CARTERA');
        IBSQL1.SQL.Add(')');
        IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := edTipoIdentificacion.KeyValue;
        IBSQL1.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
        IBSQL1.ParamByName('ID_MOTIVO').AsInteger := edMotivoRetiro.KeyValue;
        IBSQL1.ParamByName('FECHA_RETIRO').AsDate := fFechaActual;
        IBSQL1.ParamByName('HORA_RETIRO').AsTime := fHoraActual;
        IBSQL1.ParamByName('ID_EMPLEADO').AsString := DBAlias;
        IBSQL1.ParamByName('CUENTA_APORTES').AsString := vCuentaAportes;
        IBSQL1.ParamByName('SALDO_APORTES').AsCurrency := vTotalAportes;
        IBSQL1.ParamByName('SALDO_AHORROS').AsCurrency := vTotalAhorros;
        IBSQL1.ParamByName('SALDO_JUVENIL').AsCurrency := vTotalJuvenil;
        IBSQL1.ParamByName('SALDO_CARTERA').AsCurrency := vTotalDeuda;
        IBSQL1.ExecQuery;
        IBTransaction2.Commit;
        PageControl1.ActivePageIndex := 1;
        btnRetiro.Enabled := False;
        btnFormato.Enabled := True;
        btnFormato.Click;
end;

procedure TfrmRetiroAsociado.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'EMPRESA' then
           ParValue := Empresa;

        if ParName = 'CIUDAD' then
           ParValue := Ciudad;

        if ParName = 'FECHA' then
           ParValue := format('%dddddd ',[fFechaActual]);

        if ParName = 'ASOCIADO' then
           ParValue := edAsociado.Caption;

        if ParName = 'IDENTIFICACION' then
           ParValue := EdIdentificacion.Text;

        if ParName = 'MOTIVO' then
           ParValue := edMotivoRetiro.Text;

        if ParName = 'EMPLEADO' then
        begin
           empleado;
           ParValue := Nombres + ' ' + Apellidos;
        end;

end;

procedure TfrmRetiroAsociado.btnFormatoClick(Sender: TObject);
begin
//        frReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+'\ReportesCap\SolicitudRetiroAsociado.frf');
        IBTransaction2.StartTransaction;
        IBQFianzas.Close;
        IBQFianzas.SQL.Clear;
        IBQFianzas.SQL.Add('select ');
        IBQFianzas.SQL.Add(' "col$colocacion".ID_COLOCACION,');
        IBQFianzas.SQL.Add(' ("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS DEUDA,');
        IBQFianzas.SQL.Add(' "col$colocacion".FECHA_INTERES');
        IBQFianzas.SQL.Add(' from "col$colgarantias" ');
        IBQFianzas.SQL.Add('inner join "col$colocacion" on ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
        IBQFianzas.SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and "col$colgarantias".ID_PERSONA = :"ID_PERSONA" and');
        IBQFianzas.SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION IN (0,1,2,3,8,9))');
        IBQFianzas.ParamByName('ID_IDENTIFICACION').AsInteger := edTipoIdentificacion.KeyValue;
        IBQFianzas.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
        IBQFianzas.Open;
        frDBDataSet1.DataSet := IBQFianzas;
        if frReport2.PrepareReport then
           frReport2.ShowPreparedReport;
//        IBQFianzas.Close;
        IBTransaction2.Commit;
end;

procedure TfrmRetiroAsociado.frReport2GetValue(const ParName: String;
  var ParValue: Variant);
var
  tmpdateformat:string;
begin
        tmpdateformat := ShortDateFormat;
        ShortDateFormat := 'd "de" mmmm "de" yyyy';
        if ParName = 'CIUDAD' then
          ParValue := Ciudad
        else
        if ParName = 'FECHA' then
          ParValue := DateToStr(fFechaActual)
        else
        if ParName = 'NOMBRE' then
           ParValue := edAsociado.Caption
        else
        if ParName = 'DOCUMENTO' then
           ParValue := EdIdentificacion.Text
        else
        if ParName = 'MOTIVO' then
           ParValue := edMotivoRetiro.Text
        else
        if ParName = 'CUENTA' then
           ParValue := vCuentaAportes
        else
        if ParName = 'FECHAINGRESO' then
           ParValue := DateToStr(vFechaIngreso)
        else
        if ParName = 'SALDOAPORTES' then
           ParValue := FormatCurr('$#,#0.00',vTotalAportes)
        else
        if ParName = 'SALDOAHORROS' then
           ParValue := FormatCurr('$#,#0.00',vTotalAhorros)
        else
        if ParName = 'SALDOJUVENIL' then
           ParValue := FormatCurr('$#,#0.00',vTotalJuvenil);
        if ParName = 'EMPLEADO' then
        begin
           empleado;
           ParValue := Nombres + ' ' + Apellidos;
        end;
           

        ShortDateFormat := tmpdateformat;
end;

end.
