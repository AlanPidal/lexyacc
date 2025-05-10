%{
#include<stdio.h>
int yylex(void);
void yyerror(const char *s);
extern FILE *yyin;
%}


%union{
	char *str;
	float num;
}
%token <str> TEXT
%token <num> NUMBER

%%
texts:	
	| texts TEXT	{	printf("Texto reconocido desde el parser: %s\n",$2);	}
	| texts NUMBER	{	printf("Número reconocido en el parser: %f\n", $2);	}
	;
%%


int main(int argc, char *argv[]){
	if(argc>1){
		yyin=fopen(argv[1],"r");
		if(!yyin){
			perror("Error al abrir el archivo");
			return 1;
		}
	}
	printf("Experimento de compilador\n");
	yyparse();
	return 0;
}
void yyerror(const char *s){
	fprintf(stderr,"%s\n",s);
}
