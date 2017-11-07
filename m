From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 7 Nov 2017 14:13:03 -0800
Subject: [PATCH 3/4] ARC: perf: avoid vmalloc backed mmap
In-Reply-To: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1510092784-19942-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

For non-alising Dcache, vmalloc is not needed.

vmalloc triggers additonal D-TLB Misses in the perf interrupt code path
making it slightly inefficient as evident from hackbench runs below.

| [ARCLinux]# perf stat -e dTLB-load-misses --repeat 5 hackbench
| Running with 10*40 (== 400) tasks.
| Time: 35.060
| ...
| Performance counter stats for 'hackbench' (5 runs):

Before:      399235      dTLB-load-misses ( +-  2.08% )
After :      397676      dTLB-load-misses ( +-  2.27% )

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index c84e67fdea09..f3cad98eeb8f 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -39,7 +39,7 @@ config ARC
 	select OF
 	select OF_EARLY_FLATTREE
 	select OF_RESERVED_MEM
-	select PERF_USE_VMALLOC
+	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_GENERIC_DMA_COHERENT
 	select HAVE_KERNEL_GZIP
-- 
2.7.4
