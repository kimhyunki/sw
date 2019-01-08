#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

#include <linux/fs.h>

#define DEV_NAME	"simple-ioctl"
#define NUM_MAJOR	0

static long dev_ioctl (struct file *file, unsigned int cmd, unsigned long arg)
{
	switch (cmd) {
		default:
			printk(KERN_INFO "%s: default\n", __func__);
			return -EINVAL;
	}	
}

static const struct file_operations ioc_fops = {
	.owner = THIS_MODULE,
	.unlocked_ioctl = dev_ioctl,
};

static int __init simple_init(void)
{
	int ret;

	printk(KERN_INFO "ioctl simple driver init!\n");

	ret = register_chrdev(NUM_MAJOR, DEV_NAME, &ioc_fops);
	if (ret < 0) {
		printk(KERN_ERR "chrdev register failed: %d\n", ret);
		return ret;
	}

	return 0;
}
static void __exit simple_exit(void) 
{

	unregister_chrdev(NUM_MAJOR, DEV_NAME);

	printk(KERN_INFO "simple driver exit!\n");
}
module_init(simple_init);
module_exit(simple_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Kim Hyun ki");
MODULE_DESCRIPTION("A ioctl simple example Linux module.");
MODULE_VERSION("0.01");
