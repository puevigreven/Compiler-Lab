%{

#include "y.tab.h"
%}

%%
[a-zA-Z]+ {return A;}
[_] {return B;}
[0-9]+ {return C;}
[\n] {return NL;}
. {return yytext[0];}
%%

int yywrap(void) {
 return 1;
}