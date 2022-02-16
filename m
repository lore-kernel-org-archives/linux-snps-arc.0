Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCAEC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Feb 2022 13:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCopD4UQYc9o65+/kJ9fqgiEZHsBfZNuPJxNYG1HTlo=; b=FZExBOfrflnD83
	VvwFfQ7y19FsiF95xnIpDhWnwY7gZQcdiatiBBqXjQ/7+vzWcDamlZ8t8hzIlnVeUfQ0cWn7HMASB
	tpcaGm7xecjsMSxubSlJPYv3b2WgaJokkJdxDchAp6vqlbeBqEy9/l6VzT7Xs/+B8mthGz+gujA/9
	+F6KTrWQu65iaaKRYDHUswGUFBEGhQr99D3OabPRBbEoUFBkunOy2RzTAN9CjRw/uRClsrjrAduyK
	KyL4M2SenK34cQFkuPpOIZlpUPEB1pLMP3w1FMUMLK3ySDhHHmMvBKBiP9jgz8x5SEoRVUkEbJiVZ
	Cs6PaBuL/G0eOLH5Pzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKKBp-0076Qh-Lz; Wed, 16 Feb 2022 13:17:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKKBb-0076D1-7q; Wed, 16 Feb 2022 13:17:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BE186165A;
 Wed, 16 Feb 2022 13:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29850C36AEA;
 Wed, 16 Feb 2022 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017454;
 bh=vo9dsIEQPQMwDE1F9151Sj8jUgLpMoSWAhLaZqQrPZo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lBOJyeVG43t32e6bfIFQr2JNVmm/3CNnrSPgqp1aywEBs/TnQkH6UoCiuwvYMO5MT
 lwj96h6bIunw0aUrOBHuzAKda33BuKaGijgF6GnixzSz0Sdjj9nkHeXMHqnuG3V0jx
 44u9TnpCcEvGf+Vd6ksaKYU1m1gu9FHVMuqt7U7Z/oHjVq7rSyW4eH2Jx7Z461guOE
 mcS1xOazBw3oe3viFMv1lFKhgYJQk0K4Po3WN6QX2wQnkyybT7djomYdy6S5JuLuay
 gvNVGTV6/HrfYqwdbeOKnPWvh89RBj9KN27iwj3K2hOs52sURTV04KxU5EHc02P7Ol
 oUX9kkXIU5HPQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Cc: linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net, richard@nod.at,
 x86@kernel.org, jcmvbkbc@gmail.com, ebiederm@xmission.com,
 akpm@linux-foundation.org, ardb@kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 11/18] arm64: simplify access_ok()
Date: Wed, 16 Feb 2022 14:13:25 +0100
Message-Id: <20220216131332.1489939-12-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_051735_381727_500DAE33 
X-CRM114-Status: GOOD (  20.95  )
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

arm64 has an inline asm implementation of access_ok() that is derived from
the 32-bit arm version and optimized for the case that both the limit and
the size are variable. With set_fs() gone, the limit is always constant,
and the size usually is as well, so just using the default implementation
reduces the check into a comparison against a constant that can be
scheduled by the compiler.

On a defconfig build, this saves over 28KB of .text.

Acked-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/uaccess.h | 34 ++++++++++----------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 2e20879fe3cf..199c553b740a 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -26,6 +26,14 @@
 #include <asm/memory.h>
 #include <asm/extable.h>
 
+static inline int __access_ok(const void __user *ptr, unsigned long size)
+{
+	unsigned long limit = TASK_SIZE_MAX;
+	unsigned long addr = (unsigned long)ptr;
+
+	return (size <= limit) && (addr <= (limit - size));
+}
+
 /*
  * Test whether a block of memory is a valid user space address.
  * Returns 1 if the range is valid, 0 otherwise.
@@ -33,10 +41,8 @@
  * This is equivalent to the following test:
  * (u65)addr + (u65)size <= (u65)TASK_SIZE_MAX
  */
-static inline unsigned long __range_ok(const void __user *addr, unsigned long size)
+static inline int access_ok(const void __user *addr, unsigned long size)
 {
-	unsigned long ret, limit = TASK_SIZE_MAX - 1;
-
 	/*
 	 * Asynchronous I/O running in a kernel thread does not have the
 	 * TIF_TAGGED_ADDR flag of the process owning the mm, so always untag
@@ -46,29 +52,9 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 	    (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
 		addr = untagged_addr(addr);
 
-	__chk_user_ptr(addr);
-	asm volatile(
-	// A + B <= C + 1 for all A,B,C, in four easy steps:
-	// 1: X = A + B; X' = X % 2^64
-	"	adds	%0, %3, %2\n"
-	// 2: Set C = 0 if X > 2^64, to guarantee X' > C in step 4
-	"	csel	%1, xzr, %1, hi\n"
-	// 3: Set X' = ~0 if X >= 2^64. For X == 2^64, this decrements X'
-	//    to compensate for the carry flag being set in step 4. For
-	//    X > 2^64, X' merely has to remain nonzero, which it does.
-	"	csinv	%0, %0, xzr, cc\n"
-	// 4: For X < 2^64, this gives us X' - C - 1 <= 0, where the -1
-	//    comes from the carry in being clear. Otherwise, we are
-	//    testing X' - C == 0, subject to the previous adjustments.
-	"	sbcs	xzr, %0, %1\n"
-	"	cset	%0, ls\n"
-	: "=&r" (ret), "+r" (limit) : "Ir" (size), "0" (addr) : "cc");
-
-	return ret;
+	return likely(__access_ok(addr, size));
 }
 
-#define access_ok(addr, size)	__range_ok(addr, size)
-
 /*
  * User access enabling/disabling.
  */
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
