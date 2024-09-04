Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BC9CD4F4D
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSogsaQaGPeziG9UovQ4lw7yXGamdMmzcIz/T2jTGmA=; b=ih1QU6wkFOvBHo
	QcPc4y2faKumZg4HCMCur6jq7OyK80ZQaZPKYMetfk8anBIhD2qC/x8Ld2aM40aRSdF+tl77EcayL
	QXC1f2Erq7l4xmrglTdPSrjQEhyAxXXsav0Nm+mXInp/LmfVcajOCijvYrESyQkeWmbtJQhOkkfPg
	OjrMGOigPm3GJSTJKy1+WNtP8JmjyXiApBM+l1kYdc34uVIg6hV8L+lxVHfx8R98breh5e2ryK1OY
	ZPMADUBVv75DSA65lOJxN7U+tGUftjOEdu+UBQFxEl+830raMUo0nZ/Tcmk750Jy60GAUiq08lcvq
	pS+jZLjeXjA0A7j5EYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjp-00000006OtS-0nrw;
	Wed, 04 Sep 2024 23:48:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjn-00000006OsY-0FkY
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BB405C5560;
	Wed,  4 Sep 2024 23:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D540BC4CECA;
	Wed,  4 Sep 2024 23:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493714;
	bh=ShH7X/nJUOJT346TPtT8MDMv6QalWDIylxJwzZgk3lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RYTs406lL9RVGMTvwddw7pj2H9g2O9zYNJjASRMvJlNrHHQzUvSYQ5dL4NUkrnATX
	 s0iznwK98cW8R9Ll+TbIVOcGRYFmVX6BtoM5XjrgLjMxQc3qKLY8Jf92EhAFav4hC+
	 MS7ZRw7cWLg9FotPvnbdYjuaJ7uTDwxIhcVmcaCyfZ2GI7HLaLDv7fDj/zkNDqEdcx
	 ihG9tR/V1isusbNSsNSXoCr5RWd1a+3x1M3TXEAl9ZOqCj53KbWz5oZnNVp1NeG0af
	 3e+xowAe808Kn6LHg4/bPMhiliZTlJG/0V1wErXUCqqlCNEWEroYvnQaRnDgO6JGPf
	 nkKS33OG/4rqA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 08/15] ARC: migrate to the generic rule for built-in DTB
Date: Thu,  5 Sep 2024 08:47:44 +0900
Message-ID: <20240904234803.698424-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164835_219447_3B9B1CAE 
X-CRM114-Status: GOOD (  11.17  )
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

Select GENERIC_BUILTIN_DTB to use the generic rule to support built-in
DTB.

To keep consistency across architectures, this commit also renames
CONFIG_ARC_BUILTIN_DTB_NAME to CONFIG_BUILTIN_DTB_NAME.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arc/Kconfig                           | 7 ++++---
 arch/arc/Makefile                          | 3 ---
 arch/arc/boot/dts/Makefile                 | 9 +--------
 arch/arc/configs/axs101_defconfig          | 2 +-
 arch/arc/configs/axs103_defconfig          | 2 +-
 arch/arc/configs/axs103_smp_defconfig      | 2 +-
 arch/arc/configs/haps_hs_defconfig         | 2 +-
 arch/arc/configs/haps_hs_smp_defconfig     | 2 +-
 arch/arc/configs/hsdk_defconfig            | 2 +-
 arch/arc/configs/nsim_700_defconfig        | 2 +-
 arch/arc/configs/nsimosci_defconfig        | 2 +-
 arch/arc/configs/nsimosci_hs_defconfig     | 2 +-
 arch/arc/configs/nsimosci_hs_smp_defconfig | 2 +-
 arch/arc/configs/tb10x_defconfig           | 2 +-
 arch/arc/configs/vdk_hs38_defconfig        | 2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig    | 2 +-
 16 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index d01e69a29b69..11fe4f497571 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -16,6 +16,7 @@ config ARC
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select ARCH_32BIT_OFF_T
 	select BUILDTIME_TABLE_SORT
+	select GENERIC_BUILTIN_DTB
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select DMA_DIRECT_REMAP
@@ -549,11 +550,11 @@ config ARC_DBG_JUMP_LABEL
 	  part of static keys (jump labels) related code.
 endif
 
-config ARC_BUILTIN_DTB_NAME
+config BUILTIN_DTB_NAME
 	string "Built in DTB"
+	default "nsim_700"
 	help
-	  Set the name of the DTB to embed in the vmlinux binary
-	  Leaving it blank selects the "nsim_700" dtb.
+	  Set the name of the DTB to embed in the vmlinux binary.
 
 endmenu	 # "ARC Architecture Configuration"
 
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 2390dd042e36..deb830bdeaa0 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -82,9 +82,6 @@ KBUILD_CFLAGS	+= $(cflags-y)
 KBUILD_AFLAGS	+= $(KBUILD_CFLAGS)
 KBUILD_LDFLAGS	+= $(ldflags-y)
 
-# w/o this dtb won't embed into kernel binary
-core-y		+= arch/arc/boot/dts/
-
 core-y				+= arch/arc/plat-sim/
 core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
diff --git a/arch/arc/boot/dts/Makefile b/arch/arc/boot/dts/Makefile
index 48704dfdf75c..ee5664f0640d 100644
--- a/arch/arc/boot/dts/Makefile
+++ b/arch/arc/boot/dts/Makefile
@@ -1,13 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-# Built-in dtb
-builtindtb-y		:= nsim_700
 
