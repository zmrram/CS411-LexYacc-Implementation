%{
#include "y.tab.h"
%}

%%

"boolean"			{printf("boolean "); return _boolean;}
"break"				{printf("break "); return _break;}
"class"				{printf("class "); return _class;}
"double"			{printf("double "); return _double;}
"else"				{printf("else "); return _else;}
"extends"			{printf("extends "); return _extends;}
"for"				{printf("for "); return _for;}
"if"				{printf("if "); return _if;}
"implements"		{printf("implements "); return _implements;}
"int"				{printf("int "); return _int;}
"interface"			{printf("interface "); return _interface;}
"newarray"			{printf("newarray "); return _newarray;}
"println"			{printf("println "); return _println;}
"readln"			{printf("readln "); return _readln;}
"return"			{printf("return "); return _return;}
"string"			{printf("string "); return _string;}
"void"				{printf("void "); return _void;}
"while"				{printf("while "); return _while;}
"+"					{printf("plus "); return _plus;}
"-"					{printf("minus "); return _minus;}
"*"					{printf("multiplication "); return _multiplication;}
"/"					{printf("division "); return _division;}
"%"					{printf("mod "); return _mod;}
"<"					{printf("less "); return _less;}
"<="				{printf("lessequal "); return _lessequal;}
">"					{printf("greater "); return _greater;}
">="				{printf("greaterequal "); return _greaterequal;}
"=="				{printf("equal "); return _equal;}
"!="				{printf("notequal "); return _notequal;}
"&&"				{printf("and "); return _and;}
"||"				{printf("or "); return _or;}
"!"					{printf("not "); return _not;}
"="					{printf("assignop "); return _assignop;}
";"					{printf("semicolon\n"); return _semicolon;}
","					{printf("comma "); return _comma;}
"."					{printf("period "); return _period;}
"("					{printf("leftparen "); return _leftparen;}
")"					{printf("rightparen "); return _rightparen;}
"["					{printf("leftbracket "); return _leftbracket;}
"]"					{printf("rightbracket "); return _rightbracket;}
"{"					{printf("leftbrace "); return _leftbrace;}
"}"					{printf("rightbrace "); return _rightbrace;}
"true"				{printf("booleanconstant "); return _booleanconstant;}
"false"				{printf("booleanconstant "); return _booleanconstant;}
"//".*					;
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] 	;
[/][*]                          {printf("Unterminated comment\n");}
\"(\\.|[^\\"])*\"	{printf("stringconstant "); return _stringconstant;}

[a-zA-Z][_a-zA-Z0-9]*		{printf("id "); return _id;}
[+-]?[1-9][0-9]*|0		{printf("intconstant "); return _intconstant;}
[0-9]+|0[xX][0-9A-Fa-f]+ 		{printf("intconstant "); return _intconstant;}
[0-9]+\.[0-9]*([Ee][+-]?[0-9]+)?		{printf("doubleconstant "); return _doubleconstant;}
[0-9]+([Ee][+-]?[0-9]+)? 	{printf("doubleconstant "); return _doubleconstant;}
[ \t\n\r]+			;

.					{printf("unexpected character\n");}

%%

