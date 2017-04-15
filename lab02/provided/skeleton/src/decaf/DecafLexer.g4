lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';

ID  : /[a-zA-Z0-9_]+/;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|'\\''"'|~'\'') '\'';
STRING : '"' (ESC|~'"')* '"';

HEXA : '0x' [0-9a-fA-F]+;

fragment
ESC :  '\\' ('n'|'t'|'\\');
