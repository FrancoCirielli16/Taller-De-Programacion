<h1 align="center"> 📚Vectores </h1>


Indice
=================

<!--ts-->
   * [Asignación de contenido](#asignación_de_contenido)
   * [Lectura/Escritura](#lectura_escritura)
   * [Recorridos](#recorridos)
   * [Carga de datos](#cargar_Datos)
   * [Agregar al Final](#agregar_al_final)
   * [Insertar Elementos](#insertar_un_elemento)
     * [En una Posición Determinada](#posición_determinada)
     * [Manteniendo un orden](#Manteniendo_Un_Orden)
   * [Borrar Elementos](#borrar_elementos)
     *  [En una Posición Determinada](#en_posición_determinada)
     *  [Un Elemento Determinado](#Elemento_Determinado)
   * [Buscar un elemento](#buscar_elemento)
     * [Busqueda Lineal o Secuencial](#busqueda_lineal_o_secuencial)
     * [Busqueda en arreglos ordenados](#en_arreglos_ordenados)
       * [Secuencial Optimizado](#secuencial_optimizado)
       * [Busqueda Dicotomica](#busqueda_dicotomica) 
   * [Corte de control](#Corte_de_Control)
   * [Ordenacion Por Selección](#Ordenación_por_Selección)
   * [Ordenacion Por Inserción](#Ordenación_por_Inserción)
   * [Encontrar Maximo Recursion](#Encontrar_Maximo_Recursivo)
   * [Generar Vector Random](#Generar_Vector_Random)
   * [Suma Vector](#Suma_Vector)
   * [Cargar Vector entre dos nros](#CargarVectorEntreDosNumeros)
   * [Promedio Recursivo](#Promedio_Recursivo)
 
Asignación_de_contenido
=======================

```Pas
var
  numero:integer;
  v:vector;
begin
  numero:=10;
  v[4]:=numero;
end.
```

Lectura_Escritura
=================

```Pas
var
  v:vector;
begin
  readln(v[1);
  writeln(v[1];
end.
```
Recorridos
==========

<table>
<tr>
<td> Recorrido Total </td> <td> Recorrido Parcial </td><td> Recorrido Parcial 2 </td>
</tr>
<tr>
<td>
 
```Pas
var
    v:vector;
    i:integer;
begin
    for i:=1 to dimF do
       writeln(v[i]);
end.
```
</td>
<td>
 

```Pas
var //(Seguro Existe)
    v:vector;
    i:integer;
begin
    i:=1;
    while (v[i] <> 0) do
    begin
       writeln(v[i]);
       i:=i+1;
    end;
end.
```
 
</td>
 <td>
 

```Pas
var //(Puede no Existir)
    v:vector;
    i:integer;
begin
    i:=1;
    while (i <= dimF) and (v[i] <> 0) do
    begin
       i:=i+1;
    end;
    if (i <= dimF ) then
       writeln ('Existe');
    else
       writeln ('No Existe');
end.
```
 
</td>
</tr>
 
</table>

Cargar_Datos
=============

<table>
<tr>
<td> Carga Total </td> <td> Carga Parcial </td>
</tr>
<tr>
<td>
 
```Pas
procedure Carga_Total(var v:vector);
var
    i:integer;
begin
    for i:=1 to dimF do
    begin
       readln(v[i]);                    
    end;
end.
```
</td>
<td>
 

```Pas
procedure Carga_Parcial(var v;vector;var dimL);
var
    numero:integer;
begin
    dimL:=0;
    readln(numero);
    while (numero <> 0) and (dimL < dimF) do
    begin
       dimL:=dimL+1;
       v[dimL]:=nummero;
       readln(numero);                 
    end;
end.
```
 
</td>
</tr>
 
</table>

Agregar_al_final
================

```Pas
Procedure Agregar_Al_Final(var v:vector;var dimL:integer;elemeto:integer);
begin
   if (dimL < dimF) then 
   begin
      dimL:=dimL + 1; 
      v[dimL]:=elemento;
   end;
end.
```
Insertar_un_elemento
====================

Posición_Determinada
--------------------


```Pas
procedure Posicion_Determinada (var v:vector; var dimL:integer;elemento,pos:integer);
var
   i:integer;
begin
    if (dimL < dimF) and ((pos >= 1) and (pos <= dimL)) then
    begin
         for i:=dimL to downto pos to
            v[i + 1] := v[i];
         v[pos]:=elemento;
         dimL:=dimL+1;
    end;
end;
```
Manteniendo_Un_Orden
-------------------- 
```Pas
//Insertar un elemento en un vector ordenado de menor a mayor
procedure Manteniendo_un_Orden (var v:vector; var dimL:integer;elemento:integer);
var
    pos:integer;
begin
    if (dimL < dimF) then
    begin
        pos:=BuscarPosicion(elemento,v,dimL);
        Insertar(v,dimL,pos,elemento);
    end;
end;
//__________________________________________________________________________________
Function BuscarPosicion (x:integer;v:vector;dimL:integer):integer;
var
    pos:=Integer;
begin
    pos:=1; 
    while (pos <= dimL) and (x > v[pos]) do
        pos:=pos + 1;
    BuscarPosicion:=pos;
end;
//__________________________________________________________________________________
Procedure Insertar (var v:vector; var dimL:integer; pos: Indice; elem:integer);
var 
    i: indice;
begin
    for i:= dimL downto pos do 
        v [i + 1] := v [i] ;
    v [pos] := elem; 
    dimL := dimL + 1;
End;
 ```
 
Borrar_Elementos  
================

En_Posición_Determinada 
-----------------------

```Pas
Procedure BorrarPos (var v: vector; var dimL: integer; pos: posicion);
var 
    i: integer; 
Begin
    if (pos >=1 and pos <= dimL) then 
    begin
        for i:= pos + 1 to dimL  do
            v [ i - 1 ]  :=  v [ i ] ;
        dimL := dimL - 1 ;         
   end;
End;

```

Elemento_Determinado
--------------------
```Pas
Procedure BorrarElem (var v: vector;  var dimL: integer; elem: integer);
var 
    pos: indice;
begin
    pos:= BuscarPosElem (elem, v, dimL);
    if (pos <> 0) then 
    begin
        BorrarPos (v, dimL, pos);
   end;
end;
//__________________________________________________________________________________
Function BuscarPosElem (x:integer; v:vector; dimL: integer): integer;
var 
    pos:integer; 
    exito: boolean;
Begin
    pos:=1; 
    exito:= false;
    while (pos <= dimL) and (not exito) do 
    begin
        if (x = v[pos]) then
            exito:= true
        else
            pos:=pos+1;
    end;
    if (exito = false) then 
        pos:=0;
    BuscarPosElem:= pos;
end; 
//__________________________________________________________________________________
Procedure BorrarPos (var v:vector; var dimL:integer; pos:integer);
var 
    i: integer; 
Begin
    for i:= pos + 1  to   dimL  do
        v [ i - 1 ]  :=  v [ i] ;
    dimL := dimL - 1 ;         
End;

```
Buscar_elemento
================

Busqueda_Lineal_o_Secuencial 
----------------------------

```Pas
Function BuscarPosElem (x:integer;v:vector;dimL:integer):integer;
var 
    pos:integer; 
    exito: boolean;
Begin
    pos:=1;
    exito:= false;
    while (pos <= dimL) and (not exito) do
    begin
        if (x = v[pos]) then
            exito:= true
        else
            pos:=pos+1;
    end;
    if (exito = false) then 
        pos:=0;
    BuscarPosElem:= pos;
end; 

```
  
En_arreglos_ordenados
---------------------


Secuencial_Optimizado
---------------------

```Pas
Function BuscoPosElemOrd (x:integer;v:Vector;dimL:integer):integer;
var 
    pos:integer;
Begin
    pos:=1;
    while (pos <= dimL) and (x > v[pos]) do
        pos:=pos+1;
    if ( pos > dimL ) or (x < v [pos]) then //Si me pase de la DimL del vector reincicio la posición
        pos:=0;                               //y si el elemento es mas chico que el menor numero del vector, tambien reinicio.
    BuscoPosElemOrd:= pos;
End; 
```
Busqueda_Dicotomica
-------------------

```Pas
Procedure  BusquedaBin (var v: Vector; var pos:integer; dimL,x: integer);
Var 
    primero, ult, medio: integer;
Begin
    pos :=0 ;
    primero:= 1;
    ult:= dimL;
    medio := (primero + ult) div 2 ; 
    While (primero <= ult) and (x <> v [medio].codigo) do 
    begin
        If (x < v[medio].codigo) then 
            ult:= medio -1 
        else
            primero:= medio+1 ;
        medio := (primero + ult) div 2 ;
    end;
    If (primero <= ult) then
        pos := medio
    else
        pos := 0;
End;  
```

Corte_de_Control
================

```Pas
Procedure CorteDeControl(var v:vector;var dimL:integer);
var
    numero:integer;
    num_aux:Integer;
    cantidad:integer;
begin
    ReadLn(numero);
    dimL:=0;
    while ((numero <> -1) and (dimL < dimF)) do
    begin
        cantidad:=0;
        num_aux:=numero;
        while (numero = num_aux) do
        begin
            cantidad:=cantidad+1;
            dimL:=dimL+1;
            ReadLn(numero);
            v[dimL]:=numero;
        end;
        WriteLn('La cantidad de',numero,' es ', cantidad);
    end;
end;
```

Ordenación_por_Selección
========================
```pascal
Procedure Seleccion ( var v: vector; dimL: Integer );
var 
    i, j, p: Integer;
    item:integer;
begin
    for i:=1 to dimL-1 do 
    begin {busca el mínimo y guarda en p la posición}
        p := i;
        for j := i+1 to dimL do
            if v[ j ] < v[ p ] then p:=j;
        {intercambia v[i] y v[p]}
        item := v[ p ];   
        v[ p ] := v[ i ];   
        v[ i ] := item;
    end;
end;
```

Ordenación_por_Inserción
========================

```pascal
Procedure Insercion ( var v: vector; dimL: Integer );
var 
    i, j: Integer; 
    actual:integer;
begin
    actual:=0;
    for i:=2 to dimL do 
    begin 
        actual:= v[i];
        j:= i-1; 
        while (j > 0) and (v[j] > actual) do
        begin
            v[j+1]:= v[j];
            j:=j-1;
        end;  
        v[j+1]:= actual; 
    end;
end;
```

Encontrar_Maximo_Recursivo
==========================

```Pas
function Encontrar_Maximo(v:vector;max:integer;i:integer):integer;
Begin
    if (i < dimF) then
    begin
        if (v[i] > max) then
        begin
            max:=v[i];
        end;
        i:=i+1;
        Encontrar_Maximo:=Encontrar_Maximo(v,max,i);
    end
    else
        Encontrar_Maximo:=max;
End;
```

Generar_Vector_Random
=====================
```Pas
procedure GenerarVector(var v:vector);
var
    i:integer;
    num:integer;
begin
    for i:=1 to dimF do
    begin
        num:=random(21);
        write(num, ', ');
        v[i]:=num;
    end;
end;
```
Suma_Vector
===========
```Pas
function suma(v:vector; dimL:integer):integer;
Begin
    if (dimL = 0) then
     suma := 0
  else
      suma := suma(v,dimL-1) + v[dimL]
End;
```

CargarVectorEntreDosNumeros
===========================
```Pascal
Procedure CargarVector ( var v:vector;var dimL:integer;af:arbol;Datos:afi );
begin 
    if ( af<> nil ) and (dimL < dimF) then begin
        CargarVector (v,dimL,af^.HI,Datos);
        if (af^.dato.nro>datos.dni_1) and (af^.dato.nro<Datos.dni_2) then
        begin
            dimL:=dimL+1;
            v[dimL]:=af^.dato;
        end;
        CargarVector (v,dimL,af^.HD,Datos);
    end;
end;
```

Promedio_Recursivo
==================
```Pascal
program cosa;
type
  vector = array [1..10] of integer;
function Encontrar_Promedio(v:vector;promedio:Real;total:integer;pos:integer;dimL:integer):Real;
Begin
    if (pos <= dimL) then
    begin
        total:=total+v[pos];
        Encontrar_Promedio:=Encontrar_Promedio(v,promedio,total,pos+1,dimL);
    end
    else
    begin
        promedio:=total/dimL;
        Encontrar_Promedio:=promedio;
    end;
End;
var
  v:vector;
  pos:integer;
  nro:integer;
  total:integer;
  promedio:Real;
  dimL:integer;
begin
  randomize;
  dimL:=10;
  for pos:=1 to 10 do
  begin
    nro:=random(10);
    v[pos]:=nro;
    WriteLn(nro);
    total:=total+nro;
  end;
  pos:=1;
  
  WriteLn('Promedio: ',total/10 );
  total:=0;
  writeln(Encontrar_Promedio(v,promedio,total,pos,dimL));
  
end.
```
