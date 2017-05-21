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

field : (ID | ID TK_LSB INT TK_RSB);

method_decl : (type | TK_VOID) ID params block;

params : TK_LPAREN (|type ID (TK_COMMA type ID)*) TK_RPAREN;

block : TK_LCURLY (var_decla)* (statment)* TK_RCURLY;

var_decla : type ID (TK_COMMA type ID)* TK_SEMICOLON;

statment: location assign_op expr;

location : ID | ID TK_LSB expr TK_RSB;

assign_op : ASSIGN | PLUS_ASSIGN | MINUS_ASSIGN;

expr : location | method_call | literal;

method_call : method_name TK_LPAREN (expr (TK_COMMA expr)*)* TK_RPAREN
              | TK_CALLOUT TK_LPAREN STRING (TK_COMA callout_arg)* TK_RPAREN;

callout_arg : expr | STRING;

literal : INT | CHAR | BOOLEAN;

type : (TK_BOOLEAN|TK_INT) ;
