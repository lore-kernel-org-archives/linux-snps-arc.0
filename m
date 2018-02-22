From: shawn.lin@rock-chips.com (Shawn Lin)
Date: Fri, 23 Feb 2018 00:36:59 +0800
Subject: [PATCH v2] mmc: dw_mmc: Fix the DTO timeout overflow calculation
 for 32-bit systems
In-Reply-To: <1519315414.19466.9.camel@synopsys.com>
References: <20180222133418.29336-1-Evgeniy.Didin@synopsys.com>
 <bec45955-1e84-400b-961f-35b5342c671f@rock-chips.com>
 <1519315414.19466.9.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e5173fe5-4080-4fa8-ed3a-8aff32932493@rock-chips.com>
To: linux-snps-arc@lists.infradead.org

On 2018/2/23 0:03, Alexey Brodkin wrote:
> Hi Shawn,
> 
> On Thu, 2018-02-22@23:28 +0800, Shawn Lin wrote:
> 
> [snip]
> 
>>>> Stack Trace:
>>>>   arc_unwind_core.constprop.1+0xd0/0xf4
>>>>   dump_stack+0x68/0x80
>>>>   warn_slowpath_null+0x4e/0xec
>>>>   sg_miter_next+0x28/0x20c
>>>>   dw_mci_read_data_pio+0x44/0x190
>>>>   dw_mmc f000a000.mmc: Unexpected interrupt latency
>>
>> I think we tested SD cards but the main reason we missed
>> this is that we don't use pio mode since dw_mmc decides
>> the transfer mode via HCON register but we don't have one
>> platform at hand then to do that. Given the data-transfer-over
>> interrupt should come after the data hit the RAM, so pio mode
>> could probably consume more time than IDMAC.
> 
> That's really interesting.
> 
> I was under impression that we use internal DMA controller (AKA IDMAC)
> on that platform (HSDK).
> 
> This is what we typically see in bootlog (this extract is taken from
> 4.15-r9):
> --------------------------------->8--------------------------------
> dw_mmc f000a000.mmc: 'num-slots' was deprecated.
> dw_mmc f000a000.mmc: IDMAC supports 32-bit address mode.
> dw_mmc f000a000.mmc: Using internal DMA controller.
> dw_mmc f000a000.mmc: Version ID is 290a
> dw_mmc f000a000.mmc: DW MMC controller at irq 12,32 bit host data width,16 deep fifo
> --------------------------------->8--------------------------------
> 
> I'm not really sure how PIO mode (which stands for non-DMA mode) got used
> given we have IDMAC in the hardware.

There is a DW_MCI_DMA_THRESHOLD to decides whether we use IDMA or pio
per request, since pio probably do fast than IDMA which need setup the
decriptor list if the request size is small. But that never happen for
this case as the V1 commit log said "copying file from mmc" which means
your minimal data block size is 512 anyway. So the only reasonable guess
is that just happend when initializing the card rather then copying the 
file..

> 
> @ Evgeniy, could you please check why IDMAC is not used?
> 
> -Alexey
> 


-- 
Best Regards
Shawn Lin
