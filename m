Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D78CD4F4A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4I1/2V8mKNhWKnhp1onHHyt0Ry8QhyxtooKN1JGhCms=; b=o+7+SAI7nC/PlM
	onbuHIsILNplW+G6cklV1Rv8uupZx0a1b0CiXuPR9D0usIQY2kAroTXpVeJun4kdnKqN79+/TyuOU
	enhSYw44ipe2GqAsLP1debM2yO5aYQ0LzWq+pRgFP4GqI7mv8fJ2gP0A5uio6jKCrJTb5Oe3g7Aqo
	YzS+YCNL8XV114VVP/QSbnorICSEqF93/zk5rGvclz+DZRopStmttR7GtdResocgQ8Ky83VkburNU
	u79Fs1NuYt8N9jALA5EZvVlA4Kpy7Xv+jmnYFA/NSiYtEoCdcT8Hbz8kxqp7W3rwDHBM7CmMQ0395
	ZZrAFS4/bU4VauCp3+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjk-00000006Or5-0kc1;
	Wed, 04 Sep 2024 23:48:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzji-00000006OpR-02ji
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92928A41447;
	Wed,  4 Sep 2024 23:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA160C4CEC8;
	Wed,  4 Sep 2024 23:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493708;
	bh=noGT1ZHWVvDifWSIT0Eu3Rma90rEgb9C4Og/0AUftIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j4lhfs4t+UdLx9riX5cE4Q8MyzmjqxpJFDc864wC5f5TcmLpFzAEv6WHpE+kCfpAX
	 WU87cUrvtiPAIhPMsh3V5scl3LoUzjqi/q2+WqFKk5XNPpr79Ka4bhrbFxjCVz2qOE
	 DsBQ/C+NU2n0mkpTuStdf3otDGdANW4zGeGVAlLIchZ1PajkhqrhV7omoSuUt7NXik
	 wDkKHAin1YxoeSnae66K/834K+DwuU1IhhUmnTMmMcUIu0Z6cI8XrqsHqgxtdPLaF/
	 vHn4Ww3U8GMhKc6u13LeaqzoMLGzbbfqN9NFGThT3ewhi91UJxrepqLnE8PTKdyPCA
	 LVnZ3mOt2UktQ==
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
Subject: [PATCH 06/15] riscv: migrate to the generic rule for built-in DTB
Date: Thu,  5 Sep 2024 08:47:42 +0900
Message-ID: <20240904234803.698424-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164830_196296_BDD87251 
X-CRM114-Status: GOOD (  11.67  )
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

Select GENERIC_BUILTIN_DTB when built-in DTB support is enabled.

To keep consistency across architectures, this commit also renames
CONFIG_BUILTIN_DTB_SOURCE to CONFIG_BUILTIN_DTB_NAME.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/Kbuild                              | 1 -
 arch/riscv/Kconfig                             | 3 ++-
 arch/riscv/boot/dts/Makefile                   | 2 --
 arch/riscv/configs/nommu_k210_defconfig        | 2 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 2 +-
 5 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index 2c585f7a0b6e..126fb738fc44 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-y += kernel/ mm/ net/
-obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 obj-$(CONFIG_CRYPTO) += crypto/
 obj-y += errata/
 obj-$(CONFIG_KVM) += kvm/
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..019c64ef0826 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1110,13 +1110,14 @@ config RISCV_ISA_FALLBACK
 config BUILTIN_DTB
 	bool "Built-in device tree"
 	depends on OF && NONPORTABLE
+	select GENERIC_BUILTIN_DTB
 	help
 	  Build a device tree into the Linux image.
 	  This option should be selected if no bootloader is being used.
 	  If unsure, say N.
 
 
-config BUILTIN_DTB_SOURCE
+config BUILTIN_DTB_NAME
 	string "Built-in device tree source"
 	depends on BUILTIN_DTB
 	help
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index fdae05bbf556..b09678f9badc 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -7,5 +7,3 @@ subdir-y += sifive
 subdir-y += sophgo
 subdir-y += starfive
 subdir-y += thead
-
-obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_SOURCE))
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index af9601da4643..41a025f927ba 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -35,7 +35,7 @@ CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_BUILTIN_DTB=y
-CONFIG_BUILTIN_DTB_SOURCE="canaan/k210_generic"
+CONFIG_BUILTIN_DTB_NAME="canaan/k210_generic"
 # CONFIG_SECCOMP is not set
 # CONFIG_STACKPROTECTOR is not set
 # CONFIG_GCC_PLUGINS is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index dd460c649152..ab4b22f1c91a 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -27,7 +27,7 @@ CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0 root=/dev/mmcblk0p1 rootwait ro"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_BUILTIN_DTB=y
-CONFIG_BUILTIN_DTB_SOURCE="canaan/k210_generic"
+CONFIG_BUILTIN_DTB_NAME="canaan/k210_generic"
 # CONFIG_SECCOMP is not set
 # CONFIG_STACKPROTECTOR is not set
 # CONFIG_GCC_PLUGINS is not set
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
