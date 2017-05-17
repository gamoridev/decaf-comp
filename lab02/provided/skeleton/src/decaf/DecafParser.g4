parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program : TK_CLASS ID TK_LCURLY (field_decl)* (method_decl)* TK_RCURLY EOF;

field_decl : field (TK_COMMA field)*;

field : (ID | ID TK_LSB INT TK_LSB INT TK_RSB);

method_decl : ((type|TK_VOID) ID TK_LPAREN TK_RPAREN block)+;

block : TK_LCURLY (var_decla)* (statment)* TK_RCURLY;

var_decla : TK_INT TK_INT TK_INT ;

statment: TK_INT TK_INT TK_INT ;

type : (TK_BOOLEAN|TK_INT) ;
