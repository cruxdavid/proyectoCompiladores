


%%
%class Search
%standalone
%line
%column
%%
[0-9] {System.out.printf("*** found match [%s] at l%d, c%d\n ", yytext(), yyline, yycolumn);}
\n { /* do nothing */}
. { /* do nothing */}

