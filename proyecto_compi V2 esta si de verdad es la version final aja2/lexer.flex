import java_cup.runtime.Symbol;

%%
%class Search
%cup
%unicode
%int
%line
%column

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
%{
    StringBuffer string = new StringBuffer();
    StringBuffer comment = new StringBuffer();
%}

%state STRING
%state COMMENTS

%%
<YYINITIAL>{
    {WHITESPACE} {}
    {NEWLINE} {}
    \" {string.setLength(0); yybegin(STRING);}
    {DDASH} {comment.setLength(0); yybegin(COMMENTS);}
    {SUMSUBS} { return new Symbol(sym.SUMSUBS,yycolumn+1,yyline+1,yytext());}
    {MULDIV} {  return new Symbol(sym.MULDIV,yycolumn+1,yyline+1,yytext()); }
    {LPAR} {return new Symbol(sym.LPAR,yycolumn+1,yyline+1,yytext());}
    {RPAR} {return new Symbol(sym.RPAR,yycolumn+1,yyline+1,yytext());}
    {SEMICOLON} {  return new Symbol(sym.SEMICOLON,yycolumn+1,yyline+1,yytext());}
    {COMMA} {  return new Symbol(sym.COMMA,yycolumn+1,yyline+1,yytext());}
    {DOTDOT} {  return new Symbol(sym.DOTDOT,yycolumn+1,yyline+1,yytext());}
    {ABORT} {  return new Symbol(sym.ABORT,yycolumn+1,yyline+1,yytext());}
    {AND} {  return new Symbol(sym.AND,yycolumn+1,yyline+1,yytext());}
    {CASE} {  return new Symbol(sym.CASE,yycolumn+1,yyline+1,yytext());}
    {DIGITS} {return new Symbol(sym.DIGITS,yycolumn+1,yyline+1,yytext());}
    {EXCEPTION} {  return new Symbol(sym.EXCEPTION,yycolumn+1,yyline+1,yytext());}
    {GOTO} {  return new Symbol(sym.GOTO,yycolumn+1,yyline+1,yytext());}
    {LOOP} {  return new Symbol(sym.LOOP,yycolumn+1,yyline+1,yytext());}
    {OF} {  return new Symbol(sym.OF,yycolumn+1,yyline+1,yytext());}
    {RECORD} {  return new Symbol(sym.RECORD,yycolumn+1,yyline+1,yytext());}
    {SELECT} {  return new Symbol(sym.SELECT,yycolumn+1,yyline+1,yytext());}
    {THEN} {  return new Symbol(sym.THEN,yycolumn+1,yyline+1,yytext());}
    {WITH} {  return new Symbol(sym.WITH,yycolumn+1,yyline+1,yytext());}
    {ABS} {  return new Symbol(sym.ABS,yycolumn+1,yyline+1,yytext());}
    {ARRAY} {  return new Symbol(sym.ARRAY,yycolumn+1,yyline+1,yytext());}
    {CONSTANT} {  return new Symbol(sym.CONSTANT,yycolumn+1,yyline+1,yytext());}
    {DO} {  return new Symbol(sym.DO,yycolumn+1,yyline+1,yytext());}
    {EXIT} {  return new Symbol(sym.EXIT,yycolumn+1,yyline+1,yytext());}
    {IF} {  return new Symbol(sym.IF,yycolumn+1,yyline+1,yytext());}
    {MOD} {  return new Symbol(sym.MOD,yycolumn+1,yyline+1,yytext());}
    {OR} {  return new Symbol(sym.OR,yycolumn+1,yyline+1,yytext());}
    {PRIVATE} {  return new Symbol(sym.PRIVATE,yycolumn+1,yyline+1,yytext());}
    {REM} {  return new Symbol(sym.REM,yycolumn+1,yyline+1,yytext());}
    {SEPARATE} {  return new Symbol(sym.SEPARATE,yycolumn+1,yyline+1,yytext());}
    {TYPE} {  return new Symbol(sym.TYPE,yycolumn+1,yyline+1,yytext());}
    {XOR} {  return new Symbol(sym.XOR,yycolumn+1,yyline+1,yytext());}
    {ACCEPT} {  return new Symbol(sym.ACCEPT,yycolumn+1,yyline+1,yytext());}
    {AT} {  return new Symbol(sym.AT,yycolumn+1,yyline+1,yytext());}
    {DECLARE} {  return new Symbol(sym.DECLARE,yycolumn+1,yyline+1,yytext());}
    {ELSE} {  return new Symbol(sym.ELSE,yycolumn+1,yyline+1,yytext());}
    {FOR} {  return new Symbol(sym.FOR,yycolumn+1,yyline+1,yytext());}
    {IN} {  return new Symbol(sym.IN,yycolumn+1,yyline+1,yytext());}
    {NEW} {  return new Symbol(sym.NEW,yycolumn+1,yyline+1,yytext());}
    {OTHERS} {  return new Symbol(sym.OTHERS,yycolumn+1,yyline+1,yytext());}
    {PROCEDURE} {  return new Symbol(sym.PROCEDURE,yycolumn+1,yyline+1,yytext());}
    {RENAMES} {  return new Symbol(sym.RENAMES,yycolumn+1,yyline+1,yytext());}
    {SUBTYPE} {  return new Symbol(sym.SUBTYPE,yycolumn+1,yyline+1,yytext());}
    {USE} {  return new Symbol(sym.USE,yycolumn+1,yyline+1,yytext());}
    {ACCESS} {  return new Symbol(sym.ACCESS,yycolumn+1,yyline+1,yytext());}
    {BEGIN} {  return new Symbol(sym.BEGIN,yycolumn+1,yyline+1,yytext());}
    {DELAY} {  return new Symbol(sym.DELAY,yycolumn+1,yyline+1,yytext());}
    {END} {  return new Symbol(sym.END,yycolumn+1,yyline+1,yytext());}
    {FUNCTION} {  return new Symbol(sym.FUNCTION,yycolumn+1,yyline+1,yytext());}
    {IS} {  return new Symbol(sym.IS,yycolumn+1,yyline+1,yytext());}
    {NOT} {  return new Symbol(sym.NOT,yycolumn+1,yyline+1,yytext());}
    {OUT} {  return new Symbol(sym.OUT,yycolumn+1,yyline+1,yytext());}
    {RAISE} {  return new Symbol(sym.RAISE,yycolumn+1,yyline+1,yytext());}
    {RETURN} {  return new Symbol(sym.RETURN,yycolumn+1,yyline+1,yytext());}
    {TASK} {  return new Symbol(sym.TASK,yycolumn+1,yyline+1,yytext());}
    {WHEN} {  return new Symbol(sym.WHEN,yycolumn+1,yyline+1,yytext());}
    {ALL} {  return new Symbol(sym.ALL,yycolumn+1,yyline+1,yytext());}
    {BODY} {  return new Symbol(sym.BODY,yycolumn+1,yyline+1,yytext());}
    {DELTA} {  return new Symbol(sym.DELTA,yycolumn+1,yyline+1,yytext());}
    {ENTRY} {  return new Symbol(sym.ENTRY,yycolumn+1,yyline+1,yytext());}
    {GENERIC} {  return new Symbol(sym.GENERIC,yycolumn+1,yyline+1,yytext());}
    {LIMITED} {  return new Symbol(sym.LIMITED,yycolumn+1,yyline+1,yytext());}
    {NULL} {  return new Symbol(sym.NULL,yycolumn+1,yyline+1,yytext());}
    {ELSIF} { return new Symbol(sym.ELSIF,yycolumn+1,yyline+1,yytext());}
    {PACKAGE} {  return new Symbol(sym.PACKAGE,yycolumn+1,yyline+1,yytext());}
    {RANGE} {  return new Symbol(sym.RANGE,yycolumn+1,yyline+1,yytext());}
    {REVERSE} {  return new Symbol(sym.REVERSE,yycolumn+1,yyline+1,yytext());}
    {TERMINATE} {  return new Symbol(sym.TERMINATE,yycolumn+1,yyline+1,yytext());}
    {WHILE} {  return new Symbol(sym.WHILE,yycolumn+1,yyline+1,yytext());}
    {INTEGER} {  return new Symbol(sym.INTEGER,yycolumn+1,yyline+1,yytext());}
    {FLOAT} { return new Symbol(sym.FLOAT,yycolumn+1,yyline+1,yytext());}
    {BOOLEAN} { return new Symbol(sym.BOOLEAN,yycolumn+1,yyline+1,yytext());}
    {GET} { return new Symbol(sym.GET,yycolumn+1,yyline+1,yytext());}
    {PUT} { return new Symbol(sym.PUT,yycolumn+1,yyline+1,yytext());}
    {IDENTIFIER} {  return new Symbol(sym.IDENTIFIER,yycolumn+1,yyline+1,yytext());}
    {NUM} {  return new Symbol(sym.NUM,yycolumn+1,yyline+1,yytext());}
    {REAL} {  return new Symbol(sym.REAL,yycolumn+1,yyline+1,yytext());}
    {OPREL} {  return new Symbol(sym.OPREL,yycolumn+1,yyline+1,yytext());}
    {ASSIGN} {  return new Symbol(sym.ASSIGN,yycolumn+1,yyline+1,yytext());}
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