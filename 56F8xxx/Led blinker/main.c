#include "56F801x.h"

void delay(volatile unsigned long int val)
{
	for (;val;val--);
}

main()
{
	unsigned int teste;
	GPIOA_DDR = 0xff;
	GPIOA_PER = 0;
	GPIOA_DR = 0;
	while(1)
	{
		teste = 1;
		for (;teste<256;teste*=2)
		{
			GPIOA_DR = teste;
			delay(100000);
			GPIOA_DR = 0;
			delay(100000);
		}
	}
}



