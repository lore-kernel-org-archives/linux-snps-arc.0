Return-Path: <SRS0=Kl7k=KJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05255C433ED
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 May 2021 22:11:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 785B061182
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 May 2021 22:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 785B061182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RYr3LZ8EQJMsL3XIQxK8e8G8peBZpTtv7LmdKd/n770=; b=kFEIlM6/1yCUHVr0dPAVt/BQ4
	WPpphAA9+msnOp9NwCD5S1Z0Pw4aTUSyNEU1fkOWhofMr9zZkvgQT46TXmyHBJsO9rWejo9pDynyV
	1ohhR7Cykki+sXpNEEkEv7jvMCUPFser2MPnrYufxgUIbcDY2ohts0YPQMSSTMaKlgsAelYFtidaa
	dKxfH7r0F6S9NCb74zEOVhvQOZ4BYARo1fiEC3vUM/eXlj7cHAtnkJ8xZhT0wHhtMGRXdxTPZ2Yeh
	xr39xqIRB3p9l0WTIY6cm4PzQYSd7Q7WAJ6vrdj7I/OxKEti5I769MH0/KCW4RB3VQLKIYTmefEK6
	Y2sb2jdSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhg1l-0098Ml-Ml; Fri, 14 May 2021 22:11:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhg1Z-0098H1-Ui; Fri, 14 May 2021 22:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9Fw1IFvYq/KjZTRKKWVzQNRcjazScUqC2uvuOnLwQW0=; b=bif7u50Z1vmQ/P8jtNsSrbo1eT
 t2UKZ6jqnjQ0hDNReppAYSQUYIJyKjvkNPf05AUPjVYVDVaPCqkUEcyBjMg2zPKQkFkX5Cx5mVaX5
 aRIYgB+tSWPNP5st/OKkEWgQtJEHCnUbxXZhWYLrB+ex7aNWkqx9Cr5Re0I7eoI0ht28A5rSUgomP
 Z1HGXxg2J3f11LCfRIkg8SGteuX1I/JFhppMzBR7RV3bWPmCPLyXwRw5rmcOI8dZyDFSlpV3xIGw/
 FMGuFLkLUaOd9IrPFF/JZum5gbB6kPJRvjWOgk42yFG4CCWTO97YPJzzUkJVRkczHdknct06+yfxS
 vN4u7IjA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhg1X-00CID4-C2; Fri, 14 May 2021 22:11:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E33CE61442;
 Fri, 14 May 2021 22:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621030271;
 bh=Lb/DGS9E/FUSMtSHAOCH5rcc8a7ucnqACx5B/SB9r64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PFd/GiDiedFSPvNHS9H1fNeAbz58qXcETZ9s7Wy+PgQIcJHm1fghiifKcptGhNQcH
 E9xwCqrZnkWmOkStLA1rGcLATFgz1srjJnsRR+SvXqlQ30B4ugit6miQJPmDBUyECE
 OYiQ2EtXiwqwKPnArJZ2GB/MI9ZoVyU/OlAdMXqkgw2DQ1T3ALdjynFTidsayU+Z/m
 R3ZuvZBAZ7uaKBLBrrVX/1gywhxhZpzl4fyzaEPLMuBdGe2PhtZvpdXI0qGUWY06Jp
 26NUno68FQo0wFbx/BSrHTsv0FPFVjNgAr8L9PjM5+wfIU+1fYPgA2Sy1e7v8oh0pj
 kkG3PdWqkdfDA==
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
Subject: [PATCH 5/5] asm-generic: remove extra strn{cpy_from,
 len}_user declarations
Date: Sat, 15 May 2021 00:09:42 +0200
Message-Id: <20210514220942.879805-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210514220942.879805-1-arnd@kernel.org>
References: <20210514220942.879805-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_151111_469462_1CDE403A 
X-CRM114-Status: GOOD (  10.21  )
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
