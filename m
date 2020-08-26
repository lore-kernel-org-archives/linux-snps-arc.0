Return-Path: <SRS0=1o5z=CE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54E6C433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Aug 2020 14:56:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A83214F1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Aug 2020 14:56:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AwzR3p3p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOUyopMJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A83214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rLRNzw0HX5NwmqsQPGWSueFuwcjewclBJ2jZl53MLE0=; b=AwzR3p3pec8Fop4KlC63VAn1L
	WwVAQAT5MOASF2pur/5aIw+6AxCFq1W0RgUaZaa3wdK7qxsOCxJzSBnLrAJk1dlPUTPQ7p1KtGlQW
	VGky98Vcs8LQxHfumlTihNsR/mUFM2x3rSnGTa9EL/iCDM4ZtDr/aEIa3viSjAG82+lAg1xubmrWB
	/U6GtCwoDMEJKXaDaQyemsGjTspRym51bzdn6nlcOORHFDO11jbNkt5ih9F7upbIv09xm9LnzDL/5
	AWQLNRJ3lcyShUIedLu2hSGEj8xJd0xmkWKGVeznaoTkdi6isCXPyeI9Af44Ax65MEW0/xxc6vqYb
	QSxBBROnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwr5-00049R-GA; Wed, 26 Aug 2020 14:56:51 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwnY-0002HT-9j
 for linux-snps-arc@lists.infradead.org; Wed, 26 Aug 2020 14:53:20 +0000
Received: by mail-pj1-x1043.google.com with SMTP id mw10so976855pjb.2
 for <linux-snps-arc@lists.infradead.org>; Wed, 26 Aug 2020 07:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ti5aFrmBPkKLjysSSabr7+oEKMDvyOOxBJHtaQyN6bs=;
 b=YOUyopMJi6fxTdRmP6+MMmHjqBrzqBdGsJhib6WpIKk/k44xKZCS738qRolqHsFXmK
 NrALc+p220xDhHQPzHhlT6Ov/G08qamDHOPs77c0f5Je9WZ798lnbsmyollAIKBpDDsV
 wWwncVzhMt2FWa36IUwtoK/BaRtjeH5LUueOpqkjqFqjYSsjexDCCQdC6qDm92nX0QLg
 6PyU9tmVP48l9eq3tmumUSuCjKbCKJauA7s0RqUG/lym/jmR+FG9/iUHM7U4kJUebuor
 GGJ5VtumN6UR7E0Td2DRSOO5v5K47hFfVC4pWBzq7eERdpNb7tQlVinH27SPg4d9DTj3
 Ov1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ti5aFrmBPkKLjysSSabr7+oEKMDvyOOxBJHtaQyN6bs=;
 b=MGc1l3+Ug9r0id8lvQLEx9+vIZBn2hY0/nMnTE9oli9R5cq9RcFBciYN52VexGNzjH
 4d1HaoQtF1KcgJllVWBOHuY3A1TWCtIvxBJwry5mrbp1epxCUoSA2i1JXFwToT/YolgR
 UKzglKodY9w2z8v6FkOafqz8xhgGm0OSXwXC6HL3c8jTPSp4YY6/L05j4zEn/zsjWYk+
 9he0mDPTz62Axy6EGAWPWA2JAYj9kSXEVUOPzckRnUO31B+LG1HWM9k3xHQu5IYEdQ49
 ieCXKtTMJysjWIj4i3jU3ZiXXzKjhL7z9JOhGpVin4QmlGa/xGJtQWlwXzEI4YZfyYs5
 cwgg==
X-Gm-Message-State: AOAM531x31ErXsiU4aUoFE/6t5au9UnbXJqHsOZiPNRFX1IyiyMzt+KA
 U5fLih4DpEnNH1ZNYMVtqaVLOMyQEc8=
X-Google-Smtp-Source: ABdhPJy2SGDVDGvyx3hWFj5EHkiUSzPX9nxHi3Ncwo7mVkZoph8qmVI6xz3/z152bMoeWCsi54CPxg==
X-Received: by 2002:a17:90b:fd0:: with SMTP id
 gd16mr6417371pjb.122.1598453589734; 
 Wed, 26 Aug 2020 07:53:09 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id r7sm3327140pfl.186.2020.08.26.07.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 07:53:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [PATCH v2 03/23] arc: use asm-generic/mmu_context.h for no-op
 implementations
Date: Thu, 27 Aug 2020 00:52:29 +1000
Message-Id: <20200826145249.745432-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200826145249.745432-1-npiggin@gmail.com>
References: <20200826145249.745432-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_105313_001969_A612F407 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/arc/include/asm/mmu_context.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arc/include/asm/mmu_context.h b/arch/arc/include/asm/mmu_context.h
index 3a5e6a5b9ed6..df164066e172 100644
--- a/arch/arc/include/asm/mmu_context.h
+++ b/arch/arc/include/asm/mmu_context.h
@@ -102,6 +102,7 @@ static inline void get_new_mmu_context(struct mm_struct *mm)
  * Initialize the context related info for a new mm_struct
  * instance.
  */
+#define init_new_context init_new_context
 static inline int
 init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 {
@@ -113,6 +114,7 @@ init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 	return 0;
 }
 
+#define destroy_context destroy_context
 static inline void destroy_context(struct mm_struct *mm)
 {
 	unsigned long flags;
@@ -153,13 +155,13 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 }
 
 /*
- * Called at the time of execve() to get a new ASID
- * Note the subtlety here: get_new_mmu_context() behaves differently here
- * vs. in switch_mm(). Here it always returns a new ASID, because mm has
- * an unallocated "initial" value, while in latter, it moves to a new ASID,
- * only if it was unallocated
+ * activate_mm defaults (in asm-generic) to switch_mm and is called at the
+ * time of execve() to get a new ASID Note the subtlety here:
+ * get_new_mmu_context() behaves differently here vs. in switch_mm(). Here
+ * it always returns a new ASID, because mm has an unallocated "initial"
+ * value, while in latter, it moves to a new ASID, only if it was
+ * unallocated
  */
-#define activate_mm(prev, next)		switch_mm(prev, next, NULL)
 
 /* it seemed that deactivate_mm( ) is a reasonable place to do book-keeping
  * for retiring-mm. However destroy_context( ) still needs to do that because
@@ -168,8 +170,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
  * there is a good chance that task gets sched-out/in, making it's ASID valid
  * again (this teased me for a whole day).
  */
-#define deactivate_mm(tsk, mm)   do { } while (0)
 
-#define enter_lazy_tlb(mm, tsk)
+#include <asm-generic/mmu_context.h>
 
 #endif /* __ASM_ARC_MMU_CONTEXT_H */
-- 
2.23.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
