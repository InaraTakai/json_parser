

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token CHAVEA CHAVEF COLCHETEA COLCHETEF NUMERO COMMA COLON STRING

%%

OBJETO:
      CHAVEA MEMBROS CHAVEF { printf("VALIDO\n");
                              return 0;}
      ;

MEMBROS:
        MEMBRO
        | MEMBRO COMMA MEMBROS
        ;

MEMBRO:
      STRING COLON VALOR
      ;

VALOR:
      OBJETO
      | ARRAY
      | STRING
      | NUMERO
      ;

ARRAY:
      COLCHETEA COLCHETEF
      | COLCHETEA ELEMENTOS COLCHETEF
      ;

ELEMENTOS:
          VALOR
          | VALOR COMMA ELEMENTOS
          ;

%%

void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
    yyparse();
    return 0;
}
