/* Testcase2 */

/* C subset:
 * Variable declaration/initialization
 * Int, double, char
 * Simple statement
 * ifelse/for loop
 * function
 * Comment
 */
#include <stdio.h>

// swap function
int swap(int x, int y)
{
    int tmp;
    tmp = x;
    x = y;
    y = tmp;
    printf("swap: x=%d, y=%d\n", x, y);
    return y - 10;
}

// main function
int main(void)
{
    int n, w, x, y, z;
    int num = 10;
    double num1 = 0;
    char character = 'W';

    for (n = 0; n <= num; ++n)
    {
        w = n + 1;
        x = n - 2;
        if (x == 0)
        {
            int a = 0;
            a = (w + 2) * 2 - 1;
            x = swap(10, a);
        }
        else
        {
            x = n % 2;
        }
        y = n * 3;
        z = n / 4;
        printf("Result:\n");
        printf("w=%d\n", w);
        printf("x=%d\n", x);
        printf("y=%d\n", y);
        printf("z=%d\n", z);
        printf("num1=%f\n", num1);
        printf("\n");
    }
    return 0;
}
