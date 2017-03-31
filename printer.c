#include <stdio.h>

int main(int argc,char* argv[]){
	if(argc!=2)
		return;
	char c;
	FILE* F = fopen(argv[1],"r");
	do{	
		c = fgetc(F);
		printf("%c:%d\n",c,c);
	}while(c!=EOF);
	return 0;
}
