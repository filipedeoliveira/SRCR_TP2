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

    //Método para ler input do utilizador

    
}
