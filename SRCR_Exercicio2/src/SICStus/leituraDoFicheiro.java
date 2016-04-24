/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SICStus;

import se.sics.jasper.SICStus;
import se.sics.jasper.SPException;

/**
 *
 * @author Filipe Oliveira
 */
public class leituraDoFicheiro {

    //Método para carregar a script
    public static void carregaScript(String argv[]) throws SPException {
        SICStus sp = null;
        String myFile = "exercicio2.pl";

        try {
            sp = new SICStus(argv, null);
            sp.load(myFile);
            executaQuerie(sp);
        } catch (SPException e) {
            e.printStackTrace();
        }
    }

    private static void executaQuerie(SICStus sc) {

    }

    /*Limpa os espaços iniciais e finais de uma srtring*/
    private String limpaString(String str) {
        StringBuilder strAux = new StringBuilder(str);
        String res;

        for (int i = 0; i < strAux.length(); i++) {
            if (strAux.charAt(i) == ' ') {
                strAux.deleteCharAt(i);
            } else {
                break;
            }
        }

        for (int i = strAux.length() - 1; i > 0; i--) {
            if (strAux.charAt(i) == ' ' || strAux.charAt(i) == '.') {
                strAux.deleteCharAt(i);
            } else {
                break;
            }

        }
        res = strAux.toString();
        return res;

    }

}
