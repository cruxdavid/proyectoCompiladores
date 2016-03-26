import java_cup.runtime.Symbol;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.Location;
%%
%public
%class Lexer
%cup
%implements sym
%char
%int
%line
%column
%{
    StringBuffer string = new StringBuffer();
    ComplexSymbolFactory symbolFactory;
    public Lexer(java.io.Reader in, ComplexSymbolFactory sf){
        this(in);
        symbolFactory = sf;
    }
    

    private Symbol symbol(String name, int sym){
        return symbolFactory.newSymbol(name,sym,new Location(yyline+1,yycolumn+1,yychar), new Location(yyline+1,yycolumn+yylength(),yychar+yylength()));
    }

    private Symbol symbol(String name, int sym, Object val){
        Location left = new Location(yyline+1,yycolumn+1,yychar);
        Location right = new Location(yyline+1,yycolumn+yylength(),yychar+yylength());
        return symbolFactory.newSymbol(name,sym,left,right,val);

    }

    private Symbol symbol(String name, int sym, Object val, int buflength){
        Location left = new Location(yyline+1,yycolumn+yylength()-buflength, yychar+yylength()-buflength);
        Location right = new Location(yyline+1,yycolumn+yylength(), yychar+yylength());
        return symbolFactory.newSymbol(name,sym,left,right,val);
    }

    private void error(String message){

        System.out.println("Error at line "+(yyline+1)+", column "+(yycolumn+1)+" : "+message);
    }


    StringBuffer comment = new StringBuffer();
%}

%state STRING
%state COMMENTS

DIGIT = [0-9]
WHITESPACE = [ \t\f]
NEWLINE = \r|\n|\r\n
CHAR = [a-zA-Z]
SPECIALCHAR = "_"
ABORT = "abort"
AND = "and"
CASE = "case"
DIGITS = "digits"
EXCEPTION = "exception"
GOTO = "goto"
LOOP = "loop"
OF = "of"
RECORD = "record"
SELECT = "select"
THEN = "then"
WITH = "with"
ABS = "abs"
ARRAY = "array"
CONSTANT = "constant"
DO = "do"
EXIT = "exit"
IF = "if"
ELSIF = "elsif"
MOD = "mod"
OR = "or"
PRIVATE = "private"
REM = "rem"
SEPARATE = "separate"
TYPE = "type"
XOR = "xor"
ACCEPT = "accept"
AT = "at"
DECLARE = "declare"
ELSE = "else"
FOR = "for"
IN = "in"
NEW = "new"
OTHERS = "others"
PROCEDURE = "procedure"
RENAMES = "renames"
SUBTYPE = "subtype"
USE = "use"
ACCESS = "access"
BEGIN = "begin"
DELAY = "delay"
END = "end"
FUNCTION = "function"
IS = "is"
NOT = "not"
OUT = "out"
RAISE = "raise"
RETURN = "return"
TASK = "task"
WHEN = "when"
ALL = "all"
BODY = "body"
DELTA = "delta"
ENTRY = "entry"
GENERIC = "generic"
LIMITED = "limited"
NULL = "null"
PACKAGE = "package"
RANGE = "range"
REVERSE = "reverse"
TERMINATE = "terminate"
WHILE = "while"
INTEGER = "Integer"
FLOAT = "Float"
BOOLEAN = "Boolean"
ASSIGN = ":="
OPREL = "<"|">"|"<="|">="|"="|"/="
SUMSUBS = "+"|"-"
MULDIV = "/"|"*"
IDENTIFIER = {CHAR}({CHAR}|{DIGIT}|{SPECIALCHAR})*
DOTDOT = ".."
LPAR = "("
RPAR = ")"
DDASH = "--"
GET = "Get"
PUT = "Put"
SEMICOLON = ";"
COMMA = ","
NUM = 0 | ([1-9]{DIGIT}*)
REAL = {NUM}+"."{NUM}+

