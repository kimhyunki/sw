#include <stdio.h>
#include <pollmng.h>

int main (void)
{
	poll_obj_t *obj;
	
	poll_init();
	obj = poll_add(fileno(stdin));

	printf("tcp client program ..\n");

	return 0;
}
