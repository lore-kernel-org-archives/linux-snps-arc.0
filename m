From: CARLOS.PALMINHA@synopsys.com (Carlos Palminha)
Date: Tue, 1 Dec 2015 19:39:30 +0000
Subject: Non existing DMA functions in ARC: dma_alloc_attrs, dma_free_attrs,
 dma_mmap_attrs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <565DF772.4060802@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi guys,

I'm bringing up a new ARC PGU driver for DRM framework with latest kernel tree.
I'm using ARC AXS101 as a base and selected one the DRM required config: HAVE_DMA_ATTRS due to some memory allocation helpers in DRM.

I'm getting some errors with DMA functions not implemented in ARC: dma_alloc_attrs, dma_free_attrs, dma_mmap_attrs

Any clue?

Regards,
C.Palminha

---
include/linux/dma-mapping.h: In function ?dma_alloc_writecombine?:
include/linux/dma-mapping.h:283:2: error: implicit declaration of function ?dma_alloc_attrs? [-Werror=implicit-function-declaration]
  return dma_alloc_attrs(dev, size, dma_addr, gfp, &attrs);
  ^
include/linux/dma-mapping.h:283:2: warning: return makes pointer from integer without a cast [enabled by default]
include/linux/dma-mapping.h: In function ?dma_free_writecombine?:
include/linux/dma-mapping.h:291:2: error: implicit declaration of function ?dma_free_attrs? [-Werror=implicit-function-declaration]
  return dma_free_attrs(dev, size, cpu_addr, dma_addr, &attrs);
  ^
include/linux/dma-mapping.h:291:2: warning: ?return? with a value, in function returning void [enabled by default]
include/linux/dma-mapping.h: In function ?dma_mmap_writecombine?:
include/linux/dma-mapping.h:301:2: error: implicit declaration of function ?dma_mmap_attrs? [-Werror=implicit-function-declaration]
  return dma_mmap_attrs(dev, vma, cpu_addr, dma_addr, size, &attrs);
