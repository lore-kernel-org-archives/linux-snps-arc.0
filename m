Return-Path: <SRS0=IRdM=JJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8E4C43461
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:25:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 961A461287
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 961A461287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RdismLHlg1puiQPX5NM8/Nk3e+hbYOcjc077OjDTAEQ=; b=iGZXgn5bHALTxIjdj7P+PBlCq
	XH+BLel6xqyVLHNfXIBVgmWv1fP3sh++Uf2zc5O9c6cAufIWXUQGLn4Y/B7+n4nZ1F73h3KSB6NLi
	38jyJ3cTE9rVKbz133RHX9s4RwUF6n3/T4JZDR8E67hBs1WAhdKfD7Z0Zxwyr5maXqlIifS21o+Et
	Upq8SDjq8BtEu0KnbG3F1qbXQ5PjDqtNZ69Me3J7iUjrLzI/qkRdzCsVe0Nt5FiDjlXztRr9NvoPJ
	6CBN4fU0FhczwQ5U+dT55ca8po2BK4gXROQ839P9gFKzRDNz1nFZ9yk+jNLgRo6WYFDCAOCp7f4KU
	JeTcRrmWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzNJ-007FB8-Md; Mon, 12 Apr 2021 16:25:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzNF-007F9V-P6
 for linux-snps-arc@desiato.infradead.org; Mon, 12 Apr 2021 16:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WroybsfiKKCwqdsq7XiVc83oWlB+3MXbiSznOmgCnYA=; b=wuxX8EFZ3/IU7VDhZsql1tLCUW
 FmkZ3RrPspoPsCZ9fbSpJTOzO+zv6kJd74vT57kTyCumgNan7gO34cLY/WdGBN8INNAIE9wYit6my
 1NkESDQJpMWb50Urr1nyqEF+3HSkuaT0nYIYjVbYDEZ71/03Fnpmb+jVR4bpOL4vjknE907ivhAxt
 1FIIXUOkYf5VE7pouzU7r41NEHgH82/A9ZDgoYqfaeCZ7WeAYltc5y+auGhMLWg6smX47j0+1FUnt
 fZrbMYF7X3kWeo6qmt7VUc1sXK9Dn7hxOxtBd4dLXsZ0AzeG5qYh258yP4dDgVbC9t1mOugnsGFyC
 8B5MaHqg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzNC-006ONM-E7
 for linux-snps-arc@lists.infradead.org; Mon, 12 Apr 2021 16:25:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61B9F61392;
 Mon, 12 Apr 2021 16:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244714;
 bh=tFOjMYGV2tT8V+N29X52ml1YoDEPNjqw+ds9kKuD2cM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WxnzPASO5Z7nr5GwVQaq0+ViIbRxyku71QW5z+4shQNnupyKMTjVr35ZB4Y7zVC6K
 19Z/cC0D1wTKAs5cYVErwSuR8Pv8sirGxWR9uJiRo1YpUQ+kUuKg8hDrdmhT6he0Yi
 gSQspx3489KaBatnSQco8SXr4Ts5BfaLytKmIwZHIQroIXuql2O0Vog38rA2twvQq1
 ouhGgVsMm8PMxvqQiO5Q+WVtVhxjHLps112er1Jy30gzy/nqt4kD2k2opRCk4ea5Rw
 XDxXpwUGnsgXs83EOk/QRXeUOU+GX9/4RxWo9CGrlEbtb7rz/I6nvKfGUIJIU3ydJz
 Vy8m1cBjw/n1w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>, Vineet Gupta <vgupta@synopsys.com>,
 Sasha Levin <sashal@kernel.org>, linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 09/39] arc: kernel: Return -EFAULT if
 copy_to_user() fails
Date: Mon, 12 Apr 2021 12:24:31 -0400
Message-Id: <20210412162502.314854-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162502.314854-1-sashal@kernel.org>
References: <20210412162502.314854-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092514_514967_38A6555E 
X-CRM114-Status: UNSURE (   9.52  )
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
index 3d57ed0d8535..404518051093 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -96,7 +96,7 @@ stash_usr_regs(struct rt_sigframe __user *sf, struct pt_regs *regs,
 			     sizeof(sf->uc.uc_mcontext.regs.scratch));
 	err |= __copy_to_user(&sf->uc.uc_sigmask, set, sizeof(sigset_t));
 
-	return err;
+	return err ? -EFAULT : 0;
 }
 
 static int restore_usr_regs(struct pt_regs *regs, struct rt_sigframe __user *sf)
@@ -110,7 +110,7 @@ static int restore_usr_regs(struct pt_regs *regs, struct rt_sigframe __user *sf)
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
