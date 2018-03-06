From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue,  6 Mar 2018 14:46:13 +0300
Subject: [PATCH v3 0/2] Introduce DW AXI DMAC driver
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180306114615.8895-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This patch series add support for the DW AXI DMAC controller.

DW AXI DMAC is a part of HSDK development board from Synopsys.

In this driver implementation only DMA_MEMCPY transfers
are supported.

Changes v2->v3 (suggested by Andy Shevchenko and Vinod Koul):
 * Fix SPDX licence comment style.
 * Use KBUILD_MODNAME macro instead of custom one.
 * Refactor dma_chan_tx_status function.
 * Refactor dma_chan_pause function.
 * Remove dma_cookie_init() call from dma_chan_alloc_chan_resources()
 * Use upper_32_bits() and lower_32_bits() instead of custom one.
 * Add __maybe_unused to runtime PM callback functions instead of
   CONFIG_PM ifdef use.
 * Other small fixies.

Changes v1->v2 (suggested by Andy Shevchenko):
 * Use SPDX licence identifier.
 * Refactor axi_chan_get_xfer_width function.
 * Fix timeout calculation in dma_chan_pause.
 * Add record to MAINTAINERS in correct alphabetical order.

Eugeniy Paltsev (2):
  dmaengine: Introduce DW AXI DMAC driver
  dt-bindings: Document the Synopsys DW AXI DMA bindings

 .../devicetree/bindings/dma/snps,dw-axi-dmac.txt   |   41 +
 MAINTAINERS                                        |    6 +
 drivers/dma/Kconfig                                |   10 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/dw-axi-dmac/Makefile                   |    1 +
 drivers/dma/dw-axi-dmac/axi_dma_platform.c         | 1010 ++++++++++++++++++++
 drivers/dma/dw-axi-dmac/axi_dma_platform.h         |  342 +++++++
 7 files changed, 1411 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
 create mode 100644 drivers/dma/dw-axi-dmac/Makefile
 create mode 100644 drivers/dma/dw-axi-dmac/axi_dma_platform.c
 create mode 100644 drivers/dma/dw-axi-dmac/axi_dma_platform.h

-- 
2.9.3
