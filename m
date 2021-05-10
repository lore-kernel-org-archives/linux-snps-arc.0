Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB12C433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 669E4611C2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 669E4611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rLRJrK8OcY5cFDaajBVW8m57bwzhIYK11ZeKqDaKFh8=; b=CPPnKBi9/nYhSN0Q0DFFH9OkO
	aUM20xa6mQ6pI5RCCrcagTlJXQfURMGzP2U04sNOLpbURKe0QFeGJ8j3B9Gmc/WHZjDmOf5RpwVtV
	AVsg/ozKRhHuffzspPu66/71UXIGiXj+UxoHQDQoR6kiQeukYEse7Z+szMWdDh/OFkg1LuRiIUE1K
	+3Plas4iUrOCKXDj+t+R1fk7OzBvye2/bLliv0gbd+FIX2XvDDnOzybjHmVMOJ855KQmbKqGdwtbC
	MTI6P+3dIslfOP9uiEoNNoyVecSdrDWQpAubSwYe6YwZIOIoY/VSVUAOTNOXIxrcgVOQmoqZJyODD
	TDhrJI+ZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgAIh-00FMnu-LM; Mon, 10 May 2021 18:06:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADK-00FKpM-R7
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 18:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tvChVv/Ka9icV+wWat+02cQrf3gmwmHQJPsI6Iwga6A=; b=fqmg9vnH77SQcdlf7xoyK3jA4M
 ShpmdWUXbiT6Bbi/mFzbYBNsY7nB4L2jVO+xATZrH7t1wKGjZIdVwNj7sCgPBKQ79WUdzioltfJ54
 woSZrlu82KshzwZnk9lD/lcl1fJtuCl/RUYLcxNf8JOGaRogXKmCZ6XOw/p2JaTqL16hRvzAiaY3y
 HGPqybJA3B1W8W4vtvJUwJanXebffgJnzwH5AomCm1rN1bnC7FM3NUpahWmXdNpLb2n/dTh1arMNA
 tnM9QdcyGIYOhM49CPYesMJCW13d6b5HplrDrqW9t64JpZxpqzb/XYXa2sFyN6W78MCQNCLQCol55
 bB8c1imw==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADG-0090zH-0v
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 18:01:05 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C06634013E;
 Mon, 10 May 2021 18:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620669657; bh=urN/mJuwk0h+dcZ1c31Vk5tLLFzY3xPVEQbIgdFnw7k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e6CCCFEyQgOgj3ayF+Fbh2N0jhHDb9qrcP2p/ugKn8jz8L36Go/9cw0qTlfhmYyGs
 k2Fle26gG1pCE+RXvvQAIZYmQ2xzIQc30GRxOfmjvwN4S22UYr+W1dUNV9SYXZ2SIS
 L6mEoyKCV2xLJke75uPjhslyqcd3Pa5vbIKJDR/IXrM96AvjSOp2ZoJ/1QvEdZArKF
 /wYqLJP4LfUL7w5Lh38wuolxoOXXwgaIlhbL9vRXCGMoeV64nxuTBq9nQ8VlZIpaEH
 U76g2uHN+ue2AGQ62Qj2awz1XGBst9YkCDxjAjB4gGand0bzSZ5mkGfSCWonfCx1Lc
 1bfLPiuPlHZSw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5295CA0068;
 Mon, 10 May 2021 18:00:56 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v3 4/4] lmbench: lat_rpc: fix stray pointer
Date: Mon, 10 May 2021 11:00:49 -0700
Message-Id: <20210510180049.61421-6-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510180049.61421-1-vgupta@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_110102_083859_369E86B6 
X-CRM114-Status: GOOD (  12.71  )
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

| # ./lat_rpc -S localhost
| potentially unexpected fatal signal 11.
| Path: /lmbench/bin/arc64/lat_rpc
| CPU: 0 PID: 62 Comm: lat_rpc Not tainted 5.6.0-00224-g8e1b159f529e #39
| Invalid Read @ 0x00000001 by insn @ 0x2011f110
|   @off 0x6c110 in [/lib/libc-2.32.so]  VMA: 0x200b3000 to 0x201b8000
| ECR: 0x00050100 EFA: 0x00000001 ERET: 0x2011f110
| STAT32: 0x80081082 [IE U     ]   BTA: 0x2011b87c
|  SP: 0x5fffefe8  FP: 0x00000000 BLK: 0x20103242
| r00: 0x00000001 r01: 0x00000002 r02: 0x00000001
| r03: 0x20101eb0 r04: 0x00000001 r05: 0x00000001
| r06: 0x00000000 r07: 0x00000000 r08: 0x00000001
| r09: 0x2019d8b0 r10: 0x20039fc4 r11: 0x5ffff0f0
| r12: 0x2019d6d0 r13: 0x2019d748 r14: 0x5ffff588
| r15: 0x00000000 r16: 0x00000000 r17: 0x5ffff708
| r18: 0x20039fc0 r19: 0xffffffff r20: 0x201ba010
| r21: 0x00000000 r22: 0x00000000 r23: 0x20039fc0
| r24: 0x00000bd0 r25: 0x00000073
Segmentation fault

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 ...bage-pointer-for-lat_rpc-S-localhost.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch

diff --git a/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch b/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
new file mode 100644
index 000000000000..619ec3861463
--- /dev/null
+++ b/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
@@ -0,0 +1,25 @@
+From 3830453a06269912d2772fe8c31bae44f27bb131 Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <vgupta@synopsys.com>
+Date: Fri, 8 May 2015 11:35:58 +0530
+Subject: [PATCH] Fix garbage pointer for lat_rpc -S localhost
+
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+---
+ src/lat_rpc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lat_rpc.c b/src/lat_rpc.c
+index 9c021926d761..ff4380ff38f3 100644
+--- a/src/lat_rpc.c
++++ b/src/lat_rpc.c
+@@ -101,6 +101,7 @@ main(int ac, char **av)
+ 	char	*usage = "-s\n OR [-p <tcp|udp>] [-P parallel] [-W <warmup>] [-N <repetitions>] serverhost\n OR -S serverhost\n";
+ 
+ 	state.msize = 1;
++	state.server = NULL;
+ 
+ 	while (( c = getopt(ac, av, "sS:m:p:P:W:N:")) != EOF) {
+ 		switch(c) {
+-- 
+2.25.1
+
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
