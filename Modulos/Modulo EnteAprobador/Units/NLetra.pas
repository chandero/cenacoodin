unit NLetra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TNLetra = class(TComponent)
  private
    { Private declarations }
    N: longint;
    L:String;
    function Conv : String;
    procedure Lee (Valor: longInt);
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    Property Numero : longint read N Write Lee default 1;
    Property Letras : String read Conv Write L;
  end;

procedure Register;

implementation

procedure TNLetra.Lee (Valor: longint);
begin
  if (Valor >=0) and (Valor <= 999999999) then
   N := Valor else N:=1;
  if (Valor <0) then Showmessage('Debe Ser un Número Positivo!!');
  if (Valor > 999999999) then Showmessage('Lo siento, Esto es solo un entero ...');
end;

function TNLetra.conv:string;
var
erro,unidades,dec,cent,
salva, miles,decmil,centmil,mill, aux: longint;
cad,cad2:string;

function convierte(s:longint):string;
begin
  case s of
     1: convierte:='uno';
     2: convierte:='dos';
     3: convierte:='tres';
     4: convierte:='cuatro';
     5: convierte:='cinco';
     6: convierte:='seis';
     7: convierte:='siete';
     8: convierte:='ocho';
     9: convierte:='nueve';
    10: convierte:='diez';
    11: convierte:='once';
    12: convierte:='doce';
    13: convierte:='trece';
    14: convierte:='catorce';
    15: convierte:='quince';
    20: convierte:='veinte';
    30: convierte:='treinta';
    40: convierte:='cuarenta';
    50: Convierte:='cincuenta';
    60: convierte:='sesenta';
    70: convierte:='setenta';
    80: convierte:='ochenta';
    90: convierte:='noventa';
    100:convierte:='cien';
    500:convierte:='quinientos';
    700:convierte:='setecientos';
    900:convierte:='novecientos';
  end;
end;

begin
 // if n >999999999999 then showmessage('Debe ser un número menor a un billón')
 // else
  begin
//  label1.caption:='';
  salva := n;
  aux:=n div 1000000; mill:= aux; n :=n mod 1000000;
  aux:=n div 100000; centmil:= aux;n:=n mod 100000;
  aux:=n div 10000; decmil:= aux;n:=n mod 10000;
  aux:=n div 1000; miles:= aux;n:=n mod 1000;
  aux:=n div 100; cent:= aux;n:=n mod 100;
  aux:=n div 10; dec:= aux;n:=n mod 10;
  aux:=n;unidades:= aux;
  cad:='';
  if mill >0 then
  if mill = 1 then cad := 'un millon ' else
  begin
   n:= mill;
   cad := conv +' millones ';
  end;
  n:= salva;
 {empieza la conversión de las centenas de miles}
  cad2:='';
  case centmil of
       1:if (miles=0) and (decmil=0) then cad2:=convierte(100)
            else cad2:='ciento ';
       2:cad2:=convierte(2)+'cientos ';
       3:cad2:=convierte(3)+'cientos ';
       4:cad2:=convierte(4)+'cientos ';
       5:cad2:=convierte(500)+' ';
       6:cad2:=convierte(6)+'cientos ';
       7:cad2:=convierte(700)+' ';
       8:cad2:=convierte(8)+'cientos ';
       9:cad2:=convierte(900)+' ';
  end;
  cad:=cad+cad2;
   {Termina la conversión de las centenas}


  {empieza la conversión de las decenas y unidades de miles}
cad2:='';
  case decmil of
     0:if miles <> 1 then cad2:=convierte(miles);
     1:if miles<=5 then cad2:=convierte(decmil*10+miles)
          else cad2:='dieci'+ convierte(miles);
     2:if miles=0 then cad2:=convierte(20)
          else if miles=1 then cad2:='veintiun' else
          cad2:='veinti'+convierte(miles);
     3:if miles=0 then cad2:=convierte(30)
          else if miles=1 then cad2:='treinta y un' else
          cad2:='treinta y '+convierte(miles);
     4:if miles=0 then cad2:=convierte(40)
          else if miles=1 then cad2:='cuarenta y un' else
          cad2:='cuarenta y '+convierte(miles);
     5:if miles=0 then cad2:=convierte(50)
          else if miles=1 then cad2:='cincuenta y un' else
          cad2:='cincuenta y '+convierte(miles);
     6:if miles=0 then cad2:=convierte(60)
          else if miles=1 then cad2:='sesenta y un' else
          cad2:='sesenta y '+convierte(miles);
     7:if miles=0 then cad2:=convierte(70)
          else if miles=1 then cad2:='setenta y un' else
          cad2:='setenta y '+convierte(miles);
     8:if miles=0 then cad2:=convierte(80)
          else if miles=1 then cad2:='ochenta y un' else
          cad2:='ochenta y '+convierte(miles);
     9:if miles=0 then cad2:=convierte(90)
          else if miles=1 then cad2:='noventa y un' else
          cad2:='noventa y '+convierte(miles);
    end;
if (centmil > 0) and (decmil=0) and (miles = 1) then cad2 := cad2 + 'un';
if (miles>0) or (decmil>0) or (centmil>0) then cad2:=cad2+' mil ';
cad:=cad+cad2;
    {termina la conversión de las decenas y unidades de miles}

 {empieza la conversión de las centenas}
 cad2:='';
  case cent of
       1:if (unidades=0) and (dec=0) then cad2:=convierte(100)
            else cad2:='ciento ';
       2:cad2:=convierte(2)+'cientos ';
       3:cad2:=convierte(3)+'cientos ';
       4:cad2:=convierte(4)+'cientos ';
       5:cad2:=convierte(500)+' ';
       6:cad2:=convierte(6)+'cientos ';
       7:cad2:=convierte(700)+' ';
       8:cad2:=convierte(8)+'cientos ';
       9:cad2:=convierte(900)+' ';
  end;
cad:=cad+cad2;
   {Termina la conversión de las centenas}

  {empieza la conversión de las decenas y unidades}
cad2:='';
  case dec of
     0:cad2:=convierte(unidades);
     1:if unidades<=5 then cad2:=convierte(dec*10+unidades)
          else cad2:='dieci'+ convierte(unidades);
     2:if unidades=0 then cad2:=convierte(20)
          else cad2:='veinti'+convierte(unidades);
     3:if unidades=0 then cad2:=convierte(30)
          else cad2:='treinta y '+convierte(unidades);
     4:if unidades=0 then cad2:=convierte(40)
          else cad2:='cuarenta y '+convierte(unidades);
     5:if unidades=0 then cad2:=convierte(50)
          else cad2:='cincuenta y '+convierte(unidades);
     6:if unidades=0 then cad2:=convierte(60)
          else cad2:='sesenta y '+convierte(unidades);
     7:if unidades=0 then cad2:=convierte(70)
          else cad2:='setenta y '+convierte(unidades);
     8:if unidades=0 then cad2:=convierte(80)
          else cad2:='ochenta y '+convierte(unidades);
     9:if unidades=0 then cad2:=convierte(90)
          else cad2:='noventa y '+convierte(unidades);
    end;
  cad:=cad+cad2;
    {termina la conversión de las decenas y unidades}
  if cad <> '' then
  conv:=cad else Conv := 'Cero';
  end;
end;

procedure Register;
begin
  RegisterComponents('Dialogs', [TNLetra]);
end;

end.
