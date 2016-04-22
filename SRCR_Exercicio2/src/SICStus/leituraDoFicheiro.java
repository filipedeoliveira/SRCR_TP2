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

    //Load SICStus script.pl
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

    //Initalize SICStus virtual machine Não sei para que serve 
    public static void iniciaSICStus() throws SPException {
        SICStus sp;
        sp = new SICStus();

    }

}
