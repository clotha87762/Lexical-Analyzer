
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

void PrintEOFSrc();
void PutToBuffer(char* token);
void ClearBuffer();
void PrintSrc();
void PrintToken(type t,char* text);
void PrintEOFSrc();
void Error();


%}

VID   [a-zA-Z0-9_]
chl   [a-z]
chu   [A-Z]
alpha [a-zA-Z]
digit [0-9]
ad	  [a-zA-Z0-9]
BLANK		(([\ \t])|("/*".*"*/"))

CMT 	"/*".*"*/"
LCMT	"//"[^\n]*\n
CH 		(\\\')|(\\\")|(\\\?)|(\\\\)|(\\t)|(\\n)|[^\'\\\n]
STRCH	(\\\')|(\\\")|(\\\?)|(\\\\)|(\\t)|(\\n)|[^\"\\\n]

FSUFIX	[fFlL]
ISUFIX	[uUlL]|(ll)|(LL)

%x	LINECOMMENT
%x	COMMENT



%%

<LINECOMMENT>[^\n]	{PutToBuffer(yytext);}
<LINECOMMENT>\n		{PutToBuffer(yytext);PrintSrc();ClearBuffer();lineCount++;BEGIN 0;}
<COMMENT>\*\/		{PutToBuffer(yytext);BEGIN 0;}
<COMMENT>\n		{PutToBuffer(yytext);PrintSrc();ClearBuffer();lineCount++;}
<COMMENT>.		{PutToBuffer(yytext);}
\/\/	{BEGIN LINECOMMENT;PutToBuffer(yytext);}
\/\*	{BEGIN COMMENT; PutToBuffer(yytext);}

#{BLANK}*pragma{BLANK}+source{BLANK}+on{BLANK}*("//".*)?	{srcOn = 1;PutToBuffer(yytext);}
#{BLANK}*pragma{BLANK}+source{BLANK}+on{BLANK}*("/*".*)?	{srcOn = 1;PutToBuffer(yytext);BEGIN COMMENT;}
#{BLANK}*pragma{BLANK}+source{BLANK}+off{BLANK}*("//".*)? 		{srcOn = 0;PutToBuffer(yytext);}
#{BLANK}*pragma{BLANK}+source{BLANK}+off{BLANK}*("/*".*)? 		{srcOn = 0;PutToBuffer(yytext);BEGIN COMMENT;}
#{BLANK}*pragma{BLANK}+token{BLANK}+on{BLANK}*("//".*)?				{tokenOn = 1;PutToBuffer(yytext);}
#{BLANK}*pragma{BLANK}+token{BLANK}+on{BLANK}*("/*".*)?				{tokenOn = 1;PutToBuffer(yytext);BEGIN COMMENT;}
#{BLANK}*pragma{BLANK}+token{BLANK}+off{BLANK}*("//".*)?				{tokenOn = 0;PutToBuffer(yytext);}
#{BLANK}*pragma{BLANK}+token{BLANK}+off{BLANK}*("/*".*)?				{tokenOn = 0;PutToBuffer(yytext);BEGIN COMMENT;}
#.*			{printf("No Matched pragma rule\n");Error();}




"void"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"int"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"double"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"bool"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"char"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"null"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"for"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"while"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"do"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"if"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"else"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"switch"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"return"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"break"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"continue"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"const"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"true"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"false"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"struct"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"case"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"default"		{PutToBuffer(yytext);PrintToken(KEY,yytext);}

"clearerr"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fclose"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fdopen"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"feof"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"ferror"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fflush"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fgetc"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fgetpos"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fgets"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fileno"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fopen"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fprintf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fpurge"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fputc"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fputs"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fread"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"freopen"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fscanf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fseek"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fsetpos"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"ftell"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"fwrite"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"getc"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"getchar"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"gets"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"getw"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"mktemp"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"perror"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"printf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"putc"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"putchar"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"puts"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"putw"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"remove"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"rewind"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"scanf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"setbuf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"setbuffer"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"setlinebuf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"setvbuf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"sprintf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"sscanf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"strerror"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"sys_errlist"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"sys_nerr"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"tempnam"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"tmpfile"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"tmpnam"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"ungetc"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"vfprintf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"vfscanf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"vprintf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"vscanf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"vsprintf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}
"vsscanf"	{PutToBuffer(yytext);PrintToken(KEY,yytext);}



{digit}+({alpha}|_)+		{Error();}
({alpha}|_){VID}*		{PutToBuffer(yytext);PrintToken(ID,yytext);}



0{digit}+{ISUFIX}?				{Error();}
[1-9]{digit}*{ISUFIX}?		{PutToBuffer(yytext);PrintToken(INTEGER,yytext);}
0{ISUFIX}?					{PutToBuffer(yytext);PrintToken(INTEGER,yytext);}


{digit}+\.{digit}*[eE][+-]?{digit}+{FSUFIX}?	{PutToBuffer(yytext);PrintToken(SCI,yytext);}
{digit}+\.{digit}*[eE][+-]?{digit}+{FSUFIX}?(\.|_|{ad})+	{printf("SCI Error\n");Error();}
\.{digit}+[eE][+-]?{digit}+{FSUFIX}?		{PutToBuffer(yytext);PrintToken(SCI,yytext);}
\.{digit}+[eE][+-]?{digit}+{FSUFIX}?(\.|_|{ad})+		{printf("SCI Error\n");Error();}
{digit}+[eE][+-]?{digit}+{FSUFIX}?			{PutToBuffer(yytext);PrintToken(SCI,yytext);}
{digit}+[eE][+-]?{digit}+{FSUFIX}?(\.|_|{ad})+		{printf("SCI Error\n");Error();}

{digit}+\.{digit}*{FSUFIX}?	{PutToBuffer(yytext);PrintToken(DOUBLE,yytext);}
{digit}+\.{digit}*{FSUFIX}?(\.|_|{ad})+		{printf("double Error\n");Error();}
\.{digit}+{FSUFIX}?			{PutToBuffer(yytext);PrintToken(DOUBLE,yytext);}
\.{digit}+{FSUFIX}?(\.|_|{ad})+		{printf("double Error\n");Error();}



\'{CH}+\'           {PutToBuffer(yytext);PrintToken(CHARACTER,yytext);}
L?\"{STRCH}*\"			{
						PutToBuffer(yytext);
						char* temp;
						if(yytext[0]=='L'){
							temp = (char*)malloc(sizeof(char)*(strlen(yytext)-3)); 
							int i=0;
							for(i=0;i<strlen(yytext)-3;i++)
								temp[i] = yytext[i+2];
						}
						else{
							char* temp = (char*)malloc(sizeof(char)*(strlen(yytext)-2)); 
							int i=0;
							for(i=0;i<strlen(yytext)-2;i++)
								temp[i] = yytext[i+1];
						}
						PrintToken(STRING,temp);
					}  


