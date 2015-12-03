From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 03:57:33 +0000
Subject: Non existing DMA functions in ARC: dma_alloc_attrs,
 dma_free_attrs, dma_mmap_attrs
References: <C060B4F571DB524BB6D72E2C236D8FB002199FE6@DE02WEMBXB.internal.synopsys.com>
 <565F8BA2.4000506@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D483A@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 03 December 2015 05:54 AM, Carlos Palminha wrote:
> Hi Vineet,
>
> I cherry picked those commits and now i'm getting a different error.
>
> any clue? Am i testing "untested" code?! :)
>
> Regards,
> C.Palminha
>
> ---
>   CC      init/do_mounts.o
> In file included from include/linux/skbuff.h:34:0,
>                  from include/linux/icmpv6.h:4,
>                  from include/linux/ipv6.h:71,
>                  from include/net/ipv6.h:16,
>                  from include/linux/sunrpc/clnt.h:27,
>                  from include/linux/nfs_fs.h:30,
>                  from init/do_mounts.c:32:
> include/linux/dma-mapping.h: In function ?dma_set_coherent_mask?:
> include/linux/dma-mapping.h:104:2: error: implicit declaration of function ?dma_supported? [-Werror=implicit-function-declaration]
>   if (!dma_supported(dev, mask))
>   ^
> include/linux/dma-mapping.h: In function ?dma_set_mask_and_coherent?:
> include/linux/dma-mapping.h:119:2: error: implicit declaration of function ?dma_set_mask? [-Werror=implicit-function-declaration]
>   int rc = dma_set_mask(dev, mask);
>   ^
> include/linux/dma-mapping.h: In function ?dma_zalloc_coherent?:
> include/linux/dma-mapping.h:190:2: error: implicit declaration of function ?dma_alloc_coherent? [-Werror=implicit-function-declaration]
>   void *ret = dma_alloc_coherent(dev, size, dma_handle,
>   ^
> include/linux/dma-mapping.h:190:14: warning: initialization makes pointer from integer without a cast [enabled by default]
>   void *ret = dma_alloc_coherent(dev, size, dma_handle,
>               ^
> In file included from include/linux/icmpv6.h:4:0,
>                  from include/linux/ipv6.h:71,
>                  from include/net/ipv6.h:16,
>                  from include/linux/sunrpc/clnt.h:27,
>                  from include/linux/nfs_fs.h:30,
>                  from init/do_mounts.c:32:
> include/linux/skbuff.h: In function ?skb_frag_dma_map?:
> include/linux/skbuff.h:2510:2: error: implicit declaration of function ?dma_map_page? [-Werror=implicit-function-declaration]
>   return dma_map_page(dev, skb_frag_page(frag),

I'm not sure what exact code you are building off - linux-next of today builds
just fine !
Can u not baseline ur work off linux-next

-Vineet


>
>
> On 02-12-2015 13:19, Carlos Palminha wrote:
>> Hi Vineet,
>>
>> I'm using drm-next (its currently based on 4.4-rc3).
>>
>> Regarding linux-next DMA patches I assume you are talking about these 3 commits:
>> * 19ab4d3aff0426058fe36aae4ac56320a6e4c6be
>> * 8ee24f794c2dfff85930f25eab4f11a9bde7f920
>> * c27a81903ba596c879a45e3028135a4f37fb1837
>>
>> Regards,
>> C.Palminha
>>
>> -----Original Message-----
>> From: Vineet Gupta 
>> Sent: quarta-feira, 2 de Dezembro de 2015 06:32
>> To: Carlos Palminha; linux-snps-arc at lists.infradead.org
>> Cc: Alexey Brodkin
>> Subject: Re: Non existing DMA functions in ARC: dma_alloc_attrs, dma_free_attrs, dma_mmap_attrs
>>
>> On Wednesday 02 December 2015 01:09 AM, Carlos Palminha wrote:
>>> Hi guys,
>>>
>>> I'm bringing up a new ARC PGU driver for DRM framework with latest kernel tree.
>>> I'm using ARC AXS101 as a base and selected one the DRM required config: HAVE_DMA_ATTRS due to some memory allocation helpers in DRM.
>>>
>>> I'm getting some errors with DMA functions not implemented in ARC: dma_alloc_attrs, dma_free_attrs, dma_mmap_attrs
>>>
>>> Any clue?
>>>
>>> Regards,
>>> C.Palminha
>>>
>>> ---
>>> include/linux/dma-mapping.h: In function 'dma_alloc_writecombine':
>>> include/linux/dma-mapping.h:283:2: error: implicit declaration of function 'dma_alloc_attrs' [-Werror=implicit-function-declaration]
>>>   return dma_alloc_attrs(dev, size, dma_addr, gfp, &attrs);
>> This is because ARC port current lacks support for dma_attr_t and associated helpers.
>> There is a series in flight in linux-next, by Christoph, which already addresses that.
>>
>> You can either cherry-pick those or in the interim use the hack attached.
>>
>> P.S. Per your comment at top, I'm assuming you are working off of mainline 4.3 or 4.4
>>
>> -Vineet
>>
