%option noyywrap
%{

#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
%}

%%
[A-Za-z ]+	{	printf("TEXTO RECIBIDO en el lexer: %s\n",yytext);	return TEXT;}
%%

