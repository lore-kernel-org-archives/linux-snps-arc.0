Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F0DC3DA6E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Dec 2023 00:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgjnqYUsrsSk4urzgNtDLUDFX+ebe46UNNCOAdosEwc=; b=v7byXZ27/r5BEr
	Ky64hWi7b9dQst5DQ+zLF2MrHyv1JUdQYbfdGIi2nqZubPzcfdEh5g4QGvbIS5pCRlFUcr+V7zVfW
	voiG+0PHGraOxZcMxOS9SJKF8iFxnEhgDl8Kc65x9tRp+uJYjPYhNrwO41zcxBTdV86QP8oNHiLUv
	CEE8gF1T4sWx5HfIK5rhpbnDhcbyRk3VZoG+jF4eTrDV4n6LW74+DK9ymnRwHYotedmFj8P7LeBuO
	8JLVGfB7QLsRxJ7DIsHZplzb7hrPweqTlN8T/30Xt1eH/p0+N6NnTvUGG/45Z8+QvOv8qlLbjRRXv
	pL63oRMpRGjTzsBsDwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvHu-00BRrC-1M;
	Tue, 26 Dec 2023 00:27:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvHq-00BRpF-0S
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Dec 2023 00:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CFBB60CF5;
	Tue, 26 Dec 2023 00:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CEDC433C8;
	Tue, 26 Dec 2023 00:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550429;
	bh=vHIiMB+tdtmJ2Ky5sIfHg7G79ZSwjuZF+SkYK1pld2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e9jV9C7J/Gd9mcsMgwqL5az5rmssfDPQljG/ElTOVlmDVhgCUsE3KDWvbjD7I3e2b
	 Zw/nyU61smljU2QQ/pI6ThMgaBQXl7NsQCeFfxsaIrfjVT5o7iZIq1+27eVcSzQNo8
	 3RSdAvXKte1BazzBB8vQyT+NPvW0+EZcoawUVSy+meYegw1sWqay4y50s4NDdSk8tL
	 yOei8GWshd4loIj0tH609/mVFSXYAQXX65PDGy9SFRSGDNqJXbLuiH+41l77LUKSNw
	 Fq0FGAHEW5P3wSZIBSegMrRNbHrUCGpiwZwXpheePPviEIizgyrcGKFbTaVj1eRhcY
	 CsSp2ito4HPtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	arnd@arndb.de,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 6/7] ARC: fix spare error
Date: Mon, 25 Dec 2023 19:26:30 -0500
Message-ID: <20231226002649.7290-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002649.7290-1-sashal@kernel.org>
References: <20231226002649.7290-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_162710_222515_04031426 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

[ Upstream commit aca02d933f63ba8bc84258bf35f9ffaf6b664336 ]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312082320.VDN5A9hb-lkp@intel.com/
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/kernel/signal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index 68901f6f18bab..c36e642eb1a0a 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -64,7 +64,7 @@ struct rt_sigframe {
 	unsigned int sigret_magic;
 };
 
-static int save_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
+static int save_arcv2_regs(struct sigcontext __user *mctx, struct pt_regs *regs)
 {
 	int err = 0;
 #ifndef CONFIG_ISA_ARCOMPACT
@@ -77,12 +77,12 @@ static int save_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
 #else
 	v2abi.r58 = v2abi.r59 = 0;
 #endif
-	err = __copy_to_user(&mctx->v2abi, &v2abi, sizeof(v2abi));
+	err = __copy_to_user(&mctx->v2abi, (void const *)&v2abi, sizeof(v2abi));
 #endif
 	return err;
 }
 
-static int restore_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
+static int restore_arcv2_regs(struct sigcontext __user *mctx, struct pt_regs *regs)
 {
 	int err = 0;
 #ifndef CONFIG_ISA_ARCOMPACT
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
