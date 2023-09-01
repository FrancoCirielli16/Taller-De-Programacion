{
 
1. Escribir un programa que:














}


program Punto1;
type
	socio=record
	nro:integer;
	nombre:string;
	edad:integer;
	end;
	
	arbol=^nodo;
	nodo = record
		elem: socio;
		hi:arbol;
		hd:arbol;
	end;

  
 
{
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
}
procedure leerS(var dato:socio);
begin
	readln(dato.nro);
	readln(dato.nombre);
	readln(dato.edad);
end;
  
procedure Insertar(var a: arbol; dato: socio);
begin
 if (a = nil) then begin
	new(a);
	a^.elem:= dato;
	a^.HI:= nil;
	a^.HD:= nil;
 end
 else
	if (a^.elem.nro > dato.nro) then
		Insertar(a^.HI, dato)
 else
	if (a^.elem.nro < dato.nro) then
		Insertar (a^.HD, dato);
end;
  
procedure crearABB(var a:arbol);
var s:socio;
begin
	writeln('Ingrese un socio: ');
	leerS(s);
	while (s.nro<>0) do begin
		Insertar(a,s);
		writeln('Ingrese un socio: ');
		leerS(s);
	end;
end;

{
*b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que 

i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.}

procedure NroMax(a:arbol;var max:integer);
begin
	if (a<>nil) then begin
		max:=a^.elem.nro;
		NroMax(a^.hd,max);
	end;
end;

{ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
recursivo que retorne dicho socio.}

procedure SocioMin(a:arbol; var min:socio);
begin
	if (a<>nil) then begin
		min:=a^.elem;
		SocioMin(a^.hi,min);
	end;
end;

procedure VerMin(a:arbol; var min:socio);
begin
	if (a<>nil) then begin
		if (a^.elem.nro<min.nro) then
			min:=a^.elem;
		VerMin(a^.hi,min);
		VerMin(a^.hd,min);
	end;
end;

{
* iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.}

procedure EdadMayor(a:arbol;var edad:integer;var min:integer);
begin
	if(a<>nil)then
	begin
		if(a^.elem.edad<edad)then
			min:=a^.elem.nro;
		EdadMayor(a^.hi,edad,min);
		EdadMayor(a^.hd,edad,min);
	end;
end;


{
* iv. Aumente en 1 la edad de todos los socios.}

procedure aumentarEdad(var a:arbol);
begin
	if (a <> nil) then begin
		a^.elem.edad:=a^.elem.edad+1;
		aumentarEdad(a^.HI);
		aumentarEdad(a^.HD);
	end;
end;

{
* v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor leído y retorne verdadero o falso.}

procedure buscarenArbol(a:arbol;nro:integer;var ok:boolean);
begin
	if (a<>nil) then 
	begin
		if(a^.elem.nro = nro) then
			ok:=true;
		buscarenArbol(a^.HD,nro,ok);
		buscarenArbol(a^.HI,nro,ok);
	end;
end;

function BuscarNro (a:arbol; dato:integer): boolean;
begin
	if (a=nil) then
		BuscarNro:=false
	else
		if (dato= a^.elem.nro) then 
			BuscarNro:=true
		else
			if (dato < a^.elem.nro) then
				BuscarNro:=BuscarNro(a^.HI ,dato)
			else
				BuscarNro:=BuscarNro(a^.HD ,dato);
end;

{vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.}

function BuscarNombre (a:arbol; dato:string): boolean;
begin
	if (a=nil) then
		BuscarNombre:=false
	else
		if (dato= a^.elem.nombre) then 
			BuscarNombre:=true
		else
			if (dato < a^.elem.nombre) then
				BuscarNombre:=BuscarNombre(a^.HI ,dato)
			else
				BuscarNombre:=BuscarNombre(a^.HD ,dato);
end;

{vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.}

procedure cantidad_Socios(a:arbol;var cant:integer);
begin
	if(a<>nil)then
	begin
		cant:=cant+1;
		cantidad_Socios(a^.hi,cant);
		cantidad_Socios(a^.hd,cant);
	end;
end;



{
vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
* viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso}

procedure total_Edad (a:arbol;var totaledad:integer);
begin
	if (a<>nil) then 
	begin
		totaledad:=totaledad + a^.elem.edad;
		total_Edad(a^.HI,totaledad);
		total_Edad(a^.HD,totaledad);
	end;
end;

{xi. Informe los números de socio en orden creciente.}

procedure postorden(a:arbol);
begin
	if (a <> nil) then begin
		postorden(a^.HI);
		postorden(a^.HD);
		writeln('Nro socio: ',a^.elem.nro,' Nombre: ',a^.elem.nombre,' Edad: ',a^.elem.edad);
	end;
end;

{
x. Informe los números de socio pares en orden decreciente.}

procedure preorden(a:arbol);
begin
	if (a <> nil) then begin
		writeln('Nro socio: ',a^.elem.nro,' Nombre: ',a^.elem.nombre,' Edad: ',a^.elem.edad);
		preorden (a^.HI);
		preorden (a^.HD);
		
	end;
end;

var
	a:arbol;
	max:integer;
	min:socio;
	nro_min:integer;
	edad:integer;
	nro_buscar:integer;
	esta:boolean;
	nombre:string;
	total_socios:integer;
	totaledad:integer;
BEGIN
	edad:=9999;
	esta:=false;
	crearABB(a);
	NroMax(a,max);
	writeln('nro max:',max);
	SocioMin(a,min);
	writeln('nro min: ',min.nro);
	writeln('nombre: ',min.nombre);
	writeln('edad: ',min.edad);
	verMin(a,min);
	writeln('----------');
	writeln('nro min: ',min.nro);
	writeln('nombre: ',min.nombre);
	writeln('edad: ',min.edad);
	EdadMayor(a,edad,nro_min);
	aumentarEdad(a);
	writeln('Ingrese nro de socio a buscar: ');
	readln(nro_buscar);
	buscarenArbol(a,nro_buscar,esta);
	writeln('El socio buscado es: ',esta);
	writeln('El socio buscado es: ',BuscarNro(a,nro_buscar));
	writeln('Ingrese nombre de socio a buscar:');
	readln(nombre);
	writeln('El socio buscado es: ',BuscarNombre(a,nombre));
	cantidad_Socios(a,total_socios);
	total_Edad(a,totaledad);
	writeln('cant socios ',total_socios);
	writeln('total edad ',totaledad);
	writeln('promedio ',totaledad div total_socios);
	writeln('Crecientes');
	postorden(a);
	writeln('Decendiente');
	preorden(a);
END.

