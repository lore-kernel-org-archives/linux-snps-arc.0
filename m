Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD82C63793
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:29:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC1E61289
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC1E61289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYr3LZ8EQJMsL3XIQxK8e8G8peBZpTtv7LmdKd/n770=; b=dBhn4Ie27+F5l1
	5PXzC7EFYRA2on9WhfXY3oygzIV3K388xOSnzfwXd179UbWh1d+YHa9uQlXBIv43+T9duzL8gg6zw
	5HwIGUl9aBUGiz6iBSC2dwiodfhwPwKjCwItRVwVa8HhoqiUIGu20sMDrTq9mNANMBPztYWzIqCqu
	subcqEQLlIvssyB+DSb+5wj0nkWeAI4ZBlJfGoJILUsgsa9Ys8WWWetYgrCyzRhGHpALiYuUiiEzz
	lLlYpcRvIH3uUr5F3sVaGgMDqowENTnc2+Z2i/oASW46xu61He7oX1HlD71KgHncCUZwNRHH0rgpJ
	+sqAVuj2U+kRlRaqK+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Ylv-001fdZ-18; Thu, 22 Jul 2021 13:29:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Y8x-001XZR-FU; Thu, 22 Jul 2021 12:49:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C5356135B;
 Thu, 22 Jul 2021 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626958178;
 bh=Lb/DGS9E/FUSMtSHAOCH5rcc8a7ucnqACx5B/SB9r64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DlDQQcJWBtu8uGwZq7CjQmNgX2T8xiLFz36rrnffGFNmyFcUbDzmYO8Dh1wVzhQBj
 mXfyYN6rNAtyWUhbW+eOeaAzsVBPOcm5/g36yS1ZuD3Y8G6hbwWT+q5xi4L4Q7G7uv
 7MB6QaWeQInRe7HQtjzXXBdvuhQlK9V4yt29fc+frxRGN8Po290okXM214yrvvxv0s
 31IA+WAE0UQD5EilOPMtZz59mPbvNLCaeeNh22wHNjOWOrT2hS70tkXDkJUVmbY+fQ
 4Dt+2v4eU/DdXKOkQoEVP3549Vc2kQ2Df5tw3ubn4NIgoLCPnr7hNUn1jxPJxJXRmG
 HoHVd+rT8j/Pw==
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
Subject: [PATCH v3 8/9] asm-generic: remove extra strn{cpy_from,
 len}_user declarations
Date: Thu, 22 Jul 2021 14:48:13 +0200
Message-Id: <20210722124814.778059-9-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722124814.778059-1-arnd@kernel.org>
References: <20210722124814.778059-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_054939_710647_CAA38163 
X-CRM114-Status: GOOD (  10.05  )
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

As these are now in asm-generic, it's no longer necessary to
declare them in the architecture.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/include/asm/uaccess.h     | 5 -----
 arch/hexagon/include/asm/uaccess.h | 6 ------
 arch/um/include/asm/uaccess.h      | 5 +----
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index 754a23f26736..783bfdb3bfa3 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -667,11 +667,6 @@ extern unsigned long arc_clear_user_noinline(void __user *to,
 #define __clear_user(d, n)		arc_clear_user_noinline(d, n)
 #endif
 
-extern long strncpy_from_user(char *dst, const char __user *src, long count);
-#define strncpy_from_user(d, s, n)	strncpy_from_user(d, s, n)
-extern long strnlen_user(const char __user *src, long n);
-#define strnlen_user(s, n)		strnlen_user(s, n)
-
 #include <asm/segment.h>
 #include <asm-generic/uaccess.h>
 
diff --git a/arch/hexagon/include/asm/uaccess.h b/arch/hexagon/include/asm/uaccess.h
index d950df12d8c5..ef5bfef8d490 100644
--- a/arch/hexagon/include/asm/uaccess.h
+++ b/arch/hexagon/include/asm/uaccess.h
@@ -57,12 +57,6 @@ unsigned long raw_copy_to_user(void __user *to, const void *from,
 __kernel_size_t __clear_user_hexagon(void __user *dest, unsigned long count);
 #define __clear_user(a, s) __clear_user_hexagon((a), (s))
 
-extern long strnlen_user(const char __user *src, long n);
-#define strnlen_user strnlen_user
-
-extern long strncpy_from_user(char *dst, const char __user *src, long n)
-#define strncpy_from_user strncpy_from_user
-
 #include <asm-generic/uaccess.h>
 
 
diff --git a/arch/um/include/asm/uaccess.h b/arch/um/include/asm/uaccess.h
index 3bf209f683f8..191ef36dd543 100644
--- a/arch/um/include/asm/uaccess.h
+++ b/arch/um/include/asm/uaccess.h
@@ -23,16 +23,13 @@
 
 extern unsigned long raw_copy_from_user(void *to, const void __user *from, unsigned long n);
 extern unsigned long raw_copy_to_user(void __user *to, const void *from, unsigned long n);
-extern long strncpy_from_user(char *dst, const char __user *src, long count);
-extern long strnlen_user(const void __user *str, long len);
 extern unsigned long __clear_user(void __user *mem, unsigned long len);
 static inline int __access_ok(unsigned long addr, unsigned long size);
 
 /* Teach asm-generic/uaccess.h that we have C functions for these. */
 #define __access_ok __access_ok
 #define __clear_user __clear_user
-#define strnlen_user strnlen_user
-#define strncpy_from_user strncpy_from_user
+
 #define INLINE_COPY_FROM_USER
 #define INLINE_COPY_TO_USER
 
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
