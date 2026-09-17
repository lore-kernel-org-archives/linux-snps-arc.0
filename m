Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EDDC88E72
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Sep 2026 16:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RY9CRvu7eiC/viLIttW9WQqjblzr0zKvVZNYohCJgzw=; b=LLcp/d/WupOpPW
	cmEdmXYgX/IsxpoVQWtsrjxwPx90yshaHjSgeewOXgPMjl1iv4H6fRH+cOLLVVfjXXgNweZcy+Vb6
	09k8SZ9A0aGogDo3CvzLysxrYdpVM/CUvLH8tpHZC35+DdK+QDxLyM+PjwQtaM21BHB1cxgZtPKSw
	rs6E+PjwS2WSQdhCbW27G3IMLsrywKuqqBtqmBjqJzqRk8WrlrqazshbkYk1rIobJwUm3OWCE/n4S
	2Ze6ufbBc/Dia1ki+l1jEAkUkfT4vXyzd9Bs5ovkziVT1/8tXayF0TPWYux62pH+7SA1y4aHnzo8m
	qPi8b9gialyYia72QiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FAR-0000000BxTZ-1VWo;
	Thu, 17 Sep 2026 16:40:59 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FAN-0000000BxQH-1kEw
	for linux-snps-arc@lists.infradead.org;
	Thu, 17 Sep 2026 16:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789663111; bh=gF0jpOzqVIhOvYSoNgdvd4z
	PpHZVOqEDRyAYG3KMg0M=; b=YTDbLKwMGcQTYm5dxY3iKNEBtq5PZYfPplCnBNArkKE9tM2Zz/
	eu0hGtCPX/qsIDEUpNe8nt4G/I4+qgrRuNu+McSLl6zKJMldhvE96d1mjoPQh3y5tNVgmqY/9t3
	eZQO5dUgjPoXBcHFiuuFtvcAnt2gwzwhDspUmcltwll5RVMTRsENWLQkDWZyxbt8Lk7YPRf3hh2
	iPLD+UyvG7kmcQb6W3Cytg+q4b0y1i4qwne+cS7AVS+7n72nbPFCe/4UckhR2ozTMVo2YMsNL8G
	uaDIWKGcjWM1b2QrFKX6p2Ebu9KYCS8TB47+v++JA8rGv0Rd9i1+88LM6pACdnY9CoA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789663111; bh=gF0jpOzqVIhOvYSoNgdvd4z
	PpHZVOqEDRyAYG3KMg0M=; b=vOxLdiXeRsfXKHFjjuEd8N46x17rPZMf9Y7yTn2qUgVQuicb97
	nSPzupPG62E/fI1TAHC6dAzXDxySnyWkQGAw==;
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
Subject: [PATCH v3 3/5] csky: Emulate two-byte cmpxchg
Date: Thu, 17 Sep 2026 16:38:28 +0000
Message-ID: <20260917163830.3748-4-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917163830.3748-1-brads@mainlining.org>
References: <20260917163830.3748-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_094055_612667_7D9129B5 
X-CRM114-Status: GOOD (  10.67  )
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

CSKY has no two-byte atomic compare and swap, so the __cmpxchg()
switches in cmpxchg.h let case 2 fall through to the undefined
__cmpxchg_called_with_bad_pointer(), failing at link time. Route case
2 through the new cmpxchg_emu_u16(), which takes the old and new
values as unsigned long and narrows them itself, so the (uintptr_t)
casts on __old and __new come off in all three switch instances.
The (u16) casts are gone for the same reason.

The __old and __new declarations were typed __typeof__(old) and
__typeof__(new), which skips the pointer-integer type check, so
cmpxchg(&p, 4, 5) compiled silently. Typing them through
(unsigned long)(0 ? *(ptr) : (old)) keeps the value conversion while
making the compiler reject mismatched types, the idiom David
Laight suggested. The same check is added for new.

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
