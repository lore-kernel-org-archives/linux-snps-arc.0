Return-Path: <SRS0=yiNs=M3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28320C43214
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF1CB60F58
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF1CB60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1U4DHmG6IVT+4v6SVcbhIatpqn7plv8dIMc1tS8X2M=; b=NYULjrOGjmLG0Y
	01V2LZga5j5Ha3ayFEafUwGhUHXeQ35uYjddkOas4WSFgnAGkOhmXIWT9fixthUwhhL44o4Ecg6HE
	Jk4idQZtpfBlG7M9KO5D2kDglucJeV4xCyWdiMK2dEqrDDsHyoFu5kPzHl8I2NKq5zKae5thUHXY0
	ZILQqHlUlzvtp+S7ZPtSPCo/imNIXhpzMmp5XlXkrkvaEqLIiK4YpATOYS1i62UzvF2RTxjPwkb3Z
	h2Y/3y8D5dbg2aCXXogu++HB+gywJQCmFI7lerPUiqOTSOSMXJKxUeNKP4fOC6z5n5U3M//ROqodc
	Lmt2sK8JYHegTacoT0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBMNK-007HjB-Dq; Wed, 04 Aug 2021 19:16:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBMNH-007HgY-AY
 for linux-snps-arc@bombadil.infradead.org; Wed, 04 Aug 2021 19:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=r0Zq2icUAdEFRO2+NZiFazhsx4NQUoIHssZoh+MCThI=; b=lchzLp2rELee6Wsr+pVmgScc3v
 05hMiLBhEtWDKrUON637zMLGXVphcvRBBgI8JBVZx9a51zG/ai9x2Eyl/qSNCK2kTD8PUi+MPPAZz
 KRfcm0/Oaf2/68GcAIdkzBwY8y6u4AA7vh7XbauNztMTdGcFrMGUjolrrxGDCqK6eu/6OEnlBJChq
 vYSutYbteazRWtwVAFGx2BqYZL6DZznb1xAIF+FdRQ8KhTg7GWb6EhnQGuhyQfaQKuKn3hThYAlpb
 QvIVqWwzHnuFjpaugJyugea/qY50PE8CZkl66DB3VpE/KYM6IAWeE4dy0yqrSa9W7Ct8dzOW1voPZ
 vFeTvYQA==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBMND-005oK8-Fn
 for linux-snps-arc@lists.infradead.org; Wed, 04 Aug 2021 19:16:17 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B5A3A40DB8;
 Wed,  4 Aug 2021 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628104567; bh=k8lJ3O2ItHDU9leG8nrZCL45I4wyf47eCvD5cbay4Vk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pd1+lxVyHNqcrzUL22cFPDqgv9PqWVPPM/IXLyts1ayyyVsD1I/446IzEjzuq3Dni
 iZkR82Nkzie3AbNoYqhRgveY2KQZWcREroi0Q1tQ+gF4Ldh9qsEhOuql4J3UEoNRSn
 JIlWVM1jJxQ3LT5TpHKmA7yPtBZwv6j35aTfiYr7d9k5ySkiR7k3qd2GYyYvJMu6g8
 HSxSF6AhXQz/43/1Oh9ApyitPOpmSWaZJXcjkFL5PztIj3m4qRHgWHbHQNJJuev6wj
 H+aBf78cmzaXpRAKd5m0ixip6Cld3mQjFdiV/+A+0/ALk+TZRUR7PCAZziDpw9SzhF
 HJFfkazyFounQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 78F76A0096;
 Wed,  4 Aug 2021 19:16:06 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 09/11] ARC: cmpxchg/xchg: rewrite as macros to make type safe
