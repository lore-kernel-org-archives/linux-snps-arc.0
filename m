From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 28 Oct 2016 18:59:59 +0300
Subject: [PATCH v3 0/3] dmaengine: DW DMAC: split pdata to hardware properties
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This series is to address a proposal by Andy in these threads:
http://www.spinics.net/lists/dmaengine/msg11506.html
http://www.spinics.net/lists/dmaengine/msg11541.html
Split platform data to actual hardware properties, and platform quirks.
Now we able to use quirks and hardware properties separately from
different sources (pdata, device tree or autoconfig registers)

Changes for v3:
 -   Split changes to separate patches.
 -   Add "DW_DMA_IS_LLP_SUPPORTED" flag and get rid of "dwc->nollp"
     as separate variable.
 -   Make "dw_dma_slave" documentation comments more clear about quirks.
     "is_memcpy" and "is_private" are quirks, "is_nollp" is regular 
     pdata property.

Eugeniy Paltsev (3):
  dmaengine: DW DMAC: split pdata to hardware properties and platform
    quirks
  dmaengine: DW DMAC: convert to unified device property API
  dmaengine: DW DMAC: move "nollp" to "dwc->flags"

 drivers/dma/dw/core.c                | 34 +++++++++++++----------
 drivers/dma/dw/platform.c            | 53 +++++++++++++++++++-----------------
 drivers/dma/dw/regs.h                |  2 +-
 include/linux/platform_data/dma-dw.h |  5 ++++
 4 files changed, 54 insertions(+), 40 deletions(-)

-- 
2.5.5
