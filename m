From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 16 Nov 2016 16:56:51 +0300
Subject: [PATCH 0/4] DW DMAC: update device tree
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

It wasn't possible to enable some features like
memory-to-memory transfers or multi block transfers via DT.
It is fixed by these patches.

 * Rename is_private to is-private as ordered by DT policy.
 (just for cleanup) The change leaves the support for the 
 old format.

 * Add is-memcpu property, so it is possible to
 enable memory-to-memory transfers support via DT.

 * Add hw-llp property, so it is possible to enable
 hardware multi block transfers support via DT.

 * Update DW DMAC device tree documentation.

Eugeniy Paltsev (4):
  DW DMAC: rename is_private property as ordered by DT policy
  DW DMAC: add is-memcpu property to device tree
  DW DMAC: add hw-llp property to device tree
  Update device tree Synopsys DW DMAC documentation

 Documentation/devicetree/bindings/dma/snps-dma.txt | 10 ++++++++--
 drivers/dma/dw/core.c                              |  2 +-
 drivers/dma/dw/platform.c                          | 10 ++++++++++
 include/linux/platform_data/dma-dw.h               |  4 ++--
 4 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.5.5
