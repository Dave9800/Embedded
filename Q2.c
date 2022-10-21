#include <msp430.h> 

int add(int a, int b);
/**
 * main.c
 */
int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
    int a = 9;
    int b = 17;
    int sum = add(a, b);
    if (sum == 26)
    {
        // no overflow
        P1OUT &= ~BIT0;
    }
    else
    {
        // overflow
        P1OUT |= BIT0;
    }
    return 0;
}
int add(int a, int b)
{
    int result = a + b;
    return result;
}
