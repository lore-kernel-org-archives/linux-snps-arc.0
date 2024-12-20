Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60709E77188
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 17:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRS/P62LgUep0o6wxxk6KdwMxLZTxtwMvUyH4OGn21U=; b=cMmsdytZCURBfm
	t2tFaHvGvEyQsQuXirFTdWILaJJEUxOIccJvAMiRGvdVbhXbLtPyqByfTVyLYx3NIgg1EkHe0u4OS
	D/aSdLFuPB7eeoVU7wJSEQecs2Xx+k33fL+HyZ9vKD84DScCrHQZfCjtS6J8vaAMiMcBsLo2v0R7P
	y9rKlJri6VSv5wQhq/OyIsSts9x92QUE3GPJWY07DMdEqQwtDMt1GP7tQz91X6jVEy8P29XAQcReQ
	rByPN9g/agQLbZ1/Rd3QiboFKkD0uHrMYpnqkQJnjvsJrxGHNFla9pWsY02kZrrXoQ4+uJbvAhqlN
	dq/hj3Q7o9C3c9xGKPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgji-00000005d3J-47IC;
	Fri, 20 Dec 2024 17:24:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgXt-00000005aVM-1jbL
	for linux-snps-arc@lists.infradead.org;
	Fri, 20 Dec 2024 17:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE6F05C67D7;
	Fri, 20 Dec 2024 17:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECB8C4CED3;
	Fri, 20 Dec 2024 17:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714732;
	bh=wvhvZKGhB/9VYruVPnLK6Em3I237MTUZvuqu9NYbISU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DE+OVatR2tfxiQfYQvJl4Qru4kJcBC+GZ0/4YhtPJMrFinw2kL3xNPUObaI5PbSSq
	 AMcelgRtG43TwM+zJMXi7rIfRjhripqPQr6mseW8VdiNQDbfUVXadAbwWkg4GIEbf3
	 K0hQtY6mCOA2rGpe2hdC+c++qb7RY1Bc8WdEmQbLMtCyN53udbbeCypvZi3QlNFodv
	 JFNvNP5xpUV6MBiiK8TU9NJX0+wQm0/jVDNwDtjW1nB8kMKjEr/M5KMmP3+KdcHsjY
	 zWeGlUiTJSAqv9JoBiFzBDB5bjhPOVsOkViOhZ3WmL/0s2xqwbOeSvnHE/u0asEHh4
	 RWVI+rS/q0xjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 17/29] ARC: build: disallow invalid PAE40 + 4K page config
Date: Fri, 20 Dec 2024 12:11:18 -0500
Message-Id: <20241220171130.511389-17-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171130.511389-1-sashal@kernel.org>
References: <20241220171130.511389-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091213_493541_60F73E01 
X-CRM114-Status: GOOD (  10.58  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Vineet Gupta <vgupta@kernel.org>

[ Upstream commit 8871331b1769978ecece205a430338a2581e5050 ]

The config option being built was
| CONFIG_ARC_MMU_V4=y
| CONFIG_ARC_PAGE_SIZE_4K=y
| CONFIG_HIGHMEM=y
| CONFIG_ARC_HAS_PAE40=y

This was hitting a BUILD_BUG_ON() since a 4K page can't hoist 1k, 8-byte
PTE entries (8 byte due to PAE40). BUILD_BUG_ON() is a good last ditch
resort, but such a config needs to be disallowed explicitly in Kconfig.

Side-note: the actual fix is single liner dependency, but while at it
cleaned out a few things:
 - 4K dependency on MMU v3 or v4 is always true, since 288ff7de62af09
   ("ARC: retire MMUv1 and MMUv2 support")
 - PAE40 dependency in on MMU ver not really ISA, although that follows
   eventually.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409160223.xydgucbY-lkp@intel.com/
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 5b2488142041..69c6e71fa1e6 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -297,7 +297,6 @@ config ARC_PAGE_SIZE_16K
 config ARC_PAGE_SIZE_4K
 	bool "4KB"
 	select HAVE_PAGE_SIZE_4KB
-	depends on ARC_MMU_V3 || ARC_MMU_V4
 
 endchoice
 
@@ -474,7 +473,8 @@ config HIGHMEM
 
 config ARC_HAS_PAE40
 	bool "Support for the 40-bit Physical Address Extension"
-	depends on ISA_ARCV2
+	depends on MMU_V4
+	depends on !ARC_PAGE_SIZE_4K
 	select HIGHMEM
 	select PHYS_ADDR_T_64BIT
 	help
-- 
2.39.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
