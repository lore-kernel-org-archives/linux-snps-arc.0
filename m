Return-Path: <SRS0=Kl7k=KJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F9FC433B4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 May 2021 22:11:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4984E61453
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 May 2021 22:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4984E61453
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NrLfsYHlnC3N4tSd2pbykGH2l3YT9eiakpJ/ilBbjTQ=; b=jLXwyjuAuHdIU/dTuWyMBITIM
	cFWmHApARCCVd/DqAz7Fj8I/ZVxKN8pHa3kfb/fAV01HlRk4XJs2ZwToeBh8YTLK3Uei16AakiL51
	l6ILuBysHW0RqpKGGxwBnK/6VpgGfVXAhjHzSUxB9J6TVEu65klzHZwFIcJdNlSoqoHskyvFiz1Mu
	2aLw4UEBDNqIxM4hfJ5aqIiurzmUHxBA8CUjmwjSd9AGcDc/n6Jzy+tGPLfFMeVdB2Kf1GQ+g1Hso
	vLC6aBDdtjTGozKyn0KpUa+iRHm2japaR/luEsMJZmh8CmMKy+ROYC/jcG/yn6jXvXtvbvJXspKeA
	KkCsOv7og==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhg1M-0098Cw-JT; Fri, 14 May 2021 22:11:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhg1I-0098Be-CI; Fri, 14 May 2021 22:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tNtVzum3+jmItql2AdkblZN0kg2xjCy6+6H3Mnz/RAM=; b=fUlZez16U5xQoXNckzom2MaqT+
 IBJgsZhOVA98kqyhYs++A4JglgbWvQasmZcTxydOkA5TftQgvxhrW/sNg2/faVMBpUJPLTWWE7iFY
 8tVr0jXmZ2VX3WRNmgaMtfKbG7D5OrKhc0eSC1KIYcn0OTVBNrCAaPFciyEMFs9ztsbkSShmdH8OC
 Eg6TgUKd478rrBOq5AdJR8LshbLQ2iN3aztBbRZI4mXd9VVHmObL/m5PDPolH/6+3LSRsd29toh+a
 VVLxWoghPRPwQWsT7S0DLNixsTBkHYcRkGBPNeAsT+Hw+PreLQBJXmbTlPoH7s8H6a3Xt6/rdS2Pl
 /nt9PX+Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhg1F-00CIB7-EB; Fri, 14 May 2021 22:10:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1050861442;
 Fri, 14 May 2021 22:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621030253;
 bh=aUw+r/nEodOPwyLxBnACR72ulITbwIstVbqXf4RRoJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oYBr8bGKcTRMUOp2zoQGJPX5679NcgVqQDZoScnhBl/RG3Kf9VFROFuxnZ2PYbUQp
 HbMeDK9xehouxSDKBmgv5lyhLy6L8QEuCI09B8k636PJ4PIx+RMZ86BZJ+1SDBOjtI
 w6x/8vaq2LgB/oHRDPceRLy95NS/naosQOIONqbCHDfwcxS1vZmYhqRX8HywJHQy7Z
 oN85ZsVRRgEdcYYERghpTitKtDHkJAUTk4nmz4zUq84KFTvm2HT4FkLgUi4AN1teug
 0D5rRFn5LTD1UcK81AXhl4m0dGa5I4XmVban0KVqOcblgEZp8Xu4oMFybVHbboBLKp
 nqjttqDBqwHiA==
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
Subject: [PATCH 1/5] asm-generic/uaccess.h: remove
 __strncpy_from_user/__strnlen_user
Date: Sat, 15 May 2021 00:09:38 +0200
Message-Id: <20210514220942.879805-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210514220942.879805-1-arnd@kernel.org>
References: <20210514220942.879805-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_151053_546066_28DDB6CA 
X-CRM114-Status: GOOD (  19.00  )
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

This is a preparation for changing over architectures to the
generic implementation one at a time. As there are no callers
of either __strncpy_from_user() or __strnlen_user(), fold these
into the strncpy_from_user() strnlen_user() functions to make
each implementation independent of the others.

