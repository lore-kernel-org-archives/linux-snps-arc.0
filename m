Return-Path: <SRS0=IRdM=JJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0920DC433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:26:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4E7B6137B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4E7B6137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9TRA2x4zGgnM9caC6Gml/L7fCxPpU79JC2z18izrsq0=; b=GETs//dgr2BRlRie6CCeL1Zu3
	tfpOlgQr6xFRIxEHLixpV4+++AC90ii4CRUGe1j5LyqLVCDXIbJ9HU4JORqBLb5J3z3z2fqjPCuW+
	cTu+ZvM2M9JSK/fknAqBUVFEsCzbsnkBFDLoCZaKYDVydPYPPQ/tLNxO7ai53Q4CEGRZjgd8fnkVv
	4I5wvFPhUKrGPyJDNo1iu7ScRiXQO54pKUYOv5hC8V/vTM56pkAoJQLzWddOLvaraVFqpHLHzYcc+
	8WEtRpLf4BDNKYBdaiPeQbrxaGa5HlueM+LHwTXQdbX74sqH+F727ZNXclr9FvPyXi94mDUI8Md8o
	0Ft+SzJzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzOZ-007Fhh-St; Mon, 12 Apr 2021 16:26:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzOX-007Ffq-Ty
 for linux-snps-arc@desiato.infradead.org; Mon, 12 Apr 2021 16:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FcaCfgob7aiHQRVSjDbTPfvaB4OL2kS9xpgbnaSU+I8=; b=u4tIaJfS0vzsXVoXUCSG6u1jLT
 nhuWjRMkmqDLJqRIewu/GOd9EAx+iSz2isEqr+pDXyTQ8teXBecfglAjgI46n5jlFoqrfQ788EHgH
 K6j8AJnV1wFuMvoz8cJKtw2nRSxHXCzmmkgMtb4WoSQlMWEyKx06yX3iWPjzZv3tjDXvxnmj/r/wf
 p9R/f0W0dCIkAyUkX+laB/F101BOY0oQEV4TvlJxMabkiaufMnplZKVz6brJX1MID6iQrxzL2RQBb
 JtYkLrI8LZWV/UrNrFlUvx5k73VD28SqXD1kMwvsaKTF6aF+h/Nlf802R8dzXTvb4XY1j8SyDo6jE
 I0IEkVbg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzOV-006Oev-J9
 for linux-snps-arc@lists.infradead.org; Mon, 12 Apr 2021 16:26:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B966613B0;
 Mon, 12 Apr 2021 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244795;
 bh=wQmhuzaCHK+pZWUvY/gW8zm0lQr9CrxBVVbOKseXz0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K0EhGecoQcIb56ZVMYQ3gygVT2fdjq2YNzs9amWRXShhwnORp9n9IN0I5sqwMVJEN
 1m7VYWo5GuypE29228Y1fzt9AOZVzScqkdwc8yb0vXG/jMGbmcFbTp6uXURrwxAlR4
 HcA/kx1ZSG0xs/lqHpCEuQMi3cxCGzSbdL0iUuoilx7PmPED2WaZcY03xdnUjdexf7
 KtgLjf+bszBizqiNdYUYp0g0xMJODZlLkvvQrDwQSbhCEvw2KjuugZ5gXysjF0+/7H
 nFErq61MhBqKFZ9ZhsGaiyYoYoPNpTmy6ah/Vqfd5p1raxCLxX4uGA49dJarex6Ryz
 TCuHoAJ7+xXCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>, Vineet Gupta <vgupta@synopsys.com>,
 Sasha Levin <sashal@kernel.org>, linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 03/25] arc: kernel: Return -EFAULT if
 copy_to_user() fails
Date: Mon, 12 Apr 2021 12:26:08 -0400
Message-Id: <20210412162630.315526-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162630.315526-1-sashal@kernel.org>
References: <20210412162630.315526-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092635_653865_775EDD27 
X-CRM114-Status: UNSURE (   9.44  )
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
index 48685445002e..da243420bcb5 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -99,7 +99,7 @@ stash_usr_regs(struct rt_sigframe __user *sf, struct pt_regs *regs,
 			     sizeof(sf->uc.uc_mcontext.regs.scratch));
 	err |= __copy_to_user(&sf->uc.uc_sigmask, set, sizeof(sigset_t));
 
-	return err;
+	return err ? -EFAULT : 0;
 }
 
 static int restore_usr_regs(struct pt_regs *regs, struct rt_sigframe __user *sf)
@@ -113,7 +113,7 @@ static int restore_usr_regs(struct pt_regs *regs, struct rt_sigframe __user *sf)
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
