/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author franc
 */
public class Entrenador {
    private String nombre;
    private double sueldoB;
    private int antiguedad;
    private int campeonatosG;

    public Entrenador(String nombre, double sueldoB, int antiguedad, int campeonatosG) {
        this.nombre = nombre;
        this.sueldoB = sueldoB;
        this.antiguedad = antiguedad;
        this.campeonatosG = campeonatosG;
    }

    public Entrenador(){
        
    }
    
    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoB() {
        return this.sueldoB;
    }

    public void setSueldoB(double sueldoB) {
        this.sueldoB = sueldoB;
    }

    public int getAntiguedad() {
        return this.antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getCampeonatosG() {
        return this.campeonatosG;
    }

    public void setCampeonatosG(int campeonatosG) {
        this.campeonatosG = campeonatosG;
    }
    
    public double efectividad(){
        return campeonatosG/antiguedad;
    }
    
    public double calcularSueldoACobrar(){
        double aux = sueldoB + ((sueldoB*0.1)*antiguedad);
        if ((campeonatosG>=1)&&(campeonatosG<=4)){
            return aux + 5000;
        }
        else{
            if ((campeonatosG>=5)&&(campeonatosG<=10)){
                return aux + 30000;
            }
            else{
                return aux + 50000;
            }
        }
    }
}
