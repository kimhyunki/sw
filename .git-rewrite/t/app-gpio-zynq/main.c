/*
 * auther	kim hyun ki <khkraining@gmail.com>
 * date		2018-08-20
 * brief	export GPIO 프로그램
 *
 */
#include <stdio.h>
#include <string.h>		// strcasecmp
#include <stdlib.h>		// exit,  atio
#include <errno.h>		// errno

#define EXPORT_PATH			"/sys/class/gpio/export"

/*
 * brief	메인 함수
 *			gpio export pin mode
 *			argv[0]:
 *			argv[1]: 
 *			argv[2]: gpio-num
 *			argv[3]: mode
 */
void doexport (int argc, char **argv)
{
	FILE *fd;
	int pin;	
	char *mode;
	char fname[128];


	if (argc != 4) {
		fprintf(stderr, "Usage: %s export gpio-num mode\n", argv[0]);
		exit(1);
	}

	pin = atoi(argv[2]);
	mode = argv[3];

	if ((fd = fopen(EXPORT_PATH, "w")) == NULL) {
		fprintf(stderr, "error: unable to open GPIO export interface: %s\n", strerror(errno));
		exit(1);
	}

	fprintf(fd, "%d\n", pin);
	fclose(fd);
	
	sprintf(fname, "/sys/class/gpio/gpio%d/direction", pin);
	if ((fd = fopen(fname, "w")) == NULL) {
		fprintf(stderr, "error: Can not open \"gpio%d\": %s\n", pin, strerror(errno));
		exit(1);
	}

	if ((strcasecmp(mode, "in") == 0) || (strcasecmp(mode, "input") == 0)) {
		fprintf(fd, "in\n");	
	}
	else if ((strcasecmp(mode, "out") == 0) || (strcasecmp(mode, "output") == 0)) {
		fprintf(fd, "out\n");
	} else {
		fprintf(stderr, "error: Invalild mode: %s. \"in\"or \"out\"\n", mode);
	}

	fclose(fd);
}

/*
 *
 * arg[1]: cmd
 * arg[2]: gpio num
 * arg[3]: value
 * 
 */
void dowrite (int argc, char **argv)
{
	FILE *fd;
	int pin;	
	int val;
	char fname[128];

	if (argc != 4) {
		fprintf(stderr, "Usage: %s write gpio-num value\n", argv[0]);
		exit(1);
	}

	pin = atoi(argv[2]);
	val = atoi(argv[3]);

	if ((val != 1) && (val != 0)) {
		fprintf(stderr, "error: Invalild value: %d. \"0\" or \"1\": %s\n", pin, "Invalild data");
		exit(1);
	}

	sprintf(fname, "/sys/class/gpio/gpio%d/value", pin);
	if ((fd = fopen(fname, "w")) == NULL) {
		fprintf(stderr, "error: Can not open \"gpio%d\": %s\n", pin, strerror(errno));
		exit(1);
	}

	fprintf(fd, "%d\n", val);	

	fclose(fd);
}


/*
 *
 * arg[1]: cmd
 * arg[2]: gpio num
 * 
 */
void doread (int argc, char **argv)
{

	FILE *fd;
	int pin;	
	char fname[128];
	char val[3] = { 0, };
	char direction[3] = { 0, };

	if (argc != 3) {
		fprintf(stderr, "Usage: %s write gpio-num\n", argv[0]);
		exit(1);
	}

	pin = atoi(argv[2]);

	sprintf(fname, "/sys/class/gpio/gpio%d/direction", pin);
	if ((fd = fopen(fname, "r")) == NULL) {
		fprintf(stderr, "error: Can not open \"gpio%d\": %s\n", pin, strerror(errno));
		exit(1);
	}
	fread(direction, sizeof(direction), 1, fd);	
	direction[strcspn(direction, "\n")] = 0;

	fclose(fd);

	sprintf(fname, "/sys/class/gpio/gpio%d/value", pin);
	if ((fd = fopen(fname, "r")) == NULL) {
		fprintf(stderr, "error: Can not open \"gpio%d\": %s\n", pin, strerror(errno));
		exit(1);
	}

	fread(val, sizeof(int), 1, fd);	

	printf("export gpio read: gpio%d, direction: %s value: %s\n",pin ,direction, val);

	fclose(fd);

}

void usage (char *name)
{
	printf("Usage:\n \t%s", name);
	printf(" -h\n");
	printf("\t%s export gpio-num direction\n", name);
	printf("\t%s write  gpio-num value\n", name);
	printf("\t%s read   gpio-num\n", name);
}

/*
 * brief	메인 함수
 */
int main (int argc, char **argv)
{

	printf("################################################################################\n");
	printf("################## Ethernet Carrier board Test start ###########################\n");
	printf("################################################################################\n");

	if (argc == 1) {
		usage(argv[0]);
		return 1;
	}

	if (strcasecmp(argv[1], "-h") == 0) {		// 대소문자를 구별하지 않고 스트링 비교
		usage(argv[0]);
		return 0;
	}

	if (strcasecmp(argv[1], "export"	) == 0)	{ doexport		(argc, argv);	return 0; }
	if (strcasecmp(argv[1], "write"		) == 0)	{ dowrite		(argc, argv);	return 0; }
	if (strcasecmp(argv[1], "read"		) == 0)	{ doread		(argc, argv);	return 0; }




	return 0;
}