-ifneq ($(CONFIG_ARC_BUILTIN_DTB_NAME),)
-	builtindtb-y	:= $(CONFIG_ARC_BUILTIN_DTB_NAME)
-endif
-
-obj-y   += $(builtindtb-y).dtb.o
-dtb-y := $(builtindtb-y).dtb
+dtb-y	:= $(addsuffix .dtb, $(CONFIG_BUILTIN_DTB_NAME))
 
 # for CONFIG_OF_ALL_DTBS test
 dtb-	:= $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 89720d6d7e0d..628d55057cde 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -23,7 +23,7 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARC_PLAT_AXS10X=y
 CONFIG_AXS101=y
 CONFIG_ARC_CACHE_LINE_SHIFT=5
-CONFIG_ARC_BUILTIN_DTB_NAME="axs101"
+CONFIG_BUILTIN_DTB_NAME="axs101"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 73ec01ed0492..7e4d4cbf1fb7 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -22,7 +22,7 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARC_PLAT_AXS10X=y
 CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
-CONFIG_ARC_BUILTIN_DTB_NAME="axs103"
+CONFIG_BUILTIN_DTB_NAME="axs103"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 4da0f626fa9d..764cbc781a7d 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -22,7 +22,7 @@ CONFIG_ARC_PLAT_AXS10X=y
 CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
-CONFIG_ARC_BUILTIN_DTB_NAME="axs103_idu"
+CONFIG_BUILTIN_DTB_NAME="axs103_idu"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
diff --git a/arch/arc/configs/haps_hs_defconfig b/arch/arc/configs/haps_hs_defconfig
index 8c3ed5d6e6c3..3a1577112078 100644
--- a/arch/arc/configs/haps_hs_defconfig
+++ b/arch/arc/configs/haps_hs_defconfig
@@ -14,7 +14,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_ARC_BUILTIN_DTB_NAME="haps_hs"
+CONFIG_BUILTIN_DTB_NAME="haps_hs"
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_COMPACTION is not set
diff --git a/arch/arc/configs/haps_hs_smp_defconfig b/arch/arc/configs/haps_hs_smp_defconfig
index 6fc98c1b9b36..a3cf940b1f5b 100644
--- a/arch/arc/configs/haps_hs_smp_defconfig
+++ b/arch/arc/configs/haps_hs_smp_defconfig
@@ -16,7 +16,7 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SMP=y
-CONFIG_ARC_BUILTIN_DTB_NAME="haps_hs_idu"
+CONFIG_BUILTIN_DTB_NAME="haps_hs_idu"
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 9e79154b5535..1558e8e87767 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -20,7 +20,7 @@ CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
 CONFIG_LINUX_LINK_BASE=0x90000000
 CONFIG_LINUX_RAM_BASE=0x80000000
-CONFIG_ARC_BUILTIN_DTB_NAME="hsdk"
+CONFIG_BUILTIN_DTB_NAME="hsdk"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index 51092c39e360..f8b3235d9a65 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -17,7 +17,7 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_ISA_ARCOMPACT=y
-CONFIG_ARC_BUILTIN_DTB_NAME="nsim_700"
+CONFIG_BUILTIN_DTB_NAME="nsim_700"
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
index 70c17bca4939..ee45dc0877fb 100644
--- a/arch/arc/configs/nsimosci_defconfig
+++ b/arch/arc/configs/nsimosci_defconfig
@@ -19,7 +19,7 @@ CONFIG_ISA_ARCOMPACT=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
-CONFIG_ARC_BUILTIN_DTB_NAME="nsimosci"
+CONFIG_BUILTIN_DTB_NAME="nsimosci"
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
index 59a3b6642fe7..e0a309970c20 100644
--- a/arch/arc/configs/nsimosci_hs_defconfig
+++ b/arch/arc/configs/nsimosci_hs_defconfig
@@ -19,7 +19,7 @@ CONFIG_KPROBES=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_ISA_ARCV2=y
-CONFIG_ARC_BUILTIN_DTB_NAME="nsimosci_hs"
+CONFIG_BUILTIN_DTB_NAME="nsimosci_hs"
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index 1419fc946a08..88325b8b49cf 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -16,7 +16,7 @@ CONFIG_MODULES=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
 # CONFIG_ARC_TIMERS_64BIT is not set
-CONFIG_ARC_BUILTIN_DTB_NAME="nsimosci_hs_idu"
+CONFIG_BUILTIN_DTB_NAME="nsimosci_hs_idu"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 1a68e4beebca..41a90e836e39 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -26,7 +26,7 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_ARC_PLAT_TB10X=y
 CONFIG_ARC_CACHE_LINE_SHIFT=5
 CONFIG_HZ=250
-CONFIG_ARC_BUILTIN_DTB_NAME="abilis_tb100_dvk"
+CONFIG_BUILTIN_DTB_NAME="abilis_tb100_dvk"
 CONFIG_PREEMPT_VOLUNTARY=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
diff --git a/arch/arc/configs/vdk_hs38_defconfig b/arch/arc/configs/vdk_hs38_defconfig
index 50c343913825..03d9ac20baa9 100644
--- a/arch/arc/configs/vdk_hs38_defconfig
+++ b/arch/arc/configs/vdk_hs38_defconfig
@@ -13,7 +13,7 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARC_PLAT_AXS10X=y
 CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
-CONFIG_ARC_BUILTIN_DTB_NAME="vdk_hs38"
+CONFIG_BUILTIN_DTB_NAME="vdk_hs38"
 CONFIG_PREEMPT=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index 6d9e1d9f71d2..c09488992f13 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -15,7 +15,7 @@ CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
 # CONFIG_ARC_TIMERS_64BIT is not set
-CONFIG_ARC_BUILTIN_DTB_NAME="vdk_hs38_smp"
+CONFIG_BUILTIN_DTB_NAME="vdk_hs38_smp"
 CONFIG_PREEMPT=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
