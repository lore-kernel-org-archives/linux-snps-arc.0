Return-Path: <SRS0=Jbu3=YQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B71CA9EBF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Oct 2019 12:44:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23ED021928
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Oct 2019 12:44:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bCgkfNM+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="P3vHRqK9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23ED021928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0tTbxBA1xKABQB/BUJSq5nagB2QAfbq1KabvVEBBFo=; b=bCgkfNM+b8pu7o
	sf49RcUjwDBlqjjZMxVw4wzt0i4ndcLluL5Ehegx8iCj01QPj2jEZhRv5OGQKre3+xbgm0JA988hV
	PHV8+Pls6pm3I5Qa5QK0kVB1qk9uHC4dY06z+ifJqFvH1FieRXkrHMX7evWFilaTL/J79WPswdKZv
	8ESjF9kkCDtar2di67kI+mJ+y5OBuq8otssRd1i2I9ciy0uxhfYkNcbrPvVlxI2OV/PxGF06cyE2m
	z4TSv6vFo8ZQ8tmroiozUGKf8+S/zhUPyoCYtxKAackgnCX0aoPDcklK8/paDt6AHVuvvcUj+7yMW
	EdJugE4F6VHA+AcTG/UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNG0A-0008Nr-4A; Wed, 23 Oct 2019 12:44:34 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNG03-0008IV-VV
 for linux-snps-arc@lists.infradead.org; Wed, 23 Oct 2019 12:44:32 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6B6DDC08DD;
 Wed, 23 Oct 2019 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571834667; bh=E8g39bo7xM+VQE70QKbT9O0p8rPYtJ1LN4ovj5afXJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P3vHRqK9YyBTGlfngyd0pcURocD1QogvCpA3c1brd3p6FopwFBcfh5reLnxfvsw/V
 0owo2qG3N+YtHG93tYxLMUIQM7jOmXbSlHCXwI0SljlTlRWQ9XXGYCLui4A2r6ES/W
 zCAzik01+QecObKeZPFLdryWlxRuqBtJ3OT4pLd+5wSNQ83crq0UxQt7nMTgABAdgo
 3pGhpiG59FMtQdccX7RKGdqroC8jfqbMwP4rlIZfXp8GLdXECN+93n8sScQJjCwRHV
 is26pe88JE8xdBrYl+PgWhiEtLhrt6oH1allMKHFQEQJbWc+RidTTilj0pLVkNZxZy
 1C7IqOAdGZpIA==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.73])
 by mailhost.synopsys.com (Postfix) with ESMTP id D17D9A0057;
 Wed, 23 Oct 2019 12:44:25 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 8/8] ARC: nSIM_700: remove unused network options
Date: Wed, 23 Oct 2019 15:44:17 +0300
Message-Id: <20191023124417.5770-9-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023124417.5770-1-Eugeniy.Paltsev@synopsys.com>
References: <20191023124417.5770-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_054428_127484_ADC67195 
X-CRM114-Status: GOOD (  10.15  )
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

We have snps,arc-emac enabled in nSIM_700. It's obsolete and it's
not used anymore so remove its device tree node and disable
unused network options in defconfig.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/boot/dts/nsim_700.dts      | 16 ----------------
 arch/arc/configs/nsim_700_defconfig |  4 ++--
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/arc/boot/dts/nsim_700.dts b/arch/arc/boot/dts/nsim_700.dts
index ae9bc21fe11b..f8832a15e174 100644
--- a/arch/arc/boot/dts/nsim_700.dts
+++ b/arch/arc/boot/dts/nsim_700.dts
@@ -52,22 +52,6 @@
 			no-loopback-test = <1>;
 		};
 
-		ethernet@c0fc2000 {
-			compatible = "snps,arc-emac";
-			reg = <0xc0fc2000 0x3c>;
-			interrupts = <6>;
-			mac-address = [ 00 11 22 33 44 55 ];
-			clock-frequency = <80000000>;
-			max-speed = <100>;
-			phy = <&phy0>;
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-			phy0: ethernet-phy@0 {
-				reg = <1>;
-			};
-		};
-
 		arcpct0: pct {
 			compatible = "snps,arc700-pct";
 		};
diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index 5c488140f537..326f6cde7826 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -35,8 +35,8 @@ CONFIG_DEVTMPFS=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_BLK_DEV is not set
 CONFIG_NETDEVICES=y
-CONFIG_ARC_EMAC=y
-CONFIG_LXT_PHY=y
+# CONFIG_ETHERNET is not set
+# CONFIG_WLAN is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