Many of these implementations have known bugs, but the intention
here is to not change behavior at all and stay compatible with
those bugs for the moment.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/include/asm/uaccess.h     | 14 ++++++++++----
 arch/hexagon/include/asm/uaccess.h | 22 +++++++++++++---------
 arch/um/include/asm/uaccess.h      |  8 ++++----
 arch/um/kernel/skas/uaccess.c      |  5 ++++-
 include/asm-generic/uaccess.h      | 28 +++++++++++-----------------
 5 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index ea40ec7f6cae..3476348f361e 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -661,6 +661,9 @@ __arc_strncpy_from_user(char *dst, const char __user *src, long count)
 	long res = 0;
 	char val;
 
+	if (!access_ok(src, 1))
+		return -EFAULT;
+
 	if (count == 0)
 		return 0;
 
@@ -693,6 +696,9 @@ static inline long __arc_strnlen_user(const char __user *s, long n)
 	long res, tmp1, cnt;
 	char val;
 
+	if (!access_ok(s, 1))
+		return 0;
+
 	__asm__ __volatile__(
 	"	mov %2, %1			\n"
 	"1:	ldb.ab  %3, [%0, 1]		\n"
@@ -724,8 +730,8 @@ static inline long __arc_strnlen_user(const char __user *s, long n)
 #define INLINE_COPY_FROM_USER
 
 #define __clear_user(d, n)		__arc_clear_user(d, n)
-#define __strncpy_from_user(d, s, n)	__arc_strncpy_from_user(d, s, n)
-#define __strnlen_user(s, n)		__arc_strnlen_user(s, n)
+#define strncpy_from_user(d, s, n)	__arc_strncpy_from_user(d, s, n)
+#define strnlen_user(s, n)		__arc_strnlen_user(s, n)
 #else
 extern unsigned long arc_clear_user_noinline(void __user *to,
 		unsigned long n);
@@ -734,8 +740,8 @@ extern long arc_strncpy_from_user_noinline (char *dst, const char __user *src,
 extern long arc_strnlen_user_noinline(const char __user *src, long n);
 
 #define __clear_user(d, n)		arc_clear_user_noinline(d, n)
-#define __strncpy_from_user(d, s, n)	arc_strncpy_from_user_noinline(d, s, n)
-#define __strnlen_user(s, n)		arc_strnlen_user_noinline(s, n)
+#define strncpy_from_user(d, s, n)	arc_strncpy_from_user_noinline(d, s, n)
+#define strnlen_user(s, n)		arc_strnlen_user_noinline(s, n)
 
 #endif
 
diff --git a/arch/hexagon/include/asm/uaccess.h b/arch/hexagon/include/asm/uaccess.h
index c1019a736ff1..59aa3a50744f 100644
--- a/arch/hexagon/include/asm/uaccess.h
+++ b/arch/hexagon/include/asm/uaccess.h
@@ -57,23 +57,27 @@ unsigned long raw_copy_to_user(void __user *to, const void *from,
 __kernel_size_t __clear_user_hexagon(void __user *dest, unsigned long count);
 #define __clear_user(a, s) __clear_user_hexagon((a), (s))
 
-#define __strncpy_from_user(dst, src, n) hexagon_strncpy_from_user(dst, src, n)
+extern long __strnlen_user(const char __user *src, long n);
 
-/*  get around the ifndef in asm-generic/uaccess.h  */
-#define __strnlen_user __strnlen_user
+static inline strnlen_user(const char __user *src, long n)
+{
+        if (!access_ok(src, 1))
+		return 0;
 
-extern long __strnlen_user(const char __user *src, long n);
+	return __strnlen_user(src, n);
+}
+/*  get around the ifndef in asm-generic/uaccess.h  */
+#define strnlen_user strnlen_user
 
-static inline long hexagon_strncpy_from_user(char *dst, const char __user *src,
-					     long n);
+static inline long strncpy_from_user(char *dst, const char __user *src, long n);
+#define strncpy_from_user strncpy_from_user
 
 #include <asm-generic/uaccess.h>
 
 /*  Todo:  an actual accelerated version of this.  */
-static inline long hexagon_strncpy_from_user(char *dst, const char __user *src,
-					     long n)
+static inline long strncpy_from_user(char *dst, const char __user *src, long n)
 {
-	long res = __strnlen_user(src, n);
+	long res = strnlen_user(src, n);
 
 	if (unlikely(!res))
 		return -EFAULT;
diff --git a/arch/um/include/asm/uaccess.h b/arch/um/include/asm/uaccess.h
index fe66d659acad..3bf209f683f8 100644
--- a/arch/um/include/asm/uaccess.h
+++ b/arch/um/include/asm/uaccess.h
@@ -23,16 +23,16 @@
 
 extern unsigned long raw_copy_from_user(void *to, const void __user *from, unsigned long n);
 extern unsigned long raw_copy_to_user(void __user *to, const void *from, unsigned long n);
-extern long __strncpy_from_user(char *dst, const char __user *src, long count);
-extern long __strnlen_user(const void __user *str, long len);
+extern long strncpy_from_user(char *dst, const char __user *src, long count);
+extern long strnlen_user(const void __user *str, long len);
 extern unsigned long __clear_user(void __user *mem, unsigned long len);
 static inline int __access_ok(unsigned long addr, unsigned long size);
 
 /* Teach asm-generic/uaccess.h that we have C functions for these. */
 #define __access_ok __access_ok
 #define __clear_user __clear_user
-#define __strnlen_user __strnlen_user
-#define __strncpy_from_user __strncpy_from_user
+#define strnlen_user strnlen_user
+#define strncpy_from_user strncpy_from_user
 #define INLINE_COPY_FROM_USER
 #define INLINE_COPY_TO_USER
 
diff --git a/arch/um/kernel/skas/uaccess.c b/arch/um/kernel/skas/uaccess.c
index 2dec915abe6f..205679cc4bb7 100644
--- a/arch/um/kernel/skas/uaccess.c
+++ b/arch/um/kernel/skas/uaccess.c
@@ -188,11 +188,14 @@ static int strncpy_chunk_from_user(unsigned long from, int len, void *arg)
 	return 0;
 }
 
-long __strncpy_from_user(char *dst, const char __user *src, long count)
+long strncpy_from_user(char *dst, const char __user *src, long count)
 {
 	long n;
 	char *ptr = dst;
 
+	if (!access_ok(src, 1))
+		return -EFAULT;
+
 	if (uaccess_kernel()) {
 		strncpy(dst, (__force void *) src, count);
 		return strnlen(dst, count);
diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index 4973328f3c6e..c03889cc904c 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -246,11 +246,15 @@ extern int __get_user_bad(void) __attribute__((noreturn));
 /*
  * Copy a null terminated string from userspace.
  */
-#ifndef __strncpy_from_user
+#ifndef strncpy_from_user
 static inline long
-__strncpy_from_user(char *dst, const char __user *src, long count)
+strncpy_from_user(char *dst, const char __user *src, long count)
 {
 	char *tmp;
+
+	if (!access_ok(src, 1))
+		return -EFAULT;
+
 	strncpy(dst, (const char __force *)src, count);
 	for (tmp = dst; *tmp && count > 0; tmp++, count--)
 		;
@@ -258,24 +262,12 @@ __strncpy_from_user(char *dst, const char __user *src, long count)
 }
 #endif
 
-static inline long
-strncpy_from_user(char *dst, const char __user *src, long count)
-{
-	if (!access_ok(src, 1))
-		return -EFAULT;
-	return __strncpy_from_user(dst, src, count);
-}
-
+#ifndef strnlen_user
 /*
  * Return the size of a string (including the ending 0)
  *
  * Return 0 on exception, a value greater than N if too long
- */
-#ifndef __strnlen_user
-#define __strnlen_user(s, n) (strnlen((s), (n)) + 1)
-#endif
-
-/*
+ *
  * Unlike strnlen, strnlen_user includes the nul terminator in
  * its returned count. Callers should check for a returned value
  * greater than N as an indication the string is too long.
@@ -284,8 +276,10 @@ static inline long strnlen_user(const char __user *src, long n)
 {
 	if (!access_ok(src, 1))
 		return 0;
-	return __strnlen_user(src, n);
+
+	return strnlen(src, n) + 1;
 }
+#endif
 
 /*
  * Zero Userspace
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
