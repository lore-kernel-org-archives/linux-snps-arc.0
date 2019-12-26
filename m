Return-Path: <SRS0=Fwa9=2Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF55C2D0DC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Dec 2019 13:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D358F20828
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Dec 2019 13:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IvRaFTpW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bmyummAj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D358F20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vrt2VZr07N8Gv0HaNTBXLrBUrJMp+Ro91VmffmfQ+Y4=; b=IvRaFTpWPNgPZ6JjtzZCs7BYJ1
	Nt0EViJmLiPtSglVLUGt7jGAB8FObjTBAyRAX54e9591F4laR6s53gz1BB3Xa4v5+Hnaaz/vSEDaJ
	zWpgiaN+J35C26c4SQzKW1AXND5oTN7IGhORX6BA7DITwP6LXZefcKXhuOZwI/Rqr+4x+kSoiopGc
	tyFlm5ai8NiL6akVaWuCsreuAvPBeICGZkzEBKCtv1ppCd9pmNHiWo2CVbXurJv1bC9uHZ6KxPCN0
	+TFknEh/UhY/0c4J6xF1WRkL1ZwlTV3GC5SFURXy6zFhKtCqJpMkdRwK1um6xUhzMwVnJLk678DNR
	YKCCwpqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikTEm-0006dB-Vn; Thu, 26 Dec 2019 13:31:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikTEk-0006cF-5k
 for linux-snps-arc@lists.infradead.org; Thu, 26 Dec 2019 13:31:35 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 65117C0963;
 Thu, 26 Dec 2019 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1577367092; bh=9hNjPN5JegrAlPQCeDdpzlwk09YMaZRioVttgMtg9NA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bmyummAjL8gb4WZrPVwex/oDtFYRChIULWGRNhFick2Ournuz8AMhqZP5IDo6cEcj
 LXvrJkox2CadS9KP69yc169r0VPH/9EybG4E5j/N2aC/p9XgMlWrkRywLrD/TU/n9+
 2J/w8zYBbT3g1FNa5OzEkR2gSkSMP/Yp6DDDSZPg9Kq+tUvfYANSoPsJIsDUSmBgge
 TR1mac2L1Uth5EuYfdec2tpddioyKprzkQlrv1RveS03ptW9oeucxt5hZI+5TDTGFz
 ofEdPrysQQ5AobEJONlaqfS2F6d2gqoPumA3mqyFl8+xFOnjmQQPFjvOq9ykBobH/Q
 n2mGucBve9Jbg==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id D9BE9A005C;
 Thu, 26 Dec 2019 13:31:30 +0000 (UTC)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: u-boot@lists.denx.de
Subject: [PATCH 1/3] ARC: nSIM: switch from ARC UART to DW UART
Date: Thu, 26 Dec 2019 16:31:23 +0300
Message-Id: <20191226133125.47973-2-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20191226133125.47973-1-abrodkin@synopsys.com>
References: <20191226133125.47973-1-abrodkin@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_053134_276648_95A721F5 
X-CRM114-Status: GOOD (  11.24  )
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

Since v2019.06 DesingWare nSIM supports DesignWare UART simulation
and so we may switch from pretty unusual ARC UART to much more standard
DesignWare UART (which in case of U-Boot is just an ordinary 16650 UART).

This among other things makes built dinaries compatible with our other
platforms to name a few: FPGA-based HAPS boards, QEMU and even ZeBU.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 arch/arc/dts/nsim.dts         | 12 +++++++-----
 configs/nsim_700_defconfig    |  8 ++++----
 configs/nsim_700be_defconfig  |  8 ++++----
 configs/nsim_hs38_defconfig   |  8 ++++----
 configs/nsim_hs38be_defconfig |  8 ++++----
 5 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/arch/arc/dts/nsim.dts b/arch/arc/dts/nsim.dts
index 243ecb178e..a3f3964d35 100644
--- a/arch/arc/dts/nsim.dts
+++ b/arch/arc/dts/nsim.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Copyright (C) 2015-2016 Synopsys, Inc. (www.synopsys.com)
+ * Copyright (C) 2015-2016, 2019 Synopsys, Inc. (www.synopsys.com)
  */
 /dts-v1/;
 
@@ -10,7 +10,7 @@
 	model = "snps,nsim";
 
 	aliases {
-		console = &arcuart0;
+		console = &uart0;
 	};
 
 	cpu_card {
@@ -22,9 +22,11 @@
 		};
 	};
 
