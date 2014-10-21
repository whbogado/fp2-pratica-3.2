/**
 * IF62C Fundamentos de Programação 2
 * Exercício de programação em Java.
 * @author Wilson Horstmeyer Bogado <wilson@utfpr.edu.br>
 */
public class Pratica32 {
    public static void main(String[] args) {
        double d = densidade(-1, 67, 3);
        System.out.println("Densidade no ponto: " + d);
    }
    
    public static double densidade(double x, double media, double desvio) {
        double d = 1.0 / (Math.sqrt(2 * Math.PI) * desvio) *
                    Math.exp(-0.5 * Math.pow((x - media) / desvio, 2));
        return d;
    }
}
