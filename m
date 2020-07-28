Return-Path: <SRS0=gnwN=BH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB88AC433EC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jul 2020 03:34:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 981ED206D4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jul 2020 03:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ccy5Dnur";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOYCqA5k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 981ED206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lJDc7zZlPYuKX2PY3kez63mkGA+eBBw+8UGMbSNyG1w=; b=ccy5DnurmOsdmcntVS/KSGUJn
	8bn7qN4UKOzG2acZZhUtV7DubYa4X80MX+E3ZfdxckP/5mHKQtxP0Py2yWyNV1+NdolmY/5SqUnBC
	ZAloyMLDe2Md9m1rxcgdCmaT1Y5yyXcbxnZnzei9ZBoG94uoi3jUOZCB6r51Ha/VDfAOuqdqKJwD4
	MZdVZkqL99iaNtgwOHvwPaZ5BOza6vEhkmD7mbWutiVrewtGbgpulp9+EynsoZ0URCeEe7boITF1H
	T8J+vDK/O6Kx4nbnZWZYXaNiVdx8n3koEmCGbFp57k4gPPCoYIlw3YWbYQp/bkW82s3+AMFPT+RF3
	nha1ul6Mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0GNx-0003ao-KW; Tue, 28 Jul 2020 03:34:37 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0GNu-0003Z9-F1
 for linux-snps-arc@lists.infradead.org; Tue, 28 Jul 2020 03:34:35 +0000
Received: by mail-pf1-x444.google.com with SMTP id u185so10190082pfu.1
 for <linux-snps-arc@lists.infradead.org>; Mon, 27 Jul 2020 20:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hmVZOCfUq47mihn2FQ6TLRI6bQd0ipE9wiB6y1RWkXs=;
 b=nOYCqA5kKlucmXolFRvkYUAhgIDIrlfwX7JkbLcqxa9mVyIBAgOps2dlFBEaS06Ehm
 Opq1E8SxSa5DZcmM5gdCSJnKF1LAk8Jz3ZLnXxEu9BFgiFvabAxaIyECgBWf2/DQ5JT/
 LpohiYViviwQe/wLTxwbILwXU2Jf9kxSoBSZe2i3OUTu4DF0sNEiVjIfM8BmDPcd/PH3
 kZDZzc5VLqKq5YdTkJHXHJ60hIaPRW3wsbtjKhUIwMRUt4XxctfwIiARiMIHCc/kIlkU
 pkWWfrbTNjTqRIt4FJqv68SUeti0vau36dq4yohE7No18xzIzCLPW1klMqb3fyCHduOA
 kzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hmVZOCfUq47mihn2FQ6TLRI6bQd0ipE9wiB6y1RWkXs=;
 b=q2RO2MWAqu9+5BajdDSt5X7Dk1PiaBqjgigJ1W4DfRhhBYVC54o3/MtjtEkUEs3GRU
 4ArLktmuIdllCB6eq2lT20xD17E7xmfBCyMMFDxOL/o+8jcrngVtwXVN+j9e7gooSbCq
 FfXraACQgHKbHoviyAf5MSRRhlcd8VmWaU//Zy12GqmY5ZCebu58IJ61iWDY6UQPukPz
 /zKJXVTBMKQZ0qkKrw0LUim3ikF67gvggtYqDAYFdgM+K1NrLjAu27fuohxxgulgndSR
 EYOmVqIGri+CB4mMoxUTOO//vqzgB5rdBZGJolIiNwaHC7qAmFjBkjfEJl0wih7bVo9o
 0mtg==
X-Gm-Message-State: AOAM533KPnLlfUakTPHx+AdYiRHEgnbLVL3SkTwQlsnWa2E+JzsMq041
 lfITRdeCP5LtKDrXDo1Fseo=
X-Google-Smtp-Source: ABdhPJxrlYk3wuSoz6yW5gTVzZjaFK+AH99QTvOTfXhxxhM+IRG7XYNJ7uug5lni8egvpEIIbDr08w==
X-Received: by 2002:a65:4bc8:: with SMTP id p8mr16084763pgr.418.1595907270841; 
 Mon, 27 Jul 2020 20:34:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id r4sm998707pji.37.2020.07.27.20.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 20:34:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [PATCH 03/24] arc: use asm-generic/mmu_context.h for no-op
 implementations
Date: Tue, 28 Jul 2020 13:33:44 +1000
Message-Id: <20200728033405.78469-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200728033405.78469-1-npiggin@gmail.com>
References: <20200728033405.78469-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_233434_546252_04C1647A 
X-CRM114-Status: GOOD (  13.84  )
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
 arch/arc/include/asm/mmu_context.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arc/include/asm/mmu_context.h b/arch/arc/include/asm/mmu_context.h
index 3a5e6a5b9ed6..586d31902a99 100644
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
@@ -153,13 +155,12 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 }
 
 /*
- * Called at the time of execve() to get a new ASID
- * Note the subtlety here: get_new_mmu_context() behaves differently here
- * vs. in switch_mm(). Here it always returns a new ASID, because mm has
- * an unallocated "initial" value, while in latter, it moves to a new ASID,
- * only if it was unallocated
+ * activate_mm defaults to switch_mm and is called at the time of execve() to
+ * get a new ASID Note the subtlety here: get_new_mmu_context() behaves
+ * differently here vs. in switch_mm(). Here it always returns a new ASID,
+ * because mm has an unallocated "initial" value, while in latter, it moves to
+ * a new ASID, only if it was unallocated
  */
-#define activate_mm(prev, next)		switch_mm(prev, next, NULL)
 
 /* it seemed that deactivate_mm( ) is a reasonable place to do book-keeping
  * for retiring-mm. However destroy_context( ) still needs to do that because
@@ -168,8 +169,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
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
