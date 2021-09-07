package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L = [a-zA-Z_]+
D = [0-9]+
espacio = [ , \t,\r,\n]+
%{
    public String lexeme;
%}
%%
int     |
if      |
else    |
while   {lexeme=yytex(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=".* {return Igual;}
"+".* {return Suma;}
"-".* {return Resta;}
"*".* {return Multiplicacion;}
"/".* {return Division;}
{L}({L}|{D})* {lexeme==yytex(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytex(); return Numero;}
. {return ERROR;}
