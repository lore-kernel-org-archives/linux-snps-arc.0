Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF22C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 14:16:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6147206CD
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 14:16:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vvCkd41f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4A+W2yS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6147206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/mjNaHX1IuoZPBMkzcwwO5LbKZePx3Tt7l55kk1VH6w=; b=vvCkd41fa2h98RxKmTbNH4sGy
	/lv7UvFkfcwMVtsI0lbH5wErphsG74aNkyKcHahjawmmgKVo6l3WiRIqJPELmDWJfL8pSL2BdIHGj
	eisub2FGuW80FMDPHyPfhDdToPk+fJPJ+3MWobAAp1FuI3+aPelmGiBsXNLLQByZEK/a9q3i3bHWj
	nXCvNDajjmTvsH+wn79pPFrYYjp0acWb9wU2ZrVUNY/Ab06F1RUXRTYgJd4F49Vi4cW6AN5oOZ4Bf
	JNhBQJn8bZcpJwUDc7q1Z3Oz6H49A9mHRk1fsu5/Xj/B+2Hu05JKmHTXcs1/bC1L0ap8Ute+kANyV
	g48F/mS9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD74w-0001xr-04; Tue, 01 Sep 2020 14:16:06 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD74u-0001x4-0i
 for linux-snps-arc@lists.infradead.org; Tue, 01 Sep 2020 14:16:04 +0000
Received: by mail-pf1-x444.google.com with SMTP id k15so849806pfc.12
 for <linux-snps-arc@lists.infradead.org>; Tue, 01 Sep 2020 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhdYKbDeI//C8isyTeQG6V0bhJKWBijBvpr1V+gnGEs=;
 b=T4A+W2yS6M5KQnbIW9fn7O3Z6p924HgMcAZBjnTcSLjeYEM2j7i/Q+gVdvgLlbx/Wr
 4YVEKAwqatc9fn619WYBKrZzsiY/FPP3CKmmOSV6pRdWWoXCJqKVxKsnY1e3ZdiLnhMu
 K2WcQ9fh7POdOAW80IZXpBXTDJlaBHagPqVvbCYzlx+yMxtyzKwvl1fNG5rMazAdAfO5
 orQ6MJDdjLIpPRrMM/mwdJM1HYWX1aB6rVs/OupzKnoQzBYUTb78Lfv4vWvQdSVPg3f0
 jrpCAVBdpVqD+xODHrRTY2EC9Wh1ISt4tbvBbfVfBCy6QRabIU+JXYWatUpMvsW6kJbZ
 Ws7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhdYKbDeI//C8isyTeQG6V0bhJKWBijBvpr1V+gnGEs=;
 b=KdQd+f6y7IIM0JkHxyrzmweCBPnskFSZ0g/yszfb7MIH1i0swCjvsAP0wg5cq8/Vff
 kOOeaFRj/GmJU7N2BNNnzEcDSpKNYqsVrSXK82yfLO9ZgLc96zCrRU7r11y1P2tYqIaD
 Gj1Ut15Nashn9SV4W1tkXGvZQCxn/1FeeUNx94TlXUGDllqckbvmm7F/E0K+gRO2AgsD
 mkXY/TYEsSuzlrFdGyxDxEQlcQgePTy7ZoPm4qVbOO4Y3RJNGC/epbpLojau50+zkvfz
 xQahd4daT+eT9743POXdO+88wdnSKjQpxUeg1nLnM7pT2UozIaGxWDWnVEYAuRhVWeXo
 ODMg==
X-Gm-Message-State: AOAM53171j7rumeFGm6BEE1Ls3/LLeG0/H3irFiuF4iThPTedr3nCEMQ
 ho+9wTIyMpzlivQNYMFKkos=
X-Google-Smtp-Source: ABdhPJyKaGdo4eiu4sBDOVDt2zOUFHP2Y2dgCjCgoPnDlnvF1oh4LLAgz1Slfa92Cw8toERGdtmjmQ==
X-Received: by 2002:a63:4923:: with SMTP id w35mr1641283pga.368.1598969760130; 
 Tue, 01 Sep 2020 07:16:00 -0700 (PDT)
Received: from bobo.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id w9sm2212816pgg.76.2020.09.01.07.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 07:15:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [PATCH v3 03/23] arc: use asm-generic/mmu_context.h for no-op
 implementations
Date: Wed,  2 Sep 2020 00:15:19 +1000
Message-Id: <20200901141539.1757549-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200901141539.1757549-1-npiggin@gmail.com>
References: <20200901141539.1757549-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_101604_077101_68D3DD3A 
X-CRM114-Status: GOOD (  13.53  )
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

Please ack or nack if you object to this being mered via
Arnd's tree.

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
