%option noyywrap

%{
extern FILE* yyin;
#include <stdio.h>
#include <stdlib.h>
%}

tag1 [A-Za-z \= \""]+
tag2 [/A-Za-z]+

%%
\<{tag1}\> {
			char text[100];
			strcpy(text, yytext);
			printf("tag1 - ");
			for (int i = 1; text[i]!= '>'; ++i)
			{	if(text[i]==' '){
				printf("\n attribute = ");

			}if (text[i]=='=')
			{
				printf("\n value- ");
			}

				printf("%c", text[i]);
			}
			printf("\n");
			} 



\<{tag2}\> {
			char text[100];
			strcpy(text, yytext);
			printf("\n");

			printf("tag2 - ");
			for (int i = 2; text[i]!= '>'; ++i)
			{
				printf("%c", text[i]);
			}
			}

[A-Za-z]+ {printf("\ncontent - ");
	printf("%s", yytext );}
%%


int main(void)
{
	yyin=fopen("test.html","r");
    yylex();

    return 0;
}