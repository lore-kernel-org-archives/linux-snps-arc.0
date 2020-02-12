Return-Path: <SRS0=vxQV=4A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C4AC352A4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 17:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1D9F2073C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 17:44:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K6eKeJty";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h5iNrNPy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1D9F2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/BthUJZnFeFXBkjUbCT8os+b38SUPauzmm6aP2IzYjQ=; b=K6eKeJtyvINlPhyOiXu5Q1NInK
	zefR5So1eRktaAJXECnmP4laCM/kSERLoBDOt03NvzOfMBZEG0UZrJL0AQiY4UTPVvKz3P1fjqHn7
	yIrDDG9vqJxs8SZNbNbLXmfTNoHEmAvF9hgERICS2twLWGwxj8GwZRJlSABp0ugZ5gb2TPzNYX9/c
	fZ6WzFqN7+Ilf/Gva/PtuCthw90Q5AhlphO8UPnu1Xo+RQLp4/hxxrJTOz7ZlA3u/sf/igWGecCv9
	33JY7GiJG0yQMJm0MHQ3i5r2rGFA3cGTRr9iP91ePHbdz5YA1oaRjaxks6xF5JsdZS0P8s+9EL1pY
	AoXbc7FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1w4E-0008FF-AL; Wed, 12 Feb 2020 17:44:54 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1w4A-0008DG-3x
 for linux-snps-arc@lists.infradead.org; Wed, 12 Feb 2020 17:44:52 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2A6B4C0631;
 Wed, 12 Feb 2020 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1581529488; bh=BVyotUCVpwyTgkIoEuOxKle2OgbER1Vx9ldbCp/S5Xo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h5iNrNPyn9rKQ6hYV39ZO3QJnQipmy+udwuQ6mlNXJZW/X3e0f4vzXLA+bCaltj+k
 Psf/aJZsyomc0mEXJftK7YjxO9sFZAIteWO/zgZckvlLOgLSyHFIAfFrgt/sma7O1X
 8TKUKbGN+7y6pabt8YIk7r6fIAsGbMsykE2JVJqchYGnw9X727HNB122L6xqocyI4z
 dfp/GJ+8n0ZIVD+wHATuVMA1kKv8RH4IE/7w4TRCZF/MH3T3ATkPxDNuVHVTS3akvL
 WTUe/nYcElEH7ePUfpm4jHcRrDpPnYiWmrENpmmTNerYWj+ML/MKiA8+EDhrs6X2Pu
 M1j2cTrsJi5ww==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id 8B18BA0076;
 Wed, 12 Feb 2020 17:44:46 +0000 (UTC)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: u-boot@lists.denx.de
Subject: [PATCH 3/3 v2] ARC: nsim_hs38: Add support of Virtio NET & BLK
Date: Wed, 12 Feb 2020 20:44:43 +0300
Message-Id: <20200212174443.37707-3-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20200212174443.37707-1-abrodkin@synopsys.com>
References: <20200212174443.37707-1-abrodkin@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_094450_266289_1AE24AC4 
X-CRM114-Status: GOOD (  16.07  )
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
Cc: linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, uboot-snps-arc@synopsys.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Given now nsim_hs38 configuration is usable on QEMU and in QEMU
we have Virtio working perfectly fine the next logical step
is to add support of supported & known to work net & bkl to this
config.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

Changes v1 -> v2:

 * Instead of adding IRQ parent it might be much cleaner solution
   to just get rid of "interrupt" properties in Virtio nodes.
   Again that's all OK for now since we don't really sync Linux .dts
   and U-Boot's ones. It's not that it's super good though but
   that's what we have today :)

 arch/arc/Kconfig                  |  4 ++--
 arch/arc/dts/nsim.dts             | 24 ++++++++++++++++++++++++
 board/synopsys/{ => nsim}/Kconfig |  3 +++
 board/synopsys/nsim/MAINTAINERS   |  6 ++++++
 board/synopsys/nsim/Makefile      |  7 +++++++
 board/synopsys/nsim/nsim.c        | 26 ++++++++++++++++++++++++++
 configs/nsim_hs38_defconfig       |  9 +++++++++
 7 files changed, 77 insertions(+), 2 deletions(-)
 rename board/synopsys/{ => nsim}/Kconfig (74%)
 create mode 100644 board/synopsys/nsim/MAINTAINERS
 create mode 100644 board/synopsys/nsim/Makefile
 create mode 100644 board/synopsys/nsim/nsim.c

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 0cb97207db..545fc3e243 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -160,7 +160,7 @@ config TARGET_TB100
 	bool "Support tb100"
 
 config TARGET_NSIM
-	bool "Support standalone nSIM & Free nSIM"
+	bool "Support ARC simulation & prototyping platforms"
 
 config TARGET_AXS101
 	bool "Support Synopsys Designware SDP board AXS101"
