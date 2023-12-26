Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B476C3DA6E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Dec 2023 00:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CkVTQtmMiGEl+0hH0RkTGnrPdqzmFaCqN1v79OPWPuM=; b=fxHAiV17ddGhLX
	4kllh2vrUOoUTnCdgUKUn8LQGx6KHvwmkoW4SQ6wX2njfNwsvenD97/xy0w//yFqP0gsQIjoM3AkI
	yEsFEDFJ12ArQqz2F3j0Vn1NyJLFn8/6eGBQDuOJLNS2px8qYWcstL60ExIFyXfnD2jxr5JhRRLqu
	Ul7XIjjAQBCmsNLuTJG0ozq14Ots3C3OgIY1Kb/GFSnQzit1GPLduksOiQ+mZrtOSIbdUGSCv8pbI
	jdY0qh9UilSCkRXIV17zuuqbWUCbNo1zrPv0QsWniirzn62sazwuindoQr6xSWt3Fh7WD29mAwb5w
	IdZkSuDW31JukcE6ILag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvHD-00BRgk-1H;
	Tue, 26 Dec 2023 00:26:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvH9-00BRfc-2G
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Dec 2023 00:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 46A76B80B8F;
	Tue, 26 Dec 2023 00:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF58BC433C7;
	Tue, 26 Dec 2023 00:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550385;
	bh=6HQPl8Tszuk3pmHygsPnwru0P0b6n3bpfAaVxj/2Mss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=loff4CfJeG+5tuN3d/G3d7OOc+cigEHD3YAt3R5y08f3yfNxLCCr8egjcO7DCdU4I
	 hoB1NfVr6g5zaY7dw6v/nKB+A9Up0ALKRk7JVXpdgT4Ih4bX2aTe0tBEozIUKvURLm
	 jUwH9uRD2vxnPfQadl5GedFdzrsQ5mlt3iSoT/6+bZEmQXUHoqtT5r1I72eJ6vm5ug
	 fpAoe/sUGntOb3x/6QCCEY+AshGyYaR61UY3MbJvXfO0BY1PjX2uqyMUkSkZL7lErf
	 pF/t8i6C+ccpzJ3+mRBuieXolaA9oRM4FVKQ+4Iq6UNSUhc4+hdu7IF5VK4c4C3uWO
	 ikoIq3KeatXlw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	arnd@arndb.de,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 6/8] ARC: fix spare error
Date: Mon, 25 Dec 2023 19:25:49 -0500
Message-ID: <20231226002608.7089-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002608.7089-1-sashal@kernel.org>
References: <20231226002608.7089-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.265
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_162627_867043_ABB9D91F 
X-CRM114-Status: UNSURE (   9.74  )
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
index 8877de0dfe6cf..2759d49a2f3a9 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -61,7 +61,7 @@ struct rt_sigframe {
 	unsigned int sigret_magic;
 };
 
-static int save_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
+static int save_arcv2_regs(struct sigcontext __user *mctx, struct pt_regs *regs)
 {
 	int err = 0;
 #ifndef CONFIG_ISA_ARCOMPACT
@@ -74,12 +74,12 @@ static int save_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
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
