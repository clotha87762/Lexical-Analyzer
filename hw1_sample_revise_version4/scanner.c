
%{

#include <stdio.h>
#include <string.h>
int lineCount = 1;
int lineIndex = 0;
char lineBuffer[10000];
int srcOn = 1;
int tokenOn = 1;
typedef enum {
	KEY,ID,OP,PUNC,INTEGER,DOUBLE,CHARACTER,SCI,STRING
}type;


%}

chL   [a-z]
chU   [A-Z]
alpha [a-zA-Z] 
digit [0-9]
ad	  [a-zA-Z0-9]
Operator	[\+\-\*\/\%(\+\+)(\-\-)\<(\<\=)\>(\>\=)(\=\=)(\!\=)\=(\&\&)(\|\|)\!\&]
Punctuation [\:\;\,\.\[\]\(\)\{\}]
CH    "\""\"

%x	LINECOMMENT;
%x	COMMENT;


	
%%

<LINECOMMENT>[^\n]	{PutToBuffer(yytext);}
<LINECOMMENT>\n		{PutToBuffer(yytext);PrintSrc();ClearBuffer();lineCount++;BEGIN 0;}
<COMMENT>\*\/		{PutToBuffer(yytext);BEGIN 0;}
<COMMENT>\n			{PutToBuffer(yytext);PrintSrc();ClearBuffer();}
\/\/	{BEGIN LINECOMMENT;PutToBuffer(yytext);}
\/\*	{BEGIN COMMENT; PutToBuffer(yytext);}

\#[\ \t]*pragma[\ \t]+source[\ \t]+on[\ \t]*\n		{srcOn = 1;PutToBuffer(yytext);PrintSrc();ClearBuffer();}
\#[\ \t]*pragma[\ \t]+source[\ \t]+off[\ \t]*\n 	{srcOn = 0;ClearBuffer();}
\#[\ \t]*pragma[\ \t]+token[\ \t]+on[\ \t]*\n		{tokenOn = 1;PutToBuffer(yytext);PrintSrc();ClearBuffer();}
\#[\ \t]*pragma[\ \t]+token[\ \t]+off[\ \t]*\n		{tokenOn = 0;PutToBuffer(yytext);PrintSrc();ClearBuffer();}


{alpha}{ad}*		{PutToBuffer(yytext);PrintToken(ID,yytext);}
[1-9]{digit}*		{PutToBuffer(yytext);PrintToken(INTEGER,yytext);}





\n		{PutToBuffer(yytext); PrintSrc();ClearBuffer();lineCount++;}



[\ \t]	{PutToBuffer(yytext);}
.		{Error();}

%%

int main(int argc , char* argv[]){

	yylex();


	return
}

void PutToBuffer(char* token){
	strcat(lineBuffer,token);
}

void ClearBuffer(){
	memset(lineBuffer,0,10000);
}

void PrintToken(type t,char* text){
	if(tokenOn){
		Switch(t){
			case KEY:
				printf("key:%s\n",text);
				break;
			case ID:
				printf("id:%s\n",text);
				break;
			case OP:
				printf("op:%s\n",text);
				break;
			case PUNC:
				printf("punc:%s\n",text);
				break;
			case INTEGER:
				printf("integer:%s\n",text);
				break;
			case DOUBLE:
				printf("double:%s\n",text);
				break;
			case CHARACTER:
				printf("char:%s\n",text);
				break;
			case SCI:
				printf("sci:%s\n",text);
				break;
			case STRING:
				printf("string:%s\n",text);
				break;
			default:
				Error();
		}
	}
}

void PrintSrc(){
	if(srcOn){
		printf("%d:%s",lineCount,lineBuffer);
	}
}

void Error(){
	fprintf(stderr,"error at line %d: %s\n",lineCount,yytext);exit(1);
}
