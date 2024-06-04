Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF24AC25B78
	for <linux-snps-arc@archiver.kernel.org>; Tue,  4 Jun 2024 17:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuBVUA8LYJWdd0rtlJClLDgJMPRw4Zr2D81pmTblG/0=; b=vU5Buo6ZBp9G9P
	tFqtYsA7ijDNUvvbSLjmcxqWTUlXVeJNhUclOzsD4nak85ESXiv3yXyxW3LP7d4W0KbYUpucojBh6
	NOATPDY9w05QKR9xT1mHyAkVi6FzEhtIq+zUEQW9kBbJOkQOL7SXPIo8nMmBbX7/OdF0R4XZLoOH8
	VK+snKwNUfyyg8jMFyhNXsI0L0/AFOMQA3nsET2V3cj54DGFBSEAvHI9JCURqqBYlo0c6aiOAZsgg
	HQym8x7sfactBrJ148w8pe1OxYF2VCKRoSH+0OMu/pVVC/SDgV34i5gYhKJNJWILWwwbsKRXXyt1a
	mAS0X7hW7lLJCI6tygMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXaX-00000003EX0-1rct;
	Tue, 04 Jun 2024 17:04:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXaU-00000003EUh-1esM
	for linux-snps-arc@lists.infradead.org;
	Tue, 04 Jun 2024 17:04:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C2A661363;
	Tue,  4 Jun 2024 17:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C318C2BBFC;
	Tue,  4 Jun 2024 17:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717520681;
	bh=m6rqAOBQ64nAVbwfoMwra9NFlfK4T5G41qjNyF62BxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HNF05O/z83KdgySpuamBtdJNQPd+6KMd8DXn+woZXtYeUdCI1eSQfGWa6KtuuXFmR
	 MteA50UrqjFRjOjHRs/udBUOaJWKJe0HyRtAwUJgDy8V6V7k/GVcnEjUbX2MMmS/mK
	 P+lpopMYf4HzqNyqG1TKE6SyW1bm1zrwdUPGYZSPh9/ueugXY2d3O8MQphL6kohvDp
	 Qodja9iSGJwXRX+ySo0tt7Q1/2EOIm8z+DEO7fEMgFbUSH52SBB47s0hmw7B/Gk84Q
	 zzGFnjfhHlwGcq1Pny93N1jAVngBGUrVq4eXMBrbCCMihe9FGaegY6MEzlXhVHxyis
	 prjhj0VWrTClA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id F3F2DCE3F09; Tue,  4 Jun 2024 10:04:40 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	elver@google.com,
	akpm@linux-foundation.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	dianders@chromium.org,
	pmladek@suse.com,
	torvalds@linux-foundation.org,
	arnd@arndb.de,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v3 cmpxchg 1/4] ARC: Emulate one-byte cmpxchg
Date: Tue,  4 Jun 2024 10:04:34 -0700
Message-Id: <20240604170437.2362545-1-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1dee481f-d584-41d6-a5f1-d84375be5fe8@paulmck-laptop>
References: <1dee481f-d584-41d6-a5f1-d84375be5fe8@paulmck-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_100442_554953_8816BF36 
X-CRM114-Status: GOOD (  12.98  )
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

Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on arc.

[ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
[ paulmck: Apply feedback from Naresh Kamboju. ]
[ paulmck: Apply kernel test robot feedback. ]

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: <linux-snps-arc@lists.infradead.org>
---
 arch/arc/Kconfig               |  1 +
 arch/arc/include/asm/cmpxchg.h | 33 ++++++++++++++++++++++++---------
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index fd0b0a0d4686a..163608fd49d18 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -13,6 +13,7 @@ config ARC
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_NEED_CMPXCHG_1_EMU
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select ARCH_32BIT_OFF_T
 	select BUILDTIME_TABLE_SORT
diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index e138fde067dea..2102ce076f28b 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -8,6 +8,7 @@
 
 #include <linux/build_bug.h>
 #include <linux/types.h>
+#include <linux/cmpxchg-emu.h>
 
 #include <asm/barrier.h>
 #include <asm/smp.h>
@@ -46,6 +47,9 @@
 	__typeof__(*(ptr)) _prev_;					\
 									\
 	switch(sizeof((_p_))) {						\
+	case 1:								\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
+		break;							\
 	case 4:								\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
 		break;							\
@@ -65,16 +69,27 @@
 	__typeof__(*(ptr)) _prev_;					\
 	unsigned long __flags;						\
 									\
-	BUILD_BUG_ON(sizeof(_p_) != 4);					\
+	switch(sizeof((_p_))) {						\
+	case 1:								\
+		__flags = cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
+		_prev_ = (__typeof__(*(ptr)))__flags;			\
+		break;							\
+		break;							\
+	case 4:								\
+		/*							\
+		 * spin lock/unlock provide the needed smp_mb()		\
+		 * before/after						\
+		 */							\
+		atomic_ops_lock(__flags);				\
+		_prev_ = *_p_;						\
+		if (_prev_ == _o_)					\
+			*_p_ = _n_;					\
+		atomic_ops_unlock(__flags);				\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
 									\
-	/*								\
-	 * spin lock/unlock provide the needed smp_mb() before/after	\
-	 */								\
-	atomic_ops_lock(__flags);					\
-	_prev_ = *_p_;							\
-	if (_prev_ == _o_)						\
-		*_p_ = _n_;						\
-	atomic_ops_unlock(__flags);					\
 	_prev_;								\
 })
 
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
