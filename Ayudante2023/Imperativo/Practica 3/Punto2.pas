{
   
2. Escribir un programa que:

a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.

b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.

c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
   
   
}


program Punto2;
type
	venta=record
	cod:integer;
	fecha:string;
	cant:integer;
	end;
	
	producto=record
	cod:integer;
	total_vendido:integer;
	end;
	
	arbolV=^nodo;
	nodo = record
		elem: venta;
		hi:arbolV;
		hd:arbolV;
	end;
	
	arbolP=^nodoP;
	nodoP = record
		data: producto;
		hi:arbolP;
		hd:arbolP;
	end;


procedure leerV(var dato:venta);
begin
	readln(dato.cod);
	readln(dato.fecha);
	readln(dato.cant);
end;
  
procedure InsertarV(var a: arbolV; dato: venta);
begin
 if (a = nil) then begin
	new(a);
	a^.elem:= dato;
	a^.HI:= nil;
	a^.HD:= nil;
 end
 else
	if (a^.elem.cod > dato.cod) then
		InsertarV(a^.HI, dato)
 else
	if (a^.elem.cod < dato.cod) then
		InsertarV (a^.HD, dato);
end;

procedure InsertarP(var a: arbolP; cod:integer;cant:integer);
begin
 if (a = nil) then begin
	new(a);
	a^.data.cod:= cod;
	a^.data.total_vendido:= cant;
	a^.HI:= nil;
	a^.HD:= nil;
 end
 else
	if (a^.data.cod >= cod) then
		InsertarP(a^.HI, cod,cant)
 else
	if (a^.data.cod <= cod) then
		InsertarP (a^.HD, cod,cant);
end;
  
  
function BuscarCod (a:arbolP; dato:integer):boolean;
begin
	if (a=nil) then
		BuscarCod:=false
	else
		if (dato= a^.data.cod) then 
			BuscarCod:=true
		else
			if (dato < a^.data.cod) then
				BuscarCod:=BuscarCod(a^.HI ,dato)
			else
				BuscarCod:=BuscarCod(a^.HD ,dato);
end;

procedure Actualizar(a:arbolP;cod:integer;cant:integer);
begin
	if(a<>nil)then
	begin
		if (cant = a^.data.cod) then 
			a^.data.total_vendido:=a^.data.total_vendido+cant;
		Actualizar(a^.HI,cod,cant);
		Actualizar(a^.HD,cod,cant);
	end;
end;

procedure crearABB(var AV:arbolV;var AP:arbolP);
var v:venta;


begin

	writeln('Ingrese una venta: ');
	leerV(v);
	while (v.cod<>0) do begin
		InsertarV(AV,v);

		if(BuscarCod(AP,v.cod))then
			Actualizar(AP,v.cod,v.cant)
		else
			InsertarP(AP,v.cod,v.cant);

		writeln('Ingrese una venta: ');
		leerV(v);
	end;
end;

procedure total_vendidasAV(a:arbolV;cod:integer;var total:integer);
begin
	if(a<>nil)then
	begin
		if(a^.elem.cod=cod)then
			total:=total+a^.elem.cant;
		total_vendidasAV(a^.hi,cod,total);
		total_vendidasAV(a^.hd,cod,total);
	end;
end;


{
procedure total_vendidasAP(a:arbolP;cod:integer;var total:integer);
begin
	if(a<>nil)then
	begin
		if(a^.elem.cod=cod)then
			total:=a^.elem.total_vendido;
		total_vendidasAV(a^.hi,cod,total);
		total_vendidasAV(a^.hd,cod,total);
	end;
end;
}

function total_vendidasAP(a:arbolP;cod:integer): integer;
begin
	if (a=nil) then
		total_vendidasAP:=0
	else
		if (cod = a^.data.cod) then 
			total_vendidasAP:=a^.data.total_vendido
		else
			if (cod < a^.data.cod) then
				total_vendidasAP:=total_vendidasAP(a^.HI ,cod)
			else
				total_vendidasAP:=total_vendidasAP(a^.HD ,cod);
end;

procedure preordenV(a:arbolV);
begin
	if (a <> nil) then begin
		writeln('COD: ',a^.elem.cod,' Fecha: ',a^.elem.fecha,' Cant: ',a^.elem.cant);
		preordenV(a^.HI);
		preordenV(a^.HD);
	end;
end;

procedure preordenP(a:arbolP);
begin
	if (a <> nil) then begin
		writeln('COD: ',a^.data.cod,' Cant: ',a^.data.total_vendido);
		preordenP(a^.HI);
		preordenP(a^.HD);
		
	end;
end;

var
ap: arbolP;
cod,total:integer;
av:arbolV;
BEGIN
	crearABB(av,ap);
	preordenV(av);
	preordenP(ap);
	readln(cod);
	writeln(total_vendidasAP(ap,cod));
	total_vendidasAV(av,cod,total);
END.
