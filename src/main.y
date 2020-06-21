

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
int error = 1;
%}

%token CHAVEA CHAVEF COLCHETEA COLCHETEF NUMERO COMMA COLON STRING WORD EOL

%%

OBJETO:
      CHAVEA MEMBROS CHAVEF { error = 0;
                              return 0;
                            }
      ;

MEMBROS:
        MEMBRO
        | MEMBRO COMMA MEMBROS
        ;

MEMBRO:
      STRING COLON ELEMENTO
      | STRING COLON ELEMENTO EOL
      ;

ELEMENTO:
        VALOR
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
          ELEMENTO
          | ELEMENTO COMMA ELEMENTOS
          ;

%%

void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
    yyparse();

    if (error == 0){
      printf("VALIDO\n");
    }
    return 0;

}
