Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6B1C001B2
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Dec 2022 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iwwr2lvuuroFmhHjwWT+gTIPJCPQ41nhURkxq/SHsNA=; b=lKUuJpICiCmtrS
	q/I1s6G9UrYfEy88L1sMQFbd7nlxasqZfWU9OwHpBEgMHwVofyit9yzzK0Il+X6QXgdtTy12GemKW
	JyfNy1VOzrPPuHV7f28vZB4SvvcRf3BIuc7HOty5K7wBVHk8ZOrb3YHrbHcATBLZUkEpo9/RFX4n9
	yNAVdypdjFvh+5yBk6kIrFyMmZi5mTZcsMAd7hU9KnX3eCwazzvrAtvyubxzEfHExTmISp90NgJjC
	R+6f5weaJs1EeDkX+yKLCqt2ikk/aAxxvrLD9eOM9zkFdxDV8k7LrjLKI4ZsR6mw6PCFRL/9UX6k5
	RNgZmmM+avoVUpAnlzwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KSP-00BjoS-Ew; Thu, 22 Dec 2022 12:13:53 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K3C-00BWSb-SF; Thu, 22 Dec 2022 11:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709670; x=1703245670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/UDTi8Vls0g/+nnPnB+HCzMyNgpTxrVUoGQF5kbhC34=;
  b=RM+cLECTApjcbeEPy2Y02ig+ua3YBZn6pmQwfduf8vnVuJhSa7Rw5gWl
   Dxr2yQqdFoCiDeY1aA59pW3O2Y56zXrY7jkA2ZeYh5mToatywOfvEymnt
   vc9kg+YXFxLOYcijmF8uA7sLRblHvA81hWEyHNMevNv6u2pOFd87IVk/e
   VUSQ/H5JclvDzIRxJxcsg/wOjppY9lk9gJBiBKM64Bw7dBJYNVngkMmEY
   iKYA3ojpjAFvWTv+Rc4MKE/FDk+6dR7rEfbKWHKaYmM8AsS5BGW6uUv6J
   DgEbbJcsS6MsK7vfOJoM0MOO9eYI+vmWZpVoUxN2jPi7GkcqfHe3TJ2SJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804486"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804486"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:47:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504368"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504368"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:47:30 -0800
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
Subject: [PATCH 02/19] arch/arc: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:18 +0100
Message-Id: <20221222114635.1251934-3-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034750_967450_CE318D31 
X-CRM114-Status: UNSURE (   9.78  )
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
 arch/arc/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index c5b544a5fe8106..e138fde067dea5 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -85,7 +85,7 @@
  */
 #ifdef CONFIG_ARC_HAS_LLSC
 
-#define __xchg(ptr, val)						\
+#define __arch_xchg(ptr, val)						\
 ({									\
 	__asm__ __volatile__(						\
 	"	ex  %0, [%1]	\n"	/* set new value */	        \
@@ -102,7 +102,7 @@
 									\
 	switch(sizeof(*(_p_))) {					\
 	case 4:								\
-		_val_ = __xchg(_p_, _val_);				\
+		_val_ = __arch_xchg(_p_, _val_);			\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
