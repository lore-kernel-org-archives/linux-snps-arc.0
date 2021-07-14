Return-Path: <SRS0=I1TK=MH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2255C12002
	for <linux-snps-arc@archiver.kernel.org>; Thu, 15 Jul 2021 00:18:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96392613CC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 15 Jul 2021 00:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96392613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8WyvW3ogy9ak7yEN4zHTOJ5/BvKrWqMARMDsnWpl/Lg=; b=ten7hf1LwsgEns
	fY7dGuUxUYHBPVPqS+DxsAXS6c69icuXOzSrimzlx+60MV2cePRrgg88ubi01rawGcXn0P19ckeVm
	ZfI4NyAL08ms3NSge/lEt0mMJbjkZdFTG5BoHzTLSHktNukgv7KvrFbcvnhZNWvIAMZ0vRtcgmlG1
	fJi1ty80SuubSi57imORh5uHzGS87ZQy89gxuwPAiFcxN9iBMCeJH6CqdWrXNnq3w98txAglDET2N
	VdirSE5t32ezkBvqhE1KQ2VlIHGCYO2L+Hr8onlnN1WVgzby5MH743V9IkVfcIahNu54aRigNXbsf
	G8OGb34lY4gUVlPL16Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3p5M-00Gc8i-Mf; Thu, 15 Jul 2021 00:18:40 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3nvh-00G7ii-1K
 for linux-snps-arc@lists.infradead.org; Wed, 14 Jul 2021 23:04:38 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B01EEC0BBE;
 Wed, 14 Jul 2021 23:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626303873; bh=sN8/PJ4qyNt5quiwEKpJiNDyd7Pwo/pNX7RtiBN1ayQ=;
 h=From:To:Cc:Subject:Date:From;
 b=P+EQDqMNdfa+wzmDaylrHVgmpE00ScY4o0n6uY2QXLPp7HREIE2Bv9UBxCSyuePRa
 XIEA/hhGFh4/xzPp/QgWAySY8u+lgjN1RcNfIp6QXCxDUFz/y5CDd/7j4PraYhmGJ2
 2xzvy25oq8BCJyr3lMayIQM2TdJQsr9ySfKucKvDO09+VNPvtwiyplfjasZ4N+AVr+
 pyzPBNqQ7lCtHw5a9Tge74yOb0HjA9npMygIJSAHerS0+PSYUhmfXdeld71ESfNJhn
 ZJAB6tn3T/qzDvJc3am9ocGzdUMpgdeVWoFJAwgsNyx/eaw/vsl+t57uPITdidqo18
 tqJBT1gmSAeOw==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 42A88A0251;
 Wed, 14 Jul 2021 23:04:30 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-kernel@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, stable@vger.kernel.org
Subject: [PATCH] ARC: fp: set FPU_STATUS.FWE to enable FPU_STATUS update on
 context switch
Date: Wed, 14 Jul 2021 16:04:26 -0700
Message-Id: <20210714230426.7141-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_160437_173325_08EA199A 
X-CRM114-Status: GOOD (  15.27  )
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

FPU_STATUS register contains FP exception flags bits which are updated
as side-effect of FP instructions but can also be manually wiggled such
as by glibc C99 functions fe{raise,clear,test}except() etc.
To effect the update, the programming model requires OR'ing FWE
bit(231). This bit is write-only and RAZ, meaning it is effectively
auto-cleared after a write and thus needs to be set everytime which
is how glibc implements this.

However there's another usecase of FPU_STATUS update, at the time of
Linux task switch when incoming task value needs to be programmed into
the register. This was added as part of f45ba2bd6da0dc ("ARCv2:
fpu: preserve userspace fpu state") which however missing the OR'ing
with FWE bit, meaning the new value is not effectively being written at
all, which is what this patch fixes. This was not caught in interm glibc
testing as the race window which relies on a specific exception bit to be
set/clear is really small and will end up causing extremely hard to
reproduce/debug issues.

Fortunately this was caught by glibc's math/test-fenv-tls test which
repeatedly set/clear exception flags in a big loop, concurrently in main
program and also in a thread.

Fixes: https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/54
Fixes: f45ba2bd6da0dc ("ARCv2: fpu: preserve userspace fpu state")
Cc: stable@vger.kernel.org	#5.6+
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/kernel/fpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/fpu.c b/arch/arc/kernel/fpu.c
index c67c0f0f5f77..ec640219d989 100644
--- a/arch/arc/kernel/fpu.c
+++ b/arch/arc/kernel/fpu.c
@@ -57,23 +57,26 @@ void fpu_save_restore(struct task_struct *prev, struct task_struct *next)
 
 void fpu_init_task(struct pt_regs *regs)
 {
+	const unsigned int fwe = 0x80000000;
+
 	/* default rounding mode */
 	write_aux_reg(ARC_REG_FPU_CTRL, 0x100);
 
-	/* set "Write enable" to allow explicit write to exception flags */
-	write_aux_reg(ARC_REG_FPU_STATUS, 0x80000000);
+	/* Initialize to zero: setting requires FWE be set */
+	write_aux_reg(ARC_REG_FPU_STATUS, fwe);
 }
 
 void fpu_save_restore(struct task_struct *prev, struct task_struct *next)
 {
 	struct arc_fpu *save = &prev->thread.fpu;
 	struct arc_fpu *restore = &next->thread.fpu;
+	const unsigned int fwe = 0x80000000;
 
 	save->ctrl = read_aux_reg(ARC_REG_FPU_CTRL);
 	save->status = read_aux_reg(ARC_REG_FPU_STATUS);
 
 	write_aux_reg(ARC_REG_FPU_CTRL, restore->ctrl);
-	write_aux_reg(ARC_REG_FPU_STATUS, restore->status);
+	write_aux_reg(ARC_REG_FPU_STATUS, (fwe | restore->status));
 }
 
 #endif
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
