From: marex@denx.de (Marek Vasut)
Date: Fri, 27 May 2016 15:21:50 +0200
Subject: Unaligned flush_dcache_range in axs101.c
In-Reply-To: <1464262710.4578.17.camel@synopsys.com>
References: <570219DD.4020007@suse.de>	
 <1460396935.5119.57.camel@synopsys.com> <570BE4D8.9050303@denx.de>	
 <1460398438.5119.73.camel@synopsys.com> <570BF185.2050705@denx.de>	
 <1460725252.3025.55.camel@synopsys.com> <5710F165.9040008@denx.de>
 <1464262710.4578.17.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <574849EE.7030108@denx.de>
To: linux-snps-arc@lists.infradead.org

On 05/26/2016 01:39 PM, Alexey Brodkin wrote:
> Hi Marek,

Hi!

> On Fri, 2016-04-15@15:49 +0200, Marek Vasut wrote:
>> On 04/15/2016 03:00 PM, Alexey Brodkin wrote:
>>> Cache management functions should be implemented per arch or platform and so
>>> that they match requirements of underlying hardware. If hardware may only work on
>>> whole cache line then cache routines must do exactly this.
>> Is ARC designed this way ?
>>
>>>
>>> As an extra options there could be a check for input arguments in those functions
>>> that will warn a user if he or she passes unaligned start and/or end addresses.
>> Right, ARMv7 does it already, ARM926 too, others need fixing.
>>
>>>
>>> Now speaking about data layout your example is very correct and we saw a lot of
>>> such real use-cases - developer of drivers should design data layout such that
>>> cache management doesn't lead to data corruption.
>> Right.
>>
>>>
>>> But again the code in question has nothing to do with cache line.
>>> I only need to writeback 1 word and don't care what really happens with
>>> all remaining words in the same cache line. And my implementation of
>>> flush_dcache_range() will do everything perfectly correct - it will
>>> flush exactly 1 line that contains my word I modified.
>> And this will lead to silent corruption which is hard to track down and
>> debug. I would rather have a check-and-refuse behavior than
>> silently-fix-and-permit.
> 
> Even though that discussion is still not finished very related issue
> actually hit me recently. So it looks like there's more here to discuss and
> probably with wider audience.
> 
> So what happens: in our newer ARC HS38 cores we may have so-called IO Coherency
> block. This hardware block basically makes sure data exchanged between CPU cores
> (we may have single-core CPU or multi-core CPU) and DMA masters are coherent.
> That means if IOC exists and enabled in the core we:
>  1) Don't need to do manual cache management when sending data to peripherals and
>     getting data back. IOC makes all work for us.
>  2) We must not do manual cache management when sending data to peripherals and
>     getting data back. Simply because our manual actions will:
>     a) Interfere with what IOC already does
>     b) Introduce extra performance overhead which we wanted to get rid of with
>        invention of IOC.
> 
> So with peripherals it is all cool now.
> I was just disabling all cache management routines if IOC gets detected on boot.
> 
> But returning back to your initial complaint.
> 
> In the code you were referring what I wanted to modify reset vector of the slave core.
> And while we were living without IOC it was all OK. My code above wrote-back
> (or as we used to call it within ARC "flushed") L1 data cache with modified
> reset vector contents to L2 (which is combined data and instruction cache in case of ARC)
> and once slave core was unhalted it read reset vector contents via instruction
> fetch hardware and executed right what I wanted.

Do you plan to run multiple u-boot instances in parallel ?
btw. can you read core ID to discern the master core (core 0) and the
slave cores (anything which you need to unhalt)?

> Now with IOC enabled and as I wrote above with disabled cache operations new reset
> vector value gets stuck in L1 data cache of the master core. And slave cores never get
> proper value in reset vector effectively going into the wild on unhalt.
> 
> The same actually applies to U-Boot relocation and happens even on single-core setups.
> We copy U-Boot's image to the new location in the memory and until we explicitly flush
> L1 data cache to the underlying L2 or DDR (if L2 doesn't exist) something may not make its
> way back to the CPU when it starts fetching instructions from that new location.
> 
> So as a summary I would say that we may want to introduce different cache handling routines:
>  [1] DMA related
>  [2] Non-DMA related
> 
> Any thoughts? I'm especially interested if something similar happens on other arches and
> how people deal with it.

I would suggest you to implement lowlevel_init() where you check the
core ID and if it's slave core, just make it loop while invalidating
it's caches. That way, the core would always fetch fresh data. Also,
you can make the secondary core check some variable which the core 0
would set to make the slave exit the loop and execute on. Maybe use
another variable to specify execution address too.

> -Alexey
> 


-- 
Best regards,
Marek Vasut
