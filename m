Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45B2C982C9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2026 20:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPqIGnqXor/pyMFbvdu9267bf1kzWqqvw1nSffzLiKI=; b=lBpSbiTbqPqzTs
	ubOqrc4d8uOR1ZudK0xehvphJ1VJgqslRydSTYS59Fr3Ne30gZxW+RfIY1pHQOhjo2677ZrmNm0ez
	MonsZEVO27LpoSvjSai/qpl1PgrCKvGxfDYL7UczVBIAtqQO1gSgZrkVHt29Wx+TDjCiGoAifzBHx
	BgzdDYA976JaFf6qZtuBbcaFGbRndcNkr5IlgOmdOMAK55b8piR9NEpL1gG6laaGIPATIZhU7TENv
	TjDy7bukNb/CqWRcGsqI9R/f3kTzA+sjRxws95lM9OGoY/jndWiXYQQQ/Jy1/vweX4l0USXl1trtf
	cnz/srPFd0ZXV4vq1h+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vq9-0000000A4Cy-1FWk;
	Wed, 16 Sep 2026 20:02:45 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vq5-0000000A4CS-2eth
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Sep 2026 20:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789588935; bh=bk9a2sZlBh+9sgTTR/422Om
	IP2fbvRL5lRZQb9brs4o=; b=J5uzYWVo7LQtFPeY6m2AI6v4sHFlb+ZTkoSDlXYPGYtHWFcLHm
	DsVac8sF15Uxj3D7omudGeiD4mbn67jPJLKLRXnWKGvuDXI6kyCzf2z94W632dIMhByXOJWvVVe
	AdZQ0GMEvykUA+EEb1ejhnufDic3Bw4gcHrGOp4gg8PD5wYDyK6QjzgdJVWDCwTaHmFurmtHuji
	u93yzz2WjlJxeiqZWBpvRtw8wVQndPZkzDw2pY/DRe1uLJyums6S8beOJsQcc8uk8kge+Y8jADC
	8j4GbXqkbEzXenlEFJlwK9wsXH91mkTtTe9hQWkVD9/dPzoWM2WR5F7bilW7WrVw1tg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789588935; bh=bk9a2sZlBh+9sgTTR/422Om
	IP2fbvRL5lRZQb9brs4o=; b=pUfIpFDUZhhLSGE5we0cUGPeAfTc0D/RPS5cHNQxuWnUR+4aWf
	hndgdIK7DT/YSNE0TLHEHVd4Mb4SNPlVDaAQ==;
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
Subject: [PATCH v2 3/5] csky: Emulate two-byte cmpxchg
Date: Wed, 16 Sep 2026 20:02:13 +0000
Message-ID: <20260916200215.21774-4-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916200215.21774-1-brads@mainlining.org>
References: <20260916200215.21774-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_130241_836656_1F5FE523 
X-CRM114-Status: UNSURE (   8.43  )
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

CSKY has no two-byte atomic compare and swap, so the __cmpxchg()
switches in cmpxchg.h let case 2 fall through to the undefined
__cmpxchg_called_with_bad_pointer(), failing at link time. Route case
2 through the new cmpxchg_emu_u16(), which now takes natural u16
arguments, so the (uintptr_t) casts on __old and __new become (u16)
casts in all three switch instances.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/csky/include/asm/cmpxchg.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
index db6dda47184e..e53628268e8c 100644
--- a/arch/csky/include/asm/cmpxchg.h
+++ b/arch/csky/include/asm/cmpxchg.h
@@ -65,6 +65,9 @@
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 		break;						\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
+		break;						\
 	case 4:							\
 		asm volatile (					\
 		"1:	ldex.w		%0, (%3) \n"		\
@@ -98,6 +101,9 @@
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 		break;						\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
+		break;						\
 	case 4:							\
 		asm volatile (					\
 		"1:	ldex.w		%0, (%3) \n"		\
@@ -132,6 +138,9 @@
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 		break;						\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
+		break;						\
 	case 4:							\
 		asm volatile (					\
 		RELEASE_FENCE					\
-- 
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
