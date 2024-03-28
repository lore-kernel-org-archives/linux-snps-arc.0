Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C8CCD1280
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 05:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fPJ49qMmiWwAaVi205MJlc4+bZhGogM3girPuUJzAw=; b=4wmQ+A7Qf6fgMg
	jKZeFbKW3wiMen3KDK3R+bKRC7P78rbvtd1227sVEmgi8y3LtP3DFQMDvJHCJl++3hxnNSnNMNUHI
	Sm4MpVD5FayqaIwRYFZFR02+7/Yh9fjr5BSjzFzsVrUmBZ/VrO7/mRipdhDfh4e9PedBvlm71rAO2
	HjG/6zaEwBzfpivimc0qtfgwi8h6w3lbd+2nhT0Nx52vcNI2pS9Lrqi8Y/3AV0PpBtAbXn6K7or+p
	YrqpXSmWFCYV4oB9r8N5tu+Kr4vGi6rWfgpyUsnNj/oiDcFzgD8WyYf62t7omtQs8NhhcS/g5oIkQ
	mYSm8YDOi6ISmytPaK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiUD-0000000CaQF-3ybG;
	Thu, 28 Mar 2024 05:39:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiU4-0000000CaKx-1nO1
	for linux-snps-arc@lists.infradead.org;
	Thu, 28 Mar 2024 05:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 651DE616CE;
	Thu, 28 Mar 2024 05:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB83C433F1;
	Thu, 28 Mar 2024 05:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711604367;
	bh=zF14u9ZN6FPEsFmQUkS2tzuVfrv7E203xtVo9XywqN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DtQ40G4UJfjy9f+NdwreIgdjjpg9ESObFxGohzU/XPu9wcKDbfUUfbUp/fr1SsoAW
	 YlHON/WFyH2ZmX99LI4k5gizNA1hbtNI3435VBeSjcQptREcyacH1RMiYrtBDI2enW
	 8Q6OvI0Xpd6oyOUOz3n3ZuaFJpo2eM4UUBAsWWSUF3wy5anLzHCmvL24n7BK0CarJw
	 g7dyebwap6MxsjcaZ1wH+Ea35rhvTenTPKmm33Fyf9iOtz1Y9t/uILD7OHe45Em04G
	 LxTqmZ5wjQ8QcEgYQB0BN0+44udKOqeHSr8iK7ByTqrsE4PAqpdDeJ4lZl9X8vYq7f
	 NkPnPtKmKAVIA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH 1/2] ARC: Fix -Wmissing-prototypes warnings
Date: Wed, 27 Mar 2024 22:39:18 -0700
Message-Id: <20240328053919.992821-2-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328053919.992821-1-vgupta@kernel.org>
References: <20240328053919.992821-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_223928_591061_16B776D7 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

| ../arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'arc_kprobe_handler' [-Wmissing-prototypes]
|  193 | int __kprobes arc_kprobe_handler(unsigned long addr, struct pt_regs *regs)
|
|../arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'syscall_trace_enter' [-Wmissing-prototypes]
|  342 | asmlinkage int syscall_trace_enter(struct pt_regs *regs)

Link: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240325/testrun/23149630/suite/build/test/gcc-9-defconfig/log
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/ptrace.h | 2 +-
 arch/arc/kernel/kprobes.c     | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
index 00b9318e551e..cf79df0b2570 100644
--- a/arch/arc/include/asm/ptrace.h
+++ b/arch/arc/include/asm/ptrace.h
@@ -169,7 +169,7 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
 	return *(unsigned long *)((unsigned long)regs + offset);
 }
 
-extern int syscall_trace_entry(struct pt_regs *);
+extern int syscall_trace_enter(struct pt_regs *);
 extern void syscall_trace_exit(struct pt_regs *);
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/arc/kernel/kprobes.c b/arch/arc/kernel/kprobes.c
index e71d64119d71..f8e2960832d9 100644
--- a/arch/arc/kernel/kprobes.c
+++ b/arch/arc/kernel/kprobes.c
@@ -190,7 +190,8 @@ static void __kprobes setup_singlestep(struct kprobe *p, struct pt_regs *regs)
 	}
 }
 
-int __kprobes arc_kprobe_handler(unsigned long addr, struct pt_regs *regs)
+static int
+__kprobes arc_kprobe_handler(unsigned long addr, struct pt_regs *regs)
 {
 	struct kprobe *p;
 	struct kprobe_ctlblk *kcb;
@@ -241,8 +242,8 @@ int __kprobes arc_kprobe_handler(unsigned long addr, struct pt_regs *regs)
 	return 0;
 }
 
-static int __kprobes arc_post_kprobe_handler(unsigned long addr,
-					 struct pt_regs *regs)
+static int
+__kprobes arc_post_kprobe_handler(unsigned long addr, struct pt_regs *regs)
 {
 	struct kprobe *cur = kprobe_running();
 	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
