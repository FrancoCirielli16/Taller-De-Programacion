program VectorRecursivo;
const
	dimf=10;
type
	vectornum= array[1..dimf] of integer;
	
procedure crearVector(var v:vectornum; var diml:integer);
var num:integer;
begin
	num:=random(10);
	while (num<>0) and (diml<dimf) do begin
		diml:=diml +1;
		v[diml]:=num;
		num:=random(10);
	end;
end;

procedure imprimirVector(v:vectornum;diml:integer);
var i:integer;
begin
	for i:=1 to diml do begin
		writeln('Numero en la posicion ', i, 'es: ',v[i]);
	end;
end;

Procedure busquedaDicotomica( v: vectornum; ini,fin: integer; dato:integer; var pos: integer);
var medio:integer;
begin
	if (ini>fin) then pos:=-1
	else begin
		medio:=(ini + fin) div 2;
		if (v[medio]=dato) then pos:=medio
		else
			if (v[medio]>dato) then BusquedaDicotomica(v,ini,medio-1,dato,pos)
		    else busquedaDicotomica(v,medio+1,fin,dato,pos);
	end;
end;
   



var
	v:vectornum;
	diml,pos,dato:integer;
begin
	diml:=0;
	pos:=0;
	Randomize; 

	
	crearVector(v,diml);imprimirVector(v,diml);
	
	
    writeln('Ingrese el numero a buscar: ');readln(dato);
    busquedaDicotomica(v,1,diml,dato,pos);
    if (pos>-1) then
		writeln('El numero ',dato, ' estaba en la posicion: ',pos)
	else writeln('El numero ',dato, ' no estaba en el vector.');
	
end.
