Return-Path: <SRS0=z5VF=YL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5684FCA9EA4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 12:15:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C7FA2064B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 12:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oV5s2SAg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Rt1bniV3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C7FA2064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=naAlqi6FpgdZiVMfozdrJPcnbG3GbnwQs5cyW55J9/4=; b=oV5s2SAghSDa9e
	edLVNuNNEHBsaU8CpM5dQmKAU5Oh7rcnqGMS7IiK/ebkVQ3MNCwZTgGFHHlsnGyd6sZWR8WrBL1H7
	yBxa3z2wEYimRHCiimhKBSnUSDW0tEZ74smCt4ydgcB7DCfg0pt6ON8n0PjJvpGew0qNZ4Pi3pa0v
	O2brUTw9cRln1Kwy6Qqx80Q/Obeh2XXrbwcVdNWHlQs58IstzgYzhsZLK9YNtpseYXR6RlWia87lg
	+6pq3sOaJYEMWKGQtXljYoFxUkwUFH340tZ93qoO2YFEeS4aXJF91HhflgjF48ni8LgRkfY2+kVef
	sUvcXFnT5EIdxsF61PBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLRAj-0007DJ-9c; Fri, 18 Oct 2019 12:15:57 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLRAc-00079t-NB
 for linux-snps-arc@lists.infradead.org; Fri, 18 Oct 2019 12:15:53 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6FECDC09CA;
 Fri, 18 Oct 2019 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571400950; bh=AIGwTQLYhX+M2s0W3a/AMO9FziLVCQioUIaBsq9d96A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rt1bniV3LejIVIV7NJQxKdQWHdcXTBqriWJY6ykguvGIxpmTBn2tpVk5ahEfPDEGj
 a/P4a+fk2h9RQZwUM2xWBwb5Qb9cXkopU5LH66Wh4KpZ29oHiLOc9PtMghrP0ZU49m
 DACGWA1X/zayTWRshs5pbJPI0PfzSmrS3mDjWjK5O7ivutKMDj4SYq4vXNNt6qVXef
 0KLkyaRihmm2WbVMXWNZnPDRJb1wqTH0NSZbmkSIkJZWDlfScEbs2BOn5mJFTsT+zG
 jguDKuAQbzF6kPue0aiUAx3rDjxRqRils5ZjfL5GRFnjkUtsHApTKKPp5p1QcqqBgR
 cHuU+L6weoT3w==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.73])
 by mailhost.synopsys.com (Postfix) with ESMTP id CC852A0069;
 Fri, 18 Oct 2019 12:15:48 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [RFC 3/6] ARC: HAPS: use same UART configuration everywhere
Date: Fri, 18 Oct 2019 15:15:42 +0300
Message-Id: <20191018121545.8907-4-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018121545.8907-1-Eugeniy.Paltsev@synopsys.com>
References: <20191018121545.8907-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_051550_752407_F02F806D 
X-CRM114-Status: GOOD (  10.18  )
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

For some reason we use ns8250 UART compatible on UP HAPS
configuration and ns16550a (which is ns8250 with FIFO support)
on SMP HAPS configuration.
Given that we have same UART IP with same IP configuration
on both HAPS configuration use ns16550a compatible everywhere.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/boot/dts/haps_hs.dts     | 2 +-
 arch/arc/boot/dts/haps_hs_idu.dts | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/haps_hs.dts b/arch/arc/boot/dts/haps_hs.dts
index 44bc522fdec8..11fad2f79056 100644
--- a/arch/arc/boot/dts/haps_hs.dts
+++ b/arch/arc/boot/dts/haps_hs.dts
@@ -47,7 +47,7 @@
 		};
 
 		uart0: serial@f0000000 {
-			compatible = "ns8250";
+			compatible = "ns16550a";
 			reg = <0xf0000000 0x2000>;
 			interrupts = <24>;
 			clock-frequency = <50000000>;
diff --git a/arch/arc/boot/dts/haps_hs_idu.dts b/arch/arc/boot/dts/haps_hs_idu.dts
index 4d6971cf5f9f..738c76cd07b3 100644
--- a/arch/arc/boot/dts/haps_hs_idu.dts
+++ b/arch/arc/boot/dts/haps_hs_idu.dts
@@ -54,7 +54,6 @@
 		};
 
 		uart0: serial@f0000000 {
-			/* compatible = "ns8250"; Doesn't use FIFOs */
 			compatible = "ns16550a";
 			reg = <0xf0000000 0x2000>;
 			interrupt-parent = <&idu_intc>;
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
