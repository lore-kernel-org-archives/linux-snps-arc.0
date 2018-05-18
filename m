From: hch@lst.de (Christoph Hellwig)
Date: Fri, 18 May 2018 15:45:39 +0200
Subject: arc dma mapping cleanups/fixes and generic noncohernt dma code
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180518134545.5036-1-hch@lst.de>
To: linux-snps-arc@lists.infradead.org

Hi all,

this series continues consolidating the dma-mapping code, with a focus
on architectures that do not (always) provide cache coherence for DMA.
Three architectures (arm, mips and powerpc) are still left to be
converted later due to complexity of their dma ops selection.

The dma-noncoherent ops calls the dma-direct ops for the actual
translation of streaming mappins and allow the architecture to provide
any cache flushing required for cpu to device and/or device to cpu
ownership transfers.  The dma coherent allocator is for now still left
entirely to architecture supplied implementations due the amount of
variations.  Hopefully we can do some consolidation for them later on
as well.

Because this series sits on top of two previously submitted series
a git tree might be useful to actually test it.  It is provided here:

    git://git.infradead.org/users/hch/misc.git arc-dma

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/arc-dma

Changes since previous bigger series:
 - take the offset into account in noncoherent_dma_map_page (Alexey Brodkin)
 - fix dma directions in arc (Alexey Brodkin)
 - split arc changes into smaller patches
