From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:15 +0530
Subject: [PATCH 17/17] xxx: instrument
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-18-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index d5ffb4a78104..91f310465970 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -889,6 +889,19 @@ static int cie_validate(const u32 *cie, struct cie *t_cie)
 	return end - (const u8 *)cie;
 }
 
+#define UNWIND_INSTRUMENT
+
+#ifdef UNWIND_INSTRUMENT
+u32 unw_t_min = 0xffffff, unw_t_max, unw_t_n;
+u64 unw_t_avg;
+
+static unsigned int get_c(void)
+{
+       write_aux_reg(0x600, 0x42);             // ARC_REG_MCIP_CMD
+       return read_aux_reg(0x602);     // ARC_REG_MCIP_READBACK
+}
+#endif
+
 /* Unwind to previous to frame.  Returns 0 if successful, negative
  * number in case of an error. */
 int arc_unwind(struct unwind_frame_info *frame)
@@ -907,7 +920,9 @@ int arc_unwind(struct unwind_frame_info *frame)
 	unsigned long addr;
 	struct eh_frame_header *hdr;
 	int ret = -EINVAL;
-
+#ifdef UNWIND_INSTRUMENT
+	unsigned int t0 = get_c(), t1, delta;
+#endif
 	unw_debug("\nUNWIND FRAME: -------------------------------------\n");
 	unw_debug("PC\t\t: 0x%lx %pS\nr31 [BLINK]\t: 0x%lx %pS\nr28 [SP]\t: 0x%lx\nr27 [FP]\t: 0x%lx\n",
 		  UNW_PC(frame), (void *)UNW_PC(frame),
@@ -1072,6 +1087,15 @@ int arc_unwind(struct unwind_frame_info *frame)
 	ret = 0;
 bad_unw:
 
+#ifdef UNWIND_INSTRUMENT
+	t1 = get_c();
+	delta = t1 - t0;
+	unw_t_min = min(unw_t_min, delta);
+	unw_t_max = max(unw_t_max, delta);
+	unw_t_n++;
+	unw_t_avg += delta;
+	printk("unw %d %s %lx\n", delta, !ret ? "O K":"nok", pc);
+#endif
 	return ret;
 #undef FRAME_REG
 }
-- 
1.9.1
