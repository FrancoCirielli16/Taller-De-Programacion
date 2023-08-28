{
  4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
   
   
}


program untitled;
const
DF = 20;
type
vector= array[1..DF] of integer;

procedure vectorRandom(var v:vector;cant:integer);
var
    num: integer;
begin
    num:= random(100) + 1;
    if (cant<=20) then begin
        v[cant]:=num;
        vectorRandom(v,cant+1);
    end;
end;

procedure imprimirVector(v:vector);
var
	i:integer;
begin
	for i := 1 to DF do 
		writeln(v[i]);
end;


procedure valorMinimo(v:vector; var min:integer;cant:integer);
begin
    if (cant<DF) then begin
        if (v[cant]<min) then
            min:= v[cant];
        valorMinimo(v,min,cant+1);
    end;
end;

function ValorMinimoR(v: vector; cant: integer;min:integer): integer; //funcionan
begin
  if (cant < DF) then
  begin
    if (v[cant] < min) then
      min := v[cant];
    ValorMinimoR:= ValorMinimoR(v, cant + 1,min);
  end
  else
    ValorMinimoR := min;
end;

function ValorMinimoR2(v: vector; index: integer): integer; //funcionan
var
  Min: integer;
begin
  if index = DF then
    ValorMinimoR2 := v[index]
  else
  begin
    Min := ValorMinimoR2(v, index + 1);
    if v[index] < Min then
      ValorMinimoR2 := v[index]
    else
      ValorMinimoR2 := Min;
  end;
end;




procedure contarVector(v:vector; i:integer;var cant:integer);
begin
   if (i<DF) then begin
        cant := cant + v[i];
        contarVector(v,i+1,cant);
    end;
end;

function CalcularSum(v: vector; i: integer): integer;
begin
  if (i < DF) then
    CalcularSum := v[i] + CalcularSum(v, i + 1)
  else
    CalcularSum := v[DF];
end;



var
v:vector;
min:integer;
cant:integer;
BEGIN
	Randomize;
	min:=3210;
	cant:=0;
	vectorRandom(v,1);
	imprimirVector(v);
	valorMinimo(v,min,1);
	//contarVector(v,1,cant);
	CalcularSum(v,1);
	writeln('num min');
	writeln(ValorMinimoR(v,1,min));
	writeln('suma del vector');
	writeln(CalcularSum(v,1));
END.

