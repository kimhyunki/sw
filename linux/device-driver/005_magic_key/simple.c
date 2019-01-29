#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/sysrq.h>

static void test_sysrq(int dummy)
{
	printk("magic key test\n");
}

static struct sysrq_key_op sysrq_op = {
	.handler = test_sysrq,
	.help_msg = "test_magic_key(x)",
	.action_msg = "TEST_MAGIC_KEY",
};

static int __init magic_key_init(void)
{
	 printk(KERN_INFO "magic_key driver init!\n");
	 register_sysrq_key('x', &sysrq_op);
	 return 0;
}
static void __exit magic_key_exit(void) 
{
	 printk(KERN_INFO "magic_key driver exit!\n");
}

module_init(magic_key_init);
module_exit(magic_key_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Kim Hyun ki");
MODULE_DESCRIPTION("A magic_key example Linux module.");
MODULE_VERSION("0.01");
