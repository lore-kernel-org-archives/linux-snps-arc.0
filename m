Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF64C433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 16:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8JTR13mPDQqP6V6ALuoxAkxSuwg4L62MtCrU3XJ2u0=; b=AXr7BSBoMrGmW8
	Z07Nl4E/Y7Bp65+m3iNRFvjled9lvUcW8QCyXUpgplGGGhSeoQKx8wLo2giLtOwGplcx7UDC98t/g
	JQpKQz5/TrhF4qKSuNbHWmhQGuW5p8hK4rNHuI/UA06xo86abm1KMiV76OzWz481qhm/FmQSLSplK
	gIs63KO7axjkj5lK3qNmpJsEupoVCyCbslX5lv/yEfDIasOUXKGfwMCo3DiZud9wdbBMJzvCdG0pA
	RXi0XofSV9fWBychGysnIa9/B02rrMjS8AXrf0U9s/mjv4cmNFgwknxkO9n7Pqw+4/kqqJ/KHIGe7
	+4/5ssvbGGduAbtb1+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJeL2-00G2k6-Mk; Mon, 14 Feb 2022 16:36:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJeKc-00G2RW-5I; Mon, 14 Feb 2022 16:36:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AE48ECE19DD;
 Mon, 14 Feb 2022 16:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CC7C340EE;
 Mon, 14 Feb 2022 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644856563;
 bh=2pS2EzxZTLC0RofP+LmFDCkJfcLqG3oyKMTlDsmnQjc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jfoz4OzMYCCZunzrcMopY/CyXCM5x2vWuoQu5cxZQgMKEaVoM/Sr8N71wvtrRgqXL
 a36+f8T/jsd7M34QjI1qwRfOhWeXJdMvjHj71iiMAKhSF1PXQoTPyu+r3MQFpjzlNY
 pfj/Fntbr2pKTQjwxeb4E8U2+BwpVepsuV65Y513Xys+mieerEcPbOyhc3jsLYZVF0
 vhV7u/+LrIj1P+w6AXzskZG9da4m/RTtKbhUOU871uw7Ra1bQtL3Uq9EPOwjYbjRLK
 2KVWCc8btF4FXJwm34tAEWsWzKZs63WJsOZ/ydmWQRF1Gp0oAYsx6ehNg5GZx72riS
 VIrwimliCyZQg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org
Cc: linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net, richard@nod.at,
 x86@kernel.org, jcmvbkbc@gmail.com, ebiederm@xmission.com,
 akpm@linux-foundation.org, ardb@kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: [PATCH 02/14] sparc64: add __{get,put}_kernel_nocheck()
Date: Mon, 14 Feb 2022 17:34:40 +0100
Message-Id: <20220214163452.1568807-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_083606_578419_9421FE46 
X-CRM114-Status: GOOD (  13.61  )
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

sparc64 is one of the architectures that uses separate address
spaces for kernel and user addresses, so __get_kernel_nofault()
can not just call into the normal __get_user() without the
access_ok() check.

Instead duplicate __get_user() and __put_user() into their
in-kernel versions, with minor changes for the calling conventions
and leaving out the address space modifier on the assembler
instruction.

This could surely be written more elegantly, but duplicating it
gets the job done.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sparc/include/asm/uaccess_64.h | 78 +++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/sparc/include/asm/uaccess_64.h b/arch/sparc/include/asm/uaccess_64.h
index 30eb4c6414d1..b283798315b1 100644
--- a/arch/sparc/include/asm/uaccess_64.h
+++ b/arch/sparc/include/asm/uaccess_64.h
@@ -100,6 +100,42 @@ void __retl_efault(void);
 struct __large_struct { unsigned long buf[100]; };
 #define __m(x) ((struct __large_struct *)(x))
 
