Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724BBCD4F4C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJeEZHE6GTnUdFK1jUrd5XyHvz3f8L1ooSneqtmchhg=; b=x5RdicCHxB+6mn
	NebjaYtt1bOkopCtG6UACOOYWroRDznhcGZJN9iRXWcgz76xgZlt3XsNLcsdZyPZuArIefg8VWnvP
	jtwWA6yd6b/hUm9ubK7f9xXk8GzLRQ8rV1d/CE3gHnUmw9i9R5BGZ6x3x9iGtGbGWc3PwhLiPy0/O
	TcGIIeuCZVkph8IFoSg6bhQeB/t/Pl2Sb58Og2C3HgUhV0Snp0r9+b3XT2SImnDR/HFueyy63TBqB
	ArCK64Jq4URX+MzpemDJ6Ic/uybc/PwIj1Pj7fMsvBwqCPJ/UiTPoSZPzqd66SLf7jjqvoHF4OSGQ
	LCRuTvpnAC3X1s9XapDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjf-00000006OoN-0f8X;
	Wed, 04 Sep 2024 23:48:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjc-00000006Omk-13jG
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4245F5C5795;
	Wed,  4 Sep 2024 23:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6CDC4CEC2;
	Wed,  4 Sep 2024 23:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493703;
	bh=nsKwaA1C+DPeHbXqGcBjvOLIHgXiFg4rrFKZpG8IZuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X36dfIG0wtcgWQzkkeDHpAyyy7pGPLtXcd3jbuFGMOXbrfAVNzUobsJqzX/p+sC0Q
	 AbUbU4aws5JbrmphPMcCQ7MYHbG4F4boFFsW+/e/i+qXTMSUjRU4T5aczjlIxJ5Pw4
	 t34G6/LKKvTJvVADNXak2AQF8cQK4NlwOLTxdGz+AhrhppnCiWJ4jsI7ZxQQNvw7fD
	 gAsnyHevuSc63Bwbr0Q/VSIwdAKzcjAeU6dX84uJhzAfhzlTAXAzhg/p7+CklJ0Utp
	 R+UYNm9msmK+XOypnjCuSyfhyqmTPDq2PfN6hPFsL9cn097TWpteabOhfpjZyRNBaf
	 B8Fg46ryR3CeQ==
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
Subject: [PATCH 04/15] kbuild: add generic support for built-in boot DTBs
Date: Thu,  5 Sep 2024 08:47:40 +0900
Message-ID: <20240904234803.698424-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164824_405584_EF735585 
X-CRM114-Status: GOOD (  17.88  )
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

Some architectures embed boot DTBs in vmlinux. A potential issue for
these architectures is a race condition during parallel builds because
Kbuild descends into arch/*/boot/dts/ twice.

One build thread is initiated by the 'dtbs' target, which is a
prerequisite of the 'all' target in the top-level Makefile:

  ifdef CONFIG_OF_EARLY_FLATTREE
  all: dtbs
  endif

For architectures that support the embedded boot dtb, arch/*/boot/dts/
is visited also during the ordinary directory traversal in order to
build obj-y objects that wrap DTBs.

Since these build threads are unaware of each other, they can run
simultaneously during parallel builds.

This commit introduces a generic build rule to scripts/Makefile.vmlinux
to support embedded boot DTBs in a race-free way. Architectures that
want to use this rule need to select CONFIG_GENERIC_BUILTIN_DTB.

