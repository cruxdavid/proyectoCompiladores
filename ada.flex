


%%
%class Search
%standalone
%line
%column
%{
 int cualquiercosa = 0;
%}
%%
[0-9]+ {cualquiercosa++; System.out.printf("-> found number: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
\n { /* do nothing */}
. { /* do nothing */}
<<EOF>> {System.out.println("Found "+cualquiercosa+" numbers."); return 0;}

