Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B375CD4F4A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+qXGpRV0wdOhaPds+QWkpd5uSQuiTdfaPfXwLQs3g4=; b=j9UqCMT1C25aue
	DfITyh5OtyZs36KAp8sSWgtpTWdjV+vVIh0U/x5X29RULCN5woicvAmcwewq/mNL2Xqsolcap6iNv
	n5uYKUPeti6uoQ2+ne9B5xHCYAc3zZ+iTlRXCc9XySkT1jQthz5+74iQpmuuSDeqNRtwYEY39h5Jc
	tNFQBH42zOVMX9KesbBKNbNs/WnNQw3Bd3KgtVochDHasnOYSoXRq5lArgSuyu28G5BFBRQFUoPdA
	lqJ5lXyb+7skAOn1EaXnb4m+fdTyrZ2WSDhYcNtaBIBOzUWwskXuLoU5y8G4H1dHWu4Y5XJHPPo55
	+/4l1Quw0kr8QCRQ9AkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzju-00000006Ovn-3vuO;
	Wed, 04 Sep 2024 23:48:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjt-00000006Ouz-0EAU
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE7E8A41447;
	Wed,  4 Sep 2024 23:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F7DC4CEC3;
	Wed,  4 Sep 2024 23:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493719;
	bh=Hx8xawNp6pSOR9yjQH6NLrBLbl8X/A3JIv5Jk19JmG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhjADhw3VFUuXUNrhgvaImjM65DClBDuU7++FngZwmnnBwfzzLtzQLZ9HdIkkfFB+
	 F7uTpm0Oo7qRXJCNGr5wMCZ1wwaB1/2P7v/RSgdP1GD9DKVuLi+OJRrc2TvfJMiS+G
	 dctbjGIh2kV+BJgqZTa2Hh1/saZNPzv/9X//xp7ANnEymaIThWdtqY0gsmbRjLlNpZ
	 /bRG/F4cMobP20RzhAYovofjxSuuCbIh50W/mi8KxeT1Mn/zj7E5iAd7wnzTYf5diH
	 4UIYVly2da5V/SeZsFWT5gI8Y7mrt4fnrXLFF9bK+qOB25LM4sbjc58enAkkdFmy2V
	 MWWgneAT1nyjA==
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
Subject: [PATCH 10/15] xtensa: migrate to the generic rule for built-in DTB
Date: Thu,  5 Sep 2024 08:47:46 +0900
Message-ID: <20240904234803.698424-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164841_249578_73A6588B 
X-CRM114-Status: GOOD (  10.40  )
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
CONFIG_BUILTIN_DTB_SOURCE to CONFIG_BUILTIN_DTB_NAME.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/xtensa/Kbuild                          | 2 +-
 arch/xtensa/Kconfig                         | 3 ++-
 arch/xtensa/boot/dts/Makefile               | 2 +-
 arch/xtensa/configs/audio_kc705_defconfig   | 2 +-
 arch/xtensa/configs/cadence_csp_defconfig   | 2 +-
 arch/xtensa/configs/generic_kc705_defconfig | 2 +-
 arch/xtensa/configs/nommu_kc705_defconfig   | 2 +-
 arch/xtensa/configs/smp_lx200_defconfig     | 2 +-
 arch/xtensa/configs/virt_defconfig          | 2 +-
 arch/xtensa/configs/xip_kc705_defconfig     | 2 +-
 10 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/xtensa/Kbuild b/arch/xtensa/Kbuild
index fd12f61745ba..015baeb765b9 100644
--- a/arch/xtensa/Kbuild
+++ b/arch/xtensa/Kbuild
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y += kernel/ mm/ platforms/ boot/dts/
+obj-y += kernel/ mm/ platforms/
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index f200a4ec044e..5fd1d248e147 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -19,6 +19,7 @@ config XTENSA
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_TABLE_SORT
+	select GENERIC_BUILTIN_DTB
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select DMA_NONCOHERENT_MMAP if MMU
@@ -461,7 +462,7 @@ config USE_OF
 	help
 	  Include support for flattened device tree machine descriptions.
 
-config BUILTIN_DTB_SOURCE
+config BUILTIN_DTB_NAME
 	string "DTB to build into the kernel image"
 	depends on OF
 
diff --git a/arch/xtensa/boot/dts/Makefile b/arch/xtensa/boot/dts/Makefile
index d6408c16d74e..7271294ce523 100644
--- a/arch/xtensa/boot/dts/Makefile
+++ b/arch/xtensa/boot/dts/Makefile
@@ -7,7 +7,7 @@
 #
 #
 
