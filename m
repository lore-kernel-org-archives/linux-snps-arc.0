From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 28 Feb 2017 15:11:03 +0000
Subject: [PATCH] arc: get rate from clk driver instead of reading device
 tree
In-Reply-To: <d1db32ca-333e-e900-171e-3b0735cba2a2@synopsys.com>
References: <1487759796-14418-1-git-send-email-vzakhar@synopsys.com>
 <d1db32ca-333e-e900-171e-3b0735cba2a2@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488294662.3913.11.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2017-02-22@10:34 -0800, Vineet Gupta wrote:
> On 02/22/2017 02:36 AM, Vlad Zakharov wrote:
> > 
> > We were reading clock rate directly from device tree "clock-frequency"
> > property of corresponding clock node in show_cpuinfo function.
> > 
> > Such approach is correct only in case cpu is always clocked by
> > "fixed-clock". If we use clock driver that allows rate to be changed
> > this won't work as rate may change during the time or even
> > "clock-frequency" property may not be presented at all.
> > 
> > So this commit replaces reading device tree with getting rate from clock
> > driver. This approach is much more flexible and will work for both fixed
> > and mutable clocks.
> > 
> > Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
> > ---
> > ?arch/arc/kernel/setup.c | 6 ++++--
> > ?1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> > index 3093fa8..49b0804 100644
> > --- a/arch/arc/kernel/setup.c
> > +++ b/arch/arc/kernel/setup.c
> > @@ -10,6 +10,7 @@
> > ?#include <linux/fs.h>
> > ?#include <linux/delay.h>
> > ?#include <linux/root_dev.h>
> > +#include <linux/clk.h>
> > ?#include <linux/clk-provider.h>
> > ?#include <linux/clocksource.h>
> > ?#include <linux/console.h>
> > @@ -488,7 +489,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
> > ?{
> > ?	char *str;
> > ?	int cpu_id = ptr_to_cpu(v);
> > -	struct device_node *core_clk = of_find_node_by_name(NULL, "core_clk");
> > +	struct device *cpu_dev = get_cpu_device(cpu_id);
> > +	struct clk *cpu_clk = clk_get(cpu_dev, "core_clk");
> > ?	u32 freq = 0;
> > ?
> > ?	if (!cpu_online(cpu_id)) {
> > @@ -502,7 +504,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
> > ?
> > ?	seq_printf(m, arc_cpu_mumbojumbo(cpu_id, str, PAGE_SIZE));
> > ?
> > -	of_property_read_u32(core_clk, "clock-frequency", &freq);
> > +	freq = clk_get_rate(cpu_clk);
> > ?	if (freq)
> > ?		seq_printf(m, "CPU speed\t: %u.%02u Mhz\n",
> > ?			???freq / 1000000, (freq / 10000) % 100);
> 
> I'm not too familiar with clk API, do u need to clk_put() afterwards ? @Alexey can
> u please check !

I'm not really sure why clk_put() got in the picture here at all.
As it is mentioned here?http://elixir.free-electrons.com/source/include/linux/clk.h?v=4.10#L305
clk_put() means "free" the clock source.

Anyways this patch alone was not sufficient due to missing changes in .dts files and
Vlad is going to send v2 soonish.

-Alexey
