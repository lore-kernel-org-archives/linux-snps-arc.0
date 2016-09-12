From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 12 Sep 2016 10:58:02 -0700
Subject: [PATCH v3 1/2] ia64: implement atomic64_dec_if_positive
In-Reply-To: <1473703083-8625-1-git-send-email-vgupta@synopsys.com>
References: <201609111259.q67d9T4B%fengguang.wu@intel.com>
 <1473703083-8625-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1473703083-8625-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This is based on s390 version and needed to get rid of
CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE

Cc: Tony Luck <tony.luck at intel.com>
Cc: Fenghua Yu <fenghua.yu at intel.com>
Cc: Ingo Molnar <mingo at kernel.org>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: linux-ia64 at vger.kernel.org
Cc: linux-kernel at vger.kernel.org
Reported-by: kbuild test robot <fengguang.wu at intel.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/ia64/include/asm/atomic.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/ia64/include/asm/atomic.h b/arch/ia64/include/asm/atomic.h
index f565ad376142..65d4bb2b6685 100644
--- a/arch/ia64/include/asm/atomic.h
+++ b/arch/ia64/include/asm/atomic.h
@@ -269,6 +269,22 @@ static __inline__ long atomic64_add_unless(atomic64_t *v, long a, long u)
 
 #define atomic64_inc_not_zero(v) atomic64_add_unless((v), 1, 0)
 
+static __inline__ long atomic64_dec_if_positive(atomic64_t *v)
+{
+	long c, old, dec;
+	c = atomic64_read(v);
+	for (;;) {
+		dec = c - 1;
+		if (unlikely(dec < 0))
+			break;
+		old = atomic64_cmpxchg((v), c, dec);
+		if (likely(old == c))
+			break;
+		c = old;
+	}
+	return dec;
+}
+
 /*
  * Atomically add I to V and return TRUE if the resulting value is
  * negative.
-- 
2.7.4
