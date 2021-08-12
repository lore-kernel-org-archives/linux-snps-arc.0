Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CF5C19F35
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79D4610CC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A79D4610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSE14emqBwWjSaOBWTzzvEnwIMwX2+H5ENjTYvVtp7g=; b=1gclrzM+YWS8xP
	K01dfFy2OuUikDj2A9Iy3Rw8ZibEhBB0tPu4tJpOhl83Sm3KIQsWxjO2dfcVgmc7QVwnJHOR//aCR
	P649u5ZLZlWNqyEkO5TxEryyUpOhz3gy+sFCJonHp0pYLcgJU4iDmf0inJomkzvM0aNoMAyjDbZt7
	icgY+RDMsCttTbffHfoue0LPgCZ3syFQU8sDpl24f7CfzTT/8jbLe5uxg1T2o+6cVnqZAbDAidXO8
	0DocwoLkitS50Nk/6mO3XigZ6quCVmgWNUgJu3y0XxeAGTzF1L8UbEVitTN+4dP5ngREVvwlRXNbk
	ZHiF/W8JkMzOxtOB3jpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKH4-00BU3F-Nh; Thu, 12 Aug 2021 23:38:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKGy-00BTve-1J
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A10960EE2;
 Thu, 12 Aug 2021 23:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811482;
 bh=t0y1Zd6GQZMYoGFevFFkBQTS73Vy19z+gE09o2JvAIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=luSYuKdNhi/DuXx9297D2f0p5HeU1kvjcfpqOAUjBqzOC056SojDpSuEeMGm+c5Hl
 tc/kj/Q/oeVF3Pm8oBm5gXgDjjQyKveTpxj4vfVEW4HUR7ur8Z4E9Sj66F99vTaKgh
 8hEGmQk6aJ6lZF3gRT7+xVn70njJ6pUKDT01x7Id6OprW1K04FSo2k9gBXRXGEqK5g
 Dabm6safYGwJcxgYUJ6f5i4Rv/2jadNXcg97MnXpN2evl/cbkwcJNplatxAGigNJ1N
 baFT2fEpFwqRarqgI4zuo46i5WN+YwQUzQlR3lHaDzPsJUml14VMqikoaL9g809yzh
 J0u+PNKR+6hrA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>
Subject: [PATCH v2 12/19] ARC: mm: move MMU specific bits out of entry code ...
Date: Thu, 12 Aug 2021 16:37:46 -0700
Message-Id: <20210812233753.104217-13-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163804_198937_9D5577AC 
X-CRM114-Status: GOOD (  10.05  )
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

... to avoid polluting shared entry code (across three ISA variants)
with ISA/MMU specific code.

Cc: Jose Abreu <joabreu@synopsys.com>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/mmu.h    | 8 ++++++++
 arch/arc/kernel/entry-arcv2.S | 1 +
 arch/arc/kernel/entry.S       | 7 ++-----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
index 0b117ea07048..414a27e806b6 100644
--- a/arch/arc/include/asm/mmu.h
+++ b/arch/arc/include/asm/mmu.h
@@ -84,6 +84,14 @@ static inline int is_pae40_enabled(void)
 
 extern int pae40_exist_but_not_enab(void);
 
+#else
+
+.macro ARC_MMU_REENABLE reg
+	lr \reg, [ARC_REG_PID]
+	or \reg, \reg, MMU_ENABLE
+	sr \reg, [ARC_REG_PID]
+.endm
+
 #endif	/* !__ASSEMBLY__ */
 
 #endif
diff --git a/arch/arc/kernel/entry-arcv2.S b/arch/arc/kernel/entry-arcv2.S
index 12d5f12d10d2..a7e6a2174187 100644
--- a/arch/arc/kernel/entry-arcv2.S
+++ b/arch/arc/kernel/entry-arcv2.S
@@ -10,6 +10,7 @@
 #include <asm/errno.h>
 #include <asm/arcregs.h>
 #include <asm/irqflags.h>
+#include <asm/mmu.h>
 
 ; A maximum number of supported interrupts in the core interrupt controller.
 ; This number is not equal to the maximum interrupt number (256) because
diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index 2cb8dfe866b6..dd77a0c8f740 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -101,11 +101,8 @@ ENTRY(EV_MachineCheck)
 	lr  r0, [efa]
 	mov r1, sp
 
-	; hardware auto-disables MMU, re-enable it to allow kernel vaddr
-	; access for say stack unwinding of modules for crash dumps
-	lr	r3, [ARC_REG_PID]
-	or	r3, r3, MMU_ENABLE
-	sr	r3, [ARC_REG_PID]
+	; MC excpetions disable MMU
+	ARC_MMU_REENABLE r3
 
 	lsr  	r3, r2, 8
 	bmsk 	r3, r3, 7
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
