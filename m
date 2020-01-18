Return-Path: <SRS0=ZCzF=3H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC652C33CB6
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Jan 2020 01:05:22 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3D224689
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Jan 2020 01:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D9qSkXw5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TnsjZISY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3D224689
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLzj160wq/I52HskYw7tL/jtAz7alGe2E0BSK9BkJtg=; b=D9qSkXw5O9nBZs
	+ytCq/7yIu0i0tyc/9C+k6+ex121ixDjHZT8PvHWC+IthdDgR177dgeVvLzdu0IA6sty9MI782gCb
	ZYZb7/jCeomNf4eVf4QiR2l2NZZo7ba9E5BgFnI2tAu9qEP3vcQKjjd9WHm32U650g2AwVFu/aqKD
	g+BkaEB8UpZ2F5RKnbPfhGJ/sm4F9xPLmlL9PPjtzqEYp7vNkUezPpiLWSYxuYHMjMAbBEIQuPdVY
	GfMlJJjh9K+9TlSW0JZtWJaAJyaw5DYTgnoUzjBfvNrGuIjDoqVvP2TdwtYhMOkwSOvwfYPN5NMR8
	yvi/ys1D1Bjzjr+za/kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iscIg-0001hJ-E7; Sat, 18 Jan 2020 00:49:18 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iscId-0001fb-0C
 for linux-snps-arc@lists.infradead.org; Sat, 18 Jan 2020 00:49:17 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2A5C7C00D3
 for <linux-snps-arc@lists.infradead.org>; Sat, 18 Jan 2020 00:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579308552; bh=g2J7WmEjMDe/Uyk8VWJHnYk1ZBzNPK/ZYQD7ERiBeDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TnsjZISYPF+TJiSnFM4KyE+p4/IkwjqL71uePbj+yKRfUgoZ4BuQ/LEVhQOt4v7r5
 rvMt0xRSqe4HPIVjMFzSRhaf+OvEySL6oDehy0REQ+QAhrr/bY8Q0pTQQGNQYhMOw9
 5doS4q1h5w5sEp+kuOPKjhJPnVd24H8gX5vo7ddnMcQp5Rw5fUybWsHzcL1KZgIaNv
 9wiTCU/IDxjHBuXZQ4NV13H0QaIiiMtZz+7gPooVXtzHBLhVlLAq0MvkE1GEjoJ2vf
 Q7zWx524lokrK7yY3ggBR87CgGPFj+pWTXPUJIt8zr9RxCH9KB04bE3AQZmbwvk70B
 S8GgF1I8FtodA==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.29])
 by mailhost.synopsys.com (Postfix) with ESMTP id CB8F4A0079;
 Sat, 18 Jan 2020 00:49:10 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH 1/2] ARC: fpu: declutter code, move bits out into fpu.h
Date: Fri, 17 Jan 2020 16:49:03 -0800
Message-Id: <20200118004905.30201-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200118004905.30201-1-vgupta@synopsys.com>
References: <20200118004905.30201-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_164915_151925_634743BD 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/include/asm/fpu.h       | 29 +++++++++++++++++++++++++++++
 arch/arc/include/asm/processor.h | 10 +---------
 arch/arc/include/asm/switch_to.h | 17 ++---------------
 arch/arc/kernel/fpu.c            |  2 +-
 4 files changed, 33 insertions(+), 25 deletions(-)
 create mode 100644 arch/arc/include/asm/fpu.h

diff --git a/arch/arc/include/asm/fpu.h b/arch/arc/include/asm/fpu.h
new file mode 100644
index 000000000000..de467423d99b
--- /dev/null
+++ b/arch/arc/include/asm/fpu.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Synopsys, Inc. (www.synopsys.com)
+ *
+ */
+
+#ifndef _ASM_ARC_FPU_H
+#define _ASM_ARC_FPU_H
+
+#ifdef CONFIG_ARC_FPU_SAVE_RESTORE
+
+#include <asm/ptrace.h>
+
+/* These DPFP regs need to be saved/restored across ctx-sw */
+struct arc_fpu {
+	struct {
+		unsigned int l, h;
+	} aux_dpfp[2];
+};
+
+extern void fpu_save_restore(struct task_struct *p, struct task_struct *n);
+
+#else
+
+#define fpu_save_restore(p, n)
+
+#endif	/* CONFIG_ARC_FPU_SAVE_RESTORE */
+
+#endif	/* _ASM_ARC_FPU_H */
diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index 706edeaa5583..ec532d1e0725 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -14,15 +14,7 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/ptrace.h>
-
-#ifdef CONFIG_ARC_FPU_SAVE_RESTORE
-/* These DPFP regs need to be saved/restored across ctx-sw */
-struct arc_fpu {
-	struct {
-		unsigned int l, h;
-	} aux_dpfp[2];
-};
-#endif
+#include <asm/fpu.h>
 
 #ifdef CONFIG_ARC_PLAT_EZNPS
 struct eznps_dp {
diff --git a/arch/arc/include/asm/switch_to.h b/arch/arc/include/asm/switch_to.h
index 77f123385e96..aadf65b2b56c 100644
--- a/arch/arc/include/asm/switch_to.h
+++ b/arch/arc/include/asm/switch_to.h
@@ -9,19 +9,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/sched.h>
-
-#ifdef CONFIG_ARC_FPU_SAVE_RESTORE
-
-extern void fpu_save_restore(struct task_struct *p, struct task_struct *n);
-#define ARC_FPU_PREV(p, n)	fpu_save_restore(p, n)
-#define ARC_FPU_NEXT(t)
-
-#else
-
-#define ARC_FPU_PREV(p, n)
-#define ARC_FPU_NEXT(n)
-
-#endif /* !CONFIG_ARC_FPU_SAVE_RESTORE */
+#include <asm/fpu.h>
 
 #ifdef CONFIG_ARC_PLAT_EZNPS
 extern void dp_save_restore(struct task_struct *p, struct task_struct *n);
@@ -36,9 +24,8 @@ struct task_struct *__switch_to(struct task_struct *p, struct task_struct *n);
 #define switch_to(prev, next, last)	\
 do {					\
 	ARC_EZNPS_DP_PREV(prev, next);	\
-	ARC_FPU_PREV(prev, next);	\
+	fpu_save_restore(prev, next);	\
 	last = __switch_to(prev, next);\
-	ARC_FPU_NEXT(next);		\
 	mb();				\
 } while (0)
 
diff --git a/arch/arc/kernel/fpu.c b/arch/arc/kernel/fpu.c
index 07e22b563fbb..7a3b56ce56bb 100644
--- a/arch/arc/kernel/fpu.c
+++ b/arch/arc/kernel/fpu.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/sched.h>
-#include <asm/switch_to.h>
+#include <asm/fpu.h>
 
 /*
  * To save/restore FPU regs, simplest scheme would use LR/SR insns.
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
