#include <stdlib.h>
#include <stdio.h>
#include "scanner-adhoc.h"

int main (int argc, char *argv[])
{
	int r;
	printf("Ok, let's start!\n");
	
	while ((r = yylex()) != 0) {
		switch (r) {
		case ITA:
			printf("The word \"%s\" is compatible with italian alphabet\n", get_last_yytext());
			break;
		case GEN:
			printf("The word \"%s\" is not compatible with italian alphabet\n", get_last_yytext());
			break;
		}
	}
	
	print_counters();
	
	return 0;
}
