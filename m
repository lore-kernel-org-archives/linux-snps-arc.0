Return-Path: <SRS0=LGfP=4C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687C1C2BA83
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Feb 2020 16:09:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 067E02468A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Feb 2020 16:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j7dDmXr4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkkF5GYL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 067E02468A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wr+hDn4r8dqh6a95nbaUsVfnhmz/HbJbRJ57NBvc4VY=; b=j7dDmXr4u7c+43
	r1MP5DhtRKFLgKWzcu7MT39fiwnz5p92Ipesuqw+SOPFteCTD0sdlo3HEkgJsABA1yBxaKzrXl/ca
	6SONxbWupileyVoYG+KIMq8OPOJwqPgzNbnHHgQ/VQU9iaLr6ATu5yW3fzuv6by5/k7NXFvphvG9c
	E7vzVRgWRH9PqyF9/aK4gwQVzuVFcjuBrl3f8XNuJLtEt/ix7V5doVMzaP31UHefMyaqhJQLW/lN/
	VN+ozegaC5v2qIYW+NFEl28s3eGEscukYxN3S0A5X7+80sB+XhulQBK9bOHUJgP5K8ZkJQ+Z3LcGy
	ceYawv4pa5FULSat2PtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2dWt-0000V6-Sl; Fri, 14 Feb 2020 16:09:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2dKM-0001ij-Fv
 for linux-snps-arc@lists.infradead.org; Fri, 14 Feb 2020 15:56:31 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0A4624649;
 Fri, 14 Feb 2020 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695785;
 bh=n8KnkIiWQJKChEase/Tq3j8kItHEsPafl6UZDSi8fhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OkkF5GYLoR30Kae0VTduIKv71nS5XrofCL4MPw6BCkMywDlsqeavi04iCKZIOBPXI
 Vi50Y7YPJlGMHNnEUTJAocurNCrKSOx0bp0GjuKyzlaoFRIKVJDbnwLFZHDqjGDH64
 N+qYKcsUl9Oc/hIpvfnk6YZmeNFIJF3XJctRUiLc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 349/542] ARC: [plat-axs10x]: Add missing multicast
 filter number to GMAC node
Date: Fri, 14 Feb 2020 10:45:41 -0500
Message-Id: <20200214154854.6746-349-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_075626_567030_FDC15D5F 
X-CRM114-Status: UNSURE (   9.20  )
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Jose Abreu <Jose.Abreu@synopsys.com>

[ Upstream commit 7980dff398f86a618f502378fa27cf7e77449afa ]

Add a missing property to GMAC node so that multicast filtering works
correctly.

Fixes: 556cc1c5f528 ("ARC: [axs101] Add support for AXS101 SDP (software development platform)")
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index f9a5c9ddcae7d..1d109b06e7d81 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -78,6 +78,7 @@
 			interrupt-names = "macirq";
 			phy-mode = "rgmii";
 			snps,pbl = < 32 >;
+			snps,multicast-filter-bins = <256>;
 			clocks = <&apbclk>;
 			clock-names = "stmmaceth";
 			max-speed = <100>;
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
