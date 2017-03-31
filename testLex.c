#include <stdio.h>

int main () {
    string s = "";
    FILE* F = fopen("test.c","r");
    char c;
    do{
        c = fgetc(F);
        printf("%c:%d\n",c,c);
    }while(c!=EOF);
    fclose(F);
    return 0;
}
