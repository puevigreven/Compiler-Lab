%{
#include <stdio.h>
#include <math.h>
#define PI 3.141592
int i,j;
void yyerror(char *);

%}

%union {double dval;}
%token <dval> NUMBER
%token SIN COS TAN SQUARE EXP SQRT
%left LOG
%left '+' '-'
%left '*' '/'
%right '^'
%nonassoc NEG
%type <dval> E


%%

SL 	: S '\n'
	| SL S '\n'
	;

S 	: E {printf("=%g\n",$1);}
	;

E 	: E '+' E {$$=$1+$3;}
	|E '-' E {$$=$1-$3;}
	|E '*' E {$$=$1*$3;}

	|E '/' E {
		if($3==0)
			{printf("Error! Divide by zero!!");
			$$ = 0;}
		else
			{$$=$1/$3;} 
			}

	|SIN '(' E ')' {$$=sin($3/180*PI);}

	|COS '(' E ')' {$$=cos($3/180*PI);}

	|TAN '(' E ')' { 
	if($3==90)
	{printf("Undefined (Infinity)");
	$$ = 0;}
	else
	$$=tan($3/180*PI);}

	|SQRT '(' E ')' {$$=sqrt($3);
	}

	|SQUARE '(' E ')' {$$=$3*$3;
	}
	|EXP '(' E ')' {$$=exp($3);
	}

	|'(' E ')' {$$=$2;}
	|'-' E %prec NEG {$$=-$2;
	}

	|LOG E {$$=log($2)/log(10);
	}

	|NUMBER
;
%%
extern FILE*yyin;

int main()
{
do{
yyparse();
}while(!feof(yyin));
}

void yyerror(char*a)
{
fprintf(stderr,"Parse error!");
}