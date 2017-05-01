#include <stdio.h>

int main () {

    int x = 000;
    double y = 123.2;
    printf("%lf\n",y);
    char cc = ' ';



    FILE* F = fopen("test.c","r");
    char c;
    do{
        c = fgetc(F);
        //printf("%c:%d\n",c,c);
    }while(c!=EOF);
    fclose(F);
    return 0;
}
