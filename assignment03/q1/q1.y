%{
        #include <stdio.h>
        #include  <stdlib.h>
        int yylex(void);
        int yyerror(char *msg);
%}

%token A B C NL

%%
stmt : s NL {printf("Valid Identifier.\n");	
			exit(0);}

s : A s
  | B s
  | A C
  | B C
  |
  ;
%%

int yyerror(char *msg){
	printf("Invalid Identifier.\n");
	exit(0);
}

int main(){
	printf("Enter the String:\n");
	yyparse();
	return 0;
}