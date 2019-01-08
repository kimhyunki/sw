#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

static int __init simple_init(void)
{
	 printk(KERN_INFO "simple driver init!\n");
	  return 0;
}
static void __exit simple_exit(void) 
{
	 printk(KERN_INFO "simple driver exit!\n");
}

module_init(simple_init);
module_exit(simple_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Kim Hyun ki");
MODULE_DESCRIPTION("A simple example Linux module.");
MODULE_VERSION("0.01");
