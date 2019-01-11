From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 11 Jan 2019 10:24:08 +0100
Subject: [PATCH 3/3] bitops.h: set_mask_bits() to return old value
In-Reply-To: <1547166387-19785-4-git-send-email-vgupta@synopsys.com>
References: <1547166387-19785-1-git-send-email-vgupta@synopsys.com>
 <1547166387-19785-4-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190111092408.GM30894@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Jan 10, 2019@04:26:27PM -0800, Vineet Gupta wrote:

> @@ -246,7 +246,7 @@ static __always_inline void __assign_bit(long nr, volatile unsigned long *addr,
>  		new__ = (old__ & ~mask__) | bits__;		\
>  	} while (cmpxchg(ptr, old__, new__) != old__);		\

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 705f7c442691..2060d26a35f5 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -241,10 +241,10 @@ static __always_inline void __assign_bit(long nr, volatile unsigned long *addr,
 	const typeof(*(ptr)) mask__ = (mask), bits__ = (bits);	\
 	typeof(*(ptr)) old__, new__;				\
 								\
+	old__ = READ_ONCE(*(ptr));				\
 	do {							\
-		old__ = READ_ONCE(*(ptr));			\
 		new__ = (old__ & ~mask__) | bits__;		\
-	} while (cmpxchg(ptr, old__, new__) != old__);		\
+	} while (!try_cmpxchg(ptr, &old__, new__));		\
 								\
 	new__;							\
 })


While there you probably want something like the above... although,
looking at it now, we seem to have 'forgotten' to add try_cmpxchg to the
generic code :/
