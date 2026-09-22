Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7852C982FA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Sep 2026 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zACE6s5069Ya5bLVb/X1tcGxkjE2S94VX7hrFpyTmN8=; b=hYJtMNELJti22H
	bH7OswW3Ue/6EAAa2fniGKlQpMKeKrwGZyTPrm4MhAcv1HBGMVp0rbjfsS6PlAEPBpJDGhOZ6itjR
	1g4Mw2XwMfsIIZZKN/jIS5w0gI+B9PcrZy66ZGNU3Cwyg7U6ouWOPuKxqMi29usi+4gvAJYo0imHq
	c0TLNFJY7d7C9Tn1OeoJIg82Nv78GXBkmKanVfz1De1TTY3SU/Uc8kLIXbGWPEb1aLqfRCt5UPc/5
	438j4D1kdFSlATs1e0Fzzg9unMZGmUHdI1KTkIbMPr2JgvYMtbjWqI9B8qAO4K3yXFYtioVLsOsjG
	D9818eC1ZOv7KzCfjRDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Pq-00000006Dve-1stz;
	Tue, 22 Sep 2026 17:36:26 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Pn-00000006Du0-0o8F
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Sep 2026 17:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098433; bh=DV+S+YBKPI4yE6gLNe9ePuD
	8ye5fzLkcyxtpk3kLyU4=; b=I+lrooYevbZ0Tg8wkwIQhM91+vocihHYqHNTDYx4RtT7Jzn+Ql
	hZHU1EvQtFSJbjslt+jQcMA3pkiqZgtY1lSg5wC1NgqOSdPcteG5NkGT9Jd3DrZAWhbGSes+sps
	PpMPMWm0S+UfEmdhb3RpLeq+uinPXUfDP/WMraaWx2FMerxCAdHZr14XhPcI+1972Hbsp1yC0dn
	41bYsWbwKKEf0w/lV7UhJ3vKXO8kwuTkTbNKZ71MjjadOEGuVP2F+90xjGHT1R94MDb381fGTSm
	3Rkt7Vc0362w8w7LcJVsymGaD8ezU+0pQ36VJrJCZGuuOmw+K0NKtHLnh2tijmHS0tg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098433; bh=DV+S+YBKPI4yE6gLNe9ePuD
	8ye5fzLkcyxtpk3kLyU4=; b=4B5H3lLTqQQDDZX/g8Fy3eGlTbWYmcr09GJ/Ki1qMnDbpF9pch
	CydZm/GlGh6JsTty1EOWo0x5k7DfHD9O2bAA==;
From: Bradley Morgan <brads@mainlining.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH 1/5] lib: Add two-byte cmpxchg emulation function
Date: Tue, 22 Sep 2026 17:33:50 +0000
Message-ID: <20260922173354.14404-2-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922173354.14404-1-brads@mainlining.org>
References: <20260922173354.14404-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_103623_386017_FE376165 
X-CRM114-Status: GOOD (  17.76  )
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

cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
cmpxchg() for the architectures lacking native one-byte atomics.
The same architectures also lack native two-byte cmpxchg(), where
such an operation is not supported and either fails to compile via
BUILD_BUG() or fails to link, because the bad pointer sentinels
these architectures declare are never defined.

Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
word with READ_ONCE(), splices the two target bytes through a union
and loops on cmpxchg() of the full word until the compare succeeds.
Like cmpxchg_emu_u8() it is fully ordered.

Unlike cmpxchg_emu_u8() it casts the old and new values to u16
internally and returns unsigned long, taking the old and new values
as unsigned long, per the suggestion from David Laight. The switch
statements in the architecture macros instantiate every size case,
so a cmpxchg() on a pointer type checks the two-byte case as well,
and a u16 parameter or return would make the macro casts and return
conversions warn there. With unsigned long parameters and return the
call sites need no narrowing casts, pointer exchanges compile warning
free, and the function still compares and returns exactly the 16 bits
the caller asked for, which matches the hardware cmpxchg r16
behaviour where a 16-bit compare only looks at the low 16 bits of
the register.

cmpxchg_emu_u8() keeps returning the old value unmasked, so a caller
that passes a wider old than 8 bits still gets it back as passed,
matching the behaviour the one-byte emulator always had.

The Kconfig symbol gating this file is renamed from
ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
selects both the one-byte and the two-byte emulation.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/Kconfig                |  2 +-
 arch/arc/Kconfig            |  2 +-
 arch/csky/Kconfig           |  2 +-
 arch/sh/Kconfig             |  2 +-
 arch/xtensa/Kconfig         |  2 +-
 include/linux/cmpxchg-emu.h |  4 +++-
 lib/Makefile                |  2 +-
 lib/cmpxchg-emu.c           | 38 +++++++++++++++++++++++++++++++++----
 8 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 3bb2e568f5b1..d56064797e09 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1817,7 +1817,7 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
 	# strict alignment always, even with -falign-functions.
 	def_bool CC_HAS_MIN_FUNCTION_ALIGNMENT || CC_IS_CLANG
 
-config ARCH_NEED_CMPXCHG_1_EMU
+config ARCH_NEED_CMPXCHG_1_2_EMU
 	bool
 
 config ARCH_WANTS_PRE_LINK_VMLINUX
diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 80e61175bf52..0e91d254eccb 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -14,7 +14,7 @@ config ARC
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
-	select ARCH_NEED_CMPXCHG_1_EMU
+	select ARCH_NEED_CMPXCHG_1_2_EMU
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select ARCH_32BIT_OFF_T
 	select BUILDTIME_TABLE_SORT
diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 4331313a42ff..5f26e8615d7d 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -37,7 +37,7 @@ config CSKY
 	select ARCH_INLINE_SPIN_UNLOCK_BH if !PREEMPTION
 	select ARCH_INLINE_SPIN_UNLOCK_IRQ if !PREEMPTION
 	select ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE if !PREEMPTION
-	select ARCH_NEED_CMPXCHG_1_EMU
+	select ARCH_NEED_CMPXCHG_1_2_EMU
 	select ARCH_WANT_FRAME_POINTERS if !CPU_CK610 && $(cc-option,-mbacktrace)
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select COMMON_CLK
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index d60f1d5a94c0..09e556fced01 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -14,7 +14,7 @@ config SUPERH
 	select ARCH_HIBERNATION_POSSIBLE if MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select ARCH_NEED_CMPXCHG_1_EMU
+	select ARCH_NEED_CMPXCHG_1_2_EMU
 	select CPU_NO_EFFICIENT_FFS
 	select DMA_DECLARE_COHERENT
 	select GENERIC_ATOMIC64
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index f2f9cd9cde50..62019fd444d4 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -14,7 +14,7 @@ config XTENSA
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
 	select ARCH_HAS_STRNCPY_FROM_USER if !KASAN
 	select ARCH_HAS_STRNLEN_USER
-	select ARCH_NEED_CMPXCHG_1_EMU
+	select ARCH_NEED_CMPXCHG_1_2_EMU
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
diff --git a/include/linux/cmpxchg-emu.h b/include/linux/cmpxchg-emu.h
index 998deec67740..2db70f1e3925 100644
--- a/include/linux/cmpxchg-emu.h
+++ b/include/linux/cmpxchg-emu.h
@@ -4,12 +4,14 @@
  * lacking direct support for these sizes.  These are implemented in terms
  * of 4-byte cmpxchg operations.
  *
- * Copyright (C) 2024 Paul E. McKenney.
+ * Copyright (C) 2024 Paul E. McKenney <paulmck@kernel.org>
+ * Copyright (C) 2026 Bradley Morgan <brads@mainlining.org>
  */
 
 #ifndef __LINUX_CMPXCHG_EMU_H
 #define __LINUX_CMPXCHG_EMU_H
 
 uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
+unsigned long cmpxchg_emu_u16(volatile u16 *p, unsigned long old, unsigned long new);
 
 #endif /* __LINUX_CMPXCHG_EMU_H */
diff --git a/lib/Makefile b/lib/Makefile
index 43421c39d21b..d0e69312176a 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -202,7 +202,7 @@ obj-$(CONFIG_CODE_TAGGING) += codetag.o
 lib-$(CONFIG_GENERIC_BUG) += bug.o
 
 obj-$(CONFIG_HAVE_ARCH_TRACEHOOK) += syscall.o
-obj-$(CONFIG_ARCH_NEED_CMPXCHG_1_EMU) += cmpxchg-emu.o
+obj-$(CONFIG_ARCH_NEED_CMPXCHG_1_2_EMU) += cmpxchg-emu.o
 
 obj-$(CONFIG_DYNAMIC_DEBUG_CORE) += dynamic_debug.o
 #ensure exported functions have prototypes
diff --git a/lib/cmpxchg-emu.c b/lib/cmpxchg-emu.c
index 27f6f97cb60d..25c69224a759 100644
--- a/lib/cmpxchg-emu.c
+++ b/lib/cmpxchg-emu.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Emulated 1-byte cmpxchg operation for architectures lacking direct
- * support for this size.  This is implemented in terms of 4-byte cmpxchg
- * operations.
+ * Emulated 1-byte and 2-byte cmpxchg operations for architectures lacking
+ * direct support for these sizes.  These are implemented in terms of
+ * 4-byte cmpxchg operations.
  *
- * Copyright (C) 2024 Paul E. McKenney.
+ * Copyright (C) 2024 Paul E. McKenney <paulmck@kernel.org>
+ * Copyright (C) 2026 Bradley Morgan <brads@mainlining.org>
  */
 
 #include <linux/types.h>
@@ -43,3 +44,32 @@ uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new)
 	return old;
 }
 EXPORT_SYMBOL_GPL(cmpxchg_emu_u8);
+
+union u16_32 {
+	u16 h[2];
+	u32 w;
+};
+
+/* Emulate two-byte cmpxchg() in terms of 4-byte cmpxchg. */
+unsigned long cmpxchg_emu_u16(volatile u16 *p, unsigned long old, unsigned long new)
+{
+	u32 *p32 = (u32 *)(((uintptr_t)p) & ~0x3);
+	int i = (((uintptr_t)p) & 0x2) / 2;
+	union u16_32 old32;
+	union u16_32 new32;
+	u32 ret;
+
+	WARN_ON_ONCE(((uintptr_t)p) & 0x1);
+	ret = READ_ONCE(*p32);
+	do {
+		old32.w = ret;
+		if (old32.h[i] != (u16)old)
+			return (unsigned long)old32.h[i];
+		new32.w = old32.w;
+		new32.h[i] = (u16)new;
+		instrument_atomic_read_write(p, 2);
+		ret = data_race(cmpxchg(p32, old32.w, new32.w)); // Overridden above.
+	} while (ret != old32.w);
+	return (u16)old;
+}
+EXPORT_SYMBOL_GPL(cmpxchg_emu_u16);
-- 
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
