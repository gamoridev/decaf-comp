parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program : TK_CLASS ID LCURLY field_decl RCURLY EOF;

field_decl : ID;