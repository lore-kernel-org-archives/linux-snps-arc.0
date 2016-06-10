From: robin.murphy@arm.com (Robin Murphy)
Date: Fri, 10 Jun 2016 11:58:53 +0100
Subject: [PATCH v4 43/44] dma-mapping: Remove dma_get_attr
In-Reply-To: <1465553521-27303-44-git-send-email-k.kozlowski@samsung.com>
References: <1465553521-27303-1-git-send-email-k.kozlowski@samsung.com>
 <1465553521-27303-44-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <575A9D6D.9040808@arm.com>
To: linux-snps-arc@lists.infradead.org

On 10/06/16 11:12, Krzysztof Kozlowski wrote:
> After switching DMA attributes to unsigned long it is easier to just
> compare the bits.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
> [for avr32]
> Acked-by: Hans-Christian Noren Egtvedt <egtvedt at samfundet.no>
> ---
[...]
>   arch/arm64/mm/dma-mapping.c                    | 10 +++----
[...]
>   drivers/iommu/dma-iommu.c                      |  2 +-
[...]
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> index a7686028dfeb..06c068ca3541 100644
> --- a/arch/arm64/mm/dma-mapping.c
> +++ b/arch/arm64/mm/dma-mapping.c
> @@ -32,7 +32,7 @@
>   static pgprot_t __get_dma_pgprot(unsigned long attrs, pgprot_t prot,
>   				 bool coherent)
>   {
> -	if (!coherent || dma_get_attr(DMA_ATTR_WRITE_COMBINE, attrs))
> +	if (!coherent || (attrs & DMA_ATTR_WRITE_COMBINE))
>   		return pgprot_writecombine(prot);
>   	return prot;
>   }
> @@ -702,7 +702,7 @@ static dma_addr_t __iommu_map_page(struct device *dev, struct page *page,
>   	dma_addr_t dev_addr = iommu_dma_map_page(dev, page, offset, size, prot);
>
>   	if (!iommu_dma_mapping_error(dev, dev_addr) &&
> -	    !dma_get_attr(DMA_ATTR_SKIP_CPU_SYNC, attrs))
> +	    (attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
>   		__iommu_sync_single_for_device(dev, dev_addr, size, dir);
>
>   	return dev_addr;
> @@ -712,7 +712,7 @@ static void __iommu_unmap_page(struct device *dev, dma_addr_t dev_addr,
>   			       size_t size, enum dma_data_direction dir,
>   			       unsigned long attrs)
>   {
> -	if (!dma_get_attr(DMA_ATTR_SKIP_CPU_SYNC, attrs))
> +	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
>   		__iommu_sync_single_for_cpu(dev, dev_addr, size, dir);
>
>   	iommu_dma_unmap_page(dev, dev_addr, size, dir, attrs);
> @@ -752,7 +752,7 @@ static int __iommu_map_sg_attrs(struct device *dev, struct scatterlist *sgl,
>   {
>   	bool coherent = is_device_dma_coherent(dev);
>
> -	if (!dma_get_attr(DMA_ATTR_SKIP_CPU_SYNC, attrs))
> +	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
>   		__iommu_sync_sg_for_device(dev, sgl, nelems, dir);
>
>   	return iommu_dma_map_sg(dev, sgl, nelems,
> @@ -764,7 +764,7 @@ static void __iommu_unmap_sg_attrs(struct device *dev,
>   				   enum dma_data_direction dir,
>   				   unsigned long attrs)
>   {
> -	if (!dma_get_attr(DMA_ATTR_SKIP_CPU_SYNC, attrs))
> +	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
>   		__iommu_sync_sg_for_cpu(dev, sgl, nelems, dir);
>
>   	iommu_dma_unmap_sg(dev, sgl, nelems, dir, attrs);
[...]
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 6c1bda504fb1..08a1e2f3690f 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -306,7 +306,7 @@ struct page **iommu_dma_alloc(struct device *dev, size_t size, gfp_t gfp,
>   	} else {
>   		size = ALIGN(size, min_size);
>   	}
> -	if (dma_get_attr(DMA_ATTR_ALLOC_SINGLE_PAGES, attrs))
> +	if (attrs & DMA_ATTR_ALLOC_SINGLE_PAGES)
>   		alloc_sizes = min_size;
>
>   	count = PAGE_ALIGN(size) >> PAGE_SHIFT;
[...]

These all look appropriate to me; thanks!

For arm64 and dma-iommu:

Acked-by: Robin Murphy <robin.murphy at arm.com>
