Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADA8C3DA7F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Aug 2024 19:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27c79N3ry28a672l1TAuZR57OdSQLXid7rQ0KLuhbl0=; b=3zpbizqPrsoqfM
	MN2KYUD2cxUN1Pa1m2KQP8G2gLDFUgxGZJ1rkOZ3R7OwcQqOPJfKghnkzOkNHsLGZWBGFOuiYDO8u
	WLKohaVrLmzVdbgToucJ0vjwZ+zzkg2m9TKVGQrKoibJnh8wYgW5G1FiAECEPiQG3gGO19TlTMfdv
	LwYUv26J0X9o66tpuP/C7KwsAdPskmWbrRWXVe+7EecgTXLaQ7LmkY8O5Y1CPFK3naop/ROOR6WVE
	VXxs5z4BnULG5fuzdvOqFzui6CanYmVa6obClL1PGagDGuStHWlUP2uTrXpFROIWYRNv1Bybq43Vj
	FaCBjSsqeTWhN8bl3pTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3Gp-0000000GzSc-19t2;
	Mon, 05 Aug 2024 19:21:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3Gm-0000000GzQM-0I9Z
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Aug 2024 19:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59BF5CE009F;
	Mon,  5 Aug 2024 19:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C592C32782;
	Mon,  5 Aug 2024 19:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722885681;
	bh=SsfSYlvMJfbrFJhxWSLRoEWcjcncMnxVxwE9E1US2+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZairQtTnGfrM8IsiBq71qJecW1kAYKoiw1mpOCVFzhcp0z+L0X8x1VjPgRNexVi6f
	 8dNooCLXYg89HV1K9eqYdLHzBidYZwlAOEMNXFkTC7Op4DmGfpDSo5sQPUiEdQif2B
	 oU0qTkenvvqwDkugiHSAdwpzafTmDvT1HKSZxk6Lc9+HOKS2LHmemDLh5aDTX6CbHL
	 z2xTQm1U4txlS4aUH4Y8lBM3vLIpPNptvjafVM+s2ZBPqHl40cnEeKxs9r8ECBnY9F
	 io31MjG/bZkCIt5+AXzgPRQvDlRAO8FsgyPApEDpo/2ET85G4DdXtKSkw08a4OlzIx
	 s0Mj/Zrfo14tQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 49204CE0A6F; Mon,  5 Aug 2024 12:21:21 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: elver@google.com,
	akpm@linux-foundation.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	torvalds@linux-foundation.org,
	arnd@arndb.de,
	geert@linux-m68k.org,
	palmer@rivosinc.com,
	mhiramat@kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Yujie Liu <yujie.liu@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH cmpxchg 1/3] xtensa: Emulate one-byte cmpxchg
Date: Mon,  5 Aug 2024 12:21:17 -0700
Message-Id: <20240805192119.56816-1-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <c1b7f3a2-da50-4dfb-af6f-a1898eaf2b79@paulmck-laptop>
References: <c1b7f3a2-da50-4dfb-af6f-a1898eaf2b79@paulmck-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_122124_308986_DDD39A34 
X-CRM114-Status: GOOD (  11.70  )
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

Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on xtensa.

[ paulmck: Apply kernel test robot feedback. ]
[ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
[ Apply Geert Uytterhoeven feedback. ]

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Tested-by: Yujie Liu <yujie.liu@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
---
 arch/xtensa/Kconfig               | 1 +
 arch/xtensa/include/asm/cmpxchg.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index f200a4ec044e6..d3db28f2f8110 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -14,6 +14,7 @@ config XTENSA
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
 	select ARCH_HAS_STRNCPY_FROM_USER if !KASAN
 	select ARCH_HAS_STRNLEN_USER
+	select ARCH_NEED_CMPXCHG_1_EMU
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index 675a11ea8de76..95e33a913962d 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -15,6 +15,7 @@
 
 #include <linux/bits.h>
 #include <linux/stringify.h>
+#include <linux/cmpxchg-emu.h>
 
 /*
  * cmpxchg
@@ -74,6 +75,7 @@ static __inline__ unsigned long
 __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 {
 	switch (size) {
+	case 1:  return cmpxchg_emu_u8(ptr, old, new);
 	case 4:  return __cmpxchg_u32(ptr, old, new);
 	default: __cmpxchg_called_with_bad_pointer();
 		 return old;
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
