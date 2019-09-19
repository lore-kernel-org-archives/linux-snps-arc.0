From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 19 Sep 2019 13:58:47 -0700
Subject: [PATCH] ARC: export "abort" for modules
In-Reply-To: <20190919105432.GA2809200@kroah.com>
References: <20190919105432.GA2809200@kroah.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190919205847.4806-1-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This is a custom patch (no mainline equivalent) for stable backport only
to address 0-Day kernel test infra ARC 4.x.y builds errors.

The reason for this custom patch as that it is a single patch, touches
only ARC, vs. atleast two 7c2c11b208be09c1, dc8635b78cd8669 which touch
atleast 3 other arches (one long removed) and could potentially have a
fallout.

Reported-by: kbuild test robot <lkp at intel.com>
CC: stable at vger.kernel.org	# 4.4, 4.9
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/traps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
index 2fb0cd39a31c..cd6e3615e3d1 100644
--- a/arch/arc/kernel/traps.c
+++ b/arch/arc/kernel/traps.c
@@ -163,3 +163,4 @@ void abort(void)
 {
 	__asm__ __volatile__("trap_s  5\n");
 }
+EXPORT_SYMBOL(abort);
-- 
2.20.1
