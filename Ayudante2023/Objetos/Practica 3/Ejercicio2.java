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
public class Ejercicio2 {
    public static void main(String[] args) {
        BalanzaComercial B1= new BalanzaComercial();
        B1.iniciarCompra();
        double peso = Lector.leerDouble();
        while (peso!=0){
            double precio = Lector.leerDouble();
            B1.registrarProducto(peso, precio);
            peso = Lector.leerDouble();
        }
        System.out.println(B1.getResumenDeCompra());
    }
}
