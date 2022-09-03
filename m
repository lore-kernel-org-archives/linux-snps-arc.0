Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44780ECAAD4
	for <linux-snps-arc@archiver.kernel.org>; Sat,  3 Sep 2022 16:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjQwhUPjtC9glFFXSuv/PXu/x2zZ3PX0xk6By0v1IqM=; b=kZt2SMYaT8+FgV
	Rg6qHy4wCr0KPWLitF5EMlx9ePMGuaIsq3AXa+JTb/j46UkjAKlNLcaOnMVmbnY8ZNbumNz9s3pOG
	BdQcM4qjr6qmociLOOGcYrnWKeeD8Lvf8moHUVngtJguVcNaP03uxHHSm/emiZEn4QFcc8hxzUJUz
	h/vI/8ucmT7HxDXWmVvdkpl76KM0joHalnRxKvaso7qoRGj/FNEv/vkPac7tK5yIQzDjhrQIyHL9Q
	qdADCy4x96imKcFSWj+Zjt0X634Xu6d+GNk1TP9G8pnJGQ8UBvtEkLCYn3IAagPhn2cDu1l4Dzcg3
	tL+PF9mypQdtmXAWhYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVwc-00DY4J-Dt; Sat, 03 Sep 2022 16:24:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVwC-00DXUh-Fz; Sat, 03 Sep 2022 16:24:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 48754B80113;
	Sat,  3 Sep 2022 16:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F72C433B5;
	Sat,  3 Sep 2022 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662222240;
	bh=cGpgA7bsAcBu9cM5k7EvryK/rECLcgu+ArqhQVWAdzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WNT4uPAZzNgEikgI4Tv1F4v0oQtzH4tIjUhl/cJA/YVa6QRSRGDxTafbzszqINzUO
	 tqsJihurGXByqEToL7OKYmvozHPC85pvH3OQ1ING+FLiyj8b29mWczHjOq3aok7IkK
	 DnRiBGkzL1WjZ89jCx75dHqWGZatw84FR+Lh/kUIHPU58dRmpHYk0TJz5CIC3Mk5sD
	 WY2rx5GYBukKbAeCm3PA2k+xx+p2jUXmRBBV/ilo2d0myUtNurY7VwSvd8kYBq1QVD
	 bx9p/H6H1CFsRm+JgTcXArsNNteVqQKa5G28zWPlO5IMZLUskgFw+9hPGGv3Ar+mnv
	 Jfp80Mx78OLKw==
From: guoren@kernel.org
To: oleg@redhat.com,
	vgupta@kernel.org,
	linux@armlinux.org.uk,
	monstr@monstr.eu,
	dinguyen@kernel.org,
	palmer@dabbelt.com,
	davem@davemloft.net,
	arnd@arndb.de,
	shorne@gmail.com,
	guoren@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	sparclinux@vger.kernel.org,
	openrisc@lists.librecores.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 3/3] arch: ptrace: Cleanup ptrace_disable
Date: Sat,  3 Sep 2022 12:23:27 -0400
Message-Id: <20220903162328.1952477-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220903162328.1952477-1-guoren@kernel.org>
References: <20220903162328.1952477-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_092404_855681_F5CC4348 
X-CRM114-Status: GOOD (  14.81  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add a weak empty function in common and remove architectures' duplicated
ones.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/arc/kernel/ptrace.c        |  4 ----
 arch/arm/kernel/ptrace.c        |  8 --------
 arch/microblaze/kernel/ptrace.c |  5 -----
 arch/nios2/kernel/ptrace.c      |  5 -----
 arch/riscv/kernel/ptrace.c      |  4 ----
 arch/sparc/kernel/ptrace_32.c   | 10 ----------
 arch/sparc/kernel/ptrace_64.c   | 10 ----------
 kernel/ptrace.c                 |  8 ++++++++
 8 files changed, 8 insertions(+), 46 deletions(-)

diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index da7542cea0d8..c227e145fede 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -317,10 +317,6 @@ const struct user_regset_view *task_user_regset_view(struct task_struct *task)
 	return &user_arc_view;
 }
 
