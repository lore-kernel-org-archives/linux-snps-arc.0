Return-Path: <SRS0=uRvJ=CQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7909C2D0A8
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Sep 2020 16:37:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9266521927
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Sep 2020 16:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TzPHOBn7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTIMpZwV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9266521927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zalZlqgabJ8M6Homf9YW8QkUgjDCMccNmUiDWj5gNNo=; b=TzPHOBn7d7KJsbFPuf2pt9/H7Q
	G2v/HILqNGW/6jH1bvQqee4HTsiFczcsl1DHI4GG4715ytyg0GEibzKMpgo6BJwe/6uuJJgYAzt/G
	S/g5TWZsnkE+dE70WFb1JmLeLwndUKpVkiQicLVQcqqjbUW6mdhEcVUdkaw0YS0cDalToZkq7gcaC
	ULmZzjmtuH2LP03XiNcDyjUaPWW0HEcX0/MluXR/1tIbeqwuf5GpJVaGgEFSAY/lFOvcffzblz6OY
	wyoTCy6o3lNVtYRV+xncnNYfccre/VS6bl15m7+9pa3U9iho+iujNN2h9KNoddilP1w2T3THtpLqF
	VKq/W/yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFK9S-0007cc-4Q; Mon, 07 Sep 2020 16:37:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFK6h-0006Gt-QX
 for linux-snps-arc@lists.infradead.org; Mon, 07 Sep 2020 16:35:14 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4074121941;
 Mon,  7 Sep 2020 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496503;
 bh=TRp+T/pAqQH1aSfGdNxlVrb79U0JdQ9CMrLL27xk2sg=;
 h=From:To:Cc:Subject:Date:From;
 b=XTIMpZwVVrTewp7v2XZhst+mGx15iclLN7VERD14sYYq+nltkhiHNIC8QN2COD5P2
 TUjaKU7cxE5xr+OpVO+O8/gkRD/tF48Kto4wbekHsl0pwV8yRL0r+z+EY4/bN9h20p
 a6agJ/nGkm/Ecv4eyl19P90QJH/qcwjwMxFqqShY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 01/17] ARC: HSDK: wireup perf irq
Date: Mon,  7 Sep 2020 12:34:44 -0400
Message-Id: <20200907163500.1281543-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_123504_216583_001CB729 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Vineet Gupta <vgupta@synopsys.com>

[ Upstream commit fe81d927b78c4f0557836661d32e41ebc957b024 ]

Newer version of HSDK aka HSDK-4xD (with dual issue HS48x4 CPU) wired up
the perf interrupt, so enable that in DT.
This is OK for old HSDK where this irq is ignored because pct irq is not
wired up in hardware.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/boot/dts/hsdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 57d81c6aa379d..aeacea148793c 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -79,6 +79,8 @@ idu_intc: idu-interrupt-controller {
 
 	arcpct: pct {
 		compatible = "snps,archs-pct";
+		interrupt-parent = <&cpu_intc>;
+		interrupts = <20>;
 	};
 
 	/* TIMER0 with interrupt for clockevent */
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
