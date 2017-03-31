From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 31 Mar 2017 12:19:06 +0300
Subject: [PATCH] arcv2: Halt non-master cores
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1490951946-22574-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Even though we expect only master core to execute U-Boot code
let's make sure even if for some reason slave cores attempt to
execute U-Boot in parallel with master they get halted very early.

If platform wants it may kick-start slave cores before passing control
to say Linux kernel or any other application that want to see all cores
of SMP SoC up and running.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/lib/start.S | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arc/lib/start.S b/arch/arc/lib/start.S
index 90ee7e0fe406..b2ba7683097f 100644
--- a/arch/arc/lib/start.S
+++ b/arch/arc/lib/start.S
@@ -10,6 +10,22 @@
 #include <asm/arcregs.h>
 
 ENTRY(_start)
+	; Non-masters will be halted immediately, they might be kicked later
+	; by platform code right before passing control to the Linux kernel
+	; in bootm.c:boot_jump_linux().
+	lr 	r5, [identity]
+	lsr	r5, r5, 8
+	bmsk	r5, r5, 7
+	cmp	r5, 0
+	mov.nz	r0, r5
+	bz	.Lmaster_proceed
+	flag	1
+	nop
+	nop
+	nop
+
+.Lmaster_proceed:
+
 	/* Setup interrupt vector base that matches "__text_start" */
 	sr	__ivt_start, [ARC_AUX_INTR_VEC_BASE]
 
-- 
2.7.4