Date: Wed,  4 Aug 2021 12:15:52 -0700
Message-Id: <20210804191554.1252776-10-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804191554.1252776-1-vgupta@synopsys.com>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_201615_899036_4F7C3CB7 
X-CRM114-Status: GOOD (  18.81  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Existing code forces/assume args to type "long" which won't work in LP64
regime, so prepare code for that

Interestingly this should be a non functional change but I do see
some codegen changes

| bloat-o-meter vmlinux-cmpxchg-A vmlinux-cmpxchg-B
| add/remove: 0/0 grow/shrink: 17/12 up/down: 218/-150 (68)
|
| Function                                     old     new   delta
| rwsem_optimistic_spin                        518     550     +32
| rwsem_down_write_slowpath                   1244    1274     +30
| __do_sys_perf_event_open                    2576    2600     +24
| down_read                                    192     200      +8
| __down_read                                  192     200      +8
...
| task_work_run                                168     148     -20
| dma_fence_chain_walk.part                    760     736     -24
| __genradix_ptr_alloc                         674     646     -28

Total: Before=6187409, After=6187477, chg +0.00%

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/include/asm/cmpxchg.h | 209 ++++++++++++++++++---------------
 1 file changed, 117 insertions(+), 92 deletions(-)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index bac9b564a140..00deb076d6f6 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -6,6 +6,7 @@
 #ifndef __ASM_ARC_CMPXCHG_H
 #define __ASM_ARC_CMPXCHG_H
 
+#include <linux/build_bug.h>
 #include <linux/types.h>
 
 #include <asm/barrier.h>
@@ -13,62 +14,77 @@
 
 #ifdef CONFIG_ARC_HAS_LLSC
 
-static inline unsigned long
-__cmpxchg(volatile void *ptr, unsigned long expected, unsigned long new)
-{
-	unsigned long prev;
-
-	/*
-	 * Explicit full memory barrier needed before/after as
-	 * LLOCK/SCOND themselves don't provide any such semantics
-	 */
-	smp_mb();
-
-	__asm__ __volatile__(
-	"1:	llock   %0, [%1]	\n"
-	"	brne    %0, %2, 2f	\n"
-	"	scond   %3, [%1]	\n"
-	"	bnz     1b		\n"
-	"2:				\n"
-	: "=&r"(prev)	/* Early clobber, to prevent reg reuse */
-	: "r"(ptr),	/* Not "m": llock only supports reg direct addr mode */
-	  "ir"(expected),
-	  "r"(new)	/* can't be "ir". scond can't take LIMM for "b" */
-	: "cc", "memory"); /* so that gcc knows memory is being written here */
-
-	smp_mb();
-
-	return prev;
-}
-
-#else /* !CONFIG_ARC_HAS_LLSC */
-
-static inline unsigned long
-__cmpxchg(volatile void *ptr, unsigned long expected, unsigned long new)
-{
-	unsigned long flags;
-	int prev;
-	volatile unsigned long *p = ptr;
-
-	/*
-	 * spin lock/unlock provide the needed smp_mb() before/after
-	 */
-	atomic_ops_lock(flags);
-	prev = *p;
-	if (prev == expected)
-		*p = new;
-	atomic_ops_unlock(flags);
-	return prev;
-}
+/*
+ * if (*ptr == @old)
+ *      *ptr = @new
+ */
+#define __cmpxchg(ptr, old, new)					\
+({									\
+	__typeof__(*(ptr)) _prev;					\
+									\
+	__asm__ __volatile__(						\
+	"1:	llock  %0, [%1]	\n"					\
+	"	brne   %0, %2, 2f	\n"				\
+	"	scond  %3, [%1]	\n"					\
+	"	bnz     1b		\n"				\
+	"2:				\n"				\
+	: "=&r"(_prev)	/* Early clobber prevent reg reuse */		\
+	: "r"(ptr),	/* Not "m": llock only supports reg */		\
+	  "ir"(old),							\
+	  "r"(new)	/* Not "ir": scond can't take LIMM */		\
+	: "cc",								\
+	  "memory");	/* gcc knows memory is clobbered */		\
+									\
+	_prev;								\
+})
 
-#endif
+#define arch_cmpxchg(ptr, old, new)				        \
+({									\
+	__typeof__(ptr) _p_ = (ptr);					\
+	__typeof__(*(ptr)) _o_ = (old);					\
+	__typeof__(*(ptr)) _n_ = (new);					\
+	__typeof__(*(ptr)) _prev_;					\
+									\
+	switch(sizeof((_p_))) {						\
+	case 4:								\
+	        /*							\
+		 * Explicit full memory barrier needed before/after	\
+	         */							\
+		smp_mb();						\
+		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
+		smp_mb();						\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+	_prev_;								\
+})
 
-#define arch_cmpxchg(ptr, o, n) ({			\
-	(typeof(*(ptr)))__cmpxchg((ptr),		\
-				  (unsigned long)(o),	\
-				  (unsigned long)(n));	\
+#else
+
+#define arch_cmpxchg(ptr, old, new)				        \
+({									\
+	volatile __typeof__(ptr) _p_ = (ptr);				\
+	__typeof__(*(ptr)) _o_ = (old);					\
+	__typeof__(*(ptr)) _n_ = (new);					\
+	__typeof__(*(ptr)) _prev_;					\
+	unsigned long __flags;						\
+									\
+	BUILD_BUG_ON(sizeof(_p_) != 4);					\
+									\
+	/*								\
+	 * spin lock/unlock provide the needed smp_mb() before/after	\
+	 */								\
+	atomic_ops_lock(__flags);					\
+	_prev_ = *_p_;							\
+	if (_prev_ == _o_)						\
+		*_p_ = _n_;						\
+	atomic_ops_unlock(__flags);					\
+	_prev_;								\
 })
 
+#endif
+
 /*
  * atomic_cmpxchg is same as cmpxchg
  *   LLSC: only different in data-type, semantics are exactly same
@@ -77,55 +93,64 @@ __cmpxchg(volatile void *ptr, unsigned long expected, unsigned long new)
  */
 #define arch_atomic_cmpxchg(v, o, n) ((int)arch_cmpxchg(&((v)->counter), (o), (n)))
 
-
 /*
- * xchg (reg with memory) based on "Native atomic" EX insn
+ * xchg
  */
-static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
-				   int size)
-{
-	extern unsigned long __xchg_bad_pointer(void);
-
-	switch (size) {
-	case 4:
-		smp_mb();
-
-		__asm__ __volatile__(
-		"	ex  %0, [%1]	\n"
-		: "+r"(val)
-		: "r"(ptr)
-		: "memory");
+#ifdef CONFIG_ARC_HAS_LLSC
 
-		smp_mb();
+#define __xchg(ptr, val)						\
+({									\
+	__asm__ __volatile__(						\
+	"	ex  %0, [%1]	\n"	/* set new value */	        \
+	: "+r"(val)							\
+	: "r"(ptr)							\
+	: "memory");							\
+	_val_;		/* get old value */				\
+})
 
-		return val;
-	}
-	return __xchg_bad_pointer();
-}
+#define arch_xchg(ptr, val)						\
+({									\
+	__typeof__(ptr) _p_ = (ptr);					\
+	__typeof__(*(ptr)) _val_ = (val);				\
+									\
+	switch(sizeof(*(_p_))) {					\
+	case 4:								\
+		smp_mb();						\
+		_val_ = __xchg(_p_, _val_);				\
+	        smp_mb();						\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+	_val_;								\
+})
 
-#define _xchg(ptr, with) ((typeof(*(ptr)))__xchg((unsigned long)(with), (ptr), \
-						 sizeof(*(ptr))))
+#else  /* !CONFIG_ARC_HAS_LLSC */
 
 /*
- * xchg() maps directly to ARC EX instruction which guarantees atomicity.
- * However in !LLSC config, it also needs to be use @atomic_ops_lock spinlock
- * due to a subtle reason:
- *  - For !LLSC, cmpxchg() needs to use that lock (see above) and there is lot
- *    of  kernel code which calls xchg()/cmpxchg() on same data (see llist.h)
- *    Hence xchg() needs to follow same locking rules.
+ * EX instructions is baseline and present in !LLSC too. But in this
+ * regime it still needs use @atomic_ops_lock spinlock to allow interop
+ * with cmpxchg() which uses spinlock in !LLSC
+ * (llist.h use xchg and cmpxchg on sama data)
  */
 
-#ifndef CONFIG_ARC_HAS_LLSC
-
-#define arch_xchg(ptr, with)		\
-({					\
-	unsigned long flags;		\
-	typeof(*(ptr)) old_val;		\
-					\
-	atomic_ops_lock(flags);		\
-	old_val = _xchg(ptr, with);	\
-	atomic_ops_unlock(flags);	\
-	old_val;			\
+#define arch_xchg(ptr, val)					        \
+({									\
+	__typeof__(ptr) _p_ = (ptr);					\
+	__typeof__(*(ptr)) _val_ = (val);				\
+									\
+	unsigned long __flags;						\
+									\
+	atomic_ops_lock(__flags);					\
+									\
+	__asm__ __volatile__(						\
+	"	ex  %0, [%1]	\n"					\
+	: "+r"(_val_)							\
+	: "r"(_p_)							\
+	: "memory");							\
+									\
+	atomic_ops_unlock(__flags);					\
+	_val_;								\
 })
 
 #endif
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
