Return-Path: <SRS0=Hn5+=NE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCBEC4338F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Aug 2021 16:30:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9909D6103A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Aug 2021 16:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9909D6103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=zte.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qU/Z6j+/Fe0+iwr2bZ+EkMWNWXlu68XDWawWjzf1HQ0=; b=A2UR+5zChog/w6Llk/z+MK1FhT
	xL+bh0XjB7SgJf+/jCg/AZwrhipqbe5h/VJFya6aETKK0E908n1L6/cpLiCrh9SKyLJuSRxj8wnN6
	vSNDBFkWnB9lNKPPHAJ1oEQ8xF9dgQY3bWWOg8geBroG+UUzxUnfpAc7XDgFeiK0uG+pKX2LJeSNB
	x51xBhdc95HgVk7cguebm1tHQ3uROq3XZ+DV5iDKbI3JxolOMJDZvZAgUJQ91KcHX+fI1ObjgRweR
	y+0sPPhATSj9s/eO26g1uL8FkFzHQA90Qatcu/qwfWNYrmTuDLpLfxZkeeOqLmgAtIDPDjRNN3NqR
	mftf08Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEa59-00D82Y-4S; Fri, 13 Aug 2021 16:30:55 +0000
Received: from mxhk.zte.com.cn ([63.217.80.70])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEa56-00D7zn-4n
 for linux-snps-arc@lists.infradead.org; Fri, 13 Aug 2021 16:30:54 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id B7C9D2AF5BC718C446DA;
 Sat, 14 Aug 2021 00:30:41 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
 by mse-fl2.zte.com.cn with SMTP id 17DGUYGS051215;
 Sat, 14 Aug 2021 00:30:34 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-cloudhost8.localdomain (unknown [10.234.72.110])
 by smtp (Zmail) with SMTP; Sat, 14 Aug 2021 00:30:34 +0800
X-Zmail-TransId: 3e8861169e29017-6e5c4
From: Yi Wang <wang.yi59@zte.com.cn>
To: vgupta@synopsys.com
Cc: linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 xue.zhihong@zte.com.cn, wang.yi59@zte.com.cn, jiang.xuexin@zte.com.cn,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-nest] arch/arc/kernel/: fix misspellings using codespell
 tool
Date: Sat, 14 Aug 2021 00:30:38 +0800
Message-Id: <20210813163038.25293-1-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 2.33.0.rc0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl2.zte.com.cn 17DGUYGS051215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_093052_425649_9986959A 
X-CRM114-Status: GOOD (  14.75  )
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
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Some typos are found out by codespell tool:

./intc-compact.c:145: prioity ==> priority
./smp.c:286: recevier ==> receiver
./stacktrace.c:152 prelogue ==> prologue

Fix typos found by codespell.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
---
 arch/arc/kernel/intc-compact.c | 2 +-
 arch/arc/kernel/smp.c          | 2 +-
 arch/arc/kernel/stacktrace.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index a86641b..6885e42 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -142,7 +142,7 @@ static int arc_intc_domain_map(struct irq_domain *d, unsigned int irq,
  *    Time hard-ISR, timer_interrupt( ) calls spin_unlock_irq several times.
  *    Here local_irq_enable( ) shd not re-enable lower priority interrupts
  * -If called from soft-ISR, it must re-enable all interrupts
- *    soft ISR are low prioity jobs which can be very slow, thus all IRQs
+ *    soft ISR are low priority jobs which can be very slow, thus all IRQs
  *    must be enabled while they run.
  *    Now hardware context wise we may still be in L2 ISR (not done rtie)
  *    still we must re-enable both L1 and L2 IRQs
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index db0e104..b5b5fe2 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -283,7 +283,7 @@ static void ipi_send_msg_one(int cpu, enum ipi_msg_type msg)
 	/*
 	 * Call the platform specific IPI kick function, but avoid if possible:
 	 * Only do so if there's no pending msg from other concurrent sender(s).
-	 * Otherwise, recevier will see this msg as well when it takes the
+	 * Otherwise, receiver will see this msg as well when it takes the
 	 * IPI corresponding to that msg. This is true, even if it is already in
 	 * IPI handler, because !@old means it has not yet dequeued the msg(s)
 	 * so @new msg can be a free-loader
diff --git a/arch/arc/kernel/stacktrace.c b/arch/arc/kernel/stacktrace.c
index 1b9576d..c376ff3 100644
--- a/arch/arc/kernel/stacktrace.c
+++ b/arch/arc/kernel/stacktrace.c
@@ -149,7 +149,7 @@
 #else
 	/* On ARC, only Dward based unwinder works. fp based backtracing is
 	 * not possible (-fno-omit-frame-pointer) because of the way function
-	 * prelogue is setup (callee regs saved and then fp set and not other
+	 * prologue is setup (callee regs saved and then fp set and not other
 	 * way around
 	 */
 	pr_warn_once("CONFIG_ARC_DW2_UNWIND needs to be enabled\n");
-- 
1.8.3.1
--=====_003_next=====--

--=====_001_next=====
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--=====_001_next=====--


