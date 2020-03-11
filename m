Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D4CC10F27
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 12:37:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99B66208E4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 12:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LouaRQx0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="liL+tt2O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99B66208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iSLEYl6wn5vSVzwey7LRAmmEXzI/FGJeaOEWmJ1DmV0=; b=LouaRQx0cro3E4
	wpYUVFc6O9+SuFvdQr9xk57UN/Sclwmteu6S9Xt6KnQcCs+TXmtV8tDHXryjvE3jY3rqyUfo15ESc
	T6ozi1KM7KxcMRTcAyoQxkjIraozuFU6H+zTYd4z0xHkxqJ1y4FCw/mR1A60j/C5pai5w4x7kXTBy
	kJ9JofdH7JIzhaFcrpupHuNYZyc80O/fZoS41grGICSe/FxPW4aVc/s64D6b/FFuwqTItinALCnNv
	7Ho+5wfvPA3SgR3fuyeFM78Fylcr8eP5bet1k6kKYESMcW3vgJdNLbDHjwmcjlpjnTtP1aDfWusz9
	/kurT2ghA3H4rfcXhUKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC0c8-0004kx-Jn; Wed, 11 Mar 2020 12:37:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC0c5-0004kC-NZ
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 12:37:30 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 736DCC0F5D;
 Wed, 11 Mar 2020 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583930248; bh=4V30/M1N6AR0dX13F06JfGScXuMkAt2m2Tf73QNS2Tk=;
 h=From:To:Cc:Subject:Date:From;
 b=liL+tt2O6PoFyt+tpmUcAPP31rMWqkAr3pCQkeIOST1X0dMbhkBiI90R9zKr12PNY
 H1og/K3Wa2iZq6YmV6VI6Grbqws0Tr8kOt86L66PxPIcFY/0bknJrxOzD/9CqoEXvX
 lAb09s36pT5Ki7EoD99DkYK3ZhZNhSdSSDJ/c7RZIZT2bwiarDCMGDFtssbKH2xwY8
 feKpbaNxSUHfkhbcwD8djlemNxX0lk3IMuBjNnBYidIGwPfOXIEjlTmMxSLR93WXKj
 ngUdl8DYxGc5Bv7/o/60w3CQAIBsV8UP/ncTUpxDsY49+Rclk3idL8kyqRW2OzYvT/
 i1Nddu2uWVDLA==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id D978AA005C;
 Wed, 11 Mar 2020 12:37:24 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: uboot-snps-arc@synopsys.com, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] ARC: HSDK: Enable on-chip reset controller
Date: Wed, 11 Mar 2020 15:37:23 +0300
Message-Id: <20200311123723.17020-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_053729_800991_C4F50FD2 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

As the driver of on-chip reset controller became available
we are ready to enable it.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/dts/hsdk.dts  | 7 +++++++
 configs/hsdk_defconfig | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arc/dts/hsdk.dts b/arch/arc/dts/hsdk.dts
index 34ef3a620a3..cf2ce8a1f6c 100644
--- a/arch/arc/dts/hsdk.dts
+++ b/arch/arc/dts/hsdk.dts
@@ -6,6 +6,7 @@
 
 #include "skeleton.dtsi"
 #include "dt-bindings/clock/snps,hsdk-cgu.h"
+#include "dt-bindings/reset/snps,hsdk-reset.h"
 
 / {
 	model = "snps,hsdk";
@@ -62,6 +63,12 @@
 		#clock-cells = <1>;
 	};
 
+	cgu_rst: reset-controller@f00008a0 {
+		compatible = "snps,hsdk-reset";
+		#reset-cells = <1>;
+		reg = <0xf00008a0 0x4>, <0xf0000ff0 0x4>;
+	};
+
 	uart0: serial0@f0005000 {
 		compatible = "snps,dw-apb-uart";
 		reg = <0xf0005000 0x1000>;
diff --git a/configs/hsdk_defconfig b/configs/hsdk_defconfig
index 4830158d55a..84b22ed7c04 100644
--- a/configs/hsdk_defconfig
+++ b/configs/hsdk_defconfig
@@ -47,6 +47,7 @@ CONFIG_SPI_FLASH_SST=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
+CONFIG_DM_RESET=y
 CONFIG_DM_SERIAL=y
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_DEBUG_UART_ANNOUNCE=y
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
