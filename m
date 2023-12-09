Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A167DC10F13
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Dec 2023 00:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ca1Gfj/2blBf0Cmn4ghH9+u3ya+R6B1hjuyZRJfrWwU=; b=ARwJr7LQbRV1JQ
	n5R5byXVqTXogVbDBfo5DZnv+bFdJCwN0PDDPn3gt+tdkXjvDS2RoQ3bhDmKY3t9ovwm9rpBKHUvg
	c8VHzlvou+CUT3uO3dhuqK9jXlUlwJXl4FUCe/uM3UsKEy22Udzh19+Sdl4rNsuUlgINWVvjnZwMP
	iR4K0U10PQ8YRbsFkT7BLLx3maRLHGiQhGxpPBdL8M7xilCDSlmx59E+wPq36W5ej9xphTPRN+kgq
	y0YatigLK3YH4e0yoVPIqy3VxcVfxMB71TxIjffJMQ1mYQ2JUE9PKP5+X1b8xwr3YPjEP2Iq9D4LT
	0lKt7aqphlD8ZkO2mRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHW-00GpXE-1B;
	Sat, 09 Dec 2023 00:33:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHQ-00GpTV-1g
	for linux-snps-arc@lists.infradead.org;
	Sat, 09 Dec 2023 00:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3E6AEB830F2;
	Sat,  9 Dec 2023 00:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E281C433CD;
	Sat,  9 Dec 2023 00:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702081994;
	bh=hLzXwVlYaX+nlr9QjyXGaz5pV+iFYoy2akFIFCgX1os=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ju7f7AciehcmGuxN1lC/X9I4U3mUoZfkl3dxGULZgZN8xX61Z8M+EC2hnMYkhP/Qp
	 vxGAAjBU8FmV9hML3yZxK5UHl20bwkKDZp8inhZ8IhFh4oGZJtoVK9lrg7H+/pa5Fv
	 BDwqby38/aYJ8lNAIlOG8ICqLfHaFclU8ghMeKVmf3WZZU/ChRPzaMjEuGUMgXzFpe
	 WJzZxPk5NEpZrpVEqtXgAG7k+4FIleMozsZaKdRvb7CWYlxUbPKPzal1BTILpXVT3K
	 p4PvJrTZH/zGLpZbc6JJzNPjqNEXlEesy+QfJ+N07AGcA7MSPDw5Gz9treubO9yIgE
	 CytrUa7igohFw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Pavel.Kozlov@synopsys.com,
	Vineet Gupta <vgupta@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 4/5] ARC: fix spare error
Date: Fri,  8 Dec 2023 16:33:06 -0800
Message-Id: <20231209003307.480051-5-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231209003307.480051-1-vgupta@kernel.org>
References: <20231209003307.480051-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_163316_691870_3154D944 
X-CRM114-Status: UNSURE (   9.13  )
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312082320.VDN5A9hb-lkp@intel.com/
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/kernel/signal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index 0b3bb529d246..8f6f4a542964 100644
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
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
