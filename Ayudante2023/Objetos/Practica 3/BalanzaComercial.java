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
public class BalanzaComercial {
    private double monto;
    private int cant;

    public BalanzaComercial() {
    }
    
    

    public double getMonto() {
        return this.monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getCant() {
        return this.cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }
    
    public void iniciarCompra(){
        this.monto = 0;
        this.cant = 0;
    }
    
    public void registrarProducto(double pesoEnKg, double precioPorKg){
         setMonto(precioPorKg*pesoEnKg+getMonto());
         setCant(getCant()+1);
    }
    
    public String getResumenDeCompra(){
        return "Total a pagar " + getMonto() + " por la compra de " + getCant() + " productos.";
    }
}
