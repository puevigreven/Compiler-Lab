%{  
#include <stdlib.h>
#include "y.tab.h"
%} 

%%
"while" {return WHILE;}
"if" {return IF;}
"else" {return ELSE;}
"(" {return ob;}
")" {return cb;}
" " {return sp;}
";" {return sc;}
"int"|"char"|"float" {return dec;}
"&&"|"||" {return comp;}
[a-z]+ {return var;}
[0-9]+ {return nu;}
">"|"<"|">="|"<="|"="|"!=" {return op;}
"{" {return co;}
"}" {return cc;}
%%
