Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB37C00140
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Aug 2022 14:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wOZtnv7KjnPrAlLsHAMFhg8iWFnZHJ+Od5mfPWt0N2U=; b=4L0qFig9H3wrFN
	qA7e5WJFE8NwTQjrs/RE8wBUIrmVQ+5/bJgxaxJzWiSjXFIlM4pzNRo+twgp5YtjQSPSQT27mcqLP
	MqPRWuadzsg+52fmkmMXooG4XVuEbp1YPRGICHnVxy+Xan6ODr+Jyvs5wRPJy/YJgOMg+DwtF50v8
	fCwP0C6JhG6b2Iq6X/p2MKMfiKJzAj0C4fY/KnNNkS2hTLCJn2Dt1visazhowOP+48LQXAZCHlXO8
	HzTlwTGbXXKQqIjW1I33Z5VJwyKMLyLIYo2u84kU4HYrpHIp0R3sh3mYmO89OiYXpzUTw04esJLcp
	qtkufLKXKqGwrA15gJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNbVD-000Rg2-3T; Mon, 15 Aug 2022 14:55:39 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNbGb-000E6x-PI; Mon, 15 Aug 2022 14:40:37 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id DF5B65801BD;
	Mon, 15 Aug 2022 10:40:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 15 Aug 2022 10:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1660574428; x=1660581628; bh=DGtBzB5gvV
	/bg6WJhVaceXEXR9j/HiUey3LRQ9aMkpc=; b=y/bOxu6gLP4GvrPWXMY27weFun
	c1ncX3L4wvaa9IUjoTYgdrlRYy8ylM94pZvP6iDQmLe4esMVZBBWA2vaVkRVNnqe
	rNTy9eqQX789s5OZl/0VSiFEleOizu220mkbcf1xv49tiUjQrOeXETMbK71FixbU
	+Z639NZx8LY5/xQLY7y7f+1LNKLtF9KTuhJ2kc00t2+Aq4XKS0Sr+9hMAHBJ5LFN
	xIz1G7hSqpta6DirFoyRxmnrlmla8uVN/AZ8vvZ8leK4mFzKEQkeFtw/663rN7hR
	vpHpdYdGPhjwkeDh5yZY6zDTt51EkD3g7gl3DTux+7ofqUyfwri/muCys3Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660574428; x=1660581628; bh=DGtBzB5gvV/bg6WJhVaceXEXR9j/
	HiUey3LRQ9aMkpc=; b=MzzWgt6WOwywKO6TLP+bUkIBGi3rW3WFiCmM8uBSTY8C
	kekFTJOApWn07sGE4/nCPmVGC9XUfMTvT42w0evi8E5hwKXu6EiqtsQOgYZTMBuc
	zfo/i1nDXhFhxQEW3mlNoQzc2Ki24KY7c+MWcaytyzhRQCKev9eW82LmS4cnumCM
	T34uIhx63m/mBWeaPsa+CvZZHENMV2sPGhvjFfPkZyPmPa2ypdU1nlpS3pxqybuA
	vQVw16JK4LXWosbIOy59orzDTASR+0jC96BC/UCLn79DbLdYkZSj0suCMKmwzhbx
	59ZMeymfudYzSGOLXtdkmZqcPICyMO5HISTsx1IyNA==
X-ME-Sender: <xms:2lr6YkIcP_YlnPjg2EHTks4ozpYG-In4ywPEJHiSrLNtJNI65CGKnQ>
    <xme:2lr6YkJwEB05mX9iFjp_F6MProO0o089Q096PAKfB0PguXbfPMqI0lsIr525I7kMN
    GRVK7ggilWU9XPmPA>
X-ME-Received: <xmr:2lr6YktwE9V_roIVCiKCMVxOo-flSa9M5tCtt0Xo8AN3gZZYryst2ROnh2kxX-Xr_E-OSrW538ZTUYkM9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
    nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpedtgffhtd
    etledtkeeihfefueeuhedvudfhvdeifeevtdektdetgfeiieejuefhtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
    htrdgtohhm
X-ME-Proxy: <xmx:2lr6YhaeMQSXAQX8EO-vC4kShr5WLRZazbJjh91tcmYqs4TTsW2zZw>
    <xmx:2lr6YrbXs2m9GrdadKv7UX5V2cu7Mzi58CXIpZfJsxJW28M4JOhK-w>
    <xmx:2lr6YtD4DsYFSxGoz8s8EsYu6nD6FaT1ZOnJaauMLRBdApD4J9a3UA>
    <xmx:3Fr6YomysOdJJhveVAcOV7Y1crZ80LlfrgIlStNgo8i7ZKk8FYqAfg>
