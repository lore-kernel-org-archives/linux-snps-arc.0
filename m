Return-Path: <SRS0=Jbu3=YQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F3ECA9EB6
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Oct 2019 12:50:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AADF21872
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Oct 2019 12:44:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SnM6xmZy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XWcqQkds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AADF21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jv/ARzysqdCMI20tbhdWlg5+R2XImHtvYmmHjexUIM8=; b=SnM6xmZy/Qsh9j
	6IGfK0NxBdwxo/NokB4pPpZJz7x1gNxzj0QGiFCb1F0MdQ2IyohsZIgOnnKc3vnaxU+m4DJHndIll
	VBujkyGXIaBbPWkJx0uLMseYLTjgtMyNZSnsdw1f+k6S5fZmuE7IX2HNS6xDtKyvqxmFiCi9pHqvy
	4hsb5vWU0D0rJfVYRt/EJah+XgTm5QJXMMQ3MH6puRYDdzgxn2AxNigstEnp/zTOFX9VNzMTNYin7
	BnSflP21JNktLi7oERah1asuZSvHBIHkN+jZSMnQv4/oJXkvERnmL6ALIlgK9/zVB8LQSwKMqxCi4
	G0Dw3jxyDhaXH3urwb+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNG08-0008MC-2J; Wed, 23 Oct 2019 12:44:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNG03-0008HY-QK
 for linux-snps-arc@lists.infradead.org; Wed, 23 Oct 2019 12:44:29 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E46A7C08DC;
 Wed, 23 Oct 2019 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571834667; bh=qN0rSodS4JuRavweefSl8WXWBTCICvu2blOfps/0DJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XWcqQkdsjtra4h9ntvGkqve1A4FjUX3FYx/8jJrTvM2oGN7DajELigQ9LuPRihzwd
 SA60uYuqoBFQoWjN+/M8EA+lIUgr66mwUEcQ+Ag6//IbzZdfWC/8u2yNpxQBhLqjTy
 7ATSvXcIlJ1auE+kU6W74ySeP3D9MHlCSqigMDRkExqtexpHy8WWkf7dujc2Exzv0W
 XIXZC7+B7oJPtRNn9gFmneSiYxhU2XmHLmfQDX38JANBoRvPNdxq2VzPN8Guib0urP
 zRfuUaEwxv+pAgbcyduueuUYjUio6v5lGexJypnavAnDesg6cSxT4p8ny2ZMaYvwdy
 i/X7SaUZ+GTIw==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.73])
 by mailhost.synopsys.com (Postfix) with ESMTP id 54C38A0067;
 Wed, 23 Oct 2019 12:44:25 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 7/8] ARC: nSIM_700: switch to DW UART usage
Date: Wed, 23 Oct 2019 15:44:16 +0300
Message-Id: <20191023124417.5770-8-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023124417.5770-1-Eugeniy.Paltsev@synopsys.com>
References: <20191023124417.5770-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_054427_925033_3F832B4C 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Switch nsim_700_defconfig to dwuart for consistent uart settings
for all nSIM configurations.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/boot/dts/nsim_700.dts      | 20 +++++++++++---------
 arch/arc/configs/nsim_700_defconfig |  8 ++++++--
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/arc/boot/dts/nsim_700.dts b/arch/arc/boot/dts/nsim_700.dts
index 63dbaab1247d..ae9bc21fe11b 100644
--- a/arch/arc/boot/dts/nsim_700.dts
+++ b/arch/arc/boot/dts/nsim_700.dts
@@ -14,11 +14,11 @@
 	interrupt-parent = <&core_intc>;
 
 	chosen {
-		bootargs = "earlycon=arc_uart,mmio32,0xc0fc1000,115200n8 console=ttyARC0,115200n8 print-fatal-signals=1";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=ttyS0,115200n8 print-fatal-signals=1";
 	};
 
 	aliases {
-		serial0 = &arcuart0;
+		serial0 = &uart0;
 	};
 
 	fpga {
@@ -41,13 +41,15 @@
 			#interrupt-cells = <1>;
 		};
 
-		arcuart0: serial@c0fc1000 {
-			compatible = "snps,arc-uart";
-			reg = <0xc0fc1000 0x100>;
-			interrupts = <5>;
-			clock-frequency = <80000000>;
-			current-speed = <115200>;
-			status = "okay";
+		uart0: serial@f0000000 {
+			compatible = "ns16550a";
+			reg = <0xf0000000 0x2000>;
+			interrupts = <24>;
+			clock-frequency = <50000000>;
+			baud = <115200>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			no-loopback-test = <1>;
 		};
 
 		ethernet@c0fc2000 {
diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index 9b2653b0b349..5c488140f537 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -41,8 +41,12 @@ CONFIG_LXT_PHY=y
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 # CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_ARC=y
-CONFIG_SERIAL_ARC_CONSOLE=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=1
+CONFIG_SERIAL_8250_RUNTIME_UARTS=1
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
 # CONFIG_HID is not set
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
