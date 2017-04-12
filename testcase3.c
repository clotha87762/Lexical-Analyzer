/* Testcase3 */

/* C subset:

 * int, double, char
 * ifelse, for loop
 * function
 * comment
  
 * variable scope
 * special comment format
 * pointer
 * array
 */



int count = 0;

// swap function
int swap(int *x, int *y)
{
    int tmp;
    tmp = *x;
    *x = *y;
    *y = tmp;
    printf("after swap: x=%d, y=%d\n\n", *x, *y);
    return *y - 10;
}

// main function
int main(void)
{
    int n, w, x, y, z;
    int num = 1000;
    double num1 = 0;
    char character = 'W';
    double initial_array[ 5 ] = {100.0, 3.2, 11.3, 45.33};
    int temp_array[ 5 ];
    int i,j;
    int initial_value = 978 , *value , **valuetmp;
    
    value = &initial_value;
    valuetmp = &value;

    printf("double pointer value=%d\n", **valuetmp);
    
    for (i = 0; i < 5; i++) {
        temp_array[ i ] = i + **valuetmp;
    }
         
    for (j = 0; j < 5; ++j) {
        printf("temp_array[ %d ] = %d\n", j, temp_array[ j ]);
    }
    printf("\n");

    for (n = 0; n <= num; ++n) {
        w = n + 1;
        x = n - 2;
        if (x == 0) {
            int a = 0;
            a = (w + 2) * 2 - 1;
            printf("before swap: x=%d, y=%d\n", num, a);
            x = swap(&num, &a);
        }
        else 
            x = n % 2;
        
        y = n * 3; z = n / 4;
        ++count;
        printf("Result:\n");
        printf("w=%d\n", w);
        printf("x=%d\n", x);
        printf("y=%d\n", y);
        printf("z=%d\n", z);
        printf("num1=%f\n", num1++);
        printf("for loop count=%d\n", count);
        printf("\n");
    }
    return 0;
}
