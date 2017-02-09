%{
#include"y.tab.h"
#include<ctype.h>	
#include<math.h>	
%}

NUMBER [0-9]+|([0-9]*"."[0-9]+)

%%
{NUMBER} {yylval.dval=atof(yytext);return NUMBER;}

sin|SIN {return SIN;}

cos|COS {return COS;}

tan|TAN {return TAN;}

sqrt|SQRT {return SQRT;}

square|SQUARE {return SQUARE;}

exp|EXP {return EXP;}

LOG { return LOG;}

[\t ]+ ;

\n|. {return yytext[0];};

%%


int yywrap(void) {
 return 1;
}
