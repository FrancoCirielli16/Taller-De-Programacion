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
public class Ejercicio3 {
    public static void main(String[] args) {
        Entrenador E= new Entrenador(Lector.leerString(), Lector.leerDouble(), Lector.leerInt(), Lector.leerInt());
        System.out.println("Sueldo a cobrar: " + E.calcularSueldoACobrar());
        System.out.println("Efectividad: " + E.efectividad());
    }
}
