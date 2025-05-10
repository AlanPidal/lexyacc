%option noyywrap
%{

#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
%}

%%

[0-9]+(\.[0-9]+)?	{
printf("NÚMERO RECONOCIDO en lexer: %s\n",yytext);
yylval.num = atof(yytext);
return NUMBER;

}

[A-Za-z ]+	{	

printf("TEXTO RECIBIDO en el lexer: %s\n",yytext);	
yylval.str=strdup(yytext);
return TEXT;

}
			

%%

