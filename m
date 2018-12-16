From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Sun, 16 Dec 2018 23:16:21 +0900
Subject: [PATCH] arc: remove redundant kernel-space generic-y
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1544969781-14506-1-git-send-email-yamada.masahiro@socionext.com>
To: linux-snps-arc@lists.infradead.org

This commit removes redundant generic-y defines in
arch/arc/include/asm/Kbuild.

It is redundant to define generic-y when arch-specific implementation
exists in arch/$(ARCH)/include/asm/*.h

Remove the following generic-y:

    dma-mapping.h
    fb.h
    kmap_types.h
    pci.h

Signed-off-by: Masahiro Yamada <yamada.masahiro at socionext.com>
---

 arch/arc/include/asm/Kbuild | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
index feed50c..caa2702 100644
--- a/arch/arc/include/asm/Kbuild
+++ b/arch/arc/include/asm/Kbuild
@@ -3,23 +3,19 @@ generic-y += bugs.h
 generic-y += compat.h
 generic-y += device.h
 generic-y += div64.h
-generic-y += dma-mapping.h
 generic-y += emergency-restart.h
 generic-y += extable.h
-generic-y += fb.h
 generic-y += ftrace.h
 generic-y += hardirq.h
 generic-y += hw_irq.h
 generic-y += irq_regs.h
 generic-y += irq_work.h
-generic-y += kmap_types.h
 generic-y += local.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
 generic-y += mm-arch-hooks.h
 generic-y += msi.h
 generic-y += parport.h
-generic-y += pci.h
 generic-y += percpu.h
 generic-y += preempt.h
 generic-y += topology.h
-- 
2.7.4
