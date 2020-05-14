%{
#include <stdio.h>
#include <string.h>
%}

A [a-zA-Z0-9] 
B [-_.]
AB {B}*{A}+

%%

(({A}+{AB}*)@({A}+{AB}*)) { printf("%s\n", yytext); }

(({A}+{AB}*)@({A}+{AB}*)[.]) { *(yytext + yyleng - 1) = '\0' ; printf("%s\n", yytext); }

{A}+;
{B}+;

[[:space:]]+ ;
[[:^space:]]+ ;
[.\n]* ;

%%

int main() {
  yylex();
  return 0;
}
