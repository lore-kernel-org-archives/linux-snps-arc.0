Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622E6C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 17:07:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1E50206BE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 17:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dP6erO5u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Czv3URrN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1E50206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HWlfCQdxzoD0tdZkap4pGRaBnMiiPFjKEYXxg9dShGM=; b=dP6erO5uMPpcgR
	7Uj9S/1aoamr4UGxNraHPXtPZkB4SqoozbMe+/DUBBGx8ebTwQJJXty+cIjd2PojYAi2yAdkN73XU
	EZG9rHJT+5NYeetSSd5K9qUDBBlRXLJyVkTl6SfgCFE7P7A1wdLcRKct3CUKciw1MOOzcfh2+p5uz
	AH1rAclJ23moqqaZdRfCxBVU3TnEAK+1ajEBExw/m+yYhWeeuJ7sDGvDQ1FnMxpob6pVwZFAouzTb
	OZ3Eju8NfjeEiwCV1SQY0brfSxPCjNDUz/qBJj05fOT5/lgW3J8jNb+9MhlS1tvArkwCm4yjhWPPS
	5L4gfN7qSvRIMNp+Th4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC4pn-0003wk-8f; Wed, 11 Mar 2020 17:07:55 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC4pk-0003vy-I6
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 17:07:54 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1848FC0094;
 Wed, 11 Mar 2020 17:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583946471; bh=XQhHspApiH3FwXi8S/ko82irXzyYeNJNNdlg4VSv3sU=;
 h=From:To:Cc:Subject:Date:From;
 b=Czv3URrNFiu1bQGQJIL5AvSfPDvXCSlrPflvtZkQR7yc/w3Q0h6uNJ1nL0avGgoK3
 nXNm1LGw/vHbdfuWnR/Z3OAMSpPcN64ET/FnMKgRCvxNjiVu+mEasf5uLi/pCPGR0I
 BBcxWjGhRM6Th1wDscXo7RNEU58siAnVvIwDA1inNcEB6gpphq8DcYpW/xBwYQ0sz9
 hWU2/MvkSkwmVUIgC/IJIJOXEE1uckICBKjFPmNNSG0hDN1U1JlJPw6cXQRxSvrB5U
 LbBViNOersqYNNNuiB8n0eIizRZbUDJy5js3SfltAWb7KZNGK5oUzgf+pHFmaZmxCa
 woxyUXjrIMR0A==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.32])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7EA2EA00E1;
 Wed, 11 Mar 2020 17:07:45 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: show_regs: reduce lines of output
Date: Wed, 11 Mar 2020 10:07:43 -0700
Message-Id: <20200311170743.26904-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_100752_669855_7B55E21B 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Before
------

| CPU: 1 PID: 29061 Comm: tst-dynarray-at Not tainted 5.6.0-rc1-00002-g941fcc018ca6-dirty #12
|
| [ECR   ]: 0x00090000 =>
| [EFA   ]: 0x00000000
| [ERET  ]: 0x2004aa6c
|     @off 0x2aa6c in [/lib/libc-2.31.9000.so]
      VMA: 0x20020000 to 0x20122000
| [STAT32]: 0x80080a82 [IE U     ]
| BTA: 0x2004aa18 SP: 0x5ffff8a8  FP: 0x5ffff8fc
| LPS: 0x2008788e LPE: 0x20087896 LPC: 0x00000000
| r00: 0x00000000 r01: 0x5ffff8a8 r02: 0x00000000
| r03: 0x00000008 r04: 0xffffffff r05: 0x00000000
| r06: 0x00000000 r07: 0x00000000 r08: 0x00000087
| r09: 0x00000000 r10: 0x2010691c r11: 0x00000020
| r12: 0x2003b214 r13: 0x5ffff8a8 r14: 0x20126e68
| r15: 0x2001f26c r16: 0x2012a000 r17: 0x00000001
| r18: 0x5ffff8fc r19: 0x00000000 r20: 0x5ffff948
| r21: 0x00000001 r22: 0xffffffff r23: 0x5fffff8c
| r24: 0x4008c2a8 r25: 0x2001f6e0

After
-----

