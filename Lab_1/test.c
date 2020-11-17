#include <stdio.h>

int main()
{

	unsigned long long factorial = 1;
	int i = 1;
	
	for (i = 1; i <= 20; i++)
	{
		factorial = factorial * i;
	}

	printf("Factorial of 20 is %llu\n", factorial);

	return 0;

}