"+"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"-"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"*"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"/"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"%"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"++"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"--"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"<"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"<="		{PutToBuffer(yytext);PrintToken(OP,yytext);}
">"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
">="		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"=="		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"!="		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"="		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"&&"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"||"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"!"		{PutToBuffer(yytext);PrintToken(OP,yytext);}
"&"		{PutToBuffer(yytext);PrintToken(OP,yytext);}

":"		{PutToBuffer(yytext);PrintToken(PUNC,yytext);}
"("		{PutToBuffer(yytext);PrintToken(PUNC,yytext);}
")"		{PutToBuffer(yytext);PrintToken(PUNC,yytext);}
"["		{PutToBuffer(yytext);PrintToken(PUNC,yytext);}
"]"		{PutToBuffer(yytext);PrintToken(PUNC,yytext);}
"{"		{PutToBuffer(yytext);PrintToken(PUNC,yytext);}
"}"		{PutToBuffer(yytext);PrintToken(PUNC,yytext);}
"."		{PutToBuffer(yytext);PrintToken(PUNC,yytext);}
","		{PutToBuffer(yytext);PrintToken(PUNC,yytext);}
";"		{PutToBuffer(yytext);PrintToken(PUNC,yytext);}

\n		{PutToBuffer(yytext); PrintSrc();ClearBuffer();lineCount++;}
		



[\ \t]	{PutToBuffer(yytext);}
\0		{PrintEOFSrc();}
.		{printf("non-exsistent token\n");Error();}

%%

int main(int argc , char* argv[]){

	yylex();


	return 0;
}

void PutToBuffer(char* token){
	strcat(lineBuffer,token);
}

void ClearBuffer(){
	memset(lineBuffer,0,10000);
}

void PrintToken(type t,char* text){
	if(tokenOn==1){
		switch(t){
			case KEY:
				printf("#key:%s\n",text);
				break;
			case ID:
				printf("#id:%s\n",text);
				break;
			case OP:
				printf("#op:%s\n",text);
				break;
			case PUNC:
				printf("#punc:%s\n",text);
				break;
			case INTEGER:
				printf("#integer:%s\n",text);
				break;
			case DOUBLE:
				printf("#double:%s\n",text);
				break;
			case CHARACTER:
				printf("#char:%s\n",text);
				break;
			case SCI:
				printf("#sci:%s\n",text);
				break;
			case STRING:
				printf("#string:%s\n",text);
				break;
			default:
				Error();
		}
	}
}

void PrintSrc(){
	if(srcOn==1){
		printf("%d:%s",lineCount,lineBuffer);
	}
}

void PrintEOFSrc(){
	if(srcOn==1&&strlen(lineBuffer)>0){
		printf("%d:%s",lineCount,lineBuffer);
		printf("\n");
	}
}

void Error(){
	fprintf(stderr,"Error at line %d: %s\n",lineCount,yytext);exit(1);
}

