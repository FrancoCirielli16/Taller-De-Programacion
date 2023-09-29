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
public class Ejercicio4 {
    public static void main(String[] args){
        Circulo C = new Circulo();
        C.setRadio(Lector.leerDouble());
        C.setLinea(Lector.leerString());
        C.setRelleno(Lector.leerString());
        System.out.println("Perimetro: " + C.calcularPerimetro());
        System.out.println("Area: " + C.calcularArea());
    }
}
