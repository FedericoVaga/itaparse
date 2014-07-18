all:
	flex scanner.l && gcc -c lex.yy.c && gcc main.c -lfl lex.yy.o -o ita
clean:
	rm *.o *.yy.c ita
