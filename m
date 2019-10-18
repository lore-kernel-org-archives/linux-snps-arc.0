Return-Path: <SRS0=z5VF=YL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3F9CA9EA1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 11:11:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF0F20854
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 11:11:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sGg7SHcW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ze1abby5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF0F20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nyyou/ICbIp4QRn5JGOkkIn5SQwNlu7FyWY30dMKfJM=; b=sGg7SHcWtQIEqS
	3r2wg249nO/H2A+7SMPtyKOY6+SXB+yn1RKNn0ZLsMSu3l4aTgSkLYsaSlU/bu1kSg8jKkL0gfNwK
	DdQeo6GPlMHyaurHdx3oi+bx1pViknEI0q7MQfT4k9QL19b3rV1EOMpvyJe0Jk66AL415rV/Lewnd
	wHbyqaO1odvOl/U8vl68snCfXS4L+pgQqKyspajSmg+Duwleq/R0qJG8yhdU91dyQWZu7i32fD2t5
	u0OYWs8Tj0d+iWyjk2qy6Ni1d5grKwGiU7Lj/p7pSsSqFYPU7wLhbA9wiYprJNNBwdRju+mba9sE3
	hru6VwOD7AvAOqAoE+zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLQAT-0006ow-HE; Fri, 18 Oct 2019 11:11:37 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLQAR-0006na-5c
 for linux-snps-arc@lists.infradead.org; Fri, 18 Oct 2019 11:11:36 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 71A4CC0488;
 Fri, 18 Oct 2019 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571397092; bh=HJga7B0ouM1COkEsJgMK2mlF5wYeXphpoMGtMGta1RQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ze1abby512NWxvUqRr6h+4NwB+YQyfrZpiGDyBUm+7vNoM/qQg3Tnf8Ch488M8u82
 rPWMyRMHnS0sl9NEWv1tEMJ2dJ+w2Kz83bKqg2zcMmzvuVHb10wqIz2kOi/FlOefzn
 FlfUDPlFirXImYNcG/s5R54NKx1vkg0dgPY+vODUdzlNnnDL46dDw8hpio/OfS6acm
 2iqW1LBD4UVrPXX6pFZAf8n85YygkBHLQN3rS2z7c5pKh0NVs8vZpW4RRoxaBWGGP7
 e6bOB9VWknheqoMIU2YBwAnU39+9L6x9008DWbwZSR4+A+Hln5Ig7U8YhcQlZf6351
 fuD7h1O9e5CeA==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.73])
 by mailhost.synopsys.com (Postfix) with ESMTP id AAB22A0065;
 Fri, 18 Oct 2019 11:11:30 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 2/2] ARC: [plat-hsdk]: Enable on-boardi SPI ADC IC
Date: Fri, 18 Oct 2019 14:11:26 +0300
Message-Id: <20191018111126.5246-3-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018111126.5246-1-Eugeniy.Paltsev@synopsys.com>
References: <20191018111126.5246-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_041135_222883_8BDBEA10 
X-CRM114-Status: UNSURE (   8.59  )
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
Cc: devicetree@vger.kernel.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

HSDK board has adc108s102 SPI ADC IC installed, enable it.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/boot/dts/hsdk.dts      | 15 +++++++++++++++
 arch/arc/configs/hsdk_defconfig |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 9bea5daadd23..9acbeba832c0 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -65,6 +65,14 @@
 		clock-frequency = <33333333>;
 	};
 
+	reg_5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "5v0-supply";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
 	cpu_intc: cpu-interrupt-controller {
 		compatible = "snps,archs-intc";
 		interrupt-controller;
@@ -272,6 +280,13 @@
 				#size-cells = <1>;
 				spi-max-frequency = <4000000>;
 			};
+
+			adc@1 {
+				compatible = "ti,adc108s102";
+				reg = <1>;
+				vref-supply = <&reg_5v0>;
+				spi-max-frequency = <1000000>;
+			};
 		};
 
 		creg_gpio: gpio@14b0 {
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 22fc70396a3b..0974226fab55 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -57,6 +57,8 @@ CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SNPS_CREG=y
 # CONFIG_HWMON is not set
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 # CONFIG_DRM_FBDEV_EMULATION is not set
 CONFIG_DRM_UDL=y
@@ -74,6 +76,8 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 CONFIG_DMADEVICES=y
 CONFIG_DW_AXI_DMAC=y
+CONFIG_IIO=y
+CONFIG_TI_ADC108S102=y
 CONFIG_EXT3_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
