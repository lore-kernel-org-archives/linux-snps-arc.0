Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365C5C4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Dec 2022 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irWTmufc3R0E4TaYOFmT6UroUP3zSeb6pKrFN4HE5vM=; b=bLS9CJAvIYewpX
	Dg9fuwI4KnuS+zDl8jHE/gZm698q/cyoaWKrD1Pu1O06d9BglV3pQ6CFPAX/hu930Ny4AoGfhYCA6
	nllFEjJYxL+iUyATZ9K1p4/4Rt9jlivkKdHWKutXIZGnXudeQOQWf8AMyyL/YuPNWYjGgLFCgr4mx
	TSJwBMky504/9B4sBK+iyPmsOYy5sM/cwT+qn+4fAwTEWKC2R3fcHGt9faAXqD/fxQ7z53oDJHPsL
	UGqS0JdNjDkgTS5PfDY8vBc6wpVFxu/UnBj2TvSBmPUQsUwf7tN2nUWsWfn3kwPrQ9UKSBkOKpD9A
	VD3/kD8oCuGpQxeam78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Ldl-00CPQF-EX; Thu, 22 Dec 2022 13:29:41 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K3r-00BWWm-Ql; Thu, 22 Dec 2022 11:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709711; x=1703245711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ShuBR0Z5S7GcOYzeMdcvtC9TNipnvNb2IL9/zmSpmSE=;
  b=PYGsCY2GO6JtbO2ykcyYwRQarTNmzIM1sCfvaLg66v4m0uYLObV65Qrd
   h0yQWOrnFykgdRB5dFiRIPz3gQX8AhfDj/EKQzKzeTZcQvpsgWdLuYtQ9
   A/quGqvV8LBu+qpA6ukyKQZ3Y6PGH7ewbKg2GGZUo/iq7KQWNuYqyic9i
   0lOSaFsuE8G6AlbQYcmL7DmH512zSFydvRfOG8XL56ve+vQE6s8Yqc54O
   VQAvWOOzccGYqj62d+JnZfm0uMu6BTgbd8twYBdMCEIsTchBeNLLnoXq0
   s2kImY4FJshkB51R33UwEPnVX4EDLE+ewhGmCMI7oEsliUNh87rbQlVL/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804756"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804756"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504772"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504772"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:24 -0800
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
Subject: [PATCH 11/19] arch/parisc: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:27 +0100
Message-Id: <20221222114635.1251934-12-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034832_078395_97845E07 
X-CRM114-Status: GOOD (  10.51  )
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
 arch/parisc/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/cmpxchg.h b/arch/parisc/include/asm/cmpxchg.h
index 5f274be105671e..c1d776bb16b4ed 100644
--- a/arch/parisc/include/asm/cmpxchg.h
+++ b/arch/parisc/include/asm/cmpxchg.h
@@ -22,7 +22,7 @@ extern unsigned long __xchg64(unsigned long, volatile unsigned long *);
 
 /* optimizer better get rid of switch since size is a constant */
 static inline unsigned long
-__xchg(unsigned long x, volatile void *ptr, int size)
+__arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	switch (size) {
 #ifdef CONFIG_64BIT
@@ -49,7 +49,7 @@ __xchg(unsigned long x, volatile void *ptr, int size)
 	__typeof__(*(ptr)) __ret;					\
 	__typeof__(*(ptr)) _x_ = (x);					\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg((unsigned long)_x_, (ptr), sizeof(*(ptr)));	\
+		__arch_xchg((unsigned long)_x_, (ptr), sizeof(*(ptr)));	\
 	__ret;								\
 })
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
