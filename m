Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1545C98307
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Sep 2026 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boUPUsy7ZECMGqiQ355v+ofcH2XXYmrH2JdY4f+tCk4=; b=jAbEqVQ++92BVY
	rM0mxen+HVv//klT+0qC3lG0o7860pRntICfEWsK9ivWgVq8lIM2Cz2Of5xInCc7UHwO6lh8LU4nu
	0uo+g30r9pSnasscWRxHwP0P0qTiCzr/fYQiCgAQFajpqjyjuYbe8NUZ7Z7COjNIbGeAwCQtPCewi
	mwcSzllIgSuZ/5xQU44qKidWf94eH7vSRtOyhisLbCONP/rqqbN0M2ego5Du+8RyEFY3KY5RZy3of
	f9Z8NpXeKgzSYiBEkW7iyjpZVbLkkHG0ntUZKS0y54rnvvjbQjShV73PoFT7O3OrvORoivZjytvrV
	Jo+7pAnjPFpCEbZbHNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Pr-00000006Dw0-22FM;
	Tue, 22 Sep 2026 17:36:27 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Po-00000006DuK-0nDY
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Sep 2026 17:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098435; bh=4wVfAlEcovYJiLRAiW1UExN
	eq/b3xEK1OUjxcP/7QYQ=; b=hxyhNKhpHnG4LHB+IQytsfxPMEf6YigYhmBGZ6P1fc8JdTpofF
	6/G3CK5eZbESW1khN3Oxuk3tTVRtyjIbZxXm7V/HRQMWqDGh17DVaXZRIj+dplFovWqMFx6Qd/N
	HYEuhDiGM8wwpRWslxqJozCj/owYlqjVph49yfKRkBOvKGP/olaRr80OLt3TX6jlUFhNPfXQASk
	UQuRL00HYhzZ/jl7YWoEfFoMh0jYwokqxLaO14TRt4zS0R4tL5JIgaJwdbMzvfPphucuTBMnKFP
	jjNQE9iV8ZIxOPszyZmfCQkHSxGLynC1RjC3MsaMYSL/3LD5RIP4ZC1boH5HOoZSaVw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098435; bh=4wVfAlEcovYJiLRAiW1UExN
	eq/b3xEK1OUjxcP/7QYQ=; b=mIt3IqqSgxeINDfPOkt7tdWMzH4kExoyXkiMgmIYJl8N/S4dZ9
	2BgUIRlcxsvR2j6OPj3KfJzB0NPulRzvSkDg==;
From: Bradley Morgan <brads@mainlining.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH 5/5] xtensa: Emulate two-byte cmpxchg
Date: Tue, 22 Sep 2026 17:33:54 +0000
Message-ID: <20260922173354.14404-6-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922173354.14404-1-brads@mainlining.org>
References: <20260922173354.14404-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_103624_378749_03DEAC40 
X-CRM114-Status: GOOD (  10.07  )
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

Xtensa has no two-byte atomic compare and swap, so the __cmpxchg()
switch lets case 2 fall through to __cmpxchg_called_with_bad_pointer(),
which is declared but never defined, so a two-byte cmpxchg() fails at
link time. Route case 2 through the new cmpxchg_emu_u16(), which takes
the old and new values as unsigned long, so the (unsigned long) casts
on _o_ and _n_ move off the call and into _old_ and _new_ declarations
that type check the old and new arguments against *ptr through
(unsigned long)(0 ? *ptr : (o)), the idiom David Laight suggested,
so cmpxchg(&p, 4, 5) no longer compiles silently.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/xtensa/include/asm/cmpxchg.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index b6db4838b175..f6bed4221b43 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -76,6 +76,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 {
 	switch (size) {
 	case 1:  return cmpxchg_emu_u8(ptr, old, new);
+	case 2:  return cmpxchg_emu_u16(ptr, old, new);
 	case 4:  return __cmpxchg_u32(ptr, old, new);
 	default: __cmpxchg_called_with_bad_pointer();
 		 return old;
@@ -83,10 +84,10 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 }
 
 #define arch_cmpxchg(ptr,o,n)						      \
-	({ __typeof__(*(ptr)) _o_ = (o);				      \
-	   __typeof__(*(ptr)) _n_ = (n);				      \
-	   (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,	      \
-	   			        (unsigned long)_n_, sizeof (*(ptr))); \
+	({ unsigned long _old_ = (unsigned long)(0 ? *(ptr) : (o));	      \
+	unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));	      \
+	(__typeof__(*(ptr))) __cmpxchg((ptr), _old_,		      \
+				_new_, sizeof (*(ptr))); \
 	})
 
 #include <asm-generic/cmpxchg-local.h>
-- 
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
