Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B03CD4F4C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5NfXOdWmYX8iI9aQ75jIZUKzV5zCtw4TA0Wv8Jpzy4=; b=DEWjLA2OQqjnCd
	YhuhGCxUdpznXMuono8A7634SgFz9Id8Sw0FHs8YqQDlVI+N0zRskdOZgadE8Puhl1g5JifE3hEU8
	xgzs3NgDBIZKc37aB8xaX0fGkg1j1vS2RA4f4Z+f24IMx6fGKaaGrk5Kr1GKN2I1wWoYbmA6wzTlr
	9gEqxUSe4KvebzMVIaaIp7BE9o54IjzlumJ/AZD+i1shxMsufCVlUWrv+HwSEXzFLDnsRRVrppb0M
	wn4kQnUoxmDL94Og1GdLT7eNL+LR9uRZp4Iuf9LHsJtDcl+ykrm/jYucEfhz5elh2YIze6/VJ6tvn
	1Fz191x4xrWLMfwysIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzk4-00000006P1A-28Ny;
	Wed, 04 Sep 2024 23:48:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzk1-00000006Ozi-2qwV
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C76FA41DF9;
	Wed,  4 Sep 2024 23:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CB2C4CEC3;
	Wed,  4 Sep 2024 23:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493728;
	bh=BjDiByoacyrF5p/NP/LwM66TJexL9bSHpr0RjtKerQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWq1UtCZUw8JgXhQSsX3lD0ZvDdyVatWqs8HLRvFbDFUmBZFsVuI5jI25LsH8EBCH
	 vnBLAQe8ThpGx/wOMzWTxbBqL4zuxk3DjWFIbF3JBIcleODYaz2mU0bb0gzkgN82CM
	 iRc5KMuslu9XJxciOQRtVAWAUQvFI6MCmJe1jV5TfBktvuxHzYICv7w7ZfUjFCuDeX
	 eRH0plFPCNrqF3PmMyMEU6m5EW/lqQv4UeYS48di2VpA5b4nbTy/Aiv7oTffpT9Q3b
	 Oq8fTPRXrwd9zUKhsPo+OQaKBaGi5D2ZLOrL50wR/WobCoC01s48Lm14Xp3/LueDww
	 fZxv69Z0WqAjQ==
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
Subject: [PATCH 13/15] microblaze: migrate to the generic rule for built-in DTB
Date: Thu,  5 Sep 2024 08:47:49 +0900
Message-ID: <20240904234803.698424-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164849_889788_C2050B27 
X-CRM114-Status: GOOD (  13.52  )
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

MicroBlaze is the only architecture that embeds the boot DTB into its
own section, __fdt_blob, and hard-codes the section size to 64kB.

All other architectures that support embedded DTBs use the
.dtb.init.rodata handled by include/asm-generic/vmlinux.lds.h.

For safety, arch/microblaze/boot/dts/system.dtb is still placed in the
__fdt_blob section, but removing the MicroBlaze-specific section should
be considered.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/microblaze/Kbuild                | 1 -
 arch/microblaze/Kconfig               | 5 +++++
 arch/microblaze/boot/dts/Makefile     | 5 -----
 arch/microblaze/boot/dts/linked_dtb.S | 2 --
 arch/microblaze/kernel/vmlinux.lds.S  | 2 +-
 5 files changed, 6 insertions(+), 9 deletions(-)
 delete mode 100644 arch/microblaze/boot/dts/linked_dtb.S

diff --git a/arch/microblaze/Kbuild b/arch/microblaze/Kbuild
index 077a0b8e9615..70510389eb92 100644
--- a/arch/microblaze/Kbuild
+++ b/arch/microblaze/Kbuild
@@ -2,7 +2,6 @@
 obj-y			+= kernel/
 obj-y			+= mm/
 obj-$(CONFIG_PCI)	+= pci/
-obj-y			+= boot/dts/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index f18ec02ddeb2..4ed8ca89f0c9 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -10,6 +10,7 @@ config MICROBLAZE
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_TABLE_SORT
+	select GENERIC_BUILTIN_DTB
 	select TIMER_OF
 	select CLONE_BACKWARDS3
 	select COMMON_CLK
@@ -47,6 +48,10 @@ config MICROBLAZE
 	select TRACE_IRQFLAGS_SUPPORT
 	select GENERIC_IRQ_MULTI_HANDLER
 
+config BUILTIN_DTB_NAME
+	string
+	default "system"
+
 # Endianness selection
 choice
 	prompt "Endianness selection"
diff --git a/arch/microblaze/boot/dts/Makefile b/arch/microblaze/boot/dts/Makefile
index b84e2cbb20ee..87c1d25ff096 100644
--- a/arch/microblaze/boot/dts/Makefile
+++ b/arch/microblaze/boot/dts/Makefile
@@ -4,11 +4,6 @@
 dtb-y := system.dtb
 
 ifneq ($(DTB),)
-obj-y += linked_dtb.o
-
-# Ensure system.dtb exists
-$(obj)/linked_dtb.o: $(obj)/system.dtb
-
 # Generate system.dtb from $(DTB).dtb
 ifneq ($(DTB),system)
 $(obj)/system.dtb: $(obj)/$(DTB).dtb
diff --git a/arch/microblaze/boot/dts/linked_dtb.S b/arch/microblaze/boot/dts/linked_dtb.S
deleted file mode 100644
index 23345af3721f..000000000000
--- a/arch/microblaze/boot/dts/linked_dtb.S
+++ /dev/null
@@ -1,2 +0,0 @@
-.section __fdt_blob,"a"
-.incbin "arch/microblaze/boot/dts/system.dtb"
diff --git a/arch/microblaze/kernel/vmlinux.lds.S b/arch/microblaze/kernel/vmlinux.lds.S
index ae50d3d04a7d..e86f9ca8e979 100644
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -47,7 +47,7 @@ SECTIONS {
 	. = ALIGN (8) ;
 	__fdt_blob : AT(ADDR(__fdt_blob) - LOAD_OFFSET) {
 		_fdt_start = . ;		/* place for fdt blob */
-		*(__fdt_blob) ;			/* Any link-placed DTB */
+		*(.dtb.init.rodata) ;		/* Any link-placed DTB */
 	        . = _fdt_start + 0x10000;	/* Pad up to 64kbyte */
 		_fdt_end = . ;
 	}
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
