Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A2AC63797
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:29:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14D6961353
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14D6961353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4wo08ouUcRdHNHrcDy9BzteCDUTuq1u6Of6uOIaV94=; b=Pqvyzpnhuc+PKh
	j1DFVgPcoYUZPLfSbxPgitmIAy6KJYbFPsbiPVN/G9U3RPV0aNwEC0Y49IG/JX4YewS4lnhENYwhH
	xRGqgcFt7MfrCw/0cEjS9FlBMPG0IAB065+dlTjeuv3cTcH0XOqVENSrLIy7GVEbdKsBalRGkRHfW
	yOJP5ZMGGLirhVna7TH1s4KNTp55butRFcaJta2dL7mn3wX7FEmSOvBWHby1iM0NISGrVC4Z59FSW
	kozzxcmZDVXSB1gc8DhUPLQJgY3EBqtF280u9CI/0Fu6oajaQ47ROBA+fqJBGOqghTOZZjZP/0h+f
	E5u6SZpqU5jtQvr4aV5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6YlZ-001fNj-44; Thu, 22 Jul 2021 13:29:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Y8J-001XNO-Ar; Thu, 22 Jul 2021 12:49:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 315F061358;
 Thu, 22 Jul 2021 12:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626958138;
 bh=2OoIl2Wd/QvZGg10KzfAX7UXvogvE9tKMxysyn7xw0I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uJhwBQzCwfR7BNUpi5PyutoZEFrNsalZCQLjHBp6+IX0t7r6V3tttMQMiWyBWhaq2
 riKgOLCZM2T2JCFAVl7B4dMEeOTZmXMmwknnNCfWwKe2x6cb+ZW1BCC2NEeS61MdQR
 g2225FyJUKhPalxpLKBuD6RYUkK6ggpH+fnvO1q3YpQVCTNIVn9124gfm5Qmw/fP5b
 tRIBMtsFmHlct/utf5j/61K8DBLE8QQfeCJPwuwgIj2+xrciM2C6TNRUjb0V72h9yj
 RtE/63m0mmO8LEIFBHrZluRFc4frhJCBBxg4cEFGzUTvIelzilFY/RIgP95ohrLm55
 4LWjS8IW9/l0g==
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
Subject: [PATCH v3 1/9] asm-generic/uaccess.h: remove
 __strncpy_from_user/__strnlen_user
Date: Thu, 22 Jul 2021 14:48:06 +0200
Message-Id: <20210722124814.778059-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722124814.778059-1-arnd@kernel.org>
References: <20210722124814.778059-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_054859_482325_58205E38 
X-CRM114-Status: GOOD (  20.80  )
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
into the strncpy_from_user() and strnlen_user() functions to make
each implementation independent of the others.

Many of these implementations have known bugs, but the intention
here is to not change behavior at all and stay compatible with
those bugs for the moment.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/include/asm/uaccess.h     | 14 ++++++++++----
 arch/csky/include/asm/uaccess.h    |  8 ++++----
 arch/csky/lib/usercopy.c           | 14 ++++++++++----
 arch/hexagon/include/asm/uaccess.h | 22 +++++++++++++---------
 arch/um/include/asm/uaccess.h      |  8 ++++----
 arch/um/kernel/skas/uaccess.c      | 14 ++++++++++----
 include/asm-generic/uaccess.h      | 28 +++++++++++-----------------
 7 files changed, 62 insertions(+), 46 deletions(-)

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
 
diff --git a/arch/csky/include/asm/uaccess.h b/arch/csky/include/asm/uaccess.h
index ac83823fc437..e17c02a6709f 100644
--- a/arch/csky/include/asm/uaccess.h
+++ b/arch/csky/include/asm/uaccess.h
@@ -209,11 +209,11 @@ unsigned long raw_copy_to_user(void *to, const void *from, unsigned long n);
 unsigned long __clear_user(void __user *to, unsigned long n);
 #define __clear_user __clear_user
 
