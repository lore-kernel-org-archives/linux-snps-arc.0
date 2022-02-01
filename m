Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F03C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Feb 2022 14:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8MTxhm9+n1w3kgWWiHSCW/zesCKNcbzcGxp3eNufD4=; b=kS1qhcrOsc/Y5X
	T+c6ltqAvieB0INlV4gvIyghgUeG9FBIMMvIrUGqTJ2WMaYa7Z0AJHWt4fmZ+MudZd6uR7RhzRSfg
	Z4Umyoas7J6OcwEhuwd9gsNTO3gssW9E6WXpAgXjA4SeQdmQs/0AxAaqCoQeP/7YQSJz67EiKPIRx
	YOrKicQVti5F/nqSN8zNkdSuPDpgkQjCMTdmEHNIBylnkdlFGKVtAeBJ1iZt4pcgtpO4UR9Y4kST0
	B6oivO8pRtaeaT7Hsjt9EoQp6cL85C9BNhKu/a8eaRI87R/IUjEji6FzpgWt8GdZwTAVq/CHd8n3w
	D6crv36EEeRE8AKrUwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEuZR-00CUf1-Br; Tue, 01 Feb 2022 14:55:49 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEuZO-00CUcy-6Z
 for linux-snps-arc@lists.infradead.org; Tue, 01 Feb 2022 14:55:47 +0000
Received: by mail-lj1-x234.google.com with SMTP id c15so24472928ljf.11
 for <linux-snps-arc@lists.infradead.org>; Tue, 01 Feb 2022 06:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69XLVm2GbfhQSlExl9Z/lYuxFyaMj+Mg8FgE39Fqe+k=;
 b=NFNhIjIvCSSwiZYYOGr8ESqyTlvbFsYVKfanVGsGO4ndP2Za9bhPMhxceMavmIjYVn
 kuzsxfeNMEgaPRBd5gZJaBP4pyXTEo0O/+/Iy3PN9m/1FjIuYxtzCgwRxO5bFIexk88d
 j8zlaKO0n9UGQ6QGXY6zvncdjmEAPYrwLu19lGkFWQprPDKNgEk3e/NAl/qlGjltznPm
 UzZlGm+u7x/9ScIfT8LVr1jhX7/eg0nUHezBcNnhStIkJGVZOgTp50IN1fzuCqK4fmns
 vpZ3SAUaSTL2ggyWMUECxV08JAUH4tXli2pzmUxrbbuNEr97dsqJsS/sN4UrN7OX4cBA
 VEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69XLVm2GbfhQSlExl9Z/lYuxFyaMj+Mg8FgE39Fqe+k=;
 b=Ndoeagxr2+eH/J1XWe+zxtsvBszu2rvyCiNURDKsbFj2UepHykgMludGDYdWjQRCue
 lsYwl9ANxD+f2tFxSt7sO7zngvXASUOvBssTIaSy0nP3oQxQxZ0eqYEIVoo+01tE61c9
 saJ31OfW3xbBYvbEp1gh4sWE9KD83/smsRDmY9Alc3RpTrZMtelndF3228zVgTGpbQp6
 HkgLCasJhxGbNNkXtU8/7UE12Cz1XCmxaJEth7H0s+6PT3e5tNFTn4GRw/wYEbw57Uo6
 zwbskhq5hHVHy0UylwX8Xn09bGUcGD6/7sOsBrqb21jwvtPtDccPO61K9DhL55jNQD0i
 5hUw==
X-Gm-Message-State: AOAM530NtLvEGpEMboAM1p/gCjFUz8mI1rc9cPYeXk9Bs4IpWhr//H4i
 8Hy6j8g3TptCg74JcCq/MjVWPcXlABw=
X-Google-Smtp-Source: ABdhPJxOwcTG3CRI2NltMWLI9Yf4RY2hcc+p5B3sCRGnMpd5PIKdrZLNL4a+uZOtVCFgqmjAnidTfw==
X-Received: by 2002:a05:651c:2125:: with SMTP id
 a37mr11916098ljq.86.1643727343972; 
 Tue, 01 Feb 2022 06:55:43 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id w11sm2492814lfr.201.2022.02.01.06.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 06:55:43 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Christoph Hellwig <hch@lst.de>, Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 3/3] arc: remove set_fs()
