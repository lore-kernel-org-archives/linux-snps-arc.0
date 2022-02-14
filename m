Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58D5C433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIZ0YyiqIXHVQd5WJuE3hAe8SnqWr5yaMRMe2NM1saM=; b=iFJL8oe0K+BVSp
	8OMGcsKf2qgDWBUNQutRLHYbz87kf/ZLLyZl4NTSRWzP8ofPjRgh4o92Ull9BR1Ttw568k3Ja5WCF
	GbIdX/2huOBAWSP2tTkRnui4Ce140GbRm9zfR7mCStx0f/5Lu0vQyVOhOkg4fSjUANxuLRbGQUDoR
	9EGjhZml+4biBnAwb6aJY5hsNHSg3xxiehvFB9mhBPHQ+RGyrdF+znC71p4DVkLgiEnJPOI4/8Luy
	3RBslf1+51q9WZ41xnZdT+9hoSNVrSPyZ9u191mtNzFfJ3ZIxRVUuLU2xbFXnazpv7wWmUl6E2PXf
	ENhz0z70oHq4Ja6zYeCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJeLm-00G3HV-6I; Mon, 14 Feb 2022 16:37:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJeL3-00G2k7-1u; Mon, 14 Feb 2022 16:36:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85254614F3;
 Mon, 14 Feb 2022 16:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF5AC340EE;
 Mon, 14 Feb 2022 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644856592;
 bh=/86KMr0jNBuJ/zqhHefOXTiqAWO1yELIA3z6g/367IQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ju2iGesCRW+FUxlTNWTSRCgy2RFCuZmRYFpVLrljojp/Ih1OBpPciIhZmM3Mzx76Y
 pq5UVjX55O0F8EXS8TaAkyYpSzYdo5XnN3HUDTfqVZjd5Sxm+EgqhUJfUY0qFQsOiM
 WPe43LcxQCw3FNNhUfT3JoeBojFKSdpgkUg8J9I/dv80iMXlTOJQyVuvr1Ic44t/BW
 sshZLtCicnOONQZDNhIZJ2ShtALDJCGKaAWUcBcXH8Jbk1posHGnpQW7HLIfAPf8T5
 5TP+rCS3n73O88MVkDoM2JLsZFfmsE0haaOo3bUAhntO+4hI+BH5xYhaxIiM5tV/MT
 +qH72eefIpddw==
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
Subject: [PATCH 04/14] x86: use more conventional access_ok() definition
Date: Mon, 14 Feb 2022 17:34:42 +0100
Message-Id: <20220214163452.1568807-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_083633_233153_5C9D5873 
X-CRM114-Status: GOOD (  19.87  )
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

The way that access_ok() is defined on x86 is slightly different from
most other architectures, and a bit more complex.

The generic version tends to result in the best output on all
architectures, as it results in single comparison against a constant
limit for calls with a known size.

There are a few callers of __range_not_ok(), all of which use TASK_SIZE
as the limit rather than TASK_SIZE_MAX, but I could not see any reason
for picking this. Changing these to call __access_ok() instead uses the
default limit, but keeps the behavior otherwise.

x86 is the only architecture with a WARN_ON_IN_IRQ() checking
access_ok(), but it's probably best to leave that in place.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/include/asm/uaccess.h | 38 +++++++++++-----------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index ac96f9b2d64b..6956a63291b6 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -16,30 +16,13 @@
  * Test whether a block of memory is a valid user space address.
  * Returns 0 if the range is valid, nonzero otherwise.
  */
-static inline bool __chk_range_not_ok(unsigned long addr, unsigned long size, unsigned long limit)
+static inline bool __access_ok(void __user *ptr, unsigned long size)
 {
-	/*
-	 * If we have used "sizeof()" for the size,
-	 * we know it won't overflow the limit (but
-	 * it might overflow the 'addr', so it's
-	 * important to subtract the size from the
-	 * limit, not add it to the address).
-	 */
-	if (__builtin_constant_p(size))
-		return unlikely(addr > limit - size);
-
-	/* Arbitrary sizes? Be careful about overflow */
-	addr += size;
-	if (unlikely(addr < size))
-		return true;
-	return unlikely(addr > limit);
-}
+	unsigned long limit = TASK_SIZE_MAX;
+	unsigned long addr = ptr;
 
-#define __range_not_ok(addr, size, limit)				\
-({									\
-	__chk_user_ptr(addr);						\
-	__chk_range_not_ok((unsigned long __force)(addr), size, limit); \
-})
+	return (size <= limit) && (addr <= (limit - size));
+}
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 static inline bool pagefault_disabled(void);
@@ -66,12 +49,15 @@ static inline bool pagefault_disabled(void);
  * Return: true (nonzero) if the memory block may be valid, false (zero)
  * if it is definitely invalid.
  */
-#define access_ok(addr, size)					\
-({									\
-	WARN_ON_IN_IRQ();						\
-	likely(!__range_not_ok(addr, size, TASK_SIZE_MAX));		\
+#define access_ok(addr, size)		\
+({					\
+	WARN_ON_IN_IRQ();		\
+	likely(__access_ok(addr, size));\
 })
 
+#define __range_not_ok(addr, size, limit)	(!__access_ok(addr, size))
+#define __chk_range_not_ok(addr, size, limit)	(!__access_ok((void __user *)addr, size))
+
 extern int __get_user_1(void);
 extern int __get_user_2(void);
 extern int __get_user_4(void);
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
