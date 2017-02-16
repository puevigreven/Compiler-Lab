%{
#include<stdio.h>  
#include<stdlib.h>
extern FILE *yyin;
%}
%token WHILE ob op var cb nu co cc cn comp sp sc dec IF ELSE
%%

line:WHILE ob rp cb co a cc {printf("\n correct\n");}
   | IF ob rp cb co WHILE ob rp cb co IF ob rp cb co a cc a cc a cc {printf("\n correct\n");}
   | WHILE ob rp cb co IF ob rp cb co a cc a cc {printf("\n correct\n");}
   | IF ob rp cb co WHILE ob rp cb co a cc cc  {printf("\n correct\n");}
   | IF ob rp cb co a cc WHILE ob rp cb co a cc {printf("\n correct\n");}
   | IF ob rp cb co a cc {printf("\n correct\n");}
   | IF ob rp cb co a cc ELSE ob rp cb co a cc {printf("\n correct\n");}
   ; 
a:var
   |nu
   |var nu
   |a a
   |dec sp vrb sc
   |
   ;
vrb:var nu
   |var
   ;
rp:ob vrb op a cb
   |rp comp rp
   |var op nu
   |vrb op vrb
   |vrb op nu
   ;
%%
int main()
{
yyin=fopen("input_file","r+");
yyparse();  
yylex();  
}
int yywrap()
{
return 1;
}
int yyerror()
{
return 1;
}