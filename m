Return-Path: <SRS0=Kl7k=KJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB92C433ED
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 May 2021 22:11:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36DC6145B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 May 2021 22:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A36DC6145B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dUUVCQvEr42GJHGYhCYgWVMZQztN6WpdKYFakhT+/AQ=; b=C0wn7PXoLkGQCTL+uNs7UglaO
	EZihj/njacgEnL+07khy9s1QCo6D57KC2h4GMhTMKJob6I8igbUaEy9voG40sMJbMcDvoBmvkkZXE
	jGIlfFhhQM97RmMYQQB8zoj2DAQo9GEpsDVWABwHVSteOwCYi2jJY8pNZZCD3W8hcQ3rE3st7hXnS
	A84QovsATSkdlFfabcbLuqWmz2fe7y0qpVDRcG/VK/gYhBHAU/6cTtONlvh3gqIUURoB6yuKBoKdc
	8CMhA19Uplg+2lCVosCYwhvBSFvDN7orznzF96WadPjuu44lCGU5iAZgdUCQyTPrwedrg5Q8x9Fhm
	dS4w+Jl2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhg1c-0098J1-SE; Fri, 14 May 2021 22:11:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhg1R-0098Dy-1r; Fri, 14 May 2021 22:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vPNEWNfxajpOuZHDGEjaAwEFAAWSpJad8YLr9zZP008=; b=RCVye9/EaIhP6KB/HLQ2TA1EHS
 ZgU+MWxo63egwn2TsQqqZeeKxwJIDr60zj2Te7WalCrqXMYBe1OxYKDE3K3ytm1DFB6WUNZUichfe
 WKtCJ9kmLwKCU1RBxU7P8GpUm2CqZEXTWPPyRYAUm9GM5s4/3ieP8tBQ+sFlk5W+vIiq8qY+u2h5G
 B9fShNjmM4WyBXrpFy2BGt09WHjaJx7FRDbJ9FZrcLl5w4rp9ZcxuV6mvKwhbN9mQur2ROaqrJTcS
 pUV292hZ8QULwUa+mjNsr6Xstek593nrJYC2IX/woPqX5Zbmd5WXJsL8at8iTzndvAMHAAvQEufhI
 dOh2YbsQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhg1O-00CIC9-C7; Fri, 14 May 2021 22:11:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F00E661440;
 Fri, 14 May 2021 22:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621030262;
 bh=n3IjLuSr3h2pDECqv/rSPCb8yGwiqfSbFhYV6qfMYfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hMv1xdQUTM1N2R8mepU61Lbm+L/FkVGRGeZpBwh+Ez3YaZwxM62wJCy6X8lgiAjCi
 yHbIkRTukSzGyXNLkolOGVhrv/ePLTSa3IVc6r7hktpnuH/a2bp7IoG+npMP+poOc6
 t4sABgyzrKkBwxnXdq84rK/HJfZcD4CWswhxbqIkbJQe663MJEz01vT3niqoOtJ6r1
 L4PmOHQDEt/dnK7uVzX59S7ST5f7GGTPdRnemSpSCWtqg5jGxxZKzRHpiNhCr2XbMc
 kBfz19VaPeAm+WuzIEHk3epVkInnP9qvRWDsKNRyKQu7eAyHE9aYBRilGsN8tT8jhc
 z0iEBDnj5mcpQ==
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
Subject: [PATCH 3/5] arc: use generic strncpy/strnlen from_user
Date: Sat, 15 May 2021 00:09:40 +0200
Message-Id: <20210514220942.879805-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210514220942.879805-1-arnd@kernel.org>
References: <20210514220942.879805-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_151102_475259_0766054D 
X-CRM114-Status: GOOD (  11.52  )
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

Most per-architecture versions of these functions are broken
in some form, and they are almost certainly slower than the
generic code as well.

Remove the ones for arc and instead use the generic
version.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/Kconfig               |  2 +
 arch/arc/include/asm/uaccess.h | 83 ++--------------------------------
 arch/arc/mm/extable.c          | 12 -----
 3 files changed, 7 insertions(+), 90 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 2d98501c0897..a38f403a8811 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -27,6 +27,8 @@ config ARC
 	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
+	select GENERIC_STRNCPY_FROM_USER
+	select GENERIC_STRNLEN_USER
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if ARC_MMU_V4
diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index 3476348f361e..754a23f26736 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -655,96 +655,23 @@ static inline unsigned long __arc_clear_user(void __user *to, unsigned long n)
 	return res;
 }
 
