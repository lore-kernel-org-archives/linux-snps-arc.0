Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40E4C982FA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Sep 2026 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qyA8y1X/jw4Lf+OkE2z5XXcJcUYbjLIXey1Kmgo/ZSo=; b=MTarutHC23HDTh
	lhvGxuQrmv952EyJf8/Vt/s3FTUWlCcpbeYSdfhuOS8vAMxl4GOufMe3/Lp5e3yf0snsczgsntbJz
	lTHOWf4frkkLuc1/9KfQprJIOApau/ujBLovU9Mo51ZSHow4kdniovptaUo5tn4bwRXm5sm5PFPCF
	V0ypwaPiiQOaE41trWrPY+2Tu9x9mEuZC2efHYPcVkSjJkwWtvL0DEcO9Bbj3ji3yNfn5phYiQVOj
	AcysoofmEjmTRaxjbr5oLJBh/4MW5cLeu13R1NwUK2r3x66ESCJq6j5D7jPMACiBfAJF0+rm08Hl2
	KTrvU9tVCDEHK8C1yOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Pu-00000006DxP-2Dft;
	Tue, 22 Sep 2026 17:36:30 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Pr-00000006Dvg-35bD
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Sep 2026 17:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098434; bh=ghYvDCJ6wWgl/DWKvRlZLjc
	r4JmsCO6Diem7VtlYvoo=; b=bZ38dyWMgd/G/6OMhHggQwAi2Id4aT8IYufucK56A4wyGw4Iuj
	z2W5xwZGeASaGF/HHJf8ssq8z4PoylGq2B1t7R6ut/d8M3Ij2LG7BjwOviGy/uB0NVYDwscv1JD
	7kPkG1IQ6VVkHrlLt2lYDSGuvhjweGzQg3VXOPDtMA2RsQ6UWzausKwtTWqfJRhvMcA8RRPQNtO
	HTqLo1bFm7LJUzrUzxCrKuZJYb59yJZr/yDqMsOFU2kNCNhtPy0g0jAdHqhHquweKOujEeL+pJ4
	vuncC6fMYzfNZrwUChfQxtVt+ggSqaj/oGkEp0xUGYy7/Zp9Vf17BnKlLL2u3mAWDOQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098434; bh=ghYvDCJ6wWgl/DWKvRlZLjc
	r4JmsCO6Diem7VtlYvoo=; b=jnZiJ1QjwuyC2NRhs59khGUE4Z66oJnKO75veJ4E/0hcaljPvm
	ulv9bbDDiHprbgM5vKUmZm0jYzB24CcBNCDg==;
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
Subject: [PATCH 3/5] sh: Emulate two-byte cmpxchg
Date: Tue, 22 Sep 2026 17:33:52 +0000
Message-ID: <20260922173354.14404-4-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922173354.14404-1-brads@mainlining.org>
References: <20260922173354.14404-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_103627_927299_E9FDC714 
X-CRM114-Status: GOOD (  10.91  )
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

SH has no byte or halfword atomic memory operations, so the __cmpxchg()
switch routes case 1 through cmpxchg_emu_u8() and lets case 2 fall
through to __cmpxchg_called_with_bad_pointer(), which is declared but
never defined, so a two-byte cmpxchg() fails at link time. Route case
2 through the new cmpxchg_emu_u16(), which takes the old and new
values as unsigned long, so the (unsigned long) casts move off the
call and into _old_ and _new_ declarations that type check the old
and new arguments against *ptr through (unsigned long)(0 ? *ptr : _o_),
the idiom David Laight suggested, so cmpxchg(&p, 4, 5) no longer
compiles silently.

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/sh/include/asm/cmpxchg.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
index 1e5dc5ccf7bf..b87f59107b4e 100644
--- a/arch/sh/include/asm/cmpxchg.h
+++ b/arch/sh/include/asm/cmpxchg.h
@@ -59,6 +59,8 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
 	switch (size) {
 	case 1:
 		return cmpxchg_emu_u8(ptr, old, new);
+	case 2:
+		return cmpxchg_emu_u16(ptr, old, new);
 	case 4:
 		return __cmpxchg_u32(ptr, old, new);
 	}
@@ -70,8 +72,10 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
   ({									 \
      __typeof__(*(ptr)) _o_ = (o);					 \
      __typeof__(*(ptr)) _n_ = (n);					 \
-     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
-				    (unsigned long)_n_, sizeof(*(ptr))); \
+     unsigned long _old_ = (unsigned long)(0 ? *ptr : _o_);	 \
+     unsigned long _new_ = (unsigned long)(0 ? *ptr : _n_);	 \
+     (__typeof__(*(ptr))) __cmpxchg((ptr), _old_,				 \
+				    _new_, sizeof(*(ptr)));	 \
   })
 
 #include <asm-generic/cmpxchg-local.h>
-- 
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
