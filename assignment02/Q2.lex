%option noyywrap
extern FILE* yyin;

%{
#include <stdio.h>
#include <string.h>
const char tag[20];
char sym_table[300][2][20];
int i = 0;
%}

%%

"Verb"|"Adverb"|"Preposition"|"Conjunction"|"Adjective"|"Pronoun"|"Noun" {strcpy(tag , yytext);} 
[a-zA-Z]* {
  strcpy(sym_table[i][0], yytext);
  strcpy(sym_table[i][1], tag);
  i++;
}

%%

int main()
{
yyin=fopen("test.txt","r");
yylex();

int k = 0;
// for (k = 0; k < i; k++) {
//         printf("%s  = %s", sym_table[k][0],sym_table[k][1]);
//         printf("\n");
//         }
    
char *p;
char *aux = strdup(" I am man, Adele says hello from the other side");

for (p = strtok(aux, " "); p; p = strtok(NULL, " ")){
      int check = -1;
      for (k = 0; k < i; k++) {
          check = strcmp ( p, sym_table[k][0] ) ;
          if(check == 0){
              printf("%s  = %s \n", sym_table[k][0],sym_table[k][1]);
              break;
          }
         }
         if(check!=0){
                printf("%s - No Match Found\n",p );

         }
    }
printf(" Done\n");
return 0;

}
