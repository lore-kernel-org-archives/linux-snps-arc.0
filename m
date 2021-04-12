Return-Path: <SRS0=IRdM=JJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983DFC43619
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:23:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43EC661287
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43EC661287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CR3Ri5m5vivvHDN+OcYkiREvRAKVtjhtbHh6VOqSQCc=; b=FoQN0n1Q3GX5r4B2J/7KfQdH9
	1OSPXuH1L5WWRNPav8b8PAb2ZksJqEiOMgN2iARs+pFg4QBesOmnm5fmdQtufBZ2xBkeenFdWHT3/
	X7HpvKi2qB7EVpOBCXjM/1W+3DBuBh6rCIUuG0c5XI5DLBzhlicdRT7aucTnyDpcWGBEgzF1hZ1lA
	Xrt5akINu13JLnK7HLxu8K0T43phzFKuHE/m1WDehL+lcaAGlY2z7xrMx2RiAGFHb3pSg1vK7mosj
	hso6nNRytMmdnwoFY0BVvEM8qTPv/S7I5ZySO/JnjXz2mNgzEVIBZ+yUfMgaYVTrSwaV99KWr4HIN
	T4gpXi5eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzLI-007Ed2-Il; Mon, 12 Apr 2021 16:23:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzLG-007EcY-3w
 for linux-snps-arc@desiato.infradead.org; Mon, 12 Apr 2021 16:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ROuXbS82pQbDxqMQjrwNPUd5nHwFeneSm5lYlugH5tM=; b=j5tg7z8iFuGQnkyk2yWP9HzUOR
 khxuMJWq1Jmjw3Q6cyxJf9alyfovi4zK0lD4E8zdlzaLqxHGg8jLSj1S3uC3xwmCxCRd5Q13DwIQg
 s8mdfPPsPAyWU4lLQkpUrXPvubmN41zs0614/YLCfV5xrYGOMRjV8a9zSXBL7I08Z8rQWO38DH+K6
 Kc2613BXW0d3koanlX/OEJz9B06zmUY9rcVk5ZEIu6rLns8gdJf5Xz2NY+Bg95SG3adN6K7kFLP/X
 Xx0a+5uMxKAPoK8cejfrjDyVKz5mmga84H4XF2clrjVIRG//Gin1fmx7/OvchPfExjhT0rFv9iBDK
 ePl3velg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzLD-006Ny1-OR
 for linux-snps-arc@lists.infradead.org; Mon, 12 Apr 2021 16:23:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5EBE61353;
 Mon, 12 Apr 2021 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244589;
 bh=apZYOHv4vJ7y+XFZi/DIF8bgJZHsFgODkqsL6C4kF6Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WGqbe+e+qwSTCnzKXPUSYDzD56hRUnjnEcMVscUlfN4nbiPG2vjknuhppC83ERbzr
 NAvrDZbkQReXCnkpqNjMCPEEUqMfULi+q4S/SCviDoz+fm1vkIZzEWM3n264cw/wG5
 I7KfiE8xMzNEqXa5Duo9GFhJ4zuCuf9nCfID4hvmfl+U9XAFG5fFlpaaRThL19OT2N
 pdlbG206FYwpVNhSFZ0yBUHpf/eviXi+80o63dwest898RApIr6eU27lUyg5bE7Y+h
 yCcniYRhcA5AFDYLJZYJ8/HNNN9mhOrbv930qP0el/GtBjAB6o5tH5xwmupSoe/C/k
 /crDzQ+CXeFBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>, Vineet Gupta <vgupta@synopsys.com>,
 Sasha Levin <sashal@kernel.org>, linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 10/51] arc: kernel: Return -EFAULT if
 copy_to_user() fails
Date: Mon, 12 Apr 2021 12:22:15 -0400
Message-Id: <20210412162256.313524-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162256.313524-1-sashal@kernel.org>
References: <20210412162256.313524-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092311_839171_55697DBD 
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
index a78d8f745a67..fdbe06c98895 100644
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
