Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF63C3DA6E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Dec 2023 00:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8naXnH5MwI9NVSfkk1c6WIDccGB6Bl5x/6NDaOZIrc=; b=MUUhs+P3SgBnrd
	lmHOTxQ+isZXael3f6VbopYYYE4I0m8A3DBF9Nu9BskcJ5eecUSK6eJ9EObvO27/86OaFUYckAQ7z
	M+hZhyJuYyyStGxoVyR88noS5tzXi+8Jt87ytcKGtsiRkHreg7AusvZ6K+s1ULPUCyiB4DlkqsbVx
	vfqNdIcPOxtf8pK5zM/psTL7rNPnagXa4r+W6z3EN8R7heaQ4TNredLBrZz8A+mtDzZuO3q/Bhgt2
	ML1yIK6QsItp1Zw+MY51HTVIXT1hlwcAFme7+0toiEYAo+SPrp/fCrFKLiCGzh959ialpGLFUuGfE
	Om9WOGzPgxWkOInIGUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvGX-00BRT6-28;
	Tue, 26 Dec 2023 00:25:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvGU-00BRRx-37
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Dec 2023 00:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E9318CE0F55;
	Tue, 26 Dec 2023 00:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FA0C433C8;
	Tue, 26 Dec 2023 00:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550344;
	bh=Qw/zUVr/JlRP+cCWuqxOqK3mUnRIy0h9A+b9hqfhgUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OvInPDCfpsdog9m2/qQTpfdA/FQ5dmGIkVf4iQ9dwfamp5ApHh58KDN3e8JhGaZtW
	 HOynaimMMNjqgLUHWlEz3OnmBD+Iakf3LgTsQ70vZQCJUck6yIV5SWh3fKbpoHV1wE
	 m+J/1Ikrcei8RC9W5X++BR1Ml/PEWrtCVUif4IJieI/+DP4bzoQf0MwpTkM6PH7Ir7
	 CPOsBlk7BIm6wOMd2JWGBH0hQCrlIO9Sk4EgKgYKyhBxNl9DT+0XSrFjVzIWUgkOKo
	 lxh9vJGDy1jlgycBxQpxLE6sV9Sm1/6La9nG5sq/mBUAROlTF3ixhgaScuFFyXHkbr
	 acWjW9ejm44Iw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	arnd@arndb.de,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 6/9] ARC: fix spare error
Date: Mon, 25 Dec 2023 19:24:50 -0500
Message-ID: <20231226002526.6605-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002526.6605-1-sashal@kernel.org>
References: <20231226002526.6605-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_162547_234876_BDE6DD73 
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
index 4868bdebf586d..c43d323bcb593 100644
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
