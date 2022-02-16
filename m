Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B96C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Feb 2022 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3U6W2SnTqDdBsCjryJuKsQVs6qGgZ8xUW3cKgnOmPng=; b=WvhuYWsQa4QRj5
	vIZ2/HJ8ReVNqitjTMruegJQk7gR2Nk9deUfPagYUKT1dKEkPDI9sXJlEP53XbaGoXr5GynUY+M0H
	D07gFUE3xTBlcFAVTkB6A/TZQzrsvDe9XVv+Cx+p9TgGDpUlryuGxtaF465Mg14/OV5JgANRchJvL
	FIUzbQs97Y0K3Hfi9GZtfjGS7Mlhv8RbeIbA59qczSSQ2PUw4S/KiG46ZjzHfmcYtghQo18HYZazN
	wrx5iszxFn8uElBkg6EVu97mFkomrLED2hRSfk8cVUTtNdPBt9GzqDm+nxzZLnfztbxBfApcOsSvg
	tRFbXSnQnjovZmyx3byA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKKBT-00764q-FB; Wed, 16 Feb 2022 13:17:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKKBJ-0075to-4k; Wed, 16 Feb 2022 13:17:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5ABD2CE26F6;
 Wed, 16 Feb 2022 13:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2C4C340F9;
 Wed, 16 Feb 2022 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017433;
 bh=XYviTV8III28kBrCQmsfuK51xOc09ZOif7iEHrUTuIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RtZeNhuMWLMdUCgp7sQPtFKueCz8UIMqyfmOJ7eTRpRAZj+EX1IydRbAp51tHxwWq
 5ne2vxMm/JuLMAmzyha4cuHaIahixOHFYVc5gGcfZri8EF8XqsDBKKhTiX2FVDpISR
 Pagw3akqo4xNGkF8Pb3UNLVmcr6ZFwFviZKx75YteMrlQ/LSVcu+z3apLlbK8geLHf
 v3iSy1y9VzaMo/+yVZXWf0Swp3oDEXhPv7eE6oQXabEKWYYUYMRDAqB7mO4dBnJnsi
 bzLr4K/tjkFnSoB/60v9gCoDQiRG0gDzcN5E85Rk8eBnmYUibpTvgJRV9oTUxC2Xso
 Mffr2yyPA6wPQ==
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
 linux-xtensa@linux-xtensa.org
Subject: [PATCH v2 09/18] mips: use simpler access_ok()
Date: Wed, 16 Feb 2022 14:13:23 +0100
Message-Id: <20220216131332.1489939-10-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_051717_589865_DECABAC9 
X-CRM114-Status: GOOD (  19.43  )
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

Before unifying the mips version of __access_ok() with the generic
code, this converts it to the same algorithm. This is a change in
behavior on mips64, as now address in the user segment, the lower
2^62 bytes, is taken to be valid, relying on a page fault for
addresses that are within that segment but not valid on that CPU.

The new version should be the most effecient way to do this, but
it gets rid of the special handling for size=0 that most other
architectures ignore as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/uaccess.h | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index db9a8e002b62..d7c89dc3426c 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -19,6 +19,7 @@
 #ifdef CONFIG_32BIT
 
 #define __UA_LIMIT 0x80000000UL
+#define TASK_SIZE_MAX	__UA_LIMIT
 
 #define __UA_ADDR	".word"
 #define __UA_LA		"la"
@@ -33,6 +34,7 @@
 extern u64 __ua_limit;
 
 #define __UA_LIMIT	__ua_limit
+#define TASK_SIZE_MAX	XKSSEG
 
 #define __UA_ADDR	".dword"
 #define __UA_LA		"dla"
@@ -42,22 +44,6 @@ extern u64 __ua_limit;
 
 #endif /* CONFIG_64BIT */
 
-/*
- * Is a address valid? This does a straightforward calculation rather
- * than tests.
- *
- * Address valid if:
- *  - "addr" doesn't have any high-bits set
- *  - AND "size" doesn't have any high-bits set
- *  - AND "addr+size" doesn't have any high-bits set
- *  - OR we are in kernel mode.
- *
- * __ua_size() is a trick to avoid runtime checking of positive constant
- * sizes; for those we already know at compile time that the size is ok.
- */
-#define __ua_size(size)							\
-	((__builtin_constant_p(size) && (signed long) (size) > 0) ? 0 : (size))
-
 /*
  * access_ok: - Checks if a user space pointer is valid
  * @addr: User space pointer to start of block to check
@@ -79,9 +65,9 @@ extern u64 __ua_limit;
 static inline int __access_ok(const void __user *p, unsigned long size)
 {
 	unsigned long addr = (unsigned long)p;
-	unsigned long end = addr + size - !!size;
+	unsigned long limit = TASK_SIZE_MAX;
 
-	return (__UA_LIMIT & (addr | end | __ua_size(size))) == 0;
+	return (size <= limit) && (addr <= (limit - size));
 }
 
 #define access_ok(addr, size)					\
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
