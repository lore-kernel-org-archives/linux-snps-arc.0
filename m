Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6865FCD4F4D
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQBwH5NcL7z/K9TFtgg8Tex1VpzqNe8FfQkT1D1LWLU=; b=VOYq7JuzWD/j20
	Pb87vihpRyYbeAOGB0OVEV2zpTnQZlVCfPMNnukqWZk2WOa/E2UxyPnYDfK9LzmqzZ0xew9RiPSmx
	+txCUDl9cYwrZG05Eyi2qPRVD5PCQPkrn6yX+NpvJ2RoaCAOnm2BEzf6bm+FBKnFHNy57GGNHwY22
	GDwzcqx5kIpEtiQb5kdBAc6jQkVwXBirQeylg21AAxuP7mqNNvtTgaZfBllTWq4GyIizl4RWnKL/l
	koQfx6mJuSyGapgoWOb7EdAa3RMyxLcIkiEyy6mo6kNOxHS0oTJVkCeFpxQr1qyAOEpHHRnQ2UhxM
	aswAoLlzym857J609eFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjz-00000006Oyu-48Fz;
	Wed, 04 Sep 2024 23:48:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjy-00000006OxP-0QxF
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CA7B5C5560;
	Wed,  4 Sep 2024 23:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49E5C4CECC;
	Wed,  4 Sep 2024 23:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493725;
	bh=GAvIRyYGY88KXHCNgA5plk+Rvj05BOMm2Zv8xtvLfvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mcGeVz6LO53QnNj0mJxAwWueTLOBilwQI/IQ+a0pK86HA9dHli8CwkmxS6DJQvGHY
	 lNpNRaYKpne2uc7raDjurFFtQLbo/PMF4RZWdFrQdfBzJhFtNzQyJNyXEgv/mPfeOD
	 0vnD3Ljumu8eOm6GR1XIC0m8YnGrTbHXYljdH3BHWou5PEkMWmUYngzcIOmHE+4ieB
	 aY1B/f2C2ZEgzYWlw6rqcLsYy2EGAOFge130Yi6Xghc5H9lh2qEkr7OCxe8B1N9KWV
	 7hgQKlTw8JERdZ1zmpHTUxs12YPDH4JcI5XHxmhetbHI5jO6oF7pF3kh+lpZ+P76F6
	 dgSL/Ftd270IA==
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
Subject: [PATCH 12/15] sh: migrate to the generic rule for built-in DTB
Date: Thu,  5 Sep 2024 08:47:48 +0900
Message-ID: <20240904234803.698424-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164846_267372_CF7C942E 
X-CRM114-Status: GOOD (  10.77  )
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
CONFIG_USE_BUILTIN_DTB to CONFIG_BUILTIN_DTB, and
CONFIG_BUILTIN_DTB_SOURCE to CONFIG_BUILTIN_DTB_NAME.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sh/Kbuild            | 1 -
 arch/sh/Kconfig           | 7 ++++---
 arch/sh/boot/dts/Makefile | 2 +-
 arch/sh/kernel/setup.c    | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/sh/Kbuild b/arch/sh/Kbuild
index 056efec72c2a..0da6c6d6821a 100644
--- a/arch/sh/Kbuild
+++ b/arch/sh/Kbuild
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y				+= kernel/ mm/ boards/
 obj-$(CONFIG_SH_FPU_EMU)	+= math-emu/
-obj-$(CONFIG_USE_BUILTIN_DTB)	+= boot/dts/
 
 obj-$(CONFIG_HD6446X_SERIES)	+= cchips/hd6446x/
 
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 1aa3c4a0c5b2..3b772378773f 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -644,10 +644,11 @@ endmenu
 
 menu "Boot options"
 
-config USE_BUILTIN_DTB
+config BUILTIN_DTB
 	bool "Use builtin DTB"
 	default n
 	depends on SH_DEVICE_TREE
+	select GENERIC_BUILTIN_DTB
 	help
 	  Link a device tree blob for particular hardware into the kernel,
 	  suppressing use of the DTB pointer provided by the bootloader.
@@ -655,10 +656,10 @@ config USE_BUILTIN_DTB
 	  not capable of providing a DTB to the kernel, or for experimental
 	  hardware without stable device tree bindings.
 
-config BUILTIN_DTB_SOURCE
+config BUILTIN_DTB_NAME
 	string "Source file for builtin DTB"
 	default ""
-	depends on USE_BUILTIN_DTB
+	depends on BUILTIN_DTB
 	help
 	  Base name (without suffix, relative to arch/sh/boot/dts) for the
 	  a DTS file that will be used to produce the DTB linked into the
diff --git a/arch/sh/boot/dts/Makefile b/arch/sh/boot/dts/Makefile
index 4a6dec9714a9..d109978a5eb9 100644
--- a/arch/sh/boot/dts/Makefile
+++ b/arch/sh/boot/dts/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_USE_BUILTIN_DTB) += $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_SOURCE))
+obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 620e5cf8ae1e..aaca94a88dad 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -249,7 +249,7 @@ void __ref sh_fdt_init(phys_addr_t dt_phys)
 	/* Avoid calling an __init function on secondary cpus. */
 	if (done) return;
 
-#ifdef CONFIG_USE_BUILTIN_DTB
+#ifdef CONFIG_BUILTIN_DTB
 	dt_virt = __dtb_start;
 #else
 	dt_virt = phys_to_virt(dt_phys);
@@ -323,7 +323,7 @@ void __init setup_arch(char **cmdline_p)
 	sh_early_platform_driver_probe("earlyprintk", 1, 1);
 
 #ifdef CONFIG_OF_EARLY_FLATTREE
-#ifdef CONFIG_USE_BUILTIN_DTB
+#ifdef CONFIG_BUILTIN_DTB
 	unflatten_and_copy_device_tree();
 #else
 	unflatten_device_tree();
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
