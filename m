Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAF7C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Feb 2022 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTtYP3+fRv+U4xEWza5plpPUTKwD3d6inA6Z2dNTdDY=; b=J4ddLG/McS/E6a
	OCQ6Uu6JkMb27E7Bc7ZdVxAuYMZDUv3vFPLSNus5J0t0TtcKymnFQvp6z/+x4PhiJHaeARoOt3Si2
	gjf4AhNpkCtL7BbL/ZcMe7/VXQxNNSn+uwdUmSDcw6FkcNBmRHXB6n43umJiOELoABvrXsN+F878m
	XzFl9sqbTvqtfTuUaSpZLLLc84fzTSox2tY4A7GmU51oHqfXyj+Y79A5ZMwXE61Xp63Ey8hZbYm4n
	WeeSrTzfhiEOib3nUOZ5vAwAg28werQBDqcGijwprxm8fkATpYDUR3In5zBKvfi0+YTV+h0x8u/rr
	PuqJkgA233+EN/2FYzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKKB3-0075gh-IP; Wed, 16 Feb 2022 13:17:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKKAw-0075aI-S4; Wed, 16 Feb 2022 13:16:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C7486164A;
 Wed, 16 Feb 2022 13:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47582C340F1;
 Wed, 16 Feb 2022 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017413;
 bh=+iR2qnnFcrsCPQoMglxV/90U3LFjDlY0u/606L67UPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FvFA19KgOFHw//5AD53hF0IwW2eLEb8iC830WFN6MdVoW4fyh5i/2kJHpxFd7pdlD
 7UX6fEewGCq+cZvaT2PObS6XOZnZypDPzvRcYa/W0nzWewDgb+0xXamh2omZfLYFmr
 8N4H7mpvMOTDqe2QPH8s/NhnVxUv6/h988kxIKpvMvfqvjGNNvINW6t4henTJIKwJt
 jzLnL5Fc+Su69zkh5g1Nf3EInYTi+sp1khBbBbK8Lt97/7IVApa2FzdwQAvU7AyEeL
 nEYQi1fYgk8k2uZixKdw/j3+QwXzCx+3pjcEKGsjL9tNOzijYs/MTwOK3SPeQjakHj
 3w2JGHUIm9rGg==
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
Subject: [PATCH v2 07/18] nios2: drop access_ok() check from __put_user()
Date: Wed, 16 Feb 2022 14:13:21 +0100
Message-Id: <20220216131332.1489939-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_051655_017940_7F37B898 
X-CRM114-Status: GOOD (  12.12  )
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

Unlike other architectures, the nios2 version of __put_user() has an
extra check for access_ok(), preventing it from being used to implement
__put_kernel_nofault().

Split up put_user() along the same lines as __get_user()/get_user()

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/nios2/include/asm/uaccess.h | 56 +++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/arch/nios2/include/asm/uaccess.h b/arch/nios2/include/asm/uaccess.h
index ca9285a915ef..a5cbe07cf0da 100644
--- a/arch/nios2/include/asm/uaccess.h
+++ b/arch/nios2/include/asm/uaccess.h
@@ -167,34 +167,44 @@ do {									\
 	: "r" (val), "r" (ptr), "i" (-EFAULT));				\
 }
 
-#define put_user(x, ptr)						\
+#define __put_user_common(__pu_val, __pu_ptr)				\
 ({									\
 	long __pu_err = -EFAULT;					\
-	__typeof__(*(ptr)) __user *__pu_ptr = (ptr);			\
-	__typeof__(*(ptr)) __pu_val = (__typeof(*ptr))(x);		\
-	if (access_ok(__pu_ptr, sizeof(*__pu_ptr))) {	\
-		switch (sizeof(*__pu_ptr)) {				\
-		case 1:							\
-			__put_user_asm(__pu_val, "stb", __pu_ptr, __pu_err); \
-			break;						\
-		case 2:							\
-			__put_user_asm(__pu_val, "sth", __pu_ptr, __pu_err); \
-			break;						\
-		case 4:							\
-			__put_user_asm(__pu_val, "stw", __pu_ptr, __pu_err); \
-			break;						\
-		default:						\
-			/* XXX: This looks wrong... */			\
-			__pu_err = 0;					\
-			if (copy_to_user(__pu_ptr, &(__pu_val),		\
-				sizeof(*__pu_ptr)))			\
-				__pu_err = -EFAULT;			\
-			break;						\
-		}							\
+	switch (sizeof(*__pu_ptr)) {					\
+	case 1:								\
+		__put_user_asm(__pu_val, "stb", __pu_ptr, __pu_err);	\
+		break;							\
+	case 2:								\
+		__put_user_asm(__pu_val, "sth", __pu_ptr, __pu_err);	\
+		break;							\
+	case 4:								\
+		__put_user_asm(__pu_val, "stw", __pu_ptr, __pu_err);	\
+		break;							\
+	default:							\
+		/* XXX: This looks wrong... */				\
+		__pu_err = 0;						\
+		if (__copy_to_user(__pu_ptr, &(__pu_val),		\
+			sizeof(*__pu_ptr)))				\
+			__pu_err = -EFAULT;				\
+		break;							\
 	}								\
 	__pu_err;							\
 })
 
-#define __put_user(x, ptr) put_user(x, ptr)
+#define __put_user(x, ptr)						\
+({									\
+	__auto_type __pu_ptr = (ptr);					\
+	typeof(*__pu_ptr) __pu_val = (typeof(*__pu_ptr))(x);		\
+	__put_user_common(__pu_val, __pu_ptr);				\
+})
+
+#define put_user(x, ptr)						\
+({									\
+	__auto_type __pu_ptr = (ptr);					\
+	typeof(*__pu_ptr) __pu_val = (typeof(*__pu_ptr))(x);		\
+	access_ok(__pu_ptr, sizeof(*__pu_ptr)) ?			\
+		__put_user_common(__pu_val, __pu_ptr) :			\
+		-EFAULT;						\
+})
 
 #endif /* _ASM_NIOS2_UACCESS_H */
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
