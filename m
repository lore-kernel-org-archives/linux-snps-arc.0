Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7BBCD4F4C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ak7Lmm8u4WkFCaUZ4DeSp3WhikvDqGkcr0Uo7m28JdI=; b=wzQaKbUonPSgxL
	V32fRdLuAnvlOe8el9Bd/uMr709v7I+ltFQv/LE+IMGjyAUC63ritZ15ZfuugePg1HP5B+S6hrAOA
	sVA6KXJWIxDBu4KDzygY4A5acqdj+MVKjkejqd9l5LEdkrUtgyoQk/gLbJzSt82kJ4uO1wXa6SsNB
	ws1PHR3/kRKnkQ0/deW6jZzxjIhbOtMbvLyPVAlnx9o1pxK9cp9bryyxlguBIAAzo/fbJSFmW2xo5
	e2BxrklxhfSG1aKzlCymuVkUMum1n0FT/VJxCZ6G+lRbiZD9IZEueyHKX8JfXwwPVaBQ+Ek/GvDsI
	n7WBTvmsbCSbkkz85hsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzk7-00000006P2N-3jJe;
	Wed, 04 Sep 2024 23:48:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzk4-00000006P0q-0Nmm
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC05EA41DF8;
	Wed,  4 Sep 2024 23:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995DCC4CEC2;
	Wed,  4 Sep 2024 23:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493730;
	bh=x/Z3v/XK8I1GQANjHhGyOrIDt9xA5TgiJymmIsAjDIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ut0wdZvaJ5RnzqF8X1miesh8kLVoi7K3jVSurqYm2TVdvsx8tDFw/RM8/7O8OzTgU
	 PRwadz+gHFXUGCetAKgR4ILvVeDua8hhV9gwnG1qDGpkMNq7ujfN8W91Ntb+fkXF79
	 ncidnVMVZ8GXjZoURXitQ53eTXWn89MdvYuWkJeoiRnd/IB3IjG26GAxfc2PI44jQI
	 tc9zKtxHjFMd/se+jORyMsG4HlFEDdVqJiyUUWPEUDpqJEARbP7eFMuUHjlAnKFdGF
	 8FZoMpEvyWTX0KyzfI7Dwxxi+sdd3P2aF9qpmpiz2qm5zKNioy7u7zKOPbAJUynlgT
	 GLKV8rfrLwF3g==
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
Subject: [PATCH 14/15] kbuild: rename CONFIG_GENERIC_BUILTIN_DTB to CONFIG_BUILTIN_DTB
Date: Thu,  5 Sep 2024 08:47:50 +0900
Message-ID: <20240904234803.698424-15-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164852_287898_1392FF69 
X-CRM114-Status: GOOD (  13.35  )
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

Now that all architectures have migrated to the generic built-in
DTB support, the GENERIC_ prefix is no longer necessary.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                             | 2 +-
 arch/arc/Kconfig                     | 2 +-
 arch/loongarch/Kconfig               | 1 -
 arch/microblaze/Kconfig              | 2 +-
 arch/mips/Kconfig                    | 1 -
 arch/nios2/platform/Kconfig.platform | 1 -
 arch/openrisc/Kconfig                | 2 +-
 arch/riscv/Kconfig                   | 1 -
 arch/sh/Kconfig                      | 1 -
 arch/xtensa/Kconfig                  | 2 +-
 drivers/of/Kconfig                   | 2 +-
 scripts/Makefile.vmlinux             | 2 +-
 scripts/link-vmlinux.sh              | 2 +-
 13 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 1c765c12ab9e..a83edbdbc79c 100644
--- a/Makefile
+++ b/Makefile
@@ -1417,7 +1417,7 @@ ifdef CONFIG_OF_EARLY_FLATTREE
 all: dtbs
 endif
 
-ifdef CONFIG_GENERIC_BUILTIN_DTB
+ifdef CONFIG_BUILTIN_DTB
 vmlinux: dtbs
 endif
 
diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 11fe4f497571..05fed3cd8b29 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -16,7 +16,7 @@ config ARC
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select ARCH_32BIT_OFF_T
 	select BUILDTIME_TABLE_SORT
