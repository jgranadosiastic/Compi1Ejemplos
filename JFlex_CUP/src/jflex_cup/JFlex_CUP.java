/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jflex_cup;

import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jose
 */
public class JFlex_CUP {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String input = "25+35;25+8s5;12+544;";
        StringReader reader = new StringReader(input);

        AnalizadorLexico miLexer = new AnalizadorLexico(reader);
        parser miParser = new parser(miLexer);
        try {
            miParser.parse();
        } catch (Exception ex) {
            Logger.getLogger(JFlex_CUP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
