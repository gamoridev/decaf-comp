parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program : TK_CLASS ID TK_LCURLY field_decl method_decl TK_RCURLY EOF;

field_decl : TK_VOID;

method_decl : 