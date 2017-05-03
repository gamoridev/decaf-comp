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

STATEMENT : 'if'
| 'boolean'
| 'callout'
| 'class'
| 'else'
| 'int'
| 'return'
| 'void'
| 'for'
| 'break'
| 'continue';

BOOLEAN : 'false'| 'true';

ID  : ALPHA ([a-zA-Z0-9_]+)* | '_' ID  ;

ALPHA : [a-zA-Z];

// [a-zA-Z0-9_]+; | ALPHA ID | '_' ()* ID | ALPHA INT

INT : DIGIT+ ;

DIGIT : [0-9];

ARITH_OP : '+' | '-' | '*' | '/' | '%' | '>' | '<' | '>=' |  '<=' | '!=' | '=' | '&&' | '||';

TOKENS : ','
| ';'
| '[' | ']'
| '(' | ')';

HEXA :  '0x' [0-9a-fA-F]+;

HEXA_ERROR: '0x';

WS_ : (' ' | '\n') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

STRING : '"' (ESC|~('"'|'\''))* '"';

CHAR : '\'' (ESC|~('\''|'"'|'\\')) '\'';

fragment
ESC :  '\\' ('n'|'t'|'\\'|'"'|'\'');
