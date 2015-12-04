From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Fri, 4 Dec 2015 13:52:22 +0100
Subject: [PATCH v3 03/18] clocksource: Add NPS400 timers driver
In-Reply-To: <DB5PR02MB1141916F4F399704A15F4AE5D60C0@DB5PR02MB1141.eurprd02.prod.outlook.com>
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
 <1448974985-11487-4-git-send-email-noamc@ezchip.com>
 <56615927.30201@linaro.org>
 <DB5PR02MB1141916F4F399704A15F4AE5D60C0@DB5PR02MB1141.eurprd02.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56618C86.7020407@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 12/04/2015 01:26 PM, Noam Camus wrote:
>> From: Daniel Lezcano <daniel.lezcano at linaro.org>
>> Sent: Friday, December 4, 2015 11:13 AM
>>> +obj-$(CONFIG_ARC_PLAT_EZNPS) += timer-nps.o
>
>> CONFIG_CLKSRC_NPS
> I wish this driver to be build only for this specific ARC platform.
> This clock source is embedded in our SoC.

I understand but we are removing all platform specific Kconfig options 
from the drivers. If CONFIG_CLKSRC_NPS is selected by 
CONFIG_ARC_PLAT_EZNPS only, the result is the same.

By the way, it is probable the "if COMPILE_TEST" option is added later 
to the option. We are trying to have the drivers to be compilable on 
different platforms in order to increase the compilation test coverage. 
It is useful for instance when we touch a common code which impact all 
the drivers, we don't need the specific platform to compile on it and we 
minimize a cross compile toolchain usage. Hence compilation failure on 
ARC will be detected sooner, before the next merge window happens.

For this reason, having common code in the driver is important and 
including a platform breaks the current effort.

> It is not meant to be built for any other architecture.
> This is why below I include header from our ARC platform to avoid code duplicity.
>
>>> +#include <plat/ctop.h>
>
>> Why do you need this header ? nps_host_reg ?
> Correct we use common code from our platform.
>
>> We prevent to include headers from <plat> in the drivers directory. You
>> should find a way to get rid of it.
>
> The Only way I can think of is code duplicity and I prefer not to.
> I see some include to asm/mach headers in clocksource, what is the difference?

The difference is <asm> includes are architecture dependent and could be 
acceptable if there is no choice (all arm timers use the same 
functionality from these headers), while <plat> includes are platform 
specific, so restricted to a specific platform.

> Could you suggest a better place for me to place my header file.

Yes, perhaps:

include/soc/nps
drivers/soc/nps

>>> +static void *nps_msu_reg_low_addr[NPS_CLUSTER_NUM] __read_mostly;
>>
>> Perhaps a small optimization...
> Thanks
>
>> static DEFINE_PER_CPU_READ_MOSTLY(void __iomem *, baseaddr);
>
>> static cycle_t nps_clksrc_read(struct clocksource *clksrc)
>> {
>>        void __iomem *base = per_cpu(baseaddr, raw_smp_processor_id());
>>
>   >       return (cycle_t)ioread32be(base);
>> }
>
>> and in the init function:
>
>> for_each_cpu(cpu) {
>>        per_cpu(baseaddr, cpu) = nps_host_reg(cpu,
>>                                       NPS_MSU_BLKID,
>>                                     NPS_MSU_TICK_LOW
>> }
> Thanks again
>
>
>>> +static cycle_t nps_clksrc_read(struct clocksource *clksrc)
>>> +{
>>> +     int cluster = raw_smp_processor_id() >> NPS_CLUSTER_OFFSET;
>>> +
>>> +     return (cycle_t)ioread32be(nps_msu_reg_low_addr[cluster]);
>
>> ,AFAICT, there is a memory barrier with ioread32be, are you really sure
>> we have to use it in this code path ?
> Are you saying to remove use of ioread32be?
> What should I use instead?

Never mind, I looked at the arm's ioread32be definition where there is a 
memory barrier. With this architecture ioread32be uses the generic one 
without the memory barrier (well, yes it uses one in the raw_readl asm 
implementation but we can't do anything).

>>> +
>>> +     dt_root = of_get_flat_dt_root();
>>> +     rate = (u32)of_get_flat_dt_prop(dt_root, "clock-frequency", NULL);
>
>> I don't get why this is done this way. The Kconfig option help says the
>> clocksource rate is 1GHz but in the DT the clock is 88MHz.
> It says that clock source is up to 1GHz

ah ok.

>> It would be cleaner to define a fixed clock and then add a phandle in
>> the DT.
>
>>         timer_clk: timer_clk {
>>                #clock-cells = <0>;
>>                 compatible = "fixed-clock";
>>                clock-frequency = <123456789>;
>>         };
>
>>         timer {
>>                compatible = "ezchip,nps400-timer";
>>                 clocks = <&timer_clk>;
>>        }
>
>> That will result in the same code than the other drivers.
>
>>       clk = of_clk_get(np, 0);
>>      if (IS_ERR(clk)) {
>>               pr_err("%s: invalid clock\n", np->full_name);
>>                return;
>>         }
>
>>       rate = clk_get_rate(clk);
> Once again thanks I will fix this.
>
> -Noam
>


-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
