Return-Path: <SRS0=uRvJ=CQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6F2C433E2
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Sep 2020 16:56:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86B48207DE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Sep 2020 16:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vi0j/Kh8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ivzOBAA9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXRyDLfD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86B48207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CAfSui/ViPU/0BwdaWUZL0/IAFJCFHBAx5IZq39Ksoo=; b=Vi0j/Kh8ljzYib3FzUuJyFIo5
	3zSyhVR4eDTNW/F3+Wr4mdCIiZfnplrGruKblst/PLeZrZJIlhW/VYachg5mByA0mP+0IGnrHxgBm
	WMiD29fmuDhLDnTxYpSqFB/rBBV78I40mO3pmMHsUJND95jhJOPXycPbSvBy2EOGJOZIjlvrQJpWJ
	91inP0fjs4ns4S2SeXSQ4qa5THIy1t/Lr4RYyQJkGSuzkuOF9cyqDjUQVjtq5ORep7Pj1dEmE7ybZ
	aVaSU9ZZEvk8kuHU2KjzG4WpIhRMVIlzhIseFYw9f3kecPMD+lNVio/TnH7YupNLjH+BTHtNbIlRs
	HJvVpUTGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFKRt-0004E2-VA; Mon, 07 Sep 2020 16:56:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFKRt-00049w-Ij
 for linux-snps-arc@merlin.infradead.org; Mon, 07 Sep 2020 16:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=U+/TBQmDVn/IzT17eBXGEYWXzqkvkgNOU1G16kLcla4=; b=ivzOBAA9eoL33tv3H8bGmmehnx
 Wr+bEwQtPIyCpQDMLH9/QVGfASqhQmjBZo2oOj69EeOroAnAwQGIRuRISqvDVP8uK2WidagUu+FR0
 aiW+n7ab8hnFlxeqnlnG1NuNpKDX4KYpEgrPxF9mozcMPemCZnOkgRBYoM+OlSV5BAkhWvG0j4gnb
 vH8r2V+N5lDYadISqcwD9B7u5jm6RT//wszFfYmZoFSXW0MLdeuG45uji4EpC0OvrA4gu85StRifd
 w7yUvFVgJkAA5Ps2wKLcMCoLGT3LivqCPH+eoxAJX6na4BaZtTJO+Gyt4f2Mgv1N6c9Enj4PJPLVU
 klGnwFPA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFK6c-0000y0-6d
 for linux-snps-arc@lists.infradead.org; Mon, 07 Sep 2020 16:35:03 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB6C321D7D;
 Mon,  7 Sep 2020 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496490;
 bh=jOSBKhDLd+6i8GNAQCzE5l4teo3KLijO8Md8xp1oEGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pXRyDLfDr46j6hzuvPNBw8wb23zX/5PYmlv/E1av0N5wWYNR4kiTfUGQhfPNM9nIz
 ZFPFRR1STmrlXWoCVaW++eN5GTs8ZYt0Bjs1xOFr3TrM6L0yjg1xcJoq3PbBdSmivj
 DUWyFgdWo7iRoGrqGdsctmA/NEPjj4NcnRnf7xCM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 19/26] ARC: [plat-hsdk]: Switch ethernet phy-mode
 to rgmii-id
Date: Mon,  7 Sep 2020 12:34:19 -0400
Message-Id: <20200907163426.1281284-19-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163426.1281284-1-sashal@kernel.org>
References: <20200907163426.1281284-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_173458_462576_E49637B5 
X-CRM114-Status: GOOD (  13.00  )
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
index ab01b75bfa67d..f6b6e3c9ca8aa 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -175,7 +175,7 @@ gmac: ethernet@8000 {
 			reg = <0x8000 0x2000>;
 			interrupts = <10>;
 			interrupt-names = "macirq";
-			phy-mode = "rgmii";
+			phy-mode = "rgmii-id";
 			snps,pbl = <32>;
 			snps,multicast-filter-bins = <256>;
 			clocks = <&gmacclk>;
@@ -193,7 +193,7 @@ mdio {
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
