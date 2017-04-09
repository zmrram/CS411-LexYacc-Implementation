%{
#include <stdio.h>
#include <stdlib.h>
%}

%start PROGRAM
%token _void _id _leftparen _rightparen _leftbrace _rightbrace _leftbracket _rightbracket _semicolon _boolean _double _int _string _class _implements _interface
%token _if _else _break _extends _for _newarray _println _readln _return _while _comma _period _intconstant _doubleconstant _stringconstant _booleanconstant 
%left _assignop
%left _or
%left _and
%left _equal _notequal
%left _less _lessequal _greater _greaterequal
%left _plus _minus
%left _multiplication _division _mod
%right _not
%left _leftbracket _rightbracket _period
%nonassoc "then"
%nonassoc _else

%%

PROGRAM : DECLS { printf("[reduce 1]\n"); }
	;

DECLS : DECL        
	  | DECLS DECL  
	  ;

DECL : VARIABLEDECL  { printf("[reduce 2]\n"); }
	 | FUNCTIONDECL  { printf("[reduce 3]\n"); }
	 | CLASSDECL     { printf("[reduce 4]\n"); }
	 | INTERFACEDECL { printf("[reduce 5]\n"); }
	 ;

VARIABLEDECLS : 	        
	 | VARIABLEDECLS VARIABLEDECL 
	 ;

VARIABLEDECL : VARIABLE _semicolon { printf("[reduce 6]\n"); }
	 ;

VARIABLE : TYPE _id { printf("[reduce 7]\n"); }
	 ;

TYPE : _int         { printf("[reduce 8]\n"); }
	 | _double      { printf("[reduce 9]\n"); }
	 | _boolean     { printf("[reduce 10]\n"); }
	 | _string      { printf("[reduce 11]\n"); }
	 | TYPE _leftbracket _rightbracket  { printf("[reduce 12]\n"); }
	 | _id          { printf("[reduce 13]\n"); }
	 ;

FUNCTIONDECL : TYPE _id _leftparen FORMALS _rightparen STMTBLOCK { printf("[reduce 14]\n"); }
	 | _void _id _leftparen FORMALS _rightparen STMTBLOCK     { printf("[reduce 15]\n"); }   
	 ;

FORMALS : VARIABLES     { printf("[reduce 16]\n"); }
	 | /* Epsilon */   { printf("[reduce 17]\n"); }
	 ;

/* Left-recursion */
VARIABLES : VARIABLE             
	 | VARIABLES _comma VARIABLE 
	 ;

CLASSDECL : _class _id EXTENDS IMPLEMENTS _leftbrace FIELDS _rightbrace { printf("[reduce 18]\n"); }
     ;

EXTENDS: /* Epsilon */  
     | _extends _id 
	 ;

IMPLEMENTS: /* Epsilon */   
     | _implements IDS  
     ;

FIELDS : /* Epsilon */ 
	 | FIELDS FIELD 
	 ;

FIELD : VARIABLEDECL { printf("[reduce 19]\n"); }
	 | FUNCTIONDECL { printf("[reduce 20]\n"); }
	 ;

IDS : _id               
	| IDS _comma _id    
	;

INTERFACEDECL : _interface _id _leftbrace PROTOTYPES _rightbrace { printf("[reduce 21]\n"); }
	 ;

PROTOTYPES : /* Epsilon */      
	 | PROTOTYPES PROTOTYPE 
	 ;

PROTOTYPE : TYPE _id _leftparen FORMALS _rightparen _semicolon { printf("[reduce 22]\n"); }
	 | _void _id _leftparen FORMALS _rightparen _semicolon     { printf("[reduce 23]\n"); }
	 ;

STMTBLOCK : _leftbrace VARIABLEDECLS STMTS _rightbrace { printf("[reduce 24]\n"); }
	 ;

STMTS : /* Epsilon */ 
	 | STMTS STMT  
	 ;

STMT : EXPRA _semicolon { printf("[reduce 25]\n"); }
	 | IFSTMT           { printf("[reduce 26]\n"); }
	 | WHILESTMT        { printf("[reduce 27]\n"); }
	 | FORSTMT          { printf("[reduce 28]\n"); }
	 | BREAKSTMT        { printf("[reduce 29]\n"); }
	 | RETURNSTMT       { printf("[reduce 30]\n"); }
	 | PRINTSTMT        { printf("[reduce 31]\n"); }
	 | STMTBLOCK        { printf("[reduce 32]\n"); }
	 ;

