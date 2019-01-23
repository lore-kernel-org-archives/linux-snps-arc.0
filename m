From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 23 Jan 2019 12:33:04 -0800
Subject: [PATCH v2 3/3] bitops.h: set_mask_bits() to return old value
In-Reply-To: <1548275584-18096-1-git-send-email-vgupta@synopsys.com>
References: <1548275584-18096-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548275584-18096-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

| > Also, set_mask_bits is used in fs quite a bit and we can possibly come up
| > with a generic llsc based implementation (w/o the cmpxchg loop)
|
| May I also suggest changing the return value of set_mask_bits() to old.
|
| You can compute the new value given old, but you cannot compute the old
| value given new, therefore old is the better return value. Also, no
| current user seems to use the return value, so changing it is without
| risk.

Link: http://lkml.kernel.org/g/20150807110955.GH16853 at twins.programming.kicks-ass.net
Suggested-by: Peter Zijlstra <peterz at infradead.org>
Cc: Miklos Szeredi <mszeredi at redhat.com>
Cc: Ingo Molnar <mingo at kernel.org>
Cc: Jani Nikula <jani.nikula at intel.com>
Cc: Chris Wilson <chris at chris-wilson.co.uk>
Cc: Andrew Morton <akpm at linux-foundation.org>
Reviewed-by: Anthony Yznaga <anthony.yznaga at oracle.com>
Acked-by: Will Deacon <will.deacon at arm.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 include/linux/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 705f7c442691..602af23b98c7 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -246,7 +246,7 @@ static __always_inline void __assign_bit(long nr, volatile unsigned long *addr,
 		new__ = (old__ & ~mask__) | bits__;		\
 	} while (cmpxchg(ptr, old__, new__) != old__);		\
 								\
-	new__;							\
+	old__;							\
 })
 #endif
 
-- 
2.7.4
