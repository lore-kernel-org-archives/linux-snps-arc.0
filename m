From: Ramiro.Oliveira@synopsys.com (Ramiro Oliveira)
Date: Tue, 15 Nov 2016 15:45:35 +0000
Subject: [PATCH v2] arc: Implement arch-specific dma_map_ops.mmap
In-Reply-To: <1478185573-12871-1-git-send-email-abrodkin@synopsys.com>
References: <1478185573-12871-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a5cd26c2-519e-c541-8044-b24685df8f35@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/3/2016 3:06 PM, Alexey Brodkin wrote:
> We used to use generic implementation of dma_map_ops.mmap which is
> dma_common_mmap() but that only worked for simpler cached mappings when
> vaddr = paddr.
> 
> If a driver requests uncached DMA buffer kernel maps it to virtual
> address so that MMU gets involved and page uncached status takes into
> account. In that case usage of dma_common_mmap() lead to mapping of
> vaddr to vaddr for user-space which is obviously wrong. For more detals
> please refer to verbose explanation here [1].
> 
> So here we implement our own version of mmap() which always deals
> with dma_addr and maps underlying memory to user-space properly
> (note that DMA buffer mapped to user-space is always uncached
> because there's no way to properly manage cache from user-space).
> 
> [1] https://lkml.org/lkml/2016/10/26/973
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
> Cc: Marek Szyprowski <m.szyprowski at samsung.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: <stable at vger.kernel.org>
> ---

Tested-by: Ramiro Oliveira <Ramiro.Oliveira at synopsys.com>
