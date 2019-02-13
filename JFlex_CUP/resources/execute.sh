#! /bin/bash 
echo "STARTING JFLEX COMPILING"
java -jar ~/CUNOC/bin/jflex-1.6.1.jar -d ../src/jflex_cup/ AnalizadorLexico.flex

echo "STARTING CUP COMPILING"
java -jar ~/CUNOC/bin/java-cup-11b.jar parser.cup
mv parser.java ../src/jflex_cup/parser.java
mv sym.java ../src/jflex_cup/sym.java
