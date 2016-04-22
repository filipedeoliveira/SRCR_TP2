/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SICStus;

import static SICStus.leituraDoFicheiro.carregaScript;
import se.sics.jasper.SICStus;
import se.sics.jasper.SPException;

/**
 *
 * @author Filipe Oliveira
 */
public class Main_SRCR_Exercicio2 {

    public static void main(String[] argv) throws SPException {

        try {
            carregaScript(argv);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Fallha ao carregar o ficheiro! ");
        }
    }

}
