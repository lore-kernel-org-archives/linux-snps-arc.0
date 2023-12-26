Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A355C3DA6E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Dec 2023 00:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgjnqYUsrsSk4urzgNtDLUDFX+ebe46UNNCOAdosEwc=; b=2l3nAYsRn1mWlz
	zUwU7rA6hzjqSm2R8rXFqfUHj2nCxG8I1mbaKjey/G9Kp7PB7FYFeQmDSjzW3mERTnPMKIk4OxenB
	bEDt+lMvK6MW+wFToLRmc6Hs5ARmF4UAu3OB1JVkbOpwID0gA0fgF//oERXlCjcU0oMch6Wy+SyXm
	vSjjrOVylIvlD0HlIHfKuDsbrP0uPUIrKm45bRfKm7GqlFq2ykPNZoQgseLTzGcHEShAHxzS4QK0g
	OT0WvHFKGVV1BDQ+P/edBOJ0a/tPru7VHHl8+LCJLoDOW4qLaXOGu+9Ex4RBbfl9NJW7g+Rd9lOGC
	2seYHpmUL0k8yyiXLqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvIN-00BRxv-1e;
	Tue, 26 Dec 2023 00:27:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvIL-00BRwl-15
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Dec 2023 00:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 08BFBB80B6A;
	Tue, 26 Dec 2023 00:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617BBC433C7;
	Tue, 26 Dec 2023 00:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550459;
	bh=vHIiMB+tdtmJ2Ky5sIfHg7G79ZSwjuZF+SkYK1pld2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sfLjt/jY1ljaehi1JkVo7yFecuIeUBfhB2A1Ero1o2Tlbn27faHPsjLnTzxdqUhtJ
	 ujGLxSph6hysBV/I+LWyGidJV2QC7525stAD2Zuct379RfVhngAixnEqPNMMRkpiDz
	 4S6UVxHlJmZ+hXLNQ6EQ37wT1usEBoKhX0ZA8ffI2jiE3D3nWDWi/WhPdxMZvMwMyk
	 bQ8DDRbkp258IPogPipipPzN7pieh0QzvVgrDuMbfVvObcZu81s0+MB5c3CBvFT8yE
	 pveZ+Yr/P5va7VmsE+WVvP4Hy/pJrRXTq7bBb2+LwyU9pn7Cor5p4AAsymiUcHGCAU
	 2HL3sdkAXrr0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	arnd@arndb.de,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 5/6] ARC: fix spare error
Date: Mon, 25 Dec 2023 19:27:12 -0500
Message-ID: <20231226002725.7471-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002725.7471-1-sashal@kernel.org>
References: <20231226002725.7471-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.334
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_162741_506213_34087D5C 
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
