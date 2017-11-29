From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 29 Nov 2017 11:21:45 +0300
Subject: [PATCH] ARC: Enable machine_desc->init_per_cpu for non-SMP configs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171129082145.23327-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As of today we assumed that "machine_desc->init_per_cpu" calls
are only usable on SMP systems when we want to run some piece of
code on early boot for each and every core, I guess assumption was
we have "machine_desc->init_early" for single-core cases where
the one and only master core can do all the things.

But it turned out for platforms which might be both UP and SMP it
might be benificial to use "init_per_cpu" for both UP and SMP cases
with which we achieve 2 things simultaneously:
 1) Exactly the same one code will be used for UP&SMP for
    things required to be done on each an every core regardless if it's
    a master and the only core in UP system or any other slave core in SMP
    setup.
 1) There will be no "ifdef CONFIG_SMP" around "init_per_cpu".

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/include/asm/mach_desc.h | 2 --
 arch/arc/kernel/irq.c            | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/mach_desc.h b/arch/arc/include/asm/mach_desc.h
index c28e6c347b49..871f3cb16af9 100644
--- a/arch/arc/include/asm/mach_desc.h
+++ b/arch/arc/include/asm/mach_desc.h
@@ -34,9 +34,7 @@ struct machine_desc {
 	const char		*name;
 	const char		**dt_compat;
 	void			(*init_early)(void);
-#ifdef CONFIG_SMP
 	void			(*init_per_cpu)(unsigned int);
-#endif
 	void			(*init_machine)(void);
 	void			(*init_late)(void);
 
diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
index 538b36afe89e..62b185057c04 100644
--- a/arch/arc/kernel/irq.c
+++ b/arch/arc/kernel/irq.c
@@ -31,10 +31,10 @@ void __init init_IRQ(void)
 	/* a SMP H/w block could do IPI IRQ request here */
 	if (plat_smp_ops.init_per_cpu)
 		plat_smp_ops.init_per_cpu(smp_processor_id());
+#endif
 
 	if (machine_desc->init_per_cpu)
 		machine_desc->init_per_cpu(smp_processor_id());
-#endif
 }
 
 /*
-- 
2.11.0
