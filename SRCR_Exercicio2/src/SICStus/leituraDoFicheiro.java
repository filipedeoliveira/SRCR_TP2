/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SICStus;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;
import java.util.StringTokenizer;
import se.sics.jasper.SICStus;
import se.sics.jasper.SPException;
import se.sics.jasper.SPQuery;
import se.sics.jasper.Term;

/**
 *
 * @author Filipe Oliveira
 */
public class leituraDoFicheiro {

    //Método para carregar a script
    public static void carregaScript(String argv[]) throws SPException {
        SICStus sp = null;
        String palha = null;
        String myFile = "exercicio2.pl";

        try {
            sp = new SICStus(argv, null);
            sp.load(myFile);
            leQuerie(sp, palha, palha);
        } catch (SPException e) {
            e.printStackTrace();
        }
    }

    public static void leQuerie(SICStus sc, String resposta, String linha) {

        String predicado;

        while (resposta.equals("Sim")) {
            StringTokenizer myToken = new StringTokenizer(resposta, "(");
            try {
                if (myToken.hasMoreTokens() && resposta.equals("Sim")) {
                    predicado = myToken.nextToken();
                    trataTokens(linha, predicado, sc, resposta);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    private static void trataTokens(String linha, String predicado, SICStus sp, String resposta) {
        ArrayList<String> perguntas = new ArrayList<>();
        ArrayList<String> argumentos = new ArrayList<>();
        ArrayList<String> aux;

        aux = myTokenizer(linha, predicado);
        for (String token : aux) {
            String tokenAtual = limpaString(token);
            if (Character.isUpperCase(tokenAtual.charAt(0))) {
                perguntas.add(tokenAtual);
            } else {
                argumentos.add(tokenAtual);
            }
        }
        executaQuery(sp, linha, resposta, argumentos, perguntas);
    }

    public static void executaQuery(SICStus sp, String linha, String resposta,
            ArrayList<String> arg, ArrayList<String> perg) {
        SPQuery qry;

        HashMap<String, Term> res = new HashMap<String, Term>();
        try {
            for (String str : arg) {
                res.put(str, sp.newTerm(str));
            }

            if (perg.size() > 0) {
                int i = 0;
                boolean readNext = true;
                String cont = null;

                qry = sp.openQuery(linha, res);

                while (readNext && qry.nextSolution()) {
                    for (String ax : perg) {
                        System.out.println(ax + " = " + res.get(ax) + "?");
                    }
                    System.out.println("Pretende a próxima solução? Seim -> \";\"" + "para mais resultados: ");
                    try{cont = resposta;}
                    catch(Exception e){
                        e.printStackTrace();
                        cont = "Não";
                    }
                    i=1;
                    if(!cont.equals(";")) readNext = false;
                    else i= 0;
                }
                if(i==0) System.out.println("Não");
                qry.close();  
            }
            else{
                boolean myRes = sp.query(linha, res);
                System.out.println(myRes + ""); 
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro a chamar o Sicstus ou localização da script.pl ");
        }

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
   /* public static void main(String[] argv) {

        ArrayList<String> res = new ArrayList<>();
        //res = sicstusTokenizer("carro(R,'ola','la')", "carro");
        res = myTokenizer("carro(R,'ola','la')", "carro");
        for (String s : res) {
            System.out.println(s);
        }

    }*/

}
