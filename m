Return-Path: <SRS0=I9+C=KK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0F3C433ED
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 10:19:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C45613F0
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 10:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C45613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ekVGrihiGzROcFxWP+p5xY6anf5q1u2KvLWHMEZFw1Q=; b=aEG9tM9JsK5MlrKihV4g0wogw
	BcGKF84bsQag06OPfkrsxwOeWc+VJ9EymdR5cCP9mjWpgobSzjVO3Jge7/WyEhACK7lAU/BLrEZqy
	aiib+sKoHKAkXmT4LaV0czfwukTTAzuZJmsUev7euh/83Y8CEoSGr9ILN4esbxqLSP49/jMZkBAk0
	f4eOeedQd6F+7+ulOTi3G5aiBHp7jbtqLqFpWvaAC2IxUTYBf3WGNL+MteOhpFRa2pPMjJExeE4ZC
	GXOFxz2fPwf7quuWVRp/jfeEygn6UAUWA9uCXN1b8AhsfTyyTDUqZe4SyzHbobBuwrYBXvY68MjjF
	+Nhno6JJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhrOU-00A8kT-1f; Sat, 15 May 2021 10:19:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhrOI-00A8eX-N3; Sat, 15 May 2021 10:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FU4k2uMM9mwcp1WgQUinaWftWLJ6tL6ok/JHUHLhO1U=; b=ZLDjbvvIuiCTTZC+Dj4koBkiW2
 ltVtaujtQ/TRzakEJqLkUnPrWASutLWy6J4TtLGtvX9XAr3KBkfqNCieVcHG8xYnYtmZutN9FUDTA
 o+xOTGCjop13Jng79xBYmnwwCeNVIwy60lNTZVwuC4dsXnwEM6Mj5kEnd+2BukAGFejxC3SkwcsDr
 d77y13CIgN8JPYD4EtdlDaOiA1txVDayAYcZzhuNioPqu8c9bSvGRN436cUbxtgEyAlNUl1Qc4TEP
 eG+dIry7hsx+1/zihELAWi5o7cLzWTZS+bHrA8AowwoRd+qDVK9uQ4Rp5PPt0laqLnjDZC3LN1rFH
 uBihVknQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhrOE-00CU5u-RZ; Sat, 15 May 2021 10:19:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78078613F1;
 Sat, 15 May 2021 10:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621073962;
 bh=OHYyLARVOpPFIbAcC7K6UIcn3rkRJrz96uQAgiEquDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qcRi/50ljOQgAZf8i+VFhWF6uabdLpEfT7FHBTtxYuSMtemuV9LrEtTDSACDtVyfw
 salCHZmpn79xzNXb8B78wch24f//jkb6g+Fki5uCNdP8zNnv9UtDzG7e22EknaCACh
 mrPOxaZq4mdM1UsevzFRyixsupIwTAYWl49hqhEg3ck/tFFeNs7qINE0LN5ZtJSLfX
 H47TnEMDXTRGI4KAr0xEHobI2Wx0rYPpPUDbXbSo9MF06IlZHzfOPDMp3r4qLLEKvN
 GNVZauk3D4wviEHeU3e+G301vOcgnCYQ7ZvM9PTwWoO0iy7NC/13CbD7OJqRdxhixA
 j4vbx08vZ6TPA==
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
Subject: [PATCH 5/6] [v2] asm-generic: uaccess: remove inline
 strncpy_from_user/strnlen_user
Date: Sat, 15 May 2021 12:18:02 +0200
Message-Id: <20210515101803.924427-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515101803.924427-1-arnd@kernel.org>
References: <20210515101803.924427-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210515_031922_956360_01DE1088 
X-CRM114-Status: GOOD (  13.00  )
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

Consolidate the asm-generic implementation with the library version
that is used everywhere else.

