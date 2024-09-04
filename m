Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB56CD4F4C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mL8p5JqSYaR1U31dtGBTk8FUkcxnG+xi0P11lbSbME=; b=4lnwCta0WM4sMq
	33rpQQkkd1B4fstqvpnOxjphfhaMyX/Vr1keKN74lfxtpyvC2VAOj/AIg8neNb0NJFQ4OCJUCjNbI
	hGFrd7wVselt6Qn5oPlDsY0WuJj7hXzKFGiRtEUflzQskBMidZACIqUB5QcCrTrEd37ITFnGV0CfG
	ozYjMiOzLp55E0Bih4o3dHHkxG6wZ+dPI9+o1lxaaqag5E2VeBfBTG9tQkLGQZU7gngcFDylFkJZk
	tSmu03ZYqCMAkcpPcGf+pDRyNArteurBbJx8A/+kH5/cY7bNwvZHFF2WKIq5hOdc4SCMCbhnZUZU6
	Ar6zT2QuLXw5bcAKVHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzji-00000006Oq2-2WfG;
	Wed, 04 Sep 2024 23:48:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjf-00000006Oo0-0l9V
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BD5E5C5925;
	Wed,  4 Sep 2024 23:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CAF6C4CEC3;
	Wed,  4 Sep 2024 23:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493706;
	bh=DmABIXiqMlKjw8vipv0+VS4xuXqSDmbddSZqsqM36bM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BqTwTwVUZAur7/lg6dVvjAba6rF+NIKCS18IWBXb15+i1RLEpZJqVGotXHZD/Kph2
	 rfGFjbDa7oCFYwXWzp+WsRUXfNd7/a/eaMn8FHX3+Uo608D+NiB0yHuhG25DV0sjzt
	 zj1TswqP2EkTIfZHwtC0OAJIokeP6d7dvhs5tenp+SawsbA7SdVrwh2aQAtp0XETDT
	 AYYVARz8k1MQ3tDHM+Grlq3oBrmS5NVWn5t5VIApa0e9eOcGLpDzhjRpWcyo0KQ7e4
	 oRZHiEYui/jbhI/h0WPFvxZ4/0OMF9D7BJF1drBmVjszV65kgm284tO+Zzh80HV5KF
	 vmwblpvwGdtaA==
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
Subject: [PATCH 05/15] MIPS: migrate to generic rule for built-in DTBs
Date: Thu,  5 Sep 2024 08:47:41 +0900
Message-ID: <20240904234803.698424-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164827_415902_57A82F6F 
X-CRM114-Status: UNSURE (   9.82  )
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

Select GENERIC_BUILTIN_DTB and BUILTIN_DTB_ALL when built-in DTB
support is enabled.

DTBs compiled under arch/mips/boot/dts/ will be wrapped and compiled
in scripts/Makefile.vmlinux.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/Kconfig                         | 2 ++
 arch/mips/Makefile                        | 3 ---
 arch/mips/boot/dts/Makefile               | 2 --
 arch/mips/boot/dts/brcm/Makefile          | 2 --
 arch/mips/boot/dts/cavium-octeon/Makefile | 2 --
 arch/mips/boot/dts/ingenic/Makefile       | 2 --
 arch/mips/boot/dts/lantiq/Makefile        | 2 --
 arch/mips/boot/dts/loongson/Makefile      | 2 --
 arch/mips/boot/dts/mscc/Makefile          | 3 ---
 arch/mips/boot/dts/mti/Makefile           | 2 --
 arch/mips/boot/dts/pic32/Makefile         | 2 --
 arch/mips/boot/dts/ralink/Makefile        | 2 --
 12 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 60077e576935..7bfe3fd011f4 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -28,10 +28,12 @@ config MIPS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select BUILDTIME_TABLE_SORT
+	select BUILTIN_DTB_ALL if BUILTIN_DTB
 	select CLONE_BACKWARDS
 	select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
 	select CPU_PM if CPU_IDLE || SUSPEND
 	select GENERIC_ATOMIC64 if !64BIT
+	select GENERIC_BUILTIN_DTB if BUILTIN_DTB
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_GETTIMEOFDAY
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 5785a3d5ccfb..be8cb44a89fd 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -423,9 +423,6 @@ endif
 
 CLEAN_FILES += vmlinux.32 vmlinux.64
 
