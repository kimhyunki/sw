#include <stdio.h>

int main (int argc, char *argv[])
{
	int bugs = 100;
	double bug_rate = 1.2;

	printf("You have %d bugs at the imaginary rate of %f.\n", 
			bugs, bug_rate);

	printf("sizof(long)=%ld\n", sizeof(long));
	printf("sizof(unsigned long)=%ld\n", sizeof(unsigned long));
	long universe_of_defects = 7L * 1024L * 1024L * 1024L * 1024L * 1024L * 1024L;
	printf("The entire universe has %ld bugs.\n", universe_of_defects);

	double expected_bugs = bugs * bug_rate;
	printf("You are expected to have %f bugs.\n", expected_bugs);

	double part_of_universe = expected_bugs / universe_of_defects;
	printf("That is only a %e portion of the universe.\n", 
			part_of_universe);

	// 이것은 말도 안된다 . 이상한 코드의 예를 든것 뿐이다.
	char nul_byte = '\0';
	int care_percentage = bugs * nul_byte;
	printf("Which means you should care %d%%.\n", care_percentage);

	int a = 10;
	char b = 20;
	printf("a * b = %d\n", a * b);

	return 0;
}

