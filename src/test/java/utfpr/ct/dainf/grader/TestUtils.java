package utfpr.ct.dainf.grader;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Wilson
 */
public class TestUtils {
    public static double densidade(double x, double media, double desvio) {
        double d = 1.0 / (Math.sqrt(2 * Math.PI) * desvio) *
                    Math.exp(-0.5 * Math.pow((x - media) / desvio, 2));
        return d;
    }
}
