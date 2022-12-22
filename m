Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0343C4167B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Dec 2022 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMOLwBZ09E0uDRCYrv/C/neznoSFx5Oxki9RiI6AaTc=; b=ULeCq5D2OsnXxn
	oOPo91mc7HKPGyzLEBZ6BRMmJ4zodWHcMvXgtXei9wWJdYTWmv8/HPeL5fm4s9Xg4ktzlOQ1+zRL9
	5hoiki8/tV9jVyuofsp1SJ/QjrJq+dr4LnRkSGGR1IOE273nFIV6ja+eWB4iUh0pJ/6gZvo0gICpk
	voXppqmzCH+w6/MRgCU9bEOtxbeFeB3KiKndv9Ir5TmU6e3iP+VZeWuoPZ3rUGl2M4bNr9fWNFkMo
	U1gWW+GuCHz8+P2lYWKEvGJsyLB/jgU5PelQKh8nN1ZToTnf8lVRrV0BUluIN2zRnbAXNVhqnxbxu
	qQZ0Pwbfc+Sqx4cDSP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KSH-00Bjj1-V6; Thu, 22 Dec 2022 12:13:46 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K3E-00BWSb-OC; Thu, 22 Dec 2022 11:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709672; x=1703245672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+VGlWrUtqaEIUqy2OBJn82lI4eJE+r4QbaGV3gKpeCE=;
  b=IM48PsZ073hIrMHt9Ec0FQxFcMr1ZqOZrpaAKh4QhRfmL0t+ulm6w4+t
   V/aKKe1evhUy6J9MILHI4RoQ41MERGnhSCnBDmRx8njARfTIweDxscILN
   KC+ocXKm3oJNo/5sknT7JwS65GooMuW27HgrjQ24XNpvEtYaiuwIjZKU1
   j2mmH4/Fw3axw8ipZHYqaWDSZ63z9HY0bAKD9sGICBjB7oO8yVhmgxANv
   YIzTOrqEI0tT1aKBwjRRwVf4Lkd7J5zEiG+/ib23LxES3nBvs2AJrh0+N
   g5QrJwKajyFCmtFPmc8XL1SfS5O9af/m8uTuLuby3nSrIW0bOXSGSOu7L
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804534"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804534"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:47:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504464"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504464"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:47:42 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 04/19] arch/arm64: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:20 +0100
Message-Id: <20221222114635.1251934-5-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034753_165512_A9F4F5B4 
X-CRM114-Status: UNSURE (   9.22  )
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

__xchg will be used for non-atomic xchg macro.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 arch/arm64/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/cmpxchg.h b/arch/arm64/include/asm/cmpxchg.h
index 497acf134d9923..3a36ba58e8c2ef 100644
--- a/arch/arm64/include/asm/cmpxchg.h
+++ b/arch/arm64/include/asm/cmpxchg.h
@@ -62,7 +62,7 @@ __XCHG_CASE( ,  ,  mb_, 64, dmb ish, nop,  , a, l, "memory")
 #undef __XCHG_CASE
 
 #define __XCHG_GEN(sfx)							\
-static __always_inline  unsigned long __xchg##sfx(unsigned long x,	\
+static __always_inline  unsigned long __arch_xchg##sfx(unsigned long x,	\
 					volatile void *ptr,		\
 					int size)			\
 {									\
@@ -93,7 +93,7 @@ __XCHG_GEN(_mb)
 ({									\
 	__typeof__(*(ptr)) __ret;					\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg##sfx((unsigned long)(x), (ptr), sizeof(*(ptr))); \
+		__arch_xchg##sfx((unsigned long)(x), (ptr), sizeof(*(ptr))); \
 	__ret;								\
 })
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
