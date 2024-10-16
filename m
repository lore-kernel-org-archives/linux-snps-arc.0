Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF7DD2069D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2024 05:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0syR7d15N+r+KLs2C6Vxt5BzV2j2RRAOBzthxA/lfOA=; b=k48hO4AApGPT3r
	ELoid8t7ry8ecai1XM9FRyQqk8fYnzE3Ytilug/MXXhgkF1zbT8wkpCX9teHcsyeQ9jOPSyDJv9YF
	R+P1hScKRozqCUNOXMlhtwmnelvreZcAB6gmG3e2hvurxhbwwbPTk5rGjfqx1h1aSUnk0ijxiHNc5
	ev1jIxyqNGqm2kDnYLgdcU9BloYsO03ovceLeWOkk5K8T+du36kK8vOhzuEL7fcobETgeXVxUEUc5
	3rj8muQsNCrKDxD+MogQD/ilroKCu/VJfaldkeF7vJZkcXQ2hhsSpvi7lPG47b0oums39nNECMTQf
	J0NsLtofdxIgFwcdAsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wZk-0000000AZNQ-2H39;
	Wed, 16 Oct 2024 05:28:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wZh-0000000AZLW-07Bu
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Oct 2024 05:27:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC11E5C56DA;
	Wed, 16 Oct 2024 05:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB302C4CED0;
	Wed, 16 Oct 2024 05:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729056476;
	bh=wr9djLuiLRmtMV+CDqPeySU/5of2llOuI/71PgvqERY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IHdr3MerMlcwzZt8JbxVEmf1NYGkI5fPbGmI5gET1LwwZqpe30GPz7DGMVSyhcTQT
	 0VGNb42hAmq2chOSY6VcCExtSg+clAaTnE6aq0qLfgR9N2W1RfU/eA1ATOkZTJVj2V
	 tFLXj1s4lghCpI8Guw27d8tzGRYCF9D9MaBtKcox7MOBStqprr4TsJnISpcl/BKf0H
	 WdaBqLrtfKk7eJRLFqSnnDJZpiJwgi4OpmufebcyolmVqNHshQWNKzVOuf4L/M6n1l
	 C2lbCwwrFMsa7heQf1OHr2kN8+9P6Cnc4NNkQMNEhoedRsdIRTbpvUnB3N0U4v0sKT
	 VJjFITYr2dw3Q==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/3] ARC: build: disallow invalid PAE40 + 4K page config
Date: Tue, 15 Oct 2024 22:27:48 -0700
Message-ID: <20241016052749.1640081-3-vgupta@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016052749.1640081-1-vgupta@kernel.org>
References: <20241016052749.1640081-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_222757_219627_99C96F49 
X-CRM114-Status: GOOD (  11.36  )
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
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
