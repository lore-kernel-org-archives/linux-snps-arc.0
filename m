Return-Path: <SRS0=radI=7K=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A55C433E2
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 May 2020 11:57:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5377B21744
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 May 2020 11:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/2ixpkg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcSWWmUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5377B21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6EdCuwzyks/js4HpZihCq1BdhILDs0eZi5YM/k97oI=; b=R/2ixpkg8GPWUe
	vW/cgT103Uon8dYn2STTCTyZhwytTOILuACkjnpaPwvSyFqLnmHMs90Q5YGtPLWB3q4zMsWtJ4b6m
	Lrim2rLpHS3TZqRfaVPKw9hnghm2vef+42aISy+mT+in7EvAWhPXYb6erI4QVaH12zQO4pzq2Gbz2
	iQqeKC7n5jwJ/UyWDa3N4OTmwxiWBkFj5ztKccJciUG/WirF2EMttx/MH1E0ShTlBe5oOFKfTNCfq
	vVgV1j97Mb3wjKV4pABRDAC7kmkYFZtFd9jrAOMhyiQhiaM2gx87iVPGFjWg0WwCWK7I7rF1WyMI3
	eir0dnC5JieFx6eJJGPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeHA9-0003jR-GB; Thu, 28 May 2020 11:57:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeHA7-0003iv-UL
 for linux-snps-arc@lists.infradead.org; Thu, 28 May 2020 11:57:29 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 086D5216FD;
 Thu, 28 May 2020 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590667047;
 bh=PLNJeXxTBPc66RzOoR4Z0fys6oMg6bP2vmEK7g3T1FI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AcSWWmUN0QlW1FgRabDdEW6aAZv7UPANzwGotv7J1ACSCvF80wdmt+/RrczePzWYB
 FRvnOiUea5yL2NfQGSxeIJUb3Lskwr6QkTa0duHzpV/Tw40vDKB9CDKCTbX+dFCrsa
 O5+LJ+c2KRwdvcOpTVpuAfX6Dw3GqNaZYdzitz7o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 02/17] ARC: [plat-eznps]: Restrict to
 CONFIG_ISA_ARCOMPACT
Date: Thu, 28 May 2020 07:57:09 -0400
Message-Id: <20200528115724.1406376-2-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200528115724.1406376-1-sashal@kernel.org>
References: <20200528115724.1406376-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_045727_990861_30C2D64C 
X-CRM114-Status: UNSURE (   8.94  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Vineet Gupta <vgupta@synopsys.com>

[ Upstream commit 799587d5731db9dcdafaac4002463aa7d9cd6cf7 ]

Elide invalid configuration EZNPS + ARCv2, triggered by a
make allyesconfig build.

Granted the root cause is in source code (asm/barrier.h) where we check
for ARCv2 before PLAT_EZNPS, but it is better to avoid such combinations
at onset rather then baking subtle nuances into code.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/plat-eznps/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
index ce908e2c5282..71378bfec8d0 100644
--- a/arch/arc/plat-eznps/Kconfig
+++ b/arch/arc/plat-eznps/Kconfig
@@ -6,6 +6,7 @@
 
 menuconfig ARC_PLAT_EZNPS
 	bool "\"EZchip\" ARC dev platform"
+	depends on ISA_ARCOMPACT
 	select CPU_BIG_ENDIAN
 	select CLKSRC_NPS if !PHYS_ADDR_T_64BIT
 	select EZNPS_GIC
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
