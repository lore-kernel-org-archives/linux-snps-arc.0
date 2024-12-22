Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AD1E7718B
	for <linux-snps-arc@archiver.kernel.org>; Sun, 22 Dec 2024 00:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ARxZdnR5xOFTd4rUNCFJNV/d5Z+XK7oKmgZFblWafIQ=; b=awv9jr7cIHB4zA
	v93u3QR9ersnoK64tx/Y3gJ5zJlfZiYomro2MnrGPhTs/NS9aqwbvLyn3yGYw7UZt1Gyzqbs8+kG2
	cEA/MZ5cZOvIKu7ByQTh0WQD9u0KfO1j9TE4aYPC+yQe7Pbwa3e95fHrah9Toy3UQUxtaZJBl8XXz
	IqPwwkB+m3UQmbKgiXi/d0TjtUciMVFRmULjyfyqkNWteF5CQ3aul/qbVD0SkX7WuH5HnFRaxJZCZ
	5p5LQJQIs1vexfl4LRgQ+ijZg84f3L8K+GhixWCGp0HkfHtVZwTuc12ruE5rdlm9Od1khk7Weof1z
	qsyi0gfhtj3OeCgoKgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP9cv-00000007aJi-1BaV;
	Sun, 22 Dec 2024 00:15:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP9cs-00000007aJD-3KYH
	for linux-snps-arc@lists.infradead.org;
	Sun, 22 Dec 2024 00:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C6265C544C
	for <linux-snps-arc@lists.infradead.org>; Sun, 22 Dec 2024 00:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DBAC4CECE;
	Sun, 22 Dec 2024 00:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734826517;
	bh=0iQTKd5JEjZsKA3zgDFFlD61wYpnRy7e9Qv97bTuGsA=;
	h=From:To:Cc:Subject:Date:From;
	b=hQKWq18AJZrLfeNBeSnLDrVn1oCfLDEpSWTuhRFxzalrjg5UpLzG3mzE9YviR8kJu
	 DxmmkHnQGzPbi3ObejiJe4mMkyGdD/15vks661jFJxuIlKbMtNVsG1QQ8mNUyKCQ5T
	 EFNboH2GlmkFIgOETkvMYSOzbO0cA9gwlrgx1rthQAdPyPqiRsrvxEpGarUraVrEWx
	 FbQ5/nDn1uxl2f6usQNnrXbwpNH+dcXJLI+UUFUR/mlXehQizwk0NfhLP8RrDn/St0
	 cgzQabRVWzMoubmADOP277T0kEcC/UX9dsTOeU1/8NVIAmFgXgfxiW48QHwImFJuKM
	 AqfUlRzRQ3QjA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARC: migrate to the generic rule for built-in DTB
Date: Sun, 22 Dec 2024 09:15:00 +0900
Message-ID: <20241222001505.2579630-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_161518_933253_354589FD 
X-CRM114-Status: GOOD (  11.13  )
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

Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
DTBs") introduced generic support for built-in DTBs.

Select GENERIC_BUILTIN_DTB to use the generic rule.

To keep consistency across architectures, this commit also renames
CONFIG_ARC_BUILTIN_DTB_NAME to CONFIG_BUILTIN_DTB_NAME.

Now, "nsim_700" is the default value for CONFIG_BUILTIN_DTB_NAME, rather
than a fallback in case it is empty.

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
index ea5a1dcb133b..0cd2261d3e3c 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -17,6 +17,7 @@ config ARC
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select ARCH_32BIT_OFF_T
 	select BUILDTIME_TABLE_SORT
+	select GENERIC_BUILTIN_DTB
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select DMA_DIRECT_REMAP
@@ -550,11 +551,11 @@ config ARC_DBG_JUMP_LABEL
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
index fb98478ed1ab..0c5e6e6314f2 100644
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
index 319bbe270322..a7cd526dd7ca 100644
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
index 8c1f1a111a17..afa6a348f444 100644
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
index 75cab9f25b5b..2bfa6371953c 100644
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
index 5aba3d850fa2..865fbc19ef03 100644
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
