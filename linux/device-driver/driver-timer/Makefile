obj-m += simple.o

KDIR=/work/kernel/output-linux-imx6_3.14.28

all:
	 make -C $(KDIR) M=$(PWD) modules
clean:
	 make -C $(KDIR) M=$(PWD) clean