-void ptrace_disable(struct task_struct *child)
-{
-}
-
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index bfe88c6e60d5..b85f5bdc56ef 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -186,14 +186,6 @@ put_user_reg(struct task_struct *task, int offset, long data)
 	return ret;
 }
 
-/*
- * Called by kernel/ptrace.c when detaching..
- */
-void ptrace_disable(struct task_struct *child)
-{
-	/* Nothing to do. */
-}
-
 /*
  * Handle hitting a breakpoint.
  */
diff --git a/arch/microblaze/kernel/ptrace.c b/arch/microblaze/kernel/ptrace.c
index 5234d0c1dcaa..72e3eece72aa 100644
--- a/arch/microblaze/kernel/ptrace.c
+++ b/arch/microblaze/kernel/ptrace.c
@@ -162,8 +162,3 @@ asmlinkage void do_syscall_trace_leave(struct pt_regs *regs)
 	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
 		ptrace_report_syscall_exit(regs, step);
 }
-
-void ptrace_disable(struct task_struct *child)
-{
-	/* nothing to do */
-}
diff --git a/arch/nios2/kernel/ptrace.c b/arch/nios2/kernel/ptrace.c
index cd62f310778b..de5f4199c45f 100644
--- a/arch/nios2/kernel/ptrace.c
+++ b/arch/nios2/kernel/ptrace.c
@@ -117,11 +117,6 @@ const struct user_regset_view *task_user_regset_view(struct task_struct *task)
 	return &nios2_user_view;
 }
 
-void ptrace_disable(struct task_struct *child)
-{
-
-}
-
 long arch_ptrace(struct task_struct *child, long request, unsigned long addr,
 		 unsigned long data)
 {
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 44f4b1ca315d..19e4d8057e24 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -210,10 +210,6 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
 		return 0;
 }
 
-void ptrace_disable(struct task_struct *child)
-{
-}
-
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
diff --git a/arch/sparc/kernel/ptrace_32.c b/arch/sparc/kernel/ptrace_32.c
index e7db48acb838..f6df84e12739 100644
--- a/arch/sparc/kernel/ptrace_32.c
+++ b/arch/sparc/kernel/ptrace_32.c
@@ -29,16 +29,6 @@
 
 /* #define ALLOW_INIT_TRACING */
 
-/*
- * Called by kernel/ptrace.c when detaching..
- *
- * Make sure single step bits etc are not set.
- */
-void ptrace_disable(struct task_struct *child)
-{
-	/* nothing to do */
-}
-
 enum sparc_regset {
 	REGSET_GENERAL,
 	REGSET_FP,
diff --git a/arch/sparc/kernel/ptrace_64.c b/arch/sparc/kernel/ptrace_64.c
index 86a7eb5c27ba..b20a16ebe533 100644
--- a/arch/sparc/kernel/ptrace_64.c
+++ b/arch/sparc/kernel/ptrace_64.c
@@ -83,16 +83,6 @@ static const struct pt_regs_offset regoffset_table[] = {
 	REG_OFFSET_END,
 };
 
-/*
- * Called by kernel/ptrace.c when detaching..
- *
- * Make sure single step bits etc are not set.
- */
-void ptrace_disable(struct task_struct *child)
-{
-	/* nothing to do */
-}
-
 /* To get the necessary page struct, access_process_vm() first calls
  * get_user_pages().  This has done a flush_dcache_page() on the
  * accessed page.  Then our caller (copy_{to,from}_user_page()) did
diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index 1893d909e45c..77299bb65d97 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -579,6 +579,14 @@ static bool __ptrace_detach(struct task_struct *tracer, struct task_struct *p)
 	return dead;
 }
 
+__weak void ptrace_disable(struct task_struct *child)
+{
+	/*
+	 * Nothing to do.., some architectures would replace it with
+	 * their own function.
+	 */
+}
+
 static int ptrace_detach(struct task_struct *child, unsigned int data)
 {
 	if (!valid_signal(data))
-- 
2.36.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
