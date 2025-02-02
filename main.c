#include <stdio.h>

extern  int  get_valid_int();
int main()
{
	printf("Hello, YusVel!!!\n");
	int a = get_valid_int();
	printf("You entered:%d", a);
	return 0;
}