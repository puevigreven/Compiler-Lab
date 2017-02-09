%option noyywrap
extern FILE* yyin;

%{
#include <stdio.h>
#include <string.h>
int parenthesis=0;
int numberOfOperands=0;
int valid=1;
int up=-1;
int l=0;
int j=0;
char operands[10][10];
char operators[10][10];
char a[100];
%}

%%

")" {if (a[up]!='(') { valid=0; 
          return 0;
        }
         else
            up--;
    }
"}" {if (a[up]!='{')
      { valid=0; 
        return 0;
      }else
        up--;
    }
"]" {if (a[up]!='[')
      { valid=0; 
        return 0;
      }
         else
            up--;
    }
"+"|"-"|"*"|"/" {parenthesis++;
                strcpy(operators[l],yytext);
                l++;}

[-0-9]+|[+-]?[a-zA-Z][a-zA-Z0-9_]* {numberOfOperands++;
                              strcpy(operands[j],yytext);
                              j++;}


"(" {up++;
    a[up]='(';
  }
"{" {up++;
    a[up]='{';
  }
"[" {up++;
    a[up]='[';
  }
%%

int main()
{
int k;
printf("Please type the arithmetic expression: ");
yylex();

if(valid==1  && (numberOfOperands-parenthesis)==1 && up==-1)
{
  printf("\nValid\n");

printf("********************\n");
printf("The operators are\n");
for(k=0;k<l;k++)
  printf("%s \n",operators[k]);

printf("********************\n");
printf("the operands are\n");
for(k=0;k<j;k++)
  printf("%s \n",operands[k]);
}
else{
printf("********************\n");
printf("the expression is invalid\n");
printf("********************\n");

}
}
