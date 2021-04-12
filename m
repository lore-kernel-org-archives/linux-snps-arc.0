Return-Path: <SRS0=IRdM=JJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDA8C43462
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:27:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 467F8613DA
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 467F8613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QEz5zlb90jOge9V53J6wVnJ8WTpk7vf+gSU5Q482m1Y=; b=JYUfokprM1s7APDIknCQAwgID
	Skcxof7IdFHd8riq569ldUH3trKiTwY4LqPUeP5vmbhhWczNExmv7Zv3sYE+crNNNFAtuEpZ4YiK8
	DAGO4w4tWkl0KBHM0/ERicv5w2UDqfty+6bid4fkQ/+CocKIvIMviNnf4LQyrrfydcQKbZEV+NzzO
	WbI5sRgs+5NPMRqTzmh7DCc+hCo7RWZQYSWS2IQvZcfjO+G4F6FrPu8ik91UWKk/1EFP2njIosD/Z
	V+fM9K9eHtpZA2U4zF/dv1pkHhuWmmwVzyNwJNbTV+7w6KRTecAA20mixiY8Cf/yfbpDqeuBThF4N
	ILFQIQQaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzPA-007FxO-1q; Mon, 12 Apr 2021 16:27:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzP5-007FvF-Qi
 for linux-snps-arc@desiato.infradead.org; Mon, 12 Apr 2021 16:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=THU2X2ge6A4GucHQ8bM2FrynpRSdOneXjpDulzJ6lm8=; b=jP9dS5Kcow8tMIYB3uGalhC/L8
 cP4qw8F5dHabGLT+Ux4z0UI3R1ONdkiuQRwvbq+kb3Z30HdGn2CtDCAKvlFUwA01qxT5Im+NgdMUw
 /Z9QXe18xwp9eorsUVEYnr4v88StzBB6kYxgZafMHf4ZieHROnwxXkCl5mSd1vAGgyG4KykdwaSYg
 fHMMetF4eQNAIDjtt5Xx87AkmtjGq3ai6j4XSfd+sYJxi5D3jzxJJ//c29r4eJrDm0FxydVKMkKEd
 zTN+CAnDEwxC6oRbuxVqYRt5bU7w0OHZyrrVEXRbuBwzM+VSbYCqCr7cHXTVDWLEqPAxCEMHSq/cE
 ejF9AzaA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzP3-006Olr-9Q
 for linux-snps-arc@lists.infradead.org; Mon, 12 Apr 2021 16:27:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4849E613C9;
 Mon, 12 Apr 2021 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244829;
 bh=q3j0YkazXOCbG2Izf4RL81IikRFJeV8YQYzMLMhbLII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kx3SxsUSMCY6huh/paffoXipMV7DWbMhkqnd03G1PN5dNXccVvlwPF0zutMYbaJcs
 bbuKjDT7lEXfHAAI1Eek1j2dpwLen9bQ+o+7Hl93jKmfqBxNysEfB9Pd2ExkwkcmN1
 9SyrV+0fWnEYzeI5EVyJNXibFPX5cHaxGII9uxdEGji34qJuVyO1zqmeqrYImzhVzX
 L9xq5O7mFkwhSNL+uxYOFC0dXc0vbzicSYKsS8r/8l3+ccULStPaXZlM19AUCcXggB
 3nErc8q/0wXmcnPWdTE2caj09xaCPEhMJfQhB1PBCjj5XGAaNOLTw31vfehkD+vpZU
 FbhV+rdGwFE4g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>, Vineet Gupta <vgupta@synopsys.com>,
 Sasha Levin <sashal@kernel.org>, linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 4.9 03/23] arc: kernel: Return -EFAULT if
 copy_to_user() fails
Date: Mon, 12 Apr 2021 12:26:44 -0400
Message-Id: <20210412162704.315783-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162704.315783-1-sashal@kernel.org>
References: <20210412162704.315783-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092709_372991_5A2F82BB 
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
index d347bbc086fe..16cdb471d3db 100644
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
