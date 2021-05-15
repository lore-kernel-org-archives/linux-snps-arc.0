Return-Path: <SRS0=I9+C=KK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6E7C43461
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 10:19:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42CDA613F2
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 10:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42CDA613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FW62g8usJjsn+Bk31mXUa8vt6f6H832dv2jjDpLGxXQ=; b=o1A2Pu5Jy17ZHtbtOY7d25HQ8
	dX4vOvNPxa9OtttIRoCM92x7vV4JGpwYEaFFXPNrQpFLKQvZrbW20kkHpFFOMHMHEM+roLy7AJ+Kf
	tz1LRUx37NoLiTb5zUkD+gROSO1Udq3hj/WORh7EzHPYcqy/bo1pxt8SHHQ8tJ4e08HUNeX7HmL3J
	MpOYCeNCkV6PTytV/Al9M4LIUxoD4fSOfO0CQf8anNZs9zKkrgRGPmEcob7FJ/PUCp6+eGpAJVn7W
	1C8wk1pjokafhn2S5iRwzxslnWF+WOV6K33LgzwRU24rFrncLKvMTJ5rI+wjn0/eyKrOhEnKrYm4q
	/oDwp6mJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhrOJ-00A8fT-Gv; Sat, 15 May 2021 10:19:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhrO8-00A8ak-NN; Sat, 15 May 2021 10:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=SzKaI6dXc74+BRW8SKXs0CQeJ0fbvs60xmG21l/oZOE=; b=TUqPQWMhzKbPJwPSDgva7HOlSx
 roZWstrCHkkYR+fhHcta/Mn9Imru08NTpvoARkBG5iSRiB/ejooxXBOBgO2zSs//7e6S4kqs3VHbs
 5SM/5C9bAFCj0TjO0UzPyPs3F70CAG22/wl0XWz1Mv9VAhCUJUsM2MnJPeWO7/aroKBJb53oSnKUp
 f8hVoKN0c+YaBzL3JdHuGDGfTieG1IMPnNT/pSx5XdDGXMHwDgL/5EkUx6xtczaaE8u8xESDBu3MX
 seTXBHjnw8NnLHue1SUTje8AzS7P2QPLxfwHio6H/VSIVja8Rrk1IlqURjhrHeJWYdMH2Z6dH7sbs
 T+bzKQXg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhrO5-00CU57-Ud; Sat, 15 May 2021 10:19:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91842613F7;
 Sat, 15 May 2021 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621073953;
 bh=kI7iPmlJRPV9cT24htrm0onuzJ0NEoNiBghzMsHijxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XfM/0trNZKCIK7Oa1enMTPiSVt8geLkcYU8otQOB9OeV/EdYV8/BVKtML4mcS7vCO
 r/SkhN/MThpOxdGCYI0s9BEv3QHUmpi9sl8uGaS4zRqre+k8FBybLBQMr21jw1aZxk
 qmEpWFxRY5cpCO8vFEPeL7idKCVz4MxheBnAB0o7Vm8kfMcGCggwxGwpUyCN1U1jtn
 6WNMJUo/V/aQlwYibT7yGorRNWV7qFEFrNoXajIPaaPp2jxC5roUUYE0fUSFx+I3bu
 wuJsMlYmtOursEBvcgKO0DT8u+TwMaalVsQucbwm5B9zckFSvQCyMiluZkg/oPDE9n
 LU3061hEHSCtw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Sid Manning <sidneym@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-um@lists.infradead.org
Subject: [PATCH 3/6] [v2] hexagon: use generic strncpy/strnlen from_user
Date: Sat, 15 May 2021 12:18:00 +0200
Message-Id: <20210515101803.924427-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515101803.924427-1-arnd@kernel.org>
References: <20210515101803.924427-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210515_031914_052760_C271B4F1 
X-CRM114-Status: GOOD (  17.51  )
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

From: Arnd Bergmann <arnd@arndb.de>

