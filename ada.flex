import java_cup.runtime.*;
import java.util.HashMap;
import java.util.Map;
%%
%class Search
%standalone
%line
%column
%{
      StringBuffer string = new StringBuffer();

      private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
      }
      private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
      }
 int count = 0;
 
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
{INTEGER} {System.out.printf("-> found number: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
{DECIMAL_LITERAL} {System.out.printf("-> found decimal: %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}
[a-zA-Z](_?[a-zA-Z0-9])* {  count++;
							if (keywords.containsKey(yytext().toUpperCase()))
							{ System.out.println("-> found " + yytext().toUpperCase() + " at line "+yyline + ", column "+ yycolumn); }
							else{ System.out.printf("-> found identifier: %s at line %d, column %d\n ", yytext(), yyline, yycolumn); }
							}
"."                     {return symbol(sym.DOT);}
"<"                     {return symbol(sym.LESSTHAN);}
"("                     {return symbol(sym.LEFTPARENTHESIS);}
"+"                     {return symbol(sym.PLUS);}
"|"                     {return symbol(sym.PIPE);}
"&"                     {return symbol(sym.AMPERSAND);}
"*"                     {return symbol(sym.STAR);}
")"                     {return symbol(sym.RIGHT);}
";"                     {return symbol(sym.SEMICOLON);}
"-"                     {return symbol(sym.DASH);}
"/"                     {return symbol(sym.SLASH);}
","                     {return symbol(sym.COMMA);}
">"                     {return symbol(sym.GREATER);}
":"                    {return symbol(sym.COLON);}
"="                     {return symbol(sym.EQUAL);}
"'"                     {return symbol(sym.TICK);}
".."                    {return symbol(sym.DOTDOT);}
"<<"                    {return symbol(sym.LT_LT);}
">>"                    {return symbol(sym.GT_GT);}
"<>"                    {return symbol(sym.BOX);}
"<="                    {return symbol(sym.LEQ);}
"**"                    {return symbol(sym.STARSTAR);}
"/="                    {return symbol(sym.NOTEQUAL);}
">="                    {return symbol(sym.GEQ);}
":="                    {return symbol(sym.ASSIGN);}
"=>"                    {return symbol(sym.ARROW);}
"ABORT"                 { return symbol(sym.ABORT); }
"ABS"                   { return symbol(sym.ABS); }
"ABSTRACT"              { return symbol(sym.ABSTRACT); }
"ACCEPT"                { return symbol(sym.ACCEPT); }
"ACCESS"                { return symbol(sym.ACCESS); }
"ALIASED"               { return symbol(sym.ALIASED); }
"ALL"                   { return symbol(sym.ALL); }
"AND"                   { return symbol(sym.AND); }
"ARRAY"                 { return symbol(sym.ARRAY); }
"AT"                    { return symbol(sym.AT); }
"BEGIN"                 { return symbol(sym.BEGIN); }
"BODY"                  { return symbol(sym.BODY); }
"CASE"                  { return symbol(sym.CASE); }
"CONSTANT"              { return symbol(sym.CONSTANT); }
"DECLARE"               { return symbol(sym.DECLARE); }
"DELAY"                 { return symbol(sym.DELAY); }
"DELTA"                 { return symbol(sym.DELTA); }
"DIGITS"                { return symbol(sym.DIGITS); }
"DO"                    { return symbol(sym.DO); }
"ELSE"                  { return symbol(sym.ELSE); }
"ELSIF"                 { return symbol(sym.ELSIF); }
"END"                   { return symbol(sym.END); }
"ENTRY"                 { return symbol(sym.ENTRY); }
"EXCEPTION"             { return symbol(sym.EXCEPTION); }
"EXIT"                  { return symbol(sym.EXIT); }
"FOR"                   { return symbol(sym.FOR); }
"FUNCTION"              { return symbol(sym.FUNCTION); }
"GENERIC"               { return symbol(sym.GENERIC); }
"GOTO"                  { return symbol(sym.GOTO); }
"IF"                    { return symbol(sym.IF); }
"IN"                    { return symbol(sym.IN); }
"IS"                    { return symbol(sym.IS); }
"LIMITED"               { return symbol(sym.LIMITED); }
"LOOP"                  { return symbol(sym.LOOP); }
"MOD"                   { return symbol(sym.MOD); }
"NEW"                   { return symbol(sym.NEW); }
"NOT"                   { return symbol(sym.NOT); }
"NULL"                  { return symbol(sym.NULL); }
"OF"                    { return symbol(sym.OF); }
"OR"                    { return symbol(sym.OR); }
"OTHERS"                { return symbol(sym.OTHERS); }
"OUT"                   { return symbol(sym.OUT); }
"PACKAGE"               { return symbol(sym.PACKAGE); }
"PRAGMA"                { return symbol(sym.PRAGMA); }
"PRIVATE"               { return symbol(sym.PRIVATE); }
"PROCEDURE"             { return symbol(sym.PROCEDURE); }
"PROTECTED"             { return symbol(sym.PROTECTED); }
"RAISE"                 { return symbol(sym.RAISE); }
"RANGE"                 { return symbol(sym.RANGE); }
"RECORD"                { return symbol(sym.RECORD); }
"REM"                   { return symbol(sym.REM); }
"RENAMES"               { return symbol(sym.RENAMES); }
"REQUEUE"               { return symbol(sym.REQUEUE); }
"RETURN"                { return symbol(sym.RETURN); }
"REVERSE"               { return symbol(sym.REVERSE); }
"SELECT"                { return symbol(sym.SELECT); }
"SEPARATE"              { return symbol(sym.SEPARATE); }
"SUBTYPE"               { return symbol(sym.SUBTYPE); }
"TAGGED"                { return symbol(sym.TAGGED); }
"TASK"                  { return symbol(sym.TASK); }
"TERMINATE"             { return symbol(sym.TERMINATE); }
"THEN"                  { return symbol(sym.THEN); }
"TYPE"                  { return symbol(sym.TYPE); }
"UNTIL"                 { return symbol(sym.UNTIL); }
"USE"                   { return symbol(sym.USE); }
"WHEN"                  { return symbol(sym.WHEN); }
"WHILE"                 { return symbol(sym.WHILE); }
"WITH"                  { return symbol(sym.WITH); }
"XOR"                   { return symbol(sym.XOR); }
[ \t\n\f]  { /* do nothing */}
--.*\n  {/* Comentario */}
. {System.out.printf("-> Unrecognized character %s at line %d, column %d\n ", yytext(), yyline, yycolumn);}

<<EOF>> {System.out.println("Found "+count+" tokens."); return 0;}

