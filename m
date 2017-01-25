From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Wed, 25 Jan 2017 18:41:15 +0200
Subject: [PATCH 0/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485362475.2133.329.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Wed, 2017-01-25@18:34 +0300, Eugeniy Paltsev wrote:
> This patch series add support for the DW AXI DMAC controller.
> 
> DW AXI DMAC is a part of upcoming development board from Synopsys.
> 
> In this driver implementation only DMA_MEMCPY and DMA_SG transfers
> are supported.
> 
> Changes for v0:
> ?* Switch to virt-dma API (according to previous RFC)
> ?* Small fixies according to previous RFC

Yeah, seems you didn't address some of the comments and didn't comment
why...

> ?* Add DT bindings
> 
> Eugeniy Paltsev (2):
> ? dt-bindings: Document the Synopsys DW AXI DMA bindings
> ? dmaengine: Add DW AXI DMAC driver
> 
> ?.../devicetree/bindings/dma/snps,axi-dw-dmac.txt???|???33 +
> ?drivers/dma/Kconfig????????????????????????????????|????8 +
> ?drivers/dma/Makefile???????????????????????????????|????1 +

> ?drivers/dma/axi_dma_platform.c?????????????????????| 1060
> ++++++++++++++++++++

This surprises me. I would expect more then 100+ LOC reduction when
switched to virt-dma API. Can you double check that you are using it
effectively?

> ?drivers/dma/axi_dma_platform.h?????????????????????|??124 +++
> ?drivers/dma/axi_dma_platform_reg.h?????????????????|??189 ++++
> ?6 files changed, 1415 insertions(+)
> ?create mode 100644 Documentation/devicetree/bindings/dma/snps,axi-dw-
> dmac.txt
> ?create mode 100644 drivers/dma/axi_dma_platform.c
> ?create mode 100644 drivers/dma/axi_dma_platform.h
> ?create mode 100644 drivers/dma/axi_dma_platform_reg.h
> 

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