-static inline long
-__arc_strncpy_from_user(char *dst, const char __user *src, long count)
-{
-	long res = 0;
-	char val;
-
-	if (!access_ok(src, 1))
-		return -EFAULT;
-
-	if (count == 0)
-		return 0;
-
-	__asm__ __volatile__(
-	"	mov	lp_count, %5		\n"
-	"	lp	3f			\n"
-	"1:	ldb.ab  %3, [%2, 1]		\n"
-	"	breq.d	%3, 0, 3f               \n"
-	"	stb.ab  %3, [%1, 1]		\n"
-	"	add	%0, %0, 1	# Num of NON NULL bytes copied	\n"
-	"3:								\n"
-	"	.section .fixup, \"ax\"		\n"
-	"	.align 4			\n"
-	"4:	mov %0, %4		# sets @res as -EFAULT	\n"
-	"	j   3b				\n"
-	"	.previous			\n"
-	"	.section __ex_table, \"a\"	\n"
-	"	.align 4			\n"
-	"	.word   1b, 4b			\n"
-	"	.previous			\n"
-	: "+r"(res), "+r"(dst), "+r"(src), "=r"(val)
-	: "g"(-EFAULT), "r"(count)
-	: "lp_count", "memory");
-
-	return res;
-}
-
-static inline long __arc_strnlen_user(const char __user *s, long n)
-{
-	long res, tmp1, cnt;
-	char val;
-
-	if (!access_ok(s, 1))
-		return 0;
-
-	__asm__ __volatile__(
-	"	mov %2, %1			\n"
-	"1:	ldb.ab  %3, [%0, 1]		\n"
-	"	breq.d  %3, 0, 2f		\n"
-	"	sub.f   %2, %2, 1		\n"
-	"	bnz 1b				\n"
-	"	sub %2, %2, 1			\n"
-	"2:	sub %0, %1, %2			\n"
-	"3:	;nop				\n"
-	"	.section .fixup, \"ax\"		\n"
-	"	.align 4			\n"
-	"4:	mov %0, 0			\n"
-	"	j   3b				\n"
-	"	.previous			\n"
-	"	.section __ex_table, \"a\"	\n"
-	"	.align 4			\n"
-	"	.word 1b, 4b			\n"
-	"	.previous			\n"
-	: "=r"(res), "=r"(tmp1), "=r"(cnt), "=r"(val)
-	: "0"(s), "1"(n)
-	: "memory");
-
-	return res;
-}
-
 #ifndef CONFIG_CC_OPTIMIZE_FOR_SIZE
 
 #define INLINE_COPY_TO_USER
 #define INLINE_COPY_FROM_USER
 
 #define __clear_user(d, n)		__arc_clear_user(d, n)
-#define strncpy_from_user(d, s, n)	__arc_strncpy_from_user(d, s, n)
-#define strnlen_user(s, n)		__arc_strnlen_user(s, n)
 #else
 extern unsigned long arc_clear_user_noinline(void __user *to,
 		unsigned long n);
-extern long arc_strncpy_from_user_noinline (char *dst, const char __user *src,
-		long count);
-extern long arc_strnlen_user_noinline(const char __user *src, long n);
-
 #define __clear_user(d, n)		arc_clear_user_noinline(d, n)
-#define strncpy_from_user(d, s, n)	arc_strncpy_from_user_noinline(d, s, n)
-#define strnlen_user(s, n)		arc_strnlen_user_noinline(s, n)
-
 #endif
 
+extern long strncpy_from_user(char *dst, const char __user *src, long count);
+#define strncpy_from_user(d, s, n)	strncpy_from_user(d, s, n)
+extern long strnlen_user(const char __user *src, long n);
+#define strnlen_user(s, n)		strnlen_user(s, n)
+
 #include <asm/segment.h>
 #include <asm-generic/uaccess.h>
 
diff --git a/arch/arc/mm/extable.c b/arch/arc/mm/extable.c
index b06b09ddf924..4e14c4244ea2 100644
--- a/arch/arc/mm/extable.c
+++ b/arch/arc/mm/extable.c
@@ -32,16 +32,4 @@ unsigned long arc_clear_user_noinline(void __user *to,
 }
 EXPORT_SYMBOL(arc_clear_user_noinline);
 
-long arc_strncpy_from_user_noinline(char *dst, const char __user *src,
-		long count)
-{
-	return __arc_strncpy_from_user(dst, src, count);
-}
-EXPORT_SYMBOL(arc_strncpy_from_user_noinline);
-
-long arc_strnlen_user_noinline(const char __user *src, long n)
-{
-	return __arc_strnlen_user(src, n);
-}
-EXPORT_SYMBOL(arc_strnlen_user_noinline);
 #endif
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
