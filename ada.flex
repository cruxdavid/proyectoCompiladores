import java_cup.runtime.*;
import java.util.HashMap;
import java.util.Map;
%%
%class Search
%standalone
%line
%column
%{
 int cualquiercosa = 0;
 public static final Map<String, String> keywords = new HashMap<String, String>(){{
				put("ABORT", "ABORT");
                put("ABS", "ABS");
				put("ABSTRACT", "ABSTRACT");
                put("ACCEPT", "ACCEPT");
                put("ACCESS", "ACCESS");
		        put("ALIASED", "ALIASED");
                put("ALL", "ALL");
                put("AND", "AND");
                put("ARRAY", "ARRAY");
                put("AT", "AT");
                put("BEGIN", "BEGIN");
                put("BODY", "BODY");
                put("CASE", "CASE");
                put("CONSTANT", "CONSTANT");
                put("DECLARE", "DECLARE");
                put("DELAY", "DELAY");
                put("DELTA", "DELTA");
                put("DIGITS", "DIGITS");
                put("DO", "DO");
                put("ELSE", "ELSE");
                put("ELSIF", "ELSIF");
                put("END", "END");
                put("ENTRY", "ENTRY");
                put("EXCEPTION", "EXCEPTION");
                put("EXIT", "EXIT");
                put("FOR", "FOR");
                put("FUNCTION",  "FUNCTION");
                put("GENERIC", "GENERIC");
                put("GOTO", "GOTO");
                put("IF", "IF");
                put("IN", "IN");
                put("IS", "IS");
                put("LIMITED", "LIMITED");
                put("LOOP", "LOOP");
                put("MOD", "MOD");
                put("NEW", "NEW");
                put("NOT", "NOT");
                put("NULL", "NULL");
                put("OF", "OF");
                put("OR", "OR");
                put("OTHERS", "OTHERS");
                put("OUT", "OUT");
                put("PACKAGE", "PACKAGE");
                put("PRAGMA","PRAGMA");
                put("PRIVATE", "PRIVATE");
                put("PROCEDURE", "PROCEDURE");
				put("PROTECTED", "PROTECTED");
                put("RAISE", "RAISE");
                put("RANGE", "RANGE");
                put("RECORD", "RECORD");
                put("REM", "REM");
                put("RENAMES", "RENAMES");
				put("REQUEUE", "REQUEUE");
                put("RETURN", "RETURN");
                put("REVERSE", "REVERSE");
                put("SELECT", "SELECT");
                put("SEPARATE", "SEPARATE");
                put("SUBTYPE", "SUBTYPE");
				put("TAGGED", "TAGGED");
                put("TASK", "TASK");
                put("TERMINATE", "TERMINATE");
                put("THEN", "THEN");
                put("TYPE", "TYPE");
				put("UNTIL", "UNTIL");
                put("USE", "USE");
                put("WHEN", "WHEN");
                put("WHILE", "WHILE");
                put("WITH", "WITH");
                put("XOR", "XOR"); }};
%}
DIGIT        =           [0-9]
EXTENDED_DIGIT  =        [0-9a-zA-Z]
INTEGER          =       ({DIGIT}(_?{DIGIT})*)
EXPONENT          =      ([eE](\+?|-){INTEGER})
DECIMAL_LITERAL    =     {INTEGER}(\.?{INTEGER})?{EXPONENT}?
BASE                =    {INTEGER}
BASED_INTEGER        =   {EXTENDED_DIGIT}(_?{EXTENDED_DIGIT})*
BASED_LITERAL         =  {BASE}#{BASED_INTEGER}(\.{BASED_INTEGER})?#{EXPONENT}?
%%
{INTEGER} {cualquiercosa++; System.out.printf("-> found number: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
{DECIMAL_LITERAL} {cualquiercosa++; System.out.printf("-> found decimal: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
[a-zA-Z](_?[a-zA-Z0-9])* {  cualquiercosa++;
							if (keywords.containsKey(yytext().toUpperCase()))
							{ System.out.println("-> found " + yytext().toUpperCase() + " at line "+yyline + ", column "+ yycolumn); }
							else{ System.out.printf("-> found identifier: %s at line %d, column %d\n ", yytext(), yyline, yycolumn); }
							}
"."                     {cualquiercosa++; System.out.printf("-> found .: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"<"                     {cualquiercosa++; System.out.printf("-> found <: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"("                     {cualquiercosa++; System.out.printf("-> found (: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"+"                     {cualquiercosa++; System.out.printf("-> found +: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"|"                     {cualquiercosa++; System.out.printf("-> found |: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"&"                     {cualquiercosa++; System.out.printf("-> found &: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"*"                     {cualquiercosa++; System.out.printf("-> found *: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
")"                     {cualquiercosa++; System.out.printf("-> found ): %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
";"                     {cualquiercosa++; System.out.printf("-> found ;: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"-"                     {cualquiercosa++; System.out.printf("-> found -: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"/"                     {cualquiercosa++; System.out.printf("-> found /: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
","                     {cualquiercosa++; System.out.printf("-> found ,: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
">"                     {cualquiercosa++; System.out.printf("-> found >: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
":"                     {cualquiercosa++; System.out.printf("-> found :: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"="                     {cualquiercosa++; System.out.printf("-> found =: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"'"                     {cualquiercosa++; System.out.printf("-> found \': %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
".."                    {cualquiercosa++; System.out.printf("-> found ..: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"<<"                    {cualquiercosa++; System.out.printf("-> found <<: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"<>"                    {cualquiercosa++; System.out.printf("-> found <>: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"<="                    {cualquiercosa++; System.out.printf("-> found <=: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"**"                    {cualquiercosa++; System.out.printf("-> found **: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"/="                    {cualquiercosa++; System.out.printf("-> found /=: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
">>"                    {cualquiercosa++; System.out.printf("-> found >>: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
">="                    {cualquiercosa++; System.out.printf("-> found >=: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
":="                    {cualquiercosa++; System.out.printf("-> found :=: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
"=>"                    {cualquiercosa++; System.out.printf("-> found =>: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
[ \t\n\f]  { /* do nothing */}
--.*\n  {/* Comentario */}
. {System.out.printf("-> Unrecognized character %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}

<<EOF>> {System.out.println("Found "+cualquiercosa+" tokens."); return 0;}

