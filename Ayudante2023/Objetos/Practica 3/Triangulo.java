/*

1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
El triángulo debe saber:

- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el área y devolverla (método calcularArea)
- Calcular el perímetro y devolverlo (método calcularPerimetro)


B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
los lados y s =
a+b+c

. La función raíz cuadrada es Math.sqrt(#)
 */
package tema3;

/**
 *
 * @author franc
 */
public class Triangulo {
       private double lado1;
       private double lado2;
       private double lado3;
       private String relleno;
       private String lineas;

    public Triangulo(double lado1, double lado2, double lado3, String relleno, String lineas) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.relleno = relleno;
        this.lineas = lineas;
    }
    
    public Triangulo(){}
       
    public double getLado1() {
        return this.lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return this.lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return this.lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getRelleno() {
        return this.relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLineas() {
        return this.lineas;
    }

    public void setLineas(String lineas) {
        this.lineas = lineas;
    }

    public double calcularPerimetro(){
        return lado1+lado2+lado3;
    }
    
    public double calcularArea(){
        double s = calcularPerimetro()/2;
        return Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
    }
}
