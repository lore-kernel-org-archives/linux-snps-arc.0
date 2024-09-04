Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE272CD4F4A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAfXJxegsZAzcpdvKlo+nodvr4uNKLHwcjq2wQI66WI=; b=nWZC6JVfhJisCr
	Z56NZhzFuWSZbSmgEk+DNPaq6+zig+HER96Cr5JwZNfxS2AtOk//3VoUN+lT7s/WF7cTNt36PKnD0
	VNvu/FuPA/OToebW6jKM8Qk109wSJ1zzX33ybhN5xF3LUbkFUHrxDZwl17NawDsG/I9sq1iODYOaI
	41+YQ7aIHePQdryFzhConIOxBGU5jfCmkKU23FcE5WFJuJGceM4HkOvwM/N3GyBT6mhFi0IFyyMFY
	dzahgQFvmC5Y0yy8sqU+nknnlMbAwd/DveKslkO/Smh7beCBv77h2VwMo95lAIh/+wetPDk7htsI9
	hh+9NLn4yVoNWudG+v4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjy-00000006Oxj-2bjO;
	Wed, 04 Sep 2024 23:48:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjv-00000006Ow1-3JAe
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79942A41F4C;
	Wed,  4 Sep 2024 23:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5596CC4CEC9;
	Wed,  4 Sep 2024 23:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493722;
	bh=ceXpRnavdorzGFbVYUr8aA6c+sVnRF84hopfhHaV0dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j9kBmrJRmdISyfx3jQ19J1DpNiq+n9PVgL8tnqgAE5eHB9qEcAWVNIA24BtpLn6zo
	 J2qft+UQ5z9suplkazNanVvrDKX0uNYEMsy858T8dIJvCWBoTmKznVjpL2STXcfd3N
	 sT5cHyO4nW8tgbXbotQGpJJnUiBxfXLw53xIS3O6tAqP92Hezz9nQtcrHye6fNyrrT
	 C9Bd206zR9cXvGP/W4t5i16oi2V+YUku6N3eMDk9xF/34dmZTvIldslwrhvs6aCnZo
	 wAo6MrOzvaP5v+ZAqNa3E4eR/CRQfeAnZ6f7/XL/mxk1Ler62qkXD8NWxMWRLWI0Pr
	 /DDmAhuLfGJhQ==
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
Subject: [PATCH 11/15] nios2: migrate to the generic rule for built-in DTB
Date: Thu,  5 Sep 2024 08:47:47 +0900
Message-ID: <20240904234803.698424-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164843_981240_BB79904D 
X-CRM114-Status: GOOD (  10.99  )
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
CONFIG_NIOS2_DTB_SOURCE_BOOL to CONFIG_BUILTIN_DTB, and
CONFIG_NIOS2_DTB_SOURCE to CONFIG_BUILTIN_DTB_NAME.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/nios2/Kbuild                    |  2 +-
 arch/nios2/boot/dts/Makefile         |  4 ++--
 arch/nios2/kernel/prom.c             |  2 +-
 arch/nios2/platform/Kconfig.platform | 11 ++++++-----
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/nios2/Kbuild b/arch/nios2/Kbuild
index fc2952edd2de..fa64c5954b20 100644
--- a/arch/nios2/Kbuild
+++ b/arch/nios2/Kbuild
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-y += kernel/ mm/ platform/ boot/dts/
+obj-y += kernel/ mm/ platform/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/nios2/boot/dts/Makefile b/arch/nios2/boot/dts/Makefile
index 1a2e8996bec7..1b8f41c4154f 100644
--- a/arch/nios2/boot/dts/Makefile
+++ b/arch/nios2/boot/dts/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-y := $(patsubst %.dts,%.dtb.o,$(CONFIG_NIOS2_DTB_SOURCE))
+dtb-y := $(addsuffix .dtb, $(CONFIG_BUILTIN_DTB_NAME))
 
-dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
+dtb-$(CONFIG_OF_ALL_DTBS) += $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
diff --git a/arch/nios2/kernel/prom.c b/arch/nios2/kernel/prom.c
index 9a8393e6b4a8..f703056885c9 100644
--- a/arch/nios2/kernel/prom.c
+++ b/arch/nios2/kernel/prom.c
@@ -32,7 +32,7 @@ void __init early_init_devtree(void *params)
 	}
 #endif
 
-#ifdef CONFIG_NIOS2_DTB_SOURCE_BOOL
+#ifdef CONFIG_BUILTIN_DTB
 	if (be32_to_cpu((__be32) *dtb) == OF_DT_HEADER)
 		params = (void *)__dtb_start;
 #endif
diff --git a/arch/nios2/platform/Kconfig.platform b/arch/nios2/platform/Kconfig.platform
index e849daff6fd1..c75cadd92388 100644
--- a/arch/nios2/platform/Kconfig.platform
+++ b/arch/nios2/platform/Kconfig.platform
@@ -35,19 +35,20 @@ config NIOS2_DTB_PHYS_ADDR
 	help
 	  Physical address of a dtb blob.
 
-config NIOS2_DTB_SOURCE_BOOL
+config BUILTIN_DTB
 	bool "Compile and link device tree into kernel image"
 	depends on !COMPILE_TEST
+	select GENERIC_BUILTIN_DTB
 	help
 	  This allows you to specify a dts (device tree source) file
 	  which will be compiled and linked into the kernel image.
 
-config NIOS2_DTB_SOURCE
-	string "Device tree source file"
-	depends on NIOS2_DTB_SOURCE_BOOL
+config BUILTIN_DTB_NAME
+	string "Built-in device tree name"
+	depends on BUILTIN_DTB
 	default ""
 	help
-	  Absolute path to the device tree source (dts) file describing your
+	  Relative path to the device tree without suffix describing your
 	  system.
 
 comment "Nios II instructions"
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