-	arcuart0: serial@0xc0fc1000 {
-		compatible = "snps,arc-uart";
-		reg = <0xc0fc1000 0x100>;
+	uart0: serial@f0000000 {
+		compatible = "snps,dw-apb-uart";
+		reg = <0xf0000000 0x1000>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
 		clock-frequency = <70000000>;
 	};
 
diff --git a/configs/nsim_700_defconfig b/configs/nsim_700_defconfig
index 5633113b09..2d4a58b178 100644
--- a/configs/nsim_700_defconfig
+++ b/configs/nsim_700_defconfig
@@ -1,13 +1,13 @@
 CONFIG_ARC=y
 CONFIG_TARGET_NSIM=y
 CONFIG_SYS_TEXT_BASE=0x81000000
-CONFIG_DEBUG_UART_BASE=0xc0fc1000
+CONFIG_DEBUG_UART_BASE=0xf0000000
 CONFIG_DEBUG_UART_CLOCK=70000000
 CONFIG_SYS_CLK_FREQ=70000000
 CONFIG_DEBUG_UART=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
-CONFIG_BOOTARGS="console=ttyARC0,115200n8"
+CONFIG_BOOTARGS="console=ttyS0,115200n8"
 CONFIG_SYS_PROMPT="nsim# "
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_OF_CONTROL=y
@@ -16,6 +16,6 @@ CONFIG_DEFAULT_DEVICE_TREE="nsim"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_DM_SERIAL=y
-CONFIG_DEBUG_ARC_SERIAL=y
-CONFIG_ARC_SERIAL=y
+CONFIG_DEBUG_UART_SHIFT=2
+CONFIG_SYS_NS16550=y
 CONFIG_USE_PRIVATE_LIBGCC=y
diff --git a/configs/nsim_700be_defconfig b/configs/nsim_700be_defconfig
index 40f7ec7e1f..61eea91449 100644
--- a/configs/nsim_700be_defconfig
+++ b/configs/nsim_700be_defconfig
@@ -2,13 +2,13 @@ CONFIG_ARC=y
 CONFIG_CPU_BIG_ENDIAN=y
 CONFIG_TARGET_NSIM=y
 CONFIG_SYS_TEXT_BASE=0x81000000
-CONFIG_DEBUG_UART_BASE=0xc0fc1000
+CONFIG_DEBUG_UART_BASE=0xf0000000
 CONFIG_DEBUG_UART_CLOCK=70000000
 CONFIG_SYS_CLK_FREQ=70000000
 CONFIG_DEBUG_UART=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
-CONFIG_BOOTARGS="console=ttyARC0,115200n8"
+CONFIG_BOOTARGS="console=ttyS0,115200n8"
 CONFIG_SYS_PROMPT="nsim# "
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_OF_CONTROL=y
@@ -17,6 +17,6 @@ CONFIG_DEFAULT_DEVICE_TREE="nsim"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_DM_SERIAL=y
-CONFIG_DEBUG_ARC_SERIAL=y
-CONFIG_ARC_SERIAL=y
+CONFIG_DEBUG_UART_SHIFT=2
+CONFIG_SYS_NS16550=y
 CONFIG_USE_PRIVATE_LIBGCC=y
diff --git a/configs/nsim_hs38_defconfig b/configs/nsim_hs38_defconfig
index 2820a6fca3..ce68de3251 100644
--- a/configs/nsim_hs38_defconfig
+++ b/configs/nsim_hs38_defconfig
@@ -2,13 +2,13 @@ CONFIG_ARC=y
 CONFIG_ISA_ARCV2=y
 CONFIG_TARGET_NSIM=y
 CONFIG_SYS_TEXT_BASE=0x81000000
-CONFIG_DEBUG_UART_BASE=0xc0fc1000
+CONFIG_DEBUG_UART_BASE=0xf0000000
 CONFIG_DEBUG_UART_CLOCK=70000000
 CONFIG_SYS_CLK_FREQ=70000000
 CONFIG_DEBUG_UART=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
-CONFIG_BOOTARGS="console=ttyARC0,115200n8"
+CONFIG_BOOTARGS="console=ttyS0,115200n8"
 CONFIG_SYS_PROMPT="nsim# "
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_OF_CONTROL=y
@@ -17,6 +17,6 @@ CONFIG_DEFAULT_DEVICE_TREE="nsim"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_DM_SERIAL=y
-CONFIG_DEBUG_ARC_SERIAL=y
-CONFIG_ARC_SERIAL=y
+CONFIG_DEBUG_UART_SHIFT=2
+CONFIG_SYS_NS16550=y
 CONFIG_USE_PRIVATE_LIBGCC=y
diff --git a/configs/nsim_hs38be_defconfig b/configs/nsim_hs38be_defconfig
index e533fae2b1..5d2ea59d52 100644
--- a/configs/nsim_hs38be_defconfig
+++ b/configs/nsim_hs38be_defconfig
@@ -3,13 +3,13 @@ CONFIG_ISA_ARCV2=y
 CONFIG_CPU_BIG_ENDIAN=y
 CONFIG_TARGET_NSIM=y
 CONFIG_SYS_TEXT_BASE=0x81000000
-CONFIG_DEBUG_UART_BASE=0xc0fc1000
+CONFIG_DEBUG_UART_BASE=0xf0000000
 CONFIG_DEBUG_UART_CLOCK=70000000
 CONFIG_SYS_CLK_FREQ=70000000
 CONFIG_DEBUG_UART=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
-CONFIG_BOOTARGS="console=ttyARC0,115200n8"
+CONFIG_BOOTARGS="console=ttyS0,115200n8"
 CONFIG_SYS_PROMPT="nsim# "
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_OF_CONTROL=y
@@ -18,6 +18,6 @@ CONFIG_DEFAULT_DEVICE_TREE="nsim"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_DM_SERIAL=y
-CONFIG_DEBUG_ARC_SERIAL=y
-CONFIG_ARC_SERIAL=y
+CONFIG_DEBUG_UART_SHIFT=2
+CONFIG_SYS_NS16550=y
 CONFIG_USE_PRIVATE_LIBGCC=y
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
