Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C30AC6377D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:29:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 568AD61289
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 568AD61289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGwPx/OkRMInwWgkJQ3riCBXs34Momh8jeStrD+OcCk=; b=PyrlIvsSY5rwiV
	5xT3ovQfeg8Fe5TosXVgOsorSskEyWXxDUE69mUHj5qThqTwYgGM0XuURtVjiqqmwKIjfAkJrympM
	Ay5lxBwDfcaaRQHRy1iDHmMRlVfk6n579ZPzizDRdEiisBKpnwnuOPy4l0Vi2+330cyYz0rmhFaru
	9CTwUX638XCM2Vhmjce9kAKjQeagB2FTGtJJR8Okrkz2cXtuP1+Di3C9HfiO1hnRFSfg7fxTBSGV3
	ot7YMJw53nQ484cuOnKpHo/1WtL4LnSpNILK3SbMWLaxcJk+WJZaAJpTYQtQbhnrXEmA27WgqV5PZ
	d8HL6somLZjob/6PCsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Ylf-001fRQ-Ts; Thu, 22 Jul 2021 13:29:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Y8a-001XS8-Hi; Thu, 22 Jul 2021 12:49:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6ADE7613BB;
 Thu, 22 Jul 2021 12:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626958155;
 bh=tqJH0vqxcWhhn0NnJI/oW7Rihc47OssJOxXQlI4xJ40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M4JNqHkT5asZDoDPWdngOvampfrrZBn/xbxxnUQ0F8obR6jcaxmt+6C+XEYyeJ/3/
 ywyoxo0HQJ8KWzzKEZQefCjh1xA6ZAM2S9BJy2JHn70Huz2f3UpDzZ11olPVfFt8hO
 ni7dA/IV0fB2E4lHQx0voSIRFDKADsTVJEld+b/HqrHxomixp35vz+9LeI9MmGJqno
 CH1ke9fSeZu+I98AnGwjjlBjBBZ1+tkQLhhdRPsLkyJSqJ7XUSlegYPocARLrFP0ky
 TVXNnUSDZFe0m0Px3i2lGteZ9HXXkx6CEgb0bXsmLS3lM6r+XeJmCGocCfnrTbkmvy
 WQ7lEbKMnNNnw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Brian Cain <bcain@codeaurora.org>, Chris Zankel <chris@zankel.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Jeff Dike <jdike@addtoit.com>, Linus Walleij <linus.walleij@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Richard Weinberger <richard@nod.at>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, uclinux-h8-devel@lists.sourceforge.jp
Subject: [PATCH v3 4/9] arc: use generic strncpy/strnlen from_user
Date: Thu, 22 Jul 2021 14:48:09 +0200
Message-Id: <20210722124814.778059-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722124814.778059-1-arnd@kernel.org>
References: <20210722124814.778059-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_054916_757480_AA033AA4 
X-CRM114-Status: GOOD (  10.89  )
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

Remove the arc implemenation of strncpy/strnlen and instead use the
generic versions.  The arc version is fairly slow because it always does
byte accesses even for aligned data, and its checks for user_addr_max()
differ from the generic code.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/Kconfig               |  2 +
 arch/arc/include/asm/uaccess.h | 83 ++--------------------------------
 arch/arc/mm/extable.c          | 12 -----
 3 files changed, 7 insertions(+), 90 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index d8f51eb8963b..64e5f9366401 100644
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
