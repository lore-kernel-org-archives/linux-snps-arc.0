Return-Path: <SRS0=zy2i=M4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBB0C4320A
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 19:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3A2760F01
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 19:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3A2760F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sent.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+/2i1AHQ8bj/0sJphEtJTkRs1z2mjmOAheKobkEYfU=; b=saTW2ReMiAnhn3
	GcfryTXCQMJQtWKnfu/lFTVQCjWD/slis9U9Z2aSREwZsSDvJ/eMfs2Yb28CjgLb8FKSE8j+LqLFR
	11czIhdMP9MGvBRGzaDkwHznZL8vqSmMqwEh2ZY0/CqWiXTtxt8mMkvZB3P1oDn9Hv/8GceDbgPrU
	s5FRW15g0v8IoFXfh9pSJef0EgfiRCPdSTg6G3R43YXpGzVs3IA1tYzM9k9L4VCIekX2YmnrFz5hk
	FHNcG73M8jX7CtkxhV9olTfgvymF+bXLpUz//liuR/ke/3U2elRcR3YtxWH/If4EBqFfCsiQIz3Sm
	g67cnhPDO/Qwu5RUHYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBif0-00Abih-EX; Thu, 05 Aug 2021 19:04:06 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBiej-00AbWT-CV; Thu, 05 Aug 2021 19:03:51 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D3BAC5810B2;
 Thu,  5 Aug 2021 15:03:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 05 Aug 2021 15:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm1; bh=zNZUoCQxGeezK
 ynu9SXf7RK1yXXzs9UrsyBqx4F2Edk=; b=GtL12AmdeZNPHF6SApyO9wGXfEnlg
 wNhltluDSQzlmgtvgRRPULzc7FzojizjIvGqjq9l0WTHC8gjjwH0OPxXbGnrnUPm
 hDSMlGCd6ITo+xRpprv6J4fpF05Dz4iPpq0Q6YTMZ43f9noXHFhoA2ryB+1rwXso
 0xje1RyI2eOjiHlPqHk7sE8QpdSibrVzoNaw67a4doWQGdf2ABU4s86r8dg5LwQ8
 me86nda6dU5U9VRMEKgR+dFIaxddHn/vkrx5nqQt5s5YvdWVYAaeSBtnQyqaokgp
 5PjIXA1zjsCvdR3wQlwKJSjLLc4/gwwwSlV50rFq1ZqkR4cvvw3fC8rqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zNZUoCQxGeezKynu9SXf7RK1yXXzs9UrsyBqx4F2Edk=; b=lkUCbjUl
 PEdQRBtf816Ypmmn3nhNv7Sizw4AzYBiGnl0V9d227YL3157XWzt7AL5QCqGN7cL
 yqPnZEkLdbcz85N8RdldMN71v2KmRxsPUl7vsMVtamEYXDOPG3U6BvE+pr7+Yru4
 /FVQdwNbo4Ycp97k//hOBnZ2yca1DgKkAyOxemQjJQPVSeOqcrlkx7j0BGJaFUyS
 CWPBdaRML51ZDoxDH0rHuU7w62PfIe1ROCUo1cvMbBryWkG7nPr36V8nKMhl2XkD
 x4NfRrv0ZBtrGiGrKGOyx1ZKcrBy0Yhjm8JPiSOmYop6IZ1wOMqP+pqW7m9ryknq
 SMva7CVAvywnQA==
X-ME-Sender: <xms:EDYMYY-DL8P2bcvnLICbJUDwJSM9knPLJLgObnvHJpPeONvY18Y8zA>
 <xme:EDYMYQuaN103Gqpz6IVwl1J1TfPrOWCIdVik9xAJA4Ej6bJdqSxpwSdpWtrORcNJP
 zY1qpKdp_dodr_qwg>
X-ME-Received: <xmr:EDYMYeDQlih2rLrqdgd6jlVePFzv5Z5MhViPFAcjOwbSFYpGFZTVca5ZEJTqPcCHSvsAykOj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieelgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecuvehluhhs
 thgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepiihirdihrghnsehsvg
 hnthdrtghomh
X-ME-Proxy: <xmx:EDYMYYebQ9uZTltrKTkpcJXLtFJiugbJgfdenr91RlXIpn-tUs0VXA>
 <xmx:EDYMYdNGPMj1jZn3czxOZ1YHev0_hyrR_EzZOrQpHCpjsp3MQtYpDg>
 <xmx:EDYMYSlWti7zMr_aZl-0ZjSHN1IURtnEK9-wZbzw1PspP32v-Um2OQ>
 <xmx:EjYMYVbHX95gn2qpP7YVlS5-XylZg9XCV-qdmTswerMFWoEkCpgRVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 15:03:43 -0400 (EDT)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>,	Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,	Michal Hocko <mhocko@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,	linux-kernel@vger.kernel.org,
 Zi Yan <ziy@nvidia.com>,	Vineet Gupta <vgupta@synopsys.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,	Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "David S. Miller" <davem@davemloft.net>,	Chris Zankel <chris@zankel.net>,
 linux-snps-arc@lists.infradead.org,	linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io,	linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org,	linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,	linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org,	sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org
