From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Thu, 9 Mar 2017 19:33:14 +0000
Subject: [PATCH] arc: get rate from clk driver instead of reading device
 tree
In-Reply-To: <9769fc4e-ffa4-143f-bb49-a42735e29d54@synopsys.com>
References: <1487759796-14418-1-git-send-email-vzakhar@synopsys.com>
 <9769fc4e-ffa4-143f-bb49-a42735e29d54@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1489087993.2333.20.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2017-02-22@10:49 -0800, Vineet Gupta wrote:
> On 02/22/2017 02:36 AM, Vlad Zakharov wrote:
> > We were reading clock rate directly from device tree "clock-frequency"
> > property of corresponding clock node in show_cpuinfo function.
> >?
> > Such approach is correct only in case cpu is always clocked by
> > "fixed-clock". If we use clock driver that allows rate to be changed
> > this won't work as rate may change during the time or even
> > "clock-frequency" property may not be presented at all.
> >?
> > So this commit replaces reading device tree with getting rate from clock
> > driver. This approach is much more flexible and will work for both fixed
> > and mutable clocks.
> 
> So except the clk_put() comment - this looks much better to me.
> 
> And while we are at it - one of my wish list has been to print the core clk in
> early boot - i.e. in setup_processor()->arc_cpu_mumbojumbo() call path which is
> different from the other case u fixed. Any ideas how to do that - clk framework
> will not have init by then - so we need to read out from FDT or some such !

We can either parse FDT or read from real hardware - but is that the point?
I thought the goal is to get rid of as much board-dependent code as possible, isn't it?

In fact there are two ways of getting frequencies before clk framework inits:?

? 1) Parse FDT - this way is not platform-dependent, but if someone adds clock nodes without "clock-frequency" property
this is gonna fail. The second issue here is that device tree property is not believed to be accurate - actual value may
differ. So, there are a lot of disadvantages.

? 2) Read values from real hardware: this is platform-dependent way and we will have add such "hacks" for each supported
platform even if clock driver is provided for such platform. And that's why I don't like this way.

Of course clk framework initializes a bit later. But maybe we can wait for this and add just a couple of code lines that
read rate using common clk API?

-- 
Best regards,
Vlad Zakharov <vzakhar at synopsys.com>
