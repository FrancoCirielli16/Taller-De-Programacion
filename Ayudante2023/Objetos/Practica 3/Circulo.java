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
public class Circulo {
    private double radio;
    private String relleno;
    private String linea;

    public double getRadio() {
        return this.radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getRelleno() {
        return this.relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLinea() {
        return this.linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }

    public Circulo(double radio, String relleno, String linea) {
        this.radio = radio;
        this.relleno = relleno;
        this.linea = linea;
    }
    
    public Circulo(){
        
    }
    
    public double calcularArea(){
        return Math.PI*radio*radio;
    }
    
    public double calcularPerimetro(){
        return 2*radio*Math.PI;
    }
}
