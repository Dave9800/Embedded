#include <msp430.h> 

int add(int a, int b);
/**
 * main.c
 */
int d;
int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
    int a = 0b10001111000000001;
    int b = 0b10001100000000001;


    d = add(a, b);
    while(1);

    return 0;
}

int add(int a, int b)
{
    int d = a + b;
    return d;
}