%%
<YYINITIAL>{
    {WHITESPACE} {/* ignore */}
    {NEWLINE} {}
    \" {string.setLength(0); yybegin(STRING);}
    {DDASH} {comment.setLength(0); yybegin(COMMENTS);}
    {SUMSUBS} { return symbol("SUMSUBS",SUMSUBS);}
    {MULDIV} {  return symbol("MULDIV",MULDIV);}
    {LPAR} {return symbol("LPAR",LPAR);}
    {RPAR} {return symbol("RPAR",RPAR);}
    {SEMICOLON} {  return symbol("SEMICOLON",SEMICOLON);}
    {COMMA} {  return symbol("COMMA",COMMA);}
    {DOTDOT} {  return symbol("DOTDOT",DOTDOT);}
    {ABORT} {  return symbol("ABORT",ABORT);}
    {AND} {  return symbol("AND",AND);}
    {CASE} {  return symbol("CASE",CASE);}
    {DIGITS} {return symbol("DIGITS",DIGITS);}
    {EXCEPTION} {  return symbol("EXCEPTION",EXCEPTION);}
    {GOTO} {  return symbol("GOTO",GOTO);}
    {LOOP} {  return symbol("LOOP",LOOP);}
    {OF} {  return symbol("OF",OF);}
    {RECORD} {  return symbol("RECORD",RECORD);}
    {SELECT} {  return symbol("SELECT",SELECT);}
    {THEN} {  return symbol("THEN",SELECT);}
    {WITH} {  return symbol("WITH",SELECT);}
    {ABS} {  return symbol("ABS",ABS);}
    {ARRAY} {  return symbol("ARRAY",ARRAY);}
    {CONSTANT} {  return symbol("CONSTANT",CONSTANT);}
    {DO} {  return symbol("DO",DO);}
    {EXIT} {  return symbol("EXIT",EXIT);}
    {IF} {  return symbol("IF",IF);}
    {MOD} {  return symbol("MOD",MOD);}
    {OR} {  return symbol("OR",OR);}
    {PRIVATE} {  return symbol("PRIVATE",PRIVATE);}
    {REM} {  return symbol("REM",REM);}
    {SEPARATE} {  return symbol("SEPARATE",SEPARATE);}
    {TYPE} {  return symbol("TYPE",TYPE);}
    {XOR} {  return symbol("XOR",XOR);}
    {ACCEPT} {  return symbol("ACCEPT",ACCEPT);}
    {AT} {  return symbol("AT",AT);}
    {DECLARE} {  return symbol("DECLARE",DECLARE);}
    {ELSE} {  return symbol("ELSE",ELSE);}
    {FOR} {  return symbol("FOR",FOR);}
    {IN} {  return symbol("IN",IN);}
    {NEW} {  return symbol("NEW",NEW);}
    {OTHERS} {  return symbol("OTHERS",OTHERS);}
    {PROCEDURE} {  return symbol("PROCEDURE",PROCEDURE);}
    {RENAMES} {  return symbol("RENAMES",RENAMES);}
    {SUBTYPE} {  return symbol("SUBTYPE",SUBTYPE);}
    {USE} {  return symbol("USE",USE);}
    {ACCESS} {  return symbol("ACCESS",ACCESS);}
    {BEGIN} {  return symbol("BEGIN",BEGIN);}
    {DELAY} {  return symbol("DELAY",DELAY);}
    {END} {  return symbol("END",END);}
    {FUNCTION} {  return symbol("FUNCTION",FUNCTION);}
    {IS} {  return symbol("IS",IS);}
    {NOT} {  return symbol("NOT",NOT);}
    {OUT} {  return symbol("OUT",OUT);}
    {RAISE} {  return symbol("RAISE",RAISE);}
    {RETURN} {  return symbol("RETURN",RETURN);}
    {TASK} {  return symbol("TASK",TASK);}
    {WHEN} {  return symbol("WHEN",WHEN);}
    {ALL} {  return symbol("ALL",ALL);}
    {BODY} {  return symbol("BODY",BODY);}
    {DELTA} {  return symbol("DELTA",DELTA);}
    {ENTRY} {  return symbol("ENTRY",ENTRY);}
    {GENERIC} {  return symbol("GENERIC",GENERIC);}
    {LIMITED} {  return symbol("LIMITED",LIMITED);}
    {NULL} {  return symbol("NULL",NULL);}
    {ELSIF} { return symbol("ELSIF",ELSIF);}
    {PACKAGE} {  return symbol("PACKAGE",PACKAGE);}
    {RANGE} {  return symbol("RANGE",RANGE);}
    {REVERSE} {  return symbol("REVERSE",REVERSE);}
    {TERMINATE} {  return symbol("TERMINATE",TERMINATE);}
    {WHILE} {  return symbol("WHILE",WHILE);}
    {INTEGER} {  return symbol("INTEGER",INTEGER);}
    {FLOAT} { return symbol("FLOAT",FLOAT);}
    {BOOLEAN} { return symbol("BOOLEAN",BOOLEAN);}
    {GET} { return symbol("GET",GET);}
    {PUT} { return symbol("PUT",PUT);}
    {IDENTIFIER} {  return symbol("IDENTIFIER",IDENTIFIER);}
    {NUM} {  return symbol("NUM",NUM);}
    {REAL} {  return symbol("REAL",REAL);}
    {OPREL} {  return symbol("OPREL",OPREL);}
    {ASSIGN} {  return symbol("ASSIGN",ASSIGN);}
    . {System.out.print("Unexpected token: "+ yytext());}
}

<STRING> {
      \"                             { yybegin(YYINITIAL);}
      [^\n\r\"\\]+                   { string.append( yytext() ); }
      \\t                            { string.append('\t'); }
      \\n                            { string.append('\n'); }
      \\r                            { string.append('\r'); }
      \\\"                           { string.append('\"'); }
      \\                             { string.append('\\'); }
 }

<COMMENTS>{
    . {comment.append( yytext() );}
    {NEWLINE} {yybegin(YYINITIAL);}
}

<<EOF>> {return symbolFactory.newSymbol("EOF", EOF, new Location(yyline+1,yycolumn+1,yychar), new Location(yyline+1,yycolumn+1,yychar+1));}