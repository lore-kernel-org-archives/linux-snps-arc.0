Return-Path: <SRS0=oLQF=EC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF85C55178
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 22:32:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8AEC206F7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 22:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jD9OJ+vy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MKdrgiFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8AEC206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wPd4r6onSd/Na2wWj/E6vX5OR7mggU2wt0Bbc0tib5s=; b=jD9OJ+vy/SXZJhDS5/N4u1K/vJ
	cXr2MqZVnBNJ5yRNHrvMRi0WmTK0I8pEBqvcFl8GH61d/iRr567GXcMV+kuJUXw3axab6crfGaHFb
	syuSpu6FbhsiUl7XPfYKoEm2nkbdYoiJoIaTGDrqVJhAFmr/ZZTpeaqSDVzY6/Ky3fzquQn6zKzLv
	Nab5FbA8cVvuPwy6W24x5+J8BdvC1V2btdFQ4ka6E48kUvNVjVkjmGeVCOU0P9FuYtIIDQoxrG99Y
	ULjn9TCwee0IqUqtqsffdjDZrtgYzzH4cMGWe33mYThPZAQ5r7Yt4VjSaZUBZcBvAPlNyOFLwn653
	CeucZ+iA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXXWC-0002IT-50; Tue, 27 Oct 2020 22:32:40 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXXWA-0002Ht-69
 for linux-snps-arc@lists.infradead.org; Tue, 27 Oct 2020 22:32:39 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4885E40515;
 Tue, 27 Oct 2020 22:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1603837956; bh=Sja1KZoIneYVxxUnkZzOBZp8oo90HsWHX/KK4Q7CDf4=;
 h=From:To:Cc:Subject:Date:From;
 b=MKdrgiFjoU9OwyG2l+530lFHRM3Umm0ABuAwQgl9tEEPtagDWQ9s+O4a82hsVx3rL
 9dVdUApGKD1nsShPqIPhAwUiYqUOBhQ9CuQbJ/a34yTW+EQJw9rZ4u4imaCbx6sD4z
 /Iy3IXb8eS+HGJTbm2Gr3tOPRID3m9JdvDpouPM91qMP/Tbom4CAfdh8WH207E0Gg6
 9IdBvlWiTxHd6bk3Fezq2St1ECL+6im6goDAhimCK82tN77TFyBLmmNlQpHzlVXO/1
 OsIjKq38EsdGdirY6KW3co3AleQUCUP5Di27h18KjEPhTLuYbUKj6VhXvlbitjEssY
 0tyVSVuiFS8DQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 9DF40A0096;
 Tue, 27 Oct 2020 22:32:34 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: stack unwinding: avoid indefinite looping
Date: Tue, 27 Oct 2020 15:32:33 -0700
Message-Id: <20201027223233.3199386-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_183238_400879_37407778 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey.Brodkin@synopsys.com,
 Eugeniy.Paltsev@synopsys.com, linux-kernel@vger.kernel.org,
 Igor.Guryanov@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Currently stack unwinder is a while(1) loop which relies on the dwarf
unwinder to signal termination, which in turn relies on dwarf info to do
so. This in theory could cause an infinite loop if the dwarf info was
somehow messed up or the register contents were etc.

This fix thus detects the excessive looping and breaks the loop.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/kernel/stacktrace.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arc/kernel/stacktrace.c b/arch/arc/kernel/stacktrace.c
index bf40e06f3fb8..0fed32b95923 100644
--- a/arch/arc/kernel/stacktrace.c
+++ b/arch/arc/kernel/stacktrace.c
@@ -115,7 +115,7 @@ arc_unwind_core(struct task_struct *tsk, struct pt_regs *regs,
 		int (*consumer_fn) (unsigned int, void *), void *arg)
 {
 #ifdef CONFIG_ARC_DW2_UNWIND
-	int ret = 0;
+	int ret = 0, cnt = 0;
 	unsigned int address;
 	struct unwind_frame_info frame_info;
 
@@ -135,6 +135,11 @@ arc_unwind_core(struct task_struct *tsk, struct pt_regs *regs,
 			break;
 
 		frame_info.regs.r63 = frame_info.regs.r31;
+
+		if (cnt++ > 128) {
+			printk("unwinder looping too long, aborting !\n");
+			return 0;
+		}
 	}
 
 	return address;		/* return the last address it saw */
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
