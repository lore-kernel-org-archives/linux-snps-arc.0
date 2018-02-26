From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 26 Feb 2018 17:56:26 +0300
Subject: [PATCH v2 0/2] Introduce DW AXI DMAC driver
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180226145628.11892-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This patch series add support for the DW AXI DMAC controller.

DW AXI DMAC is a part of HSDK development board from Synopsys.

In this driver implementation only DMA_MEMCPY transfers
are supported.

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