These are the three versions for NOMMU kernels, which can in principle
fall back to strncpy()/strnlen() as the version in asm-generic does,
but this version is particularly inefficient when it scans the string
one byte at a time twice. The generic version also lacks a check
for user_addr_max(), but this is probably ok on NOMMU targets.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/h8300/Kconfig            |  2 ++
 arch/m68k/Kconfig             |  4 +--
 arch/riscv/Kconfig            |  4 +--
 include/asm-generic/uaccess.h | 46 ++++++-----------------------------
 4 files changed, 14 insertions(+), 42 deletions(-)

diff --git a/arch/h8300/Kconfig b/arch/h8300/Kconfig
index 3e3e0f16f7e0..53dfd2d47e0e 100644
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@ -11,6 +11,8 @@ config H8300
 	select GENERIC_IRQ_SHOW
 	select FRAME_POINTER
 	select GENERIC_CPU_DEVICES
+	select GENERIC_STRNCPY_FROM_USER
+	select GENERIC_STRNLEN_USER
 	select MODULES_USE_ELF_RELA
 	select COMMON_CLK
 	select ARCH_WANT_FRAME_POINTERS
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index ed6b8050e3ed..5f1aafa7b2e2 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -17,8 +17,8 @@ config M68K
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IOMAP
 	select GENERIC_IRQ_SHOW
-	select GENERIC_STRNCPY_FROM_USER if MMU
-	select GENERIC_STRNLEN_USER if MMU
+	select GENERIC_STRNCPY_FROM_USER
+	select GENERIC_STRNLEN_USER
 	select HAVE_AOUT if MMU
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_BUGVERBOSE
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a8ad8eb76120..ada7a2918c05 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -55,8 +55,8 @@ config RISCV
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
-	select GENERIC_STRNCPY_FROM_USER if MMU
-	select GENERIC_STRNLEN_USER if MMU
+	select GENERIC_STRNCPY_FROM_USER
+	select GENERIC_STRNLEN_USER
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
 	select HANDLE_DOMAIN_IRQ
 	select HAVE_ARCH_AUDITSYSCALL
diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index c03889cc904c..83a48f430951 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -119,6 +119,11 @@ static inline void set_fs(mm_segment_t fs)
 #ifndef uaccess_kernel
 #define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 #endif
+
+#ifndef user_addr_max
+#define user_addr_max() (uaccess_kernel() ? ~0UL : TASK_SIZE)
+#endif
+
 #endif /* CONFIG_SET_FS */
 
 #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
@@ -243,44 +248,6 @@ static inline int __get_user_fn(size_t size, const void __user *ptr, void *x)
 
 extern int __get_user_bad(void) __attribute__((noreturn));
 
-/*
- * Copy a null terminated string from userspace.
- */
-#ifndef strncpy_from_user
-static inline long
-strncpy_from_user(char *dst, const char __user *src, long count)
-{
-	char *tmp;
-
-	if (!access_ok(src, 1))
-		return -EFAULT;
-
-	strncpy(dst, (const char __force *)src, count);
-	for (tmp = dst; *tmp && count > 0; tmp++, count--)
-		;
-	return (tmp - dst);
-}
-#endif
-
-#ifndef strnlen_user
-/*
- * Return the size of a string (including the ending 0)
- *
- * Return 0 on exception, a value greater than N if too long
- *
- * Unlike strnlen, strnlen_user includes the nul terminator in
- * its returned count. Callers should check for a returned value
- * greater than N as an indication the string is too long.
- */
-static inline long strnlen_user(const char __user *src, long n)
-{
-	if (!access_ok(src, 1))
-		return 0;
-
-	return strnlen(src, n) + 1;
-}
-#endif
-
 /*
  * Zero Userspace
  */
@@ -305,4 +272,7 @@ clear_user(void __user *to, unsigned long n)
 
 #include <asm/extable.h>
 
+extern long strncpy_from_user(char *dst, const char __user *src, long count);
+extern long strnlen_user(const char __user *src, long n);
+
 #endif /* __ASM_GENERIC_UACCESS_H */
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
