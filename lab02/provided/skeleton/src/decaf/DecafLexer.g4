lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

//tokens
//{
//  TK_class
//}

LCURLY : '{';
RCURLY : '}';

TK_CLASS : 'class';

TK_IF : 'if';

TK_ELSE : 'else';

TK_INT : 'int';

TK_BOOLEAN : 'boolean';

TK_VOID : 'void';

TK_CALLOUT : 'callout';

TK_RETURN : 'return';

TK_FOR : 'for';

TK_BREAK : 'break';

TK_CONTINUE : 'continue';

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

WS_ : (' ' | '\n' | '\t') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

STRING : '"' (ESC | ~('"' | '\''))* '"';

CHAR : '\'' (ESC | ~('\'' | '"' | '\\' | '\t')) '\'';

fragment
ESC :  '\\' ('n' | 't' | '\\' | '"' | '\'');
