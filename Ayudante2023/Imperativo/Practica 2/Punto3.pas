program ejercicio3;
type
    lista = ^nodo;
    nodo = record
        elem:integer;
        sig:lista;
    end;

procedure agregarAtras (var l:lista;n:integer);
var
    nuevo,aux:lista;
begin
    new(nuevo);
    nuevo^.elem:=n;
    nuevo^.sig:=nil;
    if (l=nil) then 
        l:=nuevo
    else begin
        aux:=l;
        while (aux^.sig<>nil) do
            aux:=aux^.sig;
        aux^.sig:=nuevo;
    end;
end;

procedure listaRandom(var l:lista);
var
    num: integer;
begin
    num:= random(101);
    if (num<>0) then begin
        agregarAtras(l,num);
        listaRandom(l^.sig);
    end;
end;

procedure imprimirLista(l:lista);
begin
    while (l<>nil) do begin
        writeln(l^.elem);
        l:=l^.sig;
    end;
end;

procedure valorMinimo(l:lista; var min:integer);
begin
    if (l<>nil) then begin
        if (l^.elem< min) then
            min:= l^.elem;
        valorMinimo(l^.sig,min);
    end;
end;

function valorMinimo1(l: lista; min: integer): integer;
begin
  if l <> nil then
  begin
    if l^.elem < min then
    begin
      min := l^.elem;
    end;
    valorMinimo1 := valorMinimo1(l^.sig, min);
  end
  else
	valorMinimo1 := min; 
end;


procedure valorMaximo(l:lista; var max:integer);
begin
    if (l<>nil) then begin
        if (l^.elem> max) then
            max:= l^.elem;
        valorMaximo(l^.sig,max);
    end;
end;


function estaEnLista(l: lista; int: integer): boolean;
begin
  
  estaEnLista :=false;
  if l <> nil then
  begin
    if l^.elem = int then
      estaEnLista := true
    else
      estaEnLista := estaEnLista(l^.sig, int);
  end;
end;


var
    l:lista;
    max,min: integer;
    num:integer;
begin
    l:=nil;
    randomize;
    listaRandom(l);
    imprimirLista(l);
    min:=32767;
    max:=0;
	min :=valorMinimo1(l,min);
    writeln('Minimo: ',min);
    valorMaximo(l,max);
    writeln('Maximo: ',max);
    read(num);
    writeln(estaEnLista(l,num));
end.
