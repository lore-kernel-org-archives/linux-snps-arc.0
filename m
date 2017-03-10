From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 9 Mar 2017 17:24:28 -0800
Subject: [PATCH] arc: get rate from clk driver instead of reading device
 tree
In-Reply-To: <1489087993.2333.20.camel@synopsys.com>
References: <1487759796-14418-1-git-send-email-vzakhar@synopsys.com>
 <9769fc4e-ffa4-143f-bb49-a42735e29d54@synopsys.com>
 <1489087993.2333.20.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <eaefe563-b5e5-1fbe-c610-bb44599a6c03@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 03/09/2017 11:33 AM, Vlad Zakharov wrote:
>
>> And while we are at it - one of my wish list has been to print the core clk in
>> early boot - i.e. in setup_processor()->arc_cpu_mumbojumbo() call path which is
>> different from the other case u fixed. Any ideas how to do that - clk framework
>> will not have init by then - so we need to read out from FDT or some such !
> We can either parse FDT or read from real hardware - but is that the point?
> I thought the goal is to get rid of as much board-dependent code as possible, isn't it?

I'm not asking to add board specific code in setup.c - but we do want to print the
frequency as available. Currently we only print for AXS but for some new board it
will likely not be present so at the very least print what is in the DT.

So the idea would be to have a default which reads from FDT and board/platform can
override it with more accurate info (from say hardware). You can start off with
using weak function approach for prototyping and later use a callback approach
registered by boards etc !

> In fact there are two ways of getting frequencies before clk framework inits: 
>
>   1) Parse FDT - this way is not platform-dependent, but if someone adds clock nodes without "clock-frequency" property
> this is gonna fail. The second issue here is that device tree property is not believed to be accurate - actual value may
> differ. So, there are a lot of disadvantages.
>
>   2) Read values from real hardware: this is platform-dependent way and we will have add such "hacks" for each supported
> platform even if clock driver is provided for such platform. And that's why I don't like this way.
>
> Of course clk framework initializes a bit later. But maybe we can wait for this and add just a couple of code lines that
> read rate using common clk API?

I'd still prefer to see the value provided in DT and any updates since !

-Vineet
-Vineet
