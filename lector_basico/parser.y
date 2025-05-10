%{
#include<stdio.h>
int yylex(void);
void yyerror(const char *s);
extern FILE *yyin;
%}

%token TEXT

%%
text:	TEXT {	printf("Texto reconocido desde el parser\n");	}
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
