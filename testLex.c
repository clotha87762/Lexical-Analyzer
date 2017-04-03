#include <stdio.h>

int main () {
    double x = 012.12;

    char cc = ' ';
    char sss[100] = "
    ";
    printf("aaa""bbb""ccc""\n");
   // sss = "asd";

    FILE* F = fopen("test.c","r");
    char c;
    do{
        c = fgetc(F);
        printf("%c:%d\n",c,c);
    }while(c!=EOF);
    fclose(F);
    return 0;
}
