#include <stdio.h>
int x; #include <string.h>
int main () {
    char cc = ' ';
    printf("%c123\n",cc);
    FILE* F = fopen("test.c","r");
    char c;
    do{
        c = fgetc(F);
        printf("%c:%d\n",c,c);
    }while(c!=EOF);
    fclose(F);
    return 0;
}
