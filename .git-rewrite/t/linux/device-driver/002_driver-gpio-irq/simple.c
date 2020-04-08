#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/timer.h>
#include <linux/gpio.h>
#include <linux/interrupt.h>
#include <linux/irq.h>

static struct timer_list pwr_button;

#define SET_TIME_MSEC(x) (jiffies + msecs_to_jiffies(x))

#define IMX_GPIO_NR(bank, nr) (((bank) - 1) * 32 + (nr))

#define PWR_BUTTON	IMX_GPIO_NR(4, 6)
#define PWR_HOLD	IMX_GPIO_NR(4, 7)

#define PWR_DOWN_COUNT	3
static int pwr_down = 0;

void check_pwr_button (unsigned long data)
{
	int pwr_button_val;

//	printk(KERN_INFO "check pwr button!\n");

	pwr_button_val = gpio_get_value(PWR_BUTTON);

	if (pwr_down == PWR_DOWN_COUNT) {

		printk(KERN_INFO "power down!\n");

		gpio_set_value(PWR_HOLD, 0);

	}

	if (0 < pwr_button_val) {

		pwr_down = 0;

	} else {

		pwr_down += 1;
	
		printk(KERN_INFO "pwr button on!, pwr_down=%d\n", pwr_down);
	}

}

static irqreturn_t interrupt_pwr_botton (int irq, void *dev)
{
	printk(KERN_INFO "interrupt button!\n");

//	setup_timer(&pwr_button, check_pwr_button, 0);
//	mod_timer(&pwr_button, SET_TIME_MSEC(1000));

	return IRQ_HANDLED;
}

int init_gpio (void)
{
	int ret = 0;
#if 0
	gpio_request(PWR_BUTTON,"pwr_button");
	gpio_direction_input(PWR_BUTTON);
#endif

	gpio_request(PWR_BUTTON,"pwr_button");
	irq_set_irq_type(gpio_to_irq(PWR_BUTTON), IRQ_TYPE_EDGE_FALLING);

	ret = request_irq(gpio_to_irq(PWR_BUTTON), interrupt_pwr_botton, 0, "pwr_button_check", NULL);
	if (ret < 0)
		goto out;

	gpio_request(PWR_HOLD, "pwr_hold");
	gpio_direction_output(PWR_HOLD, 1);
	gpio_set_value(PWR_HOLD, 1);

	return 0;
out:
		printk(KERN_INFO "fail interrupt! ret=%d\n", ret);
		return ret;
}

static int __init simple_init(void)
{
	int ret = 0;

	printk(KERN_INFO "simple driver init!\n");

	ret = init_gpio();
	if (ret < 0)  {
		printk(KERN_INFO "gpio init failed!\n");
		return 0;
	}


	return 0;
}

static void __exit simple_exit(void) {
	printk(KERN_INFO "simple driver exit!\n");

	del_timer(&pwr_button);

	free_irq(gpio_to_irq(PWR_BUTTON), NULL);
	gpio_free(PWR_BUTTON);

}

module_init(simple_init);
module_exit(simple_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Kim Hyun ki");
MODULE_DESCRIPTION("A simple example Linux module.");
MODULE_VERSION("0.01");
