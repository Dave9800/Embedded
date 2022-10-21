#include <msp430.h> 

float b = 5.0;
/**
 * main.c
 */
int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer

    unsigned char c= 0x0f;
    unsigned char d= 0x5;
    unsigned char e= c+1;
    unsigned char f= d-1;


    int a = 3;
    a+=1;
    b-=1;

    e || f;
    c && d;

    return 0;
}