@@ -184,10 +184,10 @@ config TARGET_IOT_DEVKIT
 endchoice
 
 source "board/abilis/tb100/Kconfig"
-source "board/synopsys/Kconfig"
 source "board/synopsys/axs10x/Kconfig"
 source "board/synopsys/emsdp/Kconfig"
 source "board/synopsys/hsdk/Kconfig"
 source "board/synopsys/iot_devkit/Kconfig"
+source "board/synopsys/nsim/Kconfig"
 
 endmenu
diff --git a/arch/arc/dts/nsim.dts b/arch/arc/dts/nsim.dts
index 43f281dfec..c2899ef2ea 100644
--- a/arch/arc/dts/nsim.dts
+++ b/arch/arc/dts/nsim.dts
@@ -30,4 +30,28 @@
 		clock-frequency = <70000000>;
 	};
 
+	virtio0: virtio@f0100000 {
+		compatible = "virtio,mmio";
+		reg = <0xf0100000 0x2000>;
+	};
+
+	virtio1: virtio@f0102000 {
+		compatible = "virtio,mmio";
+		reg = <0xf0102000 0x2000>;
+	};
+
+	virtio2: virtio@f0104000 {
+		compatible = "virtio,mmio";
+		reg = <0xf0104000 0x2000>;
+	};
+
+	virtio3: virtio@f0106000 {
+		compatible = "virtio,mmio";
+		reg = <0xf0106000 0x2000>;
+	};
+
+	virtio4: virtio@f0108000 {
+		compatible = "virtio,mmio";
+		reg = <0xf0108000 0x2000>;
+	};
 };
diff --git a/board/synopsys/Kconfig b/board/synopsys/nsim/Kconfig
similarity index 74%
rename from board/synopsys/Kconfig
rename to board/synopsys/nsim/Kconfig
index 27e5509b26..22287032bf 100644
--- a/board/synopsys/Kconfig
+++ b/board/synopsys/nsim/Kconfig
@@ -1,5 +1,8 @@
 if TARGET_NSIM
 
+config SYS_BOARD
+	default "nsim"
+
 config SYS_VENDOR
 	default "synopsys"
 
diff --git a/board/synopsys/nsim/MAINTAINERS b/board/synopsys/nsim/MAINTAINERS
new file mode 100644
index 0000000000..ad23c8338e
--- /dev/null
+++ b/board/synopsys/nsim/MAINTAINERS
@@ -0,0 +1,6 @@
+ARC SIMULATION & PROTOTYPING PLATFORMS
+M:	Alexey Brodkin <abrodkin@synopsys.com>
+S:	Maintained
+F:	arch/arc/dts/nsim.dts
+F:	board/synopsys/nsim/
+F:	configs/nsim_*_defconfig
diff --git a/board/synopsys/nsim/Makefile b/board/synopsys/nsim/Makefile
new file mode 100644
index 0000000000..6aaffffa73
--- /dev/null
+++ b/board/synopsys/nsim/Makefile
@@ -0,0 +1,7 @@
+#
+# Copyright (C) 2020 Synopsys, Inc. All rights reserved.
+#
+# SPDX-License-Identifier:	GPL-2.0+
+#
+
+obj-y	+= nsim.o
diff --git a/board/synopsys/nsim/nsim.c b/board/synopsys/nsim/nsim.c
new file mode 100644
index 0000000000..f384f707f6
--- /dev/null
+++ b/board/synopsys/nsim/nsim.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2020 Synopsys, Inc. All rights reserved.
+ */
+
+#include <common.h>
+#include <dm/device.h>
+#include <virtio_types.h>
+#include <virtio.h>
+
+int board_early_init_r(void)
+{
+	/*
+	 * Make sure virtio bus is enumerated so that peripherals
+	 * on the virtio bus can be discovered by their drivers
+	 */
+	virtio_init();
+
+	return 0;
+}
+
+int checkboard(void)
+{
+	printf("Board: ARC virtual or prototyping platform\n");
+	return 0;
+};
diff --git a/configs/nsim_hs38_defconfig b/configs/nsim_hs38_defconfig
index ce68de3251..6cd01a505b 100644
--- a/configs/nsim_hs38_defconfig
+++ b/configs/nsim_hs38_defconfig
@@ -9,14 +9,23 @@ CONFIG_DEBUG_UART=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200n8"
+CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SYS_PROMPT="nsim# "
+CONFIG_CMD_DM=y
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_DHCP=y
 CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="nsim"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
+CONFIG_BLK=y
+CONFIG_HAVE_BLOCK_DEVICE=y
+CONFIG_DM_ETH=y
 CONFIG_DM_SERIAL=y
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_SYS_NS16550=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_NET=y
+CONFIG_VIRTIO_BLK=y
 CONFIG_USE_PRIVATE_LIBGCC=y
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
