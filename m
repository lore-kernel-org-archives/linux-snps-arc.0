Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B2EC433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 21 Apr 2022 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YVyLtQjeV0Ixtu04kFzhYF5Am/Cqh4vY5Zboi61B0d4=; b=n831xMdEy6VXld
	juYAJ64M6TigwNSF7FkkyWWLXWiEfU76zm7REEcecQ6bpY4Ps5lssXIzzZZHMvk40ZsOvoQLUxnvI
	/0yiI8cB4L/D/6+TkCl/9GjmZufZ1pP/cf+syKBMr2515Dqi7UFV7FE0dIDOabAr2OJnFlxvdtWdW
	oUemjkqQ5+G94pIPsdnEWIkYv/i9nTvoVmpH2t/eDB8JX6kdCwfuW17ZvnQuXfcpDO9YbTe3Np46Z
	CuWq1eRLZnmwjtIE408m9kne6ZUmhVM3C2Fzpx+x728TpcprIfihiADp07BVxj1OzNTRYABV0T7un
	+ab8ZWDC/WFBY1eO52yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhdNE-00EteF-AT; Thu, 21 Apr 2022 20:25:56 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhdNB-00EtcX-DJ
 for linux-snps-arc@lists.infradead.org; Thu, 21 Apr 2022 20:25:55 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VAhmMxq_1650572745; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VAhmMxq_1650572745) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 22 Apr 2022 04:25:47 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] clean up some inconsistent indenting
Date: Fri, 22 Apr 2022 04:25:43 +0800
Message-Id: <20220421202543.129342-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_132553_654390_67D7A0D2 
X-CRM114-Status: UNSURE (   8.41  )
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

Eliminate the follow smatch warning:

./arch/arc/kernel/disasm.c:512:2-28: code aligned with following code on
line 517.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/arc/kernel/disasm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/disasm.c b/arch/arc/kernel/disasm.c
index 1e1db51b6941..412f2c794593 100644
--- a/arch/arc/kernel/disasm.c
+++ b/arch/arc/kernel/disasm.c
@@ -514,13 +514,13 @@ int __kprobes disasm_next_pc(unsigned long pc, struct pt_regs *regs,
 	/* For the instructions with delay slots, the fall through is the
 	 * instruction following the instruction in delay slot.
 	 */
-	 if (instr.delay_slot) {
+	if (instr.delay_slot) {
 		struct disasm_state instr_d;
 
 		disasm_instr(*next_pc, &instr_d, 0, regs, cregs);
 
 		*next_pc += instr_d.instr_len;
-	 }
+	}
 
 	 /* Zero Overhead Loop - end of the loop */
 	if (!(regs->status32 & STATUS32_L) && (*next_pc == regs->lp_end)
-- 
2.20.1.7.g153144c


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
