
%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *);

#include "y.tab.h"

%}

word [A-Za-z0-9]+
int ([0-9])+
float ([0-9]+[.][0-9]+)
string [\"]{word}[\"]
frase [\"]{word}[ \t]{word}[ \t]*{word}*[\"]

%%

{int} 	{ return NUMERO; }

{float} 	{ return NUMERO; }

"{" 	{ return CHAVEA; }

"}"	{ return CHAVEF; }

"[" 	{ return COLCHETEA; }

"]"	{ return COLCHETEF; }

[,]	{ return COMMA; }

{word} { return WORD; }

{string} { return STRING; }

{frase} { return STRING; }

\n { return EOL; }

[:] { return COLON; }

. ;

%%

int yywrap() {
  return 1;
}
