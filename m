Return-Path: <SRS0=vxQV=4A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D56C2BA83
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 11:24:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1338B206D7
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 11:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m1HiVuco";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="f9RpeGY2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1338B206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E7gzqI+LfGg1eqCQJk21yuS4qTKmnvEUOvR4nZ/Xuss=; b=m1HiVucoteycOV
	KdsW3PGf2cYoJwCofrAYgxp4Xs4C9qPKLnesuMpGPUGJM2gZLZqhMMc0SWOqjKUf3gpT7DD7hWpzM
	R3zBgRNo/aJ7OpBCzELkHFYDIiNSQA/cdHHCh8kitzSuOJYEF13y+9T26wsL+KOmvkLlHGLbHYGpd
	Cm/r9w0hzrGvPADzPVwFTnwpsda2xLg0fsHBSaGeD9AQZiS/0TysNbAw61MzRrpdKCH3mGVvfINeP
	3t3GjHy9CGVAjteq7L6vEH2mncDREwU6hwPa7yIxl+Hyb4UNyRFRaUSYH/5nWS1tZF3KwZrCr/3M0
	5mPmfPrbX8g84vsmvKUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1q7o-0001EU-Rn; Wed, 12 Feb 2020 11:24:12 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1q7k-0001DC-Ob
 for linux-snps-arc@lists.infradead.org; Wed, 12 Feb 2020 11:24:11 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 226C7407E3;
 Wed, 12 Feb 2020 11:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1581506644; bh=ltZYcXjXis1wW+FYswmRwrIZetrbf5ebR5AtHx75B3o=;
 h=From:To:Cc:Subject:Date:From;
 b=f9RpeGY2SGFnSJSqbgjROFMqVl4KWWsGG9+hUAug39EOQ4noWhM73hqitIaUeuc7q
 ctIw1+JFXwpkYnUFSoQkJEH6uPpYIEa+bATnLLNBHzIP+R1mPSh8fUJq3bFlpW/p/n
 wySwCncJ3DLC2fyrSR/WdJ/1LnHXoSz+BviySGFWBKqy9ZwEuPz1+cvRYjeGZOy4qF
 n/7IHzlAk6ekzjOVCo8gKVP1NUNFv8yi+hAQgrWnF35LTV1XYYKDwKi5cbd5ijUWi2
 LiHzZ7djj9/a40fPqtV2US4WRSU9yezERrOmjRUME3V+wUp1xGMFFgOrDjRd4rEEvq
 e0RqnZyObjY3w==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.8.35])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4E1DEA005C;
 Wed, 12 Feb 2020 11:23:56 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: uboot-snps-arc@synopsys.com, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] ARC: rework setting of ARC CPU specific compiler options
