Return-Path: <SRS0=IRdM=JJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D4BC43140
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:24:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE596136F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 16:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE596136F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Swb4RCKAZJoQgGHqz20t+bYhNAos3TBN/mEsMHxVEfc=; b=cTuoHkq7PoPqYNgaGxxGtRvi5
	ipXgUwdVW5VKdt84FvflLoQ6nTMBS3Jp/mvFCAm7XO4Pzehpp+JbtfFafvFzQ76Wjpa2VnBGLO1zf
	K/CLeLhMp0RnFw8W/Z4SownPJcrGVtGk4KIez6cwDj6zcOq41gaMtyRE60pOUXlSu6c/IQxbYqDBP
	LTT7HVS8BC/BTR6dAwOqa9Md2xjzWIO59GmI2CNoc9yWCBxOPt3sLb33RQk0PkR+BOuBn6KUi3yDS
	B+u6VWXJqRUidRZ/mhqtxh+0Gi8dfQAiWT5n1GjFYY6BQGxPBhQFPJ/7jZ4Ws7CJuZOYcl7B/7PaA
	/HFvt01Wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzMJ-007Eqt-6F; Mon, 12 Apr 2021 16:24:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzMF-007Epe-Rb
 for linux-snps-arc@desiato.infradead.org; Mon, 12 Apr 2021 16:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tSiLGeyG5gUz4B/qwluvWbaSFu6Peyrg7hVhcOYDqu8=; b=srCTvyvNEQsuVAxMHYRTYYYryK
 QrsTEhNolhR94fGJZJ6RK2i2dNPeW4DKP9rXvtD67pWhrGDnnS4jYvRfRNamDIyP2OpBq8eRfsA2z
 BlFycZiXfZWFA8/Xp2M6lLNUhbaz/iaBV88oIdGkvJmS9Ju0uZTwjuZVIDqP0DiJGtDmqvTiLbxLb
 eXtDf7jvt64PNTsYMfuG2QnEjw3WG538U7HvVGlvsETpk1mCTT9rTk/xRUX00AqUJyfM6MYozehRJ
 jOiCZmttLe16i01mVIJMLUiyf9smt9j3R+EyhH0l9Biie/zBKTAkd6+kDW2R66kJ+1wLcEKTdRFHj
 Xf/ccjFw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzMD-006OAm-Fr
 for linux-snps-arc@lists.infradead.org; Mon, 12 Apr 2021 16:24:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89A4961350;
 Mon, 12 Apr 2021 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244653;
 bh=dacTTHiBg9ZOIvv+f+gvb9A+CQQYT6YWtqr5Sk2uCD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JMKELo7w8MB0asBALPoO567lQBWPldKpEh3lR2ecnjL0sx6pgVPicyNE6GH85y+g9
 pIqhuYKvN596Uj27hjDXLmSqGkKUw2LCGnbc9gw+2lz5bxrRdSj7y0LbHQ/dycj3EE
 XMvLhog+QK1ygLHYnqbWHHpSRMAMtJeOEAaZGgSnQjqCj+C3PqILkEImoAVIWvjvO2
 N3ooU9/c6W+IUcPtpfJKQOscpYR235IM8rla9roZH4cweWQijmvbtIT7j3Z6kowaJC
 z02mAsmMpR/mlUm616y4GZtXSpyJUiumzfXZT/7H3zat7xzobS4D88hcYim1t2ySEd
 6hZDs3h82b0JA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>, Vineet Gupta <vgupta@synopsys.com>,
 Sasha Levin <sashal@kernel.org>, linux-snps-arc@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 09/46] arc: kernel: Return -EFAULT if
 copy_to_user() fails
Date: Mon, 12 Apr 2021 12:23:24 -0400
Message-Id: <20210412162401.314035-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162401.314035-1-sashal@kernel.org>
References: <20210412162401.314035-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092413_566311_0A3EDEB3 
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
index 2be55fb96d87..98e575dbcce5 100644
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
