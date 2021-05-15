Return-Path: <SRS0=I9+C=KK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4085CC433B4
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 10:19:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA596613F0
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 10:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA596613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RYr3LZ8EQJMsL3XIQxK8e8G8peBZpTtv7LmdKd/n770=; b=OHOY76Coh10+Ly8GQoxItznpo
	RqFQ/lPRJtcyinN9WCdJV5hwdvkrBGxlNE015wl9Yxu/kxlyXyklJtIumeeAmM6TVSudbF0MZdKwZ
	SmNYVA8n9uJU42OYRGbzmI5jSFybnAdJNeNKYg8DNI+3Ir7ozkxn+cjAQUUR+TBKWDSaKUVmz+wpo
	DsBPikLsSFOmsKDvlz+ByV3t1BkMYGP6NYPwCv0gC+Kas8shYIdMldTbgnIu5aHuin3EN/bW/QBSs
	R+KM9qniwzW/UvHGiJYQ4rrNzWr9EfK25JY7f7xSJF35VxnNUvvlyKiURhqYY6A1Y1SUlJiDtPSYu
	016gRQ6eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhrOY-00A8md-8o; Sat, 15 May 2021 10:19:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhrOL-00A8g3-U2; Sat, 15 May 2021 10:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9Fw1IFvYq/KjZTRKKWVzQNRcjazScUqC2uvuOnLwQW0=; b=Y+uvjse+1MvjzSJhMngSlDQ4KV
 kWrh2ud6kQ7RCMGXTCRDj6porqRUfY3+v0uf0csvvqMOEBDEpQ/gJT1cSolZMPj7wOrTK9ktKejbE
 PuxXHEj+Q/w2ZAH+gPLp/UMm0zeyDaXzYL1UjadCHfJBAmAAwNTDZYOr27Sq12KsE0ELXyHIfOcox
 pr0/xC/mZ1hLZ9Qo8O+4EpQK4ohZ0U+OdlccRLI2tHCBaNQ77FmIj7TuPUTc/O3MNYhRSQ0rPr6Lt
 2ZZDrjRqGleoDY5F8X62SMgVE2xWwsfrkKNv0nJdgv7NjUo6YjT1My3bDYKzS2gS+8XG7yhach++3
 hyKfDKWw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhrOJ-00CU6B-A3; Sat, 15 May 2021 10:19:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E949460C40;
 Sat, 15 May 2021 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621073967;
 bh=Lb/DGS9E/FUSMtSHAOCH5rcc8a7ucnqACx5B/SB9r64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lp+IzcRjKvLR7R++grQxnLp5gtXP/qgN/cg/jcb91yHCafo9eiUfkQxObCDBCGovC
 TFKLGUohWA3fQwZPvPi3so4qDwe/nQwdVB/Zpg89Ei6NLVc98yHvm8h8zpxNkOXOzJ
 HqlnbG+AOzcfs7TiPxwHgCjBWg/sp1i9Mx+5NkeL/2X5g4YE7j9kLgiy41okPcWaDK
 GZ3hLjqev+EZ0yJmEGmLgCdC9w79agdGf9FvOnZDObtON4etwgfiPcWKWiAgelyks0
 Gtn4EtMiZohOg//Wb49qpe1Brp+XFagahm8puDaxQjJ1NEBFDVrRK656cJmTzk6wAb
 0ws3B/3Ao+LfA==
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
Subject: [PATCH 6/6] [v2] asm-generic: remove extra strn{cpy_from,
 len}_user declarations
Date: Sat, 15 May 2021 12:18:03 +0200
Message-Id: <20210515101803.924427-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515101803.924427-1-arnd@kernel.org>
References: <20210515101803.924427-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210515_031927_392424_A939B3DB 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
