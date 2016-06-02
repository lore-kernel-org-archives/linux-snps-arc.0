From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 2 Jun 2016 07:35:33 +0000
Subject: Fwd: [PATCH 2/2 v2] ARC: [axs10x] Specify reserved memory for
 frame buffer
References: <1461853196-15599-3-git-send-email-abrodkin@synopsys.com>
 <57468A6C.9080505@synopsys.com> <1464253672.4578.8.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4EAE493@us01wembx1.internal.synopsys.com>
 <1464694143.6538.18.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4EAF35D@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 31 May 2016 04:59 PM, Alexey Brodkin wrote:
> Hi Vineet!
>
> On Thu, 2016-05-26@09:29 +0000, Vineet Gupta wrote:
>> On Thursday 26 May 2016 02:38 PM, Alexey Brodkin wrote:
>>>  1) IOC aperture is set to cover 0x8000_0000-0xA000_0000
>>>  2) FB area is 0xBE00_0000 - 0xC000_0000
>> So if someone rebuilds AXS103 with 1GB of memory in DT then they are screwed
>> because 0xa000_0000 to 0xBDFF_FFFF will not be io-coherent. A DMA buffer in that
>> range will be corrupt.
>>
>> The point is this IOC window programming must be tied to amount of memory in DT
>> and not assume 512MB
>> This is needed for supporting other customer platforms !
> Ok so actually what I think worth doing here is reverse our current logic.
> As of today we treat all memory except that special "reserved" region as covered
> by IOC. But if we want to have more robust IOC usage IMHO it would be better to
> specify dedicated "reserved area" for IOC and everything else let go outside of IOC
> aperture.

Not really - we want to utilize hardware capabilities to maximum - not minimum -
as in exception should be when IOC can't be used and not the other way around.
> This approach will allow:
>  [1] Having 1 known "reserved area" in DT parse its start and length and according to
>      it set IOC. Moreover here we'll do checks on proper start and size settings.
>      Remember IOc aperture should be 4kB aligned and size is set as
>      2^(SIZE+2)kB (which is 4*2^SIZE kB).
>  [2] Remove possible side-effects (if there're any - and that's quite interesting to
>      check) that could be caused by memory operations not related to peripherals but
>      still falling in IOC aperture and thus somehow additionally loading IOC snooper
>      logic.

I'm not sure what you imply by point #2 above.

> Only downside (which might not be a downside really) we'll need to specify IOC-covered
> memory for each peripheral that we want to use DMA. Well and probably not all drivers
> support memory allocation from reserved memory blocks, remember my commit that adds
> this feature to ARC PGU. As of today only ARM HDLCD and ARC PGU utilize
> of_reserved_mem_device_init().

Thats exactly my point above. We need to add for exception and not common case.

> Now thinking a bit more about this implementation I understood that we'll need to
> improve our DMA cache ops so different ops could be used for different memory areas.
> As of today if IOC is enabled we don't do any cache ops for DMAed data and fortunately
> PGU's frame-buffer is used as uncached so no cache ops are required. But if for some
> reason another peripheral is put outside IOC aperture we'll definitely need to do
> explicit cache flush/invalidation on its data buffers.

I really like this idea - this will certainly be needed for silicon
implementations which will likely have per peripheral IOC setting (such as routing
to IOC port or not) in addition to the blanket Core setting of IOC aperture. Thus
we can use that per device dma op hooks to do this additional ioc foo.

In the mean time, the pressing issue is potentially ticking time bomb of AXS103
broken (IOC + PGU + 1GB DDR) - let us add a boot time check in platform code to
panic if that is the case.

-Vineet
