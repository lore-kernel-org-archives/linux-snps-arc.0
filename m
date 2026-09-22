Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B6BC98302
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Sep 2026 17:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ly1mBS7p7gwebv64g3zDRoCjZueNwupCxIHcKEBGQhc=; b=URXbDLz9iKcH7m
	/jPfqZoaO1fAWt4BsD2EjOKMW65KVobc03XkBYARwKeJvEugdXkMGa2/XJu4ZtRB8WMLIqHPGLcD1
	dneBGcOr5Ss72L6Rl5qTdz1Ukfj8alTAGQtLlm0NNGBMViykDhLOhz9sVBvV8pEMgbOqOHbzh0ade
	dZe90MLQL0fA9VN8JVv9uUUF37QGrcHFoA5PmjhXD9VXihccaLkeq6hr4UuY4bf5RJsAMMba9a/R9
	HUf/zrPEYUgebjBOVOWlGvMgzrZWKY/LmubUWKcXu8lPND/KNKkBKy4V/1Ga7DmIpl+Y7k04Zq+Wg
	CyfP6WRW3n62r/Aa6B3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Pi-00000006Dsl-1CSZ;
	Tue, 22 Sep 2026 17:36:18 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Pg-00000006DsL-0KoJ
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Sep 2026 17:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098435; bh=wl+BtXFs/QJChJ/sOKgC86/
	HKj3R5tfPpUhFH8oo0uc=; b=A5/0/GOUc+WvYs825/8ouOL1uBIBkqo06ZEzHpL/pV7+uEtN+b
	Q06RZe/uHEgOY77Uzlh5dL9QmnGwW+2nv5v1qBCVhyXNv4T8Uqdv2Yfcc8ENtyEoImQM/c7WOV8
	YCs2e5QkHGlXhMJ+H5KckshFL2DoJqgx/era/7X5JIkCE0YBZeMvl+Q038j/sHyXO00VCzyFPGm
	kc2VoX6bR2Tw+Kt1LeLRBtpqbrdpVvVDQOuAsb8j2YgHfW4NrjXkxLnF+rgsXf3dHDeuCOwIYmb
	gNlbihmQLhGtzbM0wf1poT0eIdtdfFePxhoQW+obXpIAfDOsR7EGFDT9B2A5+J/SlVg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098435; bh=wl+BtXFs/QJChJ/sOKgC86/
	HKj3R5tfPpUhFH8oo0uc=; b=NTp5knoEnFR7JN5OFPhBFH1QY9WSnU+vHpvP8lpWk2ed+OsGcb
	0/J3nRC2j+Rb5PnC8PsP8xBvuryNvrIOpqBQ==;
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
Subject: [PATCH 4/5] csky: Emulate two-byte cmpxchg
Date: Tue, 22 Sep 2026 17:33:53 +0000
Message-ID: <20260922173354.14404-5-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922173354.14404-1-brads@mainlining.org>
References: <20260922173354.14404-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_103616_269817_2AA305F7 
X-CRM114-Status: UNSURE (   9.89  )
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

C-SKY has no two-byte atomic compare and swap, so the __cmpxchg()
macros let case 2 fall through to BUILD_BUG() via default. Route case
2 through the new cmpxchg_emu_u16(), which takes the old and new
values as unsigned long, so the (uintptr_t) casts on __old and __new
are no longer needed and the case 2 call passes them straight. The
old and new values are declared as unsigned long through
(unsigned long)(0 ? *(ptr) : (old)), the idiom David Laight
suggested, which type checks the arguments against the pointee, so
cmpxchg(&p, 4, 5) no longer compiles silently.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/csky/include/asm/cmpxchg.h | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
index db6dda47184e..29dc56e4b7f1 100644
--- a/arch/csky/include/asm/cmpxchg.h
+++ b/arch/csky/include/asm/cmpxchg.h
@@ -57,13 +57,16 @@
 #define __cmpxchg_relaxed(ptr, old, new, size)			\
 ({								\
 	__typeof__(ptr) __ptr = (ptr);				\
-	__typeof__(new) __new = (new);				\
-	__typeof__(new) __tmp;					\
-	__typeof__(old) __old = (old);				\
+	unsigned long __old = (unsigned long)(0 ? *(ptr) : (old));	\
+	unsigned long __new = (unsigned long)(0 ? *(ptr) : (new));	\
+	unsigned long __tmp;					\
 	__typeof__(*(ptr)) __ret;				\
 	switch (size) {						\
 	case 1:							\
-		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		break;						\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
@@ -90,13 +93,16 @@
 #define __cmpxchg_acquire(ptr, old, new, size)			\
 ({								\
 	__typeof__(ptr) __ptr = (ptr);				\
-	__typeof__(new) __new = (new);				\
-	__typeof__(new) __tmp;					\
-	__typeof__(old) __old = (old);				\
+	unsigned long __old = (unsigned long)(0 ? *(ptr) : (old));	\
+	unsigned long __new = (unsigned long)(0 ? *(ptr) : (new));	\
+	unsigned long __tmp;					\
 	__typeof__(*(ptr)) __ret;				\
 	switch (size) {						\
 	case 1:							\
-		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		break;						\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
@@ -124,13 +130,16 @@
 #define __cmpxchg(ptr, old, new, size)				\
 ({								\
 	__typeof__(ptr) __ptr = (ptr);				\
-	__typeof__(new) __new = (new);				\
-	__typeof__(new) __tmp;					\
-	__typeof__(old) __old = (old);				\
+	unsigned long __old = (unsigned long)(0 ? *(ptr) : (old));	\
+	unsigned long __new = (unsigned long)(0 ? *(ptr) : (new));	\
+	unsigned long __tmp;					\
 	__typeof__(*(ptr)) __ret;				\
 	switch (size) {						\
 	case 1:							\
-		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		break;						\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
-- 
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
