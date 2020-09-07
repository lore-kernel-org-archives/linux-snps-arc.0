Return-Path: <SRS0=uRvJ=CQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C344C2BB84
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Sep 2020 17:45:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7D51208C7
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Sep 2020 17:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a5EGFfZv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+86teF0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7D51208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dBA8zMlmZgK+UMaNWAtNgoeyboR1HMmok8GMoiJtTi8=; b=a5EGFfZvIcV1WaVDZpTgxW7Fv
	nPXc2kcCNavnAAFaHdPb/Z+hIWwVJ+Piau4MxjpadUTaM7205nBPBqB75ZCDUo6AiXWoa1sznWX0D
	jBSHrS5GzckyaGzyg8Fk3GCUmiKrNXWjsVQKNgDd0XGl3XfOVh1fFMj6eVkKK7QEKBev10KcHiJfM
	e7EhVIQkIQ3jgqcm/7tlF/tKskUKlVzfXdndB94L/elxdW+YI/+dlbwFa8SR+whkKD1rM9dqgEvep
	ka2ek1Jyg/qijYXC5NggHHex1st9JbIn8VinbUaDpoOu7ntN+uqgL/xR9BcULXfNQZ3+0xEXyB/1S
	V+xSh3S/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFLCq-0002uL-Ac; Mon, 07 Sep 2020 17:45:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFK6x-0006Oo-6U
 for linux-snps-arc@lists.infradead.org; Mon, 07 Sep 2020 16:35:24 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72CC621D90;
 Mon,  7 Sep 2020 16:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496518;
 bh=WhEs5l16HJrcxCVT8+jiGeRbizmKVAf1pNc6obzvIWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h+86teF0Tq5yU5FVZzhHSWAM/PL2f7P/2ys/sHl+Dzpw2IMGTcA9B0eq5br2vI92L
 nUB54MEYlV00zRyIUwoyr5dhvPVT5es+7NbYpz+giZ72e1BTB7c/yuAVWQtywcz9Lh
 yJkgX+CTwNx0fCAEBwXQ/rfNSuKjifmWFEDscMXo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 13/17] ARC: [plat-hsdk]: Switch ethernet phy-mode
 to rgmii-id
Date: Mon,  7 Sep 2020 12:34:56 -0400
Message-Id: <20200907163500.1281543-13-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163500.1281543-1-sashal@kernel.org>
References: <20200907163500.1281543-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_123519_508714_116AC341 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>

[ Upstream commit 26907eb605fbc3ba9dbf888f21d9d8d04471271d ]

HSDK board has Micrel KSZ9031, recent commit
bcf3440c6dd ("net: phy: micrel: add phy-mode support for the KSZ9031 PHY")
caused a breakdown of Ethernet.
Using 'phy-mode = "rgmii"' is not correct because accodring RGMII
specification it is necessary to have delay on RX (PHY to MAX)
which is not generated in case of "rgmii".
Using "rgmii-id" adds necessary delay and solves the issue.

Also adding name of PHY placed on HSDK board.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/boot/dts/hsdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index aeacea148793c..75aa3a8f9fdc9 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -163,7 +163,7 @@ ethernet@8000 {
 			reg = <0x8000 0x2000>;
 			interrupts = <10>;
 			interrupt-names = "macirq";
-			phy-mode = "rgmii";
+			phy-mode = "rgmii-id";
 			snps,pbl = <32>;
 			snps,multicast-filter-bins = <256>;
 			clocks = <&gmacclk>;
@@ -179,7 +179,7 @@ mdio {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "snps,dwmac-mdio";
-				phy0: ethernet-phy@0 {
+				phy0: ethernet-phy@0 { /* Micrel KSZ9031 */
 					reg = <0>;
 					ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 					ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
