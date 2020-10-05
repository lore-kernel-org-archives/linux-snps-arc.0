Return-Path: <SRS0=IwNj=DM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D760C47095
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Oct 2020 16:12:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A178206DD
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Oct 2020 16:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wy0rbAlI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zyYBXnlx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A178206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uUIEqY+E6otwpu0RIzWkqGi2QAm6qnHL7B3wcbmdAfQ=; b=Wy0rbAlII1EOUeIUdmuergJE9z
	x3KEeQYtwZQ5SvpWcAsZ3E8BBbmZvKZCk1QISjWfwaC3fCHCdHzZMdpThFbx3cvN4cqsgM4wM2XGV
	n6ZOQaJnxeV7n10AEWwkLrfYjxVYRVu5xzoJpxJvT2f+3KEXzfJBqr1RduEj2qsFZGEEJa7hxQxwD
	tnBhurYyPa8Gx4dxl6qmmCQyKUNFblholxY47SWb/AMpHeYjPwhuOQRerNsRSWiBBiM8nngasHW1z
	GWOC2DcAukpWLUAh1xrDDw0kg2qFh/zX+A7WceHbqcPc53nUb/W6gZL8JJSZjqUkQvCuPsu5V5Umy
	oicTl68w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPT6W-0006c3-6V; Mon, 05 Oct 2020 16:12:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPT6T-0006b1-Pi
 for linux-snps-arc@lists.infradead.org; Mon, 05 Oct 2020 16:12:46 +0000
Received: from hump.ibmuc.com (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4DCB206DD;
 Mon,  5 Oct 2020 16:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601914364;
 bh=46wSMdq5RlcK/6mnsJmGrm+9ho+IPIx2GRlGSTCDeDg=;
 h=From:To:Cc:Subject:Date:From;
 b=zyYBXnlxC9t8tqBoyOvseoObLClTnx7Gj2TNCbspp0cMoQ32Ps96tX9z4DzEyWWNV
 EfPtkz4JL3y0YTSG1mVorsOI9YYeoG2Myrhfay+firgE3GMIXIe4nbUgx2WA3bri+g
 zpEosBFAs2a1DIQbWavq6JH38Vms1izEftV38how=
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: [PATCH] ARC: SMP: fix typo and use "come up" instead of "comeup"
Date: Mon,  5 Oct 2020 19:12:37 +0300
Message-Id: <20201005161237.196566-1-rppt@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_121245_983464_2CD36C31 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

When a secondary CPU fails to come up, there is a missing space in the
log:

	Timeout: CPU1 FAILED to comeup !!!

Fix it.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arc/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index eca35e02ce06..52906d314537 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -226,7 +226,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	}
 
 	if (!cpu_online(cpu)) {
-		pr_info("Timeout: CPU%u FAILED to comeup !!!\n", cpu);
+		pr_info("Timeout: CPU%u FAILED to come up !!!\n", cpu);
 		return -1;
 	}
 
-- 
2.25.4


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
