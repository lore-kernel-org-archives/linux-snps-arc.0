From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 4 Nov 2016 05:33:54 +0000
Subject: [PATCH v2] arc: Implement arch-specific dma_map_ops.mmap
In-Reply-To: <5fcface9-1402-85b7-2caa-624d650d311e@synopsys.com>
References: <1478185573-12871-1-git-send-email-abrodkin@synopsys.com>
 <5fcface9-1402-85b7-2caa-624d650d311e@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE646785A13C@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta at synopsys.com]
> Sent: Thursday, November 03, 2016 8:04 PM
> To: Alexey Brodkin <Alexey.Brodkin at synopsys.com>; linux-snps-arc at lists.infradead.org
> Cc: linux-kernel at vger.kernel.org; linux-arch at vger.kernel.org; Vineet Gupta <Vineet.Gupta1 at synopsys.com>; Marek Szyprowski
> <m.szyprowski at samsung.com>; stable at vger.kernel.org
> Subject: Re: [PATCH v2] arc: Implement arch-specific dma_map_ops.mmap
> 
> On 11/03/2016 08:06 AM, Alexey Brodkin wrote:
> > We used to use generic implementation of dma_map_ops.mmap which is
> > dma_common_mmap() but that only worked for simpler cached mappings when
> > vaddr = paddr.
> >
> > If a driver requests uncached DMA buffer kernel maps it to virtual
> > address so that MMU gets involved and page uncached status takes into
> > account. In that case usage of dma_common_mmap() lead to mapping of
> > vaddr to vaddr for user-space which is obviously wrong. For more detals
> > please refer to verbose explanation here [1].
> >
> > So here we implement our own version of mmap() which always deals
> > with dma_addr and maps underlying memory to user-space properly
> > (note that DMA buffer mapped to user-space is always uncached
> > because there's no way to properly manage cache from user-space).
> >
> > [1] https://lkml.org/lkml/2016/10/26/973
> >
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
> > Cc: Marek Szyprowski <m.szyprowski at samsung.com>
> > Cc: Vineet Gupta <vgupta at synopsys.com>
> > Cc: <stable at vger.kernel.org>
> 
> I've added a stable 4.5+, since ARC didn't use dma ops until 4.5-rc1.

Again I was hitting a strange problem when sending patch via "git send-email" to
address "<stable at vger.kernel.org> # 3.3.x". Mail server complains on wrong email.
Thus I settled to just mention stable at vger.kernel.org.

Anyways, thanks for doing that!

-Alexey
