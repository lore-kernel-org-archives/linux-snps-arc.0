Return-Path: <SRS0=jCxm=3T=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1D7C35240
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Jan 2020 18:43:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A92205F4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Jan 2020 18:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q5j3t+CS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6fKpJ+Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A92205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVKL2Avs9zM/EctmG3xispuz2EnmAnSfKlzu94uldfg=; b=Q5j3t+CSTLD/XF
	pTFDxBPHqWwkmprcHlyDXTDAGYVIIIbnkEmxdVZz3iNtmgqXFcFS/q+d8UvrBUXLzHsavOGbv42G/
	uV3lIq6F/l2aNBU60CDyg8Zd/B6j1unZxCO6fxfYzPLyFmdEfCcZYrLjUQ2I55nCb3CTVIgDs/97L
	MOQ8sy9tGzccigaqZqliDBoeeiVaNcLwycI1II1HwkRE1/EVlrOH7cq7vUwH/2AVdLYjeqS6aO+BV
	8DHumb2cbCCTQrD48QZvIu1tEWzsuexuMnLmjgQEyahPnrJ9ikLENqV4GTiHitv3fi+t0wfgMZ/R1
	kGHT60noyW78odlizIJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixEn3-0004Bu-2d; Thu, 30 Jan 2020 18:43:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixEn0-00045D-3I
 for linux-snps-arc@lists.infradead.org; Thu, 30 Jan 2020 18:43:43 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5351220702;
 Thu, 30 Jan 2020 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580409821;
 bh=xBAQKyC0AsVCHmL2t4Iz7axXC042L292E53iu+qs9zg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q6fKpJ+Q3s6Gi6kAx9RNaOXTY6M3kgn87cZsMZS/kRUciicU0iF6uf3hAIJgy5LTS
 wMt+zDf33cRPAUcOsIAigPC6070Sb9EnnFT6qiIptEB0c0F4OceFXuTNhVPBvUJt6X
 DVqnIK6HiFOqaq0Ty0epe0b1U4d7iWzr7hjp4E44=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 045/110] arc: eznps: fix allmodconfig kconfig warning
Date: Thu, 30 Jan 2020 19:38:21 +0100
Message-Id: <20200130183620.661346897@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130183613.810054545@linuxfoundation.org>
References: <20200130183613.810054545@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_104342_158570_F2B3AF40 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ofer Levi <oferle@mellanox.com>,
 stable@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 1928b36cfa4df1aeedf5f2644d0c33f3a1fcfd7b ]

Fix kconfig warning for arch/arc/plat-eznps/Kconfig allmodconfig:

WARNING: unmet direct dependencies detected for CLKSRC_NPS
  Depends on [n]: GENERIC_CLOCKEVENTS [=y] && !PHYS_ADDR_T_64BIT [=y]
  Selected by [y]:
  - ARC_PLAT_EZNPS [=y]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Ofer Levi <oferle@mellanox.com>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/plat-eznps/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
index a376a50d3fea8..a931d0a256d01 100644
--- a/arch/arc/plat-eznps/Kconfig
+++ b/arch/arc/plat-eznps/Kconfig
@@ -7,7 +7,7 @@
 menuconfig ARC_PLAT_EZNPS
 	bool "\"EZchip\" ARC dev platform"
 	select CPU_BIG_ENDIAN
-	select CLKSRC_NPS
+	select CLKSRC_NPS if !PHYS_ADDR_T_64BIT
 	select EZNPS_GIC
 	select EZCHIP_NPS_MANAGEMENT_ENET if ETHERNET
 	help
-- 
2.20.1




_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