+#define __put_kernel_nofault(dst, src, type, label)			\
+do {									\
+	type *addr = (type __force *)(dst);				\
+	type data = *(type *)src;					\
+	register int __pu_ret;						\
+	switch (sizeof(type)) {						\
+	case 1: __put_kernel_asm(data, b, addr, __pu_ret); break;	\
+	case 2: __put_kernel_asm(data, h, addr, __pu_ret); break;	\
+	case 4: __put_kernel_asm(data, w, addr, __pu_ret); break;	\
+	case 8: __put_kernel_asm(data, x, addr, __pu_ret); break;	\
+	default: __pu_ret = __put_user_bad(); break;			\
+	}								\
+	if (__pu_ret)							\
+		goto label;						\
+} while (0)
+
+#define __put_kernel_asm(x, size, addr, ret)				\
+__asm__ __volatile__(							\
+		"/* Put kernel asm, inline. */\n"			\
+	"1:\t"	"st"#size " %1, [%2]\n\t"				\
+		"clr	%0\n"						\
+	"2:\n\n\t"							\
+		".section .fixup,#alloc,#execinstr\n\t"			\
+		".align	4\n"						\
+	"3:\n\t"							\
+		"sethi	%%hi(2b), %0\n\t"				\
+		"jmpl	%0 + %%lo(2b), %%g0\n\t"			\
+		" mov	%3, %0\n\n\t"					\
+		".previous\n\t"						\
+		".section __ex_table,\"a\"\n\t"				\
+		".align	4\n\t"						\
+		".word	1b, 3b\n\t"					\
+		".previous\n\n\t"					\
+	       : "=r" (ret) : "r" (x), "r" (__m(addr)),			\
+		 "i" (-EFAULT))
+
 #define __put_user_nocheck(data, addr, size) ({			\
 	register int __pu_ret;					\
 	switch (size) {						\
@@ -134,6 +170,48 @@ __asm__ __volatile__(							\
 
 int __put_user_bad(void);
 
+#define __get_kernel_nofault(dst, src, type, label)			     \
+do {									     \
+	type *addr = (type __force *)(src);		     		     \
+	register int __gu_ret;						     \
+	register unsigned long __gu_val;				     \
+	switch (sizeof(type)) {						     \
+		case 1: __get_kernel_asm(__gu_val, ub, addr, __gu_ret); break; \
+		case 2: __get_kernel_asm(__gu_val, uh, addr, __gu_ret); break; \
+		case 4: __get_kernel_asm(__gu_val, uw, addr, __gu_ret); break; \
+		case 8: __get_kernel_asm(__gu_val, x, addr, __gu_ret); break;  \
+		default:						     \
+			__gu_val = 0;					     \
+			__gu_ret = __get_user_bad();			     \
+			break;						     \
+	} 								     \
+	if (__gu_ret)							     \
+		goto label;						     \
+	*(type *)dst = (__force type) __gu_val;				     \
+} while (0)
+#define __get_kernel_asm(x, size, addr, ret)				\
+__asm__ __volatile__(							\
+		"/* Get kernel asm, inline. */\n"			\
+	"1:\t"	"ld"#size " [%2], %1\n\t"				\
+		"clr	%0\n"						\
+	"2:\n\n\t"							\
+		".section .fixup,#alloc,#execinstr\n\t"			\
+		".align	4\n"						\
+	"3:\n\t"							\
+		"sethi	%%hi(2b), %0\n\t"				\
+		"clr	%1\n\t"						\
+		"jmpl	%0 + %%lo(2b), %%g0\n\t"			\
+		" mov	%3, %0\n\n\t"					\
+		".previous\n\t"						\
+		".section __ex_table,\"a\"\n\t"				\
+		".align	4\n\t"						\
+		".word	1b, 3b\n\n\t"					\
+		".previous\n\t"						\
+	       : "=r" (ret), "=r" (x) : "r" (__m(addr)),		\
+		 "i" (-EFAULT))
+
+#define HAVE_GET_KERNEL_NOFAULT
+
 #define __get_user_nocheck(data, addr, size, type) ({			     \
 	register int __gu_ret;						     \
 	register unsigned long __gu_val;				     \
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
