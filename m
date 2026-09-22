Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A0BC98302
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Sep 2026 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwOpSN2gNulSZfSgV67THJIy7CCkFMoCcVWjoOdR1fI=; b=Ba8fLifx3cvyz6
	SBtROl0eyOkBYSo6K028zCC47PAfEmr8g+jvGaiaB/FVYp0DQrHjUJur0ikgYHHAoYr4XEzZHCrl6
	6O4jahBMUMjFGB3y8UwMFde29MVBwiVEofh45++oId3DyriSZUmxyARx/OET1Sss/eFKAUT30qyT0
	IL3Hpgejy6wC3zvPOgzY0q2jrL8dgaRFrMycNzTPb8WhyT8a4bfGEVBtG9QsDLPpq+cl0PpsKohdB
	rBNWkFPaAiVt4Z4BBl+m+abn84qsd1Btqi2ajLwRWEZneBSInuMfo4Rjs7mNKtmtEjEFW6jBriehE
	Z2Fcd6wSe+Lascxe4NlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Po-00000006Duw-1hQm;
	Tue, 22 Sep 2026 17:36:24 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Pm-00000006DtL-0Sb8
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Sep 2026 17:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098434; bh=e1GcMnqFLCYDoymp6RLJVeb
	pmtQeo9UYDw7sYBJUhCo=; b=RgdRjyEDbXNkMPQ8KeUZHOgR41025YtvXpBr9YubcWfvfFrTkH
	WsjQGi5iKF0/Q7SxfbLq32+CVgwtchQ06SJ5gzIcpi3WGrBxvO4s7NUL6vMe+4bJHUqRhxoD10/
	67IJY2fFgPoeyXd+/kWcUxSXjv/IgzHlouVSWVrT1b3BW0UFuKz9A1hVjASVqQVX0V/Qvbd0fH8
	vHRo8tBFCz/m8QLnTFlKT9PwzfrH5lMW1uOW2QIl5C5/zUZBuVD/2HZxGFpv6GNPma2OJu/CpKj
	7q8LI2RexEJBTUq92MqDBL7Vr+uaH85fX/bcVlapDaVsVUx7mXpsTMIIheGpxXR1AhQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098434; bh=e1GcMnqFLCYDoymp6RLJVeb
	pmtQeo9UYDw7sYBJUhCo=; b=54xM5N6KOQWLgmVo6u80leBEDQVMX+gYb8ekcXt6NwZL2Szwo1
	LHYwY7CewossBjldsNDBthMIOpoIFgYd7dDg==;
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
Subject: [PATCH 2/5] ARC: Emulate two-byte cmpxchg
Date: Tue, 22 Sep 2026 17:33:51 +0000
Message-ID: <20260922173354.14404-3-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922173354.14404-1-brads@mainlining.org>
References: <20260922173354.14404-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_103622_306590_72D53680 
X-CRM114-Status: GOOD (  11.39  )
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

ARC has no two-byte atomic compare and swap, so the arch_cmpxchg_relaxed()
macro switch lets case 2 fall through to BUILD_BUG() via default. Route case
2 through the new cmpxchg_emu_u16(), which takes the old and new
values as unsigned long and narrows them itself, so the (uintptr_t)
casts on _o_ and _n_ are no longer needed and the case 2 call passes
them straight.

The switch also now tests sizeof(*(_p_)) instead of sizeof((_p_)),
which switched on the pointer and made the size 1 and size 2 cases
dead code, routing every sub-word cmpxchg() through the 32-bit
llock/scond pair and comparing whole words against sub-word values,
so the compare almost never succeeded. The old and new values are
now declared as unsigned long through (unsigned long)(0 ? *(_p_) :
(old)), the idiom David Laight suggested, which type checks the
arguments against the pointee, so cmpxchg(&p, 4, 5) no longer
compiles silently.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/arc/include/asm/cmpxchg.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 76f43db0890f..4596edfefa95 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -42,16 +42,19 @@
 #define arch_cmpxchg_relaxed(ptr, old, new)				\
 ({									\
 	__typeof__(ptr) _p_ = (ptr);					\
-	__typeof__(*(ptr)) _o_ = (old);					\
-	__typeof__(*(ptr)) _n_ = (new);					\
+	unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
+	unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
 	__typeof__(*(ptr)) _prev_;					\
 									\
-	switch(sizeof((_p_))) {						\
+	switch (sizeof(*(_p_))) {						\
 	case 1:								\
-		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, _old_, _new_);	\
+		break;							\
+	case 2:								\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, _old_, _new_);	\
 		break;							\
 	case 4:								\
-		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
+		_prev_ = (__typeof__(*(ptr)))__cmpxchg(_p_, _old_, _new_);			\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -64,8 +67,8 @@
 #define arch_cmpxchg(ptr, old, new)				        \
 ({									\
 	volatile __typeof__(ptr) _p_ = (ptr);				\
-	__typeof__(*(ptr)) _o_ = (old);					\
-	__typeof__(*(ptr)) _n_ = (new);					\
+	unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
+	unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
 	__typeof__(*(ptr)) _prev_;					\
 	unsigned long __flags;						\
 									\
@@ -102,7 +105,7 @@
 	__typeof__(ptr) _p_ = (ptr);					\
 	__typeof__(*(ptr)) _val_ = (val);				\
 									\
-	switch(sizeof(*(_p_))) {					\
+	switch (sizeof(*(_p_))) {					\
 	case 4:								\
 		_val_ = __arch_xchg(_p_, _val_);			\
 		break;							\
-- 
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
