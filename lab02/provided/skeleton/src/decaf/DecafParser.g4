parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program : TK_CLASS TK_PROGRAM TK_LCURLY (field_decl)*  (method_decl)* TK_RCURLY;

field_decl : field (TK_COMMA field)*;

field : (ID | ID TK_LSB int_literal TK_RSB);

method_decl : (type | TK_VOID) ID params block;

block : TK_LCURLY (var_decla)* (statment)* TK_RCURLY;

params : TK_LPAREN (|type ID (TK_COMMA type ID)*) TK_RPAREN;

var_decla : type ID (TK_COMMA type ID)* TK_SEMICOLON;

type : (TK_BOOLEAN|TK_INT) ;

statment: location assign_op expr 
  | method_call 
  | TK_IF TK_LPAREN expr TK_RPAREN block | TK_IF TK_LPAREN expr TK_RPAREN block (TK_ELSE block) 
  | TK_FOR TK_LPAREN ID ASSIGN expr TK_SEMICOLON expr TK_SEMICOLON  block TK_RPAREN
  | TK_RETURN (|expr)
  | TK_BREAK
  | TK_CONTINUE
  | block;

assign_op : ASSIGN | PLUS_ASSIGN | MINUS_ASSIGN;

method_call : method_name TK_LPAREN (expr (TK_COMMA expr)*)* TK_RPAREN
              | TK_CALLOUT TK_LPAREN STRING (TK_COMMA callout_arg)* TK_RPAREN;

method_name : ID;

location : ID | ID TK_LSB expr TK_RSB;

expr : location
 | method_call
 | literal 
 | expr bin_op expr
 | ARITH_OP expr 
 | EXCLAMATION_POINT expr 
 | TK_LPAREN expr TK_RPAREN ;

callout_arg : expr | STRING;

bin_op : ARITH_OP
| REL_OP
| EQ_OP
| COND_OP;

literal : int_literal | CHAR | BOOLEAN;

int_literal : HEXA | INT;




