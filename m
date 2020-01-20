Return-Path: <SRS0=X5Oj=3J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C71C3F68F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 10:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FD0B20674
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 10:46:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TruXycuz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XSbz9MB2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FD0B20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7me51SERRllVOK36t1n4VrM0TteXSb18DDnz23o65dc=; b=TruXycuzdOCTqyQwQeag47Kpaf
	mzw7vjbxei2aowOrk5pzHslnSYot1wb0jwyEhkiUQHqt7/aBsNyfeBMspyCi6+213fbXUz+cZtLFS
	sYDfk54Ml9DlwQrChjW/Ad31Lb+0A9Q+O8nw9uw8wNDn+V2pzcmf2ZeiAAljeM3K9ZuihSI5WkD8n
	e/Ju3d/KyQh0Osjg2GwqrlCNMiqgDdcxAUlnCEVT/+O7WLmzSfxEqc+QY9BPCOx/CNbaRIfqEZ3Es
	yA1E5MzfJ6JZuMRy1K7LZ05WsGU+nQSxQx2Fuu0AvFq6yuexRyzbVcQUHQ37Gb1iLIKovuRO/CFdC
	SYuWjW0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itUa2-0004In-Qx; Mon, 20 Jan 2020 10:46:50 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itUZy-0004GK-97
 for linux-snps-arc@lists.infradead.org; Mon, 20 Jan 2020 10:46:49 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AF809C04F8;
 Mon, 20 Jan 2020 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579517202; bh=9OsmDYeAY6aRy26MuAS75rQTPFqjYqmTeRhZgRlfd4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XSbz9MB2/dRuIay5L7lKmG1opifLa/Jm7f/3I8eTn9ZjMiaxegRaAuGKYGgOz7DWx
 XxmffZskT9O3GLvwxaVdVkE2SZrKtzxx5XU87zPOLR4b9B7UZhJoKMU3WW3OUpj4p2
 UKG7AuGUvAM+tFY6GXR0viS95ptkKhZjsHnqJnPdS4rCJpmjtOUXhHYTaVmM+IHbq1
 v2qBiGk2rhPLH0Kuq/Il/E1jQf7OmNtYO1YUw+hl0sla7oeoYpiaGCesj4OHcMgZVe
 Z51DzqxwNBGf4li/H6ENEhv72A3J9EqttnzZX20aOxBFbnyoLC+urAu3vs0xhEBqRe
 vM3biDvWSOiPw==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id 1C42FA006A;
 Mon, 20 Jan 2020 10:46:40 +0000 (UTC)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: u-boot@lists.denx.de
Subject: [PATCH 3/3] ARC: nsim_hs38: Add support of Virtio NET & BLK
Date: Mon, 20 Jan 2020 13:46:35 +0300
Message-Id: <20200120104635.33290-4-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20200120104635.33290-1-abrodkin@synopsys.com>
References: <20200120104635.33290-1-abrodkin@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_024646_430250_CCB3E1B6 
X-CRM114-Status: GOOD (  17.49  )
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

Note so far we don't have device tree descriptions synced from
the mainline Linux kernel (which we'll need to do anyway at some point)
and as of now we keep U-Boot's device trees as minimalistic as possible
in nSIM description we had to add core's interrupt controller node and
set it as everyone's interrupt-parent. That's required to make buildman
happy. Otherwise it complains like that:
------------------------>8------------------------
w+arch/arc/dts/nsim.dtb: Warning (interrupts_property): /virtio@f0100000: Missing interrupt-parent
------------------------>8------------------------

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 arch/arc/Kconfig                  |  4 ++--
 arch/arc/dts/nsim.dts             | 36 ++++++++++++++++++++++++++++++++++++
 board/synopsys/{ => nsim}/Kconfig |  3 +++
 board/synopsys/nsim/MAINTAINERS   |  6 ++++++
 board/synopsys/nsim/Makefile      |  7 +++++++
 board/synopsys/nsim/nsim.c        | 26 ++++++++++++++++++++++++++
 configs/nsim_hs38_defconfig       |  9 +++++++++
 7 files changed, 89 insertions(+), 2 deletions(-)
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
index a3f3964d35..a902c4c4fa 100644
--- a/arch/arc/dts/nsim.dts
+++ b/arch/arc/dts/nsim.dts
@@ -8,6 +8,7 @@
 
 / {
 	model = "snps,nsim";
+	interrupt-parent = <&core_intc>;
 
 	aliases {
 		console = &uart0;
@@ -20,6 +21,12 @@
 			clock-frequency = <70000000>;
 			u-boot,dm-pre-reloc;
 		};
+
+		core_intc: interrupt-controller {
+			compatible = "snps,archs-intc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
 	};
 
 	uart0: serial@f0000000 {
@@ -30,4 +37,33 @@
 		clock-frequency = <70000000>;
 	};
 
+	virtio0: virtio@f0100000 {
+		compatible = "virtio,mmio";
+		reg = <0xf0100000 0x2000>;
+		interrupts = <31>;
+	};
+
+	virtio1: virtio@f0102000 {
+		compatible = "virtio,mmio";
+		reg = <0xf0102000 0x2000>;
+		interrupts = <32>;
+	};
+
+	virtio2: virtio@f0104000 {
+		compatible = "virtio,mmio";
+		reg = <0xf0104000 0x2000>;
+		interrupts = <33>;
+	};
+
+	virtio3: virtio@f0106000 {
+		compatible = "virtio,mmio";
+		reg = <0xf0106000 0x2000>;
+		interrupts = <34>;
+	};
+
+	virtio4: virtio@f0108000 {
+		compatible = "virtio,mmio";
+		reg = <0xf0108000 0x2000>;
+		interrupts = <35>;
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
index 0000000000..ed4b9a9e78
--- /dev/null
+++ b/board/synopsys/nsim/MAINTAINERS
@@ -0,0 +1,6 @@
+EM DEVELOPMENT KIT BOARD
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
