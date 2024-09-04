Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D064ECD4F4C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5DSXGRyolkPDsALEKV6aBV3vf3d/jCajL2kNHFeLL0=; b=hNJmtJm1fzTVSi
	2I5e24Lb6YPJ1elUgMdEbr0ms2zcA+1eJEJWO6pCExbYWGsz05O3vMSTGOWXo0OBZNghXxwwYXEos
	tLqkNjYNwb8ELbxrbmoJVlA0fcalejPOWDdSQb759qI3UsrEwQBKAFPJiUSfKhCMBC5ev4gyxJ/5x
	FWYMHlBDHdJKJc4G7QwmE5g2RJ/JGy/64RWB35uE0n81fxLX9/RfKNDxrQXI2jITKJpbmPQQY5eVY
	gBt4LL3KJtI5606lcHARi5z2HZT++Z3zg/bAdYV1xFp/ZgdTH23NZDIfBa63yKxVGbKdnLgQppoe0
	v1Kq7W47ZAvWtqbbmCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjs-00000006Ov0-2R85;
	Wed, 04 Sep 2024 23:48:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjq-00000006Otp-07MS
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A976A41447;
	Wed,  4 Sep 2024 23:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44EFC4CEC9;
	Wed,  4 Sep 2024 23:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493716;
	bh=dk04zi59AciF5LL6akuqjWabef8tuzvQHnluBCG6Dq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WXanL2S1ncP9VL15QlXjB215wU1hNbN2vKvw3EYtXVZFbUBVEeZHly5axKhoCCqTu
	 oUB3D/bJEjWxqQ0rm18DKkHgVADRiZpRKAIM69av4S7HT4mCZ354pk2zPEJqwsO+YP
	 MgKw4KPnBKLnddm7a+GxJPtumoGmTve3flq+PEAZJVXniDdiVRWK2FyTQjzXpjuqsO
	 lEX2H/XdvkhCwK23r7h8Gboj4cEE+GUUI7BnsmLxjion7OPZSlveblpMAT6nvodfQw
	 K6LAnw/GRi2YAPwiQw08MxjH/D+2oPQP+xVF0oE2dBysiOLMmSPZdcUd6Jn56F4G+o
	 5L8kSbjfqxaEA==
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
Subject: [PATCH 09/15] openrisc: migrate to the generic rule for built-in DTB
Date: Thu,  5 Sep 2024 08:47:45 +0900
Message-ID: <20240904234803.698424-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164838_213900_9F9A6C68 
X-CRM114-Status: GOOD (  10.52  )
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
CONFIG_OPENRISC_BUILTIN_DTB_NAME to CONFIG_BUILTIN_DTB_NAME.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/openrisc/Kbuild                       | 1 -
 arch/openrisc/Kconfig                      | 3 ++-
 arch/openrisc/boot/dts/Makefile            | 2 +-
 arch/openrisc/configs/or1klitex_defconfig  | 2 +-
 arch/openrisc/configs/or1ksim_defconfig    | 2 +-
 arch/openrisc/configs/simple_smp_defconfig | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/openrisc/Kbuild b/arch/openrisc/Kbuild
index b0b0f2b03f87..70bdb24ff204 100644
--- a/arch/openrisc/Kbuild
+++ b/arch/openrisc/Kbuild
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += lib/ kernel/ mm/
-obj-y += boot/dts/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 69c0258700b2..11ffcf33652c 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -10,6 +10,7 @@ config OPENRISC
 	select ARCH_HAS_DMA_SET_UNCACHED
 	select ARCH_HAS_DMA_CLEAR_UNCACHED
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select GENERIC_BUILTIN_DTB
 	select COMMON_CLK
 	select OF
 	select OF_EARLY_FLATTREE
@@ -89,7 +90,7 @@ config DCACHE_WRITETHROUGH
 
 	  If unsure say N here
 
-config OPENRISC_BUILTIN_DTB
+config BUILTIN_DTB_NAME
 	string "Builtin DTB"
 	default ""
 
diff --git a/arch/openrisc/boot/dts/Makefile b/arch/openrisc/boot/dts/Makefile
index 13db5a2aab52..3a66e0ef3985 100644
--- a/arch/openrisc/boot/dts/Makefile
+++ b/arch/openrisc/boot/dts/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y += $(addsuffix .dtb.o, $(CONFIG_OPENRISC_BUILTIN_DTB))
+dtb-y += $(addsuffix .dtb, $(CONFIG_BUILTIN_DTB_NAME))
 
 #DTC_FLAGS ?= -p 1024
diff --git a/arch/openrisc/configs/or1klitex_defconfig b/arch/openrisc/configs/or1klitex_defconfig
index 466f31a091be..3e849d25838a 100644
--- a/arch/openrisc/configs/or1klitex_defconfig
+++ b/arch/openrisc/configs/or1klitex_defconfig
@@ -7,7 +7,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_SGETMASK_SYSCALL=y
 CONFIG_EXPERT=y
-CONFIG_OPENRISC_BUILTIN_DTB="or1klitex"
+CONFIG_BUILTIN_DTB_NAME="or1klitex"
 CONFIG_HZ_100=y
 CONFIG_OPENRISC_HAVE_SHADOW_GPRS=y
 CONFIG_NET=y
diff --git a/arch/openrisc/configs/or1ksim_defconfig b/arch/openrisc/configs/or1ksim_defconfig
index 0116e465238f..59fe33cefba2 100644
--- a/arch/openrisc/configs/or1ksim_defconfig
+++ b/arch/openrisc/configs/or1ksim_defconfig
@@ -14,7 +14,7 @@ CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 CONFIG_MODULES=y
 # CONFIG_BLOCK is not set
-CONFIG_OPENRISC_BUILTIN_DTB="or1ksim"
+CONFIG_BUILTIN_DTB_NAME="or1ksim"
 CONFIG_HZ_100=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/openrisc/configs/simple_smp_defconfig b/arch/openrisc/configs/simple_smp_defconfig
index b990cb6c9309..6008e824d31c 100644
--- a/arch/openrisc/configs/simple_smp_defconfig
+++ b/arch/openrisc/configs/simple_smp_defconfig
@@ -20,7 +20,7 @@ CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 CONFIG_MODULES=y
 # CONFIG_BLOCK is not set
-CONFIG_OPENRISC_BUILTIN_DTB="simple_smp"
+CONFIG_BUILTIN_DTB_NAME="simple_smp"
 CONFIG_SMP=y
 CONFIG_HZ_100=y
 CONFIG_OPENRISC_HAVE_SHADOW_GPRS=y
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