-	select GENERIC_BUILTIN_DTB
+	select BUILTIN_DTB
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select DMA_DIRECT_REMAP
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e1d3e5fb6fd2..70f169210b52 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -388,7 +388,6 @@ endchoice
 config BUILTIN_DTB
 	bool "Enable built-in dtb in kernel"
 	depends on OF
-	select GENERIC_BUILTIN_DTB
 	help
 	  Some existing systems do not provide a canonical device tree to
 	  the kernel at boot time. Let's provide a device tree table in the
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 4ed8ca89f0c9..e1a3b5f4d97e 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -10,7 +10,7 @@ config MICROBLAZE
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_TABLE_SORT
-	select GENERIC_BUILTIN_DTB
+	select BUILTIN_DTB
 	select TIMER_OF
 	select CLONE_BACKWARDS3
 	select COMMON_CLK
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 7bfe3fd011f4..fda96e4f2187 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -33,7 +33,6 @@ config MIPS
 	select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
 	select CPU_PM if CPU_IDLE || SUSPEND
 	select GENERIC_ATOMIC64 if !64BIT
-	select GENERIC_BUILTIN_DTB if BUILTIN_DTB
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_GETTIMEOFDAY
diff --git a/arch/nios2/platform/Kconfig.platform b/arch/nios2/platform/Kconfig.platform
index c75cadd92388..5f0cf551b5ca 100644
--- a/arch/nios2/platform/Kconfig.platform
+++ b/arch/nios2/platform/Kconfig.platform
@@ -38,7 +38,6 @@ config NIOS2_DTB_PHYS_ADDR
 config BUILTIN_DTB
 	bool "Compile and link device tree into kernel image"
 	depends on !COMPILE_TEST
-	select GENERIC_BUILTIN_DTB
 	help
 	  This allows you to specify a dts (device tree source) file
 	  which will be compiled and linked into the kernel image.
diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 11ffcf33652c..f55e66be4112 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -10,7 +10,7 @@ config OPENRISC
 	select ARCH_HAS_DMA_SET_UNCACHED
 	select ARCH_HAS_DMA_CLEAR_UNCACHED
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
-	select GENERIC_BUILTIN_DTB
+	select BUILTIN_DTB
 	select COMMON_CLK
 	select OF
 	select OF_EARLY_FLATTREE
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 019c64ef0826..a63b66b32636 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1110,7 +1110,6 @@ config RISCV_ISA_FALLBACK
 config BUILTIN_DTB
 	bool "Built-in device tree"
 	depends on OF && NONPORTABLE
-	select GENERIC_BUILTIN_DTB
 	help
 	  Build a device tree into the Linux image.
 	  This option should be selected if no bootloader is being used.
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 3b772378773f..b09019cd87d4 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -648,7 +648,6 @@ config BUILTIN_DTB
 	bool "Use builtin DTB"
 	default n
 	depends on SH_DEVICE_TREE
-	select GENERIC_BUILTIN_DTB
 	help
 	  Link a device tree blob for particular hardware into the kernel,
 	  suppressing use of the DTB pointer provided by the bootloader.
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 5fd1d248e147..cccfacb5848d 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -19,7 +19,7 @@ config XTENSA
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_TABLE_SORT
-	select GENERIC_BUILTIN_DTB
+	select BUILTIN_DTB
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select DMA_NONCOHERENT_MMAP if MMU
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 5142e7d7fef8..53a227ca3a3c 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -2,7 +2,7 @@
 config DTC
 	bool
 
-config GENERIC_BUILTIN_DTB
+config BUILTIN_DTB
 	bool
 
 config BUILTIN_DTB_ALL
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 4626b472da49..677fc5a4e8c1 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -53,7 +53,7 @@ quiet_cmd_gen_dtbs_list = GEN     $@
 
 targets += .builtin-dtbs-list
 
-ifdef CONFIG_GENERIC_BUILTIN_DTB
+ifdef CONFIG_BUILTIN_DTB
 targets += .builtin-dtbs.S .builtin-dtbs.o
 vmlinux: .builtin-dtbs.o
 endif
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index bd196944e350..c58dc9d86e2d 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -68,7 +68,7 @@ vmlinux_link()
 		libs="${KBUILD_VMLINUX_LIBS}"
 	fi
 
-	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
+	if is_enabled CONFIG_BUILTIN_DTB; then
 		objs="${objs} .builtin-dtbs.o"
 	fi
 
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