| CPU: 1 PID: 29061 Comm: tst-dynarray-at Not tainted 5.6.0-rc1-00002-g941fcc018ca6-dirty #12
|   @off 0x2aa6c in [/lib/libc-2.31.9000.so]  VMA: 0x20020000 to 0x20122000
| ECR: 0x00090000 EFA: 0x00000000 ERET: 0x2004aa6c
| STAT32: 0x80080a82 [IE U     ]  BTA: 0x2004aa18
| BLK: 0x2003b214  SP: 0x5ffff8a8  FP: 0x5ffff8fc
| LPS: 0x2008788e LPE: 0x20087896 LPC: 0x00000000
| r00: 0x00000000 r01: 0x5ffff8a8 r02: 0x00000000
| r03: 0x00000008 r04: 0xffffffff r05: 0x00000000
| r06: 0x00000000 r07: 0x00000000 r08: 0x00000087
| r09: 0x00000000 r10: 0x2010691c r11: 0x00000020
| r12: 0x2003b214 r13: 0x5ffff8a8 r14: 0x20126e68
| r15: 0x2001f26c r16: 0x2012a000 r17: 0x00000001
| r18: 0x5ffff8fc r19: 0x00000000 r20: 0x5ffff948
| r21: 0x00000001 r22: 0xffffffff r23: 0x5fffff8c
| r24: 0x4008c2a8 r25: 0x2001f6e0 BTA: 0x2004aa18

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/kernel/troubleshoot.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index b79886a6cec8..d2999503fb8a 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -104,8 +104,7 @@ static void show_faulting_vma(unsigned long address)
 			if (IS_ERR(nm))
 				nm = "?";
 		}
-		pr_info("    @off 0x%lx in [%s]\n"
-			"    VMA: 0x%08lx to 0x%08lx\n",
+		pr_info("  @off 0x%lx in [%s]  VMA: 0x%08lx to 0x%08lx\n",
 			vma->vm_start < TASK_UNMAPPED_BASE ?
 				address : address - vma->vm_start,
 			nm, vma->vm_start, vma->vm_end);
@@ -120,8 +119,6 @@ static void show_ecr_verbose(struct pt_regs *regs)
 	unsigned int vec, cause_code;
 	unsigned long address;
 
-	pr_info("\n[ECR   ]: 0x%08lx => ", regs->event);
-
 	/* For Data fault, this is data address not instruction addr */
 	address = current->thread.fault_address;
 
@@ -130,10 +127,10 @@ static void show_ecr_verbose(struct pt_regs *regs)
 
 	/* For DTLB Miss or ProtV, display the memory involved too */
 	if (vec == ECR_V_DTLB_MISS) {
-		pr_cont("Invalid %s @ 0x%08lx by insn @ 0x%08lx\n",
+		pr_cont("Invalid %s @ 0x%08lx by insn @ %pS\n",
 		       (cause_code == 0x01) ? "Read" :
 		       ((cause_code == 0x02) ? "Write" : "EX"),
-		       address, regs->ret);
+		       address, (void *)regs->ret);
 	} else if (vec == ECR_V_ITLB_MISS) {
 		pr_cont("Insn could not be fetched\n");
 	} else if (vec == ECR_V_MACH_CHK) {
@@ -191,31 +188,31 @@ void show_regs(struct pt_regs *regs)
 
 	show_ecr_verbose(regs);
 
-	pr_info("[EFA   ]: 0x%08lx\n[BLINK ]: %pS\n[ERET  ]: %pS\n",
-		current->thread.fault_address,
-		(void *)regs->blink, (void *)regs->ret);
-
 	if (user_mode(regs))
 		show_faulting_vma(regs->ret); /* faulting code, not data */
 
-	pr_info("[STAT32]: 0x%08lx", regs->status32);
+	pr_info("ECR: 0x%08lx EFA: 0x%08lx ERET: 0x%08lx\n",
+		regs->event, current->thread.fault_address, regs->ret);
+
+	pr_info("STAT32: 0x%08lx", regs->status32);
 
 #define STS_BIT(r, bit)	r->status32 & STATUS_##bit##_MASK ? #bit" " : ""
 
 #ifdef CONFIG_ISA_ARCOMPACT
-	pr_cont(" : %2s%2s%2s%2s%2s%2s%2s\n",
+	pr_cont(" [%2s%2s%2s%2s%2s%2s%2s]",
 			(regs->status32 & STATUS_U_MASK) ? "U " : "K ",
 			STS_BIT(regs, DE), STS_BIT(regs, AE),
 			STS_BIT(regs, A2), STS_BIT(regs, A1),
 			STS_BIT(regs, E2), STS_BIT(regs, E1));
 #else
-	pr_cont(" : %2s%2s%2s%2s\n",
+	pr_cont(" [%2s%2s%2s%2s]",
 			STS_BIT(regs, IE),
 			(regs->status32 & STATUS_U_MASK) ? "U " : "K ",
 			STS_BIT(regs, DE), STS_BIT(regs, AE));
 #endif
-	pr_info("BTA: 0x%08lx\t SP: 0x%08lx\t FP: 0x%08lx\n",
-		regs->bta, regs->sp, regs->fp);
+	pr_cont("  BTA: 0x%08lx\n", regs->bta);
+	pr_info("BLK: %pS\n SP: 0x%08lx  FP: 0x%08lx\n",
+		(void *)regs->blink, regs->sp, regs->fp);
 	pr_info("LPS: 0x%08lx\tLPE: 0x%08lx\tLPC: 0x%08lx\n",
 	       regs->lp_start, regs->lp_end, regs->lp_count);
 
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
