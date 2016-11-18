From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 18 Nov 2016 19:53:07 +0300
Subject: [PATCH v2 0/2] DW DMAC: update device tree
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1479487989-24543-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

It wasn't possible to enable some features like
memory-to-memory transfers or multi block transfers via DT.
It is fixed by these patches.

Changes for v2:
 * I thought about is_memcpy DT property: all known devices, which 
   use DT for configuration, support memory-to-memory transfers. 
   So we don't need to read it from DT. So enable it by default, 
   if we read configuration from DT.

 * Use "multi-block" instead of "hw-llp" name to be more clear.

 * Move adding DT property and adding documentation for this
   property to one patch.

Eugeniy Paltsev (2):
  DW DMAC: enable memory-to-memory transfers support
  DW DMAC: add multi-block property to device tree

 Documentation/devicetree/bindings/dma/snps-dma.txt |  2 ++
 drivers/dma/dw/core.c                              |  2 +-
 drivers/dma/dw/platform.c                          | 11 +++++++++++
 include/linux/platform_data/dma-dw.h               |  4 ++--
 4 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.5.5
