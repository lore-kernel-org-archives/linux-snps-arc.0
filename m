From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 11 Apr 2017 18:53:47 +0300
Subject: [PATCH] arc: arcv1: Disable master/slave check
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1491926027-22324-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARCompact cores are not supposed to be used in SMP designs
(this doesn't stop people from creation of heterogeneous chips,
for an example keep reading) so there's no point in
checking ARCNUM and halting somebody if we build for ARC700.

Moreover on AXS101 board we have ARC770 in the ASIC together with
other ARC cores and ARC770 happens to be the last node in JTAG chain
with ARCNUM = 4. And existing check halts the one and only core we
want keep running.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/lib/start.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arc/lib/start.S b/arch/arc/lib/start.S
index b2ba7683097f..95d64f9d4375 100644
--- a/arch/arc/lib/start.S
+++ b/arch/arc/lib/start.S
@@ -10,6 +10,9 @@
 #include <asm/arcregs.h>
 
 ENTRY(_start)
+; ARCompact devices are not supposed to be SMP so master/slave check
+; makes no sense.
+#ifdef CONFIG_ISA_ARCV2
 	; Non-masters will be halted immediately, they might be kicked later
 	; by platform code right before passing control to the Linux kernel
 	; in bootm.c:boot_jump_linux().
@@ -25,6 +28,7 @@ ENTRY(_start)
 	nop
 
 .Lmaster_proceed:
+#endif
 
 	/* Setup interrupt vector base that matches "__text_start" */
 	sr	__ivt_start, [ARC_AUX_INTR_VEC_BASE]
-- 
2.7.4
