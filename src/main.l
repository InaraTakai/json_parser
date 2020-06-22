
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);

#include "y.tab.h"

%}

word [A-Za-z0-9]+
int ([0-9])+
float ([0-9]+[.][0-9]+)
string [\"]{word}([ \t]{word})*[\"]

%%

{int} 	{ return NUMERO; }

{float} 	{ return NUMERO; }

"{" 	{ return CHAVEA; }

"}"	{ return CHAVEF; }

"[" 	{ return COLCHETEA; }

"]"	{ return COLCHETEF; }

[,]	{ return COMMA; }

{string} { return STRING; }

[:] { return COLON; }

. ;

[\n] ;

%%

int yywrap() {
  return 1;
}