Date: Wed, 12 Feb 2020 14:23:54 +0300
Message-Id: <20200212112354.6990-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_032408_805989_53660043 
X-CRM114-Status: GOOD (  14.77  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: u-boot@lists.denx.de, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

It's a very rare if at all existing occasion when ARC CPU template
is used as is w/o any changes - in the end it's a beauty and competitive
advantage of ARC cores to be tailored for a particular use-case - and
so it doesn't make a lot of sense to offer template-based "-mcpu" selection.
Given for each and every platform we end-up adding quite a few more flags
it's logical to move "-mcpu" selection to platform's definition as well
which we exactly do here.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/config.mk                  | 20 --------------------
 board/abilis/tb100/config.mk        |  5 +++++
 board/synopsys/axs10x/config.mk     |  6 ++++++
 board/synopsys/emsdp/config.mk      |  2 +-
 board/synopsys/hsdk/config.mk       |  4 ++++
 board/synopsys/iot_devkit/config.mk |  3 ++-
 board/synopsys/nsim/Kconfig         |  9 +++++++++
 board/synopsys/nsim/config.mk       |  8 ++++++++
 configs/nsim_700_defconfig          |  1 +
 configs/nsim_700be_defconfig        |  1 +
 configs/nsim_hs38_defconfig         |  1 +
 configs/nsim_hs38be_defconfig       |  1 +
 12 files changed, 39 insertions(+), 22 deletions(-)
 create mode 100644 board/abilis/tb100/config.mk
 create mode 100644 board/synopsys/nsim/config.mk

diff --git a/arch/arc/config.mk b/arch/arc/config.mk
index 18005d99930..6fa29adae81 100644
--- a/arch/arc/config.mk
+++ b/arch/arc/config.mk
@@ -22,26 +22,6 @@ ifdef CONFIG_ARC_MMU_VER
 CONFIG_MMU = 1
 endif
 
-ifdef CONFIG_CPU_ARC750D
-PLATFORM_CPPFLAGS += -mcpu=arc700
-endif
-
-ifdef CONFIG_CPU_ARC770D
-PLATFORM_CPPFLAGS += -mcpu=arc700 -mlock -mswape
-endif
-
-ifdef CONFIG_CPU_ARCEM6
-PLATFORM_CPPFLAGS += -mcpu=arcem
-endif
-
-ifdef CONFIG_CPU_ARCHS34
-PLATFORM_CPPFLAGS += -mcpu=archs
-endif
-
-ifdef CONFIG_CPU_ARCHS38
-PLATFORM_CPPFLAGS += -mcpu=archs
-endif
-
 PLATFORM_CPPFLAGS += -ffixed-r25 -D__ARC__ -gdwarf-2 -mno-sdata
 PLATFORM_RELFLAGS += -ffunction-sections -fdata-sections -fno-common
 
diff --git a/board/abilis/tb100/config.mk b/board/abilis/tb100/config.mk
new file mode 100644
index 00000000000..9e8dee49bd3
--- /dev/null
+++ b/board/abilis/tb100/config.mk
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (C) 2020 Synopsys, Inc. All rights reserved.
+
+PLATFORM_CPPFLAGS += -mcpu=arc700 -mlock -mswape
diff --git a/board/synopsys/axs10x/config.mk b/board/synopsys/axs10x/config.mk
index 81ff498f818..ccac5442908 100644
--- a/board/synopsys/axs10x/config.mk
+++ b/board/synopsys/axs10x/config.mk
@@ -2,6 +2,12 @@
 #
 # Copyright (C) 2018 Synopsys, Inc. All rights reserved.
 
+ifdef CONFIG_TARGET_AXS103
+  PLATFORM_CPPFLAGS += -mcpu=archs
+else
+  PLATFORM_CPPFLAGS += -mcpu=arc700 -mlock -mswape
+endif
+
 bsp-generate: u-boot u-boot.bin
 ifdef CONFIG_ISA_ARCV2
 	$(Q)python3 $(srctree)/board/$(BOARDDIR)/headerize-axs.py \
diff --git a/board/synopsys/emsdp/config.mk b/board/synopsys/emsdp/config.mk
index 67fd7bf82a3..5bd10442aff 100644
--- a/board/synopsys/emsdp/config.mk
+++ b/board/synopsys/emsdp/config.mk
@@ -1,2 +1,2 @@
-PLATFORM_CPPFLAGS += -mlittle-endian -mnorm -mswap -mmpy-option=3 \
+PLATFORM_CPPFLAGS += -mcpu=arcem -mlittle-endian -mnorm -mswap -mmpy-option=3 \
                      -mbarrel-shifter -mfpu=fpuda_all -mcode-density
diff --git a/board/synopsys/hsdk/config.mk b/board/synopsys/hsdk/config.mk
index 9e280f921a1..5ae22fa2b75 100644
--- a/board/synopsys/hsdk/config.mk
+++ b/board/synopsys/hsdk/config.mk
@@ -2,6 +2,10 @@
 #
 # Copyright (C) 2018 Synopsys, Inc. All rights reserved.
 
+PLATFORM_CPPFLAGS += -mcpu=hs38_linux -mlittle-endian -matomic -mll64 \
+                     -mdiv-rem -mswap -mnorm -mmpy-option=9 -mbarrel-shifter \
+                     -mfpu=fpud_all
+
 bsp-generate: u-boot u-boot.bin
 	$(Q)python3 $(srctree)/board/$(BOARDDIR)/headerize-hsdk.py \
 		--arc-id 0x52 --image $(srctree)/u-boot.bin \
diff --git a/board/synopsys/iot_devkit/config.mk b/board/synopsys/iot_devkit/config.mk
index 120733538a4..e1e546a3d04 100644
--- a/board/synopsys/iot_devkit/config.mk
+++ b/board/synopsys/iot_devkit/config.mk
@@ -1,2 +1,3 @@
-PLATFORM_CPPFLAGS += -mlittle-endian -mcode-density -mdiv-rem -mswap -mnorm -mmpy-option=6 -mbarrel-shifter
+PLATFORM_CPPFLAGS += -mcpu=em4_fpuda -mlittle-endian -mcode-density -mdiv-rem \
+                     -mswap -mnorm -mmpy-option=6 -mbarrel-shifter
 LDSCRIPT = $(srctree)/board/synopsys/iot_devkit/u-boot.lds
diff --git a/board/synopsys/nsim/Kconfig b/board/synopsys/nsim/Kconfig
index 22287032bf5..b6966b2991e 100644
--- a/board/synopsys/nsim/Kconfig
+++ b/board/synopsys/nsim/Kconfig
@@ -9,4 +9,13 @@ config SYS_VENDOR
 config SYS_CONFIG_NAME
 	default "nsim"
 
+config NSIM_BOARD_CPPFLAGS
+	string "board arc-specific compiler options"
+	help
+	  For nSIM we allow to set custom arc-specific compiler options
+	  (like -mcpu=) instead of hardcoding them in its makefile as nSIM
+	  target is used for representing targets without fixed CPU version
+	  like FPGA-based boards and software simulators.
+	  This variable takes space separated compiler options list.
+
 endif
diff --git a/board/synopsys/nsim/config.mk b/board/synopsys/nsim/config.mk
new file mode 100644
index 00000000000..40f9578a25a
--- /dev/null
+++ b/board/synopsys/nsim/config.mk
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (C) 2020 Synopsys, Inc. All rights reserved.
+
+# CONFIG_NSIM_BOARD_CPPFLAGS is a string variable which comes from defconfig
+# with double quotes. We use echo to remove them so CONFIG_NSIM_BOARD_CPPFLAGS
+# won't be treated by compiler as a single option.
+PLATFORM_CPPFLAGS += $(shell echo $(CONFIG_NSIM_BOARD_CPPFLAGS))
diff --git a/configs/nsim_700_defconfig b/configs/nsim_700_defconfig
index 6a38e2c246a..5e897697843 100644
--- a/configs/nsim_700_defconfig
+++ b/configs/nsim_700_defconfig
@@ -1,5 +1,6 @@
 CONFIG_ARC=y
 CONFIG_TARGET_NSIM=y
+CONFIG_NSIM_BOARD_CPPFLAGS="-mcpu=arc700 -mlock -mswape"
 CONFIG_SYS_TEXT_BASE=0x81000000
 CONFIG_DEBUG_UART_BASE=0xf0000000
 CONFIG_DEBUG_UART_CLOCK=70000000
diff --git a/configs/nsim_700be_defconfig b/configs/nsim_700be_defconfig
index d3ed84a4154..03912712486 100644
--- a/configs/nsim_700be_defconfig
+++ b/configs/nsim_700be_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARC=y
 CONFIG_CPU_BIG_ENDIAN=y
 CONFIG_TARGET_NSIM=y
+CONFIG_NSIM_BOARD_CPPFLAGS="-mcpu=arc700 -mlock -mswape"
 CONFIG_SYS_TEXT_BASE=0x81000000
 CONFIG_DEBUG_UART_BASE=0xf0000000
 CONFIG_DEBUG_UART_CLOCK=70000000
diff --git a/configs/nsim_hs38_defconfig b/configs/nsim_hs38_defconfig
index 2f46610d9cb..a6ebcc49a8c 100644
--- a/configs/nsim_hs38_defconfig
+++ b/configs/nsim_hs38_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARC=y
 CONFIG_ISA_ARCV2=y
 CONFIG_TARGET_NSIM=y
+CONFIG_NSIM_BOARD_CPPFLAGS="-mcpu=archs"
 CONFIG_SYS_TEXT_BASE=0x81000000
 CONFIG_DEBUG_UART_BASE=0xf0000000
 CONFIG_DEBUG_UART_CLOCK=70000000
diff --git a/configs/nsim_hs38be_defconfig b/configs/nsim_hs38be_defconfig
index b074b4ca98c..72472afb2b1 100644
--- a/configs/nsim_hs38be_defconfig
+++ b/configs/nsim_hs38be_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARC=y
 CONFIG_ISA_ARCV2=y
 CONFIG_CPU_BIG_ENDIAN=y
 CONFIG_TARGET_NSIM=y
+CONFIG_NSIM_BOARD_CPPFLAGS="-mcpu=archs"
 CONFIG_SYS_TEXT_BASE=0x81000000
 CONFIG_DEBUG_UART_BASE=0xf0000000
 CONFIG_DEBUG_UART_CLOCK=70000000
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
