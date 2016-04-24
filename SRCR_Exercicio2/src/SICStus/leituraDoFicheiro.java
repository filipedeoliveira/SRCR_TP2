/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SICStus;

import java.util.ArrayList;
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

    /*Tratamento do input do utilizador, separa os campos do inPut*/
    private static ArrayList<String> myTokenizer(String inPut, String predicado) {

        StringBuilder str = new StringBuilder();
        ArrayList<String> res = new ArrayList<>();
        int i = predicado.length() + 1;
        
        while (i < inPut.length()) {
            if (inPut.charAt(i) == ',') {
                res.add(str.toString());
                str = new StringBuilder();

            } else if (inPut.charAt(i) == '(' || inPut.charAt(i) == '[') {
                str.append(inPut.charAt(i));
                i++;
                while (i < inPut.length() && inPut.charAt(i) != ')' && inPut.charAt(i) != ']') {
                    str.append(inPut.charAt(i));
                    i++;
                }
                if (i < inPut.length()) {
                    str.append(inPut.charAt(i));
                }
            } else if (inPut.charAt(i) == ')') {
                res.add(str.toString());
            } else {
                str.append(inPut.charAt(i));
            }
            i++;
        }

        return res;
    }


    /*Limpa os espaços iniciais e finais de uma srtring*/
    private static String limpaString(String str) {
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

////////////////Só para testar algumas funções
    public static void main(String[] argv) {

        ArrayList<String> res = new ArrayList<>();
        //res = sicstusTokenizer("carro(R,'ola','la')", "carro");
        res = myTokenizer("carro(R,'ola','la')", "carro");
        for (String s : res) {
            System.out.println(s);
        }

    }

}