Feedback-ID: iccd040f4:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 10:40:25 -0400 (EDT)
From: Zi Yan <zi.yan@sent.com>
To: linux-mm@kvack.org
Cc: Zi Yan <ziy@nvidia.com>,	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,	Yang Shi <shy828301@gmail.com>,
	David Rientjes <rientjes@google.com>,
	James Houghton <jthoughton@google.com>,	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,	Mike Rapoport <rppt@linux.ibm.com>,
	Vineet Gupta <vgupta@synopsys.com>,	Shawn Guo <shawnguo@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Neil Armstrong <narmstrong@baylibre.com>,	Qin Jian <qinjian@cqplus1.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"David S. Miller" <davem@davemloft.net>,	Chris Zankel <chris@zankel.net>,
	Arnd Bergmann <arnd@arndb.de>,	Ley Foon Tan <ley.foon.tan@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	NXP Linux Team <linux-imx@nxp.com>,	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,	linux-oxnas@groups.io,
	linux-csky@vger.kernel.org,	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org
Subject: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
Date: Mon, 15 Aug 2022 10:39:59 -0400
Message-Id: <20220815143959.1511278-1-zi.yan@sent.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_074034_268581_15CA8141 
X-CRM114-Status: GOOD (  14.42  )
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
Reply-To: Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Zi Yan <ziy@nvidia.com>

This Kconfig option is used by individual arch to set its desired
MAX_ORDER. Rename it to reflect its actual use.

Acked-by: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Zi Yan <ziy@nvidia.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Taichi Sugaya <sugaya.taichi@socionext.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Qin Jian <qinjian@cqplus1.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Chris Zankel <chris@zankel.net>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-oxnas@groups.io
Cc: linux-csky@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arc/Kconfig                             | 2 +-
 arch/arm/Kconfig                             | 2 +-
 arch/arm/configs/imx_v6_v7_defconfig         | 2 +-
 arch/arm/configs/milbeaut_m10v_defconfig     | 2 +-
 arch/arm/configs/oxnas_v6_defconfig          | 2 +-
 arch/arm/configs/pxa_defconfig               | 2 +-
 arch/arm/configs/sama7_defconfig             | 2 +-
 arch/arm/configs/sp7021_defconfig            | 2 +-
 arch/arm64/Kconfig                           | 2 +-
 arch/csky/Kconfig                            | 2 +-
 arch/ia64/Kconfig                            | 2 +-
 arch/ia64/include/asm/sparsemem.h            | 6 +++---
 arch/loongarch/Kconfig                       | 2 +-
 arch/m68k/Kconfig.cpu                        | 2 +-
 arch/mips/Kconfig                            | 2 +-
 arch/nios2/Kconfig                           | 2 +-
 arch/powerpc/Kconfig                         | 2 +-
 arch/powerpc/configs/85xx/ge_imp3a_defconfig | 2 +-
 arch/powerpc/configs/fsl-emb-nonhw.config    | 2 +-
 arch/sh/configs/ecovec24_defconfig           | 2 +-
 arch/sh/mm/Kconfig                           | 2 +-
 arch/sparc/Kconfig                           | 2 +-
 arch/xtensa/Kconfig                          | 2 +-
 include/linux/mmzone.h                       | 4 ++--
 24 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 9e3653253ef2..d9a13ccf89a3 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -554,7 +554,7 @@ config ARC_BUILTIN_DTB_NAME
 
 endmenu	 # "ARC Architecture Configuration"
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "12" if ARC_HUGEPAGE_16M
 	default "11"
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 87badeae3181..e6c8ee56ac52 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1434,7 +1434,7 @@ config ARM_MODULE_PLTS
 	  Disabling this is usually safe for small single-platform
 	  configurations. If unsure, say y.
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "12" if SOC_AM33XX
 	default "9" if SA1111
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 01012537a9b9..fb283059daa0 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -31,7 +31,7 @@ CONFIG_SOC_VF610=y
 CONFIG_SMP=y
 CONFIG_ARM_PSCI=y
 CONFIG_HIGHMEM=y
-CONFIG_FORCE_MAX_ZONEORDER=14
+CONFIG_ARCH_FORCE_MAX_ORDER=14
 CONFIG_CMDLINE="noinitrd console=ttymxc0,115200"
 CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
diff --git a/arch/arm/configs/milbeaut_m10v_defconfig b/arch/arm/configs/milbeaut_m10v_defconfig
index 58810e98de3d..8620061e19a8 100644
--- a/arch/arm/configs/milbeaut_m10v_defconfig
+++ b/arch/arm/configs/milbeaut_m10v_defconfig
@@ -26,7 +26,7 @@ CONFIG_THUMB2_KERNEL=y
 # CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11 is not set
 # CONFIG_ARM_PATCH_IDIV is not set
 CONFIG_HIGHMEM=y
-CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_ARCH_FORCE_MAX_ORDER=12
 CONFIG_SECCOMP=y
 CONFIG_KEXEC=y
 CONFIG_EFI=y
diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v6_defconfig
index 600f78b363dd..5c163a9d1429 100644
--- a/arch/arm/configs/oxnas_v6_defconfig
+++ b/arch/arm/configs/oxnas_v6_defconfig
@@ -12,7 +12,7 @@ CONFIG_ARCH_OXNAS=y
 CONFIG_MACH_OX820=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=16
-CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_ARCH_FORCE_MAX_ORDER=12
 CONFIG_SECCOMP=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 104a45722799..ce3f4ed50498 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -21,7 +21,7 @@ CONFIG_MACH_AKITA=y
 CONFIG_MACH_BORZOI=y
 CONFIG_PXA_SYSTEMS_CPLDS=y
 CONFIG_AEABI=y
-CONFIG_FORCE_MAX_ZONEORDER=9
+CONFIG_ARCH_FORCE_MAX_ORDER=9
 CONFIG_CMDLINE="root=/dev/ram0 ro"
 CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index 0384030d8b25..8b2cf6ddd568 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -19,7 +19,7 @@ CONFIG_ATMEL_CLOCKSOURCE_TCB=y
 # CONFIG_CACHE_L2X0 is not set
 # CONFIG_ARM_PATCH_IDIV is not set
 # CONFIG_CPU_SW_DOMAIN_PAN is not set
-CONFIG_FORCE_MAX_ZONEORDER=15
+CONFIG_ARCH_FORCE_MAX_ORDER=15
 CONFIG_UACCESS_WITH_MEMCPY=y
 # CONFIG_ATAGS is not set
 CONFIG_CMDLINE="console=ttyS0,115200 earlyprintk ignore_loglevel"
diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index 703b9aaa40f0..151ca8c47373 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -18,7 +18,7 @@ CONFIG_ARCH_SUNPLUS=y
 # CONFIG_VDSO is not set
 CONFIG_SMP=y
 CONFIG_THUMB2_KERNEL=y
-CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_ARCH_FORCE_MAX_ORDER=12
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_MODULES=y
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 571cc234d0b3..c6fcd8746f60 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1401,7 +1401,7 @@ config XEN
 	help
 	  Say Y if you want to run Linux in a Virtual Machine on Xen on ARM64.
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int
 	default "14" if ARM64_64K_PAGES
 	default "12" if ARM64_16K_PAGES
diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 3cbc2dc62baf..adee6ab36862 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -332,7 +332,7 @@ config HIGHMEM
 	select KMAP_LOCAL
 	default y
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "11"
 
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 26ac8ea15a9e..c6e06cdc738f 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -200,7 +200,7 @@ config IA64_CYCLONE
 	  Say Y here to enable support for IBM EXA Cyclone time source.
 	  If you're unsure, answer N.
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "MAX_ORDER (11 - 17)"  if !HUGETLB_PAGE
 	range 11 17  if !HUGETLB_PAGE
 	default "17" if HUGETLB_PAGE
diff --git a/arch/ia64/include/asm/sparsemem.h b/arch/ia64/include/asm/sparsemem.h
index 42ed5248fae9..84e8ce387b69 100644
--- a/arch/ia64/include/asm/sparsemem.h
+++ b/arch/ia64/include/asm/sparsemem.h
@@ -11,10 +11,10 @@
 
 #define SECTION_SIZE_BITS	(30)
 #define MAX_PHYSMEM_BITS	(50)
-#ifdef CONFIG_FORCE_MAX_ZONEORDER
-#if ((CONFIG_FORCE_MAX_ZONEORDER - 1 + PAGE_SHIFT) > SECTION_SIZE_BITS)
+#ifdef CONFIG_ARCH_FORCE_MAX_ORDER
+#if ((CONFIG_ARCH_FORCE_MAX_ORDER - 1 + PAGE_SHIFT) > SECTION_SIZE_BITS)
 #undef SECTION_SIZE_BITS