-long __strncpy_from_user(char *dst, const char *src, long count);
-#define __strncpy_from_user __strncpy_from_user
+long strncpy_from_user(char *dst, const char *src, long count);
+#define strncpy_from_user strncpy_from_user
 
-long __strnlen_user(const char *s, long n);
-#define __strnlen_user __strnlen_user
+long strnlen_user(const char *s, long n);
+#define strnlen_user strnlen_user
 
 #include <asm/segment.h>
 #include <asm-generic/uaccess.h>
diff --git a/arch/csky/lib/usercopy.c b/arch/csky/lib/usercopy.c
index c5d394a0ae78..938b750d2fb1 100644
--- a/arch/csky/lib/usercopy.c
+++ b/arch/csky/lib/usercopy.c
@@ -163,11 +163,14 @@ EXPORT_SYMBOL(raw_copy_to_user);
  * If @count is smaller than the length of the string, copies @count bytes
  * and returns @count.
  */
-long __strncpy_from_user(char *dst, const char *src, long count)
+long strncpy_from_user(char *dst, const char *src, long count)
 {
 	long res, faultres;
 	int tmp;
 
+	if (!access_ok(src, 1))
+		return -EFAULT;
+
 	__asm__ __volatile__(
 	"       cmpnei  %3, 0           \n"
 	"       bf      4f              \n"
@@ -198,7 +201,7 @@ long __strncpy_from_user(char *dst, const char *src, long count)
 
 	return res;
 }
-EXPORT_SYMBOL(__strncpy_from_user);
+EXPORT_SYMBOL(strncpy_from_user);
 
 /*
  * strnlen_user: - Get the size of a string in user space.
@@ -211,10 +214,13 @@ EXPORT_SYMBOL(__strncpy_from_user);
  * On exception, returns 0.
  * If the string is too long, returns a value greater than @n.
  */
-long __strnlen_user(const char *s, long n)
+long strnlen_user(const char *s, long n)
 {
 	unsigned long res, tmp;
 
+	if (!access_ok(src, 1))
+		return -EFAULT;
+
 	__asm__ __volatile__(
 	"       cmpnei  %1, 0           \n"
 	"       bf      3f              \n"
@@ -242,7 +248,7 @@ long __strnlen_user(const char *s, long n)
 
 	return res;
 }
-EXPORT_SYMBOL(__strnlen_user);
+EXPORT_SYMBOL(strnlen_user);
 
 /*
  * __clear_user: - Zero a block of memory in user space, with less checking.
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
index 6c76df96e858..fc2c7e961e72 100644
--- a/arch/um/kernel/skas/uaccess.c
+++ b/arch/um/kernel/skas/uaccess.c
@@ -189,11 +189,14 @@ static int strncpy_chunk_from_user(unsigned long from, int len, void *arg)
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
@@ -205,7 +208,7 @@ long __strncpy_from_user(char *dst, const char __user *src, long count)
 		return -EFAULT;
 	return strnlen(dst, count);
 }
-EXPORT_SYMBOL(__strncpy_from_user);
+EXPORT_SYMBOL(strncpy_from_user);
 
 static int clear_chunk(unsigned long addr, int len, void *unused)
 {
@@ -236,10 +239,13 @@ static int strnlen_chunk(unsigned long str, int len, void *arg)
 	return 0;
 }
 
-long __strnlen_user(const void __user *str, long len)
+long strnlen_user(const void __user *str, long len)
 {
 	int count = 0, n;
 
+	if (!access_ok(src, 1))
+		return -EFAULT;
+
 	if (uaccess_kernel())
 		return strnlen((__force char*)str, len) + 1;
 
@@ -248,7 +254,7 @@ long __strnlen_user(const void __user *str, long len)
 		return count + 1;
 	return 0;
 }
-EXPORT_SYMBOL(__strnlen_user);
+EXPORT_SYMBOL(strnlen_user);
 
 /**
  * arch_futex_atomic_op_inuser() - Atomic arithmetic operation with constant
diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index a0b2f270dddc..2f8a5d3bbd57 100644
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
