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
public class Ejercicio1 {
    public static void main(String[] args) {
        Triangulo T= new Triangulo(Lector.leerDouble(),Lector.leerDouble(),Lector.leerDouble(),Lector.leerString(),Lector.leerString());
        System.out.println("El area del trinagulo es: " + T.calcularArea());
        System.out.println("El perimetro del trinagulo es: " + T.calcularPerimetro());
    }
}
