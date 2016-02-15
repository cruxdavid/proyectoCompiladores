


%%
%class Search
%standalone
%line
%column
%{
 int cualquiercosa = 0;
%}
digit = [0-9]
integer = ({digit}(_?{digit})*)
decimal = {integer}|({integer}.{digit}{digit})
date = {digit}{digit}"/"{digit}{digit}"/"{digit}{digit}{digit}{digit}
Nombre = [A-Z][a-z]+
WS = [ \t\f]
NC = {Nombre}{WS}{Nombre}{WS}{Nombre}{WS}{Nombre}|{Nombre}{WS}{Nombre}{WS}{Nombre}|{Nombre}{WS}{Nombre}|{Nombre}

%%
{NC}  {System.out.printf("\nNombre: %s\n ", yytext());}
{decimal}  {System.out.printf("Salario: %s\n ", yytext());}
{date}  {System.out.printf("Fecha: %s\n ", yytext());}

\n { /* do nothing */}
. { /* do nothing */}


