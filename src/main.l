
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

word [A-Za-z0-9]+
int ([0-9])+
string [\"]{word}[\"]


%%

{int} 	{ return NUMERO; }

"{" 	{ return CHAVEA; }

"}"	{ return CHAVEF; }

"[" 	{ return COLCHETEA; }

"]"	{ return COLCHETEF; }

[,]	{ return COMMA; }

{word} { return WORD; }

{string} { return STRING; }

[\n] { return EOL; }

[:] { return COLON; }

[[:space:]]+ { return WS; }

. ;

%%

int yywrap() {
  return 1;
}
