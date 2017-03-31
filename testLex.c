#include <stdio.h>

int main () {
    FILE* F = fopen("test.c","r");
    char c;
    do{
        c = fgetc(F);
        printf("%c:%d\n",c,c);
    }while(c!=EOF);
    fclose(F);
    return 0;
}
