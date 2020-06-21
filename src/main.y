

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
int erro = 0;
%}

%token CHAVEA CHAVEF COLCHETEA COLCHETEF NUMERO COMMA WS COLON STRING WORD EOL

%%

OBJETO:
      CHAVEA MEMBROS CHAVEF {printf("VALIDO\n");}
      |
      ;

MEMBROS:
        MEMBRO
        | MEMBRO COMMA MEMBRO
        ;

MEMBRO:
      STRING WS COLON WS VALOR
      |
      ;

VALOR:
      OBJETO
      | ARRAY
      | STRING
      | NUMERO
      ;

ARRAY:
      COLCHETEA WS COLCHETEF
      | COLCHETEA ELEMENTOS COLCHETEF
      ;

ELEMENTOS:
          VALOR
          | VALOR COMMA VALOR
          ;

%%

void yyerror(char *s) {
  erro = 1;
  printf("INVALIDO\n");
}

int main() {
  yyparse();
    if (erro==0){
      printf("VALIDO\n");
      erro = 0;
    }

    return 0;

}
