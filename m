From: hch@lst.de (Christoph Hellwig)
Date: Fri, 14 Jun 2019 16:44:24 +0200
Subject: handle "special" dma allocation in common code
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190614144431.21760-1-hch@lst.de>
To: linux-snps-arc@lists.infradead.org

Hi all,,

this series ensures that the common dma-direct code handles the somewhat
special allocation types requested by the DMA_ATTR_NON_CONSISTENT and
DMA_ATTR_NO_KERNEL_MAPPING flags directly.  To do so it also removes three
partial and thus broken implementations of DMA_ATTR_NON_CONSISTENT.  Last
but not least it switches arc to use the generic dma remapping code now
that arc doesn't implement any special behavior.
