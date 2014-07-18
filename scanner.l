/*
 * This is an experiment
 */ 

/* Definitions */
%{
#include "scanner-adhoc.h"

int c_char = 0, c_word = 0, c_num = 0, c_gen_word = 0;

char *tkn_yytext;
%}

%option noyywrap

/* rules */
%%
[a-zA-Z]+            {
	int i;
	char *c;

	c_gen_word++;
	c_char+=yyleng;
	tkn_yytext = yytext;
	
	for (i = 0; i < yyleng; ++i) {
		c = yytext + i;
		if (*c == 'j' || *c == 'J' || *c == 'k' || *c == 'K')
			break;
		if (*c == 'x' || *c == 'X' || *c == 'y' || *c == 'Y')
			break;
		if (*c == 'w' || *c == 'W')
			break;
	}

	/*
	 * After I discovered the kind of word, return. Thus, I can do 
	 * smart things on the main program ... bisoning or, for time
	 * being print something
	 */
	if (i == yyleng) {
		c_word++;
		return ITA;
	} else {
		return GEN;
	}
}

[0-9]+               {c_num++;}

.|\n {/* discard everything else*/}

%%
 

/* My code */
void print_counters()
{
printf("Found %d words (%d compatible with italian alphabet), %d numbers, %d characters\n",
c_gen_word, c_word, c_num, c_char);
}

char *get_last_yytext()
{
	return tkn_yytext;
}
