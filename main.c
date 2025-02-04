#include <stdio.h>

extern  int  get_valid_int(); //первая функция на ассемблере)))
int main()
{
	printf("Hello, YusVel!!!\n");
	while(1)
	{
			int a = get_valid_int();
			printf("You entered:%d\n", a);
	}

	return 0;
}