After the migration, Makefiles under arch/*/boot/dts/ will be visited
only once to build only *.dtb files.

This change also aims to unify the CONFIG options used for embedded DTBs
support. Currently, different architectures use different CONFIG options
for the same purposes.

The CONFIG options are unified as follows:

 - CONFIG_GENERIC_BUILTIN_DTB

   This enables the generic rule for embedded boot DTBs. This will be
   renamed to CONFIG_BUILTIN_DTB after all architectures migrate to the
   generic rule.

 - CONFIG_BUILTIN_DTB_NAME

   This specifies the path to the embedded DTB.
   (relative to arch/*/boot/dts/)

 - CONFIG_BUILTIN_DTB_ALL

   If this is enabled, all DTB files compiled under arch/*/boot/dts/ are
   embedded into vmlinux. Only used by MIPS.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 |  7 ++++++-
 drivers/of/Kconfig       |  6 ++++++
 scripts/Makefile.vmlinux | 44 ++++++++++++++++++++++++++++++++++++++++
 scripts/link-vmlinux.sh  |  4 ++++
 4 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 145112bf281a..1c765c12ab9e 100644
--- a/Makefile
+++ b/Makefile
@@ -1417,6 +1417,10 @@ ifdef CONFIG_OF_EARLY_FLATTREE
 all: dtbs
 endif
 
+ifdef CONFIG_GENERIC_BUILTIN_DTB
+vmlinux: dtbs
+endif
+
 endif
 
 PHONY += scripts_dtc
@@ -1483,7 +1487,8 @@ endif # CONFIG_MODULES
 CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
 	       compile_commands.json rust/test \
-	       rust-project.json .vmlinux.objs .vmlinux.export.c
+	       rust-project.json .vmlinux.objs .vmlinux.export.c \
+               .builtin-dtbs-list .builtin-dtb.S
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index dd726c7056bf..5142e7d7fef8 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -2,6 +2,12 @@
 config DTC
 	bool
 
+config GENERIC_BUILTIN_DTB
+	bool
+
+config BUILTIN_DTB_ALL
+	bool
+
 menuconfig OF
 	bool "Device Tree and Open Firmware support"
 	help
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 5ceecbed31eb..4626b472da49 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -17,6 +17,50 @@ quiet_cmd_cc_o_c = CC      $@
 %.o: %.c FORCE
 	$(call if_changed_dep,cc_o_c)
 
+quiet_cmd_as_o_S = AS      $@
+      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
+
+%.o: %.S FORCE
+	$(call if_changed_dep,as_o_S)
+
+# Built-in dtb
+# ---------------------------------------------------------------------------
+
+quiet_cmd_wrap_dtbs = WRAP    $@
+      cmd_wrap_dtbs = {							\
+	echo '\#include <asm-generic/vmlinux.lds.h>';			\
+	echo '.section .dtb.init.rodata,"a"';				\
+	while read dtb; do						\
+		symbase=__dtb_$$(basename -s .dtb "$${dtb}" | tr - _);	\
+		echo '.balign STRUCT_ALIGNMENT';			\
+		echo ".global $${symbase}_begin";			\
+		echo "$${symbase}_begin:";				\
+		echo '.incbin "'$$dtb'" ';				\
+		echo ".global $${symbase}_end";				\
+		echo "$${symbase}_end:";				\
+	done < $<;							\
+	} > $@
+
+.builtin-dtbs.S: .builtin-dtbs-list FORCE
+	$(call if_changed,wrap_dtbs)
+
+quiet_cmd_gen_dtbs_list = GEN     $@
+      cmd_gen_dtbs_list = \
+	$(if $(CONFIG_BUILTIN_DTB_NAME), echo "arch/$(SRCARCH)/boot/dts/$(CONFIG_BUILTIN_DTB_NAME).dtb",:) > $@
+
+.builtin-dtbs-list: arch/$(SRCARCH)/boot/dts/dtbs-list FORCE
+	$(call if_changed,$(if $(CONFIG_BUILTIN_DTB_ALL),copy,gen_dtbs_list))
+
+targets += .builtin-dtbs-list
+
+ifdef CONFIG_GENERIC_BUILTIN_DTB
+targets += .builtin-dtbs.S .builtin-dtbs.o
+vmlinux: .builtin-dtbs.o
+endif
+
+# vmlinux
+# ---------------------------------------------------------------------------
+
 ifdef CONFIG_MODULES
 targets += .vmlinux.export.o
 vmlinux: .vmlinux.export.o
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c27b4e969f20..bd196944e350 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -68,6 +68,10 @@ vmlinux_link()
 		libs="${KBUILD_VMLINUX_LIBS}"
 	fi
 
+	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
+		objs="${objs} .builtin-dtbs.o"
+	fi
+
 	if is_enabled CONFIG_MODULES; then
 		objs="${objs} .vmlinux.export.o"
 	fi
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
