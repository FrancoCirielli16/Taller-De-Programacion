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
public class BalanzaComercial2 {
    private double monto;
    private int cant;
    private String resumen;

    public BalanzaComercial2() {
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
        this.resumen = "";
    }
    
    public void registrarProducto(Producto p, double precioPorKg){
         this.monto = precioPorKg*p.getPesoEnKg()+this.monto;
         this.cant++;
         this.resumen = this.resumen + p.getDescripcion() + " " + precioPorKg*p.getPesoEnKg() + " ";
    }
    
    public String getResumenDeCompra(){
        return this.resumen + "- Total a pagar " + getMonto() + " por la compra de " + getCant() + " productos.";
    }
}
