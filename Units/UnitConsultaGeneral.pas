unit UnitConsultaGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, JvEdit, DBCtrls, ComCtrls,
  JvStaticText, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    JVnombres: TJvStaticText;
    Scuenta: TStaticText;
    StaticText2: TStaticText;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DBtipo: TDBLookupComboBox;
    JVnumero: TJvEdit;
    BTbuscar: TBitBtn;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Mradicado: TMaskEdit;
    fecha: TJvStaticText;
    BTbuscar1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
