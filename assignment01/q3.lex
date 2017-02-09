%option noyywrap

%{
extern FILE* yyin;
#include <stdio.h>
#include <stdlib.h>
%}

tag1 [A-Za-z \= \""]+
tag2 [/A-Za-z]+
letter [a-zA-Z]  
digit[0-9] 
func[A-Za-z\(]+
fn "main"|"print"

%%



{fn} printf("\n%s\t is a function",  yytext);

{digit}+("E"("+"|"-")?{digit}+)? printf("\n%s\tis real number",yytext);  

{digit}+"."{digit}+("E"("+"|"-")?{digit}+)? printf("\n%s\t is floating pt no ",yytext);


"for"|"while" printf("\n%s\t is a LOOP", yytext );

"int"|"INT"|"char"|"float"|"FLOAT" printf("\n%s\t is Data Type",yytext);  

"if" printf("\n%s\t is a Condition constructs", yytext);

"\a"|"\\n"|"\\b"|"\t"|"\\t"|"\b"|"\\a" printf("\n%s\tis Escape sequences",yytext);  

{letter}({letter}|{digit})* printf("\n%s\tis identifier",yytext);

"&&"|"<"|">"|"<="|">="|"="|"+"|"-"|"?"|"*"|"/"|"%"|"&"|"||" printf("\n%s\toperator ",yytext); 


";" printf("\n%s\t semicolon", yytext );

"{"|"}" printf("\n%s\t Curly Brackets", yytext );

"("|")" printf("\n%s\t Round Brackets", yytext );

"["|"]"|"#"|"'"|"."|"\""|"\\"|"," printf("\n%s\t is a special character",yytext);  

"%d"|"%s"|"%c"|"%f"|"%e" printf("\n%s\tis a format specifier",yytext);  
%%  



int main(void)
{
	yyin=fopen("test.c","r");
    yylex();
    fclose(yyin);  


    return 0;
}