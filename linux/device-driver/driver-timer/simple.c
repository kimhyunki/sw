#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/timer.h>

static struct timer_list pwr_button;

#define SET_TIME_MSEC(x) (jiffies + msecs_to_jiffies(x))

void check_pwr_button (unsigned long data)
{
	printk(KERN_INFO "check pwr button!\n");

	mod_timer(&pwr_button, SET_TIME_MSEC(1000));
}

static int __init simple_init(void) {

	printk(KERN_INFO "simple driver init!\n");

	setup_timer(&pwr_button, check_pwr_button, 0);
	mod_timer(&pwr_button, SET_TIME_MSEC(1000));

	return 0;
}

static void __exit simple_exit(void) {
	printk(KERN_INFO "simple driver exit!\n");

	del_timer(&pwr_button);
}

module_init(simple_init);
module_exit(simple_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Kim Hyun ki");
MODULE_DESCRIPTION("A simple example Linux module.");
MODULE_VERSION("0.01");
