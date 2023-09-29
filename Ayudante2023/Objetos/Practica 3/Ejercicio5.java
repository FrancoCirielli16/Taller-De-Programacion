/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author franc
 */
public class Ejercicio5 {
    public static void main(String[] args) {
        BalanzaComercial2 B2= new BalanzaComercial2();
        B2.iniciarCompra();
        Producto p = new Producto();
        p.setPesoEnKg(Lector.leerDouble());
        p.setDescripcion(Lector.leerString());
        while (p.getPesoEnKg()!=0){
            double precio = Lector.leerDouble();
            B2.registrarProducto(p, precio);
            p.setPesoEnKg(Lector.leerDouble());
            if (p.getPesoEnKg()!=0){
                p.setDescripcion(Lector.leerString());
            }
        }
        System.out.println(B2.getResumenDeCompra());
    }
}
