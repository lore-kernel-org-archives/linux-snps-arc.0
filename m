From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 26 Apr 2016 19:29:32 +0300
Subject: [PATCH 0/2] ARC: enable per-device dma and reserved memory in DT
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461688174-8936-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This tiny series enbles support of generic per-device coherent dma memory
and ability to specify reserved memory regions to be used in those
per-device mappings.

In particular this allowed us to move frame-buffer memory out of
IOC aperture.

Cc: linux-kernel at vger.kernel.org

Alexey Brodkin (2):
  ARC: support generic per-device coherent dma mem
  ARC: add support for reserved memory defined by device tree

 arch/arc/Kconfig   | 2 ++
 arch/arc/mm/init.c | 4 ++++
 2 files changed, 6 insertions(+)

-- 
2.5.5
