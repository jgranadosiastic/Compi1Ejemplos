/* codigo de usuario */
package jflex_cup;

import java_cup.runtime.*;
import static jflex_cup.sym.*;


%% //separador de area

/* opciones y declaraciones de jflex */

%class AnalizadorLexico
%cup
%cupdebug
%line
%column

LineTerminator = \r|\n|\r\n

WhiteSpace = {LineTerminator} | [ \t\f]

/* identifiers */
Identifier = [:jletter:][:jletterdigit:]*

/* integer literals */
entero = 0 | [1-9][0-9]*


%{
  StringBuilder string = new StringBuilder();
  
  private Symbol symbol(int type) {
    return new Symbol(type, yyline+1, yycolumn+1);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline+1, yycolumn+1, value);
  }


  private void error(String message) {
    System.out.println("Error en linea line "+(yyline+1)+", columna "+(yycolumn+1)+" : "+message);
  }
%}

%% // separador de areas

/* reglas lexicas */
<YYINITIAL> {

	";"		{ return symbol(PCOMA); }

	{entero}	{ return symbol(ENTERO, new Integer(yytext()));}

	{Identifier}	{ return symbol(ID, yytext());}

	"="		{ return symbol(IGUAL);}

	"+"		{ return symbol(MAS);}

	"-"		{ return symbol(MENOS);}

	{WhiteSpace} 	{/* ignoramos */}

}

/* error fallback */
[^]                              {error("Simbolo invalido <"+ yytext()+">");}
<<EOF>>                 { return symbol(EOF); }