Most per-architecture versions of these functions are broken in some form,
and they are almost certainly slower than the generic code as well.

Remove the ones for hexagon and instead use the generic version.
This custom version reads the data twice for strncpy() by doing an extra
strnlen(), and it apparently lacks a check for user_addr_max().

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/hexagon/Kconfig                |   2 +
 arch/hexagon/include/asm/uaccess.h  |  33 +-------
 arch/hexagon/kernel/hexagon_ksyms.c |   1 -
 arch/hexagon/mm/Makefile            |   2 +-
 arch/hexagon/mm/strnlen_user.S      | 126 ----------------------------
 5 files changed, 5 insertions(+), 159 deletions(-)
 delete mode 100644 arch/hexagon/mm/strnlen_user.S

diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index f18ec6f49c15..d094186188df 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -19,6 +19,8 @@ config HEXAGON
 	# GENERIC_ALLOCATOR is used by dma_alloc_coherent()
 	select GENERIC_ALLOCATOR
 	select GENERIC_IRQ_SHOW
+	select GENERIC_STRNCPY_FROM_USER
+	select GENERIC_STRNLEN_USER
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_TRACEHOOK
 	select NEED_SG_DMA_LENGTH
diff --git a/arch/hexagon/include/asm/uaccess.h b/arch/hexagon/include/asm/uaccess.h
index 59aa3a50744f..d950df12d8c5 100644
--- a/arch/hexagon/include/asm/uaccess.h
+++ b/arch/hexagon/include/asm/uaccess.h
@@ -57,42 +57,13 @@ unsigned long raw_copy_to_user(void __user *to, const void *from,
 __kernel_size_t __clear_user_hexagon(void __user *dest, unsigned long count);
 #define __clear_user(a, s) __clear_user_hexagon((a), (s))
 
-extern long __strnlen_user(const char __user *src, long n);
-
-static inline strnlen_user(const char __user *src, long n)
-{
-        if (!access_ok(src, 1))
-		return 0;
-
-	return __strnlen_user(src, n);
-}
-/*  get around the ifndef in asm-generic/uaccess.h  */
+extern long strnlen_user(const char __user *src, long n);
 #define strnlen_user strnlen_user
 
-static inline long strncpy_from_user(char *dst, const char __user *src, long n);
+extern long strncpy_from_user(char *dst, const char __user *src, long n)
 #define strncpy_from_user strncpy_from_user
 
 #include <asm-generic/uaccess.h>
 
-/*  Todo:  an actual accelerated version of this.  */
-static inline long strncpy_from_user(char *dst, const char __user *src, long n)
-{
-	long res = strnlen_user(src, n);
-
-	if (unlikely(!res))
-		return -EFAULT;
-
-	if (res > n) {
-		long left = raw_copy_from_user(dst, src, n);
-		if (unlikely(left))
-			memset(dst + (n - left), 0, left);
-		return n;
-	} else {
-		long left = raw_copy_from_user(dst, src, res);
-		if (unlikely(left))
-			memset(dst + (res - left), 0, left);
-		return res-1;
-	}
-}
 
 #endif
diff --git a/arch/hexagon/kernel/hexagon_ksyms.c b/arch/hexagon/kernel/hexagon_ksyms.c
index 35545a7386a0..ec56ce2d92a2 100644
--- a/arch/hexagon/kernel/hexagon_ksyms.c
+++ b/arch/hexagon/kernel/hexagon_ksyms.c
@@ -15,7 +15,6 @@ EXPORT_SYMBOL(__clear_user_hexagon);
 EXPORT_SYMBOL(raw_copy_from_user);
 EXPORT_SYMBOL(raw_copy_to_user);
 EXPORT_SYMBOL(iounmap);
-EXPORT_SYMBOL(__strnlen_user);
 EXPORT_SYMBOL(__vmgetie);
 EXPORT_SYMBOL(__vmsetie);
 EXPORT_SYMBOL(__vmyield);
diff --git a/arch/hexagon/mm/Makefile b/arch/hexagon/mm/Makefile
index 893838499591..49911a906fd0 100644
--- a/arch/hexagon/mm/Makefile
+++ b/arch/hexagon/mm/Makefile
@@ -4,4 +4,4 @@
 #
 
 obj-y := init.o ioremap.o uaccess.o vm_fault.o cache.o
-obj-y += copy_to_user.o copy_from_user.o strnlen_user.o vm_tlb.o
+obj-y += copy_to_user.o copy_from_user.o vm_tlb.o
diff --git a/arch/hexagon/mm/strnlen_user.S b/arch/hexagon/mm/strnlen_user.S
deleted file mode 100644
index 4b5574a7cc9c..000000000000
--- a/arch/hexagon/mm/strnlen_user.S
+++ /dev/null
@@ -1,126 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * User string length functions for kernel
- *
- * Copyright (c) 2010-2011, The Linux Foundation. All rights reserved.
- */
-
-#define isrc	r0
-#define max	r1	/*  Do not change!  */
-
-#define end	r2
-#define tmp1	r3
-
-#define obo	r6	/*  off-by-one  */
-#define start	r7
-#define mod8	r8
-#define dbuf    r15:14
-#define dcmp	r13:12
-
-/*
- * The vector mask version of this turned out *really* badly.
- * The hardware loop version also turned out *really* badly.
- * Seems straight pointer arithmetic basically wins here.
- */
-
-#define fname __strnlen_user
-
-	.text
-	.global fname
-	.type fname, @function
-	.p2align 5  /*  why?  */
-fname:
-	{
-		mod8 = and(isrc,#7);
-		end = add(isrc,max);
-		start = isrc;
-	}
-	{
-		P0 = cmp.eq(mod8,#0);
-		mod8 = and(end,#7);
-		dcmp = #0;
-		if (P0.new) jump:t dw_loop;	/*  fire up the oven  */
-	}
-
-alignment_loop:
-fail_1:	{
-		tmp1 = memb(start++#1);
-	}
-	{
-		P0 = cmp.eq(tmp1,#0);
-		if (P0.new) jump:nt exit_found;
-		P1 = cmp.gtu(end,start);
-		mod8 = and(start,#7);
-	}
-	{
-		if (!P1) jump exit_error;  /*  hit the end  */
-		P0 = cmp.eq(mod8,#0);
-	}
-	{
-		if (!P0) jump alignment_loop;
-	}
-
-
-
-dw_loop:
-fail_2:	{
-		dbuf = memd(start);
-		obo = add(start,#1);
-	}
-	{
-		P0 = vcmpb.eq(dbuf,dcmp);
-	}
-	{
-		tmp1 = P0;
-		P0 = cmp.gtu(end,start);
-	}
-	{
-		tmp1 = ct0(tmp1);
-		mod8 = and(end,#7);
-		if (!P0) jump end_check;
-	}
-	{
-		P0 = cmp.eq(tmp1,#32);
-		if (!P0.new) jump:nt exit_found;
-		if (!P0.new) start = add(obo,tmp1);
-	}
-	{
-		start = add(start,#8);
-		jump dw_loop;
-	}	/*  might be nice to combine these jumps...   */
-
-
-end_check:
-	{
-		P0 = cmp.gt(tmp1,mod8);
-		if (P0.new) jump:nt exit_error;	/*  neverfound!  */
-		start = add(obo,tmp1);
-	}
-
-exit_found:
-	{
-		R0 = sub(start,isrc);
-		jumpr R31;
-	}
-
-exit_error:
-	{
-		R0 = add(max,#1);
-		jumpr R31;
-	}
-
-	/*  Uh, what does the "fixup" return here?  */
-	.falign
-fix_1:
-	{
-		R0 = #0;
-		jumpr R31;
-	}
-
-	.size fname,.-fname
-
-
-.section __ex_table,"a"
-.long fail_1,fix_1
-.long fail_2,fix_1
-.previous
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
