From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 22 Feb 2017 10:49:06 -0800
Subject: [PATCH] arc: get rate from clk driver instead of reading device
 tree
In-Reply-To: <1487759796-14418-1-git-send-email-vzakhar@synopsys.com>
References: <1487759796-14418-1-git-send-email-vzakhar@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9769fc4e-ffa4-143f-bb49-a42735e29d54@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/22/2017 02:36 AM, Vlad Zakharov wrote:
> We were reading clock rate directly from device tree "clock-frequency"
> property of corresponding clock node in show_cpuinfo function.
> 
> Such approach is correct only in case cpu is always clocked by
> "fixed-clock". If we use clock driver that allows rate to be changed
> this won't work as rate may change during the time or even
> "clock-frequency" property may not be presented at all.
> 
> So this commit replaces reading device tree with getting rate from clock
> driver. This approach is much more flexible and will work for both fixed
> and mutable clocks.

So except the clk_put() comment - this looks much better to me.

And while we are at it - one of my wish list has been to print the core clk in
early boot - i.e. in setup_processor()->arc_cpu_mumbojumbo() call path which is
different from the other case u fixed. Any ideas how to do that - clk framework
will not have init by then - so we need to read out from FDT or some such !

> 
> Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
> ---
>  arch/arc/kernel/setup.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index 3093fa8..49b0804 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -10,6 +10,7 @@
>  #include <linux/fs.h>
>  #include <linux/delay.h>
>  #include <linux/root_dev.h>
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/clocksource.h>
>  #include <linux/console.h>
> @@ -488,7 +489,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  {
>  	char *str;
>  	int cpu_id = ptr_to_cpu(v);
> -	struct device_node *core_clk = of_find_node_by_name(NULL, "core_clk");
> +	struct device *cpu_dev = get_cpu_device(cpu_id);
> +	struct clk *cpu_clk = clk_get(cpu_dev, "core_clk");
>  	u32 freq = 0;
>  
>  	if (!cpu_online(cpu_id)) {
> @@ -502,7 +504,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  
>  	seq_printf(m, arc_cpu_mumbojumbo(cpu_id, str, PAGE_SIZE));
>  
> -	of_property_read_u32(core_clk, "clock-frequency", &freq);
> +	freq = clk_get_rate(cpu_clk);
>  	if (freq)
>  		seq_printf(m, "CPU speed\t: %u.%02u Mhz\n",
>  			   freq / 1000000, (freq / 10000) % 100);
> 