EXPRA : /* Epsilon */ 
     | EXPR        
     ;

IFSTMT : _if _leftparen EXPR _rightparen STMT %prec "then" { printf("[reduce 33]\n"); }
	 | _if _leftparen EXPR _rightparen STMT _else STMT     { printf("[reduce 34\n"); }
     ;

WHILESTMT : _while _leftparen EXPR _rightparen STMT { printf("[reduce 35]\n"); }
	 ;

FORSTMT : _for _leftparen EXPRA _semicolon EXPR _semicolon EXPRA _rightparen STMT { printf("[reduce 36]\n"); }
	 ;

BREAKSTMT : _break _semicolon { printf("[reduce 37]\n"); }
	 ;

RETURNSTMT : _return EXPRA _semicolon { printf("[reduce 38]\n"); }
	 ;

PRINTSTMT : _println _leftparen EXPRS _rightparen _semicolon { printf("[reduce 39]\n"); }
	 ;

EXPRS : EXPR             
	 | EXPRS _comma EXPR 
	 ;	 

EXPR : LVALUE _assignop EXPR { printf("[reduce 40]\n"); }
	 | CONSTANT              { printf("[reduce 41]\n"); }
	 | LVALUE               { printf("[reduce 42]\n"); }
	 | CALL                 { printf("[reduce 43]\n"); }
	 | _leftparen EXPR _rightparen { printf("[reduce 44]\n"); }
	 | EXPR _plus EXPR             { printf("[reduce 45]\n"); }
	 | EXPR _minus EXPR            { printf("[reduce 46]\n"); }
	 | EXPR _multiplication EXPR   { printf("[reduce 47]\n"); }
	 | EXPR _division EXPR         { printf("[reduce 48]\n"); }
	 | EXPR _mod EXPR              { printf("[reduce 49]\n"); }
	 | _minus EXPR  %prec _multiplication  { printf("[reduce 50]\n"); }
	 | EXPR _less  EXPR                   { printf("[reduce 51]\n"); }
	 | EXPR _lessequal EXPR               { printf("[reduce 52]\n"); }
	 | EXPR _greater EXPR                 { printf("[reduce 53]\n"); }
	 | EXPR _greaterequal EXPR            { printf("[reduce 54]\n"); }
	 | EXPR _equal EXPR                   { printf("[reduce 55]\n"); }
	 | EXPR _notequal EXPR                     { printf("[reduce 56]\n"); } 
	 | EXPR _and EXPR                     { printf("[reduce 57]\n"); }
	 | EXPR _or EXPR                      { printf("[reduce 58]\n"); }
	 | _not EXPR                          { printf("[reduce 59]\n"); }
	 | _readln"()"                        { printf("[reduce 60]\n"); }
	 | _newarray _leftparen _intconstant _comma TYPE _rightparen { printf("[reduce 61]\n"); }
	 ;

 
/*Shift-Reduce */
LVALUE : _id LVALUES { printf("[reduce 62]\n"); }
	 ;

LVALUES : /* Epsilon */ 
	 	| LVALUE _leftbracket EXPR _rightbracket  
	 	| LVALUE _period _id LVALUES                       
	 	;

CALL : _id _leftparen ACTUALS _rightparen            { printf("[reduce 63]\n"); } 
	 | _id _period _id _leftparen ACTUALS _rightparen { printf("[reduce 64]\n"); }
	 ;

ACTUALS : /* Epsilon */ { printf("[reduce 65]\n"); }
	 | EXPRS            { printf("[reduce 66]\n"); }
	 ;
	 
CONSTANT : _intconstant { printf("[reduce 67]\n"); }
	 | _doubleconstant  { printf("[reduce 68]\n"); }
	 | _stringconstant  { printf("[reduce 69]\n"); }
	 | _booleanconstant { printf("[reduce 70]\n"); }
	 ;
%%

int main(){

    yyparse();
    return 0;
}

void yyerror (char *s) {fprintf(stderr, "%s\n", s);}

int yywrap (void) {return 1;}