{
   2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6
   
   
}


program punto2;


procedure imprimirNum(num:integer);
begin
	if(num<10)then
		writeln(num)
	else begin
			imprimirNum(num div 10);
			writeln(num mod 10);
		end;
end;

procedure leerNumero();
var
	num:integer;
begin
	writeln('Ingrese numero:');
	read(num);
	while(num<>0)do
	begin 
		writeln('Ingrese numero:');
		imprimirNum(num);
		read(num);
	end;
end;
BEGIN
	leerNumero();
	
END.

