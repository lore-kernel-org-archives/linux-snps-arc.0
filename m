Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E00C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 15:39:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8D2206F6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 15:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LpmGDg5Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="D8cPGg7d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F8D2206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5u+dzkVnZq12ljd4rerm2YfLwMf20jYSMhdzWI3q6+4=; b=LpmGDg5QEDZxR7VBoDO+GXZ6mE
	DyYNCW+D15TEmt8IY9PxWK9j1m7/xUD4z0MZvOWGFkNybv8K9OqoEGGqZchlfTJS7Kbt3GDxjhaFH
	Ufs1tQax+Ag40ihjAqfoMYkMFtrdBFVaFU9Xg2kRa+1dcpsUpKxqwYE834s8scEiY0PK4ZJXdF8hh
	hVvVy+ySiCusr+PnOXbdljbXCFSPK/shMog8v2megfcwoV88/r2U8+pAM2+Gcrc/7rpTe2VIWeRq+
	rpB56U4I418rkLJ2oc1wrR2PxOjSpefmNXWRhtVrMJ5iw3/6AOOfwI1YvVcx1OSwTzQA575I2+0Hp
	VRI3rQEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jspgi-0001Rc-ME; Tue, 07 Jul 2020 15:39:16 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jspgg-0001R2-JF
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 15:39:15 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2C1B8C06F1
 for <linux-snps-arc@lists.infradead.org>; Tue,  7 Jul 2020 15:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594136352; bh=emXA/+T0pmzwNTb6aP3sgba45DttNPTBYylzoa4kLio=;
 h=From:To:Cc:Subject:Date:From;
 b=D8cPGg7d0eKVGrqlRIfw6mlk1hnfRH3lKGBnOZWFsGY7HFiPhzYXmrHpcYHgdIP/x
 zcn3ZOJmIceHnkNKKchR1A9PGmZSr0Yp6Wd09xh6WzzGQY16HtR9fzfp9cKMkq0aaH
 bsPQh47OgBcnLDT2ncKS/hJBuqnyvOYW8g6kUIse8Vc0jXL+V3LBldTBGhm9YRsm2n
 MiY5aTrc8oJFQsuJpoK1mHu+roI30IwbvAgZtGkRvryRFaBDbLxY1MuVVBqvISIzxi
 CYZ9mAUYU9EVSHRpksXfxI6cYvH2fKy+hfOZHZJK/C1dctXJOgD/1NnDzCY7ECjrgA
 NZMR2ppWBBdfA==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id C1153A005D;
 Tue,  7 Jul 2020 15:39:06 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: [plat-hsdk]: Switch ethernet phy-mode to rgmii-id
Date: Tue,  7 Jul 2020 18:38:58 +0300
Message-Id: <20200707153858.13280-1-Evgeniy.Didin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_113914_785327_2CA4D1E7 
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
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

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
---
 arch/arc/boot/dts/hsdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 9acbeba832c0..d6427d47e5a1 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -208,7 +208,7 @@
 			reg = <0x8000 0x2000>;
 			interrupts = <10>;
 			interrupt-names = "macirq";
-			phy-mode = "rgmii";
+			phy-mode = "rgmii-id";
 			snps,pbl = <32>;
 			snps,multicast-filter-bins = <256>;
 			clocks = <&gmacclk>;
@@ -226,7 +226,7 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "snps,dwmac-mdio";
-				phy0: ethernet-phy@0 {
+				phy0: ethernet-phy@0 { /* Micrel KSZ9031 */
 					reg = <0>;
 				};
 			};
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