-obj-$(CONFIG_OF) += $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_SOURCE))
+dtb-$(CONFIG_OF) += $(addsuffix .dtb, $(CONFIG_BUILTIN_DTB_NAME))
 
 # for CONFIG_OF_ALL_DTBS test
 dtb-	:= $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
diff --git a/arch/xtensa/configs/audio_kc705_defconfig b/arch/xtensa/configs/audio_kc705_defconfig
index 436b7cac9694..f2af1a32c9c7 100644
--- a/arch/xtensa/configs/audio_kc705_defconfig
+++ b/arch/xtensa/configs/audio_kc705_defconfig
@@ -30,7 +30,7 @@ CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x38000000@0"
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB_SOURCE="kc705"
+CONFIG_BUILTIN_DTB_NAME="kc705"
 # CONFIG_COMPACTION is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_PM=y
diff --git a/arch/xtensa/configs/cadence_csp_defconfig b/arch/xtensa/configs/cadence_csp_defconfig
index 91c4c4cae8a7..5a272a278740 100644
--- a/arch/xtensa/configs/cadence_csp_defconfig
+++ b/arch/xtensa/configs/cadence_csp_defconfig
@@ -35,7 +35,7 @@ CONFIG_HIGHMEM=y
 # CONFIG_PCI is not set
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB_SOURCE="csp"
+CONFIG_BUILTIN_DTB_NAME="csp"
 # CONFIG_COMPACTION is not set
 CONFIG_XTFPGA_LCD=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
diff --git a/arch/xtensa/configs/generic_kc705_defconfig b/arch/xtensa/configs/generic_kc705_defconfig
index e376238bc5ca..4427907becca 100644
--- a/arch/xtensa/configs/generic_kc705_defconfig
+++ b/arch/xtensa/configs/generic_kc705_defconfig
@@ -29,7 +29,7 @@ CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x38000000@0"
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB_SOURCE="kc705"
+CONFIG_BUILTIN_DTB_NAME="kc705"
 # CONFIG_COMPACTION is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_NET=y
diff --git a/arch/xtensa/configs/nommu_kc705_defconfig b/arch/xtensa/configs/nommu_kc705_defconfig
index c2ab4306ee20..5828228522ba 100644
--- a/arch/xtensa/configs/nommu_kc705_defconfig
+++ b/arch/xtensa/configs/nommu_kc705_defconfig
@@ -36,7 +36,7 @@ CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0x9d050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=256M@0x60000000"
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB_SOURCE="kc705_nommu"
+CONFIG_BUILTIN_DTB_NAME="kc705_nommu"
 CONFIG_BINFMT_FLAT=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/xtensa/configs/smp_lx200_defconfig b/arch/xtensa/configs/smp_lx200_defconfig
index 63b56ce79f83..326966ca7831 100644
--- a/arch/xtensa/configs/smp_lx200_defconfig
+++ b/arch/xtensa/configs/smp_lx200_defconfig
@@ -33,7 +33,7 @@ CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=96M@0"
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB_SOURCE="lx200mx"
+CONFIG_BUILTIN_DTB_NAME="lx200mx"
 # CONFIG_COMPACTION is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_NET=y
diff --git a/arch/xtensa/configs/virt_defconfig b/arch/xtensa/configs/virt_defconfig
index 98acb7191cb7..e37048985b47 100644
--- a/arch/xtensa/configs/virt_defconfig
+++ b/arch/xtensa/configs/virt_defconfig
@@ -24,7 +24,7 @@ CONFIG_HIGHMEM=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x80000000@0"
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB_SOURCE="virt"
+CONFIG_BUILTIN_DTB_NAME="virt"
 # CONFIG_PARSE_BOOTPARAM is not set
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
diff --git a/arch/xtensa/configs/xip_kc705_defconfig b/arch/xtensa/configs/xip_kc705_defconfig
index 165652c45b85..ee47438f9b51 100644
--- a/arch/xtensa/configs/xip_kc705_defconfig
+++ b/arch/xtensa/configs/xip_kc705_defconfig
@@ -29,7 +29,7 @@ CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x38000000@0"
 CONFIG_USE_OF=y
-CONFIG_BUILTIN_DTB_SOURCE="kc705"
+CONFIG_BUILTIN_DTB_NAME="kc705"
 # CONFIG_PARSE_BOOTPARAM is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_COMPACTION is not set
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