-#define SECTION_SIZE_BITS (CONFIG_FORCE_MAX_ZONEORDER - 1 + PAGE_SHIFT)
+#define SECTION_SIZE_BITS (CONFIG_ARCH_FORCE_MAX_ORDER - 1 + PAGE_SHIFT)
 #endif
 #endif
 
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 4abc9a28aba4..b5b19eea0e3e 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -369,7 +369,7 @@ config NODES_SHIFT
 	default "6"
 	depends on NUMA
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 14 64 if PAGE_SIZE_64KB
 	default "14" if PAGE_SIZE_64KB
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index e0e9e31339c1..3b2f39508524 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -399,7 +399,7 @@ config SINGLE_MEMORY_CHUNK
 	  order" to save memory that could be wasted for unused memory map.
 	  Say N if not sure.
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order" if ADVANCED
 	depends on !SINGLE_MEMORY_CHUNK
 	default "11"
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ec21f8999249..70d28976a40d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2140,7 +2140,7 @@ config PAGE_SIZE_64KB
 
 endchoice
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 14 64 if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_64KB
 	default "14" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_64KB
diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index 4167f1eb4cd8..a582f72104f3 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -44,7 +44,7 @@ menu "Kernel features"
 
 source "kernel/Kconfig.hz"
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 9 20
 	default "11"
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4c466acdc70d..39d71d7701bd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -845,7 +845,7 @@ config DATA_SHIFT
 	  in that case. If PIN_TLB is selected, it must be aligned to 8M as
 	  8M pages will be pinned.
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 8 9 if PPC64 && PPC_64K_PAGES
 	default "9" if PPC64 && PPC_64K_PAGES
diff --git a/arch/powerpc/configs/85xx/ge_imp3a_defconfig b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
index f29c166998af..e7672c186325 100644
--- a/arch/powerpc/configs/85xx/ge_imp3a_defconfig
+++ b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
@@ -30,7 +30,7 @@ CONFIG_PREEMPT=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
 CONFIG_MATH_EMULATION=y
-CONFIG_FORCE_MAX_ZONEORDER=17
+CONFIG_ARCH_FORCE_MAX_ORDER=17
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_MSI=y
diff --git a/arch/powerpc/configs/fsl-emb-nonhw.config b/arch/powerpc/configs/fsl-emb-nonhw.config
index f14c6dbd7346..ab8a8c4530d9 100644
--- a/arch/powerpc/configs/fsl-emb-nonhw.config
+++ b/arch/powerpc/configs/fsl-emb-nonhw.config
@@ -41,7 +41,7 @@ CONFIG_FIXED_PHY=y
 CONFIG_FONT_8x16=y
 CONFIG_FONT_8x8=y
 CONFIG_FONTS=y
-CONFIG_FORCE_MAX_ZONEORDER=13
+CONFIG_ARCH_FORCE_MAX_ORDER=13
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAME_WARN=1024
 CONFIG_FTL=y
diff --git a/arch/sh/configs/ecovec24_defconfig b/arch/sh/configs/ecovec24_defconfig
index e699e2e04128..b52e14ccb450 100644
--- a/arch/sh/configs/ecovec24_defconfig
+++ b/arch/sh/configs/ecovec24_defconfig
@@ -8,7 +8,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7724=y
-CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_ARCH_FORCE_MAX_ORDER=12
 CONFIG_MEMORY_SIZE=0x10000000
 CONFIG_FLATMEM_MANUAL=y
 CONFIG_SH_ECOVEC=y
diff --git a/arch/sh/mm/Kconfig b/arch/sh/mm/Kconfig
index ba569cfb4368..411fdc0901f7 100644
--- a/arch/sh/mm/Kconfig
+++ b/arch/sh/mm/Kconfig
@@ -18,7 +18,7 @@ config PAGE_OFFSET
 	default "0x80000000" if MMU
 	default "0x00000000"
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 9 64 if PAGE_SIZE_16KB
 	default "9" if PAGE_SIZE_16KB
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 1c852bb530ec..4d3d1af90d52 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -269,7 +269,7 @@ config ARCH_SPARSEMEM_ENABLE
 config ARCH_SPARSEMEM_DEFAULT
 	def_bool y if SPARC64
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "13"
 	help
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 12ac277282ba..bcb0c5d2abc2 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -771,7 +771,7 @@ config HIGHMEM
 
 	  If unsure, say Y.
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "11"
 	help
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 025754b0bc09..fd61347b4b1f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -24,10 +24,10 @@
 #include <asm/page.h>
 
 /* Free memory management - zoned buddy allocator.  */
-#ifndef CONFIG_FORCE_MAX_ZONEORDER
+#ifndef CONFIG_ARCH_FORCE_MAX_ORDER
 #define MAX_ORDER 11
 #else
-#define MAX_ORDER CONFIG_FORCE_MAX_ZONEORDER
+#define MAX_ORDER CONFIG_ARCH_FORCE_MAX_ORDER
 #endif
 #define MAX_ORDER_NR_PAGES (1 << (MAX_ORDER - 1))
 
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
