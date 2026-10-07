Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E52ECA600B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2026 20:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDeHnlOkkTCOlvZNgAjZMzrMF1PIOwQkDDh0zNi8IMo=; b=IacXXhvfr/Wiow
	ZfzbltGm7ytokvazxADTTm6b0vGkndFdgXVMVCXBRu7Rtj2ZLcA01KmvimRroMyFdj7FMQvfj8DWG
	c8GPUK7cSC4IkZYNtyp5B1G/VBsf8wcJit8iXLMPmg+AQJpDMawbxKQI73366dWaQBF/NBIbPCKr2
	v4MbBpexs9jEweyEuC6nC8iSD7TMWYlmnAtpchXxqd2zsWeZmH9V/eXhd5UehMSm6/OBBgfJxTVBA
	NXeXm4891M/gKv9jGqu8KoBiT5YLRbRkfQSea5FeW61y1TVuMOsO7yGcrUmAvF/VOttc5cKsK0IOS
	6zcYDHcaOxU8viZUl2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYNT-000000038pl-12tP;
	Wed, 07 Oct 2026 20:36:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYNS-000000038p8-09vo
	for linux-snps-arc@lists.infradead.org;
	Wed, 07 Oct 2026 20:36:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C73374401C;
	Wed,  7 Oct 2026 20:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FB01F000FF;
	Wed,  7 Oct 2026 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405397;
	bh=VbdLi+EDmLcgVFxgUSeMxfNMSzbYFZbpIXpV4Hl7qmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KroFTypSGnohwcGpN+KRwC1ZmI67dspXTn/09hNxvGg/caOOURUEeKoe4Rz7LjmKu
	 rbIhUtUNwgPOPBYz2U5J9fVQxM5NT+9aaWxZpHdhAFhTwCOoCZVvPEhLldTambQlar
	 h9JJX0Ci3ftL/qKrNmwb6m4oFMqcjb4m1wrRwYun0VHdmakXrmdcybw9upgWvlgi98
	 FspS3n+Y89lbAdxeilhTCCxo7jL2dTn6DyoRRrPioa/ZRxYZy+gNS4DMSoN5PNfjgh
	 JOkE53rVCIrZeYI3lq8ARmBCqAXgToJ1EVWa5eTzpe8n7kXdMTGuha0nV+4Byq/2ID
	 TdV/LlbXH0nJQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5FF5ACE0D79; Wed,  7 Oct 2026 13:36:37 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Bradley Morgan <brads@mainlining.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org,
	kernel-team@meta.com,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH 1/5] lib: Add two-byte cmpxchg emulation function
Date: Wed,  7 Oct 2026 13:36:32 -0700
Message-Id: <20261007203636.1982188-1-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
References: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
MIME-Version: 1.0
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

From: Bradley Morgan <brads@mainlining.org>

cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
cmpxchg() for the architectures lacking native one-byte atomics.
The same architectures also lack native two-byte cmpxchg(), where
such an operation is not supported and either fails to compile via
BUILD_BUG() or fails to link, because the bad pointer sentinels
these architectures declare are never defined.

Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
word with READ_ONCE(), splices the two target bytes through a union
and loops on cmpxchg() of the full word until the compare succeeds.
Like cmpxchg_emu_u8() it is fully ordered.

Unlike cmpxchg_emu_u8() it casts the old and new values to u16
internally and returns unsigned long, taking the old and new values
as unsigned long, per the suggestion from David Laight. The switch
statements in the architecture macros instantiate every size case,
so a cmpxchg() on a pointer type checks the two-byte case as well,
and a u16 parameter or return would make the macro casts and return
conversions warn there. With unsigned long parameters and return the
call sites need no narrowing casts, pointer exchanges compile warning
free, and the function still compares and returns exactly the 16 bits
the caller asked for, which matches the hardware cmpxchg r16
behaviour where a 16-bit compare only looks at the low 16 bits of
the register.

cmpxchg_emu_u8() keeps returning the old value unmasked, so a caller
that passes a wider old than 8 bits still gets it back as passed,
matching the behaviour the one-byte emulator always had.

The Kconfig symbol gating this file is renamed from
ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
selects both the one-byte and the two-byte emulation.

[ paulmck: Apply kernel test robot feedback. ]

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Bradley Morgan <brads@mainlining.org>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>
---
 include/linux/cmpxchg-emu.h |  4 +++-
 lib/cmpxchg-emu.c           | 38 +++++++++++++++++++++++++++++++++----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/include/linux/cmpxchg-emu.h b/include/linux/cmpxchg-emu.h
index 998deec67740a..2db70f1e39253 100644
--- a/include/linux/cmpxchg-emu.h
+++ b/include/linux/cmpxchg-emu.h
@@ -4,12 +4,14 @@
  * lacking direct support for these sizes.  These are implemented in terms
  * of 4-byte cmpxchg operations.
  *
- * Copyright (C) 2024 Paul E. McKenney.
+ * Copyright (C) 2024 Paul E. McKenney <paulmck@kernel.org>
+ * Copyright (C) 2026 Bradley Morgan <brads@mainlining.org>
  */
 
 #ifndef __LINUX_CMPXCHG_EMU_H
 #define __LINUX_CMPXCHG_EMU_H
 
 uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
+unsigned long cmpxchg_emu_u16(volatile u16 *p, unsigned long old, unsigned long new);
 
 #endif /* __LINUX_CMPXCHG_EMU_H */
diff --git a/lib/cmpxchg-emu.c b/lib/cmpxchg-emu.c
index 27f6f97cb60dd..25c69224a7597 100644
--- a/lib/cmpxchg-emu.c
+++ b/lib/cmpxchg-emu.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Emulated 1-byte cmpxchg operation for architectures lacking direct
- * support for this size.  This is implemented in terms of 4-byte cmpxchg
- * operations.
+ * Emulated 1-byte and 2-byte cmpxchg operations for architectures lacking
+ * direct support for these sizes.  These are implemented in terms of
+ * 4-byte cmpxchg operations.
  *
- * Copyright (C) 2024 Paul E. McKenney.
+ * Copyright (C) 2024 Paul E. McKenney <paulmck@kernel.org>
+ * Copyright (C) 2026 Bradley Morgan <brads@mainlining.org>
  */
 
 #include <linux/types.h>
@@ -43,3 +44,32 @@ uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new)
 	return old;
 }
 EXPORT_SYMBOL_GPL(cmpxchg_emu_u8);
+
+union u16_32 {
+	u16 h[2];
+	u32 w;
+};
+
+/* Emulate two-byte cmpxchg() in terms of 4-byte cmpxchg. */
+unsigned long cmpxchg_emu_u16(volatile u16 *p, unsigned long old, unsigned long new)
+{
+	u32 *p32 = (u32 *)(((uintptr_t)p) & ~0x3);
+	int i = (((uintptr_t)p) & 0x2) / 2;
+	union u16_32 old32;
+	union u16_32 new32;
+	u32 ret;
+
+	WARN_ON_ONCE(((uintptr_t)p) & 0x1);
+	ret = READ_ONCE(*p32);
+	do {
+		old32.w = ret;
+		if (old32.h[i] != (u16)old)
+			return (unsigned long)old32.h[i];
+		new32.w = old32.w;
+		new32.h[i] = (u16)new;
+		instrument_atomic_read_write(p, 2);
+		ret = data_race(cmpxchg(p32, old32.w, new32.w)); // Overridden above.
+	} while (ret != old32.w);
+	return (u16)old;
+}
+EXPORT_SYMBOL_GPL(cmpxchg_emu_u16);
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
