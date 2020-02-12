Return-Path: <SRS0=vxQV=4A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC079C3F68F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 17:44:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AB021569
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 17:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="red4YHku";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bvVSCoqd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86AB021569
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RMZdIRUOKM04TC8Xi1mzpcfl33BkOMzLgzNFfI75GqU=; b=red
	4YHkureF4AYTLVnS9FAdslzmPN1rZzsNHK2EUW1xHLXWgNYvmlk/C8MIaSJdQD1GKYuYJdK7f55Qp
	66v5zzZP04egjEqacM9GaG8Lqa8HZSjAQ9GTxOuGCn2m2EL2iHovElUFMjtyLwM0G+wPMLQiwM7U6
	TnWTuha1RiGXLlpcIsNeOfmtocTo9hwKpbP9ICugO0FInVROoOKtAvU8dBnJlqpQUZ3/Xp6mk6yqv
	DJB6jUdnsfVPGWFUdWAHeA3UdFXVQz8rPsPm/R3cUCClh3wXBD3quX2bckRMI+noCJ9heoXbQjZLB
	Xw6iUjFFkAbed5U8gDisTLrxa5sHTkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1w4C-0008EM-5q; Wed, 12 Feb 2020 17:44:52 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1w49-0008DF-DO
 for linux-snps-arc@lists.infradead.org; Wed, 12 Feb 2020 17:44:50 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DEF06C0630;
 Wed, 12 Feb 2020 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1581529488; bh=vdWoe+X6h+9QfPGSzqW5QiqRs7q+4fW/fqKVUnM7oAI=;
 h=From:To:Cc:Subject:Date:From;
 b=bvVSCoqdDHY+v7QiwvfHzn2NuvDVvj8xI2lUmn+PDVCkiwG812qx9N8Ra6+CinLcx
 Eyx1MSQ+RN5og9FL0VfhDPh1GfvXGwBNRdQgS7LZQrUTk9nxm9fwPt8I2SEfbxseXP
 VznrDxJrAjkBH4UdvCAniiC5mVfPqqutlhzjhghvlxdSEBWFzkDHy2CX5taBtFw29v
 9mpJP8yNiSriDaANjRJRdC5TUS7MJDatfCMgJ1eWsyMRchNgzL8Yd17Y5CJFHH3FL6
 pOTSmKf1zWtkk1DxLD4f76X4OdjAohGN4hzfBqm6wEfxQU4/FdT7yx1QgR2AYdtMSS
 0Y4CoLh/jTr4A==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4E882A0067;
 Wed, 12 Feb 2020 17:44:45 +0000 (UTC)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: u-boot@lists.denx.de
Subject: [PATCH 1/3 v2] ARC: nSIM: switch from ARC UART to DW UART
Date: Wed, 12 Feb 2020 20:44:41 +0300
Message-Id: <20200212174443.37707-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_094449_569932_E61183BC 
X-CRM114-Status: GOOD (  10.92  )
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

Changes v1 -> v2:

 * Copyright year bumped to 2020.

 arch/arc/dts/nsim.dts         | 12 +++++++-----
 configs/nsim_700_defconfig    |  8 ++++----
 configs/nsim_700be_defconfig  |  8 ++++----
 configs/nsim_hs38_defconfig   |  8 ++++----
 configs/nsim_hs38be_defconfig |  8 ++++----
 5 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/arch/arc/dts/nsim.dts b/arch/arc/dts/nsim.dts
index 243ecb178e..43f281dfec 100644
--- a/arch/arc/dts/nsim.dts
+++ b/arch/arc/dts/nsim.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Copyright (C) 2015-2016 Synopsys, Inc. (www.synopsys.com)
+ * Copyright (C) 2015-2016, 2020 Synopsys, Inc. (www.synopsys.com)
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