-# device-trees
-core-y += arch/mips/boot/dts/
-
 archprepare:
 ifdef CONFIG_MIPS32_N32
 	@$(kecho) '  Checking missing-syscalls for N32'
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index e2476b12bb0c..ff468439a8c4 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -16,5 +16,3 @@ subdir-$(CONFIG_ATH79)			+= qca
 subdir-$(CONFIG_RALINK)			+= ralink
 subdir-$(CONFIG_MACH_REALTEK_RTL)	+= realtek
 subdir-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= xilfpga
-
-obj-$(CONFIG_BUILTIN_DTB)	:= $(addsuffix /, $(subdir-y))
diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm/Makefile
index d85f446cc0ce..1798209697c6 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -33,5 +33,3 @@ dtb-$(CONFIG_DT_NONE) += \
 	bcm97420c.dtb \
 	bcm97425svmb.dtb \
 	bcm97435svmb.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/cavium-octeon/Makefile b/arch/mips/boot/dts/cavium-octeon/Makefile
index 17aef35f311b..48085bca666c 100644
--- a/arch/mips/boot/dts/cavium-octeon/Makefile
+++ b/arch/mips/boot/dts/cavium-octeon/Makefile
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_CAVIUM_OCTEON_SOC)	+= octeon_3xxx.dtb octeon_68xx.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/ingenic/Makefile b/arch/mips/boot/dts/ingenic/Makefile
index 54aa0c4e6091..6e674f1a3aa3 100644
--- a/arch/mips/boot/dts/ingenic/Makefile
+++ b/arch/mips/boot/dts/ingenic/Makefile
@@ -5,5 +5,3 @@ dtb-$(CONFIG_JZ4770_GCW0)	+= gcw0.dtb
 dtb-$(CONFIG_JZ4780_CI20)	+= ci20.dtb
 dtb-$(CONFIG_X1000_CU1000_NEO)	+= cu1000-neo.dtb
 dtb-$(CONFIG_X1830_CU1830_NEO)	+= cu1830-neo.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/lantiq/Makefile b/arch/mips/boot/dts/lantiq/Makefile
index ae6e3e21ebeb..d8531b4653c0 100644
--- a/arch/mips/boot/dts/lantiq/Makefile
+++ b/arch/mips/boot/dts/lantiq/Makefile
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_DT_EASY50712)	+= danube_easy50712.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 5c6433e441ee..5e3ab984d70f 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -5,5 +5,3 @@ dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_rs780e.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_8core_rs780e.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64g_4core_ls7a.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64v_4core_virtio.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/mscc/Makefile b/arch/mips/boot/dts/mscc/Makefile
index eeb6b7aae83b..566dbec3c7fb 100644
--- a/arch/mips/boot/dts/mscc/Makefile
+++ b/arch/mips/boot/dts/mscc/Makefile
@@ -8,6 +8,3 @@ dtb-$(CONFIG_SOC_VCOREIII)	+= \
 	ocelot_pcb123.dtb \
 	serval_pcb105.dtb \
 	serval_pcb106.dtb
-
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/mti/Makefile b/arch/mips/boot/dts/mti/Makefile
index b5f7426998b1..c1c7b27296dd 100644
--- a/arch/mips/boot/dts/mti/Makefile
+++ b/arch/mips/boot/dts/mti/Makefile
@@ -1,5 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_MIPS_MALTA)	+= malta.dtb
 dtb-$(CONFIG_LEGACY_BOARD_SEAD3)	+= sead3.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/pic32/Makefile b/arch/mips/boot/dts/pic32/Makefile
index fb57f36324db..4069cda2370c 100644
--- a/arch/mips/boot/dts/pic32/Makefile
+++ b/arch/mips/boot/dts/pic32/Makefile
@@ -3,5 +3,3 @@ dtb-$(CONFIG_DTB_PIC32_MZDA_SK)		+= pic32mzda_sk.dtb
 
 dtb-$(CONFIG_DTB_PIC32_NONE)		+= \
 					pic32mzda_sk.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ralink/Makefile
index d27d7e8c700f..dc002152d843 100644
--- a/arch/mips/boot/dts/ralink/Makefile
+++ b/arch/mips/boot/dts/ralink/Makefile
@@ -10,5 +10,3 @@ dtb-$(CONFIG_SOC_MT7621) += \
 	mt7621-gnubee-gb-pc1.dtb \
 	mt7621-gnubee-gb-pc2.dtb \
 	mt7621-tplink-hc220-g5-v1.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