Subject: [RFC PATCH 02/15] arch: mm: rename FORCE_MAX_ZONEORDER to
 ARCH_FORCE_MAX_ORDER
Date: Thu,  5 Aug 2021 15:02:40 -0400
Message-Id: <20210805190253.2795604-3-zi.yan@sent.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210805190253.2795604-1-zi.yan@sent.com>
References: <20210805190253.2795604-1-zi.yan@sent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_120349_588451_08428AB4 
X-CRM114-Status: GOOD (  14.49  )
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

Signed-off-by: Zi Yan <ziy@nvidia.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Chris Zankel <chris@zankel.net>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-oxnas@groups.io
Cc: linux-csky@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
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
 arch/arm/configs/sama7_defconfig             | 2 +-
 arch/arm64/Kconfig                           | 2 +-
 arch/csky/Kconfig                            | 2 +-
 arch/ia64/Kconfig                            | 2 +-
 arch/ia64/include/asm/sparsemem.h            | 6 +++---
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
 21 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index b5bf68e74732..923ea4c31e59 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -583,7 +583,7 @@ config ARC_BUILTIN_DTB_NAME
 
 endmenu	 # "ARC Architecture Configuration"
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "12" if ARC_HUGEPAGE_16M
 	default "11"
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2fb7012c3246..286854318fe5 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1523,7 +1523,7 @@ config ARM_MODULE_PLTS
 	  Disabling this is usually safe for small single-platform
 	  configurations. If unsure, say y.
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "12" if SOC_AM33XX
 	default "9" if SA1111
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 079fcd8d1d11..802310d3ebf5 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -34,7 +34,7 @@ CONFIG_PCI_IMX6=y
 CONFIG_SMP=y
 CONFIG_ARM_PSCI=y
 CONFIG_HIGHMEM=y
-CONFIG_FORCE_MAX_ZONEORDER=14
+CONFIG_ARCH_FORCE_MAX_ORDER=14
 CONFIG_CMDLINE="noinitrd console=ttymxc0,115200"
 CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
diff --git a/arch/arm/configs/milbeaut_m10v_defconfig b/arch/arm/configs/milbeaut_m10v_defconfig
index 7c07f9893a0f..06967243f74d 100644
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
index cae0db6b4eaf..df8462272446 100644
--- a/arch/arm/configs/oxnas_v6_defconfig
+++ b/arch/arm/configs/oxnas_v6_defconfig
@@ -17,7 +17,7 @@ CONFIG_MACH_OX820=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=16
 CONFIG_CMA=y
-CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_ARCH_FORCE_MAX_ORDER=12
 CONFIG_SECCOMP=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index 938aae4bd80b..f8683b87cb27 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -22,7 +22,7 @@ CONFIG_ATMEL_CLOCKSOURCE_TCB=y
 # CONFIG_CACHE_L2X0 is not set
 # CONFIG_ARM_PATCH_IDIV is not set
 # CONFIG_CPU_SW_DOMAIN_PAN is not set
-CONFIG_FORCE_MAX_ZONEORDER=15
+CONFIG_ARCH_FORCE_MAX_ORDER=15
 CONFIG_UACCESS_WITH_MEMCPY=y
 # CONFIG_ATAGS is not set
 CONFIG_CMDLINE="console=ttyS0,115200 earlyprintk ignore_loglevel"
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5b13a932561..972d81f6bb2c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1152,7 +1152,7 @@ config XEN
 	help
 	  Say Y if you want to run Linux in a Virtual Machine on Xen on ARM64.
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int
 	default "14" if ARM64_64K_PAGES
 	default "12" if ARM64_16K_PAGES
diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 2716f6395ba7..0fd2333226b7 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -307,7 +307,7 @@ config HIGHMEM
 	select KMAP_LOCAL
 	default y
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "11"
 
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 4993c7ac7ff6..d1bd010ee7a5 100644
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
 
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 29e946394fdb..c39157f3dd87 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -408,7 +408,7 @@ config SINGLE_MEMORY_CHUNK
 	  order" to save memory that could be wasted for unused memory map.
 	  Say N if not sure.
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order" if ADVANCED
 	depends on !SINGLE_MEMORY_CHUNK
 	default "11"
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6dfb27d531dd..0998f671ed7e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2284,7 +2284,7 @@ config PAGE_SIZE_64KB
 
 endchoice
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 14 64 if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_64KB
 	default "14" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_64KB
diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index c24955c81c92..e5c300198e1f 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -50,7 +50,7 @@ menu "Kernel features"
 
 source "kernel/Kconfig.hz"
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 9 20
 	default "11"
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2e213ec6ec05..5edb48b363c4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -810,7 +810,7 @@ config DATA_SHIFT
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
index df37efed0aec..521e7a530888 100644
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
index 03cb916819fa..4c09ca308d43 100644
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
index f0c0f955e169..2206c99612ed 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -273,7 +273,7 @@ config ARCH_SPARSEMEM_ENABLE
 config ARCH_SPARSEMEM_DEFAULT
 	def_bool y if SPARC64
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "13"
 	help
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index b843902ad9fd..90784aa68cf8 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -709,7 +709,7 @@ config HIGHMEM
 
 	  If unsure, say Y.
 
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "11"
 	help
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index c1d914a72489..98e3297b9e09 100644
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
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
