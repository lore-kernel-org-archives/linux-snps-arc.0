From: catalin.marinas@arm.com (Catalin Marinas)
Date: Wed, 2 Nov 2016 11:08:06 -0600
Subject: [PATCH] arc: Implement arch-specific dma_map_ops.mmap
In-Reply-To: <1478089183-6458-1-git-send-email-abrodkin@synopsys.com>
References: <1478089183-6458-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161102170806.z3k3nlczspg2ebxb@localhost>
To: linux-snps-arc@lists.infradead.org

On Wed, Nov 02, 2016@03:19:43PM +0300, Alexey Brodkin wrote:
> diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
> index 20afc65e22dc..034ec6a8a764 100644
> --- a/arch/arc/mm/dma.c
> +++ b/arch/arc/mm/dma.c
> @@ -105,6 +105,31 @@ static void arc_dma_free(struct device *dev, size_t size, void *vaddr,
>  	__free_pages(page, get_order(size));
>  }
>  
> +static int arc_dma_mmap(struct device *dev, struct vm_area_struct *vma,
> +			void *cpu_addr, dma_addr_t dma_addr, size_t size,
> +			unsigned long attrs)
> +{
> +	unsigned long user_count = vma_pages(vma);
> +	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> +	unsigned long pfn = __phys_to_pfn(dma_addr);

I don't think that's correct in all situations. Better as (for arc):

	unsigned long pfn = __phys_to_pfn(plat_dma_to_phys(dma_addr));

Other than that:

Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
