Return-Path: <SRS0=cqGV=H7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B37C433DB
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Mar 2021 12:06:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FCC264DBD
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Mar 2021 12:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FCC264DBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ad/pXgUx4+Caf7vwAm6UYiEbk4tiGBlzUyZscFanNM=; b=BBO9cuMc9MjAtEySnfHkO2Fp+a
	933B2+/Bd+rQZoVkr82oMQzRwOdxDTdQI+ha3do4TwZHSVIPkfR9kYJDAJXFbv7wi6Q1io1N0W/69
	mi5BVgaLNcm2eZdGvLuWxMQ18MZiHBNj2pQp+lV66+GZD4EmZ0gnVTJ9fZE25rnzgJMrznQniG1ef
	oCqDZT5ZSbwU0nCIbmJ3CzybJ+79bLUuGudFM81TiNtqasST7ugJV0DnEWLgoPfsDZ61b7vxEoWIP
	gebQA8cOpQnggrDPY284UsknWdb3caUOYQRS1ogcirehTk+Rxm8J34SpSqLD9E4w+l6Tz4RhJ21cA
	lfiIYevg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGhJX-0002Es-Bd; Mon, 01 Mar 2021 12:06:15 +0000
Received: from mail-m121143.qiye.163.com ([115.236.121.143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGhJT-0002ET-NQ
 for linux-snps-arc@lists.infradead.org; Mon, 01 Mar 2021 12:06:13 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown
 [58.250.176.228])
 by mail-m121143.qiye.163.com (Hmail) with ESMTPA id 2A463540317;
 Mon,  1 Mar 2021 20:06:02 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Vineet Gupta <vgupta@synopsys.com>, Jens Axboe <axboe@kernel.dk>,
 Wang Qing <wangqing@vivo.com>, Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arc: kernel: Return -EFAULT if copy_to_user() fails
Date: Mon,  1 Mar 2021 20:05:48 +0800
Message-Id: <1614600349-15662-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGEweGR5CT0xJTEIZVkpNSk9NS0tITUlPTEtVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDI6Lww5Pj8QSBAdQyEjEzIr
 CQ5PCSlVSlVKTUpPTUtLSE1JQ0lJVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5LVUpMTVVJSUNZV1kIAVlBSUtOSTcG
X-HM-Tid: 0a77edae5993b038kuuu2a463540317
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_070612_013402_7A675A1E 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The copy_to_user() function returns the number of bytes remaining to be
copied, but we want to return -EFAULT if the copy doesn't complete.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/arc/kernel/signal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index a78d8f7..fdbe06c
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
2.7.4


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
