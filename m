From: vineetg76@gmail.com (Vineet Gupta)
Date: Tue, 14 Nov 2017 15:01:26 -0800
Subject: [PATCH 4/4] ARCv2: entry: Reduce perf intr return path
In-Reply-To: <20171114102802.GA3165@worktop.lehotels.local>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
 <1510092784-19942-5-git-send-email-vgupta@synopsys.com>
 <20171114102802.GA3165@worktop.lehotels.local>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8b2c70f0-fc51-fb9b-b799-9b85a3d3403b@gmail.com>
To: linux-snps-arc@lists.infradead.org

On 11/14/2017 02:28 AM, Peter Zijlstra wrote:
> On Tue, Nov 07, 2017@02:13:04PM -0800, Vineet Gupta wrote:
>> In the more likely case of returning to kernel from perf interrupt, do a
>> fast path returning w/o bothering about CONFIG_PREEMPT etc
> 
> I think this needs more explaining and certainly also deserves a code
> comment.

Sure ! It was a quick hack mainly to solicit feedback.


> Is the argument something along these lines?
> 
>    Assumes the interrupt will never set TIF_NEED_RESCHED;
>    therefore no preemption is ever required on return from
>    the interrupt.

No. I don't think we can assume that. But I was choosing to ignore it mainly to 
reduce the overhead of a perf intr in general. A subsequent real interrupt could 
go thru thru the gyrations of preemption etc.


> What do you (on ARC) do about irq_work ?

Nothing ATM. At the time of NPS platform upstreaming, Noam had proposed a patch to 
enable work as part of NO_HZ_FULL support on ARC for NPS. That part of patchseries 
didn't get merged and then life took over...

I'm attaching it here, can be added to ARC I suppose after a bit of deuglification 
for #ifdef'ery.

Although I'm sure it is, can you please explain how irq_work is relevant in the 
context of this patch. Even w/o the TIF_NEED_RESCHED, the generic intr return 
could still invoke the irq_work for perf.

I remember from my investigations at the time that it was originally needed for 
perf_event_do_pending() to do stuff in IRQ context. It was later factored out as 
generic irq_work facility for no_hz and printk !

------------>
 From c120294c80d61bcad223c96bd49303357f95afdc Mon Sep 17 00:00:00 2001
From: Noam Camus <noamc@ezchip.com>
Date: Sun, 21 Jun 2015 01:41:22 +0300
Subject: [PATCH] ARC: Support arch_irq_work_raise() via self IPIs

This will allow the scheduler tick to be restarted.
It is used if CONFIG_NO_HZ_FULL.

Signed-off-by: Gil Fruchter <gilf at ezchip.com>
Signed-off-by: Noam Camus <noamc at ezchip.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
  arch/arc/include/asm/Kbuild     |  1 -
  arch/arc/include/asm/irq_work.h |  8 ++++++++
  arch/arc/kernel/smp.c           | 16 ++++++++++++++++
  3 files changed, 24 insertions(+), 1 deletion(-)
  create mode 100644 arch/arc/include/asm/irq_work.h

diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
index 0b10ef2a4372..f83ec8c04feb 100644
--- a/arch/arc/include/asm/Kbuild
+++ b/arch/arc/include/asm/Kbuild
@@ -16,7 +16,6 @@ generic-y += ioctl.h
  generic-y += ioctls.h
  generic-y += ipcbuf.h
  generic-y += irq_regs.h
-generic-y += irq_work.h
  generic-y += kmap_types.h
  generic-y += kvm_para.h
  generic-y += local.h
diff --git a/arch/arc/include/asm/irq_work.h b/arch/arc/include/asm/irq_work.h
new file mode 100644
index 000000000000..40d015199ced
--- /dev/null
+++ b/arch/arc/include/asm/irq_work.h
@@ -0,0 +1,8 @@
+#ifndef _ASM_ARC_IRQ_WORK_H
+#define _ASM_ARC_IRQ_WORK_H
+static inline bool arch_irq_work_has_interrupt(void)
+{
+	return true;
+}
+
+#endif /* _ASM_ARC_IRQ_WORK_H */
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index f2cf58b771b2..c2f49db57265 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -22,6 +22,7 @@
  #include <linux/atomic.h>
  #include <linux/cpumask.h>
  #include <linux/reboot.h>
+#include <linux/irq_work.h>
  #include <asm/processor.h>
  #include <asm/setup.h>
  #include <asm/mach_desc.h>
@@ -202,6 +203,7 @@ enum ipi_msg_type {
  	IPI_RESCHEDULE = 1,
  	IPI_CALL_FUNC,
  	IPI_CPU_STOP,
+	IPI_IRQ_WORK,
  };

  /*
@@ -276,6 +278,14 @@ void arch_send_call_function_ipi_mask(const struct cpumask *mask)
  	ipi_send_msg(mask, IPI_CALL_FUNC);
  }

+#ifdef CONFIG_IRQ_WORK
+void arch_irq_work_raise(void)
+{
+	if (arch_irq_work_has_interrupt())
+		ipi_send_msg_one(smp_processor_id(), IPI_IRQ_WORK);
+}
+#endif
+
  /*
   * ipi_cpu_stop - handle IPI from smp_send_stop()
   */
@@ -301,6 +311,12 @@ static inline int __do_IPI(unsigned long msg)
  		ipi_cpu_stop();
  		break;

+#ifdef CONFIG_IRQ_WORK
+	case IPI_IRQ_WORK:
+		irq_work_run();
+		break;
+#endif
+
  	default:
  		rc = 1;
  	}
-- 
2.7.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-ARC-Support-arch_irq_work_raise-via-self-IPIs.patch
Type: text/x-patch
Size: 2504 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20171114/a9f92dad/attachment.bin>
