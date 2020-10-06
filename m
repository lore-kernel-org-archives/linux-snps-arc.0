Return-Path: <SRS0=2Xzh=DN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34678C4363D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 03:30:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71339206F7
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 03:30:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hecUYBbi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71339206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zNAOVhxwF0/wmtzMBljTAJ7xlcj+HS7TXz1jAPHTwQ0=; b=hecUYBbiQb3EehDBtkL1/aXaq3
	b8FhYOMARcBJZkVuIxeQQqBUplHaldBJhXLO6SYxgU6E3EZVY6Xt8QBjM5oTo/yUSlgGrsGL0h9hS
	xeQHtF+14IOHknavhb99p4wX9qgLO4YGl0HurkvgPgPgZHfV0D6UEL4LzN/gihrnDtL6HDoOwxhJJ
	3Usmrt7PqREe1V5hsIdDGkAlceJw7vO+yYs7W3A3eyXSMCst2foKFZzkaQbjnBqhf9yJKYWEllRA4
	73zghttvoF/ivIT4YI40QnDylB6qMmWn+GcIdvCyCBtWvh4X0CE0sh/e65L4Hr/s99Lk/vuLjL6CR
	fUEoyCFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPdfx-0002ux-KW; Tue, 06 Oct 2020 03:30:05 +0000
Received: from [2601:1c0:6280:3f0::2c9a]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPdfv-0002uG-Fs; Tue, 06 Oct 2020 03:30:03 +0000
To: LKML <linux-kernel@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] arc: include/asm: fix typos of "themselves"
Message-ID: <610cc0df-deac-e2f6-e9ce-b19b3cba9501@infradead.org>
Date: Mon, 5 Oct 2020 20:30:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix copy/paste spello of "themselves" in 3 places.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/include/asm/atomic.h  |    4 ++--
 arch/arc/include/asm/cmpxchg.h |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

--- lnx-59-rc7.orig/arch/arc/include/asm/atomic.h
+++ lnx-59-rc7/arch/arc/include/asm/atomic.h
@@ -45,7 +45,7 @@ static inline int atomic_##op##_return(i
 									\
 	/*								\
 	 * Explicit full memory barrier needed before/after as		\
-	 * LLOCK/SCOND thmeselves don't provide any such semantics	\
+	 * LLOCK/SCOND themselves don't provide any such semantics	\
 	 */								\
 	smp_mb();							\
 									\
@@ -71,7 +71,7 @@ static inline int atomic_fetch_##op(int
 									\
 	/*								\
 	 * Explicit full memory barrier needed before/after as		\
-	 * LLOCK/SCOND thmeselves don't provide any such semantics	\
+	 * LLOCK/SCOND themselves don't provide any such semantics	\
 	 */								\
 	smp_mb();							\
 									\
--- lnx-59-rc7.orig/arch/arc/include/asm/cmpxchg.h
+++ lnx-59-rc7/arch/arc/include/asm/cmpxchg.h
@@ -20,7 +20,7 @@ __cmpxchg(volatile void *ptr, unsigned l
 
 	/*
 	 * Explicit full memory barrier needed before/after as
-	 * LLOCK/SCOND thmeselves don't provide any such semantics
+	 * LLOCK/SCOND themselves don't provide any such semantics
 	 */
 	smp_mb();
 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
