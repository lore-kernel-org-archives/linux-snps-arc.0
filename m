From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 4 Sep 2018 18:13:28 +0000
Subject: [PATCH v2 2/4] ARC: allow to use IOC and non-IOC DMA devices
 simultaneously
References: <20180730162636.3556-1-Eugeniy.Paltsev@synopsys.com>
 <20180730162636.3556-3-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B08C83D@us01wembx1.internal.synopsys.com>
 <1534180089.3962.68.camel@synopsys.com>
 <81ddd506-1f7e-db82-4c77-ff08b1c15dd3@synopsys.com>
 <1534963226.3962.215.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B09164B@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

On 08/22/2018 11:40 AM, Eugeniy Paltsev wrote:
>
>> Reading kernel/dma/* I see what you mean. We check @ioc_enable at the time of
>> registering the dma op for coherent vs. non coherent case, so there's common vs.
>> ARC versions of alloc/free for coherent vs. noncoherent.
> Just to be sure that we understand both each other and source code correctly: 
> - In coherent case we use dma_direct_* ops which doesn't use ARC alloc functions (arch_dma_{alloc|free})
> - In non-coherent case we use dma_noncoherent_* ops which uses ARC alloc functions (arch_dma_{alloc|free})

Right I see that.

>> But then I'm curious why
>> do we bother to check the following in new arch_dma_(alloc|free) at all.
>>
>> 	if (attrs & DMA_ATTR_NON_CONSISTENT)
>>
>> Isn't it supposed to be NON_CONSISTENT always given the way new code works ?
> DMA_ATTR_NON_CONSISTENT flag is not related to IOC topic.
> It is a flag which we can pass to dma_{alloc|free}_attrs function from driver side.
>
> According to documentation:
>   DMA_ATTR_NON_CONSISTENT: Lets the platform to choose to return either
>   consistent or non-consistent memory as it sees fit.

Right I'd them mixed up. But then in case of direct dma ops, the attr is simply
ignored in dma_alloc_attrs() -> dma_direct_alloc(). User always gets coherent memory.

>
> We check this flag in arch_dma_alloc (which are used in non-coherent case) to
> skip MMU mapping if we are advertised that consistency is not required.
>
> So, actually we can get rid of this flag checking in arch_dma_alloc and 
> simply always do MMU mapping to enforce non-cachability and return
> non-cacheable memory even if DMA_ATTR_NON_CONSISTENT is passed.
> But I don't sure we want to do that.
>
> BTW: dma_alloc_coherent is simply dma_alloc_attrs with attrs == 0.
>
