From: hch@lst.de (Christoph Hellwig)
Date: Mon, 11 Feb 2019 14:21:56 +0100
Subject: add config symbols for arch_{setup,teardown}_dma_ops
In-Reply-To: <20190204081420.15083-1-hch@lst.de>
References: <20190204081420.15083-1-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190211132156.GA22265@lst.de>
To: linux-snps-arc@lists.infradead.org

Any chance to get a quick review on this small series?

On Mon, Feb 04, 2019@09:14:18AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> this series adds kconfig symbols to indicate that the architecture
> provides the arch_setup_dma_ops and arch_teardown_dma_ops hooks.
> 
> This avoids polluting dma-mapping.h which is included by just about
> every driver with implementation details, and also removes some
> clutter.
> _______________________________________________
> iommu mailing list
> iommu at lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
---end quoted text---
