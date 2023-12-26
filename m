Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0A4C3DA6E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Dec 2023 00:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi65HyK0sKzXK4LjIviLPl8a7KyCUmM19t5nFJVTTko=; b=cC9ya8KvlDrhzl
	6aUb4tPo0Z/oA/3ffE89ZoOOcHexGAaE8G6/6hG2o1WKydqOhNYzHQ9E1ZGLdmFWBjJ4gPoSsnTq5
	YbipdaBVPnYyiwxIko8hAykFTJDWeewJvtD9ngjMeOTHmmGmjl3tP3v61uciS4iT1S2701sll8eC3
	0rHmLEe410sUkbRyLmWHb9dGF5z+HYIC647PcaNbw/tDkVzCbUqZ8x3hnpZr8a0/MuQOnFRzG6fsK
	guftHwCfYSeyvyQHENwe8LvgeZGsB3ResEcP2f242S56XMUmqotZgOhCe6jp7nlrulZ4nVNTUG7mt
	JUDSVBRU1zHXnMFh5NiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvBp-00BPs3-23;
	Tue, 26 Dec 2023 00:20:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHvBm-00BPrP-0P
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Dec 2023 00:20:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FE3C60C3D;
	Tue, 26 Dec 2023 00:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA8DC433C8;
	Tue, 26 Dec 2023 00:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550052;
	bh=kFAZX9z/uCdEQIrYaglWphXA2UZ6V8r0/2l9wv233Zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzu3g6Vs1I1SM7LgMXFBmCfYryEACzXPXe+OQ/t4VYRIQftFRwtMGq+xOTyOABPqJ
	 nv/aMUgAfTVkhtTV/93sKscGbErq60nn7w8uq5aIVUanHTWNEzOkkVvzbqsRK0cITw
	 O9owWmsVVElKiMs0gs7+AGY9uBbDhccOWmID3NdGNjLpmxaP5n6lPYHjuApt6gAxBa
	 xsHUKz5nYCUrxADWXMkBgYaqiyg/DdimU1z4uTWVRPYemut1KvM5u04+mb8KaYEfwL
	 vK7DICIh+MN9A5vtOp3QnJuJkTDnSFLEPURsYSQK3yD+iF7AhJ+IYJkIM4PQmwYVA7
	 9VkfcnxU7rZog==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	arnd@arndb.de,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 12/39] ARC: fix spare error
Date: Mon, 25 Dec 2023 19:19:02 -0500
Message-ID: <20231226002021.4776-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002021.4776-1-sashal@kernel.org>
References: <20231226002021.4776-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_162054_206851_5875BF2B 
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
index 0b3bb529d2463..8f6f4a5429646 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -62,7 +62,7 @@ struct rt_sigframe {
 	unsigned int sigret_magic;
 };
 
-static int save_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
+static int save_arcv2_regs(struct sigcontext __user *mctx, struct pt_regs *regs)
 {
 	int err = 0;
 #ifndef CONFIG_ISA_ARCOMPACT
@@ -75,12 +75,12 @@ static int save_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
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
