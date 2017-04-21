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


ID  : ALPHA ([a-zA-Z0-9_]+)* | '_' ID ;

ALPHA : [a-zA-Z];

// [a-zA-Z0-9_]+; | ALPHA ID | '_' ()* ID | ALPHA INT

INT : DIGIT+;

DIGIT : [0-9];

STATEMENT : 'if' | 'for' | 'return' | 'break;' | 'continue;';

ARITH_OP : '+' | '-' | '*' | '/' | '%';

HEXA : '0x' [0-9a-fA-F]+;

WS_ : (' ' | '\n') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|~('\''|'"'|'\\'|'\t')) '\'';
STRING : '"' (ESC|~'"')* '"';


fragment
ESC :  '\\' ('n'|'\\');
