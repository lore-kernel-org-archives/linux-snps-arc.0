From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 26 Apr 2016 19:29:33 +0300
Subject: [PATCH 1/2] ARC: support generic per-device coherent dma mem
In-Reply-To: <1461688174-8936-1-git-send-email-abrodkin@synopsys.com>
References: <1461688174-8936-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461688174-8936-2-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-kernel at vger.kernel.org
---
 arch/arc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 208aae0..61d69e6 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -37,6 +37,7 @@ config ARC
 	select OF_EARLY_FLATTREE
 	select PERF_USE_VMALLOC
 	select HAVE_DEBUG_STACKOVERFLOW
+	select HAVE_GENERIC_DMA_COHERENT
 
 config MIGHT_HAVE_PCI
 	bool
-- 
2.5.5
