From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri,  7 Apr 2017 17:04:13 +0300
Subject: [PATCH v2 0/2] dmaengine: Add DW AXI DMAC driver
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This patch series add support for the DW AXI DMAC controller.

DW AXI DMAC is a part of upcoming development board from Synopsys.

In this driver implementation only DMA_MEMCPY and DMA_SG transfers
are supported.

Changes for v2:
 * Use async version of runtime PM get/put callbacks.
 * Use atomic_t (and corresponding operations) for allocated descriptors
   counter.
 * Use GFP_NOWAIT flag for allocating dma descriptors in "dma_pool_zalloc"
   instead of GFP_ATOMIC flag.
 * Add kernel-doc style comments for the irq enum, cleanup.

Changes for v1:
 * Implement Runtime PM (the driver can operate with or without
   Runtime PM support)
 * Move submitting new txn to interrupt handler from tasklet
 * Free IRQ manually in driver remove function
 * Add 64 bit support
 * Rid of subsys_initcall
 * Use dev_vdbg instead dev_dbg in some places
 * Rid of C99 style comments
 * Add IP version to DT compatible string

Note:
 * I left "is_paused" variable untouched. I checked the drivers which
   have 'enum dma_status' field in their channel data structures -
   there is no much sense to add enum to this driver channel data
   structure - it will be used only for determinating is channel
   paused or not.
 * I left preparation of SG list according to max data width and
   max block size in dma_chan_prep_dma_sg function.
 * I left axi_chan_is_hw_enable assert untouched because it is
   HW per-channel assert. It can't be managed by runtime PM.

Changes for v0:
 * Switch to virt-dma API (according to previous RFC)
 * Small fixies according to previous RFC
 * Add DT bindings

Eugeniy Paltsev (2):
  dt-bindings: Document the Synopsys DW AXI DMA bindings
  dmaengine: Add DW AXI DMAC driver

 .../devicetree/bindings/dma/snps,axi-dw-dmac.txt   |   34 +
 drivers/dma/Kconfig                                |   10 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/axi_dma_platform.c                     | 1044 ++++++++++++++++++++
 drivers/dma/axi_dma_platform.h                     |  119 +++
 drivers/dma/axi_dma_platform_reg.h                 |  220 +++++
 6 files changed, 1428 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
 create mode 100644 drivers/dma/axi_dma_platform.c
 create mode 100644 drivers/dma/axi_dma_platform.h
 create mode 100644 drivers/dma/axi_dma_platform_reg.h

-- 
2.5.5
