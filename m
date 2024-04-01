Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9FCCD128A
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Apr 2024 21:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XhT+TyyvLW7lx0WtqMaMdgw4c097n4GUQ7zKmQ0WW5A=; b=0sNNkI1pC0ryac
	+pNYyT6IV05cgoyKyqx40o7Q3l4FoRRZcbatdJxF+RiiSG3GGhS5sxo89+guR1UOHS65QBGsINDi+
	1L7GX7Oiq68/2aZVA2x5yeo94wC1oL9Wx+8fODq8UhbAvRj6vntAORv28sIQR4FrXDjkAgTCRcC1k
	pCRI3MAFyZDiz7q1W8DK1RcFF6auBRcVqjz/v5w8/t8yigUQnehzmsjTFGU+yn9giJSDj7UkeMwm1
	nuyQ82bsFp+Y1hL2ZOfHoEl1ejDrIujz+VrECvyOnZgWcv4SKhHUFWXuwEfcnpmq4Qh/YRmhg2fQ6
	1jXMhtbwHqpcMC1t9jtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrPNo-00000008uj2-0lLb;
	Mon, 01 Apr 2024 21:40:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrPNk-00000008uh0-0hny
	for linux-snps-arc@lists.infradead.org;
	Mon, 01 Apr 2024 21:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 796BB60E55;
	Mon,  1 Apr 2024 21:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE32C43394;
	Mon,  1 Apr 2024 21:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712007595;
	bh=V+BpmS0L5AY0NVsYdTSBQxe6rtRi97k3MCIt6y0ESdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t6SR+duRyz91MSUJd6aDkPfhqtTUYz+BtdhwHcEwrjvBL3wMl3HTDfuq2dc5KxMs9
	 VbR0s4/x47BOzkstNFYga3IECVzsunTnepncGio7T7V5OQvbxe3y0O6Xu0PCcrGim4
	 xpM/LUutYwScLWvyOogZlV1s33uThDYjSz0nTsA76EG3QmRAVJXpVPhpWLkriWfrxf
	 9AE7YODRHtPCaVjNm2kjP3rWTjKCd9gdyAJbYSqMO+FybJLaCoxTshEq0U260FZFmJ
	 uJ2D9qIfonNIAfSanKTkTyz8TSsf+ihOmImDZyIkJ7rWxapRNK22bfPuP1v1Bd5lyI
	 NYNdUxyKkdA/w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C0299CE074C; Mon,  1 Apr 2024 14:39:54 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH RFC cmpxchg 3/8] ARC: Emulate one-byte and two-byte cmpxchg
Date: Mon,  1 Apr 2024 14:39:45 -0700
Message-Id: <20240401213950.3910531-3-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <31c82dcc-e203-48a9-aadd-f2fcd57d94c1@paulmck-laptop>
References: <31c82dcc-e203-48a9-aadd-f2fcd57d94c1@paulmck-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_143956_312767_E37CB7D1 
X-CRM114-Status: GOOD (  11.69  )
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

Use the new cmpxchg_emu_u8() and cmpxchg_emu_u16() to emulate one-byte
and two-byte cmpxchg() on arc.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: <linux-snps-arc@lists.infradead.org>
---
 arch/arc/Kconfig               |  1 +
 arch/arc/include/asm/cmpxchg.h | 38 ++++++++++++++++++++++++++--------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 99d2845f3feb9..0b40039f38eb2 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -14,6 +14,7 @@ config ARC
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_NEED_CMPXCHG_1_2_EMU
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select ARCH_32BIT_OFF_T
 	select BUILDTIME_TABLE_SORT
diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index e138fde067dea..1e3e23adaca13 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -46,6 +46,12 @@
 	__typeof__(*(ptr)) _prev_;					\
 									\
 	switch(sizeof((_p_))) {						\
+	case 1:								\
+		_prev_ = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_);	\
+		break;							\
+	case 2:								\
+		_prev_ = cmpxchg_emu_u16((volatile u16 *)_p_, _o_, _n_); \
+		break;							\
 	case 4:								\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
 		break;							\
@@ -65,16 +71,30 @@
 	__typeof__(*(ptr)) _prev_;					\
 	unsigned long __flags;						\
 									\
-	BUILD_BUG_ON(sizeof(_p_) != 4);					\
+	switch(sizeof((_p_))) {						\
+	case 1:								\
+		__flags = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_);	\
+		_prev_ = (__typeof__(*(ptr)))__flags;			\
+		break;							\
+	case 2:								\
+		__flags = cmpxchg_emu_u16((volatile u16 *)_p_, _o_, _n_); \
+		_prev_ = (__typeof__(*(ptr)))__flags;			\
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
