Return-Path: <SRS0=IRdM=JJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DEAC43460
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:27:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00FE61401
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A00FE61401
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z8L8cHXxJKG18gnw8n0uuQnJuSr9h46S4zFhlDkBKFs=; b=Fjb+6JVsykRe68Oq5u7XATkFg
	kuu8kEFA74ceKuxmkt1es1yB7wbTJB1m4IZG9lZE12i8g1NwpGs070dImJirSDDkTVyu7eTbExX3A
	mvu/jfz4RXtUd4JjdKaT98ofSc6Ot5wdx1ESG8E2alzwuqI8cH5cL9542kgjg1HN+vTRec0biu0It
	9MOLtuZL3H9AoIbNH4hmVGf1H/m3RxaSoC1CJEuCgTf+7Xm0m47PnJXr/sxvA6y8FLplISQn9O6mM
	c301mFOJsGHAR9bbWPyXF+U3KEPpcz1/0fdrB1vE5RV7zXZOB/oqZ+RsGEiZJ/ZDvA0Ur3hf6fCRV
	dycj1pDbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzPf-007GBF-3O; Mon, 12 Apr 2021 16:27:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzPc-007G9e-50
 for linux-snps-arc@desiato.infradead.org; Mon, 12 Apr 2021 16:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=R1NEVvUteouXA5MteP//qyTtAORCS5muGhYtuIjS0nA=; b=TSuyg8GXU+GYG+r4GrPgalHvDo
 gJ7FFyjB0U3bdtTSKEf9z+pZGmLK3r9ii6Gb4OxLYdzGVr1rSr50voYQ28j5Q8/yJ4gdXaiX6CXbd
 zErMRd+wgIf2fPkjUsvuHFZTHjPWupd7wXds7NGduvNtCPOrLEiWXy4SN49ny7tgCI7oKVNIw3me/
 7/DCugsyS3KpPCG5dA/Gg5sBSIO5WTSAprjGKhiQC/uujuEHp/T/GgycLTWNeL236cMDjJb3X8QVf
 w7cjM0A+dZ2EtkwdqiA+Dp0QUgNe81ig+eA6+2z7SKDIZjuap7trI9opc+QU6SALXam5hcXan9XRv
 Z+D0xs5g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzPZ-006OsM-Mr
 for linux-snps-arc@lists.infradead.org; Mon, 12 Apr 2021 16:27:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8F2D6136F;
 Mon, 12 Apr 2021 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244861;
 bh=o0maZVGYgCnzP4OfbpZ1TajAz/ChKWpbamAKFME+umo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BRxMHB8EQGgMJGbbz1q47w7AOYE5LHIClkZW4V6qHz/bB55O6OvL0/JmUARcgcPwz
 TjZQzs91zhwTWloG5scRy6L7oF4JxmA0hYCTiTa4QOcjcdrxkKgYTgcZmSGG46/uwK
 Jlby5O4yaPv+rp+UBxwXh9M3C5xTjZ594O8fwAR3q9gRwGXW1CqXjWkXQKzx5sXlf0
 7srFg+C1ZUKCUKOFHRJ2n9XYsrMEew8hidk82jro0udESydp5IYGXlh8HHBebHthk4
 a/oyOkTp99ULQDIpwmzXS+9rZPr+2+UagC/ojnBHHSNzziAKnXMnWwaMyAZHYwj7C0
 GW9WSSrFFT0YQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>, Vineet Gupta <vgupta@synopsys.com>,
 Sasha Levin <sashal@kernel.org>, linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 4.4 03/23] arc: kernel: Return -EFAULT if
 copy_to_user() fails
Date: Mon, 12 Apr 2021 12:27:16 -0400
Message-Id: <20210412162736.316026-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162736.316026-1-sashal@kernel.org>
References: <20210412162736.316026-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092741_784109_3C81FD9A 
X-CRM114-Status: UNSURE (   9.34  )
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

From: Wang Qing <wangqing@vivo.com>

[ Upstream commit 46e152186cd89d940b26726fff11eb3f4935b45a ]

The copy_to_user() function returns the number of bytes remaining to be
copied, but we want to return -EFAULT if the copy doesn't complete.

Signed-off-by: Wang Qing <wangqing@vivo.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/kernel/signal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index 257b8699efde..639f39f39917 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -97,7 +97,7 @@ stash_usr_regs(struct rt_sigframe __user *sf, struct pt_regs *regs,
 			     sizeof(sf->uc.uc_mcontext.regs.scratch));
 	err |= __copy_to_user(&sf->uc.uc_sigmask, set, sizeof(sigset_t));
 
-	return err;
+	return err ? -EFAULT : 0;
 }
 
 static int restore_usr_regs(struct pt_regs *regs, struct rt_sigframe __user *sf)
@@ -111,7 +111,7 @@ static int restore_usr_regs(struct pt_regs *regs, struct rt_sigframe __user *sf)
 				&(sf->uc.uc_mcontext.regs.scratch),
 				sizeof(sf->uc.uc_mcontext.regs.scratch));
 	if (err)
-		return err;
+		return -EFAULT;
 
 	set_current_blocked(&set);
 	regs->bta	= uregs.scratch.bta;
-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