Date: Tue,  1 Feb 2022 17:55:38 +0300
Message-Id: <20220201145538.111192-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220201145538.111192-1-geomatsi@gmail.com>
References: <20220201145538.111192-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_065546_275886_A0DF21E7 
X-CRM114-Status: GOOD (  17.75  )
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

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Kernel __{get,put}_kernel_nofault operations are implemented for ARC.
There are no other remaining arch/arc specific callers of set_fs().
So just remove it and all the supporting code.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 arch/arc/Kconfig                   |  1 -
 arch/arc/include/asm/segment.h     | 20 --------------------
 arch/arc/include/asm/thread_info.h |  3 ---
 arch/arc/include/asm/uaccess.h     | 24 ++++++++----------------
 4 files changed, 8 insertions(+), 40 deletions(-)
 delete mode 100644 arch/arc/include/asm/segment.h

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 3c2a4753d09b..e0a60a27e14d 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -45,7 +45,6 @@ config ARC
 	select PCI_SYSCALL if PCI
 	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
 	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
-	select SET_FS
 	select TRACE_IRQFLAGS_SUPPORT
 
 config LOCKDEP_SUPPORT
diff --git a/arch/arc/include/asm/segment.h b/arch/arc/include/asm/segment.h
deleted file mode 100644
index 871f8ab11bfd..000000000000
--- a/arch/arc/include/asm/segment.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2004, 2007-2010, 2011-2012 Synopsys, Inc. (www.synopsys.com)
- */
-
-#ifndef __ASMARC_SEGMENT_H
-#define __ASMARC_SEGMENT_H
-
-#ifndef __ASSEMBLY__
-
-typedef unsigned long mm_segment_t;
-
-#define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
-
-#define KERNEL_DS		MAKE_MM_SEG(0)
-#define USER_DS			MAKE_MM_SEG(TASK_SIZE)
-#define uaccess_kernel()	(get_fs() == KERNEL_DS)
-
-#endif /* __ASSEMBLY__ */
-#endif /* __ASMARC_SEGMENT_H */
diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
index d36863e34bfc..1e0b2e3914d5 100644
--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -27,7 +27,6 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/thread_info.h>
-#include <asm/segment.h>
 
 /*
  * low level task data that entry.S needs immediate access to
@@ -40,7 +39,6 @@ struct thread_info {
 	unsigned long flags;		/* low level flags */
 	int preempt_count;		/* 0 => preemptable, <0 => BUG */
 	struct task_struct *task;	/* main task structure */
-	mm_segment_t addr_limit;	/* thread address space */
 	__u32 cpu;			/* current CPU */
 	unsigned long thr_ptr;		/* TLS ptr */
 };
@@ -56,7 +54,6 @@ struct thread_info {
 	.flags      = 0,			\
 	.cpu        = 0,			\
 	.preempt_count  = INIT_PREEMPT_COUNT,	\
-	.addr_limit = KERNEL_DS,		\
 }
 
 static inline __attribute_const__ struct thread_info *current_thread_info(void)
diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index c14b692a0a4e..f07eaf17afaf 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -23,14 +23,9 @@
 
 #include <linux/string.h>	/* for generic string functions */
 
-
-#define __kernel_ok		(uaccess_kernel())
-
 /*
- * Algorithmically, for __user_ok() we want do:
+ * Algorithmically, for __access_ok() we want do:
  * 	(start < TASK_SIZE) && (start+len < TASK_SIZE)
- * where TASK_SIZE could either be retrieved from thread_info->addr_limit or
- * emitted directly in code.
  *
  * This can however be rewritten as follows:
  *	(len <= TASK_SIZE) && (start+len < TASK_SIZE)
@@ -41,16 +36,14 @@
  * The reason for rewriting being, for majority of cases, @len is generally
  * compile time constant, causing first sub-expression to be compile time
  * subsumed.
- *
- * The second part would generate weird large LIMMs e.g. (0x6000_0000 - 0x10),
- * so we check for TASK_SIZE using get_fs() since the addr_limit load from mem
- * would already have been done at this call site for __kernel_ok()
- *
  */
-#define __user_ok(addr, sz)	(((sz) <= TASK_SIZE) && \
-				 ((addr) <= (get_fs() - (sz))))
-#define __access_ok(addr, sz)	(unlikely(__kernel_ok) || \
-				 likely(__user_ok((addr), (sz))))
+static inline int __access_ok(unsigned long addr, unsigned long size)
+{
+	__chk_user_ptr(addr);
+	return size <= TASK_SIZE && addr <= TASK_SIZE - size;
+}
+
+#define __access_ok	__access_ok
 
 /*********** Single byte/hword/word copies ******************/
 
@@ -691,7 +684,6 @@ extern unsigned long arc_clear_user_noinline(void __user *to,
 #define __clear_user(d, n)		arc_clear_user_noinline(d, n)
 #endif
 
-#include <asm/segment.h>
 #include <asm-generic/uaccess.h>
 
 #endif
-- 
2.35.